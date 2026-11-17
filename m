Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF52A606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 23:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fWXiBfcG
Received: from list by lists.xenproject.org with outflank-mailman.1493368.1693391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTSjg-00014k-KW; Tue, 17 Nov 2026 23:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493368.1693391; Tue, 17 Nov 2026 23:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTSjg-00014d-Hx; Tue, 17 Nov 2026 23:37:12 +0000
Received: by outflank-mailman (input) for mailman id 1493368;
 Tue, 17 Nov 2026 23:37:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTSjf-00014X-82
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 23:37:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTSje-00DjG2-CM
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 00:37:10 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afce49c-bab6-0a2a0a5309dd-0a2a4505df44-44
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:37:09 +0100
Received: from [52.101.46.31]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afce524-4cb1-0a2a45050019-34652e1fa751-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:37:09 +0100
Received: from MW4PR03CA0305.namprd03.prod.outlook.com (2603:10b6:303:dd::10)
 by LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 23:37:04 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::57) by MW4PR03CA0305.outlook.office365.com
 (2603:10b6:303:dd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Tue,
 17 Nov 2026 23:37:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 23:37:03 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 17:37:03 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Tue, 17 Nov 2026 17:37:02 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqt32TShb88RuAHDNHyKcJPBjYjp1tQ9DM2iGSQQ3OQMyiKik/EGe4YTn9Hux9Op2OruNPYUvQ/zaCOe6rtus0r5lg+zugEGKMkaA50dKU3qEjLWXv4EuBMKwBpJWwl8X6Afv0GXrPT6YwpEbQ2wTKt47jOc+JkO6A6hhSWTTLtgZ8fpLjPUzX5HxzO/xFip1JOhxk2BLcXU7Pogt6qZ8KImX2Ix2YU9soD41BPrjkWEABjG0+i2gCRH0S449A1Ib3zfUAiJ60HsMZMOgGAwuElK4dpCOR93VyWD9Py1yvaPzOB5waFi35fVBMbbnRgg6qYFrCrKD4bi0br6bim8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkQcmUworlii0Dce3WHgMWMENlLh/7dG+38fAQC1ih0=;
 b=k7srr9alQxI8kIGS2dZmmBakp/T5NqdaRgEIa4TuKQxjviw9YeLrmzQgrVbumuwdcXzzyakkA5YJa3rhffI9MmJplAU1a1ZYkRnyaphS6VnP8gH4WvFRm+q1wg07aN6s5leFpq3hxoa/af9mu8G12ky8W/+HKnnoe08LUX/0Ho5wE6TF7r8jrmuQuOd1Qx6Vob4bT2Xqrf2y1JzZ6VV+Cjj4jfK8+VrRE6EHz+3ecJIHdvlyfdI1Ilaslrsru5/RAZ2oXH/2zwvznBqtlWjGJu+7dPZ6dW4V6dlEFEkagAyfi5COuX5Goa6/yYqxQPYS6vKuN6zASnLW8q8BfqZt4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkQcmUworlii0Dce3WHgMWMENlLh/7dG+38fAQC1ih0=;
 b=fWXiBfcGV5D9ogKWloJxM0MKYFpb35hq6Fa7bWEQknyeQ0ARSVu7FQhaVqpACFHZzFOx9nOwqhXULecXPLLVe8jQ89xc5jAyvkAeXLA5gXTXPOsBKb8Dy8evGbha2IoETMUOYmaf6EkaPCVdOlvkPZ6dTu0nf/dxsxoWRYFFol4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] x86/vlapic: accept a logical destination of all ones as a broadcast
