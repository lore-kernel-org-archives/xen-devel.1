Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DACC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 15:05:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371721.1619191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMt1-0003Ur-9F; Mon, 27 Jul 2026 15:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371721.1619191; Mon, 27 Jul 2026 15:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMt1-0003Uk-5K; Mon, 27 Jul 2026 15:04:59 +0000
Received: by outflank-mailman (input) for mailman id 1371721;
 Mon, 27 Jul 2026 15:04:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1woMt0-0003Ue-Cc
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 15:04:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woMsz-001hsa-FB
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 17:04:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a677383-2eae-0a2a0a5409dd-0a2a4504a49c-44
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:04:57 +0200
Received: from [52.101.43.68]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a677397-b57f-0a2a45040019-34652b44811f-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:04:57 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SN7PR03MB7120.namprd03.prod.outlook.com (2603:10b6:806:350::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:04:52 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:04:52 +0000
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
 b=eWXIqgmVi0F8xuKIVCs8AcrXcx4KrTJxlgpdZSdd+fRqRWzcbbJS1Vd0kkt2rlRj9D1xQHLhgGIhzdvuF5Y/vHsnqZ94bmz8HNgHSkiBRqDJDbpK8pEqmZZ4zKztOJN/ffGFd3ZTPCHvug6ZhJUigsRpcMEEg7S9fZqN//iZ2rI71V90lFJTpLwWGhrivY/HfAOtwPJdT0U1QDxMNvfVhvDXt7gDeP8122JzlH3TWUouZfMg0O5QL6yII58oojjrg5wu5C5C2++7Nx5UJQzwjf4iELpG2SHdBww7hBxFZ4FI7ILHrgDVe2oMxJaP231igdRDkHgFZNcqHiid81GpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3/qE33aGnB0GPdUTVyxXXwvfLiLbL5RP15YnR/uhIc=;
 b=r4mpxGCaSdmOcsCZGfZl7slYoNZqzym2L5wivkkM3Wd6nOg2r78U3JPJMfhzmyQoUhIOeeceC0vPlYQ7+WCujz6QMLzJUopylg74dkIU9WRWjU8Q7nz7LK+sKuerwdHGK6ZhfkMdAcIQnloEkQ+Vu18Xii6wfqy3Im91U1NZCF6I4X8T/P0YHO/TL5YMMCcFYjyu3h9JRVBhtcmNNLzAWiz7pQgg4WVtHlx7FFaZ0bWPnuXCjJCgacBuCSCFDWqkOJNqpMUeGHVAPAWhsVdvwvt/rBtDJ9alM+useY4FQ2I4jgGCltWk6TiitPpN2JWSv1MMcgM6qS/P9pPvRY2N5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3/qE33aGnB0GPdUTVyxXXwvfLiLbL5RP15YnR/uhIc=;
 b=tr8uhmU4CudnxNqdaJpoUwL02ofAYvWAcqal0/CDr9XsKpeWTdUY98QmSuZ7R8uM5GWbEmmezPPTXWAPNoCk2Ju68DWUXyw4rrenMGsFRE+P5ozRKDeLruzyd9e8YJX0gxoCqjf3AJDNbjCC3AVuzQuJvuyszZYxNNCp9TTULJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 0/4] unmap_page_range optimisation
