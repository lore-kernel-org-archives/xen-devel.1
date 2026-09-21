Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D7DC982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 16:00:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427717.1650515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gRB-0001bh-7e; Mon, 21 Sep 2026 16:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427717.1650515; Mon, 21 Sep 2026 16:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gRB-0001ba-4h; Mon, 21 Sep 2026 16:00:13 +0000
Received: by outflank-mailman (input) for mailman id 1427717;
 Mon, 21 Sep 2026 16:00:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x8gR9-0001bU-Eg
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:00:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8gR8-0054h6-Rc
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 18:00:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab15474-2eae-0a2a0a5409dd-0a2a4501a538-46
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:00:10 +0200
Received: from [52.101.56.9]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab15484-5984-0a2a45010019-34653809fded-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:00:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8253.namprd03.prod.outlook.com (2603:10b6:806:460::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:00:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:00:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLRz+PsGzZtMdYYpuh0sDGb3eyoC0SmzXufAIgUR81suGyU/6dsN+p0SOK3PRITzGTynjeKfPWoOWTRPaGpsMWPtvOhSR9miFI2mHixpUZmGFTiiOUWzUkUorPHHqdxfob/AdmmabtMZ94BcT7Y469fP/2Bbg23d6D9nZLggDoaX2YNDSVsD0A7k8eaeW5w4XNBgIHKwCCWkibLu0aq3RmC8yKWoBQM9NQUEralDXAzQgOrDHW6aypuKiNpzrOnx7kgWQ36vzXRWJIWRf8Q+WdC+po6nAjGIkLC3d+FuWtvU3VOanBB//vcM2GR2aLFh6FOik3HUqeKVOsh9sFU0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OhYU2mB4nT2Ah5/JwcFnN31S/X7UCpA604MkY/mE3w=;
 b=ql4MXFcnUcZHbPC9fr5aS8iWZCViX5wkX5DfeXlGEdZ6aeWIwo4AOx4IN7f6Tb9ztlVyItTEu6oyVPaQr/w/PeQ0FsGovDUy/c2rF7UelowAFOZUy/gR4IBAsz2HI6rHMDsyv8Io79l/06rrtOHtmhKkjzNcNqzEv1JPK+JCn/N9bdgBSnoSAM2H75WYaWiUPrpsS4a1xzV7X1WQx/fwPT/9F9JqkElNBnpPC97gVCr3mM/8Ix0BqnESl7NiqE1CPPrUAWEpTgps8bEUo8f4ZExnlMxGC3j3MUz9OApl2Rbg5PFRQ81gCLuRC3A/BNTjWt7fUkFam+dee9HsZbUWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OhYU2mB4nT2Ah5/JwcFnN31S/X7UCpA604MkY/mE3w=;
 b=DidH0/H0W+cBbsr92NS6y69cVLtRtWuDKJenfpqr2oNzr8xkosfc51wlcgba0sUQaNwhyUmxVo6XCY4i0ln2CjMHIlTyui2NIF2wYG4zcMmf94EsTBMtIqd+qS38lxa1VLwJVu1XfWZDGcogwBbp64tqMh20Hdf87oJUF9K7znA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1cef5505-79f5-4319-8334-d3ee809bde7d@citrix.com>
Date: Mon, 21 Sep 2026 16:59:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/vpmu: Fix incorrect printk format specifiers
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260921091651.34761-1-alejandro.garciavallejo@amd.com>
 <489f6ce6-2be7-4c94-bcf0-21fc6993f98c@citrix.com>
 <DLKXDDFXWQHS.3KD2N2G4MYVM1@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <DLKXDDFXWQHS.3KD2N2G4MYVM1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: aa44f648-ff41-465b-f834-08df17f96590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	epkqAdUmssvIxVMPyMC5DaoiPL2K96wYqsN5UM/QYPSvBR6mt+vnijASG/g9ojeDG+9aFuU02peogOqUPGrDU9jHaDu3Drjsqk0oGH/SfqDOQBioFuryTuKRRdPtIuZXHtF9O1Oq8NvCbx4tCIcUqqMJdzxb13bekGcsx7txGUA4loV2M0uVCZgcWSPmM7BMvvNksJxlIzIzUU6WaP7/YMp/4v7Kprd0lMtSXPwRlENddn/AwE0aSeuGqmYvouCYUCSVoBGrxvPrRZrpEumiv2LoqUn1LpYpsObu+Femybax+OtlrhiVpJXt2WTDwfrG0zOqB6m+T2D1+kWMFSMJQUo8xJ4eWB0QIFBQubdD5okJHJMJRau2LaHisk76jLWvFahVBeZZSqIR4uBqtQMQu7UmP10QWqLOmtNaCsHHRvPugavJY7edi0FDaeFI6jJZwDNrbGK2V/4ek9sroIqPE5aMJiVgYpcNdqK7KF2zKFiTrnM8nhzokfsrV3YU6gQXkzuW/gxBBuac2ygQhI9Km8eZ0JjLhC+RPWdR1BuSi1qBTtNeGUto+Fm5KPQ36C7RfgD6i4uWq227T/4bVLO9GxnhYgUOEdGCxymzLp6qLqineznqYlbSd2N8zFQaBpemrcL4Dq3qEhoTzHYFjSquUWpnGS0tTIGcICdjf5+xz1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkE2QWVzU1JkSmhCMXZTSHlqQ3lUZjBicjFqOExVOEQzb1NMaVp5NXBTclpj?=
 =?utf-8?B?eURDQ3FPdHlzN2hvTWtNMWtiOUlUMmUxZkZXMmJ0aGV1NDhtQVpoS0IyUEVX?=
 =?utf-8?B?L3hXVldzQjhqa1NYbTYwOWNZdnVEVmNLVTlOdFJ0UjdzeUE0VFhhY3lhWEla?=
 =?utf-8?B?S1JWeVZoaWZzbVJsVysybmp4Q3JQK2gxNWlmVjVTVnZRWmpHdFpCRnFEQVdO?=
 =?utf-8?B?Mkl3anNaZ0RUV0pXRXF5NE5lRk80cFI4eXhPcjNZelg3dzkvUHhuOXp2UDJP?=
 =?utf-8?B?MVdteHAwTkwyRXBMVThrZnd1NXNNSURyNTZ4a1NyU0VRdU1ZV1prdXNyNE9t?=
 =?utf-8?B?eEU4dUFkNStPL2xBZTVUamlPckJQZ1hvaW1HMkdjYm9Ea05aZVA0R2pNNExK?=
 =?utf-8?B?alpPckhHZllGdWlybWtSa0ZxMzh6M0pIbkc4cmRUMTRmdTZjZFFXWWdpSjVo?=
 =?utf-8?B?Zlg2MXRiSGlBN2Z1RlhMOHZxNHpKdDEyWEo0ZmVkdU4xVTVtNXZkNTVkd2hK?=
 =?utf-8?B?U3Y5bzBZdjBBUGdsWS9XVTlvV2Q2OU1uVnNLS2szT3FaK1FFWnJSNUtPSGlB?=
 =?utf-8?B?b0tadklLdE8xQm9tYnpCbXhLQi8rbUJxUGdwbXRDdkcxTUZQOGt0aUl2ODNO?=
 =?utf-8?B?dFNGanQ3N0Vtd0srMHhJMUo1dVRZU2JxSzk2M044SVo5TmExeW5xS0w1Vkh1?=
 =?utf-8?B?dXh4bGlzVmdUTEcrVHNaek5pcGdvSUNDc1JTYjl4YU9KSm0rQnRGZG1tV0pl?=
 =?utf-8?B?N1JGUnJIYWRMZDAxemZQT21KTE10WmxIbUhLaVFkYSt3alg2bGV1bG1QWnAz?=
 =?utf-8?B?Y1luRi9Jb3VNMTdIQk9IYXFpU0lVeUNobm0wWlRyenVwWEl4aC9QZC9IOVVk?=
 =?utf-8?B?V1ppUkRiUjVSQzlQNHpPVmRNbXhuYkpxL2YyUDFOS240eTdBcTBKVFZ3WHhD?=
 =?utf-8?B?ZERDSFUzQ0FDVDlVT29CQi9DTXg0Rkhua2l2MGNtYjVoa1BwS1JjVkc4TWR2?=
 =?utf-8?B?NE9OYlQzZW1YRnI5cDhSODAvMTJTK1dxMldxbVI3cnROZTFzckNWdjRUV1U5?=
 =?utf-8?B?UHk3ZytHdTI3RGd2RHQyejFSSzZ6YWxWRDZoSzhidEZWanFUT0h1YjRVMDFX?=
 =?utf-8?B?dXBFLzBheW5OK3NkcmlqWWNFd3hTVGkzdUVzdW9WdXVtVU9RaGttTXVVL0lj?=
 =?utf-8?B?aEtnTkdib1lGMHpDSE5RTmQ0S05TZGl5RTJnQm1MaUxnNTBlckVXSXV5OHVG?=
 =?utf-8?B?STI2TnA0VWR5M0JWblpNekh5SE1lQ2x5bnJVY2FsRG5mVFFxYkxzamJhdzRU?=
 =?utf-8?B?dzFaVTkyeEY3NnJ6OXY0V00yUVlTaVdhbi9UckJZTE0zdjk0c05nKy9vdW1Q?=
 =?utf-8?B?ZEFuMjZvOE9qRVdQd2IyT3F0MjlMOEZUMk14RTRMYWsvOFVFQ3dkQ1NJbEly?=
 =?utf-8?B?Rm95NFY1WE53TXJ6aHJpbStsd2FWV0svTHFoajBkU3RDTzYrM0EzN1VSMWgx?=
 =?utf-8?B?V2NnRFUrRm5lVVduZng3blc3ZzZRK0xOZWhIcU45ajQ4eWlKNUd6bnlVTlZ2?=
 =?utf-8?B?KzRscDRWMmJYVmJDb0U1bVFnK0ZIaXdpOUsyNzFLQ3QwQ05KYjRrN3RwMFBo?=
 =?utf-8?B?N0lqaHhOV2pPNmUwU3hnalZrM3djWjhmK0h0RGdNazBNRlZ3R3RXTDdyMStW?=
 =?utf-8?B?alUzbGM3RzFoZFg2MmFzT0lMR1JlTzl0akM1NFJSdXZ3Z0NPejBOeUpMWnlD?=
 =?utf-8?B?T1JpK2plNERPSFdkRk95TmF0MGVVdU1hdlVDOWxwRWxIWTNQTFJNYVJCZ2Rn?=
 =?utf-8?B?bC9BalFBNWRRQTdnMGN6ZFI3Um1wNEdhc09WUkVHTzRtTGlhSHQ3d29uUGxO?=
 =?utf-8?B?L1JrM3oxUXFESkQzYnFqZjMrRlpQY2JTenBkMFJ1SXQ1Z0pDRUZpc3orSTU0?=
 =?utf-8?B?aFZxUXJPV0hCTFdkUStVeXNQM2dpRGFONEZsY2VyWktFQ2F6MmVvc1d2U0Fz?=
 =?utf-8?B?S0tGSE9IdFBhR1VpVWNUMkR5UVVBRWRzM1QzTERXSTRNdTYxcGpHc2FMclNj?=
 =?utf-8?B?SE9tS25mOVlybjdLcHBBNnhGWGNCTER1cVRXVFdMQzkrV2dCL2c1MGxoc2c4?=
 =?utf-8?B?a1J4bk1STVRvNmtkalQrZ0cvTEdwVEF3ajd5SVRFUVZxWFFqRDZyV0Fzb29H?=
 =?utf-8?B?UnAwcUU4Y01NaGVlczNIaEhZNDNSWlg3UmpPeHk4SVMybFdDUUMyOWhLdDFh?=
 =?utf-8?B?RGNYbEowUTlmbThjQUVGcHE5UEpVdzBsQkgyZVJIdmJ3a0p4VkI2REJ3b0Fi?=
 =?utf-8?B?TWdId1RTWXBZOEFDSmY3QmR2WWVuWFpSaFZ5b0tadSs1MTRxZFgxQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa44f648-ff41-465b-f834-08df17f96590
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:00:02.9940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b66VBh5+CuURAsUKxm3aDSAzRRFW+5NP5qw0Pe9C0OeWO0JXYraQaY+tEPg2F7fICyGMS1YYhe0MkTHwe3WjcLQzSUvhlZOtykFGDbtqaF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8253
X-purgate-ID: tlsNG-d62444/1790006410-BFA6E757-2031CBE4/0/0
X-purgate-type: clean
X-purgate-size: 827

On 21/09/2026 11:33 am, Alejandro Vallejo wrote:
> On Mon Sep 21, 2026 at 11:30 AM CEST, Andrew Cooper wrote:
>> On 21/09/2026 10:16 am, Alejandro Vallejo wrote:
>>> The patch in Fixes adjusted two vendor variables from uint8_t and plain
>>> int to to unsigned int. But they were both used later in printks with
>>> the %d specifier rather than %u. Adjust accordingly.
>>>
>>> Fixes: 39a9a49449d7 ("x86: Remove x86 prefixed names from x86/cpu/ files")
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> If this is going to be a problem, then shouldn't we turn
>> -Wformat-signedness on?
> I tried that before sending, but that needs a whole new series. Things
> are not quite as clean as I'd hope.

Well, it's going to keep on regressing until -Wformat-signedness is in
place.

~Andrew

