Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F33606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=jxpEsRCM
Received: from list by lists.xenproject.org with outflank-mailman.1485602.1688766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRT6A-0000j6-LR; Thu, 12 Nov 2026 11:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485602.1688766; Thu, 12 Nov 2026 11:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRT6A-0000iz-H6; Thu, 12 Nov 2026 11:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1485602;
 Thu, 12 Nov 2026 11:36:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xRT69-0000gy-BJ
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:36:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRT68-000BTp-O3
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:36:08 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af5a49c-e002-0a2a0a5209dd-0a2a4501d0fc-44
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:36:08 +0100
Received: from [40.93.196.37]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af5a4a7-5984-0a2a45010019-285dc425df69-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:36:08 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by SA1PR03MB6515.namprd03.prod.outlook.com
 (2603:10b6:806:1c6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 11:36:05 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 11:36:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLrjm0PLK00r0Io/OWDDYAqbVim62tJNa1iGTy3Sv6/+6cAIVtrqksf+1sqUaAAzh3dS0OGQi9FG3Npk1eebBOYavWVDysVTeedfXLIiokTNoPDVw5/INTxq8xJ2IiVP6k+Lmi8r5fTfyemoPffMDw+LCIjUVAKeA1MKxXWcK1oxmZnEfWQGi58nH8ph8r34neuWQlCnIRNEW6SsGxhkvLU41Yu0WT+4did+hSKRW/QgDWl7cGnNgHFhe3a0eTWEzCEOWbF01imgo9by89G3hNxx+v9tIr4TCt9hmukqWopfi50dyIFULXAbpcqtuRpT1rEDYdzLBSnyA0PSKO28vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvQyzHtfHuw5YwzIwbOty2rLf4ntuJzRbidOWxJhk/g=;
 b=DYVbYWq735lNPmMaD9ehtlAh87QOW1gnB++LHnc5F9rTLaeOzoopS7K44Tq4AmkWbV6f55DeyQOy+A/KZHUref921QhWRe/kcXzaiFNnUcoA3ZLNjptCb/+VmYwrCJ9X1bZ3kKfWQSdJQh9fHQdtohqaDoYP+XTqtbqBA0Jf15dioauOOJeSAqUqhXRjznsOyrkG0ISTpRZ866tv/qp9IHvuaVbwXmyg5lQI9CsQklcaAWB/DToLTw+pp2pY23nK+hJ3GcqCU5OQPO5dusgrp/D2f87A3qZf5l6V7Q8DUtNcLXOK5P7voLPp9zmZEwMx3xAQb8as4k1bcDOjCKhmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvQyzHtfHuw5YwzIwbOty2rLf4ntuJzRbidOWxJhk/g=;
 b=jxpEsRCMiKAAiN0BP0j/L/HZpo51t/qNiGRkkV+2+TdmLWfhSsKSGUtwnllenetgturxFzqLQ+oHbrJkVJ53WwPXhngIV0HEg3QQ0pWEm0UJNaliV/LPHZkpf8gEb6bdMvtlxNSv8rphZ0HKgREfk+xbk2qzkKbHmVtey5g/Hdw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 2/3] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING
Date: Thu, 12 Nov 2026 19:35:24 +0800
Message-Id: <7d4acc24cb634dd8170c3de792c98549bc8b624f.1794482561.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794482561.git.chunjie.zhu@citrix.com>
References: <cover.1794482561.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:ca::12)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|SA1PR03MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cd7ea0-9611-4628-fc3d-08df40b1232c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|22082099003|18002099003|11063799006|10067099003|261009223027099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	Wggl01kUSEztu1AuHqwMnvtrzIMUk0sLKr5ijZ7gBJMDvS27Vmkh5dv/UcZ6wy/pni404JjT1GqVdQe0dO+VGhmSJ3xSpsXSLCrdvCBwQ2Hzv9zdGPwdq6Ye8Pw8WS5c+TvwGw3DL5HPS1Ork8wmDnGiYDmwsNAqL5tmL/zhvzOviPBhzawZFRBP0bck/SH+zu+OZDp7sbf9MX+iSqe+/lTtZdV4kxgE5hh4DtJ0RQBz5apGtJ9LeubJVCS0MBuXBB7SlEf24gNDXlAY2OnxtL9KGfH40btSGkrp+8oDIAjZ9kt2MnQTEnuAwIQ+i5q6j59W1uy/AK8sMKDV2vJ+ZgVbDmpLrxlA1QSY5uvj7sRIPRM12e6mCXvVQ27MVZKPNvfBcAJ27UytMW+vrASwkoqh1CZnpi5S94aqW+++/saVXAm1kp9GSJaiVuJxee93YgluU9mrst9P74rY+pW0cCH4JY8E7cdqdHSnjRKOY+mvu9kXLYWU8i0pdWoDsBxr9kZxoM3XrdS5id7E79EauOnzqOJqQCK8iowOY44Fw3VvSdWvC8m/9mA9BW3XQCl7k2RJnVucQiZ4BdBnFBllKo2V6/MOY4yNS+V8FWlUj6io7YZf5MTMbc+zpsLSqi9G0laMH4BPzulLieP7Kx3gcPSwRT7nDtNKB5wGheUJjoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(22082099003)(18002099003)(11063799006)(10067099003)(261009223027099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?96aqkeM9T1LWRsYC/cmWgVg5Z4OVmT61CpljpLCx1ndf24ZleJxzNweiTT3V?=
 =?us-ascii?Q?T1Sg+5D99HbAeiD1975+ypp9vfZasajCQsoHIT+RI1InBLyfdysMBT3hHwR6?=
 =?us-ascii?Q?Ejox2jyM2r+23ydM6uLAkZyynmJ9h7XQVsDoJ6iJflnmqsFp2X9Dqp5xXM21?=
 =?us-ascii?Q?eL+uKu8Ebjw4xlVAy6pR9gLzpAQypmyNOevLpjy1PgJWHEYOHp6FgujMIFiK?=
 =?us-ascii?Q?H7maVpQrDiiLarnIlVYPbnT3akyB16UzOCDGWOWm9lpXvXt0GamCYwNvX1Ik?=
 =?us-ascii?Q?hpNW6U5IK/aeTZartJSkd8Vq95dDktkYTh5LVd9gOOJX+QR9i7wE0iSDRc1W?=
 =?us-ascii?Q?VxRhW4JNxH1ZDjIt57Ba47nyVU/J68Yeefg/H6+tp3ESdthFPrR0dTz8YgDt?=
 =?us-ascii?Q?6OuhcubFb3Lgzq+g8SJGQ6dQUlYD9hjIHAndvvKrXgQZerKUHcZk6sjKpPe0?=
 =?us-ascii?Q?tnz5/Yqvgpu/B+KQKkHo6H6c1R/Zh6fPHHXOGqBUNeAeHJMM10edyMPmNu+9?=
 =?us-ascii?Q?u7nI7dPo03k8V0TBcEeMbeYoNoSSXtAdL/At+Day8WTYSlYEfej/1Zm7XmvB?=
 =?us-ascii?Q?xolFaDwGnBx7ah67v7uh9rX7B7ODfjA93YTwFobescXDFBoh3jQ8Yh3eZmph?=
 =?us-ascii?Q?7b1NTxgmnDw8P00/BL4TyIF4XzofLJjbsS2i7iHUgHVqhq6yKArjeWPGZR2U?=
 =?us-ascii?Q?RUKChy+OIr0FMau9b+rS4J/gfn91y2jEYpx548xehusUzVJk10spjb27Q0me?=
 =?us-ascii?Q?V+ErJDNhIjcluFm+mDsISWSlWjDZJcmQWRwuP+4wmctMWAHxLbzNgNdHfCKe?=
 =?us-ascii?Q?KHM7KCED90V0xJO2+evnncp6t9XHLb6jl5jyWUiJptluK89Dvd+UzykWOxIo?=
 =?us-ascii?Q?xR47702npmzD0Ru/ZVVR5K7GktQmwHBRND67/dkJ0IW+7Erp0TRIZBS2aWtB?=
 =?us-ascii?Q?3eRAzXjZX+j36TcDKDu8vsysQzYU/7F+47mRgg2eXHIq+mF+CXEEmFPIyn65?=
 =?us-ascii?Q?Lse7O80Gx6EIenZ+LQWDXGCoYBEDvdWastOLJ9lWQ4cxFQKYsuJFLr9br5sE?=
 =?us-ascii?Q?wLoT4jiEr8Di05p+UtQwIER6tXyTT8+HTEWoKhgvUGhJiHz3nxzrZiXGVgAR?=
 =?us-ascii?Q?hyw6mr2GmTX/MPX18f1Vv2JEsndaoGzhqZf8OKwNtcCkdBJNJbHlI8Xxmpkd?=
 =?us-ascii?Q?II+2CFgS42RQWZ73oojFpzZjps3xo+7alxe22Ra/795wmEUuvTPUjpUV2tSn?=
 =?us-ascii?Q?BaYLAWsvIAA19areIRurLb8JdM8wHP9ibaj+Y0sWKcUBAdoa871p+LHoNWl6?=
 =?us-ascii?Q?jAftJSyXyX7pHHL321NGk7pPTzkx6Ybo0ZWYdDwn9VSgyR6gXU8aZMsDrWXT?=
 =?us-ascii?Q?xlW3gfktz16zvMEAnVgmJ4IsV4AVYqfl7dJlkKGvNoOs9xZ4xu8GofPF3+03?=
 =?us-ascii?Q?OlDPvnNnrk/InbVEv/fhb+O4wF2p5I6LAnbhkx9Fv7AXJ8/x/+A+DG0aWc9j?=
 =?us-ascii?Q?hk6Qm6f7PeYoYdIduukKogKxm/czAmuEuH5Ip6ixQIFqjyz+g3RR2PqTYOVA?=
 =?us-ascii?Q?EXTenaueJ+2tAMTyqQnEl/1PQL+h+x8qp66Gj5jY5kmqcKtQ5IJTHEHe3DBN?=
 =?us-ascii?Q?R9vi6rOeiuYlDLIt85ARYzWk6CU7QfZ6w66r6ABclqqEFkXNSjS7411pGOlV?=
 =?us-ascii?Q?6lPwSZs0YRS/G9u8M3xVQEbdVfCl13/D2SdVeIe36KUhWZPwRCDruT2TanZ1?=
 =?us-ascii?Q?iZHMslHO0Q=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cd7ea0-9611-4628-fc3d-08df40b1232c
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:36:05.7707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K55bXUTB+vEriCzjfjy3dPatT4YT9cd+kk1ZnAL8H4U8snLfM8BTHVtCZ06YPdTASMVHXmsO//mnMS2HB4wCtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6515
X-purgate-ID: tlsNG-d62444/1794483368-BC75B757-90F6EB2F/0/0
X-purgate-type: clean
X-purgate-size: 2240
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

L0 always runs L2 with V_INTR_MASKING set, so a physical interrupt exits to
L0 regardless of L2's EFLAGS.IF.  nsvm_intr_blocked() only blocks when L1
requested V_INTR_MASKING=1 and L1's IF was clear.  With V_INTR_MASKING=0
and L2's IF clear, nestedsvm_vcpu_interrupt() would still inject
VMEXIT(INTR) into L1.

Per the APM (vol.2 rev 3.44 "Physical Interrupt Masking in EFLAGS"), with
V_INTR_MASKING=0 L2's IF masks physical interrupts, and a masked interrupt
must stay pending.  Return NSVM_INTR_MASKED for external interrupts in
that case.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
v3:
 * Add ASSERT(v == current), as suggested by Ross.
 * Rebased on staging.

 xen/arch/x86/hvm/svm/nestedsvm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 40c7717c5572..706aed8ed026 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1150,6 +1150,7 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
 
+    ASSERT(v == current);
     ASSERT(nestedhvm_enabled(v->domain));
 
     if ( !nestedsvm_gif_isset(v) )
@@ -1159,7 +1160,16 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
     {
         struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
 
-        if ( svm->ns_hostflags.vintrmask && !svm->ns_hostflags.rflagsif )
+        /*
+         * With V_INTR_MASKING, L1's EFLAGS.IF masks physical interrupts.
+         * Without it, L2's EFLAGS.IF does (APM vol.2 rev 3.44 "Physical
+         * Interrupt Masking in EFLAGS"); L0 always runs L2 with
+         * V_INTR_MASKING set, so the interrupt would otherwise exit to L0
+         * and be forwarded to L1 even with L2's IF clear.
+         */
+        if ( svm->ns_hostflags.vintrmask
+             ? !svm->ns_hostflags.rflagsif
+             : !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
             return hvm_intblk_rflags_ie;
 
         /* when l1 guest passes its devices through to the l2 guest
-- 
2.34.1


