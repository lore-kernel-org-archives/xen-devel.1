Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEB0CA5FA5
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 14:03:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436044.1654799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBwm-0002mc-OH; Mon, 28 Sep 2026 14:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436044.1654799; Mon, 28 Sep 2026 14:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBwm-0002mV-LV; Mon, 28 Sep 2026 14:03:12 +0000
Received: by outflank-mailman (input) for mailman id 1436044;
 Mon, 28 Sep 2026 14:03:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xBBwl-0002mP-1W
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:03:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBBwk-00AjuI-Ef
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:03:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba7395-e002-0a2a0a5209dd-0a2a450c9842-42
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:10 +0200
Received: from [40.107.209.68]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba739c-f479-0a2a450c0019-286bd1441e78-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:09 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BN8PR03MB5137.namprd03.prod.outlook.com (2603:10b6:408:d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:03:07 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:03:06 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6gl12B16J0JFeilLmjLIhq8FUwosaY7gtyWYEPBgYBfFXVvqpUkwLj2wdBgxFj29jiH19l5hxOWvrgGmDJUBlHW1Q2e3Bzk5cwBw2mflVIWjx9C781BWMl1lzQ8lChUs1VbjFo9oUphfguQqTRGMbzyKqUPH3/6W28vkHW8Vctrktv6ZIiyGhpAC9JnXsG24trGNIDGzm58V9/5UUwjbbEBJqZa5/M5sQQF7dm4YxK/AHQxX8nq8gs8du+GWmfKW4IWXY2Y2VmV1eHwcgQfOLaaoeFLr0isLKOIL1p1sIftHr5YCuBJgmK0xAtvIrC5qrlBSRoT3IRHApiZ096Z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZeShbyijkoRYPKUkh4p/NntYWcH3mbncooyCqgZ368=;
 b=ICNksEmyL9qICzLLLtSZ6MxTE3ChSjJuKfxY9meXZh7e74UtfLcrkOkV9dJfxIAI/NKR/ivlRIe+D5Xq6sRAVLfCwaBUmtm68eeMxcWk8qEKYGgnE4F2pDqAIBx9m7XQOsd7iZ4unp7pg1jUe5FOmsqrj0ec4KUpHl9nvQyeF6DkkqCInhcigqXB13f5TCkMjCQPblQsoo0cZ8U+ePOky8U+JrQg8OADqo+l3lA/n8WOYJARBbU7QOlGU6zEgrUMd+ktpxqmShv1P1+UHKeb3yP9sqTfE/KYJvPoiy8Epn7IsiWPuzKPefkBG0ZJE15SUL1smLpo94R4+DQnzho+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZeShbyijkoRYPKUkh4p/NntYWcH3mbncooyCqgZ368=;
 b=xAjjUB4IVHY8JuY3px6aMzqA/ESjW+KaDIBmgjYgv4YNtdL+wl4mmS0FyaYkW9L2gdUmv2veU9RKv7G6cJvNh0zbHuPDIyaMVqNXQfACuSF+ldsZXQQ+1MUDmePUk9/X4Q/RozDjiAfErIWIDlKInxqQkUiaT1FMAZY5Z8gR/OM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 0/5] x86/svm: Cleanup types
