Return-Path: <SRS0=/2oJ=GW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C92C433E6
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 06:19:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3D1822DFB
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 06:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3D1822DFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.70124.125811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1kLx-000736-Sn; Tue, 19 Jan 2021 06:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70124.125811; Tue, 19 Jan 2021 06:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1kLx-00072z-PP; Tue, 19 Jan 2021 06:18:57 +0000
Received: by outflank-mailman (input) for mailman id 70124;
 Tue, 19 Jan 2021 06:18:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g+CZ=GW=devnote=mhiramat@srs-us1.protection.inumbo.net>)
 id 1l1kLw-00072a-G5
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 06:18:56 +0000
Received: from devnote (unknown [210.141.244.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb73f5c6-d667-4fae-9c36-d5f93ebaefc5;
 Tue, 19 Jan 2021 06:18:55 +0000 (UTC)
Received: from devnote (localhost [127.0.0.1])
 by devnote (8.15.2/8.15.2/Debian-18) with ESMTPS id 10J5uVpT001015
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 14:57:10 +0900
Received: (from mhiramat@localhost)
 by devnote (8.15.2/8.15.2/Submit) id 08SChj4M004702;
 Mon, 28 Sep 2020 21:43:45 +0900
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
X-Inumbo-ID: bb73f5c6-d667-4fae-9c36-d5f93ebaefc5
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org, masami.hiramatsu@linaro.org, ehem+xen@m5p.com,
        bertrand.marquis@arm.com, andre.przywara@arm.com,
        Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>,
        =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen: acpi: Hide UART address only if SPCR exists
Date: Mon, 28 Sep 2020 21:42:45 +0900
Message-Id: <160129696545.4486.5090289203994972923.stgit@localhost>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
References: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
In-Reply-To: <160129689861.4486.15700361505030965554.stgit@localhost>
References: <160129689861.4486.15700361505030965554.stgit@localhost>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Since there is a case that UEFI (EDK2) doesn't make the SPCR
table when it is booted with graphic console, ignore it if SPCR
doesn't exist.

Signed-off-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>
---
 xen/arch/arm/acpi/domain_build.c |   19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index 1b1cfabb00..a50adbb9ab 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -40,20 +40,17 @@ static int __init acpi_iomem_deny_access(struct domain *d)
 
     /* TODO: Deny MMIO access for SMMU, GIC ITS */
     status = acpi_get_table(ACPI_SIG_SPCR, 0,
-                            (struct acpi_table_header **)&spcr);
-
-    if ( ACPI_FAILURE(status) )
+                        (struct acpi_table_header **)&spcr);
+    /* SPCR may not set when the UEFI uses graphical console. */
+    if ( ACPI_SUCCESS(status) )
     {
-        printk("Failed to get SPCR table\n");
-        return -EINVAL;
+        mfn = spcr->serial_port.address >> PAGE_SHIFT;
+        /* Deny MMIO access for UART */
+        rc = iomem_deny_access(d, mfn, mfn + 1);
+        if ( rc )
+            return rc;
     }
 
-    mfn = spcr->serial_port.address >> PAGE_SHIFT;
-    /* Deny MMIO access for UART */
-    rc = iomem_deny_access(d, mfn, mfn + 1);
-    if ( rc )
-        return rc;
-
     /* Deny MMIO access for GIC regions */
     return gic_iomem_deny_access(d);
 }


