Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D1606A339
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 03:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=pdb3GNk8
Received: from list by lists.xenproject.org with outflank-mailman.1493653.1693526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTWCj-0000N2-Gf; Wed, 18 Nov 2026 03:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493653.1693526; Wed, 18 Nov 2026 03:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTWCj-0000Mv-Dk; Wed, 18 Nov 2026 03:19:25 +0000
Received: by outflank-mailman (input) for mailman id 1493653;
 Wed, 18 Nov 2026 03:19:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xTWCi-0000Mn-3E
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 03:19:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTWCh-00E6w7-9e
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 04:19:23 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afd18ce-bab6-0a2a0a5309dd-0a2a4501bf10-46
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 04:19:23 +0100
Received: from [40.107.200.16]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afd1939-5bcc-0a2a45010019-286bc8101ba6-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 04:19:22 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by BL1PR03MB6040.namprd03.prod.outlook.com (2603:10b6:208:316::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 03:19:19 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:19:19 +0000
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
 b=x7u87Nmb687GHhzgsXy+SB33LQKPYH+KUrGaeVzZcjwUYB0a83XG+Ck+pSgUVsJS+iOPzADHZRC8637/llDd6M0Ge/f9rYXf3aSdQQvGmCCIHmmWFfXj2NuTa4sIVSsOYDL2gToYIPqBW/CJ1Ix506s8x5f1bl2kc71QLcyHEsWCCJoLOJwS+tA28lmcjsn3sRXKgwC5ZOb9kNDfKP6Nxp0WDGUByckKoJe2gRCetW/r0akaYf1gXjSd4SJx+Cp8ksdjwCNvugif0KjbwBG4SFpJTOR8qvjSFCjcDrDVWRTY2Qh90AmSuQQOMg2LOz7uEo7GWkljl4g2ISRqlFXdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jvQUh7EFvlRiS+PsAs4yce01PYdnf0dL0MUukOAIe4=;
 b=rWOKM6h93oBFB2q5BY1u9ah+WN9RTJfohG5OwZ1+2+Dv3uKq4KF3TwWZ7bFSwgH3716MsL5UsPlfUZHzegpz6N2PvLljFpvFDp1q6faSC2PXA0uqzHExjnYplSSmdoOVE+gFB9nOXj1t38tc+wsS7Xjwh/L6jT2MvVpjljLEojvopT5+d8vkuQMCLlQXBgEMwX7A2d3XBgpkjORO6sxgyFBzuK+YTX50uOgesLrEQFLOhDES6BE+fBAuWkL3tK3JacQ5bGGyGu7h+Wnyx+5awWqvznh/yHCHgpLQhEpIahrizHZ/ojntG/WUdi2SGjSSBx8DQHfCe3jZ8x7DQW2Ofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jvQUh7EFvlRiS+PsAs4yce01PYdnf0dL0MUukOAIe4=;
 b=pdb3GNk8SyCfsGJaVnZxoXUDW+pOfZB4KJyjCKKHVM4mp0Z4bR4Hvss6GWRmPZnfXvjE8700L0aQIkjfjDCacdG5Dap31/2fSyYPfURn81gnZI46Xz34RO/QYkZxOF6BAu1frmc6yA653aHzM4Te2uPAJ/mFw9qXc34WKQI5RAw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: abdelkareem.abdelsaamad@citrix.com
Cc: andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	stephen.cheng@citrix.com,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/nsvm: Fix L2 VINTR intercept merging when only Xen intercepts L1
Date: Wed, 18 Nov 2026 11:19:10 +0800
Message-ID: <20261118031910.439584-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <62a5fa318da59de8a39b97c6fc7bc071d69cb483.1794845629.git.abdelkareem.abdelsaamad@citrix.com>
References: <62a5fa318da59de8a39b97c6fc7bc071d69cb483.1794845629.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:4:297::14) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|BL1PR03MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e81b0f-5af9-4158-4f20-08df4522bb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261022105027099003|261022075727099003|261021123027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1UgSkcm6udbP2bD1ViNAuFF/7xbAeU0nwx8omufnSOnNghVzLEZSdUjw6Cuef+cohwtA6BnCAPbSjQJef7dD41l4HrJyy+w8lbjiPRVz5PMn88gf5zWMx9QhJ/b3qkDtxH5vSqXPGNgeDz0MTbuz1WIYOFc2RZ8FYidL/l100PY4DoeWfJmhuFpUPC8647bQKsre5rPgwoOUjxEqSfW16oQjThFf8FynmpocpXrxtYDyqJDuU/QhLfumIAgCCgGVWcyZjXMkxfPLzaBnn05/i9UA1s/D28VlANcvniOvM60fxWesX0buSL8FPz05JYBPZqV3Og3Sl1zn9ngfGwa5oW+yIAHx8WJ6q14IEOK4WTO04vGL4V4Q6LG/pgcjbT7qw707kC6YBDYYSRQz8hsw+qnk/Too3iNCGYyZczwFFmxqUbM7fDohRzVZUcW0MMUhMYyoxNawUUDFY6xd3Ts0tqgbOQC4inGstimZI+rn8DdPf6eFFfzhypc+Fzrf9VRUGWpqR6p7Vi0vyYQCVzMKM5BlzuAdjm1WMPBzdIbrbYEcPEC0pM6JjgfDEDy4Co2d1YKmgDWxLa3/juIaptasSnTTLFr/DrHfl+/t4ifFq9T91/0QuKQtZUvH7IIDsIca6zAu7w/4hWri2pQGxZ4k2k87D3CvnMjEW8U/5MK6OHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1I1bjY2bFhqSTFkcWpTRzdzaXloc1puSGtYSXJUcG1JS1ZiSFVnd1Z1Mlpa?=
 =?utf-8?B?UVVhRkQ5MkxncXJRUFZJVUtYL2NzbHdJZHdYQ3Q1N0F0Qk5LT1JyV0tsMDJY?=
 =?utf-8?B?L1VzcWp1WkhhUUdBYWoyNXpsOGtZeldMQXNqUGpzanVkbVNjcjZoNWZ2YSts?=
 =?utf-8?B?TzZkZS9XWUdWVXRibnhhR2Nnb1U4bStpZG1OOFU3MWNQQkpwYWd3TTZOYzNt?=
 =?utf-8?B?MlhtbGxsT2x3bDJ5bUlFVXF3WGMwZmR3OE1rVVo3SDBaeDJWWDFrY2ZGNldJ?=
 =?utf-8?B?SjZaNndJMVhLTndmdXVNWlJscHlIY0czTm13aGdyOUdnaWU3ejlJTlJoRDRM?=
 =?utf-8?B?YU9yTnBSV3JqV3lCVEFmazFRaWNabktsUzBTWDdDYk55S0MvaUZ6UnA5VHRN?=
 =?utf-8?B?Yi9WRlIwMFEvQzVSQlVHT0kxYTZVWFVsWS9oYW85QWtSYTdHNTZiTTVPUWtx?=
 =?utf-8?B?dW1hMkFIYVArWFRmZWxNUm5WOS9kTXZHUU51c3N4QVJBSHdtUk53RzVXQ01s?=
 =?utf-8?B?K1B1OGdzbzdGbHFWdGFtczVKZkIxczNVR3UwV1RoTUJwM0p1ekJ3RlBZOHVh?=
 =?utf-8?B?NXZ0bmQzZEVEcVAvWDlHa1VPMVQ1aVVZYmZkM3NoNUxiekZaa0YwdElFeXVv?=
 =?utf-8?B?dXRsWUdtM25EU2pRbG9NSHEvV1UrM3dTaUlLbUpTZWM0WEhjM3B5aVp2bUwx?=
 =?utf-8?B?WExEcXExQ2txRmpFWUQ4aDA4N0w2clI3V002MFdLeG9FUm5YNmdvSFJSaU1K?=
 =?utf-8?B?WHprRU85REtGOXBtWkxxaklESVNaYUhCdGJWT0Qyb2FSUEpJUTR3aGxyR2Jq?=
 =?utf-8?B?Ty9nTTdZQXprMG5jaUtxRGNSdVFFSEg5dkQrSHhKWDdEQko4eGV3N1YvMGMy?=
 =?utf-8?B?WXFYUXMySFlpbzVoYVQvdEhWVG1uYVdsRWtFdTBqeEJNNFNibkxwRFJ1emt3?=
 =?utf-8?B?Ty9ub0gvWENLRU5QcWM4QWRjNURLRXdpcHhrZ2pqc1IzUGZxT2IrVGRpR2Rv?=
 =?utf-8?B?MGtmV1ZrVGgybmJLWml0TG9HMTQrSE1hazFTa2syb2VhTkMwYm85ajVXRkFz?=
 =?utf-8?B?TmJzclQzK3g2TVJBSzJyZEdCZElPdGVFdzRyTjFVK2FVQ1Z3a2RXcU8wU0sw?=
 =?utf-8?B?eit6ajk5emwzNUVjYkNiQU85d2IvWjJrRG9tSlVHUkZnTkduaUJHc1VtZDJk?=
 =?utf-8?B?OVVNWXlyV0ZTcitJYzRhcXJJQW9aVEhHZFZiRFliQVAzZE5jSlo4T3Q1Mmc0?=
 =?utf-8?B?WmFxMUh4VjN5ZzBGTFo2VUlsaGMvYllsZy9PTk4rUGpTS1djVzUvYnRoZ3g0?=
 =?utf-8?B?cVNNc0lsWmE5UTNGQUkyNjl0NXdlaHJLcnVkamJtQm5Ia3dYV2ZZdGc5UkQr?=
 =?utf-8?B?NUR0aGd2eGFhRHZKZ3hjQmNDRzJqWVdyZU9renVqQnl4VWVDd1R3WUFGa1Vt?=
 =?utf-8?B?TlRldUtZalJWeTd6MlU4UTlmSUJTN3NPVk10UEZBMkU1NTBPY1gveEpRbVk2?=
 =?utf-8?B?TUU5bkF6Z051RGRkQnFvTzJnYmlnODFuMjhoS2ZmVktOSzZvL1Zac1pWeEdP?=
 =?utf-8?B?M1VLTmVkc1B6TEUxdW81TUN1cDhkR0xpMFBjaVVqbFE0TE1iYVBFbjVNbFlk?=
 =?utf-8?B?MEszTmFjVG5SV3JqSXhMdWsvQWhHYW1kRXB3eTdBQ255aWRHdkV3N252S0Np?=
 =?utf-8?B?UGJiRkVZMWs5RHNWa21RWTRLSlpOekpnaEoxVHRDQ3FML3FHb3ZSQUVRYk5v?=
 =?utf-8?B?bDl0Q29vSUdVVUppYTh2S3JmVGtxOXJST1h5Z1BRbHJvbmE5TDdoRDlXNHp3?=
 =?utf-8?B?YS8zTmZOZFdkdEVRR1hVa1UrYTdyL0lsYVlHMGVnV1dLTjQ5YS9WT1VjMHFa?=
 =?utf-8?B?YitEaG1TMXBKcm1EUjZHdmIyUVA1Vmk1cHRRUi9uSzEzY1dDWmZha2U3eUhD?=
 =?utf-8?B?YXVnTWUySkNiSlkySUZGVUkzZTRLb3czMU9VZnhjSEJEMThrSDhIb21NY0pS?=
 =?utf-8?B?R1g1UkJnT3V2VVM2TFA0UjdhS1pSTmI4cHhBM1VXQjh6VGFLblI0dTMvNk5X?=
 =?utf-8?B?MFNuQlROR1ZraE8rNzNlVHVDbjhCbFN1UXdqcFBTbjhOZ1JHUnNRVVFBZUY5?=
 =?utf-8?B?bFZUMGdvV3lvY0pjNDZSc0E4MlhzR3FLeFM3SzY2TUc2aEIrS1VQNWNwUkZ1?=
 =?utf-8?B?aHRYdE05Y0pySXZZeE12cmIvSjBzMEE0cFVZSG9YbU45eGxIcVNvVDBxZXdV?=
 =?utf-8?B?Sm4weE4ybkdoUXFaWWxRN2ZYcDhmYkYvREZVbFlPYVdlZ1dvNTNuUmtwTUw2?=
 =?utf-8?B?aUFUVTZOOXhYaDh0L1Z4OU5hU0g4bVpOWkF6NHRVcUFtVGZTWEJZUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e81b0f-5af9-4158-4f20-08df4522bb96
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 03:19:19.1293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWhcrYcYmPhOSx9yg8bi0kbYjqlB4FfnzX/8B8JYV3Fp1q82Yxho/t7BYddA5hPDygcrBjSleWI4509DQbGegl+SmaKEIKezg16rciY/YAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6040
X-purgate-ID: tlsNG-d62444/1794971963-4CD515FD-5FEBB36B/0/0
X-purgate-type: clean
X-purgate-size: 1777
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/2026 18:13, Abdelkareem Abdelsaamad wrote:
> +    if ( ns_vmcb->_vintr.vintr_masking &&
> +         !(ns_vmcb->_general1_intercepts & GENERAL1_INTERCEPT_VINTR) )
> +        n2vmcb->_general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;

