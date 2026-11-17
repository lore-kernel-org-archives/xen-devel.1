Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23FC606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 02:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=GHAbwsBR
Received: from list by lists.xenproject.org with outflank-mailman.1491847.1692546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT9H9-0001p5-SW; Tue, 17 Nov 2026 02:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491847.1692546; Tue, 17 Nov 2026 02:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT9H9-0001oy-Po; Tue, 17 Nov 2026 02:50:27 +0000
Received: by outflank-mailman (input) for mailman id 1491847;
 Tue, 17 Nov 2026 02:50:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xT9H8-0001os-Ef
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 02:50:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT9H7-00HAks-NC
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 03:50:25 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afbc0c9-e002-0a2a0a5209dd-0a2a450586f8-24
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:50:25 +0100
Received: from [52.101.57.19]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afbc0f0-4cb1-0a2a45050019-34653913eaaf-4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:50:25 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SN4PR03MB989478.namprd03.prod.outlook.com (2603:10b6:806:1ef::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 02:50:21 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 02:50:20 +0000
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
 b=aDWJ0lMAFsxwxIUHDT4GNxpVNWP71IoPDg/wjNlGmenxMZyrrQNw2V0ZexaApIUO/3/s2BK/kN3uyabTBklZ0cuykkkJ1FmyIvTdy/oFqlmBbLhDkTcFBBzBFp/Qy3reDxay7x+8shrThbBfD2qzyhuR9aPCtKAVJBI6ewE0KsI9LxDs1LMAPBcahlp/oqKSEjmlYji6bs7lK61m5jPJQhbGjilI2l30nOfmTNPxzsPt5r3D7pWc36RATT0OPwuEmI14Nr9lK4CyzvAsq4+sR/ijYx+Uvzgt+Rr+3LYHUVqT20eY9Sc0jWH82d66TZze1O+EvSE/WQVWATt/hbWKCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkaSQj4dpj4zm+aury9g4Oxk9SnMWdmYuS5AHcLrc+U=;
 b=yOx93KKnR81eNqjnX4bCNaQtri+vMcnhfGovqrusO13BYLnILmUj3/K/lrKP83mgIAfFVzWOOVSwIlSr4tWySh3fFF8WotkYuouXBUIj/Zpn9oR9sHuoiuQRPTjMHvbiZQQ5s+Bg7+Ig8k7UJTK5HDfZgfLUaPz4J4tFHQfYtw/jfgxC5t3Cik0smrMinTnAo7eX2YKYBvbWyNFDTnnu2KRmRXBfDG3/GC5asFavgb0PrExXX3Uw6UZkwBGE2kk1GffQaip/hxK4+CjT0vdA5sq1MNb5YudbkFfnLQSD13ChVnXlPpmwlC11ti1YL0ZoPkQ1Hdc0aXsGW1+0iYDMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkaSQj4dpj4zm+aury9g4Oxk9SnMWdmYuS5AHcLrc+U=;
 b=GHAbwsBRSVTwV50fBAsu4msLRhXkkOoBod+EQ5OOcAWWg6Hjk5Fne48xRWQFtYkcSxSTU8bYmMrfPvgZghsEKueyMd+gA3WWb0KLHQ35ZyWGzZRqYF5Sj6QFgNPf/MkiSfGTBGnzgTlLkVkLi7el6cpoFZ7Udhlg1RPNSc2Q+yU=
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
Subject: [PATCH v3] x86emul: Zero-extend unsigned 8-bit immediates when decoding
Date: Tue, 17 Nov 2026 10:50:10 +0800
Message-ID: <20261117025010.229327-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SN4PR03MB989478:EE_
X-MS-Office365-Filtering-Correlation-Id: 447a990b-f49d-4c50-afcf-08df44558509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|261028144727099003|261102123227099003|261021123027099003|261026121527099003|261022105027099003|261022075727099003|261021135927099003|261026140227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZxXDDZMsRVx0x7ciqIagfSA56pLBgJ0bYjoI9+/vbY5xmGjk7VF86k/YSuCUJx5kuIqTMUNs3uN0b55A7eLOb5X8IuY9y6jyqkVPycbQuEIm3T54iIhC+2xUUEXUKfPRuefB5CbD8sBc1MZfUqpz2DRBJf8hSxUqeDfm+fW0auAHarHxQ9Q7HZwp86990t+ertKb+OByTTSlh8ZGSXJAKKFXGhjNlPdYEIw1FJKFY4/7en92dJHTvkgxSCKOY/E2eoYnaaXEfftyFT3yntFgMIVsaz02euYG5J8HeEoLC85E8vigLt2KJLXHmnWCP61CRRGUVsfe0dZg6UuRcBWAvo+bNFrtDg3ghquCHdnFV3XQzzZgl/5RH9mbzW6bdln5NM7XtbatbvVlx0zfYjG8qK2rcvASdlc84biZVv63yIxsZBR6o1Qzt1yCB3ptUaJZp6HC45TJxpa+I+j3fcAb/veow7Cxr7LtY7C4ZgJEEMnrJUbbaiV6wd7T16a5qcJpfugQFkhBYuJuhUefgJEraFGMiYT+MTZM43kKJfRNOScJmIRpSM7kc+l5QdulIcZNcByRUeePQBDaFq3E0OG5Bar/H4z1SvxMjXcGI30/WpM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021123027099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021135927099003)(261026140227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mvbBq7/Fc6WMfMTNhV0LUkkUo3GQqTa1iQ8dS68LespY+KtucPIciBbOsJkc?=
 =?us-ascii?Q?dDb/h+5GjB5r1MmU09uZlcUWNtxR6RrNA5FjWFmQ0qwoS9RcLdwNory1k2+l?=
 =?us-ascii?Q?GW0ZHmKbNTpTsOZUOFSAvGJB9HS5Rj+hBmqaulLFD/D7QjCFRswh+1fsRtjt?=
 =?us-ascii?Q?1H6iMx7XS9BBmIAf/2pTxneaMi/OsumusWtA7wlHWwAoUpG8QMcdmrnRmq30?=
 =?us-ascii?Q?zUfAoOOngqRcw0rCS3e4Rv+PZrb105AYK9igTJWZunefy9BRLj9QlxHQWg06?=
 =?us-ascii?Q?v1XBFwML5bte1t8+ThzNOkDqfSufw675R15Qg5mBMge+GX4I+P4q4G8BIUPV?=
 =?us-ascii?Q?EMQdMCLh/76quUH8BZ6UcDTX/lnW2OCWHh4Xf4es+nTbVnZSR9sQ/svnIGye?=
 =?us-ascii?Q?83p/lnf3qOIwr879Y097nCkb+/wIUqpxDe5otsRFV9UjL5XUWKIGqTnFkkcL?=
 =?us-ascii?Q?WyjgdW2Ut1vPGJ9k+1Zha5RX8O9dmQdWSIxMX/gRksOJ0FqBUvfeQHnCsc2D?=
 =?us-ascii?Q?LLlRyXnkQLxk0/sqwDjui5SVVC5qGr3ukEdbrBqVTxhwzOWETSSCAM7btnkb?=
 =?us-ascii?Q?rpGpDDGyOytE1/7S7ZkjmNor1VbvMp1aGPQzBosk51iGUKzUKxQdXDGzBgFj?=
 =?us-ascii?Q?zE3tn5SN+TtipRbXnqpYnn6j9tVxeaV5OudeiH7QtZqs0CH1xG8H1LaoKvbJ?=
 =?us-ascii?Q?BofJfauEgQxPS/Tqr+cctvRZS0gooUsQ70HzHmMqrSFPQEsepKOkmAAHiB6q?=
 =?us-ascii?Q?OPpA25vsz+LKAsOwcIn1V3ojIM2SLPL3TteS6QYQJjnm30zKgheSbMWEVKhV?=
 =?us-ascii?Q?X55oH7vIgr7p9tgdlXR0rU9nXeY3M7t+8BXLDeJsiH/b5PDsJuIQTG1lICy8?=
 =?us-ascii?Q?R2KJzwhv4AzZl6iiJuZ+FzD7cZcWoAeXE9NOAK3xafM5Cp7/la4hrfN81MpS?=
 =?us-ascii?Q?yyuvqw1nWLiyE2eB44bLiDQAMoNssxVDpz6HcXtNV0PNrWQvUDY3ScSheuYu?=
 =?us-ascii?Q?WwzjIKHzYPCM65KrzbUFr54Hiyz08+N2n1A4ysStkgSByBDOavPqp6k7fabX?=
 =?us-ascii?Q?XCfz5bPUBpFk+msH5NhbnrDvC8Hjc3GpFaedhWCEm34LHQwME2EwXKWqVGZ2?=
 =?us-ascii?Q?slOVX6DBgfozsMI36a3IIIb82l2jjhQ4AtYwgVl+0JfTHwPCAOdNRjCz90j9?=
 =?us-ascii?Q?NLd5f0PbclS9jAQcXZuRXyJcyvYDMuCgTrCFyyu8XbGhI+TmOg1DIjdCv/UF?=
 =?us-ascii?Q?4uGaQ+IWrXsTxLLfMqiUhjFeBENw0nLazy6t+GoDcqWkrjR0d4svvWcr39UO?=
 =?us-ascii?Q?lrG8lOFB/4cLYH7fI//r6vt0MZxqy2Vq55ibkWmk6GhcJzCsVvvtf3zCoN0V?=
 =?us-ascii?Q?qO7EYWl4xWY1YpWm8uH13q3gZi3feLPaoOAcmLkUZJorajvEwKFAxQaS/UA7?=
 =?us-ascii?Q?a4vvbkAntNFsuzG2zt+KzR5w9NYBit7D0aOGFA9Sg7zjuxjB4twuk8wD6sWW?=
 =?us-ascii?Q?VJ5ysJQhDqv9TNd2Haebaq+gCjDw56+if3B7uJJcEZnRFi71QI3Mgk1dEvXA?=
 =?us-ascii?Q?QENwPDE3aiUviKkLJHSZFACQsekzdfNU0uCKgEKvGcSH8qdVkWij/MTEsSLw?=
 =?us-ascii?Q?lptEL2q7baWqxjch0xjDcuGnD5H58RG2zgHgvm2A0JVEvbRgWizu9lz/qXRM?=
 =?us-ascii?Q?mHr2uy5bal11KcIA7KmdJtI3POJ2hmeGTuhlxTvp/y4P8uEICs4cGBYhrzmY?=
 =?us-ascii?Q?s1JPwAQ6pw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447a990b-f49d-4c50-afcf-08df44558509
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 02:50:20.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMFR1WjmJ0L8tip/FQWgvWn5LpNbaXJb9bXtjY+BABnMi9XAXErqfYf0CZ5PdSDjuSw75j8c+cLDawiCdBDNWlL2HgVaQeFlg+aTNSMjz40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989478
X-purgate-ID: tlsNG-c201ff/1794883825-F78BE2A1-214ADE5F/0/0
X-purgate-type: clean
X-purgate-size: 5870
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The decoder sign-extends all 8-bit immediates. This is right for e.g.
Jcc rel8 and Grp1 (83), but some 8-bit immediates are unsigned: the
vector of INT, the port of IN/OUT, the base of AAM/AAD, the count of
the Grp2 shifts (C0, C1), and the 8-bit immediates in the 0F, 0F3A and
XOP08 maps. For these, s->imm1 holds a wrong value for 0x80 and above.
x86_insn_immediate() can return this value too.

The worst case is INT $0x80 to INT $0xff, which puts a negative vector
into the event (e.g. -128 for 0x80). hvm_inject_event() then fails its
"vector == event->vector" assertion, and a debug Xen panics. An HVM
guest can trigger this with the forced emulation prefix (hvm_fep).

Zero-extend these immediates in the decoder. At the IN/OUT and AAM/AAD
use sites, replace the (uint8_t) casts, which are not needed any more,
with ASSERT()s.

Fixes: 653cae725cea ("x86/32on64: use generic instruction decoding for call gate emulation")
Fixes: 52053d5fc2f9 ("x86/emul: Drop swint_emulate infrastructure")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
v3:
 - Move the new case block down, to keep the case blocks sorted (Jan).
 - Add a comment for the 0F, 0F3A and XOP08 maps (Jan).
 - Use "&= 0xff" instead of casts (Jan).
 - Add ASSERT()s at the IN/OUT and AAM/AAD use sites (Jan).

v2:
 - Fix this in the decoder instead of at the INT use site, and also cover
   the IN/OUT, AAM/AAD and C0/C1 immediates, plus the 0F, 0F3A and XOP08
   maps (Jan).
 - Drop the (uint8_t) casts at the IN/OUT and AAM/AAD use sites (Jan).
 - Add a Fixes: tag for the commit that added x86_insn_immediate() (Jan).
 - Drop Ross's R-b (patch changed a lot).

v2: https://lore.kernel.org/xen-devel/20261116012748.4872-1-stephen.cheng@citrix.com/
v1: https://lore.kernel.org/xen-devel/20261112072303.86955-1-stephen.cheng@citrix.com/

 xen/arch/x86/x86_emulate/decode.c      | 20 ++++++++++++++++++--
 xen/arch/x86/x86_emulate/private.h     |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c |  6 ++++--
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index c4b18718f8..07ff44b601 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -650,8 +650,6 @@ decode_onebyte(struct x86_emulate_state *s,
     case 0xc4: /* les */
     case 0xc5: /* lds */
     case 0xce: /* into */
-    case 0xd4: /* aam */
-    case 0xd5: /* aad */
     case 0xd6: /* salc / udb */
         s->not_64bit = true;
         break;
@@ -690,6 +688,17 @@ decode_onebyte(struct x86_emulate_state *s,
                        ((uint64_t)insn_fetch_type(uint32_t) << 32));
         break;
 
+    case 0xd4: /* aam */
+    case 0xd5: /* aad */
+        s->not_64bit = true;
+        fallthrough;
+    case 0xc0: case 0xc1: /* Grp2 */
+    case 0xcd: /* int imm8 */
+    case 0xe4 ... 0xe7: /* in/out imm8 */
+        /* The 8-bit immediate is unsigned. */
+        s->imm1 &= 0xff;
+        break;
+
     case 0xc8: /* enter imm16,imm8 */
         s->imm2 = insn_fetch_type(uint8_t);
         break;
@@ -1796,6 +1805,9 @@ int x86emul_decode(struct x86_emulate_state *s,
         break;
 
     case ext_0f:
+        /* All immediates in this encoding space are unsigned ones. */
+        if ( (d & SrcMask) == SrcImmByte )
+            s->imm1 &= 0xff;
         rc = decode_twobyte(s, ctxt, ops);
         break;
 
@@ -1804,6 +1816,8 @@ int x86emul_decode(struct x86_emulate_state *s,
         break;
 
     case ext_0f3a:
+        /* All immediates in this encoding space are unsigned ones. */
+        s->imm1 &= 0xff;
         d = ext0f3a_table[b].to_mem ? DstMem | SrcReg : DstReg | SrcMem;
         if ( ext0f3a_table[b].two_op )
             d |= TwoOp;
@@ -1814,6 +1828,8 @@ int x86emul_decode(struct x86_emulate_state *s,
         break;
 
     case ext_8f08:
+        /* All immediates in this encoding space are unsigned ones. */
+        s->imm1 &= 0xff;
         d = DstReg | SrcMem;
         if ( ext8f08_table[b].two_op )
             d |= TwoOp;
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 7892b5603b..b2997b20cd 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -62,7 +62,7 @@ void BUG(void);
 #define SrcMem      (2<<3) /* Memory operand. */
 #define SrcMem16    (3<<3) /* Memory operand (16-bit). */
 #define SrcImm      (4<<3) /* Immediate operand. */
-#define SrcImmByte  (5<<3) /* 8-bit sign-extended immediate operand. */
+#define SrcImmByte  (5<<3) /* 8-bit immediate operand. */
 #define SrcImm16    (6<<3) /* 16-bit zero-extended immediate operand. */
 #define SrcMask     (7<<3)
 /* Generic ModRM decode. */
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index f168f3ebcf..4ad3e556a0 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2505,7 +2505,8 @@ x86_emulate(
 
     case 0xd4: /* aam */
     case 0xd5: /* aad */
-        n = (uint8_t)src.val;
+        ASSERT(src.val <= 0xff);
+        n = src.val;
         if ( b & 0x01 )
             _regs.ax = (uint8_t)(_regs.al + (_regs.ah * n));
         else
@@ -2561,8 +2562,9 @@ x86_emulate(
     case 0xed: /* in %dx,%eax */
     case 0xee: /* out %al,%dx */
     case 0xef: /* out %eax,%dx */ {
-        unsigned int port = ((b < 0xe8) ? (uint8_t)src.val : _regs.dx);
+        unsigned int port = ((b < 0xe8) ? src.val : _regs.dx);
 
+        ASSERT(b >= 0xe8 || src.val <= 0xff);
         op_bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
         if ( (rc = ioport_access_check(port, op_bytes, ctxt, ops)) != 0 )
             goto done;
-- 
2.49.0


