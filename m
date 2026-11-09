Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FBE606A322
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=WLpFlxaM
Received: from list by lists.xenproject.org with outflank-mailman.1480172.1684133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQKa-0006KE-68; Mon, 09 Nov 2026 14:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480172.1684133; Mon, 09 Nov 2026 14:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQKa-0006K7-2v; Mon, 09 Nov 2026 14:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1480172;
 Mon, 09 Nov 2026 14:26:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xQQKY-0006K1-8s
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:26:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQKX-00Ez9O-L8
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:26:41 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af1d816-e002-0a2a0a5209dd-0a2a450acc32-34
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:26:41 +0100
Received: from [52.101.46.43]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af1d81f-f2d2-0a2a450a0019-34652e2b391c-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:26:41 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DSSPR03MB989189.namprd03.prod.outlook.com (2603:10b6:8:375::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 14:26:37 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 14:26:37 +0000
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
 b=AsZb93IbsagnxblXfDJIT+/tEe8bUlA8XqmHr4hneDMymDomRmTBcCmYuI1dNCj8St1TsrIeYMu03RLgXBUMCuVFGHFLm0PAhEVKRBhjNLVD6OC+rvYMGvs5mrBLaUayJ3vP9h/8ed9YbD7iR8/yGqVCxb1ZkBz2IEBBPed+fXe8WSRY5YRdH9mg6sF800FlWTKGj8TJ5KITh16UEJ4Thcv1ZgLyNQtiUzSLSr5/2ZuUC19oR+aDCAnoedUW3o9wK/Vf+noSXQu/rVXFtn3AtjNwLN/1wEzpTWSVkhgJSIcayj2tojthF46GI6a3a3UDztjvUjD7AqIVFC+RooiC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLqC/2brOXWuIvQGplGN134ubFIUqk+AhHUSWOEAOXg=;
 b=Tzcqd2i9mbJzARyNEfzYqN/yxtZ+0aBkAkw/IX+21wY+O4jzAY2AkixXwg6YGVdoS4kPV4xUIrsg7+3jQLAQemMrugr40EOuIND/2maaIZUAFPngFC4g4Mp8D0r8ixvBqj3Vez6r49rDB+BycG6OMRIpbIcsPYmvQh6CGXGNQU6s4FAgeUXcrSsL5eyKrmQsVcrWrSygk6KP1C2ciO/Hzrc0b7qoM1+7qM4tT7RKErTpdMaCzTMFpApCmeuhxD38wpemuq0U9D0WEu7h/hvvOEPgo4qR6JipL3pW7wcsEqBNYj+RsAvW7rwd5uK9RhhspIK+DmnYSSnXtnIsT1WUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLqC/2brOXWuIvQGplGN134ubFIUqk+AhHUSWOEAOXg=;
 b=WLpFlxaMsBLO9bv7K0uMGv0HCvh1rLTRlvSPBXM32KUOrPEIxLcGWz7F8wa36ZYXbDaWyNV1obTdPlntX6XzQ3CNj8E+MUJLveQ/yX5h0OZx0uDf1bsrPMFNgL+nDRr9+BiDNiO1SFT6gxCTbJpUYQNbwi/Ce/rIW2qZ0LHfexQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3fe5acca-7d8b-4736-9f46-78c6934cf41b@citrix.com>
Date: Mon, 9 Nov 2026 14:26:33 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/28] x86/hvm: avic: add VMCB state initialization
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-8-dmukhin@ford.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261105013347.719392-8-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0254.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DSSPR03MB989189:EE_
X-MS-Office365-Filtering-Correlation-Id: 940a2ded-91ab-4f1b-fe0e-08df3e6d76c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|4143699003|56012099006|261026121527099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	A9zMYTOdcPDreCSRWR97bE7UQ36FKF/U4DLf+hlZKNjAcogRnlh5z/Y5LodyQnjdQqctoohxI+vtrYpgjvKc81OK2Q1jkVehKPwsnQG4uCXiK9FYddyIDUaNroQxvzmvDYKqYQm8vLsC721HH/aR5d1vGIiySBXet2uDeSWG6zrFHIrsvt2e+DDjodTty70hA9EkpVwZJTv+VTCruUgYpdUbxH6UyP8sSE1f4QeoHTX2kenqHYxCwsJ1s8OOoEVhGz7LU3xAM/8fqPe7GyyhS/Sd1+pVy9FIyWE+L8ch9i7MASU8Ze8k8zmTdKRK60HzajSHkLdKUJGFTYzr8eGk1NPjRnrwKCuXbjwHnTTRD1wHROydIHIdK45PB6j3hV5XlTrFQTJnJ7fNINBKTjVko4s9DaLDsH2jDZN2F/RztsIvStJO9Jz+HjK+anMXfJECwjAPCPsnzStSahW8jFrkI2Dzu2smbM1gcVnwPt9oU7SMGaIp2rhtn3liEErRUIEoJdJJGAxSUp6eLZ5zdbOrPvuROMOrQnYGIDZa1qdnTMw4wscnqKnfJc7Jmn9tNovwMmNzhx2907l1IiwzKwpmCpuydwQpGD5Smh5AYbd7L4MGXHL074Ec3NxUmXDDLJT9ncUDEcTBRhshrm95iVVnkvKG6SFapMIEJroSuNRUVew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEl3M2hzMnUvK3I3RG83dnZMRzFUcDdtT21hVlJoRlZCbzZUOHZMQlk2SzQy?=
 =?utf-8?B?a0plTk9PcElkckZFbUYwYURML1FBVDRVbFZlVUNaMzB5Z29WZGsyUDE5cmxs?=
 =?utf-8?B?MExqMDBnUGJDS2owbUpWTEhKV0NSeTdRR2M3a3JQZG9weXJwTTRIOStYeUdS?=
 =?utf-8?B?YVpRZFViUVd3eFlJMTkrQ2VBZEZWa1NXK2lFcWJjR0xjQW91QXBYWVJZc1Vv?=
 =?utf-8?B?RnVUVHlSSm1OOWpzRlJiRjhVZ3RvejIrNmNMRy9ycEZmT1dCMlpiY1I1TGFX?=
 =?utf-8?B?UWlvUUQxUE5TOCtTODB4cHo1S1RzN3RGNVJIa3dBaU1FekVJdVUzcFBZSDI4?=
 =?utf-8?B?N2tOOUZyRnlpcGxGZmd0VWc2R0d4WXh3RXpta2JQM0VKY0VBbnQ2NFV3dEE4?=
 =?utf-8?B?Skw5ZTZXMm1DWVBZb3NBaHVOT3M0KzJEWk1JNG55T3Y3cVdYUiswZlVRdmdt?=
 =?utf-8?B?bjllZjhCR0NSTDdya3p5am0wTXhMZGVEWVlaL0hPMDJncmVvTXFTYmVVSVEx?=
 =?utf-8?B?VklwQnJucEkwSjBxamtkKzlQeGYramsyZVhxTW5Oa1QraXVRTXg0dUl2K01n?=
 =?utf-8?B?VGRsRzNIclczZVpTMFliR0E1bmF6cW5Fc0NZUFl6bDExaTNlOVNheWZXSVBz?=
 =?utf-8?B?WGErT3RLejZFbkRqKzZoSmU4QkJZZTBmaHU5em1aYThySllERlJjdk8rSEJH?=
 =?utf-8?B?dFVTK25zMWFUZnJLKzBvbER6V0N3WnNmcWRSaVJrb1RCYm1WOWxrUUFjZ1Q5?=
 =?utf-8?B?c1h5UVlRREZadXMwM01sMGZ3K1d1L1ZraXFDcDJXaTYvcHdQY1Vlb2Y1Q3Fv?=
 =?utf-8?B?M1psMUtqa3JGb2NIb3NuR3R2STNVQ1k3SkVITEpBWlowZFVrOHRPOEptVEt1?=
 =?utf-8?B?YmYvTmNRd1ZldElaVXlXaU85NVd3QWo5ZlhSN1JNTXF5RWdQem1adUJQa3Za?=
 =?utf-8?B?VkoxSEI0cGpZUlhmdjM1RGp0Wk5zbzFVTW9sZWZ4NXN0ZStYR0g5bzA0R28v?=
 =?utf-8?B?QWdKOTFNaEg4MnZXNWlpZmNDRTZuWmRzT05RRnBqSjZNUGljZVRmdE9QL05N?=
 =?utf-8?B?MFltQU1KWDNnVUtyNlByUFJib0tRRGNKRnVxeVNGOStobll5cFZjVTlXVUQ2?=
 =?utf-8?B?cVNCZk9QUjUyaDJ2dnhXOFNnWWc4ZzltYWd3OXErRlRUMXpHQnM0UGNlMXF2?=
 =?utf-8?B?djVJTTNVN3JmRXRCRHFuZ280OFRsaWpqb2FoT080WEFndDR5elIwaEdidmNx?=
 =?utf-8?B?Qm1iMXp0NVZZb0Q0OFVRTnVBWFUzOWJEWnAraW5UdUtqZjJlMGJ5alVVQTEw?=
 =?utf-8?B?Y0NXaVYzOUpGc01vODRRRmU0M2JKMTJvbmRZaDR6amRPMlg3UThGU2lTNHN2?=
 =?utf-8?B?R1FXK1lJdy9kZkNibDYzWkhMRVp4UFAwb25iMW4yeXRUelZieStuTTB0cTVM?=
 =?utf-8?B?NjY4NzFhSzlzN2VaMlRxTXhZOTduRmUzbGVMRFdsM1FHVXo0RnMwZmR6VnhM?=
 =?utf-8?B?R1dGWmc2QUZndWU5TVVWdHZNM3VKRlhTRU4xYTBLOVRubEQzTnJlQkhmOHlG?=
 =?utf-8?B?eUxrYlczQUQyeDErRFBKbVpGSThNKzVoOGJWbHplN3pKNHlQcHJYa1BZTEUx?=
 =?utf-8?B?ZW9wdU1mQk5La2JkK3lyQlM4ZmN2dUxVcDFmaVR0QUZxQjJxS0w3amFVN1V1?=
 =?utf-8?B?b09TdDBUcnVUcjlMUGFubFZkTVloWmc0UDkydzduekFlamRwK2h0Y1A5UFhl?=
 =?utf-8?B?MzFENEJaOXVkRUQzNTY3MEhvV1EvYU03V01JS1lEbVlNeWtIam1rRDRuVmJp?=
 =?utf-8?B?TndEK1k4eThUS1BjMG5YaW1GTmw1M3Z2RkpRcjRRVzV3WGQwRE04UUNpY3RR?=
 =?utf-8?B?eTFnMHpkV1VrNzhIZzJFZnZPSzJTVVFTbnAwYWwxQStHdjFTQ29CaTJYeHd0?=
 =?utf-8?B?Tk1WZkhsMjdrVmc1YkdtdjZCbkxHcFlIZEFBVmJ1VHN4RWt1TXdCVkRzZU5V?=
 =?utf-8?B?aVF3VmVaOEJXc0IzWFYzcjZLdWJjbGNBUXo0OVFaT0JzOHM3aGt2ZWJSd1FG?=
 =?utf-8?B?MGlzV3BMVVRnY2ZZcVhleGhkUk9EUTk0ZmpCMXRKUG5PU0ZXQzFUT2FqdDJt?=
 =?utf-8?B?MVZxZ0V2ZDdiNjFZcWlyWnRWVUtmTlE4Mmt5V3NQUldrVFd2K1I2Z3Nwb0xW?=
 =?utf-8?B?dkZ4bUxpeXdtOXo2QUZCWTJLYVM2WDRXOGJnTm9qTGJLVDBEaG81cUVITjQ5?=
 =?utf-8?B?eUtEYlZBSHVLY0RwV0g0SkdUVnhic1VQQnV4VUpFSHIrQWUrbUdWVXdyQWNx?=
 =?utf-8?B?MGlQV0JGaUVsclRMVGs4cGpYK0JySmFwRldydkllelQ5N3EvajMvUitqTVpB?=
 =?utf-8?Q?mWE5g+TJ6yt6tiU4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 940a2ded-91ab-4f1b-fe0e-08df3e6d76c2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 14:26:37.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioKcn80ftwPd8hwwnEkfW003wWyQd6maZ7ttT6KIfZUrPBNTDZc8I3N5uleVTeS6Q/slC6FIHpy8MnySVd6n7+ER0wnPtezjky7mLEfmaQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR03MB989189
