Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DCCC9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 15:57:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434145.1654266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8IH-0001qb-8z; Fri, 25 Sep 2026 15:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434145.1654266; Fri, 25 Sep 2026 15:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8IH-0001qU-69; Fri, 25 Sep 2026 15:57:01 +0000
Received: by outflank-mailman (input) for mailman id 1434145;
 Fri, 25 Sep 2026 15:56:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xA8IF-0001qO-2O
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 15:56:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA8ID-000emf-Qs
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 17:56:57 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab699ab-e002-0a2a0a5209dd-0a2a45018a5a-42
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 17:56:57 +0200
Received: from [40.107.209.1]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab699c8-5984-0a2a45010019-286bd10187d0-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 17:56:57 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH4PPFB4DF67D13.namprd03.prod.outlook.com (2603:10b6:518:1::613)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:56:54 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 15:56:54 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UASHT7UgrtbYFL5uO+8BZoWAx9su039kM1CE1c5fQM7dWIALL6PWAiq3KrMhwPU418OUFzEvJKke9ZFkX1bm7uPfvGGwoMRWd0HxDFw3M8FMZm/d0mj+/E57JlYzwQydB4BwCtTnCTvexXEPH/qj84R59Fm3qgZg33Mt0zKFQLE4JHlBZLmES2LXyWbrUJWd+O5V3mT8Yzwiwk5ejqL34TAN5TDQMKHuj78tIdnsqwuRNFNvzbuZ7Hl4qfQbuOOtH8a/wppmH60E18dNq63sKwQB3dPvvKcSrvlHCT3txr95cKPclApkuh/YglcY5faWoIk1OYDspX3mw5cH6ZSzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IghoUeAQ6lR6+jW3M36ntpibzt/BdExoMnPGm953TLA=;
 b=yDDczON8YsJum4ciNoIGEx3A1q81RX/S1d1fDDK/xWZTJR57+R6EJ/vbNS/tQX0EvJ43ZsK8AHr4IFuOZ9+vj9IIQrRxH+CZDVi48NVQQM9oOiq+rvDXxMzPWkAGbeUhbG6Vjz3avRTnOOCvbP+d9mGaHpMsH8fRCY+iJS85+7iZ9sjBlI8jXjz9VCAVH35uBmgbjZUdYdzqQgaT2Zw9vaVTmCkM/8XZjQcLI1Nj4ffM4CsJ5l3FYXKYdRKLdNraYoHcZkVWbLqac2doHbAj3O2RnNamM2Wu/YDrRa/Ubft8rNCn6cV3iNjnlK1y3I6BbEKdD06x4DdHMTSQkhRqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IghoUeAQ6lR6+jW3M36ntpibzt/BdExoMnPGm953TLA=;
 b=k+x8qJA0nLBOO1BoneFyTlgOcpj3Hm9LxA0cGqgprwxxTMmavf97cXFiIiPmDcJ3CnbE2Y08iw4thxbWLyUx312jgiBM6erMI9oYeKMiMp9ck2WhhXpN5Jn4/g5MPwxXqjqCoqiypdbVRjamC7S5YmrOwOfFEcDxyo2Hq82VTWw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <525eb684-289d-45aa-91a3-b9edbc73c06a@citrix.com>
