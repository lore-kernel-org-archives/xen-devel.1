Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B64606A31B
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=l/nK7N4w
Received: from list by lists.xenproject.org with outflank-mailman.1456824.1669925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJSW6-0002bh-5r; Wed, 21 Oct 2026 09:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456824.1669925; Wed, 21 Oct 2026 09:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJSW6-0002ba-2k; Wed, 21 Oct 2026 09:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1456824;
 Wed, 21 Oct 2026 09:21:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xJSW4-0002bU-QB
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 09:21:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJSW3-00FwFn-TY
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 11:21:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ad88425-bab6-0a2a0a5309dd-0a2a450a88fc-18
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 11:21:47 +0200
Received: from [52.101.52.51]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ad8842a-f2d2-0a2a450a0019-34653433a2fa-4
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 11:21:47 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7357.namprd03.prod.outlook.com (2603:10b6:408:195::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 09:21:44 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 09:21:44 +0000
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
 b=iVKTI+8SpbFrwmss/cDlULIjId7C1sUAcae4ZueQHn/QGn9aXgGNGoP9zeqTXUqJHC8RS6f7z4bZ3UdRHeUIDktNWEHQ/0fPNTGQNlvT1WSSvfrUqs/AS3SMxAyEj9nSHNQuek51Tmb0NNRM1wW+VgsZ00iAQikfLuW+r+CuC6x13cdEm8rp3b/FjSHRQZM3R7l/2OZIftd11vPFQbp28DQZUVmyTCdj53Vx6NrYhTtCw441occNrTpL4e5bLTaaTA+qw/BymZwWGrnqXrep43dq2pz6E+aKX26O9icOcHagc2cX/qkC8wKVFx4LS/xn/YJeoPScpp5ja6SMnhTzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecPqRTo6wtPnw6acd6o+so58GA5o9FPZgWSVeoey6Lk=;
 b=dpYRF4RtJw9C2jEHW3FY+ri6Z8IgKl9mnHYyOSAxqtMTlVLwYLAegUYe966WQ1a+Q0oYbDpcoInBmAKmIrbJ7BkSBcUQLXhlqtyKFGtjvTGneW4/cvy69wZNdV6q06BGv2l0DA96wA2oEdwx7cAK2KJYY7fB7Sar89DnGO4dAKYWoMHt/lKwaYKBFandCqHdcQVQEWxWXpUk1P8kwOCg8fcBNUMSW9VWqRLzo+L5U257Wlf8BbL4qoiLepRhSdAMjRA6FlpD4WhzGV5i0KMMRHpnI2XFKSM0ImPwvlnkNwOlMCzvvhDrtTT5KdJByBzivMhjXT1RW/KJh9M2tUqhbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecPqRTo6wtPnw6acd6o+so58GA5o9FPZgWSVeoey6Lk=;
 b=l/nK7N4wA1wJ00mcRuXeo4F+a1itL52Tna7O4dgFFYJqOp7yN4f5XEOF5P89hNkwDwnkv2qV68Xz1WuoCRqLKoHdhdBrVen5BRlSFgoda79j29N4JeQRku5A/wWHTTVGj3pQM5S63vt2mgHqhWpaD0JaCfMutsb3oxxyoy+3SLA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <44c485d8-1d57-4c59-9484-7c52303fbe2c@citrix.com>
Date: Wed, 21 Oct 2026 10:21:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/30] x86/svm: clear the VMCB clean bits in
 svm_ctxt_switch_from()
