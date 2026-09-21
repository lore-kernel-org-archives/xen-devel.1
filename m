Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECDCC982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 14:37:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427623.1650425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8f9H-0001R6-CW; Mon, 21 Sep 2026 14:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427623.1650425; Mon, 21 Sep 2026 14:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8f9H-0001Qz-9j; Mon, 21 Sep 2026 14:37:39 +0000
Received: by outflank-mailman (input) for mailman id 1427623;
 Mon, 21 Sep 2026 14:37:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x8f9F-0001PY-NM
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:37:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8f9F-004rkC-3z
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:37:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab1412c-8faa-0a2a0a5109dd-0a2a450887d4-10
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:37:36 +0200
Received: from [52.101.201.10]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab1412e-f659-0a2a45080019-3465c90a5e1b-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:37:36 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:37:30 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:37:30 +0000
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
 b=mU7hCQUFQHGI9+Hznpo8mcP0qeOouANLFT2YBxTaz/+5ex0txAjm7ipqv/D55r6jq8WsjkjI2A0OX1adk4yVegi8/1tcYPaJttItMJgTHdIymcgxpiTV94Srj8eqYW+eOFK3U5WUIm7jlXevL2CQzdmhRbEv1w2nkvwwuitigoKyXgK9gq0xP2wbWMNrdzQejj9xhHeNPZHD2qqpizfjQlfUKYGPOlY1F5wfJiSAPhQ9UKadcEcjwoePyAQjZ2OqbIiF4iW3uRA2m/gGTCU+u6+3k9XGZi4WrdxwOUlIPsnugu/Yuj6ECa6T+g2uej6lcPyMLw1sp6vMGWBM+L2/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NcxDG8WB5e1spVO79Dkhf7xcitYgWM44esyJgxgGC0=;
 b=HOzCK+fBJR5Ocu+NTpJXIIaIarkBsAguMATFZkmxVQupf4iccdHikgo7Em6d7Bp7XD6Mwsjjnt6VVTGARjfLv8hYYDxYB+b1A+dtht0dyYjlVAVdhBPB7qDyOHzd28NWVGnqCNjMC7v14EyVCKPB/AYrM4iTTYfLH4kR6zioN/C33Y3fMkoiZTSl7qbo4fcrmTMznH58RrObZKTdJSlCz9M0vzH18FrO42nd7kDmJFShAKNy9+Cw5TJrv5lB2DcHKKrZQrGFoLU7UjtGobP6+/JhOI4KUTWhJD19vycavkZ3+5WW4jUvKkzuM8dlPBBrbQ3r2hv1gq60ZPmsWH/RyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NcxDG8WB5e1spVO79Dkhf7xcitYgWM44esyJgxgGC0=;
 b=W96XRGlJhVUxhb/XN6fyhTVmA49Gq4v984iiMbDdG5vk3lx1dLadeyvru31oL/SgDNnhALrQtgCrEdcek5J2W68LLG0QjnwRuNiQL6pzEpJnCLnC2/QjSN+8dc6/sx9xQNqzYignrCU8rht/AGCjMCrN+i4lGgTf8u0BqfobnUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 16:37:26 +0200
Message-Id: <DLL2K0JJWNCB.17LYI7INCLTHX@amd.com>
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Baptiste Le Duc" <baptiste.le-duc@vates.tech>,
 <xen-devel@lists.xenproject.org>
Cc: "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>
Subject: Re: [PATCH v2 6/6] CI: run the riscv64 smoke test via QTB framework
 console-test
