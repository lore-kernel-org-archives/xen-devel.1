Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BCFC4451B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:25:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366379.1616265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkFn-00086F-4R; Mon, 20 Jul 2026 09:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366379.1616265; Mon, 20 Jul 2026 09:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkFn-000868-1b; Mon, 20 Jul 2026 09:25:39 +0000
Received: by outflank-mailman (input) for mailman id 1366379;
 Mon, 20 Jul 2026 09:25:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@swg.vates.tech>)
 id 1wlkFl-00085s-HL
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:25:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlkFj-000dZh-Ma
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:25:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@swg.vates.tech>)
 id 6a5de98b-2eae-0a2a0a5409dd-0a2a450791a6-14
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:25:35 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@swg.vates.tech>)
 id 6a5de98f-b4ea-0a2a45070019-b9ff1c23951b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:25:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f7ed8472c000edb5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Jul 2026 09:25:31 +0000
Received: from localhost.localdomain (155.223.66.37.rev.sfr.net
 [37.66.223.155]) (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5F1D982A70;
 Mon, 20 Jul 2026 11:25:30 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=pgtU90KgeUeGOFDF9ItC+4dH3+SZinr/HpH6NYK5Udg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=hzj8BeDDGCHpE8017mWYNoYkTj5ZtAOOelrUpOdZdwJfAUZmrSZwwMGKsNnO/SWMTZvgRI3Yg
 71dUW8UHHgqQFfTaj+GDaua3n6KSmDxQFFIcRAA58j+MYlKLtEQmbs+SfSvdCwDWNmPtR8MlwDR
 m2zqBF1CgOljCafgmA1/m+Y7f/L8Bi4hWDD2OMU6zphoOhDCJegYU6Vv103mtMG21aMiyn5HVwu
 ghuuF5VJytF8qKKNkX579wn2I0gWd0Z9/3Y1GBPlF5dQs/OzmpgROKYW5qS1cmj+whaq5q3Zuf2
 eY9S/IklRUYKDGV4GI68ERepld8gdrxlgKBx4aBOqHmQ==
X-Zone-Loop: 696c65d079122ed0f817b46e3a63fa1c03994ca2597e
x-campaign-type: default
x-transaction-id: 25d91398-700e-47bc-99f6-4122b6fefe42
x-swg-uid: 01-466a6398-ec91-424f-8921-d84f0263a921
X-Mailer: Sweego
Message-ID:
 <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
x-swg-bid: 1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Tu Dinh <ngoc-tu.dinh@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] x86/domctl: Introduce XEN_DOMCTL_SENDTRIGGER_DEBUG
Date: Mon, 20 Jul 2026 11:25:26 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.cbe.c6ff07809f2d7a1d.19f7ed8453b.85c8b2aae00e8b05=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784539530556
X-purgate-ID: tlsNG-ef75cf/1784539535-A4CCFAE4-434926F8/0/0
X-purgate-type: clean
X-purgate-size: 1903

---=Part.cbe.c6ff07809f2d7a1d.19f7ed8453b.85c8b2aae00e8b05=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

VIRQ_DEBUG causes guests to print their diagnostic information=2E
Currently, the only way to send VIRQ_DEBUG to a domain is via the 'q'
debug key=2E This method indiscriminately sends VIRQ_DEBUG to all domains
and vcpus=2E

When debugging guests, it's useful to have a way to target a specific
domain with VIRQ_DEBUG=2E Add XEN_DOMCTL_SENDTRIGGER_DEBUG for this
purpose=2E

Signed-off-by: Tu Dinh <ngoc-tu=2Edinh@vates=2Etech>
---
 xen/arch/x86/domctl=2Ec       | 5 +++++
 xen/include/public/domctl=2Eh | 1 +
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/domctl=2Ec b/xen/arch/x86/domctl=2Ec
index 07f712a0a4=2E=2E3b74ca1751 100644
--- a/xen/arch/x86/domctl=2Ec
+++ b/xen/arch/x86/domctl=2Ec
@@ -605,6 +605,11 @@ long arch_do_domctl(
             }
             break;
=20
+        case XEN_DOMCTL_SENDTRIGGER_DEBUG:
+            ret =3D 0;
+            send_guest_vcpu_virq(v, VIRQ_DEBUG);
+            break;
+
         default:
             ret =3D -ENOSYS;
             break;
diff --git a/xen/include/public/domctl=2Eh b/xen/include/public/domctl=2Eh
index 510300bb67=2E=2E8362e4e8f5 100644
--- a/xen/include/public/domctl=2Eh
+++ b/xen/include/public/domctl=2Eh
@@ -541,6 +541,7 @@ struct xen_domctl_address_size {
 #define XEN_DOMCTL_SENDTRIGGER_INIT   2
 #define XEN_DOMCTL_SENDTRIGGER_POWER  3
 #define XEN_DOMCTL_SENDTRIGGER_SLEEP  4
+#define XEN_DOMCTL_SENDTRIGGER_DEBUG  5
 struct xen_domctl_sendtrigger {
     uint32_t  trigger;  /* IN */
     uint32_t  vcpu;     /* IN */
--=20
2=2E55=2E0



-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.cbe.c6ff07809f2d7a1d.19f7ed8453b.85c8b2aae00e8b05=---

