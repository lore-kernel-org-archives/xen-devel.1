Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447FFCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 12:40:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442298.1659872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQwg-0002OG-Of; Wed, 07 Oct 2026 12:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442298.1659872; Wed, 07 Oct 2026 12:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQwg-0002O9-Lj; Wed, 07 Oct 2026 12:40:30 +0000
Received: by outflank-mailman (input) for mailman id 1442298;
 Wed, 07 Oct 2026 12:40:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xEQwe-0002O2-QL
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 12:40:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEQwd-00FNLK-Mj
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:40:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac63dae-e002-0a2a0a5209dd-0a2a4507c808-36
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:40:27 +0200
Received: from [52.101.201.18]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac63db9-b4ea-0a2a45070019-3465c912c10c-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:40:27 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 12:40:22 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 12:40:22 +0000
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
 b=te5tjDTC11RLqkQjQTzPZjTXXzPOioZFK1+H2wMAoXoIQC234cVm9YfIFDgsuZcUdQU14EFRHdr1o9sJ/IWaOCgZR1lLCkIesRa1LMoYCYha/wpSbOvZB/IgQ4CZ4G/tAI/deVO65VH9cQsPiS9tpOczM2kb9IyQ5PE8BhGaY5V6L52j99q6s2N6fdSl5fuwPbBZ40UBakPvWEMQbclRCxKmAqX/TbfKr+TERDbUTF83Nt8qZdZeGSatEJ3+x6n//IwXB0upehYevHGGjJ/VLywnlDCYNr+VaGcYOkvSJg8UsFXswy0wJ7VYQdiUIgYB2I5d3AU8E4+jySeZSZ13tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmh3QbpAof4Mqz4sBwWiSL+74rmVYal5ceFU8kCv9SQ=;
 b=yRDay9qKvIOn+T7s+pgM20x9Se9XXk5vrjyWuNwjkhEZIY2rWJR8BtFAyoBNH2ifLvUBt1Rs7aYQY6F0w4udHhinJP5P8oGI169RJK0oWxsQ4cpyYls2iZszd2a2adIcUIWrHsOaO7sohprTY3/gV65RlFRWe/0tPYX3bbcxk1mUiW/3NCE719rY3w5yz/DgS7WdCS3yofgt+7xjuYgOdPzqyWjhlQLOCYTHSWMwlLYqi+6lLqwvOad/2NKYQpl63AykdLneGj+/DV89tm7exG13/vZ1x3ED+cUo61wwnl6RxApEp74BeBkiIg1I6aTLbcLdi4PviOnfwrwUtzEv+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmh3QbpAof4Mqz4sBwWiSL+74rmVYal5ceFU8kCv9SQ=;
 b=owx8Kl0BSLVYX/GoN8Tg8IjYs7AwYSxHY5vmsUDPWHJ7/NDEqL8AdRau2dJN765ymhxSbqce7l+DWXzXzlM5jSYveTfgGf7kx77xR/gDk4scd4foSgWquRUou++YcqkQaWi1004xqcJFs4qDbd7jFVWPvpmgVs07QVC+J80jXQs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 14:40:19 +0200
Message-Id: <DLYM31YWEEKZ.QU4KXZVM8GCO@amd.com>
Subject: Re: [PATCH] arm/nospec: Make nospec helpers always_inline
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
X-Mailer: aerc 0.17.0
References: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
 <f9c2cb00-e334-4dab-a173-4cbffff18d94@amd.com>
 <DLXR8CB96NCX.1ZRUEBZZG88GC@amd.com>
 <311e02a0-8935-464c-bfa1-ec4e6aa23462@amd.com>
