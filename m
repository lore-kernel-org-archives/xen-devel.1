From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Wed, 3 Oct 2018 19:38:18 +0100
Message-ID: <64d542e2-dc22-f157-5b71-2e5c82bdd6b7@citrix.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------D181864555E688E9CB33B179"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=twgs=mp=citrix.com=prvs=8071b990d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g7m2R-0007AE-80
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 18:38:23 +0000
In-Reply-To: <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

--------------D181864555E688E9CB33B179
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 02/10/18 11:12, Jan Beulich wrote:
> In a number of cases the targets of indirect calls get determined once
> at boot time. In such cases we can replace those calls with direct ones
> via our alternative instruction patching mechanism.
>
> Some of the targets (in particular the hvm_funcs ones) get established
> only in pre-SMP initcalls, making necessary a second passs through the
> alternative patching code. Therefore some adjustments beyond the
> recognition of the new special pattern are necessary there.
>
> Note that patching such sites more than once is not supported (and the
> supplied macros also don't provide any means to do so).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewing just the code generation at this point.

See the Linux source code for ASM_CALL_CONSTRAINT.  There is a potential
code generation issue if you've got a call instruction inside an asm
block if you don't list the stack pointer as a clobbered output.

Next, with Clang, there seems to be some a bug causing the function
pointer to be spilled onto the stack

ffff82d08026e990 <foo2>:
ffff82d08026e990:       50                      push   %rax
ffff82d08026e991:       48 8b 05 40 bc 20 00    mov    0x20bc40(%rip),%rax        # ffff82d08047a5d8 <hvm_funcs+0x130>
ffff82d08026e998:       48 89 04 24             mov    %rax,(%rsp)
ffff82d08026e99c:       ff 15 36 bc 20 00       callq  *0x20bc36(%rip)        # ffff82d08047a5d8 <hvm_funcs+0x130>
ffff82d08026e9a2:       31 c0                   xor    %eax,%eax
ffff82d08026e9a4:       59                      pop    %rcx
ffff82d08026e9a5:       c3                      retq   
ffff82d08026e9a6:       66 2e 0f 1f 84 00 00    nopw   %cs:0x0(%rax,%rax,1)
ffff82d08026e9ad:       00 00 00 


I'm not quite sure what is going on here, and the binary does boot, but
the code gen is definitely not correct.  Given this and the GCC bugs
you've found leading to the NO_ARG infrastructure, how about dropping
all the compatibility hacks, and making the infrastructure fall back to
a regular compiler-inserted function pointer call?

I think it is entirely reasonable to require people wanting to use this
optimised infrastructure to be using new-enough compilers, and it would
avoid the need to carry compatibility hacks for broken compilers.

Next, the ASM'd calls aren't SYSV-ABI compliant.

extern void bar(void);

int foo1(void)
{
    hvm_funcs.wbinvd_intercept();
    return 0;
}

int foo2(void)
{
    alternative_vcall(hvm_funcs.wbinvd_intercept);
    return 0;
}

int bar1(void)
{
    bar();
    return 0;
}

ffff82d08026e1e0 <foo1>:
ffff82d08026e1e0:       48 83 ec 08             sub    $0x8,%rsp
ffff82d08026e1e4:       48 8b 05 c5 49 1d 00    mov    0x1d49c5(%rip),%rax        # ffff82d080442bb0 <hvm_funcs+0x130>
ffff82d08026e1eb:       e8 30 2d 0f 00          callq  ffff82d080360f20 <__x86_indirect_thunk_rax>
ffff82d08026e1f0:       31 c0                   xor    %eax,%eax
ffff82d08026e1f2:       48 83 c4 08             add    $0x8,%rsp
ffff82d08026e1f6:       c3                      retq   
ffff82d08026e1f7:       66 0f 1f 84 00 00 00    nopw   0x0(%rax,%rax,1)
ffff82d08026e1fe:       00 00 

ffff82d08026e200 <foo2>:
ffff82d08026e200:       ff 15 aa 49 1d 00       callq  *0x1d49aa(%rip)        # ffff82d080442bb0 <hvm_funcs+0x130>
ffff82d08026e206:       31 c0                   xor    %eax,%eax
ffff82d08026e208:       c3                      retq   
ffff82d08026e209:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

ffff82d08026e210 <bar1>:
ffff82d08026e210:       48 83 ec 08             sub    $0x8,%rsp
ffff82d08026e214:       e8 17 18 01 00          callq  ffff82d08027fa30 <bar>
ffff82d08026e219:       31 c0                   xor    %eax,%eax
ffff82d08026e21b:       48 83 c4 08             add    $0x8,%rsp
ffff82d08026e21f:       c3                      retq   

foo2 which uses alternative_vcall() should be subtracting 8 from the
stack pointer before the emitted call instruction.  I can't find any set
of constraints which causes the stack to be set up correctly.

Finally, this series doesn't link with the default Debian toolchain.

andrewcoop@andrewcoop:/local/xen.git/xen$ ld --version
GNU ld (GNU Binutils for Debian) 2.25

andrewcoop@andrewcoop:/local/xen.git/xen$ make -s build -j8 XEN_TARGET_ARCH=x86_64 KCONFIG_CONFIG=.config-release
 __  __            _  _    _ ____                     _        _     _      
 \ \/ /___ _ __   | || |  / |___ \    _   _ _ __  ___| |_ __ _| |__ | | ___ 
  \  // _ \ '_ \  | || |_ | | __) |__| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
  /  \  __/ | | | |__   _|| |/ __/|__| |_| | | | \__ \ || (_| | |_) | |  __/
 /_/\_\___|_| |_|    |_|(_)_|_____|   \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
                                                                            
prelink.o:(.debug_aranges+0x3c94): relocation truncated to fit: R_X86_64_32 against `.debug_info'
prelink.o:(.debug_info+0x225fa): relocation truncated to fit: R_X86_64_32 against `.debug_str'
prelink.o:(.debug_info+0x22b57): relocation truncated to fit: R_X86_64_32 against `.debug_str'
prelink.o:(.debug_info+0x1b92da): relocation truncated to fit: R_X86_64_32 against `.debug_str'
prelink.o:(.debug_info+0x21e976): relocation truncated to fit: R_X86_64_32 against `.debug_str'
prelink.o:(.debug_info+0x21ec31): relocation truncated to fit: R_X86_64_32 against `.debug_str'
prelink.o:(.debug_info+0x21f03b): relocation truncated to fit: R_X86_64_32 against `.debug_str'
prelink.o:(.debug_info+0x2b2ac3): relocation truncated to fit: R_X86_64_32 against `.debug_loc'
prelink.o:(.debug_info+0x2b37f6): relocation truncated to fit: R_X86_64_32 against `.debug_str'
prelink.o:(.debug_info+0x448fab): relocation truncated to fit: R_X86_64_32 against `.debug_str'
prelink.o:(.debug_info+0x44b856): additional relocation overflows omitted from the output
ld: prelink.o: access beyond end of merged section (6617683)
ld: prelink.o: access beyond end of merged section (6617630)
ld: prelink.o: access beyond end of merged section (6617579)
ld: prelink.o: access beyond end of merged section (6617558)
ld: prelink.o: access beyond end of merged section (6617544)
ld: prelink.o: access beyond end of merged section (6617605)
ld: prelink.o: access beyond end of merged section (6617718)
ld: prelink.o: access beyond end of merged section (6617570)
ld: prelink.o: access beyond end of merged section (6617665)
ld: prelink.o: access beyond end of merged section (6617671)
ld: prelink.o: access beyond end of merged section (6617624)
ld: prelink.o: access beyond end of merged section (6617748)
ld: prelink.o: access beyond end of merged section (6617771)
ld: prelink.o: access beyond end of merged section (6617592)
ld: prelink.o: access beyond end of merged section (6617635)
ld: prelink.o: access beyond end of merged section (6617652)
ld: prelink.o: access beyond end of merged section (6617766)
ld: prelink.o: access beyond end of merged section (6617742)
ld: prelink.o(.debug_info+0xc962ed): reloc against `.debug_loc': error 2
Makefile:134: recipe for target '/local/xen.git/xen/xen-syms' failed
make[2]: *** [/local/xen.git/xen/xen-syms] Error 1
make[2]: *** Waiting for unfinished jobs....
/local/xen.git/xen/.xen.efi.0s.S: Assembler messages:
/local/xen.git/xen/.xen.efi.0s.S:21: Warning: value 0x7d2f80000544 truncated to 0x80000544
/local/xen.git/xen/.xen.efi.0s.S:22: Warning: value 0x7d2f800008dc truncated to 0x800008dc
/local/xen.git/xen/.xen.efi.0s.S:23: Warning: value 0x7d2f800008de truncated to 0x800008de
/local/xen.git/xen/.xen.efi.0s.S:24: Warning: value 0x7d2f800008e3 truncated to 0x800008e3
/local/xen.git/xen/.xen.efi.0s.S:25: Warning: value 0x7d2f80001086 truncated to 0x80001086
/local/xen.git/xen/.xen.efi.0s.S:26: Warning: value 0x7d2f8000108a truncated to 0x8000108a
/local/xen.git/xen/.xen.efi.0s.S:27: Warning: value 0x7d2f8000108e truncated to 0x8000108e
/local/xen.git/xen/.xen.efi.0s.S:28: Warning: value 0x7d2f800010dc truncated to 0x800010dc
/local/xen.git/xen/.xen.efi.0s.S:29: Warning: value 0x7d2f80001172 truncated to 0x80001172
/local/xen.git/xen/.xen.efi.1s.S: Assembler messages:
/local/xen.git/xen/.xen.efi.1s.S:21: Warning: value 0x7d2f80000544 truncated to 0x80000544
/local/xen.git/xen/.xen.efi.1s.S:22: Warning: value 0x7d2f800008dc truncated to 0x800008dc
/local/xen.git/xen/.xen.efi.1s.S:23: Warning: value 0x7d2f800008de truncated to 0x800008de
/local/xen.git/xen/.xen.efi.1s.S:24: Warning: value 0x7d2f800008e3 truncated to 0x800008e3
/local/xen.git/xen/.xen.efi.1s.S:25: Warning: value 0x7d2f80001086 truncated to 0x80001086
/local/xen.git/xen/.xen.efi.1s.S:26: Warning: value 0x7d2f8000108a truncated to 0x8000108a
/local/xen.git/xen/.xen.efi.1s.S:27: Warning: value 0x7d2f8000108e truncated to 0x8000108e
/local/xen.git/xen/.xen.efi.1s.S:28: Warning: value 0x7d2f800010dc truncated to 0x800010dc
/local/xen.git/xen/.xen.efi.1s.S:29: Warning: value 0x7d2f80001172 truncated to 0x80001172
Makefile:136: recipe for target '/local/xen.git/xen/xen' failed
make[1]: *** [/local/xen.git/xen/xen] Error 2
Makefile:45: recipe for target 'build' failed
make: *** [build] Error 2

Using LD 2.30 built from source is fine, but I'm not sure exactly what
is going on here.

~Andrew

--------------D181864555E688E9CB33B179
Content-Type: text/plain; charset="UTF-8"; name=".config-release"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=".config-release"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIFhlbi94
ODYgNC4xMi11bnN0YWJsZSBDb25maWd1cmF0aW9uCiMKQ09ORklHX1g4Nl82ND15CkNPTkZJ
R19YODY9eQpDT05GSUdfQVJDSF9ERUZDT05GSUc9ImFyY2gveDg2L2NvbmZpZ3MveDg2XzY0
X2RlZmNvbmZpZyIKCiMKIyBBcmNoaXRlY3R1cmUgRmVhdHVyZXMKIwpDT05GSUdfTlJfQ1BV
Uz0yNTYKQ09ORklHX1BWPXkKQ09ORklHX1BWX0xJTkVBUl9QVD15CkNPTkZJR19IVk09eQpD
T05GSUdfU0hBRE9XX1BBR0lORz15CiMgQ09ORklHX0JJR01FTSBpcyBub3Qgc2V0CiMgQ09O
RklHX0hWTV9GRVAgaXMgbm90IHNldApDT05GSUdfVEJPT1Q9eQpDT05GSUdfWEVOX0dVRVNU
PXkKQ09ORklHX1BWSF9HVUVTVD15CkNPTkZJR19QVl9TSElNPXkKIyBDT05GSUdfUFZfU0hJ
TV9FWENMVVNJVkUgaXMgbm90IHNldAoKIwojIENvbW1vbiBGZWF0dXJlcwojCkNPTkZJR19D
T01QQVQ9eQpDT05GSUdfQ09SRV9QQVJLSU5HPXkKQ09ORklHX0hBU19BTFRFUk5BVElWRT15
CkNPTkZJR19IQVNfRVhfVEFCTEU9eQpDT05GSUdfTUVNX0FDQ0VTU19BTFdBWVNfT049eQpD
T05GSUdfTUVNX0FDQ0VTUz15CkNPTkZJR19IQVNfTUVNX1BBR0lORz15CkNPTkZJR19IQVNf
TUVNX1NIQVJJTkc9eQpDT05GSUdfSEFTX1BEWD15CkNPTkZJR19IQVNfVUJTQU49eQpDT05G
SUdfSEFTX0tFWEVDPXkKQ09ORklHX0hBU19HREJTWD15CkNPTkZJR19IQVNfSU9QT1JUUz15
CkNPTkZJR19ORUVEU19MSUJFTEY9eQpDT05GSUdfS0VYRUM9eQpDT05GSUdfVE1FTT15CkNP
TkZJR19YRU5PUFJPRj15CiMgQ09ORklHX1hTTSBpcyBub3Qgc2V0CgojCiMgU2NoZWR1bGVy
cwojCkNPTkZJR19TQ0hFRF9DUkVESVQ9eQpDT05GSUdfU0NIRURfQ1JFRElUMj15CkNPTkZJ
R19TQ0hFRF9SVERTPXkKQ09ORklHX1NDSEVEX0FSSU5DNjUzPXkKQ09ORklHX1NDSEVEX05V
TEw9eQpDT05GSUdfU0NIRURfQ1JFRElUX0RFRkFVTFQ9eQojIENPTkZJR19TQ0hFRF9DUkVE
SVQyX0RFRkFVTFQgaXMgbm90IHNldAojIENPTkZJR19TQ0hFRF9SVERTX0RFRkFVTFQgaXMg
bm90IHNldAojIENPTkZJR19TQ0hFRF9BUklOQzY1M19ERUZBVUxUIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NIRURfTlVMTF9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX0RFRkFV
TFQ9ImNyZWRpdCIKQ09ORklHX0NSWVBUTz15CkNPTkZJR19MSVZFUEFUQ0g9eQpDT05GSUdf
RkFTVF9TWU1CT0xfTE9PS1VQPXkKQ09ORklHX0NNRExJTkU9IiIKCiMKIyBEZXZpY2UgRHJp
dmVycwojCkNPTkZJR19BQ1BJPXkKQ09ORklHX0FDUElfTEVHQUNZX1RBQkxFU19MT09LVVA9
eQpDT05GSUdfTlVNQT15CkNPTkZJR19IQVNfTlMxNjU1MD15CkNPTkZJR19IQVNfRUhDST15
CkNPTkZJR19IQVNfQ1BVRlJFUT15CkNPTkZJR19IQVNfUEFTU1RIUk9VR0g9eQpDT05GSUdf
SEFTX1BDST15CkNPTkZJR19WSURFTz15CkNPTkZJR19WR0E9eQpDT05GSUdfSEFTX1ZQQ0k9
eQoKIwojIERlcHJlY2F0ZWQgRnVuY3Rpb25hbGl0eQojCiMgQ09ORklHX1BWX0xEVF9QQUdJ
TkcgaXMgbm90IHNldApDT05GSUdfREVGQ09ORklHX0xJU1Q9ImFyY2gveDg2L2NvbmZpZ3Mv
eDg2XzY0X2RlZmNvbmZpZyIKQ09ORklHX0FSQ0hfU1VQUE9SVFNfSU5UMTI4PXkKCiMKIyBE
ZWJ1Z2dpbmcgT3B0aW9ucwojCiMgQ09ORklHX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JBU0hfREVCVUcgaXMgbm90IHNldApDT05GSUdfREVCVUdfSU5GTz15CiMgQ09ORklHX0ZS
QU1FX1BPSU5URVIgaXMgbm90IHNldAojIENPTkZJR19MT0NLX1BST0ZJTEUgaXMgbm90IHNl
dAojIENPTkZJR19QRVJGX0NPVU5URVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfVkVSQk9TRV9E
RUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDUlVCX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05G
SUdfVUJTQU4gaXMgbm90IHNldAo=
--------------D181864555E688E9CB33B179
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------D181864555E688E9CB33B179--
