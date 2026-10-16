Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371EECC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452423.1667226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4R-00050w-JT; Fri, 16 Oct 2026 16:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452423.1667226; Fri, 16 Oct 2026 16:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4R-00050p-GY; Fri, 16 Oct 2026 16:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1452423;
 Fri, 16 Oct 2026 16:46:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xHl4Q-00050M-05
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:46:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHl4P-003Wv8-D5
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:46:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254cb-8faa-0a2a0a5109dd-0a2a4506ca44-8
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:13 +0200
Received: from [52.101.61.50]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254d3-195a-0a2a45060019-34653d323dda-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:12 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SN4PR03MB989476.namprd03.prod.outlook.com (2603:10b6:806:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:45:51 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 16:45:51 +0000
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
 b=INM0kDCZerTnLe6m6W26TSQexMG6gZRXLNbdPcNGxxbPpuswZT24kMFNCNlQqIXzvRKxJAGNA+MV1+OARDT++dEihamuLBhFkC00Juj3JQ2tIEQtasGdCSH0JyjVg1RUUGJMjxX3oQRNqOtplh6n9y+eaxkMpfvoNSNJm9cYYc6OcSx4w28/IBsqYcvxtohy/pSy85PgQ2i4lTbfXRHEn1XmGlPqZyEEjSG26SMsvuklcHpCGI9tTCxvXWeiBaafD9chH6xTJyOtxjmWqW9JrG/ZsMm1exQ78ezTGcZhbDJCz8Ao7Yx/vW9BJ8e3iOAoeHv1d7jkeKzsmdR2ryBRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHIgZpoR/rF2VsNF55kUcsyY2bAEOeyv2670kaX1SXQ=;
 b=vmR2WAU5lrRAgnyajtxskdEtzqNLgHqI5HF7MTCnAqDdN69cAL5jaKK6/Z0n+GOTRXwKG0On/ERo9mGAOHlot3MfOCgo0MA5mcrQJTJYVRWQg4w9TkcblM0SJmEi7xrxuD3bac9YdreZfEjGe7QP9SlxyYQcwcTO5/AqZp0DaxfaChry3AX0/1hlfxH749pxCkjYTJY4yfG5GMTJZq+v98jwh9r3E1VMNJ0CX3WsUWQQ98w52Ud+kyb2cT4I+0Qy1vCc/dK4biSVuYJbfcGfFnRL/eZHO1/pyVuocCzmNJCp9g6g7VYkHaw6cjEsYDMISFRJqciWS5lTrqEwLXv8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHIgZpoR/rF2VsNF55kUcsyY2bAEOeyv2670kaX1SXQ=;
 b=mGecvonSCElX4GhNORGkQeV6ZqMcBfQiHQ9obtPi3flahvFYuGufH6OGp1MZFlNIyIC3MqoKLuq9g54zEs7mQKyxB5QyzlIBdGIQuVgTcGO8QOujGM8LPeO/kTJyGF22qpcUlmHCudwXQEBrCdmtn8J3Z0DAF9B3h6lb6EkFS4Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v4 0/5] unmap_page_range optimisation