Date: Mon, 27 Jul 2026 16:06:11 +0100
Message-ID: <20260727150615.1373200-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0492.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::17) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SN7PR03MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e479039-43ca-4f71-fbf4-08deebf0697a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	cbj5mRDmMfEhfc7GdHVoUPlrcLUgWg7qI+x4xD4Rg+CMyCbZyr2QFVCLM45R/+4nrTT+OXj+qZyJsi6z43b+D+t9GHWZJmS+5BKzsKvr59P3lY50yXM0vUUIs5LHV9AaJVwWH1Vun+gFe/UWetPkGLy3+WDkZJZ9r99zTkGI/sVD2RPrq0vp6J0ox1nAMBdNg35ECggZ1ju3LnKGq0BpBf9eY/c5Zrytupxle+FFuI3oyzGxy0F1ai0CkHqM07V8oDrVD/k9Bn/O+8F8gUuZ6x6OI4C9MCXIMeYiGGDgEF3sxalgcuEWvBP0I7j9x4JB9cX5Dt0IV43lhyYiYkFXv0p5gYSrqYy29rDMTGQxOv4yFaVze1y+93mKYzAx8ZfjLB1gul9Qi6IHyLxiuPA4J/pkIw62hG5FBZPOkxO34b6qV3Owgjs6YJJ3CYVCE6T1oqqCXH51SdUEqT0lPeT7ub+efvLgL3vj5D4/n/5Msyvgnz58yj9WrJ1GudRmbEAhCdYQZd5ABUoq+DDEL3/s+yRCjIYvv21z2Dlxy7ne/Yv19RMuNTGITRfXAZsDBv2pMl0powlL9bGYRIz3+HeHla+CyhJuPlNwP9yonz7TeeZyKxAVzollFBGqGj0SYBgx2Kl0rhCncH1z+mP6HUuglkSuFvDG7PWZNJ7frDVdy/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2vK6LdkePVyNzcLXEBwb7WoN2ouwistNWs/4n+bazOicU2rf/VLnQT9RfDF?=
 =?us-ascii?Q?iiDLi7a3lT4fwnPdO6PPcZ9JvgxudIVfBoTTpmelYTyYAImjvnw5T+1EZd1t?=
 =?us-ascii?Q?E798zLd2Su7tsTl4BSagRvZxEgCV7NFtOEf3cmGxSODfPQztisr3xblxjtnr?=
 =?us-ascii?Q?R46NOZPcLtrYAON30Vlva1XExnGEHOc2U6CkThjzER5pSLh2HQJHPLialVMq?=
 =?us-ascii?Q?hrAxYqmOz85nn4S868yWZLUKKIMsOZ+bdTZtv73INlt9mV9OhKUsDMOefX7b?=
 =?us-ascii?Q?DKPHcCeAMBwFwQsUPNlaZkNrXCoXj9t4XNnx48wmhjJLyWYKaMi0LQxjkugb?=
 =?us-ascii?Q?qjXAQOq19B1+PJnO5c1+9n0mRVN+1dKk7NzezhTVuadpCq/bA3ILaKh00lFf?=
 =?us-ascii?Q?IdlAItNTJQKKrryuuFeWR9aIdLCR1hPkRF08P8h1me+04tk/MxQRF4crbSEH?=
 =?us-ascii?Q?pSBDZfDUb6sqKKlbzmaglN23Rxe8g4bVx64x+twNPxqCwnp3FczdWRjbHjJC?=
 =?us-ascii?Q?H3AjY5Rmi2kLhqnu6KFffpa61bZ1WuO62S3wWhSi75MGWsJZNd/2qhq0hRx8?=
 =?us-ascii?Q?iumskNrUW9b9LRoSPH7WermSEYmJ79FXY+ERQsPc6bUwO1hbD+O6dCogRDdF?=
 =?us-ascii?Q?gLlthjElzN6P0khzAafBoDHLGrSoxq9utgBhXohbPnGNRJPljOc3Ctrpoyab?=
 =?us-ascii?Q?V6cuQ1IuMccFvddMnrD635oA1Qho3X77171MA1foeD1oTPKF+BJVPOS+Fipq?=
 =?us-ascii?Q?y096ELbmMBxbg+XxYSwzzyqKwQrPi7A+5phePUq8FF87w3uClsDNfrVgoe7/?=
 =?us-ascii?Q?gl9iwsXSgp4erTqWpXH4hFBaCXgcbIy3k1LJ2n1bq9Kfxc1wy7pU0pv7S+K6?=
 =?us-ascii?Q?N3jCbqPHDxlLZbIzzB7z6M6c78KK2ro4/ArsGxN3D685etmibkQTFh6tKCkE?=
 =?us-ascii?Q?QKuDPA9AH+inheVKX6e6aHKydXTwtxJILc0tp84W+5+/THBPVKYiclEhLDiV?=
 =?us-ascii?Q?3qQ/JX4cULWP7CrqGi7aajTsDSiyadWI42eQObhMgAQ1q5pwJP3zcRwRo2jw?=
 =?us-ascii?Q?Xaqq5BSjyXQ3Lhy5YWWWLvhiC7Jz/gGpV0aeEkbhr5cRE9BUKTqNPIVFLK9t?=
 =?us-ascii?Q?6A4qZ6Ffcx+E4zxkkiyY+o8DC2QWTWtNOIlwqDydNVuMy2D2sYYqB/eKzpA4?=
 =?us-ascii?Q?drBICVdh3DNfoMow5BstRm74h/D7KdQtVK01Dxg/1dd0A6TWDDO+s/xMVxcR?=
 =?us-ascii?Q?FYnuGsOM/tkxTTg9aN61MaiijHfYRHqj3+QLTKv+Xw783HsZFBWDW+dq4Nzt?=
 =?us-ascii?Q?d6gnSsfj5FQc0sLIZ+8SAscwqgjMPJYH4dAJLgdiVonNw3RBAho1pLS0NHFJ?=
 =?us-ascii?Q?0veCAqPOC/in3w5M85YOROw9nn5KkZfBf2xvWWpytPSzJUJuxSpNMMIS2Zef?=
 =?us-ascii?Q?Yk5BJW7wtIOYoFeXH5JU7koBfDONnmdkl42/lUpJbaVBMvli0XzQEFRD5VcX?=
 =?us-ascii?Q?uGpxq0GxKy12bmnlk19jlSKVLWVk4uHQCWFeHMP5yiIHcHaO73v5jHLT5mkP?=
 =?us-ascii?Q?NPevca1uQTSm0UZsxqfoCCIzqYV9JkuAqenztCUcEKD5e881KsjLUjijHqWB?=
 =?us-ascii?Q?hvh882lBt6o4oh431rhC/0FcVoZb+nANOW8PNK9gsoHw8dVnDkFksN8om6oX?=
 =?us-ascii?Q?v7nPuiQNej7ZcHF3D6XxJs1s8R7OpcW43tWz8o6ZQqlByhRGOeX5J+ReBADR?=
 =?us-ascii?Q?KSahB5bzsw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e479039-43ca-4f71-fbf4-08deebf0697a
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:04:52.8551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnKY/uYctsAyjgEXcbulh5Kuu0whYUxzOs6YSjqBMxVe3lt+hQsDMfiWhm1zK8sjZkx5mu2k6EbIWvn1+P5zgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7120
X-purgate-ID: tlsNG-ebf023/1785164697-587C6B50-F9D81FF1/0/0
X-purgate-type: clean
X-purgate-size: 2879