The change looks right to me. With V_INTR_MASKING set, only L1's
EFLAGS.IF at VMRUN decides if L1's interrupts are blocked, and L2
cannot change it. So L0 does not need the VINTR intercept while L2
runs. In my last mail I also suggested checking L1's EFLAGS.IF, but
I think it is not needed.

A short comment here would help, for example:

    /*
     * Xen's VINTR intercept only works together with its dummy V_IRQ,
     * which stays in the L1 VMCB.  With V_INTR_MASKING set, L2 cannot
     * unmask L1's interrupts, so the intercept is not needed here.
     */

Some comments on the commit message:

> Later, when Xen handles this forced
> VMEXIT_VINTR, it can result in losing \ overwriting an already injected L2
> virtual interrupt.

The handler only clears it, so "losing" is enough. Maybe "losing L1's
pending virtual interrupt for L2".

> svm_vmexit_handler clears the executing L2 VMCB's fields, in particular
> clearing the L1 set VIRQ_PENDING.

Please use V_IRQ, the name in the APM.

> There is still an edge case where L1 might pend receiving IRQ and still expects
> L2 to receive the L1 IRQ (i.e., when L1 clears the V_INTR_MASKIN while its
> EFLAGS.IF is not set).

Typo: V_INTR_MASKIN -> V_INTR_MASKING.

For the V_INTR_MASKING clear case, the old problem is still there.
Xen's dummy V_IRQ is not copied into the L2 VMCB, so the intercept only
fires when L1 has its own V_IRQ pending, and then the handler clears
it. I think it is OK to leave it for a follow-up.

Stephen

