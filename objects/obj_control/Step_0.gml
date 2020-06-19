


// Destroy old cases
if instance_number(obj_case) > max_cases{
	oldest_case = noone
	lowest_case = infinity
	with(obj_case){
		if case_number < other.lowest_case{
			other.oldest_case = id
		}
	}
	if oldest_case != noone{
		instance_destroy(oldest_case)
	}
}