To: George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
 <20261019-asi-hvm-v4-26-b68b66652266@xenproject.org>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261019-asi-hvm-v4-26-b68b66652266@xenproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0458.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 4304f646-7847-4534-1549-08df2f54b90f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I3Tpby8pKqE/xOO4FQlqeX6PEgE2Zj5084Dm/JcMi147o4ni4PULB1Ju6VFzRO/x5qJRbj/k8Ej5gU6KEm0HuUJtyRixX0yA9xooTn3FZys2fXjg3r74U2RKi36lUGiabNCZAAHsnFJ6CFRbzwuTzDP1gBGjOUb6IaYbJt2ZJYIGOqOcFO8CxvZLkmiwFbSo0vUrf0X5iTGwfVcwfV1mRFbBmQFEME9fKOnYhEB24Qr/1Jf6FHQClKuA76Y4ogo03gUsU4xN6E13jN9sjRpYyIu3rYwoH3SGNIs1MspjmSP2mMxcpC3CoPa/xp53zXIwZ83NjsxNMwt2FzGYaYxxMJ4FINjEsyvx+tqiZ12c7nOburlYYuBcLWdaKlU2ExGBkZs4lP/J3XoCZtdXxqyy5e9r3W6sRL/XTJ8u7wvrLTBhhTE/XXELllRzUhnCmDHd5+GGiWx0mKr4mfzqzDfeTgbaNIX9Cp6njihZmBTmGpCKcoy0cTPUsmvEsX7alPAboy74MFK7wJc1LGkFoaxQrKaaktQRNTd0PiPcRHLQp2y8fWART2fIIh3jZM8W0OmF6vbjK6OSqXFGG1Vyn3Tg5B4xHTVT1ipc2FTw00JS9u0aqTGODHPuGdNXF8g3gSRwe23OLybDqZuKbMO3pyl3GwTsvIT9aixppnKrliz1HsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXhPY2Y1OGRyU21aUFhpM3cyMFZwMWtibmJhbFF1ZkNxbkVmTjdVSW5jV0V4?=
 =?utf-8?B?bTRTNXZEM3BTWkZIbFVCcmZOOFN0bCtkZ2w4R2VtamliN1hNdFpkMk5lNTZL?=
 =?utf-8?B?OFV5c3pBQ3Awa1gva2VSR2Fya3dQTjFYSFFJZnVFWWZuTmtrbzZadmR1WVQw?=
 =?utf-8?B?cE80Ry92Y2xVUXFLWlU4cEpKS0xxZHUrU1FEMWd3bG8rU21zTEdObXBnZk9r?=
 =?utf-8?B?UWhWSzNUV25hTFMrZDNQdWcxMWpDNWVTLzVEZ2tXMjRnQkkrYnlubjMxQjZZ?=
 =?utf-8?B?Q0ZTa1VDSGpLdTI0QWNha2dXczFOMzh6eUF3dTRTSFVNVmtsNjdZOWhjWlkx?=
 =?utf-8?B?bnNIeFpNVndBK0FLdE1VWGZaNkh1alkxbVpJclMzWFowMjVuZWtvWWpva1ZC?=
 =?utf-8?B?UDJWS25oSTI4WkMrT3hGajdPbFZGTXBqWmJ0UC9aRlp1SWswU3FyNWUyMU1q?=
 =?utf-8?B?NFNrVGd4QlVONWd1eWZaWnFVQUowamhRRlZYZ3NpREh1VWFSTmNLeFlVZWlN?=
 =?utf-8?B?dExHazNVbWxxTXUvQlBwamxBdWxvNldDS1h5SG9qZjZvb09JT1BrQUdrTXhs?=
 =?utf-8?B?RzgxbWhyaHN1bkIyOW5TbzAvdFhTYWc5bzhBYXhBakM5NXBKZWJndkFkdHhJ?=
 =?utf-8?B?dzVHWEo2UVFGR0ZoTkJKcGdxblQzT2JqRVUwejNQNVAxbWc3U0hOTmpIR09n?=
 =?utf-8?B?M3NPUFFyYWN1dGFMMHd3aGtrMFVPbzRHNlVVRWFyYWhpb3UrVXhGOVFmV3NJ?=
 =?utf-8?B?ejdjUlM2WERpNTZzbzJVdDFkLy95Z1ZQbjJPVlVzOTNYclF2T2FxVWVhVXJ1?=
 =?utf-8?B?eXRmMjVadVlSV1ozQXE4bCtCY3lwSHhKdzh0WEhwRFZQUXB6c3dlR3pJd3Zr?=
 =?utf-8?B?Mlo1L0lTSCs4SW5SNDRRVUlIVFZLUTlBUkdPYmpkcVJGcGFJTXRqQ29BNmZ1?=
 =?utf-8?B?V3lxWFcrU2hnTGRmRjM1UG9qV2ZSOWV1MkJQcUl5NlhPTXFJcjVtK0w0U21R?=
 =?utf-8?B?azhDcUNJSjRlb3lMVyszeW1iTWxqV1E0Vy9aQU5VT0pMRU9HaGE0blQyeUZX?=
 =?utf-8?B?eitEQmJTVjVTeWlxVVdqNWt1SGluWmJkVjlLeTdETWVjZUVIK0xxVUJVdVlX?=
 =?utf-8?B?SVNXYXhaY05QcG1SdUpqNDJqdmV6MzJaY0p2dm1RU0N0MTcxL20vaGxsb1JJ?=
 =?utf-8?B?N1BRMmFHWlpOQXBVb1ZWVDNkc0NLRm1zRElDTFRmbTRUbG4zekZaRSt4MG53?=
 =?utf-8?B?YTFhYXhHTGZEWk9XMm85NlZMMnpVdnpXMlhwNUpBdU5KUTVRV3k2OWQ4UTll?=
 =?utf-8?B?eExFMTMyTzAxU0xSU3gwZkQ0R3B4QjMvNmlFdlhsd0QrWlRJTzlNcGdWWnhl?=
 =?utf-8?B?VVhsdStKaVhXZ2Vsd1k1d2ZRVDBzNzJnbys4MXVwbXQxNE9UUGZFc2dvTEZ5?=
 =?utf-8?B?UjU1a3U3dmpVUTJkcnZRU3UweEdmVm9yY2RzY3JualBxL3RBY01wK2ZvNkNO?=
 =?utf-8?B?YXpxRE5qaTBYT3hRWEE0VldQM1RCdVhRRFZLdnVaOGswZ3d5Y0daSEQ5Zm9j?=
 =?utf-8?B?VVl3ak0vSWNaM2ROWjZ2SkN4VUl0VG9SS0R5aG0yaU9RYVp0dC93eVZCYllQ?=
 =?utf-8?B?WTVLSHhtL2dmZzlYT3RkUVdSSXpIOExrSkRBS2FLVGE2ZXB1RW9Gb0NVcDNs?=
 =?utf-8?B?M3grMG5wZUxoL3NUbytOQ242bzRuVXM5MVZpRVlPS1ZyQVdnR0Q3VkRINHRi?=
 =?utf-8?B?TG5xVGsxL1htelB2eGcrOEkyVDlrK2grWDJsSU1xd3NqUlppZzdyU29vd0RI?=
 =?utf-8?B?ZXIyeEpyeVJLd0VXK3ExU0wwRWl1N2Qvb0R6WTkvUEJXTzdCSnhWTE5vU3Bw?=
 =?utf-8?B?UG81OE9XVTVRdUtSdGt0bThvWXBpZ2RzL2xFTXVScGF4blVsNW1RTFl1aUl1?=
 =?utf-8?B?L3JMdDQzWWxlZkJnZHR6QzI4M0ZzT0tKaUpNN045WExveE9Yckh4UjBMc1RC?=
 =?utf-8?B?Y3hsc29wUDJaNXJ4d3RMdUxiTFZYdXBabVVqWGdmbTBjSzhUT3VvcDlSQVEw?=
 =?utf-8?B?cWJ3WlQ4SndBbU5xTTlYVEJVS1U2Yk0vU1hGTUQrUExNelVUekk1U2ZRamNs?=
 =?utf-8?B?TktPTmMzQjRqcWlzWSt5cTNteWFTZHZTdXBEQnNjS1BhRFNLTXA2Z2JteUFZ?=
 =?utf-8?B?d1FXOEhOZWRlWExKSTFERlpTQkd5SkFNYzVQT2kvTXVGOStIcFdWdmg5aWpY?=
 =?utf-8?B?aDB2R1NqQ2NrL2VBSGFLYW4rZTBHVjcxRlROb053MVJrbDBKeW9zVmd2cUIy?=
 =?utf-8?B?d3FLbEtCWjZBeEd2SStmWEE2alMyUFczUExUOWttWExmSW1XcXg3N09sYlNs?=
 =?utf-8?Q?12Kfn+xIVB/ELSkw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4304f646-7847-4534-1549-08df2f54b90f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:21:44.0134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnWkCiE9h2mqksQFGuoswqw0LTL8Tas6LHdKsX/ejoCb0FGgewmkV6hnebcENJDPxvuWzm1YF/81uCC3B6Nt4ewOO+WXBK7WZ6KGYjMa/sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7357
