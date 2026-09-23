Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99C3C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:23:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430625.1653169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mw9-0007mF-NR; Wed, 23 Sep 2026 13:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430625.1653169; Wed, 23 Sep 2026 13:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mw9-0007m8-Kk; Wed, 23 Sep 2026 13:23:01 +0000
Received: by outflank-mailman (input) for mailman id 1430625;
 Wed, 23 Sep 2026 13:23:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mw8-0007hn-8O
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:23:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mw7-00DJz9-L6
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:22:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2b1-8faa-0a2a0a5109dd-0a2a450b86fc-4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:59 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2b2-b7e8-0a2a450b0019-4a7de50ce98a-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:59 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-3396cec93b6so976984eec.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:22:59 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169777; x=1790774577; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+y3C9rGVvFAkdWFKio2TWsWiPkrJ96pOnUImryyekQ=;
        b=ocwNad0xCGJxMSosr7YSjU+lTYgQBFGZFtG1cnGhij7sQscqnVRDxraY1I9mSgR2VU
         28DaIpoETDuM8IuWrAbaW0rkIA1VzFy1wv4jQjYqO/FBMezCImjxWqat24f+ijG0uvr1
         4wOODAwPtRcW4/aDjnoWB+La8mlD8J49k+yX0odSiz2nZIWouiLcxXnO+bmJR81K/RSE
         rUoe41E1Qvd39Z7df5CHmm2pdqmFPuTdA0h4Mp02fpsVojDjweDc4Rtvoq4kXpGLz+TG
         23kMt6PrPIIHgfkK0xeYnRdSb/wC01TY/Yaaw4B92kgjv1auQdefDNVNN5fT12W0gAqi
         RtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169777; x=1790774577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+y3C9rGVvFAkdWFKio2TWsWiPkrJ96pOnUImryyekQ=;
        b=DRg53v72zlAtwEpKP6KrpEUseEiuyMlHkLQDEcGIDpppe8Td23dh0xdErKNeSjH+QO
         cmr0t1WY2vsFCINgxlggNyfv8a4uc1iL/D79tAd0+jos4KN9ytEExJra0VNyB+cKjPCu
         f67MGLfLAgGilJE9rjhTqJ4Y2tbKw+zyZ0Hl0p1i689pgweBjGprGqcT+DG66QZUA3Gg
         Nkz2EmgVeOE4DhVqQg43x2k+Mx5HzD8EXvQI/AI2WnMID4/nkeg6Wrqc293oR/1sQxJv
         K3+feRy6+hhKZnCl1JnaL7HM5blTx5e/jJaac2Mudidsk8YSEwCGvsnG+LbznAY+/P8i
         PELQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHehEnqkLPO9bsiOy5oavXpUYdAoJGFu+SOwdWxSNJjKmgZLm3f6/WU5K4MTjfOQ49yp8CMTVuFK4=@lists.xenproject.org
X-Gm-Message-State: AFuF++ltKj/4Nt0AUqRQwFBCKXNH4r2USJDGttcx7hP9Oj5TJ6i4xLRY
	mox9yuiF3/gXpsuNVxwVzzrM3OcwvPK4cdvkdZlqUn3wqlVK+qqnOGJyNEmtgoO1MqA=
X-Gm-Gg: AYBFou2hFaMSYkN0fyqfndpAJkRfc7oWQF6g+bHBvroBkyApDwW6HyanXmQ0UPt84nB
	inqHVxN95jxmZ1LicoRvmbaLboRA/HSxUIdX6+OXeWBQIdtXcGkxFKwyifePNbgZUfr2udIV3sT
	pptDoxOqyeIirufrTTYuxfXps/07l9oz0txNP/WRlMYxpYQiTW+WmqLgwxDaWYQypzsdyJTvwFG
	VeUD/TOc06FA0AcKUCDau63JRyvfH5lAZGFnPvJ378gRUlCNSuYJSmJcz1+7WocVDdiV0Yo/jCm
	YIk2l1ReA1jEKNwTCBfgqFrQJT48mq7n1++1ZWIuci9RXEgBGwgWDjlGqH8YcYsd5Ird4cG7td1
	eiM34pZv9iVz5LNBX03bWwow4h8mqkBkkKP+Xvz5sYYR6LEeUbKCwiwWy0e9jTBGlAFByjJl0mW
	0r1CLfCcG/ES+rfyR2Cf5/XjZNywqxIYVM00y6m/r9x1i/2shgpZE97QfmouEh+VkCNm88L316l
	G0NWUaLFoBfaKi2VhN+MOCWvD6Mn/o=
X-Received: by 2002:a05:7300:311a:b0:339:7357:b225 with SMTP id 5a478bee46e88-33e905f47cbmr2532490eec.16.1790169776667;
        Wed, 23 Sep 2026 06:22:56 -0700 (PDT)
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
Subject: [PATCH v3 037/114] target/riscv: replace TARGET_* macros in CSR helpers
Date: Wed, 23 Sep 2026 21:15:11 +0800
Message-ID: <20260923131635.1894-38-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790169779-A98C19EA-38E6D484/0/0
X-purgate-type: clean
X-purgate-size: 2434

- Use target_long_bits() instead of TARGET_LONG_BITS for the CSR
  write mask.
- Use target_riscv64() instead of TARGET_RISCV64 for MISA RV64 and
  the PMP address mask.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/tcg/csr.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 061bc9db77b..0b96fff6b96 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
 #include "cpu.h"
@@ -2143,17 +2144,18 @@ static RISCVException read_misa_i128(CPURISCVState *env, int csrno,
 static RISCVException read_misa(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    target_ulong misa;
+    uint64_t misa;
 
     switch (env->misa_mxl) {
     case MXL_RV32:
-        misa = (target_ulong)MXL_RV32 << 30;
+        misa = (uint64_t)MXL_RV32 << 30;
         break;
-#ifdef TARGET_RISCV64
     case MXL_RV64:
-        misa = (target_ulong)MXL_RV64 << 62;
+        if (!target_riscv64()) {
+            g_assert_not_reached();
+        }
+        misa = (uint64_t)MXL_RV64 << 62;
         break;
-#endif
     default:
         g_assert_not_reached();
     }
@@ -5430,13 +5432,11 @@ static RISCVException read_pmpaddr(CPURISCVState *env, int csrno,
      * here to avoid complaints about masking bits 0-53
      * of a potential 32 bit target_ulong '*var'.
      */
-#ifdef TARGET_RISCV64
-    if (env->misa_mxl == MXL_RV64
+    if (target_riscv64() && env->misa_mxl == MXL_RV64
         && csrno >= CSR_PMPADDR0 && csrno <= CSR_PMPADDR63) {
-        target_ulong read_mask = MAKE_64BIT_MASK(0, 54);
+        uint64_t read_mask = MAKE_64BIT_MASK(0, 54);
         *val &= read_mask;
     }
-#endif
     return RISCV_EXCP_NONE;
 }
 
@@ -5755,7 +5755,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
 RISCVException riscv_csr_write_i64(CPURISCVState *env, int csrno, uint64_t val)
 {
     return riscv_csrrw(env, csrno, NULL, val,
-                       MAKE_64BIT_MASK(0, TARGET_LONG_BITS), 0);
+                       MAKE_64BIT_MASK(0, target_long_bits()), 0);
 }
 
 RISCVException riscv_csr_read_i64(CPURISCVState *env, int csrno, uint64_t *res)
-- 
2.52.0.windows.1


