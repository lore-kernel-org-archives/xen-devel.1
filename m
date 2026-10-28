Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB98606A327
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 05:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uMyOT92L
Received: from list by lists.xenproject.org with outflank-mailman.1462831.1673816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLvpX-0004ur-TJ; Wed, 28 Oct 2026 05:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462831.1673816; Wed, 28 Oct 2026 05:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLvpX-0004uk-Py; Wed, 28 Oct 2026 05:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1462831;
 Wed, 28 Oct 2026 05:04:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xLvpW-0004ue-84
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 05:04:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLvpT-006B8j-Ol
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 06:04:03 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6ae18240-2eae-0a2a0a5409dd-0a2a4504c442-8
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 06:04:03 +0100
Received: from [52.101.52.59]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6ae18242-b57f-0a2a45040019-3465343bae5b-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 06:04:02 +0100
Received: from MN2PR20CA0055.namprd20.prod.outlook.com (2603:10b6:208:235::24)
 by BL4PR12MB9508.namprd12.prod.outlook.com (2603:10b6:208:58e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Wed, 28 Oct
 2026 05:03:59 +0000
Received: from IA0PEPF00000039.namprd03.prod.outlook.com
 (2603:10b6:208:235:cafe::3f) by MN2PR20CA0055.outlook.office365.com
 (2603:10b6:208:235::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 05:03:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000039.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 05:03:59 +0000
Received: from jim-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Wed, 28 Oct 2026 00:03:55 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouzQv6OIUWe/gp28Dt7whlqb+0QSkp8AWqJyJzKjlOFqf9VuKdfriGjl80dp04g/g4rLa0x0JF9GiYz6eTCnkLB+sHIu2qX7ZUsHlaUinGWA5LrBo8HaTDccDH2ev2H6K7w2G4GGQfAUnqG3fsse9H68tPURCGdaS8BTfaTvrsYGdZMCoEOHVCzUDBFMBxaqlyI22frw+M/wLvTYYJ9DPLfHUFYjKyJkElQlHfT7qS7972QzGY0a9ryhhJoIPYtVVE/ylhgpI6KuFgooFniIOYFCqDW6BiWyDO4O4AvQKxl78bsgAGrK7SlBzF3riiXtFHH190qcxjXr3UpXmXslfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMYrGPInOhU7jXQfvL98Nfkms3z6Eq3dU6lGpKzArog=;
 b=pWd+A53aAcQvLH6nT2TnU2EElnoKZ+yrOufzQRK3QoWom50YiOTHBVEBUhdMyE+kXHvdsGOwT9O57megvCbTzab9zDiiwVqI7JylizAv5lxpOd1CXI6GNG2ZKqXPcxheigp0KTyISQ5IZQk8VXTTkwo6j68TTjSyN2tZ+/fGL0EQpxfuuq7QJ7RlymEzD6GWIyd3Z8Dolvbu6uwZ/+8iv4BH6b+HpDYogFomLiuYhk/SxBKXhVfJIWDAIF4SuUvn9qfgYU0u5bJqYVcDOvv1qS675j2SDn5SkFIJGbiF8GWYG+y05JSkWIW5nka7ZWLK8gKMYGIySvfCFWCpIyvBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMYrGPInOhU7jXQfvL98Nfkms3z6Eq3dU6lGpKzArog=;
 b=uMyOT92LRNk4Jzy/lJ0OraBmwhDdffXd859QimbbOXo3jGZhRI7WOBvys5mGfAejHZtodSQOg0mw2nZxaxDOGZGO3LIGfPpgrmMPzt9dlQ1+joD4kJihbxCIrkWFfZjtXsPTGnvuTr5zvKfM6T1dDWyiCnXB1uAcx6LnCvtmCYI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Shuaidong Chen <shuaidong.chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Penny Zheng
	<penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>, Shuaidong Chen
	<shuaidong.chen@amd.com>
Subject: [XEN PATCH] xen/typesafe: don't brace-initialize a scalar TYPE_SAFE value
Date: Wed, 28 Oct 2026 13:03:36 +0800
Message-ID: <20261028050336.2549325-1-shuaidong.chen@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000039:EE_|BL4PR12MB9508:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f58ef4-a4ce-4868-241d-08df34b0e074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|7416014|6133799003|18002099003|261026140227099003|10067099003|13003099007|261026121527099003|11063799006|56012099006|261021121427099003|261022105027099003|261009223027099003|261021123027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	PXwhV8H8Sh9xMbhoQbu8RI2qaURxXmA0YQaDjZGOuPEnZO7+aiKSd33wAQf+lNfSDusP4OJR6cBHO86yv8cSFquRVGtNNi1vweE1oKMmHJScZz+MSCXOQUdd5UFA4aKEY0fhAw6OX23ErVbRGR4Ycphk/IZYpkjXAfRBbMzVenGTWbBOYbSfipGkFLgsqmXL3ToOCxhHrFrMjZSKC/JPN65NgKyw5ZzAGxyyYNiFF8N6PBeSyI7vPFnU2hEaYnSx9d0dPE8ws0POjjRwIQ4gN0x8Y59YVlkQFRGGJInVOtN8dUJnvZEyzXVP+J7JB3X29Qinbdgly525VCEbCE9pf1F/doMlqdTlWvw4T6dyVvQLwEG46xaKUNOyeABygcd7CTZ4KtEqQoURR3fhX7ey5EYUdRR7Exnf5TtPFiPcG9GMRfGSPGK+nM478gw5bJE0+zDPfAqzqsKbrrNwwQhl9m13mU9qE4Rl0kJP3woaM9bK1pncU+A8EHTe1yapExLEsyje9lMxw7GwEZ3EkW4nBWD+dkuhdPeCuLeLFIfOL+YVkOmwycUnqgLF0XtvmY7EYFH2nrV8Mqp1+29Su4Uc00mR2zBEJyczcS+VUS2zaRvk0v+zoU6qcKW8jyB81yMQBLwOeefJ6BI8fBRY1B78UTFz2L0VqImCBeVEr8U/de9MMt9EcoJagXfHa+epGvMVBewW3FzUB6JO8fOBorImRA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(7416014)(6133799003)(18002099003)(261026140227099003)(10067099003)(13003099007)(261026121527099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261021123027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iPo2ooDH3V3ove2IFfOpKe0rM8kD40x0qzt8WdsPARCMR8ukIE9Nw6TpbS7bk1FoLUF96QgNdot43IFtMM3M5ZVdrLY3eGD00vy6l+WochAtDKefXQ6UfYwFkhigScrNmkPZ0rne5NpFYZdSsdwMysyOYy1Feq32Vt3X50ID5OQp0qKuFO3r0Cxd6RE4rsSyLySfTl1v0X8SrXuTntU3q0nOUqsktMZBPxDNs/25JUMpWTK/+Zrl3Mwx/oIPvJLGBMF7vugtkwZWf/lhfwmQtca9C1ju3G4oC/I9mpPHH05ZVuZi2PxRJ2TpOcaqFO1VQ80OCBd3DyUUc5iDnpruiKSKWD09ErfK953GSJ1MMfWn+EsE0yi68o54Fvg8S16A0/JljMuDBMTKOMZmtpaocNyS4U+AK1tMUiZ/DI91J5+yIzvI4eg0T1bG3ZFwJ8nL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 05:03:59.4059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f58ef4-a4ce-4868-241d-08df34b0e074
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000039.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9508
X-purgate-ID: tlsNG-ebf023/1793163843-50AD8B50-AC5B4214/0/0
X-purgate-type: clean
X-purgate-size: 3904
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TYPE_SAFE() degrades to a plain typedef in non-debug builds (NDEBUG), so
mfn_t is then `unsigned long' rather than a one-member struct.
INVALID_MFN_INITIALIZER and INVALID_GFN_INITIALIZER, however, always
expand to `{ ... }', which leaves

    mfn_t first_valid_mfn = { ~0UL };

initializing a scalar from a braced list.  That is valid C, but MISRA
C:2012 Rule 9.2 (required) - "The initializer for an aggregate or union
shall be enclosed in braces" - is reported against it, twice in the
x86_64 build: common/page_alloc.c and arch/x86/efi/runtime.h.

Give TYPE_SAFE() a companion TYPE_SAFE_INIT(), so that the shape of the
initializer follows the shape of the type, and use it for both
initializers.  The debug arm is unchanged; the non-debug one drops the
braces.

No functional change: with CONFIG_DEBUG_INFO=n, common/page_alloc.o and
arch/x86/efi/runtime.o are bit-for-bit identical, both with CONFIG_DEBUG=y
and with it unset.  With CONFIG_DEBUG_INFO=y they differ only in
.debug_info and .debug_line, because typesafe.h gains nine lines and the
inline functions defined there move with it; .text and .data are
unchanged.

Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/include/xen/mm-frame.h |  4 ++--
 xen/include/xen/typesafe.h | 11 ++++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index d973aec901f..e41d2680af5 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -12,7 +12,7 @@ TYPE_SAFE(unsigned long, mfn);
  * To be used for global variable initialization. This workaround a bug
  * in GCC < 5.0.
  */
-#define INVALID_MFN_INITIALIZER { INVALID_MFN_RAW }
+#define INVALID_MFN_INITIALIZER TYPE_SAFE_INIT(INVALID_MFN_RAW)
 
 #if 0
 #define mfn_t /* Grep fodder: mfn_t, _mfn() and mfn_x() are defined above */
@@ -48,7 +48,7 @@ TYPE_SAFE(unsigned long, gfn);
  * To be used for global variable initialization. This workaround a bug
  * in GCC < 5.0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64856
  */
-#define INVALID_GFN_INITIALIZER { INVALID_GFN_RAW }
+#define INVALID_GFN_INITIALIZER TYPE_SAFE_INIT(INVALID_GFN_RAW)
 
 #if 0
 #define gfn_t /* Grep fodder: gfn_t, _gfn() and gfn_x() are defined above */
diff --git a/xen/include/xen/typesafe.h b/xen/include/xen/typesafe.h
index 7ecd3b4a8d5..258404bb915 100644
--- a/xen/include/xen/typesafe.h
+++ b/xen/include/xen/typesafe.h
@@ -9,12 +9,17 @@
  *  * _$FOO()  which boxes a $TYPE as a $FOO_t
  *  * $FOO_x() which unboxes a $FOO_t to $TYPE
  *
+ * TYPE_SAFE_INIT($VAL) spells a constant initializer for a $FOO_t, for use
+ * where _$FOO() cannot be (an object of static storage duration).
+ *
  * This makes a $FOO_t and a $BAR_t incompatible even when the box the same
  * $TYPE.
  *
  * It does have some performance cost because the types now have a different
  * storage attribute, so type safety is only enforced in a debug build.
- * Non-debug builds degrade to a simple typedef and noops for the functions.
+ * Non-debug builds degrade to a simple typedef and noops for the functions,
+ * and with it TYPE_SAFE_INIT() loses its braces: a scalar must not be
+ * brace-initialized.
  */
 
 #ifndef NDEBUG
@@ -24,6 +29,8 @@
     static inline _name##_t _##_name(_type n) { return (_name##_t) { n }; } \
     static inline _type _name##_x(_name##_t n) { return n._name; }
 
+#define TYPE_SAFE_INIT(val) { val }
+
 #else
 
 #define TYPE_SAFE(_type, _name)                                         \
@@ -31,6 +38,8 @@
     static inline _name##_t _##_name(_type n) { return n; }             \
     static inline _type _name##_x(_name##_t n) { return n; }
 
+#define TYPE_SAFE_INIT(val) (val)
+
 #endif
 
 #endif /* __XEN_TYPESAFE_H__ */
-- 
2.34.1


