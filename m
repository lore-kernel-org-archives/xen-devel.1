Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F5606A330
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ODLZflXy
Received: from list by lists.xenproject.org with outflank-mailman.1485290.1688504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRR0y-0004n7-J8; Thu, 12 Nov 2026 09:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485290.1688504; Thu, 12 Nov 2026 09:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRR0y-0004n0-Fi; Thu, 12 Nov 2026 09:22:40 +0000
Received: by outflank-mailman (input) for mailman id 1485290;
 Thu, 12 Nov 2026 09:22:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xRR0x-0004mu-HL
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:22:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRR0w-006SYY-NS
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:22:38 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af58556-e002-0a2a0a5209dd-0a2a4501b5c6-14
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:22:38 +0100
Received: from [52.101.201.7]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af5855c-5984-0a2a45010019-3465c9073efa-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:22:38 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH2PR03MB5175.namprd03.prod.outlook.com (2603:10b6:610:a1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 09:22:35 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 09:22:35 +0000
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
 b=he0iMyPXgqXEo/x5UW9L3DjVSnlsGWnUAyqNHUPIk+8tLigyC1sW055vJP22nuO1RUBNE6JnYwtTkY9yLZEl0kKoJGwne/2q0l8i9PgH0xlhKPB5GLfjdh/pIKN7Y02A8I4z6h8GTi10op+dIp+pFAdSO+auKcsbDpNXTsByMt7JxUeuMy9N1dwy7Vd5I5Q0K7UsH9a4D4veET0i63hICO6BfjBVl2AWz1UIx8ZDlElgW9QZbossx3jrPUm+7al7GYpy6BwAN621w/4r5sTgt38ZgzxoJejlPeOVBIsCW66qnR2VL75pZTSGz+GqOQJE18Ps28PPl1MritJF+NCmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ja/d1sveR1AQ2luHbo4VNLAQvVgdkYyRQXcz65zgy3U=;
 b=ydezs3BEkNvgyUrmtwqylNlHV6rzxT6TVpXYgw5X1JDPOQaq2AJrqvp/kLeQ1jSgLUIWRgy6JROZv0U/D0yOz2fYvMIcC45JS+wJZtshWvsYeDMR42/iy8yDaIOoPjqjATltUWHX3mHoishhVG9K6PzPbEeOa6TSVPwyDSpQotzIAVskHEyrYr3PN3ryxz+wmNqL73LBRlC+iJOyIkX40z1g25MU7EZAaSYAYPZOxCx14/5Ir5XK7tb8vj/p1YLv1VqnPTfaiiCvbu6ctc2p3r+55HBzZedIGunPko6xaYllHw9m7zuBhWJRoBGZfRCsW1gKlSv4moXhkciRtVIJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ja/d1sveR1AQ2luHbo4VNLAQvVgdkYyRQXcz65zgy3U=;
 b=ODLZflXysblerp5q1aJiDzEdxnOhBz9f3MM0L547CwbpBPuBBmteRe5STiLCuqCQfi3k05qni6V9KMdG8aMkpVOLZDIlpBr7HlK9CbnfWbVIHTx40LFmfpwCdH4f6YEXfplwX2qVTPQzoqWLKJipbdBiX8Vn8yaymo5A1h1WYmA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d660706c-8749-409c-b615-7e3f7a726cc3@citrix.com>
Date: Thu, 12 Nov 2026 09:22:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: Treat the vector of INT imm8 as unsigned
To: Stephen Cheng <stephen.cheng@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20261112072303.86955-1-stephen.cheng@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261112072303.86955-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::10) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH2PR03MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b81ff58-c51a-4efb-7a62-08df409e7c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|22082099003|18002099003|6133799003|261102123227099003|261022105027099003|10067099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261021135927099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	RKpNju/IX1wTC27Yiz1WujTdNYn7POI/k9uC04aYnMBGOt8APwWbImWWmyz5LS9k7l6H+gMOmgVJohF+hTPGoAUmqoxjfrFqbQYnnLGbnLeL0jPa56VFoYVErPMAwA9y0ki852KfAIbOqKbWuB/txRo6YVpokuOTG5SapVTxU9z43EtsvBezB/ae4f0dUw+kF8VSWdLKhnen2guVcZJuX0twSTTf+xUjF+GyzlbC0W7j0pvBofGdZ+6pPieuTACqt1WVHTCHNN5nv++nQElgTS43XhvZwFMNJP5/vmDTcp66xJzVChFqIRTeOiKDGEEa6z0RZrVGoKmcMPZHK9OFVzcAlzLcEza6GUS3NSWJFwFPSzCaXZAjjHZr2NcNYaOFwfbcsZ9AGSqfF665vPzybAixJTosqk4g0rAq0GnhwvmjHZ3d09r3fVNx5G+URxm3ewCFFfiwC5mwOR9C/Id3JhhPy5UBw3aDPqML/Ue4hA8PkhP+1J8s90qyfbc6JEhBI94QO9mJVEHkpXEYDkd8Nd6LPFeY8cvnXjTUxRVUvCFdIUcn2T3bKRkOh07w2M3MhC07T/d/DZfxYxgYPLuw9Mxy8uga26Zfi2Y7Szf+MNKQ7BGUY7qaksQHWGa4d80YSuVkfJi4wKoQnQgEkbACLBa7C1PJKGl8oq6To3vSgzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(261102123227099003)(261022105027099003)(10067099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021135927099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUpjSFoxOERoM3NJWVlkOUNHQ3lTdlNQUEZSRm92am96c0REUXJyQnZGTG5a?=
 =?utf-8?B?ZUdXNVU4L01xRmpuUWtqTVZYa243K0h5djJjRG5DeVNsYzE1cGJiT3JSWmli?=
 =?utf-8?B?NFV0WDVzYkdiMXc5WkJxY3FHSXJUTTlvblRRaHQ5Znc0Uk9DZnEzNDdSN1dx?=
 =?utf-8?B?K0IwOWF3UkJpb3ExbjNsZDdSa0FuMjM5KzVoaWIzVldTbG1QV0w0ejJodS9s?=
 =?utf-8?B?N3lwaDdEQThaQU82NUJCb2VpUlZ2WGRzT09weURMbTFNa2VCbzl1cnN3QnEw?=
 =?utf-8?B?M1RJK1d5cWtTVkN0ckozWll1aW9CWGFIUnJ2ZjdxMXFUMG1rSmg2WGoxQVI0?=
 =?utf-8?B?ZmF0TzdsV09yZTY5dS9XWWFMU0RwaU1Eb2hiSHdUM01vQ2ZCMDYvU1VZMTBF?=
 =?utf-8?B?Vzg0cWhPa1BpS2lHcG9lM3gxbDlCTXp3RC9aZnByZkRITHJ1MjV5V0tnYkxt?=
 =?utf-8?B?eUcyYm52ZUpLVVZxRW1pMnI5VmlIeEIwb1MzelFUYUJnVEVBNUQzeThNbVNk?=
 =?utf-8?B?dk13K2dYbEVOa0hZYy9pRHU3TWl1eVFWV3ZWRElKZVVCVitCb3ZwTmFwSFg5?=
 =?utf-8?B?cUFTclh5WGFldndtaDc1aUJHK2xXeXJvQUF0SmVwTVJhMzgxRW5QSGVHUzJG?=
 =?utf-8?B?UkhubFExVUJCempSRENXOTVEazhWOUhNazJxc2NSMUttVWZNMFNCbkoyWEli?=
 =?utf-8?B?NHBVOVdJVENsMThOT3VFKzdPZzN5WmJPRnNKaVpHdjNCOXdMaDNxY2Vnb2F0?=
 =?utf-8?B?LzE3N3JNaWVOOEc3cnBuSXJTVkxpZE42M1F6REtXSTFRQy95OUlWNUdWaTBR?=
 =?utf-8?B?T3BDTmxGbDVhcXpUNUlkSlJkMk9NRWZ5RXhhRzVWZGRSSjdLVUFnRWxwYWFQ?=
 =?utf-8?B?MEFpVUllVDlMdTBmUmZsQjI0anJhQmtVcnFrazZaNlh1OEUyQS9HcVNyNmhk?=
 =?utf-8?B?Yk9FUkd1VVIwQmFERXVEMktKSU1wNkVFUUcxVmxULzhEbWhmcnRHcEFLc3l3?=
 =?utf-8?B?eUUwOTg0a2M4a0NtYmZtMkJTdTlrcWpvQ256UUNQS2ZVS3orWXovYkxSYlc3?=
 =?utf-8?B?NXlZaThlcnRyYmg4ZjdaaWV5dnlneVdSSm84MHNiRit6Y3o4N2JNZWxWRU11?=
 =?utf-8?B?WlFpbk5SZkc0bnh1SXdHZkVLMElRWlZpeWx6cmhGdnhvVWNtem1ieVRjaDIy?=
 =?utf-8?B?R1hkeWpNY25QczJxK3g5NzhMc3R1T2V4eXhob0FBb2hsb2pOUFFzaEpwSldw?=
 =?utf-8?B?ckhWVy9Jd2YvMG4vRVN5N05ERTZGTUdkUWY4UlBFMW5pamRqdWNJd081NTRy?=
 =?utf-8?B?em5YWE14TjMwMGVtQXRSaHRER1Fvb3pacC9UdFlUSG0zUDBoaE82U0tCT1RW?=
 =?utf-8?B?YTN4cXBYdGFzb09iTUpRRzhkUDh0WlZJaGJYWGhHUlJHYVVlUjd0SXdqMUtO?=
 =?utf-8?B?NXUvZjJkUHJHbkVUeGp4elNDUHF0VVQrSEdpNWVDTUxtTCs2WTk5Y1ZobFJP?=
 =?utf-8?B?QVdINHZCbXQzd0JlMTd4ZEdhdzljL3FzM2dVaWpNYkRFM1NiTjBIcVZ6c3lE?=
 =?utf-8?B?YXBUY2U4SENPR0xpSmdvMkdqTHQrMkFwZHVhNkJLK1gvWWhoTTRKNzV0bjRV?=
 =?utf-8?B?eExUdXk0OXozOGs4RWVLalZCemx2V29pOHhyY0czSXZ2cUlGVUZNWlVCWS9a?=
 =?utf-8?B?ZURSN2poanN2SHFNcDQwRTIzdGl4eW5GaHdQdVh6UHlyVGFPQmdhSUZEYUtu?=
 =?utf-8?B?UHF6TnVVRHZZemNGeitaWStRbjFGeWYzdm9ySUFkTCs1ZStkQ3JWTzQ4TXM5?=
 =?utf-8?B?TGkxNXB5a21ZK0xVWkdsZ2NyU0VhNk16WE0ycmNTUHZMdWRyVXFSbXNITUQy?=
 =?utf-8?B?WldSTnVHNk9JYVY2a2hzeHZacVNNOThucXhCRE0wMHA3MlBFNitFMWIxZGR4?=
 =?utf-8?B?RkVmNHhBRjN0U24wdWxhZlJYZTFldHhWT2IzNmVIRm1zaUgxeTdpSmFrSURk?=
 =?utf-8?B?UmlOQ3pKWDcrREQzY1FDcjlUNXFCS1BudVFJU0tPSTNoRkFmaFgzU3lnYnR6?=
 =?utf-8?B?dUcvcWpiYm5LN1dPZ2pYY0dLMU9yYzA2RmxKc1AwUzE0bEVrcHBvbk55bFZ4?=
 =?utf-8?B?ZmlnVmZVcXV6K1NSWmREQ2VFQTNoNHYyaUI3NUJoNEE4UGwrVnlGTndka3Ja?=
 =?utf-8?B?NDVNU0U3ekFBRkpWVEo0aTdCamtGK0FIRks5UWtBR1U1a3A2MHlRMmlSeDV6?=
 =?utf-8?B?SnEzMnlkanZzRlRLRmdpeG5JQXVGS2U2L0h1N3lrQjZaWllNUjYyMjhPd0I3?=
 =?utf-8?B?bmFkMlI2SHM5T2Z4UkJRdGNtSWVrcytwWXJqLzBHUHNSTmh1MjgxdUl4Zmhz?=
 =?utf-8?Q?y6Q2ewJ0P5qsBLF8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b81ff58-c51a-4efb-7a62-08df409e7c8c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:22:34.9198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWrwr20IySKeU44HhdkElZM9Nd+CBha3iUIyNf9leLqcH5wL9Z1r96xZy4pi+V+ut2NF36xxVEzqWOsPpjbXcBnSNRBmFHw3rVlJfWViHig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5175
X-purgate-ID: tlsNG-d62444/1794475358-BCF47757-53157F78/0/0
X-purgate-type: clean
X-purgate-size: 1733
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 7:23 AM, Stephen Cheng wrote:
> The decoder sign-extends all 8-bit immediates (SrcImmByte). For INT
> imm8 the immediate is the vector, which is unsigned. So INT $0x80 to
> INT $0xff put a negative vector into the event (e.g. -128 for 0x80).
> 
> hvm_inject_event() then fails its "vector == event->vector" assertion,
> and a debug Xen panics. An HVM guest can trigger this with the forced
> emulation prefix (hvm_fep).
> 
> Cast the vector to uint8_t, as is already done for the port of IN/OUT
> and the operand of AAM/AAD.
> 
> Fixes: 52053d5fc2f9 ("x86/emul: Drop swint_emulate infrastructure")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
> ---
> I found this with an XTF test which runs "int $0x80" with the forced
> emulation prefix. Tested on AMD with a debug build: without the patch
> the host panics, with it the guest gets vector 0x80 (also 0x21, 0x7f
> and 0xff).
> 
>   xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> index f168f3ebcf..8d53873c67 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -2453,7 +2453,7 @@ x86_emulate(
>               ctxt->event.type = X86_ET_SW_EXC;
>               break;
>           case 0xcd: /* int imm8 */
> -            ctxt->event.vector = imm1;
> +            ctxt->event.vector = (uint8_t)imm1;
>               ctxt->event.type = X86_ET_SW_INT;
>               break;
>           case 0xce: /* into */

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks,
Ross

