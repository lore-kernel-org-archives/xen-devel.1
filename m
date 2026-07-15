Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A695EC44501
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 13:41:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363138.1614951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzrB-0008UC-4Z; Wed, 15 Jul 2026 13:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363138.1614951; Wed, 15 Jul 2026 13:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzrB-0008U2-22; Wed, 15 Jul 2026 13:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1363138;
 Wed, 15 Jul 2026 13:40:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5@swg.vates.tech>)
 id 1wjzr9-0008SI-Cr
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 13:40:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjzr8-002mfL-Od
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 15:40:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5@swg.vates.tech>)
 id 6a578ddf-bab6-0a2a0a5309dd-0a2a45099892-40
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:40:58 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5@swg.vates.tech>)
 id 6a578dea-be1a-0a2a45090019-b9ff1c22916f-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:40:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f660249d4000edb5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 13:40:53 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0782381F5A;
 Wed, 15 Jul 2026 15:40:53 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=IYUxAUY+XUVrfvgMnF3AcIUyUaG4Dpyw2dYT3Z3A3Aw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=BO8Z1/siGNiVLYP8MliraOfVv0WezqdHoN2ynTqNf1p/nDz5Js/dZuB903NOwoVcz2utloVQn
 MVf5Zx5QYIEhMbHEmJwR4HpYony9TjuQZO2UvipsCS2V/sHjr0M9NyPYslJ4YHfhrMtU8qQqKk8
 2LpzQRwRPOJhDRrEdSZc9MzYyHbl29uqQrspPdxlgBLI0IEGL6/x7UrZiTZ7+yfiaFZIPGQrG+n
 ZGioTRQWpJkOLg40cd69+O3o1H0hTfStXQfeiuRjRIeQZE+If4kw7iU7kZMXxoBamaXpeMNdVqb
 cl5HkOHAnsFYW5lzwZM+JYNWXl+eztkMM2s9ykOUWtxg==
X-Zone-Loop: ed2350d586bedb6d5137f39db10d58a630329a1e3aa0
x-campaign-type: default
x-transaction-id: 9cbfeea0-89ee-4a48-9a2f-18f220b71af7
x-swg-uid: 01-0ac4104e-828d-4284-9190-5d09a9dc5283
X-Mailer: Sweego
Message-ID:
 <1784122853.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5@vates.tech>
x-swg-bid: 1784122853.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5
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
Subject: [RFC PATCH 2/2] vvmx: Reinject TDX instruction exit reasons to L1 when emitted by L2
Date: Wed, 15 Jul 2026 15:38:29 +0200
In-Reply-To: <1784122772.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@vates.tech>
References: <1784122772.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.891.1691f3a2d28ce8c7.19f66024750.264e79b43cc33c9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784122853200
X-purgate-ID: tlsNG-bad1c0/1784122858-BE2C4034-782739D8/0/0
X-purgate-type: clean
X-purgate-size: 1197

---=Part.891.1691f3a2d28ce8c7.19f66024750.264e79b43cc33c9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Reinject the exit reason to L1 rather than failing on "Unhandled nested vme=
xit"
which leads to a L1 crash that can be caused by L2 by executing one of the=
 TDX
instructions=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/hvm/vmx/vvmx=2Ec | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vvmx=2Ec b/xen/arch/x86/hvm/vmx/vvmx=2Ec
index e4cdfe55c1=2E=2Eb2ad7db332 100644
--- a/xen/arch/x86/hvm/vmx/vvmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vvmx=2Ec
@@ -2496,6 +2496,8 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *reg=
s,
     case EXIT_REASON_INVEPT:
     case EXIT_REASON_XSETBV:
     case EXIT_REASON_INVVPID:
+    case EXIT_REASON_SEAMCALL:
+    case EXIT_REASON_TDCALL:
         /* inject to L1 */
         nvcpu->nv_vmexit_pending =3D 1;
         break;
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.891.1691f3a2d28ce8c7.19f66024750.264e79b43cc33c9=---

