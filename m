Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4C5606A31D
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=ejB4Dk+v
Received: from list by lists.xenproject.org with outflank-mailman.1463144.1674110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM24D-0006he-LA; Wed, 28 Oct 2026 11:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463144.1674110; Wed, 28 Oct 2026 11:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM24D-0006hX-IU; Wed, 28 Oct 2026 11:43:41 +0000
Received: by outflank-mailman (input) for mailman id 1463144;
 Wed, 28 Oct 2026 11:43:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM24C-0006hQ-Tv
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:43:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM24B-00CLJ0-UP
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:43:39 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae1dfe3-2eae-0a2a0a5409dd-0a2a4503e13c-16
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:43:39 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae1dfe6-fae8-0a2a45030019-d155dd2edc7a-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:43:34 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so707207f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 04:43:34 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece14a1sm29167895f8f.57.2026.10.28.04.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 04:43:33 -0700 (PDT)
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
        d=citrix.com; s=google; t=1793187814; x=1793792614; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0cBDTacXy9XImVG64ba+CUZaXBj6xD9seAYFIeyLpo=;
        b=ejB4Dk+vKn1oeCtnBNNgzrq3vuvSxYjrPFYoAiGBNaL7c8hnVBFaMlsBk7rdapgLsG
         Pde+H6LmpOVUtVoquheYS9jXL5fzik8UZHf5irvrCYzvxU3WUVqIACWF85xRhmZh+X76
         FcgnL2PSd2SD/56a/Jn3g8madGPybPydNPB+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187814; x=1793792614;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0cBDTacXy9XImVG64ba+CUZaXBj6xD9seAYFIeyLpo=;
        b=26QaQMT0+GauOR5gFnkGYaVh+8LXJ4a5u/nHAV/S09rBxzWByd4dPar5h1PG/RF5uH
         WaqT3JjrbsVLqi+IBCO1gVXXI1IRbWpK2qmv78FfG7v+34uTVtgi7PhyoVfZM47AjV+V
         yx++fW7TRe06dq9f3OZdPG6KzFpcane1gkaWrbMN8USf+3QgL5jvEDP8fZEjd2wk4BY3
         rExcZNlRHL6kQRRKIlhQDfzZqi8XmaJrxGloslUNF9L/IHvB+bQhmXbTBFbcj7T8zSq5
         a3dEn3oNhSDY/Mq2ID5jLofHP0qBBVRr2mfmjCh6a0IztFuNyaLgVqDHsSRFHSvA+zC0
         wcIA==
X-Gm-Message-State: AFq9FYJ0DW/4ug2s03sY8Yn10K1j1pvO+zdesYQCc7mjt6mn2ARSir9S
	axsQsZN66os5D0UhZmqOhTSZwBr9VDF/L8i63StTohoA91qXSW0E3Dh3vd4EwORuTu163x/zspB
	1nXSGiz8=
X-Gm-Gg: AYBFou3LB05oDe+0oL2ia7iimquilozcNhNJfEW/nx+A/p23qMWoT7IRRlDow1dz9o8
	FNFI1+49jqDcfuFhwnO+gQEYEzXjjZkVlGPPSomhKicK5aqQsK1Xh91HPEvZr0e2xPkxCOo5nGR
	enz4YHhR9+y/CVnxVz4PMoELQSH0P5i/eDRDSEELMucW90c0HWFxl8iTJtrJ0FyqwGfx8y3v/7V
	/+K+xRhswV0trhkO/aPjVZEpAIFJW1Ne24aWj5SThjh94nM02FLlH9TZ+ZM9MKTFPzNZ2B57lFU
	/UC/W0v6lWU6xVvKDSlsh8A6FdEKy3Eh0m2zCnMDm5hETP0/ppOsNH8qlJ5LBUIRE/TJb5DMkug
	eOssJPJ/mylfnXC9jNvRBimnHbGcIYUaNuQFKFnn/7TB8CQcHDtW3wUmxLF00chBj3WdfpTs7VH
	QDXmafncGDEscVvZJV/h3a/tvHpAz02FRU5gDgRzQVEGLaqh/VhCNTvropYT9Meq4zWe1lxR0HA
	5Ni/5BCAoaaH0lPkoiFp9WdpYooJ0X6cdjqbhIXqFvrf+dr6sYQO114ue9XOypgWHN0n6zALjOd
	HIQiWofhMDzh+gHsZNSYQB23aB9LAYmmlvznLBFu+9FZdDdV3Ue3O00MyzkMY3MrHDXN4VNPcb5
	UKNQo
X-Received: by 2002:a05:6000:438a:b0:48e:5d63:a4e5 with SMTP id ffacd0b85a97d-48e5d63a673mr4173784f8f.0.1793187814025;
        Wed, 28 Oct 2026 04:43:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/bitops: Remove unused get_bitmask_order()
Date: Wed, 28 Oct 2026 11:43:28 +0000
Message-Id: <20261028114328.1514337-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793187819-76CF84E9-46B0358C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1157
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a wrapper around fls() with an incorrect comment about the output
range of the function.  It's also unused, so remove it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xen/bitops.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 24882fb4822d..214613f4b41c 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -389,14 +389,6 @@ extern unsigned long find_first_zero_bit(const unsigned long *addr,
                                          unsigned long size);
 #endif
 
-static inline int get_bitmask_order(unsigned int count)
-{
-    int order;
-    
-    order = fls(count);
-    return order;   /* We could be slightly more clever with -1 here... */
-}
-
 static inline int get_count_order(unsigned int count)
 {
     int order;
-- 
2.39.5


