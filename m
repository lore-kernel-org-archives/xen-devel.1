Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F8606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=RxhOIRuy
Received: from list by lists.xenproject.org with outflank-mailman.1494555.1694016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTfgo-0001DQ-Jx; Wed, 18 Nov 2026 13:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494555.1694016; Wed, 18 Nov 2026 13:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTfgo-0001DJ-H8; Wed, 18 Nov 2026 13:27:06 +0000
Received: by outflank-mailman (input) for mailman id 1494555;
 Wed, 18 Nov 2026 13:27:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTfgm-0001DD-6X
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 13:27:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTfgl-00Eeqb-Bz
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 14:27:03 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afda7a0-2eae-0a2a0a5409dd-0a2a4505bb16-18
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 14:27:03 +0100
Received: from [40.107.201.61]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afda7a5-4cb1-0a2a45050019-286bc93dc652-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 14:27:03 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7589.namprd03.prod.outlook.com (2603:10b6:806:441::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 13:27:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:26:59 +0000
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
 b=e4SFt/KpwcGL6Z9+VidR4M7j0mPXxVIq2yclJHuyANdOmhSjl1IGGmyKLjwPPr1eOitQQqnSfIggkAigPgxnMWkwrfMg0RjsoIRe7nXLnDMQ0Y7RaOxU8UsOu0Eggf1v7xLJnWiPZuKcbiLrQlHONeg90UqpuzaRyhKloQK4SMzb7q6na8fRdtr243biDQlZQfOBFRfcSSKjmkTrEpnsVwEXYPqpqcNNC0VgWx2lja8D4vG92KyX9+B+Q7J6hBmOgzb30G6MLzvVj8idNdrknO4qPeFXIf4lAPSYLOJu2wFtIo/tYv95xhW+GeXnMm7QHj6ATxyrko5XMhwIQT74/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cawDE6zEDU++Q4uYOb+jfqymdQdGT1gw2bhpjU5tvDo=;
 b=Y43n81Z9yYZ7x2lwhR6PLGm2WlB1ywxOFNhYboD7aKTSQd2gAA+cEnS37TeIjq9utWi5XoFB8m/qPQRdenj6sdO8k5yG6sTgEoUPNrrl5hei9AMxrG3bMZmSc4T7I1eZX75lEOQZeFbY5F57xzIyreUI8z4b88GmeIJGHLTFBd1aHO4Iab8zupzOLKXEhVhuUBHnh1DWJkKEX57PE3CmiC6bZGtsviMoSPVIA3fcbsbZoug6v+CH7VIr6cSRYb5Ahr/DYP1YBABcWQ29/S1yR/zE40O5PioCcpRO7G9aC+f1kAW/mTxfOOPyBzgBy/CHeqBfSwbaXUJ1h6rCYzxVyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cawDE6zEDU++Q4uYOb+jfqymdQdGT1gw2bhpjU5tvDo=;
 b=RxhOIRuyS5/zXozIe0RuUeTr49oeKI0R4hS5Xha6LmahfJJuKGUEXcY3+ZCRPExdd/IFaSc14klEhHx2YmwUFkh6XGGEmwElaOQ2AZBHl0LJbUkuemMxBZq5T4MJYeQM8sTgJNAogNbvxcOlpXosEYPfkm0gBiJ/rtfXI4Gsd4c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <802b448e-e772-4e6a-9442-b44a99d9b00b@citrix.com>
Date: Wed, 18 Nov 2026 13:26:56 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 2/3] x86/EFI: replace ebmalloc()
To: Jan Beulich <jbeulich@suse.com>
References: <640c0ea5-fbbf-436d-b150-4537cbe98fdf@suse.com>
 <2d45d102-e26f-4e93-a213-b02fb685b6ef@suse.com>
 <c31e3a82-ea24-4985-8410-9cda5a9c9681@citrix.com>
 <a9186c61-c21e-48b1-9fd4-ce2625ac1a83@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a9186c61-c21e-48b1-9fd4-ce2625ac1a83@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: de8a3478-a3f7-4569-2469-08df45779ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|4143699003|56012099006|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261021135927099003|261026121527099003|261021123027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Gp3U+ywNUOmdQB4KF+uipz9Xw7pDRvWHHD1hWOGhbCA5Ra+LrTBDAjo8Arl5i/Gp3ILKwcb9/F0yGPIdwMYAcupAzkmhIif1EzbsqZQmb7cb+SHOoibizrzNsiAcLXlfbR6crkkn/FDqIJ7f/1kZtVpzpWQQJ8u3h1QQl44Xe4n9uS4RbqvrZ/K22uPVpPgP8yKXCXYWfFpuq0hZClr4IJDqxv48m44l9leHsPnaUoGCNyEMJ1b0VR0+dW/1YuCQv00Gco0OjDHqNNLgAztIXujPoLYR5CPX+L7MxwE5dQ3+rOrstQ7kfUp5Bh3smVOTGM+Ey2+ocpjAyMv8eCup2XYH5sOsAJjAPFp3SG5tzdnr1PJ/VnE+1oZAN956Jb0YeV1ZVYKBV7nLMLjGrhWrXNGjJwH73SczB57QJwtzeESGWv+eRaRr1mp43jFYNT6cN2k5/ARFqUs/dQRnj2P0WelAVpmkCaa9ohzDLglvqOHb3gLyMMW5XiNHiQC5K0CYfHXVew2dB8+G1bMIhI/YmTUK/GQ0D81upiEFqgd63ffcN2wEbYP6Qxve+Fm2zUNGaTOwXVuh0zEtCGfPaRrPzm6/flKEMR5QTYy1BtQEKbUIAip+wmFWScQjOaoQv7SHBQWsKKKcqJQlahRQTHt3+EC61wSeGYhMLwipO5/NerI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021135927099003)(261026121527099003)(261021123027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djZ4aTFpTkhIQ2ZlRmNIcTBjL3hBTUw5NitwUEZXYS9hSVdvTUNzdVpvZndh?=
 =?utf-8?B?bk01amdONXJoZ0E1YUJ2aldNRGx2ZE45ekt6dzlIOWFJaFpYNU1CVUphZFR6?=
 =?utf-8?B?RVlVZWVaUm1RNGM2dU1jTFFabE1JYU5CdmxGbnNOS1JiMXNZNnJZS2Fkcit5?=
 =?utf-8?B?M2Vkdkp4TnpnT1ZkdEtCN2dkb3B6WTVUM01rVy9VSGFnUWs2blQxaGpwYVF6?=
 =?utf-8?B?aUJ3clR4ZnZMMGUwUUZuVlN0SVhuL1ZSVWRTazVGNWExb244T1FyZnUyV1BR?=
 =?utf-8?B?MW5ocEl1Q1YzaVZYaEYycnJaZ3UxZGxJZUlHcWFKeEhwS2xxTERVN1B6cXdG?=
 =?utf-8?B?K3F2amdVRHRDcHh0Mm9yWUwwdWRjQW0wbm8xYnVHS3RwUEJtaWYraVhrN2dG?=
 =?utf-8?B?T1huNGtlb21XN0NoUGpHYUc5bDZxaUczRmJ2WGJJb3NqNkloMUxmOTVaTFp4?=
 =?utf-8?B?VXdkTU1lODdRd1k2UWJGZ0Jzei9VYmRRNFViUk9VV09jSFFkY3NISmtjQjdY?=
 =?utf-8?B?TENtKzdRY2xUeTRiWkpNYzYrSitPK3F3cUVYVHNjdTZxWXhoQzFIZ0R4Rm5t?=
 =?utf-8?B?RmIyYVV0VEVHUXJnTWlwTXVjMW04dTBWNWIzR2wwTWpoU3ZudVFvUk9GaEwy?=
 =?utf-8?B?dlFUSTNNZHVheERDMEc5elpsRGFjdERRTE15cW1OK0xPK2FEaUxPM1h1Tytt?=
 =?utf-8?B?bFZ2SkFqVmJYV2V1TC9jVU4wTXlCUWJXTjNXb1FBRUl3MHVlZk5QMkdJRUNP?=
 =?utf-8?B?dG9vUzlIeWtnajlyaW53MUJnS0pUcnRYNDlWcE1wTkliazhKOUQrUUlJcmc5?=
 =?utf-8?B?MG1xSDlvS1JhZWU1U0N5dWRiRjZJeHEvVWhNODNCOWsydU1zNEoxYVA1ajlL?=
 =?utf-8?B?T3gyVXhmTE5LR0ZtSE52YUwwY3dZQ1YvZjB0U2t4YktqTitJNzdUd2NDTFNp?=
 =?utf-8?B?YWpxbjVJQ1dpQ09jcDRvVjBiR2F2Q3kwbm01OHRodml1T29OeUVRUmlZaEFO?=
 =?utf-8?B?M1MvU1JqdEExblB6T3pPb2RtQko2VUk1OFkvbC9HWUR0bm11T2lrWHp3VWJ4?=
 =?utf-8?B?Y1VqNG9hT0EvU1k1dzF6RU5zN05VaUM1ZEdiY0JkT1hQYmtIOGU0VVFtdXc0?=
 =?utf-8?B?Y2tIT2NkWThxWFJKZUxvaDg1MkdlUVpjemRndnpKNU1rRy9qb2RYTUsrZUw3?=
 =?utf-8?B?VFRJZGlwZUtUY05JMkVZbnVUd200VW5hMUxYRnVSVHlSbm04U2oxbDA4cVFL?=
 =?utf-8?B?QWZJbVRUZlI1OEkzUVRsMndrMEQ1ekMwWDBqK1BLc0ZENGVVZ3FZZUwzZ1N6?=
 =?utf-8?B?K1U1c2xLSlZ0a0NPODVTZE93U1dSUGcwSlVxM0s3TzZVSm1HRFRZaFllTTZt?=
 =?utf-8?B?bWRjZExwRUYxSGovRmwxMXAxT0VsN1lLNTEvT0VwTktDTndIK0pJcEJIMjdL?=
 =?utf-8?B?QkppYjNsK29VOHEvblV5bU1hQ1NHOTVQU0o0S1J4d0VNSkJ6QW5UQVdqeUhY?=
 =?utf-8?B?VWlzQWtOcEZQandGclZiMzc3Y0xGZzNVZFhVbGFLOUdSMnN1Qzh1cnVzSnNP?=
 =?utf-8?B?Z3VyczRXbncxUTRaU3BBOE8xMTlmdlpEdFJqc2cvSDFHNXBBZ01ac1dRbW9Q?=
 =?utf-8?B?NHp0aTI5MnpJKzk3ZVllT1NUOXQzbExDS3hqd1lxTnRiTmkrUVhGZlFuK1o3?=
 =?utf-8?B?VFNKQk5Oa1E1NXhtb09VTzN5REVHeXU2aUoybmprbGlFRnZyVVNVWWxEM2RT?=
 =?utf-8?B?d2pUL0MxRE1hbzB0UWZVNVVYMWRDQ3MvNmd0cFU4TEtlZytKalpjU09Ib1Y4?=
 =?utf-8?B?bTlhOWh0c1VNeThBUkQrTVI4L2EzQVN1L2tmamlBSHh6Ym1LL2RmQjNEbmEw?=
 =?utf-8?B?NElxcWwvS00rbnphQnI4UjQyYzkyVW5JbVQzUEptejBzUEltZ09iZnlyYUZN?=
 =?utf-8?B?cG1wbWhxRFV4V0JmZFlXZU96UFhGMDd5MlZZbXQ0Wm1PNHU5Vk9IeTBoYjdI?=
 =?utf-8?B?cFRPUlJlZnlxdlBjUVFiS2FvN2tmeTBwZ1lIazRvVGNudGJaUDUzOVovSGky?=
 =?utf-8?B?dzZuN25iNW1ReXd5TVRLQ0xzcGxzc3NhcjhiMDFjRzJvNUovYng1ZVl2Zm5S?=
 =?utf-8?B?bHRsUGMvRnV2ZW5oT1UrME51b0p1bDBPY1l5bzZmc2czdWNSd1ZiSHBVTjV2?=
 =?utf-8?B?ODFaWlNFWUs3bm9lRHJPSVIvUSt2Y2pSNzFLMGRnajhyUEZsVlhYVzNkRzlK?=
 =?utf-8?B?UnFoRFkrY1VTd1VHandlbUl2aWlZemtYdm5xQzZIQmtDMTBQemF2SkJGMThm?=
 =?utf-8?B?VDlaZFBWL3dWS2wxKzdCamlFWEZHNzRLbEt6VmRIeVh0cWh0bU5FYUZUZjhp?=
 =?utf-8?Q?hj1fnjxA+3cI92kg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8a3478-a3f7-4569-2469-08df45779ff1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:26:59.7511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbvL69/2U5eJ4yKlHodXYQmwdye1c0Yws8KoYYdyJJmxDmA7VLtbI4NxlfI9QW8Fwrw8g1jKrxBHYtmDe2gQrpELO4DOpnsUCqCtB1XOguI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7589
X-purgate-ID: tlsNG-c201ff/1795008423-F64B42A1-3D0F0144/0/0
X-purgate-type: clean
X-purgate-size: 5768
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 7:37 am, Jan Beulich wrote:
> On 16.11.2026 19:13, Andrew Cooper wrote:
>> On 03/11/2026 12:50 pm, Jan Beulich wrote:
>>> --- a/xen/arch/x86/include/asm/setup.h
>>> +++ b/xen/arch/x86/include/asm/setup.h
>>> @@ -9,6 +9,8 @@ extern const char __2M_rodata_start[], _
>>>  extern char __2M_init_start[], __2M_init_end[];
>>>  extern char __2M_rwdata_start[], __2M_rwdata_end[];
>>>  
>>> +extern unsigned long brk_end;
>>> +
>>>  extern unsigned long xenheap_initial_phys_start;
>>>  extern uint64_t boot_tsc_stamp;
>>>  
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1,6 +1,7 @@
>>>  #include <xen/acpi.h>
>>>  #include <xen/alternative-call.h>
>>>  #include <xen/bitops.h>
>>> +#include <xen/brk.h>
>>>  #include <xen/console.h>
>>>  #include <xen/cpu.h>
>>>  #include <xen/cpuidle.h>
>>> @@ -164,6 +165,8 @@ cpumask_t __read_mostly cpu_present_map;
>>>  
>>>  unsigned long __read_mostly xen_phys_start;
>>>  
>>> +unsigned long __ro_after_init brk_end;
>>> +
>> I know it's only x86 which uses brk_end right now, but given uses such
>> as ...
>>
>>
>>>  /* Only used in asm code and within this source file */
>>>  char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>>>      cpu0_stack[STACK_SIZE];
>>> @@ -1157,7 +1160,6 @@ void asmlinkage __init noreturn __start_
>>>      struct boot_info *bi;
>>>      unsigned long raw_max_page;
>>>      int i, j, bytes = 0;
>>> -    unsigned long eb_start, eb_end;
>>>      bool acpi_boot_table_init_done = false, relocated = false;
>>>      bool vm_init_done = false;
>>>      int ret;
>>> @@ -1523,7 +1525,7 @@ void asmlinkage __init noreturn __start_
>>>          /*
>>>           * This needs to remain in sync with remove_xen_ranges() and the
>>>           * respective reserve_e820_ram() invocation below. No need to
>>> -         * query efi_boot_mem_unused() here, though.
>>> +         * query brk_cease() here, though.
>>>           */
>>>          xen->start = virt_to_maddr(_stext);
>>>          xen->size  = __2M_rwdata_end - _stext;
>>> @@ -1667,20 +1669,12 @@ void asmlinkage __init noreturn __start_
>>>      if ( !xen_phys_start )
>>>          panic("Not enough memory to relocate Xen\n");
>>>  
>>> -    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
>>> -    if ( using_2M_mapping() )
>>> -        efi_boot_mem_unused(NULL, NULL);
>>> -
>>>      /* This needs to remain in sync with remove_xen_ranges(). */
>>> -    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
>>> -    {
>>> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start)) ||
>>> -             !reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end)) )
>>> -            panic("Failed to reserve Xen in E820\n");
>>> -    }
>>> -    else
>>> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end)) )
>>> -            panic("Failed to reserve Xen in E820\n");
>>> +    brk_end = brk_cease();
>>> +    if ( using_2M_mapping() )
>>> +        brk_end = PAGE_ALIGN_2M(brk_end);
>>> +    if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end)) )
>>> +        panic("Failed to reserve Xen in E820\n");
>>>  
>>>      /* Late kexec reservation (dynamic start address). */
>>>      kexec_reserve_area();
>>> @@ -2274,7 +2268,6 @@ __initcall(init_xen_cap_info);
>>>  
>>>  int __hwdom_init remove_xen_ranges(struct rangeset *r)
>>>  {
>>> -    paddr_t start, end;
>>>      int rc;
>>>  
>>>      /* S3 resume code (and other real mode trampoline code) */
>>> @@ -2296,26 +2289,10 @@ int __hwdom_init remove_xen_ranges(struc
>>>          return rc;
>>>  
>>>      /* hypervisor .data + .bss */
>>> -    if ( efi_boot_mem_unused(&start, &end) )
>>> -    {
>>> -        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
>>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>>> -                                   PFN_DOWN(__pa(start) - 1));
>>> -        if ( rc )
>>> -            return rc;
>>> -        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
>>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
>>> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
>>> -        if ( rc )
>>> -            return rc;
>>> -    }
>>> -    else
>>> -    {
>>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>>> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
>>> -        if ( rc )
>>> -            return rc;
>>> -    }
>>> +    rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>>> +                               PFN_DOWN(__pa(brk_end) - 1));
>>> +    if ( rc )
>>> +        return rc;
>> ... this, it clearly needs to be common in order for other architectures
>> to start using the allocator.
> I don't see why this would necessarily be this way. This is x86-specific
> memory management, and other ports may have no need. I'd therefore prefer
> to leave brk_end x86-only until proven otherwise. It was, after all, a
> deliberate decision to make this x86-only.

I'm very unconvinced.

An architecture that doesn't care to reclaim unused space just uses
plain data/bss objects, which is what happens today.

An architecture will only care to switch to brk in order to reclaim
space, and to do so it *must* replace all of it's current end markers
with brk_end.

brk_end will probably only be consumed by arch-specific code, but it's
produced by common code and therefore it needs to be part of the common
brk infrastructure.  This also has the important property of preventing
it from getting named differently in different architectures.

~Andrew

