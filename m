Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C6606A321
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=bYUVgoaS
Received: from list by lists.xenproject.org with outflank-mailman.1462575.1673569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNG-0005dP-4c; Tue, 27 Oct 2026 21:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462575.1673569; Tue, 27 Oct 2026 21:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNF-0005d9-WD; Tue, 27 Oct 2026 21:06:26 +0000
Received: by outflank-mailman (input) for mailman id 1462575;
 Tue, 27 Oct 2026 21:06:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNE-0005Oe-Ht
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoND-000vfm-V9
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:23 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11248-8faa-0a2a0a5109dd-0a2a450ab3f8-6
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:23 +0100
Received: from [52.101.84.110]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae1124f-f2d2-0a2a450a0019-3465546e8498-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:23 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PA4PR03MB7248.eurprd03.prod.outlook.com
 (2603:10a6:102:10e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 21:06:20 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weHTYAXxufKCmA58N24JSroAzi+8kapvuf0GGjtv665+3t/HB+2xy/jChVNSle6ZgxpUP8Nkgcf15XQ4+S+Eok97bsQkhFYhklclnUUWzHT+G4WFDZQmrSHCaZRw1N/v2XGtaKeB/ZeXSGx9TKRjBCtSfrS/ekgmc0LNH/b1N5/jWti3P6SaPEf6y2/tLGfOmYixkIDiyKasFmm1U4IYwlepsRC8Vs/WPhZi6R+g6/B3sbkeDhkVS6QmvwqvsQGuC0Sq5AKXWJk0GwBV2l57j1kNPCvWvDRtrmI+X2JRbtG6W+esxZIvAb7OrVmiL4L0nHJDH53n6DmyUgNz2jpN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtpFdnNv8BeIMFzC1ZCCM4xby+yu82MO+Np34s0G850=;
 b=mZyMP9fjEBVIP3/iNwdxiDtSqCXInccE3wsh9e/Y3He29OTVdniA9ZlrN5BBLEvhvqIfu8fsXiTJfkEdEZKLCF0LYnX/QuuJ/9OHupvSdGi7Mnn6lrxI+XKbCJ9tmH3JROfu0p+XCThGuAQQbygW/IWsRe26MsqK2A81amJpylxKPYf8I2Vj2tiHgjaOr5NFgsf5lMDqLM2DdPfQErgZIEOxeKANBZhNgnXuuxzpv7okFkZIOd5LY9PGaAgyfniuMmoCJnru4g5cmg86G1ZQ7d5hXTd3N4LKQ+H0dmnfH/88+iA5hCZLRq33KjnUvEyjdISCEYJR5oC+rCZY6NVERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtpFdnNv8BeIMFzC1ZCCM4xby+yu82MO+Np34s0G850=;
 b=bYUVgoaSmrz7YVNHJCm7aTGaQNYsQY+eP7TMZ/RyHowxgdTMvZrkD2Tl2kf/LWRYhihmCDfcsgq77NGjwqsSS4eywEWO8//4TIkApnfDQNKeqOlo2PRPCjcV379Q3xcU5mL3O18UatYfw9BZRgIwy9WOMeciLjGAiS7MuerN1AnNaJu0h0XlXhnQtcoZWazxBrwgA6bSBBfpCO9c8VrK6i6HayISPHpOx524YDv9zZVpKb0m8WIQs6jytAVQvAmOkFrkLx2Wgck9vx84cJrxxNzw09bE7UUNovG8VVOLpvK2COesol4kqVhHSvwUPuBdLWGNOEt36MD02TZy96naBQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v13 04/14] xen/percpu: defer freeing per-CPU areas after resume failures
Date: Tue, 27 Oct 2026 23:05:53 +0200
Message-ID: <3f0239435a9013b5ea35dda4ddd0253ef42e26ee.1793129971.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793129971.git.mykola_kvach@epam.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PA4PR03MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acbcd48-c2aa-442b-f7ce-08df346e2643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|261026121527099003|10067099003|11063799006|56012099006|261021121427099003|261022075727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	mOrxtybOJJl16KCB3OEtoxOii0VcGlS3DAnjloGkIY7fFkwiCo/YNWBpeXQkm4A4Zw05/IeGQN1E6Ly4ZGUwMvMr3WIEYikD5Zu0l3MHDgnfy7YhsjgTubEGXr+JNMGrVbj2RnqyvNGJFH1Di6TdHgNzElQrnkV+rah2kRNW76YMDOa7zUIXuaFlSFGKkgdOqkHqqdi6zFh8YpiQp1BaHMSeQMUgTLkb7wU1JtUTa0MhS3EtYYVMJqvTd8WoLw0FY985c2o9dhmW1+UTjVfUlxESiK0/2Mi5X8I/Z0KUMshaxbMRp4wV/cfmIRt8IjMGMWJNXWHbXmf9CfuQKehLGWboDOj9eN9SxGCxaDhFZM8+eW+ysZYu2fm3g82/OO1D1/AX94TctKbcmONPa2jaFLe+CFBge0ZKhmjMdMEmK4r2fqqqxFS1qmQ1eHSiV1o3krXkqmV1P2HD96SYiOdbbrLCHAD0qEtF0Ctr3xM96FV6bsK43B1GK+5dUAMKsvn0frY4RKRNrikURXJQH8Bvg7ZYc2H+fwtYUrqUWvOb1lY6/fSBjmb75yRQ2RjShaVCH7QousApuOdIEovjdS1xesFkbIcOJ0nLCHQ7TYtuCbPTN/hEV3Z37ku7AkLDOQD35+BDzBrvARvYVEE6dM7msWY10p5Pytf6wqTae5tGj2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(261026121527099003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ja4K+PN+lQhzRh2LgCuUw0gn5N+DmdwJz1Z5L1AHnxWlwrzZFa8i/YeajIzA?=
 =?us-ascii?Q?W3lgZ2tjPpKVcMpX+YQTgVQ4qYQz0+xE7g+++tS36cayrBdANooikJV0NnLF?=
 =?us-ascii?Q?TyX4fh+q0WoCvz4EGNo7ioA45bXliSQQoeZRjlSOjCK/LU1uJVIQewTqvAUl?=
 =?us-ascii?Q?rhbPP11jAoG2iwDj+C7XzGQQ5OCQHbfs7FJ65qX1qrufp870MhTRmY7OsZef?=
 =?us-ascii?Q?odbw/LONgYAkmInYK/Qikv+tXNtDl+OnGiyBPlLJQgtokB+UL0uXaBstZxZD?=
 =?us-ascii?Q?XB/aIxGSrUNvG7pNLk1wHfQYxlfhcCD3EnsSP9rYjh/JoemdDBrqbPKrO55Z?=
 =?us-ascii?Q?WAH5EHu/dPO5P9EWQrTRhBQvWz1ywNPGaUzX2iPG7zuaRpfyDlF5mVAmlEyT?=
 =?us-ascii?Q?IF+Vb3mRZEwI0UTtkRs4Utq5DNsfJu4+iO5du3UGSfvu/gdz6jPKjDo8iXW/?=
 =?us-ascii?Q?drGzYHibSB9FvHfB3qaoCfTZ88hhWItus/U1VNctidfsLIc1uICVoWQxZl9W?=
 =?us-ascii?Q?XGlPBdRCp/GHItPWa4s2b+A9JtuedNFn7OWs8BGa0Ugsj/aeRAhtNoYGZYRh?=
 =?us-ascii?Q?UajZiQLx/128M1XfcLZxfcmegFAMMqZ+vvHKeB/o7Ku18KqybWJ5Rbv5K21h?=
 =?us-ascii?Q?gG8tLKaBzgkYgRmBd54WSQ/Avnt3ATMd7W2yt3QUG4rPQ0tIetLT0Z/ToEq3?=
 =?us-ascii?Q?tW+8wIr4CUUAVg/CFX46x7rE5nJ/L6Be+P/nSz73eko90Bx1vbTnxdoHqh7h?=
 =?us-ascii?Q?lrWX84ZlAco5QstJH7vkS93qGzjmHYKnIlUdLv3I3BhVLaBOahsWd0FOI7og?=
 =?us-ascii?Q?6QcqVexz6UCzOmT2hgo55jBgJiiiy5o0IyGhFeVQ1zEXZ5NLmWtaffeghOyD?=
 =?us-ascii?Q?koIn1ftLA/9ExtTqXQvTgtONA9n0/lVIvRHAyOVP6RMAzIlfWkx8nddSGMrb?=
 =?us-ascii?Q?BjL8OJLE2UkHOiWMPy0Y9kg3OTxX0DOu6BdtHbCqnjKLG0A7mnQxQI4H1pLJ?=
 =?us-ascii?Q?g6z2crDPzuE1NhXWX70hY94OEb52JCbmyb5DZig8P6kGiDq22gTsw7Bmlc5Y?=
 =?us-ascii?Q?XlKj9EJHkcmzDwfDBIdOFLu4BzWobUl8QnkXlhXSnbS3chsbJBkk+mKryPn3?=
 =?us-ascii?Q?FN2l2X9eScpfv6sM5GgbpGp01wZj2hMIn7pH0R951oCsnv/JTJeDH4fM8Aj3?=
 =?us-ascii?Q?/hanF61okuA7kzhZP7cA8yTeiRYqQ3Adhq1YmbM8FBPHd2BowhY7IH7UDfFa?=
 =?us-ascii?Q?Io8JeABJyC63MJCDMI/kqjJBCwZtRbJIi17uNu3LvWtfgZQXues/hdw6S9jW?=
 =?us-ascii?Q?iWojkjPgwoTWPthLE6nlts9zTelA2NhEvKJQ9u5bxK6G/HBMqXqyy+/3ma3V?=
 =?us-ascii?Q?6dEMpBUXAE0AqDxCQSnrddWufDeeQvP/N+AvzD72cwLkxNnZ2MTXyuWbeYFU?=
 =?us-ascii?Q?JQgoU+BJLEI4w0fDDvD7hRc2F+V+4+6w8C+J4N5nQCCOaXXRfZGqJUHm6D4p?=
 =?us-ascii?Q?NdXXFk/viIFVHyCevQCpsgL726p9KikE1zi9oIAnLQjIcKdxxkrzZ6ZkWtoy?=
 =?us-ascii?Q?hDwgkujSyUDWW08Feddem60ACvNrc3jNDoEveCCsl3AehXZ2htiQj0dLKiO4?=
 =?us-ascii?Q?2nBJ5N7a04MXdqN4OJlV0LfpcX+LQKME3319m80Ecb9mOpCPQ918D6XB5FgV?=
 =?us-ascii?Q?srr8HgYvhS9YR13TjmDMhjMFlHn3dsSU2c/DQU4w5M/9UxJaktr0wNDyw9ND?=
 =?us-ascii?Q?quN+n0zr6w=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acbcd48-c2aa-442b-f7ce-08df346e2643
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:20.3792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BKRxF/B1JWrMkuHyyCL4trwSAwJG4O428Gk/UMIY2vGvVCTOL/nIcTO0AidgZcQSxKQl2osdgOg9Q/uUY3KOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7248
X-purgate-ID: tlsNG-4011c0/1793135183-4ACDBCFC-E950136F/0/0
X-purgate-type: clean
X-purgate-size: 1722
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a CPU fails to come back during system resume, cpu_up() sends
CPU_UP_CANCELED. After trying the other CPUs, enable_nonboot_cpus()
sends CPU_RESUME_FAILED for the same CPU.

On architectures which do not park offline CPUs, both notifications
queue free_percpu_area(). The release metadata, including the rcu_head,
is stored in that CPU's per-CPU area. The first callback may already
have freed the area when the second notification arrives, or the same
rcu_head may be queued twice. The CPU_RESUME_FAILED callbacks also need
the area to clean up timers and CPU-pool state.

Skip the per-CPU release for CPU_UP_CANCELED during resume. Let
CPU_RESUME_FAILED release the area after the other cleanup callbacks.

This prepares the common code for Arm system suspend. x86 parks offline
CPUs and does not take this release path.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v13:
- New patch.
---
 xen/common/percpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/percpu.c b/xen/common/percpu.c
index f180f37253..e957c3c58d 100644
--- a/xen/common/percpu.c
+++ b/xen/common/percpu.c
@@ -82,6 +82,15 @@ static int cf_check cpu_percpu_callback(
         break;
 
     case CPU_UP_CANCELED:
+        /*
+         * On resume, CPU_RESUME_FAILED is sent after all CPUs have been
+         * tried. Keep the area alive for its cleanup callbacks and let
+         * that notification release it.
+         */
+        if ( system_state == SYS_STATE_resume )
+            break;
+        fallthrough;
+
     case CPU_DEAD:
     case CPU_RESUME_FAILED:
         if ( !park_offline_cpus && system_state != SYS_STATE_suspend )
-- 
2.53.0


