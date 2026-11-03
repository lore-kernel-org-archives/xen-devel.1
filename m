Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D793606A33A
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=K1TV/iqX
Received: from list by lists.xenproject.org with outflank-mailman.1470116.1678867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSB-0006BF-0i; Tue, 03 Nov 2026 15:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470116.1678867; Tue, 03 Nov 2026 15:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSA-0006B7-RU; Tue, 03 Nov 2026 15:29:38 +0000
Received: by outflank-mailman (input) for mailman id 1470116;
 Tue, 03 Nov 2026 15:29:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOGSA-00065H-Ak
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:29:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOGS9-007igP-Nd
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:29:37 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fdd4-2eae-0a2a0a5409dd-0a2a4501856c-30
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:37 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fde1-5984-0a2a45010019-d155802ba98b-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:37 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so5261365e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:29:37 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm25430467f8f.45.2026.11.03.07.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 07:29:35 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793719777; x=1794324577; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wbHE2rBAxfkr80jQZ87SabR6WnxTq5XMFgXbtGAFDsI=;
        b=K1TV/iqX+aST+wPfXTm9zgmJ0B6zqTcB3Y7MqxtzPebxDUXfuG/qAPTMrkXwmxZrma
         g4XN9ugt6oWBvbjVm1HfgMpjZBJDnyJyimQzAPaU5yIPmzMZGeEt853qa5I7R5vK2TFV
         ISMUN4z0smZ7rEEbsBBLrd+8Bo9lGowOCcuS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719777; x=1794324577;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbHE2rBAxfkr80jQZ87SabR6WnxTq5XMFgXbtGAFDsI=;
        b=nGw5lhmHseHers65yiXqQkkclZzTPIJYlw9wdNyOMMyZxYhgvQMWIw19O+zvKpa7NT
         piKXevWgoDeYLXdKnBl/XGlgabdn2UXueu78+XkALXEA8gLTn4UweBqodXbjmbH1tnRf
         h20M5C5laQ/ZxQNANP5JSOpsDRyiPi5p9h6Lo0PUPWmbnUr5P46Gs5Bo8sdYArdCzt1V
         YIfuR24gq5JIXWnK/kRR6bmyqP2ycI0gyuYFzMs3oaBGRd4EOmVX6CX1TiWDS+MQ1u+t
         2bnbnw1gKJZVebSAS+oTsSglg0sNdIPUDuZQrg8OVi6klbX2zhKMlEdoScsApBmBJugb
         K0mA==
X-Gm-Message-State: APuU4Z9IauP5DZzRJcogzo0E8pzJ7Zg8pXFlvjf4jz4sNl1NCyoxJaRO
	NnHA7kZf5fnqYhYSrmTkbiQ1J+UiLo1wn1O5j/lTVF6HHKHYqqwKG4BElypRire5sBLxND8Uf5p
	qbHIQjWY=
X-Gm-Gg: AYBFou2kdPzNh4ttg84J6S0Ne/8TcWL67KSHzIkg2Up9qa+a2aiuZ08BL2dRYN1vsgh
	SJq+Yiw0DOPvEn9gsBM9mUs7pSHbgxvE/sbSZ6Wsnjd1QuRZE8kb75rCSARWVUoO0O2QrAod8du
	DDG6sONtU3ySu3Br1G4GyWPILDqD+xYZ+wTJLLi9yh+0FHniOJ5jc4+h4xGn87LUgH+kbvne090
	QyL4alXj/l4Z+ZBoSafEojyG8sj6ZtOUKh512SDuJJw8k1UqJpNiPD29EJceXpefINdIom+MrjM
	icCG2Lx2OtKQ3kQsah9XuoA9fq+ZQqbant49ifFnDYHL9ySWxyQCcQe8jdvBBDfVEzWDc6fOdB7
	50OpnQQx/oNs51Iddo2J/m9HdeoqH9Aq5TVD3GCCWQB3YvbFJkO/ugFQIKa/SFZNvspy6MHhmuE
	EHwhsHo4eqvMusHBKfsvU1Lvs3QNHWPhARWiJRgTaBTHcUGO4HyUEBzd35WCtQmEl1iUSR5nUy7
	m0Dy0ZSFmJfLYpYnu8rXi4jcsc5VWOTzEeOvUgKjp/IgdmgyiLefUZace+IAZuzalVIw7sgM1SV
	d+mcfBWyTJl4KNI9y0Aa7z/sU0o4ZqIchExIXk0EagaarlvMInJ0JuYPDiJarzUcsl3OW9EFaxs
	m+Wg=
X-Received: by 2002:a7b:c051:0:b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4aa8b0609cfmr314854055e9.16.1793719776504;
        Tue, 03 Nov 2026 07:29:36 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2/6] xen/gnttab: Disallow GNTTABOP_cache_flush from non-direct-mapped domains
Date: Tue,  3 Nov 2026 15:29:24 +0000
Message-Id: <20261103152928.2142176-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793719777-BD87F757-835B5CCA/10/78276251493
X-purgate-type: spam
X-purgate-size: 1334
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cache_flush() opereates on maddr_to_mfn(cflush->a.dev_bus_addr), which is an
address space layering violation.

Restrict the hypercall to direct-mapped domains.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

It also malfunctions when an SMMU is using non-identity mappings.

Linux never checks for errors, which hides all the ways in which this
hypercall is broken.
---
 xen/common/grant_table.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 2285c4aee8d6..d42bd5fb83fd 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3704,6 +3704,9 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) uop,
     unsigned int i;
     gnttab_cache_flush_t op;
 
+    if ( !is_domain_direct_mapped(current->domain) )
+        return -EOPNOTSUPP;
+
     for ( i = 0; i < count; i++ )
     {
         if ( i && hypercall_preempt_check() )
-- 
2.39.5


