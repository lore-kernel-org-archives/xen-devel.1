Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B60606A33D
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=inwMmYBJ
Received: from list by lists.xenproject.org with outflank-mailman.1486405.1689104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRa0E-0002Vt-3j; Thu, 12 Nov 2026 18:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486405.1689104; Thu, 12 Nov 2026 18:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRa0E-0002Vm-0w; Thu, 12 Nov 2026 18:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1486405;
 Thu, 12 Nov 2026 18:58:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRa0D-0002Vg-80
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 18:58:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRa0C-0088lC-HF
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 19:58:28 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af60c52-2eae-0a2a0a5409dd-0a2a4505a1c6-2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 19:58:28 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af60c54-4cb1-0a2a45050019-d155dd33d1cf-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 19:58:28 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so56791f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:58:28 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c7390fe82sm421065f8f.17.2026.11.12.10.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 10:58:27 -0800 (PST)
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
        d=citrix.com; s=google; t=1794509908; x=1795114708; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrZ9KkPbSkbCpVoHdqGQkGssajops2d1YXLAoT+6XWU=;
        b=inwMmYBJTPathLUQXgtRv1jeec4fFx3W/wz2Nhth5GRXbsCoNaCGHItJn2ctv1eXTZ
         qDxmw2OFxKiE59E/j0EWWZxtHgTzR619ONQ803MVVzUnmHnwBoRKhtz4+AV+SI6e0jMp
         00TPYA7t5PRkgZNC79cu4+w5epxnw3xzJgy3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509908; x=1795114708;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rrZ9KkPbSkbCpVoHdqGQkGssajops2d1YXLAoT+6XWU=;
        b=ekVQaToC/Ni0+PJ6y/5zZVRZjA836vhSSf1qBFfb4wIJOWsbjerakRMZyaHlY3i/BX
         KnBM9lV0nTje4iGAVzjBEPcd0pUeMUVwdBqpZ317Ft5Q06wMeT6uzyj2DsdIzUjt+JT+
         UaKFLibYDLwahR7K37ZZNZki9BV/jUeJmcq2bsXQ5hbzRyCws8IOagDDbrnIgjHWAraH
         s94+sQdwfh5kSnWEyWFH7Fa4cfWKu9Ju8/AR0mTau5MgSWyxJYZKQAYbII9HHgRd09Ze
         tn4edFC6e/DTuCKwWMP7oEeZAXpR9zAA783UmEzxJExKIVth9k/5LKh6wGzL0VpAYYHP
         oJ9A==
X-Gm-Message-State: APuU4Z/nAKexj6UJo+/1A61WTV+GQtNylRsIyTs18ix+zfU5x9gNph/f
	RZ+tB/Ue6zTM/aKW+1yNC9vp30E+/ftEDWKebqskmCojjVLw+5UePwllGhtMRQiJRhm3YiVNoD+
	0sL74AF8=
X-Gm-Gg: AYBFou1Xer4JDc1kTqDWLu6E2c+b67+0IcBQEySqcRWi6yQUcO8PDZYnd/2SDkmy0O+
	IncZOVjjcjplrivvVBHTsqE5GzKq4ak+Xr5IKtRz1IpKKyE7w1743MB/X7pTvK/8RiBimJvsxzW
	Zn/knPTbCQepHqVohiiOtIEl5MaEWEEAGYTcbFGE/XlEj+TazTde9sutvvdETrVFWkj8W/pcx9N
	C0LKdySsW/6kKuZtOt7g293Escr4jT+e8p+4gxD6Xd2Kk3J9SYiAkbtvXQmaADk2zPf1dT5ZsCw
	0/hlZR6SkVUdoPShJX3Mh4Zt8+6w8hXinz3m0R49zeN5p5hGl6D9sco8yFH9I1JJ4SLuL+AzY8b
	OMLxKNbZWxRFV8pMVKPtKcGsRLrIGt9Yo25X5gstRs3K+zGJlZDDOZCB79utgxAODAfHGo5uzP9
	8YEBvRSc+umt+QxrkwluTOZEEKO+DfSHLt83BDZXnn6ubs5/Q02iLo/YpV2/M4LDaeNu7cpgZIV
	HIvmxVVGDyXeILl0FKqYufdZWcs47gV2nIH3hpoaUPqc8uiqPkusXJUfVgw5VfY9JDwr2xUjDDw
	Ln+O5WhJaGqtXqyb85q4uS5kaykzZcpo8/8xLMLQpWC3HwLcCbkCeUiNhyF+Dz/3J9JohndFuDH
	siCc=
