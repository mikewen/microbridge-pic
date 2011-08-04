/*
  Tiny sprintf module
   for Embedded microcontrollers
   File Version : 1.1
   Yasuhiro ISHII 2005-2008

   �y�o�[�W�����A�b�v�����z
   0.1 : �Ƃ肠�����Ȃ񂩓�������
   0.2 : decimal��0�\���Ή�   20050313
   0.3 : hexa decimal��0�\���Ή� 20050313
   0.4 : �\�[�X���̕ςȃR�[�h(^M)���폜���� 20050503
   0.5 : tsprintf�֐��̕ϐ� size������������悤�ɂ��� 20050503
   0.6 : %d�̕����Ή�,%x��unsigned������ 20050522
   0.7 : %d,%x�̌����w��(%[n]d)/0�⊮�w��(%0[n]d)�Ή� 20050522
   0.8 : va_list�œn��vtsprintf���쐬���Avsprintf��vtsprintf�̐e�֐��ɂ��� 20050522
   0.9 : hex�ŁA�l��0�̎��Ɍ���1�ɂȂ��Ă��܂��o�O�C�� 20050526
   1.0 : dec�ŁA�l��0�̎��Ɍ���1�ɂȂ��Ă��܂��o�O�C�� 20050629
   <������PSoC�p�Ƀu�����`>
   1.1 : PSoC��1.2�̑Ή����e�𔽉f(�m�ۂ��Ă��Ȃ�RAM���󂷃o�O���C��(10�i�A16�i�\������)) 20080427
         �֐��w�b�_(�R�����g)��PSoC�̐������ꂽ���̂ɂ���
		 �֐����ύX vtsprintf��tvsprintf
   1.2 : %ld���^�C������ꂽ
   
   printf�̏����ݒ���ȈՓI�Ȃ��̂ɂ��Ď������Ă���̂Ŏg�p���ɂ�
   ���������m�F���ĉ������B

*/


#include <stdarg.h>

int tsprintf(char* ,char* , ...);
int tvsprintf(char* buff,char* fmt,va_list arg);

static int tsprintf_string(char* ,char* );
static int tsprintf_char(int ,char* );
static int tsprintf_decimal(signed long,char* ,int ,int );
static int tsprintf_hexadecimal(unsigned long ,char* ,int ,int ,int );

/** Tiny sprintf�֐�
 * @param buff ����������������i�[����ׂ̃o�b�t�@�ւ̃|�C���^
 * @param fmt �����w�蕶����
 * @param [argument]... �ȗ��\�Ȉ���
 * @return ���������̕�����
 */
int tsprintf(char* buff,char* fmt, ...){
	va_list arg;
	int len;

	va_start(arg, fmt);
	len = tvsprintf(buff,fmt,arg);
	va_end(arg);

	return(len);
}

/** Tiny vsprintf�֐�
 * @param buff ����������������i�[����ׂ̃o�b�t�@�ւ̃|�C���^
 * @param fmt �����w�蕶����
 * @param arg ����
 * @return ���������̕�����
 */
int tvsprintf(char* buff,char* fmt,va_list arg){
	int len;
	int size;
	int zeroflag,width;
	typedef enum{
		PREFIX_NONE = 0,
		PREFIX_LONG,
	} PrefixType;
	PrefixType prefixType;

	return 0;

	size = 0;
	len = 0;
	prefixType = PREFIX_NONE;

	while(*fmt){
		if((*fmt=='%') || (prefixType != PREFIX_NONE)){		/* % �Ɋւ��鏈�� */
			zeroflag = width = 0;
			fmt++;

			if (*fmt == '0'){
				fmt++;
				zeroflag = 1;
			}
			if ((*fmt >= '0') && (*fmt <= '9')){
				width = *(fmt++) - '0';
			}

			/* printf ("zerof = %d,width = %d\n",zeroflag,width); */

			switch(*fmt){
			case 'd':		/* 10�i�� */
				if(prefixType == PREFIX_NONE){
					size = tsprintf_decimal(va_arg(arg,int),buff,zeroflag,width);
				} else if (prefixType == PREFIX_LONG){
					size = tsprintf_decimal(va_arg(arg,long),buff,zeroflag,width);
					prefixType = PREFIX_NONE;
				}
				break;
			case 'x':		/* 16�i�� 0-f */
				if(prefixType == PREFIX_NONE){
					size = tsprintf_hexadecimal(va_arg(arg,int),buff,0,zeroflag,width);
				} else if (prefixType == PREFIX_LONG){
					size = tsprintf_hexadecimal(va_arg(arg,long),buff,0,zeroflag,width);
					prefixType = PREFIX_NONE;
				}

				break;
			case 'X':		/* 16�i�� 0-F */
				size = tsprintf_hexadecimal(va_arg(arg,int),buff,1,zeroflag,width);
				prefixType = PREFIX_NONE;
				break;
			case 'c':		/* �L�����N�^�[ */
				size = tsprintf_char(va_arg(arg,int),buff);
				prefixType = PREFIX_NONE;
				break;
			case 's':		/* ASCIIZ������ */
				size = tsprintf_string(va_arg(arg,char*),buff);
				prefixType = PREFIX_NONE;
				break;
			case 'l':
				prefixType = PREFIX_LONG;
				size = 0;
				break;
			default:		/* �R���g���[���R�[�h�ȊO�̕��� */
				/* %%(%�ɑΉ�)�͂����őΉ������ */
				len++;
				*(buff++) = *fmt;
				prefixType = PREFIX_NONE;
				break;
			}
			len += size;
			buff += size;
			fmt++;
		} else {
			*(buff++) = *(fmt++);
			len++;
		}
	}

	*buff = '\0';		/* �I�[������ */

	va_end(arg);
	return (len);
}

