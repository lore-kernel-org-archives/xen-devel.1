From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Building PVH mini-os with libc support
Date: Fri, 29 Dec 2017 00:25:07 +0000
Message-ID: <0a9e3f23-68bc-5083-415e-af0804cb0b4c@citrix.com>
References: <CADNMjEDCKZoeKQ5bEwJo0okmCgm-Jn0OgbP85+qfc1YJfUinfw@mail.gmail.com>
 <16766c4e-bf23-6f7a-9c76-03bd14f87408@citrix.com>
 <CADNMjEDkHZ8KirBFusinr1c9XE0dF-QYhb1R4c4yXjwW4e2g5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0970426563742386509=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=34w6=dz=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1eUiUG-00026n-C8
 for xen-devel@lists.xenproject.org; Fri, 29 Dec 2017 00:25:24 +0000
In-Reply-To: <CADNMjEDkHZ8KirBFusinr1c9XE0dF-QYhb1R4c4yXjwW4e2g5g@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bruno Alvisio <bruno.alvisio@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============0970426563742386509==
Content-Type: multipart/alternative;
 boundary="------------4B58D3AD3A735459AC6B602F"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------4B58D3AD3A735459AC6B602F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 28/12/2017 23:49, Bruno Alvisio wrote:
>
> Hello Andrew,
>
>  
>
> Thanks. Yup, you were right. I did an objdump of the kernel and found
> the offending instruction 0x5cfcb to be callq *%r15 in the
> console_print function (see below):
>

Answering out of order...

> I am not familiar with the XTF relocalability code. Any pointer or
> suggestion at this point would be again appreciated.
>

XTF is the Xen Test Framework, a microkernel project for testing purposes.

http://xenbits.xen.org/gitweb/?p=xtf.git;a=summary
http://xenbits.xen.org/docs/xtf/

Amongst other things, it runs as a set of regression tests for all new
code introduced into upstream Xen.

All I meant by that statement was "I recall bugs like this", which is
why I made the blind guess at your offending opcode being `jmp *%r15`.

