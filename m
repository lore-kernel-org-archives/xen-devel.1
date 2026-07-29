Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74B0C53219
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 06:48:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375170.1622400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woy5Q-0006x7-87; Wed, 29 Jul 2026 06:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375170.1622400; Wed, 29 Jul 2026 06:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woy5Q-0006x0-5T; Wed, 29 Jul 2026 06:48:16 +0000
Received: by outflank-mailman (input) for mailman id 1375170;
 Wed, 29 Jul 2026 06:48:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1woy5O-0006wu-Qx
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 06:48:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woy5O-004omy-0g
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 08:48:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a69a228-2eae-0a2a0a5409dd-0a2a4506b580-12
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 08:48:13 +0200
Received: from [52.101.83.1]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a69a22c-195a-0a2a45060019-34655301cdbd-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 08:48:13 +0200
Received: from AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::14)
 by PAVPR08MB9064.eurprd08.prod.outlook.com (2603:10a6:102:2ff::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:48:09 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::2c) by AM0PR10CA0034.outlook.office365.com
 (2603:10a6:20b:150::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 06:48:08 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 06:48:08 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS2PR08MB8807.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:47:02 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:47:01 +0000
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
 b=jMZljVfRYSAUADlr7qHd+ifuT3BHljgY4DJ0Dok0luDXyKAw8cZKOnTJXN6LZ9mPJbbYVt8tmpLAcH655b9COv1jdaAADt2SLi2ZxZO8Vz6TWr9ATcoliFMeBAa9TGPzuessBRX6bIunng/IUEASJUvrC3Q/81Ub0k6KmyvJWtyA5axxBrtHsfTMTX3H3JRiaC0z2K2BKWJAvY1hPRFjbYR6aDogTrfKd9tlG4UOoI+Mu/UcbmpMc+zt7l10bdXnqsnrBNDYomI9EsfyB2yzjgH2Nu+rKr/pkEs4b/upzYsOx/woZMgq7bG/Y7WSTQ/o+cGJAzgwMVpyXEGaijcggg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTzFhrv8gduAcYmiYXYTBGeXnAvQCC/fsrEHBrw7Hmw=;
 b=G+2DBXE/80Wy5xBHHOu3RkN+ecb2ZE/Qlm5O+nlUnp2JY9GQ0O2tqLcNIZCud+wo7U5l5dDBNE1bG2zkaw4xbww+MCBBzHWj9ihAS7InPmpnhh87I5gYz+1AlbcPvyh19HgOzTxtjGgnhLaNQNTs9Io1acVeztvh95m+fWZC8YXj7z0aorz3up9JLDLTOzu2ubga9EyY7Cj95IBpKfNAcpsZABBI5QIZiAOnGCyRSCnRLQFopCtrd51Jc62ZFMmN6NGnxWYh9cQ3TpusrPZgvpf49oeJtHR1yy/+bkkSBI1EEStdQ/7VMAYhv/9btXMXqv0bAJMW+nSA41nwaug8VA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTzFhrv8gduAcYmiYXYTBGeXnAvQCC/fsrEHBrw7Hmw=;
 b=gDp9yiJP+v1n5BK1vbefhWA0EuJYqbpSZeGi2pBoRe/nzGo8Nt0Wb/9u0oafyXd+V1iQjkk6+W/OjLBtjOIpy5Ci7FVQeJsc+5Gx8lUgeqnBVUfA9MNfbbiBCyPxoHzEW1oiythkwyPIJ7Yf73MhyoRosLtgsycPXdgK+qpmQJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSbEB4wTOfgsHWkSDV1zWSbSdZhTNRcbqkVOU0rKJdSPsR3xq6cjnV9OUceIZuB6ELQfmCGhcqxZc8xrpLVRfDANe5OSVCbqUUpGz20aprVmAKqYp70244e5/LhwqeqGRYFCxRWis9UxH+O21z2GT+0lUURtlCzjmImKcaUQYASqoSsgTr0q48iZ4IPSIkFQEK0wEtXU8kyHMWBroqwaUaF1c3MyGhyPEkPJVNQvF0kBGKrWiAWagpF1i5iA2+hKoM8BA/4TdW0IDCIP/CEB8hChI5Qv4AHZlOdg2Kn9Lee8aOgdKK3rk5Arkz+CAhLMxYltopE6stE0esSUcSJ21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTzFhrv8gduAcYmiYXYTBGeXnAvQCC/fsrEHBrw7Hmw=;
 b=YrarcwSyLuW11PxdI9fHYQM0pmx1t1fJiqU/0NiLGd4ZajRh05JSSbgZJlykVczwOmWQ/Rhg0Hz+FNcddYJ7FIZmxRbMu5rm1A3YHEVDl/Iv3GaWzqqL1OzLx02KDxGrQpLxL8gWmktfzMZP+h/Zq4IQ2XzTClKNAKsVSZBFqCP95aCzpWzfxm2LwJDN81/pjO693+kbvYXouER62PRXDuHRnxhpMYpf99ERp84PcP8h4q1BTc8P7YwBte6jA7JRb5Vae2cV6hv9PbP+eKEFFlWtSN9jfIGT0aa3kOlnthTF12RMSDUj+Npn3CtuefrR2cImz7zpq4La6cXLLxmCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTzFhrv8gduAcYmiYXYTBGeXnAvQCC/fsrEHBrw7Hmw=;
 b=gDp9yiJP+v1n5BK1vbefhWA0EuJYqbpSZeGi2pBoRe/nzGo8Nt0Wb/9u0oafyXd+V1iQjkk6+W/OjLBtjOIpy5Ci7FVQeJsc+5Gx8lUgeqnBVUfA9MNfbbiBCyPxoHzEW1oiythkwyPIJ7Yf73MhyoRosLtgsycPXdgK+qpmQJE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Hirokazu Takahashi <taka@valinux.co.jp>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 0/4] xen/arm: Device Tree based CPU topology support
