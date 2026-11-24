Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7DD606A684
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=q5hjpwvP
Received: from list by lists.xenproject.org with outflank-mailman.1501257.1697320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtjt-0007YN-TB; Tue, 24 Nov 2026 16:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501257.1697320; Tue, 24 Nov 2026 16:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtjt-0007YG-Q9; Tue, 24 Nov 2026 16:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1501257;
 Tue, 24 Nov 2026 16:51:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtjs-0007Ll-Eh
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtjr-00HDqX-Qz
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:27 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e782f510001cf5@swg.vates.tech>)
 id 6b05c089-8faa-0a2a0a5109dd-0a2a450bb894-12
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:27 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e782f510001cf5@swg.vates.tech>)
 id 6b05c08f-b7e8-0a2a450b0019-b9ff1c128d9f-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:27 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e782f510001cf5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:27 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 81DC982EDA;
 Tue, 24 Nov 2026 17:51:26 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=ZywbdQ8IOZAHrc7vY6RevModON/YZFMZVzmVFqua2Ws=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=q5hjpwvPKnuhY+yjVpVgG6z4qbH3O+Uh+16QszTrLvh177uVhQX045FEsVvMlLY0etYtSxi3h
 7LKtiGFfHJ4SCZwU3c9DIWWMd6A09MaOVmxPLgOSQAaD/daGBmEjQOcigo8HWSPaj8ul4lFEq3M
 jrV3rDPVsVSGiC1j+3+SC76pDT+oIbkmv4EuL7PRE7vK4vLw4HpR/PCKwR+4f/aeA4XxE86kXdX
 KJHwt50f23aJth7Tq+78V33bV9yA0wjF7GpIVLZltl6e+M8uktXKodUmGhVwXZo8WXsAeLMZ4Xs
 XCDfX/P4q4XZlontp6Tou7a4bmMvYGbho94MNw0AgkBQ==
X-Zone-Loop: 60396270dffa78fbe0b3a504d7e105d9648137e40635
x-campaign-type: default
x-transaction-id: 8160d14c-9a2a-40e5-8ec2-4156a5ec29f5
x-swg-uid: 01-cf81577d-abff-4526-bf6d-cd569d005b91
X-Mailer: Sweego
Message-ID:
 <1795539087.8631fc262581453bbf619ec5b2062170.1a20e782f510001cf5@vates.tech>
x-swg-bid: 1795539087.8631fc262581453bbf619ec5b2062170.1a20e782f510001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 02/13] common: Isolate XENVER_get_features into a separate function
Date: Tue, 24 Nov 2026 17:50:30 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.12e.9689aa92032ee805.1a20e782da1.23629412b1d18b33=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539086753
X-purgate-ID: tlsNG-42698a/1795539087-A98C19EA-4BE7904E/10/73395122804
X-purgate-type: spam
X-purgate-size: 5006
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.12e.9689aa92032ee805.1a20e782da1.23629412b1d18b33=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

That will be useful later on to introduce a new hypercall ABI=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

 xen/common/kernel=2Ec | 88 ++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 40 deletions(-)

diff --git a/xen/common/kernel=2Ec b/xen/common/kernel=2Ec
index 499023fae6=2E=2E631c95c235 100644
--- a/xen/common/kernel=2Ec
+++ b/xen/common/kernel=2Ec
@@ -563,6 +563,52 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDL=
E_PARAM(void) arg)
     return sz;
 }
