Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EE7606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYjXUX4N
Received: from list by lists.xenproject.org with outflank-mailman.1485139.1688430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRO2x-00018i-RI; Thu, 12 Nov 2026 06:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485139.1688430; Thu, 12 Nov 2026 06:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRO2x-00018b-Oa; Thu, 12 Nov 2026 06:12:31 +0000
Received: by outflank-mailman (input) for mailman id 1485139;
 Thu, 12 Nov 2026 06:12:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ma.mandourr@gmail.com>) id 1xRO2x-00018V-4j
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 06:12:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRO2w-001pOt-AT
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 07:12:30 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af558b7-e002-0a2a0a5209dd-0a2a450aa91e-34
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:12:30 +0100
Received: from [209.85.215.169] (helo=mail-pg1-f169.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af558cc-f2d2-0a2a450a0019-d155d7a9ac2c-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:12:30 +0100
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-cdd9e925075so744386a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 22:12:29 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca.
 [142.58.10.48]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b197b603d9sm2954934a91.0.2026.11.11.22.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 22:12:27 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794463948; x=1795068748; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5afQLiTgJWy5Nu709rCxRO+hE+kTc58mWn7WFm3vHcI=;
        b=hYjXUX4NiA7GDRe5Pl+elh+8GWPuVeWr+xaRRum4j0v8JaCebdOgdA56BjT9H5nQl6
         F9bYSBd9EddRPqNPvRlj6s7i/CEy3p1Di4vAv0dRu5YiFiwGUVVi7i7hUitFwzfGEmrr
         ZraXf18dtuIlhJkdiHxdduMLmLhjOOpzOW7jdAVXhRouGGzKf//o8AKprDD3PrIUx2VR
         ZmHLHNOzmMXGb4vJdo77Anse6enTtN9pU4OF7G7CVDjvwDM8VC5y6qOipFYdwBZOHj1K
         eBhBySflltNSEWTlMCAQSoS1hNWJAFFpVz0TOATAp7hI0qSpN95tp3LrnC7wVxFAcPsG
         xw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794463948; x=1795068748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5afQLiTgJWy5Nu709rCxRO+hE+kTc58mWn7WFm3vHcI=;
        b=auxQ5J3EGnjJ4sw8c59q+sCf51mfAo+o3jtlvtYoFGNlgOi2u9y2lZhyBXg/sui56r
         LSgp8kD4BYqr1trjQN0PDS8pC2paoYjpgJ/8jhYangZGKAq3y26fcu2xGlYYczWpYX3p
         Uo4ZEEWYJBkCjGwz5AuyDZhNp2yo/KNLMvKZw8ARfVbQGpe7C/yjazRHOxwcGeyiarpG
         71Vo9tx63CJoQ2aY8VT4q8xFbPuDM00ReSXSiEzYLBJ+ro2AXZrPgDCiatcKTFHbwMcG
         saFGf9KTnCx52A5ZQxDUB5JnFbbipXrC60U6FSIzBSFHyxZ4mn0X3n/ggciavaSNPZeH
         3xFw==
X-Gm-Message-State: APuU4Z83uCjCliuImNYHebMosCtwALvqlcbtaiVs3jk9qSQF3eAAwzHH
	MMp0ReQDLt0zoXqmF6Iw8z0aYyjN0HLC4e7h9AjWlXAMd3GIoXWi1CtJSg04xw==
X-Gm-Gg: AYBFou3GEgWzEQ9O1Nmgt+5t/MBP7199zWDw758b7keUfO42cG6NPoUun1Nzc7DhoB1
	jgBCuNq2ZpVOi3mw/STbVhiX2z6GLuvX0UXlA+WsuCZdgtIuavaFcpzNLXCHjXRoWMsbYvCIG3i
	0LjTPH6naq25KQWkizP5Q/iXzYhRncsZ9ZxeEYo7czozIH84DexprfDgcUBahQf5s4owzIJFjfz
	bcoWndJgKbDI+vv1k2rBUj/BUPu0iG/zvdAYABjiHdd/KeO7KDgTdWurQjXzB8m+pZ5SJ2pZP7X
	axi7tGw6LxbQ775OyRrWyd1Fb1Kra40iv3SThC23qXVN3EwVXqPjRDgIYewLMHgNOmN3f8fsvMp
	74+i1FGrfBp1EPISI4yB0a3vRrek2v3ww9z/O84IHhRzHR02HzT2SwRcSkD6aOM/kx8dJzc744X
	cX45JzJSb+6+tUbIhP+mRyNJqd7k7WTVRMMQTOIuvV8zBD65zrPxlSU83nHYRbgPtjL7qHt3Bgb
	175vPFcx8QpPsYHVB7fbxdRqrMZxLheH2H+BmPOV6TfR7XO9kwLdjNzH+ATQaNLgXReSOgOo99j
	SMeT8/LwWtz+uVhf4CcQOfsiRdsJHPi0glJZWIIJdoZtb4V+wGXOs5nURZvGN023qyUAUTRopLk
	naiuHokYV2oPTKXLw0Qc5+630VsEFvocu045C1xpAKWfisufG24Umf+rCIDzdyiM+NhIMh8m5TF
	oPZLtKvydQ/g==
X-Received: by 2002:a17:90b:37c3:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3b182eac90amr4033116a91.23.1794463948062;
        Wed, 11 Nov 2026 22:12:28 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH] x86/nestedhvm: L2 reads its own CR0 and CR4 bits, not L1's shadow
Date: Wed, 11 Nov 2026 22:12:27 -0800
Message-Id: <20261112061227.1085503-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794463950-4AEDACFC-4B623862/0/0
X-purgate-type: clean
X-purgate-size: 1547
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At virtual VM entry load_shadow_guest_state() records L1's whole CR0 and
CR4 read shadows as what L2 reads. Once L2 changes a bit only L0 owns,
nvmx_set_cr_read_shadow() installs that record, so in the bits L0 masks
and L1 does not, L2's MOV from CR4 returns whatever L1 left in its read
shadow where L1's mask does not select it.

Fixes: ef17e127c411 ("Nested VMX: CR emulation fix up")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
Found using a VMX isolation fuzzer.

 xen/arch/x86/hvm/vmx/vvmx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 29e48387a1..71cc9dd373 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1089,8 +1089,12 @@ static void load_shadow_guest_state(struct vcpu *v)
     vvmcs_to_shadow_bulk(v, ARRAY_SIZE(vmcs_gstate_field),
                          vmcs_gstate_field);
 
-    nvcpu->guest_cr[0] = get_vvmcs(v, CR0_READ_SHADOW);
-    nvcpu->guest_cr[4] = get_vvmcs(v, CR4_READ_SHADOW);
+    nvcpu->guest_cr[0] =
+        (get_vvmcs(v, GUEST_CR0) & ~get_vvmcs(v, CR0_GUEST_HOST_MASK)) |
+        (get_vvmcs(v, CR0_READ_SHADOW) & get_vvmcs(v, CR0_GUEST_HOST_MASK));
+    nvcpu->guest_cr[4] =
+        (get_vvmcs(v, GUEST_CR4) & ~get_vvmcs(v, CR4_GUEST_HOST_MASK)) |
+        (get_vvmcs(v, CR4_READ_SHADOW) & get_vvmcs(v, CR4_GUEST_HOST_MASK));
 
     rc = hvm_set_cr4(get_vvmcs(v, GUEST_CR4), true);
     if ( rc == X86EMUL_EXCEPTION )
-- 
2.25.1


