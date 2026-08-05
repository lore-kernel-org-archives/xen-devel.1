Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A636C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:45:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383391.1626679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb00-0004qg-LR; Wed, 05 Aug 2026 12:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383391.1626679; Wed, 05 Aug 2026 12:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb00-0004qZ-Ig; Wed, 05 Aug 2026 12:45:32 +0000
Received: by outflank-mailman (input) for mailman id 1383391;
 Wed, 05 Aug 2026 12:45:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wrazz-0004gP-5w
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:45:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrazy-007AOn-In
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:45:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a73305a-bab6-0a2a0a5309dd-0a2a4508d3fa-28
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:30 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a73306a-f659-0a2a45080019-d155dd32a5e5-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:30 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47de008b020so573348f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:45:30 -0700 (PDT)
Received: from andrew-laptop.. ([157.231.70.114])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23e533sm8779762f8f.28.2026.08.05.05.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 05:45:28 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785933930; x=1786538730; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v6YeRlTNauFBLjWJsxycUzL7eVgOm6WLxLhWDN+HbJU=;
        b=udEnqSmqzEKqr30c4WmlY74xN4zW4hVH132pJbsRK5cQxSgnZQ3id160fqebHx0u47
         Q3aUIK2M/9K7BIAq0WaqexGzvJIndbZmgT4r950aqI6LPVXsjnQpBYv6gfmbR/WUuBoi
         U9wDyGy8aZwl0H5cHFYCFWkjHEGXGeGkRBAXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785933930; x=1786538730;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6YeRlTNauFBLjWJsxycUzL7eVgOm6WLxLhWDN+HbJU=;
        b=Y4LDSHYLhIxfj/E9MIV1aWqmKaMbL08f21Ay/TrYhC/cMVfYkxc0xMRqQn+k3t6vt2
         5ounHtrVloUKoVIipdkpXwD52hbNYGu8XlKfjtaBZ4/rWNMAKpgwFmf6i8/6rQyXATxU
         fTuAD6BaI2SWLW5Ea6dXOhkIGqq2IqKDjImBPel3xzGvZJy8kFJd/IJ8od03rrdH3Tbq
         5KXU5yRXnmo/xnww080+2OO2SCkKWy6fQWKIL/Ra4We52UcW/y55eaVIiSqO81NQmd5V
         LCWxnXxA6Zp7qaJQjMUdVU8QqNQkF6+OBTrwIDxMS/Lo8EcxynZyjqR//j9I+4J5pY62
         3v9Q==
X-Gm-Message-State: AOJu0YwU+WyBslh4iuS2yFY1uyk+EO4ujKVGFvEfuFMBFYHbbisAsdtt
	eeE4ytLnx/1C4RwODLahD1Pl4E9WADQrXYzYVR1eTkNX/c2tZxFiPuaz9dG2O/631HPAZMUzXia
	rg4NZ
X-Gm-Gg: AR+sD10nAmiW4lY6lAbh5+HMlc3NmmardfZISMYoMAwSTx5K4XCw2QwGtkbdu07x5pO
	BvLawlNIt8sLBWc4iGsv2ErOhQ4bmScIp33gwS1pQtjbpaH8vFRgnlwS6VPJZ4k8HoxsPSA5j43
	+8tGEyXDWlaIjnRRr8VP68a6PmJZOpGrAgW+BcgupnjehLH0tXdZx3aHxjyHiC5XdN/BdeIw4XY
	SAcCYYcZ9eXybsXhu6Dq4iHy8Jo9cLYWS90GR1GG+HiDyX6gLCj27/4bpgRztNEoPBBq5mtt1By
	03NJ0B5nB0IKe/amiLZZDUmQ/IHxS3QuEhxtqUQ7Cletsqy7uLbc6/aLjlj9Jqpo1rPHekGT4CE
	QMd//Y5fJORqemRv2j6RKRwbj6eN3kScjOJqRKnYAsLV7v+vM5+fhHzJPRm+aHu1YfmmOqSQD9T
	5vnU/trDav2pySsEBU76UfjCXvOAPgzRgf35rHEbx8DYLAMxp6IMsNUA211R7bLGIZ9DOedTeZ
X-Received: by 2002:a05:6000:250b:b0:47f:7fe0:a287 with SMTP id ffacd0b85a97d-47fec4e739dmr11551387f8f.2.1785933929270;
        Wed, 05 Aug 2026 05:45:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2/5] x86/nmi: Drop K7_NMI_EVENT
Date: Wed,  5 Aug 2026 13:45:22 +0100
Message-Id: <20260805124525.105457-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260805124525.105457-1-andrew.cooper3@citrix.com>
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785933930-CC77387B-DFBF17D8/0/0
X-purgate-type: clean
X-purgate-size: 1393

This name is misleading.

It's not possible to configure NMI or not from the event select register; that
comes from the APIC configuration for performance events.

This name is "the thing we want to count for the NMI watchdog", but that's
clearer to follow when it simply names the event.  Drop the indirection.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/nmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 616bfdbc9029..113e672c4f15 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -102,7 +102,6 @@ static int nmi_active;
 #define K7_EVNTSEL_OS		(1 << 17)
 #define K7_EVNTSEL_USR		(1 << 16)
 #define K7_EVENT_CYCLES_PROCESSOR_IS_RUNNING	0x76
-#define K7_NMI_EVENT		K7_EVENT_CYCLES_PROCESSOR_IS_RUNNING
 #define K7_EVENT_WIDTH          32
 
 #define P6_EVNTSEL0_ENABLE	(1 << 22)
@@ -259,7 +258,7 @@ static void setup_k7_watchdog(void)
     evntsel = K7_EVNTSEL_INT
         | K7_EVNTSEL_OS
         | K7_EVNTSEL_USR
-        | K7_NMI_EVENT;
+        | K7_EVENT_CYCLES_PROCESSOR_IS_RUNNING;
 
     wrmsrns(MSR_K7_EVNTSEL0, evntsel);
     write_watchdog_counter("K7_PERFCTR0");
-- 
2.34.1