Date: Tue, 17 Nov 2026 15:36:59 -0800
Message-ID: <20261117233700.2654525-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|LV2PR12MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: e0aea2ab-77c7-4538-423e-08df4503af73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	oLKpv4t+IIR6MS8WiqmEodST+HO9umceMeWQVxMrVi+/GG/LooYTDjhcwsT0DosAjCKGWqi/i81jz25kYI/pg5cQAxvWHvmeCc89ASQYup9wLlWM/rC/vgHDMPYoxYaHbeHs9AFVZZcM97JL2qpAQP5nAgM7YYfdBpwgHosP6tPn+g+md7KvTzbzTOP/hxiA+8jkXZf/+N19fKtAj/Xa2+VVEKqO+y3SqeEbUBXcMessXgKrjB/Yx4rklMXsnlrXhcm+YoxUz0OU9viKxc636Pr24DZ6300DTflmeTau4IEcoyW3zGvZBshR+tmdh9qD/JrLeqkCe3xL8EdN3ardQerxH7QV7MAdqbtGZpcWFmNtEmDVOjOzf8y5u+NpRh1a2Y5v71VmRWY1NRPv1FjAQWzXnK2PILwabRyU2j+Ng59cntiKJyK9mU/icBmXp+LufTjm2AgqKN0HYsdnqp2abouDlN008+kb/w9sfzIlh1QwmI8ZAsFAHXDQvkod+Gc1EJXvvtu0z/gukWg3Lx/w0MCK3Y4AT6mBPfX5Y5cUtFLAtUqqEyHuQtv+wFKUljwjQE9459IK6aotkvJRFobnnwbjgIRXBDcR63aSc6xVId1CTqrMYUlICEA2bikzmJVpkfmztz1eiSvqRMPs0AsWSlYLWuRXqDMW7UXrSiR2ANcGB595L6edg51U5RT/yuhwM5fP2KegeMU48pkzrRPJHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3Z6UgkeJbWsMRyGhyzkUuOOQ/Ggpor0DAoIBd9pyF71vkhGNgFEjANJHp+pLeL+7JFaneGNqJ9XE/nYyA9Rllbkc2R0lXOy8+aPxI0JRMk/r350OWCOIqt4l6xZcP6fbmVWBZkoaDR8Tah5R59lWXub7+eMY1caYUtiTifxiHAuyZ3BRQZ86MQFb6+8NyflgPX7DdFcPaDdj8j/n0YznqoEBtz2RldF3OobXLdZr8ZWOPKAeLHTWyRJKL0UZZGuhkZHWDKXA+vK/R6lIdXr7BqseXt9wg94jMTnLFru9HP2Qa5paHRmTrdDagPmIIFYPGpU/9NE0ZNRhNobiqSbl5t5JrPifYISqLdBp0Rg0XJ9O5DlXg7nNYA5tM2Nxjkvc31xY6xfVfvIAuH2HZ9x/m/FD74KRNLW4jTauv0vri98UU3wG3GtAbwSnhU+r/Co3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 23:37:03.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0aea2ab-77c7-4538-423e-08df4503af73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750
X-purgate-ID: tlsNG-c201ff/1794958629-F66B52A1-A7A37CDD/10/78276251493
X-purgate-type: spam
X-purgate-size: 2323
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In logical destination mode, a destination of all ones is a broadcast
accepted by every local APIC: 0xff in xAPIC mode, in both the flat and
the cluster model (AMD APM vol. 2, "Receiving System and IPI
Interrupts"), and 0xffffffff in x2APIC mode (AMD APM vol. 2, "x2APIC
Interrupt Command Register (ICR) Operations").

vlapic_match_logical_addr() treated these as ordinary logical
destinations, so a broadcast reached only the vLAPICs whose logical ID
happened to match it. In particular, a vLAPIC whose logical ID is 0
received no logical broadcast at all.

Check for the broadcast in vlapic_match_dest() before telling the two
destination modes apart, as was already done for physical destinations.
A vLAPIC whose destination format register names neither model now
also accepts the broadcast.

Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
CC: Jan Beulich <jbeulich@suse.com>,
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
CC: Roger Pau Monné <roger@xenproject.org>,
CC: Teddy Astie <teddy.astie@vates.tech>

v2:
 - Check for the broadcast once in vlapic_match_dest(), before the two
   destination modes are told apart, rather than in each model of
   vlapic_match_logical_addr() (Jan). As a result, a logical broadcast
   now also matches a vLAPIC whose DFR names neither model.
 - Cite the AMD APM by section title (Jan).
 - Add Fixes: tags.

 xen/arch/x86/hvm/vlapic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 6698779e22..50b515d254 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -247,10 +247,12 @@ bool vlapic_match_dest(
     switch ( short_hand )
     {
     case APIC_DEST_NOSHORT:
+        /* All ones is a broadcast in either destination mode. */
+        if ( dest == _VLAPIC_ID(target, 0xffffffffU) )
+            return true;
         if ( dest_mode )
             return vlapic_match_logical_addr(target, dest);
-        return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
-               (dest == VLAPIC_ID(target));
+        return dest == VLAPIC_ID(target);
 
     case APIC_DEST_SELF:
         return (target == source);
-- 
2.47.3


