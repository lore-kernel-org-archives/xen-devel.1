Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E57606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=dGhAXKoD
Received: from list by lists.xenproject.org with outflank-mailman.1501374.1697446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVu4l-0001Lh-SZ; Tue, 24 Nov 2026 17:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501374.1697446; Tue, 24 Nov 2026 17:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVu4l-0001La-PI; Tue, 24 Nov 2026 17:13:03 +0000
Received: by outflank-mailman (input) for mailman id 1501374;
 Tue, 24 Nov 2026 17:13:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVu4j-0001LH-PT
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:13:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVu4j-0052tB-5i
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:13:01 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b05c58e-bab6-0a2a0a5309dd-0a2a4508b0de-42
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:13:01 +0100
Received: from [40.107.200.8]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b05c59b-f659-0a2a45080019-286bc808e5a2-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:13:00 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by AT6PR03MB782546.namprd03.prod.outlook.com (2603:10b6:170:10a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:12:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 17:12:58 +0000
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
 b=Bkku3h93gkZOdvmdo8a9/IWoQ60bD4HycPq4rLcuSgBWy+Q42Dfk8yNwxr51U8NFXQBJ2aBJOWBzC7n3RR2b8cytA4DiZZfe5qhNZHwQk6psUcSIRz2PgIqC6T/8jAt84C1LI4MneqXUsneusfN40bw36NYGR2EdkYiSgvVv7aiQ8xM+eBG3fd+XTSx8SFLu2XR+DNpwCXjgcCQNl86SHH4MLEcnAlnoDjnMT5fOZqTclpAlIHM1KXg0xxXTRZKArD+iz3cdFqTrKyRo7/e2U785tPAeqW0c+WSFP3OVia9bZlrNNOwfs6m4r9MyXnyOMl+MfIoa7pbveF5kcP4E1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYaVaoyKUXhJA4tp9ecuX/cCiEqxCczH+we+m9Uhepc=;
 b=AtbA+MJwK7lNp58/8qn+ulzkHTXW3f5ZaMJueGJnoaB2WnnnGkRO4crmi3PthJ1Y2wzxqawEji2d0jl9T8q8NLjzKuWdIDjuFEccpZMlYklfJqW2ImSsSQwJiSGdHJVMMVyVboPqZffpQKbd447Qn2ld7ZYXJ8D7jlCVS7qgGnUVYVCdOjf3qnasH4Bh5EUAbePtpHWGxkn8+MeDvzrJMDjPmoSs1golhzvpmIixnN16IvMx3+Xl3w0A/VL8DOjAaB8F3eGSqnUDL0rnxWjdmDqMu4o1tWtg0GCuUPxXdNGnLzjrEDybxlTw7GoIZBC2SlHYm+FJdpesI1qvcDaq1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYaVaoyKUXhJA4tp9ecuX/cCiEqxCczH+we+m9Uhepc=;
 b=dGhAXKoDy/paH9zC5Kcpg3i7PWqAyPa6/W1JYzvZ2GxBfrJIaPSfr9Ky//YpMbsYNsv17yuMvt8ChdJGs6QNG0Oxl89AW7VdSuQfwz8vm5vmeROaraZHEexdBQTezSLlihRD9kG3LBEAAo2rVm5jAU72RbjBhdmJg9FStNusi3o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <13982d01-e722-4922-9b2f-03bfea5288af@citrix.com>
Date: Tue, 24 Nov 2026 17:12:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH 2/2] x86/PV: modernize descriptor read sanity checks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ba2a2c31-24c4-4ca2-a2db-fa3745ce2fcb@suse.com>
 <f1be8280-ee73-466c-bcf9-cbc1c00eda07@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f1be8280-ee73-466c-bcf9-cbc1c00eda07@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|AT6PR03MB782546:EE_
X-MS-Office365-Filtering-Correlation-Id: e09b9f11-1929-49d3-4fe3-08df4a4e2fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261021121427099003|261021123027099003|11063799006|4143699003|56012099006|10067099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	z0YBOXkD4EalUBKms/md0oTq015jwLf0yMo7Gg1fUGZSXNj2iSPfU30ZHcobIz3oZggGaR7Sf9lF4PRgkXqDfoXPDpx5e+vi/8HOzoBKZpRcS5M85YVkPQAL4blSmkqiwEhzyhAcFZSTVDCFyvRzRnIQ+bxa2vp+uPjlaq0F/KshoBGGq+m1VfGJ7OSSLqWF/gGOqA6lAHY59Ut4le59CH9JdhYkLYyyeyM/5vgMnMdoW8IBZ23ujk+DOrvva3m2XvLfURfMMq0wR5kSW3016Cv1urPcB46q17tdN+j3aPekAGmqr2ejq9JxdlOPn7RNyW1JGO07/cyBc2qP6Ax1/BFRFwep9ikEfy/NarcBlz8MHOFtI4HwyfwK0QKNzFgNBUUc4SkpWBRhKwV+fAIEORX5UzHUifG3JjYMPYpiVI0MfQutjIIbrYAo7+zoFdV/mYfzh1DmsiyR1cgf3tLftyd0nnHthZkywy9mpzl+V6FWOyrwCsC1Ls8lvJUDLzyvbrJzKbhWuLDAmW8ec7E8LpNwUFcWGjIRoXeqPjYXWVH3YEst/YUdRT7qSmKQBzsbMY+26esk/K/ek1jl8eJ4S1cqgwZFyOExV42yhiSTop2++fb0ZtgTkSpdphhiltNNnztoOY/zwjVC7LiD1rP07caBFlC+s20E00PBIkj+6C8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261021121427099003)(261021123027099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjVIR1ZNc3pmOGU5NklwUmdRYUkyd1ZHam96L3JTVG0vWG1YMUtZb1dmZ0xI?=
 =?utf-8?B?R0k1U3hXdW5UZDE0UU41TnNwSVJBV2VFQkZCOFF6Zi9TbFRQMXlSUWJUdTBa?=
 =?utf-8?B?Rm9oN09Rem4xTUJxSzExdDlwOTgrQmJ3NjBiU05XRTI0RkF3VHNyQkkyUnlQ?=
 =?utf-8?B?Qk1SQ0hGZ1VEZUxldjFYWmxpbXRnbmlHQzV2UmNqRFIzSXRKb01tc1V3QVhl?=
 =?utf-8?B?K3RYN3lPQmdybmpRdTFUVlVhbndVWmQrMzMwMUlVcXRSbzk5WktQWU5OMjdy?=
 =?utf-8?B?b1NlVVhOOVBRRUl2RzZMZkIzNTV0TWhiM3A4VGxuK3dVdVM2Zjkrd2oyblpo?=
 =?utf-8?B?Tk9PUGdjZE1pT3dsUEFIUitnZEkzWGhjV3pxNUFnU256bnN1bjlXQ0M0ejF6?=
 =?utf-8?B?cCthVFZOOWEwOWtFVXZPeHN5S3FuYlR3NW9hR21LZ0VBTUI0TkhuM0dKUlNW?=
 =?utf-8?B?cTlvanozUmIzb05qczFuNUdTdG5rVmtBWG9HaW1rbjhIM3NCOHBaKzE5ZmNm?=
 =?utf-8?B?M3RLZS9vSGFId2ZrSzZ4VmdmY081LzlndWpkam5qMWhvc0ZnOXBtMW1CQ1Bq?=
 =?utf-8?B?NGFTR1JpZ2dDV3VFeTFhZzN0cnU0bDltbmN1YXNtcnhLd205S1dpUGQ4aWZy?=
 =?utf-8?B?YUhoM25SY3Y5VTRHMU10MFlGSy9zams1Q2F4QkJpeVF2ajZONXVpUXhYbk1K?=
 =?utf-8?B?NFh6YzNBRVdXRi9pZDlLN1B2b0lqemwyQlRLZFprN1plejExOUcxbmg1c3pI?=
 =?utf-8?B?WUFDTmE2Z0doNWhQelJKbjEyUW1wVGJQMCt4VTM4VlN3eTFERmR2Z3BKMUZU?=
 =?utf-8?B?aVlXZXFyVFJ5aEs1WEQyQXdJdVB6NTdaZHpEMGZpTnJ4VDhtTkVZeWl3M2Zj?=
 =?utf-8?B?RllyY1JwMDJEdnBYOGlybkdTRUdZL1o0aFRLNmozRnBHcnRCeWVZejVzQkJX?=
 =?utf-8?B?a2NBMXQ1RnBuN2JURVRMWUNXYkNBNldXWUdwbzBKcnh1SlNBVFFLdytOaW9u?=
 =?utf-8?B?ZDQveHoyamQwZWdiaWgwYWxRVFhVZmN5R0pBaWFma2RxNG9DbWVtdkFwbVJQ?=
 =?utf-8?B?cDF1NlNvRWpxaU02ZmdVWVR1VEJRbzAwMUxHVU5hK0xuemJzcDJ3UVFocVBT?=
 =?utf-8?B?bGZ3dlUvRmdJYitjNVE1RXhEK0ZGU1cvQzViTEtSQWs4TnpsTjNVZmREblBr?=
 =?utf-8?B?OXRDMEhJTHA5TFU3dXhuUE41Q3pIRlN1c3gyc09vVWU5dlNSdUErQVlMdmVF?=
 =?utf-8?B?c0Y5R2NUaXVZUWI4NnJHZjlDMTRtNVJ2U1JCZjc5WlFtMHdQUHVXOEdwQ280?=
 =?utf-8?B?UW1JREYvbDIxdmRnZi83cTk4UUJzTmFuN005SmtDdmx1bmtodjJmem1idk5j?=
 =?utf-8?B?aXAyaVpLb20zMitHbmdJY0ZCaDdzYXdXeVk3NlZFaXE0aVRSZXFiOFg4Y1BS?=
 =?utf-8?B?WXk4dFVYcVFwb3dpdzVrVkFlN3R1Zm9aeTRxbG9ZWENaaFowSmxPNG9lTkI0?=
 =?utf-8?B?U1AzcTlEM2ZkTTAwbkVVWFcwczdvZ09iUU9lM3EyamljU0YzNUx4R0tEV0hi?=
 =?utf-8?B?ZFpvbG1Ca21yZUFGME51dnJXSzA0VmhRUDhWRmo4dDZpN3hiOUNWNysyWEtl?=
 =?utf-8?B?OG56dUorRmlrdDJkL2l5QlVSQmdoMmg3U2pycEV4MU1UY2VzbzdwbDZDazFX?=
 =?utf-8?B?bEQ1QzhZYWIzeWVieCtLSWwwdHBUZ1RwRlR2OVgvMHduZzExMG1WSGU4MSt6?=
 =?utf-8?B?ZmZGalJzdng3Y2tIR1Z4YzdPNjRYWXBkSlg3OG83MXh5MW9Wa1BKeHpLUWFu?=
 =?utf-8?B?RE1MTVZ6amZFTnlwNG55dGRPSXJrd0dqVjgvYXpXUE4vSTIxSFpEam5PNTFN?=
 =?utf-8?B?aVptUTg0NEh2a05CMHVzRldsNHhkZmJhc1lRTDg3ZjRPMFlLU3pqVWRmTGFS?=
 =?utf-8?B?L1cra2p4cVkyUldlaW94VVZmcUdMcmJZbE1oNnJiNkFsZ2p0VlpCc3hLa1hL?=
 =?utf-8?B?eXF5eUJod2MzUGFhT0pidVZRbXpZTHlBbGM1WlMwdndQdFR0bkdTVDNjT01G?=
 =?utf-8?B?OEdPSGNyWjU2UUFQbEpLRzUzTnV0QnpOVXRzTUp0L2t2a1B3NHA0eW1vMGx0?=
 =?utf-8?B?UGZPTGlvQWpiQTZkOHI2UVpxK2ZwOFBOWXpzQVRNOHhJSmJoa05oNTUwTUxN?=
 =?utf-8?B?RzR5WURUcmRVWmh0NllmOGVNRlo5eU5FRmNDMkJzdTBGZnVDcUthdW5WSHY5?=
 =?utf-8?B?MFZNTlFhOGdia2ozc0k3MS9PNUtPYllxOVQ2R21kWXRlWjFOVkhLWk4vUlZC?=
 =?utf-8?B?N3RHOEpyTU1xVzlmbm1WR29YTkMrREl4blBSTkdOaEsrR0ozUmh6Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09b9f11-1929-49d3-4fe3-08df4a4e2fe9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:12:58.2521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlA5HvWTNqgNzFS5jvwHXQW9QAXMUGhobSsbYblENnb2egULiQ9GtieEv0c6bg+ivN+epQd56enuaXoJtiLjncezrSRbdG2j1sNk2wEXA1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR03MB782546
X-purgate-ID: tlsNG-c1860d/1795540380-D4B7187B-F5B1BF8A/10/78276251493
X-purgate-type: spam
X-purgate-size: 734
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 1:30 pm, Jan Beulich wrote:
> First of all use ASM_FLAG_OUT() for better codegen with new enough gcc.
> Then further change l's type, such that the compiler no longer has a need
> to emit an extra MOV ahead of the CMP: LAR zero-extends the result just
> fine.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Imo the #ifndef NDEBUG (soon to be switched to CONFIG_DEBUG) could be
> dropped altogether, by using ASSERT() in place of BUG_ON(), and by
> dropping the volatile from the asm()s. Then the compiler ought to be
> able to eliminate the entire if() in release builds.

I've committed the swap to CONFIG_DEBUG, but as per my reply to patch 1,
I think the section needs deleting.

~Andrew

