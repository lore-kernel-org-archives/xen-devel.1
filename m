From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 0/3] x86: S3 resume adjustments
Date: Sun, 15 Apr 2018 20:15:00 +0000
Message-ID: <4e5b237a-6270-e6d1-a665-caf2a526ff4a@invisiblethingslab.com>
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <0bfe793f-272c-a98c-95eb-ee75f5ee6218@invisiblethingslab.com>
 <dff5dbde-0eea-c626-22dd-c8192927f9da@citrix.com>
 <72e260c1-1804-1526-2b94-b7dda32313a3@invisiblethingslab.com>
 <7ac35f02-c3e3-9572-c41e-9c0fa4210afb@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3869373575769127740=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ldgc=he=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f7o3u-0003au-4e
 for xen-devel@lists.xenproject.org; Sun, 15 Apr 2018 20:15:46 +0000
In-Reply-To: <7ac35f02-c3e3-9572-c41e-9c0fa4210afb@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3869373575769127740==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="phxGxhQT3SKoTC0bXzqNvgNyp577kRikA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--phxGxhQT3SKoTC0bXzqNvgNyp577kRikA
Content-Type: multipart/mixed; boundary="mvIRsZ62Nn2U3GQdR0FWFyPQtqBJE2Hbw";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
Message-ID: <4e5b237a-6270-e6d1-a665-caf2a526ff4a@invisiblethingslab.com>
Subject: Re: [PATCH 0/3] x86: S3 resume adjustments
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <0bfe793f-272c-a98c-95eb-ee75f5ee6218@invisiblethingslab.com>
 <dff5dbde-0eea-c626-22dd-c8192927f9da@citrix.com>
 <72e260c1-1804-1526-2b94-b7dda32313a3@invisiblethingslab.com>
 <7ac35f02-c3e3-9572-c41e-9c0fa4210afb@citrix.com>
In-Reply-To: <7ac35f02-c3e3-9572-c41e-9c0fa4210afb@citrix.com>

--mvIRsZ62Nn2U3GQdR0FWFyPQtqBJE2Hbw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 15/04/18 16:52, Simon Gaiser wrote:
>> Andrew Cooper:
>>> On 14/04/18 06:49, Simon Gaiser wrote:
>>>> Jan Beulich:
>>>>> 1: correct ordering of operations during S3 resume
>>>>> 2: suppress BTI mitigations around S3 suspend/resume
>>>>> 3: check feature flags after resume
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> Simon, could you give this a try please?
>>>> Backported to 4.8 it works fine with the two fixes I sent earlier.
>>>>
>>>> I now also tried staging. Resume is broken even without IBRS/IBPB. I=
t
>>>> panics about a double fault somewhere after it starts to enable the
>>>> non-boot CPUs. Since the IBRS/IPBP problem happens before that point=
 I
>>>> could test the patches anyway. With them it gets again to the point
>>>> where it double faults. So the patches are most likely fine.
>>>>
>>>> I didn't really looked yet at the cause of the double fault.
>>> Do you at least have the crash log from the attempt?
>> Sure, it' a build of 16fb4b5a9a79f95df17f10ba62e9f44d21cf89b5 on a
>> Debian sid:
>=20
> I can't find that object.  I presume this isn't an upstream tree?

That's the head of upstream staging as of Friday/Saturday night. And
AFAICS it still is:
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D16fb4b5a9a=
79f95df17f10ba62e9f44d21cf89b5

