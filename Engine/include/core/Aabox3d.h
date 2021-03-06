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

#ifndef _AABBOX_3D_H_
#define _AABBOX_3D_H_

#include <Globals.h>

#include <glm/glm.hpp>

namespace core
{

//! Axis aligned box in 3d dimensional space.
//!  Has some useful methods used with occlusion culling or clipping.
class ENGINE_PUBLIC_EXPORT aabox3d
{
public:

	aabox3d();
	aabox3d(const glm::vec3& min, const glm::vec3& max);
	aabox3d(const glm::vec3& init);
	aabox3d(float minx, float miny, float minz, float maxx, float maxy, float maxz);

	inline bool operator==(const aabox3d& other) const;
	inline bool operator!=(const aabox3d& other) const;

	//! Adds a point to the bounding box, causing it to grow bigger,
	//! if point is outside of the box.
	//! \param x: X Coordinate of the point to add to this box.
	//! \param y: Y Coordinate of the point to add to this box.
	//! \param z: Z Coordinate of the point to add to this box.
	void addInternalPoint(float x, float y, float z);

	//! Adds a point to the bounding box, causing it to grow bigger,
	//! if point is outside of the box
	//! \param p: Point to add into the box.
	void addInternalPoint(const glm::vec3& p);

	//! Adds an other bounding box to the bounding box, causing it to grow bigger,
	//! if the box is outside of the box
	//! \param b: Other bounding box to add into this box.
	void addInternalBox(const aabox3d& b);

	//! Resets the bounding box.
	void reset(float x, float y, float z);

	//! Resets the bounding box.
	void reset(const aabox3d& initValue);

	//! Resets the bounding box.
	void reset(const glm::vec3& initValue);
	
	//! returns center of the bounding box
	glm::vec3 getCenter() const;

	//! returns extent of the box
	glm::vec3 getExtent() const;

	//! stores all 8 edges of the box into a array
	//! \param edges: Pointer to array of 8 edges
	void getEdges(glm::vec3* edges) const;

	//! returns if the box is empty, which means that there is
	//! no space within the min and the max edge.
	bool isEmpty() const;

	//! repairs the box, if for example MinEdge and MaxEdge are swapped.
	void repair();

	glm::vec3 MinEdge;
	glm::vec3 MaxEdge;
};

} // end namespace core

#endif