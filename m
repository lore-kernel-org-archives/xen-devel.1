From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: Re: Building PVH mini-os with libc support
Date: Thu, 28 Dec 2017 23:49:14 +0000
Message-ID: <CADNMjEDkHZ8KirBFusinr1c9XE0dF-QYhb1R4c4yXjwW4e2g5g@mail.gmail.com>
References: <CADNMjEDCKZoeKQ5bEwJo0okmCgm-Jn0OgbP85+qfc1YJfUinfw@mail.gmail.com>
 <16766c4e-bf23-6f7a-9c76-03bd14f87408@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3366299736229284051=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=sfng=dy=gmail.com=bruno.alvisio@srs-us1.protection.inumbo.net>)
 id 1eUhvJ-0007Pg-Gr
 for xen-devel@lists.xenproject.org; Thu, 28 Dec 2017 23:49:17 +0000
In-Reply-To: <16766c4e-bf23-6f7a-9c76-03bd14f87408@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: minios-devel@lists.xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============3366299736229284051==
Content-Type: multipart/alternative; boundary="001a1147e4e8d5d7eb05616f29dc"

--001a1147e4e8d5d7eb05616f29dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrew,



Thanks. Yup, you were right. I did an objdump of the kernel and found the
offending instruction 0x5cfcb to be callq *%r15 in the console_print
function (see below):



0000000000056ee9 <console_print>:

   56ee9:   55                      push   %rbp

   56eea:   48 89 e5                mov    %rsp,%rbp

   56eed:   41 57                   push   %r15

   56eef:   41 56                   push   %r14

   56ef1:   41 55                   push   %r13

   56ef3:   41 54                   push   %r12

   56ef5:   53                      push   %rbx

   56ef6:   48 83 ec 18             sub    $0x18,%rsp

   56efa:   49 89 fe                mov    %rdi,%r14

   56efd:   41 89 d4                mov    %edx,%r12d

   56f00:   48 89 65 c0             mov    %rsp,-0x40(%rbp)

   56f04:   8d 42 01                lea    0x1(%rdx),%eax

   56f07:   48 98                   cltq

   56f09:   48 83 c0 0f             add    $0xf,%rax

   56f0d:   48 83 e0 f0             and    $0xfffffffffffffff0,%rax

   56f11:   48 29 c4                sub    %rax,%rsp

   56f14:   48 89 e3                mov    %rsp,%rbx

   56f17:   83 3d 00 00 00 00 00    cmpl   $0x0,0x0(%rip)        # 56f1e
<console_print+0x35>

   56f1e:   74 09                   je     56f29 <console_print+0x40>

   56f20:   4c 8b 3d 00 00 00 00    mov    0x0(%rip),%r15        # 56f27
<console_print+0x3e>

   56f27:   eb 07                   jmp    56f30 <console_print+0x47>

   56f29:   4c 8b 3d 00 00 00 00    mov    0x0(%rip),%r15        # 56f30
<console_print+0x47>

   56f30:   4d 85 f6                test   %r14,%r14

   56f33:   74 19                   je     56f4e <console_print+0x65>

   56f35:   41 80 7e 30 00          cmpb   $0x0,0x30(%r14)

   56f3a:   74 12                   je     56f4e <console_print+0x65>

   56f3c:   44 89 e2                mov    %r12d,%edx

   56f3f:   4c 89 f7                mov    %r14,%rdi

   56f42:   41 ff d7                callq  *%r15

   56f45:   48 8b 65 c0             mov    -0x40(%rbp),%rsp

   56f49:   e9 84 00 00 00          jmpq   56fd2 <console_print+0xe9>

   56f4e:   4d 63 ec                movslq %r12d,%r13

   56f51:   4c 89 ea                mov    %r13,%rdx

   56f54:   48 89 df                mov    %rbx,%rdi

   56f57:   e8 00 00 00 00          callq  56f5c <console_print+0x73>

   56f5c:   4a 8d 44 2b ff          lea    -0x1(%rbx,%r13,1),%rax

   56f61:   48 39 c3                cmp    %rax,%rbx

   56f64:   73 4b                   jae    56fb1 <console_print+0xc8>

   56f66:   48 89 de                mov    %rbx,%rsi

   56f69:   80 3b 0a                cmpb   $0xa,(%rbx)

   56f6c:   75 30                   jne    56f9e <console_print+0xb5>

   56f6e:   c6 03 0d                movb   $0xd,(%rbx)

   56f71:   0f b6 43 01             movzbl 0x1(%rbx),%eax

   56f75:   88 45 cf                mov    %al,-0x31(%rbp)

   56f78:   c6 43 01 0a             movb   $0xa,0x1(%rbx)

   56f7c:   49 89 dd                mov    %rbx,%r13

   56f7f:   49 29 f5                sub    %rsi,%r13

   56f82:   41 8d 55 02             lea    0x2(%r13),%edx

   56f86:   4c 89 f7                mov    %r14,%rdi

   56f89:   41 ff d7                callq  *%r15

   56f8c:   0f b6 45 cf             movzbl -0x31(%rbp),%eax

   56f90:   88 43 01                mov    %al,0x1(%rbx)

   56f93:   48 8d 73 01             lea    0x1(%rbx),%rsi

   56f97:   41 83 c5 01             add    $0x1,%r13d

   56f9b:   45 29 ec                sub    %r13d,%r12d

   56f9e:   48 83 c3 01             add    $0x1,%rbx

   56fa2:   4d 63 ec                movslq %r12d,%r13

   56fa5:   4a 8d 44 2e ff          lea    -0x1(%rsi,%r13,1),%rax

   56faa:   48 39 d8                cmp    %rbx,%rax

   56fad:   77 ba                   ja     56f69 <console_print+0x80>

   56faf:   eb 03                   jmp    56fb4 <console_print+0xcb>

   56fb1:   48 89 de                mov    %rbx,%rsi

   56fb4:   80 38 0a                cmpb   $0xa,(%rax)

   56fb7:   75 0c                   jne    56fc5 <console_print+0xdc>

   56fb9:   c6 00 0d                movb   $0xd,(%rax)

   56fbc:   42 c6 04 2e 0a          movb   $0xa,(%rsi,%r13,1)

   56fc1:   41 83 c4 01             add    $0x1,%r12d

   56fc5:   44 89 e2                mov    %r12d,%edx

   56fc8:   4c 89 f7                mov    %r14,%rdi

   *56fcb:   41 ff d7                callq  *%r15*

   56fce:   48 8b 65 c0             mov    -0x40(%rbp),%rsp

   56fd2:   48 8d 65 d8             lea    -0x28(%rbp),%rsp

   56fd6:   5b                      pop    %rbx

   56fd7:   41 5c                   pop    %r12

   56fd9:   41 5d                pop    %r13

   56fdb:   41 5e                   pop    %r14

   56fdd:   41 5f                   pop    %r15

   56fdf:   5d                      pop    %rbp

   56fe0:   c3                      retq





I added the options =E2=80=93fno-pic to TARGET_CFLAGS and TARGET_CPPFLAGS a=
nd
=E2=80=93no-pie to TARGET_LDFLAGS and recompile the kernel. Now, the kernel=
 carshed
at instruction 0x673bb in the run_idle_thread function:



00000000000673ac <run_idle_thread>:

   673ac:   55                      push   %rbp

   673ad:   48 89 e5                mov    %rsp,%rbp

   673b0:   48 8b 05 00 00 00 00    mov    0x0(%rip),%rax        # 673b7
<run_idle_thread+0xb>

   673b7:   48 8b 60 10             mov    0x10(%rax),%rsp

   673bb:   ff 70 18                pushq  0x18(%rax)

   673be:   c3                      retq

   673bf:   5d                      pop    %rbp

   673c0:   c3                      retq





Finally, just to try I commented out the run_idle_thread function and the
kernel crashed at the very beginning at 0x63. The kern dump in this case
points to the stack:



      5e:   e8 00 00 00 00          callq  63 <stack_start>



0000000000000063 <stack_start>:

    ...

      6b:   90                      nop

      6c:   90                      nop

      6d:   90                      nop





I am not familiar with the XTF relocalability code. Any pointer or
suggestion at this point would be again appreciated.



Thanks,

Bruno

On Thu, Dec 28, 2017 at 7:18 PM, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 28/12/17 18:33, Bruno Alvisio wrote:
>
> (d360) Bootstrapping...
>
> (XEN) Dom360 callback via changed to Direct Vector 0x20
>
> (d360) Xen Minimal OS (hvm)!
>
> (XEN) d360v0 Triple fault - invoking HVM shutdown action 1
>
> (XEN) *** Dumping Dom360 vcpu#0 state: ***
>
> (XEN) ----[ Xen-4.10.0-rc  x86_64  debug=3Dy   Not tainted ]----
>
> (XEN) CPU:    7
>
> (XEN) RIP:    0008:[<0000000000056fc8>]
>
> (XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d360v0)
>
> (XEN) rax: 00000000000bfe75   rbx: 00000000000bfe75   rcx:
> 0000000000000000
>
> (XEN) rdx: 0000000000000017   rsi: 00000000000bfe60   rdi:
> 0000000000000000
>
> (XEN) rbp: 00000000000bfec0   rsp: 00000000000bfe60   r8:
> 0000000000000000
>
> (XEN) r9:  0000000000089982   r10: 0000000000000016   r11:
> 0000000000000000
>
> (XEN) r12: 0000000000000017   r13: 0000000000000016   r14:
> 0000000000000000
>
> (XEN) r15: 0d8b4c1575ff8548   cr0: 0000000080000011   cr4:
> 0000000000000220
>
> (XEN) cr3: 0000000000099000   cr2: 0000000000000000
>
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
> 0000000000000000
>
> (XEN) ds: 0033   es: 0033   fs: 0033   gs: 0033   ss: 0000   cs: 0008
>
>
>
>
>
> Any help on this would be greatly appreciated.
>
>
> You will need to disassemble your minios kernel and see which instruction
> is at 0x56fc8.  (Chances are, it will be `jmp %r15`).
>
> The content of %r15 looks like x86 opcode, which is reminiscent of the XT=
F
> relocatability bugs.  Make doubly sure you are compiling with -fno-pic an=
d
> link with -no-pie.
>
> ~Andrew
>

--001a1147e4e8d5d7eb05616f29dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
















<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">Hello Andrew,</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">=C2=A0</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">Thanks. Yup,
you were right. I did an objdump of the kernel and found the offending inst=
ruction
0x5cfcb to be callq *%r15 in the console_print function (see below):<span><=
/span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">=C2=A0</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">0000000000056ee9 &lt;=
console_print&gt;:</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56ee9: =
=C2=A0 55=C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push =C2=A0 =
%rbp<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56eea: =
=C2=A0 48 89 e5=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rsp,%rbp=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56eed: =
=C2=A0 41 57 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push =C2=A0 %r15<sp=
an></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56eef: =
=C2=A0 41 56 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push =C2=A0 %r14<sp=
an></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56ef1: =
=C2=A0 41 55 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push =C2=A0 %r13<sp=
an></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56ef3: =
=C2=A0 41 54 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push =C2=A0 %r12<sp=
an></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56ef5: =
=C2=A0 53=C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push =C2=A0 =
%rbx<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56ef6: =
=C2=A0 48 83 ec 18 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sub=C2=A0 =C2=A0 $0x18,%rsp<span></span>=
</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56efa: =
=C2=A0 49 89 fe=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rdi,%r14=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56efd: =
=C2=A0 41 89 d4=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %edx,%r12=
d<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f00: =
=C2=A0 48 89 65 c0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rsp,-0x40(%rbp)<span><=
/span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f04: =
=C2=A0 8d 42 01=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lea=C2=A0 =C2=A0
0x1(%rdx),%eax<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f07: =
=C2=A0 48 98 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cltq=C2=A0 =C2=A0<s=
pan></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f09: =
=C2=A0 48 83 c0 0f =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add=C2=A0 =C2=A0 $0xf,%rax<span></span><=
/span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f0d: =
=C2=A0 48 83 e0 f0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and=C2=A0 =C2=A0 $0xfffffffffffffff0,%ra=
x<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f11: =
=C2=A0 48 29 c4=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sub=C2=A0 =C2=A0 %rax,%rsp=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f14: =
=C2=A0 48 89 e3=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rsp,%rbx=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f17: =
=C2=A0 83 3d 00 00 00 00
00=C2=A0 =C2=A0 cmpl =C2=A0 $0x0,0x0(%rip)=C2=A0 =C2=A0 =C2=A0 =C2=A0 # 56f=
1e
&lt;console_print+0x35&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f1e: =
=C2=A0 74 09 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 je =C2=A0 =C2=A0 56=
f29
&lt;console_print+0x40&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f20: =
=C2=A0 4c 8b 3d 00 00 00
00=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 0x0(%rip),%r15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
#
56f27 &lt;console_print+0x3e&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f27: =
=C2=A0 eb 07 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 56=
f30
&lt;console_print+0x47&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f29: =
=C2=A0 4c 8b 3d 00 00 00
00=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 0x0(%rip),%r15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
#
56f30 &lt;console_print+0x47&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f30: =
=C2=A0 4d 85 f6=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test =C2=A0 %r14,%r14<span=
></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f33: =
=C2=A0 74 19 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 je =C2=A0 =C2=A0 56=
f4e
&lt;console_print+0x65&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f35: =
=C2=A0 41 80 7e 30 00=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmpb =C2=A0 $0x0,0x30(%r14)<span></span></span>=
</p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f3a: =
=C2=A0 74 12 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 je =C2=A0 =C2=A0 56=
f4e
&lt;console_print+0x65&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f3c: =
=C2=A0 44 89 e2=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %r12d,%ed=
x<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f3f: =
=C2=A0 4c 89 f7=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %r14,%rdi=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f42: =
=C2=A0 41 ff d7=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callq=C2=A0 *%r15<span></s=
pan></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f45: =
=C2=A0 48 8b 65 c0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 -0x40(%rbp),%rsp<span><=
/span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f49: =
=C2=A0 e9 84 00 00
00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jmpq =C2=A0 56fd2
&lt;console_print+0xe9&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f4e: =
=C2=A0 4d 63 ec=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movslq %r12d,%r13<span></s=
pan></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f51: =
=C2=A0 4c 89 ea=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %r13,%rdx=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f54: =
=C2=A0 48 89 df=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rbx,%rdi=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f57: =
=C2=A0 e8 00 00 00
00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callq=C2=A0 56f5c
&lt;console_print+0x73&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f5c: =
=C2=A0 4a 8d 44 2b
ff=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lea=C2=A0 =C2=A0 -0x1(%rbx,%r13,1),%ra=
x<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f61: =
=C2=A0 48 39 c3=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 %rax,%rbx=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f64: =
=C2=A0 73 4b =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jae=C2=A0 =C2=A0 56=
fb1
&lt;console_print+0xc8&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 =C2=A056f66: =
=C2=A0 48 89 de=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rbx,%rsi=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f69: =
=C2=A0 80 3b 0a=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmpb =C2=A0 $0xa,(%rbx)<sp=
an></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f6c: =
=C2=A0 75 30 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jne=C2=A0 =C2=A0 56=
f9e
&lt;console_print+0xb5&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f6e: =
=C2=A0 c6 03 0d=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movb =C2=A0 $0xd,(%rbx)<sp=
an></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f71: =
=C2=A0 0f b6 43 01 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movzbl 0x1(%rbx),%eax<span></span></span=
></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f75: =
=C2=A0 88 45 cf=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0
%al,-0x31(%rbp)<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f78: =
=C2=A0 c6 43 01 0a =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movb =C2=A0 $0xa,0x1(%rbx)<span></span><=
/span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f7c: =
=C2=A0 49 89 dd=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rbx,%r13=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f7f: =
=C2=A0 49 29 f5=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sub=C2=A0 =C2=A0 %rsi,%r13=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f82: =
=C2=A0 41 8d 55 02 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lea=C2=A0 =C2=A0 0x2(%r13),%edx<span></s=
pan></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f86: =
=C2=A0 4c 89 f7=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %r14,%rdi=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f89: =
=C2=A0 41 ff d7=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callq=C2=A0 *%r15<span></s=
pan></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f8c: =
=C2=A0 0f b6 45 cf =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movzbl -0x31(%rbp),%eax<span></span></sp=
an></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f90: =
=C2=A0 88 43 01=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %al,0x1(%=
rbx)<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f93: =
=C2=A0 48 8d 73 01 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lea=C2=A0 =C2=A0 0x1(%rbx),%rsi<span></s=
pan></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f97: =
=C2=A0 41 83 c5 01 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add=C2=A0 =C2=A0 $0x1,%r13d<span></span>=
</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f9b: =
=C2=A0 45 29 ec=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sub=C2=A0 =C2=A0 %r13d,%r1=
2d<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56f9e: =
=C2=A0 48 83 c3 01 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add=C2=A0 =C2=A0 $0x1,%rbx<span></span><=
/span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fa2: =
=C2=A0 4d 63 ec=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movslq %r12d,%r13<span></s=
pan></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fa5: =
=C2=A0 4a 8d 44 2e
ff=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lea=C2=A0 =C2=A0 -0x1(%rsi,%r13,1),%ra=
x<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56faa: =
=C2=A0 48 39 d8=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 %rbx,%rax=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fad: =
=C2=A0 77 ba =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ja =C2=A0 =C2=A0 56=
f69
&lt;console_print+0x80&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56faf: =
=C2=A0 eb 03 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 56=
fb4
&lt;console_print+0xcb&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fb1: =
=C2=A0 48 89 de=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rbx,%rsi=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fb4: =
=C2=A0 80 38 0a=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmpb =C2=A0 $0xa,(%rax)<sp=
an></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fb7: =
=C2=A0 75 0c =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jne=C2=A0 =C2=A0 56=
fc5 &lt;console_print+0xdc&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fb9: =
=C2=A0 c6 00 0d=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movb =C2=A0 $0xd,(%rax)<sp=
an></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fbc: =
=C2=A0 42 c6 04 2e
0a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movb =C2=A0 $0xa,(%rsi,%r13,1)<span></=
span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fc1: =
=C2=A0 41 83 c4 01 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add=C2=A0 =C2=A0 $0x1,%r12d<span></span>=
</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fc5: =
=C2=A0 44 89 e2=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %r12d,%ed=
x<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fc8: =
=C2=A0 4c 89 f7=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %r14,%rdi=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 <b><font=
 size=3D"4">56fcb: =C2=A0 41 ff d7=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callq=C2=A0 *%r15</font></=
b><span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fce: =
=C2=A0 48 8b 65 c0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 -0x40(%rbp),%rsp<span><=
/span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fd2: =
=C2=A0 48 8d 65 d8 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lea=C2=A0 =C2=A0 -0x28(%rbp),%rsp<span><=
/span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fd6: =
=C2=A0 5b=C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =
=C2=A0
%rbx<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 =C2=A056fd7: =
=C2=A0 41 5c =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 %r=
12<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fd9: =
=C2=A0 41 5d =C2=A0=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 %r13<span></span=
></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fdb: =
=C2=A0 41 5e =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 %r=
14<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fdd: =
=C2=A0 41 5f =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 %r=
15<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fdf: =
=C2=A0 5d=C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =
=C2=A0
%rbp<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 56fe0: =
=C2=A0 c3=C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retq<span></=
span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black"><span>=C2=A0</span></=
span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black"><span>=C2=A0</span></=
span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">I added the options =E2=80=93fno-pic to=
 TARGET_CFLAGS and
TARGET_CPPFLAGS and =E2=80=93no-pie to TARGET_LDFLAGS and recompile the ker=
nel. Now,
the kernel carshed at instruction 0x673bb in the run_idle_thread function:<=
span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black"><span>=C2=A0</span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">00000000000673ac &lt;=
run_idle_thread&gt;:<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 673ac: =
=C2=A0 55=C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push =C2=A0 =
%rbp<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 673ad: =
=C2=A0 48 89 e5=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rsp,%rbp=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 673b0: =
=C2=A0 48 8b 05 00 00 00
00=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 0x0(%rip),%rax=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
#
673b7 &lt;run_idle_thread+0xb&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 673b7: =
=C2=A0 48 8b 60 10 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 0x10(%rax),%rsp<span></=
span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 673bb: =
=C2=A0 ff 70 18=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pushq=C2=A0 0x18(%rax)<spa=
n></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 673be: =
=C2=A0 c3=C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retq<span></=
span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 673bf: =
=C2=A0 5d=C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =
=C2=A0
%rbp<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0 673c0: =
=C2=A0 c3=C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span =
style=3D"font-family:&quot;Helvetica Neue&quot;;color:black"> retq<span></s=
pan></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black"><span>=C2=A0</span></=
span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black"><span>=C2=A0</span></=
span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">Finally, just to try I commented out th=
e run_idle_thread
function and the kernel crashed at the very beginning at 0x63. The kern dum=
p in
this case points to the stack:<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black"><span>=C2=A0</span></=
span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
5e:=C2=A0=C2=A0 e8 00 00 00 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 callq=C2=A0
63 &lt;stack_start&gt;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black"><span>=C2=A0</span></=
span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">0000000000000063 &lt;=
stack_start&gt;:<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0=C2=A0 ..=
.<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
6b:=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nop<s=
pan></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
6c:=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nop<s=
pan></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
6d:=C2=A0=C2=A0 90=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nop<s=
pan></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black"><span>=C2=A0</span></=
span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black"><span>=C2=A0</span></=
span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">I am not familiar with the XTF relocala=
bility code. Any
pointer or suggestion at this point would be again appreciated.<span></span=
></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">=C2=A0</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">Thanks,<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"color:black">Bruno<span style=3D"font-size:12pt"></s=
pan></span></p>

</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Dec=
 28, 2017 at 7:18 PM, Andrew Cooper <span dir=3D"ltr">&lt;<a href=3D"mailto=
:andrew.cooper3@citrix.com" target=3D"_blank">andrew.cooper3@citrix.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <div class=3D"m_8649405049459884912moz-cite-prefix">On 28/12/17 18:33, =
Bruno Alvisio wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><font size=3D"1"><span style=3D"font-family:Menlo;co=
lor:black">(d360)
            Bootstrapping...</span></font>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) Dom360
              callback via
              changed to Direct Vector 0x20</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(d360) Xen Minimal
              OS
              (hvm)!</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) d360v0 Triple
              fault -
              invoking HVM shutdown action 1</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) *** Dumping
              Dom360
              vcpu#0 state: ***</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) ----[
              Xen-4.10.0-rc<span>=C2=A0 </span>x86_64<span>=C2=A0 </span>de=
bug=3Dy<span>=C2=A0=C2=A0
              </span>Not tainted ]----</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) CPU:<span>=C2=A0=C2=A0=C2=A0
              </span>7</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) RIP:<span>=C2=A0=C2=A0=C2=A0
              </span>0008:[&lt;0000000000056fc8&gt;]</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) RFLAGS:
              0000000000010006<span>=C2=A0=C2=A0 </span>CONTEXT: hvm guest
              (d360v0)</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) rax:
              00000000000bfe75<span>=C2=A0=C2=A0 </span>rbx:
              00000000000bfe75<span>=C2=A0=C2=A0 </span>rcx: 00000000000000=
00</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) rdx:
              0000000000000017<span>=C2=A0=C2=A0 </span>rsi:
              00000000000bfe60<span>=C2=A0=C2=A0 </span>rdi: 00000000000000=
00</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) rbp:
              00000000000bfec0<span>=C2=A0=C2=A0 </span>rsp:
              00000000000bfe60<span>=C2=A0=C2=A0 </span>r8:<span>=C2=A0 </s=
pan>0000000000000000</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) r9:<span>=C2=A0 </span>0000000000089982<span=
>=C2=A0
              </span><span>=C2=A0</span>r10:
              0000000000000016<span>=C2=A0=C2=A0 </span>r11: 00000000000000=
00</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) r12:
              0000000000000017<span>=C2=A0=C2=A0 </span>r13:
              0000000000000016<span>=C2=A0=C2=A0 </span>r14: 00000000000000=
00</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) r15:
              0d8b4c1575ff8548<span>=C2=A0=C2=A0 </span>cr0:
              0000000080000011<span>=C2=A0=C2=A0 </span>cr4: 00000000000002=
20</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) cr3:
              0000000000099000<span>=C2=A0=C2=A0 </span>cr2: 00000000000000=
00</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) fsb:
              0000000000000000<span>=C2=A0=C2=A0 </span>gsb:
              0000000000000000<span>=C2=A0=C2=A0 </span>gss: 00000000000000=
00</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">(XEN) ds: 0033<span>=C2=A0=C2=A0
              </span>es: 0033<span>=C2=A0=C2=A0 </span>fs: 0033<span>=C2=A0=
=C2=A0 </span>gs:
              0033<span>=C2=A0=C2=A0
              </span>ss: 0000<span>=C2=A0=C2=A0 </span>cs: 0008</span></fon=
t></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-f=
amily:Menlo;color:black">=C2=A0</span></font></p>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt"><span style=3D"font-family:arial,helvetica,sans-serif"><fo=
nt size=3D"1"><span style=3D"color:black">=C2=A0</span></font></span></p>
        <span style=3D"font-family:arial,helvetica,sans-serif">
        </span>
        <p class=3D"m_8649405049459884912gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt"><font size=3D"2"><span style=3D"font-family:arial,helvetic=
a,sans-serif"><span style=3D"color:black">Any help on this would be greatly
                appreciated.</span></span></font></p>
      </div>
    </blockquote>
    <br></span>
    You will need to disassemble your minios kernel and see which
    instruction is at 0x56fc8.=C2=A0 (Chances are, it will be `jmp %r15`).<=
br>
    <br>
    The content of %r15 looks like x86 opcode, which is reminiscent of
    the XTF relocatability bugs.=C2=A0 Make doubly sure you are compiling
    with -fno-pic and link with -no-pie.<span class=3D"HOEnZb"><font color=
=3D"#888888"><br>
    <br>
    ~Andrew<br>
  </font></span></div>

</blockquote></div><br></div>

--001a1147e4e8d5d7eb05616f29dc--


--===============3366299736229284051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3366299736229284051==--