>  
>
> 0000000000056ee9 <console_print>:
>
>    56ee9:   55                      push   %rbp
>
>    56eea:   48 89 e5                mov    %rsp,%rbp
>
>    56eed:   41 57                   push   %r15
>
>    56eef:   41 56                   push   %r14
>
>    56ef1:   41 55                   push   %r13
>
>    56ef3:   41 54                   push   %r12
>
>    56ef5:   53                      push   %rbx
>
>    56ef6:   48 83 ec 18             sub    $0x18,%rsp
>
>    56efa:   49 89 fe                mov    %rdi,%r14
>
>    56efd:   41 89 d4                mov    %edx,%r12d
>
>    56f00:   48 89 65 c0             mov    %rsp,-0x40(%rbp)
>
>    56f04:   8d 42 01                lea    0x1(%rdx),%eax
>
>    56f07:   48 98                   cltq   
>
>    56f09:   48 83 c0 0f             add    $0xf,%rax
>
>    56f0d:   48 83 e0 f0             and    $0xfffffffffffffff0,%rax
>
>    56f11:   48 29 c4                sub    %rax,%rsp
>
>    56f14:   48 89 e3                mov    %rsp,%rbx
>
>    56f17:   83 3d 00 00 00 00 00    cmpl   $0x0,0x0(%rip)        #
> 56f1e <console_print+0x35>
>
>    56f1e:   74 09                   je     56f29 <console_print+0x40>
>
>    56f20:   4c 8b 3d 00 00 00 00    mov    0x0(%rip),%r15        #
> 56f27 <console_print+0x3e>
>
>    56f27:   eb 07                   jmp    56f30 <console_print+0x47>
>
>    56f29:   4c 8b 3d 00 00 00 00    mov    0x0(%rip),%r15        #
> 56f30 <console_print+0x47>
>
>    56f30:   4d 85 f6                test   %r14,%r14
>
>    56f33:   74 19                   je     56f4e <console_print+0x65>
>
>    56f35:   41 80 7e 30 00          cmpb   $0x0,0x30(%r14)
>
>    56f3a:   74 12                   je     56f4e <console_print+0x65>
>
>    56f3c:   44 89 e2                mov    %r12d,%edx
>
>    56f3f:   4c 89 f7                mov    %r14,%rdi
>
>    56f42:   41 ff d7                callq  *%r15
>
>    56f45:   48 8b 65 c0             mov    -0x40(%rbp),%rsp
>
>    56f49:   e9 84 00 00 00          jmpq   56fd2 <console_print+0xe9>
>
>    56f4e:   4d 63 ec                movslq %r12d,%r13
>
>    56f51:   4c 89 ea                mov    %r13,%rdx
>
>    56f54:   48 89 df                mov    %rbx,%rdi
>
>    56f57:   e8 00 00 00 00          callq  56f5c <console_print+0x73>
>
>    56f5c:   4a 8d 44 2b ff          lea    -0x1(%rbx,%r13,1),%rax
>
>    56f61:   48 39 c3                cmp    %rax,%rbx
>
>    56f64:   73 4b                   jae    56fb1 <console_print+0xc8>
>
>    56f66:   48 89 de                mov    %rbx,%rsi
>
>    56f69:   80 3b 0a                cmpb   $0xa,(%rbx)
>
>    56f6c:   75 30                   jne    56f9e <console_print+0xb5>
>
>    56f6e:   c6 03 0d                movb   $0xd,(%rbx)
>
>    56f71:   0f b6 43 01             movzbl 0x1(%rbx),%eax
>
>    56f75:   88 45 cf                mov    %al,-0x31(%rbp)
>
>    56f78:   c6 43 01 0a             movb   $0xa,0x1(%rbx)
>
>    56f7c:   49 89 dd                mov    %rbx,%r13
>
>    56f7f:   49 29 f5                sub    %rsi,%r13
>
>    56f82:   41 8d 55 02             lea    0x2(%r13),%edx
>
>    56f86:   4c 89 f7                mov    %r14,%rdi
>
>    56f89:   41 ff d7                callq  *%r15
>
>    56f8c:   0f b6 45 cf             movzbl -0x31(%rbp),%eax
>
>    56f90:   88 43 01                mov    %al,0x1(%rbx)
>
>    56f93:   48 8d 73 01             lea    0x1(%rbx),%rsi
>
>    56f97:   41 83 c5 01             add    $0x1,%r13d
>
>    56f9b:   45 29 ec                sub    %r13d,%r12d
>
>    56f9e:   48 83 c3 01             add    $0x1,%rbx
>
>    56fa2:   4d 63 ec                movslq %r12d,%r13
>
>    56fa5:   4a 8d 44 2e ff          lea    -0x1(%rsi,%r13,1),%rax
>
>    56faa:   48 39 d8                cmp    %rbx,%rax
>
>    56fad:   77 ba                   ja     56f69 <console_print+0x80>
>
>    56faf:   eb 03                   jmp    56fb4 <console_print+0xcb>
>
>    56fb1:   48 89 de                mov    %rbx,%rsi
>
>    56fb4:   80 38 0a                cmpb   $0xa,(%rax)
>
>    56fb7:   75 0c                   jne    56fc5 <console_print+0xdc>
>
>    56fb9:   c6 00 0d                movb   $0xd,(%rax)
>
>    56fbc:   42 c6 04 2e 0a          movb   $0xa,(%rsi,%r13,1)
>
>    56fc1:   41 83 c4 01             add    $0x1,%r12d
>
>    56fc5:   44 89 e2                mov    %r12d,%edx
>
>    56fc8:   4c 89 f7                mov    %r14,%rdi
>
>    *56fcb:   41 ff d7                callq  *%r15*
>
>    56fce:   48 8b 65 c0             mov    -0x40(%rbp),%rsp
>
>    56fd2:   48 8d 65 d8             lea    -0x28(%rbp),%rsp
>
>    56fd6:   5b                      pop    %rbx
>
>    56fd7:   41 5c                   pop    %r12
>
>    56fd9:   41 5d                pop    %r13
>
>    56fdb:   41 5e                   pop    %r14
>
>    56fdd:   41 5f                   pop    %r15
>
>    56fdf:   5d                      pop    %rbp
>
>    56fe0:   c3                      retq
>
>  
>
>  
>
> I added the options –fno-pic to TARGET_CFLAGS and TARGET_CPPFLAGS and
> –no-pie to TARGET_LDFLAGS and recompile the kernel. Now, the kernel
> carshed at instruction 0x673bb in the run_idle_thread function:
>
>  
>
> 00000000000673ac <run_idle_thread>:
>
>    673ac:   55                      push   %rbp
>
>    673ad:   48 89 e5                mov    %rsp,%rbp
>
>    673b0:   48 8b 05 00 00 00 00    mov    0x0(%rip),%rax        #
> 673b7 <run_idle_thread+0xb>
>
>    673b7:   48 8b 60 10             mov    0x10(%rax),%rsp
>
>    673bb:   ff 70 18                pushq  0x18(%rax)
>
>    673be:   c3                      retq
>
>    673bf:   5d                      pop    %rbp
>
>    673c0:   c3                     retq
>
>  
>
>  
>
> Finally, just to try I commented out the run_idle_thread function and
> the kernel crashed at the very beginning at 0x63. The kern dump in
> this case points to the stack:
>
>  
>
>       5e:   e8 00 00 00 00          callq  63 <stack_start>
>

