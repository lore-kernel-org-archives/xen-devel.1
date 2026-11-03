Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626AE606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=E8fPJFl+
Received: from list by lists.xenproject.org with outflank-mailman.1469811.1678575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEjB-0001wI-05; Tue, 03 Nov 2026 13:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469811.1678575; Tue, 03 Nov 2026 13:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEjA-0001wB-TU; Tue, 03 Nov 2026 13:39:04 +0000
Received: by outflank-mailman (input) for mailman id 1469811;
 Tue, 03 Nov 2026 13:39:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOEj8-0001vh-Sq
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:39:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOEj8-00ERa3-7x
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:39:02 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae9e3f1-8faa-0a2a0a5109dd-0a2a4509ec32-12
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:39:01 +0100
Received: from [40.107.208.54]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae9e3f3-be1a-0a2a45090019-286bd036d5bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:39:01 +0100
Received: from CH0PR03CA0285.namprd03.prod.outlook.com (2603:10b6:610:e6::20)
 by DM6PR12MB4249.namprd12.prod.outlook.com (2603:10b6:5:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 13:36:54 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::aa) by CH0PR03CA0285.outlook.office365.com
 (2603:10b6:610:e6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 13:36:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 13:36:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 07:36:53 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 07:36:53 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 07:36:51 -0600
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
 b=FVs1mPY53ZQkrA1Kx3h8RYWIXq0dRwQh6GUwJWj+JILAQ/bTq/zHK2ZJMcZ6r22uuk+4kje3n64WsMLe6AtYQKnOzxofSd8OClAkxhDvOBTURKtPPWmdHck9vFuUKWHyvkhUyttUdikAg9sXQn70I8joeM6FSuJ4TlnfiygGa+p1z+naT7fbp0KfvwRXKdhoartdGnPbU5aFnS1dR2OmtNMHbYxatmXzAcPC2VD39lc7tyIeTkkO0lce0+IT5PIoF/rK4W5/hkjoBhkkNUCa4EgFe3dbdugiN22QyKGJ6hTMC5AHc/SKOo7q3h/wd/bQGoGL4PP8V6FK05WFK5PYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLXxDDzay/XWPULdaARIIP1hK/MDq+md2UPipBznMkw=;
 b=QvjIglebux+n6i7j/efx0vYJ3PaXFNJLYsCEp+zpyGuhjNe5M1HTUADx+N+2G3X0vfSNoYElQfJotIVx59p9yid9CjxcNeIFW7aAcivX2XEs3ree1J18zTOh4v9XDx1RK5z33iqSJHLRUrSzCCliLwrlMRROWRk0pHjPUakuOEXdm2kJMCVNTjZ6hGg+9xTGl136uFuwqsOvJ4Hze6S70+XKKUVIcIF0MVi3kfCl+905KRfV32q/P3n0Yg9DMDNdGeW0vUOyH/DHRfPYaza9IAQe+M79HmjQiI8TtXyoXOsAb1x2QEILVwOiFnMTviRS9x/iI42XNvnNIq2WHHFLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLXxDDzay/XWPULdaARIIP1hK/MDq+md2UPipBznMkw=;
 b=E8fPJFl+zatugA86FIaLkCBKDnmGMwEHNCz2grAXa79O8csFBemsLp+s4BQtNU4P57LRnijZqC9OYPhma+bu/q2c1npcrXO0S+s2o/Djlg/0A4nCcRXYss3sc2pqBahP1Jh/gJ2K34CxNy9dYPz157H8bZlauDCAQgzALaedMjM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <7d7331ee-cf95-46b6-8640-690ab0add758@amd.com>
Date: Tue, 3 Nov 2026 14:36:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <f8bf3e87dac3bcd0d8ea680fcce055c133aa9e87.1793374283.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f8bf3e87dac3bcd0d8ea680fcce055c133aa9e87.1793374283.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|DM6PR12MB4249:EE_
X-MS-Office365-Filtering-Correlation-Id: 83eefa89-d96e-4ce5-e484-08df39af863f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|1800799024|82310400026|11063799006|56012099006|261102123227099003|261028144727099003|261022075727099003|261022105027099003|261021135927099003|261026121527099003|261026140227099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 RBqAZ8dDfScDKgyzqiphaqLDVHrx2vMFr4W1bcnAWV2K9yj1JD9CiQzvO3HcW+KmVJu1ffsO1cQ1FZs+FfUAcRbUiy5eDSZeUdr2W7oeI50Xj359D1o5nxZ9wySnZcff/xGQeRX15/VGrDYhN/v1kZlsUzAd98PrCYSRc4SHdhUMRHMCl96Znf90rfRhFrknm6cLQmXmWd9/MB6Mo9oyxH/8NuZpkeYHIMkIP+PukTqqImhQcLKYg90MCbcy2gE473fRGBu4ddcT3uz514xx8HK16VLaMUlDaH7zMSzfdTrBH12wmoGPO5WPJpPAd9aJkkMnd3W6hB967SQv6XB3VQHhUXzXSa2jIR5t+etvv03t92o3qlt6/pyld/5m6YMSGP3rZ+n+jnPXVxmdOl4Rg2CgFhZ/+W7SHlM5ggX9zCZc4/C/K4nOnlmduhGJ9ioeYzIMEd01KauW2IyYUGR/8CzFbTH01akACFcJQtMQDF0hVAJYZUsg+wVvBEDAKU5z3VcpKpFcmVPYBOYYVSxPWpM3CxFmRL6xETaHIHW0PvnlKInsetoDBjBa44gfm9+Ox6rpoUPzvP6Mgj2Llcl1GV5fAz8seSv1XXH6lg0sgVB2Qb1mgK5GxwGg2rPj7lw5pI8BAB/GPh7Mbtz91QJ7WQ1D9RNUnsKY61ycJDHXyYiXe8la4vdmRz2ZOirYdc0YpjBk5kfsTUVUKnWFlGWUvg==
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021135927099003)(261026121527099003)(261026140227099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 BO9vTPCc2dxEj+MCASN+nD4OP+y2S3ggpKdISWW4dkHNf3Y2bFN0Yh+7eU4IKd5yQBl85pjHY8sxWgMM71I9O/Z1NqiysNErRKvONuEA7bS9bDBhlLavyrO0eq3+fNYjh0GGnkBzLwDkcUu/GMARESutaxRdtEJbvlKm1fJdMbGHBhUWAJoLlVhYilzZDlnzVBzu41NmXKDH3rgw4Qf6lfTbKRPMpwQJ6B31AuC7AhotbP547T0yQVU+ZFdd9AY9t4WkLW1BwWvfB1zML9vCils61KF9YrpMEy09XPT+jnVpvogvyzq4GcVfDyUUcD9wbDRGwJUNFW94tBCBQnRSrAEBelRr66l+iwQ0IcmRncm0MlPrVhi/sVle3D4Kv7Mp9AOeyTdJobxuXx+Y1uWUEUv9OET/CS8eRd7aR/5Gi8w1QYGv6hpgS500nWYmZEUn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 13:36:54.3838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eefa89-d96e-4ce5-e484-08df39af863f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
 BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4249
X-purgate-ID: tlsNG-bad1c0/1793713141-FC610034-519E345E/10/78276251493
X-purgate-type: spam
X-purgate-size: 1793
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 02-Nov-26 15:58, Oleksii Moisieiev wrote:
> Introduce HAS_DOM0 and a default-enabled DOM0_BOOT option in common
> Kconfig. Arm and x86 select HAS_DOM0. Expert configurations can disable
> DOM0_BOOT; this patch implements the corresponding code exclusion on Arm.
> Making x86 honor the option remains a TODO, potentially as part of the
> Hyperlaunch work. In particular, x86 still builds and boots its legacy
> Dom0 even if DOM0_BOOT is disabled.
> 
> On Arm, exclude legacy Dom0 creation and its private memory, vCPU, SVE
> and LLC coloring options when DOM0_BOOT is disabled. Hide DOM0_MEM in
> that configuration and disallow ACPI, since the alternative dom0less boot
> path requires device tree. Keep the x86 DOM0_MEM setting and dom0 command
> line parser available until x86 honors DOM0_BOOT.
> 
> Retain the domain and hardware-domain builders, guest SVE and LLC
> coloring support, and Xenstore domain setup: these are also used by
> dom0less guests. This is a switch for legacy Dom0 boot support, not for
> all control-domain or hardware-domain functionality, and it does not
> claim to remove every unreachable path or establish MISRA compliance.
> 
> Check for dom0less mode once in the Arm boot path. Otherwise, create Dom0
> when supported or panic when neither boot mode is available.
> 
> RISC-V does not yet have a legacy Dom0 boot path in this staging tree,
> so it does not select HAS_DOM0.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

although I think it would be nice to update the xen cmdline doc too to mention
that dom0 options depend on this config option like it's done in case of e.g.
llc coloring.

~Michal


