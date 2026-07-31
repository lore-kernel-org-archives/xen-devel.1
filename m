Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9389AC54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 15:45:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379347.1624040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wppPp-0002db-Mh; Fri, 31 Jul 2026 15:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379347.1624040; Fri, 31 Jul 2026 15:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wppPp-0002dU-He; Fri, 31 Jul 2026 15:44:53 +0000
Received: by outflank-mailman (input) for mailman id 1379347;
 Fri, 31 Jul 2026 15:44:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wppPo-0002dO-50
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 15:44:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wppPn-00CcWi-I1
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 17:44:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a6cc2f1-5cb7-0a2a0a5109dd-0a2a450a83e6-8
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 17:44:51 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a6cc2f3-f2d2-0a2a450a0019-d155dd35edda-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 17:44:51 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1444971f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 08:44:51 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41cfdc6sm6094411f8f.8.2026.07.31.08.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 08:44:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785512691; x=1786117491; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y8L2Noa6mtvQ0Rwoe9xnwT5fWOvaCdeM1AVuv/yBPbo=;
        b=d9mGgxDA2QrKgifjrwjECwij91kePKyIL2R7rI+lpKvEdxsmQnIrPShsHhug+TU58z
         8DGvvyaNjXE/3Fg5L8ooMSdGXCKILNj0wmDArAk7IBcBeTRr/9ngAlE0tvYyzOUv5iMP
         Mu/lmodV+3zzqXnWeZZx5L3MaFYEWNv93ptBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512691; x=1786117491;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8L2Noa6mtvQ0Rwoe9xnwT5fWOvaCdeM1AVuv/yBPbo=;
        b=IXshfKPZ3B12QOVSngrrcoa5Ii6epHUozmpAKenaNW7CWdLByp4Nq2sXIpD7Z9cyPY
         NC7AWcSMZIEa5YDtP2vmHytgjF2JjzaEYavvxviOjZHA3A0lB+rm25hPW2RBnb94ang3
         6ZV/YOQm3wlm/HBEaIj1VP0uPsyMi+09S21JA3KIOWiB5X4U+fp8Dr/Bhka6mWfWq5Ln
         WQNfkMn3qb3L0Iv+IUkrY9JCMuMZY75mfTU42U/kQleDuzECcEMPtZ10yh+Lu0L/jdx0
         dvOMZqUQNqqyIeyBjlHEbK3KMCpvksCGVyJIhn4y1UgbJmtyjUbhy2/b8UORP8+gZfNv
         Vo+g==
X-Gm-Message-State: AOJu0YzsMBg9pF4EG2cd0Emd5737OL6daO8+Gf/BRx5gKCtYKYy43Mxe
	xKV2w8Orzz/lcYsG/T/ifFAc7UD07m1mZGB8SHaHDot7Bkzm2QRDGY5qKsfCpORaZyyC65FceH3
	KhEPc3l4=
X-Gm-Gg: AR+sD12+6Agv7V+Mz71iEC4uyqOK6TrMeDff2sRiOXq0JzzOugJPEYIOPWrRpqwwRu5
	zISOLlOCQ+3fb1wA27vStpDKzv/C2+9I3XnTxJxoxXbZe4fMQxSGER2nbrzZLNuppruPpghbOLL
	H93B0/GsRei2DbdOSHYXU0xYd1SFT40NLWYpmXZyp7VqDZae7atEO05cFH2c/ef1JYIqX8e7mcF
	g7uH4C4L8RGC5CJZBja8tjxpnde87u1BGgRRlRJ40Td3r2XpgUVOhA3/WG7QTfVu4tEIWnpRXxZ
	0raqZWPHRrCqKAJ5HRzfHvjU6kKmEJ4X/eDWMn6P41VCcgHRflZmlglB+YVJgeLv32xmPHRpzdI
	Uoi6rWcl6VQAD0kBZDIQUSSMX8AAJPcuKCU037PPn1fYKHtUOjQPlG1mZn4lz3oBBKQiBDz0T2k
	URBW1zKo18kMPFkJam3VZy1Lo2BMRw9UlvmU73a+MB/Qxqm9EuYZiz4xucDqpEOiRMi1xQFbN3Y
	YymAuliyZgAtlV4k+QDqr95BzPPafT+XjPyMJ8=