Date: Fri, 25 Sep 2026 16:56:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EFI: refine cfgfile buffer allocation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <7e332eec-5c5c-4c1b-aeeb-c65e046b1318@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <7e332eec-5c5c-4c1b-aeeb-c65e046b1318@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH4PPFB4DF67D13:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd9b005-741c-47ae-b724-08df1b1d9e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003|17002099007|5023799004;
X-Microsoft-Antispam-Message-Info:
	ApbS5M++WhAHadUnUXj/GDQ50rEDOhbfNUCT3G1PrXT8EcQ6y6BHsFK0STzJ0ignlbxs9O4prXiXDTXw6DpP3j/KWhM/r5L8Xq36mQj4bU8OYTmA2dqsNBImrEZPk6IMUU1sEbSIDDphTVMHVGPQTECg6oRwxIIiHquZJ9eFsjBwiIbF77T4VqaISH88sLaMtI0EXSlieoeDBnUnnUPubq+RmHuMSHAWuPymt2YV4JD2UnZKeS8NxJM1Z/6FXx3bm03Nikz0POqryb8px2Z2tnWHeK0IspZsMSFGitZr2WYVgGIbJ5hF1eHjjsoK5oqLlPMMBD225cftH5Z9ZNI02Po/1dndVfPdxwMtJUtJGdBZ+HX1uw2lkIW+KG7tiesEKScWtxupoSvNkplHUFEpg26/EA1jkIP8DMfxYY5vQa0or5V3MMva1ebR+GGy7YfKBP9PsW9bl6K9Ye5gXwXxC6zyDKnN2cUSq+2gUmkmnQ7nH3iYVtQCcRxfY/xzsSqq431Y+mnceLDgMGliNhnWuDHwLsDe2xGbXMnrIj0VOK2sFDJNyKrC7cLYkdL4AxG6wTc5Vd2hnOZeqElWUKGSloaOHSnrVDqyThYQTVCt61odOxv6dk1BqJl7VqDWotEdYUd+8/u+G0IHtrbTQwXxrp1klk4rSoP2Gqfz5nnDwWE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003)(17002099007)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzdyZ2l1cjByeFRZNmFpazBUUlBoZDJrOWdsZVkxTHE2alc1TzZ0aEN0ODhw?=
 =?utf-8?B?L05WaFdYbFQvRk04VHNuZDYwL0VWTWVIUnNTelhoRjBkVjFaajhaTkpOM1ha?=
 =?utf-8?B?SnhRa1JyVzJVQ3ZhRDJpNjIxN1daSXk0MllDRHdhUFJBRkpoZnYrZGl5Wlg1?=
 =?utf-8?B?MTNUbS90OUlzWGJkSkhmelpMbWE0cElDcFJIOGc2RXo4Wkd6ZWh3TDJnTUtI?=
 =?utf-8?B?eitqU2xPdG92ZFJ3L1I0cno4Rjdub2wwOXZNMjM2VHVhMitra0UwK042aXFM?=
 =?utf-8?B?ekp1Z2pMU2VvRks5NEhVQURHV1VJUjhZTEhNdEtXMGdKdEJOd3JVcFJuazRn?=
 =?utf-8?B?UzlUeTdRWjR4K2o3SHJzSk9wQkhOWkxVSnBaOWhUV1gvbXZ0YXN5WTI2QUxX?=
 =?utf-8?B?VWJkQm1Oc0haVzZUV0F2WENUbFQrVzEvaHI0NFFlZUVNYUxxRk9iNWhrQmxx?=
 =?utf-8?B?YXN0QmdFVGJqMHZxTGQwVjl2RUpETnRaMEFaUHZ4d3NvTVBUekZxUFdENGtT?=
 =?utf-8?B?YW5aY0Q3STI1SFlhTDJnNGVzZnprcGltVGcwSWlYc3Z2dUJFRU5KZkVZYzg0?=
 =?utf-8?B?LzZXWm4xcHlHMUpFdG9RTndRMGtkdTlPazBBZlpCSlRDK0wyY2laWWZ5UHNY?=
 =?utf-8?B?LzNtc1U1a0I3M20xYXAyTVhLRlBpU3NJeVVZQk5PYkNDemRsVkZ6M2dtQWtG?=
 =?utf-8?B?YWg3bGtSeU9ZNjZFVDNpSWdMbHdnK3RYTTVSK1lTbko2NHVJRkRGS2UwWU9T?=
 =?utf-8?B?NkpISzNuSXgvODBlbmpwV0M1T0llalQzWGRZY1dzUDJPYjJnOFI2M1lGdkY5?=
 =?utf-8?B?VVYyaytwZit3dzBrY3JOTlZ3V0xyTUI1UTRsNzFFZE9DU0ppcndGUThMZXJ0?=
 =?utf-8?B?WTVnVWczMzBIWkVDWXQwTGVuZ0M5WmtnUlVxTklPNDFjMFRKTFFYWHVGaEtE?=
 =?utf-8?B?VTNwTGhPcS90MS93MEY5c0VXUGh0NnIvUHY0R2x4ZmVJZzYxWG5jaGozMXlJ?=
 =?utf-8?B?K0Y1WHRtelJMUnZRQVp1YnRiV1laYVpsazRrdnFGenl2UWdvK0JNSU1FWXZ1?=
 =?utf-8?B?QS82WmNrMDIyZGZFSVFTdHg1ckFnNFh6eVM4eTBlN252V0JNd0lmS0plTVpG?=
 =?utf-8?B?d3lCdVFpK3djQU5HTlZHVWtETEdhdTZWeGtVeVBDV1dETTBaRDlIREZXdUN3?=
 =?utf-8?B?Z0FFWFRYTXdidEJVZTBWODcvd2hmQzFkV29QUURJMGhGZnAxaHRIdldQdG4x?=
 =?utf-8?B?Nk45bjFKQjRBU2tvbXJBdGdQOVJhMWhYTlVwK3dic2Jxc095MlJuLzdKSFo0?=
 =?utf-8?B?WEd5c2d2b0dWWUhTUzBSenE4Y0FlV1Q0Q0JyNitqOUxGMDhkb0xwS0xOSHNP?=
 =?utf-8?B?aWxKY3FlL0txRmpGWldXbm1BV1VqVXlvM3VNWWVwK0JIdjd3OTRuUTVDT3h6?=
 =?utf-8?B?dlV3R3VobStuNHZiVE1yT2YwbC85czhNb2RQOHBhaDF6SmVFMXB4YUFUQUM3?=
 =?utf-8?B?eG12WEUyZDFwRU1GUVJtaEVoQ2E3Y25jajRSUVNQL3JKTkJRUVNodU9OQ0tG?=
 =?utf-8?B?dk1IWFpwdlo3NjRNeXlwcDJ0SFZkSk81M1kxNkdsZGtjWHpWSFVsajhRMWF5?=
 =?utf-8?B?b056b0xPa1lIYVJJNGN1M05hNGJ5RjdRbm9JKzlDLzJXNGw5UFZOank5NkVu?=
 =?utf-8?B?aHR2L3luU1FZUE9pdW5qNzFVRDdEV1pya1FkMEdiMU42eE1Mem1Ed0hlNWFn?=
 =?utf-8?B?aUFwRnZ5ZFdKMVF4ckxTcUZoWkJza3UvL2lQS3NJbFFhTGRQVFE4dnI2a0hL?=
 =?utf-8?B?bGxJdjRETGFDQXRTRkhTbk9ZQXJ3dTNybzBNdkJRVWhhbCszZ3BuTjJOQUgz?=
 =?utf-8?B?Vk5UOG5NWlFXek1yeXhNWWRqK1NINWlnU3VoMHR6TTJ4eEtPajRTcVlXN2VC?=
 =?utf-8?B?THVnUndZbXJ6ZXhmR2ovem82SXpiNS9GcGt1aHVrL0NNUkFmMWRKQkJKeEI4?=
 =?utf-8?B?SjFuRi93ejR0R2pLeEE3N01tUmttcjRhbmRGT2JFcmRHditlWVhkZUlwajNy?=
 =?utf-8?B?dUpBVHd0UlpoNW1saXdVTjk4d0hrMzFyV0RsRFJ5eXExWGN0R2hxdXhhUEFM?=
 =?utf-8?B?MkFqMW9Vbmo0SkhMVjhsUUtCaXkyMU1GT2M4Z3h5R1JiWlZZK0p5Qno2NXBm?=
 =?utf-8?B?ZmhuYXV3VUszMVoycnM5OCtpZ3Nvc2VpM2xkMkEzRW5nV2VnaTBjeE04d29S?=
 =?utf-8?B?NjViSmpXUUh3b1BEK2U3M1NhTXk2M2thNGY2Y0l1YUN5L0xhbUt0UDN5ZkVh?=
 =?utf-8?B?LzdtWU90L3lSZHdKUkNSY3pza1p3NTZWNWlleHFLVHF3cGFKbXcvdnFudnF4?=
 =?utf-8?Q?Vr+1/HgGeB/pOxEo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd9b005-741c-47ae-b724-08df1b1d9e9c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:56:54.0649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxsbBnYPU9IbL6QiPudHIRdKjt6Gxidn4l/el9faZ9rUNC75023zYccQzKTmYzDIqUQzEUvD1Ml0PujfN19guMN103tX/f92Ov5NPsSHNDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH4PPFB4DF67D13
