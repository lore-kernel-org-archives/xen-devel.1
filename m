Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F09C982C4
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 11:54:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422832.1648161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDl-0003n0-5H; Wed, 16 Sep 2026 11:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422832.1648161; Wed, 16 Sep 2026 11:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDk-0003jY-VD; Wed, 16 Sep 2026 11:54:36 +0000
Received: by outflank-mailman (input) for mailman id 1422832;
 Wed, 16 Sep 2026 11:53:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alexey.Kardashevskiy@amd.com>) id 1x6oCX-00033Q-S2
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 11:53:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6oCX-005ckC-8X
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 13:53:21 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 6aaa8329-e002-0a2a0a5209dd-0a2a450594f2-20
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 13:53:20 +0200
Received: from [52.101.48.58]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 6aaa832e-4cb1-0a2a45050019-3465303af8eb-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 13:53:20 +0200
Received: from CH2PR02CA0009.namprd02.prod.outlook.com (2603:10b6:610:4e::19)
 by DS6PR12MB152050.namprd12.prod.outlook.com (2603:10b6:8:410::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 11:53:13 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::6f) by CH2PR02CA0009.outlook.office365.com
 (2603:10b6:610:4e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 11:53:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 11:53:13 +0000
Received: from aiemdee.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 06:52:49 -0500
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
 b=DYBwkp72ulVUxF0lRt6GqSmvMXRJuEgchxPBZV/zlmhjFqryWjHMaYuPxYbaNEDnO4QJks2xk+oc9A9ndQr7YmFhO+NF055lbq0zdSj7NpghIoxft6CM/AwqJ7STor8ECQhDY863hoe56iY7QuqZIM97lBhkNg9SKq29wTy0wiw9s++TkF7B6zFbMvVBVvAj/NHVbEdLlWLM/j+NR67vn8g1Sf8o1NlAPy0TEbNNyCy1Scgj8r+Hx+P3GGavevg7NfeXesR9NPGOyW00QWVftoO1tpwsv1sSCEh+B2fV6elySji0oGLYe95aAyYxHDKAy98SCchlKTkzpkdaqKFjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SY2PXIfdH4gQPL2ZLaN4rYd0hBg60SV0RgUb/GbX15c=;
 b=ULct9KQj2LIhQ/B/hbSpdfU0x2GV/D2bWqLj/X1urkO5IZ0QSHU71OHI17z+INNJnIJzalFrcBRmNvkI7J2m8/GrbMcJbOGYdS5XqTEaDe7YB+O8bx/yGrGa6r+QfHZ9ZqVLOYQe6uxFVPIJJOGdeJODKbpCiEYmTQuh2qpVenYQ4dwIXHgF2O08hMAMEwzoPi2ZqHkDTq+pqTHCMrdXTz/Rh40AmQzwbMjU2ifmLIFtGmRI9Y/GuJEVSIfzmNeVnAKMaT3wKva1auS9TFNtbhGKSl76LJCT4cwmNI25BkNiMdgtbOSeJX3HJDfl46BTm/Jl0Ko7zFWyWEY4XohYUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY2PXIfdH4gQPL2ZLaN4rYd0hBg60SV0RgUb/GbX15c=;
 b=N0hikTVZLLlKQRQ9LljQNzVBYbzKHH0cYxZSKI6Hs7pNoviNSEjKHhzWdLDlHjsbn73c0xoZU6VRevsCcGmPydi7mrdoPBzv5blnhya4oMO67gLF4YjYQYkks0qMDyMH3CTQuolNJzfUJ/MBaLhFG8bA5Ui6P5aQl5qA7zDvPmg=
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
Subject: [RFC PATCH kernel 01/17] pci/dma/tsm: Call disable DMA bus hook on cleanup
Date: Wed, 16 Sep 2026 21:51:41 +1000
Message-ID: <20260916115159.1938195-2-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|DS6PR12MB152050:EE_
X-MS-Office365-Filtering-Correlation-Id: c368b172-fea0-475e-27fd-08df13e91646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|7416014|32650700020|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lTbYfoL+zluMIQcZMX9c7spGZjQpXCynFv3y/cznROcYIxht8DJBw5ZLo8zGEnnTVHWw2qAb7J2BwF5bOjDhq2N7DkQjd+elST2JCWUXpyO/R7ixu/Y59GDjQCR/uX8ZJ+hoCcjGzuqzxqwPZXIA6Hk7NfEDjKLWbuLEDawfl+W/8sniBWPuDo0SLKRlToGBM4tAHn3wgj4XNq50zxnhK9OWU+/Uz7JOxe0eq8qmeAsPXaKRemotGofnQnu8ao7ULnXSqcvYntuzx9WaCWFn78Y/xe3xyWBxlXjnLOeKMRPYU8Awk5LhRYyxlO8X4icA6IA0TovktSJsx89DNS2jZ+rz2QQocNbqmXHIPUjolM7ehwfHWGGircyk9GCfbwD5P/dinhquBfDUpmQOaBvDs/hVTZdaGTRt4GjnIM16Z0Qh9iKRtXw83BfMmVUMpUWdhLJDb4aAgV/tvLtChQNrN/M3QS+2TyYtxV4Mr6aAhHGRBzZZ9WhPAwr2MBDMzjUvo/C9cItn9SfcwirGV8FnAJQ8SrGXwK/w3dUgRGcXKqar2Hycqq4M/oDb1C4fmeZKQ/PM0JxtOO3H6wDkXhq7aF/cV6gI7TNZEN09Ydt6mnEzfpGmAI96cLvtJ8/t5fmTuHmALW6bARpQlwaLinJNEk+/A9eLsr+jqbuksFvGyT8YqV17Z36rwxQPVGoerdCHYcA8GGykuJuX3HK9WyMQSg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(7416014)(32650700020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8Car1z4HpXq9pf9mgugQAiDX2M+RvASwLDL9yQIeM+kN/l86aDUJkLlLhXbA7h5FyKBkYdpkEvfnzFtAY1ypdABOLbjCcnRxFBKj2AqHYp3MJJkkxZp84M9m9JgKaBp3rXD4byWsdFprofXiibB3C/Aqe5xf/4+mDSyGncGAsfcoYA69DAfAmCeT0Weetem3fMELGDOK5EChaoFW5WWc17UwY4vkz4nFMdZngDqMXJiDZL4Jz7mkbzgsggHXldh7RY6AEc9zJSlma77wuBATEvSpwK5DjBoSX/o2xKHp1XmL2zF2qZ3AVtfjXHVaJg3js5x2DOxzUGU7365U9zN119sIeHjs9Wk0BELZkps29710E9Z5yecIj4dG6BrhgdrlFzWsRus8rYj7S96/IwFvQzh7ArrzAIHx3s8UCRtb/sMfMykBapwtCYQpoVQ3QXGs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:53:13.1361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c368b172-fea0-475e-27fd-08df13e91646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB152050
X-purgate-ID: tlsNG-c201ff/1789559600-F4EA12A1-BBBCF8F7/0/0
X-purgate-type: clean
X-purgate-size: 945

Since XXXX ("PCI, device core: Add private memory access for DEVICE_TRUST_TCB")
the TSM subsystem relies on the PCI subsystem to ask the TSM to enable
DMA.

That misses teardown path to disable DMA, add it now.

Fixes: XXXX ("PCI, device core: Add private memory access for DEVICE_TRUST_TCB")
Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---

Squash into "PCI, device core: Add private memory access for
DEVICE_TRUST_TCB"?
---
 drivers/pci/pci-driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index a036f3d7e6d5..633926b55da6 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1739,6 +1739,9 @@ static void pci_dma_cleanup(struct device *dev)
 
 	if (!driver->driver_managed_dma)
 		iommu_device_unuse_default_domain(dev);
+
+	if (device_tcb_trusted(dev))
+		pci_tsm_disable_dma(to_pci_dev(dev));
 }
 
 /*
-- 
2.55.0


