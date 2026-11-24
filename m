Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25822606A6B5
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=qiVJlbic;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=qiVJlbic
Received: from list by lists.xenproject.org with outflank-mailman.1501410.1697474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVv82-0005IF-9G; Tue, 24 Nov 2026 18:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501410.1697474; Tue, 24 Nov 2026 18:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVv82-0005I8-5J; Tue, 24 Nov 2026 18:20:30 +0000
Received: by outflank-mailman (input) for mailman id 1501410;
 Tue, 24 Nov 2026 18:20:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xVv80-0005I2-P5
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:20:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVv7x-009bQY-Nk
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 19:20:25 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6b05d551-2eae-0a2a0a5409dd-0a2a450be5d2-34
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 19:20:25 +0100
Received: from [52.101.84.37]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6b05d568-b7e8-0a2a450b0019-346554259560-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 19:20:25 +0100
Received: from GV3PEPF0001DD94.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6db) by GV2PR08MB095324.eurprd08.prod.outlook.com
 (2603:10a6:150:38c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 18:20:21 +0000
Received: from WA1PEPF00009B39.eurprd05.prod.outlook.com (2603:10a6:1d8::116)
 by GV3PEPF0001DD94.outlook.office365.com (2603:10a6:158:401::6db)
 with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.639.14 via Frontend Transport; Tue, 24 Nov 2026 18:20:21 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B39.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 18:20:21 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by AM9PR08MB6290.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 18:19:48 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 18:19:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A41ddrDCAFcy/Qmc0fdJp0umpoD51KtpC9SCM77q+knxYTa/RWcCI3+6ul5c8/xOqdK99wea6xktYD906kLtAik9XT+balsypByYkyQQUmRxrjJdiC/xToDRV9RgU/SneHwSLA5C/Es4fCAos9WxfV3yDdPAyF+rH6fJrqBYISK1yartLZZ/sZ3+WC6rvRHJcw9vtsT/EuWoOKUKzJyS7kC7fLfm2NTNy3mYq1WWPegYHUxd8CFOd/hRDVio6GOCRzgohu1jyAFnX3G7wq3MxhzSYvHFuM9aVZ35OXaldozj+bPjtPCmTuU7G3msOZ4/aTuH1XJQMCAweeU5CrN1Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWiTd8I4xbjwAoFrwnVPddqOpQZ+lp9P27aoZDY2zJE=;
 b=ngTgJkWMr3SEzHAPvao21pW30q5FkACPo0tmEkh4py4yK+dyxou7XnLOGqeS5GkCAApTaB/YA2/pRqkJy9qq0VbD3C0yonxxDyfWigAd8AGeJ043x3Yv5QI4VpfjS4M4ubMztvftz77ZtRmiOTZlTXYZWyimNbmofAKx2+azqSQ1zN4l5Rl42v7NemZhQW4/v1ut55SHtTKaylEAxeoXXRVI6/mQIq/6bTc4tuh/vHy5Kp68kdYES60/dLX3jEfWN+DgY/E7ONT8+S4muK8E0s/uzuw+GMc/U6E6eF0RVIpEXO4rWbGoHpQnB7DwaYdPRHhalmUCJikWlvBO/sL+mA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWiTd8I4xbjwAoFrwnVPddqOpQZ+lp9P27aoZDY2zJE=;
 b=qiVJlbickdiYLjHARDCLix/x35RpO8kv3L+0yxrp9CcCMJJeEaN/OkLCzu6hlSdjOoRq2wAmHgfAruSFJ7/u9kVvfltEdzcP4ZKV/v+YCVdi7D0oa6kwnRKe6xanaVkLFroNFNcPHVxS1PCe8YIBPqwktwoyHCIjHPWhTmNVUmc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZA2D3QpcwOrvOYuqZjoRcJxp/do+6HtrIpiC5hdGTApHLeEZFVwLEu1RybuovE+A8bfDevtQ850q1P+x32AbRTjJgkky1axubuZmGApV1uGEijXyuXJdMf26bIGrgZ8NGDsUWrd196k8fSIojASbnxvMHHOgbgFhRchgtTSHzlBs0tNWW/D90qVQbY/Z9OpbCJtl6Da1iju6sMPW5WCL5wTOVYh8PTpbNP/aB8dLodvhbnjWrcLZDyYAdzYGY52EGKe6dtmwCBTHe4Z0SDUP66S5Qs59tIXix/gQBDrfuvqzsZJcwi4d7SKubyNdr0bGCPToLZvpIeWULS3WGpyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWiTd8I4xbjwAoFrwnVPddqOpQZ+lp9P27aoZDY2zJE=;
 b=q+0MKkLevkxg5zX1vc/dkrZtJZmYr8tmPFpDc5ROPreGhJzRfTwdq/09irhuxGabg92psxzwyZPh3NWrYDSmE6RhuSfepWR4Q1mwl7zalfOjHBnVK6quBpxVotEANoQ0zZWY195WyErJIQETSmQHgff+y569OdR9Zi/WgU5h8Zlm+hT1ans/T2ZcNhVeYZI723fUw6zwPmwnNkDDJRdeZJxZ6pOOr1spldOMz21aVi742GYQnbiAb+EmRh4b0iRT8FkXelK4JbA3wjcX+fIyKcd7KGwA5oc68xKCsmC/H1blmCirPKhioR0pvmtIeEbqy1IFt335jHu+9Ak0S4wVog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWiTd8I4xbjwAoFrwnVPddqOpQZ+lp9P27aoZDY2zJE=;
 b=qiVJlbickdiYLjHARDCLix/x35RpO8kv3L+0yxrp9CcCMJJeEaN/OkLCzu6hlSdjOoRq2wAmHgfAruSFJ7/u9kVvfltEdzcP4ZKV/v+YCVdi7D0oa6kwnRKe6xanaVkLFroNFNcPHVxS1PCe8YIBPqwktwoyHCIjHPWhTmNVUmc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v11 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Topic: [PATCH v11 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHdcDtABYwI/ppPt0GzgWxLLvu3Xbc9oEOA
Date: Tue, 24 Nov 2026 18:19:47 +0000
Message-ID: <282824CF-CC2F-4996-8249-1C522F549CE3@arm.com>
References: <cover.1794222015.git.mykyta_poturai@epam.com>
 <2a7fa3ba892364b755049763d64646d146c692c8.1794222015.git.mykyta_poturai@epam.com>
In-Reply-To:
 <2a7fa3ba892364b755049763d64646d146c692c8.1794222015.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|AM9PR08MB6290:EE_|WA1PEPF00009B39:EE_|GV2PR08MB095324:EE_
X-MS-Office365-Filtering-Correlation-Id: 174775d7-b1d2-4413-b770-08df4a5799e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|261009223027099003|18002099003|56012099006|11063799006|261028144727099003|4143699003|261021121427099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|261102123227099003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 TbkGpsxcUUQcvbqxMSnm4FbSZqvY15T4X5Mhqhnwm3Xg+Lw29YdDjVHVr5nHL+IAtF1kIr+I974K8QyTPkT+2fvPDDlJHla9WVqhZLbEH3qnzc0DMAOlX2zWIFqgXue9IPwtglQdxkI+1XD882hOk909yM0xTnPlodfYkTWR1b6KCqP0NTGnpUf7AFO7zc5rjXmLTmF8K3aK9njtJri9Tfkp6IYwb5y9UZTzE8wHRjS8VJKaG9fd1RMY7CBBaYANsj5JlovlBfmK2hL3wZztbNpQE2XUjLS09MTE/GDdou03UyOppWCpmCqN6GHj5E98mSTds7QbqpoRjfmPi6pDwAiod0ERnpqAerTMAUUBr5ZYArTvr6Nbn1WPef9a1aoEx5+lIloeFI9bRbwERx512nQZLrm2gmqfDwDp7ouh3mlk7YS4RT08yfVy5iA0MfisP5rLN6cRZdCyKXL7n2YqtCwyVzYXRIqMs7agBpVqNTLFGkUluCPKv0hbVNfduo0wbEykBxd5v54f3Kssc3dxxTsU3jMOqJmRP6+0gcQ8un3hD/oaKP7ItfR1dNt3heoxxGMP/heZGuFwEN9vUSLQ4RGDdHuK8h20sdB1NP1LvM204hBG7c+StsbNciZKa21V24AyCL/Dv9/iVguSeBHEYnQKOcr6t8dIq36pWmeLQNkNK9BtHoaSqkoA+jrLn6fReClNkQY/1Y32KVgj57B3ra4TjgyowXsGZbkFEERBsJg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(261009223027099003)(18002099003)(56012099006)(11063799006)(261028144727099003)(4143699003)(261021121427099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(261102123227099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29C7F7DFA597314CA00ECD2403E50002@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 bYozzme4dnro7iBaAXl3HSYUEs+QK8BQ/gJ8AqbbJmU6Y2wTqkIokkMpwVY7r9H0Oz8lD0salyu7VMour5vgRLbn5s229b/1JVCWFWAD9ow92h4L8Olc9pTHBdo2LWDhqJUbTn9rT91koXteIXvRH6uAsq/xNq9PtZ8RZjyik5OsL6ZzXg+vX/I/e/rQ1NpANMyxm5vWx7khU8gAHWNABreke/7ltkXHmv8tONFde2HoeoS02wAgDLuoZdvM3+XFZlevCLvcw73Oe35bbs+rwS02Z2lQGD/KaGomhuUJ93JnjnofwM2pwYINy047edjlIol6uMv4g98HcmuDz4hUMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6290
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 WA1PEPF00009B39.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa737b95-7d58-4c0f-3d2a-08df4a5785eb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|1800799024|23010399003|14060799003|36860700016|82310400026|261102123227099003|10067099003|261022075727099003|56012099006|11063799006|4143699003|261026140227099003|261022105027099003|261021121427099003|261026121527099003|261028144727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d/UrqVWPDHhr3mveoyDfwnRJgA0Blr99DdpAm10yW/fPfl+4h+564XEiuUuDCZfYJdXstsoM6V6CbqyVg7BKQlGs6PhxKtSTOc3a0niWOtttuCvaVuXyx+5KWT8Ho291oxmNB6yqOz3t5oKbF+k+qqXIpWjv2hTouwRp/aR+cLH3qgDD3Pvlx8JNyNGyXzIrtYh8fKhxkhVlarZvnID62PXu8Wd+WiLkHRdMZBGXYkRW+eFpePUMRo+z0KUmc2EDxhdb7SQePM+atndMxQCxuHx5Br/5WwKtBD2yaszynOlk26vq33PUQQm+tiGLikl0wvST83hfa3CEyJ2vrXqkPrh44OMeHDr7EfBYPpRzxQNVb3l1QFkMKb/Y0vV/xyvOOyayknp+xaDqBTYEf0GoviH8loAImhRaAQrodRN6r4NqnhF8fy7ddKj2rwsCSDZ7xKc7j5oGABhqkuUzvnJP6Em+bWwP8qcZzMd3dd3pgRCe8RT2mK1E4P87pYkUi+Qffriv+anf5Xo1Qc4Y/gXqeLiFJzAgv1WxnpUNTSQ/vEvUgLCqLnmIToepqe7cyCwYAru33im3UdChIDNCHxl99wSu4QHfyfToJXG/fxEjE6XQu4iudAdz/LiSjxXEAco3/wGE8MmZj8hLhGmhAu6mvXeAnpWT3EInRwgFKCeriUjuIeQ8JcUsoeure/jJ3tGYsi9imlx7P/2IuWYjDKavLg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(23010399003)(14060799003)(36860700016)(82310400026)(261102123227099003)(10067099003)(261022075727099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261022105027099003)(261021121427099003)(261026121527099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BB0CbR1PU6c6pGQHRPG2Bx/OFNkoLRCycC15yatf2Mmb6Ptr3QZuRAjUIPd4VusrFQzdgQR9JEnAr47y7b8jckB7xASH38zmSck+unK9GB5MFooLmPcZDi3RwC7cUf/Z+CpwCVyTVBtRQeYKRHrKMGU4zbEXmolPMsMkRXgAqcHC+PG8q2nUSNOoxoF9A3RRKQx+fKbX8EUuYON5N+3NOjM8SId8Bvkn6IXMV+rmSRA0A0bWISBhKTfOJiEEmUlulttqZH7k3ovNQN6NKP2k/nRNCSTAF0DV6JprEJvdbtJvXh7/ljQFsWOURvO+AqLYn6olIb14h2CaZYjsW+aMgf5awri4/Vl3+mnsPcj4a2+H6QTcWBMvlTdNa/FiPSXde9u+8XJtKtGNy/GkGmH1PYFxzqtzNqfx4YtkrnbZbMng4rcPsOEt6CdXGtWqwD32
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 18:20:21.2381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 174775d7-b1d2-4413-b770-08df4a5799e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B39.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB095324
X-purgate-ID: tlsNG-42698a/1795544425-19CC79EA-67D6E2D3/0/0
X-purgate-type: clean
X-purgate-size: 4751
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykyta,

> On 9 Nov 2026, at 11:12, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>=20
> Move IRQs from dying CPU to the online ones when a CPU is getting
> offlined. When onlining, rebalance all IRQs in a round-robin fashion.
> Guest-bound IRQs are already handled by scheduler in the process of
> moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
> itself.
>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> v10->v11:
> * collect RB
>=20
> v9->v10:
> * make cpu_next static to balance_irq
> * move the offline path to the CPU_DEAD notifier
> * make rebalance_irqs static
>=20
> v8->v9:
> * replace CONFIG_CPU_HOTPLUG with CONFIG_CPU_ONLINE_OFFLINE
>=20
> v7->v8:
> * check only existings ESPIs
>=20
> v6->v7:
> * replace ifdef with IS_ENABLED
>=20
> v5->v6:
> * don't do any balancing on boot
> * only do balancing when cpu hotplug is enabled
>=20
> v4->v5:
> * handle CPU onlining as well
> * more comments
> * fix crash when ESPI is disabled
> * don't assume CPU 0 is a boot CPU
> * use insigned int for irq number
> * remove assumption that all irqs a bound to CPU 0 by default from the
>  commit message
>=20
> v3->v4:
> * patch introduced
> ---
> xen/arch/arm/irq.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 61 insertions(+)
>=20
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 594aaedd22..d5145a4723 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -166,6 +166,58 @@ static int init_local_irq_data(unsigned int cpu)
>     return 0;
> }
>=20
> +static void balance_irq(int irq, unsigned int from, bool up)
> +{
> +    static int cpu_next;
> +    struct irq_desc *desc =3D irq_to_desc(irq);
> +    unsigned long flags;
> +
> +    ASSERT(!cpumask_empty(&cpu_online_map));
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +    if ( likely(!desc->action) )
> +        goto out;
> +
> +    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
> +                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
> +        goto out;
> +
> +    /*
> +     * Setting affinity to a mask of multiple CPUs causes the GIC driver=
s to
> +     * select one CPU from that mask. If the dying CPU was included in t=
he IRQ's
> +     * affinity mask, we cannot determine exactly which CPU the interrup=
t is
> +     * currently routed to, as GIC drivers lack a concrete get_affinity =
API. So
> +     * to be safe we must reroute it to a new, definitely online, CPU. I=
n the
> +     * case of CPU going down, we move only the interrupt that could res=
ide on
> +     * it. Otherwise, we rearrange all interrupts in a round-robin fashi=
on.
> +     */
> +    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
> +        goto out;
> +
> +    cpu_next =3D cpumask_cycle(cpu_next, &cpu_online_map);
> +    irq_set_affinity(desc, cpumask_of(cpu_next));
> +
> +out:
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +}
> +
> +static void rebalance_irqs(unsigned int from, bool up)
> +{
> +    int irq;
> +
> +    if ( cpumask_empty(&cpu_online_map) )
> +        return;
> +
> +    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
> +        balance_irq(irq, from, up);
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_BASE_INTID + gic_number_es=
pis();
> +          irq++ )
> +        balance_irq(irq, from, up);
> +#endif
> +}
> +
> static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>                         void *hcpu)
> {
> @@ -180,6 +232,15 @@ static int cpu_callback(struct notifier_block *nfb, =
unsigned long action,
>             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
>                    cpu);
>         break;
> +    case CPU_ONLINE:
> +        if ( IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) &&
> +             system_state >=3D SYS_STATE_active )
> +            rebalance_irqs(cpu, true);
> +        break;
> +    case CPU_DEAD:
> +        if ( IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
> +            rebalance_irqs(cpu, false);

This can rebalance the interrupts after the stopping CPU has called CPU_OFF
leaving cases where some interrupts could occur on the dying cpu core befor=
e
it is actually stopped. I think we need to find a way to rebalance the inte=
rrupts
before we call PSCI CPU_OFF.=20

This is actually what is required by the PSCI specification which requires =
to migrate
interrupts before calling CPU_OFF (section 5.5.2).

Cheers
Bertrand

> +        break;
>     }
>=20
>     return notifier_from_errno(rc);
> --=20
> 2.56.0


