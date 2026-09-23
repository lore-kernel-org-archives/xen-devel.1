Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570EFC982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:23:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430648.1653197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mwa-0000t0-Lo; Wed, 23 Sep 2026 13:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430648.1653197; Wed, 23 Sep 2026 13:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mwa-0000sr-Ha; Wed, 23 Sep 2026 13:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1430648;
 Wed, 23 Sep 2026 13:23:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MwY-0000om-ON
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:23:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MwY-002Fb3-4t
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:23:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2c6-e002-0a2a0a5209dd-0a2a450bbdf6-34
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:23:26 +0200
Received: from [74.125.229.43] (helo=mail-dy2-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2cc-b7e8-0a2a450b0019-4a7de52b9479-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:23:25 +0200
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-33c11ef641aso1115608eec.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:23:25 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:23:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169804; x=1790774604; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+o5KblLu0GyQgfzLlM1cTvsfq0uChm3NLiJCLhEk08=;
        b=bV6yRlFYGAyFON7bL5KKKaz/QAIV0q3u8odLsbtmX/RzlPGcpOT8lSEii1dIoEI/h3
         wXbygWn97h/61Q89HrhSpmiGQzWWK39OiApx5ooA59D5eg+GWsy6yu+ElJUKVUzByqtQ
         kdbm0EJ2uJ1VpX6HxgRog/ds8J8s+zy5iQvtQzW8bN+19VvW+AsRkBrRIhoglE4ThZs/
         hsI8Ni4UJMkdTW/uvGGKohldvz4Clzr9re3qOkUcLCbpAK7ZBJqDWa8ri6qGjhqTJ2dh
         fvBQaI0Vu6tuAb2NzZvPVwS6Hqd2XHkhHIJWkqEPN2CIXmqm3rlXF2Q7WoZkE5f30hoU
         uboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169804; x=1790774604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+o5KblLu0GyQgfzLlM1cTvsfq0uChm3NLiJCLhEk08=;
        b=qPp9QzcW+S6vLtTCkxPuRiBTrs+JkJp2lvGc9OxlSxSOqw1LRgLS3VcyfcKBMJAPrp
         CrD5Spsnc9wwiL8g39b7ct07yqd55rSDSMgvR4PJb4J5j4XtnZlQnINtCugi6nNq+agf
         /zM+idQlPII+NUHVx5jLj0VveAWE5JWyGcr8JvhOsUGt6bwHw5kySp4xwxFx7F5pDyyW
         KX9H1xTPbmOlTTXMC5qh2Y/MJxGd0z8UPetaPUkH85ESkBiiPkHpD2eA/5a3cJEyUkzb
         tnzK4knuqMij8MlQ+9bD0fy3l3pgr8+GMcbMeDpzGCmUW7lFISAcxrvoYSQiLCRq3duQ
         txrA==
X-Forwarded-Encrypted: i=1; AKwUvBwmY5iNXW/65+Fej08mMYSr5KkQy0yI+NvDjLtMqRhPdlLCbtgITbfP52gzX7V2EsZ7dS8GF/fHwLY=@lists.xenproject.org
X-Gm-Message-State: AFuF++nFFjL5LsM02Ug9HYfaYbGyjv8V24YWVybJOikQBlBPjw6y8COM
	o+sAFLlrZ9KB4pwUCChILGPOx71VXveG/dpV9eF/TjXkfDImQdBgPHcM
X-Gm-Gg: AYBFou3o0VgMe1AdYrB9mlQ5kMuSvWjWObZvVJa6Fpc1crBky58cpDccHrCkuFSwg45
	zEDa/b+xVXBgd0RiBz9pBbvFdazKhWao0wzRmnx/QVHouPPbYOsoxP3BzDSthRIHnvXgLN9QbmZ
	WJygNBqc2Tg3sA71sjcgjGL9lniy+ERzXxdcyYTuOvZH8bAXLcdOUuz+kJgj4qBudKyFgQfdzyB
	CcEHSkiafNV46S6u/lG8A7XIGSGkp6qbSJGlaIUoi/sNbPXenJBAruzCBfPfemauIGBY66+C1ae
	w+FgmADkAt7TFgGP9jtaEImZ3Avcd+Vjd6kCkDv1A254iG9PLsAc+IQWyK94jz9eNkw85DhGRzV
	eIkF4v1K70334V0akHfXLwofRbe9lADmDfsKxbXr92xVhxEQ4QoCZwYdhvRF1HXqhSdtYtjOKkq
	xHr+ag5LfSu8hocvGfgocTMmgkOhNu0P0h+BFDIlFEhBGz6VYKXJNgDleqw56UKOrCRI5KS0Ccm
	XL7VXEkJCe2/3F7xizR+uToqsO2QW9XQuSX7NJPxg==
X-Received: by 2002:a05:7300:7b27:b0:33b:eec0:eefc with SMTP id 5a478bee46e88-33e8e88ea29mr2331973eec.40.1790169802984;
        Wed, 23 Sep 2026 06:23:22 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	Chao Liu <chao.liu@processmission.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fabiano Rosas <farosas@suse.de>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	David Hildenbrand <david@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Song Gao <17746591750@163.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 040/114] target/riscv: replace leftover TARGET_LONG_BITS
