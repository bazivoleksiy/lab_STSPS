complete <- function(directory, id = 1:332)
{
  dataframe = NULL  ## ������������ ����� �����, �� �� ������ �������� �� ���� �������
  setwd(file.path(getwd(), directory)) ## ������������ ��������
  for (i in id) ## �������� ����� ����� ��������, ������� � �������� id
  {        
    if (i <10)
    {
      data <- read.csv(paste("0","0", as.character(i), ".csv", sep=""), ## ���� 'id' = 7, �� �� �������� 007.csv
                       header = T, 
                       na.strings=c("NA","NaN", " "))
    }
    else if (i>=10 & i<100)
    { 
      data <- read.csv(paste("0", as.character(i), ".csv", sep=""),
                       header = T, 
                       na.strings=c("NA","NaN", " "))
    }
    else
    {
      data <- read.csv(paste(as.character(i), ".csv", sep=""),
                       header = T,
                       na.strings=c("NA","NaN", " "))
    }
    data = na.omit(data) ## ������������ ��� ������� "NA" � ��� ������������ ������������ (�, �� ����� ���������� ���� "NA" � �����)
    data = as.matrix(data) ## ������ ��������, ��� ����� ��������� ����� ���������� ��� ������ ����� �����
    dataframe = rbind(dataframe, c(i,nrow(data))) ## ���������� ����� ���������� ��� ������ ����� �����. ����� ����� ������ ������������� ��������, � ���� �������� ����� ������� ������������� (��� �����, �� ������� �� "NA")
  }
  setwd("..") ## �������� ����� �� ��������
  dataframe = data.frame(dataframe) ## �� ������� �� ����� �����
  names(dataframe) = c('id', 'nobs') ## ������������ ����� ��������� ����� �����
  return (dataframe) 
}