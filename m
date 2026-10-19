Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8B606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=uEL+IT39
Received: from list by lists.xenproject.org with outflank-mailman.1455001.1668553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIuba-0007vQ-QU; Mon, 19 Oct 2026 21:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455001.1668553; Mon, 19 Oct 2026 21:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIuba-0007vJ-Nm; Mon, 19 Oct 2026 21:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1455001;
 Mon, 19 Oct 2026 21:09:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xIubZ-0007vD-3x
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:09:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIubY-002V1u-Gn
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 23:09:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad686d0-e002-0a2a0a5209dd-0a2a4509be88-26
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 23:09:12 +0200
Received: from [52.101.85.60]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad686f6-be1a-0a2a45090019-3465553cb453-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 23:09:12 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MWHPR03MB989378.namprd03.prod.outlook.com (2603:10b6:303:2aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 19 Oct
 2026 21:09:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 21:09:06 +0000
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
 b=zFHPP05NzX8AOZPFD9L9Z6fs5UnOQvgV2lTnemkPQwVYfesn7aiqXTDGT0r6iskxRUjj92rhvLmsAwja5jZYXzQ5pExdYs4RSkGZVboxjdTfqUxrpDRot0E1emsa0HmH1ChQgeFy62iaQy0SJA5nDQp/wXJquRhnwClDNuJg/9joorfsNWTnxCBUGAHkBYKu76qwcB/UCzm91uqH+I5bmAKkjIs49m8EH6vmHWDp64JoglBKqAQGIxdPkoGA2HJcOQmHBKKKYZhpWfIKVuskywt5cq1yOggQaOZaCE8wEj2P8xXT5PjmnebEYXmz4uxYRSwutCF+63TxiomMqSZeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JO310+hVUDELztGnhAOqelEig1yc0OS6P5EM9io297U=;
 b=tLRKR/s00S9r8aq3LuVlugonVLrERQ4Ou4FLYvOOiAtR1midSMkcFJHyqv5c3lN8MuIABE6CddSMZUjc5eMmRPm+a41g7bDjNQT9fQykkICvxEoqqfWasVjkrdVsID3a5HkIYQQA2DYEav9U7wr+01XUE4WITQQAlwtWMoOKriV05GyWUzjJAC7Y0ISuS8euWNQI3lYxBQROund0Kyl/G6Lq6Bf+zJMv07L+jmhoB6Bc4jRKQZ2rfUvFX3bnfA8bj5YWcMiGI6Hf7ebFEJr9Vs188Hr/2mZvWa3VZnQupjlQyjskMY+2eqT8ZwdBIal2S7zCOnyKeYwywba4WxG37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JO310+hVUDELztGnhAOqelEig1yc0OS6P5EM9io297U=;
 b=uEL+IT39RhVAoY+6majSv7/UO3RF3Sq/wTyiaim/A/bKtzeU5bMNBoENudDicoPdFEv2KjTvl7Y6YQGebrwPX/gb9u/fMYIygXmyCMyqaf+ShGnnL6CE3eoZ0zBNLLLdacmxzY4/Mjxue/3OV/e76IGiwitKWnXyK/KUGGw7N2A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: multipart/mixed; boundary="------------RjnV2XL3lLfbcPA5AutKuwJU"
Message-ID: <6769b61a-89b8-4283-b476-5a1a9aedbd5b@citrix.com>
Date: Mon, 19 Oct 2026 22:09:02 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1792420048.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792420048.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425@vates.tech>
X-ClientProxiedBy: PA7P264CA0345.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MWHPR03MB989378:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e26ce0-3af2-46f4-c3e1-08df2e2535ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|6049299003|1800799024|366016|6133799003|10067099003|22082099003|18002099003|4013099003|4053099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	REOK9jlxQ9OpalSePUJReQ0E+fE8r2A5OZYAwNAZVFlN62+EX9wz7eVkTOk5Vuljn1+XDHpDrcAbCbOotAu799WmbVhBiT4ZDkZ9h2HFN78iLvfzbz9jFPW9U/Tvtw9efrJPfjQ+ZXGVPaGrDXKwsKvfPYFt/iGEcZEk9kqC4sFwmHnoj/uvChxPwP88D6/JLDv1oO4v0xOSsxQE2Tgc3oO5WkgXL9VCcGYvvDLvn3NKlL6nK2bDmOCfKdaECgHhl+9+aOwIMNMbTNcPydNiWsU8SiRFWs1/r4+1i1XwGKcPQuSBISy5vIGgT4JRuJmHNVAw6+cYxEyFIF01j7peO5UKpL3zlAsl9xy7DAIednOJ3t0sRljHESoRZlUqKXtW/ODyBzTvGlPx/BXyKDCiolI5lkaKFJi3FiKWgSQxG92QIMW5dinwfa8507fP6La29svQ1C8Z3fK+KXiDHTdVufJIsj/WuR7dCuAj4qhG1hS4240lT5SmBrHNH8uNVcV6tZ8laVo5H+Yf1tijn4bigaJhByhT91hPu/0S09BQYZJlnO5wUgrciH6YmgLYXeEqYXP1yzXW9wt8QhRhkxJLLdZtc8+gPOpQnL0NaiImS/PWQL7UnQ4na7m6slJbA+6epZsKy30tqN0tUfHgNQykbvkGUDjMaXEFmHD53Zg8hF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(6049299003)(1800799024)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(4013099003)(4053099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEkwY2dPcjJWbVVWUDNhMzY3ZDA1aHJOamJXZlhjUkNaMGRzeHA3VzVWSjhx?=
 =?utf-8?B?NVJiZlNNYnJHcEpHdldZb0JXNTRnU0liMWJOb2Y3K2p2eERzdFhNb3BZSTA0?=
 =?utf-8?B?ak04Q2JpaExkb0QrSE44MWJ5Y1ZKYWFVVzBodzdhdTg0c2U1SE5WdEg0OTJu?=
 =?utf-8?B?OXBDak91cTVXZmtEV3FMeFhWUEg1ZmhPWjdCNUlSUGxnbjYrWGZmdjlQUHhI?=
 =?utf-8?B?YU9SajEvbnI2NDEvd1lMMXNpUU1xeHVlRkY3ME1Xdm4rcWxXbE9OOHRzd1gx?=
 =?utf-8?B?cG9JZXozYXRRV0l3elN6OGhxeWFBTXdIVXEyczMzSjhkeEE1RHRieEQvU2Jq?=
 =?utf-8?B?em9HU1JQK0tqUVA1b0xQWnZxV1FoaitYTTUxT0VXc2hsN1VaWGJkZ04wVktk?=
 =?utf-8?B?OXEza0RHdnBaN2FjQ1krV0VyMnM5cjQ5cjJqWWxpazhGZFJ2L1BPZkQ4U09h?=
 =?utf-8?B?UVVYNTdyTXpRNUFjbGN6L3Z0ei8rTTRnTUgzdFF0ZUV5N1R6cWJURWxMOVRL?=
 =?utf-8?B?Z1Z3MGg0TzVpT3B5SEd6dDh0WHU4L0RJamJ4STBSMnRRdUltQVlvYmtBb2tv?=
 =?utf-8?B?dVhMZ3RDZWdmL3oxU1RrOHV6M1E3cXgwZXpKbCt0VExMRVdBWTNQUEkrYWJX?=
 =?utf-8?B?VjB2WlFSNWpnWWJ0TUxUYll5dXBwZzJOZXRielFjb1JxQUVWdlVmeDB3dWxG?=
 =?utf-8?B?c0wybjNUcVV1bm5TZDhSSjhNQWlickdXMDhoNDROVXlaNCthNE01Q1RyRGlI?=
 =?utf-8?B?NE9PWksxdnovUWdWc0t1OGRKd2hhem9namhjM0RiMjYyaWxHN1NrZEJMUVNG?=
 =?utf-8?B?MnB0MVFLR0dFN2JUekhSdVFtVGRhQWp1dDV0OUtUMjJoZ1FaZUExdjQxMFl6?=
 =?utf-8?B?VmRSdlVoeUZEa01vR2VuU0dBSmZzV09ScjR4U21yTjdIWWtGZTErZ1pmVjFD?=
 =?utf-8?B?MXo2bnhSQWtScFFZQVJjMHB2SnFDazVoNW1MSy9jdG5CWWlCVzBmMW1zQ0Vo?=
 =?utf-8?B?ZU0xL25GemZVeFBhUHZHMmhXb3Z3QjYvR3dKeVpsMTBvcXQ4Ym5EQjRqcTJq?=
 =?utf-8?B?UFVoSnoxN3I0Ym01UVZoQThuOWpmSzFNWmtNd2dKcjgreCs4eHo3MlFOMzRz?=
 =?utf-8?B?ckJuTFZPbWlrL3hGZXArc2pOcVZMU2Z4czFHaGdTNktHTGtaNTNGa1hBMHFp?=
 =?utf-8?B?d0VPSVFXZFRFR2l3TGlsa3J2K2xJYzZSZ3h5YkxscDFaeTBoOGc1UUl5TEk5?=
 =?utf-8?B?K0lweEVTR1lGZ2FDWFJ0WE80QlRxbmdUeXRCUytnSGlsM3kzcTZralU1SUJt?=
 =?utf-8?B?VWdseDJaeTg5MlFHNTBwbkxRWlYvS3RQdHN3NTJJcWpxRXFMeFNNNitQZysz?=
 =?utf-8?B?VVl1RW5xN0hhVjFVTU5DTERvaStLamh1cUpjSExqbGRyWDF1RkxmV0xoa0dp?=
 =?utf-8?B?enNBZ2xFNkE0ZFcxNXVUTCtPeEpQaGxwRHFDaTFwcWxFb2w4Ry9hUlNqWVNk?=
 =?utf-8?B?a1FHYk92YjVWcU9MY0gvenJtLzVkbm5ad0pTcDFqZ1ZjTVlTVUkySnk1Tjhm?=
 =?utf-8?B?bERhMEV5YlNhT3Qzb0krbFNVdXBqamNUZ2pQNmhuY3hZNmdoellCc0pFYTNt?=
 =?utf-8?B?QWljLzFjU2pZa1pKa2dqYng2bGRDOWZaSmZ0ZWg3Mm05S3VwR0RBeFk3Ymsr?=
 =?utf-8?B?ZnM4ZWt3eC8zUCs4aGxjUlM5dG96M0VnWG1xZWdtZEJybVdZYVVGcjY0Q1lY?=
 =?utf-8?B?ZlVWb29mTnkrNmQ3aXRRU0hhQ3lyK3g2ZXN6MDkyaHNmcDhZVmR5bGhoQVZx?=
 =?utf-8?B?UFRsMWFwMXRLdXVEZnlTeWxBSnE3S2QvMXcwOUFLMlU3aklDN3FmYnkrczZY?=
 =?utf-8?B?QnVCRDlDL3FmYmJnbUh3U29MUjVFZ2tQb1o2RkRnZWEwd08yK3QzMG52VnVv?=
 =?utf-8?B?dUlaTjBJTDBROVVtTDVobUs1SjZMbExwK1k4V3V2ZmdJUmVRUHVyc3VUNFJu?=
 =?utf-8?B?SVJLcTltbU5nSkZ3QXhIWUp0WTQyWVJyYkFYUFRLL2Jlalk3ejRZT2ErU2pl?=
 =?utf-8?B?cG51dDV0Tmk0NXFWL24rVGgrSWRqTERLL1ErOUdkeXlpbXE5VUJ2VnViTXR3?=
 =?utf-8?B?MzQrbzFzbSt2elJSazVYUGJKOGY2U2JmUkN4T0lQdTFhdEZtdzFEUFVqb1F2?=
 =?utf-8?B?NFpkM2tBODVUUmNPUzBNdm5jSWZ1VGR2RHFTd1B2YWRJdkhiZW9KLzBoL2NB?=
 =?utf-8?B?NWlIcmZzbnpHWms3WGtDWnd2R2xhenRpUXROWCtnVHMzOFdYMDh0aWkxd3FX?=
 =?utf-8?B?cXlOSTJ3S2hnbDk0WEYwd25nQmRiSmxoN2t0aGpRTjd1d3JpaE9hZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e26ce0-3af2-46f4-c3e1-08df2e2535ae
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 21:09:06.0189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvLIviy8ZrcKExAG9Kf/CCPzFAS/auxx5Lf5nkIPv2JORvKm0kh9sk9h2U+wOzaBCYlf1QucE7mL6mvLa/j777kJ1rF49FiMhPOhEhtH1uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989378
X-purgate-ID: tlsNG-bad1c0/1792444152-FD26A034-2697B3C6/0/0
X-purgate-type: clean
X-purgate-size: 6415
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------RjnV2XL3lLfbcPA5AutKuwJU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/10/2026 3:26 pm, Teddy Astie wrote:
> The Intel SDM (Vol 3A-13.12.11, June 2026) says
>
>> The semantics of sending a self-IPI via the SELF IPI register
>> are identical to sending a self targeted edge triggered fixed
>> interrupt with the specified vector.
> However, this is not expected to alter the ICR register.
>
> Fix the Xen behavior by sending the Self-IPI directly instead of
> emulating it by modifying ICR register.
>
> Fixes: 21c4d089ba2a ("x86 hvm: x2APIC emulation")
> Assisted-by: Claude Fable 5.1
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

What matters is the behaviour on real hardware.

If we're taking a strict interpretation, then "identical" means that ICR
does get mutated.

GNR:

    (XEN) '1' pressed -> Extreme debugging in progress...
    (XEN) *** Testing self-IPI
    (XEN)   Before: ICR 00000000000010ff, IRR 00000000
    (XEN)    After: ICR 00000000000400fc, IRR 90000000
    (XEN) *** SPIV

Turin:

    (XEN) '1' pressed -> Extreme debugging in progress...
    (XEN) *** Testing self-IPI
    (XEN)   Before: ICR 00000000000000ff, IRR 80000000
    (XEN)    After: ICR 00000000000000ff, IRR 90000000
    (XEN) *** SPIV


So, AMD doesn't mutate ICR.  Intel does.

Weirdly, Intel reads back ICR_BUSY which shouldn't exist in x2APIC,
while AMD fails to read back the shorthand.

See the attached patch.  The test sends SPIV to CPU0 using ICR, then a
self EVENT_CHECK sampling ICR and IRR before and after.  The SPIV
printk() only gets serviced later, which is why it's the last of the
printk()s

~Andrew
--------------RjnV2XL3lLfbcPA5AutKuwJU
Content-Type: text/x-patch; charset=UTF-8; name="0001-dbg-self-ipi.patch"
Content-Disposition: attachment; filename="0001-dbg-self-ipi.patch"
Content-Transfer-Encoding: base64

RnJvbSBkNDZlZWUwM2VhMjMzMjdiMGE0ODBjMDNmYzIyN2U4ZWViNmRhOTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpEYXRlOiBTYXQsIDI4IE1hciAyMDE1IDE4OjA2OjQ3ICswMDAwClN1YmplY3Q6IGRiZyBz
ZWxmLWlwaQoKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYXBpYy5jIGIveGVuL2FyY2gveDg2
L2FwaWMuYwppbmRleCAxNzZmMTQ5OGUzODAuLmNjMGFjMTYwZWEzOCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2FwaWMuYworKysgYi94ZW4vYXJjaC94ODYvYXBpYy5jCkBAIC0xMjY1LDIzICsx
MjY1LDEwIEBAIHN0YXRpYyB2b2lkIGNmX2NoZWNrIHNwdXJpb3VzX2ludGVycnVwdCh2b2lkKQog
ICAgICAqIFZlY3RvcmVkIGludGVycnVwdHMgYXJlIEFDS2VkOyBzcHVyaW91cyBpbnRlcnJ1cHRz
IGFyZSBub3QuCiAgICAgICovCiAgICAgaWYgKGFwaWNfaXNyX3JlYWQoU1BVUklPVVNfQVBJQ19W
RUNUT1IpKSB7Ci0gICAgICAgIGJvb2wgaXNfc3B1cmlvdXM7Ci0KICAgICAgICAgYWNrX0FQSUNf
aXJxKCk7Ci0gICAgICAgIGlzX3NwdXJpb3VzID0gIW5taV9jaGVja19jb250aW51YXRpb24oKTsK
LSAgICAgICAgaWYgKHRoaXNfY3B1KHN0YXRlX2R1bXBfcGVuZGluZykpIHsKLSAgICAgICAgICAg
IHRoaXNfY3B1KHN0YXRlX2R1bXBfcGVuZGluZykgPSBmYWxzZTsKLSAgICAgICAgICAgIGR1bXBf
ZXhlY3N0YXRlKGdldF9pcnFfcmVncygpKTsKLSAgICAgICAgICAgIGlzX3NwdXJpb3VzID0gZmFs
c2U7Ci0gICAgICAgIH0KLQotICAgICAgICBpZiAoICFpc19zcHVyaW91cyApCi0gICAgICAgICAg
ICByZXR1cm47CiAgICAgfQogCi0gICAgLyogc2VlIHN3LWRldi1tYW4gdm9sIDMsIGNoYXB0ZXIg
Ny40LjEzLjUgKi8KLSAgICBwcmludGsoS0VSTl9JTkZPICJzcHVyaW91cyBBUElDIGludGVycnVw
dCBvbiBDUFUjJWQsIHNob3VsZCAiCi0gICAgICAgICAgICJuZXZlciBoYXBwZW4uXG4iLCBzbXBf
cHJvY2Vzc29yX2lkKCkpOworICAgIHByaW50aygiKioqIFNQSVZcbiIpOwogfQogCiAvKgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3RyYXBzLmMgYi94ZW4vYXJjaC94ODYvdHJhcHMuYwppbmRl
eCBhYzAxYmEwODcyM2QuLmIzNWQzZmYyODg1NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3Ry
YXBzLmMKKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKQEAgLTI2ODcsMyArMjY4Nyw3NiBAQCB2
b2lkIGFzbWxpbmthZ2UgZW50cnlfZnJvbV94ZW4oc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Mp
CiAgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKICAqIEVuZDoKICAqLworCisjaW5jbHVkZSA8eGVu
L2tleWhhbmRsZXIuaD4KKworc3RhdGljIHZvaWQgY2ZfY2hlY2sgY2hlY2tfc2VsZl9pcGkodm9p
ZCAqXykKK3sKKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOworICAgIHVpbnQ2NF90IGljcl9iZWZv
cmUsIGljcl9hZnRlcjsKKyAgICB1aW50MzJfdCBpcnJfYmVmb3JlLCBpcnJfYWZ0ZXI7CisKKyAg
ICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7CisKKyAgICBhc20gKCJtZmVuY2U7bGZlbmNlIik7CisK
KyAgICAvKiBGb3JjZSB1c2Ugb2YgU1BVUklPVVNfQVBJQ19WRUNUT1IsIDB4ZmYgKi8KKyAgICBh
cGljX3dybXNyKEFQSUNfSUNSLAorICAgICAgICAgICAgICAgQVBJQ19ETV9GSVhFRCB8IEFQSUNf
REVTVF9QSFlTSUNBTCB8IFNQVVJJT1VTX0FQSUNfVkVDVE9SKTsKKworICAgIGFzbSAoIm1mZW5j
ZTtsZmVuY2UiKTsKKworICAgIGljcl9iZWZvcmUgPSBhcGljX3JkbXNyKEFQSUNfSUNSKTsKKyAg
ICBpcnJfYmVmb3JlID0gYXBpY19yZG1zcihBUElDX0lSUiArICgweGYwLzMyICogMHgxMCkpOwor
CisgICAgYXNtICgibWZlbmNlO2xmZW5jZSIpOworCisgICAgLyogU2VuZCBvdXJzZWx2ZXMgRVZF
TlRfQ0hFQ0tfVkVDVE9SLCAweGZjICovCisgICAgYXBpY193cm1zcihBUElDX1NFTEZfSVBJLCBF
VkVOVF9DSEVDS19WRUNUT1IpOworCisgICAgYXNtICgibWZlbmNlO2xmZW5jZSIpOworCisgICAg
aWNyX2FmdGVyID0gYXBpY19yZG1zcihBUElDX0lDUik7CisgICAgaXJyX2FmdGVyID0gYXBpY19y
ZG1zcihBUElDX0lSUiArICgweGYwLzMyICogMHgxMCkpOworCisgICAgYXNtICgibWZlbmNlO2xm
ZW5jZSIpOworCisgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOworCisgICAgcHJpbnRrKCIg
IEJlZm9yZTogSUNSICUwMTYiUFJJeDY0IiwgSVJSICUwOHhcbiIsIGljcl9iZWZvcmUsIGlycl9i
ZWZvcmUpOworICAgIHByaW50aygiICAgQWZ0ZXI6IElDUiAlMDE2IlBSSXg2NCIsIElSUiAlMDh4
XG4iLCBpY3JfYWZ0ZXIsICBpcnJfYWZ0ZXIpOworfQorCitzdGF0aWMgdm9pZCBjZl9jaGVjayBk
b19leHRyZW1lX2RlYnVnKHVuc2lnbmVkIGNoYXIga2V5LCBib29sIHVudXNlZCkKK3sKKyAgICBw
cmludGsoIiclYycgcHJlc3NlZCAtPiBFeHRyZW1lIGRlYnVnZ2luZyBpbiBwcm9ncmVzcy4uLlxu
Iiwga2V5KTsKKworICAgIHN3aXRjaCAoIGtleSApCisgICAgeworICAgIGNhc2UgJzEnOgorICAg
ICAgICBpZiAoICF4MmFwaWNfZW5hYmxlZCApCisgICAgICAgIHsKKyAgICAgICAgICAgIHByaW50
aygiKioqIE5vIHgyQVBJQywgc2tpcHBpbmdcbiIpOworICAgICAgICAgICAgYnJlYWs7CisgICAg
ICAgIH0KKworICAgICAgICBwcmludGsoIioqKiBUZXN0aW5nIHNlbGYtSVBJXG4iKTsKKyAgICAg
ICAgb25fc2VsZWN0ZWRfY3B1cyhjcHVtYXNrX29mKDApLCBjaGVja19zZWxmX2lwaSwgTlVMTCwg
MSk7CisgICAgICAgIGJyZWFrOworCisgICAgY2FzZSAnMic6CisgICAgICAgIGJyZWFrOworCisg
ICAgY2FzZSAnMyc6CisgICAgICAgIGJyZWFrOworICAgIH0KK30KKworc3RhdGljIGludCBfX2lu
aXQgY2ZfY2hlY2sgZXh0cmVtZV9kZWJ1Z19rZXloYW5kbGVyX2luaXQodm9pZCkKK3sKKyAgICBy
ZWdpc3Rlcl9pcnFfa2V5aGFuZGxlcignMScsICZkb19leHRyZW1lX2RlYnVnLCAiZGJnIDEiLCAw
KTsKKyAgICByZWdpc3Rlcl9pcnFfa2V5aGFuZGxlcignMicsICZkb19leHRyZW1lX2RlYnVnLCAi
ZGJnIDIiLCAwKTsKKyAgICByZWdpc3Rlcl9pcnFfa2V5aGFuZGxlcignMycsICZkb19leHRyZW1l
X2RlYnVnLCAiZGJnIDMiLCAwKTsKKyAgICByZXR1cm4gMDsKK30KK19faW5pdGNhbGwoZXh0cmVt
ZV9kZWJ1Z19rZXloYW5kbGVyX2luaXQpOwo=

--------------RjnV2XL3lLfbcPA5AutKuwJU--

