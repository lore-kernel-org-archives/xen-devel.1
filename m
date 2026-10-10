Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4269FCA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:15:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444976.1661472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6T-00026M-64; Sat, 10 Oct 2026 10:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444976.1661472; Sat, 10 Oct 2026 10:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6T-000259-1C; Sat, 10 Oct 2026 10:14:57 +0000
Received: by outflank-mailman (input) for mailman id 1444976;
 Sat, 10 Oct 2026 10:14:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU6R-000246-Bi
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:14:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU6Q-004n2i-Oi
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:14:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca0fea-e002-0a2a0a5209dd-0a2a4506ed36-26
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:14:54 +0200
Received: from [40.93.198.39]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca101d-195a-0a2a45060019-285dc6277b3b-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:14:54 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by CO1PR03MB7916.namprd03.prod.outlook.com (2603:10b6:303:276::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 10:14:52 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:14:51 +0000
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
 b=diUAZW4sxBfhmFT0EYZkG6buYOjXz7Dpe3w/prS89Lix5P2OMEaCFFNelRhNLqqq6Fq4AkGa0axckLTE6J8fq+Qy4dJn4en4Xhux5cYHBG2f7oI6QwDqIyPMxXKi0RWeKa/H6Q6WWV40OKFfAVxsKRZSgdgqRsH0Tq3MndMYMlEdNUqnU8xzJKFnfs++G+wx7nJfjsnHzxAL6o/h6dttb6WNwAotInt0qUhiX+c1Zb09CsZ7XEeiGXAwx0dhuqOA0GnzVe2zklzexGNo4//aO9F9Fy0/m496bMwu+Qo/behfLq93ROfNpKyTWBcaJgUSLEv49pQ8/NY6TpmycYMiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdaTuBkbnXYbNEnhmF8wQG3H1dNpqN4nruFVqpzOWRA=;
 b=b9yCL7guTpSAHad76kJG9L77D9dLJbEoF+zCvMVVlXvXxfFGyykRXafIZDqFyMPLWCMGMwdTeVUnJjqA+DGrkNM/EZJPLIJH1sW+CUySIvArV2kIbY9K1Tnh2yyYoJseGAZtCX4vo1sV5NRyefwZg+L1SG7upN5Pc8OPukGRbOBM6U4Gz5o3IkTnt3ozXI8XSTqlnUXGr5R1m9Rb2pEBZEgj9u3t5BcDPvBI9L9I0qgl3QnNietIhKNpgN5quET9yPkeG+TU6GSqcafJkH6zC3ZGzTxiLkRyVn0nHK61UWiqlaReP306av340Kv/QnhDVZ0Y2VV4Mrl0ZvYbvEgVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdaTuBkbnXYbNEnhmF8wQG3H1dNpqN4nruFVqpzOWRA=;
 b=t0/sbXqfOPouQG6AD/L9EQ/Yp+5vuhjGrtWcTkXZQwJNlRbm1k5a1+wtcXM36m4JIB6q4zpUkVVTJzNy/p5O4HHEClV53rF2dso+/fO1BziNL6wVxt8Gz5MOdGcYvR76hcvSotMIYoakUuATa5dqTVFE9HqPCi14n7/b6F3Z7pk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: ross.lagerwall@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	stephen.cheng@citrix.com,
	lin.liu01@citrix.com
Subject: [PATCH v2 04/13] nestedsvm: Set GIF during VMRUN if vGIF is enabled
Date: Sat, 10 Oct 2026 18:13:17 +0800
Message-Id: <54cb598ffad0679b1e0b74a73d68595b353c9cea.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::7) To CH2PR03MB5320.namprd03.prod.outlook.com
 (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|CO1PR03MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: a89d8836-9646-4737-4bff-08df26b7526c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|22082099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JXPes4sosAo1g0wcluFO43Grtt5aioG9wTao1UAfKO2aWCvPb/cMWvaitZp7au3dVF3olfzS4z4qZ0Kv4CQ9XgBLH0pGxWigV0feTZujoTyohSaVXBGfZSxdzcytRan5QQESnh3LF+B5mE6RKm2Y7aZYEYaDCTMeDYEMukeEciSZWXeJqYw8+A1Aqd6nZ1MLapHEIOAo8WG1hIikEv6/CdpmD7VMYCcYXwwWqX6cUZTn1nIpnQ8i2WjZT762PqxY924D31rEJ1N0DsnLjOSQ2fXYZUoCQjiMgqYUQBGeH7cu7l4pOHqQCuNB7slTJFgTIV+n4625G9P0HpnA3vyg07uDyV0/e5T77m25UC4mok2Wv7h5wk16XTJtVWRvnXGVlT/MsNUjCggoHt8M8iSAj6Lhsy55fMF06Ic8BY+tm8Ce8mB/raeeH5J7uNHdihKXRMMYRMvNa6lsO6rbLPlkUGz5dXsfXnqgOKr2cvtLDhprnlNG10iEU8k9I89ByAWFl/5usbeuzgcePs5uVbOVMMNd2VNIs0ZFQAqTUWQdbJRlR7dCbcbj1EM0VVQWIylYqsTprJuC2EsCq5Eb/zR4PU4UdEmEJA3jLKAQZtA0+9jZR0RGzs1Y8h0clDlHZVDad27yE8qIY4QeNLFhm9DJ/ja+OrnEWqRgeRpc+ti915Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GFIIw7mFsLx0UpgBFFsoDjwZ//m8LV+8htT+4ubXBX4KOvTb7WIbZxVon5KP?=
 =?us-ascii?Q?X/uxwe7657SiQrBHIZwW0KeMxRz0hY7hGY09WyjlHO0WvjSu026C13iXsLm6?=
 =?us-ascii?Q?PVv296nolW/bHMaC4hgZiigMVbTlzzK9Y0F2zrpL8Vmk4iByhgv8M5BSPwl2?=
 =?us-ascii?Q?zB8QLTRy0cOzB7Lcv7pU/SxDFLAE+WNeNeyveioEyZKOBWW0pcxl50mJAIwn?=
 =?us-ascii?Q?cJYdYeKzW8iAPawF7ETB/Yuws6ooWIpzFiPC4imhoyNvgV1jr/8hSogZhaUq?=
 =?us-ascii?Q?0ymtZeW09WL/cPDjqIIpjMJYZfjdjiEQqDR1pD7BzTIhr0mUn6sV5dXIVoIK?=
 =?us-ascii?Q?9PDXReCTwpPpBjaXnMSMtHLgBJ2oaAR1fbdek6o8pQMtKGMl0zelnBI2HoHt?=
 =?us-ascii?Q?Niq1zgXUmneQId8lztWhNPnw4E4Vkmb2L1c9//itLGExeD1tRqC0H2sl3LxU?=
 =?us-ascii?Q?FKtD+/nMFORcJeCcgJ2oD24XZGCxpEL2CafqqqRz6V5XQrwxm0xwK8v2QK6j?=
 =?us-ascii?Q?0oO8cTtN5iRjYdNspiGpSn8bIqIbsvr0sTqeN9azz1rnp5K44MbyP40sA9Vd?=
 =?us-ascii?Q?9XqOjm+ZuzT+s1Bzd0Lmxsg7HazTYpY5wUzX7vbelS3mhkOtOFcq5gN7ZLK7?=
 =?us-ascii?Q?cZe01pVrTTPiYPk2qIz4Ntgh4KhAY3YUxyK/L12pv5T7n6uPwmgK8r/TZYyu?=
 =?us-ascii?Q?TrU47wtug1ie/CByf3vmckkxz1UPMXBltu2CgDxU1VhWzqYwJAHBudp3zcco?=
 =?us-ascii?Q?5BcB20NlL6KOQ+/H5YARepyMqIVPmt/tsRfO0LFnBU/SzGOr1ZKXMfxCTsoV?=
 =?us-ascii?Q?hhhMG5wUD6quYFsnaHj0xBMtm5P74ezcs1EGmNbXDo+D4jpZP4Ii8C98SAAw?=
 =?us-ascii?Q?l/uSF9VCNsP4p49I6aTTG20ZJdwKvPTMn1djBTpDV6GDPcpd46pnQ4ZU/rN3?=
 =?us-ascii?Q?Mk2Tz/XGl7Plx21+k/GGwc/XmidFkFQSdbjgQ5ymV4rp14pLT/DKA2rf1sD+?=
 =?us-ascii?Q?XwiUYkt2cbg8BoIHuMneVDntNi6SEnmVMGehmAIj/O9U6fyFtI6AUwpQuFJk?=
 =?us-ascii?Q?CyBwDK2RM/YUiYDxLAo8X63yeHuFBl0biqOd8NYyFeNwJhts7Uil2T7IHqOa?=
 =?us-ascii?Q?2S5YdTqlinNfn9lHD4qPS8QfHy+sgTYI1duz6owKwiF/zd8JNoWr8pHcgwhx?=
 =?us-ascii?Q?al/rs8QcOxQM045XkVTlWVVl7gVGGa9ly5OZCHvEihfx2uTJDZ9AHCU1otg7?=
 =?us-ascii?Q?Ps9ADX/aH/azfCN7x5PPiY8q8rgBIZuZSjx6sqCfsHtk0jW/XFQPFbcWla63?=
 =?us-ascii?Q?Nm2cw3tkeRca5tf07bJpaFtV2dVyYAM+wV1WcCIZtscYXYEbxHRr/eXNOV6O?=
 =?us-ascii?Q?ZMzO2sfUoQp60q5ab6g5KfqIVR/qYdzaxoQy1nonfcJngDCXf19TjbkW4Nxv?=
 =?us-ascii?Q?hGUTMoQPAtO/C3ysL2k3tEVGeBgTilDtfc+8rAS5QpgTTSaLLAOEQsYnRNyB?=
 =?us-ascii?Q?Pffg6grzeA/EEYbLyydPOeDefy0Svm3mGmDtqtfltEcK/wDG19rEjWOfStUV?=
 =?us-ascii?Q?shgqPFvFs05rFUmndrE2lL3nc+x6bJgKkvF7z6wCuoddG7mpZQoMIzIOr1Sz?=
 =?us-ascii?Q?MbL1qI6U9GHwwv+Hr5qcAzax5+9jBH7rsl2ph9jkOH4WjT3tpS8m7VNbX1w7?=
 =?us-ascii?Q?d/E2jrURJxixFUSMQQaHx8tGcm9swaWMtx9axKdtci/vXFzA94/cLB2nrx1Y?=
 =?us-ascii?Q?vgldBE7mVQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89d8836-9646-4737-4bff-08df26b7526c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:14:51.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqbZpXXHx7HtF5HYki7ptRhfV1PvrP56xUAyQ/1fUqWk5ibVpWk0mtVg0RCWUZtqzMnNsKm1lqy2iE4XmmeBrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7916
X-purgate-ID: tlsNG-16d1c6/1791627294-F7ACA77B-592F9F35/0/0
X-purgate-type: clean
X-purgate-size: 1455

From: Ross Lagerwall <ross.lagerwall@citrix.com>

During a VMRUN, the GIF is set by the processor so when Xen emulates
VMRUN, it should set the flag too. This was already handled for !vGIF so
handle it for the vGIF case too.

Fixes: 4cd0fad64590 ("x86/svm: Add virtual GIF support")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 8943d61e2b25..a76cec1fecf1 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -625,10 +625,12 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     int ret;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *ns_vmcb;
+    struct vmcb_struct *ns_vmcb, *n1vmcb;
 
     ns_vmcb = nv->nv_vvmcx;
+    n1vmcb = nv->nv_n1vmcx;
     ASSERT(ns_vmcb != NULL);
+    ASSERT(n1vmcb != NULL);
     ASSERT(nv->nv_n2vmcx != NULL);
     ASSERT(nv->nv_n2vmcx_pa != INVALID_PADDR);
 
@@ -673,7 +675,10 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
         return ret;
     }
 
-    svm->ns_gif = 1;
+    if ( n1vmcb->_vintr.fields.vgif_enable )
+        n1vmcb->_vintr.fields.vgif = 1;
+    else
+        svm->ns_gif = 1;
     return 0;
 }
 
-- 
2.34.1


