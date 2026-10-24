Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1824E606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 24 Oct 2026 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=DmOXdSdS
Received: from list by lists.xenproject.org with outflank-mailman.1460102.1671557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKcrU-0000ct-0y; Sat, 24 Oct 2026 14:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460102.1671557; Sat, 24 Oct 2026 14:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKcrT-0000cm-UZ; Sat, 24 Oct 2026 14:36:43 +0000
Received: by outflank-mailman (input) for mailman id 1460102;
 Sat, 24 Oct 2026 14:36:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1xKcrS-0000cg-3x
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 14:36:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKcrR-00DAEb-HD
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 16:36:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6adcc274-2eae-0a2a0a5409dd-0a2a450b956a-4
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 16:36:41 +0200
Received: from [40.93.195.63]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6adcc278-b7e8-0a2a450b0019-285dc33f571a-3
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 16:36:41 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by MN6PR03MB7624.namprd03.prod.outlook.com (2603:10b6:208:4fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Sat, 24 Oct
 2026 14:36:37 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0546.021; Sat, 24 Oct 2026
 14:36:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtPDjdySQQwLPvmygHqtVTZGo9eDhkfIrFMswvjYE3bWjJCT7rsyHJV4f91PO5Dgt8FCA5fEzEgxuAKJKqY7P/mK1W2/HlWvLksREa6sA3HXXZfE6SMg8qpYLEl/B+df3SHFeXS7jgdI4qzRdfIhRouz5T3B6IzMxzl7smysCJE6vhhQdqB/dF5VKv1pOQL4e4k6QIU1J/BUfwHTg4SwtFZfnsTdYKB+Kezex1bpHLS0khp7FGf5N5RPLaBzIDakFmGNlBpijaQ4AFdELXYCruUyZhBGOv9HLLKO4BwjfomU+krrJzlX4RgXqAFFx60nX4u+IQb9ehVKPzW+BtgPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmCUBQtqTA/faNLlTkrF0Hobry2OualSC0eSMeuMgFQ=;
 b=yti74vuE/Mg06lT7weQb+C7GQ4vY9Qv/zzRKvCCtlpmZ9Bo1fwXJYa6RWdEOYhw2FYbcTAt0qIrRT4TGmP3hiPqcbjnm4WHr1TnXCV1HZbVa7o71AsYkbYuIgDRXVhUiVu0yQz+in2piKyAx0vY7SAPOtAEMJ5aq8uXE9PhhwE+OHciR8s+Zw/ehzRa4xflUFclxhr3ZH08+33YMIVv34U736xvNnOE8eYmCF8iZ2qH3WpVhtYkK2XQJlqnyiKNJ6BpI1gzz/TZzFJPXSaJpHGX1XyjvoScc94Il1vGlPWHNy4mdrKHP7Y1PQnBotQ/QStlGWDX14HA/HqeOWM08JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmCUBQtqTA/faNLlTkrF0Hobry2OualSC0eSMeuMgFQ=;
 b=DmOXdSdSEhy1JGoPRrFIUcNmIGgRdWadtvxDaXOQO9WKpws/IY/cuMN5nJTi7lITgk3ktoMcvtnhSZWpHX6dvC/4HGqyAHiRZrHaJYrEQTefFIkX5DoPz+d7BbG33fDUilvys4AgeW/kPKoKk3cvK0tGB+oi17hP3j0HuCT4dsw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC 5/5] xen/x86: livepatch: enable attaching callbacks
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Ryo Takakura <takakura@valinux.co.jp>
Cc: xen-devel@lists.xenproject.org, roger@xenproject.org, 
 ross.lagerwall@citrix.com, sstabellini@kernel.org, julien@xen.org, 
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, 
 teddy.astie@vates.tech
In-Reply-To: <20261023045808.165276-1-takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
 <20261023045808.165276-1-takakura@valinux.co.jp>
Date: Sat, 24 Oct 2026 16:36:30 +0200
Message-Id: <179285259082.1706038.15527286146285697701.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792852592; l=8401;
 i=bernhard.kaindl@citrix.com; s=20261024; h=from:subject:message-id;
 bh=+fay1ejbAGa09W59MkkT5Kd1/LcFn5jvvQhnTsn0IaA=;
 b=UYy7qtRKJDf1ceZMBoQ32BdINJoaCeYyxvgsHsO0NOKH9kz+pj8/rzHu88JrT7xejqqh9271u
 ozenAtdAFLLBkqAdfPpQGQTUmF7HpxFRto6FcUyEjA0mIH/NZqf4D5V
