Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85F60A5BD1
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yIbetTNt
Received: from list by lists.xenproject.org with outflank-mailman.1481749.1685668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlcM-0003qU-W3; Tue, 10 Nov 2026 13:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481749.1685668; Tue, 10 Nov 2026 13:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlcM-0003qN-Sm; Tue, 10 Nov 2026 13:10:30 +0000
Received: by outflank-mailman (input) for mailman id 1481749;
 Tue, 10 Nov 2026 13:10:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xQlcL-0003pv-6i
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:10:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlcK-00BBOk-Cm
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:10:28 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af317b6-2eae-0a2a0a5409dd-0a2a4505e19a-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:10:27 +0100
Received: from [52.101.43.51]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af317c1-4cb1-0a2a45050019-34652b331909-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:10:27 +0100
Received: from BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 by MN0PR12MB6080.namprd12.prod.outlook.com (2603:10b6:208:3c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:10:17 +0000
Received: from BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c]) by BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c%4]) with mapi id 15.21.0569.009; Tue, 10 Nov 2026
 13:10:17 +0000
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
 b=W9w+zUIBHIVa+sambrbhqo0veEydkqR1fxCQeZWDc3X3HcavxtdCBfak/P5fURn+/wsCiXi3Fr+hyLE4RoIpvUn1T/PlU/FnET0kb8siEFJr+uZh4V8mhvmVAsFVPiSlysJJvg+wZlhqf0in7ltorOu89bx9+sIKuwHIWieZdG0V61QZgPz9zkfJwtJIUNeCUfOqwAgtuPtQSL3hxlpibRTCfEO3PKVhw3aEPXcN0gUtl6qOphZW1fP5cd4d7GRz7pxZs7kQPQxgD3/oFuXOjKT9To1MhQiq72Gv2oE4eYknxR6tPRV3faXdjRH3VfJCbAWRu/6qKD7MamK1l7UWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORIXRxBWxF5bDZDrVCcKh591romBOFDqJSpUOA00wpU=;
 b=EMXQnY8FTLSqsTgdL6knZbmA4V5Pt+X8D7iy67B1n3cERUf9pX+EfC39upo6qpqmZN750wsW74V+uhatCpLHg8XS4Zc1BQRB+ELM3HQgYvOIBQZEenvdjxwR8/07pBYTq7OPcoHoPKWtZW7Fv83VoOK7IrxEjcHS80kd1a9OtS3/q9KdAPP/UCYVIxZWdOvKDZJh8uE9yoD8w4srTFOuEtShPg7Z9oJBTLhs1fl5uKLR5Y867TM2Xz2HwRtNcGp+mRoCt1DGGLR3rL4lgCyp59Pqmq+Amrv8QMuKPgZJZ17t3hE6PkHP8ZTB4QY4bZsXiwnZNd5FZsKb5k8+CdbCSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORIXRxBWxF5bDZDrVCcKh591romBOFDqJSpUOA00wpU=;
 b=yIbetTNtbT4AyC9tCol413FH5IbGqa538YO6L3K/WjigzvWd78xDf8pDOef2r77EEiY9+oyKNChgs3VTeH2wmSsmmBqBXgPnGIusyJG9/UuqDLCE26PaG2JTVkbyJWtdWV4rl/kG4L2+v0cEGAplmtsantbrC0c/pEF/J/UiYPo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4fbd1e45-159d-4483-989a-e2f37e182aee@amd.com>
Date: Tue, 10 Nov 2026 21:09:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] misra: deviate R2.6 for the labels generated by
 CASE_SIMD_*
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261110071231.2888628-1-shuaidong.chen@amd.com>
 <20261110071231.2888628-3-shuaidong.chen@amd.com>
 <49b1f05e-ed9b-49fc-84db-ede026e55343@suse.com>
