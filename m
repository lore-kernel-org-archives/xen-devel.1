Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F833606A32E
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VpJJN7Vc
Received: from list by lists.xenproject.org with outflank-mailman.1487711.1689956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWa-0000k4-Vo; Fri, 13 Nov 2026 15:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487711.1689956; Fri, 13 Nov 2026 15:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWa-0000js-Qn; Fri, 13 Nov 2026 15:49:12 +0000
Received: by outflank-mailman (input) for mailman id 1487711;
 Fri, 13 Nov 2026 15:49:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWZ-0000ZO-CZ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWY-003hNe-PP
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:10 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73151-e002-0a2a0a5209dd-0a2a4504ba5c-46
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:10 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73176-b57f-0a2a45040019-d155dd31a44c-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:10 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so801328f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:10 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:08 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584950; x=1795189750; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ar+vMv9BPwZTzwKV8PjKk62QdlZ/NvnKliX6Ra7P3HQ=;
        b=VpJJN7VcsZQ6IgFJmJATeKFAzGM3tyn6+gLMgmYhVPkrowDhRGjBlgRs7nox8DOL4M
         1bkZFvMi7UjE9dQHrjiJx4TRgoV9z9V0o9+1gOIg2qs2wefwe+B0AvIlLL4VBqfC0BO/
         miMbzrvkriACCDYIZvigcABj4CWWmWfkxQU7RUm8UG5JyyXFSzv/rLAyRbYY8RUhEs7G
         gjo1p1hdycDTgHUyFA/qBQe4ke1LNXScqO+EpAcLZwBTdH5MiFZyj/I2lZbFaPPid2my
         +IiMm+STQAD73NozeQ2pzbn3Yw9eFceYmXy2vhGwyffRVXkqg83pte9QVXpo3R/u/alW
         SJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584950; x=1795189750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ar+vMv9BPwZTzwKV8PjKk62QdlZ/NvnKliX6Ra7P3HQ=;
        b=X7EbQVB2XyBiq20FIOste8vaU9lNX6cyXklpm59yy+6KwfAArjUssvz+JxdJXsVW+p
         WYiIrihg8GqHakL76Pv5Z3P5896gehjg0yipjxiRr5KT3TGqjS78Z5ntszVXpKiQ06hn
         8N486tunWY/4gu9Ade1rCPISZqGajbctMzoPwJaIjnBMpLRXlHLHXnTRu0nrdbJvGAP+
         HZW0dWwBdEaFSmZbZZ67+Vf62Kd/y4PhrV4vr1cDdTHL5Wy2eh18P9bA/lbyuuTlqB/h
         W98TH0q9h7bFytNtWtx90NddtfSrNjRpPlYsJ252fsiP8lcwTau8dZ4OPw19e6lWR/tN
         +7mg==
X-Gm-Message-State: APuU4Z/BJ7hv2BaJmm2OrlvlWXweI8TpEQtV+cp9nOLURBEatwnw3DYE
	LJoC32iuf5YWXZo62aeGxX2GxkaX9G/qH4Kq9GHkKG55XD0LI7vVDtpqGwqHVA==
X-Gm-Gg: AYBFou2H6d82QgekV/+lJQzd62XjW1/ZIVy/sptPoGgzgTSGtBCY5N5bgF3g0osVwaU
	N4p66XLbUuob+vrkuVZrMG9VwC2abQ0f9w+DwIaNUTdZ5v4mnBcItzPSskGpjgmt75C5V6SiCSy
	yoZ78a2QNWBgf9Az+s7mfIfT8YJ/QUUaz/t4aMETCwBKzFdbZCtgu6FZyhFnD7lm+xDOdO9jW1p
	0kxILbw9Ey8o9yCgC9sYkwxXO4Rm/jYG14vSSs0ypNt+OMi5dJjuzmuG5c0Ou1h0xIsrYyDAmY8
	m7z9DdFG9xT+YRyG1Bo+el7qSscN1GpSpV0RNxwRtZYzwmVLY7Aw+1HqfoocgIIhQbNP93DLEe5
	MaelIDn1b+dmaLQWHNysYWWNvMoepi5eIRzwXgWnJsD4/vPV6rkiVCcQpyDBpic+llpn/RkrvD/
	G48+5bV7zIdTqrAVZamfBff2r/P69ACXn57KZcmm/7pWyxFHmK+153r41qSSnohSTfpHdnxFzHc
	stiIOUwmxYrkwpqix6gacM/ru93MBQOqDA73JQlGU7QYvGo0qGhKvSKF5jjtdnfTzS9y3YeWG9E
	rYdQU0+AXlXGs0NQwrLjCgKHER4rUsTs6Qta0o5hrVHs29+5+akxpCutV9qBv+iuTyXu
X-Received: by 2002:a05:6000:4549:b0:492:b1c5:6db6 with SMTP id ffacd0b85a97d-49c6f5e851amr4599060f8f.6.1794584949337;
        Fri, 13 Nov 2026 07:49:09 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 03/42] xen/riscv: introduce csr_volatile_read64()
Date: Fri, 13 Nov 2026 16:48:24 +0100
Message-ID: <a5a546afe987f3f040c5b942ae01579c4854b94c.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794584950-587C6B50-0E85710E/10/73395122804
X-purgate-type: spam
X-purgate-size: 3873
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Changes in v4:
 - Take the CSR name without the CSR_ prefix, so that the macro parameter
   is used as an operand of ## only (MISRA C Rule 20.12).
 - Drop the (void) of the ...H constant on RV64.
 - Initialise hi_ in its declaration.
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
 xen/arch/riscv/include/asm/csr.h  | 22 ++++++++++++++++++++++
 xen/arch/riscv/include/asm/time.h |  4 ++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 3cf8e1857ce2..6df595e810ef 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -39,8 +39,30 @@
     csr_write(CSR_ ## name, v_);            \
     csr_write(CSR_ ## name ## H, v_ >> 32); \
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
+#define csr_volatile_read64(name)                            \
+({                                                           \
+    uint32_t lo_, old_, hi_ = csr_read(CSR_ ## name ## H);   \
+                                                             \
+    do {                                                     \
+        old_ = hi_;                                          \
+        lo_ = csr_read(CSR_ ## name);                        \
+    } while ( (hi_ = csr_read(CSR_ ## name ## H)) != old_ ); \
+                                                             \
+    ((uint64_t)hi_ << 32) | lo_;                             \
+})
 #else
 #define csr_write64(name, val) csr_write(CSR_ ## name, val)
+
+#define csr_volatile_read64(name) csr_read(CSR_ ## name)
 #endif
 
 #define csr_swap(csr, val)                                      \
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index 0e5b96a8631c..02b9a03ed90d 100644
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
+    return csr_volatile_read64(TIME);
 }
 
 void preinit_xen_time(void);
-- 
2.56.1


