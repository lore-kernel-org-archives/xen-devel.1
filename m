Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362C3CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:19:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437473.1656369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx20-0005wB-CK; Wed, 30 Sep 2026 16:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437473.1656369; Wed, 30 Sep 2026 16:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx20-0005w1-7a; Wed, 30 Sep 2026 16:19:44 +0000
Received: by outflank-mailman (input) for mailman id 1437473;
 Wed, 30 Sep 2026 16:19:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx1y-0005se-Vd
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:19:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx1y-00Ezzr-Ce
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:19:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd3695-bab6-0a2a0a5309dd-0a2a4504a40e-6
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:42 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd369e-b57f-0a2a45040019-4a7de14ca077-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:42 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6350f91so3275942f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:19:42 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm2807245e9.1.2026.09.30.09.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:19:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785182; x=1791389982; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndysInZFRd3KJAfO9tj2iTZ8cZtuOYLRyLiwdhRF1Ws=;
        b=i0n2+LqB9ipLcUCuj9QvswiknGlgxvl2/eQhgWcFZ89ORbTbxW+QegYpEXvGeQTxmT
         /THlwbHqXk2CjvteoEXMeTvlo6I3rAoNBwQYt+fQdFdOdqDa55JDDckwIgEBDAahnkJd
         NawKBUth/SDy84mwblmwYgIXH3BdKFAFoHJqxjH1Xq2mzsRO8iRSZIAvZochKDB/2nUE
         RXmWyZpAAYr/CtNPpqtnW8eQAomWN9nMA2CDnBaN2LVyLIYeeKGPoz5H6mrBpRLEYSVz
         ODExDz5jOLoZnpuGTv2BwR/aVRslR2f0m9QOqu95qjSUc6vTpFDf2TNLJyP2oqT5tRiM
         zxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785182; x=1791389982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndysInZFRd3KJAfO9tj2iTZ8cZtuOYLRyLiwdhRF1Ws=;
        b=0jlHR58QwxePkr1NNdUfCt8TjRZyZMKNrZLCRcwnqJQlJWTk2dHKFEEmP07Kb/t8Cf
         +Gkeu5/iD57IGFUdad+4bcMTbrpSn3CKAGrhE21rJEgvI+FahzZ9GhXG9j1qRMFwr3T6
         p/uo1cBTV+wciwZDLFKCnGFEvNYSaJaUwrqmlbZ9WqKTW/NWnsdkUmzqGr5S1XdJZ4sW
         qwSa6/RcAP3fP6cFGmo93B72A02/8PUWWyQHTnzTedW5lvNjvsEFzQP06fsUN2+pmrA9
         3z0rRGWyM8veomGLVN+rIrVLrGhK/12Fm/KlZc8XDliG2Zz/8VbfuhW3nfWF8DB3trx4
         ekUw==
X-Gm-Message-State: AFuF++koxhfvyP5d8hKo4nv8j8st1pTSwJS6nPpHa9T/JFPy+hlHMU98
	FrTEJTjiNKTZh21Gg+HgUEg/sG7Od7+++zJwtQJGyCiq/WU2CTgpL/kep/ZZHg==
X-Gm-Gg: AYBFou2Bstr1PntaMEo1cmrg9lBPOtjlu6OheZEoE3Vk9BiGOj1P2QMc9ysQHYTRSuz
	nLEUvt77hxNFmuAXXxNpX2MbXA/j5ZSbclaLpbZrcNguEb1Ifd5R0HFgwcVEwQUml0OWLlPm0Vy
	UanXE9jXBv1F0BLQj8Zx207uZXxJVfu8ZzaX5a2kMyh3ID2EAGc5V3ulKJD52TaV05NL2s/bkfH
	dNOY6uSAyOKCwZ4AmsiXqySqNchQD9e7SrZssntszmkwWOt3ROK3UxYvwvwIgabsVSF1oEq7Non
	/jMpnzX6lVSaWDMEW//Er6+XFT3IWp8jqyBFhJ0iex7NiyDnM0ySfF8oakQtshTQVyHCYi1yyu1
	R+hwSXbRvSow2lgIrPSdNvdPZYLNVJeukV4tn+9ow4ZSzHTH3bxf4LZ3+pRl0qrUZpTY4PEy4VT
	DbNcfsmTVo0kH5E3XPtkKHkInepnXqb+LLqeHPaZN8mkjQqvPaaOdvr1krr5cN7JfGRl4R699aR
	e+bYSuVXlVBgwPamv47lzmx9HjsFlLqxRInrAb6