X-Developer-Key: i=bernhard.kaindl@citrix.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=
X-ClientProxiedBy: VI1P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::20) To LV3PR03MB7707.namprd03.prod.outlook.com
 (2603:10b6:408:28b::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7707:EE_|MN6PR03MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 0083b2e6-4f3f-4894-fff7-08df31dc3586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261021121427099003|6133799003|18002099003|261021130227099003|22082099003|261022115727099003|261022113327099003|261021135927099003|3023799007|261021123027099003|261009223027099003|4143699003|11063799006|10067099003|261021133027099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	X3fubiCXlMY5Oqo5KkWEJcHXRwabFgctQjvBAZOIoeXnqtGnO3MYJCLBysLRWaZjigurMpI5795eIVaotTeqBRZgb65Iy3fVt8uQJinwcDzFvK3SHzu2dBkSLLsmPArUxCLiKvnFhrjq5jhg2rLOkGLvbayQn2FUrud+xOZtuU/RYRCBo+oZzj13GbZqzlQeLDJorfHsj2161WZLSsgKBkWb/+D7ejltjWZuVYQcFPmhhsWxjp94aled24R5W0LQoF3R8Bt74Nzz+a0o+chqK45sr9uocEcEcpipec2DZFay8vWnmPOCyRs+wHd69ZllZCyRw9zneQ+8/FLy3nSfQNe45Kid1PEX9J09BIoXz5PfsyEfRkDXcpb4/FYdq3Kxdn3sHjeG5fv5H7SsvZIrG7kvUP4sHRayIhAPKawFsnY/sKkq5iFaVbWAF8jHbH3VKPyIQf29854K8/+RyAyE4OYIIHxx/3yJV6kqLrPOfB/7mlj6gup200basLUv0bbCLS+K2/+ca5cTQGt6tt+8dmHBgNhXutBsIYyIGd+oLs4cYozotpjQYmgTIMrNMCyvxyqM8dA5W4WTdymNASl5k5COex5dhH7plSKE1eqkTPz4lXzj4xSmYCRaP94WVwrvk2d/DzK3aj6T+GH8Z7gMk2+bAHJ6zL3c7dIS+QZo6Ek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261021121427099003)(6133799003)(18002099003)(261021130227099003)(22082099003)(261022115727099003)(261022113327099003)(261021135927099003)(3023799007)(261021123027099003)(261009223027099003)(4143699003)(11063799006)(10067099003)(261021133027099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUVPUW9RYVkvTUJ3UTRKeUtHelF2RDBSZGJwNk1mZFhIZldranI5N2JCMlFW?=
 =?utf-8?B?dStoUU1UNjdnMXlzckM1NmQ1VnA2MUdCZXVtaTlrVDNZbzQxVUplekZnNE5X?=
 =?utf-8?B?eEtHZURvZXdtcFhnK1dOUTFKd0lmd21PVGJ6REhyN2RCSnUzZTFZRFJQVW92?=
 =?utf-8?B?Z0JmUCtrYnNGWTh0L05KdHRJNjFhYi82UloyOHIxRVJnWEFHTkQyR1lhZ25Y?=
 =?utf-8?B?TmlBajlpOUdXcmVBMEw0a1pWMVhqUWYyWlQzd2krTnBBdzFUWVpBZTBUN0tp?=
 =?utf-8?B?cnpLUGhVRlJab1hWcUc2UDlDNDc2NjFPb2t0OE96bTE4MW9jWDh4TEliWWR6?=
 =?utf-8?B?M21xQVI2VEZSU3lsRmw0M2E3eW9mSHBUUXFVcENoN3hSWVZSbEJvR2tPSCtV?=
 =?utf-8?B?d2JaZThaTjFDVE85ZFVwSDNpaGFrV3hkTkI1dVlZeTRwbmxuN0l0TFpvNmsw?=
 =?utf-8?B?NXNrRWQrT1MzZFFkdXZtWExFdFQ2KzhhelhaQzV2ekt1NWlaN3VidUdreXBy?=
 =?utf-8?B?SUFDK1hjRThlRW00Uk9kcTJCQ0taVEs0RjAvQTFHQjZ6ZmVCdThaZUVEZnQx?=
 =?utf-8?B?czJKYUxEc2xESldJYmZCLzNsbnlZTTh4UUMyT3FnZFF1UDd5bm5FZlUwZlM5?=
 =?utf-8?B?a2lzaHpEb1Vsd2NjVS94L1RhYVdBTkY0TzdaanpkWEc3WnVGdk9zMUZ5TXcx?=
 =?utf-8?B?aHFtZlUvRndHUGxMcENzbHZhazZGMy9RRFl5VllXU2RzV0J4ZzZidGhaME5P?=
 =?utf-8?B?NTRyR3dCSlZDd0lWcFBqZXhYZC8xdEZNVXBidU9ZTTJ1N0UrY1F6cmRTM0Iv?=
 =?utf-8?B?Q0FqaGo3Yjcvbi9SR25hekkxdHJRMGw1ZzFOa2dVc0FkR1N6QnByZWZVaTFm?=
 =?utf-8?B?bThWZFV5SHNUanB4QXZUNnZjUzN1RTF4K3hBVXpXMG1ZSjJwZXVpYm1jOUZK?=
 =?utf-8?B?TmZvNC8xN1ZSTXMzakFRcldVSVVzZE05VlNqUlZvVWVvakJFZ0dvbzR5Yita?=
 =?utf-8?B?bFl0eWd2bVAxM2c3Vml1V29kVUZ6bUZuT3NYOHFReGt2WTFnRFFXcHNYMThs?=
 =?utf-8?B?U3lJS3NGNjBDeXFZNW92K0Uzbys1NllTSWgvTk4yUXd5NWpLcG92NUNlQ3Ay?=
 =?utf-8?B?REM2SmJENStZYUlrOGdHcnpWWWU4Zzl4MjNRd1Arc0NvRUVPbCtleCs3bHl0?=
 =?utf-8?B?Nm80Q0gzMVpveThWU09LelNXeGowN3loblVsaWJFQzdlYkJJK2c1S2YrckNN?=
 =?utf-8?B?bGxKK2RWckxhMjAvazZQZlF4cUpoSXZNQzZFaDhOSmtCSW44V0dERWJIVUx4?=
 =?utf-8?B?VUkwYW5xZG56dFFwcjkzWDNTaTBBdWZwMWFUNnNxUkRWWm0wUEVvYWV4WnZx?=
 =?utf-8?B?TndCNXR4N0Q3eVQxNU55TWk3ZHlLT2RsR284aitXb0ttUGl0Q0dIZ1k4TXRZ?=
 =?utf-8?B?V2tKNERLTGZoVkZjRW9sVC9OeEJtR1N5NUVNM2VtNEVXR1lCS1VUN3dkSGVE?=
 =?utf-8?B?aXJJMHd2ZnNFeFJ6SkR1YWo4UE91am85NkJCZDZkUWF3NytCTjg4Szk2a0No?=
 =?utf-8?B?b2xFcWdmTzBjZ2dJWG5MRkswNmVlWWpYblE4eDN6TzdWWnlmc2ZwM3VGcTVt?=
 =?utf-8?B?UXVpOTlvUnB5MWluOG44b052a1FLZndERUF1RGRRdzNJV2loZldFSlo4Rm96?=
 =?utf-8?B?ZGpETDNXcEVBTzAvR3dTSkNMdnNPS0lZbmNJUTRHVDhiYURoRWxMUGlqSDBX?=
 =?utf-8?B?NG5jak5TMDFobTJqWnkwOHZzQ3JWdFRRem1yMVNSWG14ekViTFErb1hnZHRI?=
 =?utf-8?B?SWUwRU5FQ292ZlM5MDVHL2N4OE1NakxHQ0YrQlcwbzAwUWVjeCs0MnNzSFU4?=
 =?utf-8?B?djRhNXRPMFN0ODBVVnZwazU0RFplQnEwdU1vRjRaekl6M3lKajRxbENSbngx?=
 =?utf-8?B?eE9DVTc1N3ZGMXBlS25ST0VtT1NPYVcwbTVqTGFCODJNZXNvTmZNRjc5dkVP?=
 =?utf-8?B?MU9hQmNkSFhIUlQ0SG1kMUFaYm9sT1R4bmo2ckpCcjJCYkZTenZkck9hNmNw?=
 =?utf-8?B?L1VvOGZTaWVzQkV5SVhCaHR1ZDJOR2tTekh1a1ZNWjlacmh1MFRIaERma2lW?=
 =?utf-8?B?UHdJTHJkSmVCVWNCQWlVcDM4OU1MazFNTkc5K2p6Z2FZMFZ3dEpGM0J0UDBJ?=
 =?utf-8?B?Z084UEdwbTJsam40dnhOZzNmNk1jT21PNnZNRGorVHc2d1FZRWNPaWxLMDB6?=
 =?utf-8?B?eWpKejVjam5wU1dEM1dxRGtoQUx0R3NDL1FNRVVBaStNbTRoQ29Zb3BrZ2tC?=
 =?utf-8?B?ejBhSVVTTjBXWDBsNEJzSmgvcHg0L0hEdjJtWG9sWXhZUjdVQ2d3NkVoVjMz?=
 =?utf-8?Q?Xar/GAroAR1yB0Bo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0083b2e6-4f3f-4894-fff7-08df31dc3586
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 14:36:37.2645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38wsK1nJfXSrSAvCyA1ITi8vk7TGtSZgTmVrLIH0CtEs0x545jWAUCIC3j8Zownj9haZ/XF+o9QC3l97f3ukHVhQoqrKARvTEnVDQQMavQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7624
X-purgate-ID: tlsNG-42698a/1792852601-AB4D39EA-6B3C4D94/0/0
X-purgate-type: clean
X-purgate-size: 8401
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryo,

Thanks for including x86 support alongside Arm64. I'd like to help
review this part too, although I'm still getting familiar with these
paths and have used LLM assistance. Could you help me check a few
interactions with tracing itself and the existing x86 conventions?

> --- a/xen/arch/x86/livepatch.c
> +++ b/xen/arch/x86/livepatch.c
> @@ -365,6 +369,35 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
> +#ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
> +unsigned long arch_livepatch_trace_entry(unsigned long addr)
> +{
> +    if ( (is_endbr64((const void *)addr) || is_endbr64_poison((const void *)addr)) )
> +        addr += ENDBR64_LEN;
> +
> +    return addr;
> +}

Could this helper itself be selected as a tracing target? It appears
to be an ordinary function in an object compiled with patchable
entries, and dispatch now calls it before reaching the callback:

> --- a/xen/common/hypfs_trace.c
> +++ b/xen/common/hypfs_trace.c
> @@ -141,7 +141,7 @@ void trace_dispatch_callbacks(unsigned long ip, unsigned long parent_ip)
> -    if ( (unsigned long)global_trace_func.old_addr != ip )
> +    if ( arch_livepatch_trace_entry((unsigned long)global_trace_func.old_addr) != ip )
>          return;
>
>      callback = global_trace_func.new_addr;

If the helper is the selected target and recording is enabled, could
this call enter the trampoline and dispatcher again, which then calls
the helper again before the recorder's recursion guard is reached?
What would contain that recursion before Xen runs out of stack?

Would excluding the helper from instrumentation on both architectures
help, together with checking the rest of the pre-callback dispatch
path? The Arm64 helper introduced here looks relevant too:

> --- a/xen/arch/arm/arm64/livepatch.c
> +++ b/xen/arch/arm/arm64/livepatch.c
> @@ -497,6 +497,11 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
>  #ifdef CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY
> +unsigned long arch_livepatch_trace_entry(unsigned long addr)
> +{
> +    return addr;
> +}

To illustrate, I think the helper's compiler-generated tracing entry
could be excluded with a small change like:

--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -497,7 +497,8 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
 }
 
 #ifdef CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY
-unsigned long arch_livepatch_trace_entry(unsigned long addr)
+unsigned long __attribute__((patchable_function_entry(0, 0)))
+arch_livepatch_trace_entry(unsigned long addr)
 {
     return addr;
 }
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -370,7 +370,8 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
 }
 
 #ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
-unsigned long arch_livepatch_trace_entry(unsigned long addr)
+unsigned long __attribute__((patchable_function_entry(0, 0)))
+arch_livepatch_trace_entry(unsigned long addr)
 {
     if ( (is_endbr64((const void *)addr) || is_endbr64_poison((const void *)addr)) )
         addr += ENDBR64_LEN;

Would this remove these helpers from the compiler-generated entry
table, using the same attribute as the dispatcher? It only excludes
these two functions from compiler instrumentation; it does not provide
a general recursion guard or audit their callees. Uploaded trace
payloads would still need trace-site validation to enforce the same
exclusions, rather than relying only on HypFS's entry-table check.

Separately, does the new trampoline need the mitigation-aware RET
abstraction used elsewhere in Xen?

> --- /dev/null
> +++ b/xen/arch/x86/livepatch-asm.S
> @@ -0,0 +1,60 @@
> +        popq    %rax
> +        popfq
> +        popq    %rbp
> +        ret
> +END(xen_livepatch_trace_caller)

For reference, the existing asm/asm-defns.h, included through
asm/asm_defns.h, contains:

> #ifdef CONFIG_RETURN_THUNK
> # define RET jmp __x86_return_thunk
> #else
> # define RET ret
> #endif

With CONFIG_RETURN_THUNK enabled, wouldn't a literal ret here bypass
the configured return thunk? To illustrate, I think this could be
addressed with a small change like:

--- a/xen/arch/x86/livepatch-asm.S
+++ b/xen/arch/x86/livepatch-asm.S
@@ -56,5 +56,5 @@ FUNC(xen_livepatch_trace_caller)
         popq    %rax
         popfq
         popq    %rbp
-        ret
+        RET
 END(xen_livepatch_trace_caller)

Would this preserve the configured return convention with the existing
include chain?

I also wondered about the C stack alignment at the dispatcher call:

> --- /dev/null
> +++ b/xen/arch/x86/livepatch-asm.S
> @@ -0,0 +1,60 @@
> +FUNC(xen_livepatch_trace_caller)
> +        pushq   %rbp
> +        movq    %rsp, %rbp
> +        pushfq
> +
> +        /* Preserve general-purpose registers. */
> +        pushq   %rax
> +        pushq   %rcx
> +        pushq   %rdx
> +        pushq   %rsi
> +        pushq   %rdi
> +        pushq   %r8
> +        pushq   %r9
> +        pushq   %r10
> +        pushq   %r11
> [...]
> +        movq    8(%rbp), %rdi
> +        subq    $5, %rdi
> +        movq    16(%rbp), %rsi
> +        call    xen_livepatch_trace_dispatcher

For a build using the normal 16-byte C stack boundary, wouldn't the
traced function enter with RSP eight modulo sixteen? The injected call
then makes it zero, and these eleven pushes leave it eight immediately
before calling C, rather than zero. Would that give the dispatcher the
wrong incoming alignment in such a build?

The existing xen/arch/x86/arch.mk makes the reduced boundary conditional:

> # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
> # this to be overridden elsewhere.
> $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)

