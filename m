Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3190CC624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 12:14:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408403.1641012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Sni-0001VE-RH; Fri, 04 Sep 2026 12:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408403.1641012; Fri, 04 Sep 2026 12:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Sni-0001V7-MV; Fri, 04 Sep 2026 12:13:46 +0000
Received: by outflank-mailman (input) for mailman id 1408403;
 Fri, 04 Sep 2026 12:13:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x2Snh-0001Ts-5n
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:13:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Sng-00DwB5-IM
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:13:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9ab5ea-e002-0a2a0a5209dd-0a2a450390b4-28
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:13:44 +0200
Received: from [52.101.84.49]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9ab5f8-fae8-0a2a45030019-34655431eb49-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:13:44 +0200
Received: from DB9PR06CA0006.eurprd06.prod.outlook.com (2603:10a6:10:1db::11)
 by PA1PR08MB11671.eurprd08.prod.outlook.com (2603:10a6:102:556::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 12:13:38 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::67) by DB9PR06CA0006.outlook.office365.com
 (2603:10a6:10:1db::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 12:13:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 4 Sep 2026 12:13:38 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB9887.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 12:13:04 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 12:13:04 +0000
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
 b=Of5uoNHA4ZTIaWMREks/1XKVWKnVcJ2/QFxcVwFADN6/Wo6LBFD3VDEOksLTqhayixM/mu+bhqO2TMJ4niHKoYX6g8b/fLtU3P0hIxMfJtAPCjWzRhf6IG1YMS2sXgayVOQtsAhs/JHsOQNx9MetV1hczwbhDZImtn+sRmRwYLsICFZuSIz7+GZVtxz6OHrnlmzwIUcqunI9DECZeHDFDZfPnfqpctbJz57pSsh1+mG9yPxHV7r038/frQj2p2vWeG3E7jzO6AFCLhRUvb/e8M3LqJqggiIe0GBSExmZ/uUgYZOipcXjYOwYKe7XkE4g3Qgoy15xGl/l3orjNcuP5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJfAhDgLLfDizIY7/DfdMx74cpgQEW3B+/+1OlgZR+M=;
 b=F0PuiJcvl6kcvfFPSUlvKQ9RqCzZOTV8yFEqfdqRWnVmG6cK5aA3i2w2SNy8cuyLoxckVcLq9o1Q0gSag1LPncjfWxJ8N508jRy3Xd96i8PrWrxnhxb5K8bs3V1HQEM8B4EZLYQwci6/5rTCzcvm5UjK2H8eNoFYMvNQGb8Sx4uDNK5FYrYw07SEhity8x42sZzuuH4lleU4VoyCM7NV9RmO4hi+u7/z+5BQ7Awz5Gp1LR97YeUWsBibE5/1TQOKx2Stvf8PwYcU6igdgSXZGmQa2mEyxWyNyOSfbcBlXTQF0OWKyA7Ev5X/PwIOQM+/DgdEBwZIC8kf0dG+kfauAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJfAhDgLLfDizIY7/DfdMx74cpgQEW3B+/+1OlgZR+M=;
 b=aY8tDzRqyLfyotdxyRjIL56r0xgZrhU5DvNVJ9jjN3eM5tDs0eu5pU+YOgmxBxbHzLkapUTfSOrQqugTPJ0bywVs+9rMwvtPep0pdhhJJTe30ph8tr6kua9RTw6PRIehEIzwZnej23tYbbssCQpgXzOaBax4Ji77jaP7qmcXqbY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hn10f3efGTpQWgfim2uNXFgqhokPbGbeoSwjf8jAHLdY28cMgsoZgW9cPxDun8WzAoxYncCjBafxxAD19JBFsKyvQjyDv58sbMhiyoEjTr97TwdfcQ6vvR2VCzG/8LhAgFcq4W9J1PHkIscdpFzSdPUOAavtRNqPjGKKxo7FHWztgG1kCDo8sZCk8KI9ycQFIeg8BK+UlOQOZ/0LuLpRKdOVwahKDX+svL3GU9tdKuxV1CYsBq+u7TYinMddMTEfvM1J1Ge82V+7nx1n2JleZ9ARvbIBMKaErHa2jRT3luKT4keKZfVMgczWlBiqVQLekH4Zy8kMSr91X70SRX+T2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJfAhDgLLfDizIY7/DfdMx74cpgQEW3B+/+1OlgZR+M=;
 b=pVSDIGUUrbka0UHG2ugCPhMI2jeyaHIG3+CnaTeDpurEOdhCPM1bRhU8kZ4h5lF18esOroibcKx1fX9TeWgyPQEL2sXd8Lf1I7qvyTMN2uGb+x3S/DPOqp0lHqCIDZQzLLj13FVInIk2QYpNuaRZZFc15znJbX0j5oL1N1MCSLua51zoWFOxJbmOmW0xMQnT/YoE2EOrN2qaRqxObLzoNbS4V3944jLucUnehF62psAVk6kKu/edr4gus7whnIzwa57TINQRCDnIp9lYmOUK4/d6DPSWUNJSPYSkfpl543sAYwh33vgZ+MCKdDrfYMNHeTar00KiqDNyyOtdXWETYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJfAhDgLLfDizIY7/DfdMx74cpgQEW3B+/+1OlgZR+M=;
 b=aY8tDzRqyLfyotdxyRjIL56r0xgZrhU5DvNVJ9jjN3eM5tDs0eu5pU+YOgmxBxbHzLkapUTfSOrQqugTPJ0bywVs+9rMwvtPep0pdhhJJTe30ph8tr6kua9RTw6PRIehEIzwZnej23tYbbssCQpgXzOaBax4Ji77jaP7qmcXqbY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH v2 5/5] xen/arm: Rewrite arm_smccc_*() to return by value
