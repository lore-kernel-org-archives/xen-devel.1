Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3C606A33F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=m6NOUMAd
Received: from list by lists.xenproject.org with outflank-mailman.1496492.1694992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3OD-0005mc-5Y; Thu, 19 Nov 2026 14:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496492.1694992; Thu, 19 Nov 2026 14:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3OC-0005kf-W6; Thu, 19 Nov 2026 14:45:28 +0000
Received: by outflank-mailman (input) for mailman id 1496492;
 Thu, 19 Nov 2026 14:45:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xU3OC-0005Zh-2t
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 14:45:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU3OB-006FQO-F8
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 15:45:27 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aff0b77-bab6-0a2a0a5309dd-0a2a4502cfd8-44
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 15:45:27 +0100
Received: from [52.101.46.34]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aff0b84-4900-0a2a45020019-34652e22cf79-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 15:45:26 +0100
Received: from MW4PR04CA0138.namprd04.prod.outlook.com (2603:10b6:303:84::23)
 by MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 14:45:14 +0000
Received: from BY1PEPF00026958.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::78) by MW4PR04CA0138.outlook.office365.com
 (2603:10b6:303:84::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 19
 Nov 2026 14:45:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026958.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:45:13 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 08:45:05 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5FLnmDUFNwnvBlq/Nj2JV5lqk09Swou6TUOZvMA+pz6/98xrUqSBJ0lKLzBNOiZYwr836LC7MlS64p7K3IaFzQX212jhz1xVCdGzqCBblIqad/ZRobPktXkYOaLeAQr3MEs6q5MHvyFsYjTORdEYdZFDsmgtfduXf9t7Jm0JG2l9bKOOh7V0s45x2yHw7KA0rrCW4pad9cpQ0j0a76u8/0c60f+ANwoiJmIxodm3cofZtYVQUE3L1ye3YFT80bA1ofEelD4BdinmhKPDSpOeqEGYU44AMLVBy2NcJNVun60Sza0fAo/b21QQTOq1gz9rGmpSd6SDM48eSQzyutK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uMhTdlC3QVnr2qQ45yvtycEJmf4EIb/IIsiSruJI5g=;
 b=AU17HiW8laybYGk3B9lWT4y/VU8LY+3CPNQ/Bj4dSBjY06wSa9Qs2Swb39n72DOyS+uyiOdZIIs3Uv197dyKfXtLozqP4lhKcb54cIcDuE39bg+qlfZlGDHBD49m6GOMTOd1aK5MCJlDUczzLZajNUtX/enMgrG8oWE9xvoes56mir6JJ+9m3NqRYSfGxN7uU1yqJyLXrD73AArfYo+R+GLwKRjrHFsu2biWldYz3a2BVOwck/Iiw1go12Z2amTO3Z7+pl9L2pyw/TFEYppxaJyOfUjx7iBDJsbp/vdaFJpmC9XAj3YQ4mJ7/y4TkmBQHXsGJMCu/0ST1fv1if2QCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uMhTdlC3QVnr2qQ45yvtycEJmf4EIb/IIsiSruJI5g=;
 b=m6NOUMAds/3XZ97WFDzbDcf46loJmMoSTnlgIyyELiSuZw4L8kbjxapiyMJHjkkWXXGtWkihezwcdRDtK7H48kYNVdt6DFNYqJdad2ZhdDavIJ099HWLpc/aU5BKjAnEXgbKd9caN5SYTBGPAVkV0PZNwQRlfW/jtq+9dcl8aR8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>, "Nicola
 Vetrini" <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [PATCH v2 0/3] x86: Add in-scope files under cpu/ to MISRA scans
Date: Thu, 19 Nov 2026 15:44:47 +0100
Message-ID: <20261119144453.529009-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026958:EE_|MN0PR12MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d047d8d-dcc7-4858-a695-08df464bb80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|82310400026|36860700016|1800799024|261022075727099003|261102123227099003|10067099003|261026121527099003|260925021911599003|11063799006|260925022911599003|56012099006|261026140227099003|260925021311599003|261021123027099003|261022105027099003|261021121427099003|261028144727099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NTGla2YORs4hVdz4KX5k9KaNdxzm+lU4Q+/uEn3sOGuKM4qFM77bOSB2lnSg9PK06DJyM//YHJ34maGNgFT4fdWEgd0x+BuxH1TH8SfyVG4wXQZouJ+fostdGNBEPZ3HbpLo/WHpVZB5UgHDrehd6BpKuNTSNpwPNDZlkdVhTInLQAmhWVcpR5i2YSxDqVcDeT77ncFxWoBNmJW0A+kB9XvQ5Mkhk49SIpRemQbTfSQaJYoSGf1tyVEoOsy66nMepIzKlo0SBrOUJKaXOv5M9ywTMPQ4blLFJ0Iku+KgOWIg5xVsyfsv7dLIVyEUW4gGUmMWjwZlO0KIUzUtu+jo/FPS5QTZ9h1QRznLGyW7aoQAg0Sp4r0ZcXIQuztkiS/luUtjRfRghZQTm91Ax8NPWtwVXNUx3LMGLshmne9EnY1kvvG5sBm0DDvs6YFXLgHG7BSFubnce3ocM+foR0/RnC5LRflH2xiDQygRzA9QOxv1oETgMT9Z98EQ9t7lyYpbYSGBV8rWgwxb9Q0u+sKxb3VtaoQixoRcue6duWoWtLDfU+Wx1uORw9aHXuNfsbPsnHNjFK4JMweiN85SN8cx2URloN4DV4LnnOjS6Ymn0AhhDQ8i8AvX3fBeQ7MNBMTUzUFmKUzfZQIb0YoX9ow9wAbvDhRLYbH6xfvnVvDXFjo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(82310400026)(36860700016)(1800799024)(261022075727099003)(261102123227099003)(10067099003)(261026121527099003)(260925021911599003)(11063799006)(260925022911599003)(56012099006)(261026140227099003)(260925021311599003)(261021123027099003)(261022105027099003)(261021121427099003)(261028144727099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xaf3btZ6+2DDSohLeh8+SwuovpJuF9+4Nq4SxfN30vIzfZCU8na3DH/OMmwCdJdTf3fRvd4qV4tn1HRvlKBA20YWywmW68ybZcV7T6IeYPpklNr/I1fCmsLRekQJhyv7vVoRgOD9CDjoJ6aQP6Oa8RTahxA6E6YyNFqXhjDfRw9kZ4S1n7PPSLJmKcPMrIh9btXU/fn2E0ieGmQYhRFDBVjN9+EcOwKR/pTFgKBQ9PKYt9z2Ablo33k8+AyJHAm/807LoUblkS+XMQHehvyG2MtCi5A234VSOXK3IHRlkw08L0h96L4yGKhubcXmMmr8xRyXJSOGREQEcbinOz2o2KXzqLiSs7CPPDOvdJ/3iuRJq8DxADcdsyna5LM+PXfyh8oG8xCxdOz49l8QNlXYt6rq8AtmpshE9+CkGYHTHckmCKkM0xGMC6ldcmBKj1ii
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:45:13.2938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d047d8d-dcc7-4858-a695-08df464bb80d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026958.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102
X-purgate-ID: tlsNG-720697/1795099527-F91236C6-5D80E9CE/0/0
X-purgate-type: clean
X-purgate-size: 1944
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

v1: https://lore.kernel.org/xen-devel/20261118171758.1125066-1-alejandro.garciavallejo@amd.com/
pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/3089539179
  (slightly different. fpu.c has different macros, but functionally identical)

v2:

I've reworked the cpu_has_amd_erratum() function into small helpers and
brought the 383 erratum in line with Linux. It turns out a mistake was
made when merging it originally. OSVW is gone and bloat-o-meter reports
200 bytes of net code reduction.

Original cover letter:

The files under cpu/ are excluded from MISRA scans due to their Linux
provenance but they aren't kept in close sync. At best they get
semiregular updates (mwait_idle.c), but most often the files grow with
Xen specifics bops that get a free pass on MISRA scans merely due to
colocation with ancient Linux code. Some files just were never part of
Linux (hygon.c) to begin with, which makes the blanket exclusion even
less credible.

This series brings everything under the MISRA scan umbrella, with the
surprisingly few fixes involved.

Alejandro Vallejo (3):
  x86/amd: Consider only Fam10h affected by erratum 383
  x86/amd: Drop cpu_has_amd_erratum()
  eclair/x86: Scan in-scope files inside cpu/

 .../eclair_analysis/ECLAIR/deviations.ecl     |  3 -
 docs/misra/exclude-list.json                  | 36 -----------
 xen/arch/x86/cpu/amd.c                        | 47 +-------------
 xen/arch/x86/domain.c                         |  2 +-
 xen/arch/x86/hvm/svm/asid.c                   |  2 +-
 xen/arch/x86/hvm/svm/svm.c                    |  2 +-
 xen/arch/x86/include/asm/amd.h                | 62 ++++++-------------
 xen/arch/x86/x86_emulate/fpu.c                |  7 +--
 xen/arch/x86/x86_emulate/x86_emulate.c        |  5 --
 9 files changed, 27 insertions(+), 139 deletions(-)


base-commit: 92ddcda17fb00020c6215d51df4c6a25d5eb0b5e
-- 
2.43.0