>> (XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0=
, BCAST, CMCI
>> (XEN) CPU0 CMCI LVT vector (0xf2) already installed
>> (XEN) Finishing wakeup from ACPI S3 state.
>> (XEN) Enabling non-boot CPUs  ...
>> (XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00000
>> (XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00800
>> (XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00000
>> (XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00800
>> (XEN) emul-priv-op.c:1179:d0v3 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00000
>> (XEN) emul-priv-op.c:1179:d0v3 Domain attempted WRMSR 0000001b from 0x=
00000000fee00c00 to 0x00000000fee00800
>=20
> Bad dom0.  It shouldn't be playing with APIC_BASE at all, but I guess
> this means I can't fix the hypervisor behaviour to throw #GP back at a
> PV guest.
>=20
>> (XEN) *** DOUBLE FAULT ***
>> (XEN) ----[ Xen-4.11-unstable  x86_64  debug=3Dy   Not tainted ]----
>> (XEN) CPU:    0
>> (XEN) RIP:    e008:[<ffff82d08037a944>] handle_exception+0x9c/0xf7
>=20
> Can you disassemble the binary and find out where this is?  On current
> staging, handle_exception+0x9c is in the middle of
> SPEC_CTRL_ENTRY_FROM_INTR but this might not be the case for you.

Dump of assembler code for function handle_exception:
   0xffff82d08037a8a8 <+0>:	0f 1f 00	nopl   (%rax)
   0xffff82d08037a8ab <+3>:	48 83 c4 88	add    $0xffffffffffffff88,%rsp
   0xffff82d08037a8af <+7>:	fc	cld   =20
   0xffff82d08037a8b0 <+8>:	48 89 7c 24 70	mov    %rdi,0x70(%rsp)
   0xffff82d08037a8b5 <+13>:	31 ff	xor    %edi,%edi
   0xffff82d08037a8b7 <+15>:	48 89 74 24 68	mov    %rsi,0x68(%rsp)
   0xffff82d08037a8bc <+20>:	31 f6	xor    %esi,%esi
   0xffff82d08037a8be <+22>:	48 89 54 24 60	mov    %rdx,0x60(%rsp)
   0xffff82d08037a8c3 <+27>:	31 d2	xor    %edx,%edx
   0xffff82d08037a8c5 <+29>:	48 89 4c 24 58	mov    %rcx,0x58(%rsp)
   0xffff82d08037a8ca <+34>:	31 c9	xor    %ecx,%ecx
   0xffff82d08037a8cc <+36>:	48 89 44 24 50	mov    %rax,0x50(%rsp)
   0xffff82d08037a8d1 <+41>:	31 c0	xor    %eax,%eax
   0xffff82d08037a8d3 <+43>:	4c 89 44 24 48	mov    %r8,0x48(%rsp)
   0xffff82d08037a8d8 <+48>:	4c 89 4c 24 40	mov    %r9,0x40(%rsp)
   0xffff82d08037a8dd <+53>:	4c 89 54 24 38	mov    %r10,0x38(%rsp)
   0xffff82d08037a8e2 <+58>:	4c 89 5c 24 30	mov    %r11,0x30(%rsp)
   0xffff82d08037a8e7 <+63>:	45 31 c0	xor    %r8d,%r8d
   0xffff82d08037a8ea <+66>:	45 31 c9	xor    %r9d,%r9d
   0xffff82d08037a8ed <+69>:	45 31 d2	xor    %r10d,%r10d
   0xffff82d08037a8f0 <+72>:	45 31 db	xor    %r11d,%r11d
   0xffff82d08037a8f3 <+75>:	48 89 5c 24 28	mov    %rbx,0x28(%rsp)
   0xffff82d08037a8f8 <+80>:	31 db	xor    %ebx,%ebx
   0xffff82d08037a8fa <+82>:	48 89 6c 24 20	mov    %rbp,0x20(%rsp)
   0xffff82d08037a8ff <+87>:	48 8d 6c 24 20	lea    0x20(%rsp),%rbp
   0xffff82d08037a904 <+92>:	48 f7 d5	not    %rbp
   0xffff82d08037a907 <+95>:	4c 89 64 24 18	mov    %r12,0x18(%rsp)
   0xffff82d08037a90c <+100>:	4c 89 6c 24 10	mov    %r13,0x10(%rsp)
   0xffff82d08037a911 <+105>:	4c 89 74 24 08	mov    %r14,0x8(%rsp)
   0xffff82d08037a916 <+110>:	4c 89 3c 24	mov    %r15,(%rsp)
   0xffff82d08037a91a <+114>:	45 31 e4	xor    %r12d,%r12d
   0xffff82d08037a91d <+117>:	45 31 ed	xor    %r13d,%r13d
   0xffff82d08037a920 <+120>:	45 31 f6	xor    %r14d,%r14d
   0xffff82d08037a923 <+123>:	45 31 ff	xor    %r15d,%r15d
   0xffff82d08037a926 <+126>:	49 c7 c6 ff 7f 00 00	mov    $0x7fff,%r14
   0xffff82d08037a92d <+133>:	49 09 e6	or     %rsp,%r14
   0xffff82d08037a930 <+136>:	90	nop
   0xffff82d08037a931 <+137>:	90	nop
   0xffff82d08037a932 <+138>:	90	nop
   0xffff82d08037a933 <+139>:	90	nop
   0xffff82d08037a934 <+140>:	90	nop
   0xffff82d08037a935 <+141>:	90	nop
   0xffff82d08037a936 <+142>:	90	nop
   0xffff82d08037a937 <+143>:	90	nop
   0xffff82d08037a938 <+144>:	90	nop
   0xffff82d08037a939 <+145>:	90	nop
   0xffff82d08037a93a <+146>:	90	nop
   0xffff82d08037a93b <+147>:	90	nop
   0xffff82d08037a93c <+148>:	90	nop
   0xffff82d08037a93d <+149>:	90	nop
   0xffff82d08037a93e <+150>:	90	nop
   0xffff82d08037a93f <+151>:	90	nop
   0xffff82d08037a940 <+152>:	90	nop
   0xffff82d08037a941 <+153>:	90	nop
   0xffff82d08037a942 <+154>:	90	nop
   0xffff82d08037a943 <+155>:	90	nop
   0xffff82d08037a944 <+156>:	90	nop
   0xffff82d08037a945 <+157>:	90	nop
   0xffff82d08037a946 <+158>:	90	nop
   0xffff82d08037a947 <+159>:	90	nop
   0xffff82d08037a948 <+160>:	90	nop
   0xffff82d08037a949 <+161>:	90	nop
   0xffff82d08037a94a <+162>:	90	nop
   0xffff82d08037a94b <+163>:	90	nop
   0xffff82d08037a94c <+164>:	90	nop
   0xffff82d08037a94d <+165>:	90	nop
   0xffff82d08037a94e <+166>:	90	nop
   0xffff82d08037a94f <+167>:	90	nop
   0xffff82d08037a950 <+168>:	90	nop
   0xffff82d08037a951 <+169>:	90	nop
   0xffff82d08037a952 <+170>:	90	nop
   0xffff82d08037a953 <+171>:	90	nop
   0xffff82d08037a954 <+172>:	90	nop
   0xffff82d08037a955 <+173>:	90	nop
   0xffff82d08037a956 <+174>:	90	nop
   0xffff82d08037a957 <+175>:	90	nop
   0xffff82d08037a958 <+176>:	90	nop
   0xffff82d08037a959 <+177>:	90	nop
   0xffff82d08037a95a <+178>:	90	nop
   0xffff82d08037a95b <+179>:	90	nop
   0xffff82d08037a95c <+180>:	90	nop
   0xffff82d08037a95d <+181>:	90	nop
   0xffff82d08037a95e <+182>:	90	nop
   0xffff82d08037a95f <+183>:	90	nop
   0xffff82d08037a960 <+184>:	90	nop
   0xffff82d08037a961 <+185>:	90	nop
   0xffff82d08037a962 <+186>:	90	nop
   0xffff82d08037a963 <+187>:	90	nop
   0xffff82d08037a964 <+188>:	90	nop
   0xffff82d08037a965 <+189>:	90	nop
   0xffff82d08037a966 <+190>:	90	nop
   0xffff82d08037a967 <+191>:	90	nop
   0xffff82d08037a968 <+192>:	90	nop
   0xffff82d08037a969 <+193>:	90	nop
   0xffff82d08037a96a <+194>:	90	nop
   0xffff82d08037a96b <+195>:	90	nop
   0xffff82d08037a96c <+196>:	90	nop
   0xffff82d08037a96d <+197>:	90	nop
   0xffff82d08037a96e <+198>:	90	nop
   0xffff82d08037a96f <+199>:	90	nop
   0xffff82d08037a970 <+200>:	90	nop
   0xffff82d08037a971 <+201>:	90	nop
   0xffff82d08037a972 <+202>:	90	nop
   0xffff82d08037a973 <+203>:	90	nop
   0xffff82d08037a974 <+204>:	90	nop
   0xffff82d08037a975 <+205>:	49 8b 4e e1	mov    -0x1f(%r14),%rcx
   0xffff82d08037a979 <+209>:	49 89 cf	mov    %rcx,%r15
   0xffff82d08037a97c <+212>:	48 f7 d9	neg    %rcx
   0xffff82d08037a97f <+215>:	74 1e	je     0xffff82d08037a99f <handle_exc=
eption_saved>
   0xffff82d08037a981 <+217>:	79 07	jns    0xffff82d08037a98a <handle_exc=
eption+226>
   0xffff82d08037a983 <+219>:	49 89 4e e1	mov    %rcx,-0x1f(%r14)
   0xffff82d08037a987 <+223>:	48 f7 d9	neg    %rcx
   0xffff82d08037a98a <+226>:	0f 22 d9	mov    %rcx,%cr3
   0xffff82d08037a98d <+229>:	31 c9	xor    %ecx,%ecx
   0xffff82d08037a98f <+231>:	49 89 4e e1	mov    %rcx,-0x1f(%r14)
   0xffff82d08037a993 <+235>:	f6 84 24 88 00 00 00 03	testb  $0x3,0x88(%r=
sp)
   0xffff82d08037a99b <+243>:	4c 0f 45 f9	cmovne %rcx,%r15
End of assembler dump.

Is there an easy way to get gdb to resolve alternatives?

BTW:
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK
(XEN) BTI mitigations: Thunk RETPOLINE, Others: RSB_NATIVE RSB_VMEXIT
(XEN) XPTI: enabled

With 'bti=3Drsb_native=3D0' it fails somewhere else:

(XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0, B=
CAST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf2) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) *** DOUBLE FAULT ***
(XEN) ----[ Xen-4.11-unstable  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08027c35d>] search_pre_exception_table+0/0x54=

(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: 0000000000000000   rcx: 00000000000000=
00
(XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: ffffc90040cd40=
28
(XEN) rbp: 000036ffbf32bfb7   rsp: ffffc90040cd4020   r8:  00000000000000=
00
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000000=
00
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: ffffc90040cd7f=
ff
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000000426=
e0
(XEN) cr3: 000000022200a000   cr2: ffffc90040cd3ff8
(XEN) fsb: 00007fd74515e740   gsb: ffff88021e6c0000   gss: 00000000000000=
00
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Current stack base ffffc90040cd0000 differs from expected ffff8300c=
ec88000
(XEN) Valid stack range: ffffc90040cd6000-ffffc90040cd8000, sp=3Dffffc900=
40cd4020, tss.rsp0=3Dffff8300cec8ffa0
(XEN) No stack overflow detected. Skipping stack trace.
(XEN) *** SYSENTER_ESP: ffff8300cec8ffa0
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) DOUBLE FAULT -- system shutdown
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...

Dump of assembler code for function search_pre_exception_table:
   0xffff82d08027c35d <+0>:	55	push   %rbp
   0xffff82d08027c35e <+1>:	48 89 e5	mov    %rsp,%rbp
   0xffff82d08027c361 <+4>:	41 54	push   %r12
   0xffff82d08027c363 <+6>:	53	push   %rbx
   0xffff82d08027c364 <+7>:	4c 8b a7 80 00 00 00	mov    0x80(%rdi),%r12
   0xffff82d08027c36b <+14>:	4c 89 e2	mov    %r12,%rdx
   0xffff82d08027c36e <+17>:	48 8d 35 e3 61 17 00	lea    0x1761e3(%rip),%=
rsi        # 0xffff82d0803f2558
   0xffff82d08027c375 <+24>:	48 8d 3d d4 61 17 00	lea    0x1761d4(%rip),%=
rdi        # 0xffff82d0803f2550
   0xffff82d08027c37c <+31>:	e8 0c fe ff ff	callq  0xffff82d08027c18d <se=
arch_one_extable>
   0xffff82d08027c381 <+36>:	48 89 c3	mov    %rax,%rbx
   0xffff82d08027c384 <+39>:	48 85 c0	test   %rax,%rax
   0xffff82d08027c387 <+42>:	75 08	jne    0xffff82d08027c391 <search_pre_=
exception_table+52>
   0xffff82d08027c389 <+44>:	48 89 d8	mov    %rbx,%rax
   0xffff82d08027c38c <+47>:	5b	pop    %rbx
   0xffff82d08027c38d <+48>:	41 5c	pop    %r12
   0xffff82d08027c38f <+50>:	5d	pop    %rbp
   0xffff82d08027c390 <+51>:	c3	retq  =20
   0xffff82d08027c391 <+52>:	49 89 c0	mov    %rax,%r8
   0xffff82d08027c394 <+55>:	4c 89 e1	mov    %r12,%rcx
   0xffff82d08027c397 <+58>:	ba ca 00 00 00	mov    $0xca,%edx
   0xffff82d08027c39c <+63>:	48 8d 35 0a df 16 00	lea    0x16df0a(%rip),%=
rsi        # 0xffff82d0803ea2ad
   0xffff82d08027c3a3 <+70>:	48 8d 3d 56 89 15 00	lea    0x158956(%rip),%=
rdi        # 0xffff82d0803d4d00
   0xffff82d08027c3aa <+77>:	e8 58 71 fd ff	callq  0xffff82d080253507 <pr=
intk>
   0xffff82d08027c3af <+82>:	eb d8	jmp    0xffff82d08027c389 <search_pre_=
exception_table+44>
End of assembler dump.

>> (XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
>> (XEN) rax: ffffc90040cd4068   rbx: 0000000000000000   rcx: 00000000000=
0000a
>> (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 00000000000=
00000
>> (XEN) rbp: 000036ffbf32bf77   rsp: ffffc90040cd4000   r8:  00000000000=
00000
>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000=
00000
>> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: ffffc90040c=
d7fff
>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000000=
426e0
>> (XEN) cr3: 000000022200a000   cr2: ffffc90040cd3ff8
>> (XEN) fsb: 0000000000000000   gsb: ffff88021e6c0000   gss: 00000000000=
00000
>> (XEN) ds: 002b   es: 002b   fs: 8a00   gs: 0010   ss: e010   cs: e008
>> (XEN) Current stack base ffffc90040cd0000 differs from expected ffff83=
00cec88000
>> (XEN) Valid stack range: ffffc90040cd6000-ffffc90040cd8000, sp=3Dffffc=
90040cd4000, tss.rsp0=3Dffff8300cec8ffa0
>=20
> Given the %rsp and %cr2 values, it looks like we have a bad %rsp over a=

> region which isn't mapped, tried to push a value, got #PF, tried to
> invoke the #PF exception handler which faulted again, and escalated to
> #DF which followed the TSS and moved back to reality.
>=20
> The only way to come in with stack pointers other than TSS.RSP0 is via
> syscall and sysenter.  SYSENTER_ESP should be identical to TSS.RSP0
>=20
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -257,6 +257,13 @@ void do_double_fault(struct cpu_user_regs *regs)
>      _show_registers(regs, crs, CTXT_hypervisor, NULL);
>      show_stack_overflow(cpu, regs);
> =20
> +    {
> +        uint64_t val;
> +
> +        rdmsrl(MSR_IA32_SYSENTER_ESP, val);
> +        printk("*** SYSENTER_ESP: %p\n", _p(val));
> +    }
> +
>      panic("DOUBLE FAULT -- system shutdown");
>  }
> =20
> so this bit of debugging should help track things down.  If not, then
> we've probably got an issue (re)writing the syscall trampolines.

(XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0, B=
CAST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf2) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00000
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000001b from 0x000=
00000fee00c00 to 0x00000000fee00800
(XEN) *** DOUBLE FAULT ***
(XEN) ----[ Xen-4.11-unstable  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08037a944>] handle_exception+0x9c/0xf7
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffffc90040cc4068   rbx: 0000000000000000   rcx: 00000000000000=
0a
(XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 00000000000000=
00
(XEN) rbp: 000036ffbf33bf77   rsp: ffffc90040cc4000   r8:  00000000000000=
00
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000000=
00
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: ffffc90040cc7f=
ff
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000000426=
e0
(XEN) cr3: 000000022200a000   cr2: ffffc90040cc3ff8
(XEN) fsb: 0000000000000000   gsb: ffff88021e640000   gss: 00000000000000=
00
(XEN) ds: 002b   es: 002b   fs: 8a00   gs: 0010   ss: e010   cs: e008
(XEN) Current stack base ffffc90040cc0000 differs from expected ffff8300c=
ec88000
(XEN) Valid stack range: ffffc90040cc6000-ffffc90040cc8000, sp=3Dffffc900=
40cc4000, tss.rsp0=3Dffff8300cec8ffa0
(XEN) No stack overflow detected. Skipping stack trace.
(XEN) *** SYSENTER_ESP: ffff8300cec8ffa0
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) DOUBLE FAULT -- system shutdown
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...

Thanks, Simon


--mvIRsZ62Nn2U3GQdR0FWFyPQtqBJE2Hbw--

--phxGxhQT3SKoTC0bXzqNvgNyp577kRikA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrTsvQACgkQkO9xfO/x
ly+OSQ//RJM3w2MagRxJuKl4JHN7yaJRGkUuKHUi8WHb7qkzRBoKd4jqnHYpogcr
i8Nr/IfEVXDmTnUiLzXd+D4BscIn5XEYJ1mwuE7YIpIFw2ehtZ1KUAVTDWdv3Yp6
rV/7Jax7CIXBSrY8Y0YbCO/3gi6CkgvBQzh9w+TmrUTQEgcpPqJ+HjHJrLfXgIUv
eUcdJ+W6Ye7A2tllz4OfDwQmM3RPjU1c91TEO0egjK6ttI+ICXqtPH5ALZK+XeVL
zJlt34uGkzE658vnc4G3AlSbT6bX3f0B4vKrJlw+dYkWZlwkTrCwL3AEoZO3IalZ
4sYEGic8yCLniIe2UtqLjKgd75AgRcfiQgt3qOaVEdoh6WnBu4ss9b0ITuj/oPzh
/YHynmx13uroclNW6iqPrm733lVls7iH1bwU3XWsAkMkvLjYjLB61box1FWGV1OQ
8+9AIE8twYjkgaGQZ3kHA2ta5loiqxWR0deRHc2RpqCDGWxWNYpoh+atKzpgkDa1
mRFFJOPgPxuC/wgMWCZOZ1YFGL/5XcSsnasua5vFewEOeVelRsk2aq1h3ciWQiHS
SMid1hX8LaxPPXpjnkupO1ymUqog6NcZrhLwRnh2XCDrfPC/eO4+FD2NWDwF/8bm
M4VFElGW5nf+H09QUNkNU/8x/mxNOAooRv5Fz8p7YajUPp/7nCU=
=yl2w
-----END PGP SIGNATURE-----

--phxGxhQT3SKoTC0bXzqNvgNyp577kRikA--


--===============3869373575769127740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3869373575769127740==--
