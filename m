Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D04C5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 09:18:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396173.1634196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwyu9-0006dD-BF; Thu, 20 Aug 2026 09:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396173.1634196; Thu, 20 Aug 2026 09:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwyu9-0006d6-7u; Thu, 20 Aug 2026 09:17:45 +0000
Received: by outflank-mailman (input) for mailman id 1396173;
 Thu, 20 Aug 2026 09:17:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wwyu8-0006d0-2q
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 09:17:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwyu7-008EE4-Di
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 11:17:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a86c626-2eae-0a2a0a5409dd-0a2a45058ce8-38
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 11:17:43 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a86c637-4cb1-0a2a45050019-d155dd2bc52e-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 11:17:43 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so1292091f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 02:17:43 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482bab42f8esm3871268f8f.28.2026.08.20.02.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 02:17:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1787217463; x=1787822263; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YRikbpNQey1+eawRM8lhO+RG+oxgMmFcY/uhY7bB1k=;
        b=myfvyBRzE3W13nB9dVT9/1kkyxgF3c6FqUFgUjXX+hA7OB7e/5G9ETQixStPj3Xy23
         ll8YhAeVGbixE9X8/oK1nVxMjS6Ol6EGA7fhMeNqTK7JXCAzO+GETPRkKGUMjOWY6KAX
         OuWDE+0BFGLbillNi2EcCYzQnQETH2R/w9M3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217463; x=1787822263;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YRikbpNQey1+eawRM8lhO+RG+oxgMmFcY/uhY7bB1k=;
        b=ZRD9KKdisHdfGd2rD0QHEsb/4KqLuVTd+MqhrKFVbGvwU0sIvJvAztb1TLzFtfTphT
         GV5u7EwWSwLZQeZcfDD+wzdqijrPwCI6pOFfFcUfaq9jX6LieiABH7qARAXSWfjwjvE2
         7PvqHlC78StqP4nSX+y7slrbPwp/MmtbsxwrTkHkyUaeD0tEVcHOXC2KMcAd/yNLHUbc
         Y6/DSIkZGp383IOJEW41+E2vSB+gsTA/o9+QWMC5B4n+jhd/Q0AI0b9YQN1QZrNPJlM4
         3Hkrqpg0CtIaoAmOaQBfhcXozZdg68mPlCxrMxY1uvEEOjnDIYYVKA5G5X6G8rzwkpGi
         KHVQ==
X-Gm-Message-State: AFuF++lBGxCtjJR//iR5Pa/f+Db7MFYtfPSaGESJFQj6ndax9WRW+hX+
	F/SRKy6668DxGT4F/aa8QPaoqe/GASoluvZXtRppCaQLSFT88lO4hTazIMQ7n1VnrY7wvAZblBE
	U/i31zNU=
X-Gm-Gg: AR+sD10YaLN8ujB3MCOZsGNBvD3W6n4Gc20m46F/jDTqDUWunTTvP8Ncnmrp0/Pkej4
	BsjH9vzKg1cGN8SI1TNar7BlMB1ERQvi4fCuxDsTG7idY6SOZUDwHWRrubr20oI23uePU7agiP0
	hcM6QM40d869vQfpbzr1gVhgLJq2ZRt83hthvjf1nq0tUiUiZhM0GqxJNDkvdWF2oIZq4MMhJC3
	Mr9aWpBWaEsKCLWhyp5VTqyxDi4pMJC0NV/fS56iqpusryvsHIS0DdDiwcnZi4t9ALl9eh2fM/n
	jkgxsgdxN195enDwZHSvDGSKaP1uxlEXbHjb1s2+4ue5hZcLTC/oDGI5l8ZLP7dt9XLk6IO54ZG
	3mXCDdoYYxdIyXz+ciqeRf9ilqlo08V5w0RxwzWmXkpfPHhwg5gX13+5cTO63/uVcAwWE7c+0wj
	VP7mk0GkjEit664XYu0YO8Cqrx9zOs8Q2tXpIXs1Ro/e62xW+/FoPVe214j79qJZxS2RRhZEzO6
	aJDnsATtft8+3/R+V1pE/OL2xGUyJgcn1mw0OU=
X-Received: by 2002:a05:6000:60c:b0:481:51ce:542f with SMTP id ffacd0b85a97d-482b1ff29cdmr21373896f8f.21.1787217462458;
        Thu, 20 Aug 2026 02:17:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/hvm: Use system descriptor type names in hvm_task_switch()
Date: Thu, 20 Aug 2026 10:17:40 +0100
Message-Id: <20260820091740.2006909-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787217463-243112A1-A28F2885/0/0
X-purgate-type: clean
X-purgate-size: 1195

... rather than magic numbers.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/hvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 955fc062a5c7..56bc2857389c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3066,7 +3066,8 @@ void hvm_task_switch(
     if ( tr.g )
         tr.limit = (tr.limit << 12) | 0xfffu;
 
-    if ( tr.type != ((taskswitch_reason == TSW_iret) ? 0xb : 0x9) )
+    if ( tr.type != (taskswitch_reason == TSW_iret
+                     ? SYS_DESC_tss_busy : SYS_DESC_tss_avail) )
     {
         hvm_inject_hw_exception(
             (taskswitch_reason == TSW_iret) ? X86_EXC_TS : X86_EXC_GP,
@@ -3192,7 +3193,7 @@ void hvm_task_switch(
             goto out;
     }
 
-    tr.type = 0xb; /* busy 32-bit tss */
+    tr.type = SYS_DESC_tss_busy;
     hvm_set_segment_register(v, x86_seg_tss, &tr);
 
     v->arch.hvm.guest_cr[0] |= X86_CR0_TS;
-- 
2.39.5