X-Mailer: aerc 0.17.0
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech> <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@vates.tech>
In-Reply-To: <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@vates.tech>
X-ClientProxiedBy: MA3P292CA0073.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::13) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|PH8PR12MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 092276e9-cb9f-4e0c-67af-08df17edddcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N1NeMrH6kF+FqB5sW5NcvMZQeGDosa1GGpNNSLzbYL8Unq8xiYi315/aE3YrZgBi+P0Czck7g62m1qFxW6U8IePqjUjOhWuM0hmCvdJeRY3oj02p0aF15XbvGxcupR81KVNLB1QUfKWau+WsHzkxTkyX2/MEDQ0xj4RCt4uAksHxqlCK8CSzdod0WkOH26Yoewv8qA58nApErAAvWyGNt1Wr7nx+fTCVis2FyQqUiFu8PggnQ5gflGYQJFzykwV04VnZYD/vV6JpoyB5hpbPs88C2z0ITEpbyFhkxpSdCgcojhqsQr4NiZ6CYuXPgEzkk1TbXQWxMXNiF3LT92IQoegYDERExypEyuI5smA0p0rqKwl1BwWXKNymUX/lqxWIDts4WVlpd5GV9f/CB0TpGrubkiWQln4bWc2gNXY8gZY9uLDbTrka3k3U6j9siGKMfH2hsyqF3YUe6dpTOAzzxgwo8AyHeYOUkOT43fc6XdzidDOfiR38Atkw+1gnEM/IOl3YFZ8wEDhDVXmZLyHANR7PTY2UL3MBRThLPXQyv/29g+t7FUXpLotYrDfbvvevI5ZK8d5KXVxhcyDClzyWE26dFC/yT7hqiU+BiINFkeE8/vSu759IxHJOSsbMYidi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXJWeTR6WkVpY1cxSDY3SVAxdVJHbnVaRW9jOVZmQnVIZUFtYXI2dDlnTEQy?=
 =?utf-8?B?Y1BnaTdxc2xIRWRUS0srdDRQS3lLZ1dVcmxrYkhiSjNiNEJucTEvQkN0OXB0?=
 =?utf-8?B?c2NsajhPNGUyUk5uaVZ0T1poOUJHRWc1aGRpaWN0MFVWU2Z0TzczRXdydkky?=
 =?utf-8?B?UVBIcDJnb3dCdXVQOFBYOWw5cXJlbVJyZllOcjMyY2tPWHBORzlsSUdiVnJ3?=
 =?utf-8?B?SlNxQVdIUUxlcHYvUlhxVURlaGlWTTZZR0JXTVlXbmRIYVMyQzRvSUtWaUxo?=
 =?utf-8?B?dmRQc29RYzRnUGJvNjdzakYwRS91RG4vaTJZeWVJeVorclFnVXF6alI0Vzho?=
 =?utf-8?B?Mk9IdTlvSXlpejZjc0ZhK01MVnpoaUR4MDRjQkg1WElqQ3l1OCtPdDRCRms5?=
 =?utf-8?B?WG9PSVJLUFNic3VBLzlmbCsyalpXdHByc2o3RTVNSHlmYW8zclVQdG8yVXBs?=
 =?utf-8?B?WXFRd1RqWGZjSjdIUWZpRk1hSVRsSlVFeWtrYkR3ZGUwQWZ6ZG5tU0xXSGtK?=
 =?utf-8?B?Q09CMHNmdTFYUHhTenJrZkxJY3N3anJ1dnNvb205eE9QSk1uUVJMQWNLa1px?=
 =?utf-8?B?N1U5emdXczNMNDhkM2pvVS83L0FQYnVCczV6VzU0NUhtNTdZMGxXcy8yT1ZR?=
 =?utf-8?B?WHVGZWUySzRjS0FtSHJRZG1GYnVaYWFlMTUwU2FKU216RzY5ZU5ZbExDU1B3?=
 =?utf-8?B?bnUvU0cwVGNFSWhWWGdoU0pRSE1ia0xBNTVOcVZtcXYvMStnZjdEYm5SeThV?=
 =?utf-8?B?ZWkycUJUM2UwdUFCaFJPSEUxU1R4OGV2Nk81ZEdxU051UHlmcFlUYzUxTUlL?=
 =?utf-8?B?Z0RNWWpBejJadWk5b1BxMHovK24zbGRvMjVrZk5jVzIvUmxiOEMzMVpWcTVs?=
 =?utf-8?B?blBDMTZWa0g4WlFqdGVCL1lyT2F6QXJjb2d0aTBvK05kRmxnMlBLaUNlQlJW?=
 =?utf-8?B?dzV5UW5MS3RaZGs2VGRNTHJNN1VxK2pXNnZYbzJGcUNqa1ZwaGpBQmRIR20w?=
 =?utf-8?B?TkZhclRMZ2N3V1lIYWE1M2VXdkFFaDg5SkZsNlJNaTBtMEU4U1orWEZ3MHFV?=
 =?utf-8?B?SWdPczlma1FnT2F5M2EwUEZOUmN3RUpXL0VUMy9ZckVEdlU3VWpOYWJKRk5w?=
 =?utf-8?B?SjVLbzFlQkcyeXFuQ2UvczQ3UFVRZUV5Q0RjNVZoWTR6Y3JyaWJmWldKMm84?=
 =?utf-8?B?b0FXeCtzeFJRcmxlTEI5MGdFWHRPdFRTc0VLUG5TZVkxQ0gxaWlHMkhBUG9t?=
 =?utf-8?B?blErditJTjNtMFQxNzNNNkpJT3RBbEZpYTJMQVBCVVFnbHMvRktVdkZPS0lQ?=
 =?utf-8?B?SUVNSWVNK0xwcmZmNDBTc3hMUHdJamhQenk5RThGWGFNdHdKMHZsMWZsN2FN?=
 =?utf-8?B?bTZJb3NCUy9aSG8vZmJuc1RPTGJYN3RQMjIxOFQ3RFJmQjhHT2hnUE1jMjFR?=
 =?utf-8?B?eEJpbVZnc25FWmJMWDhPZEJkVEtrYU1DS3JZY215SG1VTUlUZUlOTk05dDRl?=
 =?utf-8?B?aHM2UTlaRjRyUHJYdEhoWnRoWTkyZWdvTjFzVlBRWmFudXN4NHBreXU5eUxM?=
 =?utf-8?B?M1UrNWFjdVBuamlCdUJiV3kwZHhndW94ZzZ6NzZuQUhRZnBFS1J5N0ZMcVVE?=
 =?utf-8?B?dXNCMzdnODNQRlR0VVFjWHYzMGxyaDNWYzVaWG5PRnJ1cEtzdXNWbktEQjkz?=
 =?utf-8?B?U1Vkb2xCSWdQMWtHc0xsbWdHQzhsWnhHOUZ2a3poRFhRek15UDRPNFFpS24z?=
 =?utf-8?B?d1lqUHVMelo0VXowZlM5OEtEN0RDTFowWitqbW1HMXlWSUJabnF4bTVnZW9x?=
 =?utf-8?B?MytTWWlLSVg4d3QzQ1B4TjZLNGU3VnE5L1ZGZnZHUis0VjJpb2tScmgxNGx4?=
 =?utf-8?B?ZXZHelNvYXRlZEIwSXA2R2lUYW9mL1I1dWhxQ01kcDRTaWIzRzVKY05NUE5V?=
 =?utf-8?B?R1hmbFpaelZnUzBSV20xMjNyUEloNnlPWThSdkd5b0YvOEZVREdKWHh4a0p2?=
 =?utf-8?B?QkVMcGRWeURvVmVPSkExM1Y5TlJCY3FwSXl2dWFSRnI3NHVRN3JONjRqVXBo?=
 =?utf-8?B?N1U0WU0vSDhhMG5mWnUzMUlKZUIwM284WmpmZGtzVVFTQTJGMHNPL0FHbUtp?=
 =?utf-8?B?TFE3Yms2S2cvZ0s2YzNZZG83bUVjZ2hXdk1yRzQybUora1FuSXpUdnR0azlt?=
 =?utf-8?B?dllpM2dmTmlxZjBBOTFMK05RaW1FQlBzUzFESURhV3QrcUgyTFdpVy8vblBj?=
 =?utf-8?B?NXR6bmhYWkgvYjFZTjBIcmpNRVdXelNiOWJvbWdpMGk5L2ZUVVZ0aFRud3F0?=
 =?utf-8?Q?GqdBqwfnNm1CvDVQ7i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092276e9-cb9f-4e0c-67af-08df17edddcc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:37:30.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdVDumclfXJ1WH17SQuP8S3mrxvCrMq1Zp8MgA2BD+qMXAllj8ahzDuAxxdFTYYPeTEQJY0CTt0kud+3uSSzLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843
