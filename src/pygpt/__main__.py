import argparse
import os
import sys

from .client import ChatGPT


def clear_screen() -> None:
    os.system("cls" if os.name == "nt" else "clear")


def run_cli() -> None:
    parser = argparse.ArgumentParser(
        prog="pygpt",
        description="PyGPT – qeyri-rəsmi sessiya-token körpüsü | Unofficial session-token bridge",
    )
    parser.add_argument(
        "--token",
        help="`__Secure-next-auth.session-token` dəyəri | Session token value",
    )
    parser.add_argument(
        "--conversation",
        help="Davam etmək istədiyiniz söhbətin ID-si | Existing conversation ID",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Daha detallı çıxış | Verbose logging",
    )
    args = parser.parse_args()

    session_token = args.token or input(
        "Sessiya tokenini daxil edin (Session token): "
    ).strip()
    conversation_id = args.conversation or input(
        "Əvvəlki söhbət ID-si (boş buraxa bilərsiniz) / Conversation ID (optional): "
    ).strip()

    if not session_token:
        print("Token tələb olunur. | Session token is required.")
        sys.exit(1)

    chat = ChatGPT(session_token, conversation_id or "", verbose=args.verbose)

    clear_screen()
    print(
        "PyGPT dialoqu başlatdı. 'reset' yazsanız söhbət sıfırlanar, 'quit' yazsanız çıxış edər.\n"
        "PyGPT chat started. Type 'reset' to reset or 'quit' to exit.\n"
    )

    while True:
        prompt = input("Sən / You: ").strip()
        if prompt.lower() in {"quit", "exit"}:
            print("Çıxılır... | Exiting...")
            break
        if prompt.lower() == "reset":
            chat.reset_conversation()
            clear_screen()
            print(
                "Söhbət sıfırlandı. | Conversation reset.\n"
                "PyGPT dialoqu davam edir. 'quit' ilə çıxış edin.\n"
            )
            continue

        print("PyGPT: ", end="", flush=True)
        response = chat.send_message(prompt)
        if response and "message" in response:
            print(response["message"], end="\n\n")
        else:
            print("[cavab alınmadı / no response]\n")


if __name__ == "__main__":
    run_cli()
