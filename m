Return-Path: <SRS0=f2UP=HK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F3BC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 23:56:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5BE764E5D
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 23:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5BE764E5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83098.153884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9GO8-00069L-5v; Mon, 08 Feb 2021 23:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83098.153884; Mon, 08 Feb 2021 23:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9GO8-00069E-2u; Mon, 08 Feb 2021 23:56:16 +0000
Received: by outflank-mailman (input) for mailman id 83098;
 Mon, 08 Feb 2021 23:56:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+r8=HK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9GO6-000699-S4
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 23:56:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9827e62-59f5-416e-9adc-0090c8a60223;
 Mon, 08 Feb 2021 23:56:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CF4D64E76;
 Mon,  8 Feb 2021 23:56:13 +0000 (UTC)
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
X-Inumbo-ID: d9827e62-59f5-416e-9adc-0090c8a60223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612828573;
	bh=JC2fgA3vCo0/t26eZhsquPHOlPBaFoo5utCIes70ss4=;
	h=Date:From:To:cc:Subject:From;
	b=OU0bgciatfTnoFcp9WJ+rdfVyTkXWGIJLBPZk7h1UmcGFO/kGJbvT3/Xaenk9rIJ1
	 e7jxOALI9PopYsF+6J6breULtNiaOnXcH7fl9GDdkqRw1MKNv6uIl3yZossGHcYU4P
	 wmIZhtUNcsuqBlUjBYxkFLVvGhKJey67CYDL6p6FsrJKKo727c9lhSZEqQkt1tXqyp
	 d75L9lRUHOG6itLPg6Ma1GtzU3VJKUjkacspFeU1nVBLDwpP68p4M4WQMMFcURlvBb
	 rpWmbGrxlJdZRJwyE+FJVOhWlmX+IVBPnkVEmJdKX8I/xBFAqS89M6fjQQunadd6TM
	 uNufNg/FGsdjA==
Date: Mon, 8 Feb 2021 15:56:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ehem+xen@m5p.com
Subject: [PATCH] xen: workaround missing device_type property in pci/pcie
 nodes
Message-ID: <alpine.DEB.2.21.2102081544230.8948@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

PCI buses differ from default buses in a few important ways, so it is
important to detect them properly. Normally, PCI buses are expected to
have the following property:

    device_type = "pci"

In reality, it is not always the case. To handle PCI bus nodes that
don't have the device_type property, also consider the node name: if the
node name is "pcie" or "pci" then consider the bus as a PCI bus.

This commit is based on the Linux kernel commit
d1ac0002dd29 "of: address: Work around missing device_type property in
pcie nodes".

This fixes Xen boot on RPi4.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 18825e333e..f1a96a3b90 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const __be32 *addr)
  * PCI bus specific translator
  */
 
+static bool_t dt_node_is_pci(const struct dt_device_node *np)
+{
+    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
+
+    if (is_pci)
+        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_name);
+
+    return is_pci;
+}
+
 static bool_t dt_bus_pci_match(const struct dt_device_node *np)
 {
     /*
      * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
      * powermacs "ht" is hypertransport
+     *
+     * If none of the device_type match, and that the node name is
+     * "pcie" or "pci", accept the device as PCI (with a warning).
      */
     return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
-        !strcmp(np->type, "vci") || !strcmp(np->type, "ht");
+        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
+        dt_node_is_pci(np);
 }
 
 static void dt_bus_pci_count_cells(const struct dt_device_node *np,