Thread-Topic: [PATCH v2 5/5] xen/arm: Rewrite arm_smccc_*() to return by value
Thread-Index: AQHdPF5PySaNy6Ey5EKldcmUqkyt+ba+VLAA
Date: Fri, 4 Sep 2026 12:13:04 +0000
Message-ID: <9301544B-8F8D-4E27-9BFA-B7244633B41F@arm.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
 <20260904111228.3022634-6-andrew.cooper3@citrix.com>
In-Reply-To: <20260904111228.3022634-6-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB9887:EE_|DU2PEPF00028D11:EE_|PA1PR08MB11671:EE_
X-MS-Office365-Filtering-Correlation-Id: 205aac83-793d-4296-333a-08df0a7df39e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|3023799007|4143699003|18002099003|22082099003|56012099006|11063799006|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 WQzUhLCfLutEwi6zTNt/4FFGJcR/rUoNByrZ/9WZTyPJHo0NZRoVjU7oAzAeOYE3hW0ip7GC3aU7dMjglAw39gof4BhEvGzw+wowUEMzh/p8AiLV/DLF9MGqgzz76y1wxoFytbeAs7Ry4o6hlFLZicvoXuYY5a/YDb9CSpvGj++/kXzCCRzCVmfD9ZxAfpQsiHRATux6SOGR3xufiKfT2vUhSJu1XJ2WAE5mLCRSpJgqIU8o2k8mb+JoCgNwGVln50jyLfkNX0NpUFFLaTLxncgz9T2H0wRLkPBhXxvY6IrpSkxMJbIgXBB3GHhux9PjPyT0XUdm+7g74R9tPh2TdcMyAsDVqsZf4DVgp0BpvQEwX9FliRG0KD8tp2MMR3lbpR0uKv25Px9nc1VAsmiVgu4pAItS48QB1Eo2T0krbIjspzQdvZUBEmmfgno8G7s2BgHpjzn1fIjp/iLl3V8ez+dNSO+k6XUgRfJyecRRe0CJdIUi70uRJ9shfMNGJ2QlfzGz0MwrqoNbuwA5H0MPSrTSCWHRK4AfK4KmfPxKkiuuttBjatKpEjWoNrY5/0VRmYYO+xpGChGsu87INGQzYCyI7/lZEwacz6MTi6xVLyOfSP/6/THiVnnq0odp1GKhvFfgE0vbTbgyvStt4XpqYujW9M49EUkjnn0pNOXrlSa7M0urdQHTf2YYhnsTiH3MNTg2DPg50Bg3R6MNOIIOwHSxozOR2g65KX/7b5DkHjM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27F9824EECC06A4EB14DDE182F34F31F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 S6F3kA/T2G0PbQaqMAOpPRaGkQtLMEglZL5NO0UQjyklvn3wC58AbXGwAdf+0bp7znVlLDUbxx2cHVenVHUitaHlgSX/I3o5HoK8OHcIx+5CrDVDT55BWDXsE/2jUnke55sE0NEBHhk6OY7TO/o44RsH6Veg8Ce+HoJeYAQr62zrjlG6Ty+qXmPYrZv17UIe/Vw4nXegFCYT3uofmmh+1DMfebbNVAAP3Av6Z0O1YQmJkAXAMPTNkhZcSKETWo1gJBMGxpCfzW0Hj4MYiAyhXTl6rZVkhSgcShFKZUzfAnyZt3QIoSusLMRvqWjF4xkoHN79221pLPXOkHm+UHX8Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9887
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7f9bbc0-bd7f-447e-ed3a-08df0a7ddf62
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|36860700016|1800799024|23010399003|35042699022|376014|18002099003|22082099003|3023799007|56012099006|6133799003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	W4UcGOV5Q3Eumsu6B3DrpaUON+Wr8CBXGpqG5giKlhHE8atx9lQ6Ywr6r0wium5hDSpdl8erOs+xaxBiM0QHsEkB1Lo2noRuipxheVD/hCvBx5ycuszYCxI0sLKSyIaHhv86snZNLTLMqIr7sjVMF0pjVdweZgRZSy45mkRsSb4f/x83CLG1Q1nZDplE0D97knVNrKt7NEWq0DlqHuiM0wZdGjr9ENoLZWWCb4Fs+T9q5BDIT3+IX/EMCI3LRfRwaOb+4BsWJ0jB3J4kq9gD67io3gZ2Xdb77Gsfna6D3212BPf+XLQIHQ45n8GZG/m3jYTGrtBRWqAHnKexnFmUS1R+zj9KoxiUq+lD4aLmglgY+haHmhNwMvygJWQFPn9BvBorFnprKNnp/L/kUHwCPVgOmAGO+SkM6KmkE7Y5Vn/ftD39q7F8D1fuSR2fk6JiGduZceu/0BFBACNdXYAjF9HoVF6/YTRLkSpLKm/UxONx9okFb2q3bQH84zPlD/NgQ60lZsOsG4BCzzbJt52w5YCsVec6LmPs4ROjzlmpAObFN8V+BzT/KE9hy4B9n0BAwUs6xjjiWiL9/r07L/wCwToFB2NI/H9zMTfvChLfJvpqon4duDyi/gxS5wjS9k2cVP1trSW8GHHBQCc3x5nSJQzLauHrZM7UQmHZoZwttHs=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700016)(1800799024)(23010399003)(35042699022)(376014)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QkelyHSRGha6UhFPxQpfTfHgYkyAghGSjGEO8BcadYdF0RijWq4o4mCyLijSmY0NvXMYY16tOEC5e3weB5T3yZ/TAyB/3Q6EdndnepZ7Mu2D73jD4AT5GrwnPoAdVMiXMzHkH50Mv1x67sT/ibV9LS8JMaHXQZTmk6kYpM7928cGHVBVSMpykYLhyeRvQGrXKkQBjkThCYjwsA80Z5LYTq2ggeglqcv4fR+TxzMDiF3HVvXIyIZcUO/VBKnqRlr8vrplGnzkA0Pfrm2sz7kTIdHvZNx6Ft0AbbfMoJ+oGEjOLoYugjMpYPrfeKr6eFjb3OdfOrkeZEgtxMC1GHBJXYOVf0qtmn5W7nBWR4nOaucR+XQEem9RWiaaQmGhBLsOl4SyGF2iN9sltzRKH3pHwid9yLJ7xn/OXyCQUu/V4XJxbPsvg1eDBciWSaE+KyxA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:13:38.3214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 205aac83-793d-4296-333a-08df0a7df39e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR08MB11671
X-purgate-ID: tlsNG-33051d/1788524024-6E2D04E9-F04B5D3E/0/0
X-purgate-type: clean
X-purgate-size: 25633

