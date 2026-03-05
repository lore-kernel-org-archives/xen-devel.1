Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCA7F47CB5
	for <xen-devel@archiver.kernel.org>; Thu,  5 Mar 2026 19:18:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1247046.1545932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEDH-0003wC-EM; Thu, 05 Mar 2026 19:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247046.1545932; Thu, 05 Mar 2026 19:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEDH-0003w5-BC; Thu, 05 Mar 2026 19:18:23 +0000
Received: by outflank-mailman (input) for mailman id 1247046;
 Thu, 05 Mar 2026 19:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBnC=BF=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vyEDF-0003vz-WC
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 19:18:22 +0000
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [2607:f8b0:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 114163f7-18c8-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 20:18:19 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2ab232cc803so39855035ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 11:18:19 -0800 (PST)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae4d3113e0sm142965715ad.79.2026.03.05.11.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:18:16 -0800 (PST)
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
X-Inumbo-ID: 114163f7-18c8-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738298; x=1773343098; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SMJgdGHu5uiPPqH6dZaegUtOqViHvmyYFz9sYq0PX0M=;
        b=m0PHjkOQTPmUTaTHrokGZRS/IlQwA58nJ5wc0wLkmToMCa1HURjYIfTERJZaB6OzyM
         az6wfZgVFw1U5Q1jBeQ7RP7qpMu8zBqRvTZCFKfuOhbe/1mBI+tK7LMwjexLxEvHGSFN
         erS99jmMgcmwg2qP2hB/ctXQHTL3vWkQIvArA6XpsqIB1/V6lW4NrLosmsshpqixLEIF
         7HPlp3o2UGmr/1oGJ9VXQD7L+Yp0BsDEyfetwaCB4K7GsvALTWYUjj/cDEEUjF4PvWru
         JtRFHd4INTzQJ67AfD21uqhfmUPU0JcWMAx+btOyqRMEed/kEcpQt5Hay22fEECu8Cf8
         n1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738298; x=1773343098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMJgdGHu5uiPPqH6dZaegUtOqViHvmyYFz9sYq0PX0M=;
        b=FK567KuwmZflvFbqd89jEjABq/G1SSMoQafwaLVxZHh1VM7eDK/Sp579TIMz5HsUQE
         gMg0yn/2Q1CoqaclWopmA3NZVf4/mytCcaVH9urC0qrH3UL9pzWD5gYjTIK455QayLge
         oteF3flQ3raVMDvEGkYGccoFogfGD4DA1Wv/bURz4yvxF2CxHHbNW5kS8kUbbTOHwihy
         mVpva7VS4wQ0sPM7SsuHaGvm81yUfTgfph5SXUT+GYviZXhieBQrlq02GXpWGC5nHgyD
         xpW/2tJpyeWbR6GkoK0bRDfGnDcMFNVQ5vrvTtfJ8w2u6XnF2l+7+sSpgjTY6LL/0Say
         k4RQ==
X-Gm-Message-State: AOJu0Yyn4BFw3qRjOJgTL0f/RMbwQtM9ejzow9IyJrqp7126UP11GtJO
	pGfLUX5QSYNLymx9nqw2Am3Aw7kN5RpjFAJXCzOCNfNXRgQzDD1PYzASE8ntZDfK
X-Gm-Gg: ATEYQzwvzKiLdtOofJ+Ss+y6KtRR+AM5Bi6IBfJyL89G/dX4gn1HfJe+vFK50ZiD+qs
	KNrl8cPwdX5RcbzB6PxVJdhCmCRkc6AyeNBonPXFTiwwGr/+Folhzs6igWCWRZTj8iNh/TZDNIw
	qW/yr6DXb+YDhONUMvdzWKMDEwf2tfIIr5oaQ54nrr3Y1gEn8yELX2jWRBKQbVDxwQd2sozoLXG
	d/ZW6mpZYGLe0prTHwYkI4HHs7i02NRAzsJkUwaTw53WTsR9gQlc9g3O+bEPYRXxR72FLwSXDmR
	AZr2nmgINv3EM9IJqONdojbzYm2dWf3RQFDQRWhhrIHgzc+qEtCQt5zK1Suzi66WkaA+sQsxhvM
	QwQ3cSfbkLB0mMsvKktuxIzHg24l2E/zbaB5u/Oscje5/hDO6pNBzs7/tWDa1BH/fQXDvBI0RsR
	u9SyznWY2/yQNTePLqj8W2IhKHomJ6X1j5Y5kXg7bJMuOovb/ooc9wSP9wIraP5C8mdI+XMoZDV
	WvA2BZINvBu1BZbY7srOnCeVA/JWixL69nrVrtWEJqRQQXqJZvwFdT+8SuibFnwvlWBfh7/Ig==
X-Received: by 2002:a17:902:e88c:b0:2ae:59a9:639d with SMTP id d9443c01a7336-2ae6a9cc515mr71087265ad.4.1772738297481;
        Thu, 05 Mar 2026 11:18:17 -0800 (PST)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH 0/3] Fixing ACPI BGRT (Boot Graphics Resource Table) corruption
Date: Fri,  6 Mar 2026 00:48:07 +0530
Message-ID: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes ACPI BGRT (Boot Graphics Resource Table) corruption,
that occured when Xen reuses the memory containing the boot logo
image before dom0 is able to parse ACPI tables.

The BGRT table contains a pointer to a BMP image stored in
BootServicesData memory. When Xen reclaims this memory early in boot,
the pointer becomes invalid, causing Linux dom0 to report:
Xen: `(XEN) ACPI: BGRT: invalidating v1 image at 0x47cc2018`
Linux (dom0): `ACPI BIOS Warning (bug): Incorrect checksum
in table [BGRT] - 0xF9, should be 0xB4 (20250807/utcksum-58)`

This series:
1. Adds BGRT image preservation during EFI boot (similar to ESRT)
2. Removes the now-unnecessary invalidation code
3. Provides an opt-out mechanism (efi=no-bgrt) for servers

The preservation is enabled by default to fix the corruption for all
users, with minimal overhead (~1MB). Also, servers that don't need boot
graphics can disable it using the "efi=no-bgrt" option.

Testing:
- Verified on Intel UEFI system with Fedora 43 dom0
- Before: ACPI checksum errors in dom0
- After: Clean boot, no ACPI warnings
- Memory overhead: ~972 KB (preserved image size)

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>

Soumyajyotii Ssarkar (3):
  x86/efi: Add BGRT image preservation during boot
  x86/acpi: Remove BGRT invalidation code
  x86/efi: Add opt-out mechanism for BGRT preservation

 xen/arch/x86/acpi/boot.c    |  23 -----
 xen/arch/x86/efi/efi-boot.h |   2 +
 xen/common/efi/boot.c       | 199 ++++++++++++++++++++++++++++++++++++
 3 files changed, 201 insertions(+), 23 deletions(-)

--
2.53.0


