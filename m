Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3827B606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=iN+9NU5f
Received: from list by lists.xenproject.org with outflank-mailman.1502751.1698701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWI5d-0003DG-Bm; Wed, 25 Nov 2026 18:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502751.1698701; Wed, 25 Nov 2026 18:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWI5d-0003D9-97; Wed, 25 Nov 2026 18:51:33 +0000
Received: by outflank-mailman (input) for mailman id 1502751;
 Wed, 25 Nov 2026 18:51:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xWI5c-0003D3-H7
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:51:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWI5b-005Dcy-3b
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 19:51:31 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6b072e20-2eae-0a2a0a5409dd-0a2a4502a2a4-14
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:51:31 +0100
Received: from [52.101.46.56]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6b072e31-4900-0a2a45020019-34652e389a2d-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:51:30 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by BY5PR03MB4920.namprd03.prod.outlook.com (2603:10b6:a03:1f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 18:51:26 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:51:26 +0000
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
 b=UioR4E80tKLk46X4flytKn9mMyeiSNjT49+KufSet+pIZZuG/q9Es17iwZgKQ7tXtU2M8AtSdvfwx0mjrL1IcqgUPm7yJMHB2R7MvR42a1tiaDGLCYhm58mCXgg2CoNBh9DxGANsLzsC5a6U/LTNiCOzzlUprE7svQGYM6seZ0/cox5SGhSSUJa6E6wpwytUZY+mxQ099CrCxJBkT+XvgHBJ94okvZy5t1ot2oT9I2tsvSYpLu78NjJFZFtjn1zpUs3MJsLFk1FohZG1aEODqaT3EyzLsdehn5/ZuCeH9a2hU9UqeN0WWd2v8NYWiNUIHMyVAW2MJrrEX1MgVsb8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asl19zHooifC/4O7662k27As/VB2Ay0zIuFnpgdnIlU=;
 b=qEh8BgDIy92fCFhnydppCszE+z4d9hmyhC7KWRJ0y+EUtmgaFCoqItk66ElA7FuEzBnrTkQ6jcxUzwstxpP3Bya07wFVI+K1Nq9GnmDwRRRDpHjIK+ABi97O1jtYmw5gCq59tKm5ZQv56n8tc2AvAF5aQXKKi2SkuI7aUgtfgcqXZHL42kwVmaG19eVry0yYBJTVyLapPEXCsvPAtYNaZgfhskdag7NTB0I/0vutMURsdWvIT6AoxmchfHB3yfr0tUmhdwelaFlSZbL3dOSZhQOs7if5curDn0sB2qM11AQFwHP5wtV/jrxaghz3XL6WVylN6H3G/wu3G0K1VSON8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asl19zHooifC/4O7662k27As/VB2Ay0zIuFnpgdnIlU=;
 b=iN+9NU5fvul6zeiOM9aNTFDvu0sfu5MuOlmQGDs2pvmq61X0tRKHz3jJLmiv0tlnMznqxudODBu1q28CYDjwin1/6oaeKgPhBmPhnmEkDp0rPqzM0HqdMjTQtGMR1xHaNukZVew5Q+btMm1XJSbyo0Qymqb3OQTfHyPLtIM2hSc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v6 0/4] unmap_page_range optimisation
