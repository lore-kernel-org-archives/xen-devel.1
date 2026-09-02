Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99242C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:43:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405697.1639162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNb-0006ZM-Av; Wed, 02 Sep 2026 11:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405697.1639162; Wed, 02 Sep 2026 11:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNb-0006Yj-5q; Wed, 02 Sep 2026 11:43:47 +0000
Received: by outflank-mailman (input) for mailman id 1405697;
 Wed, 02 Sep 2026 11:43:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x1jNZ-00069P-T4
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:43:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jNY-009O8V-TU
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:43:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980bec-e002-0a2a0a5209dd-0a2a450ad538-22
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:44 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980bf0-f2d2-0a2a450a0019-d155802cac44-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:44 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-495590dde14so9372785e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 04:43:44 -0700 (PDT)
Received: from andrew-laptop.. ([185.110.61.35])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46422desm61190055e9.1.2026.09.02.04.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 04:43:42 -0700 (PDT)
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
        bh=9GFfQbIk/OgSpRvploWqTdOJSAjJQBjidS2m4ZMLgpE=;
        b=FUbQZ9kVMeSRf9hz+iOjy1HIp4jJks83SWl79NsJk4SGofm7fwaZUhRsaNqaeHG+SR
         MAIXJ/+AfrJWqfk7DWxzrG8w0D/gs6+QlgCk5d1DIZuFZGJLvdjvyiNU1YLlGWQ/EbGq
         94p+LgkxqFd8CfU4Q462KRo4pCfhcUV21ai1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349424; x=1788954224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GFfQbIk/OgSpRvploWqTdOJSAjJQBjidS2m4ZMLgpE=;
        b=lZ469Awtf+6/XSwSTodoT/qbSQXMAP937OoRCa+NCFCHMSLiPtlfnK7PMwMuZJUJVk
         4dyLaGur5zqAFGvKBXOwn1gVw4y6WjUGqBD/oC5MzqMzLTuJEORrBZZ9Xkihp6hoA8Zn
         2k2LsL+sgBGMwYK24CZS/2dNpIJsffm8Sf0vuEM8j58N2fdzGHAcgdO2ZrBUl6cmClVt
         jwD4HhN21SAmz+8sd6WEr3NpGOgRN0ivHvZq0aYGGlV26AXUmaPa0W8QBYwaFzd+8kJN
         zqYg4lHjxKItA8NqghGLuBjzuH/rkyy9cTKvKXj/rHMhhyU/Mo5x+5hLajgtVBOHTJH1
         DDvw==
X-Gm-Message-State: AFuF++nvf3VP2XDxEKBejk5dss+zhatSPdfJ69/2rcu7HkkGmDjUHAYg
	9H0KgLaPKKXpRAoEpv2bvrAoHtiweepSuHERc7D322FrV8UwAbWrzOgFSZ5/uMczsnPDMU1mL2c
	7b7bFnMQ=
X-Gm-Gg: AR+sD12hg5C8ZL343OUXEKwqSJZ/sT5wAXUARud889puV9hJZw3Ffvc/HBWhX8r/Jqx
	MKB6yBdIQPbNZH+aCy0n722kYRKpcMdFublgHyuIFF37Ya4rZFAAkIDMZ6pRRn6G4UntogRzt30
	UOuIKNnXtNFQZyUM51HzDIx4jvlSv6LAIPjUngamrOyEdBnBpFmMFNza/5R/Zd7/E5xOZpOQtlD
	Cw5HB+v0dv6txId6f4DcIXUGvteH3xSRtaCr5fwxpVFsU35fG09EC4DGRV1IGurMkY5eUGuKOUT
	LIAf0qX6GQrJRk1gLrO8dWhHLNSpJwV9qCyuQnVivBkbzn9bF4HbB653+rlZdCbafJfWftzptxu
	AIEH6ACjf/dhBH23XUReRb6RRkfr70urJGGAZV4ZPBcsTBqdmgRBC1Pf3dyJrvZ0OW9Vqc/a62z
	atI9k7TzPDIfJdTcjw6NYIhh9Zc0/qIWl+VYaL/VyWDT6TqZF2qgthboQLiqdRTeXE4KkQ+8OHl
	YvWMLLyAw==
X-Received: by 2002:a05:600c:524f:b0:49b:8c63:dfdf with SMTP id 5b1f17b1804b1-49ce584c87bmr71173625e9.15.1788349422844;
        Wed, 02 Sep 2026 04:43:42 -0700 (PDT)
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
Subject: [PATCH 1/4] arm/bitops: Drop unused ADDR macros
Date: Wed,  2 Sep 2026 12:43:36 +0100
Message-Id: <20260902114339.62043-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902114339.62043-1-andrew.cooper3@citrix.com>
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788349424-518C5CFC-7727E496/0/0
X-purgate-type: clean
X-purgate-size: 1086

These are unused and do not want new users to appear.

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
 xen/arch/arm/include/asm/bitops.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 60686a3a5503..52131892b1f1 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -22,9 +22,6 @@
 #define __set_bit(n,p)            set_bit(n,p)
 #define __clear_bit(n,p)          clear_bit(n,p)
 
-#define ADDR (*(volatile int *) addr)
-#define CONST_ADDR (*(const volatile int *) addr)
-
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/bitops.h>
 #elif defined(CONFIG_ARM_64)
-- 
2.34.1


