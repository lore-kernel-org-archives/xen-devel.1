Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44017606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=lVPBLM/p
Received: from list by lists.xenproject.org with outflank-mailman.1485378.1688597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRby-0006QQ-2q; Thu, 12 Nov 2026 10:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485378.1688597; Thu, 12 Nov 2026 10:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRby-0006QJ-0F; Thu, 12 Nov 2026 10:00:54 +0000
Received: by outflank-mailman (input) for mailman id 1485378;
 Thu, 12 Nov 2026 10:00:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xRRbw-0006Q1-9s
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:00:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRbv-00HTip-8e
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:00:51 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e40-2eae-0a2a0a5409dd-0a2a4505d94e-40
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:51 +0100
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e51-4cb1-0a2a45050019-3465c10b4789-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:51 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:00:11 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 10:00:11 +0000
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
 b=vZ+7O/JYQqw3kfpc+C92PVPaZtT1G5a2eIbln65tPXujERTjJE4PF/U7wOtWXFEcdFLkqdlIxOgXHkEhwuj2wdJ5tBhTmmPvlFfhS/0Rz13Ddrn18gqTkEUSakbAreO6l9a6o6vjCkrWBdb87FCd1/lZ+SedsTib44NDmp4GvPC5DPlrfDutORxpsIXzLwbwoxU0MsWAYLLzQN4CO9YOEyoJ1zfnvpPvMP8ovxR7vY7/PlXC8DpQHp0j+S2C/LN3IJL/ac+DKVLYDgseW9ofSfz9pPNCP/Y+joEC+amEpczEfLbTrzjqiKYRWeA9aa4t67sU1Zc7cjg2Swwfxjrpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVv0K5/Mbs/tLu1IvGGpElhQ+3LaaD6wkbsctHYSviQ=;
 b=nYoDRuq/e+uU9sOXL2iqvykeN3Rhd0iU0rfEmFSCzSKrbA1t1Tu1faBdWipM7zCVT/mX3PPHCvtkdX+qqmxL8QVt+88OOJAqcvzGnb4EQMZJBhrUgnJ2ODeudEqpfKVLaD6+0zEVZGCsTzVSPJxT5nd54RmtltQCuF65zS+yuhbNuZ106YymGvgAIM0kYy235XdWr34bWM3K/NwSvQX4ZZKsG6BEzZU2yZVBBsZX/L5v49Kf3e9x+smel0SGO+SbQQqvEYCJXg0gkPYWo9sJEoD6gxWltLmydfzv3WUWq8p6g+icELWwinIrv4J8udN7jADpB26zC5hPGz3fZYVqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVv0K5/Mbs/tLu1IvGGpElhQ+3LaaD6wkbsctHYSviQ=;
 b=lVPBLM/puDaxY/YKSZEH0/ozjRGn8q/ivbWufma1JqyePgSoDKV2fuAk7f9c41qgLucBaZnWmBzCWHYuX/R2SuEyQF4ZzQD5OyjSu5G/vuSkYrjuTJ2lN8u5XFAyWEFGOfeGsN6sBMunp3ZIYfAPxqoEtpwE0a91yT2n9oxzbik=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v5 0/6] unmap_page_range optimisation
