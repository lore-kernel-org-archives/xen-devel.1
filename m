Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982E9606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=W03kVj/e
Received: from list by lists.xenproject.org with outflank-mailman.1462582.1673632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNP-0007Rn-5R; Tue, 27 Oct 2026 21:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462582.1673632; Tue, 27 Oct 2026 21:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNO-0007RX-Ri; Tue, 27 Oct 2026 21:06:34 +0000
Received: by outflank-mailman (input) for mailman id 1462582;
 Tue, 27 Oct 2026 21:06:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNM-0006tv-Ca
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNL-005OFk-PW
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:31 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11224-bab6-0a2a0a5309dd-0a2a45048502-34
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:31 +0100
Received: from [52.101.65.95]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11257-b57f-0a2a45040019-3465415fb2ef-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:31 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAVPR03MB9573.eurprd03.prod.outlook.com
 (2603:10a6:102:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 21:06:30 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:30 +0000
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
 b=Sa+7pG7i57ugT7NLZ8gTHR8l7iON+r6+KpXDPokl3Wb5qUJv23b/D0PCkcNMnIYGcNkEoeyfRVneF5V1fkykDL4mwcDpTj5mZwfiF1YXENq/TxvOcH5qbzwSxYbUKZN02vkMWme1Oicj9pyYvL6VtDuN2PasyRUpFhIVTzhR/xGiqZHz33CbHenW6HZNOjgmU7Peg0RWDtc7VzfwgzZ9CZhxVE2i0WCbM1Z1pnhSU5djOxUSZvI/RarDTyQgx5yPYhhzJailIyXadd2r+5JFtmlK3FH/RzC2kb05pMjq8edMjsi1NlgryB7LFqtYaoFeC1JqylbqlSy+PpJU0M0UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qv14y0LA0j3PuvfCtOX8KXFP2/tjoIjxeGt7xfJ4tFQ=;
 b=HgU0NTXaXQdo9GAI3w3FfTLEnYrGkhX5gPAEOyGdJnCASGzUfsnuNnJ+fGrlXIPtXJleSkbKAbNrhHUCff/PltowhJjy2pAvscgiCTaJ/XAN0T/itqHC9x4dAiCyEb0dC2bSGmPVWamkO5SJGR8yIv9HXfdydpSGPkNYCj6GvQZxdMsCLPONLd/98ZxQxZKOCHFsGm0+8E6rB4Cb084osiIBfk+Y4cP6v9fJr6SXwxE07Wkh8y59osL55fcqH5hL8uwJXtxFEK4aGsUzIIRG6T7CXrrNw+n+9px1T6rlXZjq9WhnchcLAglpD/0WzM6b2poy6s8FXo39hbcU7XyNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv14y0LA0j3PuvfCtOX8KXFP2/tjoIjxeGt7xfJ4tFQ=;
 b=W03kVj/ezIn04wub9MwGSUV5rlkFqZxVItR4/CCOQ2HP0hqjXxOjkNZAOqpDiWxr5/7+FoLy9NJelk/TDX8XzFYOOHiwmJm9ynXzXIcSd8iS+ILhaJikYwRcqk8hnBUDP6ww0srVRmI+iNhC17g0GboG88/OvlO3ipYUdaJfv6Q2f48mvwkC11O9yGsHKVtVFZmzYai3u6iaGPUVwvUiZZqnCABMjwlqjVxUxESVtOIy2PFiAk8tNt8UE/wqVbpgZsYlVmk5h7jZls+xnRAWuCEF0TRdVvPWD7xcCMQJ/KtNAwT553gfxjg5xIovci3CXNfnRqOMy9GeKyakmvVVZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v13 11/14] xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
