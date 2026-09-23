Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373F5C9830C
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:23:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430642.1653188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MwR-0000MJ-E4; Wed, 23 Sep 2026 13:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430642.1653188; Wed, 23 Sep 2026 13:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MwR-0000MC-AC; Wed, 23 Sep 2026 13:23:19 +0000
Received: by outflank-mailman (input) for mailman id 1430642;
 Wed, 23 Sep 2026 13:23:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MwQ-0000Hf-3g
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:23:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MwP-002FUs-Gn
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:23:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2c0-8faa-0a2a0a5109dd-0a2a4508ae7e-20
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:23:17 +0200
Received: from [74.125.229.43] (helo=mail-dy2-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2c3-f659-0a2a45080019-4a7de52b95ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:23:17 +0200
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-33c11ef641aso1115411eec.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:23:16 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:23:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169795; x=1790774595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+vM4VKx04YtiIcob+lp3bwuPAlEC1anahMCoo6i89k=;
        b=sTckSw/dZQ1lXiVr2dSEMxA996F9bLp4qfxV7vH1CzSshwgb6gOxUa0lvmGtOvNy2L
         /+OL3w4DCrl8PtG95l7deEsHVBMa1r8v1Qx/3K+8RSwERsHfThLkAN9XCQvz/WeHwTWA
         6eLVLxfNuGm8TfB/O9Bc1qkHuXJ6tOu//MX/HFIBkFVE8mC78j4aKwqOmT8OZ2RGziX9
         h5zsnciQVHn68G12CSvXES+mifr7LlFoRnYdXFpOC13+gCysexSRo0jONIeDe6skSQBT
         CmTsSGBdpKdyT/7ze5JRZILRaD6T6uX/Cc2G6sd97ZmMoCIHUyV7xqbBWgvOP38Ll1bm
         +mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169795; x=1790774595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+vM4VKx04YtiIcob+lp3bwuPAlEC1anahMCoo6i89k=;
        b=ai2/sFoPGUgE7gVh3/iv0zAjHKqJnPdCsYkfdQ4LscRbgehjPb1EfbWeQ/Mhi53VvH
         95iw5Lyl1x1c9zN9eAvNKGps8nW9gPAjcwt09NgHGMtGgdi3lF8qPCOG/zEENTHvDXe6
         HsgY3inenV6Xdw5F2eW6OaBVgxuKHX9n1MfHZ+0sHudC5gr8vij5UPQzAB0jqXq0F3cs
         +XqqZ4oHZH7AKIBBxZD6iTdpn+rI92GxHbxrsziBIYJjBKRCkGag2J2yrnSx59thBOy4
         yscgPiU3RO7DalGuF1uyvDw7hxKYz7EP2/ivvKaccHb9ZnaLgQsNrUCrk/n1+f94tBBB
         jVfA==
X-Forwarded-Encrypted: i=1; AKwUvByC5VHdoewb4mFpnq1VvPl5Zc8g7ODlNKfhKt0vyCvS80YDFzGreEo08kCdvJI6FivEml3TXsC6UxA=@lists.xenproject.org
X-Gm-Message-State: AFuF++lom7JTx9l/rbERn+CP4Eev6vQmRVAC6BhHxbRGD512No5QyM0B
	Cp2QSTweclvYxewtyYTXCCvTYOB8wVuOSPUFQ8JAl09dFBDIQrRUQG4j
X-Gm-Gg: AYBFou3myRy84VwgQwAp6WZPg5o/aIyhnAiTVKxRuEklCnqoq+MKPfdQm3LF5HqGStk
	kCuCrzLwicsI1MpsnEUTIQby3o8stoLD34RClFhTR/cEJSv6y4qRoEo87VWZ2XHGsLMQiVgpmfs
	sGX30EAWkoxO4VoIbqk0VHcpG1CSp+MChL0UYq9NXG44woGvzaZKhI2CIcn3/VHUfksX2D8Okbs
	obM9+MsjBR3E1rWUUXxOFBN1POrCiEUGPlPmgLnW7EYs6TL3/UI9sfW5sAl+nyMk8zVYeyfhKWW
	ekdWPICMvQhFIc4G7FHqN3Rna2etTwDkVPN9AGF0KICBTgjTMTrEJ/Rf0mRpwNyBWRIOylNH5x1
	pgtaNzUUiXIHd2wy5Y4sx88hsp9XCaduQJ0HInusPA0d72wkel/qm4lgzjlzzoZshvXS9WNX5mI
	kBHCaALQMFgL97V4WRVW3B41Vs1896h+FW64f9zuWScuSAiCbZU1gghLsNPUwn5zUwqDnVULPcp
	bm8VVdBoUCeP5FoTIBkP62z5iRkfU/NIotKrM9FjQ==
X-Received: by 2002:a05:7300:3e91:b0:327:affc:b506 with SMTP id 5a478bee46e88-33e8c72c478mr2326450eec.15.1790169794702;
        Wed, 23 Sep 2026 06:23:14 -0700 (PDT)
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
Subject: [PATCH v3 039/114] target/riscv: preserve signed XLEN semantics without target_long
Date: Wed, 23 Sep 2026 21:15:13 +0800
Message-ID: <20260923131635.1894-40-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790169797-CF75B87B-BA62A746/0/0
X-purgate-type: clean
X-purgate-size: 9659

- Mask pointer-masked addresses with extract64/sextract64 at
  runtime XLEN instead of a target_long arithmetic shift.
- Pass vector vx scalars as int64_t after sextract64 from the
  helper tl slot so RV32 keeps bit 31 as the sign bit.
- Leave every target_ulong helper argument unchanged.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/internals.h            | 12 ++++++++----
 target/riscv/tcg/vector_helper.c    | 21 +++++++++++----------
 target/riscv/tcg/vector_internals.c |  2 +-
 target/riscv/tcg/vector_internals.h |  9 +++++----
 4 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 1ee7e99e988..0844867246d 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -214,6 +214,7 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
 {
     RISCVPmPmm pmm = PMM_FIELD_DISABLED;
     uint32_t pmlen = 0;
+    unsigned kept;
     bool signext = false;
 
     /* do nothing for rv32 mode */
@@ -235,13 +236,16 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
 
     signext = riscv_cpu_virt_mem_enabled(env, is_virt_addr);
     pmlen = riscv_pm_get_pmlen(pmm);
-    addr = addr << pmlen;
 
-    /* sign/zero extend masked address by N-1 bit */
+    /*
+     * Drop the top pmlen bits of XLEN. Do not rely on target_ulong
+     * shift wrap; common-system target_ulong is always 64 bits.
+     */
+    kept = target_long_bits() - pmlen;
     if (signext) {
-        addr = (target_long)addr >> pmlen;
+        addr = sextract64(addr, 0, kept);
     } else {
-        addr = addr >> pmlen;
+        addr = extract64(addr, 0, kept);
     }
 
     return addr;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 0d1e4e09646..0b78a733ce4 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -1248,7 +1248,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
         ETYPE carry = vext_elem_mask(v0, i);                             \
                                                                          \
-        *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
+        *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)sextract64(s1, 0, target_long_bits()), carry);\
     }                                                                    \
     env->vstart = 0;                                                     \
     /* set tail elements to 1s */                                        \
