Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE9AC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:03:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367171.1617070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqSE-00039a-U1; Mon, 20 Jul 2026 16:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367171.1617070; Mon, 20 Jul 2026 16:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqSE-00037s-D2; Mon, 20 Jul 2026 16:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1367171;
 Mon, 20 Jul 2026 16:02:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqSB-0002X9-IT
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqSA-00HTbS-UV
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a9-bab6-0a2a0a5309dd-0a2a4505a2b6-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:50 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46aa-4cb1-0a2a45050019-d155802ebc2c-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:50 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so78890425e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:50 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563370; x=1785168170; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIXZX14pOwVgzfv+jfEK9Ua8eYz4w2GkU/oVhmx/Uq0=;
        b=R+YKplTB2XvJOVBdx7iXggyZdWKQRjkdFyt5hvTfJXJ+UtVDodFLQA+zjYnR5Wq2v2
         s+1W79UFl10oUhBd0ZiuKAGodno1FH0ORJ/bQF/xMF9JLH1ILE+nB4capVzwUApEXOMk
         qp6pZLaYpi30JeZj2FCvSOnFG/tEMGsJ2w7JhVKhvnDSrIhu0grKtg08JEbIctoC2sTs
         EviAu8j/JKa5urEmVxUaRFzozRNPyrzmgFf4nlMtkOgGp7+GIROtMAaxgczsQzr1KOV1
         nGGdipa3NhRDpyjFycCPz/jjWv/KYyb1PC0pY0gtPWIoGxAClV6CHm/OO6Fxr0zeho1T
         tWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563370; x=1785168170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qIXZX14pOwVgzfv+jfEK9Ua8eYz4w2GkU/oVhmx/Uq0=;
        b=pW0fsmpNXA4d5WVMz9yDaiQIFjul0s77/Ks6Im4+oSvTmsEoRC9o8/I+MIdC8Cyl4/
         r1VICzQt/rG0iZWtvv8N1+ZCfO3cn3WaBk1fqhc4Hg5ltFJ5rdM923D0aZW6VadCjGLD
         74i4StASSt/rUCfxNl4dj7xlNz378+eXRyHoaigAesbtPf9gg+MYLnJuFSSARY8H7PXQ
         BgL7QBTwHZLz2fWUkz+lHjEW7ORq1536aIDQqfvxLaiv52tOFLqNwkIoeRPXsaTXlBcz
         vOHu3SVtCzv3ZSXwUO3Ifmcy4/rZyMLY58dVixUBinZOUgEWqE1UGNqzCz1KV8x/ISJx
         R6Jg==
X-Gm-Message-State: AOJu0Yw/ilXWHFtvioxW4Alsah4NABkh/ps4T7e9kOco5K+dxLkXGJlX
	MgvbU+lvxTQKcq2zwUhWIVGdiO4O39uORKTyiiZZwgD0a6ZoqX0LJRLqtwxiDw==
X-Gm-Gg: AfdE7cnDmkwyAPNptaYMUEbRdpk6sKpwYTPq/1IZuDYYmGy1zeO2kcKgk9+HE0Ysx+U
	6a2u7PiUWptK7IzkZogfC4onATD0gc3susr1FYdEmHOhGDxcR3hzzCjWoflDG3KP6u1aroogV4C
	jvmLbU6icQlYXz7ofBinBWGwMdj8eDWQf0xRPvhwzRiYyvrPCoUPJ5tLZCzibPCridbyLysuk4Y
	sw85ajzSVlPuY78sClehGbD7EI4gSdGcOezYiW2VcYcz+h1ueruAHyH+B6z+eb3VXvDYRVm3ZXj
	pUWKy7Xs7HZUh2cicaiKkx7lcXNuHJ0PjQjRxYcYc7LEg+tXehLbpNHKRx2PIAWwlvFYI58jd8f
	xAamKChppDF+/9O9Mi7ep7DnYa5y2cSB3vvJFx4xUQPMeT5INjwbcBO3eS0w7Mn3NZQLy3rQUNb
	L1xk42IlUrqltDAB/c6LaKBPqGSzgoBMq2VHxMBjFStyks3I8=
