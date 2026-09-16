Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C5C982C3
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 11:54:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422835.1648190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDo-0004iK-0i; Wed, 16 Sep 2026 11:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422835.1648190; Wed, 16 Sep 2026 11:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDn-0004hr-QB; Wed, 16 Sep 2026 11:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1422835;
 Wed, 16 Sep 2026 11:54:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alexey.Kardashevskiy@amd.com>) id 1x6oDD-0003BS-H1
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 11:54:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6oDC-00FQZN-U5
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 13:54:02 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 6aaa8344-8faa-0a2a0a5109dd-0a2a45088c30-44
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 13:54:02 +0200
Received: from [40.107.200.25]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 6aaa8357-f659-0a2a45080019-286bc8197473-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 13:54:02 +0200
Received: from CH2PR14CA0052.namprd14.prod.outlook.com (2603:10b6:610:56::32)
 by CY5PR12MB6250.namprd12.prod.outlook.com (2603:10b6:930:22::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 11:53:49 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::45) by CH2PR14CA0052.outlook.office365.com
 (2603:10b6:610:56::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 11:53:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 11:53:49 +0000
Received: from aiemdee.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 06:53:26 -0500
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
 b=VTzZkWUgFSGTYEdYEZpPOMaVLEQhmQGq7QBUMCbWzotJQ27rAtQmjDP+9McdJ3+Qz/sUzSQQjoEminnXngDsnhUJLlmos9CTi9EOAycBw3LsUI+zk3luYdwCLlE+Oe7i+JYlp2ZQ14EDq4im4zIzlwZSdkGOSWlwn2CLRDnBfcKqUrE85+Vpfz/lUKwLFpYRmN3IsBcsTUPU7RDHs26AlbBReDMo7zlSilA6XdxPsEmUjOsJ9BjIhgNMQ7YcmrlnoW31AYHYVzKdK2MnDutinTdg19jp+cYj5iqut87RGiOdLEHW98ZsbKc93pfB3xGks/qX24tShdXW/8QwrsEmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdXMPNC37iRVDCMXKNEKZ2ifmpdSeHtP/V7TZt/SDC8=;
 b=Fe+LOHyb0f3R9Z0gTpvD88qAkXG6x4cnFREewCHQdG4dkhPWd65F27J0tmrFme+Pj8b7EvY9Ah38aOWwEVXKzeI7NsVBKxTw+RqBShVu20bRGfJLBgcMUI6CJIzS7pfFAX19ogoeC4kRD8ddrwPJ0gxbMEQBE1XJlIOAqIiRrZf92UAd8DVrGVBwVDbmzDPd1F6jBZSUc1JC2ZXBtsRM5n7mmDHgTE9TB5K3Ch17IfAYpmnPTUk20P50+CFRkOFzvR5PsJIF5KavfoU+KbFr/zuPtUs19Ot/k0oMD5Z5PTQbaHrjjM5qCOzl1L87SNMqYSplg1BH8YuVyrECFZm+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdXMPNC37iRVDCMXKNEKZ2ifmpdSeHtP/V7TZt/SDC8=;
 b=fUWyDB4dKMWU3pNQM64UZ9R1E/1jXAdN/6P/dqK4FcokxpkI+zEkkScVU2SfrKYX32Vo9B8woMqS4wyNWcYEpzYehswUcnIGfjkhWsaszP7Jkdgt7lWY6ANDt4/u0I2m5bxDYCjb+gap9sRWg6r/Xii3Tt1llCKdN/HIt+bP8fs=
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
Subject: [RFC PATCH kernel 02/17] pci/tsm: Fix stale comment about TDI report range start
Date: Wed, 16 Sep 2026 21:51:42 +1000
Message-ID: <20260916115159.1938195-3-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CY5PR12MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 368ef6c3-44c2-4fa8-6d72-08df13e92c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|32650700020|36860700016|7416014|82310400026|376014|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ty7fn9JOkvoiU24GPVZ/rmNQytrpaC2dhfMBHPhdzS00TZxP9WBKw5etuOyR9/ZWu2XQfWBGWkSaF7tmlvVKeZVMvFiZkVZMV4lOH00MqJdO9voSL4Z68EVgz+FY7R2pGsVQXtFvURVAFu3q8u+dl2exxvwB4eVgYe7crcTdoV8lr4hd6eN6HnmO51qX7eyzMRPLXQXQNpURKRaHOF99KIKMRwPmtBUm8LcvkLDBJiroyx0MJkncpp/0my7FU0IeQifDlirZuH0gXAkKO+gAG4rN5DP0MqzLs0MQvLlj0h6ezg+H7sF2QWO/jlQe8YyxBU4kitrVIvjdpTkls/SMRn1Ct6sKSCcHdHNzUeaf4cJFSEHdTirh/hwtT3jZv83FslMpXDnVmgKLD42MZqWNV7/fhFliSMJmd/KwGx7MD/i5gAUminPfEZJpsqoA/LtMtA2aeOCPpy2vdix3tbhjTEnASLqkdwmlM1tE3izZ6lEYqRwHCMepvS355O5VwM5KrvZTyuWEWSkAxSwuk96DQY1xxl/Mztr7El8q3VdfsPesBTpZpg869xG0kx9Sb3vMBVcI64R0d6UN+AkUINSbNwiCwk1oRSqtT1yx4UK0CpSEK3b2ZSK1WkVzcVSFu+JFKuS9aivdEPiiJ4QjM1bBZ/Nimxhbpia/x+La9XIjb+wOKtwQzkEnCmwTnYNLIKN1LLzOs8Ia79FoXUsN8zAgpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(32650700020)(36860700016)(7416014)(82310400026)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1EwaPy9VnUgtfRgZAzstYDIfAgiTyXKXlbJfuTIyKOwSN5Prp96/PGgZjfYrQj9CaYl+G7vqsaWOQ7FjVnIRoOEruayIAheJjkTsvujYuDKm3S69YPRakGGFruhoAQfg0sSGIyUf3X4ekMEq/dKreWVi2JuGOz+xy4UzjtJYPwmKb4TdsKkd5b/9XT/YuYhcEbT5JWftmCA0MB/ESbaAT0fma4wtJw6R/G8hNQMqCdAbxjQIUDXCTbd/73hpaexsaV8I1m5M11Ady04jbTZNDw1S2tNDcqky+Ufo0UenqmrqC0cVkZaRmr3LOy4h4AIHj1e6qnbhY8WVC5YGb2ZgrAmw/V1aB93n1bLO4VB1r+zul35eBo4BtftZbYjuuVXsTS9AtyCrVvVX7Y9yJ8LxKnHqEtHB2RNplComEIpjTGDwUzE/bRbIoJZwe3qv6nwP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:53:49.6782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 368ef6c3-44c2-4fa8-6d72-08df13e92c0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6250
X-purgate-ID: tlsNG-c1860d/1789559642-CEF5F87B-3733CAFF/0/0
X-purgate-type: clean
X-purgate-size: 846

The PCIe spec r6 and later defines the MMIO range start in 4K units which
was not the intention. The upcoming change makes it a byte address.
The structure is already fixed to match the new definition but the comment
is stale, fix it.

Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---
 drivers/pci/tsm/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/tsm/core.c b/drivers/pci/tsm/core.c
index 9ac216ad896d..2a18be5be56e 100644
--- a/drivers/pci/tsm/core.c
+++ b/drivers/pci/tsm/core.c
@@ -623,7 +623,6 @@ EXPORT_SYMBOL_GPL(pci_tsm_mmio_teardown);
 #define PCI_TSM_DEVIF_REPORT_MMIO_ATTR_IS_UPDATABLE BIT(3)
 #define PCI_TSM_DEVIF_REPORT_MMIO_ATTR_RANGE_ID GENMASK(31, 16)
 
-/* An interface report 'pfn' is 4K in size */
 struct pci_tsm_devif_mmio {
 	__le64 phys;
 	__le32 nr_pfns;
-- 
2.55.0


