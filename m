Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8263606A33B
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GaMRaiyJ
Received: from list by lists.xenproject.org with outflank-mailman.1498064.1696065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUMbw-0002uP-Nn; Fri, 20 Nov 2026 11:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498064.1696065; Fri, 20 Nov 2026 11:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUMbw-0002uI-Kc; Fri, 20 Nov 2026 11:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1498064;
 Fri, 20 Nov 2026 11:16:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1xUMbv-0002uC-Ot
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 11:16:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUMbv-00BF7W-1P
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 12:16:55 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6b002c02-bab6-0a2a0a5309dd-0a2a4507bc50-38
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:16:54 +0100
Received: from [52.101.85.61]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6b002c24-b4ea-0a2a45070019-3465553d0d2b-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:16:54 +0100
Received: from SJ0PR05CA0174.namprd05.prod.outlook.com (2603:10b6:a03:339::29)
 by BY5PR12MB4052.namprd12.prod.outlook.com (2603:10b6:a03:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 11:16:49 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::ac) by SJ0PR05CA0174.outlook.office365.com
 (2603:10b6:a03:339::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Fri, 20
 Nov 2026 11:16:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 11:16:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 05:16:48 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 05:16:48 -0600
Received: from [192.168.1.21] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 20 Nov 2026 05:16:46 -0600
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
 b=LNvJyJaZjgS5pI666JurbztBPIdGmYKbs8FIks/PJ3VLNMEEBOt4YEcVhGa39sQYb8qutaCfFzFze3YODnL1sJWPxTrgdE064791DDry7Gj4C5+7iTrO2032Us5HKyvcBHYy5b1lYQLYTmiIh6oX9+Ud0LOH6sZnrbAcS4OuYCVjtdrVb7Xd3jNUPxt5rFfyYa1/MJWkKg62D+YDhgqFwOP2w9TKdrh3wnkfsVqfDEJnNrTpHebXgQ/BeE75hfU39VIA0gGUFeIXprwQBh/XbAvQN++kM38EbAqnw9uunucLrWfIf73BgQMibhHTqiyOwzRn/ODBqbgSqOPuOBgJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vwr9lDWOATn1a/8xH2EUShv7roPkI2akVcjRS8mLQe0=;
 b=XEYt7lK9O4BesA95UH1DUuHZtlOEKu9Qx+rUrC4GjArJrIK/46H+zmnCIna+VIGNgZxXfhBjNvmm/zsp3mGDZmg1Qa3Ki0SZNbrXp+FoWWRTy8O0T0grVbzL4bKFEm6Ix5lJIK0u8S2ZWPcahkCDGZ3KVoQz2Jh1koAvXLO7Ygi/I9A9NYmIDyHbohxRHxpFmo3lDuxgfhlZfeGxqzOpSUcgQZIfKLWrh22oiFeFV4fQNBwS9/yXQhxbhgYnakwfwPmatgA26lXoX8v4HJG0m/ImvbubPGozVD7vc5goGB3pYv+2OgHG4WolAt0P20eNNnZhcc4lfUktJD/NEPpw8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vwr9lDWOATn1a/8xH2EUShv7roPkI2akVcjRS8mLQe0=;
 b=GaMRaiyJcWzIiVrMTyJ3DuxYdWMMHsln89S4GJUO8nRBN0hAFIJs2G09oOoBPsF7y86gWWc9/b0gZZcswI+YWMshhLSLwOStkYpAqsDL6parSDXO17YEo6GyR+jBrE8CKhGvDYIzRbSnhTw2Usp1e/dj/F5gtvbiFnS7PnvhIWk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <864d4ccf-2c4a-44dd-86ff-94b94db787ca@amd.com>
Date: Fri, 20 Nov 2026 11:16:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 23/26] docs/fusa: add NS16x50 UART requirements for x86
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, <dmukhin@ford.com>,
	<xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger@xenproject.org>, <sstabellini@kernel.org>, <xakep.amatop@gmail.com>,
	<dmukhin@xen.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-24-dmukhin@ford.com>
 <70fff78e-4f3e-4e39-a086-01265bb6a822@gmail.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <70fff78e-4f3e-4e39-a086-01265bb6a822@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|BY5PR12MB4052:EE_
X-MS-Office365-Filtering-Correlation-Id: 07983c1e-85b4-4c00-7b89-08df46f7c540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|261022075727099003|10067099003|56012099006|11063799006|4143699003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1MZovFCCLPUdZb0d3S/V7QsVPwvSCg8hrG6pBvLOCX8xyAYRa2uCzqP72bYyCMIQauOK8kq2+gVGbtpU+ZwqjCoS4qsQiGWxUof+GvGnm1fk7lVGB7KdMrCcDHcATj72hlhLkN74NEC5vtB8h4jk98Y+Uez+EY/gKwS7Ke13iOK6GAi6y6/tsayueA8H7hmS7b/fyq50VZX+txM+R6HcTqEk34/0Csy9chnDjQyy9XeVSOlUnXY2Vb5LCS9He0rRrvBNtU9/x0uDXDWrbxoSMXR+j1ukiUpW91A6I1iarJyxijqD3JFwFEVings2GWLxFsEV0sYGmKmrQyg7ObddSmJcS/63EeNrAAddmoaqCqmeavIw+vclG5PzxgJ4XA9PZYszNSU/OwAYzG95J2YlHK+36bUJ1sl2ki9TrRwqRIJBmVzvxgHdMkGx7d+qggwMt7ndxdndlFT/4gDd2aw3W93yxnM3+1uI29eSePdvoigDaL3H8w4zkBL1KlWwHPgb5UFJcHIzhuXPStzs2TxL9vyoqBzw7ujCWbcV35OZRt51GXXxELEZCxHDIa75DMCtDVh0zBX0AbGHrz5fP5eVaKU/MNwp64ZT5yrRsYqEBsjKQsrFkN8HqaNi2JSrVjMpRGbyxmTDDpKIUw3THnuFmAbKyGdIwTJpRSkuqUNXUTux0j5cUWkdw94VLa8T6YYScgKt8iPF1Yw1E4/oyD+xGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(261022075727099003)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tgLANLxnpxARo9mxj6rf2muXiY0Fd+tzG05xmRqWi1NHn8YtjUVDG/FQDYRT1NHgEjVqa6Ln6X7/wjGTq9GFs7XSTZnMagaCaWsxelJtnvmaTcHAxqYdPof/K60DMeqtdEAdKLqBjyxHsaGyiQp/nzO1IAxrS8MXvK2pu0SyHJ3fNw6jWxhLXHed1p0TELliPaeHB6yOuxWCqFeFhC/4YK3Y2LhpSElXWMZBkK77L0hie8//yeWcwl78eH3iRLLpHAD7AAnJy0zlacfIvf2ee1lwrqjRs1sT2s3FHf3xo48uvhNOCF0woIZ+fWA01KWUTN6W7ENnRoX2yYyy9IwbHChyYbCZuOF1YBJJa/s3rWAfAjL1r+5WuptrLikAKDW1g2lFkh/v9/0iaJwx5V2+OnaxoR8ya5r7LbKhRmTxsCO0p2ng4hM1DZjF8HOoRJfz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:16:48.8811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07983c1e-85b4-4c00-7b89-08df46f7c540
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4052
X-purgate-ID: tlsNG-ef75cf/1795173414-35CC7AE4-B37A2596/0/0
X-purgate-type: clean
X-purgate-size: 1214
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksii,

On 20/11/2026 10:26, Oleksii Kurochko wrote:
>
>
> On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
>> From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>
> [...]
>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 327adf4641a1..2c0eaaea2d24 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -335,6 +335,13 @@ F:    xen/arch/x86/include/asm/x86_*/efi*.h
>>   F:    xen/common/efi/
>>   F:    xen/include/efi/
>>   +FUSA (x86)
>> +M:    Denis Mukhin <dmukhin@ford.com>
>> +R:    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> +S:    Supported
>> +F:    docs/fusa/reqs/design-reqs/x86
>> +F:    docs/fusa/reqs/product-reqs/x86
>> +
>
> Not something to do for this patch but I would like to ask (mostly 
> maintainers) won't be better then also update ...
>
>>   FUSA
>
> ... this name. It is a little bit unclear what is the difference 
> between FUSA vs FUSA (x86). 

FUSA (x86) - is a more granular maintainership under docs/fusa. It will 
cover only the x86 specific bits.

We want to have more granular maintainership so that the person knows 
which file/s to maintain.

FUSA - covers the rest under docs/fusa


- Ayan


