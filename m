Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394D0606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ZjTwDMKq
Received: from list by lists.xenproject.org with outflank-mailman.1485381.1688618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRc0-0006oU-5S; Thu, 12 Nov 2026 10:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485381.1688618; Thu, 12 Nov 2026 10:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRbz-0006mZ-Ud; Thu, 12 Nov 2026 10:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1485381;
 Thu, 12 Nov 2026 10:00:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xRRbz-0006bC-3r
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:00:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRby-001E2m-G7
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:00:54 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e55-8faa-0a2a0a5109dd-0a2a4505b1cc-4
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:54 +0100
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e51-4cb1-0a2a45050019-3465c10b4789-6
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:53 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:00:16 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 10:00:16 +0000
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
 b=yP0qMlk9Bj2wVt2DOIpo2gZLoobQZVg/ST8Wkkv8RZI7pnXfTQ4R5Oc5tdb0UXq9KVGjw1hNRy0Ggt0XTD+LRReKyHhFYNrn+ONM6MgwIgbFelqcUTI9LKzT5obP950t3tSLrIckeO+WPmCzY7eCovBoOM60WMIc+HytYqfNHudwI5l4PorlOlz12ni617ut5aeR0Ul+QhDpWUVwQVuXapubWaNb42I2zwGiFhuV1ZtAH9VXLwh4WyOwa2/N7/vAtJJ6q9nkMICLXuCqxB9aLaN1W8juH1OJsaimg6yfZJ2iAvbX4traiODFh9Dn0q5/b/JuVPDHxpwwNsWD+Gd7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63CXyESIaJK9T27H0ZieUap05rsG9VJ02OpYFtvONGw=;
 b=rqoT9COVX6X6fPRCJHy1rU81XmBtwvsNuikwKJ71NOvhN0vlCqmZt9AvTewabnVb8gCfLjl23vj47y9XUfds7dzuTocuXaoCZMosrNz276Q1KkFHDTnrm4mh4uKDNoGQb/UJ+Y8zDTRQc30dswSNdWqxAKUFppe1JtnjXsvaBNfDDpWMTZJB5HWR7kxB+lgBikG95fMlasRJmgsqG3OEXP+PH1VHZGPQYe/gFpkQ7kjX9LyCSMJZIB3E3QZZIIbsylV/frxbQlLqP8mzh12T6kZE+5yqtL7iRTTYku8Q6dbsJ/wB7ZpSEJ3BBBnz4fCKWy5gLQ2oC/GdphPE/L5L5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63CXyESIaJK9T27H0ZieUap05rsG9VJ02OpYFtvONGw=;
 b=ZjTwDMKq43LMB5aUHjNiVkGOvg45ZNnbsZr27y48m7zLdakiVZvf3NE9H+aEPV4K1P+BTOf/7Z+bRw/VBa1RNTIOTCEGhgr5qZDeq6h6BUy0uRdXtDPu46fqp/csO2/SVP0It6OvFTYohJNnhSu2wYAFfPVcOOZLTtFFZheGSmY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v5 1/6] x86: extend update_intpte() to support atomic get-and-update
