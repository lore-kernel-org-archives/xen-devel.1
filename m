Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C3AC44508
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 13:40:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363136.1614943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzqu-00089U-V4; Wed, 15 Jul 2026 13:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363136.1614943; Wed, 15 Jul 2026 13:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzqu-00089N-Re; Wed, 15 Jul 2026 13:40:44 +0000
Received: by outflank-mailman (input) for mailman id 1363136;
 Wed, 15 Jul 2026 13:40:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f66020908000edb5@swg.vates.tech>)
 id 1wjzqt-00089B-LB
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 13:40:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjzqt-003NjP-1B
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 15:40:43 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f66020908000edb5@swg.vates.tech>)
 id 6a578dd8-5cb7-0a2a0a5109dd-0a2a4508a26e-12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:40:42 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f66020908000edb5@swg.vates.tech>)
 id 6a578dda-f659-0a2a45080019-b9ff1c23a4e7-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:40:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f66020908000edb5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 13:40:37 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id AA2DD822E4;
 Wed, 15 Jul 2026 15:40:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=yS8vP9GnZ+0xzLEsAjUUqVtirNGe6IX+4wuf965rsU4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=smY0Ldhnlt0ju/On5OIt31R5Kw9oUICBAsZGDGknbPWOHnkuGGLlgwE1LAiZBZDuWsEwT5qPI
 h25YwMzaaVMokqqroeCQ3ZAFqvCZZV8NrzgqP8iCwTR+F0Dhxy3g042+tR3pQiE0c5Cs0D+6Kh2
 sHxxoSZ8SbyWlmDrMX2PvWcSq2JOEYU7PY2a8pBRJ2J0DsQp7qL59Gdnf7TNXCwkGfKgjrVY91M
 7AyfnYB/7Ex9/SVoatD9GkXi5ePK5/234gdwNu6/s+apocXgybQgv+l//2TyI198u/M+z1xqyzn
 HXMcrEN7W+CHpYi1mjX0+dBiXUKOzOBpHodR2HZc+xWQ==
X-Zone-Loop: 75f535aa9b00bfc878f48229354b4a8eeeee1c4f8d6e
x-campaign-type: default
x-transaction-id: 81b0573a-b0e7-4e75-ae9f-289fadeb2a04
x-swg-uid: 01-eb049795-afce-4da2-a5f4-e6cb1b6d9d17
X-Mailer: Sweego
Message-ID:
 <1784122837.8631fc262581453bbf619ec5b2062170.19f66020908000edb5@vates.tech>
x-swg-bid: 1784122837.8631fc262581453bbf619ec5b2062170.19f66020908000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 1/2] vmx: Introduce TDX instruction exit reasons
Date: Wed, 15 Jul 2026 15:38:27 +0200
In-Reply-To: <1784122772.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@vates.tech>
References: <1784122772.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.890.c5c60b1e32e264a1.19f6602075d.785637313f19f3ab=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784122836829
X-purgate-ID: tlsNG-c1860d/1784122842-CCF4F87B-67669DB0/0/0
X-purgate-type: clean
X-purgate-size: 1856

---=Part.890.c5c60b1e32e264a1.19f6602075d.785637313f19f3ab=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On hardware that supports TDX, guests can cause VMEXIT related to
TDX instructions (SEAMCALL and TDCALL)=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh | 2 ++
 xen/arch/x86/include/asm/perfc_defn=2Eh  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmx=2Eh
index da04752e17=2E=2Eb8219e0408 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
@@ -201,6 +201,8 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc=
)
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
 #define EXIT_REASON_NOTIFY              75
+#define EXIT_REASON_SEAMCALL            76
+#define EXIT_REASON_TDCALL              77
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
=20
 /*
diff --git a/xen/arch/x86/include/asm/perfc_defn=2Eh b/xen/arch/x86/includ=
e/asm/perfc_defn=2Eh
index ac7439b992=2E=2E102b9be6ef 100644
--- a/xen/arch/x86/include/asm/perfc_defn=2Eh
+++ b/xen/arch/x86/include/asm/perfc_defn=2Eh
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
=20
 #ifdef CONFIG_HVM
=20
-#define VMX_PERF_EXIT_REASON_SIZE 76
+#define VMX_PERF_EXIT_REASON_SIZE 78
 #define VMEXIT_NPF_PERFC 166
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.890.c5c60b1e32e264a1.19f6602075d.785637313f19f3ab=---