X-purgate-ID: tlsNG-c1860d/1790001456-D574B87B-E0C64BC2/0/0
X-purgate-type: clean
X-purgate-size: 5089

On Thu Aug 27, 2026 at 11:42 AM CEST, Baptiste Le Duc wrote:
> qemu-smoke-riscv64-gcc drove QEMU through
> automation/scripts/qemu-smoke-riscv64.sh, an expect wrapper whose machine
> description (cpus, memory, device tree, console wiring) lived in the scri=
pt
> itself. The QTB framework now owns all of that: machines come from the
> shared catalog, expectations from the test type's own YAML.
>
> Turn .qemu-riscv64 into a template running qemu_smoke_riscv64.py <type> r=
un
> <test> in the qtb-riscv64 container, machine and test picked per job
> through QTB_TEST_TYPE/QTB_TEST. The container comes from the test-artifac=
ts
> registry, hence the new ARTIFACTS_REGISTRY next to the existing
> ARTIFACTS_REPO/ARTIFACTS_BRANCH. QTB_BINARIES_DIR points at the artifacts
> of the job (Xen only currently, but aims to have initrd and linux images
> when dom0less will be supported). QTB_LOG_DIR collects the per-console
> logs, kept on failure and on success.
>
> Point qemu-smoke-riscv64-gcc at that template, running the console-test
> type on dom0less-1smp-0domu-1vcpu-aplic-imsic-null: a Xen-only machine, s=
o
> the smoke check is Xen's own "All set up" on console 0, the same string t=
he
> expect script waited for.
>
> Drop automation/scripts/qemu-smoke-riscv64.sh as it has no caller left in
> the CI after this patch and drop smoke.serial from the .qemu-riscv64
> artifacts since no riscv64 job uses it anymore, the logs are now kept und=
er
> QTB_LOG_DIR.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