X-purgate-ID: tlsNG-d62444/1790351817-BD341757-C657129E/0/0
X-purgate-type: clean
X-purgate-size: 1412

On 9/21/26 10:09 AM, Jan Beulich wrote:
> Use of AllocateMaxAddress requires that the variable pointed to by the
> last argument of ->AllocatePages() is initialized. For cfgfile buffers we
> don't need AllocateMaxAddress though, at which point initialization of
> "addr" also isn't necessary anymore.
> 
> Mirror the lack of address constraint also to the main / central buffer
> allocation in read_file().
> 
> Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
> Assisted-by: Sashiko + Opus 5.0
> Reported-by: George Dunlap <dunlapg@umich.edu>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -878,8 +878,13 @@ static bool __init read_file(EFI_FILE_HA
>       what = L"Allocation";
>       file->addr = min(1UL << (32 + PAGE_SHIFT),
>                        HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> -    /* For config files allocate an extra byte to put a NUL there. */
> -    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> +    /*
> +     * For config files allocate an extra byte to put a NUL there.  There's
> +     * also no constraint on addresses for them.
> +     */
> +    ret = efi_bs->AllocatePages(file != &cfg ? AllocateMaxAddress
> +                                             : AllocateAnyPages,

You could avoid the negation here, unless it was intentional?

Ross

