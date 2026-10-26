Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA1C606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 02:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=bfR0v2lj
Received: from list by lists.xenproject.org with outflank-mailman.1460719.1671595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLAbf-00053F-FJ; Mon, 26 Oct 2026 02:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460719.1671595; Mon, 26 Oct 2026 02:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLAbf-000537-8P; Mon, 26 Oct 2026 02:38:39 +0000
Received: by outflank-mailman (input) for mailman id 1460719;
 Mon, 26 Oct 2026 02:38:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xLAbd-000531-CL
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 02:38:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLAbc-002ols-Ao
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 03:38:36 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6adebc96-bab6-0a2a0a5309dd-0a2a45098dac-38
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 03:38:36 +0100
Received: from [40.93.198.43]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6adebd2a-be1a-0a2a45090019-285dc62b1a11-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 03:38:35 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by DS6PR03MB023887.namprd03.prod.outlook.com (2603:10b6:8:521::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 02:38:32 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 02:38:32 +0000
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
 b=tEg+TWHNEfcXw/j5f1wVltcggL5FBXnRO9oOZweXBMHw9XjySwijt1S8QcPdZ4xtrOSonSpT5/XfI7FSn0K7m5mIF+7AnVfAC0FemsxiJ7QPRz0xU2AXQmylkWhFAt6qVA/5sQ1HXYJeNSHOga+/kpZiOjiCZgRUo5P6AAfADaSuqn/mD1M1BHdG5aXVTNzJkVDw0wn+JTGKpBmog4k/uHJQn6jzhuGrplMmxU5OYhuMV9gGxQQLfzbBi2E8Fsgu1Z8V0hQBbCiqraLTnmxJVoyviqiDYeP73kg/7+HUC2fmwjYVJBZr8YG1O0kdo4XIJy/KQ6PJSlIh+yS1fh9uGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bo91kQ2+mIRGrhIWDBqPnGbh+YLfBhzhw+LXoFKZmiE=;
 b=WFjz0yfrmON7cFFLIEr6fLu3htzbrxFIdiS9bxrn8Ybp5MJBu/YewakMcQqsjjTCGUJ6ZgenZLa//RKsan+s+1+V+QxbjePZEaEOy73gsu2T1jZsHoDetacyDt89dM4Wk8S9fbc2pQS1krZxm6umKGGfYO92ICfdb5fehHSD+rVonargwKRwvnoZyo1QRmc9QK31c8x2VTNHTpjpIjfeMwuNXAzYEuaJ82sfVaKadytOnYo+gO9UQSJwZ8f1Yf0jc0VDlht1BJMT4PFQyRp3ncUEEanbCgv1qkz7GXbdnNyDiQaJ3kEY/WgI2IB3pWitlw+RQQt8KO/rr9NGlXl4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bo91kQ2+mIRGrhIWDBqPnGbh+YLfBhzhw+LXoFKZmiE=;
 b=bfR0v2ljhswAz6m8IE6lbdAiqTBDy6BkGrra17FIX3d4WMlCRsWoJD4HmiO2EClDlLn3krWE5QRH6/mJGqiKI/xp70QYWbAn6T6XFNSuLg76LvvlcVanTPe6guI0B+apgY+utnaz5pv+rUc/qqPqzzDNN9UuNGR0EOKKx2bMlKY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/nSVM: Ignore bits 11:0 of L1's MSRPM base address
Date: Mon, 26 Oct 2026 10:38:21 +0800
Message-ID: <20261026023821.301182-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|DS6PR03MB023887:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0f7bef-07f0-4892-4b30-08df330a3991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|56012099006|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	3X09mXYZlsJqhwiG/U54p/0+ZCm45Hk+kpFWt0E31U0IeZH50ujnzCmmZYSR0znNVPWV4hBv9AYGFoppRZq6VOtM/bTSqHBgzUISiPsubc2fUVmO+1c3VnvDdl//77I+DE9et9fg9dBx7bYT91a4/V36lJStdGPQ0GlGQQspeRBwVeos11BIPA2NYY2kuBcK5Ofglo0WNYhakAYrD9pnSLnExH41RkrVvCuzVj1Yy+0rTuSEBDbwrgVZdymko5MNvimvDbdx6b+dAEsA55dLRs5y84Us6UbSYzJcHweKfvVm5qgdLACCMk9LDQHXxgILp3Jxmsa1htmGSdh1vovhcIIca5t4duCcCmvAvXfu9x1Lkxsr+y6ZFL3OadKD/YzKaXS0U7bHvJ4e6GbT1mHzTjV5gzMMdFf62I4F0PP0iYCdxYFQxtnqI9zUPfgeq6FDz63EaQhm2IrcM+dU8vyvymAETEXVQfuULE64FPWSQVfbMKdy5TGYeWtr8+sR8WtW42N9CckBsfmf5NvmUWjb9MVhNkrZtO7KyMimrM111UQ4v5Mo8ua+fciWbY0/zxQCzlfzzMxNlB7XXEcSaS7soCE4hDFNxkFKbMUtek0UPJoj9qH7TWZK16N0b3c18qNslUdKVlxE75/z8yDFfBSmg3lfIUDUhE8J7RV3WG7Fk4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CTVG2DYkRbuosTfWgLZ6Tu7X8Lj3ImObpPTs77WMqKkxEGTOiWyxhDk3BJdw?=
 =?us-ascii?Q?KKTx3r0tNs+B30KltkPaTX+6aA5CceWXyjrRb890f9DdJ9Ueu+0+hUt/vz9U?=
 =?us-ascii?Q?bvBuEUrXAYwT9QduwCXVS28r8ZCojogNqPCEZphdC6QnpfPv+sBeBn55vti5?=
 =?us-ascii?Q?xOKx+k4J+qPCmtyotp1BVQ5FPKH2ViBCBVZUtDHshqo/tmbm65UUqrP7iV4F?=
 =?us-ascii?Q?knViYkvljIsTgMt/XPU+Dz/654N2w1RQIryXo3QNNboW6Spb3FGhVy2esZaT?=
 =?us-ascii?Q?lsMGtZx7HQqYw0EM9B9U4K4o5Xno5ExJ4Kfd+lJEbsqOyuUQ6UJ3mY/hpLCH?=
 =?us-ascii?Q?PShW/jqXiHcu1Vz55B6pPHW16740kZZH1U8rg892AtlHtmt1i6k/h3kuHv6t?=
 =?us-ascii?Q?yiwvuEgyVIOeC31JIil5SkGP5XhhwC50OyCpJkuuRf6wGFSwtHnFawZM6Lf2?=
 =?us-ascii?Q?pkNGtQcGlNVUwxfyif/vJehQYT78OZolgxQcLQQyV318c524CkeSeHJczAtg?=
 =?us-ascii?Q?1uawipSLlgLRrGug0MqaOhiL8tMfhLvVteou/BcFQxkwcKKGTMfijtPzqJix?=
 =?us-ascii?Q?Q4ZoZ8185N6RHsIPOUt+fKtg2LTMa0yMVPHpkQz7tXcw+ReB8YsR6FQES85u?=
 =?us-ascii?Q?Gi0u4JoDfZM8mkoi3esyFLeRHx+4xzQ5HOebH166i5opmiG/3HiEaV45sJ2d?=
 =?us-ascii?Q?MkQhjdJKXAyDlCnolt3kGLrnPoPma9o76di8RPTYU5CqCONQINiMo/Bny5zQ?=
 =?us-ascii?Q?8d66zuO8h5lnB7PQIfIVAQAEBK0+qPoSkJYXUXE7gR27lTdnYwRFWtocz4jf?=
 =?us-ascii?Q?iXaH6n4DzW2z9KC66PGIeJzjqLy6ciLrw+56+H5EmOIaHTwjRtu4K6JsyEY8?=
 =?us-ascii?Q?7lCYh5IK4x1b6f8i4ZiWme7uYCZAWZYIvWhVzI/0T8862TevzoCRWkLKsS8H?=
 =?us-ascii?Q?AaclPZHO76Lf7afr5OTB54LilKoB+8Pxa7OBIU+fVyAxWwy6AcHC8kgQXCSj?=
 =?us-ascii?Q?Y61nxY/FgsxthEXMFsFW3NqNpjz8L9HDT6Qj9HvZvmHAqNXCXrXEVYedaciF?=
 =?us-ascii?Q?QSoRDGaQkjyuccakaoFVHG5JvypZYucXOGyc6wdMUwtIwB8LtKlQa96FUAtX?=
 =?us-ascii?Q?YEHw5Je0OyC7rb7xh21BmnPWU2vRU3SPoFuYqPiRokIhklesP3LP2eNk3odT?=
 =?us-ascii?Q?G1hMkLZDniPfjarpUY9furm0IRHS6ByCOgRedbofWcqAexYgHq04008tG48o?=
 =?us-ascii?Q?diG0ZSE9JB0nJKkw5fhj8jSbDauPotjBxoWjbaWRPjpcxvUK6Ewq5Z/U04qz?=
 =?us-ascii?Q?6EJm4paODn24nSTjrFtlKR3uHH0R7EikO+vyGHkhH9hkEt/YOFvfrp/4OVke?=
 =?us-ascii?Q?5wL9jiOLj+Sn1o1R+RVnZ/PxY0AEAz3upd9dONRqqZmzsgGojKGabDJ9peRq?=
 =?us-ascii?Q?orEw43dMG2OUHX+3Is2+7VcvfdIWwD2WaI5FUIa3zYNnoguK0SrSzCOmswfF?=
 =?us-ascii?Q?1URiTlD9xHvyEAShrFxWqtH2X09EoBLhjo+DoseTJkp/47RMLV+j/5aE4gDH?=
 =?us-ascii?Q?WGJT/Fqe1jaWEJ+qKXVHepYfjUjQh9M7nXcc35npqN/MkZkPle/ctTJQExlm?=
 =?us-ascii?Q?be11lQFMl7N3VntDXMnvMBPJbMd1V/lGBdgPesTIdD85fPDaT2e03ougEy8L?=
 =?us-ascii?Q?cCGGCJsg493eVj5eQLCiPz2kZsiJd+Ib0hRp5yWlncLKSHp5+/SDDuUhSicT?=
 =?us-ascii?Q?zpoRWN3AUw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0f7bef-07f0-4892-4b30-08df330a3991
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 02:38:32.1154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7kT7PubIGD3aZR4o38YU8yuwj94HabX+SBZMB4VnUEdKQQ8hk6vCl7esvU8fQN/lAMdrEH3i+iSVRTztrlu3fGtrgYxCaA44iU/dPhwdv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB023887
X-purgate-ID: tlsNG-bad1c0/1792982316-39AC0034-CAF4B8EE/0/0
X-purgate-type: clean
X-purgate-size: 2063
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VMRUN ignores bits 11:0 of MSRPM_BASE_PA (APM volume 2, 24593 Rev. 3.44,
section 15.11), but nsvm_vmrun_permissionmap() copies L1's MSR permission
map from the address exactly as L1 wrote it.  With any of those bits set,
the copy starts at the wrong offset, so both the merged map and the
intercept check on #VMEXIT use the wrong bits: L1 can miss intercepts it
set or see ones it didn't, and the copy may run into the following page,
giving a spurious VMEXIT_INVALID if that isn't RAM.

Mask the address before copying.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---

Notes:
    To reproduce, in L1: set MSR_PROT, set only FS_BASE's read bit in a
    page-aligned MSRPM, point MSRPM_BASE_PA at the map + 0x800, and run L2
    doing RDMSR of FS_BASE.  L1 should get VMEXIT_MSR; without this patch the
    RDMSR completes in L2 instead.
    
    The IOPM base, handled in the same function, doesn't need the same fix:
    all of its users convert it to a frame number first.

 xen/arch/x86/hvm/svm/nestedsvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 2b998e26bc..56d0f0fa4d 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -309,8 +309,10 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v)
 
     ns_msrpm_ptr = (unsigned long *)svm->ns_cached_msrpm;
 
+    /* VMRUN ignores bits 11:0 of MSRPM_BASE_PA. */
     ret = hvm_copy_from_guest_phys(svm->ns_cached_msrpm,
-                                   ns_vmcb->_msrpm_base_pa, MSRPM_SIZE);
+                                   ns_vmcb->_msrpm_base_pa & PAGE_MASK,
+                                   MSRPM_SIZE);
     if ( ret != HVMTRANS_okay )
     {
         gdprintk(XENLOG_ERR, "hvm_copy_from_guest_phys msrpm %u\n", ret);

base-commit: 4e3c0eeac5761c505f8229e82d265eb29957ca5c
-- 
2.49.0


