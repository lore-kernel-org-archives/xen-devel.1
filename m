Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDAA606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 17:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=FaLL0NGf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=FaLL0NGf
Received: from list by lists.xenproject.org with outflank-mailman.1492940.1693176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTMbu-0003gk-NN; Tue, 17 Nov 2026 17:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492940.1693176; Tue, 17 Nov 2026 17:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTMbu-0003gd-Kh; Tue, 17 Nov 2026 17:04:46 +0000
Received: by outflank-mailman (input) for mailman id 1492940;
 Tue, 17 Nov 2026 17:04:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xTMbs-0003fS-Rm
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 17:04:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTMbs-001oTi-7F
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 18:04:44 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6afc891d-2eae-0a2a0a5409dd-0a2a4507d4e0-32
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 18:04:43 +0100
Received: from [52.101.84.70]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6afc892b-b4ea-0a2a45070019-3465544647e7-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 18:04:43 +0100
Received: from GV3PEPF0003BF39.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::628) by AM7PR08MB5320.eurprd08.prod.outlook.com
 (2603:10a6:20b:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:04:38 +0000
Received: from WA1PEPF00009B3E.eurprd05.prod.outlook.com (2603:10a6:1d8::117)
 by GV3PEPF0003BF39.outlook.office365.com (2603:10a6:158:401::628)
 with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.615.13 via Frontend Transport; Tue, 17 Nov 2026 17:04:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B3E.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 17:04:37 +0000
Received: from PR2PR08MB4761.eurprd08.prod.outlook.com (2603:10a6:101:17::21)
 by DU0PR08MB7392.eurprd08.prod.outlook.com (2603:10a6:10:353::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:04:04 +0000
Received: from PR2PR08MB4761.eurprd08.prod.outlook.com
 ([fe80::b71f:1158:311d:f87f]) by PR2PR08MB4761.eurprd08.prod.outlook.com
 ([fe80::b71f:1158:311d:f87f%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 17:04:04 +0000
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
 b=ciIKkf1DtBffEhXcO5WF+ky5pM+ahx7sLFL19+vNDRLMDnSXZJT/ZtOl4Gkrao8iUCXaT78LeZIJDdUaaZN823LNviEgJUCPHDr+37daN3XY7COwG5TuW/Q6XJ1GMe2tpDjNO+QiH7BBi+zztfMm5RnOqze4/L1noUOH71udvotUA1g6jrnJJ4r1w3k7g0gdeJMW19WUV8JKkkaWqere26Icxd44k2FQOtS8azEjYTobR0YHAlp9RkasmBvDCdFkjHnANKXfj4GAjqz0ZcSe1jcQUFj3u8D0bazSWI8RayOLOwsuObhg3yvadI+fBqnJGyW4B0tzIRvyKW/9e89PTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mU1JRlad5GZ4PcWg0Mc1VY9cPPcBQx1xaPYsr2rXoJ8=;
 b=vRGtn4DsXyPYNPyLQZDz3n+J0El4MvsBRTG+xivqE5lTsGMPMwCV0uFDZPcelGaYlzSVtSZYggOGFfzGae7irLoboYCCS7u1P/sevpB9xrq0oMBy19gSXF+7tODWzqzlwsgfzO5zC7yT/z7c9StPfJwto34FpPSZ091JycudUv2sc+0DlpGHLKp/IEhnSpvt55vq5oMuVIGvvmF31vJiA5fX53o28cmeAqXRzE+SuXISzB7Mquqcb0fXhuzhfyrmce2BCmpeS5167rMjDvDkZK7sJ0NKTU8b3nPoPpBafC5ej/OLGExmDv9dgxqrqR1I58OGH0JD65lc6tWoESiGdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mU1JRlad5GZ4PcWg0Mc1VY9cPPcBQx1xaPYsr2rXoJ8=;
 b=FaLL0NGfmdwAQ+iYDIoHMtKiGqN0I/ig46g+E6l0AIIGRr5zXXlcz0nJIUchgTWkDSoloZG/lMZl/4lF66wU0sZCe9H9VU40U5QpqDQJPOHagwv3v7NMQ8JLjSfo/VJrMxjrj4EqwWrVeW2HtTXbhuHrl9vSm9i/Hey0cs/mrtg=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB9uw6nYmnnm8buBIb6Dl4xp/yKPlJ4x/NAobts4PRdDqvqPINNjBAHinMTQ3hmFtEiQxf5QJCrPWBUD2yQNCcTwX5mZ9Jai9IhvAX6GPjbKRBwE+LDBkF8RPEK6rRKuPIMeBOHPq8x5eP3yI6gNLKblHPgVR8QTvPgR+jj1rFhQA/ujWlWIMDQG/YQLtUM/n1lfIiS/At7cSjpJVKEpccrzpmeSARhYKrqn4GPtXTXJ81gH1NstGj5tqOazMQEtZ1xxbXAtjEosrVWJcCZFGbCxcaWPZhrjmS3A530clf9c5j6s3VgFytcDKFBZgziKAteSepR7yuFNeFkBp9r2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mU1JRlad5GZ4PcWg0Mc1VY9cPPcBQx1xaPYsr2rXoJ8=;
 b=M6jSMxRJqbYXsRa30bkBZru6bdAOEipUHPyhjmt1wTKieCDZjT7UtYpTOTEpiacxyySs8aPXSWJjaVjWlYuttvTQcKonW978F5cIp6QSwLm/g05hy2e6fQHpdwEvTZsJGIpZOZPs+EYZwVcnJlAtTQz21qNZjYBaZyAPmm9RYmTuyt5zGBPEBOGITaLIFwquUF6rVNJ/vd6oYeLPHr22U6m0QTAS2d7C7IYNSmxdjtxNdB/ug3f0g7e3i7BbqO5hp8Q2D8L1s45hNz1VKQ6qoYfX01cPVDa94LsbQRGdE88dqy7b0AFw3P/8wQ2z/RBv16JLt8fKImyUx06wYQu9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mU1JRlad5GZ4PcWg0Mc1VY9cPPcBQx1xaPYsr2rXoJ8=;
 b=FaLL0NGfmdwAQ+iYDIoHMtKiGqN0I/ig46g+E6l0AIIGRr5zXXlcz0nJIUchgTWkDSoloZG/lMZl/4lF66wU0sZCe9H9VU40U5QpqDQJPOHagwv3v7NMQ8JLjSfo/VJrMxjrj4EqwWrVeW2HtTXbhuHrl9vSm9i/Hey0cs/mrtg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v14 10/15] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v14 10/15] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Index: AQHddi+6FoYwi2Pb6Ey5+D0ktn7uFLcyft+A
Date: Tue, 17 Nov 2026 17:04:03 +0000
Message-ID: <5A2BBABB-187E-4BE4-8EB8-AC042196E7A4@arm.com>
References: <cover.1794873792.git.mykola_kvach@epam.com>
 <b808e415bdd95d59fc7b1f6d03f2a979742f303e.1794873792.git.mykola_kvach@epam.com>
In-Reply-To:
 <b808e415bdd95d59fc7b1f6d03f2a979742f303e.1794873792.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR2PR08MB4761:EE_|DU0PR08MB7392:EE_|WA1PEPF00009B3E:EE_|AM7PR08MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e91737-77d3-439b-b711-08df44ccdcde
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|22082099003|261009223027099003|3023799007|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|261021135927099003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 4PVTN8NgSkal6Sd+R1bmuPt+QEP5YplnskqGn7MbQ8h1y9rR4rXafx1Lax8WCDkrhKWpX+B81JSDUvPpo/sWDVPZGsgKAzwSzunLlDW0ImealjIcXDXY6EyegLQVcvk7T9q/FRCjP+Vtgo+rgsO+WSFnmA6BEm2G/ROM4FfnOuUDTJRfSgwOLpUVkFHzWVG9dvBkLocUoyAAwhxigbaxWaOl80qkJiJmW6cHHuEsBKuG1i9byqLxtnDMIVX/J77c3xa33tpRAPMmhdJ1sM2yjrDSBLWWT5gr7hl0HqGMV7mlBA7XXJErD4Yp7D5sd8xb0gf6iP9Y0XeRsY/WSbK6rtj9dFzOFXzBaU3S6NZrQdfVyD7ltuqaTBI2XvKF9ikGcSvjbAl4MA+Buec9sZ1HPfsj3qKglpsKPnww3CWti3uLB5VFnW1CM7X7e5LfzmvT//IdD+qHzlelbiX1VlLTfh4ct22fd1uAxL4e76pQmidpLgCUI37pqA0niN9Fqgwt5ewEEItt8OgFlxFXmVOz9UFQOxkv+NC5Jgj9cqzrEsoKnTv79RAviIGMmAM66WYsf9A3FjfzDAECoT1Hs0WU6KOMF80+tTXRUvo4N1lU7/Cz0H3sLMLvXUXyJDIPgj7hTJ/MRMvvWKwl9NAnORP5N+rLL7yOPfWE8vbik7Y3zlE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4761.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(3023799007)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021135927099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <48490ABA174CF04487E2169D41792CD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 RfK432YGqWxM7u/xji80pQQksMnrCk4kR6MgGe7AI2Bn5K3l8urcIOkg1HYArmJR+H0qToXF1CgkxIeWhpGdKDQnIws/Z4pTGjMjPhlExtYKvt5zOIB9RR8yOrYI/76EM/gPvT2dMIwWoC1qdgo0ZMZHqWbdxRt+Cq7NscG86J+vnDS+kUGhGKgvI+IcpA3fSzoY14qsas8uRPQwpLOeAovTKwfuyV4hVB1I/CRTlQCkZwbi/cXP7mwTWktZs4ahFThwJtvyZ+HV2FONfNELh0u7LAddCcWv3gCtugxyV5etPW1K/Ky24kX7BjnWAsrqGgZN323XesERZSntGcEj7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7392
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 WA1PEPF00009B3E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2c85c5b-d6f3-4080-5674-08df44ccc8a4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|35042699022|14060799003|18002099003|6133799003|22082099003|261009223027099003|3023799007|13003099007|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IDU8BNSu9WFSCdQP6RxdMTEWqNC96hvel7RMrrWAgSOm3waiFzDB8tFKJgZUPm7yiUI16WSCxjuPLY8uPxLwMIzY5z/jtBkf0yRTl+oktGSS3ibW1PBwrHjeXAFeyP8aToGn4234Tm8oWZqfTiUfbH0zRFRVhioY7ujI9lE1KkYvBLVtuEgsdxUTkeI3daZ0xNraR71gXg+hNH8MHZtT32m3JKtxmLjREgerqHCuWRUBuwaaO+cm2xVqrfEoUmNdtB0OlFOPAaCoJQChKl8n6hAqs0OYaIkRgT8kmP/C1zL7Jsr3j2v+8Ry15UFG1Ew41SjWPhyFsya/R+GIEg5txdpwWUDxyD64dKiF6rfW/ZYES27CxLy3CDTOcTHFEoInG8bAEqhcyx43jTX9uLARQo1+CC4QRvE49RnmGXIjzBnqx+T1mTOtBoQ/Du7kPp+dwokL1Hz+mTzDUgRrylnPCi+HjvQAD7DZ+ux6SZILJDgJFl9GxBdgaRYMTKfHaO7LorMyKFNHSU02LX9/QjPgm3be4naGRHXTPBPeeSMBCcyhlOuJCZLRqZ7GCWkEBGr8TLnvnd3cpYTUaykFCGsthhD5lvLV6J6q0305XJT3655Nt2XoctKwibKluEijtSCrAYQ3ELYny9qCwa21Ovckwg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(35042699022)(14060799003)(18002099003)(6133799003)(22082099003)(261009223027099003)(3023799007)(13003099007)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mI/iEbcDhrNhq1Cv7L+UJfeZc9ZKid+805ogX7Z3cUWYdI/x67a1BevFsF/qDmhbC7z2maOmAigeVF9vgBP95Ln5RPPw7LV3iqpIb8F8l1amnExU603o+YudX6EC8lMAVHKLvmjWTdlf+2y4Yy6Au+97pIOWka26A789YAoAfBOZGJTK58fXwyzPJbzB1i/b+70PZ4p8fyonwdViKtzV4S0gAQR25zHk99G2TRb+zytw1Ddeg5zpLJSW+Cdf76hdDHvAEBU5ZrS3bKDC5EReooAtuuEIiK5sAmkloSN+9Wp3MoYFpixWYlCacYMXKhhOztkcQJqg96YUnLRP0vnlJjiQNO6uKzbEbB7+YPvQSINUI8Bin2r3upMfDBkgUVLKFWpq9zLA68DLh86QH8C+U2EfMVZN74FQNTqLnvav6n496IPpyhfm9588sUOyrpEc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:04:37.7251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e91737-77d3-439b-b711-08df44ccdcde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
X-purgate-ID: tlsNG-ef75cf/1794935083-A7ED6AE4-53DF8DFD/0/0
X-purgate-type: clean
X-purgate-size: 22558
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 17 Nov 2026, at 02:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> Add system suspend/resume callbacks for the Arm SMMUv3 driver.
>=20
> During suspend, set GBPA.ABORT and disable the translation interface and
> EVTQ/PRIQ, while keeping CMDQ enabled. Save the queue producer indices af=
ter
> the disable acknowledgements, then issue CMD_SYNC to wait for all earlier
> commands to complete. Disable interrupt generation before stopping CMDQ,
> and handle any remaining global errors before the SMMU loses power.
>=20
> If the initial GBPA update fails, leave that SMMU enabled and restore onl=
y
> the previously suspended devices. For later failures, restore the current
> SMMU as well. Before each rollback reset, wait for EVTQ/PRIQ to stop and
> save their producer indices. This also covers a CR0ACK timeout before the
> normal suspend path has saved the indices. Failure to stop the queues or
> to reset during rollback is fatal, since the host suspend error path
> allows domains to run again. Check GBPA and CMD_SYNC errors in reset so
> an incomplete restore is not reported as successful.
>=20
> Resume uses arm_smmu_device_reset() to restore the SMMU registers and que=
ue
> indices, invalidate cached configuration and translations, and enable the
> SMMU. Always schedule the EVTQ tasklet on resume to refresh the hardware
> producer index, including when the saved indices indicate an empty queue.
> Re-enabling interrupts does not report events recorded before the interru=
pt
> source was enabled. Prevent pending GERROR interrupts from accessing CMDQ
> while it is reset.
>=20
> Probe also changes with CONFIG_SYSTEM_SUSPEND disabled. Request IRQ
> handlers only after the queues and tasklets are ready. If reset fails
> during probe, call arm_smmu_device_disable() before freeing resources,
> since queues may already be enabled. Panic if disabling fails: the SMMU
> may still access the queue memory. The GERROR guard is also compiled in,
> but is cleared before handlers are registered and stays clear after probe=
.
> Reset now returns GBPA and CMD_SYNC errors in these builds too.
>=20
> Clear MSI target addresses on both probe and resume, also without
> CONFIG_MSI. Arm IHI0070G.b, sections 6.3.21 and 6.3.30, specify that thes=
e
> addresses reset to UNKNOWN and that zero disables MSIs while allowing
> wired IRQs. The corresponding IRQ_CTRL and IRQ_CTRLACK enable bits must
> both be clear before writing these registers. Disable interrupt generatio=
n
> and wait for IRQ_CTRLACK, as described in section 6.3.16, before clearing
> the addresses.
>=20
> Xen currently does not support SMMUv3 MSI interrupts or PCI ATS/PRI. Acti=
ve
> MSI configuration restore and ATS/PRI endpoint suspend handling remain
> outside this patch.
>=20
> Link: https://lore.kernel.org/r/20260929034510.2023173-1-praan@google.com=
/
> Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
> Assisted-by: Codex:GPT-6
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in V14:
> - Schedule the EVTQ tasklet unconditionally on resume so it refreshes
>  the hardware producer index even when the saved indices indicate an
>  empty queue.
>=20
> Changes in V13:
> - Rename __init_or_smmu_suspend to init_or_smmu_suspend to avoid a reserv=
ed
>  macro name (MISRA Rule 21.1). No functional change.
> - Check arm_smmu_device_disable() after a probe reset failure (MISRA Rule
>  17.7). Panic if disabling fails, before freeing queue memory.
> - Adapt the relevant fixes from v11 of the Linux SMMUv3 suspend series.
> - Request IRQs after the queues and tasklets are ready, only during probe=
.
> - Disable the SMMU on probe-time reset failure before freeing resources.
> - Check GBPA and CMD_SYNC errors in reset, and make a failed rollback res=
et
>  fatal before the host suspend error path can resume domain execution.
> - Leave the current SMMU enabled if the initial GBPA update fails; restor=
e
>  only the previously suspended devices.
> - Clear MSI target addresses on probe and resume, also when using wired
>  IRQs, and document the register requirements from IHI0070G.b.
> - Save EVTQ/PRIQ producer indices after confirming that the queues have
>  stopped, both during suspend and before rollback reset. Cover a CR0ACK
>  timeout before the normal snapshot. Schedule tasklets after reset to
>  process unread entries without waiting for a new interrupt.
> - Keep GERROR handling available until interrupt generation is disabled,
>  then gate its IRQ handler before stopping CMDQ. Handle remaining global
>  errors before power-off and allow the handler again once CMDQ is restore=
d.
> - Drop Luca's Reviewed-by tag because the patch has changed.
>=20
> Changes in V11:
> - Keep arm_smmu_update_gbpa() and arm_smmu_device_reset() in init text wh=
en
>  CONFIG_SYSTEM_SUSPEND is disabled.
>=20
> Changes in V10:
> - Disable SMMU interrupt generation during suspend before disabling the
>  SMMU interface, matching the resume/reset path which re-enables IRQ_CTRL=
.
>=20
> Changes in V9:
> - Use CMD_SYNC in suspend instead of polling CMDQ_CONS, so the suspend
>  path waits for command completion rather than only command consumption.
> - Document that arm_smmu_setup_irqs() is probe-only and that future Xen
>  SMMUv3 MSI support will need to restore SMMU IRQ_CFGn registers on
>  resume.
> - Restore the reference to Pranjal's Linux runtime/system sleep series an=
d
>  clarify that MSI/ATS/PRI resume handling is outside the supported Xen
>  path.
> - Prefix the subject with xen/arm for consistency with the rest of the
>  Arm suspend/resume series.
>=20
> Changes in V8:
> - Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matching
>  the existing runtime CMD_SYNC path.
> - Fold the suspend rollback reset path into a helper and rename the error
>  reporting to describe suspend rollback rather than resume.
> - Treat SMMU reset failure during resume as fatal instead of logging and
>  continuing with a potentially unusable IOMMU.
> - cosmetic changes
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 308 +++++++++++++++++++++-----
> xen/drivers/passthrough/arm/smmu-v3.h |   1 +
> 2 files changed, 258 insertions(+), 51 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 232df2421c..fa0c57886e 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -94,6 +94,12 @@
>=20
> #include "smmu-v3.h"
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +#define init_or_smmu_suspend
> +#else
> +#define init_or_smmu_suspend __init
> +#endif
> +
> #define ARM_SMMU_VTCR_SH_IS		3
> #define ARM_SMMU_VTCR_RGN_WBWA		1
> #define ARM_SMMU_VTCR_TG0_4K		0
> @@ -903,10 +909,10 @@ static void arm_smmu_priq_tasklet(void *dev)
>=20
> static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
>=20
> -static void arm_smmu_gerror_handler(int irq, void *dev)
> +/* The caller must serialize with the IRQ handler. */
> +static void arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
> {
> 	u32 gerror, gerrorn, active;
> -	struct arm_smmu_device *smmu =3D dev;
>=20
> 	gerror =3D readl_relaxed(smmu->base + ARM_SMMU_GERROR);
> 	gerrorn =3D readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
> @@ -948,6 +954,14 @@ static void arm_smmu_gerror_handler(int irq, void *d=
ev)
> 	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
> }
>=20
> +static void arm_smmu_gerror_handler(int irq, void *dev)
> +{
> +	struct arm_smmu_device *smmu =3D dev;
> +
> +	if (!read_atomic(&smmu->gerror_blocked))
> +		arm_smmu_handle_gerror(smmu);
> +}
> +
> static void arm_smmu_combined_irq_handler(int irq, void *dev)
> {
> 	struct arm_smmu_device *smmu =3D dev;
> @@ -1871,8 +1885,8 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_=
device *smmu, u32 val,
> }
>=20
> /* GBPA is "special" */
> -static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
> -                                       u32 set, u32 clr)
> +static int init_or_smmu_suspend
> +arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
> {
> 	int ret;
> 	u32 reg, __iomem *gbpa =3D smmu->base + ARM_SMMU_GBPA;
> @@ -1893,6 +1907,20 @@ static int __init arm_smmu_update_gbpa(struct arm_=
smmu_device *smmu,
> 	return ret;
> }
>=20
> +static void arm_smmu_clear_msi_cfg(struct arm_smmu_device *smmu)
> +{
> +	/*
> +	 * IHI0070G.b, sections 6.3.21 and 6.3.30: ADDR resets to UNKNOWN.
> +	 * ADDR =3D=3D 0 disables MSIs while allowing wired IRQs. The correspon=
ding
> +	 * IRQ_CTRL and IRQ_CTRLACK enable bits must be clear before writing.
> +	 */
> +	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> +	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_PRI)
> +		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> +}
> +
> #ifdef CONFIG_MSI
> static void arm_smmu_free_msis(void *data)
> {
> @@ -1921,13 +1949,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_de=
vice *smmu)
> 	int ret, nvec =3D ARM_SMMU_MAX_MSIS;
> 	struct device *dev =3D smmu->dev;
>=20
> -	/* Clear the MSI address regs */
> -	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> -	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> -
> -	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> -	else
> +	if (!(smmu->features & ARM_SMMU_FEAT_PRI))
> 		nvec--;
>=20
> 	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
> @@ -1968,7 +1990,8 @@ static void arm_smmu_setup_msis(struct arm_smmu_dev=
ice *smmu)
> static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { }
> #endif /* CONFIG_MSI */
>=20
> -static void __init arm_smmu_free_irqs(struct arm_smmu_device *smmu)
> +static void init_or_smmu_suspend
> +arm_smmu_free_irqs(struct arm_smmu_device *smmu)
> {
> 	int irq;
>=20
> @@ -2052,19 +2075,38 @@ err_free_evtq_irq:
> 	return ret;
> }
>=20
> -static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> {
> -	int ret, irq;
> +	int ret;
> 	u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
>=20
> -	/* Disable IRQs first */
> -	ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> -				      ARM_SMMU_IRQ_CTRLACK);
> -	if (ret) {
> -		dev_err(smmu->dev, "failed to disable irqs\n");
> +	if ( smmu->features & ARM_SMMU_FEAT_PRI )
> +		irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> +
> +	/* Enable interrupt generation on the SMMU */
> +	ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> +				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> +	if ( ret )
> +	{
> +		dev_warn(smmu->dev, "failed to enable irqs\n");
> 		return ret;
> 	}
>=20
> +	return 0;
> +}
> +
> +static int arm_smmu_disable_irqs(struct arm_smmu_device *smmu)
> +{
> +	return arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> +				       ARM_SMMU_IRQ_CTRLACK);
> +}
> +
> +/* Probe-time only; reset has configured the queues and disabled IRQs. *=
/
> +static int init_or_smmu_suspend
> +arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> +{
> +	int ret, irq;
> +
> 	irq =3D smmu->combined_irq;
> 	if (irq) {
> 		/*
> @@ -2085,22 +2127,7 @@ static int __init arm_smmu_setup_irqs(struct arm_s=
mmu_device *smmu)
> 		}
> 	}
>=20
> -	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> -
> -	/* Enable interrupt generation on the SMMU */
> -	ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> -				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> -	if (ret) {
> -		dev_warn(smmu->dev, "failed to enable irqs\n");
> -		goto err_free_irqs;
> -	}
> -
> 	return 0;
> -
> -err_free_irqs:
> -	arm_smmu_free_irqs(smmu);
> -	return ret;
> }
>=20
> static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> @@ -2114,18 +2141,31 @@ static int arm_smmu_device_disable(struct arm_smm=
u_device *smmu)
> 	return ret;
> }
>=20
> -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +static int init_or_smmu_suspend
> +arm_smmu_device_reset(struct arm_smmu_device *smmu, bool resume)
> {
> 	int ret;
> 	u32 reg, enables;
> 	struct arm_smmu_cmdq_ent cmd;
>=20
> +	ret =3D arm_smmu_disable_irqs(smmu);
> +	if (ret) {
> +		dev_err(smmu->dev, "failed to disable irqs\n");
> +		return ret;
> +	}
> +
> +	/* A pending GERROR IRQ must not access CMDQ while it is reset. */
> +	write_atomic(&smmu->gerror_blocked, true);
> +	arm_smmu_clear_msi_cfg(smmu);
> +
> 	/* Clear CR0 and sync (disables SMMU and queue processing) */
> 	reg =3D readl_relaxed(smmu->base + ARM_SMMU_CR0);
> 	if (reg & CR0_SMMUEN) {
> 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
> 		WARN_ON(!disable_bypass);
> -		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +		ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +		if (ret)
> +			return ret;
> 	}
>=20
> 	ret =3D arm_smmu_device_disable(smmu);
> @@ -2164,10 +2204,15 @@ static int __init arm_smmu_device_reset(struct ar=
m_smmu_device *smmu)
> 		return ret;
> 	}
>=20
> +	/* GERROR handling can use CMDQ again once its registers are restored. =
*/
> +	write_atomic(&smmu->gerror_blocked, false);
> +
> 	/* Invalidate any cached configuration */
> 	cmd.opcode =3D CMDQ_OP_CFGI_ALL;
> 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> -	arm_smmu_cmdq_issue_sync(smmu);
> +	ret =3D arm_smmu_cmdq_issue_sync(smmu);
> +	if (ret)
> +		return ret;
>=20
> 	/* Invalidate any stale TLB entries */
> 	if (smmu->features & ARM_SMMU_FEAT_HYP) {
> @@ -2177,7 +2222,9 @@ static int __init arm_smmu_device_reset(struct arm_=
smmu_device *smmu)
>=20
> 	cmd.opcode =3D CMDQ_OP_TLBI_NSNH_ALL;
> 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> -	arm_smmu_cmdq_issue_sync(smmu);
> +	ret =3D arm_smmu_cmdq_issue_sync(smmu);
> +	if (ret)
> +		return ret;
>=20
> 	/* Event queue */
> 	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
> @@ -2220,17 +2267,18 @@ static int __init arm_smmu_device_reset(struct ar=
m_smmu_device *smmu)
> 		}
> 	}
>=20
> -	ret =3D arm_smmu_setup_irqs(smmu);
> -	if (ret) {
> -		dev_err(smmu->dev, "failed to setup irqs\n");
> -		return ret;
> +	/* Register handlers only after their queues and tasklets are ready. */
> +	if (!resume) {
> +		ret =3D arm_smmu_setup_irqs(smmu);
> +		if (ret) {
> +			dev_err(smmu->dev, "failed to setup irqs\n");
> +			return ret;
> +		}
> 	}
>=20
> -	/* Initialize tasklets for threaded IRQs*/
> -	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> -	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> -	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet=
,
> -				 smmu);
> +	ret =3D arm_smmu_enable_irqs(smmu);
> +	if (ret)
> +		goto err_free_irqs;
>=20
> 	/* Enable the SMMU interface, or ensure bypass */
> 	if (disable_bypass) {
> @@ -2247,10 +2295,18 @@ static int __init arm_smmu_device_reset(struct ar=
m_smmu_device *smmu)
> 		goto err_free_irqs;
> 	}
>=20
> +	/* IHI0070G.b, section 6.3.16: re-enabling IRQs does not replay events.=
 */
