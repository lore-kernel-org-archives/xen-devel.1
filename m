Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90555C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 12:00:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422969.1648281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oJN-0005ia-3d; Wed, 16 Sep 2026 12:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422969.1648281; Wed, 16 Sep 2026 12:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oJN-0005iT-06; Wed, 16 Sep 2026 12:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1422969;
 Wed, 16 Sep 2026 12:00:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alexey.Kardashevskiy@amd.com>) id 1x6oJK-0005iB-T4
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 12:00:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6oJK-007oXG-9g
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 14:00:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 6aaa84c6-8faa-0a2a0a5109dd-0a2a4502c49a-42
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:00:21 +0200
Received: from [52.101.43.20]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 6aaa84d2-6ca4-0a2a45020019-34652b14f21e-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:00:21 +0200
Received: from BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::11)
 by MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 12:00:06 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::d) by BY1P220CA0011.outlook.office365.com
 (2603:10b6:a03:59d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 12:00:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 12:00:04 +0000
Received: from aiemdee.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 06:59:40 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOT7sVRXy9De2202CBbsIjMNa3wpE64zrj65FxGGKS7PGb1MplltqpoLeCUpGx7ERZpY3Wx3NAV/QLDD5ajZ8TWBhHAmA7svGZ0jRP+vm0EfeMRqzOra+gqEXc3wU2EUl3w5PL74Psv9aAjdKrMNFUdLmRVJkQK2/JK/tDQMJIp5RWvNbrsOmDMxwqf1AYrbxWIFO9Q6nLPhIlAHBFeZiskQzoJuvogtBFK//uDXAZC/DiazhNPFh9XmflxC3nO/YGV/6XeV9IWs6D0zAN0r07oXvJZZwudZ9ulmklLYQEAsk+qdJ/Qo0ulexhdhaCd/lK0XwXDFaXjI9mK24RPtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaFnTLlUeuS15Vco6JUFNTtjEg2/GLK2yLIZqCLTaAk=;
 b=Q5qrJsNAJXmzz0ze4iE6i1fEBUGJQFh0UxYftcksk8ufaz1yIDLcrj4GXAK8nACOLg6tFJdf36XWt0fiuVrvSDAcZVafTi+ehnmYjj/Bcc6GqwKJB0oncFHWsDbq+FKYYIVLek3mX2tJJhtqKAUChv3FCxISUBsAUFX4KWQw4+O+YaaDU2dxRiPqDCEHgUKL89cqNcuwbWD3oLQ5qPOjVAlgf7lgsqbw52wuZeaNyOWuVLUV5BeUYZvtR4ZH06sTqUsJchF4+DCIuIq/zDzCxVKC2Py6c7IvuS6xtZM5PncphGiKcCkKflcuw2KKxDCCQZ/KrxVKCadiD8iTS2wqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaFnTLlUeuS15Vco6JUFNTtjEg2/GLK2yLIZqCLTaAk=;
 b=gl3xaf2YW+xaUIdq/Ze4Vsnj1kQ2CrbCHsosjClYBGfqZKutdv3pYi+i/jzEWmd68FNLaEXIyXR//z2vbzRuO6R+38BRzH0IfFjoSr/u2P6BUTDTi5bwX8GkZ01py42Csy+noYDtShAmBDoL57gbb5TnjyLoMF0lpOHKJkgiW4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alexey Kardashevskiy <aik@amd.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-pci@vger.kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David
 S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Jini Susan George
	<jinisusan.george@amd.com>, Kees Cook <kees@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nikunj A Dadhania <nikunj@amd.com>, Ard Biesheuvel
	<ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Kim Phillips
	<kim.phillips@amd.com>, Joerg Roedel <jroedel@suse.de>, Ethan Nelson-Moore
	<enelsonmoore@gmail.com>, "Tycho Andersen (AMD)" <tycho@kernel.org>, "Liam
 Merwick" <liam.merwick@oracle.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
	Suresh Siddha <suresh.b.siddha@intel.com>, Xiaotian Feng <dfeng@redhat.com>,
	Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Andi Kleen
	<ak@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, Tony Luck
	<tony.luck@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Lu Baolu
	<baolu.lu@linux.intel.com>, Xu Yilun <yilun.xu@linux.intel.com>,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>, Jonathan Cameron
	<jic23@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Ian Campbell
	<ian.campbell@citrix.com>, Jeremy Fitzhardinge
	<jeremy.fitzhardinge@citrix.com>, Petr Tesarik <ptesarik@suse.com>, "David
 Howells" <dhowells@redhat.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Christian
 Marangi" <ansuelsmth@gmail.com>, Dave Jiang <dave.jiang@intel.com>, "Michael
 Kelley" <mhklinux@outlook.com>, Ilias Stamatis <ilstam@amazon.com>, "Sumanth
 Korikkar" <sumanthk@linux.ibm.com>, Simona Vetter <simona.vetter@ffwll.ch>,
	Toshi Kani <toshi.kani@hp.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, Jiang Liu
	<jiang.liu@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual
	<anshuman.khandual@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
	"Palmer Dabbelt" <palmerdabbelt@google.com>, <linux-coco@lists.linux.dev>,
	<xen-devel@lists.xenproject.org>, <iommu@lists.linux.dev>,
	<linux-mm@kvack.org>, Alexey Kardashevskiy <aik@amd.com>, <aik@ozlabs.ru>,
	Santosh Shukla <santosh.shukla@amd.com>, "Pratik R . Sampat"
	<prsampat@amd.com>, Scott Soule Cheloha <scott.cheloha@amd.com>, Ackerley Tng
	<ackerleytng@google.com>, Fuad Tabba <tabba@google.com>
Subject: [RFC PATCH kernel 12/17] coco/sev-guest: Allow multiple source files in the driver
Date: Wed, 16 Sep 2026 21:51:52 +1000
Message-ID: <20260916115159.1938195-13-aik@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916115159.1938195-1-aik@amd.com>
References: <20260916115159.1938195-1-aik@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|MW6PR12MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b51706f-555c-417b-6072-08df13ea0b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|32650700020|82310400026|376014|1800799024|7416014|36860700016|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	c1h/v5dfyxtiJ0WMVLNUDUgDxQatd0LMYdCKEY7e04HynA36o8DyKva5ruSvgqLaYCZoACqFUTHJK34ToQWM2MCCBg8Kk7vj/2plyvqelPReb5cAchDM+rTgWz3R7+Bnn8ph2gDyR2gM1wOZ3eh96GmQgRBj+zLT5cv5IdSYd3m2550ol3Ju1H9Km4MeCRVLxS3P5tQG7Q6T60yUsavCTOXu+/lSdcNSXfH4XlPCpgcpdFxRyqXRxBfbCDZiWLw0jYPQBg+gnHcm43Ypv3xHiGWQZTrQCmEP5i4jtweCR3YCmnazEVmPJCF5QstAYvxEeM743M1roHVrc9DqPuzMr8zHM0+lYfjxrS1wZoed/qJt1s5IE2AwGFgZuW7dDZtT6kWHu/51GndcomO9IWD/jwWkOFsL7bzdnTa7mI57odOgfeKiGNW5KML1b9MMJHQlon4dZskVmWAL8Sz4TeZsfI2snrZQqZHw1VeqP6cNOd1+SAikuN0yICPz2mmXFbsY9kDso0V8ykYrmJaFLk+T0sI6wo9CqW8wOzY2zQE86bI3j0nzMoUhX/M92d3xvTibl5Q8beTHkpAFkouRueVl86YNLgpODk3wkrrQXf65BdnneQuNWY7Gj2PWopz3bSypTYcLY/pRErszp3XubjRa2THlRPuWrl2ob/Hd5ZjCxnrdU7d5A7UKCUOQWy0Tr3m4DZo2fK5268pMv5G9i3j5zA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(32650700020)(82310400026)(376014)(1800799024)(7416014)(36860700016)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mS/imRrmbpxps67qGJxsphoc6eABPi9uEQAis97tyVjMcE7n1lUTb6+nlr386lpHVT/77AfVBAUGjtAsAI5U9VXIwQoNQqyOCrtenVvuZ6eZw8IQ01EvVcJIJZKPAyUI4IO5d87YjfhcEbh3mwPSHX0ytq1np4FzH1zAlBJzgfTo8p0WT7ftEYpWH/8xtuWrky0lg7Vb96bVRK0Oeh6Z/Bqtz30YVY0Ax3IUkvh2HhjL40wS9DrhCJBLx7/jYYe/jKEXsV+a4EnUeg6An48phGGuN8HGBTtQ3lpe6CODT1Jd3R3JIsEO3VlQNWWwvtg/FD5FsLXAXzDKQGVzf+GeBuklrtxXE/UOq8e27ANdgmihgrEF0Zlccza6kUJgBTwzV1Cp83zG4TJU548hlWxppR2g/9S2jzp+mAiL2crSmfzp8SlYOzleDPsozfr+5czZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:00:04.6040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b51706f-555c-417b-6072-08df13ea0b92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8663
X-purgate-ID: tlsNG-720697/1789560021-F16AF2AC-FEBAE27B/0/0
X-purgate-type: clean
X-purgate-size: 2248

Prepare for SEV-TIO support as it is going to equal or bigger
than the existing sev_guest.c which is already 700 lines and
keeps growing.

No behavioural change expected.

Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---
 drivers/virt/coco/sev-guest/Makefile                |  2 +-
 drivers/virt/coco/sev-guest/sev-guest.h             | 16 ++++++++++++++++
 drivers/virt/coco/sev-guest/{sev-guest.c => core.c} | 10 ++--------
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/virt/coco/sev-guest/Makefile b/drivers/virt/coco/sev-guest/Makefile
index 63d67c27723a..a8eb28b6736e 100644
--- a/drivers/virt/coco/sev-guest/Makefile
+++ b/drivers/virt/coco/sev-guest/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_SEV_GUEST) += sev-guest.o
+obj-$(CONFIG_SEV_GUEST) += core.o
diff --git a/drivers/virt/coco/sev-guest/sev-guest.h b/drivers/virt/coco/sev-guest/sev-guest.h
new file mode 100644
index 000000000000..b2a97778e635
--- /dev/null
+++ b/drivers/virt/coco/sev-guest/sev-guest.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SEV_GUEST_H__
+#define __SEV_GUEST_H__
+
+#include <linux/miscdevice.h>
+#include <asm/sev.h>
+
+struct snp_guest_dev {
+	struct device *dev;
+	struct miscdevice misc;
+
+	struct snp_msg_desc *msg_desc;
+};
+
+#endif /* __SEV_GUEST_H__ */
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/core.c
similarity index 99%
rename from drivers/virt/coco/sev-guest/sev-guest.c
rename to drivers/virt/coco/sev-guest/core.c
index 935537a41469..98f698809720 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/core.c
@@ -27,19 +27,13 @@
 #include <uapi/linux/psp-sev.h>
 
 #include <asm/svm.h>
-#include <asm/sev.h>
+
+#include "sev-guest.h"
 
 #define DEVICE_NAME	"sev-guest"
 
 #define SVSM_MAX_RETRIES		3
 
-struct snp_guest_dev {
-	struct device *dev;
-	struct miscdevice misc;
-
-	struct snp_msg_desc *msg_desc;
-};
-
 /*
  * The VMPCK ID represents the key used by the SNP guest to communicate with the
  * SEV firmware in the AMD Secure Processor (ASP, aka PSP). By default, the key
-- 
2.55.0


