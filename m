Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1C9C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 14:09:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427591.1650389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ehU-00049a-In; Mon, 21 Sep 2026 14:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427591.1650389; Mon, 21 Sep 2026 14:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ehU-00049T-Fk; Mon, 21 Sep 2026 14:08:56 +0000
Received: by outflank-mailman (input) for mailman id 1427591;
 Mon, 21 Sep 2026 14:08:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x8ehT-00049A-BO
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:08:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8ehS-006sLz-OE
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:08:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab13a74-8faa-0a2a0a5109dd-0a2a4501e9c6-2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:08:54 +0200
Received: from [52.101.61.57]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab13a74-5984-0a2a45010019-34653d39a278-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:08:54 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by DM6PR12MB4436.namprd12.prod.outlook.com (2603:10b6:5:2a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:08:30 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:08:30 +0000
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
 b=VTvCXgdyXfdgdtGIM8Hbh/LvYn6PCPWtm2LBHo2enisQlHxnPHvQ1zuuX0w4DqnIeoPENFEZcAxplGCfCgbVeKBtxRpuqautClMWVH0IPfHlF6DWTOqj3nabp8XaWtK69HBAXSRyvNzsgQ/VbG/fDyVCqR3Z2O+f3/gbkghOH5XKS+NkaQL4i2ZAa3oPhIygT3dOibXymTA2xu0S9XCWnV+RgQzCA4mmGKmyQIbzoGaC5Q+Ior/GVj3In+cn+ECzZUo8NaMVAxurhK4bGEdK4FwZUG2MSyXCdpjVZUUBG4SWsArVixU8nwetGhIoSlNT64sO15AXzz+tBDD0/ehFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNVH4bE2jIJZ98SIyat7oDSZ1XLOwqVrLXxcDv8/2Go=;
 b=UP8x3XUXjmEcbJH26hA6D98Cfe7MVzP6hESMljpIqvsDfPhcfeD91jhRIk5kLyfDjw9DuhFgWkpT91Ondgnp8iwF1mk07RY7ucAxgcuZY+TWwPBHrqw3Ri3ksPHSD/ouiIwsxJRpNNYpNz0PqR1TXQ4GRpG2YPIRHzA+IVViH5g+nn8a8v9DVLjszKywb4Zq2TKlfCXUv+CnFnLtQsaWwDUqS5SDjhey5NJVal/kaHaVVBENIuS8ogw7suXysYCPynvXfLHzcUHBcNAr7Bbw7mGIHQTHZefYDZc4ctLwEoBz63R7SQjvYc3VfZm8nJx3OmZq3Mm4q/atgAYsCmD0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNVH4bE2jIJZ98SIyat7oDSZ1XLOwqVrLXxcDv8/2Go=;
 b=Mc1hAmZgc8+lVJ1+HFuRcYjjVUlaTw+5EUfXLytohfZaC+x6SuW13WTO1WoNplG8Cj78EDFRgatZVWtl0BCqtoxDbVogya2gdwcQu9gIGAXXmf0BG/ny/ikJ3NEPnj+dxLGGbTIVecGqqH4O3xayn/4OcF3ib6TtsnLnU5EZQ9k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 16:08:26 +0200
Message-Id: <DLL1XT72ENNK.1JVZY0R4A671X@amd.com>
Subject: Re: [PATCH v2 2/6] automation/qtb: add jinja2 device trees for
 riscv64 smoke tests
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Baptiste Le Duc" <baptiste.le-duc@vates.tech>,
 <xen-devel@lists.xenproject.org>
Cc: "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>
X-Mailer: aerc 0.17.0
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech> <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@vates.tech>
In-Reply-To: <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@vates.tech>
X-ClientProxiedBy: MA2P292CA0024.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::6)
 To BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|DM6PR12MB4436:EE_
