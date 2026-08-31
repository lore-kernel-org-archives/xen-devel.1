Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D67C61DE2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:20:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403956.1637888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zT-00070f-Nz; Mon, 31 Aug 2026 12:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403956.1637888; Mon, 31 Aug 2026 12:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zT-00070R-Kh; Mon, 31 Aug 2026 12:19:55 +0000
Received: by outflank-mailman (input) for mailman id 1403956;
 Mon, 31 Aug 2026 12:19:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x10zS-000703-HP
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:19:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x10zR-00Dc7p-Tq
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:19:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a957157-8faa-0a2a0a5109dd-0a2a450bb102-34
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:53 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a957169-b7e8-0a2a450b0019-d155802ff195-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:53 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49ccfae359fso12001145e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 05:19:53 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48440e094d0sm847709f8f.23.2026.08.31.05.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 05:19:52 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788178793; x=1788783593; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ErWLaEnj10uj3lU2o4qVnGamxA9UVeFuuO35JsiTkDA=;
        b=gwUuILzhgdQwlH1vs8jcPGWvHW0NXiUqe0GjTpKNWXabscKTnfitj7iVD/qeR0mNQM
         TqMBvc3sG8ZpV9vaUXBpZPkT7Se0VRuGJ7VGi3FhiVogC11UIyCsIv8yMRdUtrAsb5Zt
         nQpF2tNS5Ysr79OxHzw0iJCaa7ieKVBhsZrDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788178793; x=1788783593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ErWLaEnj10uj3lU2o4qVnGamxA9UVeFuuO35JsiTkDA=;
        b=EojxHvLpoQVsx6Jcn1KkRID6jQV1DvBVLxivb58bSOUu0EzyRP/jywqpuoOirlCvG+
         OdBCfsyG5KKhjs80qcKLz2EDAfSZo74g/uPHV909Sq7H/ipHs3HfDPexp8NSHwomid6L
         VOEnPWx8ISHPWmbyK+N75WIgJlnx4SYCixSoLJS0Qe+1BY+xDULqNkEvlvyVLTfH7Qxn
         SfINRi398Nw+qX5pEUkTxGBi/79IY5g5eIl2AWEWmR+SDXy/Mp1lLGTyMSLJcYRO9/yO
         uWFeAAODaIadVUlHBVMmlBKZpGUay+ura7ETgkZI+lsw6FM4mIrmYCFiojoBNX1yMtyw
         U4jQ==
X-Gm-Message-State: AFuF++nAbUSMtFz6n4hGk0Y4ETZZ7aKvGRmMGKVAzZnMiJEdgOp5yVoo
	Oq9yBxt84RI5OBQXFoa+JrDWCy21fSaXbCZ4SpWQUBHvT0Z2NJbcWOp/HA2S1M6RxT9ry83xIK8
	/nWgVJn0=
X-Gm-Gg: AR+sD13CvRpoD2WY2o5aRa29mc7Z/SFMgH+evrlZJCgrwKJ/fBvG47EBfNkss6Cf2bD
	UfPHkHzCv5UkVhy9vGJ1OwegH+jHS7Fb9cmYWXrW9w0+5ctFyevjOYlo/42/N44DthY1msMUfXO
	fE0gzTYrhHrIqoLuxv514CDLdbaPyZeO3CY/e0Oux/E5Q0iMsP28MebSKWQ4CmI1VXd/Lv0bl3E
	+jVhFrBPtTUTMAFL1KAXPpsfjVL6CjR0COpE6+JBDmz4hi2NSWME0GnXnICE/EmjNJ0b3PiFY+O
	Mh+MD2GD7MiINO9YTrC4cMOMD+eRMRcJrA6OhRA6cU76OWjLHcON5KERj1BHDCNx4o0SaOZd2JF
	44qStXpnFaX/HdQA4RlWi5zcTPbi5K3R7qPEUwuF/Zz4GCbXKq6VPzZOGvTjI9ETaxLuTYoMwiY
	JBz7FDPIdgt6DdVy+1XdrYO6EpfSti5hW3QKxdFufBzxM0mmrUBfURb55E61ZTzhfQel424GS2E
	n0rGLFWkvrZvHVMUZ/IPlE9wz8IUSYVLsriKwU=
X-Received: by 2002:a05:600c:4744:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49b91c2479amr389264755e9.4.1788178792772;
        Mon, 31 Aug 2026 05:19:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 1/6] xen/arm: Fix evaluation of parameters for SMCCC calls
Date: Mon, 31 Aug 2026 13:19:40 +0100
Message-Id: <20260831121944.2908139-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1788178793-AAEDE9EA-3C1B024F/0/0
X-purgate-type: clean
X-purgate-size: 4638

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

base-commit: 79225a0c77e13b693b4d2b903a88289704b79db6
-- 
2.39.5