X-Received: by 2002:a05:600c:c10c:b0:495:56d4:3077 with SMTP id 5b1f17b1804b1-49556d432b4mr111068315e9.17.1784563370173;
        Mon, 20 Jul 2026 09:02:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 14/17] xen/riscv: add guest page fault handling stub
Date: Mon, 20 Jul 2026 18:02:12 +0200
Message-ID: <7ef8919f12c269d180a2b56a83218cc54e0e357c.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1784563370-71CA82A1-8BF10439/10/73395122804
X-purgate-type: spam
X-purgate-size: 3186

Add a stub handler for guest page faults and hook it into the trap path,
providing the basic infrastructure for future MMIO trap handling.

This will be used, for example, to trap accesses to APLIC registers in
order to initialize and emulate the interrupt controller for guests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/traps.c | 66 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index d35c013e1399..1c97bd101948 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -191,6 +191,67 @@ static void timer_interrupt(void)
     raise_softirq(TIMER_SOFTIRQ);
 }
 
+static always_inline unsigned long get_faulting_gpa(void)
+{
+    /*
+     * According to RISC-V spec:
+     *  18.2.8. Hypervisor Trap Value Register (htval)
+     *   ...
+     *   A guest physical address written to htval is shifted right by 2 bits
+     *   to accommodate addresses wider than the current XLEN.
+     *   ...
+     *   If the least-significant two bits of a faulting guest physical address
+     *   are needed, these bits are ordinarily the same as the
+     *   least-significant two bits of the faulting virtual address in stval.
+     *   For faults due to implicit memory accesses for VS-stage address
+     *   translation, the least-significant two bits are instead zeros. These
+     *   cases can be distinguished using the value provided in register htinst.
+     */
+    return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
+}
+
+static int emulate_load(unsigned long fault_addr, unsigned long htinst)
+{
+    return -EOPNOTSUPP;
+}
+
+static int emulate_store(unsigned long fault_addr, unsigned long htinst)
+{
+    return -EOPNOTSUPP;
+}
+
+static void handle_guest_page_fault(unsigned long cause,
+                                    struct cpu_user_regs *regs)
+{
+    unsigned long addr;
+    int rc;
+
+    addr = get_faulting_gpa();
+
+    switch ( cause )
+    {
+    case CAUSE_LOAD_GUEST_PAGE_FAULT:
+        rc = emulate_load(addr, csr_read(CSR_HTINST));
+        break;
+
+    case CAUSE_STORE_GUEST_PAGE_FAULT:
+        rc = emulate_store(addr, csr_read(CSR_HTINST));
+        break;
+
+    default:
+        rc = -EOPNOTSUPP;
+        ASSERT_UNREACHABLE();
+        break;
+    }
+
+    if ( rc )
+        domain_crash(current->domain,
+                     "%s: unable to handle faulted guest %s addr %#lx\n",
+                     __func__,
+                     (cause == CAUSE_LOAD_GUEST_PAGE_FAULT) ? "load" : "store",
+                     addr);
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
     register_t pc = cpu_regs->sepc;
@@ -205,6 +266,11 @@ void do_trap(struct cpu_user_regs *cpu_regs)
         vsbi_handle_ecall(cpu_regs);
         break;
 
+    case CAUSE_LOAD_GUEST_PAGE_FAULT:
+    case CAUSE_STORE_GUEST_PAGE_FAULT:
+        handle_guest_page_fault(cause, cpu_regs);
+        break;
+
     case CAUSE_ILLEGAL_INSTRUCTION:
         if ( do_bug_frame(cpu_regs, pc) >= 0 )
         {
-- 
2.54.0


