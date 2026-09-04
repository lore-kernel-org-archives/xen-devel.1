Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A157C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:12:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408221.1640866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqX-00053Q-Vn; Fri, 04 Sep 2026 11:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408221.1640866; Fri, 04 Sep 2026 11:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqX-00053G-Sj; Fri, 04 Sep 2026 11:12:37 +0000
Received: by outflank-mailman (input) for mailman id 1408221;
 Fri, 04 Sep 2026 11:12:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x2RqV-0004qM-Pd
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:12:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2RqU-00DcP9-IQ
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:12:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa7a1-2eae-0a2a0a5409dd-0a2a450ac29c-6
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:34 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa7a2-f2d2-0a2a450a0019-d155dd2adc54-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:34 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4843e9c5960so884856f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:12:34 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be1c1sm5501729f8f.32.2026.09.04.04.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:12:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788520354; x=1789125154; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAj5V/bmI918usNj6g2EqlOZB06ZEviH3X3JOCZBsg0=;
        b=X3nN+PPaimN6A+z7e+wvnsF+kpa4GdbmWawPypI4A9jDfc95SwzpsDShaZdLbrgs6A
         GGZllrRxWCfWgryRbKwOqiloIMcOPndz9K6UxM+UOPAjV8R5VUuPWx65Hc6nd4yCWMKl
         7luTdMEtAPW63qqbi04aDGtcUihH8ghR02TL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520354; x=1789125154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAj5V/bmI918usNj6g2EqlOZB06ZEviH3X3JOCZBsg0=;
        b=I/riddpCBaYpDJETHfguTPLqp9OcTi7rXBRLQ/Czx9MwThCLnYEtuqjbIND4Lv9oFC
         k5GbrQdV/3O1s72Pi+jQmamWBFifiSpCJoP0x2ibg83l/itvFyZQp0odF6iE7XGs7RsE
         nEohQijtMhWlEkiYiAf7bDF+mU4ZNX7KvsyUwGnpuIVw0Eb22pysj5cLDhmztDsLhzA6
         Vr1q3FH6X5Lec7w1G1Z+Ep/yIJ7u8Kzooqus7rCmbHEm+gBqqHhCx8rzpia61gBFJbJ7
         J5KpTFwZRICXpGT6IwFcVV4/lVzhFh6Ok6wjEAUBDBWzZMHDglYCqHo4KGqmnmfBBaLR
         ZpKg==
X-Gm-Message-State: AFuF++kgWpub0wCngpb1UoVwssXotul2nWoLS9BxxR0Jv5xfSWoByxoU
	nvvOD8QaqGR05Z8Nt/+s9TLvnA+fIWVozuUtx9jtCmA2ziyv8WyefEGmQ15BVfmSUHAEfa9NS/u
	adPAB9C0=
X-Gm-Gg: AYBFou0oxxdYeDV+dArx5+9kZD2M3al5N/IdHB4BKuEe6d8wwLdpn0/RAuSluG79X43
	Z63xGAs+bYhTB/g5V1gdlqjFa6YfkhbqPPwQKUY6iOlQvQKonQndBgtm2Ed+CYNahuy2nXvIBST
	HYC5HdR0GlFgnBrzJRCdaDiF3PiZUxQjwaCdJs+S2JpvmZCa2qLpGiG5hC4BTxpPG98gs6MAw4m
	WbnJafa6MhSB5RWrEIxIQRI4wcYJkOZPskFEoBscDtdHrm6gYe5Em0Qlv2kdIaDoifBIWvS9isj
	AOni7DSNsftGM+5yBPAmHY/8l1LL3ZHgeWrCBQ16DJKbUS8cDjtqVbFWQKpWAegOIzCOOM8g6qN
	XIRHGy/7XmCyycrtFe+hR6Dq2HqXqL0Xr2adJKvLNEnghlUMbDShoYZdMD4wIJSFsaZRNuzycsa
	CUJXgaol7DN5IegrG+3xt6z1U5+bnum8G41qT4Et4JOVhCuNpsjC5DNffn5fehzln/ueKns0v/W
	lbx7M06NKFk+eTojXjgIn02fEEB3HQFkvPktfZJVElCOj5PrA==
