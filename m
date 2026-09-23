Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB757C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:21:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430527.1653053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MuJ-0001bG-20; Wed, 23 Sep 2026 13:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430527.1653053; Wed, 23 Sep 2026 13:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MuI-0001b4-UQ; Wed, 23 Sep 2026 13:21:06 +0000
Received: by outflank-mailman (input) for mailman id 1430527;
 Wed, 23 Sep 2026 13:21:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MuH-0001UR-Bu
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:21:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MuG-007wu5-Os
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:21:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d234-2eae-0a2a0a5409dd-0a2a4505b64c-30
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:04 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d23f-4cb1-0a2a45050019-4a7de50ca0b7-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:04 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-33bb1a50f6fso374830eec.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:21:04 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:20:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169662; x=1790774462; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qin3vLUrrbcXuVdau3Ouu4JIt8wWynB3TLlDqfsVk5s=;
        b=ULn8iY4QT/hiFBbaAUdsAjADi5QXDDYONdteKlAqfgscOaTFQGCk4Wd64heJ+k1GEJ
         91uYRIHGKJVqJs+QNrMJm+KMhynYB+7Bxi/HoNJsfcq0scWTv5x6E6FIukRMgHmqQ5fp
         DTyVgyYyXxmtz3YPSp8oi5uvvCXYNLLLTBp/rGe+cbRnPIr/gvmB8RSZ573dUSkjWgvh
         8rrtf0VxGmlZANGGxBaS5g4R0dc4JtC5HR+7axfLcMsjL+nV6oFJ1TZyNOBhgcLFDfR4
         2TlKmzu9de0Ev+dWjuVRIF1PvhqpzIIqucF0+4OErtYOmn3dLEyB5DnETZxZYz9Mvac3
         L4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169662; x=1790774462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qin3vLUrrbcXuVdau3Ouu4JIt8wWynB3TLlDqfsVk5s=;
        b=Qkh74r8FIWTK2lej4RIwZbKi6bLgjJYxxsv1qjRys+T+/6pwmSJRbc628SXrxFukAy
         jQl99/8HmJufsb8xfgdIwRdJWohXfyvk5qsODOE1rw5egpFxqKvWCXHQbBmByX33aq1Y
         z9QVznabTacA9xD+pIMKrPxnfMBgAkd254LjKuAIEcUzVOiSdxFIMfT1tLspNm+KLj28
         hvosvAdB+5siE+S+qwq41oZmzBMVZfLrKuHUXkrJFGQ/cj0m8F3zF//vQNu9Jg+HOefE
         n+snEUNyOBlZsxvVdRVQHxIXa0GXvHqYGBQZcsn2astaE3J8h53HFmDxfnTyHEUN+Bhh
         bzVA==
X-Forwarded-Encrypted: i=1; AKwUvBzd0Oj4K9R9xH6K4T7RDFRK0LQh52iImJCI6YM+EO8PD8FvAdq9N2sRKecY34R5IgD90gKWO9rxsac=@lists.xenproject.org
X-Gm-Message-State: AFuF++kRDMlJwCoaV/qJk1k3RX5ezl7dNGdFNJOpEcn+Gnx9ubJIpkPk
	Z8YKaB8Tm9Yy9R+fhYZ6rNfQfe0HFNtRrckicgU8yN/nHXFgCbl2ZTUD
X-Gm-Gg: AYBFou0Pgqhxlm5Md4PxONzYRf/djdf+ODF93U9EVjCIzrgDsqkZ6DXCRLIsQKZMjL3
	QkdrSY1QWnWp/lQY7hYEdbkJYoaYY+MHu7zxFlPtQ/29heyBDwNaaWTO4ruBj6COUoFLxoH8tlW
	52RhzWp2qDxfl/eYRnQI+POpxtwSFGAqIF7/SDNkImBf4et1MNt7LkOzMSfqqtQnbLYyiVRud4U
	GfRlMlZGZJZ0IoeeeG/pxTqnxCbZS4JEBB9vFzvPG5Cf0T4vDiDC6n61zzTUE8atZop7+7SfkdK
	tvGjIaAb3qrNX6RoAA/fl59v5MHX2poFA6khlHuSSIUokEAUE9QfAxYuweUVT3Cf4W9IWjDMJSZ
	UmIFGS3+POQPeOsxfsSVdKOQh0FdwKIa2IsxrlfJPmZD43ErW1HrjaYorHhwHqofzo9keHA9dm2
	bLgfGteoUgHTK1NctTbAylK2tvmpPpZGqEhUle3K20/d47clji1ocs+j6EN4nFWOB9MO9/C7ko4
	CUN9S8g/KHY06ZOKj2ouycVGkcQuvh8eT34fxXEpw==
