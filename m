From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/6] arm: add a small kconfig for Renesas
 RCar H3
Date: Fri, 20 Apr 2018 09:39:47 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1804200939270.3303@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1804181324400.17714@sstabellini-ThinkPad-X260>
 <1524089752-22174-4-git-send-email-sstabellini@kernel.org>
 <6a80e2e4-4063-fb5a-36b5-8980344b38fd@citrix.com>
 <2e905223-37f8-f1c8-d685-a133572bfc09@suse.com>
 <alpine.DEB.2.10.1804191548030.3303@sstabellini-ThinkPad-X260>
 <19b762e4-264c-9bee-83df-e9b39880326b@suse.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1620568777-1524242388=:3303"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <19b762e4-264c-9bee-83df-e9b39880326b@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: artem_mygaiev@epam.com, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, julien.grall@arm.com, volodymyr_babchuk@epam.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1620568777-1524242388=:3303
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Apr 2018, Juergen Gross wrote:
> On 20/04/18 01:00, Stefano Stabellini wrote:
> > On Thu, 19 Apr 2018, Juergen Gross wrote:
> >> On 19/04/18 10:06, Andrew Cooper wrote:
> >>> On 18/04/2018 23:15, Stefano Stabellini wrote:
> >>>>  xen/arch/arm/configs/renesas.config | 80 +++++++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 80 insertions(+)
> >>>>  create mode 100644 xen/arch/arm/configs/renesas.config
> >>>>
> >>>> diff --git a/xen/arch/arm/configs/renesas.config b/xen/arch/arm/configs/renesas.config
> >>>> new file mode 100644
> >>>> index 0000000..7ad3f1c
> >>>> --- /dev/null
> >>>> +++ b/xen/arch/arm/configs/renesas.config
> >>>> @@ -0,0 +1,80 @@
> >>>> +#
> >>>> +# Automatically generated file; DO NOT EDIT.
> >>>> +# Xen/arm 4.11-unstable Configuration
> >>>> +#
> >>>
> >>> This is now the second Kconfig file we've got added into the tree.  As
> >>> with the PV-shim config, keeping it up to date is going to be a little
> >>> tricky.
> >>>
> >>> I think we either need a script to keep all of the embedded configs up
> >>> to date, or switch to a model (similar to the travis randconfig target)
> >>> where it becomes a `make defaultconfig` with certain specific options
> >>> forced one way or another (similar to `make {tiny,kvm,xen}config` in
> >>> Linux).  The latter means that we only store the specific delta
> >>> applicable for purpose, and it will probably change less frequently.
> >>
> >> I think the easiest way would be to have a config file with only the
> >> required non-default options being specified and then run
> >> "make olddefconfig" against that (or better: a copy of that in order
> >> to avoid modifying a source from git).
> >>
> >> I'm just writing a patch to do that for the shim config as it is nasty
> >> to remove shim.config from my patches in case it has been modified by
> >> the build (again) and STGit has picked it up.
> > 
> > Given that the goal of this kconfig is to provide the smallest possible
> > kconfig for a given board, I think that your suggestion wouldn't end up
> > improving things much in this case because most options will have to be
> > specified as "disabled", otherwise "make olddefconfig" would end up
> > enabling some of them by default, which is not what we want.
> > 
> 
> What's the problem with this?
> 
> In case you really do want a config with many non-default settings
> you'll have to specify them. So just do it and it's fine.
> 
> The alternative would be to specify _all_ entries. I don't see why
> this would be better.

Yes, you are right :-)
--8323329-1620568777-1524242388=:3303
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1620568777-1524242388=:3303--
