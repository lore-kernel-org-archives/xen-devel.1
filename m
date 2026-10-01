Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E71BCA5FD4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 17:48:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438614.1657339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKst-0007mC-Rm; Thu, 01 Oct 2026 17:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438614.1657339; Thu, 01 Oct 2026 17:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKst-0007m5-P4; Thu, 01 Oct 2026 17:47:55 +0000
Received: by outflank-mailman (input) for mailman id 1438614;
 Thu, 01 Oct 2026 17:47:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xCKss-0007ki-GT
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 17:47:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCKsr-00Dr47-To
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 19:47:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9cc9-2eae-0a2a0a5409dd-0a2a450ab482-0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:47:53 +0200
Received: from [52.101.62.40]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9cc8-f2d2-0a2a450a0019-34653e28f4d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:47:53 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV3PR03MB7658.namprd03.prod.outlook.com (2603:10b6:408:28d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 17:45:41 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 17:45:41 +0000
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
 b=Y+Azn+hAkH4ayZAHeO3uOEKce67cW90te23kRF3QbRp1MUda0x9AHeizewMKQep/jZFDpJkyLa18WHKSOp+fkRhRAh67t9vj1f5j4Q3D+eOFcUDR0Asaspl6/EfwaZfKeCWoOlZcmWwn1ZFtcVe+pY9FHDhfd4uxVitwQWDSc7C7/GGnMcIlkgWGCySirjy/7yCcRcBuGFVpMdqH+QgJVkzr9qQEvVm9rrQDChNVnz/QO8yZQ171jgaBDD+Vqg8fuEGnsJ5NHmnj0yKCYB370f6qqqYu2+/T1f7/hssWzWZYJmm/USl7O6mC/gagAcXeddtqGU0AWLU5LxxXvPtCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkdwiKtK+tR0FPw7NQxvOIvKgkeU+OyZ3OFk30VN4lo=;
 b=ZCCkDLlHOGrHvismthtu1t55c//IbBX4VEWOI29u3+A7IaxRs1X7TGl6Gl0e3UUyESvtrxWUeRt9uwfScUxP5OEX2U6zOprxgwtgKwQGxNZiHlN5N7O8zQIeKrvI6n+uVdx+cCWYFxQK/TZ0H5zUeorR6xCT1gFEX+yZbFFpNec1hEoju33wUgCH1SlmgDnVi8KlTTG+NiAWOJ5E5S3uVWRXh1t1E2WCwyJB4Buo6R1IUjLxlusoDmr7l/9blWwKq3OBbCVqgXGyoPrIdv/ChdGO8V4e/vQeX7AZY6/uqpaZm4K3hZ+mR/dKtrolc1NP0p/++/OAQb36D3arAmwZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkdwiKtK+tR0FPw7NQxvOIvKgkeU+OyZ3OFk30VN4lo=;
 b=QmjBanjFylaAyUXOK3s9roscbrH7xmrpkjYoh5nqkNsWpwwZyQbuMCsGzgHWFjiNYDqb430XvuXb3ZWNcxgD7Ggtk/jsCudOGrNiJ+xjYOu75X0XC1TpSAwmEiAoFQ33/c/NyvhTO1Yaw2OYmoGuLD2NvfdlBE7zCJNtTw7MLjs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 0/6] unmap_page_range optimisation
