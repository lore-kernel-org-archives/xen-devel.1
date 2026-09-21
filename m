Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA8AC982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 10:34:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427306.1650018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8bLM-00051i-H2; Mon, 21 Sep 2026 10:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427306.1650018; Mon, 21 Sep 2026 10:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8bLM-00051d-Di; Mon, 21 Sep 2026 10:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1427306;
 Mon, 21 Sep 2026 10:33:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x8bLL-00051X-8H
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:33:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8bLK-00C4CP-Cs
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:33:50 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab10803-8faa-0a2a0a5109dd-0a2a45019582-40
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 12:33:50 +0200
Received: from [40.93.194.19]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab1080c-5984-0a2a45010019-285dc213eaa8-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 12:33:49 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:33:44 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:33:44 +0000
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
 b=Wb185xC2RV/lH2iVx6cGcXNmSCc1iwYTXJBJ5YdOioEYGR271Ko57Zw4aMHkefcTlR1dTK9+gLApR/g2Na2lE1DzywhlHexqGQX7iAgi/gZzJ+F4F5LEygReRsiN6EdE3dSU4TW+DU5cxNIdp7AMH3UhI2QgPwSPRgEgz3OuWI+QrOeffTFOq3goH+KPGKM42YuOZb+vGXGby1fV2Cwk8dao7eJOHVZ6UlnBETj0/7Um2+0VT9JMeTjLys8wAkiqOG1rapBMFH1mTIQlAtY3V2NXu8RxrjGSpz1VK1fjAzpJYpgA9BrWzxw5EWIYEpljHdbjcdHI2ns//EXeuib/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUGcZx9JMM0CLlYcat79eCQxbX9srWdY91u4plhDTHs=;
 b=EUkYv1Qaylsk4mJa5usppPLmc6LWCw/nM93V/66ECKmPNSZsnVt3AoaMHNNo3wpdnhPvlB8CZNAy6Tr3+LPWfBylkmk/H+b9MU5ajOo1l46yu/lMi8zfYP0tBvi7No340Bp05ziwbMVSSq7A/EHpULLIMFQhh3Ta0MDfJTDvZYFPC1EkCZzVXRqcvWkpRvTxt9Ai9hGk+tBxEC0p3bSWn8VHxgPV26K3xkHOe4F3ogpVj8tiwCBs8byK5yjSYc4mozUq4B1xFPQI63u2cVylGIL56M4O6O4FdMOgxhpW0jogMj3ZNZBBBtm96wgAW5Hxj5UVuHfGOtdNrwaRNd2A2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUGcZx9JMM0CLlYcat79eCQxbX9srWdY91u4plhDTHs=;
 b=bgS5Wcx1BpqgpmbenQ4VTWtwomRqR+FolFDfwU9dBiYyNIoNgcSZdatBBdQYocZuX/oi1WVabn12hHSpWPKpk9qwW+4cy6vpKmJZNt+qYr2rdJ3Etc4bWJ6XaqS80Ud8qsj1FZiE3ZcUBAEQ53I3/OTxl2ipAmZqM7FeY7o/mEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 12:33:40 +0200
Message-Id: <DLKXDDFXWQHS.3KD2N2G4MYVM1@amd.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, "Teddy Astie" <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/vpmu: Fix incorrect printk format specifiers
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20260921091651.34761-1-alejandro.garciavallejo@amd.com>
 <489f6ce6-2be7-4c94-bcf0-21fc6993f98c@citrix.com>
