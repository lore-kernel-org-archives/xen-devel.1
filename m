From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen fails to boot inside QEMU on x86, no VMX
Date: Mon, 22 Jan 2018 16:38:07 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801221637010.6440@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1801221544060.6440@sstabellini-ThinkPad-X260>
 <31744ea0-7d08-5db8-8aaa-db27dfd49b73@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-526499601-1516667888=:6440"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <31744ea0-7d08-5db8-8aaa-db27dfd49b73@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-526499601-1516667888=:6440
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 23 Jan 2018, Andrew Cooper wrote:
> On 22/01/2018 23:48, Stefano Stabellini wrote:
> > Hi all,
> >
> > Running Xen inside QEMU x86 without KVM acceleartion and without VMX
> > emulation leads to the failure appended below.
> >
> > This trivial workaround "fixes" the problem:
> >
> > diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
> > index 72f30d9..a67d6c1 100644
> > --- a/xen/arch/x86/extable.c
> > +++ b/xen/arch/x86/extable.c
> > @@ -168,7 +168,6 @@ static int __init stub_selftest(void)
> >                         _ASM_EXTABLE(.Lret%=, .Lfix%=)
> >                         : [exn] "+m" (res)
> >                         : [stb] "r" (addr), "a" (tests[i].rax));
> > -        ASSERT(res == tests[i].res.raw);
> >      }
> >  
> >      return 0;
> >
> >
> > Any suggestions?
> 
> Which i failed?  This will probably be an emulation bug in Qemu.

i=2 is the culprit
--8323329-526499601-1516667888=:6440
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-526499601-1516667888=:6440--