X-Received: by 2002:a05:600c:a45:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a01b11de2bmr30435415e9.34.1790785181650;
        Wed, 30 Sep 2026 09:19:41 -0700 (PDT)
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
Subject: [PATCH v3 03/39] xen/riscv: introduce csr_volatile_read64()
Date: Wed, 30 Sep 2026 18:18:45 +0200
Message-ID: <af8a07a676749b83cad27332e88bf433f98f22e1.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790785182-50CDFB50-BA9D4029/10/73395122804
X-purgate-type: spam
X-purgate-size: 3798

On RV32 a 64-bit CSR is accessed as two halves, <csr> and <csr>H. Reading
the halves with two separate instructions isn't always safe: for a CSR
which hardware increments, a carry from the low half into the high one can
happen in between, so a plain pair of reads can produce a value the CSR
never held. Therefore the high half is re-read and the sequence retried if
it changed in the meantime.

Only CSRs which change under Xen's feet need that, hence the name. The
majority can be read with a plain pair of csr_read()s, so no helper for
those is introduced here as there would be no user for it.

Use it for CSR_TIME, which is exactly such a counter, and widen cycles_t to
uint64_t. Otherwise get_cycles() would still truncate the time counter to
32 bits on RV32.

No functional change on RV64.

Fixes: a541ddadec0a ("xen/riscv: introduce time.h")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Rename csr_read64() to csr_volatile_read64(): only CSRs which change
   under Xen's feet need the retry, the majority can be read with a plain
   split access, which isn't introduced here as it would have no user.
 - Carry the high half read at the end of an iteration over to the next
   one, instead of reading it twice per retry.
 - Update the commit message.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/include/asm/csr.h  | 27 +++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/time.h |  4 ++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 888d6a2a86d6..a5cb24c863dd 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -39,12 +39,39 @@
     csr_write(csr, v_);             \
     csr_write(csr ## H, v_ >> 32);  \
 })
+
+/*
+ * The two halves are read by separate instructions, so a CSR which hardware
+ * increments can carry from the low half into the high one in between,
+ * yielding a value the CSR never held. Re-read the high half and retry the
+ * sequence if it changed.
+ *
+ * Only needed for CSRs which change under Xen's feet.
+ */
+#define csr_volatile_read64(csr)                    \
+({                                                  \
+    uint32_t hi_, lo_, old_;                        \
+                                                    \
+    hi_ = csr_read(csr ## H);                       \
+    do {                                            \
+        old_ = hi_;                                 \
+        lo_ = csr_read(csr);                        \
+    } while ( (hi_ = csr_read(csr ## H)) != old_ ); \
+                                                    \
+    ((uint64_t)hi_ << 32) | lo_;                    \
+})
 #else
 #define csr_write64(csr, val)       \
 ({                                  \
     csr_write(csr, val);            \
     (void)csr ## H;                 \
 })
+
+#define csr_volatile_read64(csr)    \
+({                                  \
+    (void)csr ## H;                 \
+    csr_read(csr);                  \
+})
 #endif
 
 #define csr_swap(csr, val)                                      \
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index 4d68900151a7..a7c9736ae719 100644
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
+    return csr_volatile_read64(CSR_TIME);
 }
 
 void preinit_xen_time(void);
-- 
2.55.0


