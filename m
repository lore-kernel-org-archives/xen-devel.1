Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24E6CDB481
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 14:24:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1345025.1604029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOW0-0001Vr-38; Wed, 24 Jun 2026 14:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345025.1604029; Wed, 24 Jun 2026 14:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOVz-0001Vk-Vg; Wed, 24 Jun 2026 14:23:43 +0000
Received: by outflank-mailman (input) for mailman id 1345025;
 Wed, 24 Jun 2026 14:23:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcOVy-0001Vc-QP
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:23:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcOVy-00G68Q-0C
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 16:23:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a3be868-e002-0a2a0a5209dd-0a2a4506ece2-12
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:23:41 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a3be86d-08de-0a2a45060019-d155dd36b115-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:23:41 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4624c1409c9so975831f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 07:23:41 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c2279bc77sm6387119f8f.32.2026.06.24.07.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:23:40 -0700 (PDT)
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
        d=citrix.com; s=google; t=1782311021; x=1782915821; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zjnCNpKCU+HaOWOpVql/VMnOAwgSOfc86FOZIOHrL0=;
        b=HpaEsKG8TsPv/PlTnWg4YS3ADE0tYf21g7VvFTBz7iUUZJZ9Ipzc4dk3LyeRdHX/qj
         Irugjop9JLZONZ2Cp05A6LM1en0g6bt9axylXJbG2G7BXcyz14wE8hu/JgZuKEtjxkkW
         9oRICqNWIPTCTMM3KDF2azDnpPhiUVsEJbnnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311021; x=1782915821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zjnCNpKCU+HaOWOpVql/VMnOAwgSOfc86FOZIOHrL0=;
        b=fIOxKO8j4T1qs9HqgRH+rAlL2vkFISsLWnCoMqg4/mzhu2ghFMrI+OcnY3TUnxlO/V
         8m5tsOSaS5WTWXIaFO66qCrNICfa8zFHXPAzsz+cbzftgjSJ1qGBw5SRo8C5SD1mmnbn
         k8LWpYXRPaIjljEPiixP8ViGRk4pneMYgcnIg9esx1XGM0aYXqOrj2S0sNq08I4kZRfJ
         ygxK/elEwdRgLvuQiTy5WtZACIGgRiP7yckZEZiLpdfZeySfyRMWsAu+AprMqmz6KbIj
         iMN0LZ9lyiI/smBJR06EYU/8d4OnDx4Nz2Tj0G/7bWhPLgRLGIkgR4YyJXdC/SlSocw7
         lhBQ==
X-Gm-Message-State: AOJu0YwMnOARUBXU0E3F8ISElBzl6Y6mzqk6TuTWYyEeOC6ZyzkPbsBk
	x9kS/coSVSdr6kqs6Em9o+FSzhB8tRjsjLhx4C7oftxTqBzcI1OYHMyxHYSh4fMZ5k0oNZSQV6n
	YXIiL
X-Gm-Gg: AfdE7clPVSrgxsf5fMVNPibDd7Db5hzQ9EmDnm8hBorEpTFQ0meeQ4hGpyPdeokrdf9
	UuEGL54rGTLmtJVIhHnTwOZ/ORYN7grvJ+yndzPKQgwczQNIyDx5j3cqIZkF2/WmXQxaRMNpwZu
	vwOcVyYrB4abc9shCIwc8IpnOlqJ9u/L59TpAvZnPEoY46CNvA/r2zqD4IX2NlS4Yw3PQ3jhw5H
	2isVukR0S2Kcbyqq7SP4ZHTkj7JTI6Cr/kM4BaZvGhm5/8WLU2YlkGh3UbBSU2uSdu9ONWNSH+n
	6KuP0ouff+Pm4mvnQs3YOoMERRvhUBPve9mJRH3JEFG6XOM+3C0ToafAV0NQtMBocN8W6a0ZOwi
	O5Ub2gWHY1kJKP7APO7Bq4XhiQs17yR8Ao5kKqEs5Z7+jpdQe7DB0p6AmJ83wZa7rAmg8KNkb1W
	ma++hrrzuE0DnYzTRf1rPaYbsQo4ySmUbmU0eYKcMW/YdL/QnaEVYg5Ss76Pphp8g=
X-Received: by 2002:a05:6000:2c0f:b0:461:a161:b625 with SMTP id ffacd0b85a97d-468c50a2547mr21712082f8f.17.1782311020718;
        Wed, 24 Jun 2026 07:23:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] x86/fred: Send an EVENT_CHECK IPI on exit from NMI
