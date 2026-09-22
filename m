Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704B3C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:19:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428940.1651864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Kg-000265-VJ; Tue, 22 Sep 2026 14:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428940.1651864; Tue, 22 Sep 2026 14:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Kg-00025y-Sc; Tue, 22 Sep 2026 14:18:54 +0000
Received: by outflank-mailman (input) for mailman id 1428940;
 Tue, 22 Sep 2026 14:18:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x91Ke-00025l-P2
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:18:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91Kd-00Acw6-Uq
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:18:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab28e43-bab6-0a2a0a5309dd-0a2a450bb830-32
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:18:51 +0200
Received: from [52.101.61.14]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab28e4a-b7e8-0a2a450b0019-34653d0e3d52-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:18:51 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6980.namprd03.prod.outlook.com (2603:10b6:510:16a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 14:18:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:18:28 +0000
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
 b=s6/JBzYmEBtoVG2KWaaulwGK0Plm1W79lGiJsYhp1jGZZaNJ7CgiZzq3fq000qjV5VAzJiTqm9k+Mhj8ioANRlVcxB1WUjBEdjw3vIzBdhG77yXO7lVdbykkA83lJaA5CgGHSMfqcYKXIT54RhMbijMErXu4n/hsLOex1svqHTbaw0eP6cnnXR2dKDqs5bLDmbw702gZZUyEruZePLYROMh4LnDPq1ceX1vvTXHX7Z3XwGJ3wuFQqV0UI4o7S/palhVvy2eyi9UduAeTycWu9P9fC7lKezbj+MjHP8kiTSdxuaKxdHjnG5m8bTVsJ1uO4axrTLj/3/hebSzUQ2nFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIZMBydZ5HeX0ITvM+0L2mT/tEScmM17uSdyZ1JYSko=;
 b=pppJuBujiH+o8iwTmok4NYHf5GLPcOURM1gyaj7e/ZZ4f6KjAfyUwromGWASPr1jXzJfTwSMSNk9rwXq+GJRNJkjEdW9HTGIB1l+nBEuxHOPOkPsGaRXDI7tEwx4OQPb1H9a9pjdL05Dk75V7PU9/frQwLW4e0ZaUJjEPP5IT9NScrL0EvPBkNcjvJzTMRBiz+KHJXMBbWMEgrGGNgy7zniiR0NKEy6fQav7ZiOo4NEETElnYc5MGhmfJH/7RCJAWIlbuSlxcXivZahSsc6qnqGD/yQ/aTRN6P7fPqDOd8D560MZn3rWQBXCdzYAWa6u1aQMAorsP9QdQXC0BSZa/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIZMBydZ5HeX0ITvM+0L2mT/tEScmM17uSdyZ1JYSko=;
 b=O3OO9a8agP1Xp7B5lnox3NU8gbrw16D57uu1fcV3B908Z6shW2ZXf1mP6sPD//oqSyXv2YR/PRUzLjD9g5L7kmhn0NYUsvEhQ2A7Rusy3/IJy2S0xYeUkh3AcW6AkMKEvDqm6uN+lgpK7B2JdT9gn9TOluzrAqZoCsoBUXSBTE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e867cd47-a757-4047-9946-23a6c434dee0@citrix.com>
Date: Tue, 22 Sep 2026 15:18:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v2 03/14] x86/mm: get_page_from_l1e() is PV-or-shadow-only
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
 <4f7a34b6-b522-4d8f-a678-304ef4c0f916@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4f7a34b6-b522-4d8f-a678-304ef4c0f916@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0e6319-47cb-4eb4-77fe-08df18b45f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gGZvsufyTn16lO8KY0+P3UqN6jV6q4ZxuQopCOG5hcy24HTCcKQMf9sMcwT1wCbVnDhQwwputm7Lo9z/VROQPmB83u1Su7w1vSHYdOcv+g/RiuXs3Kcaf4FiehgVjW4Tox0DwcMd2vyhXp0BnZ8OyMdSAysfAUrZ9nt7OM2xFMTsja1uzqDNjyB/8JXnsnecAvr6hDfKntqTBxXsM03S0eQ7e0wn8VfKAhB2TUVKcxK4BbRf9KFmhVymUtw1A8AyZcR5LCY38ojAcbq17+kkAh7vFrwQ01OMPsDokjdduh/tAjRCoBqLPzhreZA+GLNLiGb0Vi0fG5SfrCqXFICO8CbUpC1tUhoSVLB+v9nD1Haj1vOMyq36T+6mrDD2se8FUK0YNKZlIM7XXnIdRHkldFNnpx00sXNqtdXmL8lyqqj5hP/NCTMYtH3Pv+gNPFi3y++NO1umx4i0JTTYK2XabrZH4CtqpHGAUmTZBAbUDHOccsWahxaIP0wS8EAW/BcZV+R1hbA/5AWL3twIPUq0Qv106T5mj9ivAlpoKxn/s8N0YIpAzWBFXrWi+/D/Jggavw1Inb/soqfz88dQMOUZ7hVF1Aq3KP/9ZBA45Aw1opi4BRn7GgAcb5D0WK3rleX6FPdLNwFGrGn/HeAC6URKYF/Z32zr63mBNAbS5SwpFzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjJwZURVQmpNUkdlMVFSeDNZYTU5aDZ0cU1vcGR4OG4xZGVHYzJpbyt6SnVo?=
 =?utf-8?B?UHZNcEJJL3YwS213KzNtdWZmcUVKUmIxaG9JY0I5eGhpM200RjlwNkM2c3do?=
 =?utf-8?B?M3dkM0tmaEs5bms4OFVrSERlemdEZG9FL01EcGNiNlhJWXZLZTFUL2VKVmhn?=
 =?utf-8?B?a0tMeThvSHZUSVNZTnNseXZLSmNrQVhHcUtHbzdyMllZZDcvZytRenE2MjdN?=
 =?utf-8?B?VGNVaWpvSS9sVGN4blp0cVdKVmpGNS9hK2pGdTJGT3ZNZHN4Wk5iYVF1aENR?=
 =?utf-8?B?MlVrRGkzU05IZFFwbDI3WnhFMmRPdFAremRDaWVwRndBcUdvSjdPbkloZnJi?=
 =?utf-8?B?aE5tb3dqV0F1NkgrTnp1ZUhLVnV6akg3VVBQK25HYnNia2ErdVQrRkwzZmNl?=
 =?utf-8?B?RjVtN1Q2cjNVaHZSaWZkZTB3N2NReWJpblJaTGdPQVZJY24rVmIyU1hWN2Fx?=
 =?utf-8?B?M3BSckFVZkpoVkdjdmxybDk3SUlJT2JRVmhoSi90UnBkQVhaR0RnOW9GR1VB?=
 =?utf-8?B?c28xRjV2NzhKUkZLbVYrdGp2QjhMSnZuTmRoKytBUFhxeExNYmtDeG96L0tX?=
 =?utf-8?B?MzBJL1hWSUNNRk1sem4rbXFIYUpBYVdPNUtRNUwxZkh2VzRTT2FSUlI5eGJL?=
 =?utf-8?B?aUdHSG9EWUY1YXBVSDNwdUJYSmxjVkNDSnhjQ0NJY3pGM2NUcTViM253SHg1?=
 =?utf-8?B?ODY4aUdQWXlKSmkxSmQxWEdVb3ltWC82cjBVdk4xWGJZSFE5UFFJMThIUlJL?=
 =?utf-8?B?RVF4WTRnT3d0M21TZ3pPVk9HSmRJQkRZMkd0dm5FUUcrazE4ekRhaExEWjVG?=
 =?utf-8?B?Nk1VeEZBNTZ3RW9pTGZlNVd5TTY5Ym5VV0orUWttRTJZREpGdE9NM05KZ1NZ?=
 =?utf-8?B?OFc4M2ZSbHhsSS8ycjFRdGNjYU81cVJ4Y05zVy9JTzNuZFR5U3NxNE9uQlB1?=
 =?utf-8?B?ZGY3OE9YeGc2M2JsUjVEaDVMcFRodldwV3JMSjNlV2FmVEJsdnMxNmFUYWx0?=
 =?utf-8?B?MjNkckR6WVNlcGc4UDhZL1h2Y2JHaDF5T25HdEkyQ0F4dWtFZG5tL3ZyRGtS?=
 =?utf-8?B?bHhRUFlhMG10R2ZJK0RJbnZqWXFLZkVJTjI0MmlDOVN0WDVmM2JQZkQrWVBp?=
 =?utf-8?B?bVZoV0ZrQ0duNnoyd3NoZnRmOTlmZnVyOEwwZWErYmN2b3dqTDNZaWg2WnFq?=
 =?utf-8?B?WEpBT3FIbkxkOGZwejV3N3kzQVJTS3hWMWtXNkNsMjJUb2hTU1h4K3FlYXNv?=
 =?utf-8?B?WngyVjhqOEpZRU9LM0xRWmQrUGw3aVhPeDhhNEZ5VWhiVHo2dElTM2lCSVEz?=
 =?utf-8?B?Sk0zMHozbDg5VFFIQmNvbXdNM2VBbWpDNW43Z1Y0YTZ0d0oyN1d1VTBYT0JL?=
 =?utf-8?B?ekl4WGlSOEc4WkZRSHM2MDhRWEd6VVhNaEx5OGNhZXllTHg1SWJRaXRwYXY5?=
 =?utf-8?B?UWVEVWRWNTRXeEsyM0dqMUhtTWZzbzhnd3FpYVkzckxMVkJWVUNuTnNJeXlB?=
 =?utf-8?B?bUpIUVFtTTM5VUxhTnFGSHUzSzdpVmltTFpJOGg0dC9UekMwelRXWU4xL2Vo?=
 =?utf-8?B?S3QyR1dkUnFxOGJuSnAyWEd3STMySTlScUJ6R2QrZldkRFkvanMwVGUxY1FC?=
 =?utf-8?B?MWdQUHdXT2R3Wm15cjQrQmFuNWErNVh5Wk1ReXZpMi9ua1hTd3ZpV3h0TDBy?=
 =?utf-8?B?aHFEY1U3U1NqaXhDUU10NmV2YnJEYzgzZm50dWJ4d1JtUWVCMytwbU82RHZZ?=
 =?utf-8?B?UDZhZDIwdXBpTTdkaUtISEc3dEpmR3ozbTVNVzMzR0lUMXBIMlNKNXVLWlNw?=
 =?utf-8?B?SzBZSHN4bHV6bG5OVmNxOHFOMGNZN3IrM244QkM4RWQ0RWZzNkIxV1FpK0VQ?=
 =?utf-8?B?NUlWV3daZ0t1WXpiN1F3Q0FqT1pmU0VpZTJaTlNvTWtuSS9DWnBoNlRWczdu?=
 =?utf-8?B?MmMzbWJLb2s0eE90Vlc3QjBOM3JBT1VEMnVBTWo0ZStyMjYrNXVIWmxsREEr?=
 =?utf-8?B?MlpVWklYeXJSODJHSEUwWnFGVWloZXdFdzZLbUtrSGRXenNaY29lTENVbU9z?=
 =?utf-8?B?Y0h3Y1RJOFBjdmNTbDR5OCt3cVpJaFBJSHVYMENOVHhmQnRNSnZqVzd3UmVl?=
 =?utf-8?B?bjVpVmZnRm1HdU9CY0NRaVl6bTNQV2JsRE55SmpsNVl1czc5ck9TQ3dxOWxE?=
 =?utf-8?B?VFVNMkZ5Y3M3TktEdHR6dG5obDlMV05ycWZvUUQrZTQxQ252L3lFa2ZwV2R6?=
 =?utf-8?B?aWp3TTZ2Z202cE5TZTVwOUhKblVLdFc1RXpWMG1WcjlZbGtFRmZRbkg1VWsr?=
 =?utf-8?B?Q0RkTmpZUjVzWU5xK0hMeStvMThiL0duS0l6VTAyQllzZFZobTNKZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0e6319-47cb-4eb4-77fe-08df18b45f74
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:18:28.5616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftIrMLFUQYxCceREw1XMTNxpSp0FzRIwdjQIW3SD9CeiXF0q0oO7XniKTwT27fNgO3wam03DUt8IEoT4KwuuVijeNd9Nmo/tcZVTVesoisg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6980
X-purgate-ID: tlsNG-42698a/1790086731-A8CCF9EA-32AD8F90/0/0
X-purgate-type: clean
X-purgate-size: 401

On 17/08/2026 9:52 am, Jan Beulich wrote:
> Otherwise the function is unreachable, violating MISRA C:2012 rule 2.1.
> With the function compiled out, its dedicated XSM hook also becomes
> unreachable, so it is similarly guarded.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