@@ -1325,7 +1325,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
         ETYPE carry = !vm && vext_elem_mask(v0, i);             \
         vext_set_elem_mask(vd, i,                               \
-                DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
+                DO_OP(s2, (ETYPE)sextract64(s1, 0, target_long_bits()), carry));      \
     }                                                           \
     env->vstart = 0;                                            \
     /*
@@ -1609,7 +1609,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
             continue;                                               \
         }                                                           \
         vext_set_elem_mask(vd, i,                                   \
-                DO_OP(s2, (ETYPE)(target_long)s1));                 \
+                DO_OP(s2, (ETYPE)sextract64(s1, 0, target_long_bits())));                 \
     }                                                               \
     env->vstart = 0;                                                \
     /*
@@ -2050,7 +2050,7 @@ GEN_VEXT_VV(vnmsub_vv_w, 4)
 GEN_VEXT_VV(vnmsub_vv_d, 8)
 
 #define OPIVX3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
-static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
+static void do_##NAME(void *vd, int64_t s1, void *vs2, int i)   \
 {                                                                   \
     TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
     TD d = *((TD *)vd + HD(i));                                     \
@@ -2246,7 +2246,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
     for (i = env->vstart; i < vl; i++) {                             \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                           \
         ETYPE d = (!vext_elem_mask(v0, i) ? s2 :                     \
-                   (ETYPE)(target_long)s1);                          \
+                   (ETYPE)sextract64(s1, 0, target_long_bits()));                          \
         *((ETYPE *)vd + H(i)) = d;                                   \
     }                                                                \
     env->vstart = 0;                                                 \
@@ -2397,12 +2397,12 @@ GEN_VEXT_VV_RM(vsaddu_vv_h, 2)
 GEN_VEXT_VV_RM(vsaddu_vv_w, 4)
 GEN_VEXT_VV_RM(vsaddu_vv_d, 8)
 
-typedef void opivx2_rm_fn(void *vd, target_long s1, void *vs2, int i,
+typedef void opivx2_rm_fn(void *vd, int64_t s1, void *vs2, int i,
                           CPURISCVState *env, uint8_t vxrm);
 
 #define OPIVX2_RM(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)          \
 static inline void                                                  \
-do_##NAME(void *vd, target_long s1, void *vs2, int i,               \
+do_##NAME(void *vd, int64_t s1, void *vs2, int i,               \
           CPURISCVState *env, uint8_t vxrm)                         \
 {                                                                   \
     TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
@@ -2410,7 +2410,7 @@ do_##NAME(void *vd, target_long s1, void *vs2, int i,               \
 }
 
 static inline void
-vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
+vext_vx_rm_1(void *vd, void *v0, int64_t s1, void *vs2,
              CPURISCVState *env,
              uint32_t vl, uint32_t vm, uint8_t vxrm,
              opivx2_rm_fn *fn, uint32_t vma, uint32_t esz)
@@ -2427,7 +2427,7 @@ vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
 }
 
 static inline void
-vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
+vext_vx_rm_2(void *vd, void *v0, int64_t s1, void *vs2,
              CPURISCVState *env,
              uint32_t desc,
              opivx2_rm_fn *fn, uint32_t esz)
@@ -2468,7 +2468,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    vext_vx_rm_2(vd, v0, s1, vs2, env, desc,              \
+    vext_vx_rm_2(vd, v0, sextract64(s1, 0, target_long_bits()), \
+                 vs2, env, desc,                          \
                  do_##NAME, ESZ);                         \
 }
 
diff --git a/target/riscv/tcg/vector_internals.c b/target/riscv/tcg/vector_internals.c
index b490b1d3989..95327052666 100644
--- a/target/riscv/tcg/vector_internals.c
+++ b/target/riscv/tcg/vector_internals.c
@@ -81,7 +81,7 @@ void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
     vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
 }
 
-void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
+void do_vext_vx(void *vd, void *v0, int64_t s1, void *vs2,
                 CPURISCVState *env, uint32_t desc,
                 opivx2_fn fn, uint32_t esz)
 {
diff --git a/target/riscv/tcg/vector_internals.h b/target/riscv/tcg/vector_internals.h
index 5681b818153..da093d561eb 100644
--- a/target/riscv/tcg/vector_internals.h
+++ b/target/riscv/tcg/vector_internals.h
@@ -201,20 +201,20 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                do_##NAME, ESZ);                           \
 }
 
-typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
+typedef void opivx2_fn(void *vd, int64_t s1, void *vs2, int i);
 
 /*
  * (T1)s1 gives the real operator type.
  * (TX1)(T1)s1 expands the operator type of widen or narrow operations.
  */
 #define OPIVX2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
-static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
+static void do_##NAME(void *vd, int64_t s1, void *vs2, int i)       \
 {                                                                   \
     TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
     *((TD *)vd + HD(i)) = OP(s2, (TX1)(T1)s1);                      \
 }
 
-void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
+void do_vext_vx(void *vd, void *v0, int64_t s1, void *vs2,
                 CPURISCVState *env, uint32_t desc,
                 opivx2_fn fn, uint32_t esz);
 
@@ -224,7 +224,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    do_vext_vx(vd, v0, s1, vs2, env, desc,                \
+    do_vext_vx(vd, v0, sextract64(s1, 0, target_long_bits()), \
+               vs2, env, desc,                            \
                do_##NAME, ESZ);                           \
 }
 
-- 
2.52.0.windows.1


