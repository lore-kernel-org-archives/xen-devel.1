Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE1710AB80A
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2026 19:04:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1264708.1556115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5q0X-0003SI-KF; Thu, 26 Mar 2026 19:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264708.1556115; Thu, 26 Mar 2026 19:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5q0X-0003Rh-Dy; Thu, 26 Mar 2026 19:04:41 +0000
Received: by outflank-mailman (input) for mailman id 1264708;
 Thu, 26 Mar 2026 19:04:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w5q0V-0003AO-T8
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 19:04:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5q0V-00EqAi-99
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 20:04:39 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c58338-5cb7-0a2a0a5109dd-0a2a4506ea40-14
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:04:39 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c58347-3034-0a2a45060019-d1558031cc84-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:04:39 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso14778785e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:04:39 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48725eb1ca0sm2176755e9.6.2026.03.26.12.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 12:04:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1774551878; x=1775156678; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EH0X5qsNryn7DMb7Z59PuUpS3Gk/+G4mt63iwdGVrdE=;
        b=wQYqUVpbZpB+EYWhk0q7238vJB2C8to3u0K+iQuw1HlEtfdSAJBr2pSrrBAlrJE7/C
         WslUv6nJSF+8L7+d2HIRSjakPQIYNnvi4atvwIHeNj3GWIfopCB/GaIvScqyFDxZmg9B
         tSyUrquVjoRzGhtYv516Z7+lMlVoOCZP/8Q5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551878; x=1775156678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EH0X5qsNryn7DMb7Z59PuUpS3Gk/+G4mt63iwdGVrdE=;
        b=BpOzWA7TGsIjMmeC3+r6gnzSc+/cg96AC1JpuSNrqVZtjHR9FV5agrQjyL5tCY04rH
         o2VexgyqrPp+iOspCHtOzIa7dHwV2eo2ST9Rif6pabTi11yGFkkgpcUzCJOIN28vLkpq
         j15KRiqeE3hXDE5gCKzxs8RrjSYLuE/vuU0/S+QRK4cdnOBrmBqkWUupwgyNmxeqpST3
         b5aqyYhkmUiWgMW8GilCYeb6TI2EXor2sdVBPI3BRLYBM+x6+PspzTHCCcN2ZTKFv0Uh
         ZYUARhDvWD8cTla7/yhh/dnKD/hrQR1uFKR2o3kpLWV2v2T7Rk+Pd/nNizblnsD7xDUM
         pwFw==
X-Gm-Message-State: AOJu0Yz34d/vZvc2UfGBGUO5GABwtTqknARB82UnLsEjBR+QYQQOcLsG
	U7why/HyK7p9GJIFEHiUJknyHqxrTshMHIko5W0diwVkmLmIKLFjROzXwIfYZ+dsMZIoXbO6+xS
	Hvdru
X-Gm-Gg: ATEYQzzSXpbHZRta8IkedYm+oDexm4Cv9jwyveX+iLpyZl8S95o1rJV2H+qBhgapMes
	OCyeVHFCFHt3/NWySxKZLWo7i62jwRoA7ijE95oQgyyQV9/IjO14TKgafXDEdBEXtcO1hzvcjeY
	69k/sVqXFcwXBNkVWd/i7N4PN1RF4pYQjxVDNyFGddTOl1iKlP3xBgRS9Ojm8/lBlED5oPLncfP
	qo+hon9C0bsedLrJKzDTVa86PbDiojpz1DZ6AMcvSBlmFU7I1uHO+NE775XVVHa7pj/AXR/BrHo
	HTIag2r3KXsngo8T7ArBPDA3ENjOn6bxiEZVat0L3GOawg2wQijwjkE4Ta5Q38aVRHhWNGZ/oFg
	TTlHp2Y41Exlx1HgiTjzD0lwIX1CJ5rQWahn3BsQ8Fum4Ck4Q1tTiWVYIs7YrlsH3tE9EPBorTN
	5vQVq3Q0myUHz/M8zSeu5hrb0wMhkw4hrrBzzO/TzZfkyj+fDkOMS7sf2sKoz/+IiQ1P7KUyThF
	fyO
X-Received: by 2002:a05:600c:524e:b0:486:d76c:fa51 with SMTP id 5b1f17b1804b1-48716071a07mr140127405e9.27.1774551877889;
        Thu, 26 Mar 2026 12:04:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/2] x86/fpu: Initialise FTW as well as FCW in xstate_alloc_save_area()
Date: Thu, 26 Mar 2026 19:04:29 +0000
Message-Id: <20260326190429.1156367-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260326190429.1156367-1-andrew.cooper3@citrix.com>
References: <20260326190429.1156367-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1774551879-8198F1C2-CD0F8D85/0/0
X-purgate-type: clean
X-purgate-size: 1415

xstate_alloc_save_area() configures FCW and MXCSR to #RESET values but misses
FTW.  Fixing this means that the backing memory always has an architecturally
correct value.

Adjust the comment to state that it's the #RESET values which we care about.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

I don't understand what the rest of the comment is trying to say, so have left
it alone.  There's still a lot of cleanup to be done to merge i387 and xstate.
---
 xen/arch/x86/xstate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index e990abc9d18c..747df0b2e9a9 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -550,11 +550,12 @@ int xstate_alloc_save_area(struct vcpu *v)
         return -ENOMEM;
 
     /*
-     * Set the memory image to default values, but don't force the context
+     * Set the memory image to #RESET values, but don't force the context
      * to be loaded from memory (i.e. keep save_area->xsave_hdr.xstate_bv
      * clear).
      */
     save_area->fpu_sse.fcw = FCW_DEFAULT;
+    save_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
     save_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
 
     v->arch.xsave_area = save_area;
-- 
2.39.5


