/*
 ============================================================================
 Name        : convert_logfile.c
 Author      : Quoc
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
int my_strcmp(char s1[], char s2[])
{
    int i = 0;
    while ( s1[i] != '\0' )
    {
        if( s2[i] == '\0' ) { return 1; }
        else if( s1[i] < s2[i] ) { return -1; }
        else if( s1[i] > s2[i] ) { return 1; }
        i++;
    }
    return 0;
}

void Processing_input(){
	 // read from below file
		   FILE * fp;

		   // Write from below file
	       FILE *f = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example/log_result.txt", "w+");
	       if (f == NULL)
	       {
	           printf("Error opening file!\n");
	           exit(1);
	       }

	       // initial


		       fp = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example/log_delay_100ms.txt", "r");
		       if (fp == NULL)
		           exit(EXIT_FAILURE);

		       char buff[255];


		       char check_code[5] = "2017/";

		          //fscanf(fp, "%s", buff);
		          //printf("1 : %s\n", buff );

		       while(1)
		          {
		    	   	  if(fgets(buff, 255, fp) ==NULL)
		                  break;
		              else{

				          char tmp[6];
				          strncpy(tmp, buff,5);
				          tmp[6] = '\0';

				          //printf("%d\n", my_strcmp(tmp,check_code) );
				          //printf("debug code 1 \n");
				          if (buff[2] == ':' && buff[5] == ':' )
				          {
				        	  //printf("debug code 2 \n");
				        	  int i, j;
				        	  for(j = 0; j< 9; j++)
				        	  {
				        	  for(i = 0; (buff[i] != '\0' || i < 15); ++i)
				        	      {
				        		  	  buff[i] = buff[i+1];
				        	      }
				        	  }
			        		  fprintf(f,buff);
				          }

				          /* write buff_reg to file
			        	  if (buff_next[27] =='+'){
		            	      /// Get the numbers
		            	      int stream_num;
		            	      char s[20],s1[20],s2[20];
		            	      sscanf(buff_next, "%s %s %s %d", s, s1, s2, &stream_num);
		            	      buff_reg[strlen(buff_reg) - 1] = ' ';
			        		  fprintf(f,"%s%d \n",buff,stream_num);
			        	  }
			        	  else{
			        		  if ((buff_reg[0] != '*') && buff[27] !='+'){
			        		  strcpy(buff_reg,buff);
			        		  fprintf(f,buff_reg);
			        		  //buff_reg[0] = '*';
			        		  }
			        		  else{
			        		  strcpy(buff_reg,buff);
			        		  }}
				          */

		              }

		          }

		          fclose(f);
		          fclose(fp);
}
/*void Convert(){
	// read from below file
			   FILE * fp;

			   // Write from below file
		       FILE *f = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example/result.txt", "w+");
		       if (f == NULL)
		       {
		           printf("Error opening file!\n");
		           exit(1);
		       }

		       // initial
			       char line[4];
				   char str1[20], str2[20], str3[20], str4[20], str5[20], str6[20];
			       size_t len = 0;
			       ssize_t read;

			       fp = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example/log_result.txt", "r");
			       if (fp == NULL)
			           exit(EXIT_FAILURE);

			       char buff[255];
			       char check_code[5] = "2017/";
			       char checkdebug_code[6] = "DEBUG.";
			          //fscanf(fp, "%s", buff);
			          //printf("1 : %s\n", buff );
			       int count = 0;
			       int n = 0;
			       int index[1000];
			       int value[1000];

			       while(1)
			          {
			    	   	  if(fgets(buff, 255, fp) ==NULL)
			                  break;
			              else{
			            	      /// Get the numbers
			            	      int timestamp, pktnum;
			            	      char tmp[16];
			            	      sscanf(buff, "%d %s %x", &timestamp, &tmp, &pktnum);

			            	      // Where do the numbers end...
			            	      //size_t numbers_end = strspn(line, "1234567890. \t");

			            	      // And get the name
			            	      //char *name = line + numbers_end;

			            	      // Do something with the numbers and the name
			            	      printf("packet number >>>> : %d\n", pktnum );
			            	      printf("timestamp @@@ : %d\n", timestamp );

			              }

			          }

			          fclose(f);
			          fclose(fp);

}*/
void Convert_tmp(){
	// read from below file
			   FILE * fp;

			   // Write from below file
		       FILE *f = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example/result_tmp.txt", "w+");
		       if (f == NULL)
		       {
		           printf("Error opening file!\n");
		           exit(1);
		       }

		       // initial
			       fp = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example/log_result.txt", "r");
			       if (fp == NULL)
			           exit(EXIT_FAILURE);

			       char buff[255];
			       int n = 0;
			       int index[1000];
			       int value[1000];

	       		   fprintf(f, "%s\n","pkt_num   RTT");
			       while(1)
			          {
			    	   	  if(fgets(buff, 255, fp) ==NULL)
			                  break;
			              else{
			            	  int i = 0;

					          if (buff[16] == '<' && buff[17] == '-')
					          {
			            	      /// Get the numbers
					        	  char timestamp[16];
			            	      int  pktnum;
			            	      char tmp[16];
			            	      sscanf(buff, "%s %s %x", &timestamp, tmp, &pktnum);

			            	      int flag = 1;

					        	  while (i < n ){
					        		  if (index[i] != pktnum)
					        			  i++;
					        		  else{
							        	  //printf("debug code @@@@ %d\n",pktnum);
								          //fprintf(f,value_str);
							        	  //fprintf(f,str);
							        	  //strcat(value_str," hhh");
							        	  if (timestamp - value[i] < 0)
							        		  fprintf(f, "%d%s%d\n",pktnum ,"  ",timestamp - value[i] + 1000000);
							        	  else
							        		  fprintf(f, "%d%s%d\n",pktnum,"  ",timestamp - value[i]);
							        	  //write(f, (" %s \n", value_str));

					        			  int j;
							        	  for(j = i;j < n; ++j)
							        	      {
							        		  	  index[j] = index[j+1];
							        		  	  value[j] = value[j+1];
							        	      }
					        		  	  n--;
					        		  	  flag = 0;

								          break;
					        		  }
					        	  }
					        	  if (i == n && flag == 1){
					        		  index[n] = pktnum;
					        		  value[n] = timestamp;
					        		  n++;
							          //printf("debug code >>>> %d\n",pktnum);
					        	  }
					          }

					          if (buff[16] == '-' && buff[17] == '>')
					          {
			            	      /// Get the numbers
			            	      int timestamp, pktnum;
			            	      char tmp[16];
			            	      sscanf(buff, "%d %s %x", &timestamp, tmp, &pktnum);

			            	      int flag = 1;

					        	  while (i < n ){
					        		  if (index[i] != pktnum)
					        			  i++;
					        		  else{
							        	  //printf("debug code ++++ %d\n",pktnum);

							        	  if (timestamp - value[i] < 0)
							        		  fprintf(f, "%d%s%d\n",pktnum ,"  ",timestamp - value[i] + 1000000);
							        	  else
							        		  fprintf(f, "%d%s%d\n",pktnum ,"  ",timestamp - value[i]);
							        	  //write(f, (" %s \n", value_str));
					        			  int j;
							        	  for(j = i;j < n; ++j)
							        	      {
							        		  	  index[j] = index[j+1];
							        		  	  value[j] = value[j+1];
							        	      }
					        		  	  n--;
					        		  	  flag = 0;
					        		  }
					        	  }
					        	  if (i == n && flag == 1){
					        		  index[n] = pktnum;
					        		  value[n] = timestamp;
					        		  n++;
							          //printf("debug code >>>> %d\n",pktnum);
					        	  }


					          }



			              }

			          }

			          fclose(f);
			          fclose(fp);

}

