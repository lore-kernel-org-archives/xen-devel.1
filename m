Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680C8C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:21:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400925.1636589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvJ-0007IJ-E8; Thu, 27 Aug 2026 15:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400925.1636589; Thu, 27 Aug 2026 15:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvJ-0007Hn-80; Thu, 27 Aug 2026 15:21:49 +0000
Received: by outflank-mailman (input) for mailman id 1400925;
 Thu, 27 Aug 2026 15:21:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvI-0007E9-NQ
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvI-009ktn-3z
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:48 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9055ff-e002-0a2a0a5209dd-0a2a450acd1a-34
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:48 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90560b-f2d2-0a2a450a0019-d155802fedc9-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:48 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so21329235e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:48 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844107; x=1788448907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/PHkzPjuuueFQEDbht4GQqNTPSC6pSyUCZiwcakFlI=;
        b=XeaZQUHvcgIMXaRPZ9PVtrHNfvsivPMMVlSwf8i7foGR93SHmxmS/BtMAgCCfRh/bl
         ASvBlzRFm5nqbyyvuZMBlFhb6LnZ0E65i89Wb+7TwEOncYswDz+//8dxfA7XQzvAvL+0
         TmIHMWp2Nx5IsJkj7Z/bxvi8jFv7ty1jNCgIORY2Hpq7b7uptnbSkn6ZJYJ6DOjI2FGG
         CEoGy7upRwVW+WxTYv3k4+p4MZuwsqQcj+vniN6jvgIufKoWKj9u+MXqyZ1FbxKR9H6s
         JR04C9ygA6HXDkcCK9FgJKdLWZrenoBX2PbwJl9Whye1cAscnnew0jBv193NywUvNzDX
         ptbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844107; x=1788448907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/PHkzPjuuueFQEDbht4GQqNTPSC6pSyUCZiwcakFlI=;
        b=OqBV+YebLWX7hziV4kzA//my2VO3SiiPOggDCaVkZ14IFbAZ2fda4exb600JtMQKNx
         nc37kCu3oVacEQZ4D4Gr0tDhCQLsX+FzZLHAsC75XppPQzzXny4M44rNwxrA4Bq2DBNP
         AUxilbdKeBR2IGu/8rIqtLWv3MYEdfTzeOP7WibtKKWGkSr1hE4PXzAs0PltqbDCUNkx
         R5AM57yQPP9MwcHLnoC5M/tVkeTIuMhtUa20NQtK46yHZYL0/VpclwNscyUD6kvPNLLU
         /iUdE0ZTaTZdt68NcnN7ijiIDU7H62BUii7NTjl9cFhjYukIiVk7Y6SdNmWPuTPHKb8G
         4nWA==
X-Gm-Message-State: AFuF++nOhKRz//5p6Dw0TGgk1AeJx/yZw0WaCYvjB24j54qW5unWp0sb
	hBw4qARh9ZauMQVXABkGseqhsXNDT77DBXu6Op1gKPB6zoSAWB7TKi0Hu3DbMg==
X-Gm-Gg: AR+sD13L2yf3P13J7tAVJQMFFBU7inPsVB7BWr3pleofcqmODTE2Ijoa53HQdt9DJkM
	ANOEZtZ5lC7+xlooUwj5sRZyrK4giV0Srh/TDw4s0Ea17H8lFSQxulGJgqFbC6OAQz69M6X23nt
	T2PMQYbpR5mBvdfbDDuo6q3GaqZ7uv4KyE1dJQMw6UmaNaEarsVB34kSM5RB9hbLKm5lz0vwWuP
	qxbjW7q/DygVFC9LP1iDHD01yYRsQuszwM9/nP6PMuspoKPNI2pR6psM+6ak7jpTD37TUAzM6eQ
	Mp0nHoT6tHarfQ5rgMMUfXQy+KeoAdA0MyXd0Cnq+oStFR42KfX6a9ONbFHRi/ekZ9I68DuXvib
	6FRX7kCQISFKOamGO0q3orHtQQYvQvCks4DHSlqCNn57Fd9jQ5tgcpgT8NQwm82Icv7AuqYU0II
	2h4CFJOBzjcX8Zl8zwIyOOKNtsW4aGE0+DjT1JUCAzeGiW/E/a4pPTCf9FRe17zKh64c+bEfcr6
	yeLdZ3Ul63tdRmXeLI2pCUoTb9AKQUNT/BT9bFYc6U=
X-Received: by 2002:a05:600c:1d15:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49b0d4570b4mr123481185e9.8.1787844107010;
        Thu, 27 Aug 2026 08:21:47 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 06/39] xen/riscv: use UINT64_MAX to disable the VS-timer
Date: Thu, 27 Aug 2026 17:20:50 +0200
Message-ID: <93829c39b080d288ea342c7375d5307f93ee9a29.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787844108-518C5CFC-04893859/10/73395122804
X-purgate-type: spam
X-purgate-size: 1505

vstimecmp is a 64-bit CSR independently of XLEN, which is why it is
written with csr_write64(). On RV32 that macro splits the value into
the vstimecmp/vstimecmph pair, so passing ULONG_MAX (0xffffffff there)
writes all ones to the low half and zero to the high half, leaving the
CSR at 0x00000000ffffffff rather than at its maximum. A VS-timer irq
would then become pending as soon as (time + htimedelta) reaches 2^32,
which is exactly what the code is trying to avoid.

Use UINT64_MAX, which matches the width of the CSR. On RV64 it is equal
to ULONG_MAX, so no functional change there.

Fixes: 25e032730690 ("xen/riscv: allow Xen to use SSTC while hiding it from guests")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 602c029641b8..8c25198b4063 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -101,8 +101,8 @@ void __init preinit_xen_time(void)
          * A VS-timer interrupt becomes pending whenever the value of
          * (time + htimedelta) is greater than or equal to vstimecmp CSR.
          * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
-         * ULONG_MAX.
+         * UINT64_MAX.
          */
-        csr_write64(CSR_VSTIMECMP, ULONG_MAX);
+        csr_write64(CSR_VSTIMECMP, UINT64_MAX);
     }
 }
-- 
2.55.0


