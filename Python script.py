#!/usr/bin/env python3
import argparse
import logging
import sys
from typing import Union, Optional, NoReturn

DESCRIPTION = """"""


def make_argparser():
    parser = argparse.ArgumentParser(add_help=False, description=DESCRIPTION)
    options = parser.add_argument_group('Options')
    options.add_argument('positional1', metavar='dispname',
        help='')
    options.add_argument('-h', '--help', action='help',
        help='Print this argument help text and exit.')
    logs = parser.add_argument_group('Logging')
    logs.add_argument('-l', '--log', type=argparse.FileType('w'), default=sys.stderr,
        help='Print log messages to this file instead of to stderr. Warning: Will overwrite the file.')
    volume = logs.add_mutually_exclusive_group()
    volume.add_argument('-q', '--quiet', dest='volume', action='store_const', const=logging.CRITICAL,
        default=logging.WARNING)
    volume.add_argument('-v', '--verbose', dest='volume', action='store_const', const=logging.INFO)
    volume.add_argument('-D', '--debug', dest='volume', action='store_const', const=logging.DEBUG)
    return parser


def main(*argv: str) -> Optional[int]:

    parser = make_argparser()
    args = parser.parse_args(argv[1:])

    logging.basicConfig(stream=args.log, level=args.volume, format='%(message)s')

    return None


def fail(error: Union[str,BaseException], code: int = 1) -> NoReturn:
    if __name__ == '__main__':
        logging.critical(f'Error: {error}')
        sys.exit(code)
    elif isinstance(error, BaseException):
        raise error
    else:
        raise RuntimeError(error)


if __name__ == '__main__':
    try:
        sys.exit(main(*sys.argv))
    except BrokenPipeError:
        pass
