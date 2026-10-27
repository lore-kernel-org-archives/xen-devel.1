Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F71606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 01:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=MvOdf9kY
Received: from list by lists.xenproject.org with outflank-mailman.1461777.1672796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLVqc-0006Jy-FF; Tue, 27 Oct 2026 01:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461777.1672796; Tue, 27 Oct 2026 01:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLVqc-0006Jr-Cb; Tue, 27 Oct 2026 01:19:30 +0000
Received: by outflank-mailman (input) for mailman id 1461777;
 Tue, 27 Oct 2026 01:19:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLVqa-0006Jl-SV
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 01:19:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLVqa-00FaIi-9K
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 02:19:28 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6adffbd2-e002-0a2a0a5209dd-0a2a450be6a4-36
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 02:19:28 +0100
Received: from [40.107.200.5]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6adffc1e-b7e8-0a2a450b0019-286bc8057d63-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 02:19:28 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by IA1PR03MB8286.namprd03.prod.outlook.com (2603:10b6:208:5d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 01:16:23 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 01:16:22 +0000
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
 b=yd7+9jQyjiUpABAWAY8DnnEVjua2h2ImB82Q7O2oxT3kGnsduDF38jrurJhfkXb7OZ66HdP2uykX4upQCtU6YfCOvlFP7JU7jwllb1oCzCbynkkNFS2WFnZ/F5uAf27jLogCNhtlwt32dOhPnsiH0abkxpG0cb+igl+S8ie4jJRm+KCpAgoGlz1Z5ujxFa6xSnpx3rvkL65ZT9dd/AyK2sRIaVFbvdz4HHhdm0NmF/ZYMcqCBku2bhGMdjbN6ylCxzUve7dfrbDJDhLrx2weEbXytv2f6HDkML+Z5UzZswii3way1FJFTQr+fSDN2pUkUgLsFxA7kIEgbzrY9mOFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Avm3pNueSvCWDc0rcC+pqLww0AITH4pWts4SeFG/fdI=;
 b=yqWMiVJQahDY/XtYAhVuuU6r35N58Eq9yJIF6f+X4EgxhBWGMGEHunnBGVXHKD/Z5koVqaXht9KaT9dB5NI2JdRjeNu4IrJ4rRAf3SGlEGJEM9nXR8yLV5iyB535ruNx9vDOF7aKndNPx1u52lv4Lwc9/dhcrejqs1OKWq1FODP8K3Vt0iayh6Sty5gsQrBirmZKOufsRIyOSxlcAlXsR7XoOzDt5bZi5g99DiGVlYLYgedKprPcs62Ft8uh3Ml/cETmMbbQDo1Sa+gQi/34XJ162q7J0VZ6u9YtQF/mmPOSZoQhzQx/FAVt+olxMDKc3gSKIhIs+gDz6LZWsqCuVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Avm3pNueSvCWDc0rcC+pqLww0AITH4pWts4SeFG/fdI=;
 b=MvOdf9kYC6wUGQYPToD7Gl0Wt5ycZPqlew4IV+I11QYNJBi47VFw84pPbpcFn2RlQeZDl+siGrie48bjk1WBr8UibRem9tkvRg2JxMZIxk3IRZcV4Eebl69W1Vb/x/rH3rgn5dTt7PQL6mOFsYwj+knb0hULT8t5MCMKj0I8EjA=
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
Subject: [PATCH v2] x86/nSVM: Ignore bits 11:0 of MSRPM_BASE_PA in L1's VMCB for L2
Date: Tue, 27 Oct 2026 09:16:10 +0800
Message-ID: <20261027011610.364945-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|IA1PR03MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 2386f249-bdea-4b54-917c-08df33c7e98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|56012099006|5023799004|10067099003|11063799006|261009223027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	8Foio6tyZPU36lEiphDnx6YysoEXo/0rPf1FSPHv10UEGSW7Kbe99N1SIhXOjjgt+d1YTFPCyjUb7X8+aaztZ34PddJb3F12AXzFp8/hrT0mseJFJLM8Ld/0TdBTw1TRh7gtN2nVoGE6Nsj5RLZElf1EG36aLMdfanc9cXIhtohPrUqztRW7JMyVJiWUyz1gVF95y6IWx76mPnCcG1rVqnwZQlc2Odh1wbHiGiwwwIgKH8v77Goy7uwVYQDN0r0uc4hdwivaIBsdzK0N2dEQ8mbYlHOc5fCjGTrgCbGiU/dk0oA7V+3ctXKNHorVrwgD5Y9u0ekuLcSRkTI4a1JKvahcc9UCUj8QPRt1N3HHxyw+ltp6+BiY0usAMPyzJXe283X9qTXPsGfKwxVRGuxRGKG1q8SIpogYDIEL9RYMgFeDwtbHPt+n6GILPGAdsVxC3CBoRRr+XuBpxAKBLx7Q5OL5B+uE2sIo/CiuXqKk/FAYjXfBgNB4ORwL5iVc54n/HCrlqgbQChAb3Fw9033geHPlzD3VfyCop+NWN5JCoxgcZ2rSzN+D/VvQi2wT6WT8tc7e5IulucIe18ernLgmypK0L0/2gF4Zfbxr+r/qvJga+N40ctvd415D0XGyrguUU8vo+lRd5foqYsUNl/+9qYJifYnDqe1R4EzPZzMT2DE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(56012099006)(5023799004)(10067099003)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1YBkqpBwq8Nu0+HgnPwzg/10rZSu92U/4O9yd6rWn8uVOxL6VTlX1kK+Dt3+?=
 =?us-ascii?Q?1Dkz6IozdBgK/VQbudWQ3/aT2cSrJEOZ1U1yEiXHqsRK+R2Al9wSF9tLlm6X?=
 =?us-ascii?Q?wrp8PlzOz8q80iWthRg50Dagtw+vhS9U/yXHNV6mzOBJEwTR1kwhyK4jULmU?=
 =?us-ascii?Q?KAbf2FaSdR5fVlgdeW1dl6vj3ZJiZuTKiZG/0bRt03ew51qqGNmdvizg8Cyv?=
 =?us-ascii?Q?D0vX18PpEcKV2BeDWCTq891n6jzGyKk375RFPvagBbiUvYAu9YosASuiLRJL?=
 =?us-ascii?Q?A8ZtSVTSXL172Q+rnYh72EyBDKJtYyaVzi0rIFCcwikyFghdU55f0I6iyFQw?=
 =?us-ascii?Q?KVhM0btxgx64oameYRP4Xv5w6qeHHx5R/zxD+BehrlAZ4E7O9Nk8deipyUyR?=
 =?us-ascii?Q?oZYXDRFvCy7ux5mS+8F3jRyKbSstgqs9gbLGJBz4YwNlt998MTbmqD+mY9JE?=
 =?us-ascii?Q?cuZsfDJSgt58XikgEgZ8oUEtUUmfb71zj8VcJxXauJxvFpIAnnubSDYvjMxC?=
 =?us-ascii?Q?k9sLNh73Ivdt/20PWN/ztRim8MBB2svMD0nDv95GrwhmAJpVHiB82lbNw4gI?=
 =?us-ascii?Q?RD0ZaSH3wvS+m1qO6t+K7crbdaewcLmzlaU+28VLlv1c++rfIgjdEpZRChTN?=
 =?us-ascii?Q?ZauPPLA00s1C5JME98+hSWReGKFvtgumEWX0Pa/zxlVmO389b2C5oVa5m4HR?=
 =?us-ascii?Q?PQ/PSoI1PIhUm26E8HE39tNkLsOivYdz0w8U4rtJcJOcde1At83mNRLU2q+k?=
 =?us-ascii?Q?IQkS8PFJiSmG7RsFUqK8c0xhNZEw0rB7WC6TkAfZVyt99QB/mGzvnV2JBZr4?=
 =?us-ascii?Q?xj/ZnG+rUwZg6vVVlqt+pEU7dL23ju7ofLFfSyA1W2rNGdq0bH2KwbfEE4QX?=
 =?us-ascii?Q?xcKvaRjbAIdSGJ1eHiRGKuau1Mdn9N73WURxQlFFzwvXogBIm20+4jkNoH8Z?=
 =?us-ascii?Q?db3kurSEtp17ZSH5bvq1Sh7GgleB3PiUuM/pAZpKa42ffcBuFfDykoa4MJSx?=
 =?us-ascii?Q?wOgC39qMAVjytffPemZoKz2BR+M8U2Jfaqheifsym4c905zlValIV84yoTFE?=
 =?us-ascii?Q?imCl3j9NxHHmnZmn/NOEpqxIxt1OWYPuSZy0RZENb4JlUPeIx/rHS56jGrPM?=
 =?us-ascii?Q?GaEnoA0JN2Y6VF0orwmsTEPCy8PcCRRsLj7IZp2YQT4NYs81IUBoTwHOvZx4?=
 =?us-ascii?Q?H95bx0lr2EdfLt+L/Kabuap7lFJ3XkbdFZ23dI6NCxA9ztLi0ZFXvCKC39To?=
 =?us-ascii?Q?pO3lopoIta6VU43k+BPG2X8ee0hJwNyiJh5PxC7ZCYUPMO2J1Nq3NFx1qEQN?=
 =?us-ascii?Q?kL58DHZapUnxGzA6XXIFdectOPMX8/6f/Bl5V2qJBxp81DWlUQzpFIs3rEH9?=
 =?us-ascii?Q?1chLNqqlioUdR789N2x0vjqW6z/Z8ElfKZMMfIhTvDCqgIO+1pB6Dn524FWS?=
 =?us-ascii?Q?Dd2jj2GMltP9nc5u3b8Ck/WfE2UzH5nqs4D1Q2UuRm2jsKCNIJOlXgXONoT9?=
 =?us-ascii?Q?/q+3BSfRMkko9HQO/HTOIGkhI09Ud2wqcEw2ifmrFao9txJhsmOdJAIoPEaa?=
 =?us-ascii?Q?B5m0NSLdBaniD8rhdvw6TxusHlMPhB1slN+FzBVkC/oim4b88o5YVm6pm3Tz?=
 =?us-ascii?Q?/KTVBkB+DdGvBo36g7uZZ/ExREknptwDYRXGAojYNXKfV2hK7r46B0YlnMkO?=
 =?us-ascii?Q?3Fr2zOaw0xkFT2Z6YP1n7UAJdBPH0vX3iP5ifcibpWNjL9JSpcJvdHJXW03q?=
 =?us-ascii?Q?30LsTYuCzg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2386f249-bdea-4b54-917c-08df33c7e98d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 01:16:22.2583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVxuCkN0boX/XEeh9Q6y6iH0/u4M9vYzDMvCgDeCRAsn4LcerBJUy64JVp51jDxIcp/XOt/OvXgU7/CbOfJ5glQENGbdjFrcAd82U81Ta+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8286
X-purgate-ID: tlsNG-42698a/1793063968-1A2C49EA-3EBDD0AC/10/78276251493
X-purgate-type: spam
X-purgate-size: 1945
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VMRUN ignores bits 11:0 of MSRPM_BASE_PA (APM volume 2, 24593 Rev. 3.44,
section 15.11 "MSR Intercepts").  On L1's VMRUN of L2,
nsvm_vmrun_permissionmap() copies the MSR permission map which L1 set up
for L2 from MSRPM_BASE_PA exactly as L1 wrote it.  With any of those bits
set, the copy starts at the wrong offset, so both the map L0 runs L2 with
and the intercept check on #VMEXIT use the wrong bits: L1 can miss
intercepts it set or see ones it didn't, and the copy may run into the
following page, giving a spurious VMEXIT_INVALID if that isn't RAM.

Mask the address before copying.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v2:
     - Say which permission map: the one L1 sets up for L2 (Ross).
     - Add the APM section title (Jan).

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


