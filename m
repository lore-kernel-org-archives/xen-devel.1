Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D18606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=roLZ4WAz
Received: from list by lists.xenproject.org with outflank-mailman.1485379.1688608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRbz-0006dA-DI; Thu, 12 Nov 2026 10:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485379.1688608; Thu, 12 Nov 2026 10:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRbz-0006d0-8o; Thu, 12 Nov 2026 10:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1485379;
 Thu, 12 Nov 2026 10:00:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xRRbw-0006Q6-Ve
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:00:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRbw-00CHfV-5D
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:00:52 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e50-bab6-0a2a0a5309dd-0a2a45059f7e-10
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:51 +0100
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e51-4cb1-0a2a45050019-3465c10b4789-4
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:51 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:00:33 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 10:00:33 +0000
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
 b=iV5kC9f2T+MrTunGO70z0fV7ViXXche+qNqyrwXdjqaAM13FUsNPRQLJsYFIruvQB4yHcST0RxkWscxrseWKmtyVuUzhXmyR0aPw8TDMP+9FXAICX7/G6tNQTRqOc6IiHaAeI6mRe/zj6iJ1wbgXJswYBwOePRo4GT5mBcfP6eVuq1qsXdT8DbpBbN9e6sJde1zWEhi4zF59XXbT63CFkv0Ze0xPRzeEDrZvlZYGsPw8+4RCQtwGQo0ShbCTO3LFg8v/pgdmy370a2JC3g3WagYE4XLk9zyKIk28BvxfxBk1b2P3Ien6jJ4ER7ro2YXooHnBCFBi8cQ4PMZti9p5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S66wwwp4ap53d+j/uyt8mVRWhE2lyyRi0+OY4QmA5JI=;
 b=vns7cNEESKKeHRpQIXydSz9MSHODf67fuFS/vWMtqBkiY7cUrinnl1K5DNKUKUEudHRqRZ4ovRjw6pIyVtP96P+cn302L4yV2fpE4izwRG+ld20H9AAO0tky6qv1DErRVsq4wDSPU9lSb8T3vcDYg7L4DNSUt6hjODmRwXLxmEmScwpq3P2C2EzRAwVuvG3UHkGFFJn6Q0I31ZiMv4KYMcSSxly+MhzBiPUzEKxR3DyoA+lv4rcMzAidft8k8GFBS5RdxVFiUQ7gnWvNd9txiG/SUnGYVvszg+tvSBY5XviXfQFkcESlDM8iKaP53Z7RaxFEBIfyX9Mjt02h+D0zKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S66wwwp4ap53d+j/uyt8mVRWhE2lyyRi0+OY4QmA5JI=;
 b=roLZ4WAzXeW6qrvRw8oQBGKckbUvHbRbXMNx/jArGKBxyHbHAYjSGrUuSG0vTLV7mMBjYSpwU3Fz12gDokU5CmlF9GnKmqvwG/io7EC6Ta5bi0B8Zfgz8AxxVyaQbQx8Hi1kSsuWc8ls0lr3hxz45JkbAiJhObXBtfl5bPYu+5s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v5 4/6] x86: extend do_mmu_update() to support returning the old PTE value