X-MS-Office365-Filtering-Correlation-Id: e64c50f4-f356-4559-f431-08df17e9d0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|6133799003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/Sy4XUOnJIXITEX6rIIyqofb/lK0x0WdJLt3J3/XdMAdGeiElOS1lrPjfnMW5Rmjtgu2CZXEwzl9PDKQUb1AguSZP/DGgmxGX2NyLLe2Dj/ZtjkRxsDZUDT1UIgO0LR7J5onZn/evL4f6yV0ENC/3bvUhQDmVy39my3BYH9IQEPVKbQk5ZlAKk8CVKCJKu6HaLB9q9ncxssRXhWhQSqnhNfAw3TwWNpl1Uh6AE99ZpIwxGL4yo6rEpSlN5AnWnwh8uHU4hjxUe9tcrUMgMnTDS/FXK1mi9x22/wk9gBx8QNnWn+XR/u7nyo4t6VI56gNxK03PSFNzIsvFYUkoMSr+VmmodUyY04CWdhTifuJjpvqNQHtm7yBnywkqc3mDmxywoX2qe3s5/IJ03UwCLmnB6Jnthun4nsUw96D4z/CPCEMPc5zdtIEkboZY81YL1UTGsYA34BpwfKqOUujis4akTizS0W8TxawL30yklRyhjf885ERIkkxYQQwjdIK9tzwMrMGGHZQwZA6NAIFnOjG6kvquZI92QdBpugnkEb1ZYaWuHF3uT4ZiH+8HPW8wIVlXqNAh8eztFwkrm+/gaT8vH8YkHAT1hYlLTjTNiFnhZvwGfOEthOFsEBQcRLtqDbAkOBbNMotWCN/XxEyXMjQxQTE+ka4uUgeLz8qs7ntxNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WENOU25nZlpYZ2hYMDZWMXI0R2ZJN3QzSWFzNEFBeXRmTXhYVlZiUG5sRkxB?=
 =?utf-8?B?RDJRRmVoMGxhUUMvcGFzTTdYbzFBcnJFUHkxdUVER2ptcUV5YmozQUgrdjNW?=
 =?utf-8?B?bi85c0VOWjl2R0pKajExWVFpM0h0eVI5T09sUDgrTGpYWjJDMEVzeGxyRGRK?=
 =?utf-8?B?NU5XamlRS2UrSDZKcmtmdFdGOVhpL014anJiTjM5SDBVcTZoZUQ3MEtKY2J0?=
 =?utf-8?B?SjlwOVQvK0N3RUVGUTdOdi9DQXR1ZVM5SGRhb0FMdHhOa3dScXZJNDJLekha?=
 =?utf-8?B?V0h6TnNSa3BoRzRkaVZweDhrUnRwU0JuN0dYdHJvR0o1WmFjVzhmOFdzcGtE?=
 =?utf-8?B?aTBiT0ptTVdDMG1IRGlLbTF4Y3c4TEJiQThrVzVQaFRYb05vSXF1YUt1bUxt?=
 =?utf-8?B?c0N6TFB4WFJRSWN4di81QWx1UGdyaEpFZldWTkZ2M0pJd0xIK05rdGNQZnd5?=
 =?utf-8?B?NE1VUDB5Z3ZVS0M5M2N0TWRrUVFPRExMTitwa1h5QTlPT2VWT3pMMU9veHI4?=
 =?utf-8?B?SFppYTJpamRnNWp5djJxMlh6dmlkcTJRUFFveFJLcEpobzhvSnIveWpQMkg0?=
 =?utf-8?B?bm5Yc0RBMjhxTVhKejlyWllVbm0zanAzRXFPQVlBek1vazdlZjBMNjVPYmRU?=
 =?utf-8?B?Qm5ENjR4NzVQVlVuSGphalYybnFqc3RyQmgxOU9DcmtTbEJHK2ZZMDM0VkFP?=
 =?utf-8?B?WGdNOWpsdWhEaWdKV0hWQUpRK1lUUTNMSGtMbFVJNE5EYXovbERWMVhSWGR6?=
 =?utf-8?B?N2ViSmRnbjVMZDF1MVl4WHdsUE0rZlMxeUlNTmN3V0ZBajlSMHd5ejhacXRI?=
 =?utf-8?B?NEZlSkFaTVRnSjRvSEJKdnJHRGZQYUxpdEEyRTNvNTVIT3FLRlpNa1J0ek1x?=
 =?utf-8?B?bnVTMk1VS21XaFhvZFcvZ3k2bVoyRWRpQU95Yms2SkZPWHZ0cTU0Z2NER1Ew?=
 =?utf-8?B?Y1A5c1d4dGRVMjdTSXZSdGVJMlU3RXprdTlSTjBMcDVCYlR4RXdzaW5OTW16?=
 =?utf-8?B?bjJXdVFUNVRkcjFCZ203N1FuZDN5NnJQV2xuY2NRK3NJZDN3YnQ4S3NIVFFH?=
 =?utf-8?B?b3NkRXFqUXd6aTBJZ05QOXRNWjlycjBqTHJKWm1seUw1ZW5kczJ6MVdES0pL?=
 =?utf-8?B?MmdHK3R5UjJDZHpEZ0xoWEMrL2p1bnFaaDlRZWsyalNrRklHODR5LzBnMTN0?=
 =?utf-8?B?WWhEYy9mcDlOeWtxT3UwdjlpY0lUWUpGdlJBOVh0aWJWeWtZNXhDbVRWdE9E?=
 =?utf-8?B?SGQyeTcybVZKQWpacWV1cXJGN3llNHQyenNtaDhIOUYyQ0FpdFpTdXRXWWg3?=
 =?utf-8?B?by9jYUp1NXpydFQxSHdVUVIxRkQ3STYxQzFCSWljWTg1cnJSWVVJQkRQU3FG?=
 =?utf-8?B?ZG1XVkJlK2R5WktUdW5lZjlFZUFJVGsyTWwzVHd0RXFONVRsdzBiVVltTm9O?=
 =?utf-8?B?NDAveTdRSkQ4QUZRZVBIeDdBWDdpUmMzZkhsbTdlNmUrRjhYaUc3Z0JCNnFz?=
 =?utf-8?B?Mld2K21ZMGsrczhWa3NjbW8zVkR6YjZ0Kzh2MHZYNXN4WVVSazQvdjRsdks3?=
 =?utf-8?B?RVMxeXIraTF1S1BmMDFxNnBoRlhsR1dscys4U3hvUmtkN2J3OThQeFpZaEV2?=
 =?utf-8?B?TmUrY3FOR0pFcTU2WWNZcmhpRnYzWmNvbzc3dk9UY050Q0dkaE9YbkE2cGhL?=
 =?utf-8?B?YkgzbTF6Um16RDNXTWJBMVdaUS9mZDBodWZIUlF5alRrV05CdUFJbzArWjV0?=
 =?utf-8?B?ZGUxcTllWGwyZEcwSmZZNERpVi94WEk0VUpYakg3WWdJR2c5aEhUQ0IzYTdW?=
 =?utf-8?B?WnlvN1VhVkw2aE8yYjhmUGtNZ2NrN0V4REgrbm1FR3lmNU56Yjh1cWpGQWc2?=
 =?utf-8?B?MlNhNEMzOHdablZTTjNmS3VsN1hvNXBFV1pOa1VtYWE3UWZaZzhmZUE0RDhC?=
 =?utf-8?B?a0VUT1Y2MDZWWlphKzlFM0s0LzYvVUR6cElZSHl3bzFodnVpSlBDU3VFcUhn?=
 =?utf-8?B?cmk4V0NYVHAwMnFuR05OK0ZrK3NzN25nSVA1UElHTisvVUFmc1JvZXo4U3VJ?=
 =?utf-8?B?blYzdStjckV1TXdUSm05YzRuZXhCTkh3MmozYWk2bVlYQ0E3ZUJiSEhnY0dN?=
 =?utf-8?B?VWJoY1EwdlNseE5mRFJsbWpyTys1VTk4SmpNZ3FsRDQ5NVdRaS92cUdOTGhC?=
 =?utf-8?B?VDJ6c2V3aG15c0tZNXlDNURTUGtCUXNOTWVqNXEvK1dCcUhpSllRcGplSFQz?=
 =?utf-8?B?M0d3Q05hSDlLZXFCMGEzeitXNjUrWFJYbG5Oam9qRlF4bE1WNXNSazFhcS9a?=
 =?utf-8?Q?UikT0thwjjcYq2j6qv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64c50f4-f356-4559-f431-08df17e9d0b0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:08:30.7341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+G2NSUPjACHO0SMZ/gS+lcbHEJIshcRzLfH7P2KwVDe+T4em0qoMRofWSjfmYU+Fwcfq3G95ohwaeabndxa9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4436
