Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066AFCC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 07:45:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449959.1665472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHG9d-0005oM-G6; Thu, 15 Oct 2026 07:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449959.1665472; Thu, 15 Oct 2026 07:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHG9d-0005oF-D7; Thu, 15 Oct 2026 07:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1449959;
 Thu, 15 Oct 2026 07:45:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xHG9b-0005o7-Su
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 07:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHG9b-006zO3-86
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:45:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad08496-8faa-0a2a0a5109dd-0a2a4504c2cc-20
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:45:31 +0200
Received: from [40.93.196.33]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad08499-b57f-0a2a45040019-285dc421bfbb-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:45:30 +0200
Received: from BY5PR03MB5315.namprd03.prod.outlook.com (2603:10b6:a03:229::23)
 by PH0PR03MB5845.namprd03.prod.outlook.com (2603:10b6:510:32::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 15 Oct
 2026 07:45:25 +0000
Received: from BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550]) by BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550%2]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 07:45:25 +0000
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
 b=Nov+UzQCw3Y1KB1Uhr9ryjnKnufaYEY+P7I3P/bJ69jGph4D/8MJd9Hqha+Jb6W5XQ8QS9/wzkVNe7S9ZEk9Mp2RhcxaiJba8x88Z2GFlXF1tP4SbkWC8r5Le0plxQwTM+w372xxhcBEvy+61/Nj1gHbPi1kpdl0Xc9XPeSnmQQad8Z3ckupC9pmeXN+rfplyvVBvi69EM3o6L1ENeMDA6Vepy287hQnJx4qGKMmKJCyZw8QPj+IbVFw8BLMz+mmaIY1eoHQBsmH7lOQXuXf+SAUT7Ef2vnvibaKN+ccj7CrCAMdEDWZXw1xXzfynpp/PWUizEk/CFzUbQUqIChtFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V+TveEByXy3LtetVMfKqEKKomgPXI/+10CtxBApa5c=;
 b=Jq4rE3Af4r/6RwACOprDikZVWqcdRrgutLCuguDLrH4ajKMzxRRYT3EzRh0DYnF63LRfMG1uJ2HhfmwwksG/CkkkqEe3w+yF0WvlOh9h0n7/SAmduee6khmwO2IEaE1BxHD0XQ83opZ2VmvRldRIDMeVpu3zyw96TYl3k5tsGInZo/z8Z2OI7NYZe8kKh0KZLSgMDPVfv27qQYuhUTffVV0zx7YlRB19E4D8IO2vxm/6Dzg/+QksXJHxlbpmtWURL1qki4+1CcRP+B8P/FBB0U3NHzP+dp2nTT79d20+qnHWOjFBHJtfIQIfT4ngcfXEpYFzL8zVV5f56XCKYL6+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5V+TveEByXy3LtetVMfKqEKKomgPXI/+10CtxBApa5c=;
 b=mx3taEmcVHl09BCpC8XdV1asEF5baNcIPtWLn4P16ikH32zKPUCis6WrkWvnwC2OMVt9kXr6jUYg6DqvNh85HX4vPW999FJMCzl5aRVNR13TVF9fi7WKZpzpLNEHjLvt0vpwBiH+WOuASt59dnhLu7/eoryZ2U7LBb4qnIQtVJA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v1] x86/nestedsvm: write back V_NMI and V_NMI_MASK on nested #VMEXIT