Date: Thu, 12 Nov 2026 10:00:03 +0000
Message-ID: <20261112100005.324440-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261112100005.324440-1-kevin.lampis@citrix.com>
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0214.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::21) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ec88e5-2bbf-44fd-f5c7-08df40a3ca72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261022113327099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261022115727099003|261022075727099003|261026130827099003|261026135527099003|261021135927099003|261026121527099003|261021130227099003|261021133027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CJ9y1gtCvTwg6H7noIwzWjOOh8tXYigwVWc6wYmdLg3lgT7TeAgfVncYIXNqnoLZtxpvG4ct/5F1au1v7s/zqpRvMMMEps16O+cb/0ThB6AsJV0gNzpyQH3zFAbd+vABklo9LPKOJ2ddwartkpywB/A+TiHkVJjLwujokP7B8pg0IQp/tr7yJyllKSHPLQ3RfknXIZwazUuUttL0VSltPmfwzQNpxZ573IfO3a2ma1VyqSAs7pKgf0VyjTT2RSlE1zoe0wW+xJk6d8gjOCpwdKs8iWTVXzSugYu7IU3i99YZ41ycRJRPTi8u4lbWqkk3HFX19cywLzDgfxqCgNYQsRSRZr2BsRjYJaF/NLE+a9a/olXFtO0nQWvT8uvOL6cSg3nr1fj1BnLtyg0zMBUqGVubsThNyczyqOJxkG9ekHj1jFzRtowWlzoDBcMfAX0FrED5mW1xQ9NacNlDMcHZs2ubITA4SGIfLObYyviHGANW6nSj7UVNBoMLob/UK26bDyDcownWKEHQVb1Dor9C5OxISHBXDfeGLQDvlBRRdS98sJew3CfxAVBWzOSMXC7GQ5SdLrlcHFXLzJBJbAtkJAzWnX5OMLm86cNvVBcXCaPSTFO79tZq/nhGoOMl7pRAXds4Go3MNAJYeDMEq9/1Ea13CiVhttl1OigzrVBFi+E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261022113327099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022115727099003)(261022075727099003)(261026130827099003)(261026135527099003)(261021135927099003)(261026121527099003)(261021130227099003)(261021133027099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U6tacs0wRn/kyvUqpiI8bkbClEl1NTzkCI3KagTHp+ZNFd3iIdUoNiPiTB0D?=
 =?us-ascii?Q?pdvU3aRUyR3o8Y2xyc7qzhPyThBj+khALUjg/MbjT2fcoWs/KIo9cZYot0pX?=
 =?us-ascii?Q?KW6IWm1VyBJHXz7+7EA8oN62/UxxDIsV8Uwhh6UtpJnoFruy0+TYmWWtVUr/?=
 =?us-ascii?Q?8J7AKMpqcv2hzuzVDPn+/Y2Ly5d3hvb09ECH53Luf9ZmkIKzVk8xqS973Y7S?=
 =?us-ascii?Q?uvgzDPU5uNVmxja5cCc6ogD1/wPlYQlj798lFmdrG7xHtOw7SPcJYvE8nAIQ?=
 =?us-ascii?Q?gJ4GfYA7fpkmj9qy7XmgCaVgF0pSWaS6N9KY2x/mSSKpGVMt2a8fnr8W1xb7?=
 =?us-ascii?Q?y2o0uhK5hOq+tTBj4BI/Wb88fXC/YursmOP+f7oFzBzz5jDgvIoVw8/T38MG?=
 =?us-ascii?Q?e23ICOcHthGG0r07cXa5gX0NnO1c/6Ar27/dQXovNGQC8fNLMzXvs8MoT2Xh?=
 =?us-ascii?Q?vt0NUMsTx+FxeISblBIZj9kEAk8JpyLWlp27ar/g3CmOO27KYrP0awB8xc9a?=
 =?us-ascii?Q?GvIZ1q48HvwA4vin89O1axExtIXhpiK6pWo7OVwVAyid8v4xU4VYje1lQX5j?=
 =?us-ascii?Q?lMOczKAD//KQsvPByNXE7h3OcZZL5wdwoLvRwaJsDEb8MzBY8l+iSIZlV2VR?=
 =?us-ascii?Q?RexpNewJnIjc9GG2GR2mgGwWgH9FioJxK6NjcqY2a1syqTt4gfOUhqjUBcw+?=
 =?us-ascii?Q?oge5WB7CWeBdpK/bF0Z9EVYuMADL7C2wfnKiP5e0WqH4tsouVlUZStrzcD//?=
 =?us-ascii?Q?+odlKC7YbkqtFVdHsj/X4mqoSIPI2G3WQZZZoNhg7SPjbziyvM2+bx0odfID?=
 =?us-ascii?Q?zYRLmq8wnhbzLEZX9/TfKloBTv1AtnJTDnGn53TNFe/NBvaET6VSa5f5QlSP?=
 =?us-ascii?Q?qSxp8rMryy/hNqHHXhKBwrdxD1XFK4TchtoBXc5hYd+8nqTUS7xO2BREuUaH?=
 =?us-ascii?Q?si3i8k3mXXiCVBPTUvptsPsVZ7jR77xMv2y3ytsHVucaB3xmR7wrZxwCHhoZ?=
 =?us-ascii?Q?xrhwEFm/tjZe6Gn9GabqxdekzM8QADauWiiUFbhyq8gY1k9jHYgBUReacRaz?=
 =?us-ascii?Q?tDegfboNVPVxsjXh68I8ACj+rpgkJdlQHNrunhfdwpX0Zvew7hAK9b9PxVg1?=
 =?us-ascii?Q?6uwsVsB5xI+KZhBH0GQRy1y9l/TEp0qLiJAbML5iqG9lDafvHxxBflftpju6?=
 =?us-ascii?Q?0ssS5SXNsWrIIAw6Wk1NA9sxYSH9QqBst1peEjroXSNVHRcwQrTzO0aPiOUU?=
 =?us-ascii?Q?Z7DNYG6VYlnf+xGNGM6QZkZ6LCWNlmXx6n75jHz5tECf44m8eWqodLJPKie0?=
 =?us-ascii?Q?uLtjKrtbUcYOWR3We1X+FD9UVsnDvgoXzvJGJXDuy5V1zTuLiNmW66n/GjVT?=
 =?us-ascii?Q?InkLA/jnAYoMyXdR4Y03Cusyzhx2OebhIFQpj/+rK/nl3ANq61DBu6UD7kKY?=
 =?us-ascii?Q?bRphPMlpR3QbLDEwoWmutHKJIqUerfh2FJX6rHwlWdD7EmunaGAf3XeZAG7O?=
 =?us-ascii?Q?AS/tVl1zN8wJYN2suWGi8nCLIC/ErweuIRBXVZE0adXJHCCs3AOLopunGdTU?=
 =?us-ascii?Q?Y5XniRY9/1fuHPtrZeP6FpOla4A6TJQyGjHo+Ft5yg9rZAomr6L2SAJ8dUcG?=
 =?us-ascii?Q?6Fysn6UCSc9o+SVfd32js047JexaeysJdLhFP543gbgHIE3IFeqJdTxbbFIi?=
 =?us-ascii?Q?EBV/OK1Zqh1mBs2cFy5SL6N5QQOS25a/fxFD5WciAU5KmOSvKuCQdfTlJMaq?=
 =?us-ascii?Q?ECjcUPGURQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ec88e5-2bbf-44fd-f5c7-08df40a3ca72
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:00:33.1886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eocnxgTQSLlAK1mTTbrKF+s/zyj5Bff99IXLz+TxQ1DjXZSCQFPbLVmz3LyEoGBuWF9HlSmYBd3/spi9tnNo/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595
X-purgate-ID: tlsNG-c201ff/1794477651-24F1F2A1-5643FCB5/0/0
X-purgate-type: clean
X-purgate-size: 8775
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A new sub-op MMU_PT_UPDATE_SWAP when used will do an atomic swap to set
the new value and return the old PTE value through the req.val field.

- The old PTE value is passed back to the guest through the req.val field

If MMU_PT_UPDATE_SWAP is not set then the old behavior is preserved
  do_mmu_update -> mod_l*_entry -> UPDATE_ENTRY -> paging_write_guest_entry

The new MMU_PT_UPDATE_SWAP call chain looks like this
  do_mmu_update -> mod_l*_entry -> UPDATE_ENTRY -> paging_cmpxchg_guest_entry

New feature flag XENFEAT_mmu_pt_update_swap.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v5:
- Add braces to the case statements
- Move copy_to_guest to the end so it doesn't interfere
  with things like flush_linear_pt
- Use copy_field_to_guest instead of copy_to_guest
- Use the raw form of __copy_field_to_guest because
  bounds have already been checked
- Folded x86: New feature flag XENFEAT_mmu_pt_update_swap patch
  into this one

Changes in v4:
- Refactor how mod_l*_entry() is used
  Checking `if (!rc)` multiple times in a row is inelegant but reduces
  the diff size. Let me know if that's not the right tradeoff here.

Changes in v3:
- Do swap for l2, l3, l4
- Allow all values not just 0

Changes in v2:
- Add a sub-op to mmu_update instead of new hypercall
- Rename to "swap" instead of "clear", although only `0` is accepted
- Remove spurious curly brace from `case PGT_l1_page_table:`
- Restructure `case PGT_l1_page_table:` to avoid diff churn
- Add missing `MMU_PT_UPDATE_SWAP` check for the second
  `PGT_writable_page` block
---
 xen/arch/x86/mm.c             | 75 ++++++++++++++++++++++++++++++-----
 xen/common/kernel.c           |  1 +
 xen/include/public/features.h |  3 ++
 xen/include/public/xen.h      |  1 +
 4 files changed, 71 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 316a435b9b71..2458fd5e508b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4123,6 +4123,7 @@ long do_mmu_update(
         case MMU_NORMAL_PT_UPDATE:
         case MMU_PT_UPDATE_PRESERVE_AD:
         case MMU_PT_UPDATE_NO_TRANSLATE:
+        case MMU_PT_UPDATE_SWAP:
         {
             p2m_type_t p2mt;
 
@@ -4184,37 +4185,79 @@ long do_mmu_update(
                      update_flags = PTE_UPDATE_PRESERVE_AD;
                 else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
                      update_flags = PTE_UPDATE_NO_TRANSLATE;
+                else if ( cmd == MMU_PT_UPDATE_SWAP )
+                     update_flags = PTE_UPDATE_SWAP;
 
                 switch ( page->u.inuse.type_info & PGT_type_mask )
                 {
                 case PGT_l1_page_table:
+                {
+                    l1_pgentry_t ol1e = {};
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      update_flags, v, pg_owner, NULL);
-                    break;
+                                      update_flags, v, pg_owner, &ol1e);
 
+                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        req.val = ol1e.l1;
+                        if ( unlikely(copy_field_to_guest(ureqs, &req, val)) )
+                            rc = -EFAULT;
+                    }
+                    break;
+                }
                 case PGT_l2_page_table:
+                {
+                    l2_pgentry_t ol2e = {};
+
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                                      update_flags, v, &ol2e);
+
                     if ( !rc )
                         flush_linear_pt = true;
-                    break;
 
+                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        req.val = ol2e.l2;
+                        if ( unlikely(copy_field_to_guest(ureqs, &req, val)) )
+                            rc = -EFAULT;
+                    }
+
+                    break;
+                }
                 case PGT_l3_page_table:
+                {
+                    l3_pgentry_t ol3e = {};
+
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                                      update_flags, v, &ol3e);
+
                     if ( !rc )
                         flush_linear_pt = true;
-                    break;
 
+                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        req.val = ol3e.l3;
+                        if ( unlikely(copy_field_to_guest(ureqs, &req, val)) )
+                            rc = -EFAULT;
+                    }
+
+                    break;
+                }
                 case PGT_l4_page_table:
+                {
+                    l4_pgentry_t ol4e = {};
+
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                                      update_flags, v, &ol4e);
+
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
@@ -4239,9 +4282,22 @@ long do_mmu_update(
                                      mfn) + local_in_use) )
                             flush_root_pt_others = true;
                     }
-                    break;
 
+                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        req.val = ol4e.l4;
+                        if ( unlikely(copy_field_to_guest(ureqs, &req, val)) )
+                            rc = -EFAULT;
+                    }
+
+                    break;
+                }
                 case PGT_writable_page:
+                    if ( unlikely(cmd == MMU_PT_UPDATE_SWAP) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     perfc_incr(writable_mmu_updates);
                     paging_write_guest_entry(v, va, req.val, mfn);
                     rc = 0;
@@ -4251,7 +4307,8 @@ long do_mmu_update(
                 if ( rc == -EINTR )
                     rc = -ERESTART;
             }
-            else if ( get_page_type(page, PGT_writable_page) )
+            else if ( likely(cmd != MMU_PT_UPDATE_SWAP) &&
+                      get_page_type(page, PGT_writable_page) )
             {
                 perfc_incr(writable_mmu_updates);
                 paging_write_guest_entry(v, va, req.val, mfn);
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 499023fae6fd..dc3cd9c3321b 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -690,6 +690,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             if ( is_pv_domain(d) )
             {
                 fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
+                             (1U << XENFEAT_mmu_pt_update_swap) |
                              (1U << XENFEAT_highmem_assist) |
                              (1U << XENFEAT_gnttab_map_avail_bits);
                 if ( IS_ENABLED(CONFIG_PV32) && VM_ASSIST(d, pae_extended_cr3) )
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 880193094713..227f1e408e41 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -128,6 +128,9 @@
  */
 #define XENFEAT_dm_msix_all_writes        20
 
+/* x86: Does this Xen host support the MMU_PT_UPDATE_SWAP hypercall? */
+#define XENFEAT_mmu_pt_update_swap        21
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 2149b8dd3808..2c403ca47ed6 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -349,6 +349,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define MMU_PT_UPDATE_PRESERVE_AD  2 /* atomically: *ptr = val | (*ptr&(A|D)) */
 #define MMU_PT_UPDATE_NO_TRANSLATE 3 /* checked '*ptr = val'. ptr is MA.      */
                                      /* val never translated.                 */
+#define MMU_PT_UPDATE_SWAP         4 /* Update and return the old value. */
 
 /*
  * MMU EXTENDED OPERATIONS
-- 
2.52.0


