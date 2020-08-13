Return-Path: <SRS0=Q/fq=BX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53749C433E1
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2020 23:01:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F8C320774
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2020 23:01:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Nv/Y7Pok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F8C320774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6MDV-0000VL-Fo; Thu, 13 Aug 2020 23:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fx8k=BX=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1k6MDS-0000VG-PC
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 23:00:59 +0000
X-Inumbo-ID: e0af9ca6-19d0-4c46-8df4-fdb683c0dd14
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0af9ca6-19d0-4c46-8df4-fdb683c0dd14;
 Thu, 13 Aug 2020 23:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=LmFzg/3+uisMve0eTQ3IP8+ToCgU0urO4/G8i4AUQS4=; b=Nv/Y7PokL0eIVMWBaif9bsxXR3
 Q/CnuuAvJkH7OH1dTi7qSFmHvq+TJK6dEmv4dI1y+wW6TL8MpLX5RF1VdHmXg8A78kRyn4Wp3xhJ9
 YFILbPjLgmWcxMniMrAPxWwmHffuWItdgqGVz9s+7VAZMERfLTSIC7e2/ksCxWhM0+TN8CF41m5Qi
 BNFPjR1crmZXO6+9fUR0i/RMX80py4udxHsfPtcHYfIfyy8ipNd2afRbPyDTpKV/3RFyUBSn7pEYV
 8cKATufrLsz5VGFE5BPjQzc3/yeYOLO6zm3GGr5wQxp0VFFGHBkXIrdHJRZ1KJG6W18RzOHkaqzaf
 NjsihXKQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6MDN-0000R2-Ne; Thu, 13 Aug 2020 23:00:54 +0000
To: LKML <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] x86/pci: fix xen.c build error when CONFIG_ACPI is not set
Message-ID: <a020884b-fa44-e732-699f-2b79c9b7d15e@infradead.org>
Date: Thu, 13 Aug 2020 16:00:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build error when CONFIG_ACPI is not set/enabled:

../arch/x86/pci/xen.c: In function ‘pci_xen_init’:
../arch/x86/pci/xen.c:410:2: error: implicit declaration of function ‘acpi_noirq_set’; did you mean ‘acpi_irq_get’? [-Werror=implicit-function-declaration]
  acpi_noirq_set();

Fixes: 88e9ca161c13 ("xen/pci: Use acpi_noirq_set() helper to avoid #ifdef")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: xen-devel@lists.xenproject.org
Cc: linux-pci@vger.kernel.org
---
 arch/x86/pci/xen.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20200813.orig/arch/x86/pci/xen.c
+++ linux-next-20200813/arch/x86/pci/xen.c
@@ -26,6 +26,7 @@
 #include <asm/xen/pci.h>
 #include <asm/xen/cpuid.h>
 #include <asm/apic.h>
+#include <asm/acpi.h>
 #include <asm/i8259.h>
 
 static int xen_pcifront_enable_irq(struct pci_dev *dev)