Date: Wed, 25 Nov 2026 18:51:16 +0000
Message-ID: <20261125185120.1766552-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::13) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|BY5PR03MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: 4716aeef-57bc-4f08-7cbc-08df4b251ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|10067099003|261009223027099003|261102123227099003|11063799006|56012099006|261022075727099003|261021121427099003|261021123027099003|261021135927099003|261026121527099003|261028144727099003|261022105027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	W5FxZcWzWC+brx5cgf4opBxUFQ9WHKlM0pCe1GRnmnwS24S1l+BtOl3fU4Nyf1CqUHxwrxeutuIiTTo19wyD+lOT/osS+UVNQdKn3sRxQ8ICHrp4G7PiAcYKgjhEcBAqQMS33OwPEhgqujuFg+4dNOsotnSGclK30QmCytU8rBcEOOzFINVdbjDJTluoZbq9ZSn6gVhY0sT61mRtlypoVLeJhE/z1t3dqw9WoDoMev298Vclr4bQIj4PiM/B5+yxXMn7bWmUdZEqy+lzpGOGqZjTZt220jlVVAk6Jn63Kn/0rNFxGcAOxRl5aQZGW00dq3KVj/ZGa964w98yheQltrVaYhNjhidlX775nAMm6N1tBqiD9TM5fsWCr52IChcUj6PDzIObnmAC8dAtfL6a4Qz8kxk+kNhakgFqNiTcqnTBedJuw0WNbRhrLE9BV27A2nO6xWvmqXZcGIVYI0FMmQZvsRXfFbt7kVXeZbw6FMPdkf/Npt3j3ybaoxtiBc/xmqIaXN+nHFGS2P0I0I3vN/In/xwYiihWpihOMhvQIZSw3YcjPPLvOaI/eDKDhUaWuhqaHS3A5B46DsajG0KvX3lKFfhn4bYcvevevYETnjk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(10067099003)(261009223027099003)(261102123227099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261021135927099003)(261026121527099003)(261028144727099003)(261022105027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x1j7bWPi5VeUXVywqII6X7WHYlORHQzweqsOmv8OvmXGn2DCHZFgOIcfxxdE?=
 =?us-ascii?Q?vfgp7wxLC8AGpbJbtTZ1AULKxwC/LfLLcCXuXHPl0S3AeJ8WxZdf4xrFApPN?=
 =?us-ascii?Q?3MecONFMZdTT+JyT1N+ZR3pGMZQ8awhB8YFZuKGoiiU9z4wIoyMdvgJowuHQ?=
 =?us-ascii?Q?3embUA5XIYViwgpmuIzSGrm63FD8BjcP2+vE1at4X0Qa2qQRRy50GblscKSa?=
 =?us-ascii?Q?VeHpBpkm/8LKXn5VrpgDq3es+R8urbpVbAV9xifGb5JNaG/nR57HbyJn88Oc?=
 =?us-ascii?Q?JP0JvZqtr3UDtbw0em6zlN6F7lD/f42OQ9sYsvBauO6H3BpenyMdV3QtEA1g?=
 =?us-ascii?Q?A6EHci4lzQt61DI+UwIoyz7VfwFwAiFwGpJynYtcG6hwWQ6Y7tB6g9CmZydE?=
 =?us-ascii?Q?iA/52AlFfDzIl+niCuzR9/SswGzhEeiwaWaNxXHTfQ6OuuCXZd1NUSKI8pZM?=
 =?us-ascii?Q?ZXQ/dx2M9Db7T1K2Wj2sen0doDlbi10RQoEeLMNkO0dt8pQobVKZ8HxJtzxZ?=
 =?us-ascii?Q?0wWp9zxAm5kg0IPYqfaEB+dHaT5J30M8L1RAANzC4ih+JN2SdUKQIWDK4hGH?=
 =?us-ascii?Q?0a7vDAi6tskmaQ7aVZCPKzmZ+egA0LcoArwLyvv/57sXDoV+vh0MtfEPo+6M?=
 =?us-ascii?Q?7GSKdYD3kJCuYISojc8nNCy7etI1/Mb7qTgQe1MJFM3jAZL2I8QacSTHK8EE?=
 =?us-ascii?Q?ds6ItOTpY8xl26FmgWFB0vX9Lk8/4TVzLDSm+8pWIviLUP4dXraBKK7lnXzU?=
 =?us-ascii?Q?syIxhcxzTAhTynIxImIRzvPiAhtatcr8bTdSIbh/q+hnD5I/Kldk8BKMOaCq?=
 =?us-ascii?Q?a2HrN9EswkEsslVaUA11/4wEFuEblcdctBLRpwm/Wmk6mnxfmjd3kQ5X5cId?=
 =?us-ascii?Q?q3goh2rFZlMl+XUewacbx6Vp8xSjzepRm9BIl5oLJmPHIPybE+kyIpRPxFJu?=
 =?us-ascii?Q?I1QahsizhM7vFSR7vo3v0HtOD88UQboRfFfLwtgINt5N9tOK+lCpNQFCgRkB?=
 =?us-ascii?Q?b6/Dem3FQ62zHUHP6jfJCBntRr4Y9A68CFabzJC4J6iQ8+ju+z3LvmOwbtkT?=
 =?us-ascii?Q?2ghqc/ctbeYOsBSWeWnKKa72ROoaJNPK5NtP78dc/d4lqt4CuZF4OR+MN1d4?=
 =?us-ascii?Q?OOYGQ+vh32O+Vitp9Q8pZgrM26XFQEuW0FDcFEZMRejTJ6iTHLQLaWPJ5wVi?=
 =?us-ascii?Q?sMUaCqF0+ck6ArIMeJ9tCILalTmhUDcwMA1USd3bb4oMhdFIrKx40JzIWU9M?=
 =?us-ascii?Q?lNndk7M9pmMSgTZcKISzhviOZIyutZytGLSXjuxNJQopKSX/8PxW104SiqRB?=
 =?us-ascii?Q?45lMIDwKpMLv+TrJoQB7fCHqoB2sHPlB0d+RHGQEk6yDbkIin4JFvNV2CCj3?=
 =?us-ascii?Q?Qf7r9XV1PEm8orb3ZoubVCXibH0OipYb66UUnnqaz/1TjPbeNK0MQy5hOp2y?=
 =?us-ascii?Q?tXzUcR4IvzEkKsuNe9mgIuAfNbd/M/zFTQ0dO6AqsKSt51hLAUcHzU9zDBNK?=
 =?us-ascii?Q?MNZWhkLS5QRf+DRTPGJrfJdmIfUZutuMkiuYA0NMirXK2LnCQCjyLMG4Xqfo?=
 =?us-ascii?Q?ciydlZKIc72Br7+wENO3trFDxWxYlu31UBgxWj0kI4inswVs33kMogNPJ9rq?=
 =?us-ascii?Q?YDLXbKh/A67DzJ0ZjQ2I4b6tmiy0QOarX7uaBKRAHIdEVXhRLWx6D/kgAuYk?=
 =?us-ascii?Q?7R1PgdZ3U9u/JPlvP71/WA+PsYdYeK2N+jGLzn2yz811yntUioCtv4TmHefn?=
 =?us-ascii?Q?dkm6HrzMIg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4716aeef-57bc-4f08-7cbc-08df4b251ba8
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:51:26.3650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMSIAwMjvLmnoHXJIA7X9bmg5mRPWDAprb4XnBTwszRzb3uvEkzkIHoZrVVfZt8CuU+IC71mhgNh/IdjkOijUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4920
X-purgate-ID: tlsNG-720697/1795632691-F158C6C6-BF99432C/0/0
X-purgate-type: clean
X-purgate-size: 3391
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

Changes in v6:
- De-duplicate code in mm.c/mm.h
- No changes to Linux or XTF patches

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

Kevin Lampis (4):
  x86: extend mod_l*_entry() to optionally return the old PTE value
  x86: extend do_mmu_update() to support returning the old PTE value
  (Linux) xen: Add new Xen pv-op pte_get_and_clear.
  (XTF) Add test mmu-pt-update-swap

 xen/arch/x86/mm.c             | 95 ++++++++++++++++++++++++++---------
 xen/arch/x86/pv/mm.h          | 28 +++++++++--
 xen/common/kernel.c           |  1 +
 xen/include/public/features.h |  3 ++
 xen/include/public/xen.h      |  1 +
 5 files changed, 100 insertions(+), 28 deletions(-)

-- 
2.52.0


