Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925CC606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=L7ASMbHB
Received: from list by lists.xenproject.org with outflank-mailman.1458218.1670619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtGh-0000KO-UM; Thu, 22 Oct 2026 13:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458218.1670619; Thu, 22 Oct 2026 13:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtGh-0000KH-RY; Thu, 22 Oct 2026 13:55:43 +0000
Received: by outflank-mailman (input) for mailman id 1458218;
 Thu, 22 Oct 2026 13:55:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xJtGg-0000KB-Rv
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 13:55:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJtGf-00DjqW-Tl
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 15:55:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ada15da-bab6-0a2a0a5309dd-0a2a4504e728-10
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 15:55:41 +0200
Received: from [40.107.201.52]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ada15db-b57f-0a2a45040019-286bc93463e3-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 15:55:41 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH3PR03MB114257.namprd03.prod.outlook.com (2603:10b6:610:39e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 13:55:37 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0546.017; Thu, 22 Oct 2026
 13:55:37 +0000
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
 b=sern73/HzA0QW9TWGB0kWPWuIVNs2sdlbf1IcMPY3L6MEVyNHmxaOKV2a6pJGKkb3P97Tqoex2Ja9pVKk0+3gwvpA1me2lcYnWWScUOhtFsV8iRgF4bA/nfmtJScEEBBiArzIHAr753ZNy2OuGzYt+yc+a2g9ct2wPVEZJ1iRmAwj7MZpcSYe2r3o1PXmiQePgvKL/hDUZ4W++YzXhMkM83Gg5p4ERselhEiBS+1rYlK0bcccyvRBjMtJ6p/rdan83qpopUcRuFBKw/UMLqE3GNtK4nb8yAZKQkT78VkyUayxoFfg8zbrm14tYNv5cj095z8h/KZXxJK77G76wSKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uv8rEWvSEwpvuZ2NCj5R5cblN2Dybczq/xXjhR3rDAs=;
 b=KJI2vpRKt3spDHX7iC3429nY+DRjCalwvbp/YLqi/wSTQzZCYi3b1F0aQQ3SYdAyWKdu3av4xvcNfwLXAhIDXzBnv7+PG4s0bM5ZgGr42NA8Z13YGPO3l0Dt7C32ayXg8epDd1OBNi/YJVw37USYdE8aGBjRLAXtT6tA1Suf0CrU0SquLhFggcv5CcwDevCon5r0U8T6V1L/FKNqWactGFQQp4Zbpva2TzF6PPQ64DP/DX80cxiDMKHKOLvGCvJFeOSrpBXU3TMP6o66lJTsURoewoFRRBlmlXBg0reoE+XiscDqMi/8BUjfJ5TIB7GCweY7E6tOVEZJNeMsMcEsXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uv8rEWvSEwpvuZ2NCj5R5cblN2Dybczq/xXjhR3rDAs=;
 b=L7ASMbHBFjfVR4DKFpAhJrAJFZhX0laMxAxz+XFrAbs4JwwDjjG91MdlcwQb9QwBYD4WyR1uNuf1iE8BkzWTWIpofdd+B0qWzuxYuZ41WtYkphoR89AtrxHoTyE/yuoQzcstVPkH/MxgPOXfwp2ILFcar168spjUGn721AK+Ndo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <86d6b7b5-41f2-41b4-8710-7356c78fd15e@citrix.com>
Date: Thu, 22 Oct 2026 14:55:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86/svm: Apply the virtual-8086 IOPL check to INT n
 only
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com, teddy.astie@vates.tech
References: <20261020224123.3710391-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261020224123.3710391-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH3PR03MB114257:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e192628-3e4d-44ca-b7c1-08df30442661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|11063799006|261021123027099003|261021121427099003|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rCwEa5GjSxB0tiB5KNkbREGzfe3Yj7RnO12H7e2N1tWo8CPqEbAeuK29HPcuHaAOETafhcOxBMDyyUBBGBSYstTyiDBieSChGJMMbigMCdPI2Ji9MXpcOwc+KoAkuosdO7TFlEK6mri6r6yX3bnRSVfc4onF6b3yBi+ZG0728Nmd63CtOwnZn1gJ+wltaf5+m0sbIzeMIZYgoHaSyA/HZYmBM9AIBZt2Moc+WKHhEoR9MKwqq1XmmQluFCMhxhosF/QXjsRf1UQAZ31NDgjVGgfXKXxDz7rDa97Lznoli/kZTpurXuHrbkOkJfuIN+UfX6bsErfWU+Qmdu6Suz0XO1m+WHpQWyurXw94nxboe8KFNrRFlURuDKP6Ix4OwPE3JFQ7+2UaSNE5G8SNviCE96vZUr0RjImUXIYRQama1MLNgZQyLElAUXSsVKKEbcq/8wtuSXml2sHo2BFQf+ovupNX51ACav0iJrpLZWZ0GlEO/mR2ehLCeNv5lrWLUK69RjuUPrqGxE1mdpOa9Tt3jL4iPDS0Z7zgExVHNPRqGjtq/ti3xU97gwESE2twLZsdfBTbuxpVHOxA0vWFhgYJ9GN3wWmi7wevVPqykhPSNMmWUhvpXwyH2SZjL5ksCMQPCJ76icXNUYCibxHunKza8va4AqgUzzkX2lGHwlQ/+3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am5LM2FzeWkwZUhWalFrQ1hWRUpwTU8yOU9FQkZsbHRDQ1hwTlhpTm0rNnlO?=
 =?utf-8?B?bmp4YThWenMxTVFhQVMwZUZhaFFaeGxtTnhXZXpmaXQwY3o4bHVPUW1QdDFD?=
 =?utf-8?B?cml5R2pkMmJmREVqYk9XMG5TYzBXMHNhTWcvMFdZN2ZiU3ZxdG1tU0xPSGZC?=
 =?utf-8?B?bTRrZUxMRHdQN0M2UG82TUh6dlU5MVV6TVhRMTViakNKbjJzMTVlMUhnZHNQ?=
 =?utf-8?B?ZzBRVDhXcWpsUHpVNVBUakRTN3gxZHIyTktxMVdvL2xsNUVDQVNtaE1Zem5W?=
 =?utf-8?B?My9NbVBLMkhsSHVDWlZLYjMreDdnQTVPcTNXUjJCUlJkbkZ1ZUJaYjZ6Zml0?=
 =?utf-8?B?UGQwUnZBbDUyeERIWkJPVVViNXpNV0hLeDBKWjNyYmRPR21idWViYzdPRGlr?=
 =?utf-8?B?NmlHRjVDVnZkZ1NNMlB0bXFUbHJLTTd3ellHZjZxZ3Y0ZGtQcDJ1V2E0MkNB?=
 =?utf-8?B?REJ3VXlYTTRIZ3p5dEE1cm90Z3NrZDMreVRoakJiUFdSb2UwVGRYcE9USXRX?=
 =?utf-8?B?U3BPNlRIaEdNM0cwSis5OGczNlBEV0lueTQrTEx5ZVdMUENXQ3FvUUpyckNj?=
 =?utf-8?B?RE1wV09yOG1hTEVCWno0TkZ4R1JkM0JtMSttbEJCdE50VkxCd3pReitWL2pB?=
 =?utf-8?B?RittQUZYUWQ5OVRJUlRiWUU2Y3Fkd1doNktjTklyWGh2SncveGo3WHl6d2lt?=
 =?utf-8?B?VitDeHlqaXVrWnMxWU50RFJGUlJiclIwOTNGQ28vVkdzcG90RFdYWFFmTzVu?=
 =?utf-8?B?YXIyRkZhWTRSVS9HR1VpdjdjbnhrSkJrb2ZRZUNFbmJIVm5sZkhWWEpmdU82?=
 =?utf-8?B?YW5lQVRLVHlkeTZIMDB2bzJQeFd4WVBZWnVIcUlWbWVsaVJVY2poeVJLZnZs?=
 =?utf-8?B?bDdmUUE4MjhObW4yeEVCZ1pPOUdlOUlsSGdyb2JhVURtNTcvOTM4RktORGhp?=
 =?utf-8?B?bWU5bHUyNFZlS1YwRUdVTDNrUzFMM1dDdGl3YURwcGtxSllGRVRvNlRjZGlv?=
 =?utf-8?B?WDBtSGNsK3BZWDFIcklQZXhoOTQyVXZMek9Hall2VGx1VjNEaUtoK2U5K3pj?=
 =?utf-8?B?cTBsUEhUbndwM0dRcEFzMVpPL2x0RXUzeWN5L1ZwK1JzYVN6T2NiZzM2YXd0?=
 =?utf-8?B?NUQxY2ZpMUtUeVhsSVFtc3BTZldESWQ1NDhHUGFtdTRuZEJQRmc0L1pySldT?=
 =?utf-8?B?MFIwZTJuYllWcmlnNUtJWjhpNDBGVitmT09CendrVGxzb0V2UlZYeVZ5Z0M1?=
 =?utf-8?B?WXRHWE56a1BvaHRLUm5lWFhvaFF1SVQ2NnlEa29JaDkybzRNM01tbzMvY3oz?=
 =?utf-8?B?OGZ5U0RSREN3YU9KNEExNFdPYjI2WEV2REVHUU50YnRVNkpLMHdmb1k5dk5R?=
 =?utf-8?B?dExqUEdRWU9XRjBpcUNZczVhWEVEb1NIZTVIVWpsYVlLMHc3U0EyUjdubURM?=
 =?utf-8?B?UXBOMVBxb0dCRitlTkE5MXlNUWlWaHEvQ0k5anRDM3B5emlubngraHJneU1F?=
 =?utf-8?B?aFcrcHU5eEJVamJFQ0V4OFg3M211VjdycU80Y3pVYXVUN3dlWEJUTGtRY2RH?=
 =?utf-8?B?cllzOFNxT0tKdlpYRXorZy8vVjM2R0ExdXRSa2VVdGdZN1hSOXoyVFlxVStS?=
 =?utf-8?B?c2g0S0hZSTdwOWpBcEhPYXIvUnB0NHVKT3pOOXN6ZDJkY0x4V0JaTlhwWDdW?=
 =?utf-8?B?K0tkK1RKWm1KNWxVQ1g2REhTSzlkMkVnMXRPZ2Q1cFVjY1JwWjRSemdTYXBY?=
 =?utf-8?B?em11T3ZVUTgvSVBId0RqU3lpRkowK1p0R2oyd3M2aUI3K1JvTEdaQnRxbmVZ?=
 =?utf-8?B?QjNnaVNzOHBBYzlSY2VWdkRlZGZHU3FMUnhHV2hVTDE5THlzT0lrOXU3allk?=
 =?utf-8?B?dTVsSmNUMktzK2dhS1Z5aW9ZVHViQW9oYURGTzZBZlZxZnUwbGpnUHhKQU81?=
 =?utf-8?B?YW1YR0NLNDFiNmIxSEZTcnYvdElSODErWnl3bmFhdWNYa0l3UnlEeXlzYUQ1?=
 =?utf-8?B?bk13ZHdSWlhhd2F3V2xza29RbVFDaG9hNHJmNExKY3ByZktMRzFTUTFpR2ox?=
 =?utf-8?B?U2lSSFVETS90UFYyelFuK0xlNk84WW9LamgwQ3dDZ3BmL0wxT0w5OTdLaStV?=
 =?utf-8?B?d3V5UjVONmcveWlxY1dhUGFZUTVIOVBteGUySC82WU4wNVc3elFMWnBsejM2?=
 =?utf-8?B?TG5tNTNFNjM3RmRiRG5ramw4R013dXphOE5KdHlOTmd2VjNNZDFtZWcrOFJU?=
 =?utf-8?B?SnRBRUVHSUtLdTlCNFV5YW9EWVAzVlJWZ0haMDBmVVloM2NPdEFvbjVHNDFZ?=
 =?utf-8?B?NC9HdnJhUE9JeVVWSEJDdWhpa2tONFhYenpjTEFyZW1SV2pwSG9vZDE2UWZN?=
 =?utf-8?Q?9myWJpQ2e5G8m09M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e192628-3e4d-44ca-b7c1-08df30442661
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:55:37.1842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qe0ylTRA2ZOQjduvYifjXJHYtJiQ/RvvPcZR4spQGXLK82FOht9kc/mG1MOD6ON6zc4AuZm7xJcmjo8MSqQhgg3V6kHchZmL6t/QvovWJqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB114257
X-purgate-ID: tlsNG-ebf023/1792677341-52ECEB50-82EAF931/0/0
X-purgate-type: clean
X-purgate-size: 1625
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 11:41 PM, Stefano Stabellini wrote:
> In virtual-8086 mode with IOPL < 3, INT n raises #GP(0).  INT1, INT3
> and INTO are not affected. They are delivered normally.
> 
> svm_emul_swint_injection() applies the check to all of them, so an ICEBP
> raises #GP instead of #DB.  It also reports the IDT entry in the #GP
> error code instead of 0.
> 
> Limit the check to INT n and use error code 0.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   xen/arch/x86/hvm/svm/svm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 71e48351f2..df74531d1a 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1153,9 +1153,12 @@ static void svm_emul_swint_injection(struct x86_event *event)
>        * 32bit OS.  Someone with many TUITs can see about reading the TSS
>        * Software Interrupt Redirection bitmap.
>        */
> -    if ( (regs->eflags & X86_EFLAGS_VM) &&
> +    if ( type == X86_ET_SW_INT && (regs->eflags & X86_EFLAGS_VM) &&
>            MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
> +    {
> +        ec = 0;
>           goto raise_exception;
> +    }
>   
>       /*
>        * Read all 8/16 bytes so the idtr limit check is applied properly to

I think this is correct. The check could perhaps move earlier to avoid needing
to reset ec to 0.

I do wonder though if there are other cases in the function where ec needs to
be reset to 0? The pseudocode in the APM seems to have at least one other case.

Ross

