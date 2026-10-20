Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F273606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 00:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VnPQbHIh
Received: from list by lists.xenproject.org with outflank-mailman.1455059.1668598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIxa1-0006ai-8J; Tue, 20 Oct 2026 00:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455059.1668598; Tue, 20 Oct 2026 00:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIxa1-0006aa-3B; Tue, 20 Oct 2026 00:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1455059;
 Tue, 20 Oct 2026 00:19:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xIxZz-0006aU-2N
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 00:19:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIxZx-004kgc-1F
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 02:19:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad6b305-bab6-0a2a0a5309dd-0a2a4505dd4a-44
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 02:19:44 +0200
Received: from [52.101.56.47]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad6b39e-4cb1-0a2a45050019-3465382f9191-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 02:19:43 +0200
Received: from PH7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::22)
 by SJ5PPF0AEDE5C3D.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::989) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 00:19:39 +0000
Received: from PH2PEPF00048912.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::10) by PH7P220CA0005.outlook.office365.com
 (2603:10b6:510:326::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 20 Oct 2026 00:19:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH2PEPF00048912.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 00:19:39 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 19:19:39 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 19 Oct 2026 19:19:39 -0500
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
 b=bhyJcQd7+enHhmQexFsICoPyMGhkP9eGAA0MjVBoHaifNsy8sjD2qowTG/t5w/+2n1W6mDaJ9UEH6aaLnH5my1lKPwT9VRneLlU0vzIGNasD27kq+B8VTXY5R6VjNmguXqkBW0AxnR5zE4wsOqVgR0BqTjsHnTDXg3mRX8jBruSoSTCiiUknn9fZJTq3Mi0+1t4Hm/UeSV8p1f8YvKYiIWYGvJH/pfy9Akt/AqsO3SHE5zNf9TSdQLfb0+7PnibGa0upIR6Ah4KdYHBs0DiDbYrve5zf+6jm4WPyxr3BGVuRlRVznXGIHu0+3bz/5fPS+I6JFjaa0crSAnA1AjYI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7LrlnJ/bLEiNsjpojKGtMT9OmPmnZ1EUDUytplQVGg=;
 b=cNV07n5pKBk6rI+qozrvPbru6Sz3BTJu3c4FR25YlhxnUqy7TxeF95fs4Natytdviy5jweujW9AvDOAE89fA3D0f4DEUbQtHqYroreSbqwu7TfJFED5xgHkMFUkcmQUSNEtPSQkQOP51G+cbPGj3b6hMPlcxjOCdFmcumhBaBKlUOWUaXsxJNWQqSsw37kU//rVjVmxB/XCVhyijC2DGBS8TGpCeaCnYQD33hs0fgK1a4LE/TaVwnm7jCyxHOT+TsnwlRgIhwed7IXQZsuI6LjHsDtrlfqWr6ejAIiCIDm4MQhMWJKguVsoEMnCCMHpwqnJQ6GWhM2dqAeaz7wCA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7LrlnJ/bLEiNsjpojKGtMT9OmPmnZ1EUDUytplQVGg=;
 b=VnPQbHIh6MK2m5hD1nwYOWiqKG+49DQw3DML+g9tPxVQqTe8uFwVSpi7hI8QY1FcmSsGnLs08Ns+i33MXHCJL+NmTL3ibpkn8aXFUk0AxgDvN9jLyYTzox+sja4Jy9I2jdIp22GppdWDy6p2wImNm2+FTRS2HutEN1PDlczEDpQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d61bc856-3224-4a92-8237-c6d5318bc441@amd.com>
Date: Mon, 19 Oct 2026 20:19:37 -0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] vpci: add SR-IOV support for DomUs
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <8823cd01334978baea19515c35068c789d4568bb.1792072426.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8823cd01334978baea19515c35068c789d4568bb.1792072426.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048912:EE_|SJ5PPF0AEDE5C3D:EE_
X-MS-Office365-Filtering-Correlation-Id: 36babd3f-4968-4f09-5f24-08df2e3fd482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YvEvS7F8u9q0sU4J3C9Bu66nv9udsO4eD2MFd8KJgo5diXqal1hkobsaKwxwG0VPRdFMPasPLZ/mOPyDsi70oZ3Jo0gOdlvCXqupt0NrpsNg6Kl6LN3AiBkow44UqGppEA2tnWLDWjjqFn7N6uKwDiZZ7/A5nnApeNPzb4yE/LmdUEwzBMUJEr9xtlGImZtiLzsAQdjqSdPHiF2FEHz6fYJJQQHs78cTUYQN+r5KUpBV7+pyYwQbbeh1w1glZh/FQ80iegiAj85ywsW6HirTqG8+bl4npVweizmFxSZbydDtJthL1ZY2fyQr8Ue5TOR4ic5l58STc9tcGyM/23VVeVhc9S36W2N4u87stBx8w8OBHY/6BseSn5g1YD8GJGuSn3xtTvTFE4dW+0iUGt5GveuXT5UBiKoytIMMuNcHH8Ja9jdFSQ5aVFUcJTKhUeMKQABGQVGK8Jvb6xQjIH8u9upCBYPkXcU7wrseaEnHb970AdWkD0yKcLwpNS9R7kwjDU7UW3j1kYvvqT5fWzZ17Hgs9Ewb5YpjeaqGWKTDPuOu69GNtzdofCte//BkeCIuFG+BCWtlePi26Mt+yeidOEtpQTVwjqoZa9LApKLFAWiWiKDWPM7zCCHoVJX2oYzPIrv8sNbCYpCFLlm6Fnt2war8QYz5EjbDsosUjxEP7T/jmCCYaxkIbu/iT6FaUVtY2bHmnIHMHQDwyCqNvx9qzw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O5tJ6EVMLDDL2W9QBJ35bB2RRYIgWvziaRSXYQBsbFeioRO5t3utVvv9QOz3kE7cDG92qsxBsTd5UrMM99kbsa++2MocpOxR+OXpb8IpXuEZfVxjoM6VaqcFOLSOyZCs1gWCFqMTwH+IsgyPONeVEo2TIBt45H+QT90ONOFmFdhMGpk2kmb8SyGOjUbL3XY4dUGdf8hjELBIugpqjSyFTfGdfNq8a5XoLzdyEeWnmpE8h2490WOKPkgr7cqHxn4Ji/aIRnIGZNLgmg1LaHoVi67CnBpuNMCPQ9XhzEM8jbXESEjLG3zWD8HOdmH79LXWPbKPELH3DzS4dX3t3uYox8w04E6JqqIBDjT7Z+JzCvuzryUw3h05X6tGoEA44bjrQYlUCeOP1yKKV+oR1psIUloOfcIsk/FS6h39eNoiwhsoK5jrvXGnrFtghI8wLTGZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 00:19:39.1909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36babd3f-4968-4f09-5f24-08df2e3fd482
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048912.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0AEDE5C3D
X-purgate-ID: tlsNG-c201ff/1792455584-71AAF2A1-EFA064A6/0/0
X-purgate-type: clean
X-purgate-size: 955
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-15 10:08, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Emulate guest BAR register values based on PF BAR values for VFs.
> This allows creating a guest view of the normal BAR registers and emulates
> the size and properties as it is done during PCI device enumeration by
> the guest.
> 
> Expose VID/DID and class/revision to the guest.
> 
> Note, that VFs ROM BAR is read-only and is all zeros, but VF may provide
> access to the PFs ROM via emulation and is not implemented.
> 
> Note this only removes one of the gaps on the way to vPCI DomU support;
> VFs are not usable in DomUs until the rest of it is upstream. The DomU
> testing behind this patch used out-of-tree vPCI DomU patches.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