> +	if (resume)
> +		tasklet_schedule(&smmu->evtq_irq_tasklet);
> +	if (resume && (smmu->features & ARM_SMMU_FEAT_PRI) &&
> +	    !queue_empty(&smmu->priq.q.llq))
> +		tasklet_schedule(&smmu->priq_irq_tasklet);
> +
> 	return 0;
>=20
> err_free_irqs:
> -	arm_smmu_free_irqs(smmu);
> +	if (!resume)
> +		arm_smmu_free_irqs(smmu);
> 	return ret;
> }
>=20
> @@ -2615,10 +2671,21 @@ static int __init arm_smmu_device_probe(struct pl=
atform_device *pdev)
> 	if (ret)
> 		goto out_free;
>=20
> +	/* Initialize tasklets for threaded IRQs*/
> +	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> +	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> +	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet=
,
> +				smmu);
> +
> 	/* Reset the device */
> -	ret =3D arm_smmu_device_reset(smmu);
> -	if (ret)
> +	ret =3D arm_smmu_device_reset(smmu, false);
> +	if (ret) {
> +		/* Reset may have enabled queues before failing. */
> +		if (arm_smmu_device_disable(smmu))
> +			panic("SMMUv3: %s: Failed to disable during probe cleanup\n",
> +			      dev_name(smmu->dev));
> 		goto out_free;
> +	}
>=20
> 	/*
> 	 * Keep a list of all probed devices. This will be used to query
> @@ -2632,7 +2699,6 @@ static int __init arm_smmu_device_probe(struct plat=
form_device *pdev)
>=20
> 	return 0;
>=20
> -
> out_free:
> 	arm_smmu_free_structures(smmu);
> 	if (smmu->page1)
> @@ -2912,6 +2978,142 @@ static void arm_smmu_iommu_xen_domain_teardown(st=
ruct domain *d)
> 	xfree(xen_domain);
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static void arm_smmu_save_queue_producers(struct arm_smmu_device *smmu)
> +{
> +	/*
> +	 * IHI0070G.b, sections 6.3.9.4 and 6.3.9.5: EVTQ/PRIQ disable
> +	 * acknowledgements make committed entries visible. The caller must
> +	 * wait for these acknowledgements before reading the producer indices.
> +	 */
> +	if (queue_sync_prod_in(&smmu->evtq.q) =3D=3D -EOVERFLOW)
> +		dev_warn(smmu->dev, "EVTQ overflow detected during suspend\n");
> +	if ((smmu->features & ARM_SMMU_FEAT_PRI) &&
> +	    queue_sync_prod_in(&smmu->priq.q) =3D=3D -EOVERFLOW)
> +		dev_warn(smmu->dev, "PRIQ overflow detected during suspend\n");
> +}
> +
> +static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device *=
smmu)
> +{
> +	int ret;
> +	u32 reg;
> +
> +	/*
> +	 * The queues have been requested to stop, but a CR0ACK timeout may
> +	 * have skipped saving their producer indices. Wait for the queue
> +	 * disable acknowledgements before reset overwrites those indices.
> +	 */
> +	ret =3D readl_relaxed_poll_timeout(smmu->base + ARM_SMMU_CR0ACK, reg,
> +					 !(reg & (CR0_EVTQEN | CR0_PRIQEN)),
> +					 1, ARM_SMMU_POLL_TIMEOUT_US);
> +	if (ret)
> +		panic("SMMUv3: %s: Queue stop timed out during rollback: %d\n",
> +		      dev_name(smmu->dev), ret);
> +
> +	arm_smmu_save_queue_producers(smmu);
> +	ret =3D arm_smmu_device_reset(smmu, true);
> +
> +	/* The host suspend error path allows domains to run again. */
> +	if ( ret )
> +		panic("SMMUv3: %s: Failed to reset during suspend rollback: %d\n",
> +		      dev_name(smmu->dev), ret);
> +}
> +
> +static int arm_smmu_suspend(void)
> +{
> +	struct arm_smmu_device *smmu;
> +	int ret =3D 0;
> +
> +	list_for_each_entry(smmu, &arm_smmu_devices, devices)
> +	{
> +		/* Abort all transactions before disable to avoid spurious bypass */
> +		ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +		if ( ret )
> +			goto rollback_previous;
> +
> +		/* Disable the SMMU via CR0.EN and all queues except CMDQ */
> +		ret =3D arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
> +					ARM_SMMU_CR0ACK);
> +		if ( ret )
> +		{
> +			dev_err(smmu->dev, "Timed-out while disabling smmu\n");
> +			goto fail;
> +		}
> +
> +		arm_smmu_save_queue_producers(smmu);
> +
> +		/*
> +		 * At this point the translation interface is disabled and the
> +		 * SMMU won't access translation/config structures, even
> +		 * speculatively, as per the IHI0070 spec (section 6.3.9.6).
> +		 * CMDQ is still enabled so that a CMD_SYNC can complete any
> +		 * previously issued commands.
> +		 */
> +
> +		/* Ensure all previously issued commands have completed. */
> +		ret =3D arm_smmu_cmdq_issue_sync(smmu);
> +		if ( ret )
> +		{
> +			dev_err(smmu->dev, "Timed-out waiting for pending commands\n");
> +			goto fail;
> +		}
> +
> +		/* Stop IRQ generation before gating the handler and disabling CMDQ. *=
/
> +		ret =3D arm_smmu_disable_irqs(smmu);
> +		if (ret) {
> +			dev_err(smmu->dev, "Timed-out while disabling SMMU irqs\n");
> +			goto fail;
> +		}
> +		write_atomic(&smmu->gerror_blocked, true);
> +
> +		/* Disable everything */
> +		ret =3D arm_smmu_device_disable(smmu);
> +		if ( ret )
> +			goto fail;
> +
> +		/* Other CPUs are offline and the IRQ handler is gated above. */
> +		arm_smmu_handle_gerror(smmu);
> +
> +		dev_dbg(smmu->dev, "Suspended smmu\n");
> +	}
> +
> +	return 0;
> +
> + fail:
> +	/* Reset the device that failed as well as any already-suspended ones. =
*/
> +	arm_smmu_reset_for_suspend_rollback(smmu);
> +
> + rollback_previous:
> +	/* An initial GBPA failure leaves this SMMU enabled: do not reset it. *=
/
> +	list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices)
> +		arm_smmu_reset_for_suspend_rollback(smmu);
> +
> +	return ret;
> +}
> +
> +static void arm_smmu_resume(void)
> +{
> +	int ret;
> +	struct arm_smmu_device *smmu;
> +
> +	list_for_each_entry(smmu, &arm_smmu_devices, devices)
> +	{
> +		dev_dbg(smmu->dev, "Resuming device\n");
> +
> +		/*
> +		 * The reset will re-initialize all the base addresses, queues,
> +		 * prod and cons maintained within struct arm_smmu_device as well as
> +		 * re-enable the interrupts.
> +		 */
> +		ret =3D arm_smmu_device_reset(smmu, true);
> +		if ( ret )
> +			panic("SMMUv3: %s: Failed to reset during resume: %d\n",
> +			      dev_name(smmu->dev), ret);
> +	}
> +}
> +#endif
> +
> static const struct iommu_ops arm_smmu_iommu_ops =3D {
> 	.page_sizes		=3D PAGE_SIZE_4K,
> 	.init			=3D arm_smmu_iommu_xen_domain_init,
> @@ -2925,6 +3127,10 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
> 	.dt_xlate		=3D arm_smmu_dt_xlate,
> 	.add_device		=3D arm_smmu_add_device,
> 	.remove_device		=3D arm_smmu_remove_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +	.suspend		=3D arm_smmu_suspend,
> +	.resume			=3D arm_smmu_resume,
> +#endif
> };
>=20
> static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthro=
ugh/arm/smmu-v3.h
> index ab07366294..93986886f2 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -613,6 +613,7 @@ struct arm_smmu_device {
> 	int				combined_irq;
> 	u32				sync_nr;
> 	u8				prev_cmd_opcode;
> +	bool				gerror_blocked;
>=20
> 	unsigned long			ias; /* IPA */
> 	unsigned long			oas; /* PA */
> --=20
> 2.53.0


