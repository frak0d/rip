export module rip.vector;

import <vector>;
import <iostream>;
import <algorithm>;

namespace rip
{

template <class T>
struct lector : std::vector<T>
{
	lector(const std::initializer_list<T>& lst) : std::vector<T>(lst) {}
	
	bool contains(const T& stuff) const
	{
		return std::find(this->begin(), this->end(), stuff) != this->end();
	}
	
	void sort(bool decending=false)
	{
		if (decending)
		{
			std::sort(this->rbegin(), this->rend());
		}
		else
		{
			std::sort(this->begin(), this->end());
		}
	}
	
	void append(const std::initializer_list<T>& lst)
	{
		this->insert(this->end(), lst.begin(), lst.end());
	}
	
	void reverse()
	{
		std::reverse(this->begin(), this->end());
	}
	
	void print(std::ostream& out) const
	{
		auto len = this->size();
		out << "{";
		for (auto i=0 ; i < len ; ++i)
		{
			out << (*this)[i];
			if (i != len-1) out << ", ";
		}
		out << "}" << std::endl;
	}
	
	auto length() const
	{
		return this->size();
	}
};

} // namespace rip

template <class T>
std::ostream& operator << (std::ostream& out, const lector<T>& lc)
{
	lc.print(out);
	return out;
}

template <class T>
std::ostream& operator >> (const lector<T>& lc, std::ostream& out)
{
	lc.print(out);
	return out;
}