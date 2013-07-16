/*
-----------------------------------------------------------------------------
CERBER Game Engine (https://github.com/katoun/CERBER_Engine) is made available under the MIT License.

Copyright (c) 2013 Catalin Alexandru Nastase

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-----------------------------------------------------------------------------
*/

#include <core/Utils.h>

#include <algorithm>
#include <string>
#include <sstream>

namespace core
{

void stringTrim(std::string& str, const std::string& whitespace, bool left, bool right)
{
	if (right)
		str.erase(str.find_last_not_of(whitespace)+1); // trim right
	if (left)
		str.erase(0, str.find_first_not_of(whitespace)); // trim left
}

void stringToLower(std::string& str)
{
	std::transform(str.begin(), str.end(), str.begin(),	tolower);
}

void stringToUpper(std::string& str)
{
	std::transform(str.begin(),	str.end(), str.begin(),	toupper);
}

int stringToInt(std::string& str)
{
	int ret;

	std::stringstream ss(str);
	ss >> ret;

	return ret;
}

float stringToFloat(std::string& str)
{
	float ret;

	std::stringstream ss(str);
	ss >> ret;

	return ret;
}

std::string intToString(unsigned int i)
{
	std::stringstream ss;
	ss << i;

	std::string ret = ss.str();

	return ret;
}

std::string intToString(int i)
{
	std::stringstream ss;
	ss << i;

	std::string ret = ss.str();

	return ret;
}

std::string floatToString(float f)
{
	std::stringstream ss;
	ss << f;

	std::string ret = ss.str();

	return ret;
}

void stringReplaceChar(std::string& str, const char src, const char dest)
{
	for(unsigned int i = 0; i < str.length(); i++)
	{
		if (str[i] == src)	str[i] = dest;
	}
}

std::vector<std::string> splitString(const std::string& str, const std::string& delims, unsigned int maxSplits)
{
	std::vector<std::string> ret;
	// Pre-allocate some space for performance
	ret.reserve(maxSplits ? maxSplits+1 : 10);    // 10 is guessed capacity for most case

	unsigned int numSplits = 0;

	// Use STL methods 
	size_t start, pos;
	start = 0;
	do 
	{
		pos = str.find_first_of(delims, start);
		if (pos == start)
		{
			// Do nothing
			start = pos + 1;
		}
		else if (pos == std::string::npos || (maxSplits && numSplits == maxSplits))
		{
			// Copy the rest of the string
			ret.push_back(str.substr(start));
			break;
		}
		else
		{
			// Copy up to delimiter
			ret.push_back(str.substr(start, pos - start));
			start = pos + 1;
		}
		// parse up to next real data
		start = str.find_first_not_of(delims, start);
		++numSplits;
	} 
	while (pos != std::string::npos);

	return ret;
}

bool powerOfTwo(unsigned int num)
{
	return ((num & (num - 1)) == 0);
}

} // end namespace core