In-Reply-To: <489f6ce6-2be7-4c94-bcf0-21fc6993f98c@citrix.com>
X-ClientProxiedBy: MA3P292CA0026.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::11) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|DM4PR12MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2c4a2c-1e87-488d-f2ef-08df17cbcf86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	nzbIDUQz1ELFD7R6O+HAJ7jU4Wvp/1besIX4tgpesQPwl7ZagTqH0Phh82kUzgsdINLTogMgTpgSMkZcp7NSGlYAyQMzODaxTAXuequTIQOLP3XsQHAONgWVC7UjNu93HkY7Qme2MFg7n3p9ys4/EiAiDtt7iTpoje3eBRQn45tiAFz5g26mftL5cC0DLf29Xne+9cfParUJiJpAseqeH7S5F1RzGwWa05lx6yPesoE/TT8fwdF6hRoAyComnysw8kGt1HQtqSuww+XSGpCZBmiTH8uyBAFc0Xs89hfe14EGupl3oWwkvm47M4drlYfMsgvWQxdlhGxCfsW0GRTRVxiaOvVNtXI2J2sC9klsAzOufQ2ZiS3mVfOGhe2Iz2P0eEqZkrqfY0OgRdx9Tor5a56w/t6Idx/+o19Ftmty507jvQicg3KX3zgkRtrPn48KOxSvoXB7mgk6aHCuSA8YHO0DCMt+ntQJsbXFmPcU8S+ZMEWNbUO5J3u2G/Rc/T+7T6SQcdD7gKkBulkDKW0iHqrGwxcGqNtXlqwMZ1tVlU3m7/F7Xx6AbrwZ572exsh+Ga+2ctEDzfHTul05Z4iuCjeJsL89203z13sCAXHyu/mHTWlxSf/pHYelR9WXEgBg4xqtO9bEVtm0615s7wiMwBBr5aF+njn6l9LoQiq9AxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFJydG9tRUZ4TzA1MWN2VU5OdVUvSTNkMVVMZy84NU9RN3hObStyTGF2MjJx?=
 =?utf-8?B?amtWSGsrMDRrZU9KSFNXR25Va29nT2xTWjJJcDE5WlFlWlNma1pvNFRQSDBN?=
 =?utf-8?B?NlNxdmpzVkdYNWdkM2JKQTBSMGZQeGFobDF2T1UvaUlqekl4RVJiOUZ5c0Vz?=
 =?utf-8?B?YVRtTlg5RkNuQzVFMWlQWDNrUGJnNTYwTDRndFRyZ3lxa0VpUnJycUZwTnRE?=
 =?utf-8?B?aWJUNG8ramRJVXhtdW5DMlJ2dUlVK3ZiTnFyQzJTaUlSLzVCZGh4SXZiVzhY?=
 =?utf-8?B?M0lCbjNtT1RWUTcrRUlDTE9tamk1NU9tTVhnSUcyUUtld3VwOW53dFR4ek56?=
 =?utf-8?B?ek1rQkcvUmJsclRrcjVoOUN3MGx2a05wRkNyVUh1bVlTUzlZQ2xTNVF6L0xa?=
 =?utf-8?B?bHFLSjEwOGh3UEJaL3BNQXJFYXVOTHo0QnR3WnNyMndCV25GTnBwYW9tNm96?=
 =?utf-8?B?anRRd1dZQTZ6YkJtOUtjZEU5dmZmNk4vby8wNkxkZ0I4V1NESnhjU295c3g2?=
 =?utf-8?B?SVhES2xVVWZUMkhpQXI0RmJUVzV1K1Q2OXlqZVdmekpVMXJLWXJwaEt4QWxz?=
 =?utf-8?B?U0VJNEJkZTZlRDkxZEFNUGtRUmhuVFNpd2tsTmRmZmVCamEvUWY0ZzBoaDkw?=
 =?utf-8?B?Sk9NdG5lV3BpM0x3c2FETTdraEtzVjA2NXNFOStXNklzSEs3YzRtZi8xMndI?=
 =?utf-8?B?NWgzOTA1SHpxSnI1YjZ1a2NWOExuWm9OYW5mQU4zTWkvK2dUVU9IUjlrTWVl?=
 =?utf-8?B?cUlHQy9oSXV1WDMwSTdub2htSnYzOSsremNSa2oreTVHYnQ5ZHFsNlNOQ0Ux?=
 =?utf-8?B?blg4WFA0cThXaVlDdjV2S0dUTEhxMEdhb2tSRlVPMGFGdWpXeGZSTEs4SXVO?=
 =?utf-8?B?NXQxSTgxS0NFUDhVYUZtQUpPWHNwM2FDUTFRRHBLRHFGYVRvbmN2Z0ZHdHYy?=
 =?utf-8?B?OG5taEdsckxWV3hFN2swdHliVFVBRy9rRzVCa0RYZFZHaU1aajF4VmRDK2lW?=
 =?utf-8?B?WHhVcXNtbkI0YVl0VndhbTduWHgrWElPaVlnbmJGQzdEZTFkR1A0bTFOOEpI?=
 =?utf-8?B?U0xJR2pzZ2x0MDRJeGxOblRuWTVaaW9MRmpST1RNckMzQ0ZJd1cvaHAvVWJi?=
 =?utf-8?B?bDY2NThiMTlGWEIvVVpWakI3V2QwaUJWK3NtWkZtdERVdEZub0M1SG9rK0pB?=
 =?utf-8?B?dFBudHhORHRXQkpSWXNVbWI2NHRRMnRwOXVMUVpCdktMNUNINEVRampSeURv?=
 =?utf-8?B?OFJJLzh0WTlrWjBBUy8wMG1RV3Y2QmhEeGN3bWhoaWRZMGtxRGtEZjBKZ1dS?=
 =?utf-8?B?V0hscVl0SHVqZk9uQ0V4SnZwU0JUZFd2VkVMMnhjSE95RDRxeElHNHdjNkZn?=
 =?utf-8?B?MS91azg1b2N3UHNGaW9VMHZSZXUvNDI4c2tkaU9nMjNrWDNCWTlTSnFSM2VL?=
 =?utf-8?B?ei9BMUEwNUZmS1piS2V6bU5UVW9TTFluMy9pMkttVGdBUXRzTjN0azJLZkhY?=
 =?utf-8?B?TkV1VnhHRUxDZlArYi84VTB5RmhDOHplOXdlaTZDRkpqRHhuNW0wQmcxZ3N6?=
 =?utf-8?B?R2tQMFdPSlVEMC9SV01OS3Qzd1dhaWVXQ1psZGpXNDBvRmpzK1F2UjAvQ0Fn?=
 =?utf-8?B?VE9KZE5qdTlFSEQ4NVR3UHd3V3NTeDdnMmgrMExWUGhhUUs4ZmdCM1kvbHRP?=
 =?utf-8?B?R3J6ODNEUXphYzlIS2t5UW1JckZyeDBrVkNBUTdoTWhXUmJldUpCYVhuQnZS?=
 =?utf-8?B?YU9VZnVwVWJNQnBDVmxBS3hCbW5yT0JmcEpYdDd5bzhzaktoSldEdW9qcW54?=
 =?utf-8?B?MWoyclhONXFLM0xsdHdEazd0SFEwc3VycmpWOXprMVdXRE1acTNlNXAyOURh?=
 =?utf-8?B?ZWpYc09FZWRXQmNvcUVzb285VFFoUllBY2N2RVRBaXduUXRzVGdWMEcyNkIr?=
 =?utf-8?B?UTZiOEkrUUxMMjQ1RDA1cGtKdjJHcVRMR0lkV1pFcksvU0NNOHF2V0puRVlC?=
 =?utf-8?B?MGRkbDdLV3BHNlhTcnlzMHlEWElBakhTWG9aODdpRGo5ZXlnQ2x0MkhnMWN2?=
 =?utf-8?B?dHRuajZCbzIvWHRLN2RRQVY2SkYyMEFaWUlQSVZWbHhyOEc3UkJPcko0RzFw?=
 =?utf-8?B?dW5tTkhWWnorcUJCQmZUdjl6STBqRVpOVDBXTjUwcmJNUHgrS1lkTHdteHFH?=
 =?utf-8?B?dGYwakFlV0crbEZlY3FNTzNqTGkydjZtWXlvS3VyMUNaZUsrSi9CY1pPcmdu?=
 =?utf-8?B?MDlrelFRR3Nmem4yT1NBM1RpZkhySEQ2bGExVGZYdkU3dnFGcUtMVjZ0VWN6?=
 =?utf-8?Q?PUvP4JN04kqbzRw1BR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2c4a2c-1e87-488d-f2ef-08df17cbcf86
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:33:43.9381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEY3itFH1ljDxEEaF7rLWcJdURWDleURruZkwqzc2/TPLMIjdZEqmjNPfDDWndaohbfaxd6n7EcyVwoOE8QrkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8476
X-purgate-ID: tlsNG-d62444/1789986830-1FC69757-73E7BD21/0/0
X-purgate-type: clean
X-purgate-size: 781

On Mon Sep 21, 2026 at 11:30 AM CEST, Andrew Cooper wrote:
> On 21/09/2026 10:16 am, Alejandro Vallejo wrote:
> > The patch in Fixes adjusted two vendor variables from uint8_t and plain
> > int to to unsigned int. But they were both used later in printks with
> > the %d specifier rather than %u. Adjust accordingly.
> >
> > Fixes: 39a9a49449d7 ("x86: Remove x86 prefixed names from x86/cpu/ file=
s")
> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>
> If this is going to be a problem, then shouldn't we turn
> -Wformat-signedness on?

I tried that before sending, but that needs a whole new series. Things
are not quite as clean as I'd hope.

>
> For the patch, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks

Alejandro

