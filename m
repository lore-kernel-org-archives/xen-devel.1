Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0368C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:22:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366364.1616248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkCy-0007A3-IS; Mon, 20 Jul 2026 09:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366364.1616248; Mon, 20 Jul 2026 09:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkCy-00079w-EY; Mon, 20 Jul 2026 09:22:44 +0000
Received: by outflank-mailman (input) for mailman id 1366364;
 Mon, 20 Jul 2026 09:22:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wlkCx-00079q-Dj
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:22:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlkCw-00FGp5-LG
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:22:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a5de8e1-e002-0a2a0a5209dd-0a2a45039ccc-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:22:42 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a5de8e2-fae8-0a2a45030019-d1558034a5d6-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:22:42 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-495437bb891so27732505e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 02:22:42 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49549c96f19sm286910635e9.9.2026.07.20.02.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 02:22:40 -0700 (PDT)
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
        d=citrix.com; s=google; t=1784539362; x=1785144162; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KR02c25COt9569/260ZJnNz3j8QlMncfKgYgT6SB4Po=;
        b=CGemy8pgTY6y/Ybib9i2bviJNHxnToJlh2k2KY0ZpH9/TzZGm5d2uZ04ik5w7wq/eO
         BLT0aYko3WRxk9FTUWdW/tV20O3CH/h1pvXKSHVGJG7LRCsDVlfOfbeTaLLI+PIIGvhe
         +ZVvn84DDFLTWKPXGZ4uMfotpr6ZxLc0XNkso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539362; x=1785144162;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KR02c25COt9569/260ZJnNz3j8QlMncfKgYgT6SB4Po=;
        b=E7GN7vrvrDiU+JrEI2rmqTOQCbHfCkRG29dyaglUEOiMlkJ0J04b4y1s+E+V8IRzlS
         L0D8D275lCtdRy5g2PuazPSeEfY4s3sqwu3YW/GXpwi/yT5YsWwGdOJ7f5BlF2Bwvbgt
         MJT0yVmZzx7c71S2+DSn53NZEaLfKG8BHhfQNOhciwfNwu8vYjhpEQqZBiOfgGcC0Mwr
         S7k85lqITqEYsl7DeSDEPHSH/j7AfHusf1SubK8HNJjQpdiQWK1x7UacdfuxvF5KyI1d
         xxeJ+UhaTCdhyWnEY45/k9zDZR++bi0dP+Svu0T6WxpcHWr8b+EbYJaGLJTH7rfmucoT
         R6lQ==
X-Gm-Message-State: AOJu0Yzx5EKPd2gOh9B2S46b0HqNvCuh2I+443JHbjkP4dvYBDRhgvU7
	A91/XwuIqQmtXo6KnHMM7oTg0uKU9UCWq6v433rhYmG5dqN2WWzakLr8OwO5jSqsz+5cVNwjCES
	Im46KGKs=
X-Gm-Gg: AfdE7cnsBIW7ZIArJWBqbyQrHX/L9UcQlsCHTRZ0LorhW7+eCX7GSFpErMMqKjUdTtp
	7KSx/gI2SrFwa6nbmls+X7g4dE6NBybxC85LJWq/esVo7iC7pgzMP3TKQj468DRVq2MkLpgDF9H
	3M0ESAbWVZ52UrKNXBoOSswMtbGvKJdMWILK/gOHsPVPeThX+g01opD7IZV0yvzWf9zeNCtqF5N
	W9gMNf/q6dvrGxLGEwV24HU91vQ2rbI6uewazxoiWt+smQMqqLru2UgeyCJ3EVd1pvgfcD4mQBE
	DYbvIgM2Yc9EDbKC7q5NOO9wkju7JIDegtSFJSABNCPHZk40hz/kRLqds5RhYJmEtp3Ikjc2RF7
	7MhZx+Y9maUOLbGIKCd7T/PSbJ28X7fnG4BJ0IDLJV2TK4WMiXvkgIfr4mt4I1omywpBwJdY7fL
	dyTuZYKibcP/N35l/MNS3KViimnqySAdhiQpnIHMRKaToZyWRiOeqZ
X-Received: by 2002:a05:600c:6289:b0:493:b4a3:5ab0 with SMTP id 5b1f17b1804b1-4954a33dc26mr133804815e9.13.1784539361410;
        Mon, 20 Jul 2026 02:22:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/domctl: Reorder user_regs accesses for efficiency
Date: Mon, 20 Jul 2026 10:22:38 +0100
Message-Id: <20260720092238.2094500-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784539362-6CCDB4E9-9091F2E2/0/0
X-purgate-type: clean
X-purgate-size: 5102