void Convert(){
	// read from below file
			   FILE * fp;

			   // Write from below file
		       FILE *f = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example/result.txt", "w+");
		       if (f == NULL)
		       {
		           printf("Error opening file!\n");
		           exit(1);
		       }

		       // initial
			       fp = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example//result_tmp.txt", "r");
			       if (fp == NULL)
			           exit(EXIT_FAILURE);

			       char buff[255];
			       int n = 0;
			       int index[1000];
			       int value[1000];

	       		   fprintf(f, "%s\n","pkt_num   RTT");
			       while(1)
			          {
			    	   	  if(fgets(buff, 255, fp) ==NULL)
			                  break;
			              else{
			            	  int i = 0;

					          if (buff[7] == '<' && buff[8] == '-')
					          {
			            	      /// Get the numbers
			            	      int timestamp, pktnum;
			            	      char tmp[16];
			            	      sscanf(buff, "%d %s %x", &timestamp, tmp, &pktnum);

			            	      int flag = 1;

					        	  while (i < n ){
					        		  if (index[i] != pktnum)
					        			  i++;
					        		  else{
							        	  //printf("debug code @@@@ %d\n",pktnum);
								          //fprintf(f,value_str);
							        	  //fprintf(f,str);
							        	  //strcat(value_str," hhh");
							        	  if (timestamp - value[i] < 0)
							        		  fprintf(f, "%d%s%d\n",pktnum ,"  ",timestamp - value[i] + 1000000);
							        	  else
							        		  fprintf(f, "%d%s%d\n",pktnum,"  ",timestamp - value[i]);
							        	  //write(f, (" %s \n", value_str));

					        			  int j;
							        	  for(j = i;j < n; ++j)
							        	      {
							        		  	  index[j] = index[j+1];
							        		  	  value[j] = value[j+1];
							        	      }
					        		  	  n--;
					        		  	  flag = 0;

								          break;
					        		  }
					        	  }
					        	  if (i == n && flag == 1){
					        		  index[n] = pktnum;
					        		  value[n] = timestamp;
					        		  n++;
							          //printf("debug code >>>> %d\n",pktnum);
					        	  }
					          }

					          if (buff[7] == '-' && buff[8] == '>')
					          {
			            	      /// Get the numbers
			            	      int timestamp, pktnum;
			            	      char tmp[16];
			            	      sscanf(buff, "%d %s %x", &timestamp, tmp, &pktnum);

			            	      int flag = 1;

					        	  while (i < n ){
					        		  if (index[i] != pktnum)
					        			  i++;
					        		  else{
							        	  //printf("debug code ++++ %d\n",pktnum);

							        	  if (timestamp - value[i] < 0)
							        		  fprintf(f, "%d%s%d\n",pktnum ,"  ",timestamp - value[i] + 1000000);
							        	  else
							        		  fprintf(f, "%d%s%d\n",pktnum ,"  ",timestamp - value[i]);
							        	  //write(f, (" %s \n", value_str));
					        			  int j;
							        	  for(j = i;j < n; ++j)
							        	      {
							        		  	  index[j] = index[j+1];
							        		  	  value[j] = value[j+1];
							        	      }
					        		  	  n--;
					        		  	  flag = 0;
					        		  }
					        	  }
					        	  if (i == n && flag == 1){
					        		  index[n] = pktnum;
					        		  value[n] = timestamp;
					        		  n++;
							          //printf("debug code >>>> %d\n",pktnum);
					        	  }


					          }



			              }

			          }

			          fclose(f);
			          fclose(fp);

}
//log_delay_100ms.txt
void convert_delay(){
	// read from below file
				   FILE * fp;

				   // Write from below file
			       FILE *f = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example/result.txt", "w+");
			       if (f == NULL)
			       {
			           printf("Error opening file!\n");
			           exit(1);
			       }

			       // initial
				       fp = fopen("/home/quoc/work/src/github.com/lucas-clemente/quic-go/example/log_result.txt", "r");
				       if (fp == NULL)
				           exit(EXIT_FAILURE);

				       char buff[255];
				       int n = 0;
				       int index[1000];
				       int value[1000];

		       		   fprintf(f, "%s\n","pkt_num   RTT");
				       while(1)
				          {
				    	   	  if(fgets(buff, 255, fp) ==NULL)
				                  break;
				              else{

						          if (buff[7] == '-' && buff[8] == '>' && buff[10] == 'S' )
						          {
				            	      /// Get the numbers
				            	      int timestamp, pktnum;
				            	      char tmp[16],tmp1[16],tmp2[16];
				            	      sscanf(buff, "%d %s %s %s %x", &timestamp, tmp, tmp1, tmp2, &pktnum);

				            	      n++;

				            	      index[n] = pktnum;
				            	      value[n] = timestamp;

								          //printf("debug code >>>> %d\n",pktnum);
						          }

						          if (buff[8] == '<' && buff[9] == '-' && buff[28] == 'L' && buff[29] == 'a')
						          {
				            	      /// Get the numbers
				            	      int timestamp, pktnum;
				            	      char tmp[16],tmp1[30];
				            	      sscanf(buff, "%d %s %s %x", &timestamp, tmp,tmp1, &pktnum);

				            	      int i = 1;

						        	  while (i <=n ){
						        		  if (index[i] != pktnum)
						        			  i++;
						        		  else{
								        	  //printf("debug code ++++ %d\n",pktnum);

								        	  if (timestamp - value[i] < 0)
								        		  fprintf(f, "%d%s%d\n",pktnum ,"  ",timestamp - value[i] + 1000000);
								        	  else
								        		  fprintf(f, "%d%s%d\n",pktnum ,"  ",timestamp - value[i]);
								        	  //write(f, (" %s \n", value_str));
						        			  int j;
								        	  for(j = i;j <= n; ++j)
								        	      {
								        		  	  index[j] = index[j+1];
								        		  	  value[j] = value[j+1];
								        	      }
						        		  	  n--;
						        		  }
						        	  }


						          }



				              }

				          }

				          fclose(f);
				          fclose(fp);
}
int main(void) {
	Processing_input();
	convert_delay();
	//Processing_input();
	//Convert_tmp();
	//Convert();
	return 0;
}


