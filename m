From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12] xen/iommu: fix dev assignment on
 ARM after 91d4eca7
Date: Mon, 7 Jan 2019 10:40:58 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901071039230.800@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901021622550.800@sstabellini-ThinkPad-X260>
 <416d62e8-f977-bca7-2eb9-5ac05051953e@citrix.com>
 <alpine.DEB.2.10.1901031004460.800@sstabellini-ThinkPad-X260>
 <71f5da369f1245b8a85c794a9ae097d9@AMSPEX02CL03.citrite.net>
 <alpine.DEB.2.10.1901040941510.800@sstabellini-ThinkPad-X260>
 <b5e3db3ae4bc42adb1df40ef047cb5d0@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-484521266-1546886385=:800"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b5e3db3ae4bc42adb1df40ef047cb5d0@AMSPEX02CL03.citrite.net>
Content-ID: <alpine.DEB.2.10.1901071040150.800@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, 'Stefano Stabellini' <sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-484521266-1546886385=:800
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1901071040151.800@sstabellini-ThinkPad-X260>

On Mon, 7 Jan 2019, Paul Durrant wrote:
> > -----Original Message-----
> > From: Stefano Stabellini [mailto:sstabellini@kernel.org]
> > Sent: 04 January 2019 17:46
> > To: Paul Durrant <Paul.Durrant@citrix.com>
> > Cc: 'Stefano Stabellini' <sstabellini@kernel.org>; Andrew Cooper
> > <Andrew.Cooper3@citrix.com>; xen-devel@lists.xen.org;
> > julien.grall@arm.com; jbeulich@suse.com
> > Subject: RE: [Xen-devel] [PATCH for-4.12] xen/iommu: fix dev assignment on
> > ARM after 91d4eca7
> > 
> > On Fri, 4 Jan 2019, Paul Durrant wrote:
> > > > -----Original Message-----
> > > > From: Stefano Stabellini [mailto:sstabellini@kernel.org]
> > > > Sent: 03 January 2019 18:20
> > > > To: Andrew Cooper <Andrew.Cooper3@citrix.com>
> > > > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > devel@lists.xen.org;
> > > > julien.grall@arm.com; jbeulich@suse.com; Paul Durrant
> > > > <Paul.Durrant@citrix.com>
> > > > Subject: Re: [Xen-devel] [PATCH for-4.12] xen/iommu: fix dev
> > assignment on
> > > > ARM after 91d4eca7
> > > >
> > > > On Thu, 3 Jan 2019, Andrew Cooper wrote:
> > > > > On 03/01/2019 00:28, Stefano Stabellini wrote:
> > > > > > Fix device assignment on ARM after 91d4eca7 "mm / iommu: split
> > > > > > need_iommu() into has_iommu_pt() and need_iommu_pt_sync()".
> > > > > >
> > > > > > arch_iommu_populate_page_table returns -ENOSYS which causes
> > > > > > iommu_construct to return early, although it is not an error.
> > > > > >
> > > > > > Interestingly, the if ( rc ) was present even before 91d4eca7, but
> > it
> > > > was
> > > > > > still working before. Now, with the new hd->status field it won't
> > > > > > complete the initialization successfully.
> > > > > >
> > > > > > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> > > > > >
> > > > > > diff --git a/xen/drivers/passthrough/iommu.c
> > > > b/xen/drivers/passthrough/iommu.c
> > > > > > index ac62d7f..a63329b 100644
> > > > > > --- a/xen/drivers/passthrough/iommu.c
> > > > > > +++ b/xen/drivers/passthrough/iommu.c
> > > > > > @@ -269,7 +269,7 @@ int iommu_construct(struct domain *d)
> > > > > >          hd->need_sync = true;
> > > > > >
> > > > > >          rc = arch_iommu_populate_page_table(d);
> > > > >
> > > > > The comment in ARM's arch_iommu_populate_page_table() says
> > > > >
> > > > > /* The IOMMU shares the p2m with the CPU */
> > > > >
> > > > > Which means that iommu_use_hap_pt() (just out of context above this
> > > > > hunk) is wrong.  It should return true, which will prevent us
> > entering
> > > > > this path during initialisation.
> > > >
> > > > iommu_use_hap_pt is implemented by calling has_iommu_pt(d) (also on
> > x86
> > > > is part of the implementation), which is implemented as:
> > > >
> > > >   (dom_iommu(d)->status != IOMMU_STATUS_disabled)
> > > >
> > > > IOMMU_STATUS_disabled is zero in the enum, so status starts as
> > > > IOMMU_STATUS_disabled. It is set to IOMMU_STATUS_initializing for dom0
> > > > in iommu_hwdom_init, but it is not set to IOMMU_STATUS_initializing
> > for
> > > > other domains anywhere, leading to this error.
> > >
> > > It is set for other domains... see iommu_construct().
> > 
> > Hi Paul, unfortunately it doesn't work that way. Let me explain:
> > 
> > 
> > iommu_construct() sets hd->status to IOMMU_STATUS_initializing *after*
> > calling iommu_use_hap_pt(d), and specifically inside the if statement:
> > 
> >     if ( !iommu_use_hap_pt(d) )
> >     {
> >         int rc;
> > 
> >         hd->status = IOMMU_STATUS_initializing;
> >         hd->need_sync = true;
> > 
> >         rc = arch_iommu_populate_page_table(d);
> >         if ( rc )
> >         {
> >             if ( rc != -ERESTART )
> >             {
> >                 hd->need_sync = false;
> >                 hd->status = IOMMU_STATUS_disabled;
> >             }
> > 
> >             return rc;
> >         }
> >     }
> > 
> > However, for iommu_use_hap_pt(d) to return the correct value, which
> > should be always true on ARM, status needs to be already set to
> > IOMMU_STATUS_initializing.
> > 
> > Because when we enter iommu_construct status is IOMMU_STATUS_disabled,
> > iommu_use_hap_pt(d) calls has_iommu_pt(d) which wrongly returns false
> > because it is implemented as:
> > 
> > #define has_iommu_pt(d) (dom_iommu(d)->status != IOMMU_STATUS_disabled)
> > 
> > 
> > I think we need to move the initialization of status to
> > IOMMU_STATUS_initializing earlier, specifically to iommu_domain_init.
> 
> The use of iommu_use_hap_pt() here is indeed a problem, but I think it would be sufficient to move the line "hd->status = IOMMU_STATUS_initializing" to just before the if rather than to a completely separate function.

Yes, that works too.
 
---
xen/iommu: fix dev assignment on ARM after 91d4eca7

Fix device assignment on ARM after 91d4eca7 "mm / iommu: split
need_iommu() into has_iommu_pt() and need_iommu_pt_sync()".

arch_iommu_populate_page_table returns -ENOSYS which causes
iommu_construct to return early, although it is not an error.

hd->status needs to be set to IOMMU_STATUS_initializing before calling
iommu_use_hap_pt, otherwise iommu_use_hap_pt will return the wrong
value.

Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index ac62d7f..a6f69f4 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -261,11 +261,11 @@ int iommu_construct(struct domain *d)
     if ( hd->status == IOMMU_STATUS_initialized )
         return 0;
 
+    hd->status = IOMMU_STATUS_initializing;
     if ( !iommu_use_hap_pt(d) )
     {
         int rc;
 
-        hd->status = IOMMU_STATUS_initializing;
         hd->need_sync = true;
 
         rc = arch_iommu_populate_page_table(d);
--8323329-484521266-1546886385=:800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-484521266-1546886385=:800--
