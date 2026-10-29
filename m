Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9510606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 06:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=fOwv/0Nv
Received: from list by lists.xenproject.org with outflank-mailman.1464176.1674897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJbx-0003kG-7R; Thu, 29 Oct 2026 06:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464176.1674897; Thu, 29 Oct 2026 06:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJbx-0003k9-4J; Thu, 29 Oct 2026 06:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1464176;
 Thu, 29 Oct 2026 06:27:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xMJbv-0003jx-CS
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 06:27:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMJbu-00FxUc-IL
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:27:38 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e74f-e002-0a2a0a5209dd-0a2a4509d038-18
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:27:38 +0100
Received: from [52.101.61.43]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e759-be1a-0a2a45090019-34653d2b5e9b-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:27:38 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by MW4PR03MB6649.namprd03.prod.outlook.com
 (2603:10b6:303:12c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:27:21 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:27:20 +0000
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
 b=LY93Dc2he36qzBE6ehMri22kyi1HoC6E9MDwSfw4+rV7D4OV/eZx4X2cHomBqZQLCXBEv1rzLArWVdZhAoNmm2UINPXtrb+WjkNu58BSm8W3t7OkTrD7hOEbtNmDMiGYxtczcpLdlZs7o8PP4nVHT4VnfbPr9aRQkH0ABtKNXE4ZnDlIBsvr6IgPMIleyE+YAz+OR89Q7R994Sr+8OnJ1x8tCxbgLIRxzJXyj+w2k3qVauHjNBH/SSl/avmiD1tY/tP+6NDv1jiQ+KRcwnvir6z9tesue70PfDc1KyQQjYKJHYqdXrP/fPdYYf6iih4opu/FqLM4Oorka2nWsmx9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CSoyYs+mwsdjQFZS5TYqlnxP6kA83rRcuAJN8c2R+0=;
 b=TFoue+//Ij56+valcIS10vujRWCrtxy9jpF5Yv4Q/dIsHK3JE0LXvkrCgZHsq+69uGSn7dhRfNox1TnKDcQTFGSKJuRF98hB1fm3UthtqG+TnbKXsvGp1NYv9A31YPGeKSj32y7vSjMU1QXUk3VuQgIlGMdsj4Hmz7GAZco3h/FuWA++bBS9wvRdiMUYV6ZoeATEvOQ/8Pe7LR4G+W5UH+FYZuk4wW8LiiJ+npG8cMjI3F14ziQToFfLOIw0esfrKtYlUJ3IquVE/EwfqThLBXbmHPKnYJrEFWGr2yFEfcWRsEwlIvUpF/IpnjApu9a6eqkbJpozLGuzhwkiHfkcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CSoyYs+mwsdjQFZS5TYqlnxP6kA83rRcuAJN8c2R+0=;
 b=fOwv/0Nvrlhb4mKXQJ9wtKskrJaF6Gn09VmWkdfvv5vA8okcRjfD4aWV1Ujup1+q/SXwnmK+mLwmVn6I1nYt+6uKwFbO2+e4Mf6oW6ElLOK0obq+4xYgOKAeWAoIArLCaoRiYN3TLEVaR2PnHhzB6yD5pc38MfKcOcH9IHpGCzE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	dpsmith@apertussolutions.com,
	Stephen.Cheng@citrix.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v2 0/7] x86/nestedvmx: Fix nested VMX bugs
Date: Thu, 29 Oct 2026 14:26:52 +0800
Message-Id: <cover.1793254779.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|MW4PR03MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: d62be114-7821-4eab-07f8-08df3585afcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261028144727099003|11063799006|56012099006|261022105027099003|261009223027099003|261026140227099003|261022075727099003|261021123027099003|261021121427099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3mwOhzxXZhBgzVrTIsWywaH5J/VGEB3FV+b/8FU+GOEa38R8QK4h+jfhA1Hp5WcookNfbBBOM0tfe5tixtTz3+JPQWD1CI6hHISx5rHN4YEIW0SXDriQVpNT4KQgHhjIEtFjWyFQSPKJztbLuJHhkpq76Cq6JvCWZpaa4Ecvpp6rQqAhcGF66bwSrG2j9rScoVAfhyoZ9wPVAGvKAgyfrETwn0Izv+wGfoD5+blD8HW7Xu9/7J5sS1cZzpwOKj/O+HfpuFU18QchYplKWKuxwg72m4hjAXdNbi1p9OBpyrXv0kb+XXbvDTBiDCVZDbxq2pib87vFL23V11N03OyN7d9TOHHC7eSPAWG/MU0Wz2u6sRQPaEdGXDnRPmovYd73vNNvoOG/9SFsdm2/50Tp4vvE/S9VEshGCU6IOE20S4XRyFkrwUqD77vqk7pmmFsZgrBvC1Hb6vnqV4EbpBANXFxxn33iGafukttpCFGC1yAhCsyX2I92rZreg/5J2wgLY/PMRYAiBVGdNXVBIxFZQloxUdL9izoucTwT9RTX8BagZt+jC5WxnVcNE3HyqWyoWMGZGDTg9sekh7QcHo9pY+erpwS6wf6P61fOjRKhDom9wd4l9sRQ8rHv+d63yL4MSc+xl0K+lhpJRlmMDPaw8ebtlvkEBDH7Lie9UffXiE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261026140227099003)(261022075727099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7CVIC64WyD8YEGLiyKA06ahCiQ4rZDsfQYdfi+y2ZEwYgF45Eg+iPVBhNzT4?=
 =?us-ascii?Q?i5IROt2PJ3lday+PqzJH4ue5JT0Y6IH1iB0l2mpT1THXnx5sgTRObpCQOto8?=
 =?us-ascii?Q?4CcSZTSMNXqVnAckrjpzJlKBF4OggZn9LgIgoAe8YuiNvchWSYNn2DrHVdCD?=
 =?us-ascii?Q?70HfZk6wvJlkBOglisvkWwIyNYHRn6HTnLMjyNFRCqTNUdFvd8ADNKgCdteL?=
 =?us-ascii?Q?UK0cQQ71GV4KNv2TzC91efTuxkkti0zkJ0ena/rCKGXyOU7F3zBAlDppqMZB?=
 =?us-ascii?Q?cklyM+LCOdPGx+uri0XD26QgH24wibvoGx5AEisqCBTqWIoMD+9ye2VAXllE?=
 =?us-ascii?Q?/a3f59Y0zmxxYbOWpiI5oybWk36LoSyoqrX/AHsp2LDdW9unKvQbMsC/Xnsu?=
 =?us-ascii?Q?iOQXGFpb5pSP+z6Y0JFirb0TUvEDc7yxiwMLkh6i2DDOYq9rsWouAcuA3Nfv?=
 =?us-ascii?Q?HHxNV/QrZognA/B7n49KG4+wgbEimGP9pgtVBo3uFmjoQMffiXAkV+UISc5X?=
 =?us-ascii?Q?WiGhFJA4SMoaaAqlOSN0//fP62B2X9RTkAcDyNvnkB5A5QVRfrftddn234wv?=
 =?us-ascii?Q?sUBSOWcAWL1qVAgQTmR/opFfdS5tDOv6Jj9w/WuK9wTT7EknOQ0VVzgQWsin?=
 =?us-ascii?Q?nFO/0pN1LaVtmnnxHiWb6fRMM8J1/rphHFOdZ9BAA1+Wu21I13SQAqT65zmK?=
 =?us-ascii?Q?4n5lZq88brZSru4V1p9+EdRqf4THUFA8SMlj0QIUheR0NqV6y0ucsNWks8/b?=
 =?us-ascii?Q?sPe4PAqjB4Akpx8DTRl+/01SFHx3b9FcVNvfydJdapgEbpn1uiFrDBR0pTkZ?=
 =?us-ascii?Q?gkEIb5Pg2gDjj26N0YOVdWEMrM+6DrOyg83YUWFGxBpcuEM3icrWDL7jFPB6?=
 =?us-ascii?Q?3+mPTgwJVNxb8eb3zb3x9dX2d75FCc7wKIsa1qzn/uX00a/IJoEsBO1ZP+KP?=
 =?us-ascii?Q?IKwcP5pNFOuo2PTjyX2jXGlxDtN8aEag3GxiRKPKrj3D0yGtH1uL81QKtd01?=
 =?us-ascii?Q?6JD3IY/CcZQcObVODXRXL6IKq819LHZkjR0niS2pHxC75bOLlrUuvVX43wpY?=
 =?us-ascii?Q?roDDqVUzMGxF+MHLGqxeCdPS/PD6N4BABZE3+b4qyPvrkjtivkH2T2dOq0OX?=
 =?us-ascii?Q?NFI+Rq+GdD41OhlpfZ+0EpbadSRROFmudYllpRL98c4WOYtp9h76RgWcgQp5?=
 =?us-ascii?Q?UQL4lkJHr52DZt6MbpRnsNRTXbEbb60l3gzBR4D6Z8K3xGR2BKG29WeMLgkt?=
 =?us-ascii?Q?bVtBP/NC3rTlueljC++d8Relu8ULlDqba3EadiNsrNB2dW9v3cgsIyW8Rf30?=
 =?us-ascii?Q?cTYW0RQOQlJumfXfG7zj6iSouYmqtmCMUns8L05qlmJTWR1LGy/9nmZILtI9?=
 =?us-ascii?Q?xb/Ca7zZkr42sW6xFYYLfGaAx6TSKG5gT+jZmTqwVPM1IOENrm3tZbdoJv0N?=
 =?us-ascii?Q?FVJ0a0oLsktLxvjNBYbzA2fuEdgAeT9IojG6aP+ofBB7BYoLmSmJ1EOC4yTY?=
 =?us-ascii?Q?CVM8PU4Tyz3QfndcfiPMhsHt0EdxwE1zTh99zf1+UA4dxTWCLsayaA1ca+M/?=
 =?us-ascii?Q?FuqLWQ5Fu5GBYbtpoyyCSbmTsOlWvkLV2THKM70Yd53kHG3mLVvjcAtL0D/I?=
 =?us-ascii?Q?lQOOVQWUW6wnRqcNeHKkZ2Jrzkap4ZKVxnOdzQEdHL7O462YH7NpOanyqAbP?=
 =?us-ascii?Q?vd8ABExdp3ET3uHPywiUNB1pO+H4k0CV9qN+I+YDELnhcbrL+VpOHQAL3KGX?=
 =?us-ascii?Q?gSq6rFVMqQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62be114-7821-4eab-07f8-08df3585afcf
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:27:20.9326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lyho2Z0mOK1Z9OuNufHtQlX2ae+Ms5ZtVP9M8EGSHfeD4V7bxMEcqCezhs5c2lO957chj6NfSzl0HT+hMHqrdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6649
X-purgate-ID: tlsNG-bad1c0/1793255258-3ACDF034-0FFDAB5A/0/0
X-purgate-type: clean
X-purgate-size: 2047
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

This series fixes several bugs found while running nested VMX guests
(L1 Xen running an L2 guest) on top of Xen:

 - Patch 1: stop leaking L0's widened access bits into the EPT violation
   exit qualification reflected to L1.
 - Patch 2: emulate L2 accesses that hit the APIC-access dummy page
   against L1's vLAPIC instead of mapping the page directly.
 - Patch 3: reflect EPT holes hit during L2 emulation to L1 as EPT
   violations rather than injecting a bogus #PF into L2.
 - Patch 4: load L2's EFER on VM entry and restore L1's on VM exit, so
   L2 neither sees L0's LME nor fails VM entry with invalid guest state.
 - Patch 5: invalidate EPT caches after flushing a nested p2m, to avoid
   L2 walking stale paging-structure caches into freed pages.
 - Patch 6: retry a nested page fault if the np2m changes while L1/L0
   p2m are being walked without the np2m lock held.
 - Patch 7: fix several nested VPID problems.

Changes in v2:
 - Drop V1 patch 2 (Implement nhvm_hap_walk_L1_p2m2), a temporary change.
 - Rebased onto current master.

Chunjie Zhu (7):
  x86/nestedvmx: Preserve hardware access bits in reflected EPT
    violations
  x86/nestedvmx: Emulate L2 accesses to L1's LAPIC page
  x86/nestedvmx: Reflect EPT holes hit during L2 emulation
  x86/nestedvmx: Load L2's EFER on VM entry and restore L1's on VM exit
  x86/p2m: invalidate EPT caches after flushing a nested p2m
  x86/nestedhap: Retry nested page fault if the np2m changes during walk
  x86/vmx: Fix nested VPID handling

 xen/arch/x86/hvm/hvm.c                  |  6 +++
 xen/arch/x86/hvm/vmx/vmx.c              |  4 +-
 xen/arch/x86/hvm/vmx/vvmx.c             | 71 ++++++++++++++++++++++---
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h |  4 ++
 xen/arch/x86/mm/hap/nested_ept.c        |  9 +++-
 xen/arch/x86/mm/hap/nested_hap.c        | 52 +++++++++++++++++-
 xen/arch/x86/mm/p2m.c                   | 19 ++++++-
 7 files changed, 152 insertions(+), 13 deletions(-)

-- 
2.34.1