X-Received: by 2002:a05:6000:2506:b0:498:be72:6367 with SMTP id ffacd0b85a97d-49c712ac5f3mr619483f8f.22.1794509907550;
        Thu, 12 Nov 2026 10:58:27 -0800 (PST)
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
	Timothy Pearson <tpearson@raptorengineering.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/link: Don't separate .data.read_mostly from .data
Date: Thu, 12 Nov 2026 18:58:24 +0000
Message-Id: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794509908-714AC2A1-CD8BAFCA/10/78276251493
X-purgate-type: spam
X-purgate-size: 3671
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This appears to be an error in x86 which got copied into all other
architectures.  .data.read_mostly is an internal detail, and none of the
similar sections get exposed externally.

Simply place .data.read_mostly in .data.

No functional change.

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
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

This is to simplfy the script checking that xen.efi's section
attributes/alignments are correct for UEFI SecureBoot.
---
 xen/arch/arm/xen.lds.S   | 8 +++-----
 xen/arch/ppc/xen.lds.S   | 8 +++-----
 xen/arch/riscv/xen.lds.S | 7 ++-----
 xen/arch/x86/xen.lds.S   | 4 +---
 4 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index d1bb6c62d208..8d0954c90afd 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -86,16 +86,14 @@ SECTIONS
       __ro_after_init_end = .;
   } : text
 
-  .data.read_mostly : {
-       *(.data.read_mostly)
-  } :text
-
   . = ALIGN(SMP_CACHE_BYTES);
   .data : {                    /* Data */
-       *(.data.page_aligned)
+       *(.data.read_mostly)
 
        HYPFS_PARAM
 
+       *(.data.page_aligned)
+
        *(.data .data.*)
        CONSTRUCTORS
   } :text
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index cddb70855307..b2159279169c 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -77,16 +77,14 @@ SECTIONS
         __ro_after_init_end = .;
     } :text
 
-    DECL_SECTION(.data.read_mostly) {
-        *(.data.read_mostly)
-    } :text
-
     . = ALIGN(PAGE_SIZE);
     DECL_SECTION(.data) {                    /* Data */
-        *(.data.page_aligned)
+        *(.data.read_mostly)
 
         HYPFS_PARAM
 
+        *(.data.page_aligned)
+
         *(.data .data.*)
         CONSTRUCTORS
     } :text
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 250ee3f36f4f..d1c5ce59c90d 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -84,16 +84,13 @@ SECTIONS
         __ro_after_init_end = .;
     } : text
 
-    .data.read_mostly : {
-        *(.data.read_mostly)
-    } :text
-
     . = ALIGN(PAGE_SIZE);
     .data : {                    /* Data */
-        *(.data.page_aligned)
+        *(.data.read_mostly)
 
         HYPFS_PARAM
 
+        *(.data.page_aligned)
         *(.sdata .sdata.*)
         *(.data .data.*)
         CONSTRUCTORS
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 925848980219..99802aed4e13 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -295,13 +295,11 @@ SECTIONS
 
   __2M_rwdata_start = .;       /* Start of 2M superpages, mapped RW. */
   . = ALIGN(SMP_CACHE_BYTES);
-  DECL_SECTION(.data.read_mostly) {
+  DECL_SECTION(.data) {
        *(.data.read_mostly)
 
        HYPFS_PARAM
-  } PHDR(text)
 
-  DECL_SECTION(.data) {
        *(.data.page_aligned)
        *(.data .data.*)
   } PHDR(text)

base-commit: 4263fe42b736596cfa5bfec661f2f55f02759aa7
prerequisite-patch-id: 680071148129321ffaf7bd7435d031904014f556
-- 
2.39.5