Could the trampoline establish the dispatcher's required alignment
without assuming this reduction is active, and restore the exact
original stack afterwards? Is there another build constraint which
rules out the 16-byte case for this feature?

Finally, could the x86 entry checks address the same restoration issue
as the Arm64 path discussed on patch 1?

> --- a/xen/arch/x86/livepatch.c
> +++ b/xen/arch/x86/livepatch.c
> @@ -365,6 +369,35 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
> +void noinline arch_livepatch_apply_trace(const struct livepatch_func *trace)
> +{
> +    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
> +    const void *new_addr = xen_livepatch_trace_caller;
> +    uint8_t insn[ARCH_PATCH_INSN_SIZE];
> +    int32_t val = new_addr - (site + ARCH_PATCH_INSN_SIZE);
> +
> +    insn[0] = 0xe8; /* CALL rel32. */
> +    memcpy(&insn[1], &val, sizeof(val));
> +    memcpy(site, insn, sizeof(insn));
> +}
> +
> +void noinline arch_livepatch_revert_trace(const struct livepatch_func *trace)
> +{
> +    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
> +
> +    memset(site, 0x90, ARCH_PATCH_INSN_SIZE);
> +}

The existing arch_livepatch_verify_func() in this file checks the
replacement space like this; these lines are not added by this patch:

>         uint8_t needed = ARCH_PATCH_INSN_SIZE;
>
>         if ( is_endbr64(func->old_addr) || is_endbr64_poison(func->old_addr) )
>             needed += ENDBR64_LEN;
>
>         if ( func->old_size < needed )
>             return -EINVAL;

ARCH_PATCH_INSN_SIZE is five in asm/livepatch.h. Am I right that this
checks space but not whether the original bytes are reserved tracing
NOPs? Could an uploaded .livepatch.traces payload name a sufficiently
large uninstrumented entry, have real instructions overwritten, and
then lose them when revert substitutes five NOPs?

Would shared trace-site validation for uploaded payloads and HypFS
requests help establish the original bytes and reject overlapping
ordinary livepatches? Could the applied offset and restoration state
also be retained rather than inferred again from a potentially changed
entry when reverting?

Thanks for taking a look. I may have missed a guard or architecture
constraint elsewhere, so I'd appreciate your view on these cases.

cu, Bernhard

-- 
Bernhard Kaindl <bernhard.kaindl@citrix.com>

