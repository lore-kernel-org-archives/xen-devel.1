Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17722C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 08:02:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394827.1633459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwbFs-0008UF-5P; Wed, 19 Aug 2026 08:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394827.1633459; Wed, 19 Aug 2026 08:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwbFs-0008U8-2Y; Wed, 19 Aug 2026 08:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1394827;
 Wed, 19 Aug 2026 08:02:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wwbFq-0008U2-Hn
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:02:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwbFp-008bHd-Ua
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:02:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a85630c-2eae-0a2a0a5409dd-0a2a4501db20-34
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:02:30 +0200
Received: from [52.101.65.13]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a856316-5984-0a2a45010019-3465410df103-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:02:30 +0200
Received: from AM8P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::20)
 by PAWPR08MB11414.eurprd08.prod.outlook.com (2603:10a6:102:512::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 08:02:28 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::4f) by AM8P189CA0015.outlook.office365.com
 (2603:10a6:20b:218::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 08:02:27 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Wed, 19 Aug 2026 08:02:26 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GVXPR08MB10429.eurprd08.prod.outlook.com (2603:10a6:150:151::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 08:01:48 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 08:01:48 +0000
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
 b=r/LOhEzb+IhYoXaZKJWvMJXaottc9NvrB2mq8gpnoZnTegzKK3ClzoCnJ61g+YWfgVHepli193p7aLmREQYRFm9R48XT6ususuvmhWFZfu7jVVMs/9WQc83WP2R9xF6asj68vhw3F4tmM5lB4iRzEHDwOG2WuDaJFVK8+iiPuYq8iWX/Xw6VR8pw5lwF0WVpBDIn8XosGzvDDsdOYJpgCtENZ42H74PF/f42k/EjVmEv0Wredb48oIKBWI4R2wKS7W4r1c93EHQJ3XNSBeEZGW9jM+80mGSN/+onLWRskp8IvL+a0tEe9j2dQJvGhq7WDB3BzRsR4uux7orDkhjiiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr6gOfc2p/SnwVCX8TubUZatbnbQUnYhhWS+pBnid70=;
 b=dxV0vlVE4293FUNt8OjwKMW/QjC+XTqBf9gC8AaCZZ76o6nNRE9cJve6MNGUhQrFKMtIx7BqCnNKMaU80gq1lVGXCCoILghrtEYr0MmqC1mAn76YX87f7RkDT2tbJj9jv0dM43PKTi3KnHzeh2cADonU7Jx29BkRJWzDeJ+hH8m+ptMIS4k+VgLiBTxaD0LVVjaCNQjjz1JFwvS7bThYJKPe/3OlihTYLegrJj5B45lmlPZUE5wc2bxzkitnAwXW5KZzHKlK/S+sV50o3S6amjenHaVR3ZkqehJ3CmFbJbymG/7NLpkjaC2Ft2DeykJbRndZ9PW06QCOKSMiNQIbvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr6gOfc2p/SnwVCX8TubUZatbnbQUnYhhWS+pBnid70=;
 b=Y2iee92l5e4UyBeFDe8INMflonMZww5gSN2jsjZB+qRySv2zal2Uxu8+vdWpGFj4M/r3p1m0jFBf/fcPqqiLj8W8xx0NtUhBmZX8snLqMYBcN+p8gtheBNk8XiA+H0WWWVVtHN8m4kHTFsR/q63dibOq0694mthkUeSrzJDLApY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0K9MhumRtmknmDpDIVzyJuMyQT8Z3ZxCpZaFSGtwAzohXgpcftWx/saD1HdY6Z0R3Kg3WwSGcdIjpciica8KNtMttSXqDqbzhWSmLsWlPMVtdOBlmTakBjv0Ngjp5JfcOJPG1XYmoqKr9jnoUHPesk8B8/A2wkDMpI4sTwner+rFOdHbOzv6vT4pc/BuV18hXVMl7G/xNJYDlDQcxOIkJPb3Q0DCqSY5NamHGqJyMF2JISDAFs7ju4Sbgt+hmrHW1ojR7ajlKzIPZ/Hd1rLTB8WcpofxDAh1cy8JKy/MV4sj8LuNMegr6Jb57qZWFNGwU2UupKz76+g5Bf7K+DT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr6gOfc2p/SnwVCX8TubUZatbnbQUnYhhWS+pBnid70=;
 b=kLaedVi7CYnL34TltVsk5gDqUPa2CgFLfSmOjYOR87vuuCmhgiy1kP3cFdqKJA894Xg4Wdt36WGfS0zrvYBLz/WqA+hTXEzWZJ1CHR0muMnIW/clm6V8ubCyxxHfXX6APbdrmjJ6gaoTbjfulmGkVcpe0X1kpSMrDS3VtKVj4JKAkH19IkJNhpnPFfUI50ENw1lNPYcQlf59Av2xdPIMhv2+ZX4pIZBaicgrokbPQpr6O1Hx8YjaIquMfDd1bI6MO0Wv64A+BMG0fkAbFz+S529o2ylPyBEHbVCjuLwahTryD2WElhgE2BIVYNHj2iDNsGL+IUYUObK4xe82bvbz8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr6gOfc2p/SnwVCX8TubUZatbnbQUnYhhWS+pBnid70=;
 b=Y2iee92l5e4UyBeFDe8INMflonMZww5gSN2jsjZB+qRySv2zal2Uxu8+vdWpGFj4M/r3p1m0jFBf/fcPqqiLj8W8xx0NtUhBmZX8snLqMYBcN+p8gtheBNk8XiA+H0WWWVVtHN8m4kHTFsR/q63dibOq0694mthkUeSrzJDLApY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander
	<jenswi@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
Thread-Topic: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
Thread-Index: AQHdLwt9ezGusG27iE6LBf89mJZswbak//uAgAAD2IA=
Date: Wed, 19 Aug 2026 08:01:48 +0000
Message-ID: <59299B15-47CD-46AA-890F-E8991F41C01B@arm.com>
References:
 <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
 <bb5a2a10-39ae-429f-a414-631b89d0bc89@amd.com>
In-Reply-To: <bb5a2a10-39ae-429f-a414-631b89d0bc89@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GVXPR08MB10429:EE_|AM3PEPF0000A78F:EE_|PAWPR08MB11414:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7d471d-a21f-466c-634c-08defdc835bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|18002099003|22082099003|11063799006|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 GRlcB9k7GamiwhX2WXLC8ifsrDcoJ9KExePWAj/ZJalTOAqCvuZw1l5+fTkfheJa2FzxrOVnZXFwDJWcscZMqS/AER4RGXunXZXIOZbHWphL+7vHl4HzvqNdhEPoY0hUSxJDbY1Q6rR/Gr+qJeArKQqQT4RtyMrVn/laM9j1zWNXdONTv+hGWFVciajWYeWjAuYNDlWopqP+WRUR58XErmRMdB1KrWQ6R9AUDAVeRnZSvKRuE69EadZnfZnqP3DbSTQK0WWus7oNDWN+6HNza1X+gkYnWpIgz32Y/7+jayYvvag+atCmXRi2g775FtWuTPtlt3KaE63F1a0Hkx2tR7tTT/cpQLLi3EJby8zJFmF7CkijvRrGxqN17u8X5y0L+pbjPuPK1QOqdsgFXptQRvo0g/zCgFN6z6sR1cnm+ifP131qHSxGYeuRDzkr354dfZrhbU0OJg5qifANGhDtRfkQuUo3KDgHI29UgFGmLWfptguhan4wdqcecyOgDbsQt4nxR7rhYIBnIEAi1ASGD76bk2m48zlF7cTCHi6g371+ttck/yL929868vFX3sjVbueZyn0JVlWMx9WmmmYDeOnZiinxy4QZCyHOC3t4RwWPwngoxHHqU2F0ZR9id2JP6Nm5lyRUQ9UyqPkDggR/6m+M7auQjlkG15+ZRIuB2KPLeE6KYf2tKco1jNjmmE7QbpfQNKy0TEo6eMsGDNf9s/YXH/+lcFLuIP2XxlQzUSQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <679FCBF2931219469C9DA9C18938CFC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 AjMYy3YHU4i/bVLHFFl+R2J695xxb4HELfW19ckfKyD/Iv2RhS3rjYQkqz8gIrmMp7NEXGsvH6zbdT5QeafhmxaqBx1INVBiFIvCeiGuQeIotV0Lo68a53z+LiLb+JwJeubanNWKxdRE9/Thf7B6/+tGffg8rarF4DXeVnh+woVR8LM/A/Wspay06R4DgmlxnJ53pPpotQKI8LS0DX3FCEQVRyu9GU8wZEKQSH1iZQ9SiCwva+skCspb1j2vu2h0anpNJW2BdenOvS9pyX71pFTxQFaGX5QeIQgiPkXHN1YidKMbvWOudhMhgMzSHN6yWdNFDw61gI3qW9xnx85/ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10429
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51e8a0f0-fc4a-42b5-ee82-08defdc81ea3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|35042699022|23010399003|1800799024|376014|82310400026|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Vfb2qd8n0xwIkbDypPJ2iY8BN6lJ5SEVRwWe8I9PxN7OVSathhx5g5c7KkJ02PzqQcntEAD1BIKBsIuhwZz7HyFTt4RSBBFL4Jgk2RrM6pCuNPQ1T2tVMm1HDtJ86ZQFkYczTc5MBE3rSTTjluMta1+C00pr3E5/vyYv2aZgGsarB64RibWqDzxCqivRxeIsfwlSDymW04rWKJSuCJdIZgmiOOaqkv6PEDtJnV/5REkNl1Sq/UcDDKud6/h+DtYm2iY2e7bjwmk7ZWpfo/LeaRo3SMke5KF+X7Iztme9/IO/QfltIab/oJvP4dBsCV+AlcXk6/IqBZ8TCDm4LnvfE9ZbIeuR5BSdrr7mDIFHdgjiLJrsPvRu+GbJfJBR0bfl2nOxpyfNxNJhoiBtQT9CLZAWLq1mP+wrZ36+rao0tlkHbjjdT1YuAgUekNfq+opTWGnye9m4VrQ5trz7Vrgbckr2Fc7SoLAoaLsBs9pjVzTH3C2HJOLCrbZKSuuhAg0Ac1sEj+DDh5+9A6VVvmd7Y0UyNLJLLHkEPyRn63m+u7aOs6mYvylmG/pMz9lZwb+K50u9eKEIPF4GJLpifz/GZVjQOpuO5WPAq3krjdr75Avf8kvZCBCbUNnHyoZ8Kt7vSN1d1OrGIoFZQ3PhxSNCF9vL2TdOROtYfe01zeHsFKbKZ2Nil+qlKwyh1FxdjUX24Un4wNKdRkF0cQN4uhcpww==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(35042699022)(23010399003)(1800799024)(376014)(82310400026)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QyORKWNpmUkzHUPMn4NUGYZw1DAU5QnAe9Ne2db/M9Y7x3Rtr7z/kqh7496xJrjpP6/QjCPe5vOhJueFu4QqcnhoYmxfrd0scSsdv62Yf1FuwUyXIMScnecLRERn7lHRnpMC9eRmKk99EPC2tphOKQkEm02LuJeS9vD/a4j8yS6uOsjUQkkcHNfYtgmO72Du5u7YofgU81zpld6UP8hBHwYFkHqj5xyFkPf7ecq1pEiVelA1BBU05fUdEdYaRplxHyOgprUbqW0/1ZHMdJ18exYSlOo8t0Hd1NKc8v4XvhPQ/OL/e4d7rQaB5aB0gR6QNZx0ALWG3EhDq8RNz2/gEKXMHgdkgOjHHOx0fqb/ZstMag+juKazN7Ih9tnzFSsa2K/oif+PuMLOpN9ox9X8xYNAJeUWM4y0txJ02yWnRPNB+yHES6OkaXBGHKu8zz7A
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 08:02:26.9306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7d471d-a21f-466c-634c-08defdc835bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11414
X-purgate-ID: tlsNG-d62444/1787126550-BD67C757-ACAC41BA/0/0
X-purgate-type: clean
X-purgate-size: 2711

Hi Michal,

> On 19 Aug 2026, at 09:47, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 18-Aug-26 14:16, Bertrand Marquis wrote:
>> Research into compiler-invented loads has flagged FFA_MSG_SEND2 as a
>> possible vulnerability.
>>=20
>> ffa_handle_msg_send2() copies the message header from the guest-writable
>> TX buffer before validating and using its fields. A plain structure copy
>> does not prevent the compiler from re-deriving later field accesses from
>> the live TX mapping.
>>=20
>> For VM-to-VM messages, msg_offset and msg_size are validated against the
>> source and destination buffers, then used to copy the payload. If a
>> sibling vCPU changes the header and the compiler reloads either field,
>> the checked and used values can differ. This can cause an out-of-bounds
>> read from the sender's TX buffer or an out-of-bounds write into the
>> receiver's RX buffer.
>>=20
>> The cross-VM path is gated by CONFIG_FFA_VM_TO_VM, which is disabled by
>> default. The audit ranks the likelihood of such a reload as low, but the
>> C semantics do not guarantee that later accesses use the stack copy.
>>=20
>> Add a compiler barrier immediately after copying the header so that
>> validation and use consume the same snapshot.
>>=20
>> Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/obse=
rver-effect/audits/audit-xen-tee-mediator-RELEASE-4.21.1.md#tm-2--ff-a-txrx=
-buffers-ffa_shmc-ffa_msgc
>> Fixes: 98af565b1e61 ("xen/arm: ffa: Add indirect message between VM")
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/tee/ffa_msg.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
>> index 1eadc62870f2..39f561c8237f 100644
>> --- a/xen/arch/arm/tee/ffa_msg.c
>> +++ b/xen/arch/arm/tee/ffa_msg.c
>> @@ -257,6 +257,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
regs)
>>=20
>>     /* create a copy of the message header */
>>     memcpy(&src_msg, tx_buf, sizeof(src_msg));
>> +    /*
>> +     * Make sure that "tx_buf" which is shared with the guest isn't acc=
essed
>> +     * again after this point.
> This is a bit misleading because it *is* accessed in ffa_msg_send2_vm. Th=
e
> comment should say what you wrote as the last paragraph in the commit msg=
.

Yes, this should be something around:
Ensure validation and use of the message header use the same snapshot.

Do you agree ?

>=20
> With that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20

Thanks.

Could that be fixed on commit or do you want me to send a v2 ?

Cheers
Bertrand

> ~Michal
>=20


