Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B052606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 21:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=ObjTNdvK
Received: from list by lists.xenproject.org with outflank-mailman.1504054.1699617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd5-0006hk-I7; Thu, 26 Nov 2026 21:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504054.1699617; Thu, 26 Nov 2026 21:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd5-0006hZ-EV; Thu, 26 Nov 2026 21:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1504054;
 Thu, 26 Nov 2026 21:03:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xWgd3-0006I6-C1
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 21:03:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWgd2-00CPvZ-Ot
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:03:40 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089e84-8faa-0a2a0a5109dd-0a2a4509e5ce-44
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:40 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089eac-be1a-0a2a45090019-d155802fa410-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:40 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4bb55cda775so46493715e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 13:03:40 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm570536295e9.1.2026.11.26.13.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 13:03:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1795727020; x=1796331820; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Wsej0LA7EDSL6KhsBVUN19Ey9sfratpimRkNUuIibs=;
        b=ObjTNdvKEI4M9QlP4l5fDQmSvzdjy+dTUF7noSboQbM7oVHRudUSX6kRNOHZ/99BCz
         VHBKLGux4INoYtRqK/urbLQsMduK6v5dPqVmFcFc163cngx4jxn+8FYl9Jj/T/o+NMb+
         mTaJ1zgX9EEAP9ArBI5HAk3mXA+78zBgDoXXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795727020; x=1796331820;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Wsej0LA7EDSL6KhsBVUN19Ey9sfratpimRkNUuIibs=;
        b=t0HQyYEyJt7OOmif8jVMyMTVErEdjxIC7ttH3skS9/c4Ns8RkjqCBLLz4ewaNE/wyP
         gmprA2K4Q9e+ZfInHPULamt74HcfT2nxUreoC2AarISaDzAnVDLiNp82PXRKXJKMyJD6
         oqofFe3XSKReIyaj12WP9U/s1x7Ail5heP1AbdCaR7wqPG+AGlV7ADe7zC8+RJ3PcHaU
         yN36fXPxc+BBuL//cZDppIq2RYyJVCj8NZzjRMKKh7qmQsEHsd80DpT+yLCMgc9+XbG5
         wCt1Tynh0ZrUnjiGHWMEZBignWkT108gkAHfU7uTSVJ0ocwCo4OPU4nwr9z0oGUy2Q7l
         HxlQ==
X-Gm-Message-State: APuU4Z9lXyKXaboa3IhAgP/7MePZwI1cplByWdZ3hoKS6DYwxFDzXod6
	E0RYeDxhNEk+a6VOAzJXXRdA/sHWo/PJHRyRO2yNmta7GOPotlmOa9xhAqMxlWWvEM6UYp+05V/
	whJ6C/6g=
X-Gm-Gg: AZFdTZdnqO/IQw2OzFNd9wf9u+i416Jp8Z0g7EXPNRZaSdH7Hk2Y7zt/H+Z2q22cBjT
	XTHGcoPquI0UH/5GJF3FCW3+dvGj26mcYmpQhnUzuXm9EdaM8hJVwbo2OuicfLx2UZQ1L8aD3/M
	v00z6YijDWLuDAYp/kbBKX0+SX8DvVu9Wds+wZk++ZJL5Esrky5RQP9U0+xPAj31X8bOTDIf5xa
	iquWPZWOLO5QZoBMu2W0TyA+9ishzYmLoAu30VY36FaJeZACSBvwIeDqxTD5ujgA9+SgnoUsRFs
	NdcQmz55bmyp92niq3Xj2tYClVJgIMYC1Wp06ezDMt4CHPGW0LDAD9wuMtIMiKZtzDLXW5dT86S
	4NFyqsMfzl6dBvY019h56+8e33zwApR3x3+eBDhcKfee1FYF1PVzlF0sIU1sl3SatlMBlP1IBhG
	JaVQWco+F8HkVE71PugsebhsyXk4eFw8nAKHbVWQCdVR1ul22dSsQIzqvV53pkaGYaMp+0wbmAO
	UCnt7LsHRRvP7esrfy/z2gLzB1rh91s1KR5ZjTdKwhWeav03ZsG90DcBtENDz9UX0hnVy7olnMl
	QFIeMpnZw2oNeMhrpQaahcoWL3Y76jDSn9Lo44USPUYt5ZIvmi+RlATKKVxwJZhMjki+2O183vH
	LV+U=
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr428828625e9.7.1795727020102;
        Thu, 26 Nov 2026 13:03:40 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [PATCH 2/4] x86/efi: Move the trampoline into .init.data for EFI builds
Date: Thu, 26 Nov 2026 21:03:35 +0000
Message-Id: <20261126210337.746228-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261126210337.746228-1-andrew.cooper3@citrix.com>
References: <20261126210337.746228-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1795727020-3BCD7034-7FE5590B/0/0
X-purgate-type: clean
X-purgate-size: 3229
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

... but keep it in .init.text for xen.gz

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <freddy77@gmail.com>

In an ideal world, we'd remove all xen.efi writes into the trampoline while
it's part of the Xen image. Two (trampoline_efer, trampoline_xen_phys_start)
are easy to fix.  Applying relocations is doable (requires coordinated effort
with the MB2 path), but EDID is problem write.  EDID needs to be written
before EBS, but the trampoline cannot be placed prior to EBS in all cases.

It isn't completely ideal to use "a" rather than "ax" or "aw" but it is
necessary given that head.S is built only once.  It means that the trampoline
is only disassemblable in xen-syms, not head.o.

I admit that this justification is getting a little flimsy, yet I do
disassemble the trampoline on a concerningly frequent basis.
---
 xen/arch/x86/boot/head.S | 14 +++++++++++++-
 xen/arch/x86/xen.lds.S   |  6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 981f262b5ec4..3c396cd952c3 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -711,7 +711,19 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
-        .section .init.text, "ax", @progbits
+        /*
+         * In an ideal world, the trampoline would live in .init.text, as it
+         * is necessary to disassemble during development.
+         *
+         * However, xen.efi writes into the trampoline while it's part of the
+         * main Xen image.  xen.efi needs to be StrictNX compatible
+         * (i.e. writable sections must not be executable), so must have the
+         * trampoline in a data section.
+         *
+         * Put the trampoline in a dedicated section so the final link can
+         * place it appropriately.
+         */
+        .section .init.trampoline, "a", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 888d5293f3d6..cef3d404a1a8 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -200,6 +200,9 @@ SECTIONS
        _sinittext = .;
        *(.init.multiboot)
        *(.init.text)
+#ifndef EFI /* Non-EFI wants the trampoline in .init.text for disassembly. */
+       *(.init.trampoline)
+#endif
        *(.text.startup)
        _einittext = .;
        /*
@@ -232,6 +235,9 @@ SECTIONS
 
        *(.init.data.multiboot)
        *(.init.data)
+#ifdef EFI /* EFI needs the trampoline in .init.data for StrictNX compatibility. */
+       *(.init.trampoline)
+#endif
        *(.init.data.rel)
        *(.init.data.rel.*)
        . = ALIGN(4);
-- 
2.39.5


