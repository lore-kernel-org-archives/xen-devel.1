Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502F3C79F82
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 14:28:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408624.1641084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Utq-0005pF-S6; Fri, 04 Sep 2026 14:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408624.1641084; Fri, 04 Sep 2026 14:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Utq-0005p8-Nl; Fri, 04 Sep 2026 14:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1408624;
 Fri, 04 Sep 2026 14:28:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x2Uto-0005p1-Sm
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:28:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Uto-006Txf-80
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:28:12 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad56c-e002-0a2a0a5209dd-0a2a45048042-30
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:28:12 +0200
Received: from [52.101.43.66]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad57a-b57f-0a2a45040019-34652b4229ec-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:28:11 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB5744.namprd03.prod.outlook.com (2603:10b6:a03:2df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:28:08 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 14:28:08 +0000
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
 b=PvFNtMGZklJ052V3U8+H2sCrRAhL+mqdZ8SWpba/WzDyySwnhl0jpbh0gp3BAUmeslYHTGrbzYATX1TEu6k+rMUg+sJJbkb6RFa8QhvNWU+ufyW1lzv3qdk1snwNnyw/bLMDoYVNGFeMaEXaeyboLhVrTcRd5UzAozL7DuuwrKGObhmK3Z4+VoFmj3+8u7ajFfs1bORgnnk+1+lFQU1G7WkOuOUzA1tdVcyRoKdJik5aMYuZvpwAe+Q90nmdYyLj62sNkbU9SqlyN6sQ0MflxwKrT5183dEQK4VqcKru+evC9cE7PDSy2VU4E3Wq+t+iGoQ109JWDdntAcU4Yp50wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WG3EHvt5kN23gToKWT482W/P12w4LccgJjBIvavAw6A=;
 b=zNnd1M6340bdWGKxi18s4/RGnf+MxPYi51wboiDeP25+l/+zWDp8WrShy89t59YVRf7t/+MO0r00tA97DAZyVDuiE3Av5kjLheZg+i6mWamzdDHmZfvtzN72y/AQzg1rbj+NESDAan7CpI6oy/Dodqr95LvWb6q4XuQ70ufwlh+SUhaXoI55wSJSpg1reAMenm3EEXDV9ePol8agENn+sOw0v+xcUpNH85c0L2A3mxDraY6l4fX5RC/97MMGnZSgwjK/ajfclaB38DA3Gxi2QYUbKkjB508Ub5b3HxJWIyH5SCCpjRY7PXTL/0Qp5AbyTFWLtq/BJ66mDN4w25l3EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG3EHvt5kN23gToKWT482W/P12w4LccgJjBIvavAw6A=;
 b=jNMKJkoicfyLKq+5t658fRur2mL/nlfX36X5stVHuERx8JVxRa246Qyxfl5W2v4vqlaqcAlCQQEax47TGdUKOtGaX7e5pQ4UjJ2K+Kqkk2JUCblphPOwhlFzGORbAcUUa6t5E+JPgKRCCyopautiO1QAOGWuc0pCjoykMUfnl2E=
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
Subject: [PATCH] nestedsvm: Crash domain rather than Xen on unexpected VMEXIT
Date: Fri,  4 Sep 2026 15:27:57 +0100
Message-ID: <20260904142757.375773-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: 820d19fd-2db2-459d-2ff6-08df0a90bda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	t4OPSOpVFSTJ+45CnrX24uyKkXg4NO3/qx7xK0ks7cqOiJoRRyLacMtU1Z0y9dUn+jwPccDY1aClDCc2IWrOC/Jxgbo0OMHUA10OXX00frHNqv4hKbC0SNBr7C6JlycUOw1jpM/vE25cR2cGXC9ToC0Jvb4/qS4NCORQd0HOE0tZudiKdlYYgwvrK3txA/b9JtBb2/06motmahNVHAdoC6CrNqqnK8Xzz8zVzn8lF6wNoRj0CX2pLcBTeJcZGaYYmdFTUhMKeoPDM/qkMyuEXQIXO/W6ilIMZKc0d9MkJTfGP1wFISDOJMB8DMFCjezCc363QL+YpxT25mdV4FDWHSrfMBuV747lDL8XlrY0U1Wqe+k65YPzPpEvjSHoyB3tBGYlU2S7ppCJb7r3dIbKH1xnGP+BJI2aYQghN96yMqvqCpMGQt4LAF93GYNWsqIQ2D0iHW3DCRaDz0zrix5Q89KJQzDQIX9//Ve2n8r8Olcp2HY3rmVtYLY2Ra3i0/gYsqwI6r3t+7Jxk3rUPkkq+MwPpGczeackwD029mbtOBlJOKqYb/vch0rRMP9OhKBVySsd700YrDyuBv8e9gXiuJ4Z8OPrX8ZHqsysUy7gwqMXdiGf7WHu9fiN/y1u3x+oKkg0B1W5efRnd3e3UXRJvmeqKKg9ClvRrt9UjafGusc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ghKWrCYlriupcO3e8KGu76qi/P+WxkNtGtWIf4gOats7bT61RWxE93gtP/K?=
 =?us-ascii?Q?tMbbE3bgp43zPsTyU1WaXFKCgQTzqJaVdbL0N3GklFBPp+CK3pJ3L1wZ+YVC?=
 =?us-ascii?Q?DZyADF36yeURvp3k/ojhZVmhhF0cHaPu0Ycl9mtCLmFX6wWg9Srm2+h6fWxX?=
 =?us-ascii?Q?IYtrycCiiE9Pbl7mKWTG1Yxh3udp8b5/6QalU1DqGPOQpdpBUhJgimuXmVuQ?=
 =?us-ascii?Q?5jEafMmhywUWu9ws1c56+Vzt69kJ8kCYx0DKJR75UmhW6PZe3LAS5KAt/eMQ?=
 =?us-ascii?Q?gdkRqapkT366ChTmLiMqLtEDktZYcKDBjJEbAdkaMfzNyjypB0fxMvJ64kh7?=
 =?us-ascii?Q?YhNbyXnVTBHkuHUgA+Rb9WwiEAynXSo3cCqu8YtOsZ82f1b9aRFfKDa4L9L+?=
 =?us-ascii?Q?yMTT2iDLkDoXQ+r87y21/oS2REvc89HCqFpLyBJHYWXclX981WOoskZMM6QA?=
 =?us-ascii?Q?dlXg16hjIiIdzVLhTQabBKZaUFDzAXM1az9/gROlU7OhGu7YgwNdzuA0ZeWq?=
 =?us-ascii?Q?7xQIXY0cU0iFittX4vazPhvvdYIujU7iU7enT3P02vKJk8uXIhz71WNuyRrM?=
 =?us-ascii?Q?yNaP1i0652rHUSNdlEQTx0K6MZ9CZT8BYr7J2RdN0Gh6r7o8sJwziIj4f8lJ?=
 =?us-ascii?Q?R7dzU99/X4Ak3npoq1eWOkGRnBtQ7FQ6fSGQJ7WWoB/PXkLhJBYUuC5fPOJr?=
 =?us-ascii?Q?c+zdZDo+E+rRQxJzh4SxDPH1ufFn4DyMU02c0c6UTq4Yuqd47U9LvyhmHP+9?=
 =?us-ascii?Q?wRou2UvlMX//j8A4pGPUfvqcqvGiqZbAbDEl6QeoLIqe2LRNNMrbmxLtCeKb?=
 =?us-ascii?Q?3FgtRItnqdOljWVxhrPSM0m48Ooe81ThFEfYoSrLiG0KyIF9Vll70fr9Fm7k?=
 =?us-ascii?Q?zFrC7sIj78SP09neGJzUADGnRQgMbDwn3QladTP/jUBBgbY7ScH8W1SAaTh7?=
 =?us-ascii?Q?m1LG9OUJmjPWBpup6mo4uFDxPmoqZ9F6U4tvMPHeEaKqpnesRJLSubbqswzo?=
 =?us-ascii?Q?nMEH64ZR2yCGY503dVu9MgOPe67z62/26CjtY/RcqeRTyRtN7qHzjsY0qgjK?=
 =?us-ascii?Q?RS0dmm01VBQzSGLgigDet161O4Pjhq6jRnRq0hwH/8ddnDIFoacOEacOb+hF?=
 =?us-ascii?Q?H6tmeAN1GsArag1AGWylycrnXOsfoFWZvJYuYpbC79RJsQ6AKq+60YbUg3OX?=
 =?us-ascii?Q?pmwHEq8ReyS6aJBx/mgvBXvIHdMucvvOMPAoedDy2jN0sm8qKuwI0d2vtsyK?=
 =?us-ascii?Q?B1QQp5Dwjga8v4JgmtFOwQCYUiCIqCKb3QwX5N0l/cKbdIuq9ZUWwlkBmwLg?=
 =?us-ascii?Q?ApYXKQgKsCyRnOS+plyhB3uo6WSK7pgb9ehfnTst0WNiwyWRUbgdc66eEAIk?=
 =?us-ascii?Q?sWEvS+yvyas5asyajl3A7u4omQ8c899O0siO8Y8YtI7ewOH+/eIT1yfkLHpx?=
 =?us-ascii?Q?02fFaV2fOqOiSbPZJ08JjMLmD3KPRMGFmNWdRz+DU+781LHdda2JVsC2xsKV?=
 =?us-ascii?Q?RRgB8VxZ8co7bDrLmgzz1FaC5dBByteMySVNihmfGNjOFzEWayfXk93eRdJ5?=
 =?us-ascii?Q?Yt4xnfgt8arP7vONDZxOwF3AnQS+GigVZc2juQOeOILgXDT5JLasdu2vcz4E?=
 =?us-ascii?Q?tYbTOJKBQr6RVIEryLu9AZNZhRkxixJk565eiwvX5YFV7ZJhoZjcWX4rqwiQ?=
 =?us-ascii?Q?eUQZqndqROlrcg6sOZBQIBZfm43tIWOMF8SN5LSVcvORNzv6NjDRVfJK6p+v?=
 =?us-ascii?Q?yPIxgRI+cQxlK3ALz2McEprkW/RjSqU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820d19fd-2db2-459d-2ff6-08df0a90bda7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:28:08.4280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEhKldhhP0uxHodl41qCz1+Mgl11nUvwNlva2WxxGJhXnGFwG/btsEa3a5Xwlhjfa5RIwoghrr1X1PaWWZVuOTK6zw8ieH/+SDo/Lt4ZyU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5744
X-purgate-ID: tlsNG-ebf023/1788532092-516D2B50-A8ABE61B/0/0
X-purgate-type: clean
X-purgate-size: 1013

On encountering an unexpected VMEXIT (e.g. because L1 has used an
intercept that L0 Xen doesn't know about), crash the domain rather than
the hypervisor.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

This can be triggered running kvm-unit-tests in L1.
Xen undoubtedly needs to handle the intercepts properly but as a first
step it shouldn't BUG().

 xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 3d0e77f5eb24..5adb1bd72c4d 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -923,7 +923,7 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
 
     default:
         gdprintk(XENLOG_ERR, "Illegal exitcode %#"PRIx64"\n", exitcode);
-        BUG();
+        domain_crash(v->domain);
         break;
     }
 
-- 
2.53.0


