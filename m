Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D2EC624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:22:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405662.1639116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1j2l-0001c9-NP; Wed, 02 Sep 2026 11:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405662.1639116; Wed, 02 Sep 2026 11:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1j2l-0001c2-Kk; Wed, 02 Sep 2026 11:22:15 +0000
Received: by outflank-mailman (input) for mailman id 1405662;
 Wed, 02 Sep 2026 11:22:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x1j2k-0001bw-OC
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:22:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1j2j-009KS6-K9
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:22:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a9806e4-e002-0a2a0a5209dd-0a2a4501c5d0-2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:22:13 +0200
Received: from [40.93.195.61]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a9806e4-5984-0a2a45010019-285dc33d9d4c-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:22:13 +0200
Received: from CY8PR12CA0046.namprd12.prod.outlook.com (2603:10b6:930:49::24)
 by SA3PR12MB801393.namprd12.prod.outlook.com (2603:10b6:806:53c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 11:22:09 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:930:49:cafe::19) by CY8PR12CA0046.outlook.office365.com
 (2603:10b6:930:49::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 11:22:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 11:22:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 06:22:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 06:22:08 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 06:22:07 -0500
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
 b=lAxBAdiFPR+pqKAt1XDJuLFe+ins/C+CkwsswN2s21LxuQildNtOc9wKnfZ2hnUDWN3rPuYNnrWNyjPWg+n4a7LYNoSWICYzbCuoHPyJ0KvPOpw+fXLeOWLzD/MOpq1kyDEtrKHUGf1sTlXn9RcZZHrpb3MgBLNppQCWL3NDkg6i/1uA0jHBVrxC+e0moQrv7ljCysmUKOaMRNfzDu9z/F9A77Ve2PgCtK3FnXs653i7UPrkszu1q4UiEaxl/HN9rJn5qoHC9vLbi/YdTT/dCsTRLuquJfTbAm+EnoZmj8z0nX6/pUC+pgwFd8al0SvVNXyGJB1slAEvmZWBAxIK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksrp3V5g1xJJUK0jQHQdiQqzRlcVqhsml17jO+E2mSI=;
 b=N7KM4imyiVG4dPFUZ7byYmDynQz3mOhBK5pvhB9aZhyKSQ4N/8JFyE9iUp0g/dzpllNDvsfr2xtp1sq7wCmgzRC2/hJ+dPeoYv1a/AtnFi5CMMJ/uNcGF8dBBOB6U381EhRuy09e30AV+OeA3ltmSX3sQiY3WPo9JiiWLc82R4riB9NeoDzkLxTnKOAc6tKHd9xAlcEZ4XUZbcFJB6QLaxzuaeivGiL3/cPeM2t5zjv9e+DSZNiTH2e2ykig11kCU4pcK8OLB+Rb4Jy/jmVp/CpnuvNC49hTAvaxXvRRiumC9qVokx/7pPjCKhUljhKyTtfRp60rP/Bba1oGFIRUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksrp3V5g1xJJUK0jQHQdiQqzRlcVqhsml17jO+E2mSI=;
 b=JBHBBoB0unOlSvqoVJlaUgb1487r/5CzSHTSoJlmP1nsWQAY03XWRDwPbzCfQO/+jef6Luc58qjPK1/5iV4XkjaGrY+sap7gQJOiWPtBlIU3IU5jHCaBfG344e+zzMj7JCDHXJXRc6sPmkOyb67MCPOH3YPo8WWQ/ZK/ta5sH9I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0892a479-ae28-479d-983a-8932a57e040b@amd.com>
Date: Wed, 2 Sep 2026 13:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] Arm64/GICv3: have gicv3_its_find_quirk() not cast
 away const-ness
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <9479d311-2449-441a-9855-66926dd8e0cd@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9479d311-2449-441a-9855-66926dd8e0cd@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|SA3PR12MB801393:EE_
X-MS-Office365-Filtering-Correlation-Id: b8331d73-be52-4f76-1a95-08df08e46da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|10067099003|22082099003|4143699003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2NLd74iVUjZ1Fvmn4viuKo6AalHZ3K3YH7NwhNBXGry9cBRozR4ZGsECqzK2b/ZB1oLz4mSeivBl2CbFqlf0n0WIGxx6ee5h0gzkaMPJRB4fHp5aU+mup75QGxXb/GVDR/YWrBKdHUQ3kIdyWCedORBnoivLvdUSd0KXqrxaWlSCr6VUqfNPVAo4Qowy19vIaLvZmw0WN/5zMhr8jzi0qZhqfw96yhw/ren+wM5K/E1kO/1zOQsQGyMU8u+JcE039ioHZNPgpiwLkPIIEAPhiWxQqKK8vbdx6DZkn28F4SeeudqwxjM/K3PDPphM/yzq4RXdfxRMfOxzd4fO9N62QZBmWDBwV9wx7qjCyjnelhtFyVaAfSwBuHGdbkfKHAxB2l+jFoSzigEPY4fAR+AHTXkXJPzbe01g173O98R4p4SDrNtyy9GaxH8+kxjnHKSRYbFBqY+4bbFimZ/CJ79DwM5oJnNwVnXkwWJ0UXwVmCFqVm32iq8t2muKWyaIj+e21OhoxcAzuZ0kL1nkbl5eLXpiSI2eRxsQHVA818c94yDLiJ5NppuzAL/opCGfNbJp7Cq5UtG39cU1ggH8w7MytVtk63lJ4TFqj+YrKZz5JmVAy5TIVeku0RC2WChO1INbVkwzxtVdQftLP0mKDf8TUo2Uk1UrqJKiQeB2s4M8AO2aK7kswP0fFIMlGWTmj9LZXWm/lNQGmdk5BG1uwGKhtw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(10067099003)(22082099003)(4143699003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GYPwLkVg/LyzY7paR2X38FTSN4N6tLAm4yGmxyBu1WsxYO5DKfoGdsMIj/WhPf1wvv+e6qSPk6KurocetZw0VsfxMlXduGMYC9RTdxVfMxIj12FqbfPAMvsw9XMxY/PtnlmfeHeA2kygpsU4mje3Kzr0uGoR/RHmUQwPL6DF+ZWpGsC+Wx676v+BQhLncp3xFOoOyT7FTrbpqLr4zPu+neknsPQLeRPyvYQMayuLKvUQxfxc53Dk83j9TddEXMXBG/qfr8FS3bC5vDpGKCAl9lOEaURnX2HxUCv6YHDkeaxiD/l2bZDs42pSYZOzok7qSTnOEUWFhsx6m3WL2V9QJGGj3zqU4HePFiSEvAG1CKQpUqRkNPL7GmnbnO7QM2PULptnqTl5WmmpjNpJk8kQROiooxM0rt5pvcn7Rbjq9gB3vtcOAT2uBIfJO7X34OSv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:22:09.3921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8331d73-be52-4f76-1a95-08df08e46da2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB801393
X-purgate-ID: tlsNG-d62444/1788348133-BFC69757-04BBA945/0/0
X-purgate-type: clean
X-purgate-size: 344



On 02-Sep-26 08:33, Jan Beulich wrote:
> Doing so violates Misra rule 11.8, while being entirely unnecessary here:
> All callers already store the return value in pointer-to-const variables.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


