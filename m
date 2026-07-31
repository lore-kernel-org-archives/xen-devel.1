Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19B6C54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 14:48:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379229.1623975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXK-0007Ns-US; Fri, 31 Jul 2026 14:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379229.1623975; Fri, 31 Jul 2026 14:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXK-0007Nj-RZ; Fri, 31 Jul 2026 14:48:34 +0000
Received: by outflank-mailman (input) for mailman id 1379229;
 Fri, 31 Jul 2026 14:48:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5e190000e099@swg.vates.tech>)
 id 1wpoXI-0007Mg-QJ
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 14:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpoXI-00CUBm-5T
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 16:48:32 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5e190000e099@swg.vates.tech>)
 id 6a6cb5bc-e002-0a2a0a5209dd-0a2a4505a39a-12
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:32 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5e190000e099@swg.vates.tech>)
 id 6a6cb5bf-4cb1-0a2a45050019-b9ff1c129253-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fb8a5e190000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 31 Jul 2026 14:48:26 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3B49682040;
 Fri, 31 Jul 2026 16:48:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=2qgwMCEsfQoJSE+w5mPEOLJqRBQE14pEI8bg1CzQ6eM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HmB8+2fOR2KQevqLzasmmFsj/eAN9rqa8rwdqstLVY+CqOmOOgtPVte7Ry9NYe5uRYVk2a7ib
 Hp4pcrRXhg6I86o6yTinvq7WGJEOMryXk+0H37TNJQd6dsHYBuhHgh9rBKuwy6BxmBCTd8xHTZ7
 oIED5qJs5qZ9wdg69Zxigbm8XNE6HCLacJpudyuU/6V2kVGKTvsTPCC2i+xugMDad0//HEcc7g6
 xxCPxS6dwMiXq1pUMdXGz3e4Ne+b9F+zxUPj0s0dcxilTL8VNZaeqtcBNJCZrNAEkS1BnZCrDNK
 O0Aak4mChO/tYrJnBx1JNb6XOou6JOWM2Gdrg1ROD90A==
X-Zone-Loop: 47c8a1f21c0c342c4fd69db86a33c496ccb209efb6e5
x-campaign-type: default
x-transaction-id: 4d5951fa-a44c-427d-b4c1-40fbbcf2e252
x-swg-uid: 01-58888ac8-c2da-4684-8ca6-607bebee053b
X-Mailer: Sweego
Message-ID:
 <1785509306.8631fc262581453bbf619ec5b2062170.19fb8a5e190000e099@vates.tech>
x-swg-bid: 1785509306.8631fc262581453bbf619ec5b2062170.19fb8a5e190000e099
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
Subject: [PATCH v2 2/5] vmx: Introduce vcpu single context VPID invalidation
Date: Fri, 31 Jul 2026 16:46:20 +0200
In-Reply-To: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1900.1985a6e94661df73.19fb8a5e005.3e48b813fbc80f1a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785509306373
X-purgate-ID: tlsNG-c201ff/1785509312-F68B62A1-CE146D70/0/0
X-purgate-type: clean
X-purgate-size: 1618

---=Part.1900.1985a6e94661df73.19fb8a5e005.3e48b813fbc80f1a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Introduce vpid_sync_vcpu_context to do a single-context invalidation
on the vpid attached to the vcpu as a alternative to per-gva and all-conte=
xt
invlidations=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v2: Drop use of goto=2E

 xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmx=2Eh
index fe2cb4be0e=2E=2E08854c36ca 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
@@ -452,6 +452,20 @@ static inline void ept_sync_all(void)
=20
 void ept_sync_domain(struct p2m_domain *p2m);
=20
+static inline void vpid_sync_vcpu_context(const struct vcpu *v)
+{
+    int type =3D INVVPID_SINGLE_CONTEXT;
+
+    /*
+     * If single context invalidation is not supported, we escalate to
+     * use all context invalidation=2E
+     */
+    if ( unlikely(!cpu_has_vmx_vpid_invvpid_single_context) )
+        type =3D INVVPID_ALL_CONTEXT;
+
+    __invvpid(type, v->arch=2Ehvm=2En1asid=2Easid, 0);
+}
+
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
 {
     int type =3D INVVPID_INDIVIDUAL_ADDR;
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.1900.1985a6e94661df73.19fb8a5e005.3e48b813fbc80f1a=---

