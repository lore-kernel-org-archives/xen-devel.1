Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02547606A323
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=aj++uUQO
Received: from list by lists.xenproject.org with outflank-mailman.1502556.1698586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWFVE-0003Au-F4; Wed, 25 Nov 2026 16:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502556.1698586; Wed, 25 Nov 2026 16:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWFVE-0003Aj-AJ; Wed, 25 Nov 2026 16:05:48 +0000
Received: by outflank-mailman (input) for mailman id 1502556;
 Wed, 25 Nov 2026 16:05:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWFVC-0003Ac-Ha
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 16:05:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWFVB-003Kzh-MA
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:05:45 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b070751-8faa-0a2a0a5109dd-0a2a450ca856-34
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 17:05:45 +0100
Received: from [52.101.53.50]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b070758-f479-0a2a450c0019-346535329ce3-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 17:05:45 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB757858.namprd03.prod.outlook.com (2603:10b6:806:53f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 16:05:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 16:05:42 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsLg7P+fwiSU2aL9ZLA0n9Ma+oe03yvcDS0bDTUrluTjru8hSuA8ktmRuql8pQso4QF1vye2HmE1hkaByJM2eJtcsgBpDWMFbepzGEga7XnDhEs+PQlj6OJf7WNeK2DOgzNblukzF+4sg7rc/A96rkR25fhtA0f21ZSBjCbeSLQ/ru5lGrY98+Lg22ncpL4Kt4fGcQJrv2tIwh2Ku5jZExX1+apAtMniz5kNaPCmv9kRvs4rAFtBrnAXOFbvl84u3EYE6vApFb26MYrgCZPrZV4lZj5iaYQ14woPkV8WvQDDzEc7UgsBZ0EkSD+SlISsjlO9aKbBpMhNXi+bFOpJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3gaE+aeNKMecoVcYKELxJyMK1z+xBXa5ukoyON/yrE=;
 b=j1AuPnJN+hsB0Bv5mYmdYNIMZhUZYXt8rGhD9ldM0NKVZtbDXdXaAYTkWsW9jkoEbRtUcLkLZiBSdKI/ZiHNRWgG42dYKvRqp6Bk4nbr2+X78pV4KGT3Y3RPxdEGNYRYjZp5UlKO+Q9QIjnF61+8zOExatxAyxZobccAWAYygEj3jTVsynCKexelWaFLMm7WqiUwiWp61iwZBN6LckqSRKUT2Ue00mj+xWVe4yIeKXx0Vsms3ILGBKdH0XpJdE89oWhZF5nothFNAi8b0jCaw+9eC6TfWAMsKkBD0+b3vcodYZSdzXaxl4JpCivd86v1ZlweVzSh1ffF6VlIm6Coug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3gaE+aeNKMecoVcYKELxJyMK1z+xBXa5ukoyON/yrE=;
 b=aj++uUQO/ABVBQ2ptpRKJ9nLOmIHCVi4G8J0u3taORN7KPTna/7spjchwdc4Mc694HSakEVbWiX13iQLihSMfjj5+NAUriFW54+rkzJr/dX2Z3fo3oQ6V2S4hirbMMnHgNyyFvKvS0eWs1KWXB2BaXl1be2i+Z6dNHH02qJSEhQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <476297cb-49a8-4688-8423-b05345578600@citrix.com>
Date: Wed, 25 Nov 2026 16:05:36 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v5 1/3] build: permit .data.ro_after_init in *.init.o
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
 <22bf414d-ed66-4c2d-b8b9-f2fb7e5c219e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <22bf414d-ed66-4c2d-b8b9-f2fb7e5c219e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB757858:EE_
