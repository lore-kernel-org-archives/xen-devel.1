Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BD7C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 14:15:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408560.1641048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uha-0001j9-4d; Fri, 04 Sep 2026 14:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408560.1641048; Fri, 04 Sep 2026 14:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uha-0001j2-06; Fri, 04 Sep 2026 14:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1408560;
 Fri, 04 Sep 2026 14:15:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x2UhX-0001iw-Q1
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:15:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2UhX-00Ehtu-2E
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:15:31 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad276-e002-0a2a0a5209dd-0a2a4501d956-40
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:15:31 +0200
Received: from [52.101.43.70]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad281-5984-0a2a45010019-34652b4675ef-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:15:30 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MW5PR03MB6957.namprd03.prod.outlook.com (2603:10b6:303:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:15:26 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 14:15:26 +0000
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
 b=JF+7HbKqVQZWJQL2EMFPwnxBRb9bWVISHJqn6QT5HBZLhoGF/NyeFr3q5cFbREINEh7sj8MPQpFfLHhYIrjj+Bz+Ts50cw8pV+VWx5Hb2p/OmRz+sDC+TJ2E+QWz83UEsnfxgYUW+/z1KiJRiXgMksidhjNRECQv77etvsLy9rZvUD5tnQPddx7ACJeXjajdSOpckNDofkdktcknm5mtm1qaToqPwpWASYolWPgGcZ/LBigwq3ilpQRF+Kq+g/ml/ZX0QKPBsDSIy0oOJ17+DZvXlI+I9/t6AAtjwfR8s9IWJARHHcSpnmdMAZFUGhb0XweLySc+nmg/mEHfhYbZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFN/o5VE3ASj1PHdpDqZMv4WW+RsDbrGJ+q/M/PgUBo=;
 b=WEFfXco2apsrgxt/vjzINKvv3LBWvatq3iva5ClFrrq5HxDNwYehdqX7QJyNnkNg7q98SWx+SqACM4rUv3QfZAVh9jBvqJk2i8wpOXP/kH5hqJhMPNLHtADWn+pd251UifZVRKjowudxgZKSCUeAYK6WaneZwxSllg6GAecfc1dYCW+bR0wfzpCxUJ0YRx/QclOLm7BBh80DzEkP8p7eTLbtxkNGWn02bgU+bwp4bmQBIOXtPleEYKrs/o0fosPEKslqPZ1AQViKgwQ04Gi6o0yBZ6F2H9vygWe/R2sxTEjNncwzWHUE4Pk8UQtZvrYAv0+06ZpcL7hgznngC2xggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFN/o5VE3ASj1PHdpDqZMv4WW+RsDbrGJ+q/M/PgUBo=;
 b=H3AofG4cp53DwmDhNu00mUl8mJEpqihx1fMDqdfjrfT957YOuNCh8UZLwBRhM80HITvg0wqx9Eowe+9JVaI/cXAIYEkAofnAWQIdjpH0BvqYYEyasrnZR/Ror3MqZQKXr6PVHhr9HobdKkvX3VFzW0DNYuNf8K0m3aX26AkUdLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/3] Viridian changes for Hyper-V as a guest