Hi Andrew,

> On 4 Sep 2026, at 13:12, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> Use statement expressions to return struct arm_smccc_res which makes the =
code
> read a lot more normally, and avoids needing to pass in NULL in order to =
skip
> return information.
>=20
> More importantly, it removes the local implementation of __count_args() w=
hich
> is off by two and deeply confusing to try and follow.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
>=20
> v2:
> * Transform extra call in optee_probe()
>=20
> Xen compiles identically before and after this change, for both arm32 and=
 arm64.
> ---
> xen/arch/arm/cpuerrata.c         | 18 +++----
> xen/arch/arm/include/asm/smccc.h | 87 ++++++++++++++------------------
> xen/arch/arm/platforms/exynos5.c |  2 +-
> xen/arch/arm/platforms/seattle.c |  4 +-
> xen/arch/arm/psci.c              | 17 +++----
> xen/arch/arm/tee/optee.c         | 50 +++++++++---------
> xen/arch/arm/traps.c             |  4 +-
> 7 files changed, 86 insertions(+), 96 deletions(-)
>=20
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 3a32183618dc..35ad98d29d14 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -179,8 +179,8 @@ static int enable_smccc_arch_workaround_1(void *data)
>     if ( smccc_ver < SMCCC_VERSION(1, 1) )
>         goto warn;
>=20
> -    arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> -                      ARM_SMCCC_ARCH_WORKAROUND_1_FID, &res);
> +    res =3D arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> +                            ARM_SMCCC_ARCH_WORKAROUND_1_FID);
>     /* The return value is in the lower 32-bits. */
>     if ( (int)res.a0 < 0 )
>         goto warn;
> @@ -256,8 +256,8 @@ static int enable_spectre_bhb_workaround(void *data)
>         if ( smccc_ver < SMCCC_VERSION(1, 1) )
>             goto warn;
>=20
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> -                          ARM_SMCCC_ARCH_WORKAROUND_3_FID, &res);
> +        res =3D arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> +                                ARM_SMCCC_ARCH_WORKAROUND_3_FID);
>         /* The return value is in the lower 32-bits. */
>         if ( (int)res.a0 < 0 )
>         {
> @@ -398,8 +398,8 @@ static bool has_ssbd_mitigation(const struct arm_cpu_=
capabilities *entry)
>     if ( smccc_ver < SMCCC_VERSION(1, 1) )
>         return false;
>=20
> -    arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> -                      ARM_SMCCC_ARCH_WORKAROUND_2_FID, &res);
> +    res =3D arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
> +                            ARM_SMCCC_ARCH_WORKAROUND_2_FID);
>=20
>     switch ( (int)res.a0 )
>     {
> @@ -429,7 +429,7 @@ static bool has_ssbd_mitigation(const struct arm_cpu_=
capabilities *entry)
>     case ARM_SSBD_FORCE_DISABLE:
>         printk_once("%s disabled from command-line\n", entry->desc);
>=20
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
> +        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0);
>         required =3D false;
>         break;
>=20
> @@ -437,7 +437,7 @@ static bool has_ssbd_mitigation(const struct arm_cpu_=
capabilities *entry)
>         if ( required )
>         {
>             this_cpu(ssbd_callback_required) =3D 1;
> -            arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
> +            arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1);
>         }
>=20
>         break;
> @@ -445,7 +445,7 @@ static bool has_ssbd_mitigation(const struct arm_cpu_=
capabilities *entry)
>     case ARM_SSBD_FORCE_ENABLE:
>         printk_once("%s forced from command-line\n", entry->desc);
>=20
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
> +        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1);
>         required =3D true;
>         break;
>=20
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index 4ed2a40ed0ac..2d0f2db0b256 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -95,20 +95,14 @@ struct arm_smccc_res {
>     unsigned long a3;
> };
>=20
> -/* SMCCC v1.1 implementation madness follows */
> -#define ___count_args(_0, _1, _2, _3, _4, _5, _6, _7, _8, x, ...) x
> -
> -#define __count_args(...)                               \
> -    ___count_args(__VA_ARGS__, 7, 6, 5, 4, 3, 2, 1, 0)
> -
> -#define __constraint_read_0 "r" (arg0)
> -#define __constraint_read_1 __constraint_read_0, "r" (arg1)
> -#define __constraint_read_2 __constraint_read_1, "r" (arg2)
> -#define __constraint_read_3 __constraint_read_2, "r" (arg3)
> -#define __constraint_read_4 __constraint_read_3, "r" (arg4)
> -#define __constraint_read_5 __constraint_read_4, "r" (arg5)
> -#define __constraint_read_6 __constraint_read_5, "r" (arg6)
> -#define __constraint_read_7 __constraint_read_6, "r" (arg7)
> +#define __constraint_read_1 "r" (arg0)
> +#define __constraint_read_2 __constraint_read_1, "r" (arg1)
> +#define __constraint_read_3 __constraint_read_2, "r" (arg2)
> +#define __constraint_read_4 __constraint_read_3, "r" (arg3)
> +#define __constraint_read_5 __constraint_read_4, "r" (arg4)
> +#define __constraint_read_6 __constraint_read_5, "r" (arg5)
> +#define __constraint_read_7 __constraint_read_6, "r" (arg6)
> +#define __constraint_read_8 __constraint_read_7, "r" (arg7)
>=20
> /*
>  * Macro arguments MUST be evaluated before being assigned to a register
> @@ -117,44 +111,43 @@ struct arm_smccc_res {
>  * This is manual register scheduling for the asm() statement, and any ot=
her
>  * logic to evaluate may clobber the already-scheduled registers.
>  */
> -#define __declare_arg_0(a0, res)                        \
> +#define __declare_arg_1(a0)                             \
>     auto __a0 =3D (uint32_t)(a0);                         \
> -    struct arm_smccc_res    *___res =3D (res);            \
>     register unsigned long  arg0 ASM_REG(0) =3D __a0
>=20
> -#define __declare_arg_1(a0, a1, res)                    \
> +#define __declare_arg_2(a0, a1)                         \
>     auto __a1 =3D (a1);                                   \
> -    __declare_arg_0(a0, res);                           \
> +    __declare_arg_1(a0);                                \
>     register auto           arg1 ASM_REG(1) =3D __a1
>=20
> -#define __declare_arg_2(a0, a1, a2, res)                \
> +#define __declare_arg_3(a0, a1, a2)                     \
>     auto __a2 =3D (a2);                                   \
> -    __declare_arg_1(a0, a1, res);                       \
> +    __declare_arg_2(a0, a1);                            \
>     register auto           arg2 ASM_REG(2) =3D __a2
>=20
> -#define __declare_arg_3(a0, a1, a2, a3, res)            \
> +#define __declare_arg_4(a0, a1, a2, a3)                 \
>     auto __a3 =3D (a3);                                   \
> -    __declare_arg_2(a0, a1, a2, res);                   \
> +    __declare_arg_3(a0, a1, a2);                        \
>     register auto           arg3 ASM_REG(3) =3D __a3
>=20
> -#define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
> +#define __declare_arg_5(a0, a1, a2, a3, a4)             \
>     auto __a4 =3D (a4);                                   \
> -    __declare_arg_3(a0, a1, a2, a3, res);               \
> +    __declare_arg_4(a0, a1, a2, a3);                    \
>     register auto           arg4 ASM_REG(4) =3D __a4
>=20
> -#define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
> +#define __declare_arg_6(a0, a1, a2, a3, a4, a5)         \
>     auto __a5 =3D (a5);                                   \
> -    __declare_arg_4(a0, a1, a2, a3, a4, res);           \
> +    __declare_arg_5(a0, a1, a2, a3, a4);                \
>     register auto           arg5 ASM_REG(5) =3D __a5
>=20
> -#define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
> -    auto __a6 =3D (a6);                                       \
> -    __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
> +#define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6)     \
> +    auto __a6 =3D (a6);                                   \
> +    __declare_arg_6(a0, a1, a2, a3, a4, a5);            \
>     register auto           arg6 ASM_REG(6) =3D __a6
>=20
> -#define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
> -    auto __a7 =3D (a7);                                           \
> -    __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
> +#define __declare_arg_8(a0, a1, a2, a3, a4, a5, a6, a7) \
> +    auto __a7 =3D (a7);                                   \
> +    __declare_arg_7(a0, a1, a2, a3, a4, a5, a6);        \
>     register auto           arg7 ASM_REG(7) =3D __a7
>=20
> #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
> @@ -181,21 +174,20 @@ struct arm_smccc_res {
>  * makes it stick.
>  */
> #define arm_smccc_1_1_smc(...)                                  \

The comment would need fixing on top of this  as current
one still describes the optional @res argument while now=20
we only take a0 to a7 as arguments and return the structure=20
instead.

Cheers
Bertrand

> -    do {                                                        \
> +    ({                                                          \
>         register unsigned long r0 ASM_REG(0);                   \
>         register unsigned long r1 ASM_REG(1);                   \
>         register unsigned long r2 ASM_REG(2);                   \
>         register unsigned long r3 ASM_REG(3);                   \
> -        __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
> +        __declare_args(count_args(__VA_ARGS__), __VA_ARGS__);   \
>         asm volatile (                                          \
>             "smc #0"                                            \
>             : "=3Dr" (r0), "=3Dr" (r1), "=3Dr" (r2), "=3Dr" (r3)        \
>             : PASTE(__constraint_read_,                         \
> -                    __count_args(__VA_ARGS__))                  \
> +                    count_args(__VA_ARGS__))                    \
>             : "memory" );                                       \
> -        if ( ___res )                                           \
> -            *___res =3D (struct arm_smccc_res){ r0, r1, r2, r3 }; \
> -    } while ( 0 )
> +        (struct arm_smccc_res){ r0, r1, r2, r3 };               \
> +    })
>=20
> /*
>  * The calling convention for arm32 is the same for both SMCCC v1.0 and
> @@ -208,8 +200,8 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
> {
>     struct arm_smccc_res res;
>=20
> -    arm_smccc_1_1_smc(regs->r0, regs->r1, regs->r2, regs->r3,
> -                      regs->r4, regs->r5, regs->r6, regs->r7, &res);
> +    res =3D arm_smccc_1_1_smc(regs->r0, regs->r1, regs->r2, regs->r3,
> +                            regs->r4, regs->r5, regs->r6, regs->r7);
>=20
>     regs->r0 =3D res.a0;
>     regs->r1 =3D res.a1;
> @@ -226,7 +218,7 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
>  * are strictly preserved.  Always mark x4 through x17 as clobbered.
>  */
> #define arm_smccc_smc(...)                                      \
> -    do {                                                        \
> +    ({                                                          \
>         register unsigned long r0  ASM_REG(0);                  \
>         register unsigned long r1  ASM_REG(1);                  \
>         register unsigned long r2  ASM_REG(2);                  \
> @@ -246,7 +238,7 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
>         register unsigned long c15 ASM_REG(15);                 \
>         register unsigned long c16 ASM_REG(16);                 \
>         register unsigned long c17 ASM_REG(17);                 \
> -        __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
> +        __declare_args(count_args(__VA_ARGS__), __VA_ARGS__);   \
>         asm volatile (                                          \
>             "smc #0"                                            \
>             : "=3Dr" (r0),  "=3Dr" (r1),  "=3Dr" (r2),  "=3Dr" (r3),    \
> @@ -255,11 +247,10 @@ static inline void arm_smccc_guest_smc(struct cpu_u=
ser_regs *regs)
>               "=3Dr" (c12), "=3Dr" (c13), "=3Dr" (c14), "=3Dr" (c15),   \
>               "=3Dr" (c16), "=3Dr" (c17)                            \
>             : PASTE(__constraint_read_,                         \
> -                    __count_args(__VA_ARGS__))                  \
> +                    count_args(__VA_ARGS__))                    \
>             : "memory" );                                       \
> -        if ( ___res )                                           \
> -            *___res =3D (struct arm_smccc_res){ r0, r1, r2, r3 }; \
> -    } while ( 0 )
> +        (struct arm_smccc_res){ r0, r1, r2, r3 };               \
> +    })
>=20
> #define arm_smccc_1_1_smc(...) arm_smccc_smc(__VA_ARGS__)
>=20
> @@ -268,8 +259,8 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
> {
>     struct arm_smccc_res res;
>=20
> -    arm_smccc_1_1_smc(regs->x0, regs->x1, regs->x2, regs->x3,
> -                      regs->x4, regs->x5, regs->x6, regs->x7, &res);
> +    res =3D arm_smccc_1_1_smc(regs->x0, regs->x1, regs->x2, regs->x3,
> +                            regs->x4, regs->x5, regs->x6, regs->x7);
>=20
>     regs->x0 =3D res.a0;
>     regs->x1 =3D res.a1;
> diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/ex=
ynos5.c
> index f7c09520675e..f08d50c1fe38 100644
> --- a/xen/arch/arm/platforms/exynos5.c
> +++ b/xen/arch/arm/platforms/exynos5.c
> @@ -249,7 +249,7 @@ static int exynos5_cpu_up(int cpu)
>     iounmap(power);
>=20
>     if ( secure_firmware )
> -        arm_smccc_smc(SMC_CMD_CPU1BOOT, cpu, NULL);
> +        arm_smccc_smc(SMC_CMD_CPU1BOOT, cpu);
>=20
>     return cpu_up_send_sgi(cpu);
> }
> diff --git a/xen/arch/arm/platforms/seattle.c b/xen/arch/arm/platforms/se=
attle.c
> index 64cc1868c24b..dfa5cf4265c0 100644
> --- a/xen/arch/arm/platforms/seattle.c
> +++ b/xen/arch/arm/platforms/seattle.c
> @@ -33,12 +33,12 @@ static const char * const seattle_dt_compat[] __initc=
onst =3D
>  */
> static void seattle_system_reset(void)
> {
> -    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
> +    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET);
> }
>=20
> static void seattle_system_off(void)
> {
> -    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
> +    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF);
> }
>=20
> PLATFORM_START(seattle, "SEATTLE")
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index b6860a776031..634d0d7467cf 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -41,8 +41,8 @@ int call_psci_cpu_on(int cpu)
> {
>     struct arm_smccc_res res;
>=20
> -    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_second=
ary),
> -                  &res);
> +    res =3D arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
> +                        __pa(init_secondary));
>=20
>     return PSCI_RET(res);
> }
> @@ -54,7 +54,7 @@ void call_psci_cpu_off(void)
>         struct arm_smccc_res res;
>=20
>         /* If successfull the PSCI cpu_off call doesn't return */
> -        arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF, &res);
> +        res =3D arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF);
>         panic("PSCI cpu off failed for CPU%d err=3D%d\n", smp_processor_i=
d(),
>               PSCI_RET(res));
>     }
> @@ -63,13 +63,13 @@ void call_psci_cpu_off(void)
> void call_psci_system_off(void)
> {
>     if ( psci_ver > PSCI_VERSION(0, 1) )
> -        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
> +        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF);
> }
>=20
> void call_psci_system_reset(void)
> {
>     if ( psci_ver > PSCI_VERSION(0, 1) )
> -        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
> +        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET);
> }
>=20
> static int __init psci_features(uint32_t psci_func_id)
> @@ -79,7 +79,7 @@ static int __init psci_features(uint32_t psci_func_id)
>     if ( psci_ver < PSCI_VERSION(1, 0) )
>         return PSCI_NOT_SUPPORTED;
>=20
> -    arm_smccc_smc(PSCI_1_0_FN32_PSCI_FEATURES, psci_func_id, &res);
> +    res =3D arm_smccc_smc(PSCI_1_0_FN32_PSCI_FEATURES, psci_func_id);
>=20
>     return PSCI_RET(res);
> }
> @@ -116,9 +116,8 @@ static void __init psci_init_smccc(void)
>=20
>     if ( psci_features(ARM_SMCCC_VERSION_FID) !=3D PSCI_NOT_SUPPORTED )
>     {
> -        struct arm_smccc_res res;
> +        struct arm_smccc_res res =3D arm_smccc_smc(ARM_SMCCC_VERSION_FID=
);
>=20
> -        arm_smccc_smc(ARM_SMCCC_VERSION_FID, &res);
>         if ( PSCI_RET(res) !=3D ARM_SMCCC_NOT_SUPPORTED )
>             smccc_ver =3D PSCI_RET(res);
>     }
> @@ -191,7 +190,7 @@ static int __init psci_init_0_2(void)
>         }
>     }
>=20
> -    arm_smccc_smc(PSCI_0_2_FN32_PSCI_VERSION, &res);
> +    res =3D arm_smccc_smc(PSCI_0_2_FN32_PSCI_VERSION);
>     psci_ver =3D PSCI_RET(res);
>=20
>     /* For the moment, we only support PSCI 0.2 and PSCI 1.x */
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 3d2633237074..5e94daee0686 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -178,7 +178,7 @@ static bool optee_probe(void)
>         return false;
>=20
>     /* Check UID */
> -    arm_smccc_smc(ARM_SMCCC_CALL_UID_FID(TRUSTED_OS_END), &resp);
> +    resp =3D arm_smccc_smc(ARM_SMCCC_CALL_UID_FID(TRUSTED_OS_END));
>=20
>     if ( (uint32_t)resp.a0 !=3D OPTEE_MSG_UID_0 ||
>          (uint32_t)resp.a1 !=3D OPTEE_MSG_UID_1 ||
> @@ -187,7 +187,7 @@ static bool optee_probe(void)
>         return false;
>=20
>     /* Read number of threads */
> -    arm_smccc_smc(OPTEE_SMC_GET_THREAD_COUNT, &resp);
> +    resp =3D arm_smccc_smc(OPTEE_SMC_GET_THREAD_COUNT);
>     if ( resp.a0 =3D=3D OPTEE_SMC_RETURN_OK )
>     {
>         max_optee_threads =3D resp.a1;
> @@ -209,7 +209,7 @@ static bool optee_probe(void)
>      * call. It will return OPTEE_SMC_RETURN_UNKNOWN_FUNCTION if
>      * OP-TEE have no virtualization support enabled.
>      */
> -    arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, 0, 0, 0, 0, 0, 0, 0, &resp);
> +    resp =3D arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, 0, 0, 0, 0, 0, 0, 0);
>     if ( resp.a0 =3D=3D OPTEE_SMC_RETURN_UNKNOWN_FUNCTION )
>         return false;
>=20
> @@ -243,8 +243,8 @@ static int optee_domain_init(struct domain *d)
>      *
>      * a7 should be 0, so we can't skip last 6 parameters of arm_smccc_sm=
c()
>      */
> -    arm_smccc_smc(OPTEE_SMC_VM_CREATED, OPTEE_CLIENT_ID(d), 0, 0, 0, 0, =
0, 0,
> -                  &resp);
> +    resp =3D arm_smccc_smc(OPTEE_SMC_VM_CREATED, OPTEE_CLIENT_ID(d),
> +                         0, 0, 0, 0, 0, 0);
>     if ( resp.a0 !=3D OPTEE_SMC_RETURN_OK )
>     {
>         printk(XENLOG_WARNING "%pd: Unable to create OPTEE client: rc =3D=
 0x%X\n",
> @@ -681,8 +681,8 @@ static int optee_relinquish_resources(struct domain *=
d)
>      *
>      * a7 should be 0, so we can't skip last 6 parameters of arm_smccc_sm=
c()
>      */
> -    arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, OPTEE_CLIENT_ID(d), 0, 0, 0, 0=
, 0, 0,
> -                  &resp);
> +    resp =3D arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, OPTEE_CLIENT_ID(d),
> +                         0, 0, 0, 0, 0, 0);
>=20
>     ASSERT(!spin_is_locked(&ctx->lock));
>     ASSERT(!atomic_read(&ctx->call_count));
> @@ -1171,15 +1171,15 @@ static void do_call_with_arg(struct optee_domain =
*ctx,
> {
>     struct arm_smccc_res res;
>=20
> -    arm_smccc_smc(a0, a1, a2, a3, a4, a5, 0, OPTEE_CLIENT_ID(current->do=
main),
> -                  &res);
> +    res =3D arm_smccc_smc(a0, a1, a2, a3, a4, a5, 0,
> +                        OPTEE_CLIENT_ID(current->domain));
>=20
>     if ( OPTEE_SMC_RETURN_IS_RPC(res.a0) )
>     {
>         while ( handle_rpc_return(ctx, &res, regs, call)  =3D=3D -ERESTAR=
T )
>         {
> -            arm_smccc_smc(res.a0, res.a1, res.a2, res.a3, 0, 0, 0,
> -                          OPTEE_CLIENT_ID(current->domain), &res);
> +            res =3D arm_smccc_smc(res.a0, res.a1, res.a2, res.a3, 0, 0, =
0,
> +                                OPTEE_CLIENT_ID(current->domain));
>=20
>             if ( !OPTEE_SMC_RETURN_IS_RPC(res.a0) )
>                 break;
> @@ -1619,8 +1619,8 @@ static void handle_exchange_capabilities(struct cpu=
_user_regs *regs)
>     caps =3D get_user_reg(regs, 1);
>     caps &=3D OPTEE_KNOWN_NSEC_CAPS;
>=20
> -    arm_smccc_smc(OPTEE_SMC_EXCHANGE_CAPABILITIES, caps, 0, 0, 0, 0, 0,
> -                  OPTEE_CLIENT_ID(current->domain), &resp);
> +    resp =3D arm_smccc_smc(OPTEE_SMC_EXCHANGE_CAPABILITIES, caps, 0, 0, =
0, 0, 0,
> +                         OPTEE_CLIENT_ID(current->domain));
>     if ( resp.a0 !=3D OPTEE_SMC_RETURN_OK ) {
>         set_user_reg(regs, 0, resp.a0);
>         return;
> @@ -1664,8 +1664,8 @@ static bool optee_handle_call(struct cpu_user_regs =
*regs)
>         return true;
>=20
>     case OPTEE_SMC_CALLS_UID:
> -        arm_smccc_smc(OPTEE_SMC_CALLS_UID, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_CALLS_UID, 0, 0, 0, 0, 0, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         set_user_reg(regs, 1, resp.a1);
>         set_user_reg(regs, 2, resp.a2);
> @@ -1673,15 +1673,15 @@ static bool optee_handle_call(struct cpu_user_reg=
s *regs)
>         return true;
>=20
>     case OPTEE_SMC_CALLS_REVISION:
> -        arm_smccc_smc(OPTEE_SMC_CALLS_REVISION, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_CALLS_REVISION, 0, 0, 0, 0, 0, =
0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         set_user_reg(regs, 1, resp.a1);
>         return true;
>=20
>     case OPTEE_SMC_CALL_GET_OS_UUID:
> -        arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_UUID, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain),&resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_UUID, 0, 0, 0, 0, 0=
, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         set_user_reg(regs, 1, resp.a1);
>         set_user_reg(regs, 2, resp.a2);
> @@ -1689,21 +1689,21 @@ static bool optee_handle_call(struct cpu_user_reg=
s *regs)
>         return true;
>=20
>     case OPTEE_SMC_CALL_GET_OS_REVISION:
> -        arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_REVISION, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_REVISION, 0, 0, 0, =
0, 0, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         set_user_reg(regs, 1, resp.a1);
>         return true;
>=20
>     case OPTEE_SMC_ENABLE_SHM_CACHE:
> -        arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0=
, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         return true;
>=20
>     case OPTEE_SMC_DISABLE_SHM_CACHE:
> -        arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
> -                      OPTEE_CLIENT_ID(current->domain), &resp);
> +        resp =3D arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, =
0, 0,
> +                             OPTEE_CLIENT_ID(current->domain));
>         set_user_reg(regs, 0, resp.a0);
>         if ( resp.a0 =3D=3D OPTEE_SMC_RETURN_OK ) {
>             free_shm_rpc(ctx,  regpair_to_uint64(resp.a1, resp.a2));
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 625d229396bb..6a5dcef2aa87 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1991,7 +1991,7 @@ void asmlinkage enter_hypervisor_from_guest_preirq(=
void)
>=20
>     /* If the guest has disabled the workaround, bring it back on. */
>     if ( needs_ssbd_flip(v) )
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
> +        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1);
> }
>=20
> /*
> @@ -2334,7 +2334,7 @@ void asmlinkage leave_hypervisor_to_guest(void)
>      * If the guest wants it disabled, so be it...
>      */
>     if ( needs_ssbd_flip(current) )
> -        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
> +        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0);
> }
>=20
> /*
> --=20
> 2.39.5
>=20


