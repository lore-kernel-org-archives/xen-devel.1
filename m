Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619EBC88E41
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:26:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415350.1644786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lL6-0007SE-8B; Thu, 10 Sep 2026 20:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415350.1644786; Thu, 10 Sep 2026 20:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lL6-0007S7-5P; Thu, 10 Sep 2026 20:25:44 +0000
Received: by outflank-mailman (input) for mailman id 1415350;
 Thu, 10 Sep 2026 20:25:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lL4-0007S1-Pn
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:25:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lL3-001iXL-J0
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:25:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31214-8faa-0a2a0a5109dd-0a2a4509d662-28
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:25:41 +0200
Received: from [40.107.200.47]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31244-be1a-0a2a45090019-286bc82f6da9-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:25:41 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV5PR03MB8433.namprd03.prod.outlook.com (2603:10b6:408:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:25:37 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:25:37 +0000
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
 b=f8eP+diXAf0wWvEVvFwAu4wP2FuA0rxYmgtxE26LLcimYj95Br2zljWnIhWYJvvTdAqrtUSTF/fdtsDD1MeUX1lqv/Z+1reAYAXVetINiHNSLYTaYnQCOg8w6Ls+mJsP3/ifJSVG39Y6atwbpMguhkYYnPsl+cKRWhrhxXE0gSzuHlN979eepz3BbWM6UNdlLqt2m1YiyBQAsiTwaVMx/FysyTp9UGZIYUJeIPieFs5Q1BqaQDIl0QuJ2s458cJ9jUukJ/1LUjwj4xZdSYsaMcoJxs0SRoJcUXKhZdiZfTkBD6mLCCeCfn9xtEHTpSAbZwy4gT0xjwyfZGy9LHU7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waGHhY/QzzCrf17IvKJaL2pT3f94Cq+lMBmL3GUDLVw=;
 b=AC8lfvQoehk7/M/YAreBKSYG+vEko4X1yz5KYptwCnCCwRn5Q6xQEBVwlgRQiI7WdAXn846EwOrmpsPdfSdPxsyqxBZLsJNmsEQcDucy88wBczHsNDFBQEy5HnjZJEb3DZW0+lBPEhd6yj7CmOpknvogrS6GuiFLnCGIhfjs+uPMAS/VnvDi1gfP4UaU/UuinlixEONd7usyD5oV6fFRH9wWNd9sF1c2QIyd2vJ5Z2AX9Ss7QRM7ZksA5ZXUq/OOEN3KRP6DZeYgRkK94tK75hC47Ivrxr8GH8HSYiV3sypbz0MA56mmHfWGbvEpuU8mWWDnrkqviEM59GNOWZrX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waGHhY/QzzCrf17IvKJaL2pT3f94Cq+lMBmL3GUDLVw=;
 b=ZdLT8IWTJABxY+rk/nZEeJ+0JPMLoV0ftKb3kDKS8wfUN+Yx0f+QJBDYWyzvOSxGSx3JI0ZmwjUJdsTN8ITF9V38JrEauwDDIS5lZlt06vPwFooIDfVcgO0trVp7aPCr3V7gVuISj36mzf24lMrajlUOj6hY3T6nkvznLECJvzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 0/7] unmap_page_range optimisation
