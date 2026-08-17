Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621F1C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 17:24:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393180.1632053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww13z-00055t-TW; Mon, 17 Aug 2026 17:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393180.1632053; Mon, 17 Aug 2026 17:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww13z-00055m-Qk; Mon, 17 Aug 2026 17:23:55 +0000
Received: by outflank-mailman (input) for mailman id 1393180;
 Mon, 17 Aug 2026 17:23:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1ww13y-00055f-OH
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 17:23:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww13x-00AqJI-Ij
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 19:23:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a834384-2eae-0a2a0a5409dd-0a2a4506c276-44
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:23:53 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a8343a9-195a-0a2a45060019-d155802da9d7-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:23:53 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so711395e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:23:53 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a7c55bsm5230075f8f.20.2026.08.17.10.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 10:23:52 -0700 (PDT)
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
        d=citrix.com; s=google; t=1786987433; x=1787592233; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zRlBNNI6Xa6oRSrW4KLRLLjMEyfQSDmzFTllxiPoCsQ=;
        b=nR7dRCjnOKsOuOXKQO5WyTLKp9Dnbx45DfpGrejKr1Ofr91rPMkK3QniPgiUhQUroV
         5elv9QzoON9ouwcBlXgBEaYn8ERK9q6hSmPdqgD3U1pSJCEW9Rr8zbdZ/ef8/kUVsBOR
         Fpj7/CxZMxqTdO2Wh53Wclmx9XjjtVRUJ4J+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786987433; x=1787592233;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRlBNNI6Xa6oRSrW4KLRLLjMEyfQSDmzFTllxiPoCsQ=;
        b=fd0wHOQfSyMvYiZ0b7uGIFSK564ArQQdC0WGbgQrJ12u8etl4fylqwwQj4w4zTo40P
         xKGa9GrbQumJR6EiJlz0iyWEX89HIYmD1vc30YQWlT296Ebu8+sYI8qS5rGeqY5C7voI
         ohmMaTJlIwBcbwbGJDWjcFTazuGaCo5TyNtnIJkh5LB4R2jCus2KfO4glF2jpoWIJ8yG
         2ooF3x7IqF+zAoJIw0zGOoQ3GPUaOMC4wglxNs7nuzV1IXiWrBHaKnlcXFVh+POXJFZN
         5+u/3GGiLtkp5ZzUbdh9DMZBX8Xk+v4//BrdO5g3MQijzlQL3frYysG0iaDHOEjU0mXy
         Pgpw==
X-Gm-Message-State: AOJu0YwmRkDbZXL5apXea5DfmPCSttyWjR2d2w2MQLeuO73uKL+mO4U/
	JUi9cYHnhl8ttNLLGnwydbpzwKmaznEQF7gjTr5dNmMZ39kAZidJqEDC8Oaiv5+WBMwC5wkDtmH
	UvxYRacg=
X-Gm-Gg: AR+sD12dpnSGkXNGPNjEL9L9uGu+u3pX1N0VS2fVJ6Vie4T4t1v7/psQXs3kFLjpel0
	ybjSGALgmwe31eH+GuL96RtTins7PezA1TS9QLfB4qhL+xq0xQELydN43rSjLB6vXkC/bHWK/P6
	NxUFMKx3rLu37w89btQ1jcssXLXZWbdBuAwqRjT6+pk2cUBHHS0uutnQ5EMwLw+UNfB+RsvhZx6
	STYfhOIMvmRNOYKOLBXfhMwSgvj93flf8Wvye8wbfAtVRCQWHx0CYNWrshhakoo7JzskXlYnQaW
	zFKEJ6Y7wl//pXgKxgmyx0+wLKvHGCnFq9SQutV6I6/Uz9x/A7lk9seszWsW4K45rgXT/QgGEf3
	PltQgYOaMxsTRcoQSPnnU6ERr/+4K2mRG8iqoxY6Xj0Dn01I1g38o3IwuKzogRoQlbdXHbmPcdy
	6mZvG1hETnDWT7FNbLYB6ZpX3PyJPk22cXpRFSurkCoTrwBYCTiyyUDV4ugPnc9I/0b46mULJSC
	uUuvKDjkXkAMCJjFp0Wf6ehuVZSbq9DsLtGPgMjNm76v7dhnII=
X-Received: by 2002:a05:600c:34c7:b0:499:8afd:4a9f with SMTP id 5b1f17b1804b1-499a05ac869mr18044615e9.0.1786987432740;
        Mon, 17 Aug 2026 10:23:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 6/5] x86/nmi: Support watchdogs on Intel Fam18/19 CPUs
Date: Mon, 17 Aug 2026 18:23:48 +0100
Message-Id: <20260817172348.1839547-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260805124525.105457-6-andrew.cooper3@citrix.com>
References: <20260805124525.105457-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1786987433-FC20077B-DC0A1FA2/0/0
X-purgate-type: clean
X-purgate-size: 1355

It is the Pentium 4 (Fam15) which is the odd-one-out.  The counter indicies
used in the P6 went on to be declared architectural, and Fam18/19 continue
using the architectural indices.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

This wants backporting to 4.21.  So does "Check MSR_MISC_ENABLE for all Intel
platforms" on which it texturally depends.
---
 xen/arch/x86/nmi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index b3d18270b13a..0a03ef68b586 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -329,17 +329,12 @@ void setup_apic_nmi_watchdog(void)
             break;
         }
 
-        switch ( boot_cpu_data.family )
-        {
-        case 6:
+        if ( boot_cpu_data.family == 15 )
+            setup_p4_watchdog(misc);
+        else
             setup_p6_watchdog((boot_cpu_data.model < 14)
                               ? P6_EVENT_CPU_CLOCKS_NOT_HALTED
                               : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
-            break;
-        case 15:
-            setup_p4_watchdog(misc);
-            break;
-        }
         break;
     }
 
-- 
2.39.5


