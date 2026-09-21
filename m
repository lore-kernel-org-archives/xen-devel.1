Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7A7C982F1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 04:32:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427065.1649698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8VhM-0008Hg-MG; Mon, 21 Sep 2026 04:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427065.1649698; Mon, 21 Sep 2026 04:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8VhM-0008HZ-Jf; Mon, 21 Sep 2026 04:32:12 +0000
Received: by outflank-mailman (input) for mailman id 1427065;
 Mon, 21 Sep 2026 04:32:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1x8VhK-0008HT-IE
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 04:32:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8VhJ-00HIfj-00
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 06:32:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ab0b346-e002-0a2a0a5209dd-0a2a4501a460-4
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 06:32:08 +0200
Received: from [40.107.201.18]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ab0b347-5984-0a2a45010019-286bc91288ef-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 06:32:08 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by BY5PR03MB5316.namprd03.prod.outlook.com (2603:10b6:a03:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Mon, 21 Sep
 2026 04:32:04 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 04:32:03 +0000
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
 b=c8oBqs7hBsvLAzDnPL8iMYkBYLNewWGLj94mV02M3Nf8JovSHhapI/0VDui1XE6ZgZcMAWF1Xe/Y9z8/Zz6ESWaRbCnkdrnZZDCf7+C1d0SvmalPAHRI5IxY8tAwP67KHhg68ThjiXHNGxzB+arPnqjoWQm5kjxkJe8vSzLldZ0xxT5p8u/RzJunElafqvBxOuzkFvGC6AV5Dj/0TvEag70ySKIi7oZ4wiqrQRlh52GMCr+XMGa0rK9moxX6dvuGlIWXGTBXzQEUB6BRR6S7QvG0oaSTN51OLui4IuYeP+r93fbgTPcv2vosJfEGmZPZaXeobJ9oFoleWpvQUeZGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Xa8mDS+ZPHMGi8DYJMltSSDqsfscHsv2U1xU2PtIlQ=;
 b=sPTmLGJ3x0bF9l71qUeTN1+453iUADVecLdw8xywvw9kZYcNrzcG7tcuO66CUTkCh+xntpD6KvChdPtKYEmPuIsmnd1zzxLyfLvtAcE/N8xWGZTPLb9198PTJIAHdiFa4xfUrJRRvhJKvTxQuXb2e7oAPpeht0havGqfJDTTkvMaQX3D8o3Pe4tmtHOQhcQYd9fABwgOpMHDiWEGJo5C8Zu96XysXNzUtRjZTdw/eHNz5rQ9WpMetT7ILWR+X4nwVXj6Q4uPFjvO1uDEDOGX9MnEyp0iRPB1LUdAnQwQZtSwh8fPQX8eJyIGUDVn3rUNWXpmvNNdeUyaBTf0XkA9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Xa8mDS+ZPHMGi8DYJMltSSDqsfscHsv2U1xU2PtIlQ=;
 b=lCvU4cJ6Dv2ZRjbKud2jsaYPIvrznNQkc9DYeCQCDH3x67/m34idr+yRv8zmjzBfP5Gz4qCqZFpskindNQwV03JqwOw7VhmzQOgceIBfv2xl25rKSxs/2v+7k+es//QOdULpOVWx7RKTt6PE3afWkM+AkNvOVXOm459X/oIRZCM=
Authentication-Results: dkim=none (message not signed)
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
Subject: [PATCH] x86/nSVM: Don't zero the l1 guest's N_CR3 on #VMEXIT
Date: Mon, 21 Sep 2026 12:31:48 +0800
Message-ID: <20260921043148.562181-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::8) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|BY5PR03MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6a274c-7d44-4ef4-3c82-08df17994930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	2ynYqEjqoiU+TFad77ro/lJa65INhc6RiaMfj9s2DnXbBkkKjreE/nrwKnUCotLEHkVNCbXzyeEk3lRiVg6URiK74vDqOcV8ha5klcNlE0CKKigiI25UiBHYIqk9wMf5LhZm+8quPM1e4e2WhzSxm7bpzMDnhqd/S2DzIu6jWwFxvezGw9qS38UwKa2Sq16+UBbMcP4XlWsUomJzcbiT2HT5O9GktdWUXjpwfbBtRZmKApGzE+V7LVuEZ0xCs4343rlHXkgdaUiyvz91xD6jo+HFfVD1NW7ngbQr/qod26/f0IMAl1hwIour7ODoD8ygEcpOdq+qb/NvdwhXh5f5ydgSnmmzkM0Ah7udjCLhxUthtbflpfKrq97xuaRhYbxptm47fngPQMa8l6HSyJATatwfXyXWsGCfOKQX4ulNK3eSXM5PfQf2B7P4w6TDl+lVomaToZcNW8oYGMj6WjXsMVE+U08UhYz/Wxtf9iLDFBnbMChYFHsMekiTkhM/uNifSOfwaD/g0PoH3yVY/wvVsRVjy45+4w1VWGZgAMoE+c8s6kwbVuhs007oqxxdObPfiWtACqxmre5fJMy0Z+VC+rvTFjUtW21+J0X7FM0LKwuGl7xE6pNu3H1cEWM56GU92yNFXZU2+XtjBplX5J3Yrittwv8XIvXiNd5rK4yOv6Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5+jg+gcNZa7lrUYZiSIvEME6HjxnhGNJU22ImmOf3/I0XaUrrMrggYsBCwJX?=
 =?us-ascii?Q?MdhQq+pzo/LKTwon6+L9HAPWgQLYcJDz+61MrealvTL+Ooj+QiULlwvLdnM5?=
 =?us-ascii?Q?qugpezpPzfKIkbxCPVTpjTnhbg4OQJUcrV5zhzc3NtlbHYj0hcGRUvGzq9rU?=
 =?us-ascii?Q?GosLA1Jm6mx0niXLds6huToT9ovv0zo4k8d2Fr0t+BQtt3QBvlBroPSdysF1?=
 =?us-ascii?Q?TZoCMd5nd06Wzo0Ns2iG4U+mdi4vJj+5F4tNnIvPNA5/Uk46VCkKuZv3ie/l?=
 =?us-ascii?Q?3RIIm3SMrbCu1nQ+8KckzwwxXsW2K6/f3n2YUjK+uWelHnkzyVWTSi1ehMPa?=
 =?us-ascii?Q?3nwaDMTgEOHmHyQ1H8jtaTk8ev7X3esznWb6kFNXSCFQxrZzoE23/Kv7U0wz?=
 =?us-ascii?Q?XfiGftcd9bDqvjBdN0KLuEFkhgWNzdlJfQU6JFmhsAb4q1CwMWTuUdrFHZjL?=
 =?us-ascii?Q?GSx9tvF9CjqRj2NRlmKjqIdWr8vvdhqspFUbcfp3xw5R6oaulkPyjeY5jkZM?=
 =?us-ascii?Q?YZ17RVS4H6V1EPMPuaxFEFPDeX2053CxMRTMrnYtCCFuhVFUWPgsIR8eSsXU?=
 =?us-ascii?Q?N+oLtl4QRoDVGSAVw4iMfFGpZMZJC/8ZVOCfEHGzW3lDXO+Kdrh5TjaES4u2?=
 =?us-ascii?Q?jd42c+qQPL4QCvtCmHB/DiKqNaoFbi0vdU5PcHeZ1/slQlLB2Fwxk/3ddXAz?=
 =?us-ascii?Q?mMOG9gvitqkFXpAKem68mv60rth1pTf/gB06tY3FYGKb5IZ7JfoPQQp+u0Sf?=
 =?us-ascii?Q?cZaosSYG3fSZZAOSUlRoqTOodaiPOEcU3UR5quS6t1LIyzXKjF63lFvgDiqY?=
 =?us-ascii?Q?hNh39PuXg96MGWX2xhBZ6GmqoRvozAeMAgcoRhBAwoQid6eqqdmcNUTA1ntI?=
 =?us-ascii?Q?5m/gYpKwICHpBEMlsj17HDntHawS1F95IaOuqifqwSn9a6f0YmSDTljbYD82?=
 =?us-ascii?Q?DA15r8TUz6qctMvN2ES9aAXWW4IX5XiT4Y7kIGlMGSu7Ai4m2lxMp0Y5CHwc?=
 =?us-ascii?Q?bM5teeENglEajvjOiDriTCUi+1crMRmAFJKKdo5CSU1aKdJCrRSouLvhaSd3?=
 =?us-ascii?Q?k/QBI76f4wFH757MoiJrefdnNckw3SGJdZslfNJga41qjqpYF8DPKRKNOzHz?=
 =?us-ascii?Q?mggLKc7XWxV1tafNaHQh1rDZf4WYcdqWUOwpuY+IZkMntFZ0Nw8vIQb5eRaB?=
 =?us-ascii?Q?2boqeuf5bGYFM/LuO5GnEeazu4MjMfoIkK5k4eSIAQAzpW4nlUMLz/CkyXhQ?=
 =?us-ascii?Q?Q/PBlPsPkJ/C/oVBAYAWMA9cIun1jXTc+hmPt0XyAbkZGFrCWHf2kOtufHrR?=
 =?us-ascii?Q?YZRyPNa8w/fgYB0q2j8I8LYGI5jVgWvFeKbtRnDLzE3X7VZFBJr2uVX8UM0C?=
 =?us-ascii?Q?ssYGm2Z5YLJq0RZu5lrPd2k1Oe8oMI2ELNH4Qe2PRatIqRa83gUmiC9VH+Fq?=
 =?us-ascii?Q?hSCZfz9PO1eiEsUmaaedbEg9YUd3ws6MaRFpXCZumwzTx3NBkhwqSIkwHJER?=
 =?us-ascii?Q?JWYMVRoQjo5LOYtv8e7gujBHdENz5CT+EguK4Lz79vap/PG8Z9/bNXAUT7yw?=
 =?us-ascii?Q?3ZHkeUeqeE81ekDwubfWA9/ITX057I7ZwErOehyQ23zHwzew2HF4Gguq9V64?=
 =?us-ascii?Q?pX4wso4BOc9XHkGlV7WP3w4/fmDh7Vn9ljJMX02+cnpPDZFrq574iYfRF4R8?=
 =?us-ascii?Q?g63oYaO2KpAWT/nYHp74RdhJKPGDNIkcF6O45EiJ8a0VMT3q+57mfrC7sCJ9?=
 =?us-ascii?Q?uD15EgTtLQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6a274c-7d44-4ef4-3c82-08df17994930
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 04:32:03.8345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HpmiPmDiYaOb+ZnzbKT0qy27+rbvcZHp6b6YbOLoSPkMTS5uCMS8i3BH4MZu0JKNxJ5O0t6nmFp/kfTz/y4UI62gSGHXMFqdPpjILLv43Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5316
X-purgate-ID: tlsNG-d62444/1789965128-1EC61757-00F27468/0/0
X-purgate-type: clean
X-purgate-size: 2471

