Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D874606A325
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngk3cHLn
Received: from list by lists.xenproject.org with outflank-mailman.1481934.1685822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnDk-0006Op-8K; Tue, 10 Nov 2026 14:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481934.1685822; Tue, 10 Nov 2026 14:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnDk-0006Od-56; Tue, 10 Nov 2026 14:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1481934;
 Tue, 10 Nov 2026 14:53:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1xQnDi-0006OU-Up
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:53:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQnDi-007hhR-B3
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:53:10 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6af32fd0-e002-0a2a0a5209dd-0a2a450bb192-14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:53:10 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6af32fd6-b7e8-0a2a450b0019-d155dd29c824-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:53:10 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so1407134f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:53:10 -0800 (PST)
Received: from ws-fedora.tail006fee.ts.net ([139.47.58.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498357648f0sm5424579f8f.12.2026.11.10.06.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 06:53:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322390; x=1794927190; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FKVHSKIBfpVkaisuY8vlvieNA/N/Wpk2HUySPa0RXo=;
        b=Ngk3cHLngSHyQNAJXXWZPvR97ohp88YtbfzROAkMHKM/rFDR9eLxnNpAPBF1eE6BhX
         G0Ei62aPASyLy8UvBLxzc0cEvvwnMm0/Zm0lpr3V2YTd1Uc8Zp0K01p/aNI3evJwifgs
         2DTEILGKEdAxuu09PBNT8JteF4AL9iIOlry14yUfLpahZgQunywyxUQID2Tj+jJv6h3u
         A4GaIOBV4EjptSEqSSPwDQew8C9TUFCWz/XCfjU8Fn+E/dT8L6F5TudJxp4+w7nYf+V8
         LVMdrUHqPocFJGV1vAleeDJarm7Hu0fJyeX7O+Ken1tX+nNexSGeqJkpxMFsP4McDswg
         kXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322390; x=1794927190;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FKVHSKIBfpVkaisuY8vlvieNA/N/Wpk2HUySPa0RXo=;
        b=CQK9r+dnVFQU16m1kNhSDt9Xlo9F5bi0cjifZtp5E+PvSnNO56Dsrg/3qknEiMr5C8
         xv/xQw/O6V/TwhWuu9ebZAo5irDi1fq8T5rbEzQZ9eyBTLwRzHo9DrUZHNJB+9vlJotu
         46f/rF0EzwmZ0k4Vlbz+L7f2yUwhuPLsXnavVwdxBikukh3/9CZjyHt3nsfNkwMZmtEC
         APOzVoGdCmJGOLVojwAoelGeIFmb2GCtMIWp8gxryymk+XKiII9H9wpnpoXG4sbQx0PD
         KaYsYPTVA7VAFFbzudTFUzVTeZGCtNsYqhaheSslOSs5PmJ9efsgK1PgSONEi+NyxKA8
         hSYw==
X-Gm-Message-State: APuU4Z95PmWh5KNl003fF0Qtucfmj6T9hGUEBxrwh05F78JNnFftcfK7
	++knosPfwI1ZkA6ytaSORRH9twUOb5TvXBmQcPv0qysddMceDTZei936vcNV4xoMs30=
X-Gm-Gg: AYBFou1nh4RJJZkmobLfltpfEhP+RevV4WNNQObteufvOD3MEvEsExsGKXmNgnMQPFs
	N2lF2fLguZOfgBRHky0XcN8cx9ay1MOeano22k2Bnb0LkdtVq/iVZnETDR/nq7rD/BQfVLUyP5o
	gYUZsOWzCs3rsEKs1qs97o9ql6avnqfdi4pCNpGJ11Nn5RoPXKWKcSl0SWD0XYzDNyCZmPE+FWo
	Jt15kgex2DPPLu/AtoiX9Ui29dcIJEsAW/jPKHfAsmfxhY+ahZS/lznWIurgRwUtO4j5vyCb+kt
	tBjixUwN4xKV2cQF9qgfDzwoHpXPwK8tAEgLJLSiJNrmRjoRK2c+c5D01sJjp02XGQMppu4/WMD
	pa4zzPuc0PxJyhHdaCHb6XfubgsK5yE2J0MKbfKULHQ6bTPmziSuO7HOjqMlzzVml1IKeAlfwPd
	0HETCpY8/azBNldY+Cd8W04fq4tAlhuERwXBGlp6mfLzQhe1ew0ZVO9RVC1EOgBkAYTL87sgJuV
	9MYr+c3REybicDHSe3hT2v5QtA9zQgE8DI033iN+7AyCBz8mfdOUm/0rzscXavP+l81Qz5ybUbx
	duzh/kvKBvjzOis5botLqEKAOl5cen4ZNp+CkVPcp2d2BVQMtD0=
X-Received: by 2002:a05:6000:2006:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-4982b28a87amr5488991f8f.5.1794322389581;
        Tue, 10 Nov 2026 06:53:09 -0800 (PST)
From: =?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	=?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
Subject: [PATCH v4] xen/arm: validate non-common page-table ranges
Date: Tue, 10 Nov 2026 15:52:31 +0100
Message-ID: <20261110145231.7409-1-gabi.qs.mail@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1794322390-AB2DC9EA-56F5F0B5/0/0
X-purgate-type: clean
X-purgate-size: 4108
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On arm32, page-tables are different on each CPUs, although they share some
common mappings.

The xen_pt_update function assumed that only said mappings would be
modified, but did not check this assumption.

Add a range check to reject modifications to non-common mappings.

Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
---
v4:
 - Rebased onto staging (v3 was diffed against v2).

v3:
 - Dropped accidentally tracked patch file from commit.

v2:
- Inverted polarity of xen_pt_range_is_non_common() as suggested.
- Moved xen_pt_range_is_common() implementation to arch-specific headers
(arm32 vs arm64) instead of keeping #ifdef CONFIG_ARM_32 in pt.c (tried
IS_ENABLED() for DCE, but ARM64 lacks definitions for
DOMHEAP_VIRT_START/TEMPORARY_AREA_ADDR, breaking the build).
- Added ASSERT_UNREACHABLE() on failure path in xen_pt_update().
---
 xen/arch/arm/include/asm/arm32/mm.h | 24 ++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mm.h | 10 ++++++++++
 xen/arch/arm/mmu/pt.c               | 14 +++++++-------
 3 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 856f2db..c7d09d3 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -16,6 +16,30 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return false;
 }
 
