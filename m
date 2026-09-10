Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53014C79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 16:41:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415007.1644606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4hpI-0000Ck-21; Thu, 10 Sep 2026 16:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415007.1644606; Thu, 10 Sep 2026 16:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4hpH-0000Cd-Vc; Thu, 10 Sep 2026 16:40:39 +0000
Received: by outflank-mailman (input) for mailman id 1415007;
 Thu, 10 Sep 2026 16:40:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x4hpG-0000CW-Ej
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 16:40:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4hpA-003J9P-49
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 18:40:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa2dd73-bab6-0a2a0a5309dd-0a2a4502d94a-18
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 18:40:32 +0200
Received: from [40.107.208.23]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa2dd7e-6ca4-0a2a45020019-286bd017479a-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 18:40:31 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ2PR03MB7527.namprd03.prod.outlook.com (2603:10b6:a03:559::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:40:28 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 16:40:27 +0000
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
 b=W3aes8S04P1I6EKgXB/du7fQHg2nOCfPrtdlVWHmLysZgdG0oOPc7Oyd8+vh6yhQIo9Al+oKEeTusnQnk5XYBMw6aHLfR1lQN9n+AFZLv9r+2WKyovgcK7Hs9pQiDxnvO45YfusKlBHz9SLdqirrCOJAiA4pTrnjwJOLqoJuqO9BOs1/1F1YJccvh0kHtgIZCodILqkGvt/W2SHOg2R7ZqtbxTGynl/aixn0z3n6O45EsFr1fcYnMZGLel63VlmpwCuKBBSESeE5+Pza9gQv1Js4g5ea9MzOs6lEkzwxpRDMLDqhPxC6c7lP3XqqXV3hS4c5Kum66GsJcuHOVPBboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN+seTtA71auXJ8SVZ2qyGkvZ0DPlUOwnVfxlApHbf0=;
 b=IqXURYwR2WyxWtQKZQOZy13lKDYPNeZV0ZbfibmfJtPZwl7jQZsZwK8RFbNAX3SdUqEuFu0owNBEgPVSgMF38XPrvdvKTltH33tOdQ2MPWL/3qaOJLo2LUnaDgRmKV/dXFpW4oal9TMoKuGY4qpcSYLEYTTvD+YD9DZzFeHGfXmp8yJ2xyUQ0Pu3NptCsYAr+Y64tcdm7WyMXBZpr5OmXoRNdcBos79O4Ifs8FrzviU/NuBlvrYcmiXxyErrTtk3e3vIWoKOEBojkNcL2WQ9fLP/gkl4gbS4takn9oM7tAackZ2YsAUdrTdWT/nh4zaj/Jb050+YkCJLrwfIrUHvIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN+seTtA71auXJ8SVZ2qyGkvZ0DPlUOwnVfxlApHbf0=;
 b=mNN0cJ3hlcA5qr9ptVPHqrK6sGyUpKKh0S0JVq/yEA5hMC5AFm0liol97NXNDIA2LGcL+97fFl09A6O3xCIjEGasO76KnX0Az/8BVbOGYNybYgWuAmlqwacAgI/SmiflfZ7jEUhI8QLk+gNG1lk5KKLNELklJ4X2RBidtdyDUv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v1] nestedsvm: Fix multi-byte IO port intercept check
