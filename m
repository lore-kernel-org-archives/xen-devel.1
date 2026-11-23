Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B4C606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=byD0aYzy
Received: from list by lists.xenproject.org with outflank-mailman.1500468.1696615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVWHF-0006pN-E9; Mon, 23 Nov 2026 15:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500468.1696615; Mon, 23 Nov 2026 15:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVWHF-0006pG-AV; Mon, 23 Nov 2026 15:48:21 +0000
Received: by outflank-mailman (input) for mailman id 1500468;
 Mon, 23 Nov 2026 15:48:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVWHD-0006pA-Jv
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 15:48:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVWHC-001GD8-PG
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 16:48:18 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b046034-2eae-0a2a0a5409dd-0a2a450c8d44-30
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 16:48:18 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b046042-f479-0a2a450c0019-d1558036e829-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 16:48:18 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so25116475e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 07:48:18 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf6804sm22564525f8f.10.2026.11.23.07.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 07:48:17 -0800 (PST)
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
        d=citrix.com; s=google; t=1795448898; x=1796053698; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieNPplwZkz4pjgQTi0R58E9yRp5EKZCKDwRLnEA6vLI=;
        b=byD0aYzyHmn30U6FUX0LTVhaqkbKtjBiidFqaTFO5K4hb6c3w1qO32qV33ZJl175bH
         P4nk6Lp7xDJY/K5Z5VAojmp2ZNccSE2EZlnLuSVT6IpeynDs6/hdhAKvz1mBty1b2I73
         f2z24Y4DlWInitMEbx+KCKcveYdZFJuf1K7Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448898; x=1796053698;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieNPplwZkz4pjgQTi0R58E9yRp5EKZCKDwRLnEA6vLI=;
        b=XjOYTNvpci7QnB6V7M7KMhpiXU/0SkHIrAsa0MKXCSA/+o9qTGQXBrFNNotQ96aYP0
         s4vp0uRmtuKzu4j1cjr38pQE55YLda3nO/K7DgWulr0BAUxGLUbosOsPXkEG7S3iSdBd
         fAr08Tbah5uWqh6PAgsI1G0oMGdBZ2sih9i3ywd7fooa/NVapLhUnCzDy6dPY+howNAY
         aHEJGm7dv70kSI/F452ACTkdPjvIp0O1/gCilTw5HyS+TSeXxXGATHrVgN+tPKGkNdRT
         wOxBJ+SlspFNqVDzQL/9BDi2GFJzKDLfzUkOlPl4+697BbZCYe09c1UOAwYyZqD48Rm8
         7UMg==
X-Gm-Message-State: APuU4Z9yl1B2s5GQNqbF4f0NLrmZ0HvfWnvC3t2CEPmIv25H0ZeDelmh
	oyS8+cGQ9BmQdR/fkJQbM30BlqUW8wYpLRop4qFc4PgVXvDDmv/6tBWendfdiKGj2jkwBs4nm/A
	q5YV7v70=
X-Gm-Gg: AZFdTZcsnMqfXJvax/xnZTZTJtjrjgHIEhxYLXOnreI1rkKELsW7MWuGJRpdKDHqScQ
	oQFIp353NDKx5oEG2/QSFRb8+cWaYnBR+94J8JUvQ7Qago5YJgXtl1XN26jcqmcKRKNrQZ2EJaQ
	epkeuhUyh6dkteFkxX6vS8K7ZoHv4g5e11mecihMOYqXnKVC5KYy/OWIy7vJ9O7bkOSAUIW7G6+
	o0NivyghuCTzikLnq3B5ZNUJoTjJoaUrT+Vrf0QVjDHjz5eXFJEfldnASWgGNCWErcTaMSasJdk
	wvtUXfo6K5BIdkVJANq8raZS7GTRnRZ64NL0i1lkBX+KxO6DI9ZvrNHUm2PB8VVBF65XzN3koqU
	KClOv5Xk87WbN11vzrY+uRMPtxEC3WCno4Bv87bQNUoiukJewuqnxNxjYnthQcB+yM5iDU3ZZZL
	0Lj0xE/pAKyjzr3jQIwTMjIuNbKNYhgM4WlfbfiOliF23EBQcM114joLLQhmtHaNXovt9NNEhnv
	OCTGUG2MEtm4SIz0UNanPc9vj41N1lGRRd2g8o4J94gEWcq6578zT8Q39JatUMJWTcqrAMNKEiv
	tWwz4ABVOoRKt5S4bVNmbT4QwXoJKqhfxkscl6NAel+r7/QahfZ7BDwEzMzh5g6aomTD5pFg6wv
	Ie4g=
X-Received: by 2002:a05:600c:3113:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb8882a4b9mr261799725e9.35.1795448897758;
        Mon, 23 Nov 2026 07:48:17 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/amd: (More) use of U suffixes on integer constants
Date: Mon, 23 Nov 2026 15:48:15 +0000
Message-Id: <20261123154815.196410-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1795448898-77AD4A5B-E841F5B0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1059
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This was missed, but necessary to fix in order to

Fixes: 92ddcda17fb0 ("x86/cpu: Use U suffixes on integer constants")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

Found by an AI review looking over recent commits into staging.
---
 xen/arch/x86/cpu/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index ff9fc0689f3a..8fd0b675161e 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -39,7 +39,7 @@ static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
         "1: rdmsr\n\t"
         _ASM_EXTABLE(1b, %l[fault])
         : "=a" (*lo), "=d" (*hi)
-        : "c" (msr), "D" (0x9c5a203a)
+        : "c" (msr), "D" (0x9c5a203aU)
         :
         : fault );
 

base-commit: ada7fa3491668bbcf1afe525057c470903625d26
-- 
2.39.5