Content-Language: en-US
From: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
In-Reply-To: <49b1f05e-ed9b-49fc-84db-ede026e55343@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To BL0PR12MB4754.namprd12.prod.outlook.com
 (2603:10b6:208:8e::26)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_|MN0PR12MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: b06808bf-8768-4944-a56c-08df3f2bf6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003|261028144727099003|261102123227099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	ehMdYNzFk6+KJFLnxeOXdRJInRFYB4o2ggQPM8qXKwvkbwoXu9d4CM/q6ybQ+RJ5fwlHvy9pxFZXj7Jt1KS47CF0HypjrFdPgCCpN3kNYl+kXuj7+3NW597O2oIkZs7Eq71n52WPINzz3WgBSQyK/julkFYWIzbSNqqpj10o4nmACIWerJmp+nxylkNA8CmxsMw1nuMgl2EKlblRcggCLMD9HoeGIItkF9YOKg+hN5gAtQ1FAUZbzh89P8Zly8l8rH9x+oOXGlfOR3bL8+O4pHw91DKaOFHR4y4KDPxPgifVCl+3ZnOQJLemrxXop2tzfiCCmWaiyPtwH9UPBrJYQUL4wREzE3sldJWqoxp7DdfD1zQzCIrFm8MUgeiTLwfCjhWPEu8mignYYLnIkLE42+wVxClnuCq6gPxJkdecJvxEIKcWXXGKqm3vPf/w6CYMU/XyqcuEeWJHOtBDqEc+3r6Na9r3K1n2frgZ0HdpUo4dwWR/wOnCjj0gmmDY/Qt+bDVqAAVeBnReLBWoTn4Pd9nCDo3twnuzwEakkubnn+CFjc82TZPzCxo88SJarjQFjJ60B6HFbrbUEHo2Nq8xV45v7wURfNP8Qvm1TIrma3cW7GRt3i7M4/WDabLVW3bRRmqkwG+DKFrd8KEEkrN2/9Zm74gtOOlPPnsA9L23Us0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(261028144727099003)(261102123227099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzQ4WDdnZkZHbVcxaVVBZXRyekZTRUFqeVNJaGk0a1ZVOWRHNmpiT25ncDNC?=
 =?utf-8?B?R2xPNDBsb1B0cjU4SnR4VjRZbmQrUHpIN3FrMVZINlZPM0ZRTW9ZSlFzMnd0?=
 =?utf-8?B?eFJpY0VaM3U1OXZUQkdsWDVIejQ4M24xS0VjSzZXOTZReFhLVHlkS2tmbXcy?=
 =?utf-8?B?MXdEUEpWSlV6ZTJrQ3RWSGwrYUEwaUlyQVE3MUdoNWE5VTFoR3RhbnBKeGo2?=
 =?utf-8?B?eVRoendpZXROMTF0ckR3TXd4YXdWSHhFY1JSR01YaEJCaTZrT0xtZVJ2U2pH?=
 =?utf-8?B?Q1A1ZGdFMXRWaTB1Qkx5dVpBSk4zTGxxM0ZLYTdGUDEvUjVMN1hGZVBtRVo4?=
 =?utf-8?B?V1UvbUkxZDN2cGhoM2oxUDV1MGlpZS9WRmIvOFllRnlHVks2M1JQY3Rmcyt4?=
 =?utf-8?B?ZFRyM25xaWlBWjNoeUp3cnQyTXZMUUprSllobnlRVnRZR3JnNzZlbHgvWjZC?=
 =?utf-8?B?R29MMU9NQS9EOWRFS0p0M1VZSmRYYlJmVGNnT2Nrd0k5UWNMMk1xQUdsUk52?=
 =?utf-8?B?Z0drQlFyYmE1YWJSeEVVTmwrOEZIODdJMWtCWmdTQVZybjg5Sk83VUpsR3Bn?=
 =?utf-8?B?LzA0a3JjbWQ1RzBSdHVqeGRhY3BxeVFjbHNNdnprKzQvYm9TZVUrUFR4dytx?=
 =?utf-8?B?R0IyTjdtZDNLNmZwdkNqR3RmcUEvb0l0akRkbW5xWXlSRzllbzR0ZC9EUW00?=
 =?utf-8?B?UDRKMzFkRmY4YUpHdXl3Y0xFQVlidVl1d1VhZG5hQ2UzMFJSVkg4VDNkbXZy?=
 =?utf-8?B?dFRGMFVKMmdiOHVjUUUrY1pvWUhYZWJnQlk5NkF2NU5uSTR1U1ArQjZWMTFi?=
 =?utf-8?B?akdsTFdocG5seUQ3bHVvZWxHR21XUnRuMktyUkxUM2xnbmRpQVdXYXlsN21U?=
 =?utf-8?B?d0x5Zm5rNUhkYUxzR1NyaHBkd3RvS0NqRXpsL3dvOHk4QWgydXRxU2NReXFx?=
 =?utf-8?B?TWdVTHFFK2R4dEtKRGlHYmxrclZhWVlITkc4a1o3ajlEcmRyQnFRVEhwVHJm?=
 =?utf-8?B?NnVQRE9LODlscW03K2M3OFFHejJDZ3Y0VFIzOVVSbDBDalRIMlVrRENDQ0ZN?=
 =?utf-8?B?d3R5VjVCc1ptMWFiZU9KY1FxR2l0cFRORW5XanMyVitDak5xcnppQVQwMlpC?=
 =?utf-8?B?Sm45Z1QrWW0zZnQ0SWt0MWRQL09KVjMxaGI1NDBLQ3YwcDlXWUY1UEhmYkF6?=
 =?utf-8?B?Vnl1L2xCTkNDUUlKQjF1dnBTdnh2SnM2OHV6ckdtS2tVNWRHMTJLM2c4U3lN?=
 =?utf-8?B?UTdiYUthVHNqYlFrRXk3Um1FeDRsOEhMdDZmbXpuN1hFNTd3SlBXOU9nUUl0?=
 =?utf-8?B?eTBUS3NyS3ozYVd5SlNjNlN6T2cwRE01RjB5eW1XMDArNnVBM0dqbmtDU3JR?=
 =?utf-8?B?ZGZTNkMyZ2FtZUZnbVM0UGRqbG1waTg3KzFGV2RCYWNpbUtUKzRyeXlBaUpZ?=
 =?utf-8?B?WEgvU1F6TU0yOXk5REZPVVExMW9yQ0ZaNER2VEhTR0czUUc3bjBRKzFNQnA2?=
 =?utf-8?B?NlFwRjF4ZUQwOHRRaHJoMUR5alphclIzdnNiUFdCazFhRndSYytPK25JQ0h0?=
 =?utf-8?B?OE5xR1lmdFNTcHhFYlNYUlBCaTd3VUpaMGI5emlhYlFPZTVHUzNaV2VMNkht?=
 =?utf-8?B?bDhuL1VUMzhZZGpqcWhGRHFZU2ZNaGhSaDhBb0xyRVhMY0d2b243ZzRCSy9k?=
 =?utf-8?B?Yjh2Znk2S0pVVXlWVnp5bHNzREU5ZDE5MFNFMjg2TDNXRTZMZHFFaWpFcnNI?=
 =?utf-8?B?SVVOcmhTZ1dvcDJMeXlTSVl5MHVtcFdDZlpmeTFtb0EycmYyMjNpc1NwaDRN?=
 =?utf-8?B?aEY5MjZvWkFLV0Q2ZktSRWxSU3lubUJRRUZSODM2YUk0NmZsUjNxTmhSemNL?=
 =?utf-8?B?aFFDWW5YQkZoMFBSSEg0Vi8rdnU1MFZ4TjB0QjNFRTUwWjRycFBhSzJDK0kv?=
 =?utf-8?B?K0Y5RDVPQTRJR3Q2a0U4bXA5aVkxY2FQeUFYNG5UTkJvTnF5L1E0cG1KbUlS?=
 =?utf-8?B?MHEwKzR6cTc4cFNZRzNPU2FTM3pIdDcxV1RtTmVwS0xpanpOaWV4cTMxMk9Y?=
 =?utf-8?B?ZTVUYTNYaGpxa3VYcGgrNDMvNFVqMVBCOGZKQWtIa0dsVm90TTlROTcyZ0FF?=
 =?utf-8?B?YmJUTDAwa3BvZEJlNis0aEFJSkMvRExjM0QrRVBLZDdCYzc0WHlITksrcVZm?=
 =?utf-8?B?NnpuRnpKWnFxRnVFZnFxUk1MODJyVVZMYStGc1VUb0dJd2ZEWCsxZmxLK1pJ?=
 =?utf-8?B?bERWRHlTUEJJRWFYWkJQQlVqOUxUUDFwM2JNdS92MXlvWTh6Q1Q2MVlaOXVo?=
 =?utf-8?Q?GoVrWjsaFZ7GJW3nYI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06808bf-8768-4944-a56c-08df3f2bf6f3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:10:17.3168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnWDGMTJkxnNn9crbPy1/YnDizJ7P1HZ/g+hLKxeBEa7Ycbf8wkPU2uEU65nn4Rd9h2AhUSDeEbdcOz7l+ZVvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6080
X-purgate-ID: tlsNG-c201ff/1794316227-72AB72A1-1038879C/0/0
X-purgate-type: clean
X-purgate-size: 1913
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/10/2026 5:41 PM, Jan Beulich wrote:
> On 10.11.2026 08:12, Shuaidong Chen wrote:
>> MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
>> contain unused label declarations".
>>
>> When SIMD emulation is compiled out of the x86 emulator (CONFIG_HVM=n),
>> private.h defines X86EMUL_NO_SIMD and the CASE_SIMD_* macros
>> deliberately expand to plain identifiers instead of case labels, so
>> that the opcode switch builds without conditionals around every case.
>> The labels they produce (e.g. Cs0x0f_0x2b) are never the target of a
>> goto, and the build already passes -Wno-unused-label for this object.
>>
>> These cannot be annotated in the source: ECLAIR reports them at the
>> macro's use site, while __maybe_unused could only live in the macro's
>> replacement list, out of reach of the existing text-based R2.6
>> deviation.  Extend that deviation to labels coming from the expansion
>> of a CASE_SIMD_* macro, and document it.
> __maybe_unused could be passed as another argument into the macros. That
> would feel redundant, but if that's the only way to please Eclair, maybe
> that's the way to go.
That would work for Eclair, but it means touching all 82 use sites and
every CASE_SIMD_* definition, which is the kind of churn you'd rather
avoid.
>
> Like for the other patch I'd also like to understand why fiddling with
> emulator code suddenly becomes necessary, when we already have a blanket
> exclusion for e.g. rule 16.2.
It isn't necessary. I'll send a v2 that drops patch 1 and replaces this
patch with an R2.6 deviation for the emulator as a whole, modelled on
the existing R16.2 one. It covers all 91 reports without touching the
emulator source, and -Wno-unused-label stays as it is.
>
> Finally, for both patches - aren't your Cc lists excessively long?
Sorry. I'll trim it for v2.
>
> Jan

-- 
Thx and BRs,
Shuaidong Chen