Date: Thu, 10 Sep 2026 17:39:55 +0100
Message-ID: <20260910163955.1005097-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR04CA0112.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ2PR03MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fab52ff-3969-4efc-8e9e-08df0f5a3858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	zXP2MjrmjiDZx/202RUXNiV76OFezqs//1NI6+nHU9dMJdRQtwwA2Oz4vlMXyP7nLE6ontW1lMVT9j4CroalhtHyqv3ad7kXwGYgIiaXEyJGQy/5POGnk0Dw6xzMkdFU0dZWWwHlA/3D5vxKBngXy48ZxLwjFvTdJqVsxpHSSEk0eQ3K+o2Vort3iNdyrC73XFwLZSOZXd74G63oKdU5L9euk8PI3rd/geM/pMAspfVW3A0MsGneU8QaL0UBjo9q+/DpNfuYlscV4Zv54oYT+KrxsZ+EOKZyDaUqnxxJaN3TOt24wfcpvPnfhfxxePMmnAo+zSJJHn7fmCABfGVpQtR7/4RxQzJkeefCJJ4mX1/zWCYSHJcQHHkoGMKz9TNUyJJEyLOxykjzLQSyO9iiY6RorqGIMANqHXqlKGXkBfFKX7WSipGFyCwH0QQOYRtVxw7pxy36xrsZY/Mc4dyLQ4LmKTgviABa02+w8G1pjRk6/1reXHpVWmM9P6MvYEzMaiV7TXtJ2Zt69GrhHoWWuRnoQHR+hnkJVbgDdOhQ2AddvzJzej/CxEM4UYPdzbLIkUiv8aEx5DEH3z3/qCWvAI2aVzscwuuYzsCSaEJquFm5fyx7k+PFFJBe9IXl74sgthuA8SbNwUClowO16VMIAfjaHwf6SAGVyPXPAUNTp2c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a3n+8p+IueQctOMf1Sn4t19JJtT+MSPncgbt4874lCLn5A2Iz63PjlNqgHPg?=
 =?us-ascii?Q?RT/tiv7HAmbcWR7bdZUKcRrROs5hZchRkAq5j5jl11KnsU5re9Sc9/BjprcK?=
 =?us-ascii?Q?NjLr+whvUpAfdZd3AuEjeUdTu7ZG+3sMisNq8HCau/yK441DOTrsLtnjybIt?=
 =?us-ascii?Q?0NNIFlz6923lEW2IYwEahCVigtfFwGlVl0JGlBz8pURo4gsn5kGunQqUgju0?=
 =?us-ascii?Q?MdMynwmFYoWeVVIOS4J1g0wVJGm7yVUcAWhBPpM5VmGJ4pbs7eKdeMtyJu+t?=
 =?us-ascii?Q?9A/MfH2SU3DN4ZQgsEAF65hBmsfq0YCaDxTw9Fc5R8EAsSFjLiXiw3F56jUB?=
 =?us-ascii?Q?TA0RHF/gql+fwx3FTZxaVClJQwHNZMaVg7TpqONxszvnojI0NbVmLrC+Hka2?=
 =?us-ascii?Q?eoke8VQ0EFWjnnjsXvTgTyfCEDNrXz/lXjWlAbIO1yQxXEwa5/iP9FC7+M9s?=
 =?us-ascii?Q?vZtSfCflqU1e/Av7BOE63q2vSIP1A3pEXwLklAy/6cyWecyMAYlqa4E4T190?=
 =?us-ascii?Q?3/vk60Oy9pVmrhA+SSpFhtPjMyzztRp8vETwIPCX4t8cnaQ5xFKzCl/T9swA?=
 =?us-ascii?Q?mI+R0Jgz0In7votKni9XJwCWqgA5Z7b1KIR7hm2UTYQGSoYr85cGUgWC5UeM?=
 =?us-ascii?Q?ZaMVqdsXqVCEF1yh3vfwwElP0s8trZd8jZBz7RGoB5UWcjsF+wCF35zmSRdN?=
 =?us-ascii?Q?D+rSP3qrKo+NygaWcfYd0FY7wipAkvbULMDLslMvNg5b4liBKOnqBzHEQeVn?=
 =?us-ascii?Q?mNRRXqrAHVxbuLU/29/4cIUweyd2ZjrTVdnhF/it45qZFfzfCxqxu1/hKXLe?=
 =?us-ascii?Q?f0T0dtGH+n0osw3JS1v/sGrx0uLj6u9vCNj2qytMKqADxRU6mVnBqx27u70t?=
 =?us-ascii?Q?/hqBOqjDAUTmpol2GHbisRnQeBzCdLVnJf2mqaEr2fU893O+AWWC7fkOdkVY?=
 =?us-ascii?Q?RFwbn9pVkkgIxuYcfqxjg2KRnjrx6DyQEJX6VVqF8azkuLRCxu74WuwZU35o?=
 =?us-ascii?Q?MtNIbjw+24424YYd2dF4MaFN30R/QFixCKRG3e5KeSWY1pmMNAtDvRUgwb/2?=
 =?us-ascii?Q?+mZUtJxsQ6swjh2tMltahWNshWgTLCKE20b5c3VwxJWowcaVSyIhiPpqOABi?=
 =?us-ascii?Q?vMD6zGpEaOYGdB7T0b7lsUEEg8svxdx4R2dmAKySmBdGtKdbsPvTvOg+NOFU?=
 =?us-ascii?Q?O7xDnHDHjSPWquWAeZiZOwM1t527L2I3AG0W4ReCko3CzY0iOdaQu/tYovOM?=
 =?us-ascii?Q?mTcWNlNa+9VB2bcdqbiscl2SboLIMnpgD3ICX8IqVeGAZusWvTpc/gXWKghy?=
 =?us-ascii?Q?y2D9Zj2oi4A201e8wzfjxcHiPoMvvz0SuV1xEitQwrXON+gkmYTvSaxBgjCc?=
 =?us-ascii?Q?tHcnxowoN9xaD0E75ntchAFOdju+nIQR/lPiUwqUKpQzPBcKP7KMUnPN4pHn?=
 =?us-ascii?Q?EekL48s7u3k0r28Rlnyw6rZUCpJpB/h36GnBllEOlWSwePwnhosTUR11O1rk?=
 =?us-ascii?Q?7anjImZ5NXv4a5Hw+WNY+090VSCGs27pnW8mcWr6k4Ces8UigjLs0i2QMEjW?=
 =?us-ascii?Q?4vmx/UVNNfYbV1l7uqFY3Y3L7o6N9GOkYKDG+Fi4vGqwj4vQkncB8NUctwLI?=
 =?us-ascii?Q?GcaoO1/Ply3xJcYmYQJhDHrirC8coRUazU1WCsKWgQUTwNJpNmV+HKgSmQVr?=
 =?us-ascii?Q?+ZQtSAYpqGUxEpCaGy5WMRLfMwnrVd7IIayMQXOz/HcwaZOBnllr7XbDJ+fp?=
 =?us-ascii?Q?YViVAtcb/8EXja09ESNZ/TVUJi/ESCk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fab52ff-3969-4efc-8e9e-08df0f5a3858
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:40:27.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0Dl+u4jd/Mulj/T6+8wXRreBIii8rVWMvaMhrDyFhUhqItb13whwrMwBl3AGGPzXcg2pCrObdXObQYUaSDnEs85ooLGcO8k3hkwgIyknTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7527
X-purgate-ID: tlsNG-720697/1789058432-F10A02AC-18BA0FFF/0/0
X-purgate-type: clean
X-purgate-size: 1261

For multi-byte IO port accesses, the APM says that SVM should intercept
if any of the corresponding permission bits are set. However, the code
has this backwards and only intercepts if all the permission bits are
set.

This affects Hyper-V since it does not generally set all the permission
bits of the multi-byte ports it allows its root partition to access.
This results in an L2 root partition that cannot do PCI config space
accesses and therefore cannot access its NVMe disk to continue booting.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 5adb1bd72c4d..249fde43b5be 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -852,7 +852,7 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
     for ( io_bitmap = hvm_map_guest_frame_ro(gfn, 0); ; )
     {
         enabled = io_bitmap && test_bit(port, io_bitmap);
-        if ( !enabled || !--size )
+        if ( enabled || !--size )
             break;
         if ( unlikely(++port == 8 * PAGE_SIZE) )
         {
-- 
2.53.0


