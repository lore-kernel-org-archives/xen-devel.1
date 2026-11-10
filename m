Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A49606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=LuzQZBH7;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=LuzQZBH7
Received: from list by lists.xenproject.org with outflank-mailman.1481922.1685814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQn9R-00048x-M5; Tue, 10 Nov 2026 14:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481922.1685814; Tue, 10 Nov 2026 14:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQn9R-00048q-HJ; Tue, 10 Nov 2026 14:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1481922;
 Tue, 10 Nov 2026 14:48:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xQn9Q-00047W-7Y
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:48:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQn9P-006XEK-JZ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:48:43 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af32eca-8faa-0a2a0a5109dd-0a2a4509adb2-2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:48:43 +0100
Received: from [40.107.159.2]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af32eca-be1a-0a2a45090019-286b9f02baeb-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:48:42 +0100
Received: from PAZP264CA0089.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fa::12)
 by AS2PR08MB8456.eurprd08.prod.outlook.com (2603:10a6:20b:55c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 10 Nov
 2026 14:48:39 +0000
Received: from ZR1PEPF0000E45F.eurprd04.prod.outlook.com
 (2603:10a6:102:1fa:cafe::33) by PAZP264CA0089.outlook.office365.com
 (2603:10a6:102:1fa::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 14:48:37 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E45F.mail.protection.outlook.com (10.167.241.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 14:48:36 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by PAWPR08MB10282.eurprd08.prod.outlook.com (2603:10a6:102:35c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 14:47:58 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 14:47:58 +0000
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
 b=XwTQH8CU+fBWf0ZxY8v0mmpG3p9PPLweFXpgE9UFmZroeTIDDV4m1oEYZNDADg81oBiFIfJ12x0sjz2B73iwDE9QDpmjZ/G7g3fcO6soZmXpIhgG/LrV0GXXMF1meNviNBuG4mZuoUGYrkrkxhE6TUZkpHoUgLqUmIcCk9gk6F1O1JJq767EcgYGoNUpslp8CbNeui35q3Zi1JzI/zZRBsyNfQ74jtGL2Pwgu3vLHUDmmqsnmeBeU6/P+0Zw0EjRVeMn3Aj74hS6fnqAgH1zB0UC3nz840a1UOzk3ZFZ2FhsO17uT7hdLTGSqJ5l0fWY9BYBgAUdXvUtNEpl7TZCCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpoT2NeiX+46NXakp8ciBcBzSbsHi0V8VsopJZM8Pq4=;
 b=TxlGKForJyx1We77PJw27jq6pghICCaJ8rnd70TwOqiJNIyGyD5qo4TrJwp/WYCjSarvsk36NHTkDDIGgQ9roU3YjQbKl+0Ra5b1bikiHOBxUDuY0nzdFusQDEgGfcUqY3U084QQTND9y29lLQvY04HtEP4dqoNGsv7VdEcVxtkcNsyaNrgDLrxaRFYyBwaOUD0BY6OtgMR7smHNgScIMKGb7BVVi2DvKNR0jNleIRnFM3N1Wi6tw4fss227TT27JjFr3nzN5Q7oLiha4BwyRVIHvkITE1k5k+e/sM3YM3X3jLxu4aRHP2LLS0tb5/l+YcHpIosoOB8mgDe+AiWWHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpoT2NeiX+46NXakp8ciBcBzSbsHi0V8VsopJZM8Pq4=;
 b=LuzQZBH73botp+wshATQU4TYfWl6jyArcqP0wgv4NMoSxkXWk/le8lSFFjkOiWvb6OAS0hOvwMFAkSa4TcLlwqj3QmNn7MiA4e6LRdLWgq66ULjpfIuphoX664p6UWPHCGGnbo24VTVDg6nCNuDG2LpajT75GZ4fXeVfGxIX1kI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ph1YtzLJ+AuNPRsoXOjfFh/+zZ2DFQHhevSVqNYLEtV5Qn5LmisHTsiZw8KebjNLy2YuvKtQJVE+7f7DByL+sHE6Xg1pWh5iAqcDjTs5dOM0LgSBr5TMgCo9k2vXlp5k73AANI6ELgSxszgfSdd2MhsXH/sBzt1vWSY5JkePLmvhdYQ/r+V5s3Q8DiYEWVDrN8SMSoJrNreUEihftoQefHqXzPSXXBoEV0LXgUaUxZ9M6m1PfL540JFRx4lvHFOduxPS0t1zu04849fldHyniHkqdjlynUiI1rl1RLSNEIqLCi8SxpglANfUl2QmJGBLdMO2gwexO088xL2mzVzCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpoT2NeiX+46NXakp8ciBcBzSbsHi0V8VsopJZM8Pq4=;
 b=lsP14IsHdxLb150A8yUwdmetJJ6imajNb2ztuKtNCYdUZMmXOtlil0AOkB2t2bd2HY1NzA4m1vSpDHFy5zHr111gTBx3eTt4M9QbD1Ra0dhV3ZeFXqFRZBQYU77n8c3PPGAHA2JnLQAterWcIjEYkChrfPdgtY5FOT5+9Wp3BAZtvuBjuFJHJl4sJv5t0sgWAIcRCe9ql/CsXeLHdmcL7Rz18kQhYw6D8+UovmebCA0d8iKzC8a/9wcMkhveea6GZ5oZLm626VliBbHNxvh5N3HpwjZWPo/Sr4c0nl6VjKux8zmcLMOv4TDsuNfHESd1oAjlh/hIl0jgOjtoubd3Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpoT2NeiX+46NXakp8ciBcBzSbsHi0V8VsopJZM8Pq4=;
 b=LuzQZBH73botp+wshATQU4TYfWl6jyArcqP0wgv4NMoSxkXWk/le8lSFFjkOiWvb6OAS0hOvwMFAkSa4TcLlwqj3QmNn7MiA4e6LRdLWgq66ULjpfIuphoX664p6UWPHCGGnbo24VTVDg6nCNuDG2LpajT75GZ4fXeVfGxIX1kI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v13 05/14] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
Thread-Topic: [PATCH v13 05/14] xen/arm: gic-v3: Implement GICv3
 suspend/resume functions
Thread-Index: AQHdZlcKV4nBdqhgpUm+3EOuuWX7vbcneDkA
Date: Tue, 10 Nov 2026 14:47:58 +0000
Message-ID: <4641C3FB-AC62-4885-A81D-F407F9E337E4@arm.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <25db7c4451729a8c6e35b5e8f7a473c42eeac7a9.1793129971.git.mykola_kvach@epam.com>
In-Reply-To:
 <25db7c4451729a8c6e35b5e8f7a473c42eeac7a9.1793129971.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|PAWPR08MB10282:EE_|ZR1PEPF0000E45F:EE_|AS2PR08MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: d2de2ad2-a36b-4d8c-c10e-08df3f39b3ad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|4143699003|11063799006|10067099003|56012099006|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261021135927099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 uRO6Vdia1oWDlfSD0st5iaAEv5wpO6I1n52PHgTo1ebFWYkL3qPpmy5CKE/Rf63ICJ7R4vkuOYIg1Q2g6qO0jKkZwXeUuNmjHhCAEj8WQGve0pD3WeQNr/qnwWFZo+2RGZTA0/BFJs5qlewDXq4WgnRV3ORdjnAH92pdBSDpEAJmCcbwdDgEb8m8JIq342hWscewI1UwAOCxqAEFC5qVimED+zAq1dq90DL4t4QNDmt2YWCXuBXJ0uFXkiL98JVoK7afqFoZ9OVlcCToVTmWranwOGI5+8o4PC9qcqFufljsLkjJkFOQxmTCmpKGPnPDkqQnwycokmcljpk6+xKZwZsZw7O9vseHDnp9q5LGCqz6NiZx6QM4I+VZe1D31AuH2wNK9LYd8GEvb9MJvF7l7DNw8WL3lKopNhw+JSi7oYK6/W/9Gy0tPc/M8TzEwzDsZEFOXHhzllBGjr1fDVJ87wfGVi+bFbQ3cE8OsSC0Yaev6nHYCYaCDdLRJpn7hxe5WupnT8L68vSCuIi3jdlXKPfbn4LfHiudorZhVkqj/6CabFJe2q7bPuDMc478+ALxZBqUwLoBigC8PLmFYUtIQ7yKDVsqfiZZuABHdOofL2s6EVW49eN+HpqwcyqB6DbXbK5Q6jisMyvE/4Wax1RidNTbiaiV4s1E1S3//spi3IWYwMU90tAc3nHsU2Nb4JTUvkMWOrLJt28+RvqcHkaU06/GQcRSN+O7t206MrOPwXw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021135927099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CBA896E2AE826B41A8C6D419FD354336@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 gdMfuWA0572zpErFqXn81cL37fZLMjNF0lfAd+QbtqzsBiPt2IxBIdE8EvnHNjaVT06fvl5b8R4V3kgdPaZ+VNawOcB0d7l1fblsbOjg5JVbcJiJdofR6QboZLlbBO8pWRsZcrslT5zkvqQKsjKQv+c4tPW9Jcg9HkJnqrQW34aRE/mxfAwJDOITpRuSMI3CiQMe7FbGt9HH4ZeosXmV+6SA25zSiIFTw8o3sLW+iFR1kc1j84aDfk97I9PJTvHoUmmWZ7TL1DlB2Hy8ApaLUUHgZeY8K3oXSV49wRzZIMxNMA9HtBCkAqACo4xyLIWQyvQmNLqYVLEDV+El151dOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10282
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E45F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e84a047c-1f90-4a88-e9c3-08df3f399ce6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|23010399003|376014|1800799024|36860700016|82310400026|14060799003|261021135927099003|4143699003|261028144727099003|56012099006|11063799006|261026121527099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JPQexImLQx3CKOgmS5K5lvP3sqngagPrGDE6jea0/upWqLV2PaEiX4LxlmiJbHhaqDHRLMkfDhabNe3dnNL4iIEJ8Rg4DgvXOQJCbgBVlHRhUQL+zrAEBJpR7Pr+rv5nWwt0cSSb3HKS6n5HZ90cm/Ky32JeIwLZlJ4Va/n7HWoknZOH1L1UqEJfKFiZsjV5BucmOONdsti6D4C/+4m1BMR9Va3t9rC5tfVwQpAdEE4vYdR2ay9pMAThenJ+Kefl1XlfUMx7stP47HMRqqd7FFYNNFnitw6SabUNH7UWPdL7L015+ITaPdBxOI43TbcdIh7GMyB3ZHAVyiOsgCGKswuqsFVV3wPIrZe80os3ksmujeQ+ZgPbK6SG0kCcgKWox2BJr3jrGx14uFaKteBl7N97L+Tk6LWZbWpjiu9y7SYlQ0tQQQeSu3Wx5sGo1f5ebOX4C+p2fOD606/WIDD9HN1IQ0UYZXcRGBECDtQxLlwlzY8qA3e0DD9Lr+R/E1NwZCYk/aV7WBDJFgXmD6jM2a4sUgUwVCHKXnA2HbWsPN6ImM2G71LcVY1KWncgUgvJ11iS282+6M4CAGttnkjRYvjMTv/pUWMiX9xj/gr9l3+Yk39RUkuep6IJ+/+I+Qu358+F0kHYr58ITzSqy6b5PYUuiDQe8qZHAcFlLv0yQhKdnF3hvIe1HxOAJ/gFr/fbu//HOlG3zwchoAZIS5Qgnw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(14060799003)(261021135927099003)(4143699003)(261028144727099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kMrF6R+VsV14iTBXE4OEyYeBlaCBaf0zcSfs6foY0HrIk14XERU6JzI2/bN8/jIdvkP1xhtxdr2m3tW226gMnYgYMJugVFF3yoVDF9QWU7H2kjo1aIFGd3SaJzw4P86NqjUfgeEbG2vCM1eY5Xp4XNliGonfoNk9vJUlO1EVtC+e6JTS/dSZEyvZZXFS4yjFP3FhqjtRGZkyRSi0QCwRNnahk1g5QmltOoOzA+HORKv/AiPCQl1r+SnfzYnBy8rBrljjRFBbvKe4r4zJdr2r0Euqoy3bkWKXa4vQwzBE1YIQ10/FVLQWrnmwawXKNqMTIC5MpFaZBIABYsU372UL9Rv/hzBCLsqsMPBpIpb9P+qj6ibWdp4+voe6YJyI5l0ucw2wpZuP00Bd0P255xaSkPktBH49x4VmddN5YNYcsSUXSmMTZId0DZBCdAOEX6LW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:48:36.8527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2de2ad2-a36b-4d8c-c10e-08df3f39b3ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E45F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8456
X-purgate-ID: tlsNG-bad1c0/1794322123-3A2C4034-F2B80C65/0/0
X-purgate-type: clean
X-purgate-size: 1536
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 27 Oct 2026, at 22:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
>=20
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
>=20
> Before continuing suspend, also verify that the physical CPU interface
> has no Group 1 active-priority state left. Use ICC_CTLR_EL1.PRIbits to
> decide which ICC_AP1R<n>_EL1 registers are implemented, so Xen does not
> read an unimplemented AP1R register.
>=20
> Have gicv3_suspend() panic if the Redistributor does not set
> GICR_WAKER.ChildrenAsleep before the timeout. Clearing ProcessorSleep
> while ChildrenAsleep is still zero is UNPREDICTABLE, so Xen cannot safely
> undo this transition and restore the CPU interface. Keep error reporting
> in gicv3_disable_redist(), including the CPU.
>=20
> Check active priorities before disabling the CPU and virtual interfaces,
> while local IRQs are masked. Return directly on failure, without changing
> the interfaces or requesting Redistributor sleep.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Looks good to me with one nit:
With your renaming to nr_block_irqs some lines are now 81 chars it seems.

With that handled:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