Date: Thu, 12 Nov 2026 10:00:00 +0000
Message-ID: <20261112100005.324440-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261112100005.324440-1-kevin.lampis@citrix.com>
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::8) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8b3369-bb4b-413c-bf81-08df40a3c0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261021121427099003|261021123027099003|261102123227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	O2cl7Eu81JgBLdTniSENrMnlvgxesMgzJfYdap7OJMz8Z2fpWcIMajnuInFK165bT/2dCBdeRXm4d5I8MSgvhTpAazftei7dXafbHPM9kM29eexIEOP8y0RgX2rPCzp9HLVeq7uihQkDSvdJsUymu9yUYWL6zmdgORbi3MXnoIEX3nEukbfOkY04eeGoD16NqeTHHBPVlX9Lw0Ml5ASpX6esv3apIQCdrRGkiTK9mgQy3MX+bsboK4dI6ECcCBDGnUoIeOs5DelGuUKpmq7VLURLZ+PakurNllPKcoThiffnnWDrFd01u8Jw53vaNe6LI2dmiflWr6VnxeDGbfui0tfLd2Y3CFGfdUDZfZjjmokyBEX6B4IzV66/tHlgdseIgv/3LW1b8Jsu9Pt7qvjcDboPnNUWDgq+CxoD6hynyDA7R/CNobqw3F4U8yyKeWmvv+8I9RtwGCO54TZmJLhk10SVHAUBWO7Mz0jJQHJ1fciLTDwCRevd6tx7dtKEbvIOlLejc4Nu5iTSqak+Fg6vmNVzKPfpCSkNTe8jn4UIY7CrJmwhWEplZaZdPMNLb6K8RKwVxPiG+3SgI8utBDhJT1dp6LtbxHEGpKII0wqwzAohqpruGHXvxPcP8qxMXsEOcg52d0WyuhqcHNRf7hwcbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vguphjjeTpPfPcG7ajr4XYsHT/9ypVkn4pXzdUL4XQrCy1hxIje3vJ8JLbGi?=
 =?us-ascii?Q?4Pkva26RjHraSCQBW91vAH/yGBYyb/ARecbtHjjToTQTBL29Z70Pd/R9cS6/?=
 =?us-ascii?Q?mflctHGL7kyeANpkYQ02ZQB0HnggM6BNUwy9h3l1yk9rbE3kJ8TC9Pk8uQ7P?=
 =?us-ascii?Q?RtnJCp3AIkIONrqoG2XwJdpqOjoF12Menf+lBi859kqPNagCGzADCjnZYqr3?=
 =?us-ascii?Q?A6fhWZnt7d0nfd8GfMjz1z2wHjEJpNYJ8gc8TSId5HGEdHPyh38aWq2bPGuj?=
 =?us-ascii?Q?olREfPM+ksWLrJm6L9AaTnghVDHbTbxLS6QVmXoH+s34Uy9DyQ9tV4Fwum0+?=
 =?us-ascii?Q?6KY/DHEhHSrVdnqdrzk2U+ANMftG9n2RdaOinGZ6hsHEIWAP0n6TkC42Ncz+?=
 =?us-ascii?Q?ZPDr8nUH08t+OJNvf2E5s/UUynLbhFkLqKNy2k1qPcrpb5Ju9t/oRMfVYbzJ?=
 =?us-ascii?Q?rr9NiDTDJ+iOzzc+Cd6rZiLElVNZpGlDsChvhy937nKttuMC/kuiwzLo5/kn?=
 =?us-ascii?Q?tejpXcu/KEaWybgfPKo2935xhSjzG+WmRk6kIO5re9QSgpaYEOE36ovhv7bK?=
 =?us-ascii?Q?1QIHgkk6P97rl+8FBotL7DDuPSLwFkcLCeVyirQ7PiOZo4NmkMyHB/5H73Ia?=
 =?us-ascii?Q?izEPDDwwnvG5F5x6Ue8NjLTHxkaVdgU2K38yLx6tPcUTSKiRGRgpvv0/DR1C?=
 =?us-ascii?Q?/HlF+Oi63deW7TbdKDwXTX4BU2L2MwVu5k9XVXpco1HadzqHcw15Q2WaD3TO?=
 =?us-ascii?Q?IilavIAMGzRuiOo7idJB30jHkHq20s0Tbs0ff60HgbftspYYCXvtlCA7D70K?=
 =?us-ascii?Q?12IlqmEI0bLaM89q2admTb1eSrtO82wEKThLBI3yVC4lK+ok+9ngeDmusjeu?=
 =?us-ascii?Q?pZk+Jn4QOFr8wwSLHqxGXccg1fkM6uDRBDXc6DzAEaUupBNtAuZA+RPAiYHo?=
 =?us-ascii?Q?Bl9jx2qtaSgCTMnAeedgRBoI/fKs63PMcTFTCuXpgoMOuJF8Vc8vvg+AMfkG?=
 =?us-ascii?Q?LTFzdR108gaJpRjGXeubzNmgWhMBvfvUOGXMqMdDRirIldF3ea0ksOToE1IF?=
 =?us-ascii?Q?g1rrlMTuFIZVtr46FyXdRyx0jYWyGtfZQ3KlZEbC6IqyX1MWC0XfvY2KbO75?=
 =?us-ascii?Q?/5L8T0hr3JFOePXRjhncOOSqOeQozAm23WR7RuNbKs+jaq+4XJYjsNxipADT?=
 =?us-ascii?Q?66kGeQJiEbkOCNFJvK+C1MnIAcrHMW96/Mv1RrJjBmil/T7kgwij10G/eTU6?=
 =?us-ascii?Q?qliIL8FAl9UCjFGJpBVB++CVHtOM5lbQWHyGOhi/XUukfwr64mI33DFga6zM?=
 =?us-ascii?Q?2INKmLo9zfqAZWz12iU4GMzVB8JvnBkC2iIGI+PJsrYDTwicdbi5zFE95bXa?=
 =?us-ascii?Q?ew1rY0wdQ8b9jIe41/RgY83SFAwSaHqMWbXpGxEitCFG46emJwVIMviyolcg?=
 =?us-ascii?Q?cHvhzj2MCs1rHl+M0k0g5DDfWGZMxmyia/cnSVoLk8F1BhRqmKqJjwlJgt3h?=
 =?us-ascii?Q?3ndfthQS0s0rJklZoPeLNEqY9FDSmbRr0qikhWloESbdzuX5o75jKI3l1XZg?=
 =?us-ascii?Q?EUiK+G2kIhgS7FJiY60FrGwjJfOlkyQ5K23HEbWzgq8SgAE0UvyGSAcVeE7E?=
 =?us-ascii?Q?tFiUBlp998RG+eDUHA9eiwasb1bUA7EeKlnW+FjdigQbOJRF9w3SIpGKxBC6?=
 =?us-ascii?Q?IlR562LMdIoDWRqE/xLGAXErXgmYnsK8ev+zTpfk12rCZ4VW8QaG3NlvOg2Q?=
 =?us-ascii?Q?+NAUQcUSBw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8b3369-bb4b-413c-bf81-08df40a3c0ac
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:00:16.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLAtLpdrirzlyVcJbtz2sZ64gXYGphdJ6lbZIW6ORB//fiw8AgjnnXfBJVAJWJxTtova56Gpb7IR0GbhLGQJWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595
X-purgate-ID: tlsNG-c201ff/1794477654-F66B52A1-1B715F1A/0/0
X-purgate-type: clean
X-purgate-size: 2044
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The update_intpte() now accepts a new swap flag and if set
returns the old pte value.