Both the above mov instruction at 0x673b0 and this call instruction with
a 4-byte displacement of 0 look suspiciously like they are waiting for
relocation, as displacements of 0 are exceedingly rare (there are more
efficient ways to encode such operands).

Therefore, I don't think you've succeeded in preventing your binary from
being relocatable.

~Andrew

>  
>
> 0000000000000063 <stack_start>:
>
>     ...
>
>       6b:   90                      nop
>
>       6c:   90                      nop
>
>       6d:   90                      nop
>
>  
>
>  
>
> Thanks,
>
> Bruno
>
>
> On Thu, Dec 28, 2017 at 7:18 PM, Andrew Cooper
> <andrew.cooper3@citrix.com <mailto:andrew.cooper3@citrix.com>> wrote:
>
>     On 28/12/17 18:33, Bruno Alvisio wrote:
>>     (d360) Bootstrapping...
>>
>>     (XEN) Dom360 callback via changed to Direct Vector 0x20
>>
>>     (d360) Xen Minimal OS (hvm)!
>>
>>     (XEN) d360v0 Triple fault - invoking HVM shutdown action 1
>>
>>     (XEN) *** Dumping Dom360 vcpu#0 state: ***
>>
>>     (XEN) ----[ Xen-4.10.0-rc  x86_64  debug=y   Not tainted ]----
>>
>>     (XEN) CPU:    7
>>
>>     (XEN) RIP:    0008:[<0000000000056fc8>]
>>
>>     (XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d360v0)
>>
>>     (XEN) rax: 00000000000bfe75   rbx: 00000000000bfe75   rcx:
>>     0000000000000000
>>
>>     (XEN) rdx: 0000000000000017   rsi: 00000000000bfe60   rdi:
>>     0000000000000000
>>
>>     (XEN) rbp: 00000000000bfec0   rsp: 00000000000bfe60   r8: 
>>     0000000000000000
>>
>>     (XEN) r9:  0000000000089982   r10: 0000000000000016   r11:
>>     0000000000000000
>>
>>     (XEN) r12: 0000000000000017   r13: 0000000000000016   r14:
>>     0000000000000000
>>
>>     (XEN) r15: 0d8b4c1575ff8548   cr0: 0000000080000011   cr4:
>>     0000000000000220
>>
>>     (XEN) cr3: 0000000000099000   cr2: 0000000000000000
>>
>>     (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
>>     0000000000000000
>>
>>     (XEN) ds: 0033   es: 0033   fs: 0033   gs: 0033   ss: 0000   cs: 0008
>>
>>      
>>
>>      
>>
>>     Any help on this would be greatly appreciated.
>>
>
>     You will need to disassemble your minios kernel and see which
>     instruction is at 0x56fc8.  (Chances are, it will be `jmp %r15`).
>
>     The content of %r15 looks like x86 opcode, which is reminiscent of
>     the XTF relocatability bugs.  Make doubly sure you are compiling
>     with -fno-pic and link with -no-pie.
>
>     ~Andrew
>
>


--------------4B58D3AD3A735459AC6B602F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 28/12/2017 23:49, Bruno Alvisio
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADNMjEDkHZ8KirBFusinr1c9XE0dF-QYhb1R4c4yXjwW4e2g5g@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black">Hello
            Andrew,</span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black"> </span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black">Thanks.
            Yup,
            you were right. I did an objdump of the kernel and found the
            offending instruction
            0x5cfcb to be callq *%r15 in the console_print function (see
            below):</span></p>
      </div>
    </blockquote>
    <br>
    Answering out of order...<br>
    <br>
    <blockquote type="cite"><span style="font-family:Menlo;color:black"><span></span></span>
      <p class="gmail-MsoNormal" style="margin:0in 0in
        0.0001pt;font-family:Calibri"><span style="color:black">I am not
          familiar with the XTF relocalability code. Any
          pointer or suggestion at this point would be again
          appreciated.<span></span></span></p>
    </blockquote>
    <br>
    XTF is the Xen Test Framework, a microkernel project for testing
    purposes.<br>
    <br>
    <a class="moz-txt-link-freetext" href="http://xenbits.xen.org/gitweb/?p=xtf.git;a=summary">http://xenbits.xen.org/gitweb/?p=xtf.git;a=summary</a><br>
    <a class="moz-txt-link-freetext" href="http://xenbits.xen.org/docs/xtf/">http://xenbits.xen.org/docs/xtf/</a><br>
    <br>
    Amongst other things, it runs as a set of regression tests for all
    new code introduced into upstream Xen.<br>
    <br>
    All I meant by that statement was "I recall bugs like this", which
    is why I made the blind guess at your offending opcode being `jmp
    *%r15`.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADNMjEDkHZ8KirBFusinr1c9XE0dF-QYhb1R4c4yXjwW4e2g5g@mail.gmail.com">
      <div dir="ltr">
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black"><span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black"> </span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">0000000000056ee9
            &lt;console_print&gt;:</span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56ee9:   55   
                              push   %rbp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56eea:   48 89 e5 
                          mov    %rsp,%rbp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56eed:   41 57  
                            push   %r15<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56eef:   41 56  
                            push   %r14<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56ef1:   41 55  
                            push   %r13<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56ef3:   41 54  
                            push   %r12<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56ef5:   53   
                              push   %rbx<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56ef6:   48 83 ec
            18  
                      sub    $0x18,%rsp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56efa:   49 89 fe 
                          mov    %rdi,%r14<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56efd:   41 89 d4 
                          mov    %edx,%r12d<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f00:   48 89 65
            c0  
                      mov    %rsp,-0x40(%rbp)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f04:   8d 42 01 
                          lea   
            0x1(%rdx),%eax<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f07:   48 98  
                            cltq   <span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f09:   48 83 c0
            0f  
                      add    $0xf,%rax<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f0d:   48 83 e0
            f0  
                      and    $0xfffffffffffffff0,%rax<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f11:   48 29 c4 
                          sub    %rax,%rsp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f14:   48 89 e3 
                          mov    %rsp,%rbx<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f17:   83 3d 00
            00 00 00
            00    cmpl   $0x0,0x0(%rip)        # 56f1e
            &lt;console_print+0x35&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f1e:   74 09  
                            je     56f29
            &lt;console_print+0x40&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f20:   4c 8b 3d
            00 00 00
            00    mov    0x0(%rip),%r15        #
            56f27 &lt;console_print+0x3e&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f27:   eb 07  
                            jmp    56f30
            &lt;console_print+0x47&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f29:   4c 8b 3d
            00 00 00
            00    mov    0x0(%rip),%r15        #
            56f30 &lt;console_print+0x47&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f30:   4d 85 f6 
                          test   %r14,%r14<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f33:   74 19  
                            je     56f4e
            &lt;console_print+0x65&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f35:   41 80 7e
            30 00 
                    cmpb   $0x0,0x30(%r14)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f3a:   74 12  
                            je     56f4e
            &lt;console_print+0x65&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f3c:   44 89 e2 
                          mov    %r12d,%edx<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f3f:   4c 89 f7 
                          mov    %r14,%rdi<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f42:   41 ff d7 
                          callq  *%r15<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f45:   48 8b 65
            c0  
                      mov    -0x40(%rbp),%rsp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f49:   e9 84 00
            00
            00          jmpq   56fd2
            &lt;console_print+0xe9&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f4e:   4d 63 ec 
                          movslq %r12d,%r13<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f51:   4c 89 ea 
                          mov    %r13,%rdx<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f54:   48 89 df 
                          mov    %rbx,%rdi<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f57:   e8 00 00
            00
            00          callq  56f5c
            &lt;console_print+0x73&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f5c:   4a 8d 44
            2b
            ff          lea    -0x1(%rbx,%r13,1),%rax<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f61:   48 39 c3 
                          cmp    %rax,%rbx<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f64:   73 4b  
                            jae    56fb1
            &lt;console_print+0xc8&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f66:   48 89 de 
                          mov    %rbx,%rsi<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f69:   80 3b 0a 
                          cmpb   $0xa,(%rbx)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f6c:   75 30  
                            jne    56f9e
            &lt;console_print+0xb5&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f6e:   c6 03 0d 
                          movb   $0xd,(%rbx)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f71:   0f b6 43
            01  
                      movzbl 0x1(%rbx),%eax<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f75:   88 45 cf 
                          mov   
            %al,-0x31(%rbp)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f78:   c6 43 01
            0a  
                      movb   $0xa,0x1(%rbx)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f7c:   49 89 dd 
                          mov    %rbx,%r13<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f7f:   49 29 f5 
                          sub    %rsi,%r13<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f82:   41 8d 55
            02  
                      lea    0x2(%r13),%edx<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f86:   4c 89 f7 
                          mov    %r14,%rdi<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f89:   41 ff d7 
                          callq  *%r15<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f8c:   0f b6 45
            cf  
                      movzbl -0x31(%rbp),%eax<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f90:   88 43 01 
                          mov    %al,0x1(%rbx)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f93:   48 8d 73
            01  
                      lea    0x1(%rbx),%rsi<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f97:   41 83 c5
            01  
                      add    $0x1,%r13d<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f9b:   45 29 ec 
                          sub    %r13d,%r12d<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56f9e:   48 83 c3
            01  
                      add    $0x1,%rbx<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fa2:   4d 63 ec 
                          movslq %r12d,%r13<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fa5:   4a 8d 44
            2e
            ff          lea    -0x1(%rsi,%r13,1),%rax<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56faa:   48 39 d8 
                          cmp    %rbx,%rax<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fad:   77 ba  
                            ja     56f69
            &lt;console_print+0x80&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56faf:   eb 03  
                            jmp    56fb4
            &lt;console_print+0xcb&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fb1:   48 89 de 
                          mov    %rbx,%rsi<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fb4:   80 38 0a 
                          cmpb   $0xa,(%rax)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fb7:   75 0c  
                            jne    56fc5 &lt;console_print+0xdc&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fb9:   c6 00 0d 
                          movb   $0xd,(%rax)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fbc:   42 c6 04
            2e
            0a          movb   $0xa,(%rsi,%r13,1)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fc1:   41 83 c4
            01  
                      add    $0x1,%r12d<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fc5:   44 89 e2 
                          mov    %r12d,%edx<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fc8:   4c 89 f7 
                          mov    %r14,%rdi<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   <b><font size="4">56fcb:
                  41 ff d7 
                              callq  *%r15</font></b><span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fce:   48 8b 65
            c0  
                      mov    -0x40(%rbp),%rsp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fd2:   48 8d 65
            d8  
                      lea    -0x28(%rbp),%rsp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fd6:   5b   
                              pop   
            %rbx<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fd7:   41 5c  
                            pop    %r12<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fd9:   41 5d   
                        pop    %r13<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fdb:   41 5e  
                            pop    %r14<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fdd:   41 5f  
                            pop    %r15<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fdf:   5d   
                              pop   
            %rbp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   56fe0:   c3   
                              retq<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black">I
            added the options –fno-pic to TARGET_CFLAGS and
            TARGET_CPPFLAGS and –no-pie to TARGET_LDFLAGS and recompile
            the kernel. Now,
            the kernel carshed at instruction 0x673bb in the
            run_idle_thread function:<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">00000000000673ac
            &lt;run_idle_thread&gt;:<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   673ac:   55   
                              push   %rbp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   673ad:   48 89 e5 
                          mov    %rsp,%rbp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   673b0:   48 8b 05
            00 00 00
            00    mov    0x0(%rip),%rax        #
            673b7 &lt;run_idle_thread+0xb&gt;<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   673b7:   48 8b 60
            10  
                      mov    0x10(%rax),%rsp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   673bb:   ff 70 18 
                          pushq  0x18(%rax)<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   673be:   c3   
                              retq<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   673bf:   5d   
                              pop   
            %rbp<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">   673c0:   c3   
                             </span><span
            style="font-family:&quot;Helvetica Neue&quot;;color:black">
            retq<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black">Finally,
            just to try I commented out the run_idle_thread
            function and the kernel crashed at the very beginning at
            0x63. The kern dump in
            this case points to the stack:<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">     
            5e:   e8 00 00 00 00          callq 
            63 &lt;stack_start&gt;</span></p>
      </div>
    </blockquote>
    <br>
    Both the above mov instruction at 0x673b0 and this call instruction
    with a 4-byte displacement of 0 look suspiciously like they are
    waiting for relocation, as displacements of 0 are exceedingly rare
    (there are more efficient ways to encode such operands).<br>
    <br>
    Therefore, I don't think you've succeeded in preventing your binary
    from being relocatable.<br>
    <br>
    ~Andrew<br>
    <br>
    <blockquote type="cite"
cite="mid:CADNMjEDkHZ8KirBFusinr1c9XE0dF-QYhb1R4c4yXjwW4e2g5g@mail.gmail.com">
      <div dir="ltr">
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black"><span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">0000000000000063
            &lt;stack_start&gt;:<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">    ...<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">     
            6b:   90                      nop<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">     
            6c:   90                      nop<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">     
            6d:   90                      nop<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black">Thanks,<span></span></span></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span style="color:black">Bruno<span
              style="font-size:12pt"></span></span></p>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Thu, Dec 28, 2017 at 7:18 PM, Andrew
          Cooper <span dir="ltr">&lt;<a
              href="mailto:andrew.cooper3@citrix.com" target="_blank"
              moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div text="#000000" bgcolor="#FFFFFF"><span class="">
                <div class="m_8649405049459884912moz-cite-prefix">On
                  28/12/17 18:33, Bruno Alvisio wrote:<br>
                </div>
                <blockquote type="cite">
                  <div dir="ltr"><font size="1"><span
                        style="font-family:Menlo;color:black">(d360)
                        Bootstrapping...</span></font>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          Dom360 callback via changed to Direct Vector
                          0x20</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(d360)
                          Xen Minimal OS (hvm)!</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          d360v0 Triple fault - invoking HVM shutdown
                          action 1</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          *** Dumping Dom360 vcpu#0 state: ***</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          ----[ Xen-4.10.0-rc<span>  </span>x86_64<span> 
                          </span>debug=y<span>   </span>Not tainted
                          ]----</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          CPU:<span>    </span>7</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          RIP:<span>    </span>0008:[&lt;0000000000056fc8&gt;]</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          RFLAGS: 0000000000010006<span>   </span>CONTEXT:
                          hvm guest (d360v0)</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          rax: 00000000000bfe75<span>   </span>rbx:
                          00000000000bfe75<span>   </span>rcx:
                          0000000000000000</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          rdx: 0000000000000017<span>   </span>rsi:
                          00000000000bfe60<span>   </span>rdi:
                          0000000000000000</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          rbp: 00000000000bfec0<span>   </span>rsp:
                          00000000000bfe60<span>   </span>r8:<span>  </span>0000000000000000</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          r9:<span>  </span>0000000000089982<span>  </span><span> </span>r10:
                          0000000000000016<span>   </span>r11:
                          0000000000000000</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          r12: 0000000000000017<span>   </span>r13:
                          0000000000000016<span>   </span>r14:
                          0000000000000000</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          r15: 0d8b4c1575ff8548<span>   </span>cr0:
                          0000000080000011<span>   </span>cr4:
                          0000000000000220</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          cr3: 0000000000099000<span>   </span>cr2:
                          0000000000000000</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          fsb: 0000000000000000<span>   </span>gsb:
                          0000000000000000<span>   </span>gss:
                          0000000000000000</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black">(XEN)
                          ds: 0033<span>   </span>es: 0033<span>   </span>fs:
                          0033<span>   </span>gs: 0033<span>   </span>ss:
                          0000<span>   </span>cs: 0008</span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in
                      0.0001pt;font-family:Calibri"><font size="1"><span
                          style="font-family:Menlo;color:black"> </span></font></p>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in 0.0001pt"><span
                        style="font-family:arial,helvetica,sans-serif"><font
                          size="1"><span style="color:black"> </span></font></span></p>
                    <span style="font-family:arial,helvetica,sans-serif">
                    </span>
                    <p class="m_8649405049459884912gmail-MsoNormal"
                      style="margin:0in 0in 0.0001pt"><font size="2"><span
                          style="font-family:arial,helvetica,sans-serif"><span
                            style="color:black">Any help on this would
                            be greatly appreciated.</span></span></font></p>
                  </div>
                </blockquote>
                <br>
              </span> You will need to disassemble your minios kernel
              and see which instruction is at 0x56fc8.  (Chances are, it
              will be `jmp %r15`).<br>
              <br>
              The content of %r15 looks like x86 opcode, which is
              reminiscent of the XTF relocatability bugs.  Make doubly
              sure you are compiling with -fno-pic and link with
              -no-pie.<span class="HOEnZb"><font color="#888888"><br>
                  <br>
                  ~Andrew<br>
                </font></span></div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------4B58D3AD3A735459AC6B602F--


--===============0970426563742386509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0970426563742386509==--