Date: Tue, 27 Oct 2026 23:06:00 +0200
Message-ID: <481848fb2d9ada11e6e4661e4a4e6b2d4e80eecc.1793129971.git.mykola_kvach@epam.com>
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
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAVPR03MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: a247a8ab-a93d-43dc-6278-08df346e2bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261026121527099003|260925021311599003|261022075727099003|260925021911599003|11063799006|5023799004|56012099006|261009223027099003|260925022911599003|261021121427099003|261022105027099003|22082099003|18002099003|6133799003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	I0pB+pVVdeyhz/UI9lBCVlNNuZex3Kz/O9ZNHra4/8YjiuX66RSHpHkQ/PV6ViGrkcUjAsPBjm4V9ALMukygB4j4f4UITiAPHGmzND28WOWy46MSAMwmS8YDMAQ9Ejnqj6tVYoSGXKdeUhcP3TKTzxbmnGy86EKASMCsV3eo5CfzDu2vkj8DTp++QhBugJs1i4YcucJ5FLzdtpS31Q8zT32qdhcRFjjiZf6JZX8dMLnjAiUXStBWkj7qL4qAuxJN3MR9M2OkGYwH0B/ZX2hjFuSv8+UKwty2x8mkKT8gFHx8IWZHi+a7uobCQzSW/i1IOEv6SDXVGEn8njP/f3rXTj6dUhMbuBPakUPmX6lQu8iYn5kOqAjDK00dv6SMb/fpz82FFgql867svCTcqBSwCNvhtLPNudRMGFD1wYrSdtErHE6xVbaeJzFdNYhdIYltNbw+DglVAYSozrIibkeJA+nx50wSM+atcXqdvujVOafRwkiEU9u98PEenarV7ZFUc/wLvq8Orrn6m6GyjJ7BZFzqf9nOhwpo3WWQKAqhqj3IbQX8R7Q81jwjSm9ChAPrTp7cT5BaiWFIlTv8DRL71jdqk0eosKDgIU+bvWmMMLuL/1kDm6pwpeLZWzIWX8Mdv2/EZVXjFYhbpIOOKxXVI/iLAg9HPZVVF6mkDMFftL8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261026121527099003)(260925021311599003)(261022075727099003)(260925021911599003)(11063799006)(5023799004)(56012099006)(261009223027099003)(260925022911599003)(261021121427099003)(261022105027099003)(22082099003)(18002099003)(6133799003)(10067099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B35nRM2GHEvwxGolr+JXF595VcTC0z4nRZmNezyybHSLPU782m6lBlmD7uhJ?=
 =?us-ascii?Q?DmTtwiRCKvzAcgaHSFwFDuF3s/ilJR5QulUc84BLF3Eb2hBXmcll09VT33iO?=
 =?us-ascii?Q?X3DUwaWwjUEKBGNtyUPmtALp/0Ujj3TbLYekwHELr8nqSM4Hb42E24C+B/du?=
 =?us-ascii?Q?nMm1EGZSJhB6aVajtnraqhQ9JU3O+xfay/EWlpOCVZBUCR4s8fZ2EWTzuZns?=
 =?us-ascii?Q?Axm5YeCW0KRNM7LOhm57ywaUSyXCMj8HIkjUVXfoPVArxEzsbhsaPTpUWR5i?=
 =?us-ascii?Q?YdGd4mE4CHxw8u6KBNCknVkDzqrEnFMLoDXxwiUs59SF/Cm4B57JmV2yYKz9?=
 =?us-ascii?Q?ozB0AK4ohh979wfCg15AvDsgNAUiMZg8+MTifWHfLeCruOk27otcMc381cXc?=
 =?us-ascii?Q?W/WNtXCosinEZha1bCBFvxc36pJXutkzVsPY9D8xBOVTlolGQQv17VlVWnwf?=
 =?us-ascii?Q?9GSLDXzFqKI4yggEbM8IkF16j6FgYlWgdgweIrkZ4zuVTdYO474H7tMe9k0n?=
 =?us-ascii?Q?GVGMyA+jsPdyyfUiiWyQVhmyDqgpLJu4/8rNz3IAbytG0LpELN8AE/wzwAbj?=
 =?us-ascii?Q?IAUzhbMssYvYsTb7in9M1um0LQ57pDbIkrwh+KEhF7csvii7I2lQczMnDgIY?=
 =?us-ascii?Q?tCD5Ez9FQKI6pJMkcKvnE+wcowHDgbyZXqyBpGII6bHgJqYuGNlE3rmRISkN?=
 =?us-ascii?Q?g5Vv1PcIcOm4QuP5776cUkJRryw6WAu07iAyP4Z5TaSoqxxWUrwpCcoaYGRx?=
 =?us-ascii?Q?Moq3R6uYSHzIuRjpaSBGmbwhh7o2wWuviyG8yIXnOlGEM3XZJQE6hz/jl/AS?=
 =?us-ascii?Q?HV0bDYqrX1XiAI8PXxRKm/+mFcVZUIDiXmVrBQZe2FTHNY9Igx6lL398NkEL?=
 =?us-ascii?Q?K9zyimozFS5DrniY379COL8FFAOu+LZ11jcxe90aalN2yr2Iq+TWkWboLVbj?=
 =?us-ascii?Q?OLZs71lFZqRy5gx17RyP6CxKv7y/exa54tXwyqH7rGcWVIS9r5G9ZlZzJLy5?=
 =?us-ascii?Q?m4kgPRxIB7btxqXOHha36lcmUqtgOS3ZXA9DqDGTxZHKXXYjWQQ/Z0lU57KN?=
 =?us-ascii?Q?9RZlsed7mZ2f5aYMIMfNgzObKVZP/sI7UNTnobqHoO3yTIUSxfnoOjBFtiqe?=
 =?us-ascii?Q?iXBMZbor7rGqvK9xz825Du64zS9zxRq31AtFvDvBmxrZTuBoz/u63cjlyuRy?=
 =?us-ascii?Q?qNaLNjLjTwe7Vs5KJ0VOJMS/2XCcQtowsWGLP2dJQJnw0tkho2QjJWkXiQtH?=
 =?us-ascii?Q?z6sR/K07XebO98CCHeURlJUROgJga9UMblRIN1MANs5lOPYPzS7XNv1s/Y+7?=
 =?us-ascii?Q?wyiZnp1l7UvGElmlJ6gVIKeoQlb51dms34YDJMVxNLa283hCVO01Rr+RWuwt?=
 =?us-ascii?Q?kiQB4VxTacXNF9gSH0cmi1sEj6L4ZVwcpalfu4C9Y+qMnWf8LLUpH6n07cKf?=
 =?us-ascii?Q?bY/fd5Z9nhCVTk6FY9NufVBuOgqLxp4eRVLrCW3V7Ds2HYayfuJet+JeEodr?=
 =?us-ascii?Q?RrMWXUn682tE2ZYzVU62XuLAX3uNrYrve5t/c+Upi9xUNK/7NxrdgLNKcfGp?=
 =?us-ascii?Q?ZiHtce/B6zFLl/ASTDwmqJiKi4q59xh0BWtQw7k+bpBMR4iR5rADs7tp9oEY?=
 =?us-ascii?Q?Yfqjoe6R0+R2p6qwHIRyRXy9FRmZVDR4o6//aK6IkLI2VwTJIN6wbu02t2SV?=
 =?us-ascii?Q?JzpkaYY1jZcSmTXQVcCeJWRMTbWNrt0ZcBbTeAkQBXhL3QHSCE7P/TXX/jio?=
 =?us-ascii?Q?VG3H3ILYTw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a247a8ab-a93d-43dc-6278-08df346e2bfa
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:30.0028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJbr+9WOkZ1A733yjmQHj7LayBDYKR1I33seR14G2VFe70000CSqOh0ja8nDEWHMhcHhCnOHEvU9nrxN/40Ciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9573
X-purgate-ID: tlsNG-ebf023/1793135191-51ED6B50-6453FE2A/0/0
X-purgate-type: clean
X-purgate-size: 11545
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mirela Simonovic <mirela.simonovic@aggios.com>

On wakeup from PSCI SYSTEM_SUSPEND, Xen re-enters EL2 with the MMU and
data cache disabled. The resume path must first switch back to Xen's
runtime page tables before it can access the saved CPU context using
virtual addresses.

Add an arm64 hyp_resume trampoline that reuses enable_secondary_cpu_mm()
to enable the data cache and MMU, switch to init_ttbr, and resume in the
runtime virtual mapping. The trampoline then restores the saved CPU
general-purpose and system-control register context.

prepare_resume_ctx() must be invoked just before the PSCI system suspend
call is issued to the platform firmware. It saves the current CPU context
and returns a non-zero value so that the caller enters the physical
SYSTEM_SUSPEND call.

On resume, hyp_resume restores the saved context, including the saved link
register. Control therefore returns to the place where prepare_resume_ctx()
was called. To avoid re-entering the suspend path, the restored path sees
prepare_resume_ctx() return zero.

The assembly save/restore code uses offsets generated by asm-offsets.c
from struct resume_cpu_context, keeping the assembly memory accesses in
sync with the C structure layout.

Support for ARM32 is not implemented. Instead, compilation fails with a
build-time error if suspend is enabled for ARM32.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v10:
- Save and restore CNTHCTL_EL2 across SYSTEM_SUSPEND

Changes in v9:
- Drop the misleading prepare_resume_ctx() pointer argument and make both
  save/restore paths use the global resume_cpu_context.
- Squash the arm64 resume trampoline into the context save/restore patch.
- Document in code that hyp_resume relies on PSCI initial-state rules.
- Use generic platform firmware wording instead of ATF-specific wording.
- Rename the saved context type/storage to resume_cpu_context and rely on
  implicit zero-initialization for the file-scope object.
- Use asm-offsets.c-generated RESUME_CTX_* offsets to keep the assembly
  save/restore code in sync with struct resume_cpu_context.

Changes in v8:
- Fix alignments in code.

Changes in v7:
- No functional changes, just moved commit.
---
 xen/arch/arm/Makefile              |   1 +
 xen/arch/arm/arm64/asm-offsets.c   |  21 +++++
 xen/arch/arm/arm64/head.S          | 122 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/suspend.h |  27 +++++++
 xen/arch/arm/suspend.c             |  14 ++++
 5 files changed, 185 insertions(+)
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index cdcec8cd03..09640090b4 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -52,6 +52,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 38a3894a3b..5d60406e9c 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -13,6 +13,7 @@
 #include <asm/mm.h>
 #include <asm/setup.h>
 #include <asm/smccc.h>
+#include <asm/suspend.h>
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""\
@@ -57,6 +58,26 @@ void __dummy__(void)
    OFFSET(INITINFO_stack, struct init_info, stack);
    BLANK();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+   OFFSET(RESUME_CTX_X19, struct resume_cpu_context, callee_regs[0]);
+   OFFSET(RESUME_CTX_X21, struct resume_cpu_context, callee_regs[2]);
+   OFFSET(RESUME_CTX_X23, struct resume_cpu_context, callee_regs[4]);
+   OFFSET(RESUME_CTX_X25, struct resume_cpu_context, callee_regs[6]);
+   OFFSET(RESUME_CTX_X27, struct resume_cpu_context, callee_regs[8]);
+   OFFSET(RESUME_CTX_X29, struct resume_cpu_context, callee_regs[10]);
+   OFFSET(RESUME_CTX_SP, struct resume_cpu_context, sp);
+   OFFSET(RESUME_CTX_VBAR_EL2, struct resume_cpu_context, vbar_el2);
+   OFFSET(RESUME_CTX_VTCR_EL2, struct resume_cpu_context, vtcr_el2);
+   OFFSET(RESUME_CTX_VTTBR_EL2, struct resume_cpu_context, vttbr_el2);
+   OFFSET(RESUME_CTX_TPIDR_EL2, struct resume_cpu_context, tpidr_el2);
+   OFFSET(RESUME_CTX_MDCR_EL2, struct resume_cpu_context, mdcr_el2);
+   OFFSET(RESUME_CTX_HSTR_EL2, struct resume_cpu_context, hstr_el2);
+   OFFSET(RESUME_CTX_CPTR_EL2, struct resume_cpu_context, cptr_el2);
+   OFFSET(RESUME_CTX_HCR_EL2, struct resume_cpu_context, hcr_el2);
+   OFFSET(RESUME_CTX_CNTHCTL_EL2, struct resume_cpu_context, cnthctl_el2);
+   BLANK();
+#endif
+
    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
    OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 7d1e205353..7794eb4c6e 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -563,6 +563,128 @@ END(efi_xen_start)
 
 #endif /* CONFIG_ARM_EFI */
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/*
+ * int prepare_resume_ctx(void)
+ *
+ * CPU context saved here will be restored on resume in hyp_resume function.
+ * prepare_resume_ctx shall return a non-zero value. Upon restoring context
+ * hyp_resume shall return value zero instead. From C code that invokes
+ * prepare_resume_ctx, the return value is interpreted to determine whether
+ * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
+ */
+FUNC(prepare_resume_ctx)
+        ldr   x0, =resume_cpu_context
+
+        /* Store callee-saved registers */
+        stp   x19, x20, [x0, #RESUME_CTX_X19]
+        stp   x21, x22, [x0, #RESUME_CTX_X21]
+        stp   x23, x24, [x0, #RESUME_CTX_X23]
+        stp   x25, x26, [x0, #RESUME_CTX_X25]
+        stp   x27, x28, [x0, #RESUME_CTX_X27]
+        stp   x29, lr, [x0, #RESUME_CTX_X29]
+
+        /* Store stack-pointer */
+        mov   x2, sp
+        str   x2, [x0, #RESUME_CTX_SP]
+
+        /* Store system control registers */
+        mrs   x2, VBAR_EL2
+        str   x2, [x0, #RESUME_CTX_VBAR_EL2]
+        mrs   x2, VTCR_EL2
+        str   x2, [x0, #RESUME_CTX_VTCR_EL2]
+        mrs   x2, VTTBR_EL2
+        str   x2, [x0, #RESUME_CTX_VTTBR_EL2]
+        mrs   x2, TPIDR_EL2
+        str   x2, [x0, #RESUME_CTX_TPIDR_EL2]
+        mrs   x2, MDCR_EL2
+        str   x2, [x0, #RESUME_CTX_MDCR_EL2]
+        mrs   x2, HSTR_EL2
+        str   x2, [x0, #RESUME_CTX_HSTR_EL2]
+        mrs   x2, CPTR_EL2
+        str   x2, [x0, #RESUME_CTX_CPTR_EL2]
+        mrs   x2, HCR_EL2
+        str   x2, [x0, #RESUME_CTX_HCR_EL2]
+        mrs   x2, CNTHCTL_EL2
+        str   x2, [x0, #RESUME_CTX_CNTHCTL_EL2]
+
+        /* prepare_resume_ctx must return a non-zero value */
+        mov   x0, #1
+        ret
+END(prepare_resume_ctx)
+
+FUNC(hyp_resume)
+        /*
+         * PSCI states that SYSTEM_SUSPEND follows the CPU_SUSPEND initial
+         * state rules, so PSCI-compliant firmware must enter the return
+         * exception level with DAIF masked.
+         */
+
+        /* Initialize the UART if earlyprintk has been enabled. */
+#ifdef CONFIG_EARLY_PRINTK
+        bl    init_uart
+#endif
+        PRINT_ID("- Xen resuming -\r\n")
+
+        bl    check_cpu_mode
+        bl    cpu_init
+
+        ldr   x0, =start
+        adr   x20, start             /* x20 := paddr (start) */
+        sub   x20, x20, x0           /* x20 := phys-offset */
+        ldr   lr, =mmu_resumed
+        b     enable_secondary_cpu_mm
+
+mmu_resumed:
+        /* Now we can access the saved context, so restore it here. */
+        ldr   x0, =resume_cpu_context
+
+        /* Restore callee-saved registers */
+        ldp   x19, x20, [x0, #RESUME_CTX_X19]
+        ldp   x21, x22, [x0, #RESUME_CTX_X21]
+        ldp   x23, x24, [x0, #RESUME_CTX_X23]
+        ldp   x25, x26, [x0, #RESUME_CTX_X25]
+        ldp   x27, x28, [x0, #RESUME_CTX_X27]
+        ldp   x29, lr, [x0, #RESUME_CTX_X29]
+
+        /* Restore stack pointer */
+        ldr   x2, [x0, #RESUME_CTX_SP]
+        mov   sp, x2
+
+        /* Restore system control registers */
+        ldr   x2, [x0, #RESUME_CTX_VBAR_EL2]
+        msr   VBAR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_VTCR_EL2]
+        msr   VTCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_VTTBR_EL2]
+        msr   VTTBR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_TPIDR_EL2]
+        msr   TPIDR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_MDCR_EL2]
+        msr   MDCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_HSTR_EL2]
+        msr   HSTR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_CPTR_EL2]
+        msr   CPTR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_HCR_EL2]
+        msr   HCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_CNTHCTL_EL2]
+        msr   CNTHCTL_EL2, x2
+        isb
+
+        /*
+         * Since context is restored return from this function will appear
+         * as return from prepare_resume_ctx. To distinguish a return from
+         * prepare_resume_ctx which is called upon finalizing the suspend,
+         * as opposed to return from this function which executes on resume,
+         * we need to return zero value here.
+         */
+        mov   x0, #0
+        ret
+END(hyp_resume)
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 31a98a1f1b..c848fc6340 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -3,6 +3,8 @@
 #ifndef ARM_SUSPEND_H
 #define ARM_SUSPEND_H
 
+#include <xen/types.h>
+
 struct domain;
 struct vcpu;
 struct vcpu_guest_context;
@@ -14,6 +16,31 @@ struct resume_info {
 
 void arch_domain_resume(struct domain *d);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+#ifdef CONFIG_ARM_64
+struct resume_cpu_context {
+    register_t callee_regs[12];
+    register_t sp;
+    register_t vbar_el2;
+    register_t vtcr_el2;
+    register_t vttbr_el2;
+    register_t tpidr_el2;
+    register_t mdcr_el2;
+    register_t hstr_el2;
+    register_t cptr_el2;
+    register_t hcr_el2;
+    register_t cnthctl_el2;
+} __aligned(16);
+#else
+#error "Define resume_cpu_context structure for arm32"
+#endif
+
+extern struct resume_cpu_context resume_cpu_context;
+
+int prepare_resume_ctx(void);
+void hyp_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* ARM_SUSPEND_H */
 
 /*
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..6ea4a0f9cc
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/suspend.h>
+
+struct resume_cpu_context resume_cpu_context;
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.53.0


