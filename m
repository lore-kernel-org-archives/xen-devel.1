Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3D606A330
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcdjSJ2F
Received: from list by lists.xenproject.org with outflank-mailman.1487710.1689941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWY-0000MF-NF; Fri, 13 Nov 2026 15:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487710.1689941; Fri, 13 Nov 2026 15:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWY-0000LS-Io; Fri, 13 Nov 2026 15:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1487710;
 Fri, 13 Nov 2026 15:49:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWX-00008h-Gy
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWW-004Su0-To
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:08 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73165-2eae-0a2a0a5409dd-0a2a4502d274-20
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:08 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73174-6ca4-0a2a45020019-d155802ab078-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:08 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso6878775e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:08 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.07
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
        d=gmail.com; s=20260707; t=1794584948; x=1795189748; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrZl2t9S4XUgzViXv0U/CJmKjeA0AfKUo5N7FqJYPL4=;
        b=BcdjSJ2FA05Jtgt1r6WXf3pKYpxoV6OOllHQ5BOhho/GCh54EGDxDLaKhBS6fz/S6y
         lJAGDf2UJpfDXsHDIxgnfUWiEkEloOrvicVQrSZhYSwLhlTmyXE/zBwRz3DKF0UgZdLx
         JbRTFRoGJcY6LpeZvzgA5U3LO8n8dw+454HMZuklMhrFBpFXxDgZHHBrTFcur/zCvr/n
         oe0pvkQRcn//nBdt3AgfjvtQi14lTF86nrl39pbphnbNicjnoPMG/2RthQtUL9L/hwDs
         JSmDaqsB9un/fdelz81qD3scr3AhgRTj3bcfqY0u87daGZjFa27C1J2Hp96Jfia18Ly7
         dwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584948; x=1795189748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KrZl2t9S4XUgzViXv0U/CJmKjeA0AfKUo5N7FqJYPL4=;
        b=HQIWf77htdP9OA5JhP3KMZD2v8z2wmuJdj/swqRMZgnE/uii7rj7Re/wA5q8pvQaSh
         KW2P6rc39IBQgJ8w97GfXLsXYG5CXqq7v0ZXuyLDEYvSgE8Two1toAghCBzZG40aFHPa
         teyHUFqCyBgO1zHtuvFf20XDl+dmKPiPyEPehJ3Wuiz0ydyzJN5ZRHabqoGnGPl7ylZ1
         2mCHe2krZXHyREkReZ7crWE6XSr/mpVafOTFMiyF7+cpxGFY1WRgm3yPL/WiF4UcqONW
         j4SjUiO9c6BYhJkcCRSpJ5KVs9xTtQ6uRH+wwEoNHKxwqhPSW0eUvGKLgsAIo/CyPc+v
         hByg==
X-Gm-Message-State: APuU4Z9S+InVxLQMiJm3wIDUUkvp/hppO/wgIUufyghwWMLFFSWDI33O
	88sKCWShSuhO3hOn2wr7QKPp+N+GwpR5UzoEdDgvNG5iEdzObBWXcJWQN0GICg==
X-Gm-Gg: AYBFou1eBgL8MR5QDCuy0OZ2miczaFQTzFJNZFo2paoSFEIjNt1C/E0RHSigHasVzW7
	oYpQmUWwIVS+g7kiGLOM5moU7z+mdZgx4V8I+MAXqPZ/GrN2hyesd08QIAsWaq4lvp2SwZ+zXKG
	fzVjDAiemG7FrzHJz2JOyYPSkaFz4TuoP4u8XNIm23p8tBCsTin8Q3a04kIIHCCue/es5K+rbeT
	/Jqzcnr9on6Wn1jN44lugtbV7ndVwdqaeeWBN7vYd+x6GGdgk6HIDbU8ruqHw+Q9VbYI72xb5fn
	C29KJSL4Q8BUm/bZCMxE36kRVSLpxJgOE8peKSKPbBZWaku+RWv6t45VZj4KZw7Aejv63h4Njb4
	ab4k59vz/36GK9bZgGyrwkniGIgX/GCfFDyDCy9uE66jzINlQVY3tbWkjrnvpvErGmJ057eW56X
	THNc8gK5YWeQx48dxx8F+vSlf01KTXFXoxluN5kReKbnGgDAHd7QYOzr1MO4ky6gKaRiJy/JRPI
	JeaBxxCY3cHWk9K3qU3zZhDvB3yejC+lRhSodKVmM59/uNEh8/T1QOS/hIqiFUg5IFNtdXZGR9G
	iiSppfQ7sO7H9UPUI9SZnTVkVlptrnrlEWbwZg9IvW7q/XUZc6SS4XDcbETbH65dgtuk
X-Received: by 2002:a05:600c:4e56:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4bb55c5f594mr58033855e9.3.1794584948327;
        Fri, 13 Nov 2026 07:49:08 -0800 (PST)
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
Subject: [PATCH v4 02/42] xen/riscv: address violation of MISRA C Rule 20.12 in csr_write64()
Date: Fri, 13 Nov 2026 16:48:23 +0100
Message-ID: <b70baf080cda9faa9c825e5bb7cb538b5b9264bc.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794584948-309C32AC-6F54971F/10/73395122804
X-purgate-type: spam
X-purgate-size: 2583
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

csr_write64() uses its csr parameter both as an operand of ## (to form the
name of the CSR holding the upper half on RV32) and in ordinary,
macro-expanded context. As the CSR_* constants are macros themselves, this
violates MISRA C Rule 20.12.

Make csr_write64() take the CSR name without the CSR_ prefix and paste the
prefix as well, so that the parameter is used as an operand of ## only.

While at it, drop the (void) of the upper half CSR on RV64: it generated
no code and only made the build fail if CSR_<name>H wasn't defined, while
a pure 64-bit environment has no need for the ...H constants.

No functional change.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/include/asm/csr.h | 16 ++++++----------
 xen/arch/riscv/time.c            |  4 ++--
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index a805f7ed0ba1..3cf8e1857ce2 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -33,18 +33,14 @@
 })
 
 #ifdef CONFIG_RISCV_32
-#define csr_write64(csr, val)       \
-({                                  \
-    uint64_t v_ = (val);            \
-    csr_write(csr, v_);             \
-    csr_write(csr ## H, v_ >> 32);  \
+#define csr_write64(name, val)              \
+({                                          \
+    uint64_t v_ = (val);                    \
+    csr_write(CSR_ ## name, v_);            \
+    csr_write(CSR_ ## name ## H, v_ >> 32); \
 })
 #else
-#define csr_write64(csr, val)       \
-({                                  \
-    csr_write(csr, val);            \
-    (void)csr ## H;                 \
-})
+#define csr_write64(name, val) csr_write(CSR_ ## name, val)
 #endif
 
 #define csr_swap(csr, val)                                      \
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 782d9cd450f3..97ebe402ae41 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -15,7 +15,7 @@ uint64_t __ro_after_init boot_clock_cycles;
 
 static int cf_check sstc_set_xen_timer(uint64_t deadline)
 {
-    csr_write64(CSR_STIMECMP, deadline);
+    csr_write64(STIMECMP, deadline);
 
     return 0;
 }
@@ -103,6 +103,6 @@ void __init preinit_xen_time(void)
          * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
          * ~0.
          */
-        csr_write64(CSR_VSTIMECMP, ~0);
+        csr_write64(VSTIMECMP, ~0);
     }
 }
-- 
2.56.1


