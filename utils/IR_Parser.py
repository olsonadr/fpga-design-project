'''
Filename: IR_parser.py
Author: Michael Hathaway
Description: Script to parse IR .csv file to get clock transitions
'''
import sys

def parseIR(filename, outputFile):
	VIL = 0.97
	VIH = 4.96

	with open(filename, 'r') as f:
		#skip first 13 lines to get to the actual data
		for i in range(14):
			next(f)

		contents = f.read()
		contents = contents[:-1].split('\n') #split the rest of the file contents into a list of lines

		#create output file
		output = open(f'{outputFile}.txt', 'w')
		output.write('force IR 1 0, ')

		#get first time in CSV file to correct to 0
		startTime = float(contents[0].split(',')[0])

		logic = 1
		for line in contents:
			line = line.split(',')

			try:
				if logic is 1 and float(line[1]) <= VIL:
					value = str((float(line[0]) - startTime)) #*1000000.0
					dataString = '0 ' + value + ', '
					output.write(dataString)
					logic = 0
				elif logic is 0 and float(line[1]) >= VIH:
					value = str((float(line[0]) - startTime)) #*1000000.0
					dataString = '1 ' + value + ', '
					output.write(dataString)
					logic = 1
			except ValueError:
				continue




if __name__ =='__main__':
	file = f'ir_data/{sys.argv[1]}.csv'
	parseIR(file, sys.argv[1])
