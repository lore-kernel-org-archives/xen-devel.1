Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E6606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Buv9R/LF
Received: from list by lists.xenproject.org with outflank-mailman.1491887.1692584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTBH3-0007Ke-6Y; Tue, 17 Nov 2026 04:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491887.1692584; Tue, 17 Nov 2026 04:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTBH3-0007KW-3K; Tue, 17 Nov 2026 04:58:29 +0000
Received: by outflank-mailman (input) for mailman id 1491887;
 Tue, 17 Nov 2026 04:58:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xTBH1-0007KQ-Da
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 04:58:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTBGz-00E8xn-W3
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 05:58:25 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afbde9b-2eae-0a2a0a5409dd-0a2a450ccc9e-42
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 05:58:25 +0100
Received: from [40.93.201.21]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afbdef0-f479-0a2a450c0019-285dc915e129-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 05:58:25 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by DS7PR03MB5527.namprd03.prod.outlook.com (2603:10b6:5:2cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 04:58:22 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 04:58:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gseRqZ5K5KNEU+fRku69R4m6Blw3iTGz1nnx9pURFaGpiGASOK2z2WixgHPO+ihp7R0ISf0/IGnLtX7+a4RIl4BIltRcoi7Q1asn8sbHzJ/g7YquUJdpcNCL7kZtvWUiwmtscSa2Nx8Ya54RBSMtvFSQQVsclxP5PMOACnF5kV4m5N0tD0uP6HtxDKOZnwkmTOSrsqkGQN3yA1ULMtvc6ZjH6Pd4kzb3LzH3BXS2pw/Da0vJOt4A8sCg6yWP1XGUstK3G97nvPe/OM8HIxyGmSaAu1ttL9dNYGWxYt9xrzTFg1q3mD5BXfQsaP9wXi3/UYLq1CGKyuCggjjlREAiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdOGsWJlYCHlMXlKBcvsF0CcUJUNB/qihTJ/D+U0tA4=;
 b=vydF237eMug5lz7SLoZBuSpjF+5wn5eusrL9txRoTrDvo3McTD+7L7vgazKKLrtNubgnoKOtVwD5q/EUvPOWnSsggzwbZJCk9E/yONwwY5xpgT7bRjF2jL0w6Y+OE8thYiSsfrr6xFAPOJekheDQfgEKNmEBb/voUAWxt2oJPqq1y9u+e0Pykt1wamBm+ZmpGGVyS7Q6WcqFU6V0fWVNBWJiYbYZR/VYTHt0EEH40X84tFKZJ/gmh1HZwZYUXM55cr9iG5vMVoDSuSzsGPSccEtVQRA3V9QBfy0uwkm8LY+g0oG7sktJUldhAvIqdz9Y9b0kK5Se682egxv4YuwLCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdOGsWJlYCHlMXlKBcvsF0CcUJUNB/qihTJ/D+U0tA4=;
 b=Buv9R/LFRr4HpFZDrp2qhVVhoYErRWkysBRYY0axaC1SXbPwTLFD6tOg/f5lY3ykIBwlREjBHFmKnpXG36MWTfgLMAw23yo4V/vgST7KrOKPSqyMeohrCwXc1n+ZhtyV+7zLVNPjIR6rU9AwC/5ruD89yD3RhZdRu8GZm0uRA+8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] x86emul: Don't adjust the memory operand of BT* with an immediate offset
