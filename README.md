Lesmicoin Core integration/staging tree
=====================================

<img src="https://cdn.rawgit.com/nao20010128nao/lesmicoin/master/lesmicoin.svg" width="300px">

# Specs
- Init. Reward: 10000 WTF
- Decimals: 8
- Block Time: 1 SECOND
- Multiply rate: 1 month (It's not subsidy!)
  - Max Supply is unlimited!
- CoinBase transaction can be spent without maturing
- Alternating Diff algorithm per 1 day
  - Bitcoin Native -> LWMA -> DGW -> KGW
- SHA256d! Use ASIC! Fever!
- Unit: `WTF`
- Prefixes:
  - Bech32 HRP: `lesmi`
  - P2PKH: `Q`
  - P2SH: `s`
- No premine (Except for testing, but the chain was abandoned)
  - Even the Genesis block have no value (even it can't be spent)

# Warning and Notices
We do not pre-sale or premine, because this coin must not have any price.
You can request listing to the exchange by yourself, but dev don't support.    
This coin is made for fulfilling my crazy mind. Not made for investing, so MUST NOT INVEST for this coin.    
Think of this coin as a scam, or a shitcoin. Mine this coin if you don't wish to earn.    
Dev is welcome to use this coin/chain for testing vulnerabilities existing in the application.


What is Bitcoin?
----------------

Bitcoin is an experimental digital currency that enables instant payments to
anyone, anywhere in the world. Bitcoin uses peer-to-peer technology to operate
with no central authority: managing transactions and issuing money are carried
out collectively by the network. Bitcoin Core is the name of open source
software which enables the use of this currency.

For more information, as well as an immediately useable, binary version of
the Bitcoin Core software, see https://bitcoincore.org/en/download/, or read the
[original whitepaper](https://bitcoincore.org/bitcoin.pdf).

License
-------

Bitcoin Core is released under the terms of the MIT license. See [COPYING](COPYING) for more
information or see https://opensource.org/licenses/MIT.

Development Process
-------------------

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/bitcoin/bitcoin/tags) are created
regularly to indicate new official, stable release versions of Bitcoin Core.

The contribution workflow is described in [CONTRIBUTING.md](CONTRIBUTING.md).

Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test on short notice. Please be patient and help out by testing
other people's pull requests, and remember this is a security-critical project where any mistake might cost people
lots of money.

### Automated Testing

Developers are strongly encouraged to write [unit tests](src/test/README.md) for new code, and to
submit new unit tests for old code. Unit tests can be compiled and run
(assuming they weren't disabled in configure) with: `make check`. Further details on running
and extending unit tests can be found in [/src/test/README.md](/src/test/README.md).

There are also [regression and integration tests](/test), written
in Python, that are run automatically on the build server.
These tests can be run (if the [test dependencies](/test) are installed) with: `test/functional/test_runner.py`

The Travis CI system makes sure that every pull request is built for Windows, Linux, and macOS, and that unit/sanity tests are run automatically.

### Manual Quality Assurance (QA) Testing

Changes should be tested by somebody other than the developer who wrote the
code. This is especially important for large or high-risk changes. It is useful
to add a test plan to the pull request description if testing the changes is
not straightforward.

Translations
------------

Changes to translations as well as new translations can be submitted to
[Bitcoin Core's Transifex page](https://www.transifex.com/projects/p/bitcoin/).

Translations are periodically pulled from Transifex and merged into the git repository. See the
[translation process](doc/translation_process.md) for details on how this works.

**Important**: We do not accept translation changes as GitHub pull requests because the next
pull from Transifex would automatically overwrite them again.

Translators should also subscribe to the [mailing list](https://groups.google.com/forum/#!forum/bitcoin-translators).
