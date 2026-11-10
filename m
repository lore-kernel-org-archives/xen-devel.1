Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131E5606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=jYAJHqS8
Received: from list by lists.xenproject.org with outflank-mailman.1482132.1686017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQpGA-0000Ob-4P; Tue, 10 Nov 2026 17:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482132.1686017; Tue, 10 Nov 2026 17:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQpGA-0000OU-1l; Tue, 10 Nov 2026 17:03:50 +0000
Received: by outflank-mailman (input) for mailman id 1482132;
 Tue, 10 Nov 2026 17:03:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xQpG8-0000OF-Br
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 17:03:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQpG7-00195B-EC
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 18:03:47 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af34e5f-8faa-0a2a0a5109dd-0a2a45039ce6-40
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 18:03:47 +0100
Received: from [40.107.209.61]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af34e71-fae8-0a2a45030019-286bd13dbb28-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 18:03:47 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA1PR03MB7076.namprd03.prod.outlook.com (2603:10b6:806:33d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 17:03:42 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 17:03:42 +0000
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
 b=fJ+t5PiRJAkXcccEpuAE9F2w+uVzFXzQst27pMpayGy5lTKHD0bp2qojj0W7KIj9+is6OFkR/nnePJ+7AkBRAFFWmuIPAiW+5dTJNqNvSEUy/EIP7lOMlI9j7Sjurf5sbckCycWSd+nJVSE0n24pF6z4ieBhqKMWdkRMwzb1wzIs0rc6WiNfTPJ8LqbF16eCFlwK/xIpxfAnLua4xll5vJ1tjD7LkztyfwZ1Evobbm4Epy+Cg8nzhOTtTwM1Tiblb9GiZp6UpU+/WP5umzlU1eTMscOWpnNwNJ+qn2Pb2NFlSaAeH+2xkh19ctKglxIcd1mDuMwXeVqsjmKUwN7FjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2twQqlpvAxEb1poHrghdnbDnMnNY4pHKKO6APh40+vM=;
 b=QpMVchoOIHkIeTyxVo2xuKLwWxdooela0jf2o/z8FZjH5dYNku679eEXAikO4tuaZ3A/t9P1L7NiQmseA8xmdtK98SnVivtTLKxYgP2YOUZ12rOpne/6G0UiOwl9aUfpDPRa1rQX0fdYfPeLX6q3sPnTGMX4o+wptAh3LLxwaWAK8yazVXd3W9sADiVb/X9kOAW8+Ze6L1CrIUpqreujrDJS8MWZIbZcnK1PdV1TjUMgtWO3gi9nXtznNt/3k1jGIM/zNZ9GiZYy62oscU+/jFnNkTFzMjiBMG43HyJrgFR1C1BcD6aYxVd97eJUHHBK5IF4AWpSmmgsXN8qg+qkAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2twQqlpvAxEb1poHrghdnbDnMnNY4pHKKO6APh40+vM=;
 b=jYAJHqS8+1L8036jsJO4zhcxQ7gQEX4bH8hmGc/sEnSz9aDXq4/fXZfDrJvY39IhzTpjZILiMZYbM7H2gZQDmilnM6OImtsiLMNB+oxaf9sQ/g/G73PiaAPMR5W+yLedFAix5etkQhKfkDP36vzTGeHanFVl7E3RYc0aXcpSUwU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ee9fbfcd-04d2-4e02-8f80-efb850289c30@citrix.com>
Date: Tue, 10 Nov 2026 17:03:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/nestedsvm: honour L2's EFLAGS.IF when L1
 clears V_INTR_MASKING
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261016100058.268266-1-chunjie.zhu@citrix.com>
 <20261110085721.419366-3-chunjie.zhu@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261110085721.419366-3-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0001.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::6) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA1PR03MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 684bcf4f-b618-4338-8113-08df3f4c9294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006|261009223027099003|261102123227099003|261021121427099003|261021123027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ptsW38sHJzhiKtmjPQtO+5l7Y7LRZj/AoPu/nd165eaSnuVkQq4WmXlHC6xNeHcg5EzhaQyeylATpAq+l/r6VE5ExIGNLkgrCLO609eoFMk8RZHwErlV4AwCIfm8qzg2b3VHz4W4mStHzi88IB2oZnSbQ2A0+qkyBDBUbbfEQ4z35Mc7h0EvWZ/aOC/hK6+9dLnQDzWwCKMPeVFa5h6jreqVP2rRoK7soKq/9JXWRC99jFnvEq9olShpDvFbMzPTQrx3BILLWo1csQQdx/fXdqAdGStHFvRJfuCM2aAHBmhbSDlcKxS56za60vjS/eItEErCDmGXnnNxtZYo78UxnWcw7U5CygKlS0FYgoAyVzu5U2FNV8tNtRtOhcfe28V1YH8RyIAeLRHluWKsqqmEH/ldt7dQ66rZwS/Zx9R0/PigcfDOk3YQbWjjdznCHmkcGLTFwzyG7dBiSOKGeXcMiXgMNsjIA6ULFAwfntFb5ik6arV252Kc4/kVz+uHzX24wGTvhaQxW8QFr/V0ur3CzBLZstU0jtxQ09z6NOp0B8xWC4mtXaHUi+ULaISF3R2n89a3XK+AXtpzPgwfNwtyNnsPKM6SrtvD5rUFAvSNETM0NGTv/Q7hibmnyouWibCBQ2HeMOTlEW0SdPEUNh/83fDlMCnZklNN/2WTVwpw+qU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(261021123027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDJ6clE3OXRIeVNnMjdtd0xueG5vb09Oc2RLais3N0NqbHY5bDdTeVZHblQ3?=
 =?utf-8?B?N0g1MVN0dTF5ZXNRNXZLRkMrQTFzZEpFb25uRytuU2d5M3BzbHh4NGUvQ3lk?=
 =?utf-8?B?a29iWTl3RHlTd0g2Mjc3QVpJSnFDaVd3SGtlOTQ4ZmthR3Y0U1djTi9oa3g1?=
 =?utf-8?B?dlVFYXl1ekkxK0J1SVM3Qk5pVkk2VVRaSE9KcWJxZng5YzBGTzZxT3laRkVK?=
 =?utf-8?B?NDNueE14OXNDbGNkaWRUSGlkeDdPZXRjSjgvTzF6NHRQcWUzYUVjUkQ3TXlk?=
 =?utf-8?B?MWFoam8zZ0J5eVY1VFBGYndia3djYTZiazFnUzVoeU1sUEhPeUVnWGJ0eU5W?=
 =?utf-8?B?c3JuU1JGRVhnQzBFUXdlT3RBL2cxaEdFNkRiYjNCdk94REhheDhtaVdUd2Rw?=
 =?utf-8?B?c1BQenNBOHN4VkdWQXBFeVdlWGdVL0RCR2RIZXd0YWIzSGRHZU9rSHNYQVZF?=
 =?utf-8?B?Z0s0bUJxSm5XT01RUHB2RTlyR2pDME9aem83Z1l0dldITG85ZkxOcjBFT0V5?=
 =?utf-8?B?RURTbU5ZNThHOTZLc3dpY21wSC94YW1EU2RHVnNyaEdQMEswZzBGN1ZENkZj?=
 =?utf-8?B?NEE0WGZ2elFrcUgrdDNOZW9FVW9FZGJ3d0E0T29PcWUvTTNrR0xuME9FVmZJ?=
 =?utf-8?B?RzZiUTYwdWRldEl6THQrOFJnOGRkUmFCQS9qME9tU20zQ1ZRbEtQQ251V1RR?=
 =?utf-8?B?VzVROVNjV2VicWFFQ0FiQ0RiaDZjaU9HTFVGUXJqdHZVamhGc2tGTGgxZSt0?=
 =?utf-8?B?a1dtb000aG9EcGRmRkhJOWxZVDJTeE5yc29Vb0w4UG1Jeld3Nkd4a01TVjFB?=
 =?utf-8?B?WUJxdFFUVk5UMStpZGJINk9GSmFvS1ZFY2EraXM5U3B0b3F0QU1OMG0rb2pR?=
 =?utf-8?B?c3V3MmpEK1E1OUk0VkdyVGJEbmt2cWVPUWNkSDF6T09KbUF2UWZSelMrZnY3?=
 =?utf-8?B?Z3c4QzdZQVd2N3dpM2p2V0ZFYjlNQ2FaNEF3UXBIZWw1S0NkK3RIR1ZSMHNw?=
 =?utf-8?B?WkdVVFZJNEZ1MUNEWU1FV2wrZ1FhaWxZdWtyT21HQkkyMVJhUWRkVXpON2x4?=
 =?utf-8?B?b0o0d0t0bGlFcEowTyt0RUlBQUg4a3Rvd3pVTFFzN29IMG5nV0NESWh2ckht?=
 =?utf-8?B?M29IdS82NThXanZUNHAzak5LZWZ5NndRd2NvTGFueDFqb3JrS1pBMVFKT3c0?=
 =?utf-8?B?YWpCZ2FlRGw5Z0JNRWo1RHhnVDhXWTBXZ0FtZFlRdjJDMnN1eThqSU9USm04?=
 =?utf-8?B?MlhDN3NKTytMbVA0cDk0ei93bWJ0VjVFY3lreVFMSlVPWTgwUGZDUzFZYUhj?=
 =?utf-8?B?Y05IQm9ES2xCaCtBSFlPdGxrNi9OekIrUXNsVFVJbXlxamlLbXQ3aFNXZ21w?=
 =?utf-8?B?cXljdDNNN3MvdndYNVl1Qis4TGNlK1hBVnF6VDNPVStWQmF4S3dHRlNFdlZV?=
 =?utf-8?B?NUJ5ZGh2TldLcDB0eER4b1pnc2NGMFN5aXRhNWhHMW8rNGhWTEIxdGc5djVG?=
 =?utf-8?B?c0pseFpZOVR6bXI5Z1Y3WnBjR2crd0dYZ0tlVVNIMERkN2g3RUxHRERzODcv?=
 =?utf-8?B?Y2wwakFqNU1Yb3Z0c2Y0ejY5OU5XNVE4aVRIckpjTXNUVENhQUtFMURLOEtJ?=
 =?utf-8?B?U0FXaGltTFFYaWNkenRoOGkwYnhPS2U4Mm1abzJCRmxmQmVjZXhSMlhscUxi?=
 =?utf-8?B?aXRRT0t4cjZuTVlyM3ZGRmV5Z2FxbE1ZanJCaWhleVphZzBQbDBJYUVqZHZp?=
 =?utf-8?B?L1NVcXZXWU9ZWXQyRXRucWR1bVd1T3lZMFVOekRYd3dQdm9ZYmxpeUhvRDh3?=
 =?utf-8?B?a1ZVYmpRamdyQjQ5R0VLVGNGSWZQSVhodm40WWo0ZUtmZ0xsSU4xa0d0M1ZJ?=
 =?utf-8?B?eXltMVRzd3E5aXlIVTlacGNaTTFBZ3g4NEtDWm03WEgrWEloMStORXRucEt2?=
 =?utf-8?B?LzZPZUpkeThraHlhczBFdEt6d0J2cCt4ZVZVWUJmb1g4OUtHUDhTKzhFVVla?=
 =?utf-8?B?M003UXhBRDZ0cCszNEpPY1I0dEsrWm5OR2k4b214OEVpYjR5N3d1NEs1NnNL?=
 =?utf-8?B?WHoyODF6L1V1eFN5Nk9USUFmaWg0bDhLaEJ1a1pFN0lPT3BnMlVaTnVUcUJv?=
 =?utf-8?B?dFNRenZZNVdvOUVwYjEvcVgxbGwwN0MyMmttY25KamEwcFh0eGlhK205U0w5?=
 =?utf-8?B?RmNleXVFeGE1YnlXSWRoRFVUOFpPOE5iSmFUbHc3bGprY2VwT0JGZmdXV3NS?=
 =?utf-8?B?alY5a1BrdHkwWkRNZXRmNHpUZGNJdHlHS3N1OUJwYVhjYjhEK0ZYT0FCaVZa?=
 =?utf-8?B?THhYZUlybWswTmxkK2tyOU1RUHdqUTlkSnB4dXFiOWs5SFVES2ZMM243V1Z6?=
 =?utf-8?Q?bbbnn5a9+mPfkQWI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684bcf4f-b618-4338-8113-08df3f4c9294
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 17:03:41.9950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnQXy8yv1MetdGJUAsdNhEfBc4nX2UL+OIYMPC2ZxrfnkZ0DAFNZgaWC1MmP2ESsqKH8MSzme2gCtF16C/tOxIx4HxbB79dDZFd+eDdKJFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7076
X-purgate-ID: tlsNG-33051d/1794330227-77EC24E9-4F214D94/0/0
X-purgate-type: clean
X-purgate-size: 2394
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 8:57 AM, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> L0 always runs L2 with V_INTR_MASKING set, so a physical interrupt exits to
> L0 regardless of L2's EFLAGS.IF.  nsvm_intr_blocked() only blocks when L1
> requested V_INTR_MASKING=1 and L1's IF was clear.  With V_INTR_MASKING=0
> and L2's IF clear, nestedsvm_vcpu_interrupt() would still inject
> VMEXIT(INTR) into L1.
> 
> Per the APM (vol.2 rev 3.44 "Physical Interrupt Masking in EFLAGS"), with
> V_INTR_MASKING=0 L2's IF masks physical interrupts, and a masked interrupt
> must stay pending.  Return NSVM_INTR_MASKED for external interrupts in
> that case.
> 
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> ---
> v2:
>   * Move the check into nsvm_intr_blocked(), as suggested by Ross.
> 
>   xen/arch/x86/hvm/svm/nestedsvm.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index a93681e9bbcd..e3b2d20ffce2 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1222,8 +1222,16 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
>       {
>           struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
>   
> -        if ( svm->ns_hostflags.fields.vintrmask &&
> -             !svm->ns_hostflags.fields.rflagsif )
> +        /*
> +         * With V_INTR_MASKING, L1's EFLAGS.IF masks physical interrupts.
> +         * Without it, L2's EFLAGS.IF does (APM vol.2 rev 3.44 "Physical
> +         * Interrupt Masking in EFLAGS"); L0 always runs L2 with
> +         * V_INTR_MASKING set, so the interrupt would otherwise exit to L0
> +         * and be forwarded to L1 even with L2's IF clear.
> +         */
> +        if ( svm->ns_hostflags.fields.vintrmask
> +             ? !svm->ns_hostflags.fields.rflagsif
> +             : !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
>               return hvm_intblk_rflags_ie;
>   
>           /* when l1 guest passes its devices through to the l2 guest

This only works if the function is called with v == current. I think it
is, but it should probably have an assert to confirm this (like
hvm_interrupt_blocked()).

Also note that this series needs rebasing on top of the latest staging
since it doesn't apply cleanly.

Ross