X-purgate-ID: tlsNG-d62444/1789999734-BEC61757-F5B1156C/0/0
X-purgate-type: clean
X-purgate-size: 8019

On Thu Aug 27, 2026 at 11:42 AM CEST, Baptiste Le Duc wrote:
> The dom0less RISC-V smoke tests need a host device tree describing the
> platform (CPUs, APLIC/IMSIC, uart). It varies per machine (hart count, MM=
U
> type), so a single static .dts cannot cover the test matrix.
>
> Add dts/qemu-host.dts.j2, a template of the QEMU virt platform in
> aia=3Daplic-imsic mode: per-hart cpu/cpu-intc nodes, the M- and S-mode AP=
LIC
> and IMSIC pairs, CLINT and the ns16550a uart. It takes ncpus, mmu_type an=
d
> xen_bootargs as arguments.

Alternatively, why not query it from qemu itself? See
"-machine dumpdtb=3Ddump.dtb" in "qemu-smoke-dom0less-arm64.sh"

Then you can use fdtput to add nodes as needed, with all hardware being
consistent with QEMU without undue magic replacements. Having a
configurable .dts seems like a silent mistake about to happen.

Check out that file of arm automation for DTB manipulation. I think it's
best if all DTB ports behave the same way.

Cheers,
Alejandro

>
> Values QEMU hardcodes are set as named constants matching their source
> symbols (QEMU_UART0_IRQ, QEMU_IRQCHIP_NUM_SOURCES, ...) rather than
> open-coded, so a QEMU-side change is easy to trace.
>
> The template is inert on its own: the generated dtb will be used in next
> patch.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>  .../scripts/qtb/riscv/dts/qemu-host.dts.j2    | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
>
> diff --git a/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2 b/automati=
on/scripts/qtb/riscv/dts/qemu-host.dts.j2
> new file mode 100644
> index 0000000000..13a8e983ce
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
> @@ -0,0 +1,160 @@
> +/dts-v1/;
> +
> +{#-
> + * Jinja2 QEMU "virt" platform device tree for Xen RISC-V tests.
> + *
> + * Interrupt controller: APLIC in MSI mode + IMSIC
> + * (QEMU -M virt,aia=3Daplic-imsic).
> + *
> + * Rendered by xen_dt.py.
> + *
> + * Variables:
> + *   ncpus        - number of physical harts                (int, >=3D 1=
)
> + *   mmu_type     - Xen host MMU type, e.g. "sv39"          (string)
> + *   xen_bootargs - Xen command line                        (string)
> + *
> + * Per-hart nodes are labelled cpu<i> / cpu<i>_intc and referenced with =
&label.
> + *
> + * No `aia-guests=3DN`, so no VS-mode guest files: IMSIC reg size is
> + * ncpus * page size.
> +-#}
> +{#- Values QEMU hardcodes, need to be described to Xen -#}
> +{%- set QEMU_TIMEBASE_FREQUENCY =3D 10000000 %}   {#- RISCV_ACLINT_DEFAU=
LT_TIMEBASE_FREQ -#}
> +{%- set QEMU_IRQCHIP_NUM_SOURCES =3D 96 %}        {#- VIRT_IRQCHIP_NUM_S=
OURCES (virt.h) -#}
> +{%- set QEMU_IRQCHIP_NUM_MSIS =3D 255 %}          {#- VIRT_IRQCHIP_NUM_M=
SIS -#}
> +{%- set QEMU_UART_CLOCK_FREQUENCY =3D 3686400 %}  {#- create_fdt_uart() =
-#}
> +{%- set QEMU_UART0_IRQ =3D 10 %}                  {#- UART0_IRQ -#}
> +{%- set QEMU_IMSIC_PAGE_SZ =3D 0x1000 %}          {#- IMSIC_MMIO_PAGE_SZ=
 -#}
> +
> +{%- set IRQ_TYPE_LEVEL_HIGH =3D 4 %}
> +{%- set APLIC_IRQ_CELLS =3D 2 %}
> +
> +{%- set IRQ_M_SOFT =3D 3 %}
> +{%- set IRQ_M_TIMER =3D 7 %}
> +{%- set IRQ_S_EXT =3D 9 %}
> +{%- set IRQ_M_EXT =3D 11 %}
> +
> +/ {
> +    #address-cells =3D <0x02>;
> +    #size-cells =3D <0x02>;
> +    compatible =3D "riscv-virtio";
> +    model =3D "riscv-virtio,qemu";
> +
> +    memory@80000000 {
> +        device_type =3D "memory";
> +        reg =3D <0x00 0x80000000 0x00 0x80000000>;
> +    };
> +
> +    cpus {
> +        #address-cells =3D <0x01>;
> +        #size-cells =3D <0x00>;
> +        timebase-frequency =3D <{{ QEMU_TIMEBASE_FREQUENCY }}>;
> +{% for i in range(ncpus) %}
> +        cpu{{ i }}: cpu@{{ i }} {
> +            device_type =3D "cpu";
> +            reg =3D <0x{{ '%x' % i }}>;
> +            status =3D "okay";
> +            compatible =3D "riscv";
> +            riscv,cbop-block-size =3D <0x40>;
> +            riscv,cboz-block-size =3D <0x40>;
> +            riscv,cbom-block-size =3D <0x40>;
> +            riscv,isa =3D "rv64imafdch_zicntr_zicsr_zifencei_zihintpause=
_zihpm_zba_zbb_zbs_smstateen_svpbmt_smaia_ssaia";
> +            mmu-type =3D "riscv,{{ mmu_type }}";
> +
> +            cpu{{ i }}_intc: interrupt-controller@{{ i }} {
> +                #interrupt-cells =3D <0x01>;
> +                interrupt-controller;
> +                compatible =3D "riscv,cpu-intc";
> +            };
> +        };
> +{% endfor %}
> +        cpu-map {
> +
> +            cluster0 {
> +{% for i in range(ncpus) %}
> +                core{{ i }} {
> +                    cpu =3D <&cpu{{ i }}>;
> +                };
> +{% endfor %}
> +            };
> +        };
> +    };
> +
> +    soc {
> +        #address-cells =3D <0x02>;
> +        #size-cells =3D <0x02>;
> +        compatible =3D "simple-bus";
> +        ranges;
> +
> +        serial@10000000 {
> +            interrupts =3D <{{ QEMU_UART0_IRQ }} {{ IRQ_TYPE_LEVEL_HIGH =
}}>;
> +            interrupt-parent =3D <&aplic_s>;
> +            clock-frequency =3D <{{ QEMU_UART_CLOCK_FREQUENCY }}>;
> +            reg =3D <0x00 0x10000000 0x00 0x100>;
> +            compatible =3D "ns16550a";
> +        };
> +
> +        aplic_s: aplic@d000000 {
> +            riscv,num-sources =3D <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
> +            reg =3D <0x00 0xd000000 0x00 0x8000>;
> +            msi-parent =3D <&imsic_s>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <{{ APLIC_IRQ_CELLS }}>;
> +            compatible =3D "riscv,aplic";
> +        };
> +
> +        aplic@c000000 {
> +            riscv,delegate =3D <&aplic_s 0x01 {{ QEMU_IRQCHIP_NUM_SOURCE=
S }}>;
> +            riscv,children =3D <&aplic_s>;
> +            riscv,num-sources =3D <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
> +            reg =3D <0x00 0xc000000 0x00 0x8000>;
> +            msi-parent =3D <&imsic_m>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <{{ APLIC_IRQ_CELLS }}>;
> +            compatible =3D "riscv,aplic";
> +        };
> +
> +        imsic_s: imsics@28000000 {
> +            riscv,num-ids =3D <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
> +            reg =3D <0x00 0x28000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSI=
C_PAGE_SZ) }}>;
> +            interrupts-extended =3D <
> +                {%- for i in range(ncpus) %}
> +                    &cpu{{ i }}_intc {{ IRQ_S_EXT }}
> +                {%- endfor %}
> +            >;
> +            msi-controller;
> +            interrupt-controller;
> +            #interrupt-cells =3D <0x00>;
> +            compatible =3D "riscv,imsics";
> +        };
> +
> +        imsic_m: imsics@24000000 {
> +            riscv,num-ids =3D <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
> +            reg =3D <0x00 0x24000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSI=
C_PAGE_SZ) }}>;
> +            interrupts-extended =3D <
> +                {%- for i in range(ncpus) %}
> +                    &cpu{{ i }}_intc {{ IRQ_M_EXT }}
> +                {%- endfor %}
> +            >;
> +            msi-controller;
> +            interrupt-controller;
> +            #interrupt-cells =3D <0x00>;
> +            compatible =3D "riscv,imsics";
> +        };
> +
> +        clint@2000000 {
> +            interrupts-extended =3D <
> +                {%- for i in range(ncpus) %}
> +                    &cpu{{ i }}_intc {{ IRQ_M_SOFT }} &cpu{{ i }}_intc {=
{ IRQ_M_TIMER }}
> +                {%- endfor %}
> +            >;
> +            reg =3D <0x00 0x2000000 0x00 0x10000>;
> +            compatible =3D "sifive,clint0", "riscv,clint0";
> +        };
> +    };
> +
> +    chosen {
> +        stdout-path =3D "/soc/serial@10000000";
> +        xen,xen-bootargs =3D "{{ xen_bootargs }}";
> +    };
> +};


