Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC43CCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 07:06:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451292.1666379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHc1T-0006pI-1w; Fri, 16 Oct 2026 07:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451292.1666379; Fri, 16 Oct 2026 07:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHc1S-0006pB-VQ; Fri, 16 Oct 2026 07:06:34 +0000
Received: by outflank-mailman (input) for mailman id 1451292;
 Fri, 16 Oct 2026 07:06:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xHc1R-0006o0-HR
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 07:06:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHc1Q-00ACvf-Qo
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 09:06:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad1ccf8-2eae-0a2a0a5409dd-0a2a4501d032-0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 09:06:32 +0200
Received: from [52.101.85.36]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad1ccf6-5984-0a2a45010019-346555242a7f-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 09:06:32 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by SA3PR03MB7395.namprd03.prod.outlook.com (2603:10b6:806:39b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 07:06:24 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 07:06:24 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB6Mq3SP2Tv3pj6r54bMCBKub5QJoleOXkcJapqzKWs4Z2Gzla+QPBiNTGAzZbt9EUUcKKc8OAvh8ayhXC1lbygVlHQc/CZhd1gmZ7kQP083ePBYhZZn5OBtqKIVaqJQEtt8607e38Urbi3/KEIXpzJr5NT/W/K3BBO/+ccZ1TMTbqrWRBqgcQJrp0r258DUrnfqCl34pTDQwv7oElfyX+JpQ1geRA/8hEckEbjeFyyZPjmo4MnO2uLFrby7KcQdGa33IPPfNhAZd8A8OjxXGhVKUcLIWdQCJVum2kgOrQHYquUEcs+mY+8pwC5qrVc8mkD2cP2svbB9xuI3ogUa/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCo/O8qV3DYeEsbKQVxj9TqqiACRExlHBv0HCth0tsY=;
 b=Wf7dqTU4lsbDn0gSO9+6FdTJSE4WX8YoaZyiLjTePWzGWyocX7sY05mKmemZBpIKlYh0xy9DyYDf4wTrY3zUAOseNoHs8lzVGzRN8u8JOkA+ARB5ID6BVBJ07LmVG9KQxYDdyCPtA8B3jUY7d5idDO85G590Uwz49W7vUxHbLqcDCYV/WPbngdxPgO0Dxr/OD30FYxb+XDmUaWzoHb36nbcradE6QMa+ufl9zl0c7eixryEJMwlzT9Q0JhY4wOn8YHj8FMr4uXVx82cQAuoZerN+aiwhBhbNF3jJ1lH83xA4/jQz4nEMA0hzDAMP9DhNY13ai+9/DvP//hAZZIP+Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCo/O8qV3DYeEsbKQVxj9TqqiACRExlHBv0HCth0tsY=;
 b=V/YlVWDnObzUZHmsudSu4IaX1GrLHL6WQ0ZRnduzBReRygFBZB0fwjqVKsnFf+PYeOoVpHkO9nvrb4Fep9KZqERb6+GlqqR1EPS51rn0mjbQgfqMbc7CRSHbjkLdkYaeYHKE4ub3BG1g1RdmpVV3c22yCuWHx+34mIaQnmjJmyI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech
Subject: [PATCH v2] x86/nestedsvm: write back V_NMI and V_NMI_MASK on nested #VMEXIT
Date: Fri, 16 Oct 2026 15:06:11 +0800
Message-Id: <20261016070611.255322-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bdc00337-6197-40e8-8515-6e4c0024c0a1@citrix.com>
References: <bdc00337-6197-40e8-8515-6e4c0024c0a1@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P309CA0017.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::21) To CH2PR03MB5320.namprd03.prod.outlook.com
 (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|SA3PR03MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: ad810493-2b98-4173-8416-08df2b53fb5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|5023799004|11063799006|261009223027099003|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	teYZDP/UcJGHzUzWaFSCfkQqe42YCu0PyYtldMI5W6gOmx99VU4rZyOsNrZ9LAFzUyBut3S7FrAGQr9LUdX2mQlNMMLrMGbYxgFfpnFuUN5xdkbmKZpmoAto4/LgpSAlVT7hHGAovAO4UrczPya1GcF1PnPXRQjCehksHmYlL2PlllIUf6u1SVIbqq5qOUYPFrUAdW3ukA8zIg2UYgaJBX4Ua3HY9b+Pz5ESvhTh8vCaWQYEqPDJ8XidjiHwQMPYbA/Jq5LxiuhlWcm5k0DJRHFeqXx/votrKhpaaXwwz2fCgafqRz1LIvkCmVVzr7nShUP/j4J3v1PuQAASine2TfhNF2DDDF2A3spl4S1stFsC/XmH1kMRX01apzvwP6/2fr4jJLWrSVIsz3u4W7cozJoVTCAGF2pYrnWJsC7bXaRM3lZt4yz5Jztazc8rDXK3I8Cri9tvcv44fkVNcApV0tJs0eJuKUGZFFDt/renrCdvstRnfuKdvI6zlajO6HbeTwzXbGdaK+GAg9tO01FZJVvEQMmP1SpTF8bc3ttjKaMWkhb/AQKCdw8tdAq51CdRmy7901oLno8KHf6oiXWCoKT+EACzDLK6x6Zt3lOQ2W0Qo7mx8sqLlgQ0gVVR0wIdLDr2WNUwPQEq6V4fDZUHg8Ri1mcwL6lvELSmN7t8nxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(5023799004)(11063799006)(261009223027099003)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XOEMvDxkNvKUnAXV57f+e5ULtHcYkRpUm0LP0mrh2MTU1FSuIXy6UddbI6P5?=
 =?us-ascii?Q?b6eNWH7+PFm1QLwwOqVPrwqWQE7k81q2+obpkx2kAqLURJgqCHnOHM+lHru2?=
 =?us-ascii?Q?SVvqOaRBy5GXGNeVeLIVAkEnYq+ZUvKWz78mDnvBfYyfYC5ksYiC9CntzdZd?=
 =?us-ascii?Q?sxBCxozHgk2f/G7M8OLe06ymHa9WTAWGMiHIFvCzFchQaFHlTCct8L7K8RAl?=
 =?us-ascii?Q?7feWiMPGCh/mduR3PB8BB02AisSwkio7igUfzyeiub0GlD2bRCGFa9VYkquz?=
 =?us-ascii?Q?L8lh6LYmHBOmfbmoshaTwvnC4xF+LehNjY6zaY7tpF0Pexe47Rg4TcnPSo/Q?=
 =?us-ascii?Q?NqqkHngjibOw2Uycc8vaCcn6VJ8R3Ji7aWQZsJntKOcSg+86RHhFAjLva48Z?=
 =?us-ascii?Q?I5JoY/pcI0vw5xYeMu53cbSP03qczueOJx0qJ119hP18AAu6IzBgiIa0ulsq?=
 =?us-ascii?Q?OrzDRfi+cCPx8ibtwYCR0wcEeePX9olPtqnwVdKgBac8OfGhsz8Dvat2M3+5?=
 =?us-ascii?Q?ni8oByjUeCFuj7qfhaNiaee19wHKF/kjGF6zDhTJ/+cvXVS1RqIHkq043FGC?=
 =?us-ascii?Q?WJKfaIMWNoUsw1slRedV2lKmGUF+K51UBW2jerpfNEo4HlhIsnhzVongKKyb?=
 =?us-ascii?Q?BoWr9ilHYWpxGsUS0yhBLo0geI4kuvg1Wdjys0u6i18I9YKTt3AKQDBXLvMk?=
 =?us-ascii?Q?1cg6XGlsE/dv4lrL4nv0ExBmx35LEh3pZ9L/gK7ppsU0wEJktx2+b5Ju/eAf?=
 =?us-ascii?Q?JagN7+5o5JnUVc09YpPlDgrcb31YTe6aiiMi8Cgtx3WF37bJ/ttBfrMERc4Z?=
 =?us-ascii?Q?dm87Gyk7QxVW/sSCS5Sa3Jo9RVlFbmH/PIHOO3djd9oPYVhecbtajlF2lrAL?=
 =?us-ascii?Q?0cmXSGr5Mda7CoYlC/sUXjihA8YWRMLFzR0SOVco670Pumygj6mmNxNx+ZtC?=
 =?us-ascii?Q?R/Ix8+PthWv16uiA96+3665NpU6oLcdC7WQ+B08WpmkEd7TI03g+Zi3/agcJ?=
 =?us-ascii?Q?T4DXMeV41Kmq4vwauHD5R3QI9UqDJS1u1RrIax6QDxqMMjiP2JednFo6kTBt?=
 =?us-ascii?Q?QSNrg9SUMjmTYlpg75yLGjfgF1Osb8OHXYlu8sbmUt1GO3NFQQeyKKirf3Cu?=
 =?us-ascii?Q?0wIpF/pvaIWRBQpMfhuYywSXZks2I72TocbspMsFPs+/ZQYHnwla0XAnCtg/?=
 =?us-ascii?Q?uGQi5QlQXkoJyyGxs2n4P2eopKZHdhksKKU3mfACbFMc6sz/qLJmFZjulDdv?=
 =?us-ascii?Q?FoUrGefNnl4WRdSatcpWiW0Okc18V5i0IPhbJ4w95c0LSt57uYKkU7iXr59y?=
 =?us-ascii?Q?N7kh0PeZUyf53dDaSzkCdPSMe87tuCxNaVyue8m4jsp0pvn1uFbodYuobPHg?=
 =?us-ascii?Q?rvOpqUYgoJcJMLrf+10fjzYqop3czE5Mex/k6eHDVEq0jeF5qfupuCv1lljn?=
 =?us-ascii?Q?0f/mJa4DUqowUy1h0Bhl6pLBoC7YvImuarT3UfkjS2tLCfMVCkOhamAAf1yH?=
 =?us-ascii?Q?/+jeZZES4UgIr+42rKsYjkd/vU79cMTScogWeqCEw9VRMco7fJ9IjdF4CbhX?=
 =?us-ascii?Q?I25aXipuG5r8RLcru9prOBIFtXVFRYc62wyoWu9+k9rGbAdU0kzojQQ1nzdH?=
 =?us-ascii?Q?Ub41miqSFFb34aw5VAXAsk3Kdoj8atLTsrh50Ued+zVcYV31m6SSp+yzeO3g?=
 =?us-ascii?Q?off9dfZ95XV/uhIhvimNuoHt2dcxKgWilaWBGkTX0NqqMSdvVIFb/jUB9JAq?=
 =?us-ascii?Q?y0GECJtXPw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad810493-2b98-4173-8416-08df2b53fb5f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 07:06:24.1410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TC8BdrH8ZO9pjALASpenWjQzetRZNUYGgt6GvSJUuPwqZcgXAJm27+LhvbBnZN8dlkQUZZpnH2a3p/pYrlowUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7395
X-purgate-ID: tlsNG-d62444/1792134392-1DE78757-6B76AA33/0/0
X-purgate-type: clean
X-purgate-size: 2171

From: Chunjie Zhu <chunjie.zhu@citrix.com>

When V_NMI_ENABLE is set, the processor manages V_NMI and V_NMI_MASK
automatically (including on IRET), and writes both back to the VMCB on
VMEXIT (APM vol.2 rev 3.44, "NMI Virtualization").

nsvm_vmcb_prepare4vmexit() only propagated V_TPR, V_IRQ and (conditionally)
V_GIF from the L2 shadow VMCB into vmcb12. V_NMI and V_NMI_MASK were never
copied back, so L1 kept seeing whatever it had last written, regardless of
what happened in L2.

Copy both back when L1 has enabled vNMI for its guest.

Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")
Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
v2:
 * Reword commit message: the processor manages V_NMI/V_NMI_MASK itself.
 * Add Fixes: tag.
 * Cite APM by revision and section title.
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index faacfe007832..3a0afa98129e 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1027,12 +1027,19 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     /*
      * Virtual Interrupts.  #VMEXIT writes back V_TPR and V_IRQ (APM vol.2
      * 15.6); the remaining fields do not change.  Copy vGIF back only if
-     * enabled in L1.
+     * enabled in L1.  With vNMI enabled, the processor manages V_NMI and
+     * V_NMI_MASK itself and writes both back on #VMEXIT (APM vol.2 rev 3.44,
+     * "NMI Virtualization").
      */
     ns_vmcb->_vintr.fields.tpr = n2vmcb->_vintr.fields.tpr;
     ns_vmcb->_vintr.fields.irq = n2vmcb->_vintr.fields.irq;
     if ( ns_vmcb->_vintr.fields.vgif_enable )
         ns_vmcb->_vintr.fields.vgif = n2vmcb->_vintr.fields.vgif;
+    if ( ns_vmcb->_vintr.fields.vnmi_enable )
+    {
+        ns_vmcb->_vintr.fields.vnmi_pending = n2vmcb->_vintr.fields.vnmi_pending;
+        ns_vmcb->_vintr.fields.vnmi_blocking = n2vmcb->_vintr.fields.vnmi_blocking;
+    }
 
     /* Interrupt state */
     ns_vmcb->int_stat = n2vmcb->int_stat;
-- 
2.34.1