X-purgate-ID: tlsNG-4011c0/1794234401-4B2D8CFC-940FA80F/0/0
X-purgate-type: clean
X-purgate-size: 3278
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 1:33 AM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Update SVM VMCB with AVIC-related data types as per [1].
> 
> Install AVIC backing page and logical/physical APIC ID tables mappings
> into VMCB.
> 
> Set VMCB 'avic_enable' bit to 1 in case of successful initialization.
> 
> [1] AMD APM Volumes 1-5 "15.29 Advanced Virtual Interrupt Controller".
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/x86/hvm/svm/avic.c | 110 ++++++++++++++++++++++++++++++++++++
>   xen/arch/x86/hvm/svm/avic.h |   3 +
>   xen/arch/x86/hvm/svm/vmcb.c |   7 +++
>   xen/arch/x86/hvm/svm/vmcb.h |  19 +++++--
>   4 files changed, 135 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
> index 2c0e113ae34e..bc98661a7057 100644
> --- a/xen/arch/x86/hvm/svm/avic.c
> +++ b/xen/arch/x86/hvm/svm/avic.c
> @@ -9,6 +9,16 @@
>   #include <xen/param.h>
>   
>   #include "avic.h"
> +#include "vmcb.h"
> +
> +#define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK        GENMASK_ULL(51, 12U)
> +#define AVIC_PHYSICAL_ID_TABLE_SIZE_MASK                (0xFFULL)
> +
> +/*
> + * For AVIC, the max index allowed for physical APIC ID table is 0xfe (254), as
> + * 0xff is a broadcast to all CPUs, i.e. can't be targeted individually.
> + */
> +#define AVIC_MAX_PHYSICAL_ID                            (0xFEU)
>   
>   bool __read_mostly svm_avic_enable;
>   
> @@ -125,6 +135,106 @@ void svm_avic_domain_relinquish_resources(struct domain *d)
>       }
>   }
>   
> +static bool avic_vcpu_supported(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    unsigned int id;
> +
> +    if ( !svm_avic_enable || !has_vlapic(d) )
> +        return false;
> +
> +    if ( d->max_vcpus * 2 >= AVIC_PHYSICAL_ID_TABLE_SIZE_MASK )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pv: AVIC: unsupported domain max_vcpus %u\n",
> +                v, d->max_vcpus);
> +        return false;
> +    }
> +
> +    id = GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));
> +    if ( id > AVIC_MAX_PHYSICAL_ID )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pv: AVIC: unsupported APIC ID %u\n",
> +                v, id);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void avic_vcpu_enable(const struct vcpu *v, bool enable)
> +{
> +    const struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    struct vmcb_struct *vmcb = sv->vmcb;
> +
> +    vmcb->_vintr.fields.x2avic_enable = 0;
> +    vmcb->_vintr.fields.avic_enable = enable;
> +    vmcb->cleanbits.avic = 0;
> +
> +    printk(XENLOG_INFO
> +           "%pv: AVIC: %s: apic_id=%#x avic_physical_id=%#"PRIx64" max_vcpus=%u\n",
> +           v,
> +           enable ? "enable" : "disable",
> +           GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID)),
> +           sv->avic_physical_id ? ACCESS_ONCE(*sv->avic_physical_id) :
> +                                  0xDEADDEADUL,
> +           v->domain->max_vcpus);
> +}

This is called from svm_avic_vmcb_destroy() which may be called after
domain_relinquish_resources(). Dereferencing avic_physical_id hits a page
fault since the page is already unmapped by then.

Ross

