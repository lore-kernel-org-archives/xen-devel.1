Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E24ECA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:37:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440865.1658376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDisI-0004fZ-Rd; Mon, 05 Oct 2026 13:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440865.1658376; Mon, 05 Oct 2026 13:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDisI-0004fS-Oi; Mon, 05 Oct 2026 13:37:02 +0000
Received: by outflank-mailman (input) for mailman id 1440865;
 Mon, 05 Oct 2026 13:37:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xDisH-0004fI-Ip
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:37:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDisG-006Gl3-SC
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:37:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac3a7f5-8faa-0a2a0a5109dd-0a2a4501cff4-12
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:37:00 +0200
Received: from [40.93.194.39]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac3a7fa-5984-0a2a45010019-285dc227cea9-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:37:00 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Mon, 5 Oct
 2026 13:35:22 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 13:35:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAe0uWBXWIt2dBMt+eRXoaX12QlhsN6H/gVU0mkL7Lgx60hiRqvVog6fAdUYwXVE2/IhRJqzGWcCrQySRBc1DKYC9AgNRphewO2tvKZr4g1zvN4p6VO07yirDMre7aOBrtUw1W78MPNfJjOS5jVonWhi3MpNHC712iFvyFHHZ/+yTAsBez2Eq33nxkaC56EFcdwYD8pt37sjqeeLNJQ45NGbSHf8Bnj6tZ1/xI8RuVF4SThK1oQ+oyBnqiUIO6QnycjxccFlIm8iNB5qUs7hCwxATcKkO4PVOrasJdRulzEYiqs3IvuAQr0QBRCkfY8yef5msb55NgrmUCcj0a4y3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED5LdYnpf0elcnvO8paeZu7OmqB67hI5teJUGQ0NAjc=;
 b=qHsHKm1vVtuIbfWTBI7mnO7gikGxQvB+0bIWmXf9GaJ2XY85Vj+S/BrPECKLCkZddAFnSuALYDN5mjUqAxBkAGDjmJEuhJ4Y8T5D4f5TilRutK9iqgmuUFIDoL91upaZ9/BlgU16mwv65g87z6rmcgZd3CfqXcNGSUe1QNpyJePpAPcQ1ZQkIPq7pqYpK+tT/9qSUIFT03YCDt24cxBLB3TG9TY3KB2bUoX5hriqv9rV25ljz/I+qT6DIrJBDkET7KS/qSSKU1t8cBhEOGZ8ElvaiJf+F298blzCWT3zn7mNI0Xvut1o9b8A1bLroYp07eV3tiEGcTmPaFHu5oDJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED5LdYnpf0elcnvO8paeZu7OmqB67hI5teJUGQ0NAjc=;
 b=jrUT504I6Fr5/4vB6QsPAHScaYjvQbJQsFhe06DE1m3mxqcZEHzZdREAFBBo2K2ucVatJjO7WuSLCxVjAiE5DIwq7c+TMqM0EPxZ/FUzyVUbYqNVj7yuefeAya7Z8CW1HSzdGsgZmBsPe7ms0PvVWSFoQRkknkQAzSoVrfv4lpQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 15:35:19 +0200
Message-Id: <DLWY02J6505T.3N6KOHIY06S7H@amd.com>
To: =?utf-8?q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
 <xen-devel@lists.xenproject.org>
Cc: <michal.orzel@amd.com>, <julien@xen.org>, <bertrand.marquis@arm.com>,
 <sstabellini@kernel.org>
