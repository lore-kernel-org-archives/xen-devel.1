From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Tue, 24 Jul 2018 17:03:53 +0200
Message-ID: <20180724150353.GA23700@mail.soc.lip6.fr>
References: <5B20DC910200000204A693B0@prv1-mh.provo.novell.com>
 <5B20EAF702000078001CACA3@prv1-mh.provo.novell.com>
 <5B2197D3020000F004A75E9B@prv1-mh.provo.novell.com>
 <5B227CAD02000078001CB51F@prv1-mh.provo.novell.com>
 <5B30A8DD0200007003BD270D@prv1-mh.provo.novell.com>
 <5B3B92D602000078001D0619@prv1-mh.provo.novell.com>
 <5B3BA1A6020000F004B7A140@prv1-mh.provo.novell.com>
 <5B3F7C2F020000D004BA0458@prv1-mh.provo.novell.com>
 <5B4C73C30200007F03CE8FF3@prv1-mh.provo.novell.com>
 <5B4C7B2902000078001D4511@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="W/nzBZO5zC0uMSeA"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y+ru=ki=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fhyr0-00072s-Sf
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 15:03:58 +0000
Content-Disposition: inline
In-Reply-To: <5B4C7B2902000078001D4511@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 16, 2018 at 05:02:01AM -0600, Jan Beulich wrote:
> > Unfortunably there has been a crash last week:
> 
> Hmm, looks to be still all the same as before (except for the line
> number). I'm afraid I'm out of ideas, at least for the moment.

OK, FYI I commited xen 4.11 packages for NetBSD, with the attached
patch. With this the hypervisor doens't panic ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-zz-bouyer

$NetBSD: patch-zz-bouyer,v 1.1 2018/07/24 13:40:11 bouyer Exp $
Dirty hack to avoid assert failure. This has been discussed on xen-devel
but no solution has been fonud so far.
The box producing http://www-soc.lip6.fr/~bouyer/NetBSD-tests/xen/
is running with this patch; the printk has fired but the
hypervisor keeps running.

--- xen/arch/x86/mm.c.orig	2018-07-19 10:32:07.000000000 +0200
+++ xen/arch/x86/mm.c	2018-07-21 20:47:47.000000000 +0200
@@ -674,7 +674,12 @@
     typeof(pg->linear_pt_count) oc;
 
     oc = arch_fetch_and_add(&pg->linear_pt_count, -1);
-    ASSERT(oc > 0);
+    if (oc <= 0) {
+            gdprintk(XENLOG_WARNING,
+                 "mm.c:dec_linear_entries(): oc %d would fail assert\n", oc);
+	    pg->linear_pt_count = 0;
+    }
+    /* ASSERT(oc > 0); */
 }
 
 static bool inc_linear_uses(struct page_info *pg)

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--W/nzBZO5zC0uMSeA--
