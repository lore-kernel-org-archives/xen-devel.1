From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [VMI] Possible race-condition in altp2m APIs
Date: Mon, 6 May 2019 18:07:40 +0100
Message-ID: <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1224547363317200406=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Pjh=TG=citrix.com=prvs=022dda640=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hNh5q-0000jB-Nn
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 17:07:58 +0000
In-Reply-To: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

--===============1224547363317200406==
Content-Type: multipart/alternative;
	boundary="------------1F3550EACBCAD5C40C2DA673"
Content-Language: en-GB

--------------1F3550EACBCAD5C40C2DA673
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 06/05/2019 17:18, Mathieu Tarral wrote:
> Hi,
>
> I would like to submit a strange bug that i'm facing while using DRAKVUF to
> monitor applications from the hypervisor.
>
> I wanted to evaluate DRAKVUF's robustness, so I built a test suite, and began
> by executing reg.exe via shellexec injection, having the execution tracked by the procmon plugin.
>
> I quickly realized that sometimes applications were crashing in the guest, with different types of weird errors:
> - memory cannot be written
> - invalid opcode
> - unknown software exception (its a Windows message, not sure what type of processor exception is behind this)
>
> And more than that, I had lots of BSODs, in different places in the kernel.
>
> So heavy monitoring with DRAKVUF tends to make the guest unstable.
>
> It's important to emphasize that the more VCPUs you have, the more likely the bug will be triggered.
>
> For example, injecting on Windows with 1 VCPU, i was able to go through 5000 successives injections.
> Using 4 VCPUs on the other hand, it would crash around ~50th injection.
>
> My first suspicion was on DRAKVUF's custom injector, which hijacks the process control flow,
> and could have corrupted the guest memory.
>
> This is the most invasive method to start a process in the guest, so it was a good candidate.
>
> But last week, I replaced this injector by opening the WinRM service, and starting the remote process
> via Ansible win_command module.
>
> Unfortunately, the result was the same, the BSODs and appcrashes are still here.
>
> Which means that DRAKVUF, simply by calling the altp2m APIs and injecting stealth breakpoints,
> could somehow make the guest execute code in a page that would either be non present
> (I had PAGE_FAULT_IN_NONPAGED_AERA BSODs), or corrupted, which would explain
> the invalid opcode/access_violation errors.
>
> You can find my extensive bug reports and comments on the following Github issues:
> - [Injection BSOD on W7x64](https://github.com/tklengyel/drakvuf/issues/576)
> - [BSOD when injecting on Windows 10 protected by KPTI ](https://github.com/tklengyel/drakvuf/issues/622)
>
> The latest proof I have of this effect is the following analysis of a Win10 BSOD:
> https://gist.github.com/mtarral/f593e50d1d68b5a1071d8bc42affd542
>
> (Please note that KPTI was manually disabled, because it would crash guest quite quickly under monitoring, but that's another issue.)
>
> I managed to get a page containing 2 successive `int 3` (previously injected by DRAKVUF), in a location that I just wasn't monitoring.
>
> That's why I think that DRAKVUF is not responsible of this behavior.
>
> I'm using only 3 plugins:
> - procmon
>   - NtCreateUserProcess
>   - NtTerminateProcess
>   - NtOpenProcess
>   - NtProtectVirtualMemory
> - bsodmon
>   - KeBugCheck
> - crashmon
>   - CR3 load
>
> As altp2m seems like a really complicated to implement (EPT manipulation, CoW, ...),
> I suspect that there is a possible race condition that lies in there, which would trigger this bug.
>
> I would like your opinions on the matter, how I can investigate this,
> and ultimately debug it, with your help of course.

There is a lot in here.

As for your BSOD analysis, the first thing to be aware of is that Double
Fault is not necessarily precise, which means you can't necessarily
trust any of the registers.  That said, most double faults are precise
in practice, so if you're seeing it reliably at the same place, then it
is likely to be a precise example.

Your faulting address isn't the immediately after the pagetable switch. 
It is one instruction further on, after the stack switch, which means at
the very minimum that reading the new rsp out of the per-processor
storage succeeded.

The stack switch, combined with `push $0x2b` faulting is a clear sign
that the stack is bad.  As the stack pointer looks plausible, it is
almost certainly the pagewalk from %rsp which is bad.  Judging by the
Windbg guide, you want to use !pte to dump the pagewalk (but I have
never used it in anger before).

How exactly does DRAKVUF go about injecting silent breakpoints?  It
obviously has to allocate a new gfn from somewhere to begin with.  Do
the bifurcated frames end up in two different altp2ms, or one in the
host p2m and one in an alternative?  Does #VE ever get used?

Given how many EPT flushing bugs I've already found in this area, I
wouldn't be surprised if there are further ones lurking.  If it is an
EPT flushing bug, this delta should make it go away, but it will come
with a hefty perf hit.

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 283eb7b..019333d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4285,9 +4285,7 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
             }
         }
 
-        if ( inv )
-            __invept(inv == 1 ? INVEPT_SINGLE_CONTEXT : INVEPT_ALL_CONTEXT,
-                     inv == 1 ? single->eptp          : 0);
+        __invept(INVEPT_ALL_CONTEXT, 0);
     }
 
  out:

~Andrew