Date: Thu, 10 Sep 2026 21:27:21 +0100
Message-ID: <20260910202729.462828-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV5PR03MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9198f354-189d-4e8e-62f4-08df0f79accf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S3pN2NRfksSn4CDuf9hX4NyIS/40boOCSA6Bt+W+wY6YLFqHOpRZNNljCcQbizPkNoG1K70VL4bU69NYX/liNkTrq8nlSiyHgY8RQjG/zCilHejVSZB4Ig5fiR+RPcF2BUKlFqaljYxSm1uzYWQAqN1TZ4E7KXpQc0DT8+oSidlygmbfQGVwj2EBqb1+fQp7UyKXSe/vgrYCD13Mw8ZqKcUd1m5hlE41eH0ol2C8eg12fMa6sRPQ0JpT2+lSV3O21X2gUW34U2vkks2NJDM1tBudPefFjMS5QXMtMlqNan1b8HJHQ7V0AgqdXiGBYZF9qp4zMxN/exglXtsJCftdJbcY2VyLJgwdd3EcTcJa5mIqnbafMtNu3fN9khemxPbGnUm6BnprrvjiAb0bJIVVJM2xtMGdY1yPCNaxsYdaSNfxQs0tTlOy1mQNdQZvaHFhJ5CP1jmKFWhwrbkGT5L2nVBpW7LnxbjciU4Pfy6O6qovfyJPV46urDeztN2R8asyRwbwRBPJ4WVIpX4UbPpPoWpQKAZy8IvKainbIloe8ByxCKelnMuxy2He7JWIa2NZist4kuklXcUGI/M0Xsj9k1Gy5xUOjw9DxUCTF4ur0/dQokohcEH6kGyXcpR2fv/2z+phO4G6F6hRRQfzwtTpd7kdkkOmSv/vlvM3nbo1sDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u8o+lttyHOUhZF0+541Hb3+wL8Z8+4wWK/yBW5uGnyRAA7q4GYeEoH7UBGES?=
 =?us-ascii?Q?0OczW2CPnAzaJAOnzQLNnr4fQ3y9KA9Qxacn6/2BNokARG1r7mhESwFtY/yk?=
 =?us-ascii?Q?jbE1H38CP6GA4MDdSb/mAFHVaVTMe1/rsBJT3HN/dkOXnVFAoSz3u60Q3cuk?=
 =?us-ascii?Q?uIYcZj/wAWKrGiDTEiNI3TgnncfZut0igwPA0BrHTBg4860NWGVEQGLytRGC?=
 =?us-ascii?Q?fklgPT5QlYBAXk7BpHgx4Y/+Md3ZoSq/sv3UGOWDIy5DerR8w3nOBGlgP9tB?=
 =?us-ascii?Q?32DAaFMfUMYwSMlmaHzFCm+rTh0TF7UBI5yjZyKaqG3KGhEpaKk5aZ5miG8L?=
 =?us-ascii?Q?igiCflI2HWX4y6kToAnFFkLaHKl6gO5p7Vf2ZkZz6NRtcQkbzC2rGfRR8fAA?=
 =?us-ascii?Q?vC1FMtMjErsqEAEE46QDdnQLNOZRPm7Ph4vsA6tA/fpKaGkMZmIs+UTXDepX?=
 =?us-ascii?Q?RExaYrXZl+kf9j07p3sXqLhlrl4kGDI0ZeIUlAkJUcQl6v5UPVMFXkTuR+jR?=
 =?us-ascii?Q?/yQZOUkUM155XHUh+n/3gvo1P+0GFuHgknQ/RT2zb233qqnx4g9GfGOmI91n?=
 =?us-ascii?Q?NfBsxLvbFKzKbY25jlyDL+xX0kSGcJXmddwcSA3Kj66/FuayjmuRK7FqGvn6?=
 =?us-ascii?Q?KeeZXQFb/ZV/i9TDGRogeXMHS7BS4DgmCybOjUg/gR33HzYxolr5XA6QwDgI?=
 =?us-ascii?Q?nbqbGD5cWtpfT6I2vDr9e0UqRD5Fkw32SFslc9nJeKq21SgOVYexpyzkSdUb?=
 =?us-ascii?Q?pocBKCB+JxlHRj7iTxVreC95YI4x1kfNwL9XwFPcqeWMvN7riNcc11AHnh0L?=
 =?us-ascii?Q?cyTYBkhuEyBGFr54gswn4sd61kx6nk6YlhRRdnUqd4roDuJJIrkJ7hQFAo8N?=
 =?us-ascii?Q?ZM4JyIDrqx21KzvU33Wydf2YwxVgiIN9CwjJ1xYg+oSyUkEQ+N81bbnsRSrl?=
 =?us-ascii?Q?BFNwXPovhY7N1X3suEuT0KL1M6nTsi/KK27sgvqWLwLZU5FO47jaaCn7o2SH?=
 =?us-ascii?Q?uvnHsvrxi4ryomC0gD7zFi5unL2k+Ss6RH/tKHIPeduz1HlQbNGl2GF22DQL?=
 =?us-ascii?Q?VfKDevicX9U62LHMvb9C4ZCXDjJUCyjJkWeGTlAJp3mXonYOQpN2dHMbwIPs?=
 =?us-ascii?Q?UoIPNgai8j2lDr2dBq/SP05wFQuyH+oiYYlgjxi+PLKRnptCCmDvm/x/TJoI?=
 =?us-ascii?Q?io2AJrTuUtpf0FsgMvn4ork0K6ZCK0uz0aoAXl0nocXBGhlfJhUshx4RbDmq?=
 =?us-ascii?Q?G2LjwY8QpRKWIXbEHd77maKRccQbft0rq8OIIPmDrkYGIjL7/H++hMtwZonA?=
 =?us-ascii?Q?UEVPohaTi3XYmjO5pxVrhhVX5ePJ/WdKmOMQytYdk1lJ2d8we1dOVabUAHE9?=
 =?us-ascii?Q?8VhmOAwQddXrBnz9TkXmVNIoxNIGhJQ7Nnt90JSf/5BmyKU/Wtc3Ioz8RAw+?=
 =?us-ascii?Q?G0Zf3sGnUFueiMGbGh+ihTYt/AtVAvs0RtQQj2PIUZRwvU0gu37npx/iCwTL?=
 =?us-ascii?Q?wyl33ZJufLsu8WmITDyLGsRnqlXt5gEM82IS+GSuxO4o00/Iw2HHksSqw98w?=
 =?us-ascii?Q?KYlRaZSFw0kcKxi6ub9npx1XtqnQ86JGXlg4ksVXvXvG+5thaVSXgCJ/svFy?=
 =?us-ascii?Q?9hNdf4A+WYOowfcZTlWvpJOOiugZe+n61o+TyAe3ZuONEaCzyRRBRGuoeyRA?=
 =?us-ascii?Q?NUecpX4m85a4g/8Jx37FLHPAtmw5rMiMUWMH3AYkdfKQ84rdbaK+SuoJ6+0t?=
 =?us-ascii?Q?AgUvwGj0hg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9198f354-189d-4e8e-62f4-08df0f79accf
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:25:37.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg/j+5DvKp+dTOl+pWxJSF2lyLBrdINpVXze5X1gqa4HAydmC2siyQX68N5QsCkxSFA8ahr+/9OC3/eTEaNQjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8433
X-purgate-ID: tlsNG-bad1c0/1789071941-BF6D2034-01A357D1/0/0
X-purgate-type: clean
X-purgate-size: 3296

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

Jan Beulich (1):
  x86: make UPDATE_ENTRY() allow for multiple operation flags

Kevin Lampis (5):
  x86: Remove return value from UPDATE_ENTRY
  x86: extend update_intpte() to support atomic get-and-update
  x86: extend mod_l1_entry() to optionally return the old PTE value
  x86: extend do_mmu_update() to support returning the old PTE value
  x86: New feature flag XENFEAT_mmu_pt_update_swap.
  xen: Add new Xen pv-op pte_get_and_clear.

 xen/arch/x86/mm.c               | 161 +++++++++++++++++++-------------
 xen/arch/x86/pv/grant_table.c   |  53 +++++------
 xen/arch/x86/pv/mm.h            |  27 +++---
 xen/arch/x86/pv/ro-page-fault.c |   3 +-
 xen/common/kernel.c             |   3 +-
 xen/include/public/features.h   |   3 +
 xen/include/public/xen.h        |   1 +
 7 files changed, 140 insertions(+), 111 deletions(-)

-- 
2.52.0


