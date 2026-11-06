Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50D2606A32D
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 20:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=Ju6vEj9U
Received: from list by lists.xenproject.org with outflank-mailman.1477337.1682887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPQKW-00020Y-Bz; Fri, 06 Nov 2026 20:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477337.1682887; Fri, 06 Nov 2026 20:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPQKW-00020J-5d; Fri, 06 Nov 2026 20:14:32 +0000
Received: by outflank-mailman (input) for mailman id 1477337;
 Fri, 06 Nov 2026 20:14:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPQKU-00020D-AM
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 20:14:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPQKT-0089Xe-8Y
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 21:14:29 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aee3502-2eae-0a2a0a5409dd-0a2a4506a8b2-30
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 21:14:29 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aee3524-195a-0a2a45060019-d155802bb924-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 21:14:28 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so10965255e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 12:14:28 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7efb134ccsm3988335e9.10.2026.11.06.12.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 12:14:27 -0800 (PST)
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
        d=citrix.com; s=google; t=1793996068; x=1794600868; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3ycVQfER+OeRfPQv9zS8nTjBTKJpLB/0bWRaXvffxA=;
        b=Ju6vEj9Ua5rB88buun6RHEtH0Vijf35NMZuaHHfeREXMMu0mLsFa1IRdF5hxOmxW4H
         uW6Y5VrEt0Io4Th6BGAH5qWHVHwr/UgbvO/99W6lE+/XBIvfI0P65znn8fiqceZXmf1Q
         r1qdAU3PnIxsfUiEp6hCWmthsPieztjkZiXZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793996068; x=1794600868;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3ycVQfER+OeRfPQv9zS8nTjBTKJpLB/0bWRaXvffxA=;
        b=zks3+DOf1EMNz6LKF9xFPUp8EzVV5XYumgJ/JdN5o0WJjRJsQfcGQZuCv1DDFg2swy
         ZMPdNZrqfB13x3DFJBelnskd3xJTuenRGWb3mhu9yA0hglZ/poEqBDM+PH78qJyH39wA
         iPlFKq3i+uo1MU1ingGKygFvHGACwk5BHgc5qKiSKtqu7ve1WWgr47vV1q51jzX6Bjwz
         mhY6xGpjOTTkFp7Bt0VgYUwBHRMV/lW12WK4NBW4OMHoFSdQNl5Sab+5FPKxSNDRRl3C
         meswo9JDf8K1FbhtP3fniiq1/DymxkyCGHN3bx0HIRJRzVwSsahQ1/obe178qAizTn3B
         EBhQ==
X-Gm-Message-State: APuU4Z9hfa97T9rHIJM20uVNWPak3wPyVNPNa6vGVpNLL8aZc8WIA6xt
	SvPLqFY4ZRqGnsha6lj7zxKwAnkSIkD8ys2zA3hClVVAV2hjik/UZSdgvZs9cY17O9wQaNuANiA
	EWTvQW1s=
X-Gm-Gg: AYBFou0p+DuOqHTCO6eIFj0Rzxcp39wUmqZ41NerZFicu3o1dSJ+U7P1V9NBjYnvNKi
	27/BWweynpzhavOHNQ8yuoDDHbdZe3yjTRC62NiJE1QOl3cUWxjzuTRB5Q+/wfBV0yTbmrZ6N37
	68R/pX53BaLJQ4ddy6iLUvbcBwE9x7PJcbncLU2WZfZ0tVmZA3dIJoq9cxnS9izH/Q9yyqAWZ3H
	hZv5HNioEbLiRQRtRRseP4tMnczqrV76fwek3oInFk5B8g/wFPqaqfvI+JzSqi4DP1Ojbb0QhwK
	iNdLHpCASni30uNf1TTFkg5CBBqkSCgT0/10qOxTYZgbQkBgm4bte0O14HhiKe2fM1ByBPO3CKj
	uxDTqMQj1DM2INbQThjF0DJE2zW+r5urU0B9hVmk4TTnRvrCi7U3Wxip72RhmvJYWBfRHTNjnVp
	FlUb7PYbwXcnLTWswnq3UPi+2sg/rKlt0uYeRUGvfJWz3PLb6SiCcyhCNjkIG9M1ywPtOsYMv6Q
	nD1gdtPDBjZZ4CvxAacTRxKnezw/H4GVBeTXsF43MPVRW7DBqEb/XaxUMYo7uZb+ldE4UQZvJ/Y
	ePZq9CXDQhEn57n637988/DUbv1nizTUcHJWE/Z4+abGYhf0yamRW2ZIngLvitvBMXou4QLVJCh
	msvs=
X-Received: by 2002:a05:600c:c8a:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4b6e0454dbfmr62745665e9.33.1793996068148;
        Fri, 06 Nov 2026 12:14:28 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Denis Mukhin <dmukhin@ford.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH RFC] x86/hvm: Disallow modifying the APIC_ID register
Date: Fri,  6 Nov 2026 20:14:26 +0000
Message-Id: <20261106201426.2785335-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793996068-FDC0F77B-887031CB/10/78276251493
X-purgate-type: spam
X-purgate-size: 2454
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The APIC_ID register is strictly read-only in x2APIC mode.  In xAPIC mode,
both Intel and AMD document the read-only-ness as being implementation
dependent.

In practice, for Intel it's read-only on any x2APIC-capable hardware (Nehalem
and later, so almost two decades now).  For AMD, the register is writeable but
doing so trucates the 32bit x2APIC ID, so in practice nothing (not even the
firmware) does modify it.

Just as we disallow changing the LAPIC base for ease of supporting APIC
virtualisation extentions, ignore guest writes to the APIC_ID in xAPIC mode.

Note, this still allows the toolstack to configure APIC IDs, for migration and
topology reasons.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Denis Mukhin <dmukhin@ford.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

This patch is from 2019.  I apparently never got as far as sending it...

This is even lower risk than disallowing changing the xAPIC MMIO window.
There's been no comment or issue with that restriction, which has been in
place since 2018.

It is however RFC.

 * Without this APIC_ID restriction, we need to modify the logical id table in
   response to changes, including disabling AVIC domain-wide if the guest sets
   a layout which can't be expressed.  Intel have gained a similar table with
   their IPI Virt capability on SPR and later.

 * Both Intel and AMD allow writes to the APIC_ID to be accelerated, and give
   a trap VMExit after the backing page has been updated.  So if we're going
   to enforce this restriction then we need the VMExit to undo the
   modification.
---
 xen/arch/x86/hvm/vlapic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 6698779e227c..358fdd4baf92 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -795,10 +795,6 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
 
     switch ( reg )
     {
-    case APIC_ID:
-        vlapic_set_reg(vlapic, APIC_ID, val);
-        break;
-
     case APIC_ESR:
         val = xchg(&vlapic->hw.pending_esr, 0);
         vlapic_set_reg(vlapic, APIC_ESR, val);

base-commit: c4a09c112c391ffc1aea33afff49ffb28156fbdb
-- 
2.39.5


