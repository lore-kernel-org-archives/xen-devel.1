Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD03CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 13:40:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442343.1659900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xERsX-0003n6-F7; Wed, 07 Oct 2026 13:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442343.1659900; Wed, 07 Oct 2026 13:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xERsX-0003mz-At; Wed, 07 Oct 2026 13:40:17 +0000
Received: by outflank-mailman (input) for mailman id 1442343;
 Wed, 07 Oct 2026 13:40:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xERsV-0003mt-N1
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 13:40:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xERsU-008JZo-Uq
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:40:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac64bba-2eae-0a2a0a5409dd-0a2a4504d5aa-10
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:40:14 +0200
Received: from [40.93.194.24]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac64bbc-b57f-0a2a45040019-285dc218ade2-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:40:14 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Wed, 7 Oct
 2026 13:40:07 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 13:40:07 +0000
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
 b=RAbmGUgxHvgWE7ljK44jpU1qPoW7g98xJWud9MXDJwcGRgY3JKHzXJiKNyJgBs8F2HIC1Gvh7MinKCFWOijqHiTYHbFcoLEKVg/mhFsHiapt2zz8mI+fHJcKJ0S+CVvN4QdcxGnyAgON/hPlZi8l4VGNg0JCE9EL7XpIBLtCdf8WRSjn4nH/dBM8bCJPWn1l0yuXmKohaQdJQPc9WOhOGogW8svdcimIgqvIXzdLuvhRdFPUsqSo7aBqhfpNMks9QGO8jUQyT8qfUi/i3Wui2EyoItvR9v6R7eR7pWRpRPb1d+j6cKZiLoKLigsy3G9tePLPaHt7LBzcK9oHg49e/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cz9WeqqwdBHYfBplQ//PrsacBTML2jDjUyTygECUkQE=;
 b=bBAOaOOAa35wXqIsOgC/0+tSUol8E7dB7qjzO2oRkYaq2MlXgCbc3Ty3KpVkerlCLqeSm+m5oR2vbxS5kxuEXT8wfXQrN4zfGliZsuUG0XSsWRbwS+LUsbM2YdJAViWtzlgV5XFyPu4f36b+AqBexr91laaKw0k51UlaDN1btzlt08V4ufmI/5pwBzd4tRs1OirMbqiUYBjrFAV6PBOrPscG4QkBUBryLNuEzXOqypCvQgILUr8toK9RzIDaCQbRLde1vd/ShKuCC+9lrf15kNAFBsijT7T9ckQiiyCWcU8Hy1w3Q9tRTwtC6VLFKJjqIs/7Hu0nQIR6glLDSA+x6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cz9WeqqwdBHYfBplQ//PrsacBTML2jDjUyTygECUkQE=;
 b=kHvuQ/BSw60hzslzOnkWOYmXbb0QWg7rDswB5cPrbXFeO8wp208uhoEwf5E4Y2gvMmSoGm0Gz6/Oiz40K0Wji1bV4QUL0aaVBl9wCNgbcAmO+spfKBpQo/GdGAudqCNqZQAm342X3ogeR5yr80L7N5KEVt4mqW3toPY3LsmHsTQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 15:40:03 +0200
