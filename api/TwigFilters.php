<?php
namespace emc;

class TwigFilters
{
	public function uppercase($value)
	{
		return strtoupper($value);
	}
}