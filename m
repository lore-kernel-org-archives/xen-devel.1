Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE59606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=rrpszTp1
Received: from list by lists.xenproject.org with outflank-mailman.1460917.1671812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqC-0006as-LG; Mon, 26 Oct 2026 09:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460917.1671812; Mon, 26 Oct 2026 09:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqC-0006al-IZ; Mon, 26 Oct 2026 09:18:04 +0000
Received: by outflank-mailman (input) for mailman id 1460917;
 Mon, 26 Oct 2026 09:18:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xLGqA-0006M6-Iv
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:18:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGq9-00DLXQ-W4
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:18:02 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1ac8-8faa-0a2a0a5109dd-0a2a450b96aa-6
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:18:01 +0100
Received: from [52.101.56.3]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1ac8-b7e8-0a2a450b0019-346538035adb-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:18:01 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS6PR03MB967558.namprd03.prod.outlook.com (2603:10b6:8:4f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:17:59 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:17:58 +0000
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
 b=U5VRO6JhTSI2dpqi03AOtjhidklWhYKxNjKwWX5BsIwer0n3mKDFHJi9qAZGY0g8OWqD0UFK/34nL+6lXYLcYgmYARPHtdsesJs0R9bEbuzSzaGQ1dzHQHOaZmgf7ToWtdr3V0w1F1mCyNq9KixPdvtdHVYJW0U2V8nyFqJ85EPXcAxG3+NMzCQpRmediisVFAhr/FToViurBm5HSkef4Izi5gEYJLnuaO/RC4Z2AOhQjQVMEDNx94t+vXo/xru0sLfV3rt41Chtr7ZYT/7pceXIpCt6vxzBaJaIBoPun6dKr/tiymRbnOvZq/2uc264+UChG8RMdiGJXD9hbYtwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtMBovw2cKtncPnk+tv7LyxgTHciKbQm4Vgw2i66//g=;
 b=nX+Lxo/skooN6MWpRP//ReAVrLW3xmbxlg5obCBPlXcLx9YKxANX08ikH2npsy9LGReM83yiX2yD7LKo4l6lKix7BWrUvFXcAFwjTie8YpvoLD1XjAKCRCi1LWLWLJ8mlOldAtxmLgz+LLzSrRlRo0uz0FuW+P2lZSm6aIyRpNwlh0H9mAVTjsELmmToyzr9whR3fByWt0SYOnP3U8+YYRPo9ixEx9Ub1vNsr9QE/xphlgmQFbstI/Gmtig5rNWaUChZ5vn/Q1bCepOCUJ6v7XFvDAP2yUdLF86QbIG+PsnQf3eUsguiDC/c5eqSrLv8Cno8yWY9woik0omxsvkvdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtMBovw2cKtncPnk+tv7LyxgTHciKbQm4Vgw2i66//g=;
 b=rrpszTp1AnP1OAVtA/99b2TfitS2q82igub+6kvn15bUTnnr59r+4+9TT5cA+hicZAogasQUe8LXlq5aFZnlVrHBo4P8YC/L47gin52S54AfqGke4RnNtJb8NHC5/6JBC2Xw+lF+T3o86TmI9tHrbvH7xC5lLikD1nlHcx9hvMk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 4/7] x86/kexec: Support non-page-aligned kexec segments
