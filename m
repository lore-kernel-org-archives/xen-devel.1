From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen fails to boot inside QEMU on x86, no VMX:
Date: Wed, 24 Jan 2018 09:46:06 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801240945020.6440@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1801221544060.6440@sstabellini-ThinkPad-X260>
 <31744ea0-7d08-5db8-8aaa-db27dfd49b73@citrix.com>
 <alpine.DEB.2.10.1801221637010.6440@sstabellini-ThinkPad-X260>
 <fb87196c-1a48-6c7b-fe44-d560bd17db07@citrix.com>
 <5A670C1002000078001A16A3@prv-mh.provo.novell.com>
 <alpine.DEB.2.10.1801231252311.6440@sstabellini-ThinkPad-X260>
 <20180124091732.p2phuhrd5sktgz5f@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2093169349-1516815967=:6440"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180124091732.p2phuhrd5sktgz5f@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2093169349-1516815967=:6440
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 24 Jan 2018, Roger Pau Monné wrote:
> On Tue, Jan 23, 2018 at 04:47:51PM -0800, Stefano Stabellini wrote:
> > On Tue, 23 Jan 2018, Jan Beulich wrote:
> > > >>> On 23.01.18 at 01:41, <andrew.cooper3@citrix.com> wrote:
> > > > On 23/01/2018 00:38, Stefano Stabellini wrote:
> > > >> On Tue, 23 Jan 2018, Andrew Cooper wrote:
> > > >>> On 22/01/2018 23:48, Stefano Stabellini wrote:
> > > >>>> Hi all,
> > > >>>>
> > > >>>> Running Xen inside QEMU x86 without KVM acceleartion and without VMX
> > > >>>> emulation leads to the failure appended below.
> > > >>>>
> > > >>>> This trivial workaround "fixes" the problem:
> > > >>>>
> > > >>>> diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
> > > >>>> index 72f30d9..a67d6c1 100644
> > > >>>> --- a/xen/arch/x86/extable.c
> > > >>>> +++ b/xen/arch/x86/extable.c
> > > >>>> @@ -168,7 +168,6 @@ static int __init stub_selftest(void)
> > > >>>>                         _ASM_EXTABLE(.Lret%=, .Lfix%=)
> > > >>>>                         : [exn] "+m" (res)
> > > >>>>                         : [stb] "r" (addr), "a" (tests[i].rax));
> > > >>>> -        ASSERT(res == tests[i].res.raw);
> > > >>>>      }
> > > >>>>  
> > > >>>>      return 0;
> > > >>>>
> > > >>>>
> > > >>>> Any suggestions?
> > > >>> Which i failed?  This will probably be an emulation bug in Qemu.
> > > >> i=2 is the culprit
> > > > 
> > > > Qemu doesn't emulate %rsp-based memory accesses properly.  It should
> > > > raise #SS[0], and is presumably raising #GP[0] instead.
> > > 
> > > Right, the value on %rax supports that suspicion. Dropping the
> > > ASSERT() is no option, of course. If we were able to reliably
> > > detect that we're running under qemu, we could cater for this
> > > special case, but I can't seem to be able to think of other options
> > > besides adding a command line option allowing to bypass the self
> > > test.
> > 
> > I am going to give a look at the QEMU side of things. However, even if I
> > fix the bug in QEMU, it won't solve the problem for all the QEMU
> > instances already out there, shipped by distros, etc.
> > 
> > So, I think that regardless of the QEMU fix, we also need to add a
> > workaround in Xen. We can detect QEMU from the cpuid string, which is
> > going to be TCGTCGTCGTCG.
> > 
> > What do you think of something like below?
> 
> The shim code added a probe_hypervisor call into __start_xen, do you
> think you could hook this test there?
> 
> It might make sense to have something like:
> 
> enum guest_type {
>     NONE,
>     XEN,
>     QEMU,
> };
> enum guest_type guest;
> 
> As a global variable that would replace xen_guest.

I could hook the test there, but then the QEMU workaround would be tied
to CONFIG_XEN_GUEST, when actually it doesn't have anything to do with
it.

Unless you are also suggesting to move probe_hypervisor out of
xen/arch/x86/guest?
--8323329-2093169349-1516815967=:6440
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2093169349-1516815967=:6440--
