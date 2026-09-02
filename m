Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99780C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 12:55:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405864.1639305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kV8-0007qj-1X; Wed, 02 Sep 2026 12:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405864.1639305; Wed, 02 Sep 2026 12:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kV7-0007qc-Up; Wed, 02 Sep 2026 12:55:37 +0000
Received: by outflank-mailman (input) for mailman id 1405864;
 Wed, 02 Sep 2026 12:55:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x1kV6-0007qU-5B
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 12:55:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1kV5-004BsM-Hp
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:55:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a981cba-8faa-0a2a0a5109dd-0a2a450a8ba4-14
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:55:35 +0200
Received: from [40.107.208.18]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a981cc5-f2d2-0a2a450a0019-286bd012c2cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:55:35 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB989393.namprd03.prod.outlook.com (2603:10b6:a03:40c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 12:55:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:55:31 +0000
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
 b=fiAUCmxgfLVgd89j8XpF2jXYqlO5PhIdVp9cHyuB/rO7yyykBW6CJx/whOR5nWbvD5RGOb6j/dZEKyQLbqEyhKMBB+ugSoPsmCL91g2mjFljiK+YveOKLnjn7yB09bpttPjzfWHpdmIcyNSyWo//MFxi9fTOoOZ5OAZDwn84cVFiwgkXdUzZASfWIPEKaL9+Vy0NtXN9NurfQd1P8MM9RF+OFeeO2ny+qE5QU5/qhAHd5y43t6XdPaRHAsS4wdH1pJZe1l4OKC2xNCpO6qBc5lwW+s7V2wJLxWl30c846EXBBsD8zclfBUaCzyCIqsfoAAh0WYEGX7Yqm1yuHyX4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnGhNjvRLAqGuN352sznOHCf+WWTc3/shtTpWm6XGDQ=;
 b=VftP7rP0xHW9q00aN8T5UJGuG/tL1+SxGnKg5OETzyR/ALJEnltw44pMvg1wcgrisUBXG9CLK4k59B1ul1HoZ3oHXwXGOGtCMbv/FzRF0UUb9AVz7gbghqQXscEa9EOQmGlkRF6Hv7FTeWegKKsi+q2Pa2VXeMEyJb2CGQycAw9je0ST2c7Deum33jlNoZDnM38Gy02w36s12cTfxSOodB558rNBS4VRkgNUEpvE2vryu58ET5qMpCBhnkC7mODmuAkpMvpmM+lTQRuM2Y0SFiFtXiC4ZIc+D0RLxoD3OBarCmOAi9KgOoeEvwoEi0uo9rEaAtkHnOZ2ND34IaqQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnGhNjvRLAqGuN352sznOHCf+WWTc3/shtTpWm6XGDQ=;
 b=izVISoFXwcgrSVaOp1yg6I5uppkj2ydeXiilz/VhTryohCutaB3al7IdNysBCiqUGYQLubkY02dy8ojNmOke2+xvDLJcgVuN8N0WoVApw1m/U/wxwxEN8AMbHtASO4uFMc/GDVyi1iIyTHBvSh36SgvZ0MsWTE+5C9muAgNTd1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a7dc1e29-3eef-42d6-8c7e-165ff934a6db@citrix.com>
Date: Wed, 2 Sep 2026 13:55:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/4] x86/bitops: Remove CONST_ADDR
To: Jan Beulich <jbeulich@suse.com>
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
 <20260902114339.62043-3-andrew.cooper3@citrix.com>
 <7515d6cf-4f5c-4390-abc7-45cf72b053b4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7515d6cf-4f5c-4390-abc7-45cf72b053b4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0625.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB989393:EE_
