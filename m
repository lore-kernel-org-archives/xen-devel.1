Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AA4CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 17:19:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441696.1659278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE8pC-0005DU-6E; Tue, 06 Oct 2026 17:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441696.1659278; Tue, 06 Oct 2026 17:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE8pC-0005DN-2u; Tue, 06 Oct 2026 17:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1441696;
 Tue, 06 Oct 2026 17:19:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xE8pA-0005DH-Hk
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 17:19:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE8p9-005cMA-CD
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 19:19:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac52d6e-8faa-0a2a0a5109dd-0a2a45078cac-46
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 19:19:31 +0200
Received: from [52.101.57.3]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac52da1-b4ea-0a2a45070019-34653903ea74-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 19:19:30 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6588.namprd03.prod.outlook.com (2603:10b6:303:12b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 17:19:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0472.020; Tue, 6 Oct 2026
 17:19:27 +0000
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
 b=VRnHYouydo2qQ4Tfo+zLN8y4Q33LcZaDE8DV44jr0ZmOyFcbuG0AYjJ8EtBp6ojYqDeyUerDENdUoCPl9aqVqmSUg8Rnxm6u7U9FKMMXjz39rCyWHvxWszfmqdn2UDRz3ntfvzVX5ptFw8zu0mdbr2qqvu0jeKK8HakrYQzLjmJn2w6h7xhii6UHGizGtmJePMMKK6qyQcNHNEvHADozo2I92Wn9Bj4Yq5qJM2TKW/htZk3AqIj0ru1RddL2j7j4Nfg07tprKuLLYVLQw82sSioCRWYt2zhgq9holLwdxvYx578J8cnv+ZjehC72sF542YoQVstzkej63Qfej1QjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnxWrWEgvPMvU2YKarKpHb/4KNAphBQw2CO1pEdjm6E=;
 b=lboWIaumP7BFsK1nf5BCB10j6WUODKI80K3EQwmywjpJLKFoaok7dacdkMTQlsFFEsSIYG3qEEJV2df/1NFxmUTa6v9qhCxAN+6Gd6ci9hFIyvv0b8qo4PU/Yi5mZN+m6sc8gTgZXO9fwrdjqHCDPnVdffnJMMLzqyqJgYYtUgmWp8t4k/wZUazS/b/IOUdctFkiimquVju0dtGJvY67BHXbAh/WYfFUdMdsde9Pg/NkPU0/W/4DIwQM/xTuSLQwHa9gcbDnN+L/fOmlWa3Jh5yEpjpRvNMf4U7VrYd/IUGdZfP76XVKoAE7UVcBBNIdyizdTw7CXOX2RJCMwo3PuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnxWrWEgvPMvU2YKarKpHb/4KNAphBQw2CO1pEdjm6E=;
 b=DXJH4Nw3O2RBF2mGOIUb86kO1s4SyD8MW0r6Van6ttYijkW2BL9XFrwpZXPFmRBp2sukxgcASRua0fz16scNtMrCKp9BJkLdSfA0z9ANO+nvLJRdIfIDL6xFHjeB33bC/DkJ3gH3HoGgnSUS+1PjlHT46cNHBuLvi17VN3ze41Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3d4f793c-77ec-4a70-8f73-e647298cf0a6@citrix.com>
Date: Tue, 6 Oct 2026 18:19:23 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/svm: Don't clear clean bits on every context switch
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20261006144805.2575991-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261006144805.2575991-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0278.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6588:EE_
X-MS-Office365-Filtering-Correlation-Id: a22bdb7a-52fb-4145-fd11-08df23cdf955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	QqCcwES53dw37V64OUcAvtMXHjXpETSqjS9FbWbjE7S36SAR+4cNmekVdhZfXfbA0afyKppHEToF1M6pVSyyoj60yqCZkLxdsLObeOOnQGNeml0euNVKNBTNd/Rr538N5nsMyn0UNQIQo0DeJyNt2aPLuj/yli0gyrrqa2bxMavuxMNDT5RNiPqwEPiLHBQJ0JSkIuWML7sXnBQJdstP8pgIse9HG/cMQhWQhkqchjU0IgEVD5YpBorsRDEvP4Q1WRFNP+afdBkif7AraKRqKO1gH2YV4HnXt/5z14pX/JJiFnUK3aNUR0O36kB6KW2bpD54a5Bl5Ld713s1xOBU1B4crLgCPtCGDGaAIZA9uGQCKW4t436+LSkuLrurb6AoPeKghDEa9wj4Cpf2CNBpLmKSsKjnxytjKhW9gyjF6mEq2c0A/sNGPl/fz8QNM/gBfbLHNKe3PW59785LQ5wBvzPD6uuijVpUfHgIF8gOvDa3d7ULjQM56C6/XFd31LjgkrGNTnCiuN7z8JrKYorrOC9oiXLVjwVe9TM5vOWrKlhvME4MqJ0OPhfo4wkpBinn008rGgXNig0DlzW+Rzx7sWCDdUXyJiDLbCircDoeYDcAeJzr+hufMoIrEqC48ddIyd/0/hI6F6l334rYWrPJEy3sp/mR4voUXaKYKXIwm8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlVJdUkwNkhXR2pCck5tYjRUc1ZsekpibFlZQzFPTVUrL1RqR0wrazFoaEY0?=
 =?utf-8?B?NFBZVFdIWFZuUWMvSTIrVG5nbUREOXBoeXA4M3ExL0dybzJSaXJmYU12elNm?=
 =?utf-8?B?YVNYUDZiRzJnMnluL2R6WGdIOGVCdzdLYU1HL0NDQi9sUy9YZ3NTZGUrUlJn?=
 =?utf-8?B?ekY1dWllTjJjNG8xWnNqWm1hQkVQcEx1RzRkaXF2bTVzMzUrL0tYd3JRNzNh?=
 =?utf-8?B?UzRvb052RFdUbHpBUmczT3lzamN5R0t2NUlXUjR0ZEUyWkhRSE9qTE1wV1lk?=
 =?utf-8?B?Nm12N0xja29TdzJJeU1TN0ZOaFBvMzlmM1gvRVFLb1RpM1NUNDd6OEZCQXdu?=
 =?utf-8?B?YjdTR0FkeGpWZlV2bXFHZmlOSlNXaml3cVZUVkVNUFJQMzJ5TjgrajcrR0lp?=
 =?utf-8?B?MDV4ZWNPZUNQaDJESlkwdGhJRkRKbjZ5SHJtdGoxdloxbzdkbzRzOWUyRUph?=
 =?utf-8?B?R2NuRkF6WEQ5dUhiUW1tQ2l1VzZRQnZVWjdLT01lL25WR3pkSE1KUThJc2t0?=
 =?utf-8?B?aXhEdEF6c0VuSWE2dDZaeWJoRDlCZGIrWXZFU2lMT0s5VWE4OEcyb2hhMEZY?=
 =?utf-8?B?US94VTBxMWdlSXpYTXN0QVR2U1J6YktuaXdaeHV3S0RIcWFPcksxeGNrdDRY?=
 =?utf-8?B?aWhiY0wydlFHKzRjQ3YwZDNYMEhzaWVFNndrV3N0aHNVUE01VmN2MU02ZUZ6?=
 =?utf-8?B?SEU5WkppelZRYXZUeWE2cjJrT0VaQzFodGNBajI5WGRaTEtOekJTcHRyemlx?=
 =?utf-8?B?WGs1eitpbHdXMVZGOXFoejhWeTZzenZpWm03MWxKQnE5RlVCOHpxSE41OW9k?=
 =?utf-8?B?YzR4K1JkYW1vcjB3clNYNjVlMzMrOE1WWnVRZHk2N1o1ZWJKaE1NNUlGc01O?=
 =?utf-8?B?dDJ5dzBzOGUwN3VlelgrVWZkUW4rdmRlNlQzZHlYZll6Q1RnNmxBdGljd1Vh?=
 =?utf-8?B?dUVMM2dyUElkN3VzVXg1TWw4Q2xsSENRU1BjaUVXaWhMWnNHT3VCU1VBYkw4?=
 =?utf-8?B?YmpQNm45VUp6RDF5ditUR0szK1YxZkRPSFl4dnRMK2hZcFE4MStZZWRSSWZo?=
 =?utf-8?B?K3NXaVlPQUhZN3hEd3I0bENYOEJtYXJqcEhzWm0wQmNqSWRGODgwVTRUWG94?=
 =?utf-8?B?TGJMcHRYdzJ0OXlPOTdHenN6LzRNR251dXJ6YTVrTTk5Mlh6ak9ZdStuR1pN?=
 =?utf-8?B?ME5SRXdMTHhSMyt5UVR0dmpYRFhOSm14dngvc1ZZV2ZuVVpIN1pzWnRCcVNH?=
 =?utf-8?B?c01QQy8wYzBJVWxaYXRWWTdQdUhZeW53eWFxK25MTUFXTzNQVUxON2dzRi84?=
 =?utf-8?B?TDJVU1dhVVBKeUVKSEd1dUxHMEF0WXlBb2Y2MzhWOWxPVXF2NnNQMi9mY3hH?=
 =?utf-8?B?RWExNkQ4dlBHUk5YM2RCTlRJNUdEOEF1WUU2YzFEeE5RVm9DN2ZjNHgwbTY0?=
 =?utf-8?B?Z2JrRHRudS95cjRxbjlWZmduM1BkZm9PclVOU3ZHTU5XNlVoZ3ZnaWx3N3hB?=
 =?utf-8?B?N2tCelFlMXNGV0pwVDZUYTlBdGhIcHdNWnZKMnlBZUE3UjJUdGtJN2hhL1pX?=
 =?utf-8?B?cEt0OXltSG40MWYrT0R6Q1AxblNxOHF0dXJiWjFLcEFrZjZxQmpSSXovUXlh?=
 =?utf-8?B?K3U4aElZUmp1azYyTUxHMkJQQ1NMK1VjdWVlSy9FWkdoZ2xNZlFJZ0pCYmJ2?=
 =?utf-8?B?Q3RPaS9waXVoRTIyT1FqT3dpT3B6UG1MK1I0YVQ4OStrRlQ4Qzh6WUNMUDNL?=
 =?utf-8?B?ZDdnZytyakV5UDFuWGk2MG5va3FuSEROV3dzRFBhSmhCNzA3b2hRMG4zTGNR?=
 =?utf-8?B?TGRVbGJwcndTeU1iMGVVYWEvTG1WeXBhVndjQ1E0NDV2ZWZKN1l6UjN0SHJW?=
 =?utf-8?B?VEk5ZVpJMUk4VHZBMjE4VVdHSnN2NUdSYnJuTTBDQlVZZTd4OFk5NENDODNv?=
 =?utf-8?B?MXRxb1BTdXhtOHhrL3VWY2V4S3BQZi9uVHRlK1pLR1pUMFZxRlNaaGFUSUVs?=
 =?utf-8?B?ZWVhM0lHVmJjTWU1emRWRktzSmsvdU1mQzFyWXVNT0ZacW5tTmpSNzlPTGhy?=
 =?utf-8?B?eGhWcCtsYk9tM1R3bmFCQnZDbGwrbFRFc3pPaXFqTmJRUDhYVmVYbHVjT0d0?=
 =?utf-8?B?SnhkL3RHNkxDcy9VUy9uVS9SZGpUNGx3WWw5MHgra3hUbGZYa3hWdzRTUk1n?=
 =?utf-8?B?clJuMnRielU2RjNQbGZpRlBPVTE1RlI1Z056T0MvV2ZZWnNpUGtVL2d0OFFD?=
 =?utf-8?B?Q0JWdVRQTTArOFNJWEc5Sm9kWGtjalJIcmhVNkZ5NHVZN1FzQkozYU1ZaTU0?=
 =?utf-8?B?Q2txQ0sraExwT3loUTZuU2U2R3M1cGJSaEtlOG9DNTZUNU9MeUU5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22bdb7a-52fb-4145-fd11-08df23cdf955
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 17:19:27.0446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5OdXfu8THl8nhav4gizCl6NvMmVjBsQgSPQoUyfdedeLc8cAMJTl0yZ7isM5Q/S4zWyAUbSV8+oI3BdgVpLu8hfKPQBX0aJXxbV8CkLH5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6588
X-purgate-ID: tlsNG-ef75cf/1791307171-A4AC8AE4-9AB5CECD/0/0
X-purgate-type: clean
X-purgate-size: 662

On 06/10/2026 3:48 pm, Ross Lagerwall wrote:
> Clear the cleanbits only when the VMCB is used on a different pCPU
> rather than on every context switch to the vCPU. This follows the APM
> guideline for when to clear the cleanbits:
>
> "The hypervisor executes the guest on a different CPU core than one used
> the last time that guest was executed."

I think this wants the whole section from the APM, not just the one
sentence in isolation.  It doesn't quite form a stand-alone sentence.

I can fix up on commit.

>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Code-wise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

