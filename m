Return-Path: <SRS0=RYVw=O7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82854C433F5
	for <xen-devel@archiver.kernel.org>; Mon, 11 Oct 2021 07:57:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47BF260D07
	for <xen-devel@archiver.kernel.org>; Mon, 11 Oct 2021 07:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47BF260D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.205403.360688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqB6-0005Kn-Pr; Mon, 11 Oct 2021 07:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205403.360688; Mon, 11 Oct 2021 07:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqB6-0005Kg-Mn; Mon, 11 Oct 2021 07:56:56 +0000
Received: by outflank-mailman (input) for mailman id 205403;
 Mon, 11 Oct 2021 07:56:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBe3=O7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mZqB5-0005Ka-U3
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 07:56:55 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2ba7b099-05a4-4b44-94d8-7f3478b3bc17;
 Mon, 11 Oct 2021 07:56:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 473EE1063;
 Mon, 11 Oct 2021 00:56:53 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A81A3F66F;
 Mon, 11 Oct 2021 00:56:52 -0700 (PDT)
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
X-Inumbo-ID: 2ba7b099-05a4-4b44-94d8-7f3478b3bc17
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/efi: Fix null pointer dereference
Date: Mon, 11 Oct 2021 08:56:38 +0100
Message-Id: <20211011075638.23785-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Fix for commit 60649d443dc395243e74d2b3e05594ac0c43cfe3
that introduces a null pointer dereference when the
fdt_node_offset_by_compatible is called with "fdt"
argument null.

Reported-by: Julien Grall <julien@xen.org>
Fixes: 60649d443d ("arm/efi: Introduce xen,uefi-cfg-load DT property")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/efi/efi-boot.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index a3e46453d4..e63dafac26 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -593,7 +593,8 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
     dtbfile.ptr = fdt;
     dtbfile.need_to_free = false; /* Config table memory can't be freed. */
 
-    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 )
+    if ( fdt &&
+         (fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0) )
     {
         /* Locate chosen node */
         int node = fdt_subnode_offset(fdt, 0, "chosen");
-- 
2.17.1


