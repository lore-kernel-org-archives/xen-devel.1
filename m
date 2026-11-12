Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B22606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 18:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=f9yI2lc1
Received: from list by lists.xenproject.org with outflank-mailman.1486372.1689096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRZes-0007uR-FA; Thu, 12 Nov 2026 18:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486372.1689096; Thu, 12 Nov 2026 18:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRZes-0007uK-Bv; Thu, 12 Nov 2026 18:36:26 +0000
Received: by outflank-mailman (input) for mailman id 1486372;
 Thu, 12 Nov 2026 18:36:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRZeq-0007tv-Lz
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 18:36:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRZeq-000e47-2q
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 19:36:24 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af606f6-2eae-0a2a0a5409dd-0a2a4501ab58-34
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 19:36:23 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af60727-5984-0a2a45010019-d1558031d596-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 19:36:23 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so701095e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:36:23 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c6020bb7dsm612256f8f.33.2026.11.12.10.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 10:36:22 -0800 (PST)
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
        d=citrix.com; s=google; t=1794508583; x=1795113383; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgTcDTdVtSJTHdt9bMU0/JZabEF0CFETm/UBUot2oTc=;
        b=f9yI2lc1PTJ8pTAgV7LXO9J7wjJVtV0bEaXd3tj7+/Zt2JuE8dPN8573rS+vuCyspB
         UqCSJBcC/0inq4ghdw6MnwMdL3lapo9aG4N5H4YPouy70fF15lTERlqyU9EkzsOUcsoH
         FrvRpmuRyQFXXIdVoXNZgxzz+Gs4Pgbnlc4Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508583; x=1795113383;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EgTcDTdVtSJTHdt9bMU0/JZabEF0CFETm/UBUot2oTc=;
        b=1tZxiWamk8plwls7boZdKmdPbtjJLHtrw2o1OD3X9BLXZMgYHvmNc6iwhdvnKu4L38
         A7PDsHMqP6TGIVVvB5KfJfGiKbdYRnlIS091+NqBC1Jh3FAicKQolp2AeCrx2wfkPVJu
         P+1FdaVcJ+AMjdX/LAEGA6gfAc1dutVN512fFw7R421qy+T0rzCLtOoBll7Gnqsow76q
         N1ew1qY9V6d2XNgNIuYQk8vBM2u3hltirUH/chO1EvJ98hX1HuZn4luqFvUXjA6ys2QK
         DiiN0sneK0MqhFhObfFpcTmnDuZ3h0XdE/pE2/6v7RcEg+vjYS/jeB2uJ3NtiyXFT9jc
         N5JQ==
X-Gm-Message-State: APuU4Z/Y04CpWfrdaKIEg4GXWOLTgjc3Vr40Mj72lxCtA8xExo7o5llH
	Qm8U8e7K4jOdoVQ+agCPHXtOZ8HkL1RmKDigVWSG4a4MARnxcXht6VRBo8aBPHPqYenDrbP69Zr
	s1TS/h7k=
X-Gm-Gg: AYBFou1RaJRCjDQWFHwg5umxIW2AsygMVYySvzQuBY404Vd/td/lRE5kZhxVbelkCOa
	P671HqUWccEtlet9bXzlGsykgK0rA3+jlm/BRDcg0oPPVA13SERAwDbX2DfQdRv2W/v4iCHknHE
	OzEQOWCxoton0b5aLE2T5+acPyyo8AVqg3C0i0vp0TOoVsEy7nLNT1sJiTE1MOQ1bLSmvTstADW
	O3o4GThurPZcGE8Ermh6hFglFvV/fPeauVsBxnBZmxEbPcX9zaO10yhOXF19HDZPXUGwfqBYa2O
	40Ox1aank19fSDr9O/1LxDnYu1GnjHXRWqDwMoCelJEmvy05KMdlIgroJtHsPbxrFe2FjwPCggY
	fxGGyDhJphntgHfNOHCrkT/m7RcYITTjSbXp7KEr7fzHD5FtcBsA0tfbeS9lsxpawXxCgQhvuEp
	ZDDNR3+oa0ut/s0ZfKl5GiCOcWXL2bO0TgZ1ZbJYxJldxo0l6iXEJBFv7ucLTRRdlgmBeUcXBiY
	aMJcMgpQsSKRDwulhgiJreG9uq1GNSbDj9GGkEVPRWdxNj0hVQh8p1Bo9wpw4sD11eOhtWIHjmN
	ir5+Vuny+SNz9m6HgAlt6n++FWhcHef9UVZEpIvHR1ySknDsAf03k2TBuApzMxy6MZM1G1n0Uh+
	Bjwo=
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr1123315e9.25.1794508582988;
        Thu, 12 Nov 2026 10:36:22 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
Date: Thu, 12 Nov 2026 18:36:20 +0000
Message-Id: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794508583-1E465757-4AB8FCE6/10/78276251493
X-purgate-type: spam
X-purgate-size: 3098
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a list of pointers which is only ever read.

In the ARM linker file, fix some adjacent misalignment.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
CC: Timothy Pearson <tpearson@raptorengineering.com>
---
 xen/arch/arm/xen.lds.S   | 6 +++---
 xen/arch/ppc/xen.lds.S   | 2 +-
 xen/arch/riscv/xen.lds.S | 2 +-
 xen/arch/x86/xen.lds.S   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 613511390ff4..d1bb6c62d208 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -51,9 +51,10 @@ SECTIONS
 
   . = ALIGN(PAGE_SIZE);
   .rodata : {
-        _srodata = .;          /* Read-only data */
+       _srodata = .;          /* Read-only data */
 
-        BUGFRAMES
+       BUGFRAMES
+       SCHEDULER_ARRAY
 
        *(.rodata)
        *(.rodata.*)
@@ -93,7 +94,6 @@ SECTIONS
   .data : {                    /* Data */
        *(.data.page_aligned)
 
-       SCHEDULER_ARRAY
        HYPFS_PARAM
 
        *(.data .data.*)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 37256c8865a9..cddb70855307 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -48,6 +48,7 @@ SECTIONS
         _srodata = .;          /* Read-only data */
 
         BUGFRAMES
+        SCHEDULER_ARRAY
 
         *(.rodata)
         *(.rodata.*)
@@ -84,7 +85,6 @@ SECTIONS
     DECL_SECTION(.data) {                    /* Data */
         *(.data.page_aligned)
 
-        SCHEDULER_ARRAY
         HYPFS_PARAM
 
         *(.data .data.*)
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index d9375a961697..250ee3f36f4f 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -43,6 +43,7 @@ SECTIONS
         _srodata = .;          /* Read-only data */
 
         BUGFRAMES
+        SCHEDULER_ARRAY
 
         *(.srodata)
         *(.srodata.*)
@@ -91,7 +92,6 @@ SECTIONS
     .data : {                    /* Data */
         *(.data.page_aligned)
 
-        SCHEDULER_ARRAY
         HYPFS_PARAM
 
         *(.sdata .sdata.*)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8f943e11ead4..925848980219 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -119,6 +119,7 @@ SECTIONS
        __ro_after_init_end = .;
 
        BUGFRAMES
+       SCHEDULER_ARRAY
 
        *(.rodata)
        *(.rodata.*)
@@ -297,7 +298,6 @@ SECTIONS
   DECL_SECTION(.data.read_mostly) {
        *(.data.read_mostly)
 
-       SCHEDULER_ARRAY
        HYPFS_PARAM
   } PHDR(text)
 
-- 
2.39.5


