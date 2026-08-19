Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA13DC5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:28:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395591.1633947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiDa-0004qH-36; Wed, 19 Aug 2026 15:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395591.1633947; Wed, 19 Aug 2026 15:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiDa-0004q5-03; Wed, 19 Aug 2026 15:28:42 +0000
Received: by outflank-mailman (input) for mailman id 1395591;
 Wed, 19 Aug 2026 15:28:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wwiDY-0004nj-G6
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:28:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwiDX-00H1ec-T1
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:28:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a85cb8f-8faa-0a2a0a5109dd-0a2a4508bc0c-44
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:28:39 +0200
Received: from [209.85.210.175] (helo=mail-pf1-f175.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a85cba6-f659-0a2a45080019-d155d2afd55e-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:28:39 +0200
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-84a4d8fd6ecso1218101b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:28:39 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d3617434sm787575b3a.29.2026.08.19.08.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 08:28:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153318; x=1787758118; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qexHZlqSFqOa+wu3jRbx9Js4zQ/0pHMbVWziLO2Koe8=;
        b=fvjeIXfqWr7lemEYCDFilUOYi0yQOdInrpXfqrQiShNPfmmQ0nMmlUapUqKye7H4aJ
         hUfD2EqmNb4r3lSBYTzDI8HBoxL4HuO3ngqhPnYwwqYvTxJJRKrq5r7yVf5P+Tm3l+b0
         bFNriKoAq05PvxExmuYrx9NscTe0j3KKtGVWGYfXMozJz/BJ3kkprPeeAIzOec5XVHUL
         Dkp/LGgTxnSEglAqUUoJMv5ie94P40V9Dag8fx35u2K46CBradPHQ8PPAX6PPbnWUXl4
         t8Oe7YpPrCjEwHRkRw+gFN6RuxT1QtNMCTumu6BZfpAVKV2gOLBol+ZJ4S82qO+fiqS5
         M4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153318; x=1787758118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qexHZlqSFqOa+wu3jRbx9Js4zQ/0pHMbVWziLO2Koe8=;
        b=AIGD12ByyomQi+ZQB6tpdaKPPHNmHdN9ruPcjW5FtwQ8BExZvFuCXyzhKHGKgxgML3
         2oVQdSM2B5ghDmTe6BQLWlWAILLP09ij54WpJ9EypAAltW6zTOTN3PZlThr3Mj7aV1mD
         KqFNxqal6BvDL2I0QeeJQHJwXjs7T3xoxLh6LgaClSRQvLDEBbONJy5zvZb+5TiTJxsx
         T1enbubVErZp3LCQKWiB9al9s1o+Atx4Ddb5OtKWM6YGxtqhwXyTBLw2TEbecpy9PA60
         SMvNQ9OBhVfQSnkmRXY3b02IoIr0ZLJi2ZtHKXL8OnkIeXm+skMCXfzW0EIJbopgh5oM
         /Iqw==
X-Gm-Message-State: AOJu0Yw//TKlln6NmyB01mNH+lZKBjhdnZ2KQDgoCgaHDU0sF62UGvwp
	lzyOJOCqZwrjGKVcWXxD7jVoQ55e5OUDAD04kwZ0eO40RdBZnyUErES3KT2hHAJM
X-Gm-Gg: AR+sD13F+DJYckygfntXMNV+cRFI/fQeHgeqrI95cCRsoaMnlDck6KCwLcTFhnSX/lG
	n5FJX98om1sZ2H7r5xrOwB+BqpV8ri9kS32BjoagV/t9A8Jw+JsGwi3FItXMNAnrUouEIGM2IHH
	s4YfrCS6A5qcwind/j7xyWlxk8VyT6dIVPB9OzlJUeFVtfT9mUlYcgU/vt3cHE+4hgle4Nbw9WG
	HqLUGzbFNKuup8A+8iSrcixlfFG5iMQ6OQq3ZKL8uI/hyq1Ug7s5K4PMVMulqDOeRZhGdpnURQz
	8mVyFfBZYkelKGa6C2GvtA3i70xYy1pqv3j5+ZitjEN6X+hux3Mn7sgz9GIAIji7n2ZyC2aABaA
	etD/rpS9bYU/kh4yq2WOKjZ1wPFaC1uU9GTSEbRO/vRIENPFjPachjSg1LIf6MbeVQ1SbJss6T3
	pBVujYd0WADp8AatjWCH0S9/ga7q0sGHZOXS3aHenWz2zvmKjOLy7ifDKbt3NjKzqx50kW7fFsa
	yAijTfxFWdKGfHqvPcNdzfC9U9UkveRkeNZYPY3ltk=
X-Received: by 2002:a05:6a00:f05:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-851d3847482mr9283456b3a.6.1787153317737;
        Wed, 19 Aug 2026 08:28:37 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 4/4] MAINTAINERS: add myself as reviewer of i.MX8M related patches
Date: Wed, 19 Aug 2026 23:28:21 +0800
Message-ID: <20260819152821.3361898-5-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152821.3361898-1-onlywig@gmail.com>
References: <20260819152821.3361898-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787153319-D4D7087B-AB079D30/0/0
X-purgate-type: clean
X-purgate-size: 835

I wrote the i.MX8M platform and UART support and can help review
patches touching these areas.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
- No changes.

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4dd97ffcad..c60afc93a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -365,6 +365,13 @@ F:	tools/misc/xenhypfs.c
 F:	xen/common/hypfs.c
 F:	xen/include/xen/hypfs.h
 
+IMX8M SUPPORT
+R:	Wig Cheng <onlywig@gmail.com>
+F:	xen/arch/arm/arm64/debug-imx-uart.inc
+F:	xen/arch/arm/include/asm/imx-uart.h
+F:	xen/arch/arm/platforms/imx8m.c
+F:	xen/drivers/char/imx-uart.c
+
 IMX8QM/QXP SUPPORT
 R:	John Ernberg <john.ernberg@actia.se>
 F:	xen/arch/arm/platforms/imx8qm.c
-- 
2.43.0


