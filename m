Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065B1606A326
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lxQfUsLo
Received: from list by lists.xenproject.org with outflank-mailman.1477657.1683012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPUt9-0001zK-6k; Sat, 07 Nov 2026 01:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477657.1683012; Sat, 07 Nov 2026 01:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPUt9-0001zD-3y; Sat, 07 Nov 2026 01:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1477657;
 Sat, 07 Nov 2026 01:06:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xPUt8-0001z6-47
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 01:06:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPUt7-00FJdY-E3
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 02:06:33 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee7929-8faa-0a2a0a5109dd-0a2a4503af74-40
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 02:06:32 +0100
Received: from [52.101.193.4]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee7997-fae8-0a2a45030019-3465c104d619-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 02:06:32 +0100
Received: from SJ0PR03CA0254.namprd03.prod.outlook.com (2603:10b6:a03:3a0::19)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sat, 7 Nov
 2026 01:06:28 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::4b) by SJ0PR03CA0254.outlook.office365.com
 (2603:10b6:a03:3a0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 01:06:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 01:06:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 19:06:27 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 19:06:26 -0600
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Fri, 6 Nov 2026 19:06:25 -0600
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
 b=b6wydkhH86m7PcW7J1trOE98Nt1lOzhrT3qFl293SNqprxX0z+1CJeQFk8f4D359zoVaHgkjCWe2hrCAoghgrrJYKq1Zt1/hG8RMTKb7VAvwJIYOaTACANxA+zFoybtutYrLukX38A0N2Kx3OOWi9nZikckTVGd36jS+ds6iUzK7MbJ4CmHSAldAKhgmV6UhYqo2JfFRN/qCgL1ydBkz93IG9ml9xvnyx9kLqXxh6jclP+I3uIVP1U/tFxbgKMzcLMGHLbcd0gHnvfiqvKF8V47nXGL5mzScHn/dwEDvhhaDqGqicWd5hijrBhYUrQkP5OnmO2VmXmlCdYEcbXJ6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69fk94kAopaX87SwiE9TUjp1ZYcfe1Qrx/H1fvN4POo=;
 b=UCGsMrUX7///xhjx58wsUdr85SMYSofXJY/JegOKWsEssUlDPz6gRDipRKaDRHguobOO2ERKp9ZVEm05YA0ntKtILZmSe3IVxoPiOsOTQIGACvCM7rcnrpzhNDwyfNdj2PYW4RtWcdddp3S8/5cTqztON1OTkk3VJD6GqZGWH/PnZXKur8gXh/SzoEyD4IC31npGO1l98KWkW7bcGAxOnKUbn+44OnOQ0E/OH8iMYd7rJoQS1SOPf6B6jqnL31EPRRWy1g16SJ/oq+MtwPx+Q4XQpOB/Nei+mG4VvtHs7qSuh+3ruW3jCcOXperyS/B4JudjzVsYIswCAwy9UPN0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69fk94kAopaX87SwiE9TUjp1ZYcfe1Qrx/H1fvN4POo=;
 b=lxQfUsLohwj9Z50VTs31tcU7qMpo9CgiS8FMM+VIiyF9Z8jkHlmfdO3Svx1DvzBLq4hVJlunlDSaOhfmqd+/eqzPbD/pD1CqzaeFFU5P+6eUvCPeoRGmcUw0S/lMkFIZuieVuOxOW/otzCP0xVjIjfB0OMPEkpOBImkK1EOO5CE=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Roger Pau Monne <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH] xen/gnttab: _cache_flush refuse an owner without a grant table
Date: Fri, 6 Nov 2026 17:06:23 -0800
Message-ID: <20261107010623.192975-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: a55ecb9d-d80d-4170-09c8-08df3c6b59c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261021123027099003|261022105027099003|261009223027099003|261021121427099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Q96g1MmNLVCoyppdEgP83v5VRjOIZ8GrEehk8I7WiL/0yKJxvGuYMm7Nf6HUlTQQw3obShIGJ/PTgIHSHA6NJPx8s4C9YU/k3VXi5aobTd7QZnbAfuyMF2CkGCPpvV4B+j9iNMgE388xzuNVrEfikvJNrnqA/S2h9IrTz6syqL+8LdQ91F5B0t1fqju5sUVHXa4omzqtLUQ4d+W2tA0xv6SSDR5Hy6DFKoBhV9yA8G5uTlofiTbawYcagoXNSL+9Y3U5QP95r47t1+UTSP7dkHhmtkLd7//AgdScem/rL70oEVVM6Sypbde5xrmCCGwkE/8aPWwHX77ng8jHU3XMMFreMtX6d3xyLV8QewK1MOo9XpvcfIhrOo2Uria5ug5FWzuwQpt7QM3mRMJ3zGS8tWIJYKXtQssonwBVTqqzCRDxqMYBrOru5ceFujXR6s1Th3JViGrIk0PjT8BVwKIuIGhRniSHOIwpiFDYU6f3XAfkuHLdQzaXnBAA22h8hCsaT6G1nNHpaUBPy4xe4YX8DI3wPIzvpr3Ntfl6gHcrUrhoZE+B1vEbvpLr5S4BEGRh7X4A5lVLsadhx3dLctQXoyZipbRYgNUc8luD+LG+mOObE+uEXX/Ve/5NWWRYBZYjisqz2Eji7Cwv3GIG7RnN+C2Sm3v6nIF3+8W5nSLbuE/pU912I/JUf3bom8xh3zGpYlIXQBvw5AmnnPztA6Q5mw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ADZgjB34WLeZz8maATf3OFO+2HbXC8o5f2So4OCTdQS/r4nxwrzOOGQGfd76VsZ1XHWth5+WB4a2pex82nKorQSpO2BN4wOGe7lkj902iBtIozdKZg700BTMtVu+Lgy0DZu9Kmv8cCJs6zRwLT4v8KCMY5uOemJ/Rkvq76jHyopsz18nqAWCnlXymYUdg5hTApRxM3rR9WP7KvfI8yH4p/9kCXe/LxhQSfVnZva54YWVZyQTBBFVBPRIkHMJb1a6wNIxczub2+alQpZEtaeeQhXsXmEU7Gay8h0F1ys27uRJeCcUfNm3ZXTtTnxgsZrKOoRDsfLF/suWAN6vgzovtkkWw+di1oXz+1HnxsQSx6srfadyOVT9w2lqm4edPrdIjCwFNhQ6CKE4uTA708VCAkTq/+cCVFDlrSaec76e8CGRaZj35UTcKdhLVQJZ4OOg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:06:27.3814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a55ecb9d-d80d-4170-09c8-08df3c6b59c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196
X-purgate-ID: tlsNG-33051d/1794013592-776F34E9-31F127B4/0/0
X-purgate-type: clean
X-purgate-size: 1076
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_STATIC_SHM, a shared memory region without a "role" is owned
by dom_io. A cache flush on such a page then reaches grant_read_lock()
with dom_io's NULL grant table. Reinstate the check, and give back the
page reference taken by page_get_owner_and_reference().

Fixes: bec8e3c1fb91 ("xen/gnttab: Drop owner->grant_table check in _cache_flush()")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/common/grant_table.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 2285c4aee8..999b10abcf 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3633,9 +3633,11 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
 
     page = mfn_to_page(mfn);
     owner = page_get_owner_and_reference(page);
-    if ( !owner )
+    if ( !owner || !owner->grant_table )
     {
         rcu_unlock_domain(d);
+        if ( owner )
+            put_page(page);
         return -EPERM;
     }
 
-- 
2.47.3


