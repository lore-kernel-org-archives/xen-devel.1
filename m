Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4C2606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=q8qP+mYv
Received: from list by lists.xenproject.org with outflank-mailman.1500457.1696605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVVbH-0001Cm-8D; Mon, 23 Nov 2026 15:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500457.1696605; Mon, 23 Nov 2026 15:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVVbH-0001Cc-4r; Mon, 23 Nov 2026 15:04:59 +0000
Received: by outflank-mailman (input) for mailman id 1500457;
 Mon, 23 Nov 2026 15:04:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVVbF-0001CW-VZ
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 15:04:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVVbE-000GQt-V6
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 16:04:56 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b045616-8faa-0a2a0a5109dd-0a2a45068b6c-8
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 16:04:56 +0100
Received: from [52.101.53.23]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b045617-195a-0a2a45060019-346535174577-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 16:04:56 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5140.namprd03.prod.outlook.com (2603:10b6:408:7d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 15:04:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 15:04:50 +0000
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
 b=Ag4uz2FcMW2p7wKchCCr9XLdYDuhbaCxM81zJ4RyW2w0In0db6BKPoFV1vN6iUHmhM3A3YirqNO7kpugx1J3QBdZxvx4A20MbyKQ6li9V8Cw0ia/39B9/S9/TnoirTScQDqAyc1dEEb+0R3iSihq8mdMpb55pF4D7yoZjCldioNfsdAs1jFq/AJoUdULrFw0JTmEo5yya02VxOqaRU7A7uaj7iLhUj/5t0KpsVlhyTYg16sTahY9I0LUdgIgwVfTzG/7RQl0idUClbRvEVGWLlUO+Fx0OHWL4B7N1XMdcC7HvhamLOSEepMGGF0Y52snHlIO8VOiufOm1+aHCoTlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASvrhpZaSYlAEY9NOQhjcjL9+qJUz1XjDDhwFksmp4E=;
 b=dYxQlZc7LOMyfwkqiG/RUdng7nHsPVveO9wKqru5gYMORh+PLa11O+OiYwHLCcyFvMcSXq/9ioo2QNfXQkzcgffi3Spy1gPCwiLETFm1pzJtqwmwjE2jfFskdqaJ0dHmKu7erpp6J0eAi9HpylXPXfuzGmgdzPk0of7TndSp1BuCZEU8V/VtNSgV8ftQn+zlD8RrXqgpj/xXIGpeJoYtma6LtlvIV17pGXk6uD4m0Bp0mgyhZcQH5MzQx7tVF1nZOiJxbE5G6Syph4OyzQgynwVIqZbUkyk2Q2bU6lcgWPTC5i6G+u/0v5CoZqqiytY06GY2QiryF//1FqPKA2clSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASvrhpZaSYlAEY9NOQhjcjL9+qJUz1XjDDhwFksmp4E=;
 b=q8qP+mYvZEB1Y4mLujkfz7nroD4aXBUUq8Exaanvzf169FcNP4oBkVEAJWoTsPIKQdR+4Go44rUFkufxKRlQiUsEN6lvUdAUMvcC1E3kpOaKdMdbdNnYsaouBAXcJltzhkMM6iKYnpQvBGUk4Nae8H9cwAEWM0tz5ivpwGeVfro=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fc525728-3749-41ea-8276-9e248c1ae4f2@citrix.com>
Date: Mon, 23 Nov 2026 15:04:47 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86emul: MOVRS are NOREP
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <181dc3b6-0737-428d-8491-b4b2ced2bd84@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <181dc3b6-0737-428d-8491-b4b2ced2bd84@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0115.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc4c747-f923-46ae-e72e-08df49731f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	4zwYawAQxT5NmwLjapbcr8mrP6tPfU45saM0RIRC2POtT7wa0WMRRzvqTGZhBtMZf2KKIIgAhB9cJWv9xYNyJVipIQ/ckqAtwBB+NvzGKUiEuueO8yYNxWFKLTkIFgaW2ZGGOEFX6SWtZAmh2VQOkr1IpxSGXxCxeOGL6vV0/k8FYIjVTkqLq6kKc/bH6XSv8ka4hI118gqeqt/0FxSKV8TeUL4d5HRyIbkFVqtCmGMMO2bz2vCF5GyaKS3748zj9xj/VNwWKYhmQgkxCzmRPl5DtgTcET1JPYpBBRnWRoOtiPwAnIx7Vaexzc+xvis3k1ZtZaInAw1npxTqPBu0EBvXa8YMH9J1SUWyC+cf9LOrS4xQNpTYOzxlJ12m6SFxGI0XN9bMyymRjpyeQFM9LSD07IF/VE2OflSd0ra67/Fw2tt8lC4yuxT0NAFxNfIGWvSLEa/FtSfwe3Zokxy03ULPpOuksfF8wEfjGQ0R6TVBK87gmOOHyOY+m6RKQLWIRLkcf5vpYJ9sLzTuYQkvsjYSZY8pT2RZ/BhU+QxKCURLuScGUXS/eCCiVC7PanxqM8GhRZDgQHuUaAgAUPy+beOv+IlWB/scc9sN0eGoXRcTVkLnSYUUr/+4zCjPgY+GWa44t9RMs8uwABevw7pt5jZzceYtpQ5m9PqnglO8D/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXU4Qjk5cUdaZCtiSHhUN3ZnczFnZmVzNmExbjVUS2RXTHdvUjd6SEdETHlX?=
 =?utf-8?B?WjN2dU03ZHhFSVYzVmgvVDRkSU1GajljckJCMEJDQnROVy9NVFhhdHRzeHpw?=
 =?utf-8?B?bVJCMVlBbi9LN0Z0Y0lra2pvTVRvcEZBYVNNZERTbjJRTS8xR3Vxd2pDUmhO?=
 =?utf-8?B?OXVYM2VHOFFKeEJxaHlWaVkwOTlUU2hxRCtGQ2tieGZYTVdIVW5Yc3lCSFds?=
 =?utf-8?B?SGVGeEh2dUpMeDJ4djVsYmw2dllXRDloMHBPZ0loSEhsUWtrbUx4S2ZPVm03?=
 =?utf-8?B?RGZjS0VUWkE5SlhhdDFCODRZa3E5ekpKYVhUUFBsdThDcFBDaW8wOUxZOHUy?=
 =?utf-8?B?bkVxbnFTUy92MW1FNXdZVXc1ZmErcGJWK3FkT3N2VmpOOXBIYzFQeXpCWjRz?=
 =?utf-8?B?M1F3bk16TU9iN1N5U3lDZXgwMlZFU1l1RU5ZL2praEg2ZzIwOTlaUWN2TmNH?=
 =?utf-8?B?ZFJneHB2K1BuOGtRNlc0cTk5dmJCRUxHOUVQVW03VkthQmNnN3VtUmdORklh?=
 =?utf-8?B?ZUZXbTRORWhIOHRVZ1RWOVhPNm0xTyt3ckRhV0sxMkFYUlJraDVueTlKeXh1?=
 =?utf-8?B?U29rdFNRRmdpdzlrOGZCcTJyZHEwbXdiMXBnakp6NVlSZU1DcGkzRXZuVXdM?=
 =?utf-8?B?elhWTUhXQ0J1cEFlMDlzLzRrS1JMVVVETmpXZU5rUzJLNEFWSyt6emJ2bGxm?=
 =?utf-8?B?L1JYQzJQa201TG9kdnVlYUF3bmt2ZFFGWXRMTVBubHFVWXpzdmFpSWJkVGVZ?=
 =?utf-8?B?U0NnL2hHWVYvM2NsZ2MrWTA2bm11R3p5bGZCbmpLU0hkbk1kcjZIc0xBR2R3?=
 =?utf-8?B?K0w3d2N1TWpoK3BlS25vMWhTQU5sbGJFRThKY2ZMS2tGL2laeVFZMnR4enZ4?=
 =?utf-8?B?Q3BIRlgxUktzTXNDUlpjWFVZZTBwcWdXNmpwR0RvU05OUHEwUlZwdzVzRnNK?=
 =?utf-8?B?cldJS1NHWmlidnR1Mzh6STdQOVcwV2haYUxhRitac00wSjhkZWhwdjVxSTh4?=
 =?utf-8?B?QzZkVUVydkZkN1AzaUhidDJaZytKeFUzUzljeVhrZkJ3VlB5aWhpYmFGV0M2?=
 =?utf-8?B?cU1GMFNXS0pEZFhGRVViQThtZEl6VmxNakd6U3ZOSzM3Z24vaGpObDE0WTAy?=
 =?utf-8?B?QTlLdVFtMlc4bXZwRXdOZzhlYkxFWlJPMC9ORFU2S2VzQ3RkTktyUlk0SHc2?=
 =?utf-8?B?akVjK3RaUVJURVB5d0pad0M5ZVVmSWxkNktraytxZ1drSlRBanlvZ1Q5MURk?=
 =?utf-8?B?NU54ZEZhMXlnREYzMnFhelpKWnR0NUk2Syttd3BBMC9GcE45N2EvY1I3OHZl?=
 =?utf-8?B?OEx2d0ZrMHp2MHFUTGprb2JmNC9KQkxNa2pPMFoyU0RmM0lUOU5uUFJDRVpx?=
 =?utf-8?B?MTZPTVAra3VhVzc1SUNrT3ZlTUF1TzRlbW00Mk5jcG1vNUtDa0g3SS8vMXBX?=
 =?utf-8?B?a0t6NW81WmdyVVFJK3hRSnZiMnJrdGR5L29IWHdJYjlrRmtVTEc4VEpWS1Nv?=
 =?utf-8?B?SGxNOWFvcW5HdWZYWlcvRlZlY21oSkZXb3A0TmpPekx2YWRpbko4d2FvVlVZ?=
 =?utf-8?B?TVNRZFVKOTY3S1pCcUpPczRxVDlmd0RyeEhMKzJvYVgraWdMcEtTbHBhMm1M?=
 =?utf-8?B?QytHQ2ZaRUYvVDU4WDBEdTk3RjF2WDF6cFZsazNBWTJpUWpabTJ3OWc0eDJN?=
 =?utf-8?B?Skp3bDI5eWNUdTE0UUdxbzBnSW11U3FkQ0JvRGh1akI1TUVXbVQ1bVZMbFBh?=
 =?utf-8?B?VUlnV0Z0cVU2YzJHOXdETWhxSXB4TUU4dldXL2xhMGNNcUdCTmViQmJlTWN2?=
 =?utf-8?B?TnYyZ01YRXpTdXg2OWJUbHlwUXJtQmxCRmdqNnVYVE9ITzc0VUlnbHRvcERi?=
 =?utf-8?B?UndGcmFTaXU4OGY2ejRIVkV2emNnZlAxYWhEd3NYVy9qdHZqZEVaV2lXcUlI?=
 =?utf-8?B?eWtEZjVTOXVFVVF4OEcyU21mVkRwa21PQUFBeUIwSXo3Vml6Zjc2WDJVUDlz?=
 =?utf-8?B?SSs3dTdMOWtZdHVUUnFtWWxjWklrRkZDTC9FeG9TbGkyTXVzWFBWS1cxT3cr?=
 =?utf-8?B?UUgxdTkwWEpPZE01Ulkya0JUNmdNUGVGQ2lLUkxlcVYwQVpqdWFYMTRLdXNH?=
 =?utf-8?B?TERLeTRlMmM3RE4xWXdxT3BIcGhNdEFaMHE1eDUxWmsveTQ5STVvNmEzc2Vq?=
 =?utf-8?B?VnF3SVc1aVdEWlpXTEs0OS9icWdHTW4wTXljRVN3Z0F2Z2RaMk9JNHVWSUJ4?=
 =?utf-8?B?RjI2SnZzRDUxZmdTd2tPZG9yMHBKZVY4ZHdaL0tIek9HaytNMkFabm5rVEM2?=
 =?utf-8?B?VTZuZmJDNVBxa3pYNEZLNStYZWszYVZ1dXJBMk5ONkJYbjFYT2lJTXNPcWNv?=
 =?utf-8?Q?Q2CNecID215XHB64=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc4c747-f923-46ae-e72e-08df49731f68
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 15:04:50.8865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvOzPk/5Pz1yMgcxub96EAJHwiV8RFZjmMvZypoOOUjUy57ZX2gCVEWaK7TTPA6OoMdHNEWWe8tGB/eKD/i0zLFF4aFtwXAgy5ZaHWk+GTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5140
X-purgate-ID: tlsNG-16d1c6/1795446296-F520877B-3AE92666/10/78276251493
X-purgate-type: spam
X-purgate-size: 381
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/2026 4:48 pm, Jan Beulich wrote:
> REP prefixes alter the encoding (to, presently, #UD), which wants
> reflecting in what is recorded during decode.
>
> Fixes: 59b18eb757db ("x86emul: support non-SIMD MOVRS")
> Reported-by: Roger Pau Monné <roger.pau@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