Subject: Re: [PATCH v1] xen/arm: validate non-common page-table ranges
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.17.0
References: <20261002191418.287819-1-gabi.qs.mail@gmail.com>
In-Reply-To: <20261002191418.287819-1-gabi.qs.mail@gmail.com>
X-ClientProxiedBy: MA2P292CA0003.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::20) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|CH3PR12MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: c940b15a-1695-40f3-30e5-08df22e5812c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KnRd7mfwuEztIcqlgVG1NBqFYztHeU7CJSeTe3HBdLq5RJ4D7S20I3DhAxoSoHMb2CtZ1aaOo4brb3CyR3ZAglmfHXDmsoVaQ1puO3fb3p5vfEsUlh4SWnESdGPAKCcWYrHlWZDnJhoRZg/YM3hjDQ7aPhkrgiJ5K13lrI9Xf0LF8auLeydMKwAWVfnpD0g6aIbulb2aGGZTz8mQevOEdShyhe8MNSXFyFS2eDd6+OpuEUv6ybcT0YROBwZftjMIFlerS4Lo/3hz/OafI/p7ilerHxFPx9+MHO3ab+peajO7qjrMLcqnM7OCAB6KPwOiFon+ax6IOUleDEUSQH/vU1EBRQorNCADpuarXLHPGSl4Uk4Q2cPuNB/+ph4/2RGQq0dQOtXOah6bXyBxdjM3cYL8Um8CmEtkghChXAXHVjhYS3lafNX4AotqbFvSbN+tadx0J14BhvIPUPubQZp76X9eA3Qhg+kOvWyLF1Gmb733nRPj1xie8wQU32ZhcLbRXGuu0cL1BIgcPC7QqOqkU7NXuB/8ps4rLURSMP7UzAhtQlyecl/47RpARBYsTxmV8fmFLeB62fzUjS3EFOTihYkGm0iEmyVgQZz36NcXwI9AJMejCM3OFqIFJzotw4OV41egor9TiQqKkEg1tMt7/gsGpzL9nfBZRwSNUrFgqWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VytMeHZEdlNHOHRCLytpemZ5aGlNUEdLWDlnVnNkVnJCcVBlZlJKZTNBdlda?=
 =?utf-8?B?bXZSMU9SaytPWWtWaXdEQ3Q4VDZhMEVLajZPNEtyNXptaVdNTDVhL2xHSDJP?=
 =?utf-8?B?bGhxWDUzZlI1Y0NhamE0aGFMZ0JrZHo1amxtLzlsR0JpZDYvaW5MdFBiSkJL?=
 =?utf-8?B?OSt4bHlSK0tGcjJBTXV1TGErNlBQZVQ5WnBVb0hOTkllTEticXYyeXVOSWxu?=
 =?utf-8?B?K2NBMVI1VVpIMTNpVDNTVDdnVVFUd3hPeEtJV3p1UG9pR2c0T2tHS0cvU1d3?=
 =?utf-8?B?cE5aRkNOcmlxZlRXSWIzYTB1YmNtd1ljbGhxT2xWaE1jeURZaUdRbjZlc3B4?=
 =?utf-8?B?WU5qMWNKUXA4WUdoaVBLU1p0OU10VW5NTzZjYTlnK1BGcDFsNEF4SkJxTzNJ?=
 =?utf-8?B?T0x6Y2NoajdwU094NWdhNGNZdDRVcmFabEk5ajFyZ2V3YWFZTC9WbFJyTzRh?=
 =?utf-8?B?TWdGTHcySzhMSWFDL3lFakdWOHNOdERnNytKSUdST2hUcjRGcWpDRk1zTXNR?=
 =?utf-8?B?WTc2ZytEMG1VZm5FNk5BTDhOdzZIbkxkYjBxOFN3ZmhGTzc1YnY1VzRWUS9n?=
 =?utf-8?B?RENzalJuWTNwTDhtMkFRd21oOEg0RERlSUdWc1Juazczdk9QVmFtVEJyTUs0?=
 =?utf-8?B?akp4YjJac0I2WHVtUjkvL09vSmIwMnFPTllScSszbmZtZWRiYmVXOHdrU3Bz?=
 =?utf-8?B?UENNUW1mUDRqUFc5UEpmRHJUVW9abXlrVEhiejk1V0xOd2laVEZoUEVJMHAv?=
 =?utf-8?B?NGFUQzYxZzR0U1ZxZ0wxeDF2OGFMOWZablhRT2VKTk9NNnhhMC9zY3ZwcjdP?=
 =?utf-8?B?T3hHQThiZ0VheFdnYkRLdmR0ampBd21kMFp0V3JSdHlCOW9Dc0JLbVBQOEox?=
 =?utf-8?B?M0FybFFOa1pDc0xrTkVqbWFKbVNWY1BMMXZLVWtpNzNxNGFBc3dzR3U2Z2Fw?=
 =?utf-8?B?SlZvL3BDeUl3aWN0U2E0VEI4TWUrU2dkbmhSZEJDWmJLUGJQVVJsZmFzNzcr?=
 =?utf-8?B?UjZYK2ZLOS84UDd2VGo5bVRldVF1NUhTS2tiLzV0QS8wbkpod1FENkwzRUNi?=
 =?utf-8?B?cWlUZW9oWXUyYmlVVlU3NUdDc0lSSEY1Uk9lcW1MSHBPQjhUVzUwT294MERz?=
 =?utf-8?B?d05Ub2pCTm1GSnB1bVVvMHZBWFk5M2RRYXJGdG94ajZtUDBjQ1JGcFBhcWVp?=
 =?utf-8?B?c3JkVUVrdUtiRHp1U0p1bS8xZUdjTzJmMTFuTnkveVVTMVZkYUZPM3ljeENL?=
 =?utf-8?B?RHNTRzR6ak1GSWUzd040cEpLR3hHN203cnd5bXphcytacEJpWFh0a3VNYi82?=
 =?utf-8?B?eHZOd1ExSEgxNzBNenBtdmh0VzVKV3lpQWpJYzEwSWlwVVZ2RlVZdnhuS095?=
 =?utf-8?B?UmdNMFlNMWlINCs1Zk1EekxtZFc3eDRhdjNOblhvcWJBOUhJZkg0WE52UmJv?=
 =?utf-8?B?M0RiamFoSWdhSDZ5My8vMmZ3REZwbk1NeWxZT3lZWVVteks5eTF1cU4xM1Qx?=
 =?utf-8?B?aC9TS3JYeTZ6MldQRlhrSUVkK3BVUnZ6NlZhdmI3bldXeEY3ZWJCVDBoMGNI?=
 =?utf-8?B?Mm5WeFRNeTlFai9CWVJtZ0xuUzF4eUhyVThOamxXejcwSS90dXNoOXdyWHVG?=
 =?utf-8?B?cDVqSXg4Vm1NTEF3M2hUdVRkMDJ2M3ozNCs2ZFpJN3prQnNjSXluQ3Fvcm9U?=
 =?utf-8?B?emVrKzZKdEQrMjVZelJWVWNDUXBwWGtjeE0zYTBoelBkK21jUHNiN2Rwa1do?=
 =?utf-8?B?ekNEVmpXdU84dTYzMHFSbXB1ejQ2dlJpem1MaHFLQ2dtRXV3SlNGOVVGKzNQ?=
 =?utf-8?B?WGhpMGtsb0dOeVg4bVVLK1d0c05PRVFsVWpLNU1ScGlZZE1kaVF3ejVHZno2?=
 =?utf-8?B?ZUovbnJXYndpYmY3dXppM2NWa0lJSXhwTW9zTlM2cHlGb1VaanRhUUl2Z1l2?=
 =?utf-8?B?UVU1eS9ueE9CUlNCYi9ZQ2FTSndPNjJPUzFrNEFaSGFNdWFMYkhUU3JGaGhL?=
 =?utf-8?B?RFkwRlJRYUlvQ0xsSC9DTi9ncWlEdnR4cWNUUXZ1c2R4UExWSEUvZ1BFTTJ2?=
 =?utf-8?B?UEJobU9qR2pmVk9VeHRxTGtEZisvYklHcjExR3dCRDIrL1ZmOUk3SXR5aU1u?=
 =?utf-8?B?cTdUZWM5M2Q2cFlZYWxXVG1ETmpPRitUVlZvbjViZjdKdFJnZ0tuSkQvK3Rm?=
 =?utf-8?B?MmVrejJucjljclZhQmUxK2tWNm04NkxMRkhiUDg1cG5zOEhOcjlnS0lOR3hr?=
 =?utf-8?B?eGxDbEk1akRZak10OThMQjU5WlI2R01zWHNqQ1NENUp1QmdlWUJjWHdsL09h?=
 =?utf-8?B?MHhvd0hhTFRYTkhVYjJxdGtFbHJkNUZGWlNFMXNoZ29UdC95RWROZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c940b15a-1695-40f3-30e5-08df22e5812c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:35:22.2203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jd7zJhpiJKeBLgHnXQB/IY2axZL6fMWbaxz4nVtkbqi4q/ycC9dlVrK9wZm/FCqgCUU8PetQGaAFbqAr3Y0xrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342