The current order is derived from expanding XLAT_cpu_user_regs() which uses
the x86_32 cpu_user_regs order.  This is correct for one the blocks, but not
the others.

In order to work with the prefetcher, rather than against it, loads want to be
in field order.  Make this so for the three paths reading an x86_64
cpu_user_regs.

No functional change.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/domain.c |  6 +++---
 xen/arch/x86/domctl.c | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 53a86ba373a4..996b50af7a17 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1259,17 +1259,17 @@ int arch_set_info_guest(
         v->arch.user_regs.r14               = c.nat->user_regs.r14;
         v->arch.user_regs.r13               = c.nat->user_regs.r13;
         v->arch.user_regs.r12               = c.nat->user_regs.r12;
+        v->arch.user_regs.rbp               = c.nat->user_regs.rbp;
+        v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
         v->arch.user_regs.r11               = c.nat->user_regs.r11;
         v->arch.user_regs.r10               = c.nat->user_regs.r10;
         v->arch.user_regs.r9                = c.nat->user_regs.r9;
         v->arch.user_regs.r8                = c.nat->user_regs.r8;
-        v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
+        v->arch.user_regs.rax               = c.nat->user_regs.rax;
         v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
         v->arch.user_regs.rdx               = c.nat->user_regs.rdx;
         v->arch.user_regs.rsi               = c.nat->user_regs.rsi;
         v->arch.user_regs.rdi               = c.nat->user_regs.rdi;
-        v->arch.user_regs.rbp               = c.nat->user_regs.rbp;
-        v->arch.user_regs.rax               = c.nat->user_regs.rax;
         v->arch.user_regs.rip               = c.nat->user_regs.rip;
         v->arch.user_regs.cs                = c.nat->user_regs.cs;
         v->arch.user_regs.rflags            = (c.nat->user_regs.rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 3ea4c650eee0..2ecd81d89b09 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1485,17 +1485,17 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         c.nat->user_regs.r14               = v->arch.user_regs.r14;
         c.nat->user_regs.r13               = v->arch.user_regs.r13;
         c.nat->user_regs.r12               = v->arch.user_regs.r12;
+        c.nat->user_regs.rbp               = v->arch.user_regs.rbp;
+        c.nat->user_regs.rbx               = v->arch.user_regs.rbx;
         c.nat->user_regs.r11               = v->arch.user_regs.r11;
         c.nat->user_regs.r10               = v->arch.user_regs.r10;
         c.nat->user_regs.r9                = v->arch.user_regs.r9;
         c.nat->user_regs.r8                = v->arch.user_regs.r8;
-        c.nat->user_regs.rbx               = v->arch.user_regs.rbx;
+        c.nat->user_regs.rax               = v->arch.user_regs.rax;
         c.nat->user_regs.rcx               = v->arch.user_regs.rcx;
         c.nat->user_regs.rdx               = v->arch.user_regs.rdx;
         c.nat->user_regs.rsi               = v->arch.user_regs.rsi;
         c.nat->user_regs.rdi               = v->arch.user_regs.rdi;
-        c.nat->user_regs.rbp               = v->arch.user_regs.rbp;
-        c.nat->user_regs.rax               = v->arch.user_regs.rax;
         c.nat->user_regs.rip               = v->arch.user_regs.rip;
         c.nat->user_regs.cs                = v->arch.user_regs.cs;
         c.nat->user_regs.rflags            = v->arch.user_regs.rflags;
@@ -1514,13 +1514,13 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     else
     {
         /* Backing memory is pre-zeroed. */
+        c.cmp->user_regs.ebp               = v->arch.user_regs.ebp;
         c.cmp->user_regs.ebx               = v->arch.user_regs.ebx;
+        c.cmp->user_regs.eax               = v->arch.user_regs.eax;
         c.cmp->user_regs.ecx               = v->arch.user_regs.ecx;
         c.cmp->user_regs.edx               = v->arch.user_regs.edx;
         c.cmp->user_regs.esi               = v->arch.user_regs.esi;
         c.cmp->user_regs.edi               = v->arch.user_regs.edi;
-        c.cmp->user_regs.ebp               = v->arch.user_regs.ebp;
-        c.cmp->user_regs.eax               = v->arch.user_regs.eax;
         c.cmp->user_regs.eip               = v->arch.user_regs.eip;
         c.cmp->user_regs.cs                = v->arch.user_regs.cs;
         c.cmp->user_regs.eflags            = v->arch.user_regs.eflags;
-- 
2.39.5


