#include "container_test.h"
#include "graph_test.h"
#include "matrix_test.h"
#include "string_test.h"
#include "sort_test.h"

int main(int argc, char* argv[]) {
	lib_calvin_container::containerTest();
	lib_calvin_graph::graphTest();
	lib_calvin_matrix::matrixTest();
	lib_calvin_sort::sortTest();
	lib_calvin_string::stringTest();
	std::cout << "-------------------------------------------------------------\n";
	std::cout << "lib_calvin test completed!\n\n\n\n\n";
	return 0;
}
