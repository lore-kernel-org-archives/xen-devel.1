Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBFBC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407258.1640363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D0-0005we-6Z; Thu, 03 Sep 2026 14:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407258.1640363; Thu, 03 Sep 2026 14:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D0-0005wU-2Y; Thu, 03 Sep 2026 14:14:30 +0000
Received: by outflank-mailman (input) for mailman id 1407258;
 Thu, 03 Sep 2026 14:14:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed4c6000c4f3@swg.vates.tech>)
 id 1x28Cz-0005p7-Hg
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28Cy-001H4c-Uh
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:28 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed4c6000c4f3@swg.vates.tech>)
 id 6a9980c3-2eae-0a2a0a5409dd-0a2a4506ae08-8
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:28 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed4c6000c4f3@swg.vates.tech>)
 id 6a9980c0-195a-0a2a45060019-b9ff1c238775-5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679ed4c6000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:17 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id D21A384009;
 Thu,  3 Sep 2026 16:14:16 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+6GkMIp/1eeu/JYU7MqSA0Jg0HqhrlFBR87a2YshFkM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iBocxmf2ySsOM/kuCSrJW50/IJxqr68w2FA1zILstYiuIRYahHRcntJXrekr6DDoIOn5foko0
 2EoCpgNC+nES1mV09YIAhvyGybjHB3A+dvdsYq1pIi2QSKoCfOVVZ1EC2foi9SqM5vjQRJs19og
 yg1dLPKscntAh9uvzloVQUxJdX7jq0t2QZw+aSk0gytQW9MIvvxjUPQYJjQ5MKSzNHeX5PMPSc3
 wY1KlZ2jLL16GUbySlI5Wcig9OyyKd7gZDbyqWmrdaD0XH0qfwLDWuNhGkgs1ed2i6YZPmAhT7D
 s0IIhwWfbAWRm8dHuqXtVTo7a/G1Dsmf1Fby+QD5JnQQ==
X-Zone-Loop: 1ff00ec3e46e6bd6b9f1e9af5dbd4868d064be86c2ad
x-campaign-type: default
x-transaction-id: db0da7ba-05bb-42ec-9404-4b1c1434aef6
x-swg-uid: 01-14015135-ea07-494e-a639-aea863dc84cb
X-Mailer: Sweego
Message-ID:
 <1788444857.8631fc262581453bbf619ec5b2062170.1a0679ed4c6000c4f3@vates.tech>
x-swg-bid: 1788444857.8631fc262581453bbf619ec5b2062170.1a0679ed4c6000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v5 04/11] x86/passthrough: Extract pt_irq_dpci_setup() from pt_irq_create_bind()
Date: Thu,  3 Sep 2026 16:14:02 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35a7.ad47fc3b5f677688.1a0679ed2ed.de73df203679ce07=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444857069
X-purgate-ID: tlsNG-16d1c6/1788444868-F70C777B-49ABC3EE/0/0
X-purgate-type: clean
X-purgate-size: 2904

---=Part.35a7.ad47fc3b5f677688.1a0679ed2ed.de73df203679ce07=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The setup preamble in pt_irq_create_bind() (lazily allocating
hvm_irq_dpci, looking up the struct pirq, and spinning until any pending
hvm_dirq_assist softirq has drained) is needed by the MSI bind path as
well=2E Move it into a static helper pt_irq_dpci_setup() that returns with
d->event_lock write-locked on success and hands the three looked-up
pointers back through out parameters=2E No functional change=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- The goto-to-loop conversion is now in the preceding patch, so this one
  just moves code around=2E
- Commit message reworded=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/drivers/passthrough/x86/hvm=2Ec | 32 +++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index a74521fb57=2E=2E7fcd3cc046 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -217,16 +217,14 @@ static struct vcpu *vector_hashing_dest(const struct=
 domain *d,
     return dest;
 }
=20
-int pt_irq_create_bind(
-    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
+static int pt_irq_dpci_setup(struct domain *d, unsigned int pirq,
+                             struct hvm_irq_dpci **hvm_irq_dpci_out,
+                             struct hvm_pirq_dpci **pirq_dpci_out,
+                             struct pirq **info_out)
 {
     struct hvm_irq_dpci *hvm_irq_dpci;
     struct hvm_pirq_dpci *pirq_dpci;
     struct pirq *info;
-    int rc, pirq =3D pt_irq_bind->machine_irq;
-
-    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
-        return -EINVAL;
=20
     for ( ; ; )
     {
@@ -282,6 +280,28 @@ int pt_irq_create_bind(
         break;
     }
=20
+    *hvm_irq_dpci_out =3D hvm_irq_dpci;
+    *pirq_dpci_out =3D pirq_dpci;
+    *info_out =3D info;
+
+    return 0;
+}
+
+int pt_irq_create_bind(
+    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
+{
+    struct hvm_irq_dpci *hvm_irq_dpci;
+    struct hvm_pirq_dpci *pirq_dpci;
+    struct pirq *info;
+    int rc, pirq =3D pt_irq_bind->machine_irq;
+
+    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
+        return -EINVAL;
+
+    rc =3D pt_irq_dpci_setup(d, pirq, &hvm_irq_dpci, &pirq_dpci, &info);
+    if ( rc )
+        return rc;
+
     switch ( pt_irq_bind->irq_type )
     {
     case PT_IRQ_TYPE_MSI:
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.35a7.ad47fc3b5f677688.1a0679ed2ed.de73df203679ce07=---

