Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3427E1093168
	for <xen-devel@archiver.kernel.org>; Wed, 25 Mar 2026 21:38:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1263090.1555275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5VvP-0000Ev-0i; Wed, 25 Mar 2026 21:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263090.1555275; Wed, 25 Mar 2026 21:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5VvO-0000Eo-U5; Wed, 25 Mar 2026 21:38:02 +0000
Received: by outflank-mailman (input) for mailman id 1263090;
 Wed, 25 Mar 2026 21:38:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w5VvN-0000Ei-CK
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 21:38:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5VvM-007FkX-KP
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 22:38:00 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c455af-5cb7-0a2a0a5109dd-0a2a4506c7f0-2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 22:38:00 +0100
Received: from [40.107.208.58]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c455b6-3034-0a2a45060019-286bd03a48b6-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 22:37:59 +0100
Received: from PH8P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::14)
 by CH3PR12MB9147.namprd12.prod.outlook.com (2603:10b6:610:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 21:37:52 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:2d8:cafe::7c) by PH8P221CA0010.outlook.office365.com
 (2603:10b6:510:2d8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 21:37:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 21:37:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 25 Mar
 2026 16:37:51 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Mar
 2026 16:37:50 -0500
Received: from [172.24.66.250] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Mar 2026 16:37:50 -0500
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
 b=dQQey1C2QfwOlVAN5jS+yTvnqMiA3iIl9vxSBpQFjRrJsWKIrSXu6SFDk7HoWQS7E1/yGrkxPyiXhBXSb1dXMzziLGd7C5xiBv9Q4pq6s3rJQUYpq9VfXxh+hB1uYmqFQkG7QEFDF1Y82FtSpe6+yxiDUmxResNPss1WzkOosb4oGe2x9v+A0f76KNKnNvPC0NihVfwcDAKJbicrIKBB2JojaFK8weN011Rrq6UnQk7MdANjQd5GCoMhuiIWnPVQNx3br35gbHWetbkpv5STHK9ZqQzRWagOU6rdUWXfQ0P3TqutDeWKz+gdCh65CpYPBM4tQbnR1+tkYKEWA38/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beu4NdR+dK3AFprj+R0bdkyG6IY9mV5sGu5B3BAz++U=;
 b=iMliYLe8fOWQRV5SwIVdJJm3g/3D0uwbA3SyH3rv1D8HtTsycHX596wpY/9XEYX5AAU3Wyb5SaJFWC6hS5GSEcyVxaPojDhejR8FW5JPIYXsbVfuglf1BnMl3xl3Hq51EgFmEVSSGPYiVxcC57BcgXDL3jsQx7QUSHRRHd9pu4nqRCOtfBX43CpgP7IhZOcbXhvnhm1a5KMfarQ0DberCNALFlI51IvN+jgE7brfS0jxwAQTxoa+gUkcutnhBr89IrnwXzdFHjJWaNVOjQOWLvN12WDH9paGpWJpU9oeeAS2BN+ZZAXYIF/ktiaPntT+zVOk7BoeEOmgVvwxYAwmaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beu4NdR+dK3AFprj+R0bdkyG6IY9mV5sGu5B3BAz++U=;
 b=G5pYTMK2/gQaGZ75aOJlsYjpQsMcKW3ns4tKKFOShDEGBVwguslIZTma3cCrjUZ86BSA5pA1SnL4V3jgtHb/H8szc3to10/p6ZcbSm9zEGYwZJJRgJqNFN9K15PYrA90A+4wuqryXvLgGGhyXYrNxU2/Ks6Mr6w270P9J7rTxHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4d99d4f5-923a-42ec-9e9f-0b83a66dce2e@amd.com>
Date: Wed, 25 Mar 2026 17:37:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arinc653: overwrite entire .dom_handle[] for Dom0
 slots
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <1b73213f-90ec-436f-821e-b9998be9a9b1@suse.com>
 <80341e7f-4a06-4882-b678-09a83ceccea5@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <80341e7f-4a06-4882-b678-09a83ceccea5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|CH3PR12MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f044eb-52be-4a0e-4f3b-08de8ab6c47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dHz3YUp37qWn07w5Bi5OTEOnA2xgBd/LvzstDYskzNXw+xMikJkTxDpXJe4F7mSUQraSO+Yd3Kewlppk/Vcz7eTyKpG6avCoHAB/QWaRBXKxdAh+digW+UZ+GPzjW5Wg+QWyYgPc/eCRysSr3iXA4PzoqR+i5HWhaOFK3lzvJ86XMzC9Pk+1qL/Z3Q4sqC51jFyDc7NYepvblYD4G0tCUZ/WuE4J/odVxqp/1Zf5fsPi8RyPthZGWvGFEQ0j6+8CEicuybNQrV/gyD4r+9fSkqUWjCFqQjhjt7sX+WyV344PWfG7DdST6JekueOWQQyyN2poxKbwryb7XQF+D3oCkpbhBkQ9xaeXfhjbCDL2hqAF8hl7xV0sO9Jq+tAkUtZE8W9QJSbKJj5vGy4F2DvRUdpobnXtJZDaH21ApIY+a+3lFMafl0Dx1QUzZPPuitEUzO7Sxn1l+IAL8eu6mnt9OiV5NweGaHE5idy7Y2VuhXNsZ/LDHKuTxtAwdJKjgW3xaLOU30lLFwyNTnmCutSPxBAc1ncLY5GavriiK3ngbfyCT41YXHQagwULIMWRkIRmeN6+1xCHvbUJy1GStxqkkB9CEtFLnfzWyyZGiq6XeSANPbP++tvw3zmJON3tZKktCkyRHh+xuRzWyW/OM14PWvunfvBHU1GYwtkBG7KlPRZD58Fv29r5foZsXte0RK6iEVIBQ6Krj4UCxEQEW0KBuZ/vRMhu+ayOKIbETqjefNBz8FmasXNisjffI9spru3DidEVym6wIz0CwGkWYxLJdA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZhdswEMkclqnEtWJWengYElMG2KLf1FDrwERw4U72mhytjsVECn6hvKMQeZX3R/ttBSkuALoKo7YvxxIDwB99fKxjLAWVj0eyo2FJbHcIympVq8vSVFZJGVBWy459fxhPgfSrdqrG19CQP4hcToX9U4idZoXk3LLQfnABsb6PwaynVrUcYCb7vZbD9kqa7oahsvYuXK5yeqxhVRmNkJb4U38wdgsnWs+czaTEedibYGLLk1hqwW30syic2vF/w0qno853KmXlC5BToAuDwdWpTXLv0bgQCJ9DafhiimEHW5kHxBmIPsATH5zJATqSy9wWyJ7EcySicaU8Kv8PFyx1jaymm8ub/LhOCstPXoluY3T0A3n3LgklazZIAJGhXCWetXCzA/KtnFQ99I41W6Jcmo0ZPlMrQ+fR4LRY6+HrTrGU/ZUcI4KphCiOYw4ItHS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:37:51.7311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f044eb-52be-4a0e-4f3b-08de8ab6c47a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9147
X-purgate-ID: tlsNG-16d1c6/1774474680-81B8E1C2-440BD1EE/0/0
X-purgate-type: clean
X-purgate-size: 787

On 3/25/26 09:51, Jürgen Groß wrote:
> On 25.03.26 13:53, Jan Beulich wrote:
>> When that code still lived in a653sched_init(), it was redundant with the
>> earlier memset() / xzalloc(). Once moved, the full structure field needs
>> setting, as dom_handle_cmp() uses memcmp().

Nit: perhaps also mention that the concern is the dom_handle being clobbered by
arinc653_sched_set()

>> Rather than implying the
>> handle to be all zero, copy the handle out of the domain structure.
>>
>> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

With or without the adjustment to the commit message:
Reviewed-by: Stewart Hildebrand <stewart@stew.dk>

Thanks!

