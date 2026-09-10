Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73293C88E41
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:29:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415358.1644794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOf-0008Ui-Ma; Thu, 10 Sep 2026 20:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415358.1644794; Thu, 10 Sep 2026 20:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOf-0008Ub-JT; Thu, 10 Sep 2026 20:29:25 +0000
Received: by outflank-mailman (input) for mailman id 1415358;
 Thu, 10 Sep 2026 20:29:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lOe-0008UV-Bi
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:29:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lOd-0078if-OG
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:29:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa312e7-8faa-0a2a0a5109dd-0a2a450ba7f0-46
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:23 +0200
Received: from [40.107.201.41]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31322-b7e8-0a2a450b0019-286bc9296d3b-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:23 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV5PR03MB8433.namprd03.prod.outlook.com (2603:10b6:408:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:29:20 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:29:20 +0000
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
 b=hp0Zznnk/nnodc2pyc4ISx9XX4qtAzozTWMr0Db20vx8GxM8uBgJ3BKDmvMC0Mzf4H+gJqLkgPioauBD+CQ3MWcSooRHSpDRYzQGHGxFHJwaScYBglONScgBnbtRNZ9sRFYlDw7QHffELciz0ZPdzYmRHlkLDMx2DxeSBcoMcLXMTZKh3bjVAo1E5NYDRuX7HokpnrcU6CWwR48q/aCWS+hXij6UjUcCCEFNZom+AsBpYdOpB6MUstYu4qpabnjSKgYzQbSAkgZZpupoKI7HwPEs2w5+kUxQlsw2z+3Ej251e+T+jWTl0/9KBVVjttq05OItQOVYjomJVb/Ewf9fmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waGHhY/QzzCrf17IvKJaL2pT3f94Cq+lMBmL3GUDLVw=;
 b=wzIoHGWRK9sp/2vVTDxumWy0fPTb8HqB2gN2OBPYHnxtZ1+SQ+e9N6JtON006C/mh4CywPGchzsQEcvcF/AFXDQYC/rmwBdcVvYZWaweKwAYomsENo2K7b6+jPH6qZtyic755udSSCa3r/wiKnj3LmjF5/r+x7oXiGhw+3FAbsN2CYdMu6cXGg/2lmp9vMN7+FAV3+oW5H58D3YyPzg6prwvP8i2CWy08Yon1aOztqRq5FthyXeEttPdMmuE6nY/ehHUsQrQRrZ5z++4GqpohkQy5LSGRcxKCFxoybMni5AZTfIxKhQqU3ho3Rgc7LpXc5dqyUZ+m38/OUjVONSrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waGHhY/QzzCrf17IvKJaL2pT3f94Cq+lMBmL3GUDLVw=;
 b=O7fk9koMPdhuRfiLBAq/avMK9+ZseYn2C+Gf9N6EGAZwNODTWiCpNZu4ZZp0rOyntmSM/r+t5iywMSaI2UXrQBnm/Pth9alPC+E9nmJ/HcHbKLkJSlY+ZWbdD474IaiiXa9PVAbYEXaUNVdYJDjyrBrLiloc7tj+96kB/Za/Hng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 0/7] unmap_page_range optimisation