No functional change for existing callers.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

---
Changes in v5:
- Update the comment above update_intpte()

Changes in v4:
- Remove UPDATE_ENTRY_SWAP
- Don't move the backslashes in UPDATE_ENTRY

Changes in v3:
- Return 0 in the paging_write_guest_entry() case (update_intpte)
- Add UPDATE_ENTRY_SWAP to convert return value to correct type

Changes in v2:
- Add new PTE_UPDATE_SWAP flag instead of a bool argument
- Return the old pte value instead of turning `old` into an out pointer
---
 xen/arch/x86/pv/mm.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index bfee0feb7b21..4016dd1087ba 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -64,16 +64,22 @@ static inline intpte_t paging_cmpxchg_guest_entry(
 
 #define PTE_UPDATE_PRESERVE_AD  (1u << 0)
 #define PTE_UPDATE_NO_TRANSLATE (1u << 1)
+#define PTE_UPDATE_SWAP         (1u << 2)
 
 /*
  * How to write an entry to the guest pagetables.
+ * If the SWAP flag is set then does an atomic swap and returns the old PTE
+ * value.
  */
-static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
-                                 mfn_t mfn, struct vcpu *v, unsigned int flags)
+static inline intpte_t update_intpte(intpte_t *p, intpte_t old, intpte_t new,
+                                     mfn_t mfn, struct vcpu *v, unsigned int flags)
 {
 #ifndef PTE_UPDATE_WITH_CMPXCHG
-    if ( !(flags & PTE_UPDATE_PRESERVE_AD) )
+    if ( !(flags & (PTE_UPDATE_PRESERVE_AD|PTE_UPDATE_SWAP)) )
+    {
         paging_write_guest_entry(v, p, new, mfn);
+        return 0;
+    }
     else
 #endif
     {
@@ -95,6 +101,8 @@ static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
             old = t;
         }
     }
+
+    return old;
 }
 
 /*
-- 
2.52.0


