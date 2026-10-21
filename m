Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AACF606AB00
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=EPGtP7Cu
Received: from list by lists.xenproject.org with outflank-mailman.1457030.1670007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJVHn-0005eg-E0; Wed, 21 Oct 2026 12:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457030.1670007; Wed, 21 Oct 2026 12:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJVHn-0005eZ-BB; Wed, 21 Oct 2026 12:19:15 +0000
Received: by outflank-mailman (input) for mailman id 1457030;
 Wed, 21 Oct 2026 12:19:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xJVHl-0005eT-NA
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 12:19:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJVHl-00GVr5-3j
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 14:19:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ad8adb9-2eae-0a2a0a5409dd-0a2a45068900-48
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 14:19:13 +0200
Received: from [52.101.46.70]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ad8adbd-195a-0a2a45060019-34652e4654e3-4
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 14:19:11 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB6534.namprd03.prod.outlook.com (2603:10b6:a03:38e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Wed, 21 Oct
 2026 12:19:08 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 12:19:07 +0000
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
 b=VSAyfd2ZRxwoR/RdzlbdQh3qFS6yt7alRaULT4f/pmbn7B3IlFN3NzwKV3pxqHRhFwn+kmQXAQQJspM+yICeN2q+7mS/0fPAbP/QXDvG8qfyFqaQJGSesm/2S7/ldIMfeDp+KGcuOLkTBzkRnoT7BBGhlFeh7k9PixGGppCw+mO8fHeFDk+BjUA+XIFORqdDtYvODBJ/7Z4n1YM4a5T6NpIlWu20QBSGkbzHcO5LwviGPfuNlyhQ0BoghFv7+ieJpor2w/QblkSjThOkE4bQ9Sf5HQXV5jCTstBh0d8yJtkjo0LqNIT6SNltgpYu2ua8Bmhie5LQrurf2IfpC3Lt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ngwEiwfSDSxCA3ils7CWgGstjPZkhvt4WCoAa8Lc8g=;
 b=TWIAejdC6JALQ9NbaklKsv7Os0sFkdNBgYrsFMqw/LKO8pcH3qD8Gp0Uo1f+JdKjYWA555Q6cLyBwSigJDH8QLOu2UgqL5DFlEzLdn23sLLQWR0qqTjzbv1FlhoTPV1RnrupEHjZJTLGwDD8lWT3ZqTtSS/veqv4X9pV2Yh8/Qu9JnFm3LxYR+qzP4wLoPRgY0uk1zkdL+uzpCDv2x2ZHmT1fqAdmEZNGy6xVlxPXVtaPv0hbzBE0MVO3HPRe8zDm+VDjPu/UdSHwgHr0+ZBw3UQkNuee0ObLTaiwelNly5+PCs1xv+nH7MdckoBF0PZ7ZW9vXIxfeKaOIr7oY+5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ngwEiwfSDSxCA3ils7CWgGstjPZkhvt4WCoAa8Lc8g=;
 b=EPGtP7CuXOfA1UIS+ZbhCDQJNvNtEzdTs9YEXyDMdmoynGorUp/IwZvQkQhvMr25nUZT/a3gjnQgjKRU30JVpjIgeyK7PG/QaIkA6L0XU2Kr6PKQ6PxAaSUyU6KzGNFOS7d0pKQU/pasVttfdtY8tW8oGjXlbArdWHeHcmGgtRw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <aa90600f-3a21-47b5-8a90-a6955669a3b7@citrix.com>
Date: Wed, 21 Oct 2026 13:19:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nestedhvm: Inline nestedhvm_vcpu_in_guestmode()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1792515236.8631fc262581453bbf619ec5b2062170.1a15a3be15b000f79f@vates.tech>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <1792515236.8631fc262581453bbf619ec5b2062170.1a15a3be15b000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0129.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: f82c7ab5-60e7-4980-7d09-08df2f6d8142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TaSD6k6KQMtgmkI4AA+4Y8yY9l2sj3TsyDUMoavVfS7cHiGTpq4pZF8FVrQigHhEw2WIO2xs/vq4y6v/61o67PgiRrrVSGCdG6NwqGOjDmb49xTR5tkQzxXXTigC9DU8PsPQqeq6tH7su6+8a3AXNiZQ57V3lMC3D9+DadW+wLOmxfbpWnIU6tpS8KvR8rv6ES8SHNRrIXH73k3dpmtJqohKxpAGwoE8CtILTaRE2GRFU/MhSotNP/9vZAhmucNdlInSnpYTr7mVrp5MtfZCgg945Xgtk2mqylUkexkxv7ZZnatu8rVoX/M54Ab5WliVFVF0PLIHm0BU9TwPvDsSj/dec8VuvpMl1gnn4ooZWtfpG5KrgpFk6uTqbQKH36gE6Ui7LLVMswhtQKZcg/yigga8sGP2GUGnB34W+A2GmY/jLUwxZ7nIGk5rRp0DS/caz4Zw4E2fGN3Je+2gkgNvhxeUBmV5WIEhAJNEt6dI8/Fyf6xAb7DfVoBMO7Kw8Thj6AQxRGGcI9E3EliqLztAH4/IJACxeoMy9MHzNVYy2f/xieRI+9GqlHF72CpaQd22HTAMHACRobQxnYYGnfdu4tc2AgNpH7kuwGCJpuNzp/cls2k/d73XIHZmfi37scdg8A1fpypsSZgIapQIP63fuAJxvjsiE7fdx6x36cGgMAM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXBKUXBleFNGNjh1aDZCc1BnZ0EwNkp6VlpScEdhUlladEl4OVFKTDhEc01C?=
 =?utf-8?B?TUNMaVJnNTNYeFVReXVjWERFRmE2WUw2ckFSeEQ4ZERyL2ZXK09nOGp5S3Zk?=
 =?utf-8?B?eHdDamVmejlEajV2cFd2Vmh6Sk42eElndmJOaTdHenh4Vk9YMXZjQmpaeE5O?=
 =?utf-8?B?c1dNekJNaUVxSlZ2OXhQS29oYXJ2YWh2ZWVLSDZtcHVTOFFSU01JSWpQTGxV?=
 =?utf-8?B?bGRxR05tZ2gzb0c4QTVGWDlKREFkcmpneGhGQ2xaUzFYeEdkcXpkazJ1Y3A0?=
 =?utf-8?B?YXY4NThiRExpUEwwdW8yRk9QVy8rbktQbHBTckRERVNDdk5JUmUzQVFYL3BU?=
 =?utf-8?B?cHBxcmoyQjFZLzd3anMyYW9zQ1hIc1R4NGxoQ2wyR2QxRzJYT0l3Wk5FaDNz?=
 =?utf-8?B?QldVYWg3Yk1DMFJSaFB1OTJyd3VFYlFObmVnbTZBMnhSZ2FQdndjOE83bXNw?=
 =?utf-8?B?R2tKUGtlNkhsblVxcDZMQU1JR3pEZ3lnbm9HWXlscWdFWVo1MjJaSHJBZi9l?=
 =?utf-8?B?VTE3bDlndmtBK1Z2YXkwTmh3cTg4N1NQN0VwS3ZlTkpQMHhKTmdnajMrTDgy?=
 =?utf-8?B?ai8vbTZabE1TTjZWY0RtQWkzV0h2ZU9BZm5TNnBQaDU4MmFLNGcwOURsQlI1?=
 =?utf-8?B?NkVZTldjeUxWWDk1QTNBS21lVm5EME5CSmJra212ejRkY1phdFk2T2VzWEE0?=
 =?utf-8?B?Z3h5b29iSUhuN3AvSm9MWk5kTFg5ZUhlL3J2Y1BIRUI4UzhQL0tpaVE2cDZW?=
 =?utf-8?B?VUhOV3o2UUhzM216NWdoTHZRRUJsWW9rVXY0czMwNExRU05remM1RWpadHFK?=
 =?utf-8?B?a3AzQVhLUXFmTkZHZWVxSENKbDdWTktJckZaNllsSDNLZWNUTFByVmplTFV0?=
 =?utf-8?B?T2pVNWcwNkpwWFYyRDlIZkdiRG80WmY2UDk0Vzd5d1hpUVJQbEYyTk9sTEJs?=
 =?utf-8?B?ck5WVUMxU1ZCMGwxZjVwZUhBcnRNVGtwWmlmSnUyNGRFZFRBandzQVcvcVM1?=
 =?utf-8?B?THJXR2RTMWFmZm1iVVVMWjlYRVlDTXl0WnNoT3d5SVpaUE52akI1eWc3aTVF?=
 =?utf-8?B?VkQ1MmRQSlNTaTl0eWJ5YlhrV1JXN3oraTEyOTIxRWZaSmZNZ3VQakhEUEVm?=
 =?utf-8?B?RWpTUGZEbSsrMEJHWXdSL1hIeThoME5zRVpybE1Fa3AwcnRBVU1GOFkyOXVQ?=
 =?utf-8?B?TnNJYm5GVkNRbkh0VFVsaCtJS2FaOTBVSnNRK21SbFRTeGxTTWpUMFlrTWth?=
 =?utf-8?B?cDFqM2tPUmdkSjM5bVBYL25iQ3duR3UzK3pjaXBCSXl3MWhPdFUwemEzaU5i?=
 =?utf-8?B?cTdpYWNJN3NubGR1bDNMMjFNUlg0RTRwRXl4bVYyNkwxZytudWw3TXl5Q0NV?=
 =?utf-8?B?VFpzL0lJWGc3QllEQWZ0TnVZblozV3F4bUtlMmxlYjlDSHk3STMrVVNVMEs5?=
 =?utf-8?B?Mkp6VTdJOTEwOURoellZcDA1VVJReFZhejNTSloxbkprcjIwaXBvcEIzbHRo?=
 =?utf-8?B?cHJ5L0hMTzJCR1Q5aHczbURiKzZsM1llbHlEU2ZKT0M5Tll2Q1Y5R3NRRVNm?=
 =?utf-8?B?V2tDT2UvUTVDTTNrYWdMaVVUOE5SdVFBMTVBbHlhdVgyWGFBWkZVdXk4OEFv?=
 =?utf-8?B?SklvRmMvTUhvT2lDSDFvNlQveWMwNlFxYW1Yc1BWQXphTm5oOEduQXBpcDVN?=
 =?utf-8?B?Ny9Zb3V5WCtxaE1tREN4eHV4T1p1Vmovem1ISWkxRlgzdXBud0tDUys4d1dF?=
 =?utf-8?B?SXRUcTQyc3lmMFYxbkNXZkVVVklkL0MxcjcwRVFSNUkybDFKVit4ZjB0UHpQ?=
 =?utf-8?B?SGwwZytLamlqekZCV2hSaGFLUGZ2cFBaL1lTUlhVR25IL0xQR01mR2o3RGZn?=
 =?utf-8?B?YWIraHRHVm9HdmVEZTFZMWJaRmh3anl1U0NBQ1d6RkVwcGZ3YmtRTUluU1Zk?=
 =?utf-8?B?U1VCbUZUMlVtRHdtVFR1Z3NCazArcmVQRVozK0FBdkhrRDdjdTduVnBoNzY5?=
 =?utf-8?B?R05JWXU3NUhiaUlHQjRHeHR3YS9sdkNVRStNS2FKS0Q0T2w2NTh4L081cXQ0?=
 =?utf-8?B?Ky9ucE01T09sYlgySUU1Ty9rZmdnVlNOMjRzOUMxQzVYZ0JJdndlT0JNdGFI?=
 =?utf-8?B?TVhDdHN2MGQ3aDcrclVYLzFXK2g3NnZnbE5uZTJxbG5aTUJzWFlpRzBPN1dT?=
 =?utf-8?B?YVJwTnJKT3RLNDVjZkRKdUlId2xtQTBrblVLMEdGQWphTGpIcTUxc0hyYndG?=
 =?utf-8?B?azR0ampyTUJMellUSGRDTzVTY2tvM2dYL1ZyOE5GOGwybWlkcmI1eDNVeUo2?=
 =?utf-8?B?K2ViOUJYV2ZCR0E5bnhzbWJ3c3NxQXcvQnVoV2ZkREo5ZG1WOCt2TGdmT0dZ?=
 =?utf-8?Q?w+2P+CTQC+4Z7IKw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82c7ab5-60e7-4980-7d09-08df2f6d8142
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:19:07.8001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzG8oE/lq9bjJyj9U0l+uI77hplgz6mx1LLxYP/bOCIHxQ1nISNp8qfA1/F8zC2RaEWtO3Fi4ibFqOJ9yenXX0Kwxqjokw7Fg2mAXVbXsmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6534
X-purgate-ID: tlsNG-16d1c6/1792585153-F6A7477B-490D74AC/0/0
X-purgate-type: clean
X-purgate-size: 2134
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 5:53 PM, Teddy Astie wrote:
> This function just returns vcpu_nestedhvm(v).nv_guestmode and would
> be better inlined to improve codegen.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>   xen/arch/x86/hvm/nestedhvm.c             | 7 -------
>   xen/arch/x86/include/asm/hvm/nestedhvm.h | 6 +++++-
>   2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
> index bddd77d810..3205277e81 100644
> --- a/xen/arch/x86/hvm/nestedhvm.c
> +++ b/xen/arch/x86/hvm/nestedhvm.c
> @@ -15,13 +15,6 @@
>   
>   static unsigned long *shadow_io_bitmap[3];
>   
> -/* Nested VCPU */

(minor) I think this comment logically applies to the following functions as
well, but since it doesn't add any value I think it's fine to remove it.

> -bool
> -nestedhvm_vcpu_in_guestmode(struct vcpu *v)
> -{
> -    return vcpu_nestedhvm(v).nv_guestmode;
> -}
> -
>   void
>   nestedhvm_vcpu_reset(struct vcpu *v)
>   {
> diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> index ea2c1bc328..9e158bc5ce 100644
> --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> @@ -28,11 +28,15 @@ static inline bool nestedhvm_enabled(const struct domain *d)
>       return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
>   }
>   
> +static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v)
> +{
> +    return vcpu_nestedhvm(v).nv_guestmode;
> +}
> +
>   /* Nested VCPU */

(minor) I think the function should logically go after this comment but again,
it doesn't add any value so should probably just be removed.

Otherwise this looks good to me.

Ross

>   int nestedhvm_vcpu_initialise(struct vcpu *v);
>   void nestedhvm_vcpu_destroy(struct vcpu *v);
>   void nestedhvm_vcpu_reset(struct vcpu *v);
> -bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
>   #define nestedhvm_vcpu_enter_guestmode(v) \
>       vcpu_nestedhvm(v).nv_guestmode = 1
>   #define nestedhvm_vcpu_exit_guestmode(v)  \

