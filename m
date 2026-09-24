Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86E8C98317
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 12:01:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432169.1653683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i8N-0005K8-GJ; Thu, 24 Sep 2026 12:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432169.1653683; Thu, 24 Sep 2026 12:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i8N-0005K1-Dd; Thu, 24 Sep 2026 12:01:03 +0000
Received: by outflank-mailman (input) for mailman id 1432169;
 Thu, 24 Sep 2026 12:01:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d34a4a2d00072c4@swg.vates.tech>)
 id 1x9i8M-0005Jv-2S
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 12:01:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9i8L-00EUBi-Bn
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 14:01:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d34a4a2d00072c4@swg.vates.tech>)
 id 6ab510f5-bab6-0a2a0a5309dd-0a2a450be2e0-44
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 14:01:01 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d34a4a2d00072c4@swg.vates.tech>)
 id 6ab510fc-b7e8-0a2a450b0019-b9ff1c2295e3-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 14:01:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0d34a4a2d00072c4.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 24 Sep 2026 12:00:56 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7AB718115F;
 Thu, 24 Sep 2026 14:00:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=DL1Sjx54yS3tmAgAz4HCxGgr8ta9fM3OGuAi6B3UhaY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=qJh/l/BVFLrgg3Tv+cv1hoLv6EKz6edTQMa4DNRu/u7Wa1YqZVi41eurNw2sqFFp8EVBldgVd
 Z/YLOtQfOvoekCpPJel/oo56MagUCB+wseJI+G3J9aTJy2fFyWl3dNeV1KXyd4E8nd6PT6OUhTo
 nH/kc0dchQr9j+4XGs2CKcflVqETDxpkTwpKxUvtfRUBRyrT4wy68al64OFElg/Up8iLMO+3pkb
 1Lo0ONtWSEQ1i5YR7HmmMZY860DIsmup9Aeb4SWH7ovHGLYDD11fFClSAVbOezxNDQGL3b+ulLT
 VsiXAW3OWoRPo0+Vs0NpAs1dXgqMHcrMkeAZqVwOVWbQ==
X-Zone-Loop: 952d021e65471d952c33df172676b51a1bb9850fb628
x-campaign-type: default
x-transaction-id: cd77b029-4c9b-4f61-880b-49d68627346f
x-swg-uid: 01-0544961e-4e18-4843-8ed0-1b3044505f4e
X-Mailer: Sweego
Message-ID:
 <1790251256.8631fc262581453bbf619ec5b2062170.1a0d34a4a2d00072c4@vates.tech>
x-swg-bid: 1790251256.8631fc262581453bbf619ec5b2062170.1a0d34a4a2d00072c4
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
Subject: [PATCH] x86emul: Fix AAM emulation AH output
Date: Thu, 24 Sep 2026 13:59:49 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3d8.66a918d7fbd1f921.1a0d34a4764.a014632262073314=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790251255653
X-purgate-ID: tlsNG-42698a/1790251260-196C29EA-C3195670/0/0
X-purgate-type: clean
X-purgate-size: 1595

---=Part.3d8.66a918d7fbd1f921.1a0d34a4764.a014632262073314=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

AAM is defined in APM as

AH =3D (AL/10d)
AL =3D (AL mod 10d)

However, due to the order of operations, we're incorrectly computing it as

AL =3D (AL mod 10d)
AH =3D (AL/10d) =3D ((originalAL mod 10d)/10d) =3D 0

Fix it by reordering the operations to match what's defined in APM
and avoid the unexpected dependency between the 2 operations=2E

Fixes: 8993572b9c16 ("x86emul: fold/eliminate some local variables")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/x86_emulate/x86_emulate=2Ec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate=2Ec b/xen/arch/x86/x86_e=
mulate/x86_emulate=2Ec
index 89c37fea2c=2E=2Ef168f3ebcf 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate=2Ec
+++ b/xen/arch/x86/x86_emulate/x86_emulate=2Ec
@@ -2511,8 +2511,8 @@ x86_emulate(
         else
         {
             generate_exception_if(!n, X86_EXC_DE);
-            _regs=2Eal =3D _regs=2Eal % n;
             _regs=2Eah =3D _regs=2Eal / n;
+            _regs=2Eal =3D _regs=2Eal % n;
         }
         _regs=2Eeflags &=3D ~(X86_EFLAGS_SF | X86_EFLAGS_ZF | X86_EFLAGS_=
PF);
         _regs=2Eeflags |=3D !_regs=2Eal ? X86_EFLAGS_ZF : 0;
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.3d8.66a918d7fbd1f921.1a0d34a4764.a014632262073314=---

