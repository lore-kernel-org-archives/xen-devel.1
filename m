Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8FEC624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:43:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405696.1639150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNa-0006Be-4k; Wed, 02 Sep 2026 11:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405696.1639150; Wed, 02 Sep 2026 11:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNZ-0006Al-Up; Wed, 02 Sep 2026 11:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1405696;
 Wed, 02 Sep 2026 11:43:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x1jNZ-00069Q-KF
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:43:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jNZ-002dmo-0z
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:43:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980beb-2eae-0a2a0a5409dd-0a2a4503ab4c-14
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:45 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980bf0-fae8-0a2a45030019-d1558036cd0d-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:44 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso9892545e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 04:43:44 -0700 (PDT)
Received: from andrew-laptop.. ([185.110.61.35])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46422desm61190055e9.1.2026.09.02.04.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 04:43:43 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788349424; x=1788954224; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WoMupA15p1j9FxYGosrZSTQl8rtEPyPBGX/n1/nILow=;
        b=ohB6gVGaTZvHaF+oH49vT6DipN7SqGCBy+eueKm9vYnm3VDAsabsN40bMdSTetWgGk
         hutr1tUdac6SwIpY6yK2RUsOLGauFm4PikPPPyvYn4jORPu4ctmz5RyIHDyve+XlZIRP
         P1105ArUUe2wrx9uSzXeJeuviuUVXDdm0nSsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349424; x=1788954224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoMupA15p1j9FxYGosrZSTQl8rtEPyPBGX/n1/nILow=;
        b=PjdrHAdH6RYv1nn6KRqPJK6rGjDBInyX1ueea9sok6JF0noj+L6GSBwspHS1/VAEH8
         RFVsy251o0lX4HWnRWp3ke1fYdlFILF/baHI855K/tY5TqH3HFr0u81C+l1eXlVNP2xG
         N6z/snEOouEUtvA2MpxER9LbcIhhtSN/HgJf8/pTIw13tbPQtYHvFoXwtzgGcNKHDIoe
         yZEqcyENGLoDfvRyGTwhz4HojdhO5VN3Et8s6XvjaT+OqYywRNSNkZwIQGDCw2DqoUrT
         OnQEps0nkJR5jG5ZmAnYUvN6jLM6UKMCwMqLc0CrVfam+42g1NmMHQgHegpIfL2O0a2H
         Ryig==
X-Gm-Message-State: AFuF++kClMw8/lMGP32GZCQj4WOiRoLIfKzJvAel+VTmJyGYQuD72y9v
	MjdX+UwlY3m2q8EJ1C6uFKQTYVXVuLH1cRrr70ni3+1+XzsnneF5vVwzsFemRW+qVkeLccM066D
	PAv2hpyU=
X-Gm-Gg: AR+sD12IvLMlwTDzNs7tah0dIVwgC45TdvV1VPIxyx65MTnjmO98NTs83shzh1ryzoS
	jPOpfxam6fKcH4axcoHx14Qiky4WpzWR75ak16otUqaDCZXlwFqkfAoPoqVgjdz3och5JBuw6Av
	UpKH97zgjj121Bk1P5TNTcw9E5P6A5GTfYlaibiazXJ7/W7Z45Kgev+vpj0UTG+GRjBbOpzFfAz
	s5CrV8Bcr9A97YXsBSkgaG4TFsPKi3KdBieenGOaJoXh3VuW/SwS0AehkNg6ZaGsvEcZOyGMOIx
	iJwXViZlq9o05UgPinI0rebrOPtbfPB8aQSXqkcx8FoVl4CtmwqBG84X7liFX+83rzC9TKT8hXn
	84hj7gogrVQiksZkOAsS5q2Sdep+gKOHiDYuzQbYEPdTBTLomXt+eeJ5WC+hikuO25GLPMxPfes
	2QXXeDeOIvsp9B+se7W4HT3aDJ5kFzOmhBTpFcmDHS5OGlyQM+X/kfv4lbZGNPshxPN6h9kJkAA
	gwBSenKIQ==
X-Received: by 2002:a05:600c:8b88:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49ce584b899mr75422905e9.12.1788349424249;
        Wed, 02 Sep 2026 04:43:44 -0700 (PDT)
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
Subject: [PATCH 2/4] x86/bitops: Remove CONST_ADDR
Date: Wed,  2 Sep 2026 12:43:37 +0100
Message-Id: <20260902114339.62043-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902114339.62043-1-andrew.cooper3@citrix.com>
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788349424-7488A4E9-A9FA11DC/0/0
X-purgate-type: clean
X-purgate-size: 1467

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
 xen/arch/x86/include/asm/bitops.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 69ffed510c0a..fbcab32fd239 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -18,7 +18,6 @@
  */
 
 #define ADDR (*(volatile int *) addr)
-#define CONST_ADDR (*(const volatile int *) addr)
 
 /**
  * set_bit - Atomically set a bit in memory
@@ -285,7 +284,9 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
     asm volatile ( "btl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit)
-                   : [addr] "m" (CONST_ADDR), [nr] "Ir" (nr) : "memory" );
+                   : [addr] "m" (*(const volatile int *)addr),
+		     [nr] "Ir" (nr)
+		   : "memory" );
 
     return oldbit;
 }
-- 
2.34.1


