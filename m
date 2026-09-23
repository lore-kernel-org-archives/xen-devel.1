Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE35C98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:37:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430922.1653332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P2H-00022c-Ad; Wed, 23 Sep 2026 15:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430922.1653332; Wed, 23 Sep 2026 15:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P2H-00022V-7J; Wed, 23 Sep 2026 15:37:29 +0000
Received: by outflank-mailman (input) for mailman id 1430922;
 Wed, 23 Sep 2026 15:37:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x9P2F-000228-Mf
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:37:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9P2F-00EF6n-3T
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:37:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ab3f221-2eae-0a2a0a5409dd-0a2a450ca184-22
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:37:26 +0200
Received: from [52.101.65.40]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ab3f236-f479-0a2a450c0019-34654128caa2-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:37:26 +0200
Received: from DU2P251CA0002.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::11)
 by PAVPR08MB9306.eurprd08.prod.outlook.com (2603:10a6:102:305::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 15:37:20 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::2e) by DU2P251CA0002.outlook.office365.com
 (2603:10a6:10:230::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 15:37:20 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 15:37:19 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB4PR08MB8199.eurprd08.prod.outlook.com (2603:10a6:10:381::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 15:36:46 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 15:36:46 +0000
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
 b=m7nOU+Eajx/N613lFTuQsF9dqkGffbJX3xXsJL8TXnuOGFLfyszUGYupyB+yDYHgM0mCAe8V9Zl2YGu+226pa75yglWevEFVaYy1vANy+JtAPmaTB2dexditx+mzYzLBlxSCCVxrIMf+LUE6EVXOG7iXCIOXZeR2K2JNHyOpg7DNq+CTmyQmz4CRNcb4E2cHQZGiJJt9cppIWfFbR/btQd174toLS8j5wzan2Id/SHdqcG7tJn/ljxXU4VUP+oPT9cgtwL6zzf50+LFc4saCC/OAE7SNTkGcfAN9BFRNvTFBeuFzMyEWtiB2n2e66iPxezlnPNRiWREe9ZeB51NT6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3I8iLPNGam68QpKjw2EjiBqDypinDji47utgYayYxY=;
 b=TmrxEHuw7d8PjW/NSmwJd1zGdCXiWwh8/iR/vvWnUP1Aq2yt+ilK11ExZmMeWoT2IXkXRnK1uHoien2eNRvI6d5GwFwK1Cz9OIfXXZZQeASmjrGlLuZVrbbqcSqhcMXXskMn11VBKZVP4JYM1A9mjY8QYVZskBQwUOnllJacCMAqwIa5QnzJW1UeC7MwnA4MboSvNer32mxJmTfMo4xTxM96/D+pRexE2NkEAuZJL3PhbWo0JRVRg1tSruMR0NnhGG0F6jv5yrnwuC4Auj6cT7oRYm5vTMnpewYHL11yq7PI/lmpt7lqVFXnOD16BBYYnpyQiagS9B5XPY685yUoEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3I8iLPNGam68QpKjw2EjiBqDypinDji47utgYayYxY=;
 b=jOBZXJCts/YpENhxutDDIEmu7xjf/WoJ9m7Ur4qp1gJTM1mo7vVOkD3jSMzsbYSgFEVWZHrvmsjgHwnH9E0n21jTdKxlBJ2Tf+Yjl5/sLrXSY39GeUjenVHejIWUbM4Di6+30g1id+Ij1S66MxPJMPvmOmbtiMIYO+EYTgx5yts=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyZK83AmX5MIjjD9nany9ZR1jGSfirAubH8aVLKWOE/Z2f6lrLD/S7JCceZm2tcN2972QryziEePquq/jOrSk8XSv3fa2vUs27qDg1dQRNs62kIr+x/t6WGA1/4LdMdtMx09dZwipOqwicSDgIwoz2OU6TjJAdJt54t/wI78ZceGt89Z4ElJLXz3XP7dBhxPNjDhA0QSs8Bb2yEMCwWrD1xbr5ClbJFlLr6mKl2uP2ldzQoh6De0XZ4yxQX/XOHxXxqAqk2m2/4V9zj5BRGijlkXMKI11OZloG7Fs5DrgCDsj2kcvPQYncSpg7sdCnsgB/JkxYqVZ0Cdgcf+KSEn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3I8iLPNGam68QpKjw2EjiBqDypinDji47utgYayYxY=;
 b=YfIeVFTDlBshY3XZnusOrV6eTDdwRZBLxj+rrvO6O7dXfGHvw246+jG1NDgjHZoxdFYUyFJIRbAYJqEya5LY+Ps35HGVdDzadqWZU2Lmg1o1KxbBToMd46AvMNfwmLhFuBOKgPly5TpZJHDwztmZsLuP7/LNenfKqNjgn2vD+5JCMEmsBo58tG8vHWMGb/SCSuol4dXJDZ8F8n2U1q9gCBGSYHArM/uVkWv7q9VvHjQaFvKfPIZS1ZPmPtvl9TelIezWeVPaMK0a0mB+bcZGSyqqgcuVYe7RWCUCYrZ8ZaSR+Xuq0BGci05DRKyanwOYQujN7zbOTQBiKtT5HGscNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3I8iLPNGam68QpKjw2EjiBqDypinDji47utgYayYxY=;
 b=jOBZXJCts/YpENhxutDDIEmu7xjf/WoJ9m7Ur4qp1gJTM1mo7vVOkD3jSMzsbYSgFEVWZHrvmsjgHwnH9E0n21jTdKxlBJ2Tf+Yjl5/sLrXSY39GeUjenVHejIWUbM4Di6+30g1id+Ij1S66MxPJMPvmOmbtiMIYO+EYTgx5yts=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>
Subject: Re: [PATCH v12 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Thread-Topic: [PATCH v12 05/13] xen/arm: gic-v3: add ITS suspend/resume
 support
Thread-Index: AQHdNjDkDpJZkaz2I0GcmjAkqnRhTLbcdj+A
Date: Wed, 23 Sep 2026 15:36:46 +0000
Message-ID: <CF0C014B-623F-4ED8-A6A8-01A35C6948C2@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <1d14b9ad58e88f19450999a6c2ce476ed31531e3.1787838455.git.mykola_kvach@epam.com>
In-Reply-To:
 <1d14b9ad58e88f19450999a6c2ce476ed31531e3.1787838455.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB4PR08MB8199:EE_|DU2PEPF00028CFD:EE_|PAVPR08MB9306:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b82958-c586-4317-c693-08df19888dfb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 Giwn8wgCbRYDlAexaTdRutU9phsIFTa05ZBHMNSNGDoEffNBqvu/6UX0yUDSjd6fyulYehFMCqK7/DeYXX9JBOvCQw/smlITiQOCvLwrffJNRcsPqTTxlpPPeLEDoVqZZG+04vZQRYM3FJAdzs7RyPiPl7H20I+KzVoj1NQ4sUT5wrYeh6hAxZpbKPm0C81aignYzm0ocflY3YfUzUZ7+5sGuEsUg7VxPDdahLZ7cpx9Fsxl1yoSvMxKeopDo/OZAH3qY1a41h+4fAaWp8rWmW4wO/zTi35dYHofzu/cErWt9Ny6xQQAP9iYmA1zBTA4Fpb5o0r0JRpZ1c75X9F1BpuEjRLgYdlMRfqXREQsp3tY4sigbGnE+M/AitKazNkm4uGJhKT6SjiXohWscaNJJR4CS1HE17HBN3YdwbAi+qBiFq3PBMmcIf1o4t7uWSjST7FnKokqvZ3buQZ0IQUMbLkYsRn4eBwphjZloNG3gA2Rn2MXV30q4FAsZyAT7ThkznDPFeVvUIM6kIaASApnaBRI84J8c1HVgnVm1bMtOJr3OejQ8WfdOIvB6qV/u1AxYE3AXrDECNvypI89mRu9uYOPjI2j0zGkGCPF2ekj3URqL5kQyXiI0q9GNseRoamVLTkPY3n/pP2L5C2KwnFlckCfvBlrgRLQarUtNquFt6mQ049wqeVsAmR7oacRF3l4Y9nP3IPHWbsFpY750RM2vcY4nuLLjAo6Y7yaKB65RU4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B88848285E80A94098345DF7C10AB727@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 YrJOZBxWYTlevD7kqIthSK7ceXNiC8ERRx3+rnjIrGn8yAkOnyxEzZIOw4DjXAr5fzAQtGsADCZLI96vs15GUlxKtBo81z7kLmnre6F+7BUEcM+D8zeaDmXGzBAoisUPYXAKbUjzWZdDKotL2/9iZRfj0yJHFyCHDtzFz9dNuPyJ/kkb5ud0L3p3UXzL/+ewD67DGqIUuGUKQbs+I41f+K+ggktyhq3/vMJJzKJgPRHQeFL6Evmgct91pBwBDBDunuUd+i2BD2XICWeI/nWSrLw+A2WmbnqLBhI2x//6uGAlZJgAc05HrWBaohdnA7MG5N7ef2ltL/t85HDnYxcpXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8199
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a289f469-42fc-46a5-1d30-08df198879e4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|14060799003|82310400026|7416014|376014|1800799024|35042699022|36860700016|10067099003|56012099006|4143699003|6133799003|3023799007|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	8xxzP/Xt8uz9QTdf0AILoGYUbHEJ9uyiEg/O/KO+Z3ARi94290qxLsxQoIX2XNM+MZyKxdkfs+AdlbogxVtx3NnMxrm0qJuQWb2kA//DAT01dMsR1e/zXebRoDMfOy2C0dWwWczZOIGLAsUYUaK+PH1gLkUktqHuY8BfRRds8YcEjD+us//XMOMXXLyXGy2ejhWlQA2+Zv25DCxXFHMXVl/8s8geG9nbbSnQ02PpjTaJCfrnQXWKAuIbmTAzwgUk3i+dFHDkL76s0U7WqfUmnnd9H/cZ38Jsix18mv6tiryTZkLpLgC8gQO8gB/7PFdgGkC4y8JxlwNsYHqZAwBGdKMBkIhLODpBKevFoRv3OYx7pL1NlQ6lexjnxlJkNDbNERVHw6y+m3KyaH0pN4dmVucjVqEYazog5gWBK8UjvOaU96wPPP9NZ/0a/0XI2QHiHV7WrXhyGCUPgYHHo+GoS4cu/cPLwWjzaPem3QYkZuwA4bGHPGYbM9tPZzIZrtdDFtRu7zZZhJQfJIRuc3xgndTTMpJnKm85oVVSkjlEiO+D05CFutXWR306c583lp+k5cGJpAd/LEXU2EMxH1nuyVqDLbzgPj0GRBUsE/4KnSPQFnWR64INwASS4v4loqO/u790n7BYhAwViMpcvb8FFkMMXEXDN/NH1qwGKItJLaeNhR8MnPRc7SUBb+m/GitedQHrWU0lUi8UtG6RN+63cA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(82310400026)(7416014)(376014)(1800799024)(35042699022)(36860700016)(10067099003)(56012099006)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v1S/Nk4CxUjVgm97aBQV3J6oEk8H+IFAbDpuyzTYQqjTGrElouI9SScB9ZD7Kdwl3vHrfEhMN2B1YVxT/h/+uk7BmLR+epkp3fKa7zebSmx1JtVE/TtNFHc/Vs4VzPP/cgnBAolFAN7xGBNo2m2uUMujMyfDSqqPf/WqcRzmgzYLs0dM4tupqfrW41KfAmSkcQ5CHpclgB5EHLshAtfa8MrqnhfnKUrbtq70kYYTL0kCX4Btrxg1uRcFZngNqGwzXUSL61yf/EuDj3o0Pt7PVzuBPUo1ej48MzoT7cpJ0lXickj7F3gpLpw93cF5p8/pSQQJHfk73JBBv36JRLjYoy4u5nrWRRc7EAQNYWhgtwB86jIPA/imbGJvkNdBV0+PfJi0LApyfKHXNUZIbLr2vnzbD/LkFfiVSpF8kzT70yq21XDxhrJK0+CkQMj+vlbf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:37:19.7174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b82958-c586-4317-c693-08df19888dfb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9306
X-purgate-ID: tlsNG-d25034/1790177846-024DFA5B-3E77BB8C/0/0
X-purgate-type: clean
X-purgate-size: 12191

Hi Mykola,

> On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
> working after firmware powers the GIC down.
>=20
> Save and restore the ITS CTLR, CBASER and BASER registers. On resume,
> re-establish the collection mapping only when the collection is held in
> the ITS itself. Memory-backed collections are restored through the
> restored GITS_BASER tables and must not be remapped unconditionally.
>=20
> Add list_for_each_entry_continue_reverse() in list.h for the ITS suspend
> error path that needs to roll back partially saved state.
>=20
> Based on Linux commit dba0bc7b76dc:
> "irqchip/gic-v3-its: Add ability to save/restore ITS state".
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> # Arm code

Changes to list.h will need a review from the Others group but they look
good to me.


Cheers
Bertrand

> ---
> Changes in V10:
> - Replay MAPC on resume only for collections held in the ITS itself, as
>  indicated by GITS_TYPER.HCC. Memory-backed collections are restored
>  through GITS_BASER and are no longer remapped unconditionally.
> - Make the current Xen col_id =3D=3D cpu assumption explicit in the ITS
>  resume path.
> - Use "unpredictable" instead of "undefined" in the CBASER/BASER restore
>  comment.
>=20
> Changes in V9:
> - fix the ITS suspend/resume coding-style nits;
> - preserve the saved GITS_CTLR state while masking the read-only
>  QUIESCENT bit.
>=20
> Changes in V8:
> - Reword the CBASER/CWRITER comment to match Xen and drop the stale Linux
>  cmd_write reference.
> - Clarify the list_for_each_entry_continue_reverse() comment.
> - Factor out per-ITS helpers for collection setup and resume.
> - Restore each ITS and re-establish its collection mapping in the same
>  loop, so a failed ITS resume is not followed by MAPC/SYNC on that
>  un-restored instance.
> - panic in case when resume of an ITS failed
> - cleanup baser cache during suspend
> ---
> xen/arch/arm/gic-v3-its.c             | 146 ++++++++++++++++++++++++--
> xen/arch/arm/gic-v3.c                 |  11 +-
> xen/arch/arm/include/asm/gic_v3_its.h |  28 +++++
> xen/include/xen/list.h                |  14 +++
> 4 files changed, 189 insertions(+), 10 deletions(-)
>=20
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 7560d46c6d..dd53209865 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -335,6 +335,22 @@ static int its_send_cmd_inv(struct host_its *its,
>     return its_send_command(its, cmd);
> }
>=20
> +static int gicv3_its_setup_collection_single(struct host_its *its,
> +                                             unsigned int cpu)
> +{
> +    int ret;
> +
> +    ret =3D its_send_cmd_mapc(its, cpu, cpu);
> +    if ( ret )
> +        return ret;
> +
> +    ret =3D its_send_cmd_sync(its, cpu);
> +    if ( ret )
> +        return ret;
> +
> +    return gicv3_its_wait_commands(its);
> +}
> +
> /* Set up the (1:1) collection mapping for the given host CPU. */
> int gicv3_its_setup_collection(unsigned int cpu)
> {
> @@ -343,15 +359,7 @@ int gicv3_its_setup_collection(unsigned int cpu)
>=20
>     list_for_each_entry(its, &host_its_list, entry)
>     {
> -        ret =3D its_send_cmd_mapc(its, cpu, cpu);
> -        if ( ret )
> -            return ret;
> -
> -        ret =3D its_send_cmd_sync(its, cpu);
> -        if ( ret )
> -            return ret;
> -
> -        ret =3D gicv3_its_wait_commands(its);
> +        ret =3D gicv3_its_setup_collection_single(its, cpu);
>         if ( ret )
>             return ret;
>     }
> @@ -1211,6 +1219,126 @@ int gicv3_its_init(void)
>     return 0;
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +int gicv3_its_suspend(void)
> +{
> +    struct host_its *its;
> +    int ret;
> +
> +    list_for_each_entry( its, &host_its_list, entry )
> +    {
> +        unsigned int i;
> +        void __iomem *base =3D its->its_base;
> +
> +        /*
> +         * By the time Xen reaches gic_suspend(), every domain is alread=
y in
> +         * SHUTDOWN_suspend, so ITS-targeting interrupt sources are expe=
cted
> +         * to have been quiesced by the owning OS before SYSTEM_SUSPEND.
> +         */
> +        /* Preserve saved GITS_CTLR state, excluding read-only QUIESCENT=
. */
> +        its->suspend_ctx.ctlr =3D readl_relaxed(base + GITS_CTLR) &
> +                                ~GITS_CTLR_QUIESCENT;
> +        ret =3D gicv3_disable_its(its);
> +        if ( ret )
> +        {
> +            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
> +            goto err;
> +        }
> +
> +        its->suspend_ctx.cbaser =3D readq_relaxed(base + GITS_CBASER);
> +
> +        for ( i =3D 0; i < GITS_BASER_NR_REGS; i++ )
> +        {
> +            uint64_t baser =3D readq_relaxed(base + GITS_BASER0 + i * 8)=
;
> +
> +            its->suspend_ctx.baser[i] =3D 0;
> +
> +            if ( !(baser & GITS_VALID_BIT) )
> +                continue;
> +
> +            its->suspend_ctx.baser[i] =3D baser;
> +        }
> +    }
> +
> +    return 0;
> +
> + err:
> +    list_for_each_entry_continue_reverse( its, &host_its_list, entry )
> +        writel_relaxed(its->suspend_ctx.ctlr, its->its_base + GITS_CTLR)=
;
> +
> +    return ret;
> +}
> +
> +static int gicv3_its_resume_single(struct host_its *its, unsigned int cp=
u)
> +{
> +    void __iomem *base =3D its->its_base;
> +    unsigned int i;
> +    int ret;
> +    uint64_t typer;
> +    unsigned int col_id =3D cpu; /* Xen currently uses col_id =3D=3D cpu=
. */
> +
> +    /*
> +     * Make sure that the ITS is disabled. If it fails to quiesce,
> +     * don't restore it since writing to CBASER or BASER<n>
> +     * registers is unpredictable according to the GIC v3 ITS
> +     * Specification.
> +     */
> +    WARN_ON(readl_relaxed(base + GITS_CTLR) & GITS_CTLR_ENABLE);
> +    ret =3D gicv3_disable_its(its);
> +    if ( ret )
> +        return ret;
> +
> +    writeq_relaxed(its->suspend_ctx.cbaser, base + GITS_CBASER);
> +
> +    /*
> +     * Writing CBASER resets CREADR to 0, so reset CWRITER to
> +     * keep the command queue pointers aligned.
> +     */
> +    writeq_relaxed(0, base + GITS_CWRITER);
> +
> +    /* Restore GITS_BASER from the value cache. */
> +    for ( i =3D 0; i < GITS_BASER_NR_REGS; i++ )
> +    {
> +        uint64_t baser =3D its->suspend_ctx.baser[i];
> +
> +        if ( !(baser & GITS_VALID_BIT) )
> +            continue;
> +
> +        writeq_relaxed(baser, base + GITS_BASER0 + i * 8);
> +    }
> +
> +    writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
> +
> +    typer =3D readq_relaxed(base + GITS_TYPER);
> +
> +    /*
> +     * Only collections with IDs below HCC are held in the ITS itself
> +     * and lose their state across an ITS reset/power loss. Memory-backe=
d
> +     * collections are restored by restoring GITS_BASER and must not be
> +     * remapped here.
> +     */
> +    if ( col_id < GITS_TYPER_HCC(typer) )
> +        return gicv3_its_setup_collection_single(its, cpu);
> +
> +    return 0;
> +}
> +
> +void gicv3_its_resume(void)
> +{
> +    struct host_its *its;
> +    unsigned int cpu =3D smp_processor_id();
> +    int ret;
> +
> +    list_for_each_entry( its, &host_its_list, entry )
> +    {
> +        ret =3D gicv3_its_resume_single(its, cpu);
> +        if ( ret )
> +            panic("GICv3: ITS@%"PRIpaddr": failed to restore during resu=
me: %d\n",
> +                   its->addr, ret);
> +    }
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
>=20
> /*
>  * Local variables:
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 038bf41142..6b025c023d 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -2186,10 +2186,14 @@ static int gicv3_suspend(void)
>     if ( ret )
>         goto out_enable_iface;
>=20
> -    ret =3D gicv3_disable_redist();
> +    ret =3D gicv3_its_suspend();
>     if ( ret )
>         goto out_enable_iface;
>=20
> +    ret =3D gicv3_disable_redist();
> +    if ( ret )
> +        goto out_its_resume;
> +
>     /* Save GICR configuration */
>     gicv3_redist_wait_for_rwp();
>=20
> @@ -2229,6 +2233,9 @@ static int gicv3_suspend(void)
>=20
>     return 0;
>=20
> + out_its_resume:
> +    gicv3_its_resume();
> +
>  out_enable_iface:
>     if ( gicv3_enable_redist() )
>         panic("GICv3: Failed to re-enable redistributor after suspend abo=
rt\n");
> @@ -2355,6 +2362,8 @@ static void gicv3_resume(void)
>=20
>     gicv3_redist_wait_for_rwp();
>=20
> +    gicv3_its_resume();
> +
>     WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
>     isb();
>=20
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index fc5a84892c..0f8cb16e41 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -43,6 +43,11 @@
> #define GITS_CTLR_QUIESCENT             BIT(31, UL)
> #define GITS_CTLR_ENABLE                BIT(0, UL)
>=20
> +#define GITS_TYPER_HCC_SHIFT            24
> +#define GITS_TYPER_HCC_MASK             0xffUL
> +#define GITS_TYPER_HCC(r)               (((r) >> GITS_TYPER_HCC_SHIFT) &=
 \
> +                                                 GITS_TYPER_HCC_MASK)
> +
> #define GITS_TYPER_PTA                  BIT(19, UL)
> #define GITS_TYPER_DEVIDS_SHIFT         13
> #define GITS_TYPER_DEVIDS_MASK          (0x1fUL << GITS_TYPER_DEVIDS_SHIF=
T)
> @@ -129,6 +134,13 @@ struct host_its {
>     spinlock_t cmd_lock;
>     void *cmd_buf;
>     unsigned int flags;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct suspend_ctx {
> +        uint32_t ctlr;
> +        uint64_t cbaser;
> +        uint64_t baser[GITS_BASER_NR_REGS];
> +    } suspend_ctx;
> +#endif
> };
>=20
> /* Map a collection for this host CPU to each host ITS. */
> @@ -204,6 +216,11 @@ uint64_t gicv3_its_get_cacheability(void);
> uint64_t gicv3_its_get_shareability(void);
> unsigned int gicv3_its_get_memflags(void);
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +int gicv3_its_suspend(void);
> +void gicv3_its_resume(void);
> +#endif
> +
> #else
>=20
> #ifdef CONFIG_ACPI
> @@ -271,6 +288,17 @@ static inline int gicv3_its_make_hwdom_dt_nodes(cons=
t struct domain *d,
>     return 0;
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +static inline int gicv3_its_suspend(void)
> +{
> +    return 0;
> +}
> +
> +static inline void gicv3_its_resume(void)
> +{
> +}
> +#endif
> +
> #endif /* CONFIG_HAS_ITS */
>=20
> #endif
> diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
> index 98d8482dab..2aab274157 100644
> --- a/xen/include/xen/list.h
> +++ b/xen/include/xen/list.h
> @@ -535,6 +535,20 @@ static inline void list_splice_init(struct list_head=
 *list,
>          &(pos)->member !=3D (head);                                     =
   \
>          (pos) =3D list_entry((pos)->member.next, typeof(*(pos)), member)=
)
>=20
> +/**
> + * list_for_each_entry_continue_reverse - iterate backwards from the giv=
en point
> + * @pos:    the type * to use as a loop cursor.
> + * @head:   the head for your list.
> + * @member: the name of the list_head within the struct.
> + *
> + * Iterate over list of given type backwards, starting from the element =
previous
> + * to the current one in list order.
> + */
> +#define list_for_each_entry_continue_reverse(pos, head, member)         =
  \
> +    for ((pos) =3D list_entry((pos)->member.prev, typeof(*(pos)), member=
);  \
> +         &(pos)->member !=3D (head);                                    =
    \
> +         (pos) =3D list_entry((pos)->member.prev, typeof(*(pos)), member=
))
> +
> /**
>  * list_for_each_entry_from - iterate over list of given type from the
>  *                            current point
> --=20
> 2.43.0
>=20


