Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC649606A31F
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=KvpHncD6
Received: from list by lists.xenproject.org with outflank-mailman.1461045.1671981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHaP-0007ON-PD; Mon, 26 Oct 2026 10:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461045.1671981; Mon, 26 Oct 2026 10:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHaP-0007OG-Lg; Mon, 26 Oct 2026 10:05:49 +0000
Received: by outflank-mailman (input) for mailman id 1461045;
 Mon, 26 Oct 2026 10:05:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xLHaO-0007Nq-Ne
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:05:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLHaN-005AER-VC
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:05:47 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6adf25f0-8faa-0a2a0a5109dd-0a2a4508e8d2-40
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:05:47 +0100
Received: from [40.93.194.52]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6adf25fa-f659-0a2a45080019-285dc2341bbe-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:05:47 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS0PR03MB989237.namprd03.prod.outlook.com (2603:10b6:8:394::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:05:44 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:05:44 +0000
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
 b=Q7aNocEFJvS2lFha0B7svs8bzD+tRFKxrZUCDeQW0IyAuljBXVTDokoeayrMZT9f319TiRb6orevBVXdZ7CuK4zGD0z2Vg+ssVEB082cgNMFY6RjnRWCaIDMPZrc+OejD6reVJ6tQJyVOwgKG+xdxdGkOuOh7FGf3Nbqz2+QHf52bq8Mq7Mzwt06j4x73885LpFKswX63Z2G5EXtta3U6HyRYdu/vU+pm2WgIyOc0ihRV4UTG0om7N+zJI2t2nd00wOxtXqaT1UkjzSyJ6VG+ozK4T8hErYu4TtV10NpL1c0d0jQc/X9BX/SgpUpQJivqsaIgwa6M4LjBlhoA50JAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkgMGXHgq+whQ54tDu7rb8WaTh0/w/JBnU2v8L9bT4k=;
 b=tnPQ67prVzVLtu8rutxYrePg9BAqm6CZ5VtbYwfk4XBNv5azj0ycB2+0C9Ip6QeF9rZpdXK3Q5RsvkEiAGmH6pJFv/pCBcRDJbchrvgS7ZeSfnZWbgtzX316ZTXIT6ir/+4T/8kVOUjYXparVW36JCm/XZu2Ef8wMemIrNY/1KGi/LshkgQwytJw6JQUWcWj1cZr8ChAl9ivpYcY46VoGAAsDDwZyH8Xuq/c1gcoQm2yJuf9NZtFrmsK0l0htVl02LdrRtl0JxFW8DgdzavYx1pzo53H2jp8sBpSMs7RCEXsizPsaAXfbHVJA71c4Qlx//Q+Yc5kOdrIXkdQaFAa+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkgMGXHgq+whQ54tDu7rb8WaTh0/w/JBnU2v8L9bT4k=;
 b=KvpHncD65XMyUBzQeq7zQ5AbiNY9LRcz6YRMF/lS6zlLMas2XkuiE3cu6sJZkNxhWgy1Br92UgtXsH2NjpoJkix5Hvf77ahLrBhDgK0Ex+4sgDw6mNydHnYYnXyNpVPrygJH3B5G0dj+AI4tmBVn20oBjXJm8oaTsGi8Y9iFc/E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a1c7702c-b4a7-4703-a77f-9e184f7ad2e0@citrix.com>
Date: Mon, 26 Oct 2026 10:05:39 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Ignore bits 11:0 of L1's MSRPM base address
To: Stephen Cheng <stephen.cheng@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20261026023821.301182-1-stephen.cheng@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261026023821.301182-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::8) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS0PR03MB989237:EE_
X-MS-Office365-Filtering-Correlation-Id: 194387a4-4465-40b2-16a8-08df3348b2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|261009223027099003|261021121427099003|261022075727099003|261021123027099003|10067099003|56012099006|18002099003|22082099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	9cbPXoH/ILopDxr3wxi09AQBYTH/bS9+pgb4KHtt+1Thg+ZkHDzZZXnhS0/LUDxIFKp9wHM54sSWE/mb0pusAucsEkH8ESpFHd59jJjnlyLA7Rpa93as/VMeEfiPdOUiKk1pcIg+pzTIDof6Wulsn3QgtSHHgeuxMW99939Mq9ocaKZVgp4qb4YjpPLgubT5oQI7yZ5YkGu9Xrg6MvU+ucuONFEQKMut7XeN4pCzRsUE/MtGT9i9EQIV0psj4uMLMhsn1+BkNzbDlaWVwO3qg9vsx15tjHE2utupjQpWxHDtXDcnCZ0tzHCQ+89KInpiLPqdyS/vH+Elj5voqJfg3q86dGJsTmeFPCn+gafjjuspx+R44Odv4ZQV9NV1OZLv2p4m02PdTR6/pfNVwnxuDo0VZsYe80jOiobB0KZbk5yZnGjToEhG6gNpMgJ3hFmjVQwKTOiWlBIfMd7mI6U2kaUcQl/7KukISAZfxKGIf60zGntp8ZQtWSrNfVJBNZjw1tvyKarphsxXEvhK1Ge6BoxlmgcA7NbPlXiaulgiMFGPudg9nwYtmWQnEXtU4/PZilGYHMve3vggjJxIidJ8r+mYUVKYPq+kvcS4iKjISMcA4pJzi+7jZzwDe7Svnp5dsnqLjGLvSj7w/DRXsttgynBheNlr1ydvszWG/xmnTaQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261009223027099003)(261021121427099003)(261022075727099003)(261021123027099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OENvKzRRajd6dEc0YTk0VXpwRkdSZXdVUGN6akM0bElnWk9xend1VFdoZ0V0?=
 =?utf-8?B?enFXaVJsZ2JaeVpmTmc0VUpQb3k4L2l3K2FwcjhOaUFNdlJKM01GeW9MMHZq?=
 =?utf-8?B?ODlGWTZ1dUF3NnBYd0hWRkc4a3NzbnBYQTZMNTFLWVg1NVVLOVhpSk1teFFZ?=
 =?utf-8?B?b2RTTW83OU02THhLYW5lM04rbExkdjIwK01VZE9WSWdEMnJyYWxOR2VVeE5z?=
 =?utf-8?B?bG1GRjJoMmVIUnNwUGRYYWR3ZFdyd3BXWDFDQTJmUkdRVUlIdk9YT1k2UFZS?=
 =?utf-8?B?K1FXT1E2WmxVeVpJbGhDZlJVNE9HckJVamVMOTgyNFNQcXVCZ3N1N0pRN1ZR?=
 =?utf-8?B?a1J2RFBrOCtaMUc4c2pISnNiQWgxM2lYMUJ2cjhTMGRpQURlTWxUQkk1dHVL?=
 =?utf-8?B?S2hTL25obE14R0JsdnpwSzFSdzRUVS9aUHpWazZVNkkwaTRhdXBrODZHYXpY?=
 =?utf-8?B?bG0ySk9yY3NoVXRsc0R0Yml5cXp0clU5VUVlb1lPUlBaeEZmZTFFZTI0c0tG?=
 =?utf-8?B?ZTNrQ1UxZWxmejUxbEJLQTJKd3lkMUo4b2lLdVFZT1Y4K1hNUkp4V0QzZnJO?=
 =?utf-8?B?SXhYeFJpcklVZ29RRGZtM2dmNFpKTzBRaFE2cEtTcUhNNjI2cnhQTjBpSGZx?=
 =?utf-8?B?OWtRYkFZYWtvL1VENTVqci8yWVlGSUhJdUxseVRyeUJ1b013eDNuY1hRTmpE?=
 =?utf-8?B?a3NMSkhBbmtkWGxYSnozN1RKSys1T0RwTHd6L2NYdGNSTHVrblJ5bEljSkh4?=
 =?utf-8?B?aXVRSjBuakVwNStMNlRsMW8rM0NVa0RrMk1VNXh3L0YwQk40L0R1eHlkTHBw?=
 =?utf-8?B?MUlHSjFQK1N3Y0Uwd2tHWVRaV1lWTFF5QkxhTU5lQjh1cjcvK3d0azArMlBi?=
 =?utf-8?B?aXJJUVhkUXVVdTgzZTJSUzJtZ1VxbEcwMlp5VUVhNXptdlN1MEJSUUpMMjNt?=
 =?utf-8?B?K1hqMlE5Z0s3aVJqT0Y4TUpLczcwdHZEN010RmFCMTFGM2FGcDh4MEt0T2th?=
 =?utf-8?B?dEhoanFESXpOWU9WMGlYaUYwR0Q2bW8xSU5kaFc5Q2NvOERzeExQM0VzZmY5?=
 =?utf-8?B?VjNkNG5JMHdUQnpPUWZLbDZxQ3FpMHBxdE40OU92cUtlT2pGMkJJWUJsL1Za?=
 =?utf-8?B?UG5zWitqdm1rQnlTYXY2MTdMMmlHOXlMN3h6V2dEc3ZjK1A4SG02Z1VSY1ZV?=
 =?utf-8?B?TG9NYmpsamkwNzRrQktYZWFmaENVeXR3MFZCem5xaE45azExTldvemJxUklM?=
 =?utf-8?B?TTJhbU0wTDBuSmFSQnNIYjRxUEN1d1pycHFmL1NNaUxFYUVxUkM3WmJrV1lX?=
 =?utf-8?B?RXlVZU1FOVRlSkM0anJ6bEdubytxZ3A1U0lZSGlSR2pJYm1zT1hFRlY1dkFJ?=
 =?utf-8?B?d25rTHUvenZDNzVZWGtDdDIrd2cwNXNUQnBobmYwSkF2cFd3STJXM2F4blpv?=
 =?utf-8?B?dTFzbXQ0V0RPMEFtdk1YY3NSK0EyMFZGSVUva2ViU0tQYUFnK1FRWTNoSDI2?=
 =?utf-8?B?T1RFYXFEeGtodHlFb29Hc09FTWk0NHBBYVJJNnJNMkZMYmo0NUhzTUIrSWRt?=
 =?utf-8?B?TW1jZHJHSisxSDJDdU1wbUhoTHJSU1UwM0MxTW1HZm1UWDkrNGlZRzVRMndl?=
 =?utf-8?B?dHlaZGVrTjhBYmRPNkljc0ZZaWNteXh2YnJROEhWZVcrcUZPVG5nVG92SEx3?=
 =?utf-8?B?Q0RXdDZVVEhOaEJCOTViMEtkL2VDN3p5VnBuU3BQVTVBUTdnUmZUZWVJYndU?=
 =?utf-8?B?aXBDaERXaTVOVndiNEFvS0hLTEo1d2pESlRwMENLc0FaMXVpNGduc0FTYzNw?=
 =?utf-8?B?eWdoc3ZIRXRxcnF1aVVDeUcrNzZ6MUZHQ1UrcmgxbEZxaWlTeEhIclhWK2Y5?=
 =?utf-8?B?STRFSnVUanpHR0V2VkVaeE5NSko2UEhPZ3lDYzY2NERKQzZkb3BUNmphcHdV?=
 =?utf-8?B?VXJ5VDg4Rk1kNmVGR3NCb3E1VlVsQXRVU0RXMWVyRXgvRVREYVR3RURBT240?=
 =?utf-8?B?a2xMcGNqUWRhM0lWQ203U1E0ZWVVK1I3WVAvbHdIMllSbE5jNEtVcS9mS3E3?=
 =?utf-8?B?ZC8vd01kVHduYTlLakdvU0twY3ZFNUgzdVRLd0NSVHoraFpCRFg0cU5CVU5j?=
 =?utf-8?B?UTlzWVltK1BLb3RIbFoxd2VBNXVldGNCVFYvNmFPbzVDbVVZY0wzOG53UndO?=
 =?utf-8?B?QnJRNWVOeDU0SlhUV3JEWkw5NDFyVlJNUkRsQlZpWVM0dGc1NkJFRytYN2NW?=
 =?utf-8?B?ZFR5Y1ZlVmhTQTZxMzJsTnNlU2VQak9IRENtR3V6S3Iyb3FyVldWWnBqblhO?=
 =?utf-8?B?dnptcGZtSVBIdzUzVitzVW03WGRxbG9xaE9sd20yQkZ1U3RUK242Qk5KKzJI?=
 =?utf-8?Q?rsnE2gyw72b9fuys=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194387a4-4465-40b2-16a8-08df3348b2c7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:05:44.1790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFYOJAHRwe5s2ioBtGlO4n0jPm3a+kbKMlzsVLsb41VmSVvFDALGEnBY3QsidNpFfi6IVZ3rciNGjQOzD6BeH47rO70h27iwuN2aR4vFDcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989237
X-purgate-ID: tlsNG-c1860d/1793009147-CC97287B-F52311CC/0/0
X-purgate-type: clean
X-purgate-size: 2484
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/26/26 2:38 AM, Stephen Cheng wrote:
> VMRUN ignores bits 11:0 of MSRPM_BASE_PA (APM volume 2, 24593 Rev. 3.44,
> section 15.11), but nsvm_vmrun_permissionmap() copies L1's MSR permission
> map from the address exactly as L1 wrote it.  With any of those bits set,
> the copy starts at the wrong offset, so both the merged map and the
> intercept check on #VMEXIT use the wrong bits: L1 can miss intercepts it
> set or see ones it didn't, and the copy may run into the following page,
> giving a spurious VMEXIT_INVALID if that isn't RAM.
> 
> Mask the address before copying.
> 
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
> ---
> 
> Notes:
>      To reproduce, in L1: set MSR_PROT, set only FS_BASE's read bit in a
>      page-aligned MSRPM, point MSRPM_BASE_PA at the map + 0x800, and run L2
>      doing RDMSR of FS_BASE.  L1 should get VMEXIT_MSR; without this patch the
>      RDMSR completes in L2 instead.
>      
>      The IOPM base, handled in the same function, doesn't need the same fix:
>      all of its users convert it to a frame number first.
> 
>   xen/arch/x86/hvm/svm/nestedsvm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index 2b998e26bc..56d0f0fa4d 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -309,8 +309,10 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v)
>   
>       ns_msrpm_ptr = (unsigned long *)svm->ns_cached_msrpm;
>   
> +    /* VMRUN ignores bits 11:0 of MSRPM_BASE_PA. */
>       ret = hvm_copy_from_guest_phys(svm->ns_cached_msrpm,
> -                                   ns_vmcb->_msrpm_base_pa, MSRPM_SIZE);
> +                                   ns_vmcb->_msrpm_base_pa & PAGE_MASK,
> +                                   MSRPM_SIZE);
>       if ( ret != HVMTRANS_okay )
>       {
>           gdprintk(XENLOG_ERR, "hvm_copy_from_guest_phys msrpm %u\n", ret);
> 
> base-commit: 4e3c0eeac5761c505f8229e82d265eb29957ca5c

The commit title and message could perhaps be more precise - writing L1's MSR
permission map, etc. is vague and could refer to either L0-L1 or L1-L2 (or
sometimes even L0-L2) depending on the context.

With that tweaked,

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