Date: Thu,  1 Oct 2026 18:47:43 +0100
Message-ID: <20261001174749.2275245-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::9) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV3PR03MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: c68c9d13-0e0c-407d-a838-08df1fe3cfed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	uNQRm6aKWGUkwPz7pSsKZALEjaEJ982+lw3sjbgS75XSbg3a9ZQvzz2lc0uy414ARJuaqasfTVqHjxqIAyMq73PwTVv7c4fcNyI00M7uk6YZuOamVyTLGOE5FrvzaVwTn4wqyLDxzvQWTj4dnpVdLx+32R9prJ7LcutfJ+/TEeqqSC2wR1Ih/ycJlIANd9N+HZ3vK84EdO7Ywix+4YXheoW1Yl1NiiF/NyxgLIJFxlwE+JRAcV8YIzc0SIO4gEL+69kv68kBlWePfPGBUUFT0svHc+RdgMTYqvGNMe9JJNIHbQlvm/rjy0qnjvx2VZXa2FVNpSsk1kCbEoFgeIrrcEsqVOVI5iGB77Q/SpXoytyhvPcl55U1JqIGOcLEiRlQeLvhozznzqTwtk+Dc4hOO2bDgFEDj1vDdOZAwZjB0ljcCS71VqCSGvKBkdQI97Ociad5KQ6gDjV9aO0x8R+UshWclww0AYAbhn+uIaVTiqcB1dzWAiT51s9Rxr9Ysmlo++jOqrIRYlRiIZSgKVlJOP6yVJerhh4qau9e8tqBl73q22NC7at2MFSd5aqpR97kihW0aaL+0Z0wFQeb08/2uwNx6CCzy8bWeX8x0xk7K6QhEur9WhXvpPHBYxDjn3t3FU6/HigaBDs+MfCJCu8IP8AnhOzaSBTgU+kkHmAVALk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mpja5antczOlYbEEHtLNGON1+MTXUyQ4BFYsNbZxxiNHCCWGsjj7lnr/7N/x?=
 =?us-ascii?Q?ZC+jLiDPUfBhDAZ/Hzqla3QdeA9QlC5nT2MTWPy8WxGOyFEf4zJHpQt4xJ9k?=
 =?us-ascii?Q?Vdgyc3kscGS6fpfVrzBv9xi2R8OymPyhazFwPUatwNfbF+IBC1LVMaxf9AXr?=
 =?us-ascii?Q?/NqD1Rb14jCg+YZgTYhF2/3rn6OBZSteY7lCfWEN4bbSUst3n7jIR+wdNrpQ?=
 =?us-ascii?Q?7ZRUBpgC0XWxqH2uDBq2KCzyFp1ny+OAPPkk9iN8laZI+TdQGbMti0/bz1+T?=
 =?us-ascii?Q?owrg10q7GtDTxbDTIWre31dVNRUVsFeD2GnckwTN5/RZ3TI3baT8UGKfIiZv?=
 =?us-ascii?Q?ZWGHrdhuQ4g4bYT6Rshl06Bxg0mMtKlUGPQ3y9WzK2OESgWdVYn1CQUi7QNG?=
 =?us-ascii?Q?vdkBVV7pySmqOxVLPPxMqiiIOuNOHu3nsLr8LvnfcrC42XNzdD7bddUS+o6Q?=
 =?us-ascii?Q?hHahGJ4xEhqSEdBzntpLBkP9Ym9wBaQKC9QoFAuZ0Bp1iLoEAUZ7DwHu2/Nu?=
 =?us-ascii?Q?IMkjvSayd0nbk+J/qJO0YhdBqS+rfrNCBuUbFqBoVq685qtcZfUHoly3Gw8f?=
 =?us-ascii?Q?Xf9UuSslSRtbJihReYhDIb/YEcPTN0AfYBYnXsODVjIlWFy8ymxpHXADKGFy?=
 =?us-ascii?Q?vo5FQCaZQukfdhPkh6Nh1huiVU9gUdKRQ1LV0sV1ObrNKS6pFLKy/Qx+5yo8?=
 =?us-ascii?Q?vLQeWywCEkX5LNWKHxyJ0WJ9DsCUQmaYstBDNCUIwCjR3f6xd+VurJYe1FU/?=
 =?us-ascii?Q?3XPobDUlqNZ3KRve9ebvA+Wn13J2w7M31Gp4w9QuvcU0X24y22mjQRhzCKBR?=
 =?us-ascii?Q?orCUlQZpHb9otyEimWIm0M+Nv9Br4gtUGpxPY4088GrrJKaF80K4+ZfjwoxC?=
 =?us-ascii?Q?5jps0tMaMeTm6+jDYd3IXAjaxJ6MfebJA+yWwrw5PDv99LLuWKUjDTQDVKWA?=
 =?us-ascii?Q?haAR1eHHZUUZZDtKLKrtc/NNWaRHyWyRL1Jy3b39AGnMBsTLutZNDidYoZyL?=
 =?us-ascii?Q?+iCStcfTU6gO2dcwZnktV02E6DMeP/gejfxNPWCxp9jGccEtO02JiphjWJNN?=
 =?us-ascii?Q?JROWaecSjI6ygH3BRnVP78NlAwah7P+J1Gv6PcUPvW8vJuwvB9Q0DlEIKNrW?=
 =?us-ascii?Q?IylzBgdD2EQnMdqOiuFH+/w8CfeawweNDrPFBDIz5JR3kIFj9nqav6gdKBdw?=
 =?us-ascii?Q?CIvnne28kClmVKRUMAWgNpQj0g4zuPJVSZHVenqdZylKc0p5kfkSqjUugsnV?=
 =?us-ascii?Q?HU3fMDyp3XmCH4UOV7mdCeU8dm4ZOHZWL9MzWVv0M/KdnFfHYEmKoxC9A1jo?=
 =?us-ascii?Q?p8DysHTP7z7pd18Ide/rwQl8+1T/oo3f6+oANPbQbxVg5JRAfJMMJ40yCD+U?=
 =?us-ascii?Q?SlyW0gFy2QKEZDVikxD03PkT6s+HHkakDYdF9tb1HQ+ISxy3XsiAwj1T9ORy?=
 =?us-ascii?Q?12T0N73WX0UIEZ8K/0MarCyiZqv+kO0jMYk8LY2vw22lKFQ3oHCnz0Dyq1co?=
 =?us-ascii?Q?EQiMt+6wQxouxp7NyA/F5SMEVC03STQ7VHVxMzsNDM6UYFCUgrmp4KXLL8X3?=
 =?us-ascii?Q?J/zbt0OLPDKSO+aLA+MhBOrgQFJPsh5VnVHluy623aPih+ENTkekC4hlObDB?=
 =?us-ascii?Q?mb42vRAuRpA30ZjhnKu+pxHLpnohWZtNcanIkHsKDiny22TDPXj3kRmG3eMz?=
 =?us-ascii?Q?1fXpC1H42qqEKRYhUH9D0ZgP9wGYKFvPSB95pyA5J3vF9F+pHOQMqCK7FGG6?=
 =?us-ascii?Q?Cr0Lwt9KTA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68c9d13-0e0c-407d-a838-08df1fe3cfed
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:45:41.7376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJR9IeU3Oz7SBhpqi1thNexUNIVUIFq4hncnw2ZR6L++IigYuV6fVQx4/yEFJXEEjFxbGA+vAGycixoMQY767Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7658
X-purgate-ID: tlsNG-4011c0/1790876873-50ACCCFC-646298FF/0/0
X-purgate-type: clean
X-purgate-size: 3276

