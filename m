Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB3606A331
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=No+5dwMI
Received: from list by lists.xenproject.org with outflank-mailman.1500896.1696942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVpmQ-0000q9-2m; Tue, 24 Nov 2026 12:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500896.1696942; Tue, 24 Nov 2026 12:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVpmQ-0000q2-02; Tue, 24 Nov 2026 12:37:50 +0000
Received: by outflank-mailman (input) for mailman id 1500896;
 Tue, 24 Nov 2026 12:37:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVpmO-0000oi-12
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 12:37:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVpmM-008dFx-UK
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:37:46 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b058515-bab6-0a2a0a5309dd-0a2a4507c6b8-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:37:46 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b05851a-b4ea-0a2a45070019-d1558036f054-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:37:46 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so43700585e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 04:37:46 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853ca452sm424259955e9.15.2026.11.24.04.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 04:37:45 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1795523866; x=1796128666; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLG+j20mxQFCXukiCf0qhTfmmP4Tp5BDkaTubqg0MZE=;
        b=No+5dwMIUYJJO6kMYTOz59COTaqmO3zksMpW7aC3+uG8Ggqtu0TdrB6UI0ItXEvQ0h
         G9c+LBmXYYNWP0FZ5S/e6kl5NjYz5APk7ltMWO008xj4uuf/lCSmrUD30cpMF4WaBx7Y
         HSjwn94ZP93L32Ki27+ZydAuAJiiIIkfXULR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523866; x=1796128666;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLG+j20mxQFCXukiCf0qhTfmmP4Tp5BDkaTubqg0MZE=;
        b=yIuhhxPknqY8BrNC0FCUlzAVo/2g9HIsgA8zUzUL66dPg5xARyCGQJpmCz7OLzYAfJ
         W5JJuY1zqIIx7IdG5x2+XskgmX4YSVTE8IOJ8DIENX+VAK7RnET9IXXL7sGYEo63Ot7u
         6IotRmtuClIytpujbnvNGXomK58rSA9IPN8f5drCChgRq0O5tnG5wApZhNSqu9mKyS1j
         tn6pzHYakbapaqNc78uc653c+7NchW2fq34KbdbauTkppzrFTrnZGzWhJe7LpNdmMOOs
         /WsCneKg1yDxUHHHVHMQEaaFJmQIhWMqLRq7M6vfhSTY5R1XK3dbapovjiMPfu80VZ0k
         LRSA==
X-Gm-Message-State: APuU4Z8kRVcupmIkJ2S7LTu5XLg84mAPKaJM3cHKVkuT/0dF5y8slNH8
	mQdlviTgrcchkmGfZjuwKoaCKGeD4wbPozJ6D+iJO9KAjBdfYjozYp/VQ4VRgIzba5JttdV4e/O
	Zpngg
X-Gm-Gg: AZFdTZesfJNRbrhClMwO1y7maERKPPFwKZUskdY9kGUxuU5FrtEMxfqevFPE8D3ldYD
	2tOWeSFZeXMIvDJFF3YFD6cPWw1BFYkiFB6LY1P1yUZiXuMQNx7x16ChUDw6rbJy56orxttECnu
	pZIzS6+Tv/fkQSfuXoYbKmalDtX8LdS/NiZHpaL2HK6G/ccLLfwes9O/RSfUjPAlGBGVlSdn7aM
	Vyk8S/zKT98w5QnPd61lxOx3X75L9dgg2nrlntLadJ/LXrfVA3O6i0hLos97YYXj1PIIZv24Jl3
	+ri989aPfBwDFW4CFGk7DmzrFZXzNFAdqwU8C5+ktEK3FlUk9HX/tXbwo86YkHVbPSL3Ad1VcaI
	lnCqvwyYwf0gBlqy0nsLLTXZSJ5sFjM+4jJ+Csdb7Tkmz4FX1Cs4rLU8fDG427GlWt2zAFEHVw6
	0QbLdJTbfJXSxS2O/HJJ31fhqSN5/c6oyPxEyjUyuLCwjcaAlir0voDF4oOeNlVkx5jS/oSVd/g
	RyG/sW+GNCh/g3Dkg14W/iX8CpildrgBqkMUGQv0DPCzbK9GY1D8kJgn0vZ6DUYlxDXvryjXSRT
	WJ4RdFdbImOr+SQFaRveZVsGMBSuovO6VwwZsUHFaD0+aCSJCbrV/etqypDpYRTpCari/AGnYDy
	ftnCCjoI7MlGI9IB1a7jFZ9L9
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb88785d2fmr292362545e9.0.1795523865878;
        Tue, 24 Nov 2026 04:37:45 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH] x86/emul: Reject MOVNTI without a memory operand
Date: Tue, 24 Nov 2026 12:37:43 +0000
Message-Id: <20261124123743.273123-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1795523866-A66DAAE4-279CE2F5/10/78276251493
X-purgate-type: spam
X-purgate-size: 1123
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MOVNTI encoded with two registers is treated as a plain reg->reg move by the
emulator, but it's a nonsensical encoding which hardware rejects with #UD.

Fixes: 372da9b41e0f ("x86: add movnti emulation")
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 09d43d204b8a..dc349115ba66 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5429,6 +5429,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0xc3): /* movnti */
         /* Ignore the non-temporal hint for now. */
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         vcpu_must_have(sse2);
         dst.val = src.val;
         sfence = true;

base-commit: 3b65ff9f372fb85a453a952977cc033298cba8b5
-- 
2.39.5


