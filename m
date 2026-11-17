Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA87606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 02:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mKuPGolQ
Received: from list by lists.xenproject.org with outflank-mailman.1491788.1692508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT8aU-00081O-3G; Tue, 17 Nov 2026 02:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491788.1692508; Tue, 17 Nov 2026 02:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT8aU-00081H-03; Tue, 17 Nov 2026 02:06:22 +0000
Received: by outflank-mailman (input) for mailman id 1491788;
 Tue, 17 Nov 2026 02:06:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xT8aT-00081B-Ch
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 02:06:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT8aR-00GGGs-Nb
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 03:06:19 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afbb670-e002-0a2a0a5209dd-0a2a4504c12c-16
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:06:19 +0100
Received: from [40.93.198.38]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afbb699-b57f-0a2a45040019-285dc6263858-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:06:18 +0100
Received: from DS7PR03CA0028.namprd03.prod.outlook.com (2603:10b6:5:3b8::33)
 by IA3PR12MB773576.namprd12.prod.outlook.com (2603:10b6:208:61f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 02:06:14 +0000
Received: from DM3PEPF000265AE.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::34) by DS7PR03CA0028.outlook.office365.com
 (2603:10b6:5:3b8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 02:06:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265AE.mail.protection.outlook.com (10.167.23.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 02:06:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 20:06:12 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 20:06:12 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Mon, 16 Nov 2026 20:06:12 -0600
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
 b=p2GyoOLMI8jmcFASNx7RZPITZKX5urlIkXx4EDJYlE91YlMjgoHbMsRXXraU8aMZ/PYH+ptyQLeaiufygeu/K9/3tqcWE6YFEkCABH1QZFiMe+rfdaW3AuxGftp94HOJGb657rhneXU5ZDJY7X5Xp0Jip5G+kOdY0MwuzSemizeN+oXlf9M9YefEEFI05ecZUaZHbGWQKf64ccbQCcxOBVJ1MihZZpL/6s7r35fWOY+N8E3qqR4IBcHrM9peV8ylrwxlNCzvHHHuKNs31k6i8h766bDpgSQ0SXs51eCPeevBgXg8m3DBxb9U94LAxVaw2t5pQDmgTUMONFPJmXwbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbbrLALmmSPXX4WJfkUBP8ueMSLKNJYXpESr54/ykt0=;
 b=plVtXhYCVO3sKS3kvaxsYApgpsC77HcIhKTT+RHLNVDs1eSXtFxPP0fwHAgYRpY18amwN8LgOBaPETf3HbWXf1dbRGowps+xHE4fIPPOLPDYZlG6BT0Ceex69dvuv0gicbodLZ42ZB6yUrDek5Vgg3ztN2QeupA8u/+sJLM88pEgMh2dfjJSlOzY4gYnppDMVkb6VY9wFJf/7+nH2/FoVM8ftoDvxvos0kE/H1gst4KWDUakS3dv/6E1w0fhZemqw9ge7eMONzzlq9iqGIP6bUhzSonp9XK5Ank5RUYWFIk82/PlUN+dB3FTHIuxXxa2jx3L1PDXINXLogvBN4j1Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbbrLALmmSPXX4WJfkUBP8ueMSLKNJYXpESr54/ykt0=;
 b=mKuPGolQ7efnSN/c7kxx027oxADSnqmSQdug8XXRLiErgRIRWWuvBvaLQQQLataOgZMKPu5jjGt4JhFB5Hoau/4LCjJPuh5ArN+GAxFRRjs57ihQATlNpdIoMyI7eHXSQ1vcCXn+AveWfge4YKqLGPDKnoVu8pxGowrluA3wKG4=
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
Subject: [PATCH] x86/vlapic: accept a logical destination of all ones as a broadcast
Date: Mon, 16 Nov 2026 18:05:59 -0800
Message-ID: <20261117020601.1466125-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265AE:EE_|IA3PR12MB773576:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ddf4b3-81ef-44fc-f8ad-08df444f5b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|261009223027099003|11063799006|56012099006|5023799004|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7lTkRJv6zfURlhbGdQSaXmQmE3JUSgXXj9wnEt3NPyEHTP2jwyKatIvmpNpeqmCiib5bJifnpg6CBQakZWMHi87nkkIXfOQ00vJnPg7hrgwu0T8VcZUbharXO0YOpGgZFupbYF8ItSMZ+SFRNBn4uw+UekGFDhG4236jXHj/rLibMlayKCYWTZIb5bg5OeAE9lT4QR3NJCyQrbZNK+Hbj8HVszY9BdcE1xyZYBZZh68Myu9+TFee/exZbiBWhMWEdrrKD2L9ron7pb26IOj1tDl4/j5tI8chX30/F/7FV66RKzraHtg8Ntpy+09X0M+JC0rttoitboHg/CFsXIIyaCnGjPyGftk9SvPVJm8D1zQRAg6Y2+J+OuSrinyyiulba9mcU3t1W3b2Ztpe6sX0Klcwqhek24rJerJXOszdHAP+WyFhg1soYMjOuiVy3LGVx+Fe5OG5iNu4VYoysPIc4NrgD0Xm8DQ7FZOl8CRpVXeBMUVqSVsHw+fh79NlGqyR4O5mx27v7uol26350++ZAvnrQHXET66xwllyy9/d1ETbS2v5B6haGDCGoZqTEqfXJgrM98mSJnyI2B2n/8tAgTbhmahJLN22n8i9OjXxWXC+sP4Ki9cILTtXkxgQElGcbnw5KTs9Ro8VyTHmSk+ByuerInnkyAx787mDYXT6KiCxUBEm93MtPcKyXxveJIndR5Pi5hMae4ooSBsEYidung==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(261009223027099003)(11063799006)(56012099006)(5023799004)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6jV9UAr2fn9nsxygZGof1hFJPXLbUaRsDgUB7xl8PJHJQhNrRVD4r9kg1Y/SsSmmWfLqpg+G3MCiFh7afFmLiI5CT2kDjewyhHARfsr3E7ydWpXEPZM/OPysDuET8PJb3HwOVQWpKN1DL/fReFQSN1LLyggmzOyLnfKS0ngCTb8uFyYbmlOgPyiQbHgKaPIIQvT2VyQVNoPqsfl3CyeGhU5r9F4AsNthMK4KyhZso5ZXdhEZDZVTmE9WvmD3mXuHS8BEdNVehpVY3XMcROftu5iT71cavxP5NM+mUjJE6H0ZdDxb3TeCcqHgzuwNA+UXi14BcOUI5tyh33P9CmE4zDxTPAvvY1dbF9GH8z7SFjBtgduSA3b3n92fKninLCqtfJ3IUf4yhUEQjv4k7Z7ranO422yO4sa8xpn4InglfyWr51CBPpPWVtJXZHajKh4M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 02:06:12.8701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ddf4b3-81ef-44fc-f8ad-08df444f5b42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265AE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB773576
X-purgate-ID: tlsNG-ebf023/1794881179-508D9B50-32B282B5/10/78276251493
X-purgate-type: spam
X-purgate-size: 2642
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In logical destination mode, a destination of all ones is a broadcast
accepted by every local APIC: 0xff in xAPIC mode, in both the flat and
the cluster model (AMD APM vol. 2, 16.6.1), and 0xffffffff in x2APIC
mode (AMD APM vol. 2 Rev 3.39, 16.14).

vlapic_match_logical_addr() treated these as ordinary logical
destinations, so a broadcast reached only the vLAPICs whose logical ID
happened to match it. In particular, a vLAPIC whose logical ID is 0
received no logical broadcast at all.

Match the broadcast in each model. A destination format register naming
neither model still matches nothing.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

 xen/arch/x86/hvm/vlapic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 6698779e22..ed745a810c 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -209,9 +209,16 @@ static bool vlapic_match_logical_addr(const struct vlapic *vlapic, uint32_t mda)
     bool result = false;
     uint32_t logical_id = vlapic_get_reg(vlapic, APIC_LDR);
 
+    /*
+     * A destination of all ones is a broadcast in logical destination mode
+     * too, accepted by every local APIC: 0xffffffff in x2APIC mode (AMD APM
+     * vol. 2 Rev 3.39, 16.14), and 0xff in both the flat and the cluster
+     * model in xAPIC mode (AMD APM vol. 2, 16.6.1).
+     */
     if ( vlapic_x2apic_mode(vlapic) )
-        return ((logical_id >> 16) == (mda >> 16)) &&
-               (uint16_t)(logical_id & mda);
+        return (mda == 0xffffffffU) ||
+               (((logical_id >> 16) == (mda >> 16)) &&
+                (uint16_t)(logical_id & mda));
 
     logical_id = GET_xAPIC_LOGICAL_ID(logical_id);
     mda = (uint8_t)mda;
@@ -219,11 +226,13 @@ static bool vlapic_match_logical_addr(const struct vlapic *vlapic, uint32_t mda)
     switch ( vlapic_get_reg(vlapic, APIC_DFR) )
     {
     case APIC_DFR_FLAT:
-        if ( logical_id & mda )
+        if ( (mda == 0xff) || (logical_id & mda) )
             result = true;
         break;
     case APIC_DFR_CLUSTER:
-        if ( ((logical_id >> 4) == (mda >> 0x4)) && (logical_id & mda & 0xf) )
+        if ( (mda == 0xff) ||
+             (((logical_id >> 4) == (mda >> 0x4)) &&
+              (logical_id & mda & 0xf)) )
             result = true;
         break;
     default:
-- 
2.47.3


