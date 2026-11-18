Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DE606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=EdSSSvKx
Received: from list by lists.xenproject.org with outflank-mailman.1494109.1693777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbxl-0000F8-NL; Wed, 18 Nov 2026 09:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494109.1693777; Wed, 18 Nov 2026 09:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbxl-0000F1-K6; Wed, 18 Nov 2026 09:28:21 +0000
Received: by outflank-mailman (input) for mailman id 1494109;
 Wed, 18 Nov 2026 09:28:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTbxk-0000Ev-D7
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:28:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbxj-002p1S-PW
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:28:19 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afd6fb1-e002-0a2a0a5209dd-0a2a45018474-14
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:28:19 +0100
Received: from [52.101.57.38]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afd6fb2-5bcc-0a2a45010019-346539261ea1-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:28:19 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by DS3PR03MB989145.namprd03.prod.outlook.com (2603:10b6:8:39b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 09:28:16 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 09:28:16 +0000
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
 b=BqeM7XEDWQTzLTl/H5gmDs604jjLu+ExWUE3bozO+2NBdDVX4Gzee/QXq1UtRHoYsq8HTRl6V/GTVpL7dKzzGpsdfUXYh4Fd9P1vUJoY1F/lCkjEA8LKI6u/K83BZ8RfRQ92RU0JDYcemf5qk2xMBqVPbO5PYULNGtyxakWMezjctUaoBGrh4/ZI5LPtyCJnHfE659beqLQ/ywPUOB3a0hXGkv7SZA5IQelzx5aUZu8ULIbIB3YAogAgyPzsaqxKESNLwZqCghbhrYe2GCuRPalub3B26nh+bGMeBoEPQeqihPYp3ljMvCcm140R/lxclb1II+Tc4lWj8JFCY6QXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSf2Uvz5wcfplAARzuN3QqmviTq27gMBishNDsstmDk=;
 b=g0+6g1Zp+PiQKJBCjqpazwprrXkZGzBzbaUzerXHJ64+Ba0SGJfAKR1xZYcl45tZIHQgrg7q6NZNIo8Y+hiDw8i6Rsn49znDrTHz8lbMN9rSV42c4mlz4JhXCApbb6nV8+2fbSJiK72eGY4mxgIRXrYsEkieZXZD/BSPIwOkPxeFLCcWHLuH8WMce+On9iFP6gtT/Ck/iw9W9e9wjYgkZhcJ3VFhKJFmipIMFqw7AZVoC1J/83vQdq3YcYoi+FbqcafhBdhZeK/Ubrl+FornVtUrYbGxGg5GAP5YPQNbEgDjiIUD2beUrhdcCNtsHOR7TvxfMClbThGMZb2ndDWRHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSf2Uvz5wcfplAARzuN3QqmviTq27gMBishNDsstmDk=;
 b=EdSSSvKx6IQbeym1d/4mTIktveXCNnE6GI3n1+gYsqdK2V9z6Ftgz8O4WelYgIZ6RXpItOSuIXQTSkt8NpRnH+btZZm1gCgcJiUdQBv+tp0hh0yDo9sB68HkLmp5awqXNSuzlIXhxQ+fGdlrA9GPW87hNGA3ikbuAxfxWQylsu0=
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
Subject: [PATCH v2] x86emul: Zero-extend the XOP0A and MOV B8+r immediates when decoding
Date: Wed, 18 Nov 2026 17:28:07 +0800
Message-ID: <20261118092807.571241-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|DS3PR03MB989145:EE_
X-MS-Office365-Filtering-Correlation-Id: 62356f9b-45c7-44bd-5b30-08df4556469e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|261102123227099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZLX7Bkxt+L46Ujc7Tj2i/Ppx1Y0a486ih/mayZv5mOEE1u4GU1akje9UiyUkjsW3Ygfelf0MXROULjDK3KtafJvF7mvO4JD6mILXFhBjkkleo/YsHg/mqONpwzJmskRCHC1V0qyEhRBRvJ5G47Pwe43E8w8KlgTOBT3IE1SdiZjuuKHpda+jCh1LtfqL41wog84pNDG8VFTfz8emAlp1G5r83kt7thgeKfz6Ktfp1J02UJHcmVwwlztMKWVMPtFfbLpRRutjVHweRJRctfAQ2+LdlCUVBiC7OwtUpUsCuAquncHJKmSX/vK9DZL34EhzVVnYHHsG3hJzn6cixEIB97gvcyQYBqMFuufVDl41Ehf9Cf1M9o4UMZlx7DNatVzusMcXBAmh5DRPG4imm6t2pkSXzJWoV/mPeHR2rvqXxDjPqQZMhJ3tzuxwCQlr9Rr6gExoJdLnUYobpLdmNhI1/J1ZweSd7LFp9h0DZ2jML4sZCxUiR5I7Zb+94ZUzIhQ9/eP+V+YFWmXXRnP3icnYAjB4Nf+tcpL660/aDKpQCIq1Ev+/pZGCVr495q2gX4g++L9CsaCMTVSL2vxXCyxnA65hGRY324ORra386lq/YrBHFXOdLwFZ4pEcrrEsoTML
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?22h7beZjk2borqjkY+kPaiZi8fI53+6rXBZ4BD5uBb8f0hY91U9O0XWf7rQZ?=
 =?us-ascii?Q?3xuXnr79k5sZvO4p7GSrgnx9Gkmy7BGNgiXrjGAmAOJRiN9RYVp6SGjohUeq?=
 =?us-ascii?Q?Z5YGkErgSyuBxECY2Sf8oyPeY404YdYU2mbAaAvfDhRXsc1am0dTrqj4VVEZ?=
 =?us-ascii?Q?B0QEm0ENkqrrXnBCpMgQBwOMMxTc7k19uB+xuBvmi6iHBxGIbmyrhyWMgvay?=
 =?us-ascii?Q?RcMSWx7dpfub0rIHxXwFASEhPWYStkcV/4B1dxRp58bmD/mQutLOVkaByGBw?=
 =?us-ascii?Q?nNFhEoZh2cpX4nDlwpsDU6PwbnGSG1QchwY9OmAJC+1PO+ud4fhq2gQ1stVz?=
 =?us-ascii?Q?jcRWFPIS0luE9goUvapHzeRyFjNJjP3WyXQOPcV+IKijLyrLKJOmSOtfgTQ+?=
 =?us-ascii?Q?ge8Fedff12r429oxzI60wFsl6QwmrgWi0XtnZ6/ZlIdSJv0xUuLFUwKYlxPi?=
 =?us-ascii?Q?psj+dItWbLYkouuu+PORClRe/NWm5XWWMrVoVwW2URC8mCmFS0Dw3/4/imSy?=
 =?us-ascii?Q?XvWo6MCjxkwQ47FIjhnP74r01X8Ty+Ge3nyoiJe0YcW949bNAo2XchMa5qyN?=
 =?us-ascii?Q?oqDi1vxArw7cpkvCvaiICBkIzMsSd0rO/SToGTPgE9BxJHCr7qFsXmoSC/NM?=
 =?us-ascii?Q?8IqnnJgpitLRnGvWNcXncJ2hSaTDMv0wbjSo1n4p247ktBS3pUgzvPoyvHE5?=
 =?us-ascii?Q?M4cIrfJiTOQ816piH05KjNeEI+5KUfVG2qhIFUXGuOUL+9LXSowefgkq1oQt?=
 =?us-ascii?Q?iq0VXWu8Mu0Q9ii/0sqsk2O/F0WHJ8iPcwLWnGk+jEN8qa/yahQNAdW8j9vr?=
 =?us-ascii?Q?gjoKxd7Hy55w+JyOAhMtMJsyQm2/LAejP5xTlzooC/CO76cb1e7gmiMUTFXh?=
 =?us-ascii?Q?5PY8drMaw+piPDS/w41IHasjFqFspmGdf7YWhCcSgsK8Nd8Oh61Ch9zlDVib?=
 =?us-ascii?Q?g7Oh7RWhcwZYFB4RlDtdC6eU0wctKPXV3kMpsGkZnHfuGyR3FydC+vIaRxFL?=
 =?us-ascii?Q?zFw0mcwUqf1KW/2k92gl13LwA3uHlsXTB+UTRDfOSC0TWe7rKNYjW7U12+X3?=
 =?us-ascii?Q?5/pagdMrUeP2Q6PdJHcyF8DqQ+RJ3k+iy11yWuUhY4AKtTSJzEixZS0X6EoH?=
 =?us-ascii?Q?zgxbwJpfCuwNDG/gh+4QY2NbWiyUQznkZIP+l0iiABFM7H+K5z5n/B9UFmUb?=
 =?us-ascii?Q?1Byv4TDREMP/qm4gH5feDnfQnP92/o0sqSJq64DggGaOpoCVnE5oceEDcUVD?=
 =?us-ascii?Q?0q/g13q4aDwviSR9stGZchCm69H2eXzFkNxeFJ9Rpa4ZhS/BD3T4yQRFOyV5?=
 =?us-ascii?Q?o17C6mwQlvo4ocVpp2/Amna0jOoZimNBtWuX+CSHvLkB3HufCh6SHjcmTncf?=
 =?us-ascii?Q?SGuI1fWbYc3h4l4jYSB+iZZfsrkCjLQ3zgsAg0Hst+sksCVaa8SFZyegxQPX?=
 =?us-ascii?Q?os6amWnp0R5ubtd2dFbOZmm5pppAG+n7v0EvEoifmadUgXrk9qr6qdcuyZ7o?=
 =?us-ascii?Q?6+gWxGb1rzoqgRnUFurgOx5C1GwoLxyMnm76Irmt6P/jpEHjTfhG9eFwT0Ou?=
 =?us-ascii?Q?hz59hVlC1b5IZqbGoPSwgbSFSQ/eGkTaBz+hxDKOuMWm++G8xWRFysK2YbaQ?=
 =?us-ascii?Q?9k3kOSohDVD+ZC1RoDsHcCsWyyNOcFbnXlUud0n8Qwu95rfxE9T6FaHTflmL?=
 =?us-ascii?Q?3/gEsed/2MUV7s+lSCsdvkCMPLoxYEgVWBuPtxGzjeLfPUse1ZpT1YJikb6O?=
 =?us-ascii?Q?HkjnHhxQmQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62356f9b-45c7-44bd-5b30-08df4556469e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:28:16.7044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjVm4Y45kAi26/z0Oa4pf7BcSwdbeApJDfdtAKFjUtiuJw+rU8MKAeZiNymLFElBb+YknEmjhUUDO6c+Zx3tkEOusZFyZUBHbHryO6v71KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989145
X-purgate-ID: tlsNG-d62444/1794994099-4D3525FD-DC3070B1/10/78276251493
X-purgate-type: spam
X-purgate-size: 2752
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The decoder sign-extends the 32-bit immediate of the XOP0A insns
(BEXTR, LWPINS, LWPVAL), but this immediate is unsigned. It also
sign-extends the 32-bit immediate of MOV B8+r without REX.W, while with
REX.W the low half is already zero-extended to build the 64-bit
immediate. In 64-bit mode MOV r32,imm32 zero-extends into the full
register. Emulation uses only the low bits, so only
x86_insn_immediate() returns a wrong value. No current caller reads it
for these insns.

Zero-extend the XOP0A immediate, as commit aa6070d2c840 ("x86emul:
Zero-extend unsigned 8-bit immediates when decoding") did for the 0F,
0F3A and XOP08 maps. For MOV B8+r, zero-extend the 32-bit immediate,
and keep only the fetch of the high half in the REX.W path. The 16-bit
form is left alone, like the 8-bit form (B0+r) and other insns' 16-bit
immediates.

Fixes: 653cae725cea ("x86/32on64: use generic instruction decoding for call gate emulation")
Requested-by: Jan Beulich <jbeulich@suse.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
 - Leave the 16-bit form of MOV B8+r alone, to be consistent with the
   8-bit form (B0+r) (Jan).
 - Keep Jan's R-b, as this is the option he preferred.

v1: https://lore.kernel.org/xen-devel/20261118085711.564158-1-stephen.cheng@citrix.com/

 xen/arch/x86/x86_emulate/decode.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index 2bd2494272..d3a102df8c 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -683,9 +683,12 @@ decode_onebyte(struct x86_emulate_state *s,
         break;
 
     case 0xb8 ... 0xbf: /* mov imm{16,32,64},r{16,32,64} */
+        if ( s->op_bytes == 2 )
+            break;
+        /* Like the 32-bit register write, the immediate is zero-extended. */
+        s->imm1 &= 0xffffffffU;
         if ( s->op_bytes == 8 ) /* Fetch more bytes to obtain imm64. */
-            s->imm1 = ((uint32_t)s->imm1 |
-                       ((uint64_t)insn_fetch_type(uint32_t) << 32));
+            s->imm1 |= (uint64_t)insn_fetch_type(uint32_t) << 32;
         break;
 
     case 0xd4: /* aam */
@@ -1839,10 +1842,14 @@ int x86emul_decode(struct x86_emulate_state *s,
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


