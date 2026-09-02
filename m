Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D48C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:44:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405698.1639171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNc-0006nT-IC; Wed, 02 Sep 2026 11:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405698.1639171; Wed, 02 Sep 2026 11:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNc-0006nK-Dg; Wed, 02 Sep 2026 11:43:48 +0000
Received: by outflank-mailman (input) for mailman id 1405698;
 Wed, 02 Sep 2026 11:43:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x1jNa-0006M9-JD
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:43:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jNa-002dpt-01
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:43:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980bf1-2eae-0a2a0a5409dd-0a2a450c86b0-0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:45 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980bf1-f479-0a2a450c0019-d155802ad0e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:45 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso13565075e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 04:43:45 -0700 (PDT)
Received: from andrew-laptop.. ([185.110.61.35])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46422desm61190055e9.1.2026.09.02.04.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 04:43:44 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788349425; x=1788954225; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2J37vG8ht9VCq82ApqJLmvWX3G+XIBcAFjZqFJr6yg=;
        b=JA/2f/Fwp2hwdQ0X50xymNlO7nG/nx2b8guoL0RRHSoGf+ZqRNwXt7kFCwmbyr7N52
         Q4kaWflS13d/t4IUsu9Gx8Mw84ONpGC+PiYfdmiwYT4K/Z3qHZ6ZSMs0rsXnunDRbTk7
         QiMshU9TQCr7YbASV6WvmSdLeABRrXWQGcLdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349425; x=1788954225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2J37vG8ht9VCq82ApqJLmvWX3G+XIBcAFjZqFJr6yg=;
        b=sGGRljf685u1zhquKViOT01vdKJ6bT7/nHlgWTdKAXlHLmR5uHKVSV30jhfjyEBENL
         RffPfKCUn4nbBAZnGCzSoJ09uBPPpt7PNyItkRzipjcPIwnRv3XL58H0YS8nKGo97lUv
         x6irLLU3eDdIirt85v37kgsn8Q6K17/FLczLLSeTJLhpOV1LkEnt70zpO+B8bZue/FRu
         oXk0r57Et1pfZ/CQDX6mADQwA4LJddQaTqVgFiTh/ujk6yHLF/yOA99uhdiiFXhSNbeJ
         05msodqhXUqa467PNSwb6TaaCIh25VCT1DeEWkOOOMTOmjCRBmvlRd5yVyRpKAIcjQ85
         jDxQ==
X-Gm-Message-State: AFuF++kZd5kDtLxx/NVzKgOZn05WZJf8ETKuCSFMOj2yXiyeI8Fg6dS8
	jP3u3J30tVRhOXpbBp/rBbPJjqLG5Ir31axHPvyPfzCrgECfTOJ6LeycxZoY9uFWKrRgIsrGhhi
	7cLb2aZA=
X-Gm-Gg: AR+sD12Hp38EI5556RLdPWRF9cF1jAGZ3fsiKtLQ9inie+iAb3XnUhy5s4dAmDkuC9S
	gdQJ3WWDfW7aGlmk9kngyz4MI2CQm+/ml/PwNk9RtdfW8ccrX3XQ8zAs1C2fTrZihP4qfAqxgnQ
	unPnHZaydy1DYrNA/zhgY1bnFDkG59TH6qyRfjfQrrvTtEfWheo+ufKVjGP7cXtG4I8VISj1KXP
	txax380oWH6VVQ3FqZqHQwW9nlucYwA/E840I5EuBXflmGAD5WZmuznNtb/pLmM5GdqSenCyFFz
	FGRRjbm104VgwYHM9GlS6mpTDej/XK7gmVb2GHi/wlXjF9U7SW7MxFmzA4qTwkK4yB1xu6FKkYW
	sLpAcBFDFEnyjKxcaBo/KVeUceqOn4JnKk5r7QORuUJ+NbPKJrgkRuuamUdY8keD6rhyWp9v92Z
	XWwBWxuKVVHkGRpHc/s5PxSfTBdvGCas3Nu2qwmYTIFjFTV846sUolPNQRCnHv/GMYkzZQNKQ=