+static inline bool ranges_overlap(unsigned long start1, unsigned long size1,
+                           unsigned long start2, unsigned long size2)
+{
+    if ( start1 < start2 )
+        return start2 - start1 < size1;
+
+    return start1 - start2 < size2;
+}
+
+/*
+ * On ARM32, page-tables differ between CPUs, so not all mappings are common.
+ */
+static inline bool xen_pt_range_is_common(unsigned long virt,
+                                       unsigned long size)
+{
+    unsigned long temporary_start = TEMPORARY_AREA_ADDR(0);
+    unsigned long temporary_size = XEN_PT_LEVEL_SIZE(1);
+
+    return !ranges_overlap(virt, size,
+                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) &&
+           !ranges_overlap(virt, size,
+                          temporary_start, temporary_size);
+}
+
 bool init_domheap_mappings(unsigned int cpu);
 
 static inline void arch_setup_page_tables(void)
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index b4f7545..a3cb56d 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -12,6 +12,16 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return true;
 }
 
+/*
+ * On ARM64, the Xen page-tables are shared by all the CPUs,
+ * any range is therefore common.
+ */
+static inline bool xen_pt_range_is_common(unsigned long virt,
+                                          unsigned long size)
+{
+    return true;
+}
+
 void arch_setup_page_tables(void);
 
 void update_boot_mapping(bool enable);
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index 81fe121..42fa79a 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -13,6 +13,7 @@
 
 #include <asm/current.h>
 #include <asm/fixmap.h>
+#include <asm/mmu/layout.h>
 
 #ifdef NDEBUG
 static inline void
@@ -601,15 +602,14 @@ static int xen_pt_update(unsigned long virt,
     unsigned long vfn = virt >> PAGE_SHIFT;
     unsigned long left = nr_mfns;
 
-    /*
-     * For arm32, page-tables are different on each CPUs. Yet, they share
-     * some common mappings. It is assumed that only common mappings
-     * will be modified with this function.
-     *
-     * XXX: Add a check.
-     */
     const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
 
+    if ( !xen_pt_range_is_common(virt, nr_mfns * PAGE_SIZE) )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+
     if ( flags_has_rwx(flags) )
     {
         mm_printk("Mappings should not be both Writeable and Executable.\n");
-- 
2.56.0