/** ���l => 10�i������ϊ�
 * @param val �ϊ�������������f�[�^
 * @param buff �ϊ�����������f�[�^���i�[����o�b�t�@�ւ̃|�C���^
 * @param zf 1:������f�[�^�擪������0�𖄂ߍ���
 * @param wd �����񂷂�ꍇ�̌����w��(0�`9)
 * @return ���������̕�����
 */
static int tsprintf_decimal(signed long val,char* buff,int zf,int wd){
	int i;
	char tmp[10];
	char* ptmp = tmp + 9;
	int len = 0;
	int minus = 0;

	if (!val){		/* �w��l��0�̏ꍇ */
		*(ptmp--) = '0';
		len++;
	} else {
		/* �}�C�i�X�̒l�̏ꍇ�ɂ�2�̕␔����� */
		if (val < 0){
			val = ~val;
			val++;
			minus = 1;
		}
		while (val){
			/* �o�b�t�@�A���_�[�t���[�΍� */
			if (len >= 8){
				break;
			}
	
			*ptmp = (val % 10) + '0';
			val /= 10;
			ptmp--;
			len++;
		}

	}

	/* �����A�����킹�Ɋւ��鏈�� */
	if (zf){
		if (minus){
			wd--;
		}
		while (len < wd){
			*(ptmp--) =  '0';
			len++;
		}
		if (minus){
			*(ptmp--) = '-';
			len++;
		}
	} else {
		if (minus){
			*(ptmp--) = '-';
			len++;
		}
		while (len < wd){
			*(ptmp--) =  ' ';
			len++;
		}
	}

	/* ����������̃o�b�t�@�R�s�[ */
	for (i=0;i<len;i++){
		*(buff++) = *(++ptmp);
	}

	return (len);
}

/** ���l => 16�i������ϊ�
 * @param val �ϊ�������������f�[�^
 * @param buff �ϊ�����������f�[�^���i�[����o�b�t�@�ւ̃|�C���^
 * @param capital 1 : 16�i��a�`f��'A'�`'F'�ɂ���
 * @param zf 1:������f�[�^�擪������0�𖄂ߍ���
 * @param wd �����񂷂�ꍇ�̌����w��(0�`9)
 * @return ���������̕�����
 */
static int tsprintf_hexadecimal(unsigned long val,char* buff,
								int capital,int zf,int wd){
	int i;
	char tmp[10];
	char* ptmp = tmp + 9;
	int len = 0;
	char str_a;

	/* A�`F��啶���ɂ��邩�������ɂ��邩�؂�ւ��� */
	if (capital){
		str_a = 'A';
	} else {
		str_a = 'a';
	}
	
	if (!val){		/* �w��l��0�̏ꍇ */
		*(ptmp--) = '0';
		len++;
	} else {
		while (val){
			/* �o�b�t�@�A���_�[�t���[�΍� */
			if (len >= 8){
				break;
			}

			*ptmp = (val % 16);
			if (*ptmp > 9){
				*ptmp += str_a - 10;
			} else {
				*ptmp += '0';
			}
		
			val >>= 4;		/* 16�Ŋ��� */
			ptmp--;
			len++;
		}
	}
	while (len < wd){
		*(ptmp--) =  zf ? '0' : ' ';
		len++;
	}
		
	for (i=0;i<len;i++){
		*(buff++) = *(++ptmp);
	}

	return(len);
}

/** 1�L�����N�^�\��
 * @param ch �����f�[�^�̃R�[�h�l
 * @param buff �ϊ�����������f�[�^���i�[����o�b�t�@�ւ̃|�C���^
 * @return ���������̕�����
 */
static int tsprintf_char(int ch,char* buff){
	*buff = (char)ch;
	return(1);
}

/** ASCIIZ������\��
 * @param str ASCIIZ������f�[�^�ւ̃|�C���^
 * @param buff �ϊ�����������f�[�^���i�[����o�b�t�@�ւ̃|�C���^
 * @return ���������̕�����
 */
static int tsprintf_string(char* str,char* buff){
	int count = 0;
	while(*str){
		*(buff++) = *str;
		str++;
		count++;
	}
	return(count);
}

