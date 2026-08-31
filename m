Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECAFC61DE2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 09:56:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403892.1637842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0ykp-00016s-Tp; Mon, 31 Aug 2026 09:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403892.1637842; Mon, 31 Aug 2026 09:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0ykp-00016l-RD; Mon, 31 Aug 2026 09:56:39 +0000
Received: by outflank-mailman (input) for mailman id 1403892;
 Mon, 31 Aug 2026 09:56:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x0yko-00016f-Kw
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 09:56:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0ykn-00D95L-MH
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 11:56:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a954fc0-8faa-0a2a0a5109dd-0a2a4509b7bc-48
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:56:37 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a954fd5-be1a-0a2a45090019-d155dd32f03e-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:56:37 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-482fc2b44a7so2725194f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 02:56:37 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f16sm24073137f8f.1.2026.08.31.02.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 02:56:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788170197; x=1788774997; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ELtqgP7ZNftqP2ekav0bCa49aPYTtF6QVeOSuARgtg=;
        b=nIzF47K/XqmHa6yUTHYwjuyepG3akQ/bLj/aN8Wl7i36GzvJQirk9GCwIYOqg9OvDJ
         +TQOLRhQpzLL/AVDqb/4rwK0IXoPN2+cZqzS9ye98fY9aGdcR5GtmGXakr2jp2JnRcaa
         8jempBJCYZE6slXB0gZ9SVaZC02SXjtx8HqIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170197; x=1788774997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ELtqgP7ZNftqP2ekav0bCa49aPYTtF6QVeOSuARgtg=;
        b=jaw5fEdpPyuwVma8bP9FyEg06vZpju8EY6Oc6DojGeFnvmsTFRPO300AF5CvSQQ/aI
         u6GuGC7kCpd9Y7eLS5j1MSdkyN8jKzfEOMIgEqEQf3os/QGy8QLN9x0tZpka08zYNrp6
         mtK1QAnoto73e0/HcUiTdKlN+YHGkt7GgzLcMLSOEUSraIyMzsxlqC7+MhKCjV1PKI6f
         scpE9z9j3r3svbssZF85R0cu+oSpYKuBZfLFmqfzDHZpd8yWExGfbGWlblJQJl0ibcbg
         UUpIVk/IzYS3Bt4uzwOdNf3QpfVL7QzP/DwKimimTwMbqu5eEyksaPla+lvZ4ngVoA9u
         ehKw==
X-Gm-Message-State: AFuF++lHTvQ5Pei83CbAta1wn7YU5cuWRAbjyjMSAD3tm695uABcwbya
	FJMEPfK2IJiDk2MlEFlXvMvU67Q6KHv22k5etLPjoLsE3FZk6eSAa8OVhn2zSuZ3BPsw0a2a7cq
	f5cs9
X-Gm-Gg: AYBFou3DXFA8rXV0zxux76vU6wdtTKNm/XfPwUnx/CFcYrwcoIWkMECOop2dVjrDPIq
	gflsdBo0/jAPEkgTy04lBnjEP8YMW3lkMY26EaAVF9WzATZFmAoSqOtiPhMSIp1mh5hv+KA9uh4
	3p/65d5h4OU9+t+e7cnqvYmG0z2/Lj+WJ7xQvpeDdQVlun11SKHVjjpSL/s8wsqzklSAvLVAajW
	w5mRNaqP/cceN3C+DFakL7mWw0diJiC8d2QqWh/NvEkiOAUFCOAoeTF4USQ3B/yJhqwms3AJiYX
	YSwcNJvoFfxxTMf3Rev1Liy9gAoMuMqhuzThxhePe8mm1gUmZpx7J7Mv7ehwHdnAyJkFFegZu9C
	mjHk6i8N1rE7V0VXTsIXxXW1alAAmzavP5lp148gRb8Pl6EAxlFDvV6mBOoJWpft/mEOVS5Pb+T
	nv0mWVSPnLjHMx+6gkYIjKMvtKnZy13KsQfiyTkFXh70q/rn4r3jGs/CSgTn7jMjddMEd8LPpHM
	jAFpguS0LT0OICx46u60JypJevJW58Bri8fRL4=
X-Received: by 2002:a05:6000:25f2:b0:484:3fcf:2f9a with SMTP id ffacd0b85a97d-4843fcf2fb3mr1314504f8f.9.1788170196499;
        Mon, 31 Aug 2026 02:56:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] xen/arm: Don't pad between function with x86 nops
Date: Mon, 31 Aug 2026 10:56:33 +0100
Message-Id: <20260831095633.2834187-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1788170197-BE4DB034-09C6C2C9/0/0
X-purgate-type: clean
X-purgate-size: 1146

This was copy&paste from x86.  It causes the padding between functions to be:

  a000026dd64:   90909090        adrp    x16, 9ff2147d000 <start-0xded83000>

rather than:

  a000026dd64:   00000000        udf     #0

No functional change.

Fixes: 5da0d3123c0a ("arm: entry.S and head.S")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

Has no-one looked at disassembly and wondered why there are junk instructions
between functions?
---
 xen/arch/arm/xen.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 2d5f1c516d03..d4d959403307 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -47,7 +47,7 @@ SECTIONS
 
        *(.gnu.warning)
        _etext = .;             /* End of text section */
-  } :text = 0x9090
+  } :text
 
   . = ALIGN(PAGE_SIZE);
   .rodata : {
-- 
2.39.5