Message-Id: <DLYNCSBJ3FOE.IQ4BMB5FFYGL@amd.com>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] xen/arm: Sanity test specified domain's memory for
 being a multiple of a page size
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Michal Orzel" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20261007124813.177940-1-michal.orzel@amd.com>
In-Reply-To: <20261007124813.177940-1-michal.orzel@amd.com>
X-ClientProxiedBy: MR1P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::16) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a58ec7-13f2-46a4-ec66-08df24787ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Uv4E4TTxDT6gf8xIyP44hgVKEcFqcVpoY7By4RUEkE3bPooOTCp/9Qjjj71vrnjcqJnqovc9grju86jqh9dv6BpJ24DTX9dJmPPVPHobZSMPLNIPj8BYqkqtqeHvv4teKImauAn9q2of/zxPnkh1dEFOlLYi48RRrUKh41fgnjLmfp+zSI2HP9Y8SP3glsA0l+MMpvAMSmcejHS0BMNud5zS2zgMmd0U8IGIwFIKSuJEEMPOxM+l67oPmGBJyB+XCLtIixAuq2hVZECyOzmtJzGDrm3kwBKxWWYX3SQmtHP3fHg/WMPi6Ky4qTd/ZE3cdzP7dmaBeOA/qYT/c5uS78CAB2DY+pV/W+yhEvAb0gNdPG1mUZ9U4sEhS2fK9tO4wPFsoG2/dJsBjtTJWQJQ+/aX7OhNdx6U3ZqaU7BJC6yYWIYkkZUxcttt7mIEJoTIOyPC4DiroJfsvoB35qyaJ2qGrlA+Mg+HzyyDPiOO3you876qxOYx0VubK7zRgAZFFbKbMW7xMC8TTqNG+R25Wo5SPSrimzT8eR1C3xTqoizCVYWNrymwvv53oCLPIkj8nve1MQlwZws27V4ionDWYBD9oTVeqNKEIZlu5gjrEZce1PoNMHXI8GcAxvp+IE1isyz5i+ISpdiivqNYCJqbXM68FePvt9llF1kw6SDn/Aw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cERkak5NTEoyUG1uZlE3OGJiRUxlMDdodUFDdVhKb0hQcy9JSGhKaTIvR0Rh?=
 =?utf-8?B?eTJlelZJMEordTZ5VyszYVNtWWhzTHg3UUYxaHY0dGhWcENvR0l3NEVtSlNq?=
 =?utf-8?B?alJKVVpjU2VlQUJxcUtqWEtyS2tab01WT3JDWlBNNmFQVmJuUVV5V2tkS1Jy?=
 =?utf-8?B?OXhrQXNORmlobmtDN0pLSWZ2dk9QQkgrZjV4OG1UWjc5RjRKdGJlOFEyR01B?=
 =?utf-8?B?RCtqMUNnelNQOTNTVEk0RFhadkpqdmhObUE0akJLdFZXTTRWUk43eTd1STJC?=
 =?utf-8?B?ZTRxaUh6cXllV29xZEE1VGZMbjdtUzFvejdGaHlmdDduZnFwTzVrNkxDYk5k?=
 =?utf-8?B?T0JzekhZc3lHeUwrR2RFQThIRCtGZVhlYnNMcEZIM3d6blBhN0x3UEFOdHRM?=
 =?utf-8?B?S2h3SE82ZkdHbzJTbGRTQk41UUs1RytwdTc5UlJYZDNscjNaY2R0Mno4ZG5l?=
 =?utf-8?B?NTZTYW11RkhKcVRjYmdraDN2L3lDWHE5UCtkNGRNUVJ0L3VUaHQ4NGpDSFNt?=
 =?utf-8?B?aGdjS1h0Q2I1U1pGbmQ1N2ZSUXowOWpJa09objZBYzdzeXk3L3V5cGErWFRZ?=
 =?utf-8?B?VWhyd1k2dnB1My9hcldrMWM2MmN0MU9sV2lXOGM5Ujc5ellrQnRhYTlXdC91?=
 =?utf-8?B?d0dzeHpTVnlqeXV0aEpoY0JnL1BldUQ4VEZlRFhKeE9TMkl1WEpGSjBTNjlx?=
 =?utf-8?B?clNJTERpRXIzYVRCVFBkWUxRM1NMYjZhTnpNUkpqN1Rjd2dXSlhGQVArVnIx?=
 =?utf-8?B?WUd0Ky8wUFZGQUh3ODZndEd4am9HV016UTIySyswZkFhZ3EreVhBeXBDM1Zx?=
 =?utf-8?B?ay8rMXMyQ0xPTURXK1FaelRudk0zUUZWNDlESGEralJPNWZSMk5JYXV3NVk1?=
 =?utf-8?B?Q3J4TkpUM2U0bFlacE04Q1JFRFJaWjRQSTZrWjNici9WQ1Q2Ujg4d3Z5UW5n?=
 =?utf-8?B?ckxDRzR5dXhrTlBVSlRzNEgvWUpUNFIvQjB6WElRREVwdmluZDcwd25GMlk4?=
 =?utf-8?B?MStFbDVmYlBYTHZlQ1dCQ1Q5SExkM0k5MnRqd1h6YUR5MUVGdGNjWWF1RFNW?=
 =?utf-8?B?Yy9GL1Q5alpuUGNISmhMQVZXaHpXUHZUckZXaTFwSnNOdGlDRHU0WDlodlMw?=
 =?utf-8?B?VnpoYmJSTXlpMHJFdkYxSWpsWjlLeUdzaUJwQy9lc2k4TmdWK3dYdDFEb0U1?=
 =?utf-8?B?UGlyZWF6QjNRSkVweGRJakdYZzlobXlQbWw5b3FZU1RyOW4xb0pQbzRkaFRF?=
 =?utf-8?B?TGVCandSaS9zYUpxWUZhQkpHUGdCTDZsaFZDZFc5SE9lR1VQVjFpaHVmVTVN?=
 =?utf-8?B?RkwrVkJhcC83eFdvU3EzY2pSd2tyaHdLUkJHVXZSVi9VK29rbmwrNUlpVEQv?=
 =?utf-8?B?T1A5Szlkd1dvQUc1QXl3TmhtWFpLVWI1VkI4elg3SFlBNW4xLzdKZG51MU5s?=
 =?utf-8?B?YmRBSmsyQ0swZDJ0cWNKU096KzFmcTM2WkpsTE5RbTVhTHZoWCtHVDBSTEFy?=
 =?utf-8?B?V3BReUNVWnBEaThFQ1B3ZjN5VXRLU3oxYzMvNzc3aExIVlc5NXNJMlIvOUw4?=
 =?utf-8?B?SmZYd0tYZTdJdXFkWXMvRWpmZXp6OUxiakZSODErYS83dkhTdjllUHJKMEtO?=
 =?utf-8?B?bWl6Ny93WTVaYTVBNGZDYnh4UmtrN1lFRDF3Q1BCRDAvWUlMaXhZcmhmTEpD?=
 =?utf-8?B?ZkxXcEQxbXEvRFNsNHN1YS8rTzNVQ1V5S3FkRHVTWkNrTFlJZzBCVVNjQ0dS?=
 =?utf-8?B?V3pOSEtqRk5LQkhGZDFzM2hLUEd4VnJWNE4yNU84SFVndTdJTFVFY3RzSllh?=
 =?utf-8?B?OEZVam5aL1JTRWNwTFhiNjA3MG53MklqajgyZnJZSTNNdmVvRlZPZ2VwM0Js?=
 =?utf-8?B?ZjJ1a0xsejZINitIeHhXREVOT01sckRhSldtcFRrYS8zKzJxc3FSL2tsNzJq?=
 =?utf-8?B?TWx0Q1ZWQ2ZYQ2FyNEZ6OVVmTGsxYWp2WElBTkRlcmdEZjliUjE0bUV1emhD?=
 =?utf-8?B?cnBSWEltbitlZDlSUXEvWUF1dmJMTThJdWlSSTAyQnhJdWpVRDNEOTJqS3RF?=
 =?utf-8?B?M2dreUdWenN3b1BwVUN5N3R4UFpNbHdreDV5WGRUbUJXSE1nQVVySWszNVp3?=
 =?utf-8?B?Yi9TUk1HZmxHOVFTdWhpUnZVTDRPa0ZlQkpRZlN6bHIyMmNyV1hxWmJIZllE?=
 =?utf-8?B?ZVZSaE1DUUpuSWJYVHRvMTh0eGRBZnVvZHc3T2VCZkpZR1ZaZFowMjlsRzFQ?=
 =?utf-8?B?eEFZN1BLNEtZZnVHQmJLWjVSamdDcTc0M1Y5SlFjZTkzdWpTWXJHYVFhT0Zq?=
 =?utf-8?B?RUlET3ZQV05ZazhpNnFWUU8rN0hrUXQxeXBsYUJJMlExQjh2U0QrUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a58ec7-13f2-46a4-ec66-08df24787ff4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:40:07.3624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjjYCTqFeG7zbfFVCorPRPkzY2TnkpAJUZY+ku8faFIOMRI3+BCnI3tzqPE/DPOJ14o0ZUBpldFK7ckf/wF4/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121
X-purgate-ID: tlsNG-ebf023/1791380414-510DDB50-8F1CCF12/0/0
X-purgate-type: clean
X-purgate-size: 4337

On Wed Oct 7, 2026 at 2:48 PM CEST, Michal Orzel wrote:
> We require memory to allocate for a domain as RAM to be a multiple of a
> page size. However, we neither document this nor sanity test. Specifying
> memory size that does not conform to this requirement fails the domain
> memory allocation in the non-obvious way that is difficult to parse for
> the user (printing over-allocation messages followed by the panic that Xe=
n
> could not allocate the requested amount of memory).
>
> While there, fix indentation from tabs to spaces for "memory" parameter i=
n
> booting.txt.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  docs/misc/arm/device-tree/booting.txt   | 4 ++--
>  docs/misc/xen-command-line.pandoc       | 5 +++--
>  xen/arch/arm/domain_build.c             | 6 ++++++
>  xen/common/device-tree/dom0less-build.c | 7 +++++++
>  4 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index bcb06bc796bf..7dfac2062a37 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -155,8 +155,8 @@ with the following properties:
> =20
>  - memory
> =20
> -	A 64-bit integer specifying the amount of kilobytes of RAM to
> -    allocate to the guest.
> +    A 64-bit integer specifying the amount of kilobytes of RAM to
> +    allocate to the guest. Must be a multiple of 4KB (the page size).

