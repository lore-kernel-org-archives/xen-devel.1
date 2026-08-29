Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD2EC61DBE
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 05:06:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402609.1637611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0BGx-0006Yz-SS; Sat, 29 Aug 2026 05:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402609.1637611; Sat, 29 Aug 2026 05:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0BGx-0006Ys-Oe; Sat, 29 Aug 2026 05:06:31 +0000
Received: by outflank-mailman (input) for mailman id 1402609;
 Sat, 29 Aug 2026 05:06:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jan.SetjeEilers@oracle.com>) id 1x0BGw-0006Ym-CI
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 05:06:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0BGv-003pTI-Pb
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 07:06:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jan.SetjeEilers@oracle.com>)
 id 6a92688f-8faa-0a2a0a5109dd-0a2a450a82a0-40
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 07:06:29 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jan.SetjeEilers@oracle.com>)
 id 6a9268d3-f2d2-0a2a450a0019-cddca520b722-3
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 07:06:29 +0200
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67T4neTt645119; Sat, 29 Aug 2026 05:06:16 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbpbar28g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Aug 2026 05:06:16 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67T540CG035601; Sat, 29 Aug 2026 05:06:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4gbnvbaw2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Aug 2026 05:06:15 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67T56Fs9001517;
 Sat, 29 Aug 2026 05:06:15 GMT
Received: from setje-aarch64-ol9-builds.osdevelopmeniad.oraclevcn.com
 (setje-aarch64-ol9-builds.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.248.24])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 4gbnvbaw2h-1; Sat, 29 Aug 2026 05:06:15 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=NKXDRSaJyv0PFAxOBaUHOSBkU6qh2
	+RSMwCCKcwoUUE=; b=gMiqcuuRaHDU8Gk6kx3Ef2mNGwQK2/r7+3lvRdVPvz4z4
	2ijDR5KoJC/3Blsa6YmQxTm0sU86kw4DtZOkP8kMahTQh8+ef3lVcLQXaK05hUrx
	fGk4T1xzMgeAKvpKiLQvl6WKvmx3slZnJSHkgPQA12XhAG7Ze3efStokSCoIq1Jz
	d3vCA+MwRoHIbeVaw18b4mdxfniIFOrsRm72p6m4LveQYMeEF5Qy3gxo/BZuxpvK
	twAGkLQfoMWr56x9QJNp06Nfshvzm1jy911oa1Zyc+4yYMv+d8SCWu/6JLSkHnfr
	+JUkZM5GruNnYfwx+I1isLDvUlwxTAqzGw7hg7yUQ==
From: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
To: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>,
        xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 0/1] static-memory: allow skipping the cache flush
Date: Sat, 29 Aug 2026 05:06:10 +0000
Message-ID: <20260829050611.3353566-1-Jan.SetjeEilers@oracle.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608290041
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA0MSBTYWx0ZWRfX6cuRJJuzM/DA
 vXj5+3tWskOizMvKbhKxCt1Q6nnukXFtPQLxUjHznYSYd197vtpIvDp/Nd7uBhU2k253fbnr7//
 Cm489OTgUxEvsVAIW3gJ0Vm0BNYd3JXoWj/BavbHZ692svmVYQNY
X-Proofpoint-ORIG-GUID: IAyx5194Bpxqyo55PCMi5aJkJzMhsBw-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA0MSBTYWx0ZWRfX8zTWQmgIXn1Q
 PxRXav8onDUPMq8W15Hg5LS0GB5N7VliC1E0UTTBU+P4N6X0dN73/dHWEAGXNLjjV3bHxcIwwUc
 Qd3hTzMYgxbul1NLq85CyhrlGmKnR/p6KDU+gyIN4sj34npYNwbTst8YtuBRSYfceg20HeGepWr
 VppMGbxGxzIVK/GZ+apTeZkTSUJxYbdkY51VJj6iqSOo6FvwJb4cLZS2fvpUbO8Dc1MTqTwSSl6
 Yepp+VlsSZtSswtMKMn4fQNqPwk79rnvppaJH0Z2QqKQ0jBumZs6P5u+BcKeT71UR7xttaV7OqH
 wWB5+uvqwy/zsOlP9f+ET8k3Q5sfoOg3mh0hUseliAemzPJCYDud0JfC5g30d/ofHU+IJW+XDEY
 8fvmeLdUhrclxNhJe+8+v3N1IHb7q0gMjSeeMEXbwgqKpJ9U25gsR1ndBNgbn5Vk7sBF3hagjJa
 rCU3TBW8ebbkTpfW+5g==
X-Authority-Analysis: v=2.4 cv=DMi/JSNb c=1 sm=1 tr=0 ts=6a9268c8 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=wMlaycGzNReg4xrbBi8A:9
X-Proofpoint-GUID: IAyx5194Bpxqyo55PCMi5aJkJzMhsBw-
X-purgate-ID: tlsNG-4011c0/1787979989-5A9D9CFC-30881EB8/0/0
X-purgate-type: clean
X-purgate-size: 2445

Hi all,

I would like feedback on whether Xen needs to flush every page in a
dom0less xen,static-mem bank before assigning it to a guest.

Static-memory support is currently enabled only on Arm, where I am using
and testing this change. Its implementation and acquisition path are in
common code, so this RFC is about the generic static-memory path.

The current code cleans and invalidates every page in the bank. This is a
safe default, but walking a large bank can add several seconds to boot even
though Xen only writes the pages used for the guest kernel, initrd, and
device tree.

Here, cleaning refers to cache maintenance, not boot scrubbing. With
bootscrub=1 or the default bootscrub=idle, Xen assigns dom0less static
banks before boot scrubbing starts. The pages are no longer free, so boot
scrubbing does not clear them.

My starting point is that if a platform permits the untouched pages to be
cleared before guest start, the guest cannot depend on their initial
contents. This is a platform policy assumption, not something Xen's boot
scrubbing establishes. Xen already cleans each page it writes during
domain construction.

Would it therefore be reasonable to let a platform skip the full-bank
flush, provided it can also guarantee that the untouched pages are absent
from all caches and that firmware, DMA, EL3 services, and other CPUs do not
write them before guest start?

The attached patch adds a default-on staticmem-cache-flush option.
Specifying no-staticmem-cache-flush opts into the faster path. The normal
flush remains the default, and static shared memory is unaffected.

Are these conditions enough to make the opt-out valid, or is there another
reason the full-bank flush is required?

I am using no-staticmem-cache-flush with bootscrub=0 on a 64-bit Arm
system with two dom0less guests. Both guests boot normally. Skipping the
flush reduced Xen startup from about five seconds to about one second.

Thanks for any advice or help with this.

Jan Setje-Eilers (1):
  static-memory: allow skipping the cache flush

 docs/misc/xen-command-line.pandoc      | 26 ++++++++++++++++++++++++++
 xen/common/device-tree/static-memory.c |  9 ++++++++-
 xen/common/page_alloc.c                |  6 ++++--
 xen/include/xen/mm.h                   |  2 ++
 4 files changed, 40 insertions(+), 3 deletions(-)


base-commit: 79225a0c77e13b693b4d2b903a88289704b79db6
-- 
2.47.3

