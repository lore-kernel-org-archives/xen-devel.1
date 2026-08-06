Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCBDC55174
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 02:16:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384126.1627200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrneH-00082A-Ko; Thu, 06 Aug 2026 02:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384126.1627200; Thu, 06 Aug 2026 02:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrneH-000823-IB; Thu, 06 Aug 2026 02:15:57 +0000
Received: by outflank-mailman (input) for mailman id 1384126;
 Thu, 06 Aug 2026 02:15:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wrneG-00081o-CG
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 02:15:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrneF-006DJx-PG
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 04:15:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a73ee22-bab6-0a2a0a5309dd-0a2a4508dc6e-44
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 04:15:55 +0200
Received: from [52.101.53.63]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a73ee5a-f659-0a2a45080019-3465353f0e4b-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 04:15:55 +0200
Received: from MW4PR02CA0005.namprd02.prod.outlook.com (2603:10b6:303:16d::14)
 by SN7PR12MB6690.namprd12.prod.outlook.com (2603:10b6:806:272::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Thu, 6 Aug
 2026 02:15:46 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:303:16d:cafe::84) by MW4PR02CA0005.outlook.office365.com
 (2603:10b6:303:16d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 02:15:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 02:15:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:15:45 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 21:15:44 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ff7yCzeY2fiHOc+IDfZLIZuZVKwJyf4/hOzKyCR2UQeatP51RAUY/ypm3DwF0TlWqQdD0ybB2M+cnwf5+qqXqCmWl6OqeQPPDNo/ZHum41SK5TmkbBNeZqNNx4ao8z5cdBIzLTcMLt08oVynO3mvYn5HVu+KBbqMpOhEYSOnmw8jvojfvwyrXgqtHDI3qp/UpGqmoW3TIsRZQyYTJn29a1RvHeQ4mB2zb02w0Wvdf5AsINHcEiDwQiWO9wwvAT7yV0WlaBhfutAbnUFNRQ4kun3i/KALe6vGZfWXmdmYvBGxDomz5pVZ0zp20Yw5B+r+Wg4YiOJNorRKQjy9hSl29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jX3bNwYFJtQHkDdoGtRpfMniKOM+GB0LphuiU0WB4hM=;
 b=PwLefr11JQpo56ryxxt9ZBgkoc6Wl5IzsNprJcdi20RHKqUuyo+k4cUUGRi3x1t25hGIIYz738whTx9K9dwzRe53O04oYMBt1nueP4a9KZoSokjjq2g9apR2APpldTJXq/NCk8Li+/ZT7Mps0Z5nrF0tTGW71vXDAhG/p44Yo3q6DYZkvKia8Vf300hovDhDDWyBWjTiJGJbkBJP9AyazCiMqON4vL3OLhfldYIFbzmTxoiQDqmy8cXrfq7UStCXIgrYldiryvkAE1n5NJ2MiaXed+JUnRI1z3fYzU1cfZCHnHaZcU7WdEX5w6bwBNJtYHAMrfLRmlkbtBFot9+1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jX3bNwYFJtQHkDdoGtRpfMniKOM+GB0LphuiU0WB4hM=;
 b=iQn37Xgmzdm9FPhOiG2k1AohDPyRFVVAdw/Uzs1/rdMIl7x4LdLFO555q+ZiQZK8sCaEHBg4GDlTZczHSUFlt/qBJoeyP2rO//j0FnKd6ltpopaO1Sjyx015HqqpPZBnge7Mz9j8rtLGTTEdK4JflGndDRYSVkZz/f5GcYEqYTs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jane Malalane
	<jane.malalane@citrix.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] xen: Fix PV-only build
Date: Wed, 5 Aug 2026 21:52:29 -0400
Message-ID: <20260806015233.202486-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|SN7PR12MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c36e370-57f2-458d-3902-08def3609ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|7416014|376014|18002099003|11063799006|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	Ibu/xr63siR0DF2AA2xQ7uGE3BrBlvSyupte6c0UjYGWkSstrwf6VPeBJrlGl9H9NV7C+/pXI7IvJeNxYIir7USqwVF7zkzT8J8TRuVHULCHv13udPolIeqkfHloRYw6CpMKWWu4rXYZ/S3gb7U9ZS/MhS6ajIoe/VDZxEt3ZsFMP6SX++0paaBLETZwu19H/5SOoduriVrcEirKU7ocWCEzzojq8lB3vd+q64nyyCeZuWzyIP6rejeoR+WY7IStt0swXVaGxPmV/g3SFRg2y4jo6rmwc/3PNdcs9SR4nnx6TrTAvkLFNoR58YMu1xUrLR1GKKJy89oZPyEa4LDk7LuQdvebE3ARdR9oQQZNcaC/8jnU1aXmoIQX9S4pILKJzcT25BSKIWKWaFWE/RJ93icXM4RSNRFCkkarIq370DHjUkWkQykx1nLF/6yonZw6+vchn4ZaHNAqvSt7BVnCwp9ekGHegODCwluWE8ef8atadUlqGHpYqyE9M2DhSDHrNlcEN3ZaxFsg3yQ0x/F3d38iFgxVdbb0vXZa6wxttrLz5Pvdlnx3jJj0tAMTbt/L+kuoPOM4cWsS2VJ4T9/5ZEM9njEjCtB5U9rggygdt611KT7MqVGGHnta7IPjUo4/Q09J6PqfENdiMn2Nlf60xXNMUNK9lG10SkK7ebk7HnyCgCgmuRs4Z1rjmky/1AQvIM3DekMdxcbd/3obACpQuUWTt1hWgqIH2/yLIgTPQsPV5uOw+4vXs7qGmPExbnDb
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(7416014)(376014)(18002099003)(11063799006)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gk16PvomKptKGYo4kWQuqvF5e49bpUhBp4YmMi5zxirbK1zzsBtaU9htBbhOwoTVjnfdol8iZq/cDdZP/A5DlF9FL6XlosNdFYW2p1moE3FfiXgQmRkhsLamyJ8oHobNrBN0viciJs+al8wvU+KArssVM87frf0mA3hAM9rTGAKUS7szBO9cyvHchg7jV0MVzTHL5vWujab3VCcOq2XfTWJt1iMxSDMorN7Wh6vFt2zVuPlp1CKr1FSUqGHr6ymBhrviBM8efbjjbRDSAzmYpX5hjJ2s1IKs2XKRL4i6JxB1+diJ5kWa6yIpE5vyEJsYQipbaRQShdmCL+EWOF0GaVGx8nO/vCOBacRRPcLLPZoGRWxi2KeriIP9x0WbWHYnWpnxXvu/NRojDchgBKRhmqrtir2l2FQXKpTvJEDcsBQsfJhNltEAnDGbOTXf121b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:15:45.8046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c36e370-57f2-458d-3902-08def3609ff6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6690
X-purgate-ID: tlsNG-c1860d/1785982555-CEB4187B-A1B31A69/0/0
X-purgate-type: clean
X-purgate-size: 363

Allow disabling XEN_PVHVM for a PV-only.  A stub in the event channel
code needs to be fixed first.

Jason Andryuk (2):
  xen/events: Fix xen_set_upcall_vector stub
  xen/Kconfig: select XEN_PVHVM

 arch/x86/xen/Kconfig             | 8 +++++---
 drivers/xen/events/events_base.c | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.55.0