Date: Mon, 28 Sep 2026 15:02:43 +0100
Message-ID: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BN8PR03MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: b650661c-ed50-434f-723c-08df1d69388f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rjM8bCEJoFrtJ09gJTI52f9aIiOPAlP5NpljfPnJS9FmFVDZ0+dJPbH0CWXC0NQoJnItRo5TZfYFZnF+ykiy8iLC38uRWitDwryqe5u77330PCK2sOsRZGmqqQyrPzEc2iPVesVilg2pyWGcfin63sAdZyRGjXT7OPG8V5ldBQmOO0YQI9nXKN8nSHTbQuIb+bTLHgRKBtIB+Wtxva7uulBHebo1JSc8SneOkR9MSxs34uxxalnN5D826pUL8coEV5fpcIQxcYrgQY8xNhEuOXTMnvIXVOLWslZ18/nj9mQpdcce7C4zQJfhjAwRn7Nezq9kuVxIz3GgCx/viMTpEr3DGUYidm1L+AmueBieQtNOEucrRqP/YNkoRlPxq+lJ3OXQdulBcy9i37+otDAZlha6Jn2Jmy5xbjcyc4EZI/wl1GKSLXpuAWIXmqULToC05LXPVw8aaDrJ/TCHepKRG98dLJqKsaZmJrgTNma9LRPsnoaGw0YbJerN1ZKhalIl8S1CpYQ3WdKHI3i3FZ0zcufzpjYKlwGlJLGA1HsXd8G++mSD0vBXoyBqok8wxkdTnlP8g86//FomAltI204/W5OsU1nWG5HyK6X476z6F/4FzQeBvNJHDzJZNTv7pVYv26iUWiKYJVFkBLRgNagQvlQjo2jpDGoHqssabbpUCfw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VKOgVNKuM+UXytE2vmeGytQqROEzRsifpjFnhQy6aiDuOVSS4av9/5sBr4b4?=
 =?us-ascii?Q?bPaKIdx5OX5aRIEPPkUDeqRse3QUsRUZHCCt5j3OPtjGDYVvZgBny0eX5dRz?=
 =?us-ascii?Q?hYRgDDhqWo4+uci+9k9VH4SL6NI6lOhKMKhTdHstN7ZVNE1j/W8SH0Pf+6TS?=
 =?us-ascii?Q?1b9NFjMBmjsst3HB6h8GG45VztU95qBhDmuP/caDubi9oh/6ymqFhSIKsIAi?=
 =?us-ascii?Q?d2InZNiYEMxfUM/zEdkgkEpH/BZR+m1iYykGNG+9rcqt/hK3pVpIWfDTGW+Y?=
 =?us-ascii?Q?TtcJmk9BI+JNsiOcWdOWsxnxky7PJByofUP1h/3hI4j49ToKpLTg3rcmjUPD?=
 =?us-ascii?Q?O7NNl31JlJ0xZuqmt7KtP/5w35QfV08oYtB+rU+1VLjwe1hH/YZ485vtCzL+?=
 =?us-ascii?Q?vTlcXIfpuXcmq5VoGsBe4q48lZhfXOtia1Ej4vOVs+NyCc2ii5EDpLKipIHy?=
 =?us-ascii?Q?NC3aWPt7kHzIlr8o82XeJQuOLvafS6ZW6eQESdtVunWfldD2UDN+X/CNSLOc?=
 =?us-ascii?Q?rcpoibow8icV2qOhZeRUovyKmgp87qnnP+s4sNRwETnw3MtXu2c8dMg4zkpn?=
 =?us-ascii?Q?/2jlxKKEaEudFXVr/QEaZGMUdb+vZeIXxOOnrnSg1sX0ZtmKWDo79lslH0R0?=
 =?us-ascii?Q?5djc8/YiRi8AtSF0qRC9bgqp5G7/XEvZ86OXa4yoxiOYXgRWZbBn62an8bpS?=
 =?us-ascii?Q?3oWrhGVu8iALx7f+ClMz9mGr95xSAu33RO/e1Hfm1epdzDEICwvPYrHdBhds?=
 =?us-ascii?Q?GjkWWMGy3UPH8a+47CQd7z9TtwQ36roB4gsYGvAVq+t17BlhtvvOG7trMyuE?=
 =?us-ascii?Q?UZsCVApPJUJp3RwBRffQ4ONPvDx6TiwgSbKd1qGkYmWozet6c/60IN0C6O23?=
 =?us-ascii?Q?nS6rXW4+GAvCEm7ynOMWRd4YNjO9QvTRVBk0EirxBMfxhBB5gIuzrJsvkMDj?=
 =?us-ascii?Q?ihn6pJDh2ly/aWI96KyMDxHtaUaFiVFkqwQfwEODuPBvMlAActxVLgmSZwcp?=
 =?us-ascii?Q?DcDrOiZ9n4TgujQloO3z52+E6tAX8KK9K0ZMML7XeIyAGCdt8RycUqhLYuMs?=
 =?us-ascii?Q?seymWlOZrK250IH1Ujy0ebn+j4RxgVijm+FHYWNJyajk+5qC+7rIXbuamVi7?=
 =?us-ascii?Q?HDcQPLwtrdzN8RdLf/V5tNQKQE3VPjQ8vwZizW8l5LV8AFHffbPsP6Ob9wBv?=
 =?us-ascii?Q?3Nlel8rZ2k/BvmIRaeOu7ASmhdeFNZXTjKS2r/j69qB5LadKXC/QbYKWCzPG?=
 =?us-ascii?Q?a3wlMeQ06/Nr+KAV2jZtsYte/TzWgRjRUNNLo5O4ZG8MIzs5TGmAz2O9iSDX?=
 =?us-ascii?Q?53/VkRtQ+V38Vp0HnwsbYwWnYls3DQpOMV2X+YFOZ2gTpRAy5rEvCr1rOuyv?=
 =?us-ascii?Q?5ehoQdXmgz85Tcdb9WEp7S/OLguCkYRAMH29ltkxLNSV9nqIQxpG/T8XvbPc?=
 =?us-ascii?Q?6i1a6dEPKZbJQt0Dk1mW23adDcdBcBaN38o3U9hwioPP9QUmYOSgLt2c+cV5?=
 =?us-ascii?Q?pt9BB8xlfwPWsdZmszngnua0xAWwkcqiMIKMSDuhOQMeIBPrvM4PUnKOjak6?=
 =?us-ascii?Q?qose20HicRZsI0UhKEE2VyEm3+lGiacC7X6BAExJf9PVCZs5/A4IaBkLO+NY?=
 =?us-ascii?Q?Mp1tlMBa8uUzAcVWOC4a4qwOmEZb+Kb5jsQUvXIpj5hZ/e3PrmG/Lxujy5j/?=
 =?us-ascii?Q?wQ1GAvH+AS0z4Xbs0/BrQgVOMMG6tZLTzi9Qli93fBfyd06ijPFX+7RjF0B1?=
 =?us-ascii?Q?nymPuv7rqceV49OPShlO2mUbAR46gmY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b650661c-ed50-434f-723c-08df1d69388f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:03:06.8563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/BnS0brgYxbIE87zf127nP01OfM2q393wJEikgnIyp31KakrtGZCHz6d6MASWcX1A4Uj002XKwk/spJ6Jal9X3Nc0JHkYhSvb5Rfjq+gic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5137
X-purgate-ID: tlsNG-d25034/1790604190-02ADCA5B-3E722A3D/0/0
X-purgate-type: clean
X-purgate-size: 881

Hi,

This series completes the cleanup of the VMCB and related types that was
started several years ago. Andrew suggested doing this before going too
far down the Nested Virt path.

No functional change intended for this entire series.

Thanks,
Ross

Ross Lagerwall (5):
  x86/svm: Cleanup vintr_t type
  x86/svm: Remove ioio_info_t type
  x86/svm: Cleanup virt_ext_t type
  x86/svm: Use C99 types in VMCB struct
  x86/svm: Cleanup ns_hostflags type

 xen/arch/x86/hvm/svm/intr.c              |  16 +-
 xen/arch/x86/hvm/svm/nestedsvm.c         |  63 ++++----
 xen/arch/x86/hvm/svm/svm.c               |  20 ++-
 xen/arch/x86/hvm/svm/vmcb.c              |   8 +-
 xen/arch/x86/hvm/svm/vmcb.h              | 188 ++++++++++-------------
 xen/arch/x86/include/asm/hvm/svm-types.h |   9 +-
 6 files changed, 140 insertions(+), 164 deletions(-)

-- 
2.55.0


