From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12] xen/iommu: fix dev assignment on
 ARM after 91d4eca7
Date: Thu, 3 Jan 2019 10:19:51 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901031004460.800@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901021622550.800@sstabellini-ThinkPad-X260>
 <416d62e8-f977-bca7-2eb9-5ac05051953e@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-46470725-1546539592=:800"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <416d62e8-f977-bca7-2eb9-5ac05051953e@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: julien.grall@arm.com, Stefano Stabellini <sstabellini@kernel.org>, paul.durrant@citrix.com, jbeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-46470725-1546539592=:800
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Jan 2019, Andrew Cooper wrote:
> On 03/01/2019 00:28, Stefano Stabellini wrote:
> > Fix device assignment on ARM after 91d4eca7 "mm / iommu: split
> > need_iommu() into has_iommu_pt() and need_iommu_pt_sync()".
> >
> > arch_iommu_populate_page_table returns -ENOSYS which causes
> > iommu_construct to return early, although it is not an error.
> >
> > Interestingly, the if ( rc ) was present even before 91d4eca7, but it was
> > still working before. Now, with the new hd->status field it won't
> > complete the initialization successfully.
> >
> > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> >
> > diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> > index ac62d7f..a63329b 100644
> > --- a/xen/drivers/passthrough/iommu.c
> > +++ b/xen/drivers/passthrough/iommu.c
> > @@ -269,7 +269,7 @@ int iommu_construct(struct domain *d)
> >          hd->need_sync = true;
> >  
> >          rc = arch_iommu_populate_page_table(d);
> 
> The comment in ARM's arch_iommu_populate_page_table() says
> 
> /* The IOMMU shares the p2m with the CPU */
> 
> Which means that iommu_use_hap_pt() (just out of context above this
> hunk) is wrong.  It should return true, which will prevent us entering
> this path during initialisation.

iommu_use_hap_pt is implemented by calling has_iommu_pt(d) (also on x86
is part of the implementation), which is implemented as:

  (dom_iommu(d)->status != IOMMU_STATUS_disabled)

IOMMU_STATUS_disabled is zero in the enum, so status starts as
IOMMU_STATUS_disabled. It is set to IOMMU_STATUS_initializing for dom0
in iommu_hwdom_init, but it is not set to IOMMU_STATUS_initializing for
other domains anywhere, leading to this error.

It looks like we want to move the initialization of status from
iommu_hwdom_init to iommu_domain_init, which is called for everybody.


diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index ac62d7f..7cf6aaf 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -180,6 +180,7 @@ int iommu_domain_init(struct domain *d)
     if ( !iommu_enabled )
         return 0;
 
+    hd->status = IOMMU_STATUS_initializing;
     hd->platform_ops = iommu_get_ops();
     return hd->platform_ops->init(d);
 }
@@ -206,7 +207,6 @@ void __hwdom_init iommu_hwdom_init(struct domain *d)
 
     register_keyhandler('o', &iommu_dump_p2m_table, "dump iommu p2m table", 0);
 
-    hd->status = IOMMU_STATUS_initializing;
     hd->need_sync = iommu_hwdom_strict && !iommu_use_hap_pt(d);
     if ( need_iommu_pt_sync(d) )
     {
--8323329-46470725-1546539592=:800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-46470725-1546539592=:800--
