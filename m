Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB592CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 14:48:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441571.1659170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE6T6-0002jK-GA; Tue, 06 Oct 2026 14:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441571.1659170; Tue, 06 Oct 2026 14:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE6T6-0002jD-D7; Tue, 06 Oct 2026 14:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1441571;
 Tue, 06 Oct 2026 14:48:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xE6T5-0002io-Cl
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 14:48:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE6T4-00CULt-Lf
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 16:48:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ac50a3e-2eae-0a2a0a5409dd-0a2a450ba28c-8
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 16:48:34 +0200
Received: from [52.101.48.30]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ac50a40-b7e8-0a2a450b0019-3465301e106b-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 16:48:34 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SAWPR03MB989599.namprd03.prod.outlook.com (2603:10b6:806:55c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 14:48:31 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 14:48:31 +0000
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
 b=L0IxagywmmyO4ktBSgjF0cacK14T6l2iFl44rtPKLpfn0n21SS85YnUR1t7jRvazvdYb00Eb7yd7/vQ00Cloh0Di8b0Ij8S8X0XEBPDrevd3/i3HFitHtXSkUCkasdI5h/+iHS3goFsY/iuN2uQIC8WXkkMMVtinW64GoxOyZaKck2FbSyhb5zAbG/3n/CZkh9iW8IEsjLRyrymeMWzXlAP383N3Rz+QuM8rClcpweuinBJG0Hfs0Ukh2YcSJuejr3EJyFAEp/k6wqxkVLpUmePMPex9eUp1+UErbvz+PkuYob4gIWVF1o+0ujV/5tj2yFYbuFK1IZYXc2Wgt5rh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhDcIEiFZcls6I0YzJ2XQWMLqLgbR8/hTYY+1gKHoYI=;
 b=CpPco7t5Nr63uZ2xFNTZwd7zcws+HvYCnlLtZPMhz5/xXXZa1vyX90dOhJmwwosGuaWuF8gkMmsOH9A9l1CqC6XEJIF7BIetfieagEGlzKGZ/6ceWAAEKY0aqLKQoPX/OmViomyjO2+u8CRldpnjWyESyKCDXF8P2fJwzx4NJgALligAXi7zSof0k3ueyusT9UGAUWN1UDqqA0rZz1vskgShR+QfO0QdqWlJaOOvD9ZLbhswS3LhJrwlvkqC4eN8ldUxukDykO7SfJoMbfLAVMsCunMcTFZDX98R6PPlpBCdHxMoEm9F0JPVziHXu/9XmWrXDJeNVlh2pUYrSjAJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhDcIEiFZcls6I0YzJ2XQWMLqLgbR8/hTYY+1gKHoYI=;
 b=lvuZD4V0MT7RZYhfvMtXHQf4yIPKUJqGaNNDMTt7fWQdB776YXlGUebFC/ajzDpWSG9P/gb6OIqgBfK/22UTc+2dSPfI1bFnud1mCzPxjoBi+tvNcHVzPOcI6zzI5EbROT2RMU8XREiMwmziSqtTAzBJRTkTXmLTtKnwJETLons=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/svm: Don't clear clean bits on every context switch
Date: Tue,  6 Oct 2026 15:48:05 +0100
Message-ID: <20261006144805.2575991-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0260.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::25) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SAWPR03MB989599:EE_
X-MS-Office365-Filtering-Correlation-Id: 972d7933-114e-4cd2-392d-08df23b8e3a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	QYn7tuYEjdNPw1V4/fpwqQh79eSD4psSH8akc0y2PhWhR1j0AhfpslQ1ZB8J5Rjv9FHuTCCKMArIyRwFyvqR0x8KMUfxTJL/j/jJxjObj/u0zjyfLGtXlOXD/p+dCGPXT9xsnfN0oRZTu4vYUPG2GmENzw+RMvOgF03KRzeytn3aFOq9tjzxwA0JKPxNAoVDnfxzihV6TOsz9/zW/Abz4BWidjKvnkQPuj7Vi90MRcprWL4VmmuHAb5swu5wWZXdiCxFFf11wEksFwi3SEftm0WtR1wOQbCuh893kCeTRxFIVzq0g8K4lY6hfgVTSlmy3DqFLWHL0i11fidRhWWj4TOKDVA3AjToXDzyni10MX7A1n9oKgQ1V5Vz30sYbogY3ATApCkXlt3+/tGPt7amxpyijINN8BMgDviDQhuPKe9aWkKQW0gOZKmVDgHZ45tIWYTUGxYRDWkdgRDmD3ChQdYxQ+5jf7L41GqEhigxzFKd7OWgi6oDzsazaeOf+vkdMlwZuKKGRZSPx0xEdhFfNUO/efwGMOyKe4+iaLUV6eJ2Fn2i9bEXRIV+75YtMhy/VMq1fpWkmWqEwGPkbTo6KRoQ0k/dVWA5oafwvlu5k6fyTTXJ9v3Ls/TXaorBSBHfBQFvHuEKLmtmE0TYMSS3tAs9QbSd8cu0V4WU3BRUG+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mviYxwCk1IlI/LELmMG23YfeofhhJ4w9twf8/y/mh0rdxd/GZ26YKJtOLLlj?=
 =?us-ascii?Q?qKFrhQCJxVfgTuovO8wvouS09GgE+j1ySAGHjSCQSh+GHQC1D+DUKcwir02r?=
 =?us-ascii?Q?gbXLPjDsydIzu50Efn2T/SSVLB60wnoMPJba1IdRbi+a8MKURCR4E35gB30j?=
 =?us-ascii?Q?CRZmWKIjZjq5Qkpd2Zb5AJwdi35vKHnoHH7YOXuQE0MmHFbE/UoTMqE/ivAA?=
 =?us-ascii?Q?H9nOr7hSP3Eh3uwVNU5Z9x/GvWEm193GKUWmVvCE6X7QfkAC+dt/yJons9UY?=
 =?us-ascii?Q?UKfQ4WD0K1AFNxJyH19G637GNPkDsPchZMsKPTi7pdPMMMJjw94JVCXLg5t7?=
 =?us-ascii?Q?Oh9W33AA4ORtuBWjh3xIJ+EQd1nXrcJMqwqgxrApAwOduto1MQe5lbVeZoMj?=
 =?us-ascii?Q?lre+1aTzzdy08WaqqY755YX/eRwExbwS/Ff8FRqz7gJQepAX8jyGWh6OQQxB?=
 =?us-ascii?Q?dO04lKNBsI2EM+wqWZrVZ7NvBbGwaP7NXRmcDnKwPqzxLEJC9JDTRWl4VdfR?=
 =?us-ascii?Q?N+KHDu7fymCDiVQPGRYi7UxgJ8JrN7YGdAGVilPseE0yw4A/KKhgnEpsIfi0?=
 =?us-ascii?Q?CvNPVquu5XZ8392IA2SBFs/AYzk1PKCcHaAKMQnxEtd5sj++d6zX3qLxSaCp?=
 =?us-ascii?Q?SfupLFmX+96+PC4InQ6KKZoHLOrhdz0sc5R/+bQVmOjz15dmGW77fwQEE7M4?=
 =?us-ascii?Q?EwFnhvtb5+E3lzec9x+kQyigQyDp4BXloYJotqEDPTt2bpfPKrXzBxJ3E1sx?=
 =?us-ascii?Q?5UtHU6g4NEGKqZM4kHV5+Z1mV4xELCzeCIKOyDPnqzjienRInwzDQ6kPgjyC?=
 =?us-ascii?Q?bgI9Flzjd+/gspbBiFm155V7Aw9cEa2eM8gjNq0KeFI4yBzKGu672Cj5CD1O?=
 =?us-ascii?Q?D00QrOWg36QiaU8gtlr9X8/QuYKkMm66KvbfP6m0Hb4dxNB159xP84Gue7Q3?=
 =?us-ascii?Q?Lqp0/0pKZK9ervBqF9t13fgWMOgIIQpMfXdiJvCMRA/K4b0XggfGNlu9EKW+?=
 =?us-ascii?Q?iMkCTAJLOZk4Fz0TGpaEdhas6/T4I2KhsdM+RpPbBrYpdBVFJztcIPS8/JD8?=
 =?us-ascii?Q?gPx2mQO5ynoxlM4HzzyRssDN+UTxO69LUhArwI8nuWyIJ5rb7bSuuhnf5UBL?=
 =?us-ascii?Q?+y+wjR4lpomxZybbukXFItibyMaRkxaFKk+4ES+eC6O2TpT0RHd+Eq2DsLr5?=
 =?us-ascii?Q?ZtG5BhWGQDewEAtlp2fI9qCNzWgwQ+kNJQK4TxBdrQdhjlMeHnwhg+SqILp5?=
 =?us-ascii?Q?fO52men1Wlg4CvocDTd1KOy83Uozbwl/uchnPx10wApcAY46r/Bsv4Uryxs5?=
 =?us-ascii?Q?VnxTI/eUNyyx19ZvlLX/WUaIdZupBrOe1JCOoBBWdTRM4cCIBJYM2mOAmQCg?=
 =?us-ascii?Q?vS9h6WASuOT3FIcI0gc+DjYUuEN274nZRuFn2oVNfpNSqRtnay6zBFeLf0eZ?=
 =?us-ascii?Q?Qg+7mhV3ZUEDUenMtTQploOF+3/BkfqTQ3Cf9Uht/0cMSQ6vOc1nNCAPTX34?=
 =?us-ascii?Q?62VyqBH+/wjaeTUteBWGnycvAaBkYHL9c74RiSt+nN4g1dtaYTe8DOBUbB2j?=
 =?us-ascii?Q?wwNxktlwEE9wJBmlBXOfJ67SYs0THYlBBbbNydE3bZoTS8tVoKKpN206SFVe?=
 =?us-ascii?Q?L1eam87ThpoItMTsJ2j3ny2tLKJEJ4iKx92ZoNVc+6VitZbnszs8FuehaveS?=
 =?us-ascii?Q?nBVB72JHDwGn52tsB19O99QuSaJFO5S2bE3cDi323ODn31GI1E4sbeuWLf1z?=
 =?us-ascii?Q?86s187TQkvUhMJWfvyVs7AABnlFtJCM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972d7933-114e-4cd2-392d-08df23b8e3a3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 14:48:31.0713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAfVJ6e7Gvt0PzhUKYov0aeNpovuPEW+Tivki1en67bedfBQSJe002SOEYcXkfZj8CxcniM0CNKcrS70lqUYRgoRqLLFiFbvRGNuJZGNnX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR03MB989599
X-purgate-ID: tlsNG-42698a/1791298114-1AEDE9EA-6A6FB087/0/0
X-purgate-type: clean
X-purgate-size: 1413

Clear the cleanbits only when the VMCB is used on a different pCPU
rather than on every context switch to the vCPU. This follows the APM
guideline for when to clear the cleanbits:

"The hypervisor executes the guest on a different CPU core than one used
the last time that guest was executed."

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 71e48351f22c..4e22322f4b42 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -890,7 +890,6 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
 
 static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     int cpu = smp_processor_id();
 
     /*
@@ -908,7 +907,6 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 
     svm_restore_dr(v);
 
-    vmcb->cleanbits.raw = 0;
     svm_tsc_ratio_load(v);
 
     if ( cpu_has_msr_tsc_aux )
@@ -953,6 +951,7 @@ static void noreturn cf_check svm_do_resume(void)
         hvm_migrate_pirqs(v);
         /* Migrating to another ASID domain.  Request a new ASID. */
         hvm_asid_flush_vcpu(v);
+        vmcb->cleanbits.raw = 0;
     }
 
     if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
-- 
2.55.0