Previous discussion:
RFC: unmap_page_range optimisation (avoiding emulation faults during VM migration)
https://lore.kernel.org/xen-devel/16133EFF-88FF-467F-B78F-E96EB148C3A5@citrix.com/

This series adds a new pte_get_and_clear hypercall which Linux can use
to significantly improve the performance of unmap_page_range.

The new hypercall reuses existing code from do_mmu_update, mod_l1_entry
and update_intpte but is careful not to impact performance of the
non-pte-get-and-clear code paths.

A microbenchmark[1] which allocates a large number of pages and then clears
them shows a performance increase from 1100ms to 700ms using the
new pte_get_and_clear hypercall.

Further profiling the microbenchmark with bpftrace[2] shows that Linux calls
unmap_page_range() 23 times with an average execution time of 50ms
dropping to 30ms when using the new hypercall.

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
  x86: extend mod_l1_entry() to optionally return the old PTE value
  x86: extend do_mmu_update() to support returning the old PTE value
  x86: add new pte_get_and_clear hypercall

 xen/arch/x86/mm.c            | 106 +++++++++++++++++++++++++++++------
 xen/arch/x86/pv/mm.h         |  29 ++++++----
 xen/include/hypercall-defs.c |   2 +
 xen/include/public/xen.h     |   1 +
 4 files changed, 109 insertions(+), 29 deletions(-)

-- 
2.52.0