--------------1F3550EACBCAD5C40C2DA673
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 06/05/2019 17:18, Mathieu Tarral
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">Hi,

I would like to submit a strange bug that i'm facing while using DRAKVUF to
monitor applications from the hypervisor.

I wanted to evaluate DRAKVUF's robustness, so I built a test suite, and began
by executing reg.exe via shellexec injection, having the execution tracked by the procmon plugin.

I quickly realized that sometimes applications were crashing in the guest, with different types of weird errors:
- memory cannot be written
- invalid opcode
- unknown software exception (its a Windows message, not sure what type of processor exception is behind this)

And more than that, I had lots of BSODs, in different places in the kernel.

So heavy monitoring with DRAKVUF tends to make the guest unstable.

It's important to emphasize that the more VCPUs you have, the more likely the bug will be triggered.

For example, injecting on Windows with 1 VCPU, i was able to go through 5000 successives injections.
Using 4 VCPUs on the other hand, it would crash around ~50th injection.

My first suspicion was on DRAKVUF's custom injector, which hijacks the process control flow,
and could have corrupted the guest memory.

This is the most invasive method to start a process in the guest, so it was a good candidate.

But last week, I replaced this injector by opening the WinRM service, and starting the remote process
via Ansible win_command module.

Unfortunately, the result was the same, the BSODs and appcrashes are still here.

Which means that DRAKVUF, simply by calling the altp2m APIs and injecting stealth breakpoints,
could somehow make the guest execute code in a page that would either be non present
(I had PAGE_FAULT_IN_NONPAGED_AERA BSODs), or corrupted, which would explain
the invalid opcode/access_violation errors.

You can find my extensive bug reports and comments on the following Github issues:
- [Injection BSOD on W7x64](<a class="moz-txt-link-freetext" href="https://github.com/tklengyel/drakvuf/issues/576">https://github.com/tklengyel/drakvuf/issues/576</a>)
- [BSOD when injecting on Windows 10 protected by KPTI ](<a class="moz-txt-link-freetext" href="https://github.com/tklengyel/drakvuf/issues/622">https://github.com/tklengyel/drakvuf/issues/622</a>)

The latest proof I have of this effect is the following analysis of a Win10 BSOD:
<a class="moz-txt-link-freetext" href="https://gist.github.com/mtarral/f593e50d1d68b5a1071d8bc42affd542">https://gist.github.com/mtarral/f593e50d1d68b5a1071d8bc42affd542</a>

(Please note that KPTI was manually disabled, because it would crash guest quite quickly under monitoring, but that's another issue.)

I managed to get a page containing 2 successive `int 3` (previously injected by DRAKVUF), in a location that I just wasn't monitoring.

That's why I think that DRAKVUF is not responsible of this behavior.

I'm using only 3 plugins:
- procmon
  - NtCreateUserProcess
  - NtTerminateProcess
  - NtOpenProcess
  - NtProtectVirtualMemory
- bsodmon
  - KeBugCheck
- crashmon
  - CR3 load

As altp2m seems like a really complicated to implement (EPT manipulation, CoW, ...),
I suspect that there is a possible race condition that lies in there, which would trigger this bug.

I would like your opinions on the matter, how I can investigate this,
and ultimately debug it, with your help of course.</pre>
    </blockquote>
    <br>
    There is a lot in here.<br>
    <br>
    As for your BSOD analysis, the first thing to be aware of is that
    Double Fault is not necessarily precise, which means you can't
    necessarily trust any of the registers.  That said, most double
    faults are precise in practice, so if you're seeing it reliably at
    the same place, then it is likely to be a precise example.<br>
    <br>
    Your faulting address isn't the immediately after the pagetable
    switch.  It is one instruction further on, after the stack switch,
    which means at the very minimum that reading the new rsp out of the
    per-processor storage succeeded.<br>
    <br>
    The stack switch, combined with `push $0x2b` faulting is a clear
    sign that the stack is bad.  As the stack pointer looks plausible,
    it is almost certainly the pagewalk from %rsp which is bad.  Judging
    by the Windbg guide, you want to use !pte to dump the pagewalk (but
    I have never used it in anger before).<br>
    <br>
    How exactly does DRAKVUF go about injecting silent breakpoints?  It
    obviously has to allocate a new gfn from somewhere to begin with. 
    Do the bifurcated frames end up in two different altp2ms, or one in
    the host p2m and one in an alternative?  Does #VE ever get used?<br>
    <br>
    Given how many EPT flushing bugs I've already found in this area, I
    wouldn't be surprised if there are further ones lurking.  If it is
    an EPT flushing bug, this delta should make it go away, but it will
    come with a hefty perf hit.<br>
    <br>
    <pre>diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 283eb7b..019333d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4285,9 +4285,7 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
             }
         }
 
-        if ( inv )
-            __invept(inv == 1 ? INVEPT_SINGLE_CONTEXT : INVEPT_ALL_CONTEXT,
-                     inv == 1 ? single-&gt;eptp          : 0);
+        __invept(INVEPT_ALL_CONTEXT, 0);
     }
 
  out:

</pre>
    ~Andrew<br>
  </body>
</html>

--------------1F3550EACBCAD5C40C2DA673--


--===============1224547363317200406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1224547363317200406==--
