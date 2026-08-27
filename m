Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106C5C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:21:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400923.1636574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvG-0006xf-PR; Thu, 27 Aug 2026 15:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400923.1636574; Thu, 27 Aug 2026 15:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvG-0006wf-M4; Thu, 27 Aug 2026 15:21:46 +0000
Received: by outflank-mailman (input) for mailman id 1400923;
 Thu, 27 Aug 2026 15:21:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvF-0006iX-Ll
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvF-009ktn-2G
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9055ff-e002-0a2a0a5209dd-0a2a450acd1a-24
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:45 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905608-f2d2-0a2a450a0019-d155802db59b-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:45 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49557167508so8907035e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:44 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844104; x=1788448904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/dDDGOGzuHSxVauVFneN7dbPUBeZfbUy36RLoY8ZRc=;
        b=ONTB6H+fcHwB2j4+vuP4upJ/bl3a4QDOAvTdqC7oiRT31H4GQZ9JpUa3HkmOMcx7Ct
         mGVqGkIQu2Os5RIRwx15vjUZYOP23FFngdDrkutWRUqz+HOLWUdUPe6SJMD8zuuYPcYq
         6+di/b28KUssTLVTw/OPFV8FULv00FBCJW1jV6k5i8+RQDtlZ2yd/hzq8Hr1edEED4V8
         rQyBrWFgpA2/UTTMBY2cNRUlo7pNS3RPTWtRm2o0ajD4Xn27FOmTAC3qE+pv4ymJQd2n
         9YIMU34fX6Tt1vMdrGmki61d72Lty+tac1xQ4RbM7Gz6YD+dsn+M1LkQ7kOAvqgyBF6W
         roiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844104; x=1788448904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/dDDGOGzuHSxVauVFneN7dbPUBeZfbUy36RLoY8ZRc=;
        b=WufwjoGfX4M2PIDIFjGpJaITrwAeoquDTF0t2dtWoL3tHgOqveIryDZiDePZhv9hQc
         OpRXEEWKL3kg/jEINCK6byjrKG7SDuxXV9o9u5ofe4tTQ0nrJIO6JoSg73+irgptrrrg
         mP44HVzIfQCluPo370NuXsSiL9gaLhAt4v1HTORHd8OoI+KFwx2rvLspn/rtnuOmb0F9
         LLmSYFi6xubDibu9+ILmkydNSBfb0jvY/HMn/ABuvZ7hKxGRhLv+RU11sgQ+hThqvs55
         8i6wChyw5LP0WE7SiOB0gh0Kua1RJc3rUaCnO0IPhsPt//pFN9DJtwPd/t7+jngcrKIi
         AU4A==
X-Gm-Message-State: AFuF++kVbhJplK0OdpartvNDgtd3zQTjIfDAq2Szn4+7Usdm+Vovh9UQ
	h9LNV7q9TqueqNtSs/Oks4/n5dBiJbWrbjqYVnJr7uFBOVMP2tQz/7zIr7ancg==
X-Gm-Gg: AR+sD10673tTbvAaM13niSOm1518B4B9FabcBunxz4l/n1uhbbg4gneYqD0RuLVycNu
	KGbaefJ0n6UC3ch95HVGVpAyzWGTKX5Isex57LahURowN70lskQSfUrNkaT6NeZH0S32kynECCl
	RjG7AO/0GGil1gaC5rm+/noY6i7yW/5q6NO5yfTDz1qnhdOJzqiP8klMxyMKzcI8G+doq9RTEhn
	okG8ceJf/tnRXb7OUp6dJvOpbe08kPvNKMwD1oiWk+ecfqi5HN1+oBdbyvyNrr4vsJmD8PcY0cF
	ARqnGngXKZeH/+z+36KJizh6NkNUC5uoJt4yqtfRDpG1teJEF/q5BuMXBGxA5L5oRsx6Wk/6xX/
	8UU5KCY8ciN0EiWZsIytJ/bzyMsvML0TObEQJFbovWKUGoDzbrRMj7GXyhFmPoSbqOzc0bEfSPd
	/twK3Jh4wysNm1fsPkfVGjlHOpTt4ikFM5OLSZMU5fwk4FeFG5AexaRKM60QyXoV/dMeSENoFlo
	EFzeXghQtxlTXnU+78/0d+2domGbpOu
X-Received: by 2002:a05:600c:3513:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-499dc82c0d7mr189600475e9.12.1787844104437;
        Thu, 27 Aug 2026 08:21:44 -0700 (PDT)
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
Subject: [PATCH v2 04/39] xen/riscv: introduce csr_read64()
Date: Thu, 27 Aug 2026 17:20:48 +0200
Message-ID: <0f7080ea4dc86a8bb3dae39d94e5b03e95d010c0.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787844105-510C9CFC-985064EA/10/73395122804
X-purgate-type: spam
X-purgate-size: 3037

csr_write64() already hides the RV32 split of a 64-bit CSR into a low and
a high half; add the read counterpart.

Reading the two halves isn't simply the mirror of writing them. A CSR which
hardware increments can carry from the low half into the high one between
the two reads, so a plain pair of reads can produce a value the CSR never
held. Therefore the high half is re-read and the sequence retried if it
changed in the meantime.

Use it for CSR_TIME, which is exactly such a counter, and widen cycles_t to
uint64_t. Otherwise get_cycles() would still truncate the time counter to
32 bits on RV32.

Fixes: a541ddadec0a ("xen/riscv: introduce time.h")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/include/asm/csr.h  | 24 ++++++++++++++++++++++++
 xen/arch/riscv/include/asm/time.h |  4 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 888d6a2a86d6..a5cdd6f99c8e 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -39,12 +39,36 @@
     csr_write(csr, v_);             \
     csr_write(csr ## H, v_ >> 32);  \
 })
+
+/*
+ * The two halves are read by separate instructions, so a CSR which hardware
+ * increments can carry from the low half into the high one in between,
+ * yielding a value the CSR never held. Re-read the high half and retry the
+ * sequence if it changed.
+ */
+#define csr_read64(csr)                         \
+({                                              \
+    uint32_t hi_, lo_;                          \
+                                                \
+    do {                                        \
+        hi_ = csr_read(csr ## H);               \
+        lo_ = csr_read(csr);                    \
+    } while ( hi_ != csr_read(csr ## H) );      \
+                                                \
+    ((uint64_t)hi_ << 32) | lo_;                \
+})
 #else
 #define csr_write64(csr, val)       \
 ({                                  \
     csr_write(csr, val);            \
     (void)csr ## H;                 \
 })
+
+#define csr_read64(csr)             \
+({                                  \
+    (void)csr ## H;                 \
+    csr_read(csr);                  \
+})
 #endif
 
 #define csr_swap(csr, val)                                      \
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index 4d68900151a7..ec771c3fe80f 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -18,11 +18,11 @@ static inline void force_update_vcpu_system_time(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-typedef unsigned long cycles_t;
+typedef uint64_t cycles_t;
 
 static inline cycles_t get_cycles(void)
 {
-    return csr_read(CSR_TIME);
+    return csr_read64(CSR_TIME);
 }
 
 void preinit_xen_time(void);
-- 
2.55.0


