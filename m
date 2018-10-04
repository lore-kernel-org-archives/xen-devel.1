From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 1/2] xentrace: allow sparse cpu list
Date: Thu, 4 Oct 2018 12:22:18 +0100
Message-ID: <2250bda9-41b5-6660-c259-87c3e02d8166@citrix.com>
References: <20181004105150.27923-1-jgross@suse.com>
 <20181004105150.27923-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------9F72093885B23D5AEC0EF0E4"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wqag=mq=citrix.com=prvs=8089523ff=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g81i3-0006Wv-6s
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 11:22:23 +0000
In-Reply-To: <20181004105150.27923-2-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George.Dunlap@eu.citrix.com, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

--------------9F72093885B23D5AEC0EF0E4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 10/04/2018 11:51 AM, Juergen Gross wrote:
> Modify the xentrace utility to allow sparse cpu list resulting in not
> all possible cpus having a trace buffer allocated.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

This looks good:

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Would you mind if I fold in the attached comment when committing?

 -George
> ---
>  tools/xentrace/xentrace.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
> index 364a6fdad5..590a91e091 100644
> --- a/tools/xentrace/xentrace.c
> +++ b/tools/xentrace/xentrace.c
> @@ -500,12 +500,14 @@ static struct t_struct *map_tbufs(unsigned long tbufs_mfn, unsigned int num,
>  
>      for(i=0; i<num; i++)
>      {
> -        
> -        const uint32_t *mfn_list = (const uint32_t *)tbufs.t_info
> -                                   + tbufs.t_info->mfn_offset[i];
> +        const uint32_t *mfn_list;
>          int j;
>          xen_pfn_t pfn_list[tbufs.t_info->tbuf_size];
>  
> +        if ( !tbufs.t_info->mfn_offset[i] )
> +            continue;
> +
> +        mfn_list = (const uint32_t *)tbufs.t_info + tbufs.t_info->mfn_offset[i];
>          for ( j=0; j<tbufs.t_info->tbuf_size; j++)
>              pfn_list[j] = (xen_pfn_t)mfn_list[j];
>  
> @@ -702,7 +704,8 @@ static int monitor_tbufs(void)
>  
>      if ( opts.discard )
>          for ( i = 0; i < num; i++ )
> -            meta[i]->cons = meta[i]->prod;
> +            if ( meta[i] )
> +                meta[i]->cons = meta[i]->prod;
>  
>      /* now, scan buffers for events */
>      while ( 1 )
> @@ -710,7 +713,10 @@ static int monitor_tbufs(void)
>          for ( i = 0; i < num; i++ )
>          {
>              unsigned long start_offset, end_offset, window_size, cons, prod;
> -                
> +
> +            if ( !meta[i] )
> +                continue;
> +
>              /* Read window information only once. */
>              cons = meta[i]->cons;
>              prod = meta[i]->prod;
> 


--------------9F72093885B23D5AEC0EF0E4
Content-Type: text/x-patch; name="sparse-cpu-comment.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="sparse-cpu-comment.diff"

diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
index 590a91e091..a897223592 100644
--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -489,7 +489,11 @@ static struct t_struct *map_tbufs(unsigned long tbuf=
s_mfn, unsigned int num,
         exit(EXIT_FAILURE);
     }
=20
-    /* Map per-cpu buffers */
+    /*=20
+     * Map per-cpu buffers.  NB that if a cpus is offline, it may have
+     * no trace buffers.  In this case, the the respective mfn_offset
+     * will be 0, and the index should be ignored.
+     */
     tbufs.meta =3D (struct t_buf **)calloc(num, sizeof(struct t_buf *));=

     tbufs.data =3D (unsigned char **)calloc(num, sizeof(unsigned char *)=
);
     if ( tbufs.meta =3D=3D NULL || tbufs.data =3D=3D NULL )

--------------9F72093885B23D5AEC0EF0E4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------9F72093885B23D5AEC0EF0E4--
