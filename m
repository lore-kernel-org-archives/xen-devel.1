Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D0AC43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 15:58:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349176.1607062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaqR-0006TP-IN; Tue, 30 Jun 2026 15:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349176.1607062; Tue, 30 Jun 2026 15:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaqR-0006TI-FM; Tue, 30 Jun 2026 15:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1349176;
 Tue, 30 Jun 2026 15:57:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1weaqP-0006Sw-WC
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:57:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weaqP-000Z3m-0i
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:57:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a43e770-5cb7-0a2a0a5109dd-0a2a45049a10-26
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:57:52 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a43e780-a01d-0a2a45040019-d155802bed87-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:57:52 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493b61b52b6so10246965e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 08:57:52 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4c89ccsm5352795e9.4.2026.06.30.08.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 08:57:51 -0700 (PDT)
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
        d=citrix.com; s=google; t=1782835072; x=1783439872; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IMbbYr9+NVJ+RMjLB2ZTVWBsz6dvse3XrZ9GOmdGl/k=;
        b=gay0zI6QE1w5V28GMILKlDE94ENithQxxJdxhBJcToz24dLZBg57tJCMY0aqgjtiow
         /2+5hbeMvYJRRQ1e+61PPMc39OKprIjOQaf/3fhVMxScmADOt+pMMPnPpg7fbXL3Vy6j
         F+2YK3lVa/ah0w5oq8tc/OMV+3aT7rKUK33vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835072; x=1783439872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMbbYr9+NVJ+RMjLB2ZTVWBsz6dvse3XrZ9GOmdGl/k=;
        b=JHsTXtd4dJOuFwPuk/LNwRwehOJLL9Bsp3rz21c8H4diUFqhqjFW0KZLkpgTbyy/PZ
         6OdzypU4zurQLpIysh1GCcx1X7R51sfTzH/MCrle047nEZrFGQpCZh54l2QpGIXANErG
         UOtnKhJbnjhg4q25W2SHXybMCbe7C87H9wREsdX7zdpQ8CD1lXBSqsRFaKL2KNRKGyAi
         Uy+oipLkJe79Wf1Qu9JtABhHJtWuq1s+F5FZw05rq8lGLNfFK2K8t9h0eOeYHJXiCabO
         erPsVPWNxVHm4OM+xAdsKLSpWdGyNk9LW37eGPnx5irLKd45Fv8CsaLM1WiMCZI4g5A0
         qpXw==
X-Gm-Message-State: AOJu0YzbNKysHsyqpc4nQjPF0AlgWQGgmKZFm5YBnNyNL2VoT5SYYOIJ
	1xuXaYtLvdKFfLa0Z4tURZKwoCB8wToKLfM6AYbN5dQU5jsG/NMh4HWvXfXJBgvTirJyDx5fGIY
	JH1eB
X-Gm-Gg: AfdE7cmEG25EsnWUUSINO+5k/ZVcadTBty61h41A9wcu0TMnlMv1aH8tYD4vfNilQYF
	hH7n53VZA8o+9Ouk+nkm67v89HRQ++FO/sJUytIFX5ppCe7q5/Gv3hs0WKu8a2wYW4pAT7wLnC7
	YWT9dwISjd2UA0tFbt01El8pjjC7rMcu9pFlAnM0dexFeXeE60qntvX2jwdqgZzoSHP9l0/pTGy
	ayCp5GyUJTFFW+ULYCwQGIRX79vopagEKLFzCVAy8fWefvuQxgyNKllPgLu1x5NxLhslTuY0fiQ
	Ea4UidbIBWmh2o8lLKfQzk/EKy2H3ygPNeKxpp4V4GRdlxoVsI/QDKdGZzOw/WFXCPGeIomptCH
	IYz2sSDlWDKGkXPDoCELH2zAgM/r3qdSXWiUj+RVm9LhWAntYCObHDmRdMMgAQsPXoBwlMjG8yN
	cljrH0WUfXGjEnFD6jUpeK5VNxebcVdeX/2vyVKekpXyoBSMqO6N1sxpg1NTVQhis=
X-Received: by 2002:a05:600c:c3c1:20b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-493b827fd66mr48358555e9.6.1782835071627;
        Tue, 30 Jun 2026 08:57:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/kexec: Drop compat_mode_gdt_desc
Date: Tue, 30 Jun 2026 16:57:49 +0100
Message-Id: <20260630155749.751977-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782835072-2F5511CC-1DF7C994/0/0
X-purgate-type: clean
X-purgate-size: 1702

Given the need to calculate the base anyway, it's easier to do so entirely on
the stack.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/x86_64/kexec_reloc.S | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index ec1e4e3550e4..62e83d60a85d 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -114,9 +114,11 @@ FUNC(kexec_reloc)
 .L_call_32_bit:
 
         /* Load compat GDT. */
-        leaq    compat_mode_gdt(%rip), %rax
-        movq    %rax, (compat_mode_gdt_desc + 2)(%rip)
-        lgdt    compat_mode_gdt_desc(%rip)
+        lea     compat_mode_gdt(%rip), %rax
+        push    %rax
+        pushw   $.Lcompat_mode_gdt_end - 1 - compat_mode_gdt
+        lgdt    (%rsp)
+        add     $10, %rsp
 
         /* Enter compatibility mode. */
         lea     compatibility_mode(%rip), %rax
@@ -206,11 +208,6 @@ END(compatibility_mode)
         /* Separate code and data into into different cache lines */
         .balign L1_CACHE_BYTES
 
-DATA_LOCAL(compat_mode_gdt_desc, 4)
-        .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
-        .quad 0x0000000000000000     /* set in call_32_bit above */
-END(compat_mode_gdt_desc)
-
 DATA_LOCAL(compat_mode_gdt, 8)
         .quad 0x0000000000000000     /* null                              */
         .quad 0x00cf93000000ffff     /* 0x0008 ring 0 data                */
-- 
2.39.5


