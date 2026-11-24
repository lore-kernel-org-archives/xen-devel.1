Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2492606A68D
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Kw/To/5C
Received: from list by lists.xenproject.org with outflank-mailman.1501270.1697404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk8-0001DH-O1; Tue, 24 Nov 2026 16:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501270.1697404; Tue, 24 Nov 2026 16:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk8-0001Bh-5H; Tue, 24 Nov 2026 16:51:44 +0000
Received: by outflank-mailman (input) for mailman id 1501270;
 Tue, 24 Nov 2026 16:51:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtk4-0000aA-UX
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtk4-004DBX-Ar
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:40 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e784dcb0001cf5@swg.vates.tech>)
 id 6b05c084-8faa-0a2a0a5109dd-0a2a450591b8-48
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:40 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e784dcb0001cf5@swg.vates.tech>)
 id 6b05c095-4cb1-0a2a45050019-b9ff1c228ac5-7
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:40 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e784dcb0001cf5.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:34 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6FF3E830AC;
 Tue, 24 Nov 2026 17:51:34 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=+4bHy0IML0jVFaIuqeRnwO3Aa1zWHCqLpRXiQxP5FZk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Kw/To/5C2qZ/IQiiuvguTMmMYLOMLB8qIcCtNJyomAS6PUw7omdZihDPlovA8qHj9ZXIEBJJe
 M5X40QTZ+TEaw6BO1puFB0Sr4IUNsi9BFcmMi06azN6bNj9K5k4jJo+BWCuxGpE5zArAkdzPIbz
 Wbge2QiWubtABlNmkutoO/cD/EEZyFh9yr5/TYH7h1MwrQ853J5DlDgVewwOTscdacaIjWDyuuh
 O57xPDHjTmt/V8Dn3uQjqTA8tubNmJHUqKVN+iVCIiBKA2UBWBNpV8xitLhnfK3NMrnl2F+oqWy
 U6P/omWSdgoZO6yzMaDHhVZGvTaLP+TdW7Jx1yt3km+g==
X-Zone-Loop: 69ca2979257fddce2f811e4358002eb48bd451a8b8c1
x-campaign-type: default
x-transaction-id: 0f876057-a114-4689-a1b2-f0e79fc2706f
x-swg-uid: 01-172c2447-69d2-4137-9817-4e756df18df8
X-Mailer: Sweego
Message-ID:
 <1795539095.8631fc262581453bbf619ec5b2062170.1a20e784dcb0001cf5@vates.tech>
x-swg-bid: 1795539095.8631fc262581453bbf619ec5b2062170.1a20e784dcb0001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 13/13] wip: light: Introduce fixed memory layout
Date: Tue, 24 Nov 2026 17:50:41 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.139.5f08ba00214532f.1a20e784c49.2d5c0276ca105c77=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539094602
X-purgate-ID: tlsNG-c201ff/1795539100-724B42A1-BBCD1607/10/73395122804
X-purgate-type: spam
X-purgate-size: 13154
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.139.5f08ba00214532f.1a20e784c49.2d5c0276ca105c77=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The idea here is to map things in advance for the guest, so the guest
doesn't need to use physmap manipulation hypercalls to setup shared_info,
grant table, =2E=2E=2E

Only grant-table v1 is supported=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

 tools/include/xen-tools/common-macros=2Eh |  4 ++
 tools/libs/guest/xg_dom_x86=2Ec           | 84 +++++++++++++++++++++++++
 tools/libs/light/libxl_create=2Ec         |  3 +-
 tools/libs/light/libxl_types=2Eidl        |  1 +
 tools/libs/light/libxl_x86=2Ec            | 75 ++++++++++++++++++++++
 tools/xl/xl_parse=2Ec                     |  2 +
 6 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/tools/include/xen-tools/common-macros=2Eh b/tools/include/xen=
-tools/common-macros=2Eh
index 1f9146b23b=2E=2E0e7aebdf42 100644
--- a/tools/include/xen-tools/common-macros=2Eh
+++ b/tools/include/xen-tools/common-macros=2Eh
@@ -73,6 +73,10 @@
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
 #define ROUNDDOWN(x, a) ((x) & ~((a) - 1))
=20
+#ifndef DIV_ROUNDUP
+#define DIV_ROUNDUP(n, d) (((n) + (d) - 1) / (d))
+#endif
+
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
 #define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
