Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6C606A685
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=S7JKSv+3
Received: from list by lists.xenproject.org with outflank-mailman.1501259.1697338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk0-00082n-Ei; Tue, 24 Nov 2026 16:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501259.1697338; Tue, 24 Nov 2026 16:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk0-00082d-BF; Tue, 24 Nov 2026 16:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1501259;
 Tue, 24 Nov 2026 16:51:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtjy-0007oQ-PY
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtjx-002XqQ-MP
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:33 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7835460001cf5@swg.vates.tech>)
 id 6b05c075-bab6-0a2a0a5309dd-0a2a4506b284-42
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:33 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7835460001cf5@swg.vates.tech>)
 id 6b05c095-195a-0a2a45060019-b9ff1c23ad3d-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:33 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e7835460001cf5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:28 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 184CA82B4D;
 Tue, 24 Nov 2026 17:51:28 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=O5UcJlrbTVtwPi5mf6lW3EM/Ud9RE85PuOuJY/RCIzs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=S7JKSv+3hbSyhbiYptAHbYfObMWwLMt4EArlX2Tc9sV+u7WmjwjgzJ+BoH7tfmmygjaPjXvmp
 bdqwxvlhktWf/gRFOzbu9Qpt5T7wqdmtodLa0N0O6SlE2dxUJ4J4HZ7bVHRYBQa+lhtW6SiQXXK
 z+0gsR1Pzp1DTwhNvX7+1rx5EJzVl2zkmus/YpMTAntxRclnjnqTkrxSSk23UyQgCVbcUPqFoCf
 stlTS94qn+P/9NW9qIJLrVEGgcURDiP9J0xJqJqf0DF2aBvsroO+mpL+oXLduVLpEh0hrHXDUq1
 z7+nZAPYVLFdhVv/NVkyrY0e3P5ipk+4IDMDRyqSrcpw==
X-Zone-Loop: 6fa52714eb11cce395c90a4b602b112970526e6beddc
x-campaign-type: default
x-transaction-id: 41ab0fa3-c432-4e3c-87fa-9c4929fdf0ef
x-swg-uid: 01-fe0d13d3-01ce-4773-a8a5-0e2ae1c8ac96
X-Mailer: Sweego
Message-ID:
 <1795539088.8631fc262581453bbf619ec5b2062170.1a20e7835460001cf5@vates.tech>
x-swg-bid: 1795539088.8631fc262581453bbf619ec5b2062170.1a20e7835460001cf5
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
Subject: [RFC PATCH v2 04/13] fastabi: Introduce xen_version op
Date: Tue, 24 Nov 2026 17:50:32 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.130.ffe0d75469549cea.1a20e7833c5.23e8029e77f776a1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539088325
X-purgate-ID: tlsNG-16d1c6/1795539093-1F6C877B-04E0E579/10/73395122804
X-purgate-type: spam
X-purgate-size: 3597
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.130.ffe0d75469549cea.1a20e7833c5.23e8029e77f776a1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Only XENVER_version and XENVER_get_features are exposed=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

 docs/guest-guide/fastabi/abi/version=2Eyml | 15 ++++++++++++
 xen/common/fastabi=2Ec                     |  4 ++++
 xen/common/kernel=2Ec                      | 30 ++++++++++++++++++++++++
 xen/include/xen/fastabi=2Eh                |  1 +
 4 files changed, 50 insertions(+)
 create mode 100644 docs/guest-guide/fastabi/abi/version=2Eyml

diff --git a/docs/guest-guide/fastabi/abi/version=2Eyml b/docs/guest-guide=
/fastabi/abi/version=2Eyml
new file mode 100644
index 0000000000=2E=2Ebce64a4d69
--- /dev/null
+++ b/docs/guest-guide/fastabi/abi/version=2Eyml
@@ -0,0 +1,15 @@
+name: version
+hypercall_index: 17
+
+subops:
+  version:
+    index: 0
+
+  get_features:
+    index: 6
+    input:
+      submap_idx: 2
+    output:
+      submap: 3
+    c_lang:
+      struct: xen_feature_info
diff --git a/xen/common/fastabi=2Ec b/xen/common/fastabi=2Ec
index 90228206de=2E=2E1e5d8bcd9c 100644
--- a/xen/common/fastabi=2Ec
+++ b/xen/common/fastabi=2Ec
@@ -15,6 +15,10 @@ void fastabi_dispatch(unsigned long index, struct cpu_u=
ser_regs *regs)
 {
     switch (index) {
     /* Wrappers over traditional hypercalls */
+    case __HYPERVISOR_xen_version:
+        do_xen_version_fast_op(regs);
+        break;
+
     default:
         fastabi_value_n(regs, 0) =3D -ENOSYS;
         break;
diff --git a/xen/common/kernel=2Ec b/xen/common/kernel=2Ec
index 631c95c235=2E=2E10f5c628a8 100644
--- a/xen/common/kernel=2Ec
+++ b/xen/common/kernel=2Ec
@@ -11,6 +11,7 @@
 #include <xen/version=2Eh>
 #include <xen/sched=2Eh>
 #include <xen/paging=2Eh>
+#include <xen/fastabi=2Eh>
 #include <xen/guest_access=2Eh>
 #include <xen/hypercall=2Eh>
 #include <xen/hypfs=2Eh>
@@ -768,6 +769,35 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(v=
oid) arg)
     return -ENOSYS;
 }
=20
+#ifdef CONFIG_FASTABI
+void do_xen_version_fast_op(struct cpu_user_regs *regs)
+{
+    long cmd =3D fastabi_value_n(regs, 1);
+    long rc =3D 0;
+
+    switch ( cmd ) {
+    case XENVER_version:
+        rc =3D (xen_major_version() << 16) | xen_minor_version();
+        break;
+    case XENVER_get_features:
+    {
+        uint32_t submap =3D 0, submap_idx =3D fastabi_value_n(regs, 2);
+
+        rc =3D xenver_get_features(current->domain, submap_idx, &submap);
+
+        if ( !rc )
+            fastabi_value_n(regs, 3) =3D submap;
+        break;
+    }
+    default:
+        rc =3D -ENOSYS;
+        break;
+    }
+
+    fastabi_value_n(regs, 0) =3D rc;
+}
+#endif
+
 void print_cmdline(void)
 {
     const char *cmdline;
diff --git a/xen/include/xen/fastabi=2Eh b/xen/include/xen/fastabi=2Eh
index 9d0ca5264a=2E=2E2427093dc7 100644
--- a/xen/include/xen/fastabi=2Eh
+++ b/xen/include/xen/fastabi=2Eh
@@ -8,4 +8,5 @@
 void fastabi_dispatch(unsigned long index, struct cpu_user_regs *regs);
 void fastabi_make_continuation(void);
=20
+void do_xen_version_fast_op(struct cpu_user_regs *regs);
 #endif /* XEN_FASTABI_H */
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.130.ffe0d75469549cea.1a20e7833c5.23e8029e77f776a1=---

