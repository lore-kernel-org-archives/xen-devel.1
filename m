Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DBF606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=wIDLhcnK
Received: from list by lists.xenproject.org with outflank-mailman.1503164.1698980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWUpZ-0000ou-CU; Thu, 26 Nov 2026 08:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503164.1698980; Thu, 26 Nov 2026 08:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWUpZ-0000om-8l; Thu, 26 Nov 2026 08:27:49 +0000
Received: by outflank-mailman (input) for mailman id 1503164;
 Thu, 26 Nov 2026 08:27:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Changlei.Li@citrix.com>) id 1xWUpX-0000og-Ko
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 08:27:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWUpW-00ERU6-Mz
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 09:27:46 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Changlei.Li@citrix.com>)
 id 6b07ed80-2eae-0a2a0a5409dd-0a2a4509ebd2-2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 09:27:46 +0100
Received: from [40.93.195.51]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Changlei.Li@citrix.com>)
 id 6b07ed80-be1a-0a2a45090019-285dc3331b85-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 09:27:46 +0100
Received: from LV4PPF5EFB6ADBA.namprd03.prod.outlook.com
 (2603:10b6:40f:fc02::20d) by SJ0PR03MB5888.namprd03.prod.outlook.com
 (2603:10b6:a03:2d6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 08:27:42 +0000
Received: from LV4PPF5EFB6ADBA.namprd03.prod.outlook.com
 ([fe80::7166:4b26:da40:2eb4]) by LV4PPF5EFB6ADBA.namprd03.prod.outlook.com
 ([fe80::7166:4b26:da40:2eb4%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 08:27:42 +0000
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
 b=eok0civWZNf15w5mhh8cqVf6PufRahQtY/pzhen0gmZ6khXLpEGN+Ruq+du+D1fGyUJarAx0LCM2q8+AsPIhxpBasEuJFnn7hM5Uk9fXw4Po67dKGRtnSssAfJYWXEJ/Y96kbHQOSz28hc6AtvF8WD8oX7gkj27aQCAhvHz2iGS8NiFyJKaAmQ3vXV+4KWE4lMNok3ir5ZgZXj4/jcpZcZUUH3YQFAM5xiT7hyd1MsioIzumT+Nl+2DvWpDczKH8sRyVYcwAsl32cIIC5w7R7m5sDzD5FxqBT8bYv+ER4hY6OsBD+ljwqWfrPrn2HLSQE8rGnok0Bkd1UpMKBLBBJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akhQ8g7LM8883vB1M5yk684p1nNpz7TSsqWKCye26Oo=;
 b=JXT59PKaZISaph6GqUQdsxIrsuujw1DGooFqKS3Cfhbcu3NmvzLGH/30rt9hnkE+/TYkuSE2l6VAA+cNiJrWn880iPusueTEvj5dVo/IEwO9gbYw3mY2/C0g2x3pYtI4xqB7qpuZSGfA9PwuB+4z0unw4VnZqSLYFrOmgPy8Q5X/sepB2oi9OgqWwE7EpGcJv1Y0ZZ/zCU/mlwqEPSHDxx7Xob+MObpVqa9zBgU3e63Vq7SPAJg5MQJbm1D6eHQE6hlZPsyiERiEG06aUt7CQe+4qDZHPAC5MTqn/HOz9DFV6k/esfgkKH6m4OZ2DnzyTMujIhy7MnXyP32/hKcXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akhQ8g7LM8883vB1M5yk684p1nNpz7TSsqWKCye26Oo=;
 b=wIDLhcnKYLOxRvZxY8rOFRgLiWJ7HF/r2LMbuRQuAFWdcmJXcavuOFj6ZRMflr6b2ElwqiZ41Zt0LrYh5zxdeqrcOuY161zgwGLcnJDchq4sYxzK4WZlDgPy/WX00YdtDNxGpt0/5QZ3OaGCKYwoXq4+af67c6Q4ozkC1RlnBr8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Changlei Li <changlei.li@citrix.com>
To: changlei.li@citrix.com,
	xen-devel@lists.xenproject.org
Subject: [XEN PATCH] tools/xenconsoled: add --syslog option
Date: Thu, 26 Nov 2026 16:27:27 +0800
Message-ID: <0242bd9b817ac4d56f68bf6381167d1e6410b1ff.1795681198.git.changlei.li@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0010.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::9) To LV4PPF5EFB6ADBA.namprd03.prod.outlook.com
 (2603:10b6:40f:fc02::20d)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV4PPF5EFB6ADBA:EE_|SJ0PR03MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 83541ea6-2ec1-45b1-27a3-08df4b9723c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|261009223027099003|18002099003|3023799007|10067099003|11063799006|56012099006|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261022113327099003;
X-Microsoft-Antispam-Message-Info:
	PPXJ7ej0EBJmNrh4N3+rBCyxaWNDXORIh6CWi0QzxAk2LuDKA8B+KZEF/+P8WCie7CTnT+qiovIPNC6pu2JsD/wcYQIlOiiUfRltEty1CjCnTjEEW9KRXecsDbE6AaER7DlZZSPwom1IEmCUk7yKsa+q9cRgaXfNw/utgsGWjXt3lYuowVmXXjY9F0DPR0bSXFdlerItO///MS1unSaaPjBxZNRSVpT3ga5MzCxw2pBbHlZocDXsM/jH2v1GvOWsfQz0yeZgzYlT3eUKYLc8/OBHq25vkGH7QPUzwAJ/l1qY6WY/aJFvoLAr4S0jxziRZj9YVEFMMNuRmk3pukLEBNfiPjxGxCBnXwT0WPgaUZNc9EN5M+7TxxsADXtdrhQTy2/OqVv+AHc9TAhyM2XCU67eSaU7XHk8JdGRDJ7SxPGfxGb3aGLQaIvwA2OFt/JzbbkKCo27Pe5KnFFZc+LZ42atZR9aLWnvMpd8iBdkSnVwA/LuMLXsSnzwqViwanJ93mosCsXtY/zvK1OR3sSDyiV5rR9i+lb3QFiicFTZ1I3+Q+I/52EdPpjw7GlAn8bAwd9oVJKHAOqNsP9AVpATVSDjxHqa61lyGCN6HuS9yj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV4PPF5EFB6ADBA.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(261009223027099003)(18002099003)(3023799007)(10067099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022113327099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sokyj0qCNXwgNsp9+A80Kss+Cez1i9NawxqGh9W0lturlEegI02/IH2pBIsg?=
 =?us-ascii?Q?XgqJb5Q2LOcIBwCbodvYfXlO4kJfKaiT9fu+wHorIpzLCLdX2C6u9cmYMUu0?=
 =?us-ascii?Q?bXJ9WiMGkgmLNV2TxWFDdxnQdbsXhzIOwOaoAB9hE3+TEofSYj8Yzbic+PQF?=
 =?us-ascii?Q?Aphwp2vzqFnNjdtGK6hlV4GML4A1SRpYropHd9j2dFNAimchWCcQ0oe9x5vM?=
 =?us-ascii?Q?bmIknD4THjvqdlOXAzLCMOlQOew8SuL3sOyG5nIWLHPUE1ucmqpCwXQhHO3z?=
 =?us-ascii?Q?Xyb2GC96g/x4iJmCd9Kuo9NPtpbfaEBrMdCULoBnHx8r8PJhuls8Y3s83RMB?=
 =?us-ascii?Q?OVLMbA9MI5nnwEOYU9UT1AaoQ97+Dn3jepzswDlF+zmaLKCHgsFD08c7zSf2?=
 =?us-ascii?Q?7+Xue25UbNoOQK35TaYWOS+qNS6grUUgR2VeZKF4MjmTEZh90Uz2TzcuzVWd?=
 =?us-ascii?Q?wnVZfaPiXOt534QzMaLc4cRx1SXE6aV4cigk7jD5Q+U4QgUDisOca0rQNa0N?=
 =?us-ascii?Q?lnDY0dc2vTtlUwsrdUol5aScr9nYejqb6vlj+hdVDHt2VHwJsUKAcO+sEjt/?=
 =?us-ascii?Q?3amdYbHUxuxjjYtjRZPxEONqi7aQymg3ij9pu53b2Dr/NGCsh0TWSgVVPUUg?=
 =?us-ascii?Q?xkWNdrERtX7DFfs6EILCakHZ7RX8bpr4Z2bMrbZ55F+9MNV2Nd+7KBbdK9Wx?=
 =?us-ascii?Q?VnACzF362Pxu66Dll8+3mgL09RdTNmx0eu+ruHoH6y0MRlywXZaLnNNa/AHV?=
 =?us-ascii?Q?eMIUh49F5kFjdbcUDiPxVE/c3r7TkF2YRUP5UFoDfxEMzNGjREv79sh2b/SW?=
 =?us-ascii?Q?MqF0R/PXi1taVt/CHwBMk5S5mybScV1eM0IesZjBAOOSRERJjnwVEolXIVV2?=
 =?us-ascii?Q?XCDC4E0eUyhplXN5WdJAuKL4xK6L+n7i/kN4KXi0lt8/dJt2rQusVgTkD1KS?=
 =?us-ascii?Q?/VmPtSNvnOGkAlr+OdDS14xWF5sUZ3WEciVViS95MGtvlxxlmLA8THZxmFGR?=
 =?us-ascii?Q?8MCYCJxrFBodpn7C4hc4fH4FcbJnn3iQwlrwMd796w+b0POLtaHjBxCmv6FJ?=
 =?us-ascii?Q?9nXFhMXdJTVHfxqTlKiaK+zqtni4Wzx/0Er9E+njqe6Qs/t8V9Cv6p6AQqEy?=
 =?us-ascii?Q?OYJIxwq6HMzJ3DbmzuY5Z2R5e1Zl3LKUJfrM1urrtrEEp5MlfB/V9UvCf6JK?=
 =?us-ascii?Q?HJ+iMk+VNU1xBjR5kJXgeQPEOKM/Jo8yfbO65XCuF2cm+gNzV6EGCnfslyvB?=
 =?us-ascii?Q?rTiZYP6ibvKBTNgI/bkbkf4GnP5kW2bhS/+JiDEQz5GmkZ+q+0QyqBSauSyr?=
 =?us-ascii?Q?MWQWimJ5Hvf59cV3mdfxP8f05qPr+iqTlgKuuKTbZ1BdGGJ/KBPE1NOru/8v?=
 =?us-ascii?Q?jr7SLwWVYhugpRqaMbqvbURF5hapGSYE2AuBzUimIkjJOr3X0AUAYHk1J0wc?=
 =?us-ascii?Q?PuwG1Cnclu7TtMmrJ+QOTm2ii+BWtEt7GNnr9OmBptJFaYFdvGoUiv1KZ/4Z?=
 =?us-ascii?Q?GvNwuhMbZiVk1VtzNR/dFwzVPTXU5x0sgFDRDcJE/R+wFaXKCxL7pHMIfk0K?=
 =?us-ascii?Q?gBdeNJyz9KgeJwo3ZwAbe6OJ2DMTmMobtxq0mk6F8PC174cRQroSQ1C0uF1b?=
 =?us-ascii?Q?wIbSUPE6PTAsSP5X8l/RHptmzx3ooPTY3EuyGCk4G72O0cm+dYyHuBixkBPu?=
 =?us-ascii?Q?Ub4P6Se7IQzJlYKr/hJs7oIe7taQkitfEfFdBFURJANltB2hQeMM7/LZ9YPS?=
 =?us-ascii?Q?25Sqio8tng=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83541ea6-2ec1-45b1-27a3-08df4b9723c4
X-MS-Exchange-CrossTenant-AuthSource: LV4PPF5EFB6ADBA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 08:27:42.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGV/PrSgFLFzWflGXMIDzxagwd9GksiXYOyyfhQezPydoorp6m3nDZ1GSPp3GQlqkaNsUSfJmzgi/sjaCfD/Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5888
X-purgate-ID: tlsNG-bad1c0/1795681666-BE2C4034-413AB026/0/0
X-purgate-type: clean
X-purgate-size: 14354
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hypervisor and guest console logs can only be written to files
today, so they are not part of the host's syslog stream and are not
forwarded with it.

Add a --syslog=none|guest|hv|all option, with the same values as --log.
Each line of console output is sent to syslog at LOG_INFO, facility
LOG_DAEMON. Hypervisor lines use the ident "hypervisor". Guest lines use
"guest-<name>" ("guest-<name>-vuart0" for the vUART), which matches the
guest log file name. xenconsoled keeps its own "xenconsoled" ident for
its messages, so the sources can be told apart without relying on
levels.

syslog(3) keeps one ident, option set and log mask per process. For
each console line, the ident, options and mask are switched and then
restored, so xenconsoled's own logging is unchanged. xenconsoled is
single-threaded, so no other message can be logged in between.

Each console has its own line buffer, and so does the hypervisor log.
A line is sent when its newline arrives, so a line written in several
parts becomes one syslog message. A line longer than 960 bytes is split.
A partial line is sent when a guest console is cleaned up, or when
xenconsoled leaves its main loop. It is lost when xenconsoled is killed,
for example by SIGTERM. A trailing '\r' is removed, as guest consoles
usually end lines with "\r\n". Guest output is passed to its buffer in
buffer_append(), where it is written to the guest log file, so overflow
discard does not affect it.

The guest name comes from xenstore. In the ident, ASCII characters other
than A-Z, a-z, 0-9, '.', '_' and '-' are replaced with '_', so the name
cannot break syslog tag parsing. Non-ASCII (UTF-8) bytes are kept, so
names in other scripts stay readable and distinct. The ident is limited
to 127 bytes, cut on a UTF-8 character boundary, and keeps the vUART
suffix. The xenstore read of the name is shared with the guest log file
code.

--log keeps controlling file output and the two options are independent,
so --log=none --syslog=hv sends the hypervisor log to syslog only.
--timestamp and --log-dir only apply to file output; --replace-escape
applies to both. An unknown --syslog value is an error.

Signed-off-by: Changlei Li <changlei.li@citrix.com>
---
 CHANGELOG.md                |   2 +
 tools/console/daemon/io.c   | 195 +++++++++++++++++++++++++++++++-----
 tools/console/daemon/main.c |  26 ++++-
 3 files changed, 196 insertions(+), 27 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index f967437eda..851c1ad6f6 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -17,6 +17,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      afterwards.
 
 ### Added
+ - xenconsoled: new --syslog=none|guest|hv|all option to send console output
+   to syslog.
 
 ### Removed
  - On Arm:
diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index b6c46d11de..1090336bbe 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -63,16 +63,29 @@
 extern int log_reload;
 extern int log_guest;
 extern int log_hv;
+extern int syslog_guest;
+extern int syslog_hv;
 extern int log_time_hv;
 extern int log_time_guest;
 extern char *log_dir;
 extern int discard_overflowed_data;
 extern int replace_escape;
+extern int syslog_option;
 
 static int log_time_hv_needts = 1;
 static int log_time_guest_needts = 1;
 static int log_hv_fd = -1;
 
+struct syslog_line {
+	/* glibc keeps the whole ident; musl keeps at most 31 bytes. */
+	char ident[128];
+	size_t len;
+	/* No limit in glibc; fits musl's 1024-byte buffer with the header. */
+	char data[960];
+};
+
+static struct syslog_line hv_syslog = { .ident = "hypervisor" };
+
 static xengnttab_handle *xgt_handle = NULL;
 static xenforeignmemory_handle *xfm_handle;
 
@@ -94,6 +107,7 @@ struct console {
 	int master_pollfd_idx;
 	int slave_fd;
 	int log_fd;
+	struct syslog_line *syslog;
 	struct buffer buffer;
 	char *xspath;
 	const char *log_suffix;
@@ -296,6 +310,53 @@ static int write_with_timestamp(int fd, const char *data, size_t sz,
 	return 0;
 }
 
+static void syslog_line_flush(struct syslog_line *line)
+{
+	int mask;
+
+	/* Guest consoles usually end lines with "\r\n". */
+	while (line->len && line->data[line->len - 1] == '\r')
+		line->len--;
+	if (!line->len)
+		return;
+
+	/*
+	 * Own tag, no flags and own mask, restored afterwards; safe as we are
+	 * single-threaded. No LOG_CONS/LOG_PERROR: the line must not loop
+	 * back into the console ring or be duplicated on stderr.
+	 */
+	mask = setlogmask(LOG_MASK(LOG_INFO));
+	openlog(line->ident, 0, LOG_DAEMON);
+	syslog(LOG_INFO, "%.*s", (int)line->len, line->data);
+	openlog("xenconsoled", syslog_option, LOG_DAEMON);
+	setlogmask(mask);
+	line->len = 0;
+}
+
+static void syslog_line_write(struct syslog_line *line, const char *data,
+			      size_t sz)
+{
+	size_t i;
+
+	for (i = 0; i < sz; i++) {
+		char c = data[i];
+
+		if (c == '\n') {
+			syslog_line_flush(line);
+			continue;
+		}
+		/* Strip \r after a newline, like write_with_timestamp(). */
+		if (c == '\r' && !line->len)
+			continue;
+		if (c == '\033' && replace_escape)
+			c = '.';
+
+		line->data[line->len++] = c;
+		if (line->len == sizeof(line->data))
+			syslog_line_flush(line);
+	}
+}
+
 static inline bool buffer_available(struct console *con)
 {
 	if (discard_overflowed_data ||
@@ -361,6 +422,10 @@ static void buffer_append(struct console *con)
 			      dom->domid, errno, strerror(errno));
 	}
 
+	if (con->syslog)
+		syslog_line_write(con->syslog,
+				  buffer->data + buffer->size - size, size);
+
 	if (discard_overflowed_data && buffer->max_capacity &&
 	    buffer->size > 5 * buffer->max_capacity / 4) {
 		if (buffer->consumed > buffer->max_capacity / 4) {
@@ -433,30 +498,37 @@ static int create_hv_log(void)
 	return fd;
 }
 
-static int create_console_log(struct console *con)
+static char *read_domain_name(struct domain *dom)
 {
-	char logfile[PATH_MAX];
 	char *namepath, *data, *s;
-	int fd;
 	unsigned int len;
-	struct domain *dom = con->d;
 
 	namepath = xs_get_domain_path(xs, dom->domid);
 	s = realloc(namepath, strlen(namepath) + 6);
 	if (s == NULL) {
 		free(namepath);
-		return -1;
+		return NULL;
 	}
 	namepath = s;
 	strcat(namepath, "/name");
 	data = xs_read(xs, XBT_NULL, namepath, &len);
 	free(namepath);
-	if (!data)
-		return -1;
-	if (!len) {
+	if (data && !len) {
 		free(data);
-		return -1;
+		return NULL;
 	}
+	return data;
+}
+
+static int create_console_log(struct console *con)
+{
+	char logfile[PATH_MAX];
+	char *data;
+	int fd;
+
+	data = read_domain_name(con->d);
+	if (!data)
+		return -1;
 
 	snprintf(logfile, PATH_MAX-1, "%s/guest-%s%s.log",
 		 log_dir, data, con->log_suffix);
@@ -482,6 +554,45 @@ static int create_console_log(struct console *con)
 	return fd;
 }
 
+static struct syslog_line *create_console_syslog(struct console *con)
+{
+	struct syslog_line *line;
+	char *name, *p;
+	size_t len, name_max;
+
+	name = read_domain_name(con->d);
+	if (!name)
+		return NULL;
+
+	line = calloc(1, sizeof(*line));
+	if (line == NULL) {
+		dolog(LOG_ERR, "Memory allocation failed");
+		exit(ENOMEM);
+	}
+
+	/* Keep the suffix and whole UTF-8 characters if the name is cut. */
+	name_max = sizeof(line->ident) - strlen("guest-") -
+		   strlen(con->log_suffix) - 1;
+	len = strlen(name);
+	if (len > name_max) {
+		len = name_max;
+		while (len && ((unsigned char)name[len] & 0xc0) == 0x80)
+			len--;
+	}
+	snprintf(line->ident, sizeof(line->ident), "guest-%.*s%s",
+		 (int)len, name, con->log_suffix);
+	free(name);
+
+	/* Replace ASCII that could break tag parsing; keep UTF-8 bytes. */
+	for (p = line->ident; *p; p++)
+		if (!((*p >= 'a' && *p <= 'z') || (*p >= 'A' && *p <= 'Z') ||
+		      (*p >= '0' && *p <= '9') || *p == '.' || *p == '_' ||
+		      *p == '-' || (unsigned char)*p >= 0x80))
+			*p = '_';
+
+	return line;
+}
+
 static void console_close_tty(struct console *con)
 {
 	if (con->master_fd != -1) {
@@ -780,6 +891,9 @@ static int console_create_ring(struct console *con)
 	if (log_guest && (con->log_fd == -1))
 		con->log_fd = create_console_log(con);
 
+	if (syslog_guest && !con->syslog)
+		con->syslog = create_console_syslog(con);
+
  out:
 	/* Mark the console connected. */
 	if (!err && con->interface)
@@ -827,6 +941,7 @@ static int console_init(struct console *con, struct domain *dom, void **data)
 	con->master_pollfd_idx = -1;
 	con->slave_fd = -1;
 	con->log_fd = -1;
+	con->syslog = NULL;
 	con->ring_ref = -1;
 	con->local_port = -1;
 	con->remote_port = -1;
@@ -916,6 +1031,12 @@ static void remove_domain(struct domain *dom)
 	}
 }
 
+static void console_flush_syslog(struct console *con)
+{
+	if (con->syslog)
+		syslog_line_flush(con->syslog);
+}
+
 static void console_cleanup(struct console *con)
 {
 	if (con->log_fd != -1) {
@@ -923,6 +1044,12 @@ static void console_cleanup(struct console *con)
 		con->log_fd = -1;
 	}
 
+	if (con->syslog) {
+		syslog_line_flush(con->syslog);
+		free(con->syslog);
+		con->syslog = NULL;
+	}
+
 	free(con->buffer.data);
 	con->buffer.data = NULL;
 
@@ -1175,22 +1302,29 @@ static void handle_hv_logs(xenevtchn_handle *xce_handle, bool force)
 
 	do
 	{
-		int logret;
-
 		size = sizeof(buffer);
 		if (xc_readconsolering(xc, bufptr, &size, 0, 1, &index) != 0 ||
 		    size == 0)
 			break;
 
-		if (log_time_hv)
-			logret = write_with_timestamp(log_hv_fd, buffer, size,
-						      &log_time_hv_needts);
-		else
-			logret = write_all(log_hv_fd, buffer, size);
+		if (syslog_hv)
+			syslog_line_write(&hv_syslog, buffer, size);
 
-		if (logret < 0)
-			dolog(LOG_ERR, "Failed to write hypervisor log: "
-				       "%d (%s)", errno, strerror(errno));
+		if (log_hv) {
+			int logret;
+
+			if (log_time_hv)
+				logret = write_with_timestamp(
+					log_hv_fd, buffer, size,
+					&log_time_hv_needts);
+			else
+				logret = write_all(log_hv_fd, buffer, size);
+
+			if (logret < 0)
+				dolog(LOG_ERR,
+				      "Failed to write hypervisor log: %d (%s)",
+				      errno, strerror(errno));
+		}
 	} while (size == sizeof(buffer));
 
 	if (port != -1)
@@ -1324,17 +1458,20 @@ void handle_io(void)
 	int xce_pollfd_idx = -1;
 	int xs_pollfd_idx = -1;
 	xenevtchn_handle *xce_handle = NULL;
+	bool read_hv = log_hv || syslog_hv;
 
-	if (log_hv) {
+	if (read_hv) {
 		xce_handle = xenevtchn_open(NULL, 0);
 		if (xce_handle == NULL) {
 			dolog(LOG_ERR, "Failed to open xce handle: %d (%s)",
 			      errno, strerror(errno));
 			goto out;
 		}
-		log_hv_fd = create_hv_log();
-		if (log_hv_fd == -1)
-			goto out;
+		if (log_hv) {
+			log_hv_fd = create_hv_log();
+			if (log_hv_fd == -1)
+				goto out;
+		}
 		log_hv_evtchn = xenevtchn_bind_virq(xce_handle, VIRQ_CON_RING);
 		if (log_hv_evtchn == -1) {
 			dolog(LOG_ERR, "Failed to bind to VIRQ_CON_RING: "
@@ -1371,7 +1508,7 @@ void handle_io(void)
 
 		xs_pollfd_idx = set_fds(xs_fileno(xs), POLLIN|POLLPRI);
 
-		if (log_hv)
+		if (read_hv)
 			xce_pollfd_idx = set_fds(xenevtchn_fd(xce_handle),
 						 POLLIN|POLLPRI);
 
@@ -1421,7 +1558,7 @@ void handle_io(void)
 			break;
 		}
 
-		if (log_hv && xce_pollfd_idx != -1) {
+		if (read_hv && xce_pollfd_idx != -1) {
 			if (fds[xce_pollfd_idx].revents & ~(POLLIN|POLLOUT|POLLPRI)) {
 				dolog(LOG_ERR,
 				      "Failure in poll xce_handle: %d (%s)",
@@ -1472,6 +1609,14 @@ void handle_io(void)
 		close(log_hv_fd);
 		log_hv_fd = -1;
 	}
+	if (syslog_hv)
+		syslog_line_flush(&hv_syslog);
+	if (syslog_guest) {
+		struct domain *d;
+
+		for (d = dom_head; d; d = d->next)
+			console_iter_void_arg1(d, console_flush_syslog);
+	}
 	if (xce_handle != NULL) {
 		xenevtchn_close(xce_handle);
 		xce_handle = NULL;
diff --git a/tools/console/daemon/main.c b/tools/console/daemon/main.c
index 798077ac2f..56b2bb79d8 100644
--- a/tools/console/daemon/main.c
+++ b/tools/console/daemon/main.c
@@ -35,11 +35,14 @@
 int log_reload = 0;
 int log_guest = 0;
 int log_hv = 0;
+int syslog_guest = 0;
+int syslog_hv = 0;
 int log_time_hv = 0;
 int log_time_guest = 0;
 char *log_dir = NULL;
 int discard_overflowed_data = 1;
 int replace_escape = 0;
+int syslog_option = LOG_CONS;
 
 static void handle_hup(int sig)
 {
@@ -48,8 +51,9 @@ static void handle_hup(int sig)
 
 static void usage(char *name)
 {
-	printf("Usage: %s [-h] [-V] [-v] [-i] [--log=none|guest|hv|all] [--log-dir=DIR] [--pid-file=PATH] [-t, --timestamp=none|guest|hv|all] [-o, --overflow-data=discard|keep] [--replace-escape]\n", name);
+	printf("Usage: %s [-h] [-V] [-v] [-i] [--log=none|guest|hv|all] [--log-dir=DIR] [--pid-file=PATH] [-t, --timestamp=none|guest|hv|all] [-o, --overflow-data=discard|keep] [--replace-escape] [--syslog=none|guest|hv|all]\n", name);
 	printf("  --replace-escape  - replace ESC character with dot when writing console log\n");
+	printf("  --syslog          - send console output to syslog (independent of --log)\n");
 }
 
 static void version(char *name)
@@ -106,11 +110,11 @@ int main(int argc, char **argv)
 		{ "timestamp", 1, 0, 't' },
 		{ "overflow-data", 1, 0, 'o'},
 		{ "replace-escape", 0, 0, 'e'},
+		{ "syslog", 1, 0, 'S'},
 		{ 0 },
 	};
 	bool is_interactive = false;
 	int ch;
-	int syslog_option = LOG_CONS;
 	int syslog_mask = LOG_MASK(LOG_WARNING)|LOG_MASK(LOG_ERR)|LOG_MASK(LOG_CRIT)|\
 		          LOG_MASK(LOG_ALERT)|LOG_MASK(LOG_EMERG);
 	int opt_ind = 0;
@@ -173,6 +177,24 @@ int main(int argc, char **argv)
 		case 'e':
 			replace_escape = 1;
 			break;
+		case 'S':
+			if (!strcmp(optarg, "all")) {
+				syslog_hv = 1;
+				syslog_guest = 1;
+			} else if (!strcmp(optarg, "hv")) {
+				syslog_hv = 1;
+			} else if (!strcmp(optarg, "guest")) {
+				syslog_guest = 1;
+			} else if (!strcmp(optarg, "none")) {
+				syslog_hv = 0;
+				syslog_guest = 0;
+			} else {
+				fprintf(stderr, "Invalid --syslog value '%s'\n",
+					optarg);
+				usage(argv[0]);
+				exit(EINVAL);
+			}
+			break;
 		case '?':
 			fprintf(stderr,
 				"Try `%s --help' for more information\n",
-- 
2.52.0