Thread-Topic: [PATCH v5 0/4] xen/arm: Device Tree based CPU topology support
Thread-Index: AQHdD+86KiGaaKUFxUq/ExJkJRYMb7aELDIA
Date: Wed, 29 Jul 2026 06:47:01 +0000
Message-ID: <07327966-7E81-44CA-A1EA-F227C1C9EA51@arm.com>
References: <20260709220552.646462-1-taka@valinux.co.jp>
In-Reply-To: <20260709220552.646462-1-taka@valinux.co.jp>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS2PR08MB8807:EE_|AMS1EPF0000008F:EE_|PAVPR08MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 9573ab39-3b38-4eb8-906c-08deed3d59a7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|29003799003|6133799003|18002099003|22082099003|25016099003|38070700021|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 jO4Fx9cpQMSaijrxDSYOLZGchpo5k0xpEseJnEN4fD6kRSsoawys8RdglbFSNZwb+3GtV+dFGSOW8a8AR0IyEQTe3SICBGsRyc4DEif2CO74xpAFzoEs5c30Ro9caOQhfxDzsJny/BDj2afKWztKVoIvsbNrrg2l8j2H6XDYT9k10zb5F3DdbkanuwVZBlcxmqN/K8/DdxfrnlcMx63K30Khb9HLPdal97Kn44dS0AjcGtEcK8SU0Mcs2akLDC6rIQ7w6juaz75kiSf06HKeY+dOZw+m7nd34ZEzZrWq1bapBFov+ymC2svcMsNvYDgHEXJNFPlWvkEEu97ZvndLyre9Ir3wLJULLctQHiTSqxS8KZMT2J7ds0jLE9fgFZURZ5pGCAWxtq7XU2VQGBVjq5nVuXr45+zc+Kkfpa4hHQRr2quBqlpYCbEJNgJdj8MWdQcPEr4qP8VkcdSGB0xkISsNAzaBJOSKMQG4hCW6UeRAEXk+Bh6+F3rqY5Ff6Obdgyq9nEB39ibTn5RynZNw/Jl4zKwIyPyJ+WVx0eRbEOxMLxCyZkA+KUYPDS3Vx7bIIMdmYFAxMLN8knnPQDJxJJpMGPUZV3obyu16u+BMazVkoa0iheVzpj+ym2UtkGpw5xcVFCCsJJvPz8CwLpkOgtaLfikHwJmrHBJJR3nIgzw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(29003799003)(6133799003)(18002099003)(22082099003)(25016099003)(38070700021)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C759BBB14C4BAE459B5B16EB07D2DF3E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 PcIef/KUorMVh5LzfGE6jGe2tkiH1MlHNYbLgMSZc3ozTuFWuTXQ6gTTL6oV4pdvrS32O5BN3lYECG7Ojtsl9cTZ+dNblQ/CoNPXV2TkRZO2595In60SUpqVkMFBDCTwbXn3dqrRedEevTK1d5ckratIPPqApVNeuIw2afSiu+OnQ54c3hctM7x7MwDaQf3xM5lNzqX72fmAdXz9pT5TtJ3P+BdFa5v9gJzZsjFSDTZYmJqOucU88WZcfNVIT/6pNwxfWJytjyI8tmL6n14Z/5oyqmdkXY6NUeCU3e60Wq/5udXsDQWjVSTP+xz4m5VqDdgTR+nV+TjWOMf1OguLAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8807
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db2b21cf-b866-410b-ff0e-08deed3d317e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|82310400026|36860700016|14060799003|23010399003|18002099003|22082099003|25016099003|13003099007|6133799003|3023799007|56012099006|11063799006|10067099003|29003799003;
X-Microsoft-Antispam-Message-Info:
	k/NcxnQi59Nx+YnaSiw3Vlt6ieCaAa1bkFs8dQCDu+7t8joMlGEtEB4ybpm8+JUm2gRoDFnNd9SM0lOdIuNJLtR7BarJjTeSwsueKCPvVEWdQh3o5zK0GmKlcJvqHK/dd6jDh0f7rnN8Ikdu9rxa+YCpG+5sa2dQ3AzWlEnULXK2MjR0vKchth/269JBZ1DTRvveJsvh4eieLEPu33p4ErVgiclNjD1HY7GxByCrT00jQ4zFYi2LLZw6AdRn9XhIir2lmdndA6oLqe8ez6EBjJ8lXf+a4xX4Wj6gkT2eozcOE3DynKtDqQfasrsP+q1uzAQzr2oKLxovlfTVVkUzDJiwzaWz3x1b9HcCTRqICGwWcmijN116gKjMfvCQ/BiFGyL3/SIj90mC1yOJQC9WP4By85zOcPrNu2nFU/G1B2yEjKrPHWkb/gRuXMr5xN26bOONwumCPjNWjfkYvZVjdh37JF8+p1ebJfDpZ7ab3P0rQQOPRdPt1SEsmJugPsG4jmy+oL2cKPdW/nHfRU1vBWS2XI+V6rgZsxual1dEhUGRP0koF7+gedf1dqqI3iKXXLT18iEezGO6YPQEWJ1dLUefAvOzy/KKtWIiiYCQKSsCV4JtSMoqn+FyTLQSaLNDCDF17w8+Tt9S0p70Q9rU5Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(36860700016)(14060799003)(23010399003)(18002099003)(22082099003)(25016099003)(13003099007)(6133799003)(3023799007)(56012099006)(11063799006)(10067099003)(29003799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	me8CiehsEimxJvZZllrF8Wy2XisTXfcF58GGbHYS8yPFQ5cANmYRMPfoALLRQ6q++reyQV/gIhwbY+XoS1Fn5ncaWhAN9ODE4VsPWCTxcQY4M4XOsx5idukAQLj5Z+uf2lq2mFNXvzGcxfxTa6NzpP0pXBnrploQoLES1Ku/V5A+DZMoe4j+/lDJ+S7rMNFB6DQ8w/zc8/kHJ/5nwI5BCuNvZitgbrDECK0ZdX0bpBuMUgtX/8OMsJqXYujK+RaFGu1qBDI3cAfz3vQGGN0TUZvkT36m4KTYPGndNrNYlHGMW2SXqPXMI/Ek209cZc46LfMJFJje3fQTSASBlYvbRclRrebdI07EutHJ66E1D6wSK4AmIlXNl1sfMJ73RgxB0B4wPx3IOD3L7Omn2RXwfR+cE/RnyZgCr7qNb/hlmw/dTpI0UUIZgLWBd8hJ2kKE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:48:08.5644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9573ab39-3b38-4eb8-906c-08deed3d59a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9064
X-purgate-ID: tlsNG-16d1c6/1785307693-F607177B-65D94B7E/0/0
X-purgate-type: clean
X-purgate-size: 6604

Hi Hirokazu,

Please use the add_maintainers.pl script before sending to make sure the ri=
ght maintainers
are in copy of your patches otherwise some might miss your patches.

https://xen.readthedocs.io/en/latest/contribute-xen/submit-patch.html#step-=
2-use-add-maintainers-pl-or-get-maintainer-pl

Cheers
Bertrand

> On 10 Jul 2026, at 00:05, Hirokazu Takahashi <taka@valinux.co.jp> wrote:
>=20
> Hello,
>=20
> This patch series introduces CPU topology support based on
> Device-Tree and ACPI PPTT for ARM Xen.
>=20
> In v5, I added code to parse the ACPI PPTT and reflect it in the CPU
> topology information.
>=20
> Future Work:
> - Support for the "credit2_runqueue=3Dcluster" option.
> - CPU topology support for RISC-V and PPC (once SMP support is available)=
.
>=20
> Changes in v5:
> - Extracted CPU topology information from the ACPI PPTT.
> - Corrected the erroneous use of CONFIG_CPU_TOPOLOGY to
>   CONFIG_GENERIC_CPU_TOPOLOGY.
>=20
> Changes in v4:
> - Only display the CPU topology configuration prompt in common/Kconfig
>   if the architecture defines HAS_GENERIC_CPU_TOPOLOGY.
> - Move the definition of the global 'cpu_topology' pointer to
>   common/cpu-topology.c.
> - Update the Makefile to explicitly build objects as .init.o when all
>   functions and data within a file are annotated with __init/__initdata,
>   ensuring their memory is reclaimed after system initialization.
> - Add an error log in the CPU-to-node mapping function for out-of-bounds
>   cases.
> - Use ARRAY_SIZE() instead of raw macros when guarding array accesses.
> - Rename variables and functions to avoid ambiguous or misleading terms:
>   - Avoid 'cpuid' to prevent confusion with x86 CPUID features/instructio=
ns.
>   - Avoid 'node' where it could be confused with a NUMA node, explicitly
>     renaming them to clarify they refer to a Device Tree node.
> - Move local variable declarations into the narrowest possible scope.
> - Replace the unsupported "%pOF" printk format specifier with "%s" and
>   explicit node name retrieval.
> - Remove #include <dt-cpu-topology.h> from cpu-topology.h, and ensure
>   the header directly includes only what its definitions require.
> - Remove #include <xen/device_tree.h> from dt-cpu-topology.h, replacing
>   it with a forward declaration of 'struct dt_device_node'.
> - Use 'const' qualifiers for pointer declarations where the pointed-to
>   structure is not modified.
> - Explicitly #include <asm/processor.h> in cpu-topology.h to guarantee
>   that arch-specific definitions of cpu_to_core() and cpu_to_socket()
>   take precedence over the generic fallbacks.
> - Introduce inline initialization functions for cpu_sibling_mask and
>   cpu_core_mask in cpu-topology.h, providing separate variants for both
>   when CONFIG_GENERIC_CPU_TOPOLOGY is enabled and disabled.
>=20
> Changes in v3:
> - Use (nr_cpu_ids - 1) as the maximum CPU ID here. The fix for the sparse
>   map mismatch issue on ARM Xen has been split out into a separate patch.
> - Switch topology sibling masks to cpumask_var_t for dynamic allocation.
> - Allow the system to keep running with a degraded fallback even if
>   the topology table allocation fails.
> - Remove the temporary definitions of cpu_to_core() and cpu_to_socket()
>   from RISC-V and PPC processor.h.
> - Minimize the use of #ifdef blocks, leveraging compiler Dead Code
>   Elimination (DCE) where possible.
> - Clean up the code to follow the Xen coding style. Please let me know
>   if I missed any style nits!
> - Verify successful builds across x86, RISC-V, and PPC environments.
>=20
> Changes in v2:
> - Generate topology information even when ACPI is enabled. Note that
>   this is a temporary implementation and doesn't yet parse the PPTT
>   (Processor Properties Topology Table).
> - Added support for cpu-map node in Device Tree that doesn't contain
>   explicit cluster node definitions.
>=20
> Changes in v1 from the previous series "Introduce Device Tree based NUMA
> support for ARM Xen":
>=20
> 1. Optimized Memory Allocation:
>   The series now allocates only the minimum required memory area to manag=
e
>   the essential data for the CPUs.
>=20
> 2. Flexible Device Tree Parsing:
>   The parsing logic no longer depends on the definition order of the 'cpu=
'
>   nodes and 'cpu-map' nodes in the Device Tree. They can now be read
>   correctly even if their orders do not match.
>=20
> 3. CPU Hotplug Readiness:
>   To support future CPU hotplug, the system assumes that inactive CPUs ar=
e
>   also described in the Device Tree. Xen will pre-load and generate the
>   topology information for these inactive CPUs during the boot phase so
>   it stays available in memory.
>=20
> Thank you,
> Hirokazu Takahashi
>=20
> Hirokazu Takahashi (4):
>  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
>  xen/sched: Link CPU topology to scheduler
>  xen/sched: Make cpu_nr_siblings() architecture-specific
>  arm/acpi: Parse PPTT to initialize CPU topology
>=20
> xen/arch/arm/Kconfig                   |   1 +
> xen/arch/arm/acpi/boot.c               |   2 +
> xen/arch/arm/include/asm/acpi.h        |   2 +
> xen/arch/arm/include/asm/processor.h   |   4 -
> xen/arch/arm/smpboot.c                 |  15 +-
> xen/arch/ppc/include/asm/processor.h   |   4 -
> xen/arch/riscv/include/asm/processor.h |   4 -
> xen/arch/x86/include/asm/processor.h   |   1 +
> xen/common/Kconfig                     |  15 +
> xen/common/Makefile                    |   1 +
> xen/common/cpu-topology.c              |  62 ++++
> xen/common/device-tree/Makefile        |   1 +
> xen/common/device-tree/cpu-topology.c  | 406 +++++++++++++++++++++++++
> xen/common/sched/credit2.c             |  21 +-
> xen/common/sysctl.c                    |   1 +
> xen/drivers/acpi/Kconfig               |   3 +
> xen/drivers/acpi/Makefile              |   1 +
> xen/drivers/acpi/topology.c            | 255 ++++++++++++++++
> xen/include/acpi/actbl3.h              |  30 ++
> xen/include/xen/acpi.h                 |  18 ++
> xen/include/xen/cpu-topology.h         |  83 +++++
> xen/include/xen/dt-cpu-topology.h      |  29 ++
> 22 files changed, 923 insertions(+), 36 deletions(-)
> create mode 100644 xen/common/cpu-topology.c
> create mode 100644 xen/common/device-tree/cpu-topology.c
> create mode 100644 xen/drivers/acpi/topology.c
> create mode 100644 xen/include/xen/cpu-topology.h
> create mode 100644 xen/include/xen/dt-cpu-topology.h
>=20
> --=20
> 2.43.0
>=20
>=20