X-purgate-ID: tlsNG-4011c0/1792574507-5A7DACFC-052C5044/0/0
X-purgate-type: clean
X-purgate-size: 2384
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/26 8:42 PM, George Dunlap wrote:
> A VMCB's clean bits must all be clear when its vCPU next runs after a
> deschedule, as other VMCBs run on the pCPU in the meantime.
> svm_ctxt_switch_to() clears them as the vCPU is scheduled in; clear them
> in svm_ctxt_switch_from() instead, as it is scheduled out.
> 
> This is equivalent.  While the vCPU is descheduled, accessors reaching
> its VMCB only ever clear clean bits: svm_vmexit_handler(), which sets
> them all, runs only in the vCPU's own context.  So do the nested-SVM
> paths that change the active VMCB, nsvm_vcpu_hostrestore() and
> nsvm_vcpu_vmentry(), and they clear the incoming VMCB's clean bits
> themselves.
> 
> This prepares for moving VMCBs off always-mapped memory:
> svm_ctxt_switch_to() runs before write_ptbase(), where the incoming
> vCPU's VMCB will not be mapped.
> 
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v4:
> - New in this version.
> ---
>   xen/arch/x86/hvm/svm/svm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 241843d8c0..4e19df9865 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -919,6 +919,8 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>       svm_save_dr(v);
>       svm_tsc_ratio_save(v);
>   
> +    v->arch.hvm.svm.vmcb->cleanbits.raw = 0;
> +
>       svm_sync_vmcb(v, vmcb_needs_vmload);
>       svm_vmload_pa(per_cpu(host_vmcb, cpu));
>   
> @@ -938,7 +940,6 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>   
>   static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>   {
> -    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>       int cpu = smp_processor_id();
>   
>       /*
> @@ -956,7 +957,6 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>   
>       svm_restore_dr(v);
>   
> -    vmcb->cleanbits.raw = 0;
>       svm_tsc_ratio_load(v);
>   
>       if ( cpu_has_msr_tsc_aux )

FYI I posted "x86/svm: Don't clear clean bits on every context switch" a few
weeks ago which moves it into svm_do_resume(). I think that is preferable for
the reasons mentioned in the patch and IIUC would still be after the vCPU's
VMCB is mapped.

Ross