Date: Mon, 26 Oct 2026 09:20:14 +0000
Message-ID: <20261026092017.3880869-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261026092017.3880869-1-kevin.lampis@citrix.com>
References: <20261026092017.3880869-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0013.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::20) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DS6PR03MB967558:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f95bacb-b4c3-44e2-8aa0-08df334206e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006|261021123027099003|261009223027099003|261022105027099003|261022115727099003|261022075727099003|261021121427099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	VOSZ+7le3qgaVOs/WCZ5SJMDQDA9oLOcW2qF+4tPfm+rKv+dVeQq59XDfX5vl2eQjyXUcs83zXSd/7cnMAKBN/QhTxgjIIusPbM2g06IJiSDkr1+MbVB04AFm6OSLJ4SorZlccY4oH0ZT54N6SAjHXBA2ODnZi55UgqS7YAfmFxHDhMjiVvcagoOAsNKkXeuSi8+FUzG3Iqqskw8kVHkZ8eXb+yp+feydSPqzc6kLKqO1+ZohwN4tiG3lP+jBJvkqdzu1a0WbkIkAWxZEhC7USSXp/zOKBR0VOXKwN0jODNe/NNa127C6Myl9UtuhBrBQ8MFgUNg4hNJJrLDDEQnXzEnueQBunqT+D4WwYyDubqqf8Gm9Fbtb52SrJb3x4SD+/Swi8nAhLCDrtfahcjf/WX63dZ6E8QabOWbkA8gh6XqlJm5HfuqYW6ayB4/o8LfiAJjHa/Kk5pf4YwqKqQSBsFuCL9D/Ovh9w1Cts11q2unW2Bj50MjYZHbBgKxdszc9Sykm8Zh1m4PFV2OFdn1LKCyUGbRvaVs0Ud4jyCZtuL3Mbym/4TNJU+ddVH9PYeiJLXC9pCWhz41MogorIN7oF4JfJ0aDJmiM/6TUgXHxtQBqSDB1ytYNdOVKyiXiQHlEyGerB3LWSRsZgmdmQve3ByFLOZLSVBuN8u0mpuZK4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261022105027099003)(261022115727099003)(261022075727099003)(261021121427099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ASqu1EPXzKyu9HvKdZfCuiB7K+LUF5Nmqcu4MPXB46RRKO4CmwvZbmrYUzu3?=
 =?us-ascii?Q?K40Ql4EFTYpUbT6h54SLIMfj+xUrpEYCOg2AjbmnwU1YogWAw4Y/9qT3rWZ2?=
 =?us-ascii?Q?TRepmtKHxuvX3cAKlX1n3bxiG24lQq4i6BB3GYsmtp1eb2r16rCV7Qm755y/?=
 =?us-ascii?Q?bnXcLdzA2HCuyl+bzMuzVEgzOOhAMu4Bb1MXfNdCltXjPLKzj+PVZLCxm5N7?=
 =?us-ascii?Q?NE2r0NGw97MiXJ1gxFBe8V7dka80E8R/sbxGfhiWDtta+wuX7l7QYgni/c4T?=
 =?us-ascii?Q?+mmOPx0RP6CggVfDQPZb1Eq8BKeL2pc+LbRIb1ymFCxBjBLJWiUHHIH8aSxr?=
 =?us-ascii?Q?zHsmdNCjxhSxB9WFJYo89D5kToudt5lAM8G2Z9YdDJOSjHxIl1rIpXuJfpio?=
 =?us-ascii?Q?HV+fJdEkVD+YGXCpIGmbTNxxd4BX3arMdlRrrWmpEkBiFVxtncrs6D2y8ZV9?=
 =?us-ascii?Q?EUBcxkkEdkRwzwnCwCX7VC+6MCvJUnadvHEAtRlcCKFaN1eC+ZQZUCkHFXYp?=
 =?us-ascii?Q?HvfKYl2TqGqr0CJjWZwCApCnnP6QKYzlnFI4U5BacH5suVNL8s2LBU7FDBIG?=
 =?us-ascii?Q?T4yxXdsIARfs4UBp4oiyfne6FDAeAjxsJOedN2VX7kRv5UyBm7NLsFtGvgjC?=
 =?us-ascii?Q?8VWJ6MvJohDzJQ5S0keA7E1IsGdJihRm7/WmhARqU8L+FwnI8HfITY27WQKN?=
 =?us-ascii?Q?mO2GY7OApPaqayYw6G1gZr5SClbbS/9FRcYwG6WdGaLfhDgYYh85urMbDgPs?=
 =?us-ascii?Q?e6YfN6V3uxMW8aGcPyNjr5ldoeuJtLL57zKT7RmYBf2GPOjh4YcWPUfhF6v8?=
 =?us-ascii?Q?xUr3apgzAsPY3i+nB+oJEGE2BQlFitiQvJFlVfunnzVkIJ7U3VxasouNqkhH?=
 =?us-ascii?Q?ed8hW2de0g/d50hDoTVuDEyz3UDDnFDFdH+bXOsAhSY+UbuMQ7b9yExs1uXO?=
 =?us-ascii?Q?JrLf53NluQ5URPDogCdtswNMpHDHUWHi+0895tsk53VH7QFz9P8tOHd7Hnpz?=
 =?us-ascii?Q?HsIFgrXyp0hWB0j6F39AGJUFJOkawtoD+rICtwrWDK7JxWphHC8VSCuj8sPv?=
 =?us-ascii?Q?1Z2OgZKkmK2KjFUO8gwBWMJ7r3oiwEb5rfaZCnlO8yKhY8f8UBVjHvc32WM9?=
 =?us-ascii?Q?EldkReMCzxKuujK7tPoMVAI/ajyjQnydk+Wo/ADF5Ty+OVd1nnXXgt5rRBZz?=
 =?us-ascii?Q?mI+1SZEAZ/7HOXAWCcQmrZ8nJkGn3ZO55A4OhJXto9+RydAyNpWK4a1OCuIN?=
 =?us-ascii?Q?b/Jx19nexqTgVmOFcu+kL+W+g/HzCopVsvA/JSxB3+bkVtTWO+wxjJN9mC11?=
 =?us-ascii?Q?iNxzO2VoPL9oAcga9yvnIUuW0hAwGotMhma7IHEKlJwDO1kuefwnFrGj4Z3V?=
 =?us-ascii?Q?ZY3zR80Yu4JoUCueHNU3RRc3piNcYOrgidYSchJw9dzDvHTRWjGCtKX1E2Wy?=
 =?us-ascii?Q?esxBk1M4Y/j1IoNZR/1Rczs7L7uf9we5A3hrwJzZMGsmJgus4PWSY5aWQyZ1?=
 =?us-ascii?Q?VTi8jWORPttlNU0u8/GFPaXIpWZXK2Wzn6jaFhH+Wr9mfY6SNYrYc3J4lU4b?=
 =?us-ascii?Q?Soswww7JsnYQE5Y+S+MRRqI1K85Bxu41edKxPpNRi/yzLhzVTMV5fpetisv5?=
 =?us-ascii?Q?GCEjM0EUhC3dba2M/4dP9scUxzIvuUQp1ACCnzydmUlOq//fMh8jrc9U7xEt?=
 =?us-ascii?Q?jqH1SRAi4isRVfpfe5RCpXRyAP2pwui0A4PpZAFsFLbNkEZd9gsEtXTifvMy?=
 =?us-ascii?Q?esLEk+3K/Q=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f95bacb-b4c3-44e2-8aa0-08df334206e1
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:17:58.7044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiTDrCkI/FSbQPHwVsQcenu/5JDqMPApx2YKAMUzDkn9n8L8ZdibOs9wD9g/jbm8LePiNvtD56W68VM2hBkM+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB967558
X-purgate-ID: tlsNG-42698a/1793006281-AAAD89EA-FC1C4B6A/0/0
X-purgate-type: clean
X-purgate-size: 4673
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ross Lagerwall <ross.lagerwall@citrix.com>

With Secure Boot, userspace passes in the entire kernel loaded for
verification purposes. However, the kernel's startup32 function needs to
be aligned (e.g. to 16 MiB) and this results in the start of the segment
not being page-aligned (depending on where the startup32 function lands
in the kernel binary). Relax this restriction in Xen to support this
use case.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- No changes

Changes in v2:
- Remove error handling around map_domain_page because it doesn't fail
---
 xen/common/kimage.c      | 47 +++++++++++++++++++++++++++++++---------
 xen/include/xen/kimage.h |  1 +
 2 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index dc4730622371..d4a695a2bdb9 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -725,12 +725,14 @@ static int kimage_load_crash_segment(struct kexec_image *image,
      */
     paddr_t dest;
     unsigned long sbytes, dbytes;
+    unsigned int dest_offset;
     int ret = 0;
     unsigned long src_offset = 0;
 
     sbytes = segment->buf_size;
     dbytes = segment->dest_size;
     dest = segment->dest_maddr;
+    dest_offset = segment->dest_offset;
 
     while ( dbytes )
     {
@@ -740,24 +742,26 @@ static int kimage_load_crash_segment(struct kexec_image *image,
 
         dest_mfn = dest >> PAGE_SHIFT;
 
-        dchunk = PAGE_SIZE;
+        dchunk = PAGE_SIZE - dest_offset;
         schunk = min(dchunk, sbytes);
 
         dest_va = map_domain_page(_mfn(dest_mfn));
-        if ( !dest_va )
-            return -EINVAL;
 
-        ret = copy_from_guest_offset(dest_va, segment->h, src_offset, schunk);
-        memset(dest_va + schunk, 0, dchunk - schunk);
+        if ( dest_offset )
+            memset(dest_va, 0, dest_offset);
+        ret = copy_from_guest_offset(dest_va + dest_offset, segment->h,
+                                     src_offset, schunk);
+        memset(dest_va + dest_offset + schunk, 0, dchunk - schunk);
 
         unmap_domain_page(dest_va);
         if ( ret )
             return -EFAULT;
 
-        dbytes -= dchunk;
+        dbytes -= dchunk + dest_offset;
         sbytes -= schunk;
-        dest += dchunk;
+        dest += dchunk + dest_offset;
         src_offset += schunk;
+        dest_offset = 0;
     }
 
     return 0;
@@ -798,6 +802,26 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint32_t nr_segments, struct kimage_segment *segment)
 {
     int result;
+    unsigned int i;
+
+    for ( i = 0; i < nr_segments; i++ )
+    {
+        paddr_t mend;
+
+        /*
+         * Stash the destination offset-in-page for use when copying the
+         * buffer later.
+         */
+        segment[i].dest_offset = PAGE_OFFSET(segment[i].dest_maddr);
+
+        /*
+         * Align down the start address to page size and align up the end
+         * address to page size.
+         */
+        mend = segment[i].dest_maddr + segment[i].dest_size;
+        segment[i].dest_maddr &= PAGE_MASK;
+        segment[i].dest_size = ROUNDUP(mend, PAGE_SIZE) - segment[i].dest_maddr;
+    }
 
     switch( type )
     {
@@ -824,9 +848,11 @@ static void kimage_calc_one_digest(struct sha2_256_state *ctx,
 {
     paddr_t dest;
     unsigned long sbytes;
+    unsigned int dest_offset;
 
     sbytes = segment->buf_size;
     dest = segment->dest_maddr;
+    dest_offset = segment->dest_offset;
 
     while ( sbytes )
     {
@@ -836,15 +862,16 @@ static void kimage_calc_one_digest(struct sha2_256_state *ctx,
 
         dest_mfn = dest >> PAGE_SHIFT;
 
-        dchunk = PAGE_SIZE;
+        dchunk = PAGE_SIZE - dest_offset;
         schunk = min(dchunk, sbytes);
 
         dest_va = map_domain_page(_mfn(dest_mfn));
-        sha2_256_update(ctx, dest_va, schunk);
+        sha2_256_update(ctx, dest_va + dest_offset, schunk);
         unmap_domain_page(dest_va);
 
         sbytes -= schunk;
-        dest += dchunk;
+        dest += dchunk + dest_offset;
+        dest_offset = 0;
     }
 }
 
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 0841b6f32114..86250f29394e 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -23,6 +23,7 @@ struct kimage_segment {
     uint64_t buf_size;
     uint64_t dest_maddr;
     uint64_t dest_size;
+    unsigned int dest_offset;
 };
 
 struct kexec_image {
-- 
2.52.0


