From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] gnttab/ARM: properly implement
 gnttab_create_status_page()
Date: Wed, 15 Aug 2018 10:57:44 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808151056010.15066@sstabellini-ThinkPad-X260>
References: <5B73DCDF02000078001DE331@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-136814967-1534355816=:15066"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6bc9=k6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fq03H-000536-0j
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 17:57:47 +0000
In-Reply-To: <5B73DCDF02000078001DE331@prv1-mh.provo.novell.com>
Content-ID: <alpine.DEB.2.10.1808151057080.15066@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-136814967-1534355816=:15066
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1808151057081.15066@sstabellini-ThinkPad-X260>

On Wed, 15 Aug 2018, Jan Beulich wrote:
> Prevent the "BUG_ON(page_get_owner(pg) != d)" in
> gnttab_unpopulate_status_frames() from triggering.
> 
> Reported-by: 王磊 <lei19.wang@samsung.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> ---
> It looks to me as if this was the only piece missing to make v2 grant
> tables work on ARM, but this was build tested only anyway.

For the public records, it cannot be tested until the Linux (or other
OSes functionalities) get implemented. Specifically,
arch_gnttab_map_shared and arch_gnttab_map_status in Linux.

But this patch is a clear improvement on the Xen side:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/include/asm-arm/grant_table.h
> +++ b/xen/include/asm-arm/grant_table.h
> @@ -21,7 +21,6 @@ int create_grant_host_mapping(unsigned l
>  int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>                                 unsigned long new_gpaddr, unsigned int flags);
>  void gnttab_mark_dirty(struct domain *d, mfn_t mfn);
> -#define gnttab_create_status_page(d, t, i) do {} while (0)
>  #define gnttab_release_host_mappings(domain) 1
>  static inline int replace_grant_supported(void)
>  {
> @@ -84,6 +83,12 @@ static inline unsigned int gnttab_dom0_m
>              virt_to_page((char *)(t)->shared_raw[i]), d, SHARE_rw);      \
>      } while ( 0 )
>  
> +#define gnttab_create_status_page(d, t, i)                               \
> +    do {                                                                 \
> +        share_xen_page_with_guest(                                       \
> +            virt_to_page((char *)(t)->status[i]), d, SHARE_rw);          \
> +    } while ( 0 )
> +
>  #define gnttab_shared_gmfn(d, t, i)                                      \
>      gfn_x(((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>  
> 
--8323329-136814967-1534355816=:15066
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-136814967-1534355816=:15066--
