Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76276606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 00:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=u3D5eMLp
Received: from list by lists.xenproject.org with outflank-mailman.1461766.1672788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLVN2-0002YJ-7W; Tue, 27 Oct 2026 00:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461766.1672788; Tue, 27 Oct 2026 00:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLVN2-0002YC-3d; Tue, 27 Oct 2026 00:48:56 +0000
Received: by outflank-mailman (input) for mailman id 1461766;
 Tue, 27 Oct 2026 00:48:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xLVN1-0002Y6-5c
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 00:48:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLVN0-004jzL-BB
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 01:48:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adff4f2-bab6-0a2a0a5309dd-0a2a4508b494-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 01:48:53 +0100
Received: from [52.101.52.24]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adff4f4-f659-0a2a45080019-346534186fca-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 01:48:53 +0100
Received: from MW4PR04CA0388.namprd04.prod.outlook.com (2603:10b6:303:81::33)
 by IA1PR12MB8493.namprd12.prod.outlook.com (2603:10b6:208:447::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Tue, 27 Oct
 2026 00:48:47 +0000
Received: from EA8PEPF00000006.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::2) by MW4PR04CA0388.outlook.office365.com
 (2603:10b6:303:81::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 00:48:47 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 EA8PEPF00000006.mail.protection.outlook.com (10.167.249.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 00:48:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 19:48:46 -0500
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Mon, 26 Oct 2026 19:48:45 -0500
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
 b=wSB/kAUmUTfMnF/Pg/c1Tc5fuYUtIvC3fapWQw0rB4sFKQg277a7K7AWvsPfJtVEnL8YkmFp+yWQtEuwM2AQA2xeoeB1qyP3WfPfc0sWWdnpsNYfN6hfSj5G75ujfOL/d+W8p46YxxNhp4wfMXPwxqiTuhk+WxhhtymjQ18Fu+Wh9+TQjxPBsHvmI3RFmcaIaFw5LjvHqDnjQM2uKnf/qvOkKwTIiJJITNM6lD40C1H1G/Sle7dh6+BTFNu5sdkeCYxo5ifzULr9LdBTlSR4eCoQ6bPY9AJ3NG5Y+egjGPtpfjzTc70Jk1QliVcYBtGwUu/uHWGjJxbBHkBtksll/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZoj1zyk8OBPcH6joxfnnOehLiVgwqs7MPa/ikvEln0=;
 b=Tzb6ETIRyeNBhYP0NyHg3mmApcvoxj47ipfV8rPJCsEfCPHGHne5i7yJ37YLbgV7IALCB2Wsh0rch9vVV70qTc6vNZqBeJHBGlIpn6I7ge1i5Vr+bLKis9CLUJEFd61N/vWTb+/oSIiab0EPJisOA2Xxbl90rm+nSRmrkx4/i0zhFQ2mhEwf6z6C9/Y1+TCw8Vu6ljAQcupUvMsktzQmIdswTnGwBb6Aq9PpxW5A6IxKuo/UkxlM970l4k7qUryQA39NDRgj+kGzgUDgHGZaGYhE1ymupJfprHOImaZ4ZaavbKiUxLiGhBTenuL30DKijBI96O6XE4brT5TDt7FI7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZoj1zyk8OBPcH6joxfnnOehLiVgwqs7MPa/ikvEln0=;
 b=u3D5eMLp64gHV0QL/IQ2gsfm+/O1IN6/mz63EEcozOvghmaDAfdkoppG+xCYBlcMicxitXPD9zt+wfCje1UHPGJurr2CTrbj4qF80v1ALNxjFyexQlG4ZK7x6/YIu2ysiMsDvyFr4qs51k+vkSbmICf/z6MhQAu8+AL956vWSV4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger@xenproject.org>, <jason.andryuk@amd.com>
Subject: [PATCH] x86/mce: don't call an unregistered address check
Date: Mon, 26 Oct 2026 17:48:42 -0700
Message-ID: <20261027004842.18508-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF00000006:EE_|IA1PR12MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: c27a2b5a-758b-4ee5-7814-08df33c40f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|10067099003|11063799006|261021121427099003|261009223027099003|261021123027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	i+dL4Lj6TJtUVvVeLC3AmzLaumGahYwZX0qPDeGkqGSYIk5nevgvuJqYjpMlDOpgiR+QsLblJgkP3fvrmY4kHhUMMTUp3gBcH1d7OvcWbOM2ct3vCb6UiSQIP6oE2lula/ndgd8iAvJhSg/rm7ckriKH50+rvn2LkSM0wjRajYrm+FLLULGIvVkFb4aldEeLsCIbHtWKD1eQE0EcnEaXCmegH19+p+M5jFqzyWpa7lCF9Khxv0dr9T1X89Q073WKPgPWyIdVQn3ykZgjGjC8iPoM9xMS+tOl2srH2fyf1d7a3P4ozH5HXMxGcLf1iT2Me38rv1PWK21FmVmnmlk7Gcie66KKdROTbdDomU77h95TqUSh9Kw1YYX92VbnbhmAePMaygFB9y7wLHJ7zHtgKY66VA0LllrIGDst9AeepW0N+6OWs9Kkw4N+Ecjg6NWYR/3PThrq61B9EBkelVIcmYX8AQxa/RKd+hxRizuTGRmfbKGhp9+DBYyX3GlRwbVonPdh2qvZ7nI/KCWGoelhd90S8ljN42Cf4MUO6RLwgyUn6vYy9prQk1Of/6JEfcyl0yudlx4DiCkz6WkdFbZoF6Zp7bE59BojYZ/JISIbhXssStydwQZzk2TmtA0WFVdxggmuly+l5kAqzIBtMZrsGVkOoPN2JhyR1EtQK9Hvc3ZXXzdyrEq2+IufbbQZe2xj/5dJ7iyugEhuQpHLxFlp6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(10067099003)(11063799006)(261021121427099003)(261009223027099003)(261021123027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+SSxE/D/ayt2WlRLoiH/T9PRrrA42tjJAc+0sKjwhxrBgoXOJBJ6o+zWZJACINwZUEqooEk1VaY1NjD7rNkdZJHFP2iNWQuU43nCTiujDeb4ittznjQBSM9Hfh+NdEckLMGea/jHSK4+czYgydAW6wx4hciS9lU5+wNobiABJ2EoHmXPt7bSMwovOx0DpXSHDdCWwYapkJfHYHpXuop+tlBBEE6SwaDL6NDhr1Ole5uVb9mRHogevdlb/otMebF6bBbg0j9larXX8tPYdwhp/67NCRhyoH3fsn3P/p+gFh4UNrMQP9ssbC3rXouhfDZ2C3La2VtO4WDeCRpRrlkuXzKtSUFZF++sgqXQPF9rX33U/KoOq4FDaUKUb+iKEMLwJObTw8/TANGvg33WvAjLG2HOj5fE4MCoqzZVxUbTGuCmansiqIcNq6PoaaaIgsOh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 00:48:46.9279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c27a2b5a-758b-4ee5-7814-08df33c40f25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	EA8PEPF00000006.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8493
X-purgate-ID: tlsNG-c1860d/1793062133-D514E87B-886C9D64/0/0
X-purgate-type: clean
X-purgate-size: 1969
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Family 0Fh registers no check_addr callback, yet mca_init_bank() and
mc_memerr_dhandler() call it unconditionally.  With altcall the NULL
pointer is patched to ud2, so on such a CPU the first bank reporting a
valid address traps inside the machine check path.

Treat a missing callback as the address not being physical.  The
recoverable_scan callback, also not registered on family 0Fh, is
already guarded through "recover".

Fixes: 9595ef77ab11 ("Implement page offline recovery action for AMD")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/cpu/mcheck/mcaction.c | 3 ++-
 xen/arch/x86/cpu/mcheck/mce.c      | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/mcheck/mcaction.c b/xen/arch/x86/cpu/mcheck/mcaction.c
index bf7a0de965..96febefd0c 100644
--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -41,7 +41,8 @@ mc_memerr_dhandler(struct mca_binfo *binfo,
     int vmce_vcpuid;
     unsigned int mc_vcpuid;
 
-    if ( !alternative_call(mce_callbacks.check_addr, bank->mc_status,
+    if ( !mce_callbacks.check_addr ||
+         !alternative_call(mce_callbacks.check_addr, bank->mc_status,
                            bank->mc_misc, MC_ADDR_PHYSICAL) )
     {
         dprintk(XENLOG_WARNING,
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 1888f22d15..8c984c61d2 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -192,6 +192,7 @@ static void mca_init_bank(enum mca_source who, struct mc_info *mi, int bank)
 
     if ( (mib->mc_status & MCi_STATUS_MISCV) &&
          (mib->mc_status & MCi_STATUS_ADDRV) &&
+         mce_callbacks.check_addr &&
          alternative_call(mce_callbacks.check_addr, mib->mc_status,
                           mib->mc_misc, MC_ADDR_PHYSICAL) &&
          (who == MCA_POLLER || who == MCA_CMCI_HANDLER) &&
-- 
2.47.3


