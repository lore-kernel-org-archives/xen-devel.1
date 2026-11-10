Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045A4606A320
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Jwx0E7li
Received: from list by lists.xenproject.org with outflank-mailman.1482143.1686035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQpmO-0006Fp-MQ; Tue, 10 Nov 2026 17:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482143.1686035; Tue, 10 Nov 2026 17:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQpmO-0006Fi-IL; Tue, 10 Nov 2026 17:37:08 +0000
Received: by outflank-mailman (input) for mailman id 1482143;
 Tue, 10 Nov 2026 17:37:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xQpmN-0006Fc-BY
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 17:37:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQpmL-001DxY-NW
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 18:37:05 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af35630-e002-0a2a0a5209dd-0a2a450adc7a-44
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 18:37:05 +0100
Received: from [40.107.209.48]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af3563f-f2d2-0a2a450a0019-286bd130befa-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 18:37:05 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CO1PR03MB5857.namprd03.prod.outlook.com (2603:10b6:303:90::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 17:37:01 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 17:37:01 +0000
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
 b=G25j9gLLtnIJGYUF5yUvM8DamaJ8nlrG142Rm8KtY9Ntp400DK4smNod18qPPQL8+JT36QRiGyJ3LxOxNahMQqdplsSzjYCB1HHkfsXEZ12yMX0lNe9BzIqCc2IaYCg2ZoFpx4fk++d6JIMX3NaigVk2sHR5wtXkSGPgXGkdoWfuFHBvFaniX0guFne2eszRaoMZV0zIijsp42F7FlwWYNw1oozlRKxEwHvlxUhWIo0QXd+C2/N+UvR94d3LW/ZsSMkKIXqsgUT59lRsMnSqv1TEqgD+oi8X+XVU2EGZmKNW+uPyoLQsaYVFm9FfCl56jecKkREvIJSmGPbS1GK/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEzt5PLBYKoocXUSBJwvrYheorBJZJhabmHGtVyxvj8=;
 b=B/eHmfuCSV3hdSkXDT5AVLyA8VHPeY+3SS1RRtD1zF7j8dcTOWCu+Y9s59ZZFV3M4sPBDFJz+dlj74myc3WRX+ilHJoTj7QP7duAiCbdAKFQthxqnxAycESI78CWh6TN0Dv9psB4FKORCWQaQA6+/Gd3iDSahEa/ExTaZQXy7WM+UtFHlQ7kPu33jOT6klhB9QJKYgwr9dh5fszqJvpbvjz61Vwf1Q7SkH4euiyTU7VHKNp8vIjto5lr0C+d5GY0jkqLkP9lSNiGfwLijOnveZs/EJOIpKeXgg8FdXjhuaaQv4nwi03dxwSa1ea4lP3cgbMvioJMJH++90X32xn6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEzt5PLBYKoocXUSBJwvrYheorBJZJhabmHGtVyxvj8=;
 b=Jwx0E7liWVpD/x6a7VlryFQafwiqslcfPS3aF9H6fVopw+jYiURhdDzpqehEMnSvJklBBbyyrjdLkhKFklAbdvdBHZQ0CfVYS4cQDUbGsYCU1DnJORbtpw2I5PhDsTsJZTH1Q13ZPx5+kW/d/II88yI6kpix5qNHqP8qGGaPz2M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5c356a03-afad-40be-89f5-36131d8d1b58@citrix.com>
Date: Tue, 10 Nov 2026 17:36:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/hvm: don't let EFLAGS.IF block NMI/#MC due to
 nested state
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261016100058.268266-1-chunjie.zhu@citrix.com>
 <20261110085721.419366-2-chunjie.zhu@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261110085721.419366-2-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0238.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::11) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CO1PR03MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea9f845-f9f1-4621-8dab-08df3f513a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|4143699003|11063799006|5023799004|56012099006|261026140227099003|261102123227099003|261009223027099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	qERVcs2XvUMMyrrFYb18ceO86iHknT2YKY8zF40fDjYjavI7exal1C1CZNiUfkx2BUs6bZRKYDBKLZqJf/cNKIoka8zrya35GhmGUHtYIDbMXWNckhjbzW/KGOioCFoMXQfmrR5ArzL0CBCOpfOxHL3g1OzxEJRtd3RhIqxbeUxJsFThgQBVs9qdf0VA8xPaf3q5c6jhJejPkr6jmHGDqL+J8xw1lkiM+rsHrloKGqpJvJsbnmCut8Beg/zHP8S1F0LbfOEaaUIKYv88sPnjd86PvfEwD4oe7pMCJ8jlrLznB7HWrsjBaVDGuEWAKmRXzICYPDGSyxHkXfcgwP5xdv+CTEWd+VTtw3jrU6FUpdNqOnLmO1tL8Jqhg5TvfpBn9uj70BAn+0hzgUrmPArbUiB2CzOg2slaiDE18XSWzAAF5KtJgobs1yxhAjNOkLegbebG81zj9fTxCGUBMaKDd8RjYPhV2tLnA0lZS5eR8Mjc650BFN+o94CWbyR1JJeIkoqINk2LhIUQBi0TXzODpiwJ+H9d8UzimG3zXSUqNC9YNs0RNHroD/8JeeNa8PtWhpfYWmkf8R5+o3sqnd6FZm4CyKgf4zqtEgO4nolOEQbJdyEJLQmTmlfZsLxzzHyk23E0zXLmmisZEEbZeBPUK1EWAqFgdcyNFjds/PtUkFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004)(56012099006)(261026140227099003)(261102123227099003)(261009223027099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cy93amlPOHBuQ2p4UlJKY1hXMUpmWGM5eWNkMUFWZ2dVNEltZWcySVZXbkxV?=
 =?utf-8?B?eE1KU2FLemRHNlV2NEwvTjE2aGkvcGZxdDE0Nm9Ma0xIdFJ2Y0RORzQzNXow?=
 =?utf-8?B?WnJGVWptMWxnUFArZXlaaUZyNUQxWE5HKzdyUGxLeUNKcUNTam01WE1rb3Y2?=
 =?utf-8?B?UWUvL2tmdTdsdlpFTm8yRlI4K2FUdFpzQU90T2IrbjRxdFF6b0dYQkdzN1c5?=
 =?utf-8?B?TmZ6cTVGRURzVVo4YjBHbWNjVlZSSXZQYUx2ZHJvamNicElQb3IzWEJrOTZm?=
 =?utf-8?B?WjNvWGtNWTV3alRuL1F5RWlzSGkvdjRjcGVxY2FUUkwrS0REckFzRXBCdnRC?=
 =?utf-8?B?ayt4TUpEZmN0N1dBZnV1Vk80QVZiZG85bExBUWs4ZFIxUjluYVpnMk01QnVV?=
 =?utf-8?B?MjE5cE5TZWNlYlZNam5GaHhDMDJDV1VWZGFEL0RHQ0RJZnVuNnB6dlZETDRm?=
 =?utf-8?B?OWF1S0c2RHQvQkdPNnlpN294Umx3L294b3JHeGdabG1LQThOSG8xNHZ0TUtK?=
 =?utf-8?B?RDBhZm1PS0ErK2JDeEVhQzVXQXBGSzRUd05oR2w5MEs1QXFUZ3AxeDBFUHBU?=
 =?utf-8?B?b3BPMEN3NjNzTnVCU2U2YmtISGErdXBHU0tVODdXZkhrV042WkFjWFZZbFNt?=
 =?utf-8?B?SXBvZVZyTHI0RkE3VmEvSzZ0YUl3aDIrd0hiYi9lVEVxUXZ5Qm80ZDFaa0My?=
 =?utf-8?B?TFlLeEpwckxGd2picTBVSytSZWE2a1JIUzdONlE1MlBRMkZvOFIyWHBlQlB5?=
 =?utf-8?B?M2dScS9Jb0tscGtwWHpvaE9PQ1VCanZOelZHNXl0dDl0dHU3Yi9aWnd1S3Aw?=
 =?utf-8?B?TGJvaG1JNXZPalB2eU42YVQ5dmNYZFhwREpDMHI2QndmbUM3YzdYeE8xdG40?=
 =?utf-8?B?VGJobDBhSnpCZXBEM3ZFL1NDYmlpeHdkNXhlS0d0S1pidGlwOExReDFIWEc0?=
 =?utf-8?B?Ym5HTEVRL0FwNzQvL0VUUEEzcWVvZFJRZUVteVBXK1ZnNDhUY3VSNHJOczlR?=
 =?utf-8?B?K2pLRVpzWDI4dmF2WUhRUTg3WTY1bU1XYUFNcENWNGpkcXZBSkhxL3dISVEr?=
 =?utf-8?B?azByc3hXOHZ3Z0E4ZG9jL0tVRG1FZ1ErdkxWRkJkaWlSWHhtUWdDQU4wWmdP?=
 =?utf-8?B?RDBCWE0zM2FxbWd6c090ckYxUFBCQWdrZHI2YWs4QjJyaGdkWHJwR01xcTlw?=
 =?utf-8?B?ZEZFL0srSjh3eXBDdWxHUjZBR3NWZkRMM2Z2TEQ0K1BzS1NYVEUwbmtTc2dU?=
 =?utf-8?B?UFllR3hIeHpmVDFXcnlZejU4QW9PNHZjMnEyeXhMdFhSdW1lcmVlOC95N0ZF?=
 =?utf-8?B?K0UyWjlNMXNzZktlQlR6Q1J1czUxU01tNDMzS3RDQ2ZpTjVUZ0xlWEVBeTlC?=
 =?utf-8?B?ZW1hWGV5N2tWK0pSbFpSTjloMThuU3lweGtSejlIR0FIazFaS1FiaW1jRkE4?=
 =?utf-8?B?SDdLZzBIOGV1QkFpN0tNZnZORHNUNmRTZDljdVM2NEE2Tm9SbWF4UElONWxr?=
 =?utf-8?B?SFVaTlJEcitZVThZSVd6UWlTUndFdW03S2NGKzJUQmdueHZCaWJXWWc1QkNh?=
 =?utf-8?B?QlN2c1NkR05UcG5SSW9jSDlXZVAxeFp0QW1hUlFxTDh0QUxWcGNKUjlKdHhq?=
 =?utf-8?B?U0hYUVA0cmtvWEZuV0FadDkxN3NodEUxOWRZZERWZHYzcFptbitKR21nOW5q?=
 =?utf-8?B?NDdLd21ZMEprMU1sWGs0OGhBd3JNdTh1Vis5MlR0MGFMT1BMS05LS1dXN1Fw?=
 =?utf-8?B?cnpWcEd0UTlqNEc4aWNZc1d1RXhWS0FSVm1QYlU1VHpLTUVFV1hsQktSMFJZ?=
 =?utf-8?B?YVJQa1o5L0RLK3pYV1VtR1Zpbzc5dXlJM2U5MXNoM3NXMEo2QVg1S0taS08w?=
 =?utf-8?B?VWNLVzlNTCtMRXc4TGdBNW9YL2JPU1JsV3F2dmJtUjdXdHphWkFzVGpvRERu?=
 =?utf-8?B?S2x2MUtEZ3RxZS8vLzJCaEZKSTVJMUQ4OWJReVdNV3VUOGpKNGcyWXowQndI?=
 =?utf-8?B?dHRBWnBRUTRTY0lCT1YvaUwyQXpNTUxOb3BTVXZkamZ5VjRtWUZmNFRJcHNT?=
 =?utf-8?B?a1JMRzlMQU1GQXdVSHF3VDJ3WjdvY2xyWFAvQ0p2Nm9STkFLZjc1ZHlRbzFB?=
 =?utf-8?B?em9wR2RUS3Fabm82cHdoYUUrdk1vTXZSZjBTeWJiNWx2VDlVZURMT3Npc3ls?=
 =?utf-8?B?Q21vdzhWWFgxYkRlVTVuV2Y4V1pCdm0yMXZWSldVbk9FUHlaY0JtMlFzMFJM?=
 =?utf-8?B?SFViL0NRNlppdWd1U05CbkZJMG1YMHBhK2lWMnBPWHJZS1A4MndjS3ViWExW?=
 =?utf-8?B?bk9wcHVCTUx2RzYzUlZuYXFqUGxYVHlrTEtUR2NZR1VteUx5cUFVdGxNME5i?=
 =?utf-8?Q?lf9X/0WXU5570/9Y=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea9f845-f9f1-4621-8dab-08df3f513a04
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 17:37:00.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ud22Lt+IK/Ea+cvghUMjsVmmrT8xMMJ6YSn21Pa7VPwP27V+iIy8hMkdR7ZnTP2g9ajugcXv70r1OlJJ2f7ck47YeZRT3B6kszd34JFmXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5857
X-purgate-ID: tlsNG-4011c0/1794332225-593C4CFC-7E74F7F5/0/0
X-purgate-type: clean
X-purgate-size: 4613
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 8:57 AM, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> nhvm_interrupt_blocked() reports why an interrupt is blocked, but both
> callers, nestedsvm_vcpu_interrupt() and hvm_interrupt_blocked(), treat any
> reason as blocking every event source.  EFLAGS.IF (hvm_intblk_rflags_ie)
> doesn't mask NMI or #MC, so NMI/#MC get held pending needlessly, e.g. when
> L1 sets V_INTR_MASKING and L1's IF is clear.
> 
> Have nhvm_interrupt_blocked() take the intack and report no block for
> NMI/#MC when the reason is hvm_intblk_rflags_ie.
> 
> nvmx_intr_blocked() used hvm_intblk_rflags_ie for vmexit/vmentry in
> progress and a valid VM_ENTRY_INTR_INFO.  Those block every event source
> and have nothing to do with RFLAGS.IF, so report hvm_intblk_arch instead.
> This doesn't change behaviour as all callers only compare against
> hvm_intblk_none and hvm_intblk_tpr.
> 
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> ---
> v2:
>   * New patch.  Handle the blocking reason in callers, as suggested by Ross.
>   * Report hvm_intblk_arch from nvmx_intr_blocked() so the NMI/#MC exemption
>     doesn't affect VMX.
> 
>   xen/arch/x86/hvm/hvm.c             |  2 +-
>   xen/arch/x86/hvm/svm/nestedsvm.c   |  2 +-
>   xen/arch/x86/hvm/vmx/intr.c        |  6 +++---
>   xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++--
>   4 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index ef9c7cd05777..8fd095a4f8e6 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3897,7 +3897,7 @@ enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
>       if ( nestedhvm_enabled(v->domain) ) {
>           enum hvm_intblk intr;
>   
> -        intr = nhvm_interrupt_blocked(v);
> +        intr = nhvm_interrupt_blocked(v, intack);
>           if ( intr != hvm_intblk_none )
>               return intr;
>       }
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index 66b77c6efe7d..a93681e9bbcd 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1496,7 +1496,7 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
>       uint64_t exitinfo2 = 0;
>       ASSERT(nestedhvm_vcpu_in_guestmode(v));
>   
> -    intr = nhvm_interrupt_blocked(v);
> +    intr = nhvm_interrupt_blocked(v, intack);
>       if ( intr != hvm_intblk_none )
>           return NSVM_INTR_MASKED;
>   
> diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> index 6c220c4c2e49..38be2387739d 100644
> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c
> @@ -142,18 +142,18 @@ enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v)
>       {
>           if ( nvcpu->nv_vmexit_pending ||
>                nvcpu->nv_vmswitch_in_progress )
> -            r = hvm_intblk_rflags_ie;
> +            r = hvm_intblk_arch;
>           else
>           {
>               unsigned long intr_info;
>   
>               __vmread(VM_ENTRY_INTR_INFO, &intr_info);
>               if ( intr_info & INTR_INFO_VALID_MASK )
> -                r = hvm_intblk_rflags_ie;
> +                r = hvm_intblk_arch;
>           }
>       }
>       else if ( nvcpu->nv_vmentry_pending )
> -        r = hvm_intblk_rflags_ie;
> +        r = hvm_intblk_arch;
>   
>       return r;
>   }
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 02d9c44373ff..3e03a08a4818 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -682,9 +682,17 @@ static inline bool nhvm_vmcx_hap_enabled(struct vcpu *v)
>   }
>   
>   /* interrupt */
> -static inline enum hvm_intblk nhvm_interrupt_blocked(struct vcpu *v)
> +static inline enum hvm_intblk nhvm_interrupt_blocked(
> +    struct vcpu *v, const struct hvm_intack intack)
>   {
> -    return alternative_call(hvm_funcs.nhvm_intr_blocked, v);
> +    enum hvm_intblk intr = alternative_call(hvm_funcs.nhvm_intr_blocked, v);
> +
> +    /* EFLAGS.IF doesn't mask NMI or #MC. */
> +    if ( intr == hvm_intblk_rflags_ie &&
> +         (intack.source == hvm_intsrc_nmi || intack.source == hvm_intsrc_mce) )
> +        return hvm_intblk_none;
> +
> +    return intr;
>   }

Not specifically for this patch, but I note that hvm_interrupt_blocked()
similarly checks the interrupt flag but only ignores it for NMIs, not MCEs.
That should probably be fixed.

Ross