Date: Wed, 23 Sep 2026 21:15:14 +0800
Message-ID: <20260923131635.1894-41-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790169805-AAEDE9EA-2567EEF8/0/0
X-purgate-type: clean
X-purgate-size: 2564

- Use target_long_bits() in bitmanip clmul/clmulr/xperm loops and in
  the m128 signed-div overflow check.
- Compare xperm element positions to target_long_bits() instead of
  sizeof(target_ulong), which is always 8 in common-system.
- Leave translate.c and insn_trans TARGET_LONG_BITS for riscv-tcg-tl.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/tcg/bitmanip_helper.c | 10 +++++-----
 target/riscv/tcg/m128_helper.c     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/tcg/bitmanip_helper.c b/target/riscv/tcg/bitmanip_helper.c
index 5af3efe194d..db226146054 100644
--- a/target/riscv/tcg/bitmanip_helper.c
+++ b/target/riscv/tcg/bitmanip_helper.c
@@ -30,7 +30,7 @@ target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
 {
     target_ulong result = 0;
 
-    for (int i = 0; i < TARGET_LONG_BITS; i++) {
+    for (int i = 0; i < target_long_bits(); i++) {
         if ((rs2 >> i) & 1) {
             result ^= (rs1 << i);
         }
@@ -43,9 +43,9 @@ target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
 {
     target_ulong result = 0;
 
-    for (int i = 0; i < TARGET_LONG_BITS; i++) {
+    for (int i = 0; i < target_long_bits(); i++) {
         if ((rs2 >> i) & 1) {
-            result ^= (rs1 >> (TARGET_LONG_BITS - i - 1));
+            result ^= (rs1 >> (target_long_bits() - i - 1));
         }
     }
 
@@ -98,9 +98,9 @@ static inline target_ulong do_xperm(target_ulong rs1, target_ulong rs2,
     target_ulong mask = (1LL << sz) - 1;
     target_ulong pos;
 
-    for (int i = 0; i < TARGET_LONG_BITS; i += sz) {
+    for (int i = 0; i < target_long_bits(); i += sz) {
         pos = ((rs2 >> i) & mask) << sz_log2;
-        if (pos < sizeof(target_ulong) * 8) {
+        if (pos < target_long_bits()) {
             r |= ((rs1 >> pos) & mask) << i;
         }
     }
diff --git a/target/riscv/tcg/m128_helper.c b/target/riscv/tcg/m128_helper.c
index 7d9b83b1b2c..e59a1ffd7a7 100644
--- a/target/riscv/tcg/m128_helper.c
+++ b/target/riscv/tcg/m128_helper.c
@@ -71,7 +71,7 @@ target_ulong HELPER(divs_i128)(CPURISCVState *env,
     if (vl == 0 && vh == 0) { /* Div by zero check */
         ql = ~0x0;
         qh = ~0x0;
-    } else if (uh == (1ULL << (TARGET_LONG_BITS - 1)) && ul == 0 &&
+    } else if (uh == (1ULL << (target_long_bits() - 1)) && ul == 0 &&
                vh == ~0x0 && vl == ~0x0) {
         /* Signed div overflow check (-2**127 / -1) */
         ql = ul;
-- 
2.52.0.windows.1


