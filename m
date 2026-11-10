Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17AA60A2607
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Hx68j/be;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Hx68j/be
Received: from list by lists.xenproject.org with outflank-mailman.1481964.1685851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnXn-00043C-Gd; Tue, 10 Nov 2026 15:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481964.1685851; Tue, 10 Nov 2026 15:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnXn-000435-Ds; Tue, 10 Nov 2026 15:13:55 +0000
Received: by outflank-mailman (input) for mailman id 1481964;
 Tue, 10 Nov 2026 15:13:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xQnXm-00042y-HV
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:13:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQnXl-00BaEM-QE
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:13:53 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af334a3-e002-0a2a0a5209dd-0a2a4504c35e-36
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:13:53 +0100
Received: from [40.107.162.25]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af334b1-b57f-0a2a45040019-286ba219c396-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:13:53 +0100
Received: from AS4PR09CA0025.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::15)
 by GV1PR08MB8107.eurprd08.prod.outlook.com (2603:10a6:150:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 10 Nov
 2026 15:13:49 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::42) by AS4PR09CA0025.outlook.office365.com
 (2603:10a6:20b:5d4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:13:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 15:13:48 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by DU0PR08MB9725.eurprd08.prod.outlook.com (2603:10a6:10:447::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Tue, 10 Nov
 2026 15:13:15 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 15:13:15 +0000
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
 b=k1NpyQkCzdKADW7kqrBepKqKQ/OZDnx99qvH6s9kv1+OztklQ2cvzU39miKRg3z2gKk09C2GmlkIAk/XantPhzbEv4WJYYcJs/BV+MPBzn7U3+L9AG1HeHRXvJtRN2T1drzaoIjoLZkC1JUXlMc0YpXq+3NKB9iO0+XMfMsTXG4fXJEnU7qtOwWG5jA8Ci3kyT/+kRelYBklf1OY6mZ98DFhtxXTDP7G9spouS4yJaPL3RuAbAocsdRLmLbNqeG4fKpr3iE+Hpy4yw2CpsAFj5wpz0xzy7eO2tOlpwuTY7BD5/fVBxc+5DYj4YqshuX4W9KsUDMwoBvJdaaXdgThFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6sVQ3frOJT2cx6wd0W9n9gMDkuNDQE0mlOqBeUeWXc=;
 b=EUBtr9j4oUEAr1QyWQsS1mU+mdzSd5ZGhvCCllwlu1i0gsbsnb2Wrrd1Fu/IXBFISo+YDehaZHC/MyjzbJMatIGyBUG+KcjkFGmnPZ3hQy5HFsY6UjXZlIdR6m8Hg8E7nNGMfcqmvdJdxXCgRXuZzg+PrHesW06hDeht5QViXDhn5GZqd8/XNHvYejGYjmuwhXZ9sMyOrvmD/C790sYRDni276lHgxj62P36C5BY+UJEvigbjyhXI6iRvMFKHts026cO5i2Jy/oLELuxMouFuVkz7RFXLx6l6/390PQFOq2zdPq3gVCBDGGqOKdtrlgZgZTBsf53Kyf2tUmoCddpYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6sVQ3frOJT2cx6wd0W9n9gMDkuNDQE0mlOqBeUeWXc=;
 b=Hx68j/bezqYRTeoNHelkxjTvEUGZDckgXek5WWlcHGHCnCvYamR8BpmEEB8NQhrXKHUZ6/YxAZ6Vm+F8QWTODgd51WG9Rw3LSGLtDBTR0WIRFqe2AncVeUi0IOfsfZ/4Gk3ttXW1vpj/aLNSpsAJGXUDuhufpFvpIeYMHAiGEl8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PALKjLnuYPAAph8W13MCudGbBbfDHtwYMs60i2u0+qhdYrlyA2a+kl74irOhdmDYCMyH/yXK4vaBY6bkQKUTML0C24okZfPx9oUVZAciyn7yBVLUPXOKaugS9RXXqFKfJd9dZ7B8mLMsSwVGXGbBxi8GJGYnWSStciRHqDFkm+78YQFOtKkkYex+rPtuRDynsHolgpm5zIhQOAAFvAEYHi0c257kitMFnhuN2pTVLaYwrkozGmAGEvPJNbcA6jl38GiW8FJbqxzFAVzr6uVVmV7VBtk5P1KAj/fWpoSPjhzYlMpc+KJDDG4KxoOf8ByDI2ziI5uuWYqCITFX5vSl4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6sVQ3frOJT2cx6wd0W9n9gMDkuNDQE0mlOqBeUeWXc=;
 b=HqZcIMcE52vm0JUBMYhu9P7vQ2eSp4swAkyr8EDRDnpMnOgJxR+jeXL/8WxDNPhpPL6BC/c1bKqD6rx06+HJV8yCVwya+vfXvDfSCFPSSwfNPo2qrece3kU34a6z7hB+LPiU1u6xqRGQdO7kKEhPJOauPXoHFkTt8jTbKODs2RZCq4cZ2eMLHN/Z7j4wHtaJ5oRMnJo9W0+Qds2BiU2pEx13grpEtJey7d0g1HaHvfrcejojsPcOIBJRvIZrDi8nr5YEzuLQLHfEN+25Soy0TXMb022HivmDhnNYhkGYoW18NlgexSVStks32xjZOORm5vOSABSSD078OvSzcwjrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6sVQ3frOJT2cx6wd0W9n9gMDkuNDQE0mlOqBeUeWXc=;
 b=Hx68j/bezqYRTeoNHelkxjTvEUGZDckgXek5WWlcHGHCnCvYamR8BpmEEB8NQhrXKHUZ6/YxAZ6Vm+F8QWTODgd51WG9Rw3LSGLtDBTR0WIRFqe2AncVeUi0IOfsfZ/4Gk3ttXW1vpj/aLNSpsAJGXUDuhufpFvpIeYMHAiGEl8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca
 Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v13 09/14] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Topic: [PATCH v13 09/14] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Index: AQHdZlcM0ndKZR1JO0ijUKhPQP54Abcnf0qA
Date: Tue, 10 Nov 2026 15:13:15 +0000
Message-ID: <403C645A-3F4C-4483-84EF-892F823218AE@arm.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <3f8f4ecf30d38d589c2d08f5b2676bda93f8d880.1793129971.git.mykola_kvach@epam.com>
In-Reply-To:
 <3f8f4ecf30d38d589c2d08f5b2676bda93f8d880.1793129971.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|DU0PR08MB9725:EE_|AMS1EPF00000093:EE_|GV1PR08MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c86831-3e88-4e07-0fbd-08df3f3d386f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|6133799003|18002099003|10067099003|56012099006|38070700021|4143699003|261028144727099003|261021121427099003|5023799004|11063799006|261026140227099003|261022105027099003|261021123027099003|261022075727099003|261009223027099003|261102123227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info-Original:
 PMhuHZrBr8qRuQs+gYKqp8b+bQ/E0dFvQAxwYKXVsSoPzk7TyMs/U9pccDYBdL3KoByJHFewBsRyFYua0xdzn+FRGjnKU/GLVSxK6/1lqFS3dawuOOlGlTU00YL1wRZqW0OeJCIvddwG17F154glz8dzlsVjYmJYoTjSFYLXOa+bQ/AG08664yJkReW2/bl0qvDXv+cvkLjmiPouZy9Gp75Ny42Vpw6NLIQszb1XkK+/ZaubE9CIYhKxPaDeiaXrlf2HCW4u6NKZZPrnNjn3TnJ7sntxKz4aw/TY92r21woPQAfknbvgDQNyW6wFn6TdttR3/Yffp9p1sm9x1lHWxePEkC4q5EOmwRPgML6V4mmc/1m9aLn4MfG38Rr3+gwvHM1c5voJRfUxcgJ2D8EWBLYTn9ytBm95Dgc9cu/jm2Dh4GVxVC0K4IbxcbNxGmrDFwv8CSJwepLB4tWP3ib+2Uk4LBDq8J7uJ+1V9ad9uARptWDrG/HItjc8d9Lkd31EhGmjyjAr6AIYcHDs2Akztf09DUugBG5vPn/uh9/2wJSlkf/fXS1IEmJseCUO5S5ElLpbvf2Lvvwy7bCLYavTPbpg9C10AzOiYgBPgUiKbFzfRFOW/OMWjGoydap1GGYUhGAOFAjXcsMzzivbrK6Yhpz68siT58+APRfnudJEqJhHkUP6Mx6CH5Tb0hInPIth+bSDW3exLGKyc0dKakyY+dfL6+yqK2okxjYDG/ulBE4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(6133799003)(18002099003)(10067099003)(56012099006)(38070700021)(4143699003)(261028144727099003)(261021121427099003)(5023799004)(11063799006)(261026140227099003)(261022105027099003)(261021123027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026121527099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1308ADC00BBC44AADB1A93B0E4C2B53@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Fad9AfakH7Ng44MAKPJTyNXKH8DIzab6QCj4SpESUlqK3Xq2pcPisq0scaAy6aK8/mzZOA340prvMLoQxksxfCytb2hxy/Y/NHEEHVpr8TehsdbhqZwGMp+Dq6w1oXH1XXrAzWOucKorT5ze1h6+yhnYF2Qv44mE8vyCc7QQZmmnjA76iiKFTOMkJhTQukZIIBxGS0uVjJJDqeoJQ2A9kPVnjfYpgvRg6+7S7EhcN8J6t3oEb5wO7QDRjmihbggzYeiY7TUx+JFcZ8CNhfB1Ff3fbcqnZAUVptCEk1Q4HmE4S9P3o+ThlrFdnvkf+9v5Dm6x3xH+Nwfdfmqqo13pKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9725
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	722ea36e-ebb9-48b1-c582-08df3f3d24ef
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|35042699022|376014|14060799003|1800799024|82310400026|36860700016|11063799006|5023799004|4143699003|56012099006|261022075727099003|261021123027099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|10067099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	m5EcyIxar+rADpHekwkkb8iLWNtBBBQ6w/siAzqLYIzyprOF9IP2M6SR2eP7nGmG29385myHnHrDofdeqhXuzawfmMVNL3WM1U4f1H1fcvhpsskqE7PsQ3AyefaOCJOSJxRjwBbv/jx4TcZB7IyhJc0w2T4FY9+Eva9DPHlyy9tD4YGIHbKnsdNjpNFwra9kvmMWQ9ijZTuDmxCjre+6zYHpZoInEqL8tk7eJ6K3kPPx9dkr2Cqzxe4wPWj7in1fkL+UloAXZTpL3BGIwqreIC9mu9ZGdvFS24xHgbTs3/fTTPZxpGnK8szjKDMZwDbGb8t93Z0QPaRItfcZkK7sOCwNtp1Oj/H8jPVzVeeKSC4cF5Qok5X8Kuw13zwdcaz/XgdN2vZ9PvpXMZUV41OhWZYIzWJBWeNRHgMsmR2jn53YZ1GISc4u0eVNsbrsRyYbL7XYzYNOdsPYUhsKk7WutKx3OvwdRPschHmvjYrjKMY6ufZ75j2oDqt5e63244i3nsWYO4HqUO+ZPHTGJv7fr7q85XDV34yiPHopMElgsYJqEYOUTM1wmqEMbU20MOV9cG+mOOR/DSiADY/pNcDIisAT+sjsRa+NVLXUk6rqvRNAe8pSg//vTXl7ZEhpjb63rTPPkm+7tSQ3XTzXuVUlI287RCmLpsMP2MKyo1Qwio9Qqtdg+6N/998/dEzbQzwtpTiICp8CcpaR6EsZg7e2nA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(35042699022)(376014)(14060799003)(1800799024)(82310400026)(36860700016)(11063799006)(5023799004)(4143699003)(56012099006)(261022075727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7XQRnR2989zeBYCy0UTUDZtni2Ab8cql4PxzBS2ttYGGWqGddwKRQYOIIdB1khfWRy8LujqhNvXRSmllyPQo8T9W8WNWfx8xzg1Ii3t8uCOh6FjdMFDr3Ig5RTwkDfCZdbDY8ISXBHjLHo/N3JGt9lxnY/qp77r6TlbM4URhPbybf/azQedN8Q+J6/sGnTDYbctX574/lJmsxU6eX5uXyGKPrnL8Am90YKyheimszkI4FDbkcxbpRobo57C9POmLVVBT1RjgDdffGf8+sy9RuHijPPN999h13Oh+2xUNmCa6NOc5nB4Zr8fHjyY4dWzNwqdsGKjiNGd31Ve5JmN//uK5A04wzjhtwn7Z5xjLJqzl1KRFdclym4gjACULam4JjAbSHaN4QjnE23tAf//xc5gOYRr1TBc1Ds5a6dmyKTo5rYREsXcLHZYpkk3iBV2A
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:13:48.1213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c86831-3e88-4e07-0fbd-08df3f3d386f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8107
X-purgate-ID: tlsNG-ebf023/1794323633-585C7B50-1E06B5A5/0/0
X-purgate-type: clean
X-purgate-size: 15804
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 27 Oct 2026, at 22:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Store and restore active context and micro-TLB registers.
>=20
> On resume, restore Root IPMMU context state before restoring Cache IPMMU
> micro-TLB state. Cache IPMMUs select Root contexts through their micro-TL=
B
> configuration, so restoring Cache micro-TLBs before the Root context
> registers are restored can expose stale or uninitialized context state.
>=20
> Tested only on H3ULCB (R-Car Gen3).
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in V13:
> - State that suspend/resume was tested only on H3ULCB (R-Car Gen3).
>=20
> Changes in V10:
> - Iterate over registered IPMMUs in reverse order during resume so Root I=
PMMU
>  context state is restored before Cache IPMMU micro-TLB state.
>=20
> Changes in V9:
> - set dt_device_set_protected() only after ipmmu_alloc_ctx_suspend()
>  succeeds, so DT devices do not remain protected on allocation failure.
>=20
> Changes in V7:
> - moved suspend context allocation before pci stuff
> ---
> xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 +++++++++++++++++++++--
> 1 file changed, 308 insertions(+), 15 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index fa9ab9cb13..2e54fa63d6 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -71,6 +71,8 @@
> })
> #endif
>=20
> +#define dev_dbg(dev, fmt, ...)    \
> +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
> #define dev_info(dev, fmt, ...)    \
>     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
> #define dev_warn(dev, fmt, ...)    \
> @@ -130,6 +132,24 @@ struct ipmmu_features {
>     unsigned int imuctr_ttsel_mask;
> };
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +struct ipmmu_reg_ctx {
> +    unsigned int imttlbr0;
> +    unsigned int imttubr0;
> +    unsigned int imttbcr;
> +    unsigned int imctr;
> +};
> +
> +struct ipmmu_vmsa_backup {
> +    struct device *dev;
> +    unsigned int *utlbs_val;
> +    unsigned int *asids_val;
> +    struct list_head list;
> +};
> +
> +#endif
> +
> /* Root/Cache IPMMU device's information */
> struct ipmmu_vmsa_device {
>     struct device *dev;
> @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
>     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>     unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>     const struct ipmmu_features *features;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
> +#endif
> };
>=20
> /*
> @@ -547,6 +570,249 @@ static void ipmmu_domain_free_context(struct ipmmu_=
vmsa_device *mmu,
>     spin_unlock_irqrestore(&mmu->lock, flags);
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
> +static LIST_HEAD(ipmmu_devices_backup);
> +
> +static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
> +
> +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
> +                                   unsigned int utlb)
> +{
> +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
> +}
> +
> +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            backup_data->asids_val[i] =3D ipmmu_imuasid_read(mmu, utlb);
> +            backup_data->utlbs_val[i] =3D ipmmu_imuctr_read(mmu, utlb);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
> +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain=
)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs =3D mmu->reg_backup[domain->context_id];
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->conte=
xt_id);
> +
> +    regs->imttlbr0 =3D ipmmu_ctx_read_root(domain, IMTTLBR0);
> +    regs->imttubr0 =3D ipmmu_ctx_read_root(domain, IMTTUBR0);
> +    regs->imttbcr  =3D ipmmu_ctx_read_root(domain, IMTTBCR);
> +    regs->imctr    =3D ipmmu_ctx_read_root(domain, IMCTR);
> +}
> +
> +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domai=
n)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs =3D mmu->reg_backup[domain->context_id];
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->cont=
ext_id);
> +
> +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
> +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
> +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
> +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
> +}
> +
> +/*
> + * Xen: Unlike Linux implementation, Xen uses a single driver instance
> + * for handling all IPMMUs. There is no framework for ipmmu_suspend/resu=
me
> + * callbacks to be invoked for each IPMMU device. So, we need to iterate
> + * through all registered IPMMUs performing required actions.
> + *
> + * Also take care of restoring special settings, such as translation
> + * table format, etc.
> + */
> +static int __must_check ipmmu_suspend(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return 0;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> +    {
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_backup_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_backup(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +
> +    return 0;
> +}
> +
> +static void ipmmu_resume(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    /*
> +     * IPMMUs are registered with list_add(), with Root IPMMU probed fir=
st.
> +     * Walk backwards to restore Root contexts before Cache micro-TLBs.
> +     */
> +    list_for_each_entry_reverse( mmu, &ipmmu_devices, list )
> +    {
> +        uint32_t reg;
> +
> +        /* Do not use security group function */
> +        reg =3D IMSCTLR + mmu->features->control_offset_base;
> +        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP=
);
> +
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            /* Use stage 2 translation table format */
> +            reg =3D IMSAUXCTLR + mmu->features->control_offset_base;
> +            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PT=
E);
> +
> +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_restore_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_restore(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +}
> +
> +static int ipmmu_alloc_ctx_suspend(struct device *dev)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +    unsigned int *utlbs_val, *asids_val;
> +    struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +
> +    utlbs_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !utlbs_val )
> +        return -ENOMEM;
> +
> +    asids_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !asids_val )
> +    {
> +        xfree(utlbs_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data =3D xzalloc(struct ipmmu_vmsa_backup);
> +    if ( !backup_data )
> +    {
> +        xfree(utlbs_val);
> +        xfree(asids_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data->dev =3D dev;
> +    backup_data->utlbs_val =3D utlbs_val;
> +    backup_data->asids_val =3D asids_val;
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +    list_add(&backup_data->list, &ipmmu_devices_backup);
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +
> +    return 0;
> +}
> +
> +#ifdef CONFIG_HAS_PCI
> +static void ipmmu_free_ctx_suspend(struct device *dev)
> +{
> +    struct ipmmu_vmsa_backup *backup_data, *tmp;
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry_safe( backup_data, tmp, &ipmmu_devices_backup, l=
ist )
> +    {
> +        if ( backup_data->dev =3D=3D dev )
> +        {
> +            list_del(&backup_data->list);
> +            xfree(backup_data->utlbs_val);
> +            xfree(backup_data->asids_val);
> +            xfree(backup_data);
> +            break;
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +#endif /* CONFIG_HAS_PCI */
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
> static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
> {
>     uint64_t ttbr;
> @@ -559,6 +825,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vms=
a_domain *domain)
>         return ret;
>=20
>     domain->context_id =3D ret;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[ret] =3D &root_pgtable[ret];
> +#endif
>=20
>     /*
>      * TTBR0
> @@ -615,6 +884,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu=
_vmsa_domain *domain)
>     ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
>     ipmmu_tlb_sync(domain);
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[domain->context_id] =3D NULL;
> +#endif
>     ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
> }
>=20
> @@ -1338,10 +1610,11 @@ static int ipmmu_add_device(u8 devfn, struct devi=
ce *dev)
>     struct iommu_fwspec *fwspec;
>=20
> #ifdef CONFIG_HAS_PCI
> +    int ret;
> +
>     if ( dev_is_pci(dev) )
>     {
>         struct pci_dev *pdev =3D dev_to_pci(dev);
> -        int ret;
>=20
>         if ( devfn !=3D pdev->devfn )
>             return 0;
> @@ -1358,17 +1631,24 @@ static int ipmmu_add_device(u8 devfn, struct devi=
ce *dev)
>     if ( !to_ipmmu(dev) )
>         return -ENODEV;
>=20
> -    if ( !dev_is_pci(dev) )
> +    if ( !dev_is_pci(dev) && dt_device_is_protected(dev_to_dt(dev)) )
>     {
> -        if ( dt_device_is_protected(dev_to_dt(dev)) )
> -        {
> -            dev_err(dev, "Already added to IPMMU\n");
> -            return -EEXIST;
> -        }
> +        dev_err(dev, "Already added to IPMMU\n");
> +        return -EEXIST;
> +    }
>=20
> -        /* Let Xen know that the master device is protected by an IOMMU.=
 */
> -        dt_device_set_protected(dev_to_dt(dev));
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( ipmmu_alloc_ctx_suspend(dev) )
> +    {
> +        dev_err(dev, "Failed to allocate context for suspend\n");
> +        return -ENOMEM;
>     }
> +#endif
> +
> +    /* Let Xen know that the master device is protected by an IOMMU. */
> +    if ( !dev_is_pci(dev) )
> +        dt_device_set_protected(dev_to_dt(dev));
> +
> #ifdef CONFIG_HAS_PCI
>     if ( dev_is_pci(dev) )
>     {
> @@ -1377,26 +1657,28 @@ static int ipmmu_add_device(u8 devfn, struct devi=
ce *dev)
>         struct pci_host_bridge *bridge;
>         struct iommu_fwspec *fwspec_bridge;
>         unsigned int utlb_osid0 =3D 0;
> -        int ret;
>=20
>         bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
>         if ( !bridge )
>         {
>             dev_err(dev, "Failed to find host bridge\n");
> -            return -ENODEV;
> +            ret =3D -ENODEV;
> +            goto free_suspend_ctx;
>         }
>=20
>         fwspec_bridge =3D dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node)=
);
>         if ( fwspec_bridge->num_ids < 1 )
>         {
>             dev_err(dev, "Failed to find host bridge uTLB\n");
> -            return -ENXIO;
> +            ret =3D -ENXIO;
> +            goto free_suspend_ctx;
>         }
>=20
>         if ( fwspec->num_ids < 1 )
>         {
>             dev_err(dev, "Failed to find uTLB");
> -            return -ENXIO;
> +            ret =3D -ENXIO;
> +            goto free_suspend_ctx;
>         }
>=20
>         rcar4_pcie_osid_regs_init(bridge);
> @@ -1405,7 +1687,7 @@ static int ipmmu_add_device(u8 devfn, struct device=
 *dev)
>         if ( ret < 0 )
>         {
>             dev_err(dev, "No unused OSID regs\n");
> -            return ret;
> +            goto free_suspend_ctx;
>         }
>         reg_id =3D ret;
>=20
> @@ -1420,7 +1702,7 @@ static int ipmmu_add_device(u8 devfn, struct device=
 *dev)
>         {
>             rcar4_pcie_osid_bdf_clear(bridge, reg_id);
>             rcar4_pcie_osid_reg_free(bridge, reg_id);
> -            return ret;
> +            goto free_suspend_ctx;
>         }
>     }
> #endif
> @@ -1429,6 +1711,13 @@ static int ipmmu_add_device(u8 devfn, struct devic=
e *dev)
>              dev_name(fwspec->iommu_dev), fwspec->num_ids);
>=20
>     return 0;
> +#ifdef CONFIG_HAS_PCI
> + free_suspend_ctx:
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    ipmmu_free_ctx_suspend(dev);
> +#endif
> +    return ret;
> +#endif
> }
>=20
> static int ipmmu_iommu_domain_init(struct domain *d)
> @@ -1490,6 +1779,10 @@ static const struct iommu_ops ipmmu_iommu_ops =3D
>     .unmap_page      =3D arm_iommu_unmap_page,
>     .dt_xlate        =3D ipmmu_dt_xlate,
>     .add_device      =3D ipmmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend         =3D ipmmu_suspend,
> +    .resume          =3D ipmmu_resume,
> +#endif
> };
>=20
> static __init int ipmmu_init(struct dt_device_node *node, const void *dat=
a)
> --=20
> 2.53.0
>=20