Date: Thu, 15 Oct 2026 15:45:12 +0800
Message-Id: <20261015074512.221777-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0152.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::20) To BY5PR03MB5315.namprd03.prod.outlook.com
 (2603:10b6:a03:229::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR03MB5315:EE_|PH0PR03MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 5153f625-4351-4119-fd0d-08df2a9045d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zhZS9jG5ksqPTm+k4UdVYSzbAZ8Sg6mXjGPWCk15nN/rtjhvkR6v5fTb87uS7zaGyGSg2vA3Qyqo6DreAPgiUEcy26lAdcnTbVprrsxr18xYPs2X1P2cB/tww3E4N23/yiowL8/zKYixDE6QS7lyxVNcHxW9JELwU8B2Ik7hfBrW4B1JIrqhG7g1k4fphwl59HDk6xhooWiKsrvbcZ/B2Dz7S5Ci0cblTg4DW1Va+lmGtkt93fYBssVbO0Aq0/KbkmSN8ccdpflCk5dZaUbUaSazizbMz41hEFBMUHInEi5mT6pSTRRWCQ6FwknkI8vFVlXkLMdzacux8FqAAiSt4zPD4I9uw3ku+kkFQdkJZLyFhtW3pkYfXgiYqi2gmZcAFP96+GE20+t8jnPAdl4bQ6rr11TX1ZVBnZggt3UXs18c+WbrhTAHS459/xUc+WuNYi34ZrORw+GaEkj6ieiwL6ZVz4QQXxdlslfM7uHlpWHqDM4iJgOA9p7JDdtH89YW5pODxgl+Dp7I0EY0FyOcP6ZI0I5A93MhphbT2RTtAMM56KmMgXfiFAz4AtvkF3N+EO2dfMkawgxZCfh8ARDVFcSe/k049jvZPn5gd9VFL7CoDlk5BwtzMQ3x8/w7XS4DW86rarHrXdBGUsQWrrm7knfgV0e0N+S4IFLynM6HMlE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR03MB5315.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FDwBm6TDAF0CrmTcsCUlswkkrTT5lyKaLWnI5jFusVSS3DV0fRGnVkXGHLcV?=
 =?us-ascii?Q?hbYd6UHV0kbJ1QudHC4S/iwMzfHWQ6RHHcCtkvplbOgS7PpcWN5DcR+vB0NS?=
 =?us-ascii?Q?hMnhZutNAXVuEKoTKYFiadUWm6d3fQfxdjRYipVwo9U30UjWZqFPyO1yeOpL?=
 =?us-ascii?Q?uNrTpv+YiwKIOvTfMtGKYoPQjo43X/gtVHPKhm+630niVw20YAEXHXe3PIxb?=
 =?us-ascii?Q?dOa3sotU8t04j/wwsS0IlLXTVhDJsnxbfR5eEVft+nmOR0bK9BFG+67XlPb2?=
 =?us-ascii?Q?bDg0X2hhES6PsXf0JZuO1nvGjD5iv7JTp7fH38oHATWT+RUEN6TsznxyW9tI?=
 =?us-ascii?Q?y8noyby74VwyS8rCKLIJcKQWI3uXORJ/Wc5Jph+HzD4rIF5muXJnCj2YC1/a?=
 =?us-ascii?Q?q75aZR88F1ZkTs7SGt+72+RbiQYnanVPhNhvssaZzkoY/ctNzhSVg8CZwxxG?=
 =?us-ascii?Q?K+yCc5ASnf//SPhKoUW5S85APBJuu0pddcLMDfXRny1yiwbecC/4lEYJvg2E?=
 =?us-ascii?Q?PINd3GQlu+ErRdgmf+au5JACchV4mQmHGrYUAMsSbJ+SvRk0TFxHceSRVsVM?=
 =?us-ascii?Q?PG5hullO5wdKDxoi6n5v+S6mV1OaDxYuqR6tDPKqEB90h9aLNT1YcOLngP9/?=
 =?us-ascii?Q?tcbC7hmn/bveBh2E8vr9a17cLfxb9Y0NB8MHr5T5rKBZhwDktIwNAHywCYG9?=
 =?us-ascii?Q?/s8yUUUG/qvBDxESKwTrNl6RpFGaGcTO3eLQswpPX3yEC8M4UB8uCRrzyS9V?=
 =?us-ascii?Q?LA5PrD11HhaCVU92ajeOlnPskXGc8BcyDK8ulet6yCBLQjnHvfgzxssnRA8r?=
 =?us-ascii?Q?ss7m0nIheYoK6gjFLkfqs+iOmUxq7APX+9G8ulVy4WDVyAhNTt5OjFZmKYjn?=
 =?us-ascii?Q?8pfqHLdRWyQSb6CilBpf2A7+7fCvSn/BXa+uoMoTEMk1nZYobeK967cYv4R1?=
 =?us-ascii?Q?lZRwMn7qKgcpJSZP3kbLnR0hfthMGx70iwb1QDRqPle/hHs8UD4zTj59K56e?=
 =?us-ascii?Q?x4WuUjfHVWp3rwKEHxATOuV+HusBVZEDjBaGA7vp+ThJFRhlLmVqQWO23nAF?=
 =?us-ascii?Q?kMNPtzg86UVqyzom3n/xiB2mmVcuE8djYSjsa2cwzHykHZdHAGLbKtOKD1ol?=
 =?us-ascii?Q?BJ+dqt74GiNOtLwSqs+J9YtX6mO1cDuu6V25vy+TmvZdlDgNhfRReU4AA0q6?=
 =?us-ascii?Q?65eBav0aDMX64miSAqvwJM/qtym03ZJ/+JbMkfcbEwN+YnOJRWBLO3umAUE+?=
 =?us-ascii?Q?bd1YpD4ZIwH0CjFHqW4X/xfd/vGap/fv0lwus+QKyLJCtd/uvo9xuSq6njew?=
 =?us-ascii?Q?7LD+6v52TXW4XwZowQvhW2U8ZoDIj/9KQePSsUuWZ/hUD5+JdCMEuJPIBUFH?=
 =?us-ascii?Q?/j9onaSX16ZoQ6/Q8sVWTj47fq3rrQVMjjZ7XDQnzLKKQnlwp2+3mcQ+5dYw?=
 =?us-ascii?Q?8PMHu1p+HXjma3LG34/ruuqAiw5qEVGwsuPliaGCEbiAcWrYLB/oQaaFfmti?=
 =?us-ascii?Q?fWFq6zspSpW1oVWYCwNdlxzZtR8U734/oT5L88sT7uN7Rg4RqYDwkYvfELHx?=
 =?us-ascii?Q?j1Ei1o1lHTRbp8WhscOyCuqW+ljhtAxilwu3aCBdw14bU6wmMrOWC4FevuWP?=
 =?us-ascii?Q?93Pq2HVglRy6CEvTCLGKAWLIqRGpTxpy4CTfdErIBmRcrrPZdFENr+KPMC0T?=
 =?us-ascii?Q?htlROWBP0VJ3Em8TJ9oRObKJIuiCwu4SdAMpL3CaE6qu7K2DKqkM0U1g3oBU?=
 =?us-ascii?Q?9qhtY7Gi/A=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5153f625-4351-4119-fd0d-08df2a9045d5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 07:45:24.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmGkAcnyvhcsTOBGZY6eGO2tTPIG1J5ccagRSr4E5+3uDRWbN/YMHdWw0sUtX7gEU/F1rZ9wEDM2lVhq46WKZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5845
X-purgate-ID: tlsNG-ebf023/1792050330-508D9B50-98E282DB/0/0
X-purgate-type: clean
X-purgate-size: 1864

From: Chunjie Zhu <chunjie.zhu@citrix.com>

With V_NMI_ENABLE set, the processor clears V_NMI and sets V_NMI_MASK when
it takes the virtual NMI, and writes both back to the VMCB on #VMEXIT
(APM vol.2 15.21.10).

nsvm_vmcb_prepare4vmexit() only propagated V_TPR, V_IRQ and (conditionally)
V_GIF from the L2 shadow VMCB into vmcb12. V_NMI and V_NMI_MASK were never
copied back, so L1 kept seeing whatever it had last written, regardless of
what happened in L2.

Copy both back when L1 has enabled vNMI for its guest.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index faacfe007832..ecd89eb43f06 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1027,12 +1027,18 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     /*
      * Virtual Interrupts.  #VMEXIT writes back V_TPR and V_IRQ (APM vol.2
      * 15.6); the remaining fields do not change.  Copy vGIF back only if
-     * enabled in L1.
+     * enabled in L1.  With vNMI enabled, #VMEXIT also writes back V_NMI and
+     * V_NMI_MASK (APM vol.2 15.21.10).
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