Date: Fri, 16 Oct 2026 17:48:10 +0100
Message-ID: <20261016164815.3109065-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SN4PR03MB989476:EE_
X-MS-Office365-Filtering-Correlation-Id: 4091d22a-3a90-44f5-4168-08df2ba4efd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QRTBmM5S55IPJQpAzCupB//45kv2lWdDSW7FMZpX9Y2UDbT9QRpkMCgjOVSGql3mjSeBULm88YLTaAvOCXm+XOvAXHGIa1nJ/pZBCFZ4Z9fLs0PN+h0qdTMiWpjF6aSWcI4rA0UK+7PgmEHQtS+nZ4nnjv2Bj+qNrYZteFtu2zmQKXgN2mpJDsWePsIC6RfWsvkA+E5W08Yyitfe6n0lGlCvlRGWrMhGiKI76AwQAs3Fb3F4Gjfy0zmxATXS+NbwDv+bypdYAqkn3wza44Z2AMuHVQk5l3iNNQ2i4HcTub/RRpYzdezbFPEYvATi4LGUOtLIZI7BpJ0zwUa1alyl64nNZHvq6h6/5GFLFBpqCRAtOdPyZSO9RPRLQoouDJJKtUTd7ojPW3o/GynTDndfj26B3p2+Dw7/tXElWkdqvm0i9uxX7PEgl2rdZjN8R9HN4oEfIyeYw1ZMk4feGA+/m91hvpFIfPtsjm7LYf8nwZdN0VFpEhPPBJLGqQST+LUHOo1qX1i10xMTpT9yjIQpvIf05xzskmWH/icCVcW26eYYzD63wGYNkf5hzBIk/MlCuTfPzluz+bzzH9iXvc5Qn0kFQRHYmImx203+Jk/cZdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uDlGka4pKhf5l2n18QD9X2UjfQlCDDyoA+CyT8l6RTPlAIXBkCy2IipPpplO?=
 =?us-ascii?Q?MJS6wWR3Od/QrseaS/2lLsnlqsY3cRSavtYvL+OjroaGZmITiJgzA6yZJ/de?=
 =?us-ascii?Q?Uq6ldbIrhAxRVCWp+mZ9PXxr1Diry8lLlHOTwgV0qQ9nbYIKOFh1o9IrB5AD?=
 =?us-ascii?Q?2pFzf9Y6K+DURCGWthilfVVYjSh94y0/yrQ7BL2/AJEBar94qENjRD4VZJK+?=
 =?us-ascii?Q?jkA1SuHqxMDXGYvGoTJbR5W7bXcHIax/6XJHlAQSE7mYYk5NAKqMhVYCsdWC?=
 =?us-ascii?Q?rV8iDWf+Mh6dKqsX5awVf1Y0qPE1kr6HI5MtR55kBryb7Mjh5+DnEds6EuZ4?=
 =?us-ascii?Q?k8+7AIueYtyxeSJkQx0/DtiabH3yguTPoI9Suu+s6Y6a5JUCH5XO3ULiaX6m?=
 =?us-ascii?Q?pfe1h1IttVDiyWz3JyJFgIMGfEDlqlUFIoehc5Z3tm2LxFUC1t3vwxTrhqxf?=
 =?us-ascii?Q?ImVsNEd9z+JLzx8eZqJeA2QJ8SP6La/4QC355muzuVLci3BI7fieQWRo2B0K?=
 =?us-ascii?Q?YgUHwxmKtC0HKStUUUOZAsYlmTFpmLqPgpcrud+w/PQRgLMG8rIZxDEk8Uk1?=
 =?us-ascii?Q?98l6fKzaxBzQ8CPv1chfUelLJqCJ8cSJFobhWQ6KrYgSp80k1PLnCtCwvida?=
 =?us-ascii?Q?JC6+bE89GitPwoW9RL0CjjqJZSx/z6Z8IkxaTLVDauufSCurFF+b3rPHkR/p?=
 =?us-ascii?Q?s2+XfhJ6eVFVdlhhTw2KwflkqRajNtNlWp2MHf/eYcfkzzM5wZ/OkCvRmrKM?=
 =?us-ascii?Q?OmVVg7izWa2Qrj0nKeegyf2/UjFKVW4YJ/lQiPyatK3mMQvuvr9+yB5/0vas?=
 =?us-ascii?Q?PB3mJq8mRGQB2hPygt/39HPPbeKSNkFOuD6GesgR9zZ2Emsxn7DpYQ7DBaDP?=
 =?us-ascii?Q?vUFbjquuGKBZwD4xddsdUAs4C4iaPaBwGm0GEPGd3ZyZUCKBM89IOLtA3rgv?=
 =?us-ascii?Q?hB6RmtjYjtfE9miuBQoWDgvsBHaTyIzek+RE8R73HePE3zwiUpiqblD9VD5N?=
 =?us-ascii?Q?If+XkuQyCR/U/IVeupoEHUZdDItHjzDyhUztIvTgODwDaRChdlvdnSKvPCtr?=
 =?us-ascii?Q?crfnfgT4eIpSiZ6brgQkNjdoqHRarfPpGhWAKHf1j3v1/VgBPIdIgn2aO+Wr?=
 =?us-ascii?Q?/204DSIEs6jtb83nzKjZXDIawO7QLl/srv2N6gWqtCTHTxZoFWnZKgNzydq+?=
 =?us-ascii?Q?OnkN9vr+W3j3JX17qZHureQhCIA/N8i+WGlE2TS4YO6DIBswZ4NqKsqEOyGo?=
 =?us-ascii?Q?bce8I86Q5+t0A7KNZxjuFm2P4LyW5tihRv+99Y/ISrVoJkKCFnCazsdfYGE9?=
 =?us-ascii?Q?LYSWZxNzn2SFdSQqchVmjEDm9G4fO7mIiLt3DfuNUv3fuVHvWz2W0m1Mf8tb?=
 =?us-ascii?Q?VkRY9nR7zU2kRVAbQ97iD6thuEqIAxbKcCfIuJGQUMWcsuzZ9E/wS6oFq0N0?=
 =?us-ascii?Q?9NFySzFjvRMPwXa5oCtay+Om/yibGlJMpvfT9veSNQ2kzE7KRtRT4U7HoJQZ?=
 =?us-ascii?Q?Y2OXQEP7fZLcHTiNBdX2lc+5HPRlGgHU5zcgrOR5CFHOgVCBzEQcyYpThVrS?=
 =?us-ascii?Q?fDqwSkSuNY/x9alf4fqp77mETtQq7mHqJcIPg4a+zeBVCUM6REsNGnx9tP9y?=
 =?us-ascii?Q?UzLgvAUvx61NyqNHdCo3OvdLMhMQIPM+gzdF1Tnw2Ko02kBBpGSNOR668EpS?=
 =?us-ascii?Q?qOtAfBEaTkuGgRKAS4IX7Z2T5jpgdfDblY+vfAbs3h6xYwnt2dB/uDczE8FL?=
 =?us-ascii?Q?uQd4M6yDZA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4091d22a-3a90-44f5-4168-08df2ba4efd4
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:45:50.9861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaZtO+97eTtOHuKfmrscy6gQH5bm99GcmuJNQSdcLPZw5RZt5as6/PD6q2oTNDqoukeN7hgJmgqBj7H7U532Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989476
X-purgate-ID: tlsNG-16d1c6/1792169173-F5C0F77B-8D7AE331/0/0
X-purgate-type: clean
X-purgate-size: 3156

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

Changes in v4:
- Review comments

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

Kevin Lampis (4):
  x86: extend update_intpte() to support atomic get-and-update
  x86: extend mod_l*_entry() to optionally return the old PTE value
  x86: extend do_mmu_update() to support returning the old PTE value
  x86: New feature flag XENFEAT_mmu_pt_update_swap.

 xen/arch/x86/mm.c             | 158 +++++++++++++++++++++++++++++-----
 xen/arch/x86/pv/mm.h          |  14 ++-
 xen/common/kernel.c           |   1 +
 xen/include/public/features.h |   3 +
 xen/include/public/xen.h      |   1 +
 5 files changed, 151 insertions(+), 26 deletions(-)

-- 
2.52.0