Date: Wed, 24 Jun 2026 15:23:38 +0100
Message-Id: <20260624142338.653064-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782311021-C453168D-EFAA05DF/10/73395122804
X-purgate-type: spam
X-purgate-size: 4147

Returning from an NMI which hits guest context needs special casing in FRED
mode just like it does in IDT mode.

Break nmi_exit_to_guest() out of handle_ist_exception(), and use it in
entry_FRED_R3() also.

Expand the comment a little, and invert the conditional jump to
compat_restore_all_guest() to avoid needing an #else clause for CONFIG_PV32.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Slightly RFC, not tested yet.  (My AMD system takes an eternity to reboot)

For 4.22.  Found during testing of FRED.  The consqeuence is that we can end
up scheduling while still in NMI context, after which things like the watchdog
and other diagnostics don't work properly.
---
 xen/arch/x86/x86_64/entry-fred.S |  6 ++++
 xen/arch/x86/x86_64/entry.S      | 49 +++++++++++++++++++-------------
 2 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry-fred.S b/xen/arch/x86/x86_64/entry-fred.S
index e9c84423dacd..1ad9694a043b 100644
--- a/xen/arch/x86/x86_64/entry-fred.S
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -20,6 +20,12 @@ FUNC(entry_FRED_R3, 4096)
         GET_STACK_END(14)
         movq    STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
 
+        /* NMIs need special handling on return to guest. */
+        movzbl  UREGS_ss + 6(%rsp), %eax
+        and     $0xf, %eax
+        cmp     $X86_ET_NMI, %al
+        je      nmi_exit_to_guest
+
         jmp     test_all_events
 #else
         BUG     /* Not Reached */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 17ca6a493906..de5d854f5533 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -146,6 +146,35 @@ process_trap:
         jmp  test_all_events
 END(switch_to_kernel)
 
+/*
+ * When returning to guest from an NMI, we must execute an IRET/ERETU to
+ * re-enable NMIs, and must not process softirqs which can e.g. schedule
+ * rather than returning to guest context.
+ *
+ * If a softirq is pending, send ourselves an EVENT_CHECK IPI to compensate.
+ * This will cause softirq processing to occur upon leaving NMI context.
+ *
+ * %rbx: struct vcpu, %r14 stack_end
+ */
+FUNC(nmi_exit_to_guest)
+        mov     STACK_CPUINFO_FIELD(processor_id)(%r14), %eax
+        shl     $IRQSTAT_shift, %eax
+        lea     irq_stat + IRQSTAT_softirq_pending(%rip), %rcx
+        cmpl    $0, (%rcx, %rax, 1)
+        je      1f
+        mov     $EVENT_CHECK_VECTOR, %edi
+        call    send_IPI_self
+1:
+        /* For restore_all_guest. */
+        mov     STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
+#ifdef CONFIG_PV32
+        mov     VCPU_domain(%rbx), %rax
+        cmpb    $0, DOMAIN_is_32bit_pv(%rax)
+        jne     compat_restore_all_guest
+#endif
+        jmp     restore_all_guest
+END(nmi_exit_to_guest)
+
         .section .text.entry, "ax", @progbits
 
 /* %rbx: struct vcpu, interrupts disabled */
@@ -1209,25 +1238,7 @@ FUNC(handle_ist_exception)
 #ifdef CONFIG_PV
         testb $3,UREGS_cs(%rsp)
         jz    restore_all_xen
-        /* Send an IPI to ourselves to cover for the lack of event checking. */
-        mov   STACK_CPUINFO_FIELD(processor_id)(%r14), %eax
-        shll  $IRQSTAT_shift,%eax
-        leaq  irq_stat+IRQSTAT_softirq_pending(%rip),%rcx
-        cmpl  $0,(%rcx,%rax,1)
-        je    1f
-        movl  $EVENT_CHECK_VECTOR,%edi
-        call  send_IPI_self
-1:
-        /* For restore_all_guest. */
-        mov   STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
-#ifdef CONFIG_PV32
-        movq  VCPU_domain(%rbx),%rax
-        cmpb  $0,DOMAIN_is_32bit_pv(%rax)
-        je    restore_all_guest
-        jmp   compat_restore_all_guest
-#else
-        jmp   restore_all_guest
-#endif
+        jmp   nmi_exit_to_guest
 #else
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen

base-commit: d42ace60290a4b4184ee2133b245b134fdf96fed
-- 
2.39.5


