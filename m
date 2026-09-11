Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F3CC88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:48:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416567.1645565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fr-0005R6-B9; Fri, 11 Sep 2026 12:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416567.1645565; Fri, 11 Sep 2026 12:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fr-0005Pp-4K; Fri, 11 Sep 2026 12:48:11 +0000
Received: by outflank-mailman (input) for mailman id 1416567;
 Fri, 11 Sep 2026 12:48:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x50fp-0005Im-SB
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:48:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50fp-003mHJ-5Q
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:48:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3f880-8faa-0a2a0a5109dd-0a2a4503a8fe-34
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:48:09 +0200
Received: from [40.107.201.12]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3f887-fae8-0a2a45030019-286bc90c0d98-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:48:08 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS2PR03MB440844.namprd03.prod.outlook.com (2603:10b6:8:3c5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 12:48:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 12:48:04 +0000
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
 b=sxivP/U0APtbjrHUFetUhLjfKWpCXnQ6sa/Z5Ve9oyLEoUgf3abFVafXKIlBQKBcbSXxehfCcoQyU4Fe1+XSGtR2UfhYHEqmh42LPZ2F/ITPSW0lyMbIRPw0hBESOaICT8ldFxGDmenvYHooskQa1drWVZ6u93DXFsoxpAxTul2fU/blP2S5n8arFKaoarVrHRue/fh1Y1YAQdBYgQj7mleFmMiL9k/9I9bdEix18C/3S6lswO3wx5zoOmkzSEVXJmlFq+qEqP0RhHfVjNY143kLb0N9keUfdJVGtBhBUEcDCCwMFsaPS1vbjF7PztSDZ7StOINqYNPV8b68TTsMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zzrzMDVNaplommme8ZBfPAEOi6cAeerkg7aCSHr5Fs=;
 b=hbnT6LHgaiIMTYHzSpM36XRdB/VA0LqZhtAPjT3l1vswCHl6lnulsg9L8EipUEcqjcTTVwGgeMMty+OMa2y7rve3PKcelpQK+WyUkkZ8RqGCkAPBQkRotWI847hZ+/N8GiOksq9MYur9/aoH4+yCTnYTi9yWr0n7c10HHcD7PZ8Nn6DQoAo8yExIgbSNy7TR2j+UmEXSV+5DtcbvBWVeaW373ieKY2PsNuOsi7RNuCNfEbgXvueOfo1slgGNrEpu4hTsGgnIWaF3EQD+J5Y45YUshZhtUfDMdTmTavE0eQxuGfm5R3fIG87H6dvXu6xIuRk/bOCtIu2ejC67uOok4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zzrzMDVNaplommme8ZBfPAEOi6cAeerkg7aCSHr5Fs=;
 b=o5tccPUeLK91JYF9FAJvU+PflheT4nwadjNHbztA/I1SbGh55kYDRUZxPci0i8JvizUawEiVwAYv1lldHQPCMcGWK+56W4DGk+/nbX2fexAaFfmhNpDM3xngfenCZQxKoKKeavqKSxDRo9iCtdnQJSAi37p0J+ILbItwSxtni1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a6ec6fb7-719f-4968-9b6f-0934ed61ea19@citrix.com>
Date: Fri, 11 Sep 2026 13:48:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 teddy.astie@vates.tech, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH Linux v2 7/7] xen: Add new Xen pv-op pte_get_and_clear.
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-8-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260910203113.462943-8-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS2PR03MB440844:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d91a345-9de1-47cf-647d-08df1002ec0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|6133799003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GH/3KM7w/8pcvx/HwFZ5tjL8uI2vPZ/zVSHgWISxkB2murwgVrkEzo19vveyocCTBAwaMGQE1xehbrB9UOd/OwNYVcBatv0yRaCv6fg7jjpISV1SXN6iY2a0tKPrCvPxWT3CpuT4RCl5706zRtcCWeBWpTZ+wgHZtestr34Zh9pLMaJHbZUNvpC55zifMKlEzOxVeE8ZcDem15j+bp/PUWDHc4lq3Y/bUUr9ygJQhb4Qhro/I+JFl0qgw1vtkArq/vVPHD8gTtFSgDJhQo7FCLEuz0/KMAYYnLHOckOXHHJ4lafwVtBTCbpzZgNPbVATT8twhr7Ml+ZogRbBSIHxsrMW8BTpbkjbn/CBnxtJ72mGt4W/YhvqllUGH5ukOW7GBJeZMdwypEwY8QZN4x3EibA5HLPeRKxZyKrj4qCC/1O8NqbXgwlSQgJqi6XQUMpeULsugVCYQXrSJgMPxZh52StIjIvttYjZhmHgh+VEZlrDWUF86oWSye1qaEsdTIP6Eefko6xVqHu0K2yUwF2XgwKT4wt6pvAlDzfhQpr52eHck3I0nYPQvpvKWf43k1xgM5/iQtaCLSmaSXy9d7R3BM2fA5mZrRtGxBodFbm4qLUR5vMThgpchZseG9RBY5+eGV+v0QD/XMO59/ECDfloYBkPsTVUmhTmtBhmQiSFpw0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(6133799003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bC9yWExEbnIyekRJZ2FDOTFRQ3crM21nRkRmQzVvck42bmV5OEU5b3RLKzhI?=
 =?utf-8?B?NlJKcXlQWjNHNG9FWmJaY3ZCcTRyT1JCQ0FtQ1c4TjN2L3ZKa2EwMjloWjQw?=
 =?utf-8?B?c3NIOFk3R3U3QmdrdjYxNEdJK2o1dEpSUlZzRklhZmlBMy9uSVM5aXRqMy9z?=
 =?utf-8?B?MnFVMXMweVAxN090eEVoalh5emtvaGRxUktIMTUrMnQ4Z0FValFYeHkvaUR6?=
 =?utf-8?B?TzlORmJ0SWVhNklVQUxDQ0xWNVNiWUplS3JzcDBRZ2o1OFJpT0ZvNk9FMXcr?=
 =?utf-8?B?RE5LUmNUc28xdGkveUt3dElXN1YxZVFWaTJPenZDdFVRQXpmajJmcXQxU2tp?=
 =?utf-8?B?eGc0bWM2M2RxcmNtdStjVVJQR0hTRDB6dWc5NWhxbE1lVmZ0T3V4eGZKMEE0?=
 =?utf-8?B?SmQyeCsxUktXY1NqQ0JFaHJBaWhtS2ZhZWFMYk1mRWNBcWRGTXJiZVRLbFJT?=
 =?utf-8?B?Nm83aytsOFkzOWtmajEvN2IwWkF6Q3lOM0gzbEpQczVmNVJPQm1qdUtOYzBn?=
 =?utf-8?B?MS80M1BWTE10MkJSSkZONjl0Ym1CcUlQRVNxU2RVZEpVWUVyb3FsM21LWGgr?=
 =?utf-8?B?MTRIdmNXM1hncDdTbXBPZExoTi9iTHV1RGRTTGovWVFSL2lMSWlyL1hJYXVE?=
 =?utf-8?B?OW1CQUloVFVRU3lsNFZwWWxzbzhiYWhvdGpsM3ZZaVNWKzlIWHdiQTVqR1RV?=
 =?utf-8?B?WjFnZTM1TFhnQWhSTWNGTUpZTDZTRGJnNGFSdWcyaGxlcnBranJObTU2WTgr?=
 =?utf-8?B?SWhZanV1OEw4QTg5bVVNclM0bmtUM21YNDdYclU0UXBBNWJlanVUTDVHWDNU?=
 =?utf-8?B?Z2lKQWE0TkhSQkpRZnZqYTFDaU81Ync0ZjBxaHhOS0YzY3dnYS9GY0o1aFNN?=
 =?utf-8?B?NXZ1Sjgrd0sxWG1iaVVWM28vbEw1OVJ5eHFJa3RTSG5EdUtoY21kU1JxRWp0?=
 =?utf-8?B?Q01nNXJhQmRQNHFRQm1oazFNQnFEeVQwbHlzODhBZndtYmxNY2JWNENXV3NN?=
 =?utf-8?B?eS9LYnVJU0hRUGlYMGVnRzkzbU9na3JWMnpRUkhzVXlRZTM0VVJHUjE4eFA2?=
 =?utf-8?B?czN0RUpHc1hxM1F0bTJwZVBqa3orR2Z6K2sxNzUzdmVlemtUL0NKMUx6MlBQ?=
 =?utf-8?B?b1BueWtKSTkzelBvbnF6UDlYYzFwMloraEJJU1JQdlhnRU00R3Rpcjk5K0ZG?=
 =?utf-8?B?Qy9CVm9WVmU0NFp1dHJETG9YYm1sRmdGaUVYQVI3Q0o3L3RkZS9wQk0vL0pC?=
 =?utf-8?B?T2hTL0Rubk1FbW42N290azQ3WnNJSmt3dDh0eldsb3N0YTBNR3ZLUFRsaUVW?=
 =?utf-8?B?ZS8rVHRhYWU0UE5KcnBDL1N0V0l6L0xjdTFjU0pha3ZJR3Y1YWdVdGl4RVBy?=
 =?utf-8?B?N2RVa3cwMmdybkVhQkFoM3JBZVJtMzFKUC9Vc05mTkNRSjA1aDVaU1lLVXBB?=
 =?utf-8?B?bUpUSFFHM01qTnIwMTYwN3JNVExGditaZ3JmaU91TkozNGoyNHdManpsTm43?=
 =?utf-8?B?N3NFcHdJMThxdEdPNi9wTWtsRGtYaGVoN1lWZnkxRjlIR0JmUkVMQWxkQURm?=
 =?utf-8?B?QTN1QnpiSWt2TE5JYlhLSHZkUHdZWjRwZkV1QjVUZXRYdmsvT3QwOGljU09P?=
 =?utf-8?B?czdNVDB0RU1zZ0t6WjNUbnAxRGU4SmpmQzFkOGVkRmZ3dnZhQURBZnYycG5F?=
 =?utf-8?B?NnVhMnN1NERDTVlpL3ZtT3Buak9WSmRPT2IyVFNZaW1VdWdvaExzVHg3Szda?=
 =?utf-8?B?eVFWNlg2ZHUvcXNKYzNwVHBPQS9leU45Z1ZIZXh6d0tLUG1yV2VETmJKMWli?=
 =?utf-8?B?MDcwckFEQS9kdE0vYllmQ1ZCVFU5TkdqUDNIUDRNbFZXK0ZtM3hvS3c1NG9W?=
 =?utf-8?B?NnhXNDI2YmJmZENiS0RIeGtTTStrWFVsaFRQeGF1WlBQVzd1alB4TUd4ZjRw?=
 =?utf-8?B?a1BWNmlwVzFSRHRuZU1rc1draGJNNHRTNVc5T2hxSEFTZFBiM1hoY2hPYWZ4?=
 =?utf-8?B?MnBQZjJOZHJYOVZDcjJJd3hsbTNCWU5zZUpQWkUrZkQ2YjVHb3BvL0tUc2gr?=
 =?utf-8?B?NHErN1JHTDV1VUlFeXBvVDRCKzB5QUxIT2w1RE9CSTFkRURzMmM5bVhIOC81?=
 =?utf-8?B?Tnp6VWh1cjkvQWY5LzNsbEVYV3k5cmUrZlFMdWNmSGpGTVVVdUlTb3k0OHdW?=
 =?utf-8?B?VkUwSXZKbUZUQktJWG0rbzVKVzBybjFtTytOMU92cFJ6ODR4STAxSFJOaVBz?=
 =?utf-8?B?cTZjOUN3ZW1tUmZWUlNQeXBrRHg4eWFTSEEzZ3YyNVJDZkpBUlRvVHVrQzFR?=
 =?utf-8?B?MnVQQWkrN1FHdTBsS1dIYTg0bWNzL0kzeHFManZlQ3NVeExIcFgyQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d91a345-9de1-47cf-647d-08df1002ec0c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 12:48:04.7397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbi6FnPlBmKOxK6hItltqhGPlLU/FCdVjSXgC8/uvDN4zceiYWCpy3HErHkDiuF9rFhFPgXkNH3e0gb9T9UXzlheckPObCuHGQps7lhWLgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB440844
X-purgate-ID: tlsNG-33051d/1789130889-6F8C54E9-D3ACD4DF/0/0
X-purgate-type: clean
X-purgate-size: 6205

On 10/09/2026 9:31 pm, Kevin Lampis wrote:
> If Xen supports XENFEAT_mmu_pt_update_swap then for performance reasons
> call mmu_update with the new MMU_PT_UPDATE_SWAP flag instead of
> native_ptep_get_and_clear().
>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

CC Juergen, the Xen maintainer in Linux.  Keeping the whole patch intact.

> ---
> Changes in v2:
> - New patch
> ---
>  arch/x86/include/asm/paravirt.h       |  5 +++++
>  arch/x86/include/asm/paravirt_types.h |  1 +
>  arch/x86/include/asm/pgtable.h        |  3 ++-
>  arch/x86/kernel/paravirt.c            |  1 +
>  arch/x86/xen/mmu_pv.c                 | 15 +++++++++++++++
>  include/xen/interface/features.h      |  2 ++
>  include/xen/interface/xen.h           |  1 +
>  7 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index 0591aa38fd85..0a3a286c46f0 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -373,6 +373,11 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>  	PVOP_VCALL2(pv_ops, mmu.set_pmd, pmdp, native_pmd_val(pmd));
>  }
>  
> +static inline pte_t pte_get_and_clear(pte_t *ptep)
> +{
> +	return (pte_t){PVOP_CALL1(pte_t, mmu.pte_get_and_clear, ptep)};
> +}
> +
>  static inline pmd_t __pmd(pmdval_t val)
>  {
>  	return (pmd_t) { PVOP_ALT_CALLEE1(pmdval_t, pv_ops, mmu.make_pmd, val,
> diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
> index b4c4a23e77a1..1bd4c19450b5 100644
> --- a/arch/x86/include/asm/paravirt_types.h
> +++ b/arch/x86/include/asm/paravirt_types.h
> @@ -135,6 +135,7 @@ struct pv_mmu_ops {
>  	/* Pagetable manipulation functions */
>  	void (*set_pte)(pte_t *ptep, pte_t pteval);
>  	void (*set_pmd)(pmd_t *pmdp, pmd_t pmdval);
> +	pte_t (*pte_get_and_clear)(pte_t *ptep);
>  
>  	pte_t (*ptep_modify_prot_start)(struct vm_area_struct *vma, unsigned long addr,
>  					pte_t *ptep);
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index ac295ca6c92f..b0d7d6520984 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -58,6 +58,7 @@ extern pmdval_t early_pmd_flags;
>  #include <asm/paravirt.h>
>  #else  /* !CONFIG_PARAVIRT_XXL */
>  #define set_pte(ptep, pte)		native_set_pte(ptep, pte)
> +#define pte_get_and_clear(ptep)	native_ptep_get_and_clear(ptep)
>  
>  #define set_pte_atomic(ptep, pte)					\
>  	native_set_pte_atomic(ptep, pte)
> @@ -1243,7 +1244,7 @@ bool ptep_clear_flush_young(struct vm_area_struct *vma,
>  static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>  				       pte_t *ptep)
>  {
> -	pte_t pte = native_ptep_get_and_clear(ptep);
> ++	pte_t pte = pte_get_and_clear(ptep);

This looks like a typo, on a path you didn't compile.

>  	page_table_check_pte_clear(mm, addr, pte);
>  	return pte;
>  }
> diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
> index 00b59d774389..58ecd12b10ee 100644
> --- a/arch/x86/kernel/paravirt.c
> +++ b/arch/x86/kernel/paravirt.c
> @@ -178,6 +178,7 @@ struct paravirt_patch_template pv_ops = {
>  
>  	.mmu.set_pte		= native_set_pte,
>  	.mmu.set_pmd		= native_set_pmd,
> +	.mmu.pte_get_and_clear	= native_ptep_get_and_clear,
>  
>  	.mmu.ptep_modify_prot_start	= __ptep_modify_prot_start,
>  	.mmu.ptep_modify_prot_commit	= __ptep_modify_prot_commit,
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 820af6f0aa57..7ce2feab6434 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -359,6 +359,15 @@ static void xen_set_pte(pte_t *ptep, pte_t pteval)
>  	__xen_set_pte(ptep, pteval);
>  }
>  
> +static pte_t xen_pte_get_and_clear(pte_t *ptep)
> +{
> +	struct mmu_update u;
> +	u.ptr = virt_to_machine(ptep).maddr | MMU_PT_UPDATE_SWAP;
> +	u.val = pte_val_ma(native_make_pte(0));
> +	HYPERVISOR_mmu_update(&u, 1, NULL, DOMID_SELF);
> +	return native_make_pte(u.val);
> +}

This wants some reformatting, and blank lines for clarity.

    struct mmu_update u = {
        .ptr = virt_to_machine(ptep).maddr | MMU_PT_UPDATE_SWAP,
        .val = pte_val_ma(native_make_pte(0));
    };

    BUG_ON(HYPERVISOR_mmu_update(&u, 1, NULL, DOMID_SELF) != 1);

    return native_make_pte(u.val);


I'm not a fan of the BUG_ON() error handling like this, but there really
is no other safe option in this case.

> +
>  static pte_t xen_ptep_modify_prot_start(struct vm_area_struct *vma,
>  					unsigned long addr, pte_t *ptep)
>  {
> @@ -2165,6 +2174,12 @@ static void __init xen_post_allocator_init(void)
>  	pv_ops.mmu.set_pud = xen_set_pud;
>  	pv_ops.mmu.set_p4d = xen_set_p4d;
>  
> +	if (xen_feature(XENFEAT_mmu_pt_update_swap))
> +		pv_ops.mmu.pte_get_and_clear = xen_pte_get_and_clear;
> +	else
> +		pv_ops.mmu.pte_get_and_clear = native_ptep_get_and_clear;
> +
> +

Stray blank line.

~Andrew

>  	/* This will work as long as patching hasn't happened yet
>  	   (which it hasn't) */
>  	pv_ops.mmu.alloc_pte = xen_alloc_pte;
> diff --git a/include/xen/interface/features.h b/include/xen/interface/features.h
> index 53f760378e39..b346d58c0a41 100644
> --- a/include/xen/interface/features.h
> +++ b/include/xen/interface/features.h
> @@ -97,6 +97,8 @@
>  #define XENFEAT_not_direct_mapped         16
>  #define XENFEAT_direct_mapped             17
>  
> +#define XENFEAT_mmu_pt_update_swap        21
> +
>  #define XENFEAT_NR_SUBMAPS 1
>  
>  #endif /* __XEN_PUBLIC_FEATURES_H__ */
> diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
> index 40c9793e9880..92f972e53323 100644
> --- a/include/xen/interface/xen.h
> +++ b/include/xen/interface/xen.h
> @@ -252,6 +252,7 @@
>  #define MMU_MACHPHYS_UPDATE        1 /* ptr = MA of frame to modify entry for */
>  #define MMU_PT_UPDATE_PRESERVE_AD  2 /* atomically: *ptr = val | (*ptr&(A|D)) */
>  #define MMU_PT_UPDATE_NO_TRANSLATE 3 /* checked '*ptr = val'. ptr is MA.      */
> +#define MMU_PT_UPDATE_SWAP         4
>  
>  /*
>   * MMU EXTENDED OPERATIONS