X-purgate-ID: tlsNG-d62444/1791207420-1EA66757-34CBC6BE/0/0
X-purgate-type: clean
X-purgate-size: 3384

On Fri Oct 2, 2026 at 9:14 PM CEST, Gabriel Quint=C3=A1ns Souto wrote:
> On arm32, page-tables are different on each CPUs, although they share som=
e
> common mappings.
>
> The xen_pt_update function assumed that only said mappings would be
> modified, but did not check this assumption.
>
> Add a range check to reject modifications to non-common mappings.
>
> Signed-off-by: Gabriel Quint=C3=A1ns Souto <gabi.qs.mail@gmail.com>

I'm not an arm person, so take this with a serious pinch of salt.

> ---
>  xen/arch/arm/mmu/pt.c | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
> index 621b47d..ad0d1e6 100644
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -13,6 +13,7 @@
> =20
>  #include <asm/current.h>
>  #include <asm/fixmap.h>
> +#include <asm/mmu/layout.h>
> =20
>  #ifdef NDEBUG
>  static inline void
> @@ -589,6 +590,29 @@ static unsigned int xen_pt_check_contig(unsigned lon=
g vfn, mfn_t mfn,
>      return XEN_PT_4K_NR_CONTIG;
>  }
> =20
> +#ifdef CONFIG_ARM_32
> +static bool ranges_overlap(unsigned long start1, unsigned long size1,
> +                           unsigned long start2, unsigned long size2)
> +{
> +    if ( start1 < start2 )
> +        return start2 - start1 < size1;
> +
> +    return start1 - start2 < size2;
> +}
> +
> +static bool xen_pt_range_is_non_common(unsigned long virt,

We typically prefer positive helpers so you never end up with
!xen_pt_range_is_non_common(), which is awkward to read.

IMO, this should be xen_pt_range_is_common() with the reverse polarity
in the code elsewhere.

> +                                       unsigned long size)
> +{
> +    unsigned long temporary_start =3D TEMPORARY_AREA_ADDR(0);
> +    unsigned long temporary_size =3D XEN_PT_LEVEL_SIZE(1);
> +

All ifdefs can go away if you do:

  if ( !IS_ENABLED(CONFIG_ARM_32) )
      return 0;

... here. Everything else drops with DCE when compiling with ARM_32=3Dn
both with DEBUG=3Dy and DEBUG=3Dn.

And codegen would be identical.

> +    return ranges_overlap(virt, size,
> +                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) ||
> +           ranges_overlap(virt, size,
> +                          temporary_start, temporary_size);
> +}
> +#endif
> +
>  static DEFINE_SPINLOCK(xen_pt_lock);
> =20
>  static int xen_pt_update(unsigned long virt,
> @@ -601,15 +625,13 @@ static int xen_pt_update(unsigned long virt,
>      unsigned long vfn =3D virt >> PAGE_SHIFT;
>      unsigned long left =3D nr_mfns;
> =20
> -    /*
> -     * For arm32, page-tables are different on each CPUs. Yet, they shar=
e
> -     * some common mappings. It is assumed that only common mappings
> -     * will be modified with this function.
> -     *
> -     * XXX: Add a check.
> -     */
>      const mfn_t root =3D maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
> =20
> +    #ifdef CONFIG_ARM_32
> +    if ( xen_pt_range_is_non_common(virt, nr_mfns * PAGE_SIZE) )

nit: Perhaps ASSERT_UNREACHABLE() here? Presumably this path is a
logical error.

> +        return -EINVAL;
> +    #endif
> +
>      if ( flags_has_rwx(flags) )
>      {
>          mm_printk("Mappings should not be both Writeable and Executable.=
\n");

Cheers,
Alejandro

