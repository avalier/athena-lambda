import inspect
import json
import pathlib


def get_event(file_name: str) -> str:
    """
    Return the contents of a json event file, assuming that it resides
    in the same folder as teh test that called this helper.
    """

    # Get the path of the python file that called this helper method (ie. The file in which the test resides) #
    calling_file = pathlib.Path(inspect.stack()[1].filename)
    calling_folder = calling_file.parent.resolve()

    # Build a path to the event json file (assuming it's in the same folder as the test) #
    file_path = calling_folder.joinpath(file_name)

    # Return the contents of the json file as a string #
    with open(file_path) as f:
        data = json.load(f)
        return data