Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A17606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 02:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=NQLJt7ja
Received: from list by lists.xenproject.org with outflank-mailman.1467585.1676673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhNm-0005ZX-4V; Mon, 02 Nov 2026 02:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467585.1676673; Mon, 02 Nov 2026 02:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhNm-0005ZM-1X; Mon, 02 Nov 2026 02:02:46 +0000
Received: by outflank-mailman (input) for mailman id 1467585;
 Mon, 02 Nov 2026 02:02:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xNhNk-0005Yw-Pw
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 02:02:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNhNk-005zkv-6g
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 03:02:44 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7ef11-8faa-0a2a0a5109dd-0a2a450488c0-40
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:02:44 +0100
Received: from [40.107.130.102]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7ef43-b57f-0a2a45040019-286b8266eb26-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:02:44 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB9024.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:02:41 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:02:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjsJQP6GAQInaGyEZ6QATrWfOoWCACBSnd33XMqX0TZIo0AAqXLU38ID74MaLKM+6u8/IeN9lUAITft4Db0xaJLRTVRG5lPX5RQNplv0skWBKps9qPQ8ruL7iq4U1u7bYM+AQv3Ph87gcW0u2nmPRVXLcRU14tBO8yGK9eIh2mKOG+b/dug4Y7e6byO2dq4Fp8G6wI7a4vfw1IW27j062kpsQxLz98e6N0DU4Mq0eDIuU84IlHW/tltuX1Dd3ode2FIyFQARR4SyG6hGnWHUbemnoT6WSEjI8AiqlI9siWLnDUWMO7roScyY290fpEY3ageLQCqxmv83Q1V2ep/O0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW2T2i9DI7IifQb7KRtDESGtNI+0IKDgqu0UG5a0KzU=;
 b=UnBxukIjaaRgbEMb1sMiTCeLFJcerdr/X4O0Dfprc6xA+HfqNWhLqjJkJWYO8Wp7KN6TQkeL4WtjvqXIrxpWD61BeP7bixc//5ipsztyKgLdRuWrYnOQaCZNz1tISYo8Kz2KHoAYSRQYGVhmlk1okBO6LUIpmyS6dJo9cwdTlRnISrq1Wam2Nam8L8lgFP1Qs6ZR1QzaiW7CnjLWMyap9WrvquXylg1m6E4JHK0ZrirAxu+10ZiD9M50Swks56/wTQjFUAOPJ8rIRwZhVql103li4KhREhH2spqn5Z5SbVynGx2EHJ88DNbU/K3QadkC1YxTBvA0QeVhi6A8Ne0GJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW2T2i9DI7IifQb7KRtDESGtNI+0IKDgqu0UG5a0KzU=;
 b=NQLJt7jaVk4roytp8awsiDA6lW531Xoh/8t2PGnY2319rs+wjC9+TXCthd8ltbjkWjPDwy1YeS77lded2R5JTh0vYeORdDYjieTpECNUQd0grIXm2jjLET/Z/ZDMTBP7nfJByeztEw3ADx/A6dGCsi1OcfMt6XsThYWnjYG/1YW2hEpR28bmhy28sg40SBPqgNJqLSZxfwhb+v71veG4+5z/JzdZpK/RE2s0xfiFm6YzUaMMw+Sj1WFLzh+xXEcuwd4wr9uJSzLXIxUUBwblSICin8A83kJ/C8KbojWykWVbWtBn6PH7RMB6olMh4PwqhPB6jc8iHHrjOkIl4RiomA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <08c8c0ae-96e7-477b-b491-c2c138f96d7b@epam.com>
Date: Mon, 2 Nov 2026 03:02:40 +0100
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v4 17/22] xen/arm: vsmmuv3: Add support to send stage-1
 event to guest
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <94ab2741c9c61f2b66d9c5a207f913f4241c42a4.1791328190.git.milan_djokic@epam.com>
 <7b1f3938-2d07-4884-a377-ce7d9b66fdb9@gmail.com>
Content-Language: en-US
In-Reply-To: <7b1f3938-2d07-4884-a377-ce7d9b66fdb9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::14) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 1060e135-e7e8-42f0-169d-08df388560dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8xJgo73VMgA896lpZuUyDveYgnKmnA+kpvSoHc4y2LpuG9OeNOXwnilYISxSoH5iMTB5PBGkga5cYe+g9ZoOfcEI/38OZeIsZa/WGy0zGkKJ387e4C6dPKCheYIdNNx/zFm39ISSJEv+N/vIcWPQtpSRsBoDRfMlXY7h/SzlK7Ww/odTs2MyAfq52jh0PD0rwJOBvfonlRre0UyRK7FtJcgMZhAxnbgXceXF6viEII2SnvKPo9L+F5dOCXt/vFdnwHm51hVMGe2w4QLonqVlgn/oefQMPIm1so02zX1PlPaFy+srz/Hw7v0amgA9Ec85VXiSorV9ccm46FpcF2DTcUxcSmmCsijuhlooX4RSWzy0oPiUwGmjnt9OKhGX4djx223zsi+h0wNA3kcHqAuSAXDmvCZPfErFa/MN/BjM3DGdMQ04uq9QPWRadjYs+MAQIp+neU2+92e0sS69bKd80vB9DxHaj7AzfOf+w5mBjCn8XajwUvN4y440zwuJeP2uivuV7xYSSkClu+Pg2p/j4+LFJTF/M0aqAvdpvJS/a+YYsJ4DTLcG7VQN4GPMf5b7h9GwcK+cB632aUVlxivBvGFy9EM/V2ZnI794ONVpPwFam2VsUdBxm5WDmhPGLggQXAA85R3ski+bPV8jpT4wDJTDQpTZ30lchpNTY/MlQq4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUhsWjRBSVlBbmRRbW5DeVR0SlVjQlQxNkhpZzlwa3Vya0hkQkZJZ2NKSytC?=
 =?utf-8?B?SVJ5MXpKRkRzOUlmaHphVU8vNkRCMkJicHNscHVkeEVReVRKcDlOSzFkRXBq?=
 =?utf-8?B?bUM4eVJ4QzdyWXlPcEhXQ2w3bm5RM2tRREJCWnNzMVpZRzVXTTdGM2sxakp3?=
 =?utf-8?B?T2lDMXpFeUFnS2YzUDBJQS9icjFZRDRsRlVjSnlDQ2QranlKeVl2a1daa1dv?=
 =?utf-8?B?blE1MVd4NDZLSzd1OFJnVGtiOGxwbmszMUUrM0ZHNXlhWmk1NnZyWWNNeCt6?=
 =?utf-8?B?SmxKRW5KdFBXdWd3WURWamc2QVJZR05qcFExdVVaS0dGK1V2V21ETVlVWmc2?=
 =?utf-8?B?ankxMFNDc0g3dklhTGhFYXRvbWUzVUZEbTlCTjh2V0JSSkxOQ2YzaHl5TDVt?=
 =?utf-8?B?REtIK2JqVjV6Q1VKb25oeWdkRStnTmNJYVVGS1g0OHNVVGJPaW03TXRqOEZV?=
 =?utf-8?B?S0JtRkpwSGFHeC91L0JkRGVCbXc4Y0w5WkJEMlZHTHljckZGT002NnQ0ZEJU?=
 =?utf-8?B?cURQS3R4VS91OUx2T21vTk1yZERBRnhTSHZnbHF5U3hmdFZEQ21BVW1tVUZj?=
 =?utf-8?B?YUpjMlp1cFJZUWpNYk1ncnZuZ2JhYkRFdVI1QzcydS9zTW1udTlQOGhUQmNt?=
 =?utf-8?B?YllOeEpQb0tNVkxPc0h4cTR1MENhT3lscXMvV2V1WXpzay9hOU43aVl1OXY2?=
 =?utf-8?B?NGZ4Qzg1V25OOFJITUgxcSthWi81RVRnVUZlclVuSlEyaEtTN3VPTmEwS2NS?=
 =?utf-8?B?RjlTUko1UG54M2RXZTJNcGhiRlJQTk9sM1EzRXo4d09jN0lrZVpJTUJKSHdk?=
 =?utf-8?B?aWpWbjI0b1Z2NXZKTFFibFJVWDdOY2hhaFBTYnZQbXNDd1I0NW5vU2xMUzRL?=
 =?utf-8?B?WGttTkZBUHREMDVVREw5N3puL0dwK2xhZytXdkNqNVRzYjlFMTMyOEtNYmlV?=
 =?utf-8?B?dFZoQWpnWXc0akxVRFEvRGI1clY3Z21RMm1yYlhTVGRqcElEOHJ3eDR5ZmZO?=
 =?utf-8?B?Y2pOWlJFQVdFczRoV3NBdnFCTkZXRXgzUXU1TjlpWUhDeDRPWE9mVDVaS1lL?=
 =?utf-8?B?N0FVNS9aU1JQSzR6dkVJTmVxY3I2cUhLLzNNUmMyR0ovRXVUYVNtNnNPa2Zm?=
 =?utf-8?B?dVNMZ0pTbjVSWE5TdlpaOG45QjJTc2RZcnNxcmxnOW91QnpDQTFRWVQvNkw2?=
 =?utf-8?B?MGtyN0s5RG1CcGJiTHYyZ3J0N2x3N1NxU1B4Ny8xMndQSGNFUnRiTVErUUll?=
 =?utf-8?B?S0FlQXNGTTJpcWxuVVUwRzJjZUNNRVZyQTFyNzh3TTIyd0VaL08xVU5SaVJ1?=
 =?utf-8?B?TjdqUDJYekxtajVhWks0ZFZ3SHQ0WFM3ZEFrUWR3WmNKbEdvczRVVm5vZkxL?=
 =?utf-8?B?ZU40N0hOb1NYd05zWkVkVFcwM0MyZDF1dW4zdkhSZGVFM0RDZHUwbUJvSjVh?=
 =?utf-8?B?b3ZkWGlwczhDM2tFcDZweG1BQTdNQVNNNkl3MU94aEk2azUyY2FXUXh2YWhH?=
 =?utf-8?B?TnpkMEZveWdiQ3N0NkFTQlQvNWUrSlYrYlZBVUY4bW9vbmZ5S2pPWWptWU9v?=
 =?utf-8?B?UlU1SElWRlFmSG14bFpzQ0VtNWNCdVFaaE5nWjlpYm1oR2NrTWJ0MFhudlND?=
 =?utf-8?B?L1FFZGorUkhiNGd2SUl0MXJFQ29XdWtyWTR3eDJYbWR5ejdGcXdoY2dsRDNr?=
 =?utf-8?B?VzZWN3lrUXlnRzhFVlBrdGFPQXNHd0QrN1JMSU4vWGdIdllXdlBBbkg4SEJw?=
 =?utf-8?B?N0s1RmZhWUxRWEJ3bHRYelNjYjBESmxZRFhUcDhBOVhPQ29waUNHSTNGNmp2?=
 =?utf-8?B?SkNBRWpkYjY4WjhZL3ZjT1NpbVU5eUR4WTdTQ0tJNzFYV0RhN3ovTUN6RHdZ?=
 =?utf-8?B?TDhzWDA0UlpxYzZjVll4OWRsVERPRkNXMkRFa1FTekVVcHBIb2tsYTU5Y3lP?=
 =?utf-8?B?eVdOZFNoNnR0R210bWFOT0xEeldDOGtoMVpFOHYvYUJQNHkzb2pBVHB4V1JX?=
 =?utf-8?B?MHVKSXRiSmREb21qR3hiTGRPNU5kamRSNWZmQUZPVmpJS08zdnBIbmtrUFVB?=
 =?utf-8?B?eHhONGxMNVV5NkRVc2poNEVDYy9RaW0yUi9NNDVUdmwxdzFsT054TXg0dkox?=
 =?utf-8?B?aXdhSmZBSlRueVViK2Z2T2UwNUFRanVvWGh1VUhqMS9EVTFZRWhMd1MvU0Ry?=
 =?utf-8?B?bHRNMEVhcDFtbHZ3dzZkc21HcWZuZzVrZExqOFVsQjAzb0Fzc29BelY0NHpX?=
 =?utf-8?B?a0xCT1JWZzhzQjhuNUl4Umh1K1V4MVc1NGVwN0ZFamtEWVlmbDJiVENpd0xj?=
 =?utf-8?B?SlE0aEgyektqalYvVllTM1pPbTdiZ2lLM3crRStsdTZQcDVYN05oQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1060e135-e7e8-42f0-169d-08df388560dd
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:02:41.7698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyOXIm84fapT7tDu9gY/pztFd1fYZbDWlhbXAbAZldSU1dIbzl+YzCEOvTHhFEf6t1WSJ0VLiJt07QOGqk708Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9024
X-purgate-ID: tlsNG-ebf023/1793584964-538C1B50-7264CAE1/0/0
X-purgate-type: clean
X-purgate-size: 7231
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksandr,

On 10/9/26 17:12, Oleksandr Tyshchenko wrote:
> [You don't often get email from olekstysh@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 10/7/26 03:07, Milan Djokic wrote:
> 
> Hello Milan
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Stage-1 translation is handled by guest, therefore stage-1 fault has to
>> be forwarded to guest.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/drivers/passthrough/arm/smmu-v3.c  | 48 ++++++++++++++++++++++++--
>>    xen/drivers/passthrough/arm/vsmmu-v3.c | 44 +++++++++++++++++++++++
>>    xen/drivers/passthrough/arm/vsmmu-v3.h |  8 +++++
>>    3 files changed, 98 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index 196ac660ef..e44f872d2d 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -871,7 +871,6 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>>        return 0;
>>    }
>>
>> -__maybe_unused
>>    static struct arm_smmu_master *
>>    arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
>>    {
>> @@ -892,10 +891,51 @@ arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
>>        return NULL;
>>    }
>>
>> +static int arm_smmu_handle_evt(struct arm_smmu_device *smmu, u64 *evt)
>> +{
>> +     int ret;
>> +     struct arm_smmu_master *master;
>> +     u32 sid = FIELD_GET(EVTQ_0_SID, evt[0]);
> 
> Maybe my comment should better be suited for commit #20/22 (where the
> vSID->pSID mapping is introduced)...
> 
> Look like the event is copied to the guest unchanged (with patch 20
> applied). It carries the pSID instead of the vSID, even though patch
> 20’s table could translate it. So the domain might not find the device,
> or might blame a different one whose vSID matches that number. Or I
> missed something?
> 

You're right. The SID in the event should be translated from pSID to 
vSID before forwarding it to the guest. I'll fix this.

> 
>> +
>> +     switch (FIELD_GET(EVTQ_0_ID, evt[0])) {
>> +     case EVT_ID_TRANSLATION_FAULT:
>> +             break;
>> +     case EVT_ID_ADDR_SIZE_FAULT:
>> +             break;
>> +     case EVT_ID_ACCESS_FAULT:
>> +             break;
>> +     case EVT_ID_PERMISSION_FAULT:
>> +             break;
>> +     default:
>> +             return -EOPNOTSUPP;
>> +     }
>> +
>> +     /* Stage-2 event */
>> +     if (evt[1] & EVTQ_1_S2)
>> +             return -EFAULT;
>> +
>> +     mutex_lock(&smmu->streams_mutex);
>> +     master = arm_smmu_find_master(smmu, sid);
>> +     if (!master) {
>> +             ret = -EINVAL;
>> +             goto out_unlock;
>> +     }
>> +
>> +     ret = arm_vsmmu_handle_evt(master->domain->d, smmu->dev, evt);
> 
> ^^^ dereferences master->domain->d with no NULL check. Would it be
> possible that a fault event queued earlier can still arrive after the
> device is detached (on domain destruction), so master->domain is NULL?
> 

That is possible. The domain pointer should be validated before 
dereferencing it. I'll update this.

>> +     if (ret) {
>> +             ret = -EINVAL;
>> +             goto out_unlock;
>> +     }
>> +
>> +out_unlock:
>> +     mutex_unlock(&smmu->streams_mutex);
>> +     return ret;
>> +}
>> +
>>    /* IRQ and event handlers */
>>    static void arm_smmu_evtq_tasklet(void *dev)
>>    {
>> -     int i;
>> +     int i, ret;
>>        struct arm_smmu_device *smmu = dev;
>>        struct arm_smmu_queue *q = &smmu->evtq.q;
>>        struct arm_smmu_ll_queue *llq = &q->llq;
>> @@ -905,6 +945,10 @@ static void arm_smmu_evtq_tasklet(void *dev)
>>                while (!queue_remove_raw(q, evt)) {
>>                        u8 id = FIELD_GET(EVTQ_0_ID, evt[0]);
>>
>> +                     ret = arm_smmu_handle_evt(smmu, evt);
>> +                     if (!ret)
>> +                             continue;
>> +
>>                        dev_info(smmu->dev, "event 0x%02x received:\n", id);
>>                        for (i = 0; i < ARRAY_SIZE(evt); ++i)
>>                                dev_info(smmu->dev, "\t0x%016llx\n",
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index 87342fdf69..b71511c2eb 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -338,6 +338,49 @@ static void arm_vsmmu_send_event(struct virt_smmu *smmu,
>>        return;
>>    }
>>
>> +static struct virt_smmu *vsmmuv3_find_by_addr(struct domain *d, paddr_t paddr)
>> +{
>> +    struct virt_smmu *smmu;
>> +
>> +    list_for_each_entry( smmu, &d->arch.viommu_list, viommu_list )
>> +    {
>> +        if ( smmu->addr == paddr )
>> +            return smmu;
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *evt)
>> +{
>> +    int ret;
>> +    struct virt_smmu *smmu;
>> +
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        paddr_t paddr;
>> +        /* Base address */
>> +        ret = dt_device_get_address(dev_to_dt(dev), 0, &paddr, NULL);
>> +        if ( ret )
>> +            return -EINVAL;
>> +
>> +        smmu = vsmmuv3_find_by_addr(d, paddr);
>> +        if ( !smmu )
>> +            return -ENODEV;
>> +    }
>> +    else
>> +    {
>> +        smmu = list_entry(d->arch.viommu_list.next,
>> +                          struct virt_smmu, viommu_list);
>> +    }
>> +
>> +    ret = arm_vsmmu_write_evtq(smmu, evt);
>> +    if ( ret )
>> +        arm_vsmmu_set_gerror(smmu, GERROR_EVTQ_ABT_ERR);
>> +
>> +    return 0;
>> +}
>> +
>>    static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>>                                  uint64_t *ste)
>>    {
>> @@ -1118,6 +1161,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
>>        smmu->d = d;
>>        smmu->features = features;
>>        smmu->virq = virq;
>> +    smmu->addr = addr;
>>        smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
>>        smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
>>
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrough/arm/vsmmu-v3.h
>> index 9f4c86abd5..d4b7cf805f 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.h
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
>> @@ -8,6 +8,8 @@
>>
>>    void vsmmuv3_set_type(void);
>>
>> +int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *evt);
>> +
>>    #else
>>
>>    static inline void __init vsmmuv3_set_type(void)
>> @@ -15,6 +17,12 @@ static inline void __init vsmmuv3_set_type(void)
>>        return;
>>    }
>>
>> +static inline int arm_vsmmu_handle_evt(struct domain *d,
>> +                                       struct device *dev, uint64_t *evt)
>> +{
>> +    return -EINVAL;
>> +}
>> +
>>    #endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
>>
>>    #endif /* __ARCH_ARM_VSMMU_V3_H__ */
> 

BR,
Milan