X-MS-Office365-Filtering-Correlation-Id: 22052b6e-df2e-461a-6680-08df4b0df4d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|18002099003|22082099003|6133799003|56012099006|11063799006|10067099003|261102123227099003|261026121527099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	wT47Taj0Rwysm9jYFZ4hqRkdBZ5eNF5y4IaJAMjX8Z7jdR9nnggFBcD3SHrjHCANAwKyJ0xg5bIGIpwgfYuHzWUAS+SCdQVkYSAphmLzXZY3oojr40XA5lHys1n2O15eFu4IKag9imRu1HoMGdzufF3l6GWueETGrSNPY/FdzRw+2NrvP54dPIUSZdZkOjxOik4xqj0jXHI2mLFylfvVheP+rcJLPzHjAYVYhXg0pumZs+VHLMio/j2atifnQAJZV9KzsTfHdftOLjJxFU6B9of1+gpDSmQxYph8mvEeZX/HnuWLlJDYZHH+vraDcsxhKwmj5lTkYrdakg/6252reeuVSxAeaX6vwQQr+F67NWCDhirShxGwo6w0aPk0oHS+kmreg4UZE8/WooYkVXnyz2FDjLv3v43zyO2IKlw1fKCp/nG+sDJG7ZVmZZ6hWEUC9m66AHmutMpwHOHK5OQlzTmAfbXPBSHTYJjhHTSEJ1TpY1TkaEarMoXfCOz7z90aEG/zbHO5u43blzTG/bgYsGkarq5MkTaGH7nnsdtoYoFVPoHsPd9kjULMYCThaDifP9UtgN4Epd44b/RcAJdYIUnyQ0GqvbHJoO8h36V5B+bbuWI/G4iOsmGdGIk6o+73gqigVoFA+tkWrMZa4G2wUaTgDyPl2Tq0+m5NdpjP248=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(10067099003)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3VWOXR0Ykw4dGttZDdhdjZUVUlPMkVSdTA0aHl2WUN6K0FBWmliYUFnZHdO?=
 =?utf-8?B?c1BLaXhPTUxwSGgrcW82NTVGRlRSQmNFRWdrVmNWUXJjaElLR2JWSUpON0Js?=
 =?utf-8?B?VjJ2MjJidXRtLzBVRVN2anEzSnVXb0RIQlJ1WkVqakZHb2ZCNW5TVHZVaG5w?=
 =?utf-8?B?djhaVCtuQ3hCRnJaakJubHU3NnJJRUdXbjNQbzZzNEhFMExzMEt3RWNOaUNN?=
 =?utf-8?B?ZGpDbGsrbnRRVTA5dUtWYVYwcVhQak9QR3RyMjdWR1BpY09CWjh3ZGpjZSt1?=
 =?utf-8?B?SXRObjR2cS9Gell5RHYzL2ZZTS84eWhoeXBucE5WcUJRSDVLOHN2SDZDaTVW?=
 =?utf-8?B?dWYxQ0JzazNwcVk4ME5qbW1FNHVSczNDclh1OFFQZTdyWGcyV0ZUdHpFM3Y2?=
 =?utf-8?B?N1YzOGVxVUI1RzRBY25KTFE5cmJqdUh6eUMrckxTLzdObEs1dm5oZTV4ZGpL?=
 =?utf-8?B?WkxVTlY1Y0xQNytYcnV5UzdtZ2xuaXhlam0vMlR6N0JLSUdOU0RiVUdidjBx?=
 =?utf-8?B?aU5lbDhBWHZ6L0Y3MVBaV28yUG1Sd1FPckpGRm15dTBzV1JqWG51enVEcW93?=
 =?utf-8?B?MWd4b01oNTBQWEU1Y1U4cHpsSkUwekg0UEpCajlhbEpaQldaYXU1TXpHWDhQ?=
 =?utf-8?B?ZnFnNm43MnlvS0hJZHh5N21Ebk04NGlrZnZ2KzZWRlphdlRGR1p2dmtRS3hM?=
 =?utf-8?B?MzB1b1laV0JxWk5mcHM0d3RlaFl4UEk5NFpEemhvcHpYTXZadWYzUkx1c3E0?=
 =?utf-8?B?SEE0aThWNlVaemRUZGYyak15U0N3cnhwZ2pIdVVmMTExRmlZczRvQVFzVVhO?=
 =?utf-8?B?VUlTTmxjc2tZVS9JWW5MMlBIZUJLdGEwY2p4aUJJVERXOURSWjhiRCthN1JX?=
 =?utf-8?B?VVBRN2c1dmpxallvYzN5azR1OU4yTTFGRzV1aEg3T3M4MmNIeHpkNlJSWDkv?=
 =?utf-8?B?dFR6R1pRSU9YMWpmajB0RlNaT3JNR0oxRXJDUHFGTXorZERJS3V2Z3RGbTJs?=
 =?utf-8?B?Nm9PalNvdGJTSGlzc2doR3dxSHlkVFQraWkxdmpRRGhpMDl3U2hodUZjU0lh?=
 =?utf-8?B?b0w5TEFVMWh4eEYzWTRRRHI0UUpmNnVIMUk4cEZJb1V4UElJN2dSRkQrTHFJ?=
 =?utf-8?B?ZmVIY08zTE0rUFZHY3djZ251ZitUaTZRSE14SWtYaGttODZ3Qk8vdzNhVG5q?=
 =?utf-8?B?WUYvcjZTQXZyRTArOHNMbnpneGVibGZHUmROemt5TGR3MGdZSjBGZ0NLUFh3?=
 =?utf-8?B?Q2hhS1lpV21LOHA1MXMxdFNVYVE2em9hTTN0VTRkM0hwOUNqekEwUmZtNkF6?=
 =?utf-8?B?OTZaMWhVYTFBaWM4emlCditqb3FKeUxjVm81ZkZQN3lNN2xzM0RWSGFHM1A5?=
 =?utf-8?B?YnhoOVJuKzA4eGhLTG40OWlTY2hHU2VZeGRQQzlhY21iYVhGYjl1MVIxZ1NK?=
 =?utf-8?B?YUZVRjR6cTg3bGtsWU1DQUFsTUJ0ei8ya0lLOE5MYitoYTREUEplRHlJaEVP?=
 =?utf-8?B?ZDJkYkpuTHN3MGFESnUrdXMwdFpWRVpOV1Bya1g1eXZmZnI3Zi8vSy8vRlc4?=
 =?utf-8?B?SzJ4UzcrYXJocWt0bzVLendUTjFvL0NoWmhIbGpNcCtvc3QrK2FwYUhzUHZm?=
 =?utf-8?B?NzljWlVHamlxMXZpemYxQk5OMW4raTludDErMkJyYWd0alVINjBRUmRmNWVL?=
 =?utf-8?B?Yzc1MVNkRlhEMHp0YWNudFNGc3hQeVFEQ1RPaUVEdldiTzNSejM1R2RRVlg2?=
 =?utf-8?B?VUh6UkkwNG1zQ2d3bWtCaFpmRXdJSFlEZ1dvUU0zbHZITEV4QW9iWldXajJx?=
 =?utf-8?B?eDVGcXBjWHI1dEtIYWJGWjFKcFdyZHhQVkFHcEk3YXhrL3c1VlFPanc0a3Zy?=
 =?utf-8?B?V09RODBUdFdZOUZ3TW04Njc1WXdPbW9LY1d4WWJ6RDdRVXJQZnVYdWhNNnND?=
 =?utf-8?B?Mk1HS0hUQUN1UzQrRFUzY1A5UVdYVWw0bjl3cHpDTHRiaklYb3M1enNuNlNJ?=
 =?utf-8?B?NE5WWFJ1YWRZOUdBRU1lVGN6TTB1dDU1dFJDZTNRdFNsc1ZTUDRtL0F1Znpn?=
 =?utf-8?B?Z0NOSXZkbXhHQVJzK2wrTW1vYWVnZzJNNU8xWldSYjhkbUhKV1BqSU9yU3VS?=
 =?utf-8?B?eDUyNGppQlJsak1xc210bE53c3BNcmFNVWZ6RkFvQkdzUFRnNUE0b0crb0ZO?=
 =?utf-8?B?bDdxQ20vZlhmUU9pSWhON0VPODVWU2E1WElRTUdxa25DZmI5Y1JnZmVvdG9U?=
 =?utf-8?B?NmhjdU5JMFZPc2lEd0NtZWJEdDhMS3hyck13ZmRqckc5Sy8zb3RKT2dVUVdI?=
 =?utf-8?B?VlNmYTFsNlpGUVJjaU9rNXpWYUdpRnNVOFY1R0VXdlZCRGhvQUZRVjR2bkhp?=
 =?utf-8?Q?Zb+U3T2aZrqpHNIQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22052b6e-df2e-461a-6680-08df4b0df4d3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:05:42.5795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWMzVzMBlCrwSH4Ae9u5gNcPtps6lGAqdV8TjYYD5dZ/uLL8XgBiqMujltAWNOLWqnbt6RYbAfBjgFQtCFPnaQ9amtAcvjhDLkeN+6/DBkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB757858
X-purgate-ID: tlsNG-d25034/1795622745-008CDA5B-C7D99259/10/78276251493
X-purgate-type: spam
X-purgate-size: 993
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 2:36 pm, Jan Beulich wrote:
> Setting __ro_after_init variables is one of the purposes of __init code.
> Permit such data to be present in objects to be converted to *.init.o.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

> ---
> v5: New.
>
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -263,7 +263,7 @@ quiet_cmd_obj_init_o = INIT_O  $@
>  define cmd_obj_init_o
>      $(OBJDUMP) -h $< | while read idx name sz rest; do \
>          case "$$name" in \
> -        .*.local|.data.rel.ro|.data.rel.ro.*) ;; \
> +        .*.local|.data.rel.ro|.data.rel.ro.*|.data.ro_after_init) ;; \

... won't we want .data.ro_after_init.* eventually when we get
--gc-sections fully working?

~Andrew

>          .text|.text.*|.data|.data.*|.bss|.bss.*) \
>              test $$(echo $$sz | sed 's,00*,0,') != 0 || continue; \
>              echo "Error: size of $<:$$name is 0x$$sz" >&2; \
>