This is all quite large and monolithic to review quickly, but I can
already tell you that replacing a <50LoC test with such a massive
infra bench is probably not quite what you want at this point in time.

IMO, you ought to keep the existing test in place and perhaps integrate
the new infra with new tests that would be complicated without it.
Things like injecting bizarre interrupts (NMI?) and capture expected
behaviour.

Or even duplicating the existing test would be fine. Build confidence in
it and only after you really trust it do remove your previous smoke.

My .05 cents at least.

Cheers,
Alejandro

> ---
>  .gitlab-ci.yml                           |  3 +++
>  automation/gitlab-ci/test.yaml           | 20 ++++++++++++++------
>  automation/scripts/qemu-smoke-riscv64.sh | 19 -------------------
>  3 files changed, 17 insertions(+), 25 deletions(-)
>  delete mode 100755 automation/scripts/qemu-smoke-riscv64.sh
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f42a9abeaa..15f93b8634 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -11,6 +11,9 @@ variables:
>    ARTIFACTS_BRANCH:
>      description: "Branch in test-artifacts to use"
>      value: master
> +  ARTIFACTS_REGISTRY:
> +    description: "Registry holding the test-artifacts containers"
> +    value: registry.gitlab.com/xen-project/hardware/test-artifacts
>    LINUX_JOB_X86_64:
>      description: "Job name in test-artifacts to use for Linux x86_64"
>      value: linux-6.6.56-x86_64
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index 61adc1baff..e9dd147380 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -72,14 +72,21 @@
>      TEST_TIMEOUT_OVERRIDE: 120
> =20
>  .qemu-riscv64:
> +  image: ${ARTIFACTS_REGISTRY}/${CONTAINER}
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:13-riscv64
> -    LOGFILE: qemu-smoke-riscv64.log
> +    CONTAINER: debian:13-qtb-riscv64
> +    QTB_LOG_DIR: qtb-logs
> +    QTB_BINARIES_DIR: ${CI_PROJECT_DIR}/binaries
> +  script:
> +    - ./automation/scripts/qemu_smoke_riscv64.py
> +      ${QTB_TEST_TYPE}
> +      run
> +      ${QTB_TEST}
> +      --log-dir ${QTB_LOG_DIR}
>    artifacts:
>      paths:
> -      - smoke.serial
> -      - '*.log'
> +      - ${QTB_LOG_DIR}
>      when: always
>    tags:
>      - x86_64
> @@ -779,8 +786,9 @@ qemu-xtf-argo-x86_64-gcc-debug:
> =20
>  qemu-smoke-riscv64-gcc:
>    extends: .qemu-riscv64
> -  script:
> -    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
> +  variables:
> +    QTB_TEST_TYPE: console-test
> +    QTB_TEST: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
>    needs:
>      - debian-13-riscv64-gcc-debug
> =20
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/script=
s/qemu-smoke-riscv64.sh
> deleted file mode 100755
> index c0b1082a08..0000000000
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -#!/bin/bash
> -
> -set -ex -o pipefail
> -
> -# Run the test
> -rm -f smoke.serial
> -
> -export TEST_CMD=3D"qemu-system-riscv64 \
> -    -M virt,aia=3Daplic-imsic \
> -    -cpu rv64,svpbmt=3Don \
> -    -smp 1 \
> -    -nographic \
> -    -m 2g \
> -    -kernel binaries/xen"
> -
> -export TEST_LOG=3D"smoke.serial"
> -export PASSED=3D"All set up"
> -
> -./automation/scripts/console.exp |& sed 's/\r\+$//'