X-Received: by 2002:a05:600c:154f:b0:49c:fc6e:8cb5 with SMTP id 5b1f17b1804b1-49cfc6e8ee3mr27356755e9.25.1788520353571;
        Fri, 04 Sep 2026 04:12:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 1/5] xen/arm: Fix evaluation of parameters for SMCCC calls
Date: Fri,  4 Sep 2026 12:12:24 +0100
Message-Id: <20260904111228.3022634-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788520354-4B4D7CFC-79B07C3E/0/0
X-purgate-type: clean
X-purgate-size: 4639

Contrary to what was claimed in commit 67bcf5eae709 ("xen/arm: Simplify type
handling for SMCCC declarations"), there is an important reason to retain the
intermediate variable.  It is unsafe to have any logic between the assignment
of the register variabes and the asm() block they're used in.

This logically reverts commit 67bcf5eae709 ("xen/arm: Simplify type handling
for SMCCC declarations") while retaining the conversions from commit
7f15d5d13221 ("xen/treewide: More typeof() -> auto conversions").

Adjust __declare_arg_0() to match.  It happens to be safe because it's the
first register expression once all macros are expanded, but it really should
be consistent with the others.

Leave a comment explaining why they must be written like this.

Fixes: 67bcf5eae709 ("xen/arm: Simplify type handling for SMCCC declarations")
Reported-by: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
---
 xen/arch/arm/include/asm/smccc.h | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 62c6985e7315..53cdddb690b7 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -108,37 +108,52 @@ struct arm_smccc_res {
 #define __constraint_read_6 __constraint_read_5, "r" (arg6)
 #define __constraint_read_7 __constraint_read_6, "r" (arg7)
 
+/*
+ * Macro arguments MUST be evaluated before being assigned to a register
+ * variable.
+ *
+ * This is manual register scheduling for the asm() statement, and any other
+ * logic to evaluate may clobber the already-scheduled registers.
+ */
 #define __declare_arg_0(a0, res)                            \
+    auto __a0 = (uint32_t)(a0);                             \
     struct arm_smccc_res    *___res = (res);                \
-    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0)
+    register unsigned long  arg0 ASM_REG(0) = __a0
 
 #define __declare_arg_1(a0, a1, res)                        \
+    auto __a1 = (a1);                                       \
     __declare_arg_0(a0, res);                               \
-    register auto           arg1 ASM_REG(1) = (a1)
+    register auto           arg1 ASM_REG(1) = __a1
 
 #define __declare_arg_2(a0, a1, a2, res)                    \
+    auto __a2 = (a2);                                       \
     __declare_arg_1(a0, a1, res);                           \
-    register auto           arg2 ASM_REG(2) = (a2)
+    register auto           arg2 ASM_REG(2) = __a2
 
 #define __declare_arg_3(a0, a1, a2, a3, res)                \
+    auto __a3 = (a3);                                       \
     __declare_arg_2(a0, a1, a2, res);                       \
-    register auto           arg3 ASM_REG(3) = (a3)
+    register auto           arg3 ASM_REG(3) = __a3
 
 #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
+    auto __a4 = (a4);                                   \
     __declare_arg_3(a0, a1, a2, a3, res);               \
-    register auto           arg4 ASM_REG(4) = (a4)
+    register auto           arg4 ASM_REG(4) = __a4
 
 #define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
+    auto __a5 = (a5);                                   \
     __declare_arg_4(a0, a1, a2, a3, a4, res);           \
-    register auto           arg5 ASM_REG(5) = (a5)
+    register auto           arg5 ASM_REG(5) = __a5
 
 #define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
+    auto __a6 = (a6);                                       \
     __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
-    register auto           arg6 ASM_REG(6) = (a6)
+    register auto           arg6 ASM_REG(6) = __a6
 
 #define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
+    auto __a7 = (a7);                                           \
     __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
-    register auto           arg7 ASM_REG(7) = (a7)
+    register auto           arg7 ASM_REG(7) = __a7
 
 #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
 #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
-- 
2.39.5