=20
diff --git a/tools/libs/guest/xg_dom_x86=2Ec b/tools/libs/guest/xg_dom_x86=
=2Ec
index 1dc19529f5=2E=2E55b216979f 100644
--- a/tools/libs/guest/xg_dom_x86=2Ec
+++ b/tools/libs/guest/xg_dom_x86=2Ec
@@ -624,6 +624,82 @@ static void build_hvm_info(void *hvm_info_page, struc=
t xc_dom_image *dom)
     hvm_info->checksum =3D -sum;
 }
=20
+/* Prepare special (shared_info, grant table, =2E=2E=2E) regions marked i=
n E820=2E */
+static int prepare_fixed_special_regions(xc_interface *xch, struct xc_dom=
_image *dom)
+{
+    int rc =3D 0; unsigned int i, j;
+    uint32_t domid =3D dom->guest_domid;
+    gnttab_query_size_t gnttab_query;
+    size_t gnttab_frame_count, gnttab_status_frame_count;
+   =20
+    gnttab_query=2Edom =3D domid;
+    rc =3D xc_gnttab_query_size(xch, &gnttab_query);
+
+    if ( rc !=3D 0 || gnttab_query=2Estatus !=3D GNTST_okay )
+    {
+        DOMPRINTF("Unable to query grant table size=2E");
+        return rc;
+    }
+
+    gnttab_frame_count =3D gnttab_query=2Emax_nr_frames;
+    gnttab_status_frame_count =3D DIV_ROUNDUP(
+        gnttab_frame_count * (XC_DOM_PAGE_SIZE(dom) / sizeof(grant_entry_=
v2_t)),
+        XC_DOM_PAGE_SIZE(dom) / sizeof(grant_status_t));
+
+    for ( i =3D 0; i < dom->e820_entries; i++ )
+    {
+        struct e820entry entry =3D dom->e820[i];
+        rc =3D 0;
+
+        switch ( entry=2Etype ) {
+        case XEN_HVM_MEMMAP_TYPE_SHARED_INFO:
+            rc =3D xc_domain_add_to_physmap(xch, domid, XENMAPSPACE_share=
d_info,
+                                          0, entry=2Eaddr >> PAGE_SHIFT);
+            break;
+        case XEN_HVM_MEMMAP_TYPE_GRANT_TABLE:
+            if ( gnttab_frame_count !=3D entry=2Esize >> PAGE_SHIFT )
+            {
+                DOMPRINTF("Invalid grant table memmap region size");
+                return -EINVAL;
+            }
+
+            for ( j =3D 0; j < gnttab_frame_count; j++ )
+            {
+                rc =3D xc_domain_add_to_physmap(xch, domid, XENMAPSPACE_g=
rant_table, j,
+                                              (entry=2Eaddr >> PAGE_SHIFT=
) + j);
+               =20
+                if ( rc !=3D  0 )
+                    break;
+            }
+            break;
+        case XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS:
+        {
+            if ( gnttab_status_frame_count !=3D entry=2Esize >> PAGE_SHIF=
T )
+            {
+                DOMPRINTF("Invalid grant table status memmap region size"=
);
+                return -EINVAL;
+            }
+
+            for ( j =3D 0; j < gnttab_status_frame_count; j++ )
+            {
+                rc =3D xc_domain_add_to_physmap(xch, domid, XENMAPSPACE_g=
rant_table,
+                                              j | XENMAPIDX_grant_table_s=
tatus,
+                                              (entry=2Eaddr >> PAGE_SHIFT=
) + j);
+               =20
+                if ( rc !=3D  0 )
+                    break;
+            }
+            break;
+        }
+        }
+
+        if ( rc !=3D 0 )
+            break;
+    }
+
+    return rc;
+}
+
 static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
 {
     unsigned long i;
@@ -718,6 +794,14 @@ static int alloc_magic_pages_hvm(struct xc_dom_image =
*dom)
         goto out;
     }