In-Reply-To: <311e02a0-8935-464c-bfa1-ec4e6aa23462@amd.com>
X-ClientProxiedBy: MA3P292CA0018.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::19) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a686b4-32c2-41a6-6296-08df24702766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	A7uTUwZVhYUyRGt0UhKh1rrUmx7Yb1XBM7FDvRmwaIj/RAs3d6JlZ4usMVeW7lsApWyC+qoKffPcWHF+ZFG0bSC0wJ3J7LfJLgTTUndLKK3G85EqvNrVHetGCSLhRU8VUsG6DrGWAciIs04iCKFdtveKmQBmB1BZ08Ve56aE9h/9swADiULZf1C1sFXpNruFKhi6+rDyxI5fVoaKMd6Y0lrWjqqOOu6G6vVorAlUoszUp+39QHLo+rbFK2Mc2Y2KWqQxqXtYrB35Src9nt21R8zs499/+6TpSAYN+P1N6Fjq3ET7+CsHYhiYCl79IiwYhN180PFoxYDSNk2/p1NJWq6IyxRq9IA5MnJjKU2V2Zp14jAniwRFbRO5Wv8NgY8koR6/75g6CZ4a5d3j0jM+uGRHASoWR+Tq7u+an97SiQshX9UYZNP1isW5yYaZpfOxofg1vB3WDrsKF2M28z5AXoP+aKWKPkGEmLB7rEtB4vuuvM3JlMRdZ0lrtOIUyQi3FOOEoz1bgUNbk/jOVumqZllNCha8iu17z9yN/ErzFapbuhov3FWBym5mGsTLK9m/XwpmpG5qFFQinnFRoDd7lsYe1d/MJOJE3D5YqWvuLLeCk44oI2F/L2uA3wmwimBA5oBiN3pZFSNxMFNBsQqPyT4Aaesg4pLwdCCxx2yIaL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1JzL2JvMHIxdjcza0QrTER1Z1FNMGs3VDdrSkV5d3l2UGt6dFdYMHdyLzd0?=
 =?utf-8?B?YWxQNVJpYU5wazltc25wamJ2eGNxZ2RuSXZhQitqNG9XZ2lhdXFuUmtMblQ4?=
 =?utf-8?B?REhQQ0VjZ2pFaGpmODJHT3lFS1dXUUNIUEkvLzRoU0kwdHByNElKMVUxT3FV?=
 =?utf-8?B?Ui9hV0oxd1BRWml5cnNJNmlrY1duRTQvTkxnWDcyTFJSZE1pV3VBck9FblNS?=
 =?utf-8?B?a2ZNeUdxUHl3eTdUUUJWaWlkeUkxaXdrQXdmZWJ5Tytha1lmUTI1YVdobk11?=
 =?utf-8?B?Tk0xV0ZvLzB4cER1RG5zei9PWEdEYXBTcGVmMDJvUmJqT1pJRHE4bkVjalQv?=
 =?utf-8?B?ZWhua1RHbUJNNHlFcllBUU43Zk96Y1lZTzVKUVpFdXZNejcrNWIzTCtqOEtp?=
 =?utf-8?B?OXVaV0s4eStHc0FNVGtUTXYwSnVWcFVyL3puV0loUEJkM3ZoSFE3WUNhMG1t?=
 =?utf-8?B?d1BmTkdLMkJTRGF1ekJ6S1U0T1dFWGRXdGlXMkJDRlUxMGZSU1FwNEd6TGxZ?=
 =?utf-8?B?bGZWOUxGa2NvVkcwSjQ5SnUxN1JITjRZT3cyYWE0dDFWb3daN2UxdzVqYmpz?=
 =?utf-8?B?eFNCOWVKRERKYXVxZWpHVXAwdVNYZTFLckJPZ1h6K254SG1ZRGE0R3B6SnQw?=
 =?utf-8?B?QlUza3IyQlZFWGJPNnBzekZ4eG43dVU1YWlWUWRTZ2EzNy9YRXN5eFBPU2RF?=
 =?utf-8?B?YnhYYU9FMjUzTTdDMCt1YXRXMytCZDNyVmNCL0l2V0o4WHlUK3VkL0YyenVw?=
 =?utf-8?B?UU9PTXdFcW5wb3hPM0FjdWlGYjltbmFsS1Z3OFJlYVpkdzVkbERzQ21Sd0Rt?=
 =?utf-8?B?V0FldlBzbEVyQWtWQzkySzFiMGpkMzZ5UUxaZkpuc2JROUIzZFNidS9qci9o?=
 =?utf-8?B?eFFyVVdwb2pidUFFOVF4QWZPOWw0RzE3MUlob0FGTndGdzVYd2QrR3NmaUFL?=
 =?utf-8?B?ZE9zaCs5RnMrMWdpLzlydGdkVUxTRkFBR3lrQkN2cE5tb0FwZDZMcGRZSjJF?=
 =?utf-8?B?K2tSOEsxOGxzWW1zcGNmRWxSLytKZmFlM2JQOS9kZzFkN1pTbGRjUm1rM2pa?=
 =?utf-8?B?NnJ1Wi81MkExc0lxUitVN21RV0hKYTk1cmpKSVVjclMrMTB0bDcwc0htcTha?=
 =?utf-8?B?aXVXRUtraVlxQnpMc1RvbjVsT0hiSG45bFk0SGRkV3hkdGpleVI2RWtIMm93?=
 =?utf-8?B?RlgrS2ptYnFyODdvQ1EwOERnbmpSMWovelhOZTVqdUJBNmhDNndwVHBxYnBj?=
 =?utf-8?B?RTRBM21zY0tiNWRCSHdJOTBES2RLM29Id0dmMG1WYStYN0M1bU9wSEFPWkhF?=
 =?utf-8?B?UGJrOHNVc1ZwRVlZVWFleEpZUkduOXVBamFucnJuMkw1U2JTdnExODVKeTlR?=
 =?utf-8?B?NUUzRHk3SWVCMjBjVTh5RlpyMWpMVWZDQ0NrOWJ2UGRMQnBaVzFkOFIvM1Ri?=
 =?utf-8?B?OXM4NGl6aEFRQncwVitFREU2TnRtMkExZHlvSkpJdnd0czVYLzlKcEQ0K1FT?=
 =?utf-8?B?SGVGemlqV3VRaW04czZhcWxSeDY2SitqVmxJMFZoQWRlcFczUnhydlpnalVi?=
 =?utf-8?B?ZytjS3BGK3dhZ2M1MGhMdXRQbm1VQi9RZThKWVlRU0FhbTcwcUM4MjZhKzZ3?=
 =?utf-8?B?M29oM292RldvVGZKaXlBRitQYmFSM1E3dWF5akpDTERJMEI1YTZJMXM5Z244?=
 =?utf-8?B?VmM1bmo1c0wyRDAwempCc2NidDIwMDdkbExWdFBycDl5RGlFRy9PUGoxNjJu?=
 =?utf-8?B?Z281WEo0Y3dLeGxERmJxVXV2SDFtVnphcExrY1JibnNPL2JWS1Z2OHpJTEZH?=
 =?utf-8?B?empiUUxEbFlqTTc1L1V5dHNMRmtuOE1kNDkxRmtUYklFT1c5ZGJ5Uk9sdnBz?=
 =?utf-8?B?bTZSQ0lvMm5nTlltUnFETmovOGM3aFhaK3NHVnA1YmQwdFAzTjkxbE1ObVhx?=
 =?utf-8?B?cVI4dCtLV3BwWnN2Zy9pdE5teC9tSllIek43OGxpcXIxb1luM1AxRmdpSG5a?=
 =?utf-8?B?RlV5emRCeWJlNi9mMDBzRy9lRDc1aEVmSlFvZE0yYXZlNnNmZ29xSVVIVWNy?=
 =?utf-8?B?bEFSZWh3VTF6KzJyUEhoMFIxNThjZjZkbmZJWittSEw5Q1Qwb3dhMmRRL3Fy?=
 =?utf-8?B?dmVxVnpuMmJzNW9XS0RhM1ZSOW9qTkx5ek1iTzZpdnpvUWR4c3ZkVmRJaHQv?=
 =?utf-8?B?K1o3Q3ZzWFhUQ1VHRERERlBROW1HU0NtenpaZHpHTW4zczZQMnltZk9QUXkz?=
 =?utf-8?B?Y3phbmhxUHc1VEFwTGoxa1BBNXpISHljQ0k0UUtZakJKRnZaYW13Q0lpVDFv?=
 =?utf-8?B?NWYvMFBYVGU2ZGM0LzA3a294SWNkZStzTmc5bGRQK0MwZ3o5SVMwdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a686b4-32c2-41a6-6296-08df24702766
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:40:22.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVeRwnubDLI/2vZKRESdYO+mTrKG2AX+8G0dpsDwvNQ2w3o0SKV/y+aIbPsJPRYVSSODPqTBZ1Grh+l7j9aRCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
X-purgate-ID: tlsNG-ef75cf/1791376827-A5AC0AE4-F9C648FC/0/0
X-purgate-type: clean
X-purgate-size: 1223

On Wed Oct 7, 2026 at 2:00 PM CEST, Orzel, Michal wrote:
>
>
> On 06-Oct-26 14:29, Alejandro Vallejo wrote:
> > On Tue Oct 6, 2026 at 12:45 PM CEST, Orzel, Michal wrote:
> >>
> >>
> >> On 06-Oct-26 12:31, Alejandro Vallejo wrote:
> >>> While today they don't implement fencing in a way that would block
> >>> speculation, once/if they do they'll absolutely need to be inlined, e=
ven
> >>> if -fno-inline or -fno-early-inlining are passed.
> >>>
> >>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> >>
> >> but this should be done for Arm, RISCV and PPC at once in which case y=
ou can
> >> keep my tag for v2 # for Arm.
> >=20
> > Neither RISCV nor PPC implement nospec.h today. Should I considered the
> > R-by just settled for this patch?
> I'm not sure I understand. You wrote that they don't implement the header
> whereas I can see:
> arch/riscv/include/asm/nospec.h
> arch/ppc/include/asm/nospec.h
> hence my remark to fix all at once.

Bah, I was on a completely different baseline than I should've been.
Even v1 doesn't apply cleanly.

Let me prep a proper v2 then.

Cheers,
Alejandro

>
> ~Michal


