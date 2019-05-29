From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [VMI] Possible race-condition in altp2m APIs
Date: Tue, 28 May 2019 17:49:33 -0700
Message-ID: <0b97ca78-81f3-a45e-a651-05d2a420dc83@citrix.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
 <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7111590664273602694=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PiYs=T5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hVmmj-00087i-9y
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 00:49:41 +0000
In-Reply-To: <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

--===============7111590664273602694==
Content-Type: multipart/alternative;
	boundary="------------C88889B6C5BF0B0175138F7E"
Content-Language: en-GB

--------------C88889B6C5BF0B0175138F7E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 28/05/2019 13:33, Mathieu Tarral wrote:
> Hi Andrew,
>
>>> The bug is still here, so we can exclude a microcode issue.
>> Good - that is one further angle excluded.  Always make sure you are
>> running with up-to-date microcode, but it looks like we back to
>> investigating a logical bug in libvmi or Xen.
>
> I reimplemented a small test, without the Drakvuf/Libvmi layers, that will inject traps on one API in Windows (NtCreateUserProcess),
> in the same way that Drakvuf does.
>
> I did some quick testing yesterday, with a Python script that was repeatedly
> starting the binary to monitor the API, and at the same time starting Ansible
> to run "c:\Windows\system32\reg.exe /?" via WinRM, to trigger some process creation.
>
> The traps are working, I see the software breakpoint hit, switching to the default
> view for singlestepping, and switching back to the execution view, so that's already good.
>
> After a series of tests on 1 or 4 VCPUs, my domain end up in 2 possible states:
> - frozen: the mouse doesn't move: so I would guess the VCPU are blocked.
>
> I'm calling the xc_(un)pause_domain APIs multiple times when I write to the shadow copies,
> but It's always synchronous, so I doubt that they interfered and "paused" the domain.

xc_{,un}pause_domain() calls are reference counted.  Calling unpause too
many times should be safe (from a refcount point of view), and should
fail the hypercall with -EINVAL.

>
> Also, the log output I have before I detect that Ansible failed to execute is that the resume succeded and
> Xen is ready to process VMI events.
>
> - BSOD: that's the second possibility, apparently I'm corrupting critical data structure in the operating system,
> and the Windbg analysis is inconclusive, so I can't tell much.
>
> Either way, I can't execute this test sequentially 10 000 times without a crash.

Ok good - this is a far easier place to start debugging from.

> -> Could you look at the implementation, and tell me if I misused the APIs somewhere ?
> https://gist.github.com/mtarral/d99ce5524cfcfb5290eaa05702c3e8e7

Some observations.

1)  In xen_pause_vm(), you do an xc_domain_getinfo().  First of all, the
API is crazy, so you also need to check "|| info.domid != domid" in your
error condition, but that shouldn't be an issue here as the domid isn't
changing. 

Furthermore, the results of xc_domain_getinfo() are stale before the
hypercall returns, so it is far less useful than it appears.

I'm afraid that the only safe way to issue pause/unpauses is to know
that you've reference counted your own correctly.  All entities in dom0
with privilege can fight over each others references, because there is
nothing Xen can use to distinguish the requests.

2) You allocate a libxl context but do nothing with it.  That can all
go, along with the linkage against libxl.  Also, you don't need to
create a logger like that.  Despite being utterly unacceptable behaviour
for a library, it is the default by passing NULL in xc_interface_open().

3) A malloc()/memset() pair is more commonly spelt calloc()


And some questions.

1) I'm guessing the drakvuf_inject_trap(drakvuf, 0x293e6a0, 0) call is
specific to the exact windows kernel in use?

2) In vmi_init(), what is the purpose of fmask and zero_page_gfn?  You
add one extra gfn to the guest, called zero_page, and fill it with 1's
from fmask.

3) You create two altp2m's, but both have the same default access.  Is
this deliberate, or a bug?  If deliberate, why?

Finally, and probably the source of the memory corruption...

4) When injecting a trap, you allocate a new gfn, memcpy() the contents
and insert a 0xcc (so far so good).  You then remap the executable view
to point at the new gfn with a breakpoint in (fine), and remap the
readable view to point at the zero_page, which is full of 1's (uh-oh).

What is this final step trying to achieve?  It guarantees that
patch-guard will eventually notice and BSOD your VM for critical
structure corruption.  The read-only view needs to point to the original
gfn with only read permissions, so when Windows reads the gfn back, it
sees what it expects.  You also need to prohibit writes to either gfn so
you can spot writes (unlikely in this case but important for general
introspection) so you can propagate the change to both copies.

>
> I used the compat APIs, like Drakvuf does.
>
> @Tamas, if you could check the traps implementation.
>
> You also have stress-test.py, which is the small test suite that I used, and
> the screenshot showing the stdout preceding a test failure,
> when Ansible couldn't contact WinRM service because the domain was frozen.
>
> Note: I stole some code from libvmi, to handle page read/write in Xen.
>
> PS: in the case where the domain is frozen, and I destroy the domain, a (null) entry will remain
> in xl list, despite that my stress-test.py process is already dead.
>
> I have 4 of these entries in my xl list right now.

That's almost certainly a reference not being dropped on a page.  Can
you run `xl debug-keys q` and paste the resulting analysis which will be
visible in `xl dmesg`?

It is probably some missing cleanup in the altp2m code.

~Andrew

--------------C88889B6C5BF0B0175138F7E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 28/05/2019 13:33, Mathieu Tarral
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">Hi Andrew,

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The bug is still here, so we can exclude a microcode issue.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Good - that is one further angle excluded.  Always make sure you are
running with up-to-date microcode, but it looks like we back to
investigating a logical bug in libvmi or Xen.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

