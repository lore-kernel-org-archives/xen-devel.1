Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B940CD6E4A
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:13:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328151.1592813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9kq-0004sE-KQ; Thu, 04 Jun 2026 15:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328151.1592813; Thu, 04 Jun 2026 15:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9kq-0004s7-Hl; Thu, 04 Jun 2026 15:13:08 +0000
Received: by outflank-mailman (input) for mailman id 1328151;
 Thu, 04 Jun 2026 15:13:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV9kp-0004s1-IY
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:13:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9ko-007nFN-Rq
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:13:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a219602-e002-0a2a0a5209dd-0a2a4509e2c6-2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:13:06 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a219602-2497-0a2a45090019-d155dd33e567-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:13:06 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45ee6d32402so481292f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:13:06 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda3651sm4117900f8f.32.2026.06.04.08.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:13:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780585986; x=1781190786; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MrUCA4DtmIf5qrWOuvr6vRjR70qr9YV5sreznrg2BQ=;
        b=DSPpmNGPLamN8vpJ0FAPy9ViRQy4oR20pdeo/xhoT0/1nIJ8MiglW1DcYnjuq/XSJ/
         /aXFY4oWt+7wnyxFkYCPwdimX5k2wgoHeEoS2gOXEzXDIdLbZXe9+t9k2QRr/cRETJxt
         y5ZlTweVOu1OULlqhmJ2DHhb4GmB4AtpBe/Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585986; x=1781190786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MrUCA4DtmIf5qrWOuvr6vRjR70qr9YV5sreznrg2BQ=;
        b=RDc/RcQAqeVJfM2+pP0kzq/uhOr8Vn9QCEWo2G7pPozGuE5esoLa0chKVDAYB42vXL
         ltBuw+RbgqBMOX+1y/Caa5qRP7yreIbwffEk6ydzmDBv0f0ndApjQOWdvDS6NL1ST9Mp
         hsW6jfhd5vcsV2Ro3T2SKFVyeg0+GPYqEBdw1hC4QM5XKeuKQ3TMlVkmNBgfha/8y73V
         MBtnnPc/7UiwMow5Aii4E/6mjZwtTgJQEbrDX2fDEA6FME+7X6D3HKRKd1CY4vKX2mO7
         lqSmSYpsblgkDBzebQFDVeRPTUYfPvRIarCiRjX/dmMQ+ccVD9+4JYXpCgzsENquahJW
         rxeg==
X-Gm-Message-State: AOJu0YwHu9atgxWaPZ931a+mjGZ9rUvAMLkL7CpnA9FGQZjfzZEsZCoR
	x86cQaT09OoTzrXqNGtz6vAFwFpL4W/ZyUFptkZMGA8iBddWd4WoGtpRdwPLtVAkmtkiDZP2QHg
	z6QSO
X-Gm-Gg: Acq92OEOztNRWlzeY0wi9AQxKNgJ8fdmH/NeHJclLzv+2jUMSgzi9fleY3Dc6LyYYA/
	JJzOVV/VwiIP7oi0a8S6zII1KrXOeyVVpzIcIBdaCcIgGzVYHhmGfYXSk4qTLnhNxgUwd/GhH2y
	PGHccd6EmUoI7pdowcqoeg5Gvl2ba5S2WjyI4xoETnK5NsJZCX69hwD3xMmCnb+eQcc0ddQBuB2
	Gp922/n5dMfUzNFCksF0hnl14xVryllfgGpcq4JbYoAuBFhah1IGRCRQDMJjU687Bf1jwlkWBuX
	RB28QxrS0E7AveUOwL+lwuOO/c2g/OQhk4w4AtwSA0YwPSnJggfsfZT1r3t/nulI54+Yq/2G+iS
	ct5WGiK+IN6xKRmg7e4KvClX0/04nBXE2zgS/mCfOZJ8aSuu8uzL3u1+yBoqCoyB6pZJpAjIx/p
	b6h+zy+uLnrMSUetXCyfSAMZMKwLa3S1y1y8hBMvOBn7OY/4C11S5dVPXMQNDVYhMlAHoyCaD83
	hkIItYM7E7oL7AwZCoZNH1Fhg==
X-Received: by 2002:a05:600c:698c:b0:48e:6db3:ff33 with SMTP id 5b1f17b1804b1-490b5d41d43mr150474815e9.14.1780585985920;
        Thu, 04 Jun 2026 08:13:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] MAINTAINERS: Update Ocaml maintainers
Date: Thu,  4 Jun 2026 16:13:03 +0100
Message-Id: <20260604151303.2720636-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780585986-4015DA53-0A99EA23/10/73395122804
X-purgate-type: spam
X-purgate-size: 1443

Christian has just left Citrix, and Dave almost a decade ago.

Andrii (a XAPI committer) has worked on oxenstored before and has agreed to
step up as a maintainer, and Guillaume wishes to get involved and learn too.
In practice I do a lot of the bindings work, so lets make things official.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Andrii Sultanov <andriy.sultanov@vates.tech>
CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77f72e52f46d..b62ea7c47753 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -453,8 +453,9 @@ F:	xen/arch/arm/include/asm/linflex-uart.h
 F:	xen/drivers/char/linflex-uart.c
 
 OCAML TOOLS
-M:	Christian Lindig <christian.lindig@citrix.com>
-M:	David Scott <dave@recoil.org>
+M:	Andrii Sultanov <andriy.sultanov@vates.tech>
+M:	Andrew Cooper <andrew.cooper3@citrix.com>
+R:	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
 S:	Supported
 F:	tools/ocaml/
 

base-commit: 0b03d963730b4c3df5b4583c054e2cd0d99758c2
-- 
2.39.5