Date: Fri,  4 Sep 2026 15:15:13 +0100
Message-ID: <20260904141516.367862-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MW5PR03MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 76509b20-aef5-48f8-920f-08df0a8ef76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	j/Of0XsPlDEjIJXS9rsG35T0P2NylEY4w64vXa0/8nrHia+BC3oycz2o4PDWcH5BYqWjkZ2sbdaNc5yBfaux0IoKAA+hAIdhuniwTzzEFA7iWfk10PmkjlS2aiDF8JrQjvpi+P4QynKWcQ+Sd9LB1ub48i3KMwnKuev2i8GNECXAZ7HSxVI5HnLPRq9WfJeguoFtbAsvPsNhJctquVkryewGNVdT5Km0hIbeer35QEQCul1DVHSC8CgS3s0Jpr6eHqYAJrPU2Hlj9kwHpsJ+bTQbm94GAwiQHsIbMGIHY8klYEk72c9pO98faMHRX/LXMDNOWVvf6pIc1lc80aezI/r89t4fe4c/nDSGbAw7RbM6x8PAO+2HSjz/iMxsy4z+Z3joE5PQrpA2W5I2FNnGU6wF94mV8xx+axiIeJm9kmORZGbi0m3aMGGzhEZLlKUtUcN3yxRZvornwgaVtcnKDvAhOJVXV6HTms4/OjR9wcLmLJ4ArdYXbuy/ApwiRvIxIZn752Ni3GRasSR80rt3xRvaGSJoc4o61IJ5nUVOKQZFhiBtoTRQQk5izEunwJNeVfd4EPP6+BMrgN+RYovnfRahNDKV6bGR16D7xX+dil0VTyVnUe88f2N1ihtzZc4f6I/8fpsgwsUQpzip1e10YU9YreEZeE5orwdaHwxckKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+ySIWXjnfQB0TuYKnzBfr+ZQLlA29E34fYMeY8LxoMfOMdi+mOeHFeJH11UO?=
 =?us-ascii?Q?V+XTNSktlI98L5jYXzwlzFQGPNriu5DUrfb4Rq+ZDaELKIKqiYxKOZeFyaM8?=
 =?us-ascii?Q?Xywmp+tTeaz9bn85dyD1MmJZ3ECG42BY34URVm8ZC/455wCPIrFxPp8vlgEc?=
 =?us-ascii?Q?0E5xCAKW3J6eSyLcEZ6kkckVU8AJOYgUmEDv46022+nnCt2u9ShS8h8f8AYE?=
 =?us-ascii?Q?U7z7befuviWoOFF1S5pG6FsqOBf7fiZECMTn+wVtaJoTb+mWOX5LQRe4DIvS?=
 =?us-ascii?Q?rdC3ygT74DpkdHxHQiQaUbEzt1e5BvYsgB4RvTHd9U2XEwJBf71B1g14foOO?=
 =?us-ascii?Q?vc/pksxSjipbQHgeIkA7LJ/f2pHiouKwcKoQq3GcXxv7W2yzsFrf/c/1G51a?=
 =?us-ascii?Q?eH03aEz8PNnQflrrnKK5vOX33K2v+V7UOH54haqRRpzoYgJ05OjThQPabLYn?=
 =?us-ascii?Q?O7t0bzv0cTbm5+th72hxSdN+ck3lGUvUaC0gmd/DNOT9Up99jpcR0NMGTrit?=
 =?us-ascii?Q?oQTzScfM+7HO2u17Bdx3jwQRpAQf6eKvQ5NOnrl6vAS8WcO+Pfzyxx2ZmXop?=
 =?us-ascii?Q?K2jEfJYVdXZJBk8DD1DeDz4lFH23gG+drxb+GGf2XI164GQU7ubJoAd7r3Ul?=
 =?us-ascii?Q?BGlzqcYI1IH6Iyhlz1zt1cQ4k/9rr2GCWqD+XPM7EKNhcnDAtFGCS9Rg1ek3?=
 =?us-ascii?Q?T5xzV/xNBlea8Lg4vSL17bvyavlFhxR1zzbHVGy7POKDEKo/Qsd9He7DNP1z?=
 =?us-ascii?Q?9w5DYWlXkd/1p1JXQXydLocpLM2wPWlZvLzyEhy+hIsY+fJZVBXuInY3IHpM?=
 =?us-ascii?Q?ZcQWgOkHqWPIqE5QWz9pG4tc4vappv5QVwSrjAIHV+H+eixwtfGj1tRT8AM2?=
 =?us-ascii?Q?paiJa3yAKM4jKPNtoIyZMvZPSV6GqqTrCFzJ/VLcfNNtBNB8bSoohW8HJGs+?=
 =?us-ascii?Q?iww1mF56XlH8hT2F/SG/es1DJk/le/uEL1sHVEvSzbkqrNLAdVTxlGKJjDwO?=
 =?us-ascii?Q?qCo8dMGBZmCPfgAnXtNizL+svmFGKuxpUXoXB76fRMAYv4oHGFZS1IuCxs0R?=
 =?us-ascii?Q?h7HlDUYaG7y0tDd+06DgfWLORbQjHZXlKQtSc0azodbbmXhayA3CB6iAyLwC?=
 =?us-ascii?Q?VBhbMMBPb4tPYm1RmyOlsW4cDUV2zEz8soTPdnF76VyZBIVJkct53KmQppCz?=
 =?us-ascii?Q?YxLBWnX0fdVbdL3l810ZHVGurzbxM/vsyY2W6v8jLefsqMmsaG6UUf13uI/E?=
 =?us-ascii?Q?XXi4pYqpm5V9BwZ0QDuO7yaPrgqi3UPrMRU5kWrQ7UHAsDVd05vpZLlupjMD?=
 =?us-ascii?Q?mB8jrA0pn51VcEweYdG9BcN9g8OpcXlRVL4wpuUJV5T2dU/pS6GkQMIK3B9c?=
 =?us-ascii?Q?y016C+cUbp1ZOmoLzdK2oSsjIpUoH0NpqN8k4YL30fECbNAUfrGh1SXwn84S?=
 =?us-ascii?Q?QKexa72G45q/2FQu5WQXUremdw9HQnVM5DDUXNQLbG9QFJICgv24HOginrPk?=
 =?us-ascii?Q?7jxaHv2b1tuApZoTpj8j7wzjZWuZnqoPxj2vlh5QE/6iX+xDNNdT7fKyyG2A?=
 =?us-ascii?Q?nr2Cl0jY7AeV49VuXuNjBxEiQbf8L/ZB2f0ht3frxV99ZvWvxnk6necq5/Zg?=
 =?us-ascii?Q?I068oUdmXgp0tRqnWiG7pnKLYLa8G1SIWxEb48LkUEmnFS8vy5F7h0ASGeQ3?=
 =?us-ascii?Q?zZlME+w7x6nxs3H+a9HlWPYsdB5PjKY+kVe5vJPJYniP6Vfqh8d3DO45Zf8H?=
 =?us-ascii?Q?d/d1OF0qgk1n0cA7ZScsr8qXE6fOaWQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76509b20-aef5-48f8-920f-08df0a8ef76d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:15:26.3404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCuFuEpc0Kk83b22rjk1GcRpWjc2C9i60HsRe3cQIBmQ+VGAoH11fd5GwLbP+1NoZ9GA/zNq3w2bYDIeOD3EqC0eDWna358JfBBUD1JEZps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6957
X-purgate-ID: tlsNG-d62444/1788531330-BF66C757-98895844/0/0
X-purgate-type: clean
X-purgate-size: 942

Hi,

Here are some changes to get the existing Virdian enlightenments working
when running a Windows 11 guest with Hyper-V enabled

Hyper-V also depends on some unimplemented MSRs to boot, but that will
be addressed in a separate series.

Thanks,
Ross

Ross Lagerwall (3):
  x86/viridian: Workaround Hyper-V GP fault writing to MSR
  x86/viridian: Implement synthetic timer direct mode
  tools/libxl: Add support for Viridian stimer direct mode

 docs/man/xl.cfg.5.pod.in             |  5 +++
 tools/include/libxl.h                |  6 ++++
 tools/libs/light/libxl_types.idl     |  1 +
 tools/libs/light/libxl_x86.c         |  5 +++
 xen/arch/x86/hvm/viridian/synic.c    |  8 +++++
 xen/arch/x86/hvm/viridian/time.c     | 46 ++++++++++++++++++++++++----
 xen/arch/x86/hvm/viridian/viridian.c |  3 ++
 xen/include/public/hvm/params.h      |  7 ++++-
 8 files changed, 74 insertions(+), 7 deletions(-)

-- 
2.53.0


