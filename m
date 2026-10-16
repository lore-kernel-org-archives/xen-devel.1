Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702EECCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 10:01:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451501.1666557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHekd-00032a-FS; Fri, 16 Oct 2026 10:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451501.1666557; Fri, 16 Oct 2026 10:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHekd-00032T-Cc; Fri, 16 Oct 2026 10:01:23 +0000
Received: by outflank-mailman (input) for mailman id 1451501;
 Fri, 16 Oct 2026 10:01:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xHekb-00032N-ME
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 10:01:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHekb-0080eK-2f
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 12:01:21 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad1f5ec-8faa-0a2a0a5109dd-0a2a4507c542-28
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 12:01:21 +0200
Received: from [52.101.43.29]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad1f5ef-b4ea-0a2a45070019-34652b1d5347-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 12:01:20 +0200
Received: from BY5PR03MB5315.namprd03.prod.outlook.com (2603:10b6:a03:229::23)
 by BY1PR03MB7237.namprd03.prod.outlook.com (2603:10b6:a03:523::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 10:01:15 +0000
Received: from BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550]) by BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550%2]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:01:15 +0000
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
 b=uDIFKJpz3Xt6IKfcacKC8WyKI6XPt3oGlTvI8Q2DZNnV/Wb+v6DtODh9k4T2J7vptSljJreSWlDXH2WWToRelGpsJD7rzKoqQjbuU2ta5zLbmHASruK9xgnJLqfsiU+csgLF8STNzAYfnX43BEDjZAgklxmYBjisYIwWkb9BM2Bwf7dPNMyq1O3troK6Z9SkRqHKtUCxB3GhSMe/FoameEQOvTy7k97th+QmS+c5dO8PhG/UBWW1cAYsZKXFrKM/8AkBcwP8PU44mEdoolGw7iO8V+XpgvI8GyVAxNrcClycr1zwR3HbCLQh4Lpp4fEzDae1S6Bw86Ec1qDuwkA2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAO2YY9AHIx6l0GhxAGNMXgKqS3ZHmq2VRkp8fA75yo=;
 b=eqSsM+bX3Azna9VgstzQ2M4vFrvY/rY4u7xh4rsNks4ln8I+ZUtdQEJGaGEAtSBljYkmiq0Dw0l6eviECHikWUYeslsroGM+tqRxeKdFg6PGZ+LhYuIRLtOQvH0j8PhQl8xDwnCVs2Svb8kgvcxQQYSeZjWDb4Gf6u1ClgqHZ4nekB4SKdDFc/E51ZNBjdKv06P9LZQWfdt4TrN/yF1g9y5A6X9ojQNIhKLZzowd97Jj4Sfi33LJGJmnVGCYz1C0zMikvwHGNJc3hShLNOtQVnmGYdb+gJJ69BD5T32qnySQjfT+0V0bMbWGT7Ewi3qW8g68xwHZxLM1pNLsra3EuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAO2YY9AHIx6l0GhxAGNMXgKqS3ZHmq2VRkp8fA75yo=;
 b=G5ely/n8cpMiYyVTaQMy7G8MGgz0xlF7RSpchIVxiTxqrlYJM22JmhTMb/grKmrr0u5YVT5FQpdiLAF9/juGr9cqeyttJDQCkoLmaCWggtM+szUwa5XfH4k8snRkrYkDfKaOoU1cq9jV3ueBowtljX4lNoMsvJpkZd1S0b2mMDg=
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
Subject: [PATCH v1] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING
Date: Fri, 16 Oct 2026 18:00:58 +0800
Message-Id: <20261016100058.268266-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0148.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:ce::14)
 To MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR03MB5315:EE_|BY1PR03MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6aa66c-6330-4f2d-6b89-08df2b6c68d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	RbuJLMg3s0+txc0yCzGw6GeHpL4opgDNtXLhUbY4MUXzMnsB+nLt2YHsebxfabdH2MscYakjYpDIcxFN+MjJTtYH05LJvzbNAARF06cIKpHoCUqpUR3VMKugP81k2IUQTFl6TC0+QLYQ/Je9RF7OZqVd8Cg1ArwA0dzJEsg2l/Isk3UYJS6c2OxyaTMbzzNThoW2QYWADf5uMFql30MxBLjeroHYSJJkdsVdU1fWPTpCs7ABpaPND3JBlLJ7FLHC96LmoEjWenQ+xB3waTIusJdqz4rmgAFJ44sOcbjqynnY2mTWSS1s+AYpazBE3e1KWY+DVcMC0cwqpdVXdmoJe36srR8pnc1lfJgBOtCZ4A4Q2N6m2ZW25yoKXUgoyw8suv11yW4/nFqAMrxE+2qaoMh3TvvWa9q/bAzPfY6xeCYWEnsM6mZfQZwQbtHujUqQqRYEIT+BU8cy1nq7tIUAA2WVr4ED0w3wwsoKF/0VDgIonoaQ90VkY/JEtgR70aReRgK9du9w83c2YTIBboJOhl8MFSj9sxc2TN4xdQoi0bd/x1I107OT8S3/91amuJhivGlhTSPEWejc5taC87bhp4q2ktLAbV8nTzd7BJDbNmP4Ykh/dwKVqVnUjAprZ85vAq1ttLnS2xMab/ZUDep3RKnsUQP2BY41oFuPsg01+vY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR03MB5315.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(10067099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nD1FSZFloOPgVLB3PnRDDji/s2cV8pc4hx8BVzYSMgwE0T1eLFIN3nQifdvY?=
 =?us-ascii?Q?blRa444zgDZyUHLZCigsGvy621naiT4sXDUAVl9dku42qFqqItWrxLKTHl0A?=
 =?us-ascii?Q?yzMm8bDiiGyMPzF1zJe6VaDRx4EZDiTNmUbo/9xaSQiGMpm9/0bgFkL/d8n1?=
 =?us-ascii?Q?IW2p3WOatoz7skSXoFmOXVcznEJ6LGfhl84AU5ezqeLogXoiyjXJYNP93YT9?=
 =?us-ascii?Q?HpQhVaxSmkvALtrdmlnuJqVwH/RAITXVtUkfkyuZ2e8C4VIUq+mBqrubUmrb?=
 =?us-ascii?Q?GA0YK1UYfbOkKLM4ZUqg4Z2+YXXgcVApdplB92OdHktPDqcVv6cUzJAkQfu1?=
 =?us-ascii?Q?SmR/atvBmJtMZ/HqwXMDcMr7y1dVRNrJyYguZTjc/kWV+TId/9aUEF0aLOG1?=
 =?us-ascii?Q?JuQePhWIMxbDHQE7WXI6UuEICEhfWBgK4J9ECCdVivZbVoGh+mHhLbXYofCz?=
 =?us-ascii?Q?rEparVC5ne+ebMC9Lgj6h2mdh+2iHQ1i4jwKY3w430TUyzXLgWLiaVZqEKsv?=
 =?us-ascii?Q?lKgtg0FPM80Qo4ITnWmviv74qcNHrufuVsaqSpJsdpLrYEPHik27TlVEOwHF?=
 =?us-ascii?Q?GT8xvZ3vDmg36xP4s6V960EQ8OaQZDtGkFsywAauV1IAqpq1p/d1Wlls/b01?=
 =?us-ascii?Q?Hx5D2BzvtzDFC/7TK9kAJH0KNd2bqhOmX417Fc6cNlWaIpXEUjxJrSCduwIN?=
 =?us-ascii?Q?2XakJftzwLoNenHDWNTIf/gGnGXUbK2EVfuDoiYz12COHi25fjrn03Uom6ng?=
 =?us-ascii?Q?ss0FVNyHreA78RP9JKxK5AQTz3t4ufnUK5ugRPV1BFBsgMLyGp+SxUF/GRLh?=
 =?us-ascii?Q?Ur5vbWXjBcyTGnlPg1Qzc7NlRqbX3PilBgqMQ3CGsNj0Cq2CNYwhbQFElJg8?=
 =?us-ascii?Q?04UBnViBf1UdeGI35trHtVE0gzRSprUNZpiTKKzTko5P2pEFMe4K1+tPhpsh?=
 =?us-ascii?Q?64LMbPGJzTeFYqNLDi68pdqgk6Yl1+ELvKQI+bTVrBYE0AD0bCgtDwCtKCBt?=
 =?us-ascii?Q?KkeCJO3+ZI6dznNrh1bcjAX9irKNkZUYSKWfJdiLq0lrTfyeqaLwax+5eNYR?=
 =?us-ascii?Q?L084vZjLZ6y9s8hoJG2J4HA9uVEkaUk7RwCJ5fm1prEizahimVp2lRYxwgVJ?=
 =?us-ascii?Q?C93wIgMxL4Je7ZHGQP3GmkfZiz6mTZA7bNwsCSpW6yt1XjGaBmQEL4DnPvBV?=
 =?us-ascii?Q?dAbl2W5FThUekb3n2MEEkFFdUCNzFHBaxeXfPkQIhF559/t2deRJJtKp5hU7?=
 =?us-ascii?Q?bPA09Wzy3K7Ts397JRGlK1c2bt1Jmv4jRU/5jtM3VdDSYTtFWz/XBUGYjA6g?=
 =?us-ascii?Q?bzFtQ2CZeSqTUDe3uXnFFE2aD9cDHd35eh37ePSg3UWpDrF9XvyQWqAAm3Vq?=
 =?us-ascii?Q?UmaE0mcBsgG6snRkSUc6TZkKAYZVsdzAd5mcJ+q2OaCdwbp9P99+ElttsOmo?=
 =?us-ascii?Q?MdSFKLkoelKXJuNFFpC51biG1vPG0DoyZaJeHuQtCaSrz2bV2A/r2UNW9TEM?=
 =?us-ascii?Q?6xHkWrscUPtcYU1TfQ61E0CywzJkpgXW67Te3EQUJY82SgNHTFTsPQZNmI0P?=
 =?us-ascii?Q?njL3FdvEHbSfcnEP1WCbg/jbnu9SWdpT5RRVrljBps68+i1Y3Grr8ZMsIDKM?=
 =?us-ascii?Q?HmvPE4S2RSEUh3jntvIVYWiRpC9WEryOzPWB/c3fKSdE1LqZdIHjuUYoyq98?=
 =?us-ascii?Q?7FlyfzJzR8aSgpDF3FqxZ+duIDcEfyPM/cZS+tsGfbpDzuW+9DaG1XSG/Tls?=
 =?us-ascii?Q?4hYXH/Br7Q=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6aa66c-6330-4f2d-6b89-08df2b6c68d8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5328.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:01:15.0192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dvdjJvTvc/ajR7yi4I530SoWi50OfO9fMOA5Kw+p7D6yQRAIjwlurrMET9dLKahsJFVaE70kPoOcqJs7wF00A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7237
X-purgate-ID: tlsNG-ef75cf/1792144881-36EDEAE4-2974691B/0/0
X-purgate-type: clean
X-purgate-size: 1792

From: Chunjie Zhu <chunjie.zhu@citrix.com>

L0 always runs L2 with V_INTR_MASKING set, so a physical interrupt exits to
L0 regardless of L2's EFLAGS.IF.  nsvm_intr_blocked() only blocks when L1
requested V_INTR_MASKING=1 and L1's IF was clear.  With V_INTR_MASKING=0
and L2's IF clear, nestedsvm_vcpu_interrupt() would still inject
VMEXIT(INTR) into L1.

Per the APM (vol.2 rev 3.44 "Physical Interrupt Masking in EFLAGS"), with
V_INTR_MASKING=0 L2's IF masks physical interrupts, and a masked interrupt
must stay pending.  Return NSVM_INTR_MASKED for external interrupts in
that case.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index faacfe007832..a419b47eb5f6 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1514,6 +1514,17 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
     case hvm_intsrc_pic:
     case hvm_intsrc_lapic:
     case hvm_intsrc_vector:
+        /*
+         * Without V_INTR_MASKING, L2's EFLAGS.IF masks physical interrupts
+         * (APM vol.2 rev 3.44 "Physical Interrupt Masking in EFLAGS").  L0
+         * always runs L2 with V_INTR_MASKING set, so the interrupt would
+         * otherwise exit to L0 and be forwarded to L1 even with L2's IF
+         * clear.  Leave it pending instead.
+         */
+        if ( !vcpu_nestedsvm(v).ns_hostflags.fields.vintrmask &&
+             !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
+            return NSVM_INTR_MASKED;
+
         exitcode = VMEXIT_INTR;
         exitinfo2 = intack.vector;
         break;
-- 
2.34.1


