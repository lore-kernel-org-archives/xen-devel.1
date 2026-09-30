Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB0DCA5FCC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:19:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437475.1656387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx22-0006PK-Sj; Wed, 30 Sep 2026 16:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437475.1656387; Wed, 30 Sep 2026 16:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx22-0006P6-OC; Wed, 30 Sep 2026 16:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1437475;
 Wed, 30 Sep 2026 16:19:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx21-0006AA-Jc
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:19:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx21-0008es-0a
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:19:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd3681-8faa-0a2a0a5109dd-0a2a4507d690-46
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:44 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd36a0-b4ea-0a2a45070019-4a7de18ddd8a-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:44 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso40973325e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:19:44 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm2807245e9.1.2026.09.30.09.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:19:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785184; x=1791389984; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jP5teAbj/qkytYZEEH2E3nqfgZ1G5e5RzALaSNKJXI=;
        b=s9LXGZOTTmuaYu+K0r+8N2bnzpKvpytCfrMaunqjdBAKlymZ8AK3U7Dvp2NfWq05Lc
         ybczYe1BsmpFlnRmyqIYAfk1jEwTYD+YRZ6C3lvUsK7TefmmsN25CPpDYXYYbiQk7nX+
         X2tqKz8XLt+dYLVRE0kgfeU8VQBW1NCeDmDW95OwVfXY7xKcSreKOK340SnX3YQZ3vx9
         RdOcj62g0pZmWgq2JLgaVaA93IPTIHXmCEUDEfeproIGQyyQ2pDotiJlJ5QF6W4sVOpC
         NLhqD6wy5BMbI542LTkLhkNof2dYTDnQW5GfLqJQRJ8Vu6Mk4+U46J4wJ8nMBbcZwpOD
         JwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785184; x=1791389984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jP5teAbj/qkytYZEEH2E3nqfgZ1G5e5RzALaSNKJXI=;
        b=jnaAg9yofUlH9QWU+ip8Yu/v5qgUfupiLVhQj0aoCthFGNPdApfaobNxsrfxUBCuHV
         y8PfYp8b7x9rKISagklb89T5PVaFnGqpAu/KzoIX8KOJJMY/ahyzbdd/78NHxYFOWFRD
         i0hC2Dt7rWES7jpIAdNTYWxcTrC3FTlSO3lSJ4jWZwfWzS1XXqGuGTUUSIDxd9bb+WFY
         GgfzcSsE2L9pggtFzIVQYPhbhx5YSCA9TwlQvaZDGARuU0wZnuHO2hho2rDDy7/Q64Rz
         hEyG3hjPGdSHYFtbRRDKGqR5rSeNHA8RBk3HrIBUFAWyiDNTssgWlJnYEYzNzzzmk1V3
         mebw==
X-Gm-Message-State: AFuF++mPsJ5hAv7dRwG9DUMyNj2QWQraT/A2q4cuSQSaaaFPpL4KNJ9B
	7RrO4nCrUaQlHvw4qNzUTN9Ci5pIfZZLymUiYbKJUxrw5lCobjR9lNy8N4rHNA==
X-Gm-Gg: AYBFou2xI/Lm5Z4Y3tjfBbgZnpXGnPL650QFWpEw01KxMkJPa1O5SQtx2anJiNMFZQQ
	YxjebtVwuopEnmuL/stvXkzugsK3ZHtepeH6FxHpaHFJ85CVCFhYBTV9nKhsaDTCGqE2pqdgg8n
	2EQRDoj8YYxav1cdsY9o24rjVRsfVFPYTqRd7RL4+LejAJH06ugM6bdM6et7w0JI5QFImpvA4Xx
	abBGP8V56qM+1Ctzhk30q4OJNCV+hvpw9nt9IZgzEgnHtKw5TzPEPeE0ZS/LW59XTh+2tl/TIR/
	RkERcUWC+bGKNGbYyvUT3XtSDTfICkkFva8nEI7AJCuzzWF17IQPP8nNlWysOmYviQ0VYSXzNfj
	e6Q02lyZvMj/W/p4zapfLzf3TZBSkhh4GP7VWInjxjsZUyd7FC3PDXP6dqCmFp3Er9JQJ7VSdXn
	knglSEbTsPW13rE11IbzWGkveaGCaaDQZSvfYt3bSgJvGomHV8jCC3iqaq4gk339cmrZDj++lHH
	LBei7H6paUY50k6OJvAeRSUrJUfz9QacDkIP+El
X-Received: by 2002:a05:600c:8a16:10b0:4a0:b9:21b5 with SMTP id 5b1f17b1804b1-4a01b12cbcemr27098005e9.30.1790785184065;
        Wed, 30 Sep 2026 09:19:44 -0700 (PDT)
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
Subject: [PATCH v3 05/39] xen/riscv: use ~0 instead of ULONG_MAX to disable the VS-timer
Date: Wed, 30 Sep 2026 18:18:47 +0200
Message-ID: <96c87282b3c36e910f8d504a1c85e5802f75efad.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790785184-A50CDAE4-8CA6CDC5/10/73395122804
X-purgate-type: spam
X-purgate-size: 1845

vstimecmp is a 64-bit CSR independently of XLEN, which is why it is
written with csr_write64(). On RV32 that macro splits the value into
the vstimecmp/vstimecmph pair, so passing ULONG_MAX (0xffffffff there)
writes all ones to the low half and zero to the high half, leaving the
CSR at 0x00000000ffffffff rather than at its maximum. A VS-timer irq
would then become pending as soon as (time + htimedelta) reaches 2^32,
which is exactly what the code is trying to avoid.

Use ~0 instead: csr_write64() converts its argument to uint64_t, and the
conversion of the signed -1 sign-extends to all ones, so both halves get
0xffffffff. On RV64 the result is equal to ULONG_MAX, so no functional
change there.

Fixes: 25e032730690 ("xen/riscv: allow Xen to use SSTC while hiding it from guests")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v3:
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
 - Use ~0 instead of UINT64_MAX.
 - Update the subject and the commit message accordingly.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 602c029641b8..782d9cd450f3 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -101,8 +101,8 @@ void __init preinit_xen_time(void)
          * A VS-timer interrupt becomes pending whenever the value of
          * (time + htimedelta) is greater than or equal to vstimecmp CSR.
          * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
-         * ULONG_MAX.
+         * ~0.
          */
-        csr_write64(CSR_VSTIMECMP, ULONG_MAX);
+        csr_write64(CSR_VSTIMECMP, ~0);
     }
 }
-- 
2.55.0