X-Received: by 2002:a05:600c:530e:b0:49c:d618:e341 with SMTP id 5b1f17b1804b1-49ce584bb4amr83885245e9.14.1788349425011;
        Wed, 02 Sep 2026 04:43:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/4] x86/bitops: Remove ADDR
Date: Wed,  2 Sep 2026 12:43:38 +0100
Message-Id: <20260902114339.62043-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902114339.62043-1-andrew.cooper3@citrix.com>
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788349425-020C1A5B-99BEC875/0/0
X-purgate-type: clean
X-purgate-size: 4833

All this does is obfuscate the usage sites.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 docs/misra/rules.rst              |  3 ++-
 xen/arch/x86/include/asm/bitops.h | 34 ++++++++++++++++---------------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b3e929307d51..d6be4b0c5d43 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -212,7 +212,8 @@ maintainers if you want to suggest a change.
            static inline void set_bit(int nr, volatile void *addr)
            {
                asm volatile ( "lock btsl %1,%0"
-                              : "+m" (ADDR) : "Ir" (nr) : "memory");
+                              : "+m" (*(volatile int *)addr)
+			      : "Ir" (nr) : "memory" );
            }
            #define set_bit(nr, addr) ({                            \
                if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index fbcab32fd239..45fc64474344 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -9,16 +9,6 @@
 #include <asm/asm_defns.h>
 #include <asm/cpufeatureset.h>
 
-/*
- * We specify the memory operand as both input and output because the memory
- * operand is both read from and written to. Since the operand is in fact a
- * word array, we also specify "memory" in the clobbers list to indicate that
- * words other than the one directly addressed by the memory operand may be
- * modified.
- */
-
-#define ADDR (*(volatile int *) addr)
-
 /**
  * set_bit - Atomically set a bit in memory
  * @nr: the bit to set
@@ -32,7 +22,9 @@
 static inline void set_bit(int nr, volatile void *addr)
 {
     asm volatile ( "lock btsl %1,%0"
-                   : "+m" (ADDR) : "Ir" (nr) : "memory");
+                   : "+m" (*(volatile int *)addr)
+		   : "Ir" (nr)
+		   : "memory" );
 }
 #define set_bit(nr, addr) ({                            \
     if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
@@ -73,7 +65,9 @@ static inline void constant_set_bit(int nr, void *addr)
 static inline void clear_bit(int nr, volatile void *addr)
 {
     asm volatile ( "lock btrl %1,%0"
-                   : "+m" (ADDR) : "Ir" (nr) : "memory");
+                   : "+m" (*(volatile int *)addr)
+		   : "Ir" (nr)
+		   : "memory" );
 }
 #define clear_bit(nr, addr) ({                          \
     if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
@@ -140,7 +134,9 @@ static inline void constant_change_bit(int nr, void *addr)
 static inline void change_bit(int nr, volatile void *addr)
 {
     asm volatile ( "lock btcl %1,%0"
-                    : "+m" (ADDR) : "Ir" (nr) : "memory");
+		   : "+m" (*(volatile int *)addr)
+		   : "Ir" (nr)
+		   : "memory" );
 }
 #define change_bit(nr, addr) ({                         \
     if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
@@ -162,7 +158,9 @@ static inline int test_and_set_bit(int nr, volatile void *addr)
     asm volatile ( "lock btsl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
-                     [addr] "+m" (ADDR) : [nr] "Ir" (nr) : "memory" );
+                     [addr] "+m" (*(volatile int *)addr)
+		   : [nr] "Ir" (nr)
+		   : "memory" );
 
     return oldbit;
 }
@@ -208,7 +206,9 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
     asm volatile ( "lock btrl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
-                     [addr] "+m" (ADDR) : [nr] "Ir" (nr) : "memory" );
+                     [addr] "+m" (*(volatile int *)addr)
+		   : [nr] "Ir" (nr)
+		   : "memory" );
 
     return oldbit;
 }
@@ -268,7 +268,9 @@ static inline int test_and_change_bit(int nr, volatile void *addr)
     asm volatile ( "lock btcl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
-                     [addr] "+m" (ADDR) : [nr] "Ir" (nr) : "memory" );
+                     [addr] "+m" (*(volatile int *)addr)
+		   : [nr] "Ir" (nr)
+		   : "memory" );
 
     return oldbit;
 }
-- 
2.34.1