Date: Tue, 17 Nov 2026 12:58:12 +0800
Message-ID: <20261117045812.304422-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|DS7PR03MB5527:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e67438-fe2e-4404-e53b-08df4467677b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zvK2/XoOfolmTVp7+BUmGVsm89F9OFr6XPWQ6lF6fiesKPx5ED78RRSKRCWXtZJeC5XliRk1SaMus7QszhESAP1KS87jbk7Kn7cCdaNZdYtUgn5gJuqi6Ae8MPDfKE64BOn+SxHwwW8pVgVfJbEYrzdre+35+NsilepcZNaELfl9zmMexv/4ZnCoK3cbWcUEMUa+5bdam7CP0w0tUCo9zIdbsH+k3Jmudy1RlvBJPVxq8StoQv4hpttKpPJ9fCTaRNjzTrgpMs/whyMG7eTxGrqmGn4rhnHTIl50nP8MUKrOzMxZQX8UuFdz9B1iDX0HRs1ELdUkyd1UGm3qOH8lw8tmA/CJjRD6zxLku9oObLdUJGnhXKrOgv4H/R+STkRBPX5YlisxrJZYQTigYVLSf/4zyaoNpLP/pIeKaNNA5aFHLRuk26GU5AEMkGQ+8L6TrlChoxdcUQo/cVRrH4RD2SIMXhoSg4XqgHw2V/FmdHfqfNXxt5SGWfW0vyKzpxyleZD0m6dEAMHzPAJSUmtB1j86dIXcH6esM5Vez8B85Z40ct/+dN5pNkrWNeKsykEI54PmIDwkSmCtlLECxHkgRM7t4ootPdtwV5a9HzzGImPGipalKm8B+1s84fILQaNC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w7Z536dnOSYvChy0Dyhgtj+eKLb9CW/j7zOWyAz0eLbloubWIwU8NxrzcFVC?=
 =?us-ascii?Q?coNAzO+NqzPrv4IBKsAjoJEA8aVjELGSbAm64pd572fz3WiuT0uNHoR3Iok8?=
 =?us-ascii?Q?TSnmc2BuMJqMed3WCRrPkocExyHmODu2gQ7gKbqT7pm20IW6oM05RfQg2GtZ?=
 =?us-ascii?Q?Yv7ez9txE1cO7nmMlsCDxojE0zT0XAj6FbB+i5Do6kC3ct0i3B19tC3vb12R?=
 =?us-ascii?Q?9Gm69zKT6CtntwEF0aWIQ3QNJ4U1H8RUs1eO8liZ6+YWnb0SDaAlm9pGhC7G?=
 =?us-ascii?Q?eo4iYuLH6IFeOb29KBqHWPhhmr2Uxw50CePllsRfOxpGODpJjXtoA1+bjoKk?=
 =?us-ascii?Q?k4dzLja1SCQBt5u/G8/6ZjRxf73vg3Z7by2H7mU9KRam8hy7HDiMG8ceezGv?=
 =?us-ascii?Q?szszS5aJ7RFCbBcRIVTaGfbgkV85m1QXspOuMSJoGXf910SAB/CKIOiwSM/g?=
 =?us-ascii?Q?m65DrAG17UPqEygLLEeXUGPXlV073cZQN6Xup78V95L5St4iB7GLgafQxaQ5?=
 =?us-ascii?Q?ozVz9iwd9pSKA575HmFBPramsahoLWZlhtrBqtqkFQWW8h47xSb+PllmQZCZ?=
 =?us-ascii?Q?hNDtOcNtKmEQvqwrOlW+VGtJ4ZHoW42yQEx23/1KNUn/RUSRKGNCSrPtt5Ze?=
 =?us-ascii?Q?32jwwlsDHdNJlN0DLLXxRtVUKsdm2BhMUKz/Nenm8XnZLTCRFpgSVE1Klcbz?=
 =?us-ascii?Q?B9Ye0fT+YeYnTr1EAfPKDJ+oxHvOlFCz7HUPsDyIn2BU/1oQe/Ln4unu56Ia?=
 =?us-ascii?Q?qFsb7QXwfwEc1r5CuMrJz4SofjfKcebjyD4conTVNqt8H7nz8bvuEZdALsoM?=
 =?us-ascii?Q?GwIrHS46WQVF0shUw0lI0qxXNNf5q7QWQDp4YB2oTPudvS4D4+s/brYPdQZk?=
 =?us-ascii?Q?gaoRbWgGmYUEAE/HGtU/IhJaxsL18HNeEkLskGEh+HX58/4RJZ0JCywDzoaX?=
 =?us-ascii?Q?MzWR8WWBnLPzRamKNElFyHMbBxv212meoXAJqTt4qm2xFcG3lV3VQOvAIwNp?=
 =?us-ascii?Q?Zi1KD6p6J5hCfjTKeqsKHyT8RAf5HgbYYGkHbqv8NClL5o2P0bARqOrSQlB6?=
 =?us-ascii?Q?Uu+Gekt39zdbVux3Gti2NmrBUpZJQfaMsMtPbCwTO/r7PN3EeAwPK1KsqLun?=
 =?us-ascii?Q?rOrrK1mkSXeJViTikMeoXf5Qw0BZQZeH+wb7kwZugYe2Qr7KFpwv9hTJ4enr?=
 =?us-ascii?Q?ivXbMTSaAphY9v6a4r2Dzxtgh7IO+LnghZvqkswV3Nj2eH2ib2Wq2CdOEbjD?=
 =?us-ascii?Q?2EZRp7Ld3/QEA+JbAklnqh0cBdz6Z43Dz7Z3NUhdBnwyCyfxP7GnbTw3BcoP?=
 =?us-ascii?Q?I66hxgTOFVupCJR2B6b5kGnsSiLA8jiNMG2A8eERvLliNh5Vv5zVPgPzksGl?=
 =?us-ascii?Q?j8jPFRnWAB82dGP5lANra76hr+/D0zUmqJyeVc3wi9Jzazccp1wd/fj8na6h?=
 =?us-ascii?Q?GGi9WtbL3Esba1o4VwmDnevoNcKf3Pn2xfNKZj5BYjywF0mFF9NYsQE5s3Wq?=
 =?us-ascii?Q?NPnsLYIHWkGQIZaEGuGXlNBiXTeGYxuFDxJDhplDVHoSqlxYuDRPvrIv183Z?=
 =?us-ascii?Q?9q+/jabgZ7qX3hOEvZZt6P8fmNr/DJ1nMt+ZxdgQgNLZV/qLAdiemaFqpskb?=
 =?us-ascii?Q?N9/9u/mKkrxAnlmGJb7pPYzD6wAOE0A6cZN0A69UErih/59ICjjdUAcbhHTe?=
 =?us-ascii?Q?MlLXNYlQW8ExoBUVs3QGEoVm4Zc3LlKZ9NGZ1LYZzGR7juGIwWx016hkLsDO?=
 =?us-ascii?Q?uvHoSqUvzw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e67438-fe2e-4404-e53b-08df4467677b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 04:58:22.0494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1dpAYNJ5NhWvFYuMd3wUFr9YyxxHAkjJgxH1hif9TFz1xmPTxHUBlbbbFQTvqEZupPMX/dn8KcDfahbFBhQVlivGV77amm860Lus/Ch8CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5527
