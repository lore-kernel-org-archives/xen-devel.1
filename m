Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE49CC6B3C
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:50:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450166.1665679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHI61-0004Ed-Lk; Thu, 15 Oct 2026 09:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450166.1665679; Thu, 15 Oct 2026 09:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHI61-0004EW-Hc; Thu, 15 Oct 2026 09:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1450166;
 Thu, 15 Oct 2026 09:49:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ef7d4a80008425@swg.vates.tech>)
 id 1xHI60-0004EO-6D
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:49:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHI5z-006ngD-Bf
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:49:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ef7d4a80008425@swg.vates.tech>)
 id 6ad0a1b0-e002-0a2a0a5209dd-0a2a4505c54a-38
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:49:55 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ef7d4a80008425@swg.vates.tech>)
 id 6ad0a1c2-4cb1-0a2a45050019-b9ff1c12822b-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:49:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13ef7d4a80008425.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 09:49:51 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id A9FED80800;
 Thu, 15 Oct 2026 11:49:50 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=6RlUhvB6AHY8m8cD6GyZA12Spbn2MLCKxCBp/3ChPwM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=PRdRHQbqk2Do1cPyOIdezqMIGLv0PmjFEMFvTrytfoErgWiWEJIoxvXl/0E4GNYwK9L1U7+gc
 IO7MI7/N3iV3sWnxSWhYSZ25JdoN5RLtJZJfpzYiMouw5uxXK3UpmM7uu95AdPe+o1WZLpge+9c
 c0wfYWYLdBybtEjifSWeFQjT0fif47Ecm4h5uRuTpEqCWx0divw/UNCkSQzX3r9nms6MnuhIZTS
 D5FOQo0WHPyKDhhR2pO/+ffdN+EIvusMwboFHdzyp2imSBO+VuSQHEITfKFpby9LzPg8lgBdVwc
 gnJ7pv4fN0OoI0yYHLE+11mC8BdHZZRHVI0WdsnoNZDQ==
X-Zone-Loop: 5f7294a7590bec1c131570b2680c65f1beb9c2690acb
x-campaign-type: default
x-transaction-id: ba6498d1-7e3f-4958-b9de-6b4ae1850cd4
x-swg-uid: 01-be0167d9-8409-4abd-b064-7ff9917f9f18
X-Mailer: Sweego
Message-ID:
 <1792057791.8631fc262581453bbf619ec5b2062170.1a13ef7d4a80008425@vates.tech>
x-swg-bid: 1792057791.8631fc262581453bbf619ec5b2062170.1a13ef7d4a80008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] public/vcpu: Fix incorrect VCPUOP name in register_*_phys_area comment
Date: Thu, 15 Oct 2026 11:48:14 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.228.fccdf4703ccb23d3.1a13ef7d1ac.c84ef6a87e7070f4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792057790892
X-purgate-ID: tlsNG-c201ff/1792057795-732B32A1-6BC5FAAD/0/0
X-purgate-type: clean
X-purgate-size: 1498

---=Part.228.fccdf4703ccb23d3.1a13ef7d1ac.c84ef6a87e7070f4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This part of the comment is actually about VCPUOP_register_runstate_phys_ar=
ea
and not VCPUOP_register_runstate_memory_area=2E

Fixes: d5df44275e7a ("domain: introduce GADDR based runstate area registra=
tion alternative")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/include/public/vcpu=2Eh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/vcpu=2Eh b/xen/include/public/vcpu=2Eh
index f7445ac0b0=2E=2E5aea6ca709 100644
--- a/xen/include/public/vcpu=2Eh
+++ b/xen/include/public/vcpu=2Eh
@@ -233,7 +233,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area=
_t);
  * area=2E  Note that as long as an area is registered by physical addres=
s, the
  * linear address based area will not be serviced (updated) by the hyperv=
isor=2E
  *
- * Note that the area registered via VCPUOP_register_runstate_memory_area=
 will
+ * Note that the area registered via VCPUOP_register_runstate_phys_area w=
ill
  * be updated in the same manner as the one registered via virtual addres=
s PLUS
  * VMASST_TYPE_runstate_update_flag engaged by the domain=2E
  *
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.228.fccdf4703ccb23d3.1a13ef7d1ac.c84ef6a87e7070f4=---