Xen's emulated #VMEXIT writes a VMCB field that a real #VMEXIT leaves alone.
nsvm_vmcb_prepare4vmexit() zeroes ns_vmcb->_h_cr3 when the l1 guest runs its
l2 guest with nested paging off.  Hardware writes back guest state and the
exit-information fields (AMD APM vol 2 rev 3.44 section 15.6); N_CR3 is
neither, and section 15.25.4 says so by name: "nCR3 is not saved back into
the VMCB".  An l1 guest that sets N_CR3 once and reuses the VMCB finds it
zeroed.

The comment defending it - the guest "is not allowed to set" h_cr3,
"otherwise (security hole!)" - is wrong.  ns_vmcb is a live mapping of l1
guest memory, so the guest can write the field again before the next VMRUN.
Drop both assignments and that comment.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a8b15d6eae..54c62d1474 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1023,7 +1023,10 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     ns_vmcb->event_inj.raw = 0;
 
-    /* Nested paging mode */
+    /*
+     * Nested paging mode.  ns_vmcb->_h_cr3 is left alone: hardware does not
+     * save N_CR3 back into the VMCB on #VMEXIT.
+     */
     if ( nestedhvm_paging_mode_hap(v) )
     {
         /* host nested paging + guest nested paging. */
@@ -1037,9 +1040,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     {
         /* host nested paging + guest shadow paging. */
         vmcb_set_np(ns_vmcb, false);
-        /* Throw h_cr3 away. Guest is not allowed to set it or
-         * it can break out, otherwise (security hole!) */
-        ns_vmcb->_h_cr3 = 0x0;
         /* Stop intercepting #PF (already done above
          * by restoring cached intercepts). */
         ns_vmcb->_cr3 = n2vmcb->_cr3;
@@ -1048,7 +1048,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     {
         /* host shadow paging + guest shadow paging. */
         vmcb_set_np(ns_vmcb, false);
-        ns_vmcb->_h_cr3 = 0x0;
         /* The vmcb->_cr3 is the shadowed cr3. The original
          * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
          * hence we keep the ns_vmcb->_cr3 value. */
-- 
2.49.0


