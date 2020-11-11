Return-Path: <SRS0=tVq8=ER=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E04C5517A
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 21:59:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A95320825
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 21:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDG3HI4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A95320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25371.53109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy9a-0007kq-GE; Wed, 11 Nov 2020 21:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25371.53109; Wed, 11 Nov 2020 21:59:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy9a-0007kJ-5G; Wed, 11 Nov 2020 21:59:46 +0000
Received: by outflank-mailman (input) for mailman id 25371;
 Wed, 11 Nov 2020 21:59:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3u-00064v-RK
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:54 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id faaf8b8e-c396-4fb1-8e30-4a2829c5ebe4;
 Wed, 11 Nov 2020 21:52:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k2so3999500wrx.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:57 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:55 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3u-00064v-RK
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:54 +0000
X-Inumbo-ID: faaf8b8e-c396-4fb1-8e30-4a2829c5ebe4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id faaf8b8e-c396-4fb1-8e30-4a2829c5ebe4;
	Wed, 11 Nov 2020 21:52:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k2so3999500wrx.2
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rfNmZKkQ9GXWazOVDjrBrED1XtwfKtN3kTzNIukG8jo=;
        b=FDG3HI4ZHFQ1tpEoeHroWB7sKALJuSzLT2s0Wk3a6dcimJwgnnhb2UTGDN+N9mjXQS
         SNNcOsCdSrOPtErpo7GBQpILhO+UCkLidYqp1hCn0m3xW1ueJEFc8Gsy2cYhcXUl0a9c
         1LHRczZ5NQ4SGLJ6F7rIYvTc/KzYutIQgWm9qjbqmd3iczlFY1pE6MZC0hiYzRwvWgcz
         tmbTBnSWc56V5mVcyuL4BkaYuReTjl82qf+pB/HVzKCZcGtEdDO+gkYy5KSGdeZiVB2J
         1j/lw3HPSiaV5DspnC6Q5waZ1eW6LSPjUWtbgH/GpsuN9EJGgTqXLboTaHDVV/coxTXp
         iuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rfNmZKkQ9GXWazOVDjrBrED1XtwfKtN3kTzNIukG8jo=;
        b=d7I9Btx34alxAC0eQ1b4zsl+MmGoTQvadrgsnyWrQjS0eRpSXBpSQ0CMiva8NkK8Cf
         me36xbOaE7RsjVfPflx5eos7uUgyKJcgFRFcru+0OJYOWClJYI0brP5P9f54sh2NaUXc
         TViDvzD2VkrP6eTAltUKu+/yFhfXZ0ChARzm9rwEjUknKITMKZ3ndHMn/vzPuh9fzYy+
         oTNszf2vA3LKtz3ZY92nO8ZpzMxXhuVJozh9EleZq/JqxVAfZ9ZZrBnvezeorifFzoW2
         u1qVOUHdDy6hfPzsGdNCQwahmpD0r8ZGBkK5XJhogj6zvAhwHTDchaV1QnET36VrgYH0
         AEzQ==
X-Gm-Message-State: AOAM531SpxrKFSp2bEXylTt4Tbjs5CjCdWw9JBBYIEf2X/K0b3PpQd9A
	28J02lhvhiQLNLzONvMUFz8rqrBT5MQ=
X-Google-Smtp-Source: ABdhPJxsDoo8botbsPJoNsZZSEN0xqfshqIiL0ER+EsuBlcdAQUToZNdg9NG7mwG5vyj0hFiyppkwQ==
X-Received: by 2002:adf:9cc6:: with SMTP id h6mr32447024wre.341.1605131576028;
        Wed, 11 Nov 2020 13:52:56 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:55 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 15/15] xen/arm: remove dependency on gcc built-in __sync_fetch_and_add()
Date: Wed, 11 Nov 2020 21:52:03 +0000
Message-Id: <20201111215203.80336-16-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

Now that we have explicit implementations of LL/SC and LSE atomics
helpers after porting Linux's versions to Xen, we can drop the reference
to gcc's built-in __sync_fetch_and_add().

This requires some fudging using container_of() because the users of
__sync_fetch_and_add(), namely xen/spinlock.c, expect the ptr to be
directly to the u32 being modified while the atomics helpers expect the
ptr to be to an atomic_t and then access that atomic_t's counter member.

By using container_of() we can create a "fake" (atomic_t *) pointer and
pass that to the atomic_fetch_add() that we ported from Linux.

NOTE: spinlock.c is using u32 for the value being added while the atomics
helpers use int for their counter member. This shouldn't actually matter
because we do the addition in assembly and the compiler isn't smart enough
to detect potential signed integer overflow in inline assembly, but I
thought it worth calling out in the commit message.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/system.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
index 65d5c8e423..0326e3ade4 100644
--- a/xen/include/asm-arm/system.h
+++ b/xen/include/asm-arm/system.h
@@ -58,7 +58,14 @@ static inline int local_abort_is_enabled(void)
     return !(flags & PSR_ABT_MASK);
 }
 
-#define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
+#define arch_fetch_and_add(ptr, x) ({                                   \
+    int ret;                                                            \
+                                                                        \
+    atomic_t * tmp = container_of((int *)(&(x)), atomic_t, counter);    \
+    ret = atomic_fetch_add(x, tmp);                                     \
+                                                                        \
+    ret;                                                                \
+})
 
 extern struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);
 
-- 
2.24.3 (Apple Git-128)


