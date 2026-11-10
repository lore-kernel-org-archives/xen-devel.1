Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FE6606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=g33jUfi+
Received: from list by lists.xenproject.org with outflank-mailman.1481553.1685452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQk1l-0000da-Ch; Tue, 10 Nov 2026 11:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481553.1685452; Tue, 10 Nov 2026 11:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQk1l-0000dS-9q; Tue, 10 Nov 2026 11:28:37 +0000
Received: by outflank-mailman (input) for mailman id 1481553;
 Tue, 10 Nov 2026 11:28:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQk1k-0000dE-F2
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:28:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQk1j-0072b1-Rn
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:28:35 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af2ffe3-2eae-0a2a0a5409dd-0a2a450299aa-0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:28:35 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af2ffde-6ca4-0a2a45020019-d155dd34c020-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:28:30 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-491aaed7565so1164874f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 03:28:30 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4982eedfb36sm4746333f8f.0.2026.11.10.03.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 03:28:29 -0800 (PST)
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
        d=citrix.com; s=google; t=1794310110; x=1794914910; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqQq/sXAmjdQ8AVefYn3BXNLntMo3EUXAilwAWxe7Bo=;
        b=g33jUfi+2VAK93i08y55VedzzNN+bX+JqrnDcbqtyqtps0Nc8xUma1TkNE3Iz1C6vc
         aivuzwvXemzYUq8PUwNGOXOYa9KXI7IcE03yqrCKiDh5rQCYHfn8gQY/9mAX8uw1VO8/
         oWIFwfTtD2ZVNODO97OcIr708ajei7rNIMlKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310110; x=1794914910;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aqQq/sXAmjdQ8AVefYn3BXNLntMo3EUXAilwAWxe7Bo=;
        b=Rem2mm7RqRDmO6nwLxOxWtdsdLVbE/yDjnBwhIw9OGMPkWA4Y8KUJioE3T/B1BZKWJ
         FAmvdNe6EKKOnIhP3uXeSu2A0jNewe22jT9SalvxGrJtPULFe3k2hrnQHf5U3rNiG36e
         vS4yZN2CuQ661jYnaHyu8no5XXZaEhqVz0vEeW9hMYU47qoc6kovkA0s8kCr5fW/T5gC
         1nZw5lfzjLlKFvj1FFqf6bzKrSxrPkxHI4rzyGkA221KVc5ZPtV6GdPPOJnAhty1pnqO
         zZaDeTdM2Hw1mVgQAnMWrlzbpAVVfjOmzHmawTsqrz4REW9xDvS+6JhmMLyYx4gwcXpu
         bD8w==
X-Gm-Message-State: APuU4Z8sqX5a0zA8DJc8+uKLKTUK6GD+/Qb96YjRfSlm2Ihf/BMiH3du
	Ma508RmMV9y5mB1UeVgTRp1IEhKqlZ10N8lvItUEtd2nes85oyGsqlExvj2PQih508xb/VvqYWX
	69avp
X-Gm-Gg: AYBFou0jZJ0oo1tKhuVLT+zBrojP1cYp1Z2yuD2wtBSRkogCfI46Bh6GYbc9whUmqwq
	2XFiCzZB0P+H1deDdzK5vGjdS5a6861PJw2bzYxEL+RoMf/QCsPG7Dfcy1oKQJB2SJGOcdcFOId
	eXuHpLoinOhLI/1xN8krenPHnQS0E1E7Pe61BbRSY59GFhdbReFgxf1YqhNtXthtw30YNwu/R5w
	fXa6WsAY5GXu8fxKf7EssgVtLX8jQ+Quf5ArM3lwEqQjb8gMi/UntKBYdYOZz6MVgA+LdpOX0fd
	RpIBWVKbMfLFJjDHe/5ZZ97pB25yOp6m7A2w3SIMOqu1GKUWdNSFlw4v1pa8ARuQ/KrcG9V744U
	08M4+oWgCLExGd/TCVj5Ijt+7Jcic+zR7wxXUd4wBFbaqhZsVeJqA/kRaQguXPVN/UeZ48TkZhz
	ZAHp4Eh0ndOcGpUwYixMQXUOeWESd5kL2ba8B7vW2qvafe8PE+7x5mykHgYwo59pvkziTS5JDun
	fI9VQk30dBzTn4zxMrD6C5rv+dBNBf+MA4ecJo8oo9FOJXp5hB4pKC8ePUyo5hwDyHrTmWXWc4s
	RNTf4VnjdAYr3m8fEkvdPBy4rDeN008WHwtByQ064PcHusBr3EKWu6WEIfngW74TdbUj5cO5pMl
	SWCTYY1rH+zBpibw3f3+raKOZ
X-Received: by 2002:a5d:5f47:0:b0:498:be72:6370 with SMTP id ffacd0b85a97d-498be7263e8mr2211364f8f.10.1794310109557;
        Tue, 10 Nov 2026 03:28:29 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/traps: Make get_stack_{trace,dump}_bottom() static
Date: Tue, 10 Nov 2026 11:28:27 +0000
Message-Id: <20261110112827.3063860-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794310115-30BC02AC-DA8E85AC/10/78276251493
X-purgate-type: spam
X-purgate-size: 2228
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

They have no external callers.

Suggested-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

This has apparently been sat around in my tree for 6 years.
---
 xen/arch/x86/include/asm/current.h | 8 --------
 xen/arch/x86/traps.c               | 4 ++--
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index fe9a86a3f7d4..875fe41d924f 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -118,14 +118,6 @@ static inline attr_const struct cpu_info *get_cpu_info(void)
 #define get_stack_bottom()                      \
     ((unsigned long)(&get_cpu_info()->guest_cpu_user_regs + 1))
 
-/*
- * Get the reasonable stack bounds for stack traces and stack dumps.  Stack
- * dumps have a slightly larger range to include exception frames in the
- * printed information.  The returned word is inside the interesting range.
- */
-unsigned long get_stack_trace_bottom(unsigned long sp);
-unsigned long get_stack_dump_bottom (unsigned long sp);
-
 #ifdef CONFIG_LIVEPATCH
 # define CHECK_FOR_LIVEPATCH_WORK "call check_for_livepatch_work;"
 #elif defined(CONFIG_DEBUG)
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 6d83162a967c..d2ca33f9e45c 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -673,7 +673,7 @@ static void show_hvm_stack(struct vcpu *v, const struct cpu_user_regs *regs)
  * For the cases where the stack should not be inspected, pretend that the
  * passed stack pointer is already out of reasonable bounds.
  */
-unsigned long get_stack_trace_bottom(unsigned long sp)
+static unsigned long get_stack_trace_bottom(unsigned long sp)
 {
     switch ( get_stack_page(sp) )
     {
@@ -690,7 +690,7 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
     }
 }
 
-unsigned long get_stack_dump_bottom(unsigned long sp)
+static unsigned long get_stack_dump_bottom(unsigned long sp)
 {
     switch ( get_stack_page(sp) )
     {
-- 
2.39.5