X-Received: by 2002:a05:6000:2311:b0:47f:c62e:9cbe with SMTP id ffacd0b85a97d-47fd72f08e8mr279982f8f.31.1785512690344;
        Fri, 31 Jul 2026 08:44:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 2/3] xen/livepatch: Fix include hierarchy
Date: Fri, 31 Jul 2026 16:44:47 +0100
Message-Id: <20260731154447.436019-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250509163212.2948359-3-andrew.cooper3@citrix.com>
References: <20250509163212.2948359-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785512691-4B2D8CFC-634CEAD9/10/73395122804
X-purgate-type: spam
X-purgate-size: 4140

xen/livepatch.h includes public/sysctl.h twice, which can be deduplicated, and
includes asm/livepatch.h meaning that each livepatch.c does not need to
include both.

Comment the #else and #endif cases to aid legibility.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

v3
 * Limit public/sysctl.h to CONFIG_LIVEPATCH builds
---
 xen/arch/arm/arm32/livepatch.c |  1 -
 xen/arch/arm/arm64/livepatch.c |  1 -
 xen/arch/arm/livepatch.c       |  1 -
 xen/arch/x86/livepatch.c       |  1 -
 xen/include/xen/livepatch.h    | 12 ++++++------
 5 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/arm32/livepatch.c b/xen/arch/arm/arm32/livepatch.c
index 134d07a175bb..8541c71d6e2e 100644
--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -9,7 +9,6 @@
 #include <xen/livepatch.h>
 
 #include <asm/page.h>
-#include <asm/livepatch.h>
 
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state)
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index e135bd5bf99a..39159ba8b5bf 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -13,7 +13,6 @@
 
 #include <asm/bitops.h>
 #include <asm/insn.h>
-#include <asm/livepatch.h>
 
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state)
diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index 3805b2974663..2fbb7bce60bb 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -11,7 +11,6 @@
 #include <xen/vmap.h>
 
 #include <asm/cpufeature.h>
-#include <asm/livepatch.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index be40f625d206..bdca355dc6cc 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -17,7 +17,6 @@
 #include <asm/endbr.h>
 #include <asm/fixmap.h>
 #include <asm/nmi.h>
-#include <asm/livepatch.h>
 #include <asm/setup.h>
 
 static bool has_active_waitqueue(const struct vm_event_domain *ved)
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 45c8924f3412..b40928c3e646 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -14,12 +14,14 @@ struct xen_sysctl_livepatch_op;
 #include <xen/elfstructs.h>
 #include <xen/errno.h> /* For -ENOSYS or -EOVERFLOW */
 
-#include <public/sysctl.h> /* For LIVEPATCH_OPAQUE_SIZE */
-
 #ifdef CONFIG_LIVEPATCH
 
 #include <xen/lib.h>
 
+#include <asm/livepatch.h>
+
+#include <public/sysctl.h>
+
 /*
  * We use alternative and exception table code - which by default are __init
  * only, however we need them during runtime. These macros allows us to build
@@ -93,8 +95,6 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
 
 void arch_livepatch_init(void);
 
-#include <public/sysctl.h> /* For struct livepatch_func. */
-#include <asm/livepatch.h>
 int arch_livepatch_verify_func(const struct livepatch_func *func);
 
 static inline
@@ -143,7 +143,7 @@ struct payload;
 int revert_payload(struct payload *data);
 void revert_payload_tail(struct payload *data);
 
-#else
+#else /* !CONFIG_LIVEPATCH */
 
 /*
  * If not compiling with Live Patch certain functionality should stay as
@@ -165,7 +165,7 @@ static inline bool is_patch(const void *addr)
 {
     return 0;
 }
-#endif /* CONFIG_LIVEPATCH */
+#endif /* !CONFIG_LIVEPATCH */
 
 #endif /* __XEN_LIVEPATCH_H__ */
 
-- 
2.39.5


