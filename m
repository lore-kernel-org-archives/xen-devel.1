Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B363C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:47:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406946.1640111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25ua-0003iV-Gr; Thu, 03 Sep 2026 11:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406946.1640111; Thu, 03 Sep 2026 11:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25ua-0003iN-Du; Thu, 03 Sep 2026 11:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1406946;
 Thu, 03 Sep 2026 11:47:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x25uY-0003iF-Nn
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:47:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25uY-007G3V-4P
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:47:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a995e43-2eae-0a2a0a5409dd-0a2a4507df56-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:47:17 +0200
Received: from [52.101.66.62]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a995e44-b4ea-0a2a45070019-3465423e7fd2-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:47:17 +0200
Received: from VIVP296CA0096.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:35b::19)
 by AM8PR08MB6577.eurprd08.prod.outlook.com (2603:10a6:20b:355::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:47:11 +0000
Received: from WA1PEPF00009B3D.eurprd05.prod.outlook.com
 (2603:10a6:800:35b:cafe::b) by VIVP296CA0096.outlook.office365.com
 (2603:10a6:800:35b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 11:47:11 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B3D.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 11:47:11 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB7469.eurprd08.prod.outlook.com (2603:10a6:10:36f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:46:36 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 11:46:36 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PkrnKjbCFQSqDNOM7hGIjyH+wRjoGm6c6oGI+0Zhw83fC1sWiiwnoVlunt/ZEvuYTckl/Tr8moicTPMr9G7VAlyxAMF0/aJ+jY7RtVd5NtXmC7weO9d7TTybAt3FuQYB01o6APi7vLhIbMhG9pL8klTlOhQ4YjAhRgEvtDYeqnR/qORjbLYCSluNe2LqdAG/7Bn8Xq3d4V4MJt6ELyLzn1uHKVRjeU1b+wtQPutdP+/COasJ41Y1UqT+YQSZykowzlmsQMpOjXLlQBtorqWc3uoZd/0edIEHIuOnZoAxBQgp7uw5gW0YE70CFh2T8+j4NP3g6O65iP2o8qkcL65i/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl6yVmaKVIb44L0qweWx8iaEMz7lkk7f+fpOFw6IP8E=;
 b=VELctVyBd0rxGAh8+5xMrozk25RERm3qVfiBJlemptUi2RGz4b0js0jlnfM3PobQQvzvUhonCBnfQ6tAP7A7iozuHgu8mlFJhJoWBISUgLlZEtfQiRCUbLsrgCRA3DfoTe9ad1SxFKGVO4Q0d+TnphTpHeohXFGDz1X0emCNdirj23eQQ/LWBwHIcXnQFnrsrxG8/snYI1Nb3Cq3D2fz9oJGayz6XZ2NL5UV7Y2XlzSgLlEYWf5H+1J+zHJKH1401tmXpvLH5amc2aW2wlaxR5Mueyh4EurxsUfjQnosEIhBn4bYxSvrYBqAUF10EmVZjI+CtDiDcySRce3QaLquoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sl6yVmaKVIb44L0qweWx8iaEMz7lkk7f+fpOFw6IP8E=;
 b=l1VzbgnyWCdylMBpAGx8nbxBMAD9vSKtMXBSIKdYCZZiJDJpQxToH2rn7X5Wl3db8VbHC3929jEUOdsk7PU/mm+9DNCeiyuveD0/BNRSxrqA809XSWIXa8689n9zjhj83oR0wJUkHPQX3Sol3lIQ4YBMY4twsFG1mrVOFK64l4c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLkcymhwSdH87flWDGZEME62JM8rrFB/Ed8roHyUetedhSqJIsARwKtPGpsf9Q91D/UTuCC2hRdy//ICl9luHtwuatXp3pGLpPHVyrnUZbwmMlOgXlVYyevyI+/jObt23ccE+d6xWmNfnacZW+AvxIzjbkq+NPLvfeDSvXpBgruMXHZ4pN6NbDoxdUb9Fo1eJ6i/YHHMLuplGO8LKiOxXfJg3tj/L81wJQmi1uVrXR9wAQ4ZDT2abzZ4qBjk8gq0eGjplH/xdQ5vdK3qzBJ8Pkn/HaUUnzzlIYnZbKMHPQfpatjXOX70bEjEJBPx7KumINESyKONRMGWm9RvfS5ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl6yVmaKVIb44L0qweWx8iaEMz7lkk7f+fpOFw6IP8E=;
 b=LXwH5/h7FNOm+WymXu5q66hi8VOpR7l/U48VwLgrqUnj+SDcWJDeLMiMYlrTNFYYIKkrI9ga+3RmWjO2ebXpVvIa+/HKCEn1bbcn8mBVfl2YsqNJwE8vj+XwyDqIy2rsPBohiEW8xYTOcIA+9ucwIKjK9SOAjUUnPaqwnT2TZmaG4w8yGzzI8iwgLVvenGquCQTB3L7VS6BxF7/Cn3bUh1tCLwetMBpq/sh+VqpHcg9rqxZwoMIavmU+wyDmlgHhlGzJmRTrPe7U9H9jChTUgsw5SVqEnLuMKJpwG4vArZ+oaIYeU7NEJkYHg6tl/aTtZZu5VmfTyNjJpGwG/u/vqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sl6yVmaKVIb44L0qweWx8iaEMz7lkk7f+fpOFw6IP8E=;
 b=l1VzbgnyWCdylMBpAGx8nbxBMAD9vSKtMXBSIKdYCZZiJDJpQxToH2rn7X5Wl3db8VbHC3929jEUOdsk7PU/mm+9DNCeiyuveD0/BNRSxrqA809XSWIXa8689n9zjhj83oR0wJUkHPQX3Sol3lIQ4YBMY4twsFG1mrVOFK64l4c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Setje-Eilers
	<Jan.SetjeEilers@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 1/6] xen/arm: Fix evaluation of parameters for SMCCC calls
Thread-Topic: [PATCH 1/6] xen/arm: Fix evaluation of parameters for SMCCC
 calls
Thread-Index: AQHdOUMNOJRbm+SGnk+cDdOr9aCdbLa8wS0A
Date: Thu, 3 Sep 2026 11:46:36 +0000
Message-ID: <D25C1465-8AD1-4D7C-8B69-6ED9FA4C3227@arm.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
 <20260831121944.2908139-2-andrew.cooper3@citrix.com>
In-Reply-To: <20260831121944.2908139-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB7469:EE_|WA1PEPF00009B3D:EE_|AM8PR08MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: bca28aad-71a0-4dc2-81a8-08df09b11748
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 eQzTLnGTUNnLqYqoBuXzciFoFnnhczcuVcv2UUcr4DhTqFW32nmmEsMVNlhGG6NocFi1d9Iy42BPyGS/N7bXWMFU+pcuBJ7WAoenO1EAOZJcTft9QOQUu3JR9kRW1tnR6FKj5pXX82kaykOqwGQHbu9c90vCKWziApVYFgpeJnHuF6B1haCOY4lfjPilXOyYzGW368jhCHCBU0dE8PJ4jZ/61rR3l5LwWXibEoBQ3uNBlWf05yricHLOyKIz27XHQq352qlNMAJp0/VML6XcG4xDcV0wcCtT/hcLhtFN9PDcxKXm/DaZFeSd6RgOLdyduSSwPe6mYAsU1YRjEj4gjw0c6N1aZ2IJBOu7HuyrKnegjB5r0CJnl3sLvo+zM1IJVRLMEKK2AlAi46zhxMPnRSP8xRjg6ksmjZbq21gNF6HMa1YR49zPyYapu5muDonT76QGrq6k1dwxystUjC4dR/mLKODGEHLMbC6Fq8XUFsEHpZfkfiFsFIILZ+YUl7nDcmkLaHMVQcKk2SijZv62qc6V/Ee/X4GKSRoYiYfLvGEXICmzPEeOpSCOaQ9zXTTLYD7b+eEcTmwi/jvpTDRhpndfV1fTCgWnFyo8kxbqmGaJL9Es6HoVZdSWPat6h3EH28hdFNC0WaMGdYWMWNkOB8lde+3M3hl3TWwdclIhpL/n1DsQVXaYAaP5iRjOHW1gsl8JbrGkvxruddcg3/EygMvE8JAg7tVGCnZk6AdJrOY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A3989F28B076894CACAC6D61CCA0360E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Au3vfKpQEdcfKnxt0fS1aAvQpfvvfz4fabLnbPnkCCA75PbXOy0y2VUT14NeZuf0IZ5MJt2UiLTVjJI7Bq4UGYM1YXxkNOkFmpSNcUWFKik66uo6CzEWpn/3wlizUAVmDOiEccKyPw2H5UdGJABSNRGkz30ggNKzUHDEls36aeXdyF1RJmFDcmFii5VJiUkCjphVwrrN1B25T6UpiehZAO2/R0zgCvYm84fDzUWKSk1VyCPTBgpbajTpsNugZC6/zDLoX9WOgiUy3GS07VgZkkBrU0XtYLme7EM4VW+MUlr/aw1D5efsTtU/w1b5qUaeeD4kkLZlvj6R442ZJENcwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7469
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 WA1PEPF00009B3D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4377f0d3-b800-472e-8f98-08df09b1027a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|35042699022|82310400026|14060799003|36860700016|1800799024|11063799006|10067099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DiDgG9IGnHif2iNTimg9iKahuPuI6AIdleEZlof7YtQwxwjZBdYxCXKgTM0HiNKQKJ6xzKymPV7xvXGEhnnUIz7mtDYLv/irYGyiQbLWzPQz3lasqv5rGpQhVLlM2wOhk1tLWzUtLBto8AxN9U5iVvOyMQS/X2H84nCMw4vh4yhcZjgugQKUyNAjtGtrcovMzLeX5Gk00qORsFUVOv2uncxzKiReKqMqcEudAmyvGDJOQQUNHgqoKC9xx+qFNgyv6xLzGy/HzvHMI3JaCt65WDB3Z1nJcwH1H8H7adPw/taLDl5ZofXGlV7oDtzL/UtkhTvLIXFVj8o9ELLvQz9v+Xcw4kqZ4OyxMEJJ2CU/3GBpR4r5w8B4HndeueVaZFiECPtI2Hd/Sfkzc/lGF0TFvgNkaroRVUqu8dNsqSYcLxqlwRGc8/cIueVEiojw7dNPeBl8RCi34V+PAlEJoVpcP64CRY/UWUkl4AMOb+wkLCEpoCAs9d2szRPNKmJTjrjNlcn4z/NE10JvFpztYrMKojaiZYF3Q8GK0oio0gFNJmh4TFlddDthGNddD1JoNkjaXtV7HFYsYHFgqMSvk8RgA0PgrTcA8iXCnrShz5tDz7b/cbz6kauVB2wJQGYHOnAGybJ9fxiWtkBMIRjTaPKdUauG8EAyT5SI+FVWUaWXNiQ=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(35042699022)(82310400026)(14060799003)(36860700016)(1800799024)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AhJtW3O1IMA6kcDP+L4uhjTLVNJW9wmuHkibHd4AlByVjZ3AQ4dsG2WSWVWkwowCNUgZmeBU7KXbLMVoz+f2WD7XDVu+8K0N0Kkxh6aVBCcE8fj5aU483qZnYe7n6Q/qNpxHWWDU7YIF4/PkqdxWsrdeLhNmTjWQ7FsYkwN5+FPKqmeKVjVgeD6POAIf/roznjfAjRiZJB/GlU557XmbfSzPn0Rr8tDUGcoA9TXjxOKfP2Pc9O9eX80HjwtGTllpyDpewV/5qFoehJ8egTc3svX2ykZe8laxOeKcXWWonE/dRI8BvswgC5LbtmAe/Za4uWxpizIoMQ3FgmOgDQNrkmp29dl8siYvE+xULfaarkyNyU0K844aLIVVISnGRT3tC8E8MSNF6QgXb+I19ZEi2dQk7l3Sse1pw7fPNHGXiUt5VbeRvnzGtSq5DllCLTRX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 11:47:11.2255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca28aad-71a0-4dc2-81a8-08df09b11748
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6577
X-purgate-ID: tlsNG-ef75cf/1788436037-A46CAAE4-475EED09/0/0
X-purgate-type: clean
X-purgate-size: 5146

Hi Andrew,

> On 31 Aug 2026, at 14:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> Contrary to what was claimed in commit 67bcf5eae709 ("xen/arm: Simplify t=
ype
> handling for SMCCC declarations"), there is an important reason to retain=
 the
> intermediate variable.  It is unsafe to have any logic between the assign=
ment
> of the register variabes and the asm() block they're used in.
>=20
> This logically reverts commit 67bcf5eae709 ("xen/arm: Simplify type handl=
ing
> for SMCCC declarations") while retaining the conversions from commit
> 7f15d5d13221 ("xen/treewide: More typeof() -> auto conversions").
>=20
> Adjust __declare_arg_0() to match.  It happens to be safe because it's th=
e
> first register expression once all macros are expanded, but it really sho=
uld
> be consistent with the others.
>=20
> Leave a comment explaining why they must be written like this.
>=20
> Fixes: 67bcf5eae709 ("xen/arm: Simplify type handling for SMCCC declarati=
ons")
> Reported-by: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Code looks good and my tests are passing:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
> ---
> xen/arch/arm/include/asm/smccc.h | 31 +++++++++++++++++++++++--------
> 1 file changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index 62c6985e7315..53cdddb690b7 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -108,37 +108,52 @@ struct arm_smccc_res {
> #define __constraint_read_6 __constraint_read_5, "r" (arg6)
> #define __constraint_read_7 __constraint_read_6, "r" (arg7)
>=20
> +/*
> + * Macro arguments MUST be evaluated before being assigned to a register
> + * variable.
> + *
> + * This is manual register scheduling for the asm() statement, and any o=
ther
> + * logic to evaluate may clobber the already-scheduled registers.
> + */
> #define __declare_arg_0(a0, res)                            \
> +    auto __a0 =3D (uint32_t)(a0);                             \
>     struct arm_smccc_res    *___res =3D (res);                \
> -    register unsigned long  arg0 ASM_REG(0) =3D (uint32_t)(a0)
> +    register unsigned long  arg0 ASM_REG(0) =3D __a0
>=20
> #define __declare_arg_1(a0, a1, res)                        \
> +    auto __a1 =3D (a1);                                       \
>     __declare_arg_0(a0, res);                               \
> -    register auto           arg1 ASM_REG(1) =3D (a1)
> +    register auto           arg1 ASM_REG(1) =3D __a1
>=20
> #define __declare_arg_2(a0, a1, a2, res)                    \
> +    auto __a2 =3D (a2);                                       \
>     __declare_arg_1(a0, a1, res);                           \
> -    register auto           arg2 ASM_REG(2) =3D (a2)
> +    register auto           arg2 ASM_REG(2) =3D __a2
>=20
> #define __declare_arg_3(a0, a1, a2, a3, res)                \
> +    auto __a3 =3D (a3);                                       \
>     __declare_arg_2(a0, a1, a2, res);                       \
> -    register auto           arg3 ASM_REG(3) =3D (a3)
> +    register auto           arg3 ASM_REG(3) =3D __a3
>=20
> #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
> +    auto __a4 =3D (a4);                                   \
>     __declare_arg_3(a0, a1, a2, a3, res);               \
> -    register auto           arg4 ASM_REG(4) =3D (a4)
> +    register auto           arg4 ASM_REG(4) =3D __a4
>=20
> #define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
> +    auto __a5 =3D (a5);                                   \
>     __declare_arg_4(a0, a1, a2, a3, a4, res);           \
> -    register auto           arg5 ASM_REG(5) =3D (a5)
> +    register auto           arg5 ASM_REG(5) =3D __a5
>=20
> #define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
> +    auto __a6 =3D (a6);                                       \
>     __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
> -    register auto           arg6 ASM_REG(6) =3D (a6)
> +    register auto           arg6 ASM_REG(6) =3D __a6
>=20
> #define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
> +    auto __a7 =3D (a7);                                           \
>     __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
> -    register auto           arg7 ASM_REG(7) =3D (a7)
> +    register auto           arg7 ASM_REG(7) =3D __a7
>=20
> #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
> #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
>=20
> base-commit: 79225a0c77e13b693b4d2b903a88289704b79db6
> --=20
> 2.39.5
>=20