=20
+    rc =3D prepare_fixed_special_regions(xch, dom);
+
+    if ( rc !=3D 0 )
+    {
+        DOMPRINTF("Unable to prepare fixed special regions");
+        goto out;
+    }
+
     /*
      * Identity-map page table is required for running with CR0=2EPG=3D0 =
when
      * using Intel EPT=2E Create a 32-bit non-PAE page directory of super=
pages=2E
diff --git a/tools/libs/light/libxl_create=2Ec b/tools/libs/light/libxl_cr=
eate=2Ec
index a8b0c8c500=2E=2Ef27b6ceabe 100644
--- a/tools/libs/light/libxl_create=2Ec
+++ b/tools/libs/light/libxl_create=2Ec
@@ -405,7 +405,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
=20
         libxl_defbool_setdefault(&b_info->apic,                     true)=
;
         libxl_defbool_setdefault(&b_info->nested_hvm,               false=
);
-    }
+   }
=20
     if (b_info->max_grant_version =3D=3D LIBXL_MAX_GRANT_DEFAULT) {
         if (info=2Ecap_gnttab_v2)
@@ -2381,6 +2381,7 @@ int libxl_domain_create_restore(libxl_ctx *ctx, libx=
l_domain_config *d_config,
      * configuration=2E
      */
     libxl_defbool_setdefault(&d_config->b_info=2Earch_x86=2Emsr_relaxed, =
true);
+    libxl_defbool_setdefault(&d_config->b_info=2Earch_x86=2Efixed_mem_lay=
out, false);
     libxl_defbool_setdefault(&d_config->b_info=2Eu=2Ehvm=2Epirq, true);