v1:
https://lore.kernel.org/xen-devel/20260727150615.1373200-1-kevin.lampis@citrix.com/

Previous discussion:
RFC: unmap_page_range optimisation (avoiding emulation faults during VM migration)
https://lore.kernel.org/xen-devel/16133EFF-88FF-467F-B78F-E96EB148C3A5@citrix.com/

This series adds a new MMU_PT_UPDATE_SWAP sub-op to the mmu_update hypercall
which Linux can use from a new pte_get_and_clear pv-op to significantly improve
the performance of unmap_page_range.

A microbenchmark[1] which allocates a large number of pages and then clears
them shows a performance increase from 1100ms to 640ms using the
new pte_get_and_clear pv-op.

Further profiling the microbenchmark with bpftrace[2] shows that Linux calls
unmap_page_range() 23 times with an average execution time of 48ms
dropping to 28ms when using the new operation.

Changes in v3:
- Extend swap to work with l2/l3/l4 PTEs and any value not just 0
- Other review comments

Changes in v2:
- Add a sub-op to mmu_update instead of new hypercall
- Add Linux patch
- Other review comments

[1] microbenchmark
#include <err.h>
#include <sys/mman.h>
#include <time.h>
#include <stdint.h>
#include <stdio.h>
#include <unistd.h>

static uint64_t nsec(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1e9 + ts.tv_nsec;
}

int main(int argc, char **argv)
{
    const size_t len = 1024UL * 1024 * 1024 * 4;
    const long pagesz = sysconf(_SC_PAGESIZE);

    char *p = mmap(NULL, len,
                   PROT_READ | PROT_WRITE,
                   MAP_PRIVATE | MAP_ANONYMOUS,
                   -1, 0);
    if ( p == MAP_FAILED )
        err(1, "mmap");

    /* Fault every page in */
    for (size_t i = 0; i < len; i += pagesz)
        p[i] = 1;

    uint64_t start = nsec();

    if ( madvise(p, len, MADV_DONTNEED) )
        err(1, "madvise");

    uint64_t end = nsec();

    printf("MADV_DONTNEED on %zu MB took %.3f ms\n",
           len / 1024 / 1024,
           (end - start) / 1e6);

    munmap(p, len);
    return 0;
}

[2] bpftrace
bpftrace -e '
kprobe:unmap_page_range
/comm == "a.out"/
{
    @start[tid] = nsecs;
}

kretprobe:unmap_page_range
/@start[tid] && comm == "a.out"/
{
    $delta = nsecs - @start[tid];
    @count = count();
    @total = sum($delta);
    delete(@start[tid]);
}

interval:s:10
{
    printf("avg call time = %d ns (%d calls)\n",
           (@total / @count), (uint64)@count);
    exit();
}'


Kevin Lampis (5):
  x86: Remove return value from UPDATE_ENTRY
  x86: extend update_intpte() to support atomic get-and-update
  x86: extend mod_l*_entry() to optionally return the old PTE value
  x86: extend do_mmu_update() to support returning the old PTE value
  x86: New feature flag XENFEAT_mmu_pt_update_swap.

 xen/arch/x86/mm.c               | 215 +++++++++++++++++++++++---------
 xen/arch/x86/pv/grant_table.c   |  53 ++++----
 xen/arch/x86/pv/mm.h            |  32 +++--
 xen/arch/x86/pv/ro-page-fault.c |   3 +-
 xen/common/kernel.c             |   3 +-
 xen/include/public/features.h   |   3 +
 xen/include/public/xen.h        |   1 +
 7 files changed, 208 insertions(+), 102 deletions(-)

-- 
2.52.0


