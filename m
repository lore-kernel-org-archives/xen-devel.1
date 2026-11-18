Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE78A606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=zdkU2e6m
Received: from list by lists.xenproject.org with outflank-mailman.1494061.1693740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbTr-0001Vt-NN; Wed, 18 Nov 2026 08:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494061.1693740; Wed, 18 Nov 2026 08:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbTr-0001Vm-Kb; Wed, 18 Nov 2026 08:57:27 +0000
Received: by outflank-mailman (input) for mailman id 1494061;
 Wed, 18 Nov 2026 08:57:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTbTq-0001Vg-Aa
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:57:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbTp-00Dkpi-IA
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:57:25 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afd6868-8faa-0a2a0a5109dd-0a2a45098536-26
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:57:25 +0100
Received: from [40.93.195.48]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afd6873-be1a-0a2a45090019-285dc3309187-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:57:24 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by CO1PR03MB7818.namprd03.prod.outlook.com (2603:10b6:303:274::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:57:20 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 08:57:20 +0000
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
 b=zRwG8r3JOBacU3WIC4ORU/q4pUChJxMDA2aVZrR/F/EFfWp5FXDwdHZfsr725rMYLRhFad54yQ70XJE7putSoMkXvXxrx14yKkRHxGZ0x5Ly6encseA1vlINeixF4Zbd3m8CQPUAh/7eNf+moMvUyoCTwkVN1NUTXhEKSkSKND5VEmquzZiRaj4vrr56y9O/qfW8Yusnulda3AJYtS0ju/aGV6/L/IaR7hygaeWgPwB1O13yXoisFRBTWJN007tJGux+EjX97d2ugWzaN9Litx904LeIm4qnBAr+Mps1r/Cl/oaPvOVfDbkzN4gGKo8TDv8DfEXl36zL9v1wnU4NnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DF72q7IOHo6VgxIWuEuOXyOP6aOzp77z+QPw8IQGoo=;
 b=hDbRxbjn0xz/3ZayMzHVGutyah9gzrt8VPt1qBFaCQBsq7WG3jA9sF+lKPCoXfdqt+3vV8E/7a8+90nIRj+E5Noq3b38DGrWcCc/FgopKn0IKhwncWpJgFul79bmXd30mJYQXW9pxTs37y7eRI9Fbkyljg2MK50QyCj2Y40+EYJkesx1azmSpy9V7WcU5g7zSJ006vr7kLkmotecYMRo1/Y7n6NykJxUFVYe8ifmiOPwjbpl5q8hFciY12596tG/i7cn8fbVMdGSDmXbzEj2yKjgB/nKtcKnpSCxpYeSwVwbdIwF946LxVxFKWQbKjoj8Mdylu1+bF9zJVB+NymLiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DF72q7IOHo6VgxIWuEuOXyOP6aOzp77z+QPw8IQGoo=;
 b=zdkU2e6mmzFy/8FeXRdUacTOzrYs7Qd+8/OVhi3TgyMr/aX/jf8uHZx0WxBek2LrpfnZGupK58BSF8jPiC07F2qKeyYixMZIXnkjBqNBprYBCMCrV/1oFtgzPTYFmASimAT26JwP7A5KV/rni02YYFhK3/kd0ZyN3NF9DL9472Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86emul: Zero-extend the XOP0A and MOV B8+r immediates when decoding
Date: Wed, 18 Nov 2026 16:57:11 +0800
Message-ID: <20261118085711.564158-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|CO1PR03MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7f4b20-a9c3-46fa-cf5e-08df4551f44d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|261009223027099003|3023799007|11063799006|56012099006|261026140227099003|261028144727099003|261102123227099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	U7z8a9QESGgucxPOdbMTzpfxA7ogmEgVdEnIHYl5M4wkjCKDpylQM8Oilv6DIB6+PhILHwvFDbzE2ck5QL3GaajCgbXFzRzed0veFesguo/b709YhPOqVwqchDaAGhU2nDqVNQ90/3JNinqLGmMnDF1InVaURui0FoeVAhbRuN6g34p2RTdnG6GVsoWKB6S3FF0TXjUl9fthZ8T6MwIFO/vpPOS5TwdHv8mf2LWdiJRrRO3JifbXxTyyxinndn59qHl8VcFyaPCEE6+JItyoQJLHOvaQhQJKOvLLxhWZH7vO3XxlQUrm3gKhGHKhnDez9rQZorFWHv/3Yk4TZEoHgmqyQdwoOzteSq6aQclG9SQ8ITf8UczFnbLWP0C1ZAqMD4xRe2O7CAPno+drsiewhVpj0RpLFcdgmS0raKn8ECViUbs8aL550q0eGAimHWF9dNmkCIwnLA5qK4KQpqUDUYQsRcULQA1+ztKsIrj0gaNnN8Wlm6tEPJLsXU929rzSYSHYK6WDuel4fE9VKHfcImrI9lP8dY0sazB81QsnYtkWg+vIw9VqAsTKDVpEmMd1edUa3bjoOuEVsIDnxljXHjk9TWQqxVRCbOqqoHmzVNQAnECpeMGe28HZxtDLHbfn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pWv1c9W6ncviDAErwZlZHhUheynTROPVgy8gLS+LkQvUmPyw1MTilGrgjJPb?=
 =?us-ascii?Q?v37mjnmUw43D7pypFCGif4QbuWEcO9W+eQ5I4I1hyyHDHTXVJkqE5xI9fYfD?=
 =?us-ascii?Q?SImIaxtE+qJY7B4x2HSllutqAhrW4nZTy0v/+BjosasU7/YqP0C+YrnGGYGo?=
 =?us-ascii?Q?gOk+oqtXX4cOwpU8psvMcDX6snfYAR+MkcRqAW4WY1gWNJ9rhEAllp6VuJzR?=
 =?us-ascii?Q?yq5Mo8nOtUTzVyOGhNIYTzbhGkrlXBhkCwm5qmtJknqSiWEJ4lO6GAQJvwrV?=
 =?us-ascii?Q?FzJ1RlmeK3tOJuLcy6Zai/vEM0KeR5s60FQ9pkgmGF7N6Fnqni24u89vUSrN?=
 =?us-ascii?Q?1CX9HTWRkxObd0rewPkFa/Hr350bMsmp3b/4Uz8KERwf7i621MU5WdMYd/5J?=
 =?us-ascii?Q?zyTgbyOURZOmwVFOo1pofPE6C8xGwN4/kBFDK0K8EN2wwJWcOMm/c++rBXG5?=
 =?us-ascii?Q?90bbUOFsRhQj+RucSZZ+POsFoS659m7PPT1hVSqp2pdVtOIyRge+tASl3h29?=
 =?us-ascii?Q?tmrS+2A9q1Ru4RRDW8aZRpl+xU5jRqBmrCTBqEQcgWPve6Cpf2I6iozaHgil?=
 =?us-ascii?Q?hmellYdIdNQnoSqmXuLBJzuDMvVuPlBvtJ6cJCnJmqzF54rcMz2sC3O9pAi5?=
 =?us-ascii?Q?HafdMX8MUAMXGgVarhSss2fgWjU2+tt7MRQNc2nHmVYtwCmVhMt9Qvh2MU3E?=
 =?us-ascii?Q?4TQsI0tfE3NJrVixrTCgvf2/p85CdYZfM9r5OG0RjUpIRcp++zoWNxPEFYsq?=
 =?us-ascii?Q?VqNK81aMBBDzmuTYs4B9Gh3HUVlxDDTRE6vPmv0PTCSd89vDDKNIv1tozL6b?=
 =?us-ascii?Q?/yG70aHgdPLqBKbMefq9F9IxqMzbP2KzXqEFahxz+obpZroOkDzLhCnE3P5g?=
 =?us-ascii?Q?r52OmqqpRWaYpujajQ25IYARA0lKLuVQ6ej9gk+kYs9uahQcdXslctw+2ZyD?=
 =?us-ascii?Q?Gb+XEE6sZBhUaz/kU94jy3UcZGZK0LHEDqS9lwXBWZqQQCdqoaR+euX/9B+k?=
 =?us-ascii?Q?3Pw9Vnp6gHcLSZ6xCUE8/shSMmG3kPSkzVhxXf58bTWj1o3lVQ6zgTAqQyLi?=
 =?us-ascii?Q?TVC+M8b7+IXSt7omIJN95yFZ+bVQmNPexNaBHxlJYW05U9UcwsWVMFHeUUYk?=
 =?us-ascii?Q?URBRoZNmHMeKzfXq/npW5V2Ld6y8UohwjcMejI20hMX6W9j4sXOiVHKTEatK?=
 =?us-ascii?Q?dJmrxjwzcKxRl2P07oMErfz66D5lSVtyNZ4NVl5GodGtETOtq14nNX5aala6?=
 =?us-ascii?Q?gQIhiQ0fGLR3PHmPh0HXhLyYmuUKnu4uMLpeABGKcOqwNPV6k0jFX4s+Pupt?=
 =?us-ascii?Q?b7UkHbLriR9Ba5YnxcpFEY49tCqAWR7aDBgx2zW9fokBHvFDlPU+PUw9kC+H?=
 =?us-ascii?Q?l7vH36BlWRNRAmWfP+GcuNlRs8SsCppepe/UkerN86xt/46j/N2Ny46wA5zz?=
 =?us-ascii?Q?CRC6F3/XMYdc8xaWBAd+3saScdxwr90Y2E9kH2kukJBGPhdtjH7TvNk5GV4c?=
 =?us-ascii?Q?wjz5U6mQovhkd6uLBX4auqcKllOsnLen8vzryUqzcpf+/4pBAvGNjbjPokg1?=
 =?us-ascii?Q?o+937nKBg5S/aXbHlQpt/yQVxtRzj9+GPXwvYLZfHlJZAx7rmqBxgA2mVTVe?=
 =?us-ascii?Q?91U34DCPfS40TDm+eoh58VEwdvM4iDD2azz+Kj6S87UsQQv6tI6zA0sOmDE7?=
 =?us-ascii?Q?mWEEnmOASiKoRrJV/1GzqYxkIK7L6/EVNL9rStZ6aTcfxRc0dp4QrPLrX0Mv?=
 =?us-ascii?Q?BzN7qQLwzQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7f4b20-a9c3-46fa-cf5e-08df4551f44d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:57:20.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Vi5LW73oTW04OGk2IWKP0nAgv2+Xj4D3Mo6dv0/mM/DEMmU+cVqWG4BnrztcfJKK6OK35WrATdXCOiz/7+q6pWUij+NNy9oBj6Bv1+zA9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7818
X-purgate-ID: tlsNG-bad1c0/1794992244-BE6DA034-9E8E533F/10/78276251493
X-purgate-type: spam
X-purgate-size: 2760
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The decoder sign-extends the 32-bit immediate of the XOP0A insns
(BEXTR, LWPINS, LWPVAL), but this immediate is unsigned. It also
sign-extends the immediate of MOV B8+r without REX.W, while with REX.W
the low half is already zero-extended to build the 64-bit immediate.
In 64-bit mode MOV r32,imm32 zero-extends into the full register, and
no form of B8+r sign-extends its immediate. Emulation uses only the low
bits, so only x86_insn_immediate() returns a wrong value. No current
caller reads it for these insns.

Zero-extend the XOP0A immediate, as commit aa6070d2c840 ("x86emul:
Zero-extend unsigned 8-bit immediates when decoding") did for the 0F,
0F3A and XOP08 maps. For MOV B8+r, zero-extend the immediate for all
operand sizes, and keep only the fetch of the high half in the REX.W
path. Other insns' 16-bit immediates are left as they are for now.

Fixes: 653cae725cea ("x86/32on64: use generic instruction decoding for call gate emulation")
Requested-by: Jan Beulich <jbeulich@suse.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
This is the follow-up Jan asked for in his review of v3 of
"x86emul: Zero-extend unsigned 8-bit immediates when decoding":
https://lore.kernel.org/xen-devel/521ed475-45b0-4dfa-8b66-11d5f76a2a96@suse.com/

I left the 16-bit immediates of other insns as they are, because
changing the shared fetch would affect many insns.

 xen/arch/x86/x86_emulate/decode.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index 2bd2494272..96b3f3f6e2 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -683,9 +683,10 @@ decode_onebyte(struct x86_emulate_state *s,
         break;
 
     case 0xb8 ... 0xbf: /* mov imm{16,32,64},r{16,32,64} */
+        /* The immediate is zero-extended, not sign-extended. */
+        s->imm1 &= s->op_bytes == 2 ? 0xffff : 0xffffffffU;
         if ( s->op_bytes == 8 ) /* Fetch more bytes to obtain imm64. */
-            s->imm1 = ((uint32_t)s->imm1 |
-                       ((uint64_t)insn_fetch_type(uint32_t) << 32));
+            s->imm1 |= (uint64_t)insn_fetch_type(uint32_t) << 32;
         break;
 
     case 0xd4: /* aam */
@@ -1839,10 +1840,14 @@ int x86emul_decode(struct x86_emulate_state *s,
         s->simd_size = ext8f08_table[b].simd_size;
         break;
 
+    case ext_8f0a:
+        /* All immediates in this encoding space are unsigned ones. */
+        s->imm1 &= 0xffffffffU;
+        break;
+
     case ext_map5:
     case ext_map6:
     case ext_8f09:
-    case ext_8f0a:
         break;
 
     default:
-- 
2.49.0