X-purgate-ID: tlsNG-d25034/1794891505-006CEA5B-797FADA5/0/0
X-purgate-type: clean
X-purgate-size: 2821
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With a register bit offset, BT{,S,R,C} can address any bit from their
memory operand, so the emulator moves the memory address to the operand
holding the bit. With an immediate bit offset, the CPU only uses the
immediate modulo the operand size, and doesn't move the address (Intel
SDM 325462-092US, Vol 2A, section 3.1.1.9 "Operation Section", Table
3-2 "Range of Bit Positions Specified by Bit Offset Operands").

The check that skipped the adjustment for the immediate forms was
accidentally dropped by the commit below. Add it back, and add a test.

Fixes: 47591e012f08 ("x86/emul: Further simplify DstBitBase handling")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
I found this while fixing the INT imm8 bug, see the note in
https://lore.kernel.org/xen-devel/20261116012748.4872-1-stephen.cheng@citrix.com/

 tools/tests/x86_emulator/test_x86_emulator.c | 18 ++++++++++++++++++
 xen/arch/x86/x86_emulate/x86_emulate.c       |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/tests/x86_emulator/test_x86_emulator.c b/tools/tests/x86_emulator/test_x86_emulator.c
index 61b2840ee0..fa11401fee 100644
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1201,6 +1201,24 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+    printf("%-40s", "Testing btrl $0x21,(%edi)...");
+    instr[0] = 0x0f; instr[1] = 0xba; instr[2] = 0x37; instr[3] = 0x21;
+    res[0]      = 0x2233445F;
+    res[1]      = 0x2233445F;
+    regs.eflags = EFLAGS_ALWAYS_SET;
+    regs.eip    = (unsigned long)&instr[0];
+    regs.edi    = (unsigned long)res;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (res[0] != 0x2233445D) ||
+         (res[1] != 0x2233445F) ||
+         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS_ZF |
+                          X86_EFLAGS_CF)) !=
+          (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF)) ||
+         (regs.eip != (unsigned long)&instr[4]) )
+        goto fail;
+    printf("okay\n");
+
     printf("%-40s", "Testing btrl %eax,(%edi)...");
     instr[0] = 0x0f; instr[1] = 0xb3; instr[2] = 0x07;
     *res        = 0x2233445F;
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index f168f3ebcf..795eec878f 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1505,7 +1505,7 @@ x86_emulate(
         }
         break;
     case DstBitBase:
-        if ( ea.type == OP_MEM )
+        if ( ea.type == OP_MEM && (d & SrcMask) != SrcImmByte )
         {
             /*
              * Instructions such as bt can reference an arbitrary offset from
-- 
2.49.0