X-MS-Office365-Filtering-Correlation-Id: 363cea3f-6d11-4184-4b4c-08df08f1786f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fvCGifQICZ3r8D7v8kEyw/MOzLLxR7TDlLyqXpwT52/srDC98684tOcTvCt+B4mW54L4YN4Fzg8d1mNq2r9eC3pC9JJyBepQeWPb99URWBRqijVm82jnkuNMtBo0Gp0B00OOwh7T/mm9SOcnhSqUpDhfnLwhB/fJaGXC632L4HX7dNEVKf/gbqlTzIZPw7S1efP7ojRdi1xaW8wd6elqFLXU+uHFMiIU2mU+LTmurQMhehRKdjgaw//oOSgWdutSoFdVFe+KGWLOInO9ynKLihxlGCmO9HMKUqATnzkfv7iwykZivmZ+W6co3E+OdWqZw9UD7S8buXROqwfuIkrOU7+AwdBQxckdIK/j15YBVLjU6y54uRydoYanIhn78Q8C51OT8FpqFj+9O9B9AWWTHqaSTgViQpK61iowvoKrypy+nrgIHm4Q+Os35fjmlM3fXxcidN3EeyBbR71+hIbQstxlyjl0WamdJgS1D5b88WAkDR8TJUxBhmL0cykeME6YD0d5TvxONEFKMYz2DPFbAXcn6sGk1a+l+zHAyOv9sacLTbnP148mP+86G2IG9QjPuDiYnJGRLo0Omf1Azp0CiIj6pSwA5aSySt9qanjgnOmGhWVYgzy51LhwBstLiyK6HN9PC+xTLM/RHlsoMlr7gGEsYHnukslQnQe6q43BxFY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVpzWEVPc1M0VEVhbDFrTmpiR3RWR2d2OENaUDk5WmZJQmRxTUxOV2Z2VFlz?=
 =?utf-8?B?dXJFNGQrVUJNSnVyTUczUnFmRFB1Tjdic2pWWW1WWlBJS21GdWV5STdIeXE5?=
 =?utf-8?B?UE5wSTJqdmxSZFQxdmtub3BhS3hRR3Zhd09OSk9sRFREc09nYkhob2MxWGtL?=
 =?utf-8?B?TkRGZEphbXBtQU9iNG8vTkx1b0NyNkVkaC9lM1BVekkxazh6VkRrZFc3RFI5?=
 =?utf-8?B?YUpKQ0xweU91RzlHWnZidFMxYTlhWW81VjB2d0J4cXpMSmZHdVBOejZmbFVq?=
 =?utf-8?B?bHQ4T3I0VGVEMDRRbUhKa0FubUNEV0hURjlEWFI1RDB5K2NRb1B3SmVnYVcx?=
 =?utf-8?B?aHgvR2Y5SVA1WXZyMUxlV3JsekR2OWh0NEo0NXVVWW43YTIxRi92R0tTWVVG?=
 =?utf-8?B?Szd5cTR3WWRTS1BqN3Btd0RxOWdaK0IvaXQyb2lCNkZtZnhJd2FUb0RJaC9n?=
 =?utf-8?B?blRVcHFOMWVJc0N1dGN2MDJXTkdTd3JGb3JrS3kzT0pOTVo0QUN6V3RHc0hw?=
 =?utf-8?B?bUpHcGhiZllZRUZ5UkZlVkwySmUva0llQkZBWXErN25LTG9oSFlqRHJWdGN2?=
 =?utf-8?B?M0dPZU5rVUZMMlY4enVxVjBGeUt6MUs2QXVLcjRIejJDU0ptek5TTmJmQ0pj?=
 =?utf-8?B?YVlUMnBDZnBCeHdnNStnOEo5bEdwYXlyOWF3OVRXR1F6bUpwY1A4aTlMRnpW?=
 =?utf-8?B?cXFzZEpiSWU5TDhQY0haOE9EWUdlbldsQ3NNK2c1bWN0a3VjNlB1dGZvbzNU?=
 =?utf-8?B?R1ZrTVU0bEo4UXljMEZIOVpXbzVqMk0xWUxhMk05K2JFZWs5Y01YMExodWZD?=
 =?utf-8?B?RXRDVEYzMFAxdlAxcTN4V0hGL0FvOWdqTXFYMEpycEZRemJ1Tk9lNUVpVnRL?=
 =?utf-8?B?MG1jUjFQa2RVSWErV3pjZEErZjg5eWZMUHpsR29aQWRyKzhITi9uZnZMRjVH?=
 =?utf-8?B?dDBMVHJKZlo1TUhKa0l1Z2tZT1pwcERqdHlDem9aQmdyNm5aQXR4dG52TCtG?=
 =?utf-8?B?U2p5T004RVZUZElrcW9acFR5VW5OYkkwZnYrWnZFVmxxL3hqcTZCVVk2cmFE?=
 =?utf-8?B?bW5XQ0NPTDFiTU96NzJORmdxekRYRXZYbjI0VE9ET2xySlZ2bE1aT0tQcVlk?=
 =?utf-8?B?Mi9JUkdTWDhPM2hQNkgwK2FQVGRCZTZwU2ljcFZiRWdnSVAraVYzTWFpVVBa?=
 =?utf-8?B?V2FnRVRDVzdmYzhVbDFZbW14em9mK0wwdWM3YkZkK0JCemN2WS84ekhzTk5X?=
 =?utf-8?B?UThnYW1OSktoK1BEUlBrdXY5TkpqQUZkZWxCVHVuSklaWFhyek5DVzdWVE1U?=
 =?utf-8?B?ZUNpTTRvRGdITjY0RnJPTDcrVzBhY0k4eWFUWUxzN1lUbTV6T2JscWNtZEJN?=
 =?utf-8?B?aWRHRnp1THowZWxXN0xIQnJ4cmF5WmhkSjAwQTNWdVdJVFVhQitaSjR4bjJ1?=
 =?utf-8?B?aGMrcDBuUXllMmRjczhyRm1BNHpYV3YrS3A5SDR6Y2hYSExzRzdCWmx0ZnNn?=
 =?utf-8?B?cEZ6Qkt6YjVOdkZ5VWlDNmNtcDVBM2RGbWw3ZTZ4WnJCYlF1bHhCQVBZT0ov?=
 =?utf-8?B?d1JqdHhwWU1WSmhTdE0yVHlsL1B4dHhKbWI1cmJmY2thdGN3Vjd5SGZwNFAx?=
 =?utf-8?B?YS93bmY2OXN6VXBCZVBTUEZ6M2JDOXF5dERDYnpuRW9XVW9rMlRsZ2JSbVRj?=
 =?utf-8?B?cmZMQlppU2tPdTBNNDdaZE1ta2FGVWowaGR4S3BXbjhTWWhwZ3VzWnlvSHJQ?=
 =?utf-8?B?aGYwY2VERXNDQTlmUHpZeUE4NmFQNDVwZFpzZEdtbEhDb05meE9zV2E4YzBS?=
 =?utf-8?B?bTB3clp5ZDI5eGdvTHRnbjlOWTBXeUZPaXJxamJ1aWx6aUplRUY5eW9IRERt?=
 =?utf-8?B?SjBBZnpYT1p0eFpObEdyV28rdFhRRG5tdmpxT3hEQjhUQWdxM3RQbms0OEFy?=
 =?utf-8?B?VHNycThxOVV1aFN5NC9FUUN3QjRjWWRJck5HT04xb1hkWmFWZ0xNbzFHMXdp?=
 =?utf-8?B?SFRSVHpIUnQxeCtsRUlnbjIwbGhjNGpQeFZRcERvYVc1cG4wTVZpaGFwNVl4?=
 =?utf-8?B?RnZDWGl2M3doM3lwM2N5aVgyRkhyUkZsUytyNy9HMEgvbmxkQkJBeVpOL3JS?=
 =?utf-8?B?emZSazlYUDVXYjZrYUhNRGpISGFobWo2QmRXK0krcWQ2V2NieWF3a1Ivai9z?=
 =?utf-8?B?YzR0NjhpMFkrTmNnRmZOdFBmM0lqMS9tdEtkQVBNUk1vWjNOa01zdG55NEZ4?=
 =?utf-8?B?cTZSc2I1MXBIOGw4OXo1b2hMQk1UQWN0R3pMN20xQzQraG83VmpDWWxWem9u?=
 =?utf-8?B?ZGxtWEUyOVByK2kxMk5zZVZoMGVPME5PcEpJd1dMUWtySzZqVFVMZm5LMEo0?=
 =?utf-8?Q?wi+n+E/qzeaXoo0s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363cea3f-6d11-4184-4b4c-08df08f1786f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:55:31.2336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EayQstI4mxa9ETDEAAwt3j5dVBk1alabVRL9TS3XXDehhHMT8FUQp01ALq8h3ogiFXS60H8wMjmGFmOSznhYmaAZif93jJEBCr7MzKHmobM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB989393
X-purgate-ID: tlsNG-4011c0/1788353735-524DFCFC-527FD4CE/0/0
X-purgate-type: clean
X-purgate-size: 709

On 02/09/2026 1:43 pm, Jan Beulich wrote:
> On 02.09.2026 13:43, Andrew Cooper wrote:
>> @@ -285,7 +284,9 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
>>      asm volatile ( "btl %[nr], %[addr]\n\t"
>>                     ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
>>                     : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit)
>> -                   : [addr] "m" (CONST_ADDR), [nr] "Ir" (nr) : "memory" );
>> +                   : [addr] "m" (*(const volatile int *)addr),
>> +		     [nr] "Ir" (nr)
>> +		   : "memory" );
> Hard tabs look to have slipped in here and in patch 3.

Yes, sorry.  I only noticed after emailing out, and fixed up locally.

~Andrew

