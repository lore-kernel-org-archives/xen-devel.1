Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DC6C98317
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 11:57:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432153.1653664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i4c-00030U-Od; Thu, 24 Sep 2026 11:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432153.1653664; Thu, 24 Sep 2026 11:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i4c-00030N-LW; Thu, 24 Sep 2026 11:57:10 +0000
Received: by outflank-mailman (input) for mailman id 1432153;
 Thu, 24 Sep 2026 11:57:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d346bb7600072c4@swg.vates.tech>)
 id 1x9i4b-00030A-I3
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 11:57:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9i4a-00GHwW-Uv
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 13:57:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d346bb7600072c4@swg.vates.tech>)
 id 6ab51009-bab6-0a2a0a5309dd-0a2a45099cb8-38
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:57:08 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d346bb7600072c4@swg.vates.tech>)
 id 6ab51014-be1a-0a2a45090019-b9ff1c239d61-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:57:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0d346bb7600072c4.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 24 Sep 2026 11:57:03 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id A0AD081BC9;
 Thu, 24 Sep 2026 13:57:02 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=vfl7bGD+ze0wdzwbimwGjn278qJxmVdn7i/sXvYd5YU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=D9JGfLSbCVAuwEO1Oj3DK8JcoYiGThpPRrn5J+3bbraEw8XI3ijj+YVANc8GJ/Ts+UcKrZPQb
 1k7nNs75+GB6ptYLBWb9qjPdJRi71yj1GIfHJbqUGvAR1igZthNKtFaAd5jyxqM4fXICn5Pef4b
 acHsKuuFfmbGJjs7mg/RZW0M92iXvL/CdKeDC/S3Jjs4UAvqSU0SXiFfV4WWkqzOilwdeqnmzaK
 BQHIEM9EH6jveL15OgcBoV1LmzwKG0XX7KSszD0XxGubNSDGKNBk8lJnlKQPcVpwBwI1lC0BYrL
 Snu3aib8l/X1EgEc8gXuwr2yPBmLOfeBAISIQ3OOI55Q==
X-Zone-Loop: 13123eb627616702cda6ae9aeb66064768f2e2126120
x-campaign-type: default
x-transaction-id: eb13b39e-63ea-4c42-9183-302a6576ce27
x-swg-uid: 01-158bd62e-43bf-41b1-84c9-e1ad41e7e18b
X-Mailer: Sweego
Message-ID:
 <1790251023.8631fc262581453bbf619ec5b2062170.1a0d346bb7600072c4@vates.tech>
x-swg-bid: 1790251023.8631fc262581453bbf619ec5b2062170.1a0d346bb7600072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 2/3] vm_event: svm: Fix incorrect monitored_msr() check
Date: Thu, 24 Sep 2026 13:56:35 +0200
In-Reply-To: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3d6.9b770b8b9dcd803a.1a0d346b9d6.9cd4415412d644c6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790251022806
X-purgate-ID: tlsNG-bad1c0/1790251028-BF6D2034-0AA31886/0/0
X-purgate-type: clean
X-purgate-size: 2120

---=Part.3d6.9b770b8b9dcd803a.1a0d346b9d6.9cd4415412d644c6=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

monitored_msr() is called with truncated MSR values (&=3D 0x1fff)
which doesn't match the original one, making the check incorrect=2E

Fix that by keeping the msr value intact and computing the bitmap
offset separately (in msr_offset)=2E

Fixes: 2746088d9cb4 ("svm: don't clear interception for MSRs required for =
introspection")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Should we multiply by 2 msr_offset instead of doing that in {set,clear}_bi=
t() ?

 xen/arch/x86/hvm/svm/svm=2Ec | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm=2Ec b/xen/arch/x86/hvm/svm/svm=2Ec
index 7a16289f85=2E=2Ed986f3aa8f 100644
--- a/xen/arch/x86/hvm/svm/svm=2Ec
+++ b/xen/arch/x86/hvm/svm/svm=2Ec
@@ -234,23 +234,22 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
 void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
 {
     unsigned long *msr_bit;
+    unsigned int msr_offset =3D msr & 0x1fff;
     const struct domain *d =3D v->domain;
=20
     msr_bit =3D svm_msrbit(v->arch=2Ehvm=2Esvm=2Emsrpm, msr);
     if ( msr_bit =3D=3D NULL )
         return;
=20
-    msr &=3D 0x1fff;
-
     if ( flags & MSR_INTERCEPT_READ )
-         __set_bit(msr * 2, msr_bit);
+         __set_bit(msr_offset * 2, msr_bit);
     else if ( !monitored_msr(d, msr) )
-         __clear_bit(msr * 2, msr_bit);
+         __clear_bit(msr_offset * 2, msr_bit);
=20
     if ( flags & MSR_INTERCEPT_WRITE )
-        __set_bit(msr * 2 + 1, msr_bit);
+        __set_bit(msr_offset * 2 + 1, msr_bit);
     else if ( !monitored_msr(d, msr) )
-        __clear_bit(msr * 2 + 1, msr_bit);
+        __clear_bit(msr_offset * 2 + 1, msr_bit);
 }
=20
 #ifdef CONFIG_VM_EVENT
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.3d6.9b770b8b9dcd803a.1a0d346b9d6.9cd4415412d644c6=---

