Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973F2C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 11:56:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432147.1653657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i42-0002WF-FB; Thu, 24 Sep 2026 11:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432147.1653657; Thu, 24 Sep 2026 11:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i42-0002W8-BM; Thu, 24 Sep 2026 11:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1432147;
 Thu, 24 Sep 2026 11:56:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@swg.vates.tech>)
 id 1x9i41-0002W0-RZ
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 11:56:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9i40-00ESgq-Lf
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 13:56:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@swg.vates.tech>)
 id 6ab50fe7-bab6-0a2a0a5309dd-0a2a4501a264-18
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:56:32 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@swg.vates.tech>)
 id 6ab50ff0-5984-0a2a45010019-b9ff1c128407-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:56:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0d3463da200072c4.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 24 Sep 2026 11:56:31 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 33B0181C7E;
 Thu, 24 Sep 2026 13:56:30 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=eTWX2WdGLYZXeD1eAt/KWVZ7FoLWWCD3HQ4uh8l7BPI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=oSTt+Gv1Jd6mQo4POXduteqWgiYTVw6R3vIIf1aNCGPlrGn0prdCfi3zr/dPJrmgXqnDgZFH+
 qJWvevvTVy9T7PYDA/tXRSRcu1Ap+5FZjFhU2xYwdKcn4zJvKufhMIFYbArbbiMJTRIWzvfnSK0
 2k5ePji6vT8u3PubePAMlTJNd26RKLStkMFo9V0mozzbNor9Skj6UO863rG5PBtkBMWE2ZI72hv
 XaLvnIzGFp+g2XswtghY/DPabeq/uMco3dO+As7nXv0OkdoeOMjiyW+YW8vRQGa4mmj6nl4K+Fo
 gA5/mnrpiXEATVfEhI+urH/59pg2keQ2k+4g8BDCNZTQ==
X-Zone-Loop: 84793b4c4493e596a76e7d3e1c882968d7b48f441399
x-campaign-type: default
x-transaction-id: 7dfe51b2-bf94-4bf8-92b5-f687f16a9af1
x-swg-uid: 01-6621afb4-7c13-42f1-964d-3681abcbc246
X-Mailer: Sweego
Message-ID:
 <1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@vates.tech>
x-swg-bid: 1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4
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
Subject: [PATCH 1/3] vm_event: svm: Don't BUG() when enabling intercept on hypervisor MSR
Date: Thu, 24 Sep 2026 13:56:02 +0200
In-Reply-To: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3d5.7b6538e51e68e334.1a0d3463b1b.4a3c00cbe7847fd8=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790250990364
X-purgate-ID: tlsNG-d62444/1790250992-BE27A757-864A250C/0/0
X-purgate-type: clean
X-purgate-size: 1686

---=Part.3d5.7b6538e51e68e334.1a0d3463b1b.4a3c00cbe7847fd8=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

svm_msrbits() only cover MSRs in the ranges specified in APM and returns
NULL for all the other ones (i=2Ee hypervisor range), which triggers the
BUG_ON() that follows=2E

APM specifies that MSR outside the architectural and AMD specific ranges
are unconditionally intercepted, hence don't require any specific handling
by SVM logic, fix this by ignoring cases when msr_bit is NULL=2E

This is only reachable with CONFIG_VM_EVENT using XEN_DOMCTL_MONITOR_EVENT=
_MOV_TO_MSR
to configure a MSR intercept in the hypervisor range (0x40000000=E2=80=930=
x40001fff)=2E

Fixes: 6e9fc4d628b6 ("hvm/svm: Enable MSR events")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/hvm/svm/svm=2Ec | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/svm=2Ec b/xen/arch/x86/hvm/svm/svm=2Ec
index b5fc459e62=2E=2E7a16289f85 100644
--- a/xen/arch/x86/hvm/svm/svm=2Ec
+++ b/xen/arch/x86/hvm/svm/svm=2Ec
@@ -237,7 +237,9 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, i=
nt flags)
     const struct domain *d =3D v->domain;
=20
     msr_bit =3D svm_msrbit(v->arch=2Ehvm=2Esvm=2Emsrpm, msr);
-    BUG_ON(msr_bit =3D=3D NULL);
+    if ( msr_bit =3D=3D NULL )
+        return;
+
     msr &=3D 0x1fff;
=20
     if ( flags & MSR_INTERCEPT_READ )
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.3d5.7b6538e51e68e334.1a0d3463b1b.4a3c00cbe7847fd8=---