nit: s/KB/KiB

But page size isn't always 4KiB on all ports. PowerPC has 64KiB pages.
IMO, 4KB shouldn't be here or elsewhere in documentation.

> =20
>  - cpus
> =20
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index ea0e3368b1d6..d49db353d8a8 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1020,8 +1020,9 @@ and architecture-specific domain limits.
>  > `=3D <size>`
> =20
>  Set the amount of memory for the initial domain (dom0). It must be
> -greater than zero. This parameter is required (and only used) when the i=
nitial
> -domain is not described in the Device-Tree.
> +greater than zero and a multiple of the page size (4KB). This parameter =
is
> +required (and only used) when the initial domain is not described in the
> +Device-Tree.

Same 4KB remark.

> =20
>  ### dom0_mem (x86)
>  > `=3D List of ( min:<sz> | max:<sz> | <sz> )`
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 72d531618045..bc3d1ebad1c4 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1881,6 +1881,12 @@ static int __init construct_dom0(struct domain *d)
>          warning_add("PLEASE SPECIFY dom0_mem PARAMETER - USING 512M FOR =
NOW\n");
>          dom0_mem =3D MB(512);
>      }
> +    else if ( dom0_mem % PAGE_SIZE )
> +    {
> +        printk("%pd: specified dom0_mem (%"PRIu64"B) is not a multiple o=
f a page size\n",
> +               d, dom0_mem);
> +        return -EINVAL;
> +    }

nit: XENLOG_WARNING?

Also, is this is meant to be self-healing? If so the return should just be:

    dom0_mem =3D round_pgdown(dom0_mem);

and continue. And if it isn't meant to be self-healing, why not just panic(=
)?

> =20
>      d->max_pages =3D dom0_mem >> PAGE_SHIFT;
> =20
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index fcbeb8adbd73..b3f24e5d555f 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -789,6 +789,13 @@ static int __init construct_domU(struct kernel_info =
*kinfo,
>      }
>      kinfo->unassigned_mem =3D (paddr_t)mem * SZ_1K;
> =20
> +    if ( kinfo->unassigned_mem % PAGE_SIZE )
> +    {
> +        printk("%pd: specified \"memory\" (%"PRIu64"KB) is not a multipl=
e of a page size\n",

Seeing how PowerPC has 64KiB it might be prudent to print PAGE_SIZE to
avoid surprises later.

Same remark about panic() vs self-healing (either is fine. It's this
middle ground that looks off).

> +               d, mem);
> +        return -EINVAL;
> +    }
> +
>      rc =3D domain_p2m_set_allocation(d, mem, node);
>      if ( rc !=3D 0 )
>          return rc;

Cheers,
Alejandro