Date: Thu, 10 Sep 2026 21:31:06 +0100
Message-ID: <20260910203113.462943-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0589.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::17) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV5PR03MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: c5223992-0f93-4ef6-4b94-08df0f7a31c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YvbqhjrLQiDXUznSO2r58K62aiR+MzqAwuh3Cx4fT3vxznTRyvCQEy/YkftXtysn05i37JWqpQHaX2mUS/EV5UbnORBuuXOqPw9olIX27DYWqFOIggIck8TxsDzBWTKSxcvuQdpoQVtsMnftCDy0QcAnOSGQy6Xb6RcAKjgSRNWWqWD1OJ5IOnyJvhE3QvL3+uC4Xq7EfvrxwQhJ61zDlgw24t8LkiCkx+11bStR55qaVWvFtrhowxdLLiPLZ23w4w6dU5TKYiBpKYUJCwSrUNSGJFUSGftyteeb/jBpwo+egBCoEs4BMyBZvRcmOyXjfANMNo4SybMuu7Xpsj4tBHbiKM5WQlBVprf/Ij5suEFO0S9sPe9FU6OxrZYBA9l9pcBBHmVbrWb/R151h07k9z7rClvDB3Y4cm55qTmt3n88WngSNSvNIowoYxtZzgw2YoXgLOgQ5Ktg2WCoEm4EFC5TNMEdwIGvZfHdy2rpsHMpIVM7bKgWiLKkKviCYCSTnuL8nrI2tVYlFTM07t8s3BoYF1dDr8GFrDkANXe/dGk5rZfKd6SRctYGvpk3VxaL9tO2HzHeLnTm1QUy0gjXxQZfRRIi0fnM3A3AGu75ll9qZUxnQLRIAyZpYtEj0JmDPFZyrk3JlUo/lPgVujXTchk7BtAsujW7liE99f4WEpo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yA2cKiTc9AmtZ8rIHG0O0lXwoEz3qo754BMlkST0bJ5ssim/M7c9s6Utnjmm?=
 =?us-ascii?Q?MrLUgCTa16iBY4crQG+teQZsP7YgPSOt3PIk8IpF1bHg19HO+gkV9cUMZWlO?=
 =?us-ascii?Q?VnwYh071JIpxLiMpN7U/bb3ISJH+YTKyxlOE5V9D1O4xGjCGadOhZOZTB8ht?=
 =?us-ascii?Q?VtJn/UaY+BYIUczDPjjiS7/TC72zTqiL/qOKd98KXbAHZCheoMHPDUtudRl1?=
 =?us-ascii?Q?SdcZ+ozrzUvyL6F2giaBror62wThj6LFJua5rpXwK8iPWeVDhK/77sUwINRH?=
 =?us-ascii?Q?Qlkcnx4PxZKi5z1x+7jqITEoYa2HXxxJJhLNysEBJrTJNRhtHSwP3c3hJOpY?=
 =?us-ascii?Q?+X1ZKAJiJGOS6t7a4gVC8gGmCJl8J1RgI18F035/HolqBoLaZ+ShNkGU5plK?=
 =?us-ascii?Q?y+VR/Tj5c+NPEZGLWxjiYiEsJbzTZZpXrOH0D91z3qaFgr0GG3aGPyYYjjXM?=
 =?us-ascii?Q?WFmRlqBoKCEwXwZhPVoZGT6CGBAvuHv7OcqmDeK2HKB5R/5QFB1/IsDrtf/u?=
 =?us-ascii?Q?+LFlHZQ9um+HihUFSubPwm108GlYYXDNML6JwIVPCYZTu4sznLZRBqcQWDiV?=
 =?us-ascii?Q?05Z1cSJZGUqVIsmjGTggmUdyvLKxHH1RSO8hjOJJPJrCrSzy63G+NBI0dI0F?=
 =?us-ascii?Q?RVcmIHpL26A2CWVU7rkGZguJjhCBzQL3JbFy9okNw8pU5saSbMBeC2IasL7p?=
 =?us-ascii?Q?c2jOt5P+j0TLKNO4OptXFaQ/8MkUC1NJHiNfpPLQ1WWND/UwNgc+MN6A3TiS?=
 =?us-ascii?Q?KZ4LiJTeJDyDXhIGJwwfeVgI/cBusyGz8Muu4pGoeu4zSfsdlplP3pAnRyNs?=
 =?us-ascii?Q?z35lhwLP5f91btOc27YphvkREONIBVOysP/S3hH4yTFXSSpjPJXivnLHaw/W?=
 =?us-ascii?Q?iwk67i8wkHwSuB17kwnV8ZJfv5pgZfYRMU1IGSpC1I6OyZ5Q26o5/cgSADDM?=
 =?us-ascii?Q?kX9I1SY++KoumMM9oDHz+HvzApyv6lC6zdlnl9UxD+TozAT0GOdQHeTx3kNL?=
 =?us-ascii?Q?fB9qs10r5ubuMxDYvSDXaAXqKftydk3THKH12Aqna0CIeWI6ZfGq/2tdFt6v?=
 =?us-ascii?Q?HIr/utjLGwfo6z8tUSbNUmbIqloGzM1kcyZH7LY9gk1g0qKsVB3sz1i2xKyz?=
 =?us-ascii?Q?dHQ+mduoQxAN/CtEj3gXc44HqRPTkoM4Hk+lpd8wGFjKEDue51waG+83smjS?=
 =?us-ascii?Q?0KxrqpnW8my1WjJpydpRy6m60bkwzG2BTXHQXo5ul1v05pd96XIMj8dn8sH+?=
 =?us-ascii?Q?uKuD4QlrTEhrfDnxo+tkejSKiN/hOyXCP8bqFcnwtnf6yJvHZoYIEY9hxgGg?=
 =?us-ascii?Q?Kgh/oX+DHwRPOPE59lMvmZzQmXfiQx979vFoD684XVcI2DuMAPuFC0pHGIzz?=
 =?us-ascii?Q?8l8u9p27drWCkHrzMdb033WYQLbPsH/GWYVB0ntyjT0AufE4Lanx7ppDKCg7?=
 =?us-ascii?Q?jWX8j5ugMfXKEwd1Cln2HYgIy8MJ/F1VaVNANgjac4tyg2Ok4AMO08I73zUg?=
 =?us-ascii?Q?TGeMl7CnqfwL7BZCDr38VIDgGwZpO1GvwHDLAp7l1e9MYMbB1Nyc0Dg0fCez?=
 =?us-ascii?Q?GuYenmULGBn4SZluHoLlpIqO6Om7CU+SVEIy/ePviAKQxWR46YL/geqfn8oE?=
 =?us-ascii?Q?F69VPh9Jxxx4Fw24eQ0i/sHqzz2SladogRn7EFx63BCXGUbQSXOaAKEDpQZG?=
 =?us-ascii?Q?1RoSzsTtbuGqWARwoYsgj9KM5f9010n4wyFCoXm19uy1fpEROK6lRJBXon3F?=
 =?us-ascii?Q?NSLHtfgiGg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5223992-0f93-4ef6-4b94-08df0f7a31c6
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:29:20.6723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UussyGEPXoNn5l1KKbBr5CzTtjxbZJMbHRU3J0FTUPFmeI/tHGHHtmGqBwlaXV5xbPl5S8fJjQv/M3seFF6dzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8433
X-purgate-ID: tlsNG-42698a/1789072163-1BCD79EA-1B882FD7/0/0
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