X-Received: by 2002:a05:7300:a224:b0:33c:141b:73a5 with SMTP id 5a478bee46e88-33e8e1afe12mr2620027eec.41.1790169661766;
        Wed, 23 Sep 2026 06:21:01 -0700 (PDT)
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
Subject: [PATCH v3 024/114] target/riscv: uniquify TCG crc32, crc32c, and wfi helper names
Date: Wed, 23 Sep 2026 21:14:58 +0800
Message-ID: <20260923131635.1894-25-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790169664-716AD2A1-0CE5E16F/0/0
X-purgate-type: clean
X-purgate-size: 4810

- ARM already exports helper_crc32, helper_crc32c, helper_wfi, and the
  matching helper_info_* objects. RISC-V used the same DEF_HELPER names,
  which collide in a combined qemu-system link.
- Rename the RISC-V helpers to riscv_crc32, riscv_crc32c, and riscv_wfi
  so the generated C symbols are unique without meson -D prefixes.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/helper.h                              | 6 +++---
 target/riscv/tcg/bitmanip_helper.c                 | 4 ++--
 target/riscv/tcg/insn_trans/trans_privileged.c.inc | 2 +-
 target/riscv/tcg/insn_trans/trans_xlrbr.c.inc      | 4 ++--
 target/riscv/tcg/op_helper.c                       | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9458a5152be..ef629b3c650 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -83,8 +83,8 @@ DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(xperm4, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(xperm8, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(riscv_crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(riscv_crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Floating Point - Half Precision */
 DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
@@ -134,7 +134,7 @@ DEF_HELPER_1(sret, tl, env)
 DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(mnret, tl, env)
 DEF_HELPER_1(ctr_clear, void, env)
-DEF_HELPER_1(wfi, void, env)
+DEF_HELPER_1(riscv_wfi, void, env)
 DEF_HELPER_1(wrs_nto, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 DEF_HELPER_1(tlb_flush_all, void, env)
diff --git a/target/riscv/tcg/bitmanip_helper.c b/target/riscv/tcg/bitmanip_helper.c
index d8d94bca7ba..5af3efe194d 100644
--- a/target/riscv/tcg/bitmanip_helper.c
+++ b/target/riscv/tcg/bitmanip_helper.c
@@ -117,7 +117,7 @@ target_ulong HELPER(xperm8)(target_ulong rs1, target_ulong rs2)
     return do_xperm(rs1, rs2, 3);
 }
 
-target_ulong HELPER(crc32)(target_ulong rs1, target_ulong sz)
+target_ulong HELPER(riscv_crc32)(target_ulong rs1, target_ulong sz)
 {
     for (target_ulong i = 0; i < sz; i++) {
         rs1 = crc32_table[rs1 & 0xFF] ^ (rs1 >> 8);
@@ -126,7 +126,7 @@ target_ulong HELPER(crc32)(target_ulong rs1, target_ulong sz)
     return rs1;
 }
 
-target_ulong HELPER(crc32c)(target_ulong rs1, target_ulong sz)
+target_ulong HELPER(riscv_crc32c)(target_ulong rs1, target_ulong sz)
 {
     for (target_ulong i = 0; i < sz; i++) {
         rs1 = crc32c_table[rs1 & 0xFF] ^ (rs1 >> 8);
diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
index a8eaccef67e..0df78e89745 100644
--- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
@@ -144,7 +144,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 #ifndef CONFIG_USER_ONLY
     decode_save_opc(ctx, 0);
     gen_update_pc(ctx, ctx->cur_insn_len);
-    gen_helper_wfi(tcg_env);
+    gen_helper_riscv_wfi(tcg_env);
     return true;
 #else
     return false;
diff --git a/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc b/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc
index 01da2b6ce1d..795231f0839 100644
--- a/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc
@@ -29,11 +29,11 @@ static bool gen_crc(DisasContext *ctx, arg_r2 *a,
 #define TRANS_CRC32(NAME, SIZE) \
     static bool trans_crc32_##NAME(DisasContext *ctx, arg_r2 *a) \
     { if (SIZE == 8) { REQUIRE_64BIT(ctx); }; \
-      return gen_crc(ctx, a, gen_helper_crc32, tcg_constant_tl(SIZE)); }
+      return gen_crc(ctx, a, gen_helper_riscv_crc32, tcg_constant_tl(SIZE)); }
 #define TRANS_CRC32C(NAME, SIZE) \
     static bool trans_crc32c_##NAME(DisasContext *ctx, arg_r2 *a) \
     { if (SIZE == 8) { REQUIRE_64BIT(ctx); }; \
-      return gen_crc(ctx, a, gen_helper_crc32c, tcg_constant_tl(SIZE)); }
+      return gen_crc(ctx, a, gen_helper_riscv_crc32c, tcg_constant_tl(SIZE)); }
 
 TRANS_CRC32(b, 1);
 TRANS_CRC32(h, 2);
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index a00370a7973..4f4932614f1 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -591,7 +591,7 @@ void helper_ctr_clear(CPURISCVState *env)
     riscv_ctr_clear(env);
 }
 
-void helper_wfi(CPURISCVState *env)
+void HELPER(riscv_wfi)(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
     bool rvs = riscv_has_ext(env, RVS);
-- 
2.52.0.windows.1


