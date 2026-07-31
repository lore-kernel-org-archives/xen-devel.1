Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53548C5516D
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 14:48:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379233.1623998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXO-0007u5-Q6; Fri, 31 Jul 2026 14:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379233.1623998; Fri, 31 Jul 2026 14:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXO-0007tX-Jd; Fri, 31 Jul 2026 14:48:38 +0000
Received: by outflank-mailman (input) for mailman id 1379233;
 Fri, 31 Jul 2026 14:48:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5f02e000e099@swg.vates.tech>)
 id 1wpoXN-0007pu-Dg
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 14:48:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpoXM-00CUBm-Qm
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 16:48:36 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5f02e000e099@swg.vates.tech>)
 id 6a6cb596-e002-0a2a0a5209dd-0a2a4507c5fc-48
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:36 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5f02e000e099@swg.vates.tech>)
 id 6a6cb5c0-b4ea-0a2a45070019-b9ff1c238c93-4
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:36 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fb8a5f02e000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 31 Jul 2026 14:48:30 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id EFCC980D94;
 Fri, 31 Jul 2026 16:48:29 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=L3onYAV8aLrFC8MKGiuBXOTF4iyXzPhnT9pxUplKeT4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=cUKEcnz1htkKxiFxpXUksGJxp7aZCYovoPSAteGJPi0x5X6zar0WKDNEEJFmq5hWbMYp5uljx
 H8zDglXDLnWfN+KdYGUUF1liqOSYIaqjrfYx8Tt3XAh8DPNAjy0XxnCGSE/IYsy3ykf5YpSeBBq
 jW9OF3Hqapdu7KVEZTuY8vYw+LjSTvr/zQhDA1eCT0qORZAb3d1dzbDR1edZnSC9HFBDol0ap6K
 wSE5wavTs+Q75bMYAue3bZ7G14ozKvqbMzHjCzja8NCqsxjjjqRLvFNXoZWDJcurpg7go3rN7TM
 iT4xzbmVH3gQ+/mnT+c6msUfux9pJYEQQcQolkwBR78Q==
X-Zone-Loop: 0dc776c2ae3f5bb33bc8e3fb7cbcc044b14e8f826308
x-campaign-type: default
x-transaction-id: b9cbb542-a60b-4003-949b-077bf72e366f
x-swg-uid: 01-90f2a8b1-11d3-4b88-8910-f14d831116a2
X-Mailer: Sweego
Message-ID:
 <1785509310.8631fc262581453bbf619ec5b2062170.19fb8a5f02e000e099@vates.tech>
x-swg-bid: 1785509310.8631fc262581453bbf619ec5b2062170.19fb8a5f02e000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [RFC PATCH v2 5/5] hvm: Allow specifying a prefered asid minimum
Date: Fri, 31 Jul 2026 16:46:23 +0200
In-Reply-To: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1903.350b18e29b0f18.19fb8a5eea1.ed20c68947823e4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785509310113
X-purgate-ID: tlsNG-ef75cf/1785509316-A64DBAE4-26DE68C8/0/0
X-purgate-type: clean
X-purgate-size: 2193

---=Part.1903.350b18e29b0f18.19fb8a5eea1.ed20c68947823e4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

To avoid clobbering all ASIDs that are below SEV-enabled guest maximum,
we want to allocate if possible all ASID over a "prefered minimum"
and fallback to below otherwise=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
This is currently unused, but will prove useful for SEV-ES=2E

 xen/arch/x86/hvm/asid=2Ec             | 8 ++++++++
 xen/arch/x86/include/asm/hvm/asid=2Eh | 1 +
 2 files changed, 9 insertions(+)

diff --git a/xen/arch/x86/hvm/asid=2Ec b/xen/arch/x86/hvm/asid=2Ec
index 1a21125161=2E=2E4ad3200c96 100644
--- a/xen/arch/x86/hvm/asid=2Ec
+++ b/xen/arch/x86/hvm/asid=2Ec
@@ -22,6 +22,9 @@ boolean_param("asid", opt_asid_enabled);
 bool __read_mostly asid_enabled =3D false;
 static unsigned long __ro_after_init *asid_bitmap;
 static unsigned long __ro_after_init asid_count;
+
+/* Default minimum ASID to use */
+unsigned long __read_mostly asid_default_min =3D 0;
 static DEFINE_SPINLOCK(asid_lock);
=20
 /*
@@ -67,6 +70,11 @@ int hvm_asid_alloc(struct hvm_asid *asid)
         return 0;
     }
=20
+    /* Try to allocate above default minimum */
+    if ( asid_default_min &&
+         !hvm_asid_alloc_range(asid, asid_default_min, asid_count) )
+        return 0;
+
     spin_lock(&asid_lock);
     new_asid =3D find_first_zero_bit(asid_bitmap, asid_count);
     if ( new_asid > asid_count )
diff --git a/xen/arch/x86/include/asm/hvm/asid=2Eh b/xen/arch/x86/include/=
asm/hvm/asid=2Eh
index b6df5cda35=2E=2E65373b29f6 100644
--- a/xen/arch/x86/include/asm/hvm/asid=2Eh
+++ b/xen/arch/x86/include/asm/hvm/asid=2Eh
@@ -20,6 +20,7 @@ extern bool asid_enabled;
 #else
 #define asid_enabled (false)
 #endif
+extern unsigned long asid_default_min;
=20
 /* Initialise ASID management distributed across all CPUs=2E */
 int hvm_asid_init(unsigned long nasids);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.1903.350b18e29b0f18.19fb8a5eea1.ed20c68947823e4=---

