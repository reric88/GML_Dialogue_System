function BubbleSort(list){
	var listSize = ds_list_size(list);
	for (var i = 0; i < listSize -1; i++){
		for (var j = 0; j < listSize - i - 1; j++){
			if (list[|j].current[@ SPEED] < list[| j +1].current[@ SPEED]){
				var temp = list[|j];
				list[|j] = list[|j+1];
				list[|j+1] = temp;
			}
		}
	}
	
}