=20
     return do_domain_create(ctx, d_config, domid, restore_fd, send_back_f=
d,
diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl_t=
ypes=2Eidl
index ce697303b6=2E=2E1232e11985 100644
--- a/tools/libs/light/libxl_types=2Eidl
+++ b/tools/libs/light/libxl_types=2Eidl
@@ -748,6 +748,7 @@ libxl_domain_build_info =3D Struct("domain_build_info"=
,[
                                ("arm_sci", libxl_arm_sci),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                               ("fixed_mem_layout", libxl_defbool),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it=
 is
     # supported by x86 HVM and ARM support is planned=2E
diff --git a/tools/libs/light/libxl_x86=2Ec b/tools/libs/light/libxl_x86=
=2Ec
index 9e8b48372d=2E=2E744b927f0f 100644
--- a/tools/libs/light/libxl_x86=2Ec
+++ b/tools/libs/light/libxl_x86=2Ec
@@ -1,6 +1,7 @@
 #include "libxl_internal=2Eh"
 #include "libxl_arch=2Eh"
 #include <xen/arch-x86/cpuid=2Eh>
+#include <xen/arch-x86/hvm/start_info=2Eh>
=20
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
@@ -50,6 +51,10 @@ static const char *e820_names(int type)
         case E820_ACPI: return "ACPI";
         case E820_NVS: return "ACPI NVS";
         case E820_UNUSABLE: return "Unusable";
+        case XEN_HVM_MEMMAP_TYPE_SHARED_INFO: return "HVM Shared Info";
+        case XEN_HVM_MEMMAP_TYPE_GRANT_TABLE: return "HVM Grant Table";
+        case XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS: return "HVM Grant Status"=
;
+        case XEN_HVM_MEMMAP_TYPE_FOREIGN_REG: return "HVM Foreign mapping=
 region";
         default: break;
     }
     return "Unknown";
@@ -691,10 +696,32 @@ static int domain_construct_memmap(libxl__gc *gc,
     /* We always own at least one lowmem entry=2E */
     unsigned int e820_entries =3D 1;
     struct e820entry *e820 =3D NULL;
+    uint64_t highmem_start =3D ((uint64_t)1 << 32);
     uint64_t highmem_size =3D
                     dom->highmem_end ? dom->highmem_end - (1ull << 32) : =
0;
     uint32_t lowmem_start =3D dom->device_model ? GUEST_LOW_MEM_START_DEF=
AULT : 0;
     unsigned page_size =3D XC_DOM_PAGE_SIZE(dom);
+    /* Special region starts at the first 1G boundary after the highmem *=
/
+    uint64_t special_region_start =3D
+        (highmem_start + highmem_size + GB(1) - 1) & ~(GB(1) - 1);
+    uint64_t special_region_offset =3D special_region_start;
+    size_t gnttab_frame_count, gnttab_status_frame_count;
+    gnttab_query_size_t gnttab_query;
+
+    gnttab_query=2Edom =3D domid;
+    rc =3D xc_gnttab_query_size(dom->xch, &gnttab_query);
+
+    if (rc !=3D 0 || gnttab_query=2Estatus !=3D GNTST_okay)
+    {
+        gnttab_frame_count =3D 0;
+        gnttab_status_frame_count =3D 0;
+        rc =3D 0;
+    }
+
+    gnttab_frame_count =3D gnttab_query=2Emax_nr_frames;
+    gnttab_status_frame_count =3D DIV_ROUNDUP(
+        gnttab_frame_count * (page_size / sizeof(grant_entry_v2_t)),
+        page_size / sizeof(grant_status_t));
=20
     /* Add all rdm entries=2E */
     for (i =3D 0; i < d_config->num_rdms; i++)
@@ -708,6 +735,18 @@ static int domain_construct_memmap(libxl__gc *gc,
     /* If we should have a highmem range=2E */
     if (highmem_size)
         e820_entries++;
+   =20
+    if (libxl_defbool_val(d_config->b_info=2Earch_x86=2Efixed_mem_layout)=
)
+    {
+        e820_entries++; /* XEN_HVM_MEMMAP_TYPE_SHARED_INFO */
+        if ( gnttab_frame_count )
+        {
+            e820_entries++; /* XEN_HVM_MEMMAP_TYPE_GRANT_TABLE */
+            if (d_config->b_info=2Emax_grant_version >=3D 2 && gnttab_sta=
tus_frame_count)
+                e820_entries++; /* XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS stat=
us */
+        }
+        e820_entries++; /* XEN_HVM_MEMMAP_TYPE_FOREIGN_REG */
+    }
=20
     for (i =3D 0; i < MAX_ACPI_MODULES; i++)
         if (dom->acpi_modules[i]=2Elength)
@@ -772,6 +811,41 @@ static int domain_construct_memmap(libxl__gc *gc,
         e820[nr]=2Eaddr =3D ((uint64_t)1 << 32);
         e820[nr]=2Esize =3D highmem_size;
         e820[nr]=2Etype =3D E820_RAM;
+        nr++;
+    }
+
+    /* Special regions */
+    if (libxl_defbool_val(d_config->b_info=2Earch_x86=2Efixed_mem_layout)=
)
+    {
+        e820[nr]=2Etype =3D XEN_HVM_MEMMAP_TYPE_SHARED_INFO;
+        e820[nr]=2Eaddr =3D special_region_offset;
+        e820[nr]=2Esize =3D page_size;
+        special_region_offset +=3D e820[nr]=2Esize;
+        nr++;
+
+        if ( gnttab_frame_count )
+        {
+            e820[nr]=2Etype =3D XEN_HVM_MEMMAP_TYPE_GRANT_TABLE;
+            e820[nr]=2Eaddr =3D special_region_offset;
+            e820[nr]=2Esize =3D gnttab_frame_count * page_size;
+            special_region_offset +=3D e820[nr]=2Esize;
+            nr++;
+
+            if (d_config->b_info=2Emax_grant_version >=3D 2 && gnttab_sta=
tus_frame_count)
+            {
+                e820[nr]=2Etype =3D XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS;
+                e820[nr]=2Eaddr =3D special_region_offset;
+                e820[nr]=2Esize =3D gnttab_status_frame_count * page_size=
;
+                special_region_offset +=3D e820[nr]=2Esize;
+                nr++;
+            }
+        }
+
+        e820[nr]=2Etype =3D XEN_HVM_MEMMAP_TYPE_FOREIGN_REG;
+        e820[nr]=2Eaddr =3D special_region_offset;
+        e820[nr]=2Esize =3D MB(512);
+        special_region_offset +=3D e820[nr]=2Esize;
+        nr++;
     }
=20
     if (xc_domain_set_memory_map(CTX->xch, domid, e820, e820_entries) !=
=3D 0) {
@@ -824,6 +898,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc=
 *gc,
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86=2Emsr_relaxed, false);
     libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
+    libxl_defbool_setdefault(&b_info->arch_x86=2Efixed_mem_layout, false)=
;
=20
     if (b_info->type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
         /*
diff --git a/tools/xl/xl_parse=2Ec b/tools/xl/xl_parse=2Ec
index 0ccece3e8a=2E=2E38fbf7be37 100644
--- a/tools/xl/xl_parse=2Ec
+++ b/tools/xl/xl_parse=2Ec
@@ -3096,6 +3096,8 @@ skip_usbdev:
                     "If it fixes an issue you are having please report to=
 "
                     "xen-devel@lists=2Exenproject=2Eorg=2E\n");
=20
+    xlu_cfg_get_defbool(config, "fixed_mem_layout", &b_info->arch_x86=2Ef=
ixed_mem_layout, 0);
+
     xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
=20
     xlu_cfg_destroy(config);
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.139.5f08ba00214532f.1a20e784c49.2d5c0276ca105c77=---

