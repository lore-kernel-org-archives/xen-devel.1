Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887F7C6379F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 17:08:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD36241A6
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 17:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="1HuQ9T7H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DD36241A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31212.61540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnQD-0007lK-PZ; Thu, 19 Nov 2020 17:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31212.61540; Thu, 19 Nov 2020 17:08:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnQD-0007l3-G2; Thu, 19 Nov 2020 17:08:37 +0000
Received: by outflank-mailman (input) for mailman id 31212;
 Thu, 19 Nov 2020 17:08:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfnQC-0007ji-Or
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:08:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfnQC-0000vh-Bw; Thu, 19 Nov 2020 17:08:36 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfnQD-0000U1-2q; Thu, 19 Nov 2020 17:08:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQC-0007ji-Or
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=mZpQmkQLUUO1hccs/83l4shhsGEQrqSCrng3B/PMRp8=; b=1HuQ9T7HVyh8X0YHLZ0toblpD
	/xoNNu/ImjbvMuiO15+xQnDkKwHZevcEcccRLdJrk64DEb5LSVWG+fBGghmZX140PCRnwtK4253Fl
	XSz3j2Iu5LR9Z0l3KogPljy/DAu5LG0irbnYAbb+nxWg+rLu4QledAngbQ3RIG+w9AbBY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQC-0000vh-Bw; Thu, 19 Nov 2020 17:08:36 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQD-0000U1-2q; Thu, 19 Nov 2020 17:08:37 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 3/3] xen/arm: acpi: Allow Xen to boot with ACPI 5.1
Date: Thu, 19 Nov 2020 17:08:29 +0000
Message-Id: <20201119170829.9923-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119170829.9923-1-julien@xen.org>
References: <20201119170829.9923-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

At the moment Xen requires the FADT ACPI table to be at least version
6.0, apparently because of some reliance on other ACPI v6.0 features.

But actually this is overzealous, and Xen works now fine with ACPI v5.1.

Let's relax the version check for the FADT table to allow QEMU to
run the hypervisor with ACPI.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---
    Changes in v3:
        - Add Stefano's acked-by

    Changes in v2:
        - Patch added
---
 xen/arch/arm/acpi/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 55c3e5cbc834..7ea2990cb82c 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -181,8 +181,8 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
      * we only deal with ACPI 6.0 or newer revision to get GIC and SMP
      * boot protocol configuration data, or we will disable ACPI.
      */
-    if ( table->revision > 6
-         || (table->revision == 6 && fadt->minor_revision >= 0) )
+    if ( table->revision > 5
+         || (table->revision == 5 && fadt->minor_revision >= 1) )
         return 0;
 
     printk("Unsupported FADT revision %d.%d, should be 6.0+, will disable ACPI\n",
-- 
2.17.1