=20
+static long xenver_get_features(struct domain *d, uint32_t submap_idx, ui=
nt32_t *submap)
+{
+    switch ( submap_idx )
+    {
+    case 0:
+        *submap =3D (1U << XENFEAT_memory_op_vnode_supported) |
+#ifdef CONFIG_X86
+                  (1U << XENFEAT_vcpu_time_phys_area) |
+#endif
+                  (1U << XENFEAT_runstate_phys_area);
+        if ( paging_mode_translate(d) )
+            *submap |=3D
+                (1U << XENFEAT_writable_page_tables) |
+                (1U << XENFEAT_auto_translated_physmap);
+        if ( is_hardware_domain(d) )
+            *submap |=3D 1U << XENFEAT_dom0;
+#ifdef CONFIG_ARM
+        *submap |=3D (1U << XENFEAT_ARM_SMCCC_supported);
+#endif
+#ifdef CONFIG_X86
+        if ( is_pv_domain(d) )
+        {
+            *submap |=3D (1U << XENFEAT_mmu_pt_update_preserve_ad) |
+                       (1U << XENFEAT_highmem_assist) |
+                       (1U << XENFEAT_gnttab_map_avail_bits);
+            if ( IS_ENABLED(CONFIG_PV32) && VM_ASSIST(d, pae_extended_cr3=
) )
+                *submap |=3D (1U << XENFEAT_pae_pgdir_above_4gb);
+        }
+        else
+            *submap |=3D (1U << XENFEAT_hvm_safe_pvclock) |
+                       (1U << XENFEAT_hvm_callback_vector) |
+                       (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0);
+        *submap |=3D (1U << XENFEAT_dm_msix_all_writes);
+#endif
+        if ( !paging_mode_translate(d) || is_domain_direct_mapped(d) )
+            *submap |=3D (1U << XENFEAT_direct_mapped);
+        else
+            *submap |=3D (1U << XENFEAT_not_direct_mapped);
+        break;
+    default:
+        return -EINVAL;
+    }
+   =20
+    return 0;
+}
+
 long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     bool deny =3D xsm_xen_version(XSM_OTHER, cmd);
@@ -669,47 +715,9 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(v=
oid) arg)
         if ( copy_from_guest(&fi, arg, 1) )
             return -EFAULT;
=20
-        switch ( fi=2Esubmap_idx )
-        {
-        case 0:
-            fi=2Esubmap =3D (1U << XENFEAT_memory_op_vnode_supported) |
-#ifdef CONFIG_X86
-                        (1U << XENFEAT_vcpu_time_phys_area) |
-#endif
-                        (1U << XENFEAT_runstate_phys_area);
-            if ( paging_mode_translate(d) )
-                fi=2Esubmap |=3D
-                    (1U << XENFEAT_writable_page_tables) |
-                    (1U << XENFEAT_auto_translated_physmap);
-            if ( is_hardware_domain(d) )
-                fi=2Esubmap |=3D 1U << XENFEAT_dom0;
-#ifdef CONFIG_ARM
-            fi=2Esubmap |=3D (1U << XENFEAT_ARM_SMCCC_supported);
-#endif
-#ifdef CONFIG_X86
-            if ( is_pv_domain(d) )
-            {
-                fi=2Esubmap |=3D (1U << XENFEAT_mmu_pt_update_preserve_ad=
) |
-                             (1U << XENFEAT_highmem_assist) |
-                             (1U << XENFEAT_gnttab_map_avail_bits);
-                if ( IS_ENABLED(CONFIG_PV32) && VM_ASSIST(d, pae_extended=
_cr3) )
-                    fi=2Esubmap |=3D (1U << XENFEAT_pae_pgdir_above_4gb);
-            }
-            else
-                fi=2Esubmap |=3D (1U << XENFEAT_hvm_safe_pvclock) |
-                             (1U << XENFEAT_hvm_callback_vector) |
-                             (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0=
);
-            fi=2Esubmap |=3D (1U << XENFEAT_dm_msix_all_writes);
-#endif
-            if ( !paging_mode_translate(d) || is_domain_direct_mapped(d) =
)
-                fi=2Esubmap |=3D (1U << XENFEAT_direct_mapped);
-            else
-                fi=2Esubmap |=3D (1U << XENFEAT_not_direct_mapped);
-            break;
-        default:
+        if ( xenver_get_features(d, fi=2Esubmap_idx, &fi=2Esubmap) )
             return -EINVAL;
-        }
-
+           =20
         if ( __copy_to_guest(arg, &fi, 1) )
             return -EFAULT;
         return 0;
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.12e.9689aa92032ee805.1a20e782da1.23629412b1d18b33=---

