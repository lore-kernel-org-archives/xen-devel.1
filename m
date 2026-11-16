Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4107606A321
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=SiEC9ENM
Received: from list by lists.xenproject.org with outflank-mailman.1490143.1691089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSlXr-0005Fm-EC; Mon, 16 Nov 2026 01:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490143.1691089; Mon, 16 Nov 2026 01:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSlXr-0005F6-99; Mon, 16 Nov 2026 01:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1490143;
 Mon, 16 Nov 2026 01:30:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xSlXq-00053X-4Q
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 01:30:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSlXo-0060gf-Rn
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 02:30:04 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afa5c69-bab6-0a2a0a5309dd-0a2a4506c9fe-40
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 02:30:04 +0100
Received: from [52.101.85.27]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afa5c9a-195a-0a2a45060019-3465551b1d39-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 02:30:04 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by PH7PR03MB7194.namprd03.prod.outlook.com (2603:10b6:510:246::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 01:27:58 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 01:27:58 +0000
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
 b=j0RDMP+4sP9x0ymItBjGPK6qwEfzWiVpBlM7656pd8zHtme0pGNnhNtUDabKZASYJghuK+5AbGLUbB40xogpyVC8DuQpgXSggCg30XuU6qwuHcrQFdXmR4/e9r7AH6wfGrNgRYkZU26PbbmsPhTSGBTsO1394+THTqNCYupypUskyypOaCEXe+9JKIaYrPGV20fpqnJ3YkGRir3QRXM203Iwzu9X3ZxnVshF3iPBH/KpxPcbwk7n0NZ8qkGkmd6WwtwX62CakOuMRzrc59AKfh2ogxkkyTDI0NfzA8HxDDGccr3+IvVd3ooiwpPZh84PmaRJ5vEJfRimSsnh10sodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb7wh6Q9/ERirblZ6aiEJ4Zf0zmrSV1CngOKyS5TOoM=;
 b=BTIMQLKlO3/Bni55yg/2lfTbH0dz5+/MKWyLDCLBoK/hRUYHxF1q1tFHdr3b+iSQ8X87h3yD8GV1Zek7LCkOqdbJy6vodnUpQvFoYSybx2m35mtq4NoGLlDEyMglz3rcdY8SwY1sXsKWaQoUBaREhnuA19ygJlzcbI9w+V37ygfvZX4p9svToVGCQ4gq0Y5oylurZGtzW1UEHMtGSMFjzlRKNTfYFr+qKtvuO2o6zsgVxjnQK3ivrFQMMgR1HZhxilH5HbnZwOdDURiqQtCIgs1DoUyi9Y12hpdv3Y9yGnuii15QTnZwOh5uPPos+IrQMMH/JCwr+9H4BK0NviCXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb7wh6Q9/ERirblZ6aiEJ4Zf0zmrSV1CngOKyS5TOoM=;
 b=SiEC9ENMqwmlO2LZfgt2m4f82LLSNyrFINKt7r7mDlsKS8jSFO2xic+MFB0fffi2NMgVwksAlKVMiMRX6t9/J0aiqk5SrL1mbvztnTReQK6MKKPf5zc+E38BSGNRjefUp06oVQpESIlxlP13PNT0uhIy+jWc1veti23wQpn16F8=
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
Subject: [PATCH v2] x86emul: Zero-extend unsigned 8-bit immediates when decoding
Date: Mon, 16 Nov 2026 09:27:48 +0800
Message-ID: <20261116012748.4872-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|PH7PR03MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 08affea3-d1e9-4a56-5b25-08df4380d8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gxym+fdqRqi4dDegarVpm/oOrYvwXE5AGS5iwB1087NWlM9YvI6uGaMxjnB4FgAAS3hr30PjBjVBr+3zB1PwnDUxutoT+S+uBLgmtIaFF9d500abeJ7dpQIVYyYAyq8YytpCn2lkF3DonIAwy+MtbbMPbgahZvctFeIVpAjkz1orPUP4NCJ7zHQNzFYk5hci5h5lWeNNOO+tanWmih/JYY7a7MeFQf/wloxrNAhxNMyvI8x1QI1+mGGlvFqEQVWs7O76Uy0V8d0rA7wphxZENjgA3BSELU+Ta7TGlufECfJO+XFdkH6zH5PqzxmL00gvJK6gjARi3sJ81iDzhlZp5ydfQg1TZQa/CvlkSuG32p+xIkAGjX8u5B0Ef5WxKoK1pjenzqvjmDIL4JdGDJK1Kstwy6pFVRTs3kDzZhHAWH8IKgOxDVp5MyeCiV6JBvWdjfQqHCiIajxR++vmJsoDmt22HMZtRFk7sLwAqwBWZxrNvlIggmD0LR5TSt8HAgX8HgM5RW8wo1RhfBtd4u8flVgmhpAnxvZ5iOIsT7ttmkUNp7kVE1pKMkGyaqN7MO43GdsVBqI//RMiUnujN9sKgODcmRL7+VZUlt5UxFf8LQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mg9TPyGoWrfRblvJgrvWJmdwe/uIHC1xW1BbeuNFyi/tucV2ncZaBt32qCNU?=
 =?us-ascii?Q?IZeAHl9C0jtZc5p31kTLI5cJMUAqUNyYfqwdqKTIrPU3lYnDyCVGpCPsDlFl?=
 =?us-ascii?Q?CPHpDJ3oAi+1rnTF5833z5Qtu8T8D0QK22XUQ7S3CYKVbyATmUiNun4YSWSK?=
 =?us-ascii?Q?WdV/KbxVD9OiwAhWtOHjee5MPNV9bgV/iVKjPUqvpmz2fzfXfKXig7nUgaJs?=
 =?us-ascii?Q?cr/wskFdENdfwn7ypuSqt4ygPtmYCjjYoDzzf0KuQ3uwo7FMHcAnitwCkru2?=
 =?us-ascii?Q?S5fKoItuidlnj6s+W2m5KnLQgYqIpz8kEcRBB4TZXdvvmhDKN8GDsWFZU/xU?=
 =?us-ascii?Q?lHwjwvRFxAR2cPHI8whY72nxR0XOkHMCJVEBbnbtt5xQPu/Y/nlYJim2FXhh?=
 =?us-ascii?Q?VffevSBagoTKlmntXPL0Bhjaixc/nOVLu9RD3CjdPtzB78loyhFZABgD6X5a?=
 =?us-ascii?Q?081r3OUD9WeuCFFi1+WF2+cMoSuldlb0RNOxIku3X9KteXaDjt3w1mMa5J/X?=
 =?us-ascii?Q?m1pMWxfJiFAx5AqmCpSAhjMHnFLJM4NHG1GOUMUucLu3RzM4FuSoZyvcO24T?=
 =?us-ascii?Q?CLPFJRx+LtIDLLO3jATIlYXuuP+wsRY1DBqecP9RWUBzgI8MYTfczTYKEanm?=
 =?us-ascii?Q?L0hqQdNkZdQMq16ZMz2uD3QYu5yTSlL+VqhZYVQVAF6Z1pJUtn9CYfsEB9dB?=
 =?us-ascii?Q?8sKqQu95+Kgq0PZLJM87keWhrcBgHBgYTX+c+PqfeF5veZo1D9OnTX4HzaGR?=
 =?us-ascii?Q?6Q6UHsgJbd65piIddk4lZOFCs0Qrlyqy5qXAz3cI3aYQVLrQolAXCx/yu0PW?=
 =?us-ascii?Q?AfQ4yOaV796RhoyCKvRAHLa5HZEbiVz6kOgUDhvZin889rjYIxz/mBu+g5US?=
 =?us-ascii?Q?sC1vm+e6q6ZJbVS2QO0bclhRQ7+fmi0SQOyw2oUXB8d2RDGQzIxZBM3bL4CF?=
 =?us-ascii?Q?VSApTs7t+glyZSlEKLO0iayvVaprJIlEKNsoCTITDqWrWHaFz+1ybnQLtxcF?=
 =?us-ascii?Q?TGqMVJu/AGSf510fkEOtBIMeMDhXJRW6jK4u77k4+AU1ncaBqm0vkoms4DEM?=
 =?us-ascii?Q?A4gI1a4XtPJCXUjo7mn0LpDyyRi9repBcOvrNKUMrwNc2tjG4pAFDP4bhrNR?=
 =?us-ascii?Q?uWDn0NZRtS3x/e8IGSJzppDcoHJ4kPwHjlZ+vhyTzJrOxe5lYSADRvz4Whbd?=
 =?us-ascii?Q?ZVQrb21Hu9XrV7KgXp4zm0B0gsEQLWzpyQ7ViBCke/QrQDb/ltQIl5HOGrlA?=
 =?us-ascii?Q?8nl4VbO4ZE5G9ymQwhgzXcfn34zV1c7V6IkbOor7YuzaVfnKHpUwX6wuxls/?=
 =?us-ascii?Q?HuzRhPlU0YzpUexqyEOusKjI+S/bJt5/E1E9YCltaLmX7j9f+GLpu89lB4lx?=
 =?us-ascii?Q?2SnOR7xNlnMP01Wtz21+cRGwederUmdHyH3xuFRsodg+sQiFIMu22vwcbcch?=
 =?us-ascii?Q?miokq63qJlPd8eJxTmftFc5uoiFuVI8uzmaWxsiWCE2ri/NLTsQlR7/glDok?=
 =?us-ascii?Q?gbgrDQzSCHBn5f8zn/XQJdot6I5+8oasoFDSm7k/j9OpCbVf48pYEA7GZn90?=
 =?us-ascii?Q?dQooL8EEqGIgMedSBlCAOAGhBnVlTTWfxDdBvTdkii+Tnqdtdu0zYR7WTj+E?=
 =?us-ascii?Q?EPOUaaCLt4sqV5wataKAY9PqDndgYANKnXXkP8nuHFxURww2WLotrTkVlAAY?=
 =?us-ascii?Q?t8NOIKfEurV8kKpDWbrozK0bgaF6LreHER74jjZ208UlVunfUETFsQhDpVTf?=
 =?us-ascii?Q?bFYQkNqmaA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08affea3-d1e9-4a56-5b25-08df4380d8dd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 01:27:58.5893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEvaqLq7pObdKvkEJu3bNIZU+66nzfA3WIlm7vtTQoSPsAWE77c03/zDuEJIwuZt/2g5j5WEciDrKX7tOntS8f+gFqhun48shof1zQX2q94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7194
X-purgate-ID: tlsNG-16d1c6/1794792604-F607177B-DB5082EE/0/0
X-purgate-type: clean
X-purgate-size: 5665
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

Zero-extend these immediates in the decoder, and drop the (uint8_t)
casts at the IN/OUT and AAM/AAD use sites, which are not needed any
more.

Fixes: 653cae725cea ("x86/32on64: use generic instruction decoding for call gate emulation")
Fixes: 52053d5fc2f9 ("x86/emul: Drop swint_emulate infrastructure")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
v2:
 - Fix this in the decoder instead of at the INT use site, and also cover
   the IN/OUT, AAM/AAD and C0/C1 immediates, plus the 0F, 0F3A and XOP08
   maps (Jan).
 - Drop the (uint8_t) casts at the IN/OUT and AAM/AAD use sites (Jan).
 - Add a Fixes: tag for the commit that added x86_insn_immediate() (Jan).
 - Drop Ross's R-b (patch changed a lot).

v1: https://lore.kernel.org/xen-devel/20261112072303.86955-1-stephen.cheng@citrix.com/

Note: While fixing this bug, I found a separate, older one. BT{,S,R,C}
with an imm8 bit offset and a memory operand move the memory address by
the immediate. The CPU doesn't do this: it uses the immediate modulo the
operand size, at the same address. See Intel SDM (325462-092US, June
2026) Vol 2A, section 3.1.1.9 "Operation Section", Table 3-2 "Range of
Bit Positions Specified by Bit Offset Operands", and "BT-Bit Test".
So any immediate >= 32 (for 32-bit operands) accesses the wrong memory.
E.g. with FEP, btsl $0xff,(%rdi) sets a bit at rdi-4 before this patch
and at rdi+28 after it, but the CPU uses rdi. I'll send a separate fix
for this.

 xen/arch/x86/x86_emulate/decode.c      | 15 ++++++++++++++-
 xen/arch/x86/x86_emulate/private.h     |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c |  4 ++--
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index c4b18718f8..a8129de672 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -650,10 +650,19 @@ decode_onebyte(struct x86_emulate_state *s,
     case 0xc4: /* les */
     case 0xc5: /* lds */
     case 0xce: /* into */
+    case 0xd6: /* salc / udb */
+        s->not_64bit = true;
+        break;
+
     case 0xd4: /* aam */
     case 0xd5: /* aad */
-    case 0xd6: /* salc / udb */
         s->not_64bit = true;
+        fallthrough;
+    case 0xc0: case 0xc1: /* Grp2 */
+    case 0xcd: /* int imm8 */
+    case 0xe4 ... 0xe7: /* in/out imm8 */
+        /* The 8-bit immediate is unsigned. */
+        s->imm1 = (uint8_t)s->imm1;
         break;
 
     case 0x82: /* Grp1 (x86/32 only) */
@@ -1796,6 +1805,8 @@ int x86emul_decode(struct x86_emulate_state *s,
         break;
 
     case ext_0f:
+        if ( (d & SrcMask) == SrcImmByte )
+            s->imm1 = (uint8_t)s->imm1;
         rc = decode_twobyte(s, ctxt, ops);
         break;
 
@@ -1804,6 +1815,7 @@ int x86emul_decode(struct x86_emulate_state *s,
         break;
 
     case ext_0f3a:
+        s->imm1 = (uint8_t)s->imm1;
         d = ext0f3a_table[b].to_mem ? DstMem | SrcReg : DstReg | SrcMem;
         if ( ext0f3a_table[b].two_op )
             d |= TwoOp;
@@ -1814,6 +1826,7 @@ int x86emul_decode(struct x86_emulate_state *s,
         break;
 
     case ext_8f08:
+        s->imm1 = (uint8_t)s->imm1;
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
index f168f3ebcf..da7e9753ce 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2505,7 +2505,7 @@ x86_emulate(
 
     case 0xd4: /* aam */
     case 0xd5: /* aad */
-        n = (uint8_t)src.val;
+        n = src.val;
         if ( b & 0x01 )
             _regs.ax = (uint8_t)(_regs.al + (_regs.ah * n));
         else
@@ -2561,7 +2561,7 @@ x86_emulate(
     case 0xed: /* in %dx,%eax */
     case 0xee: /* out %al,%dx */
     case 0xef: /* out %eax,%dx */ {
-        unsigned int port = ((b < 0xe8) ? (uint8_t)src.val : _regs.dx);
+        unsigned int port = ((b < 0xe8) ? src.val : _regs.dx);
 
         op_bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
         if ( (rc = ioport_access_check(port, op_bytes, ctxt, ops)) != 0 )
-- 
2.49.0