I reimplemented a small test, without the Drakvuf/Libvmi layers, that will inject traps on one API in Windows (NtCreateUserProcess),
in the same way that Drakvuf does.

I did some quick testing yesterday, with a Python script that was repeatedly
starting the binary to monitor the API, and at the same time starting Ansible
to run "c:\Windows\system32\reg.exe /?" via WinRM, to trigger some process creation.

The traps are working, I see the software breakpoint hit, switching to the default
view for singlestepping, and switching back to the execution view, so that's already good.

After a series of tests on 1 or 4 VCPUs, my domain end up in 2 possible states:
- frozen: the mouse doesn't move: so I would guess the VCPU are blocked.

I'm calling the xc_(un)pause_domain APIs multiple times when I write to the shadow copies,
but It's always synchronous, so I doubt that they interfered and "paused" the domain.</pre>
    </blockquote>
    <br>
    xc_{,un}pause_domain() calls are reference counted.  Calling unpause
    too many times should be safe (from a refcount point of view), and
    should fail the hypercall with -EINVAL.<br>
    <br>
    <blockquote type="cite"
cite="mid:VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">

Also, the log output I have before I detect that Ansible failed to execute is that the resume succeded and
Xen is ready to process VMI events.

- BSOD: that's the second possibility, apparently I'm corrupting critical data structure in the operating system,
and the Windbg analysis is inconclusive, so I can't tell much.

Either way, I can't execute this test sequentially 10 000 times without a crash.</pre>
    </blockquote>
    <br>
    Ok good - this is a far easier place to start debugging from.<br>
    <br>
    <blockquote type="cite"
cite="mid:VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">-&gt; Could you look at the implementation, and tell me if I misused the APIs somewhere ?
<a class="moz-txt-link-freetext" href="https://gist.github.com/mtarral/d99ce5524cfcfb5290eaa05702c3e8e7">https://gist.github.com/mtarral/d99ce5524cfcfb5290eaa05702c3e8e7</a></pre>
    </blockquote>
    <br>
    Some observations.<br>
    <br>
    1)  In xen_pause_vm(), you do an xc_domain_getinfo().  First of all,
    the API is crazy, so you also need to check "|| info.domid != domid"
    in your error condition, but that shouldn't be an issue here as the
    domid isn't changing.  <br>
    <br>
    Furthermore, the results of xc_domain_getinfo() are stale before the
    hypercall returns, so it is far less useful than it appears.<br>
    <br>
    I'm afraid that the only safe way to issue pause/unpauses is to know
    that you've reference counted your own correctly.  All entities in
    dom0 with privilege can fight over each others references, because
    there is nothing Xen can use to distinguish the requests.<br>
    <br>
    2) You allocate a libxl context but do nothing with it.  That can
    all go, along with the linkage against libxl.  Also, you don't need
    to create a logger like that.  Despite being utterly unacceptable
    behaviour for a library, it is the default by passing NULL in
    xc_interface_open().<br>
    <br>
    3) A malloc()/memset() pair is more commonly spelt calloc()<br>
    <br>
    <br>
    And some questions.<br>
    <br>
    1) I'm guessing the <span class="pl-c1">drakvuf_inject_trap</span>(drakvuf,
    <span class="pl-c1">0x293e6a0</span>, <span class="pl-c1">0</span>)
    call is specific to the exact windows kernel in use?<br>
    <br>
    2) In vmi_init(), what is the purpose of fmask and zero_page_gfn? 
    You add one extra gfn to the guest, called zero_page, and fill it
    with 1's from fmask.<br>
    <br>
    3) You create two altp2m's, but both have the same default access. 
    Is this deliberate, or a bug?  If deliberate, why?<br>
    <br>
    Finally, and probably the source of the memory corruption...<br>
    <br>
    4) When injecting a trap, you allocate a new gfn, memcpy() the
    contents and insert a 0xcc (so far so good).  You then remap the
    executable view to point at the new gfn with a breakpoint in (fine),
    and remap the readable view to point at the zero_page, which is full
    of 1's (uh-oh).<br>
    <br>
    What is this final step trying to achieve?  It guarantees that
    patch-guard will eventually notice and BSOD your VM for critical
    structure corruption.  The read-only view needs to point to the
    original gfn with only read permissions, so when Windows reads the
    gfn back, it sees what it expects.  You also need to prohibit writes
    to either gfn so you can spot writes (unlikely in this case but
    important for general introspection) so you can propagate the change
    to both copies.<br>
    <br>
    <blockquote type="cite"
cite="mid:VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">

I used the compat APIs, like Drakvuf does.

@Tamas, if you could check the traps implementation.

You also have stress-test.py, which is the small test suite that I used, and
the screenshot showing the stdout preceding a test failure,
when Ansible couldn't contact WinRM service because the domain was frozen.

Note: I stole some code from libvmi, to handle page read/write in Xen.

PS: in the case where the domain is frozen, and I destroy the domain, a (null) entry will remain
in xl list, despite that my stress-test.py process is already dead.

I have 4 of these entries in my xl list right now.</pre>
    </blockquote>
    <br>
    That's almost certainly a reference not being dropped on a page. 
    Can you run `xl debug-keys q` and paste the resulting analysis which
    will be visible in `xl dmesg`?<br>
    <br>
    It is probably some missing cleanup in the altp2m code.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------C88889B6C5BF0B0175138F7E--


--===============7111590664273602694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7111590664273602694==--
