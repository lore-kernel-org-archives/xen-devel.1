From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: xen/mem-reservation API and out-of-tree kernel
 modules
Date: Thu, 31 Jan 2019 13:44:15 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901311343370.22962__5151.18340715475$1548971115$gmane$org@sstabellini-ThinkPad-X260>
References: <f3ca533d-7f51-c59e-6a96-4e1fba687c8f@epam.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1499689100-1548971056=:22962"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FAp4=QH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gpK8C-0001G4-Qv
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 21:44:20 +0000
In-Reply-To: <f3ca533d-7f51-c59e-6a96-4e1fba687c8f@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1499689100-1548971056=:22962
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 31 Jan 2019, Oleksandr Andrushchenko wrote:
> Hello,
> 
> I am working on porting an out-of-tree kernel driver to the kernel
> 5.0 and that driver uses functionality provided by 
> drivers/xen/mem-reservation.c
> module.  Since commit [1] it is not possible to build a kernel module
> which uses mem-reservation API as xen_scrub_pages variable, which is 
> checked in
> xenmem_reservation_scrub_page, became a kernel module parameter and is 
> now only
> accessible for built-in modules:
> 
> static inline void xenmem_reservation_scrub_page(struct page *page)
> ^^^^^^^^^^^^^
> {
>      if (xen_scrub_pages)
>          ^^^^^^^^^^^^^^^
>          clear_highpage(page);
> }
> 
> This results in link-time warning:
> 
>      WARNING: "xen_scrub_pages" [yourmodule.ko] undefined!
> 
> and thus not allowing the module to run. At the moment I can only see a 
> possible fix
> for this by making the following change:
> 
> diff --git a/drivers/xen/mem-reservation.c b/drivers/xen/mem-reservation.c
> index 3782cf070338..85fecfec50e1 100644
> --- a/drivers/xen/mem-reservation.c
> +++ b/drivers/xen/mem-reservation.c
> @@ -18,6 +18,7 @@
> 
>   bool __read_mostly xen_scrub_pages = 
> IS_ENABLED(CONFIG_XEN_SCRUB_PAGES_DEFAULT);
>   core_param(xen_scrub_pages, xen_scrub_pages, bool, 0);
> +EXPORT_SYMBOL(xen_scrub_pages);
> 
> but this looks a bit unusual for the kernel?
> 
> I am looking for community advice here and help
> 
> Thank you,
> Oleksandr
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=197ecb3802c04499d8ff4f8cb28f6efa008067db

The alternative would be to turn xenmem_reservation_scrub_page into a
regular function (not a static inline)?
--8323329-1499689100-1548971056=:22962
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1499689100-1548971056=:22962--