Date: Thu, 12 Nov 2026 09:59:59 +0000
Message-ID: <20261112100005.324440-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0410.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::19) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: 09455b20-dbc7-4f6a-e4f6-08df40a3bd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|6133799003|261009223027099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261022075727099003|261021135927099003|261026121527099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	U+3a7wK+SipZ/5MYW3+ZETFWcVrUZXBL60btnTR4B5hQN3SCZDXateO1R1g5AZz8tUqQLkHm/oEnnaiKa6IeA6jHIxuSO63NdZk95+9wNGUO+rspX+BXvr+WV6XTReGwuwSNw/0GniAPM9oe+Qm87qDb98/DaYoyz+/2MU6+Xck5P0molj5r48Dw+j24B9SSiulDdK6sPNf2Lq896JhRz/y/dEbS2mKw0J1g6RPiQSLWQudrZwq4PlD8rVVs0wre7O1IF2aOHGi28V8URqqMCtfjZ6QGuJmyujofbpJdkWjdGijHx1OxZ3Wh+/xY7FWJ2g3ys74lOQbb569vsZ0p/DIcQJOLQwV6YxFwPBB/YJqIncLU1HsiIpZixkiupdvpDSICdk7TKyneDG1+dlMdwaNpiaC86TvHK8vtLMquvLpyAaeBcEx6T3Uqj6T/99cM97lFIatS/q3LTkjkC0v5rxjuM6j0Aorky+sNfH5BmNhWqQkc5CMghctAgF5yXNDxnFjiKl4RAZaCLG0ThotjHO4ozzXkaWXR+/njpCqtcIzbFmuMrSa0WDuTT1QUNahEScdr6ckne+AvJUNhjUuAdcyM/lauq6wa9MxT6VBYgh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022075727099003)(261021135927099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3NLaCI4VLOrpaJLQVZgrA96kX8D9Hml4owpMksBl27gtGZWFIpKBfTtW7PIv?=
 =?us-ascii?Q?D5sKOp0us1Z5O5Ezl11IgpGmen4xckIBlJUsN3HQ1WNubhFMrZl13b64jtZz?=
 =?us-ascii?Q?tPHEx8etFwmgmYvLs34eq6QAifVQgbr+YmjZFQpndtcK3hpziRKCSCrIH4pq?=
 =?us-ascii?Q?l0XbpaGLivqPp/IQFfe1Q/xOH6onmWkdmLvFmurymiVCU/sGWxrJXEOcV06T?=
 =?us-ascii?Q?M34dBKs5pFZppDuJN8d0eoFe2kfvyqjh2HAPTFCR3pKc9Xsr11E2JzGiEpEb?=
 =?us-ascii?Q?+rXbaAed+tptRAKzt1pH5AV8YVe35hubTRTYz6lT8raowrmk01B04d34qDNi?=
 =?us-ascii?Q?dlugde1pGN9//4MooWZ8S8eByyGi7tkm/WLtIJKAgJdfPRU55quGT5oywhsa?=
 =?us-ascii?Q?t4ott/hSYW/RHhLU6wWnFVE3SSC8PXU9uauQglBewiqXDoGBfIMRZG7GrYY1?=
 =?us-ascii?Q?P868Pbb3GI0i9XwCOiwDJ9ZWcsdBjJNxNhjOE9quQUdpLLC/A3z8UKSHTSQB?=
 =?us-ascii?Q?HDeMX+sl0Va/eLJYXmUVtY5Ey4Gn55rnn677XT+HWdG+jivaeShS8eyxw7a0?=
 =?us-ascii?Q?SiJrDT/Y3rrU/kgGhdGVuusTMzV3wReFSG9EGkZDATOYWc+7j8LU49JB+ORR?=
 =?us-ascii?Q?sV6Izvi5cwbAo4aQ4aDWlwIfnIpfWMDYS6/YoffAUIMVpx0dwjOSm7nP2TWb?=
 =?us-ascii?Q?+SojaUknF3Jq7/Linrv3YDLza7fkmB9wWC1XQSSVyJrTsAYBAgwl/Aq4vX2/?=
 =?us-ascii?Q?tO9O4l2QzU7nv1jtB9IRRy9k7EexXoZfNGuiRUFxzMwIbUkhpmLzDa1b8gvT?=
 =?us-ascii?Q?CzPWkUhVg5lYPR16AvCNg2LktF7ZIQeYowdknfHG4Tkq2IaHz69Q98Bd72dN?=
 =?us-ascii?Q?7tSLhARXJLGJAINntQQS9wtT631p6IS6nh3JNNg88c/RceFE8XK805O21qNm?=
 =?us-ascii?Q?CtwaPxcfrUh0UWuzroXC/nsFF1YAxS3/y79k529NsUy4hDgzurF3kG5aEeY/?=
 =?us-ascii?Q?GPE3304EBBc6NW57Hlw+vO7HlVbZGgcbiCjGenD769YV3p9QczNy3qWJoLkr?=
 =?us-ascii?Q?ZBMrlq8e9BCSM2ZjU5yDHyhULLqlcp0UXCjSWs3QrrRFOAti1AQhrbg8Nlyx?=
 =?us-ascii?Q?bk011d6JcsxyhgBvf5VmMKqvw4SNNr17V/cl6WGHxSG6w8BnvCeeQnwsZba4?=
 =?us-ascii?Q?lSU+k4mvPP1g6nGs9A0HMFqUKiidNX4mlkR4ruyGPfIZy/qNTDDGHCMU9sQd?=
 =?us-ascii?Q?exdpPRupV134Xxoo6DTWmwBfDaIkdRvWnWqTzLVWTWHtcxecSCoaADSBXMfE?=
 =?us-ascii?Q?C9yWYpZpk7DcstgFIybAujM4pv8UrYBcf5O9AV14OY50I8BU+FGohRfESbQl?=
 =?us-ascii?Q?Dsu2VP44AF+eQvYWOceUA4xr2F8VvYaFJl8/cb4YN4wXcddSw4xtB5nBHgN/?=
 =?us-ascii?Q?N79RGFG+uXDa2dE6TRBZTYRRF1VZhDoeSm5Z/XULVCC8EmOrZ39yQ91hiaHZ?=
 =?us-ascii?Q?2PoWNFT5ZZOX36qKXvz1WQYEf5n4nvWvbYOTHYkwkkGLK/ZFiGP3zzgkybl7?=
 =?us-ascii?Q?YEz6KSRpvHfqGm3hYzIMK77JFAEcjkngF8NxiuUcNAV+EfaUqsGuPaIMnVDW?=
 =?us-ascii?Q?sahpEpGgMtRE3ItSX0grVK1YnGedMWjl4L2JyfeDxZxx8s6q8jqvMoxyDYuT?=
 =?us-ascii?Q?1NVnoDMSnLgUd1MzvbpNwuiqtgpthy0FmlUO0ckHxGi8Mg5o7DqCzX5eMWlQ?=
 =?us-ascii?Q?32wGZImBBQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09455b20-dbc7-4f6a-e4f6-08df40a3bd5f
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:00:11.1929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk/UeGgvspFLZlkgH84/CcX/0ECf3317A7pWg7uXAw572sqxz5iaxJOCw80SvpNj4mMbtulfQMK0b5j+j6ToiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595
X-purgate-ID: tlsNG-c201ff/1794477651-24D1E2A1-5F87BBAE/0/0
X-purgate-type: clean
X-purgate-size: 3427
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Changes in v5:
- New Xen patch x86: rearrange how mod_l*_entry() functions call UPDATE_ENTRY
- New XTF patch (XTF) Add test mmu-pt-update-swap
- Review comments

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


Kevin Lampis (6):
  x86: extend update_intpte() to support atomic get-and-update
  x86: rearrange how mod_l*_entry() functions call UPDATE_ENTRY
  x86: extend mod_l*_entry() to optionally return the old PTE value
  x86: extend do_mmu_update() to support returning the old PTE value
  (Linux) xen: Add new Xen pv-op pte_get_and_clear.
  (XTF) Add test mmu-pt-update-swap

 xen/arch/x86/mm.c             | 181 +++++++++++++++++++++++++---------
 xen/arch/x86/pv/mm.h          |  14 ++-
 xen/common/kernel.c           |   1 +
 xen/include/public/features.h |   3 +
 xen/include/public/xen.h      |   1 +
 5 files changed, 152 insertions(+), 48 deletions(-)

-- 
2.52.0


