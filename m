Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC7CC9833E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 07:37:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435687.1654480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB5v6-0001TQ-Q8; Mon, 28 Sep 2026 07:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435687.1654480; Mon, 28 Sep 2026 07:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB5v6-0001TJ-NP; Mon, 28 Sep 2026 07:37:04 +0000
Received: by outflank-mailman (input) for mailman id 1435687;
 Mon, 28 Sep 2026 07:37:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xB5v5-0001TD-CI
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 07:37:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB5v3-009VP8-UD
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 09:37:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba1913-bab6-0a2a0a5309dd-0a2a450ca6e0-42
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 09:37:01 +0200
Received: from [52.101.66.30]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba1917-f479-0a2a450c0019-3465421e83d6-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 09:36:55 +0200
Received: from AS4P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::13)
 by PAXPR08MB6399.eurprd08.prod.outlook.com (2603:10a6:102:158::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 07:36:49 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:20b:5da:cafe::46) by AS4P192CA0003.outlook.office365.com
 (2603:10a6:20b:5da::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 07:36:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 07:36:49 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by FRZPR08MB10968.eurprd08.prod.outlook.com (2603:10a6:d10:13b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 07:36:15 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 07:36:15 +0000
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
 b=E1ioMwyDcypta5394uWC/gRudNSWGKdwRNQszgx2I9JP/ymXPKQ5TiIv0qp8MqlmLH+DKeGdh9Pgcdd1apxmj+u0zfzu9jCL7V9x0C/JlOXpg8XqByCWId4EGa4gEsCp/72Hgmm8wi64o4fv/o/4F2eHflnm7edITQViuO+AVGgg8v6EDzQ5S0Xh5WULPLxf/tgnetxtQ+AbF65CJqWSclqZWyEP/in5XqYrf4USJY3raQpUJVHfLkkRTP9alzzBsHKIVtdmrNj5DWF6xDV37zV9apwbfmPbfrSqhdY6B7da/9VPPY+1ihthLpzORGDzJsvfqfBnFrCK1ZA16o32pQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8jd32gK1oaXXEftE0Vgdt5iTX2loRb2XP/JQkN1jjU=;
 b=EsQ7Wnkrp6CVwFc5r/N8ZpvWX1ZEg592yGOM3nC1kgJ0PBPmIXOv/wZiO2ocMw2ELsGmeduxxcQdEdqHidzRc7baNsu9+/BnirU+UbVRFXzNRbkQzetTClfw7Wv4A4K9GKSPqhlSZpX2PGI//YWfmvm2KQcxwkMpBg89Vk+5YsqcMQWhTtgny+zBTxXjJgay7kHFQqTCiYyS5okFZXRHuq6NMB+S27RMBoHHzArQTlQvFEDebBNNekjjVbujKqYIzfxl+W8sJNfHyut/2ZK3fXzTsxpqgjXZ/sUdyRa9DobmqIvGJoBSqZ+69WHI9nss7PcvO/DezBwHj5ewKAfMdw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8jd32gK1oaXXEftE0Vgdt5iTX2loRb2XP/JQkN1jjU=;
 b=cmSzwmamNfta1c+9M4f88igIfR4GSwaR99ndrOjfcvXvQsniPJ8j+YG3tuQzbrO4HzTacrsTF5pOL3/lvWapT4TbMSPUcRX/nyxW9hZqQiIJdugX3FjTPJ1H4gIW/IpJbKnObYnHWw61V8KP8pkZYwVR439bV79s2OcSBKknySs=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emCWuoIDT1mJpnLDrARKW7uBTGSwWySLXsmrUNJveWua0LAIzh8yFCBe5fSNttW7r7E2JcJOdEuGxOEJGRyADAkH2aOxOOi8/1Faj/hoRm9UzAVMoLQmJXkxIJNcsoX2qq74bMAqJL+gH1X2LgWpxhfNrqQ+VktU4SnXwttEtBXTc0/0lSnS1d3f5HQheeT8+QGHJNNrOu2kuXw511fd36jrYBgG/DEBMUFtM/43baRmFCdnWCxPFYBkT/ph+RLpkcETod/9fOuDpU8kYLZ0byZDYf3e8tCSUantNfftAm8gmAFKDDpk07zY9EVFkvCyg5tTbDDc89tnoZQAfUTLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8jd32gK1oaXXEftE0Vgdt5iTX2loRb2XP/JQkN1jjU=;
 b=mCkqljYm0JfEOl7MOASJn4bDrUkTyAd/wBL24XP5D8pzO7AiSMjESQbcLRokVGF9YatGPTY9NYYfLH9/TpDSjg003HwSRti8UdyUnB54Vzw97DMuAHThm/lReW75nlbcbFvi7dX6F1KU3gc+9rl6qtrKwg2OVVsk1f5ymTNJB4LB4zj+wZP3fKKHtMkf1Lg5UCMYz20uNXypX7rxyqAntCtdM67lD6FMwyZHVkBhhr8lZ3DZVlaZ3upJk2DvUOQb2Crbu3usnw1W0bmpiH2CBCyopLWNjNCC55hR7iKayR9e3Zi/5kEA1Ts995GKGY4Xt7jKIe9ceL8NJXK9j+lhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8jd32gK1oaXXEftE0Vgdt5iTX2loRb2XP/JQkN1jjU=;
 b=cmSzwmamNfta1c+9M4f88igIfR4GSwaR99ndrOjfcvXvQsniPJ8j+YG3tuQzbrO4HzTacrsTF5pOL3/lvWapT4TbMSPUcRX/nyxW9hZqQiIJdugX3FjTPJ1H4gIW/IpJbKnObYnHWw61V8KP8pkZYwVR439bV79s2OcSBKknySs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: Mykola Kvach <mykola_kvach@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca
 Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v12 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v12 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHdNjDkV92bkh6okkqfhA392pMLzbbcc6SAgAIGhwCABVF7AA==
Date: Mon, 28 Sep 2026 07:36:15 +0000
Message-ID: <43701793-BCB0-40D5-AB3B-0082A2784F34@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <dbdba04cd531cf2f3ccfc0b7e8dbcb4925b25055.1787838455.git.mykola_kvach@epam.com>
 <DD46DB7E-3D4A-46BB-9AD0-D529CDDA4113@arm.com>
 <CAGeoDV8=Qu0Ywv6c1UB960RooCNiB06dfU-bdGhWVehuevzoaw@mail.gmail.com>
In-Reply-To:
 <CAGeoDV8=Qu0Ywv6c1UB960RooCNiB06dfU-bdGhWVehuevzoaw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|FRZPR08MB10968:EE_|AM2PEPF00070CF7:EE_|PAXPR08MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d556c0-03df-44fa-3267-08df1d3341c5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 TWdlZaInqAp+CywqsnGD6r+sV9DTKndmz8GVHUbP30w6viG36PvhKJX+evZB1jPUPRAFO4O2cBHDNnHLrfvtkO9K7cx82weAUEcx7MM69gOQOZKDc46Jr0gjJuyVNM5pPC1SreXDjcMFAOICAhp0UhT5EseFFqaU8cxDMOE6UenW0tHOxM0ZNvckg6fMQz7VpdH8j5YbKAk8vgAeNc5Kg4rn6ef9yFtwvllNpH9+o9Ob6e8pdRQqd6RbStoTegnOvyojf2+1aJg5ynF+8QHkssh8T4vzyD5RRS9tJ7fZ+bAai3AvSB35S6yE4IFca46te9WSNuhhWli/obnekJOgs3lE3FsmqMwiVWdB5wB4rFmUqLQvDdPEiNZrEVU2ByYHnnkpUsHkRr7Cy28S1wFKn/iti6pYOH4RId/Vj0ftOC/F3kYU6/qVhhqx+392B1BJ7JbvkQsJyZvpVwv91XmsJoygpB/EJb/Mtub4yfuxPFXRUONWagJxbh4mYIUwSVe6nPBBNSCIefJHCn0exjSvPpYz7L1kG4+QNriDdIDTaO5Yi/q7/yXlC4SKKTpm0nMsUrg67NiVtjRywBmVJsG5zKdfYO3bwsEJ8n2Lyy3ryn6zqacoevmcADI4g9Evydfo02lu1fvXcawQZ1ShhmRhszNOMf2SnXTA9rOfi8FIvV2wChIDRwuKi+mZ5Oz9QxeMQZlZ3klqd8/Aj36fPxeFKjJsEqKIq2oyBozzCUMeAcU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <15A59CA598866A4D89A9DC3D64EAC7F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 J41813ld8v7YhKH1lle/F9132v/ZQ4T4KYD8JoJOvrfvjT//Xt2G04tsQIQadzYdd/IfMwQFKDOTYe66ZmFb5MTH3IZ0zRU/xtKCZSsxXBgD2AXP4SeEDG0jDwJAOLjgKsG491QF3FxNFqSvMWqTGYJxbIG+xEZEFbLeBc1N0hO5UWiIdBADCt2Cc6ZqPoBrsHl/7rjwo7RmSotQcBlS7WTLzusHS3FGdIp59lcBAq9ylNkLpJRuy+CIZNrzVKeQOH42VC0t5ujNuk0RDt6IlIe4IU12JWg0dEjLzGE0hFBqhZXJ8MHcGO1AC1Vlo/SHr3hZ8oI6cr5hOVr9c9B5cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10968
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f592ba10-7376-4698-067e-08df1d332d5a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|14060799003|35042699022|6133799003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	llp1gJn/iJBxbKxbkbgftE7oj1YTUJmKR2RjCbekI5fV2lNikUZvgA5mVRP8n6ThoWEe/nxWmIGVlVw5y876YxWvYKr0EqGUXfzhQgKrXwgncu3JRceipIM/yHAr0NDzSEbPxqM+WIl1hcewYO4K7KBd/8shFotaPqLaHsqUpgep/9Fo/QhcOh6dPsAHS86WHm/Pvsh9n3qTWIlmFne4nfk2PtR9e1I5pu2I0sOGRbt7Z0BjfEKE7J0F7tSiDDuuFb9bMTfMfvEc2Oh3z5D34Ns0tGLpJ3aaWIuCMVKy8CrSTSFYGWvlT15uQlBHeUD1/oP9q9+PAMNBwDLctZrBsm6EY7unDZNgZX0zIZQPHsF2hmWequcBobDG6lj2sLhW8b8JO86QMJFuDpfVan5iOCMoIpjnGhr/ZVNMGguMvMF3fXBUnHa124D7WIOA08dxf5V3fuN5OJWNZHF3mOsw03/X7FEmA0gR+zGE/7sy2hLTj+T6cCulvbto04gP9WQmWd1focHkYBOkCpwzy7kGHOSSsJqWPZLJhVBoUWSqcuGbVPL15yEf/B2tQuErgb7Tsfh7ICiUo2SjBIDeIzrsWvCdMMLBIqZ/nvmqwFJRDY/5KXcj75G02dOPTE6x2xP1Jw1BiZ9HvwUvT3U3i6ZfY2gFLTnOc8jYfeVNqxTAaEQ14i6vm7A1jV9cW4h8YnOcNTjt6iiO0GDiAhvCmpYcIA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(14060799003)(35042699022)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d+BDzJNG5yLllHVTJ9KobT08GWzmA4eEfCAFWaGSLjsDz6t2xXmhTGfUoFIVmnVJ0Oe3B6SmTnEyFAMvtO4sDZ7fsACXmbTLbLtcmI/XGfOuq+4OLnWvH8Iw2eIeThckcn0vYDmYKKK7+aQd8eKL9tACfZfuh0MF+HdBibkXa3Vhdg4UUGyzjGkMqpEArHc707XvGl/9p+XFGJkxtB5c+dh3pxYxLMrch3qWAsH/zGaL1CYNY0aTW1X4QXUk5Kqp7Bb3GFXIq+bYAPdTS/hsj+3+piyqo8uN9bQO/O3yBoNG6Pa4Yu43vsd46V53ROEbfhtMMac8V6uxaeD6mDJHMdahWCzq9l2uTag0AP8vUnOYVbupJvJaNgJQR2DFNItFlVbrkA5pigNLH4qx/KScVeaymr+q6U/VMmLoJl3c66+JwIL162CLlFrO7qNnxTgf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 07:36:49.2915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d556c0-03df-44fa-3267-08df1d3341c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6399
X-purgate-ID: tlsNG-d25034/1790581021-5113AA5B-E62C3935/0/0
X-purgate-type: clean
X-purgate-size: 6410

SGkgTXlrb2xhLA0KDQo+IE9uIDI1IFNlcCAyMDI2LCBhdCAwMDoyMywgTXlrb2xhIEt2YWNoIDx4
YWtlcC5hbWF0b3BAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiANCj4g
VGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KPiANCj4gT24gV2VkLCBTZXAgMjMsIDIwMjYgYXQg
NjoyOOKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4g
d3JvdGU6DQo+PiANCj4+IEhpIE15a29sYSwNCj4+IA0KPj4gU29ycnkgZm9yIHRoZSBkZWxheSB0
byByZXZpZXcgdGhpcyBzZXJpZS4NCj4+IA0KPj4+IE9uIDI3IEF1ZyAyMDI2LCBhdCAxNjozMSwg
TXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEZy
b206IE1pcmVsYSBTaW1vbm92aWMgPG1pcmVsYS5zaW1vbm92aWNAYWdnaW9zLmNvbT4NCj4+PiAN
Cj4+PiBTeXN0ZW0gc3VzcGVuZCBtYXkgbGVhZCB0byBhIHN0YXRlIHdoZXJlIEdJQyB3b3VsZCBi
ZSBwb3dlcmVkIGRvd24uDQo+Pj4gVGhlcmVmb3JlLCBYZW4gc2hvdWxkIHNhdmUvcmVzdG9yZSB0
aGUgY29udGV4dCBvZiBHSUMgb24gc3VzcGVuZC9yZXN1bWUuDQo+Pj4gDQo+Pj4gTm90ZSB0aGF0
IHRoZSBjb250ZXh0IGNvbnNpc3RzIG9mIHN0YXRlcyBvZiByZWdpc3RlcnMgd2hpY2ggYXJlDQo+
Pj4gY29udHJvbGxlZCBieSB0aGUgaHlwZXJ2aXNvci4gT3RoZXIgR0lDIHJlZ2lzdGVycyB3aGlj
aCBhcmUgYWNjZXNzaWJsZQ0KPj4+IGJ5IGd1ZXN0cyBhcmUgc2F2ZWQvcmVzdG9yZWQgb24gY29u
dGV4dCBzd2l0Y2guDQo+Pj4gDQo+Pj4gVHJhbnNpZW50IHBoeXNpY2FsIFNHSSBwZW5kaW5nIHN0
YXRlIChHSUNEX0NQRU5EU0dJUm4vR0lDRF9TUEVORFNHSVJuKQ0KPj4+IGlzIGludGVudGlvbmFs
bHkgZXhjbHVkZWQuIENQVS1pbnRlcmZhY2UgYWN0aXZlLXByaW9yaXR5IHN0YXRlIGlzIGFsc28N
Cj4+PiBub3QgcmVzdG9yZWQgYWNyb3NzIHN1c3BlbmQvcmVzdW1lLiBYZW4gcmVhY2hlcyB0aGUg
ZmluYWwgc3VzcGVuZCBwYXRoDQo+Pj4gYXQgYSBxdWllc2NlbnQgcG9pbnQsIHNvIHRoZXJlIGlz
IG5vIGFjdGl2ZS1wcmlvcml0eSBleGVjdXRpb24gY29udGV4dA0KPj4+IHRvIHJlcGxheSBhZnRl
ciByZXN1bWUuIEVuZm9yY2UgdGhpcyB3aXRoIGEgcnVudGltZSBjaGVjayBhZnRlcg0KPj4+IGRp
c2FibGluZyB0aGUgQ1BVIGludGVyZmFjZTogaWYgYW55IGltcGxlbWVudGVkIEdJQ0NfQVBSbiB3
b3JkIGlzIHN0aWxsDQo+Pj4gbm9uLXplcm8sIHJlc3RvcmUgR0lDQ19DVExSIGFuZCBhYm9ydCBz
dXNwZW5kIHdpdGggLUVCVVNZLg0KPj4gDQo+PiBZb3UgbWVudGlvbiBTR0kgcGVuZGluZyBzdGF0
ZSBidXQgeW91IGRvIG5vdCBzYXkgd2hhdCB3b3VsZCBoYXBwZW4gZm9yIFBQSS9TUEkNCj4+IHBl
bmRpbmcgc3RhdGUsIGFuZCB0aGUgcGF0Y2ggZG9lcyBub3QgbG9vayBhdCBvciBzYXZlL3Jlc3Rv
cmUgR0lDRF9JU1BFTkRSLg0KPj4gDQo+PiBDYW4geW91IGNsYXJpZnkgd2hhdCBpcyBleHBlY3Rl
ZCBmb3IgdGhvc2U/DQo+IA0KPiBUaGlzIHBhdGNoIHdhcyBvcmlnaW5hbGx5IGJhc2VkIG9uIHRo
ZSBMaW51eCBHSUN2MiBzdXNwZW5kL3Jlc3VtZQ0KPiBjb2RlLCB3aGljaCBhbHNvIGRvZXMgbm90
IHNhdmUgUFBJL1NQSSBwZW5kaW5nIHN0YXRlLiBUaGUgY29tbWVudA0KPiBhYm92ZSBnaWNfZGlz
dF9yZXN0b3JlKCkgZXhwbGFpbnMgdGhhdCBsZXZlbCBpbnRlcnJ1cHRzIHN0aWxsDQo+IGFzc2Vy
dGVkIGFmdGVyIHJlc3VtZSB3aWxsIGJlIGhhbmRsZWQsIHdoaWxlIGVkZ2UgZXZlbnRzIGR1cmlu
Zw0KPiBzdXNwZW5kIG5lZWQgdG8gYmUgaGFuZGxlZCBieSB0aGUgcGxhdGZvcm0tc3BlY2lmaWMg
d2FrZXVwDQo+IG1lY2hhbmlzbS4NCj4gDQo+IFNhdmluZyBHSUNEX0lTUEVORFIgd291bGQgcHJl
c2VydmUgdGhlIHBlbmRpbmcgc3RhdGUgYXQgdGhlIHRpbWUgb2YNCj4gZWFjaCByZWFkLiBIb3dl
dmVyLCBhbiBpbnRlcnJ1cHQgY291bGQgYmVjb21lIHBlbmRpbmcgYWZ0ZXIgdGhhdA0KPiByZWFk
IGFuZCBiZWZvcmUgdGhlIEdJQyBsb3NlcyBwb3dlci4gU2F2aW5nIHBlbmRpbmcgc3RhdGUgYWxv
bmUNCj4gdGhlcmVmb3JlIGRvZXMgbm90IGNvdmVyIHRoZSB3aG9sZSBzdXNwZW5kIHRyYW5zaXRp
b24uDQo+IA0KPiBUaGUgYXNzdW1wdGlvbiBoZXJlIGlzIHRoYXQgZGV2aWNlIGRyaXZlcnMgaGF2
ZSBzdG9wcGVkIG5vcm1hbCBJL08NCj4gYW5kIHF1aWVzY2VkIG5vbi13YWtldXAgaW50ZXJydXB0
IHNvdXJjZXMgYmVmb3JlIFhlbiBzdXNwZW5kcyB0aGUNCj4gR0lDLiBFYXJsaWVyIGV2ZW50cyBt
dXN0IGFscmVhZHkgaGF2ZSBiZWVuIGhhbmRsZWQsIG9yIHRoZWlyIHN0YXRlDQo+IG11c3QgYmUg
cHJlc2VydmVkIG91dHNpZGUgdGhlIEdJQy4gT25seSBjb25maWd1cmVkIHdha2V1cCBzb3VyY2Vz
DQo+IGFyZSBleHBlY3RlZCB0byBnZW5lcmF0ZSBuZXcgZXZlbnRzIGF0IHRoaXMgcG9pbnQuDQo+
IA0KPiBXZSByZWx5IG9uIHRoZSBwbGF0Zm9ybSB3YWtldXAgbWVjaGFuaXNtIHRocm91Z2hvdXQg
c3VzcGVuZCBlbnRyeQ0KPiBhbmQgc2xlZXAuIElmIHRoZSBHSUMgbG9zZXMgcG93ZXIsIHRoaXMg
bWVjaGFuaXNtIG11c3QgY2FwdHVyZQ0KPiB3YWtldXAgZXZlbnRzIG91dHNpZGUgdGhlIEdJQyBh
bmQga2VlcCB0aGVtIG9ic2VydmFibGUgYWZ0ZXINCj4gcmVzdW1lLg0KPiANCj4gTm90IHNhdmlu
ZyBwZW5kaW5nIHN0YXRlIGRlcGVuZHMgb24gdGhlc2UgYXNzdW1wdGlvbnMuIFRoZSByYWNlDQo+
IGFmdGVyIGEgcmVnaXN0ZXIgcmVhZCBkb2VzIG5vdCwgYnkgaXRzZWxmLCBqdXN0aWZ5IGxvc2lu
ZyBhbiBldmVudA0KPiB0aGF0IGlzIGFscmVhZHkgcGVuZGluZy4NCg0KSSB0aGluayB0aGlzIHdv
dWxkIGRlc2VydmUgYSBiaXQgbW9yZSBleHBsYW5hdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UN
CmFuZCBtYXliZSBhIGNvbW1lbnQgaW4gdGhlIGNvZGUgc28gdGhlIG5leHQgb25lIGRvZXMgbm90
IHdvbmRlciBpZg0Kc29tZXRoaW5nIGlzIG5lZWRlZCBoZXJlIG9yIG5vdCBhbmQgd2h5Lg0KDQo+
IC0tLQ0KPiANCj4gV2hpbGUgY2hlY2tpbmcgdGhlIHBlbmRpbmctc3RhdGUgcXVlc3Rpb24sIEkg
YWxzbyBub3RpY2VkIGEgcmVsYXRlZA0KPiBpc3N1ZSB3aXRoIGRpc2FibGluZyB0aGUgRGlzdHJp
YnV0b3IgZHVyaW5nIHN1c3BlbmQgZW50cnkuDQo+IA0KPiBNeSBlYXJsaWVyIHJlYXNvbmluZyBy
ZWxpZWQgb24gdGhlIERpc3RyaWJ1dG9yIGJlaW5nIHBvd2VyZWQgZG93bg0KPiBkdXJpbmcgc3lz
dGVtIHN1c3BlbmQuIE5vdCBldmVyeSBwbGF0Zm9ybSBpcyByZXF1aXJlZCB0byBmb2xsb3cNCj4g
QlNBLg0KPiANCj4gUFNDSSByZXF1aXJlcyB1cyB0byBzYXZlIHRoZSBzdGF0ZSB0aGF0IGNvdWxk
IGJlIGxvc3QuIFNlY3Rpb24gNi44DQo+IGV4cGxpY2l0bHkgZGlzY3Vzc2VzIERpc3RyaWJ1dG9y
IHBvd2VyLWRvd24gYXMgYSBmZWF0dXJlIG9mIHNvbWUNCj4gc3lzdGVtcy4gVGhpcyBkb2VzIG5v
dCByZXF1aXJlIFhlbiB0byBkaXNhYmxlIGl0cyBpbnRlcnJ1cHQgZ3JvdXANCj4gYmVmb3JlIGNh
bGxpbmcgU1lTVEVNX1NVU1BFTkQuDQo+IA0KPiBUaGUgR0lDdjIgcHNldWRvY29kZSBpbiBzZWN0
aW9uIDMuNy4yIHNob3dzIHRoYXQgaXJxX3dha2UgYW5kDQo+IGZpcV93YWtlIGRlcGVuZCBvbiB0
aGUgRGlzdHJpYnV0b3IgZ3JvdXAgZW5hYmxlcywgYnV0IG5vdCBvbiB0aGUNCj4gQ1BVIGludGVy
ZmFjZSBncm91cCBlbmFibGVzLiBDbGVhcmluZyB0aGUgZ3JvdXAgZW5hYmxlIGluDQo+IEdJQ0Rf
Q1RMUiBjYW4gdGhlcmVmb3JlIGJsb2NrIHRoYXQgZ3JvdXAncyB3YWtldXAgcGF0aCBvbiBhDQo+
IHBsYXRmb3JtIHRoYXQgdXNlcyB0aGVzZSBzaWduYWxzLg0KPiANCj4gSSB0aGVyZWZvcmUgcHJv
cG9zZSBsZWF2aW5nIHRoZSBEaXN0cmlidXRvciBncm91cCBlbmFibGVkIGR1cmluZw0KPiBzdXNw
ZW5kIGVudHJ5LCB3aGlsZSBzdGlsbCBzYXZpbmcgaXRzIGNvbmZpZ3VyYXRpb24gaW4gY2FzZSBp
dA0KPiBsb3NlcyBwb3dlci4gVGhlIHBsYXRmb3JtIHdvdWxkIGhhbmRsZSBhbnkgZnVydGhlciBz
aHV0ZG93biBhbmQNCj4gdGhlIHJlcXVpcmVkIHdha2V1cCBjb25maWd1cmF0aW9uLiBUaGUgRGlz
dHJpYnV0b3Igd291bGQgc3RpbGwNCj4gYmUgZGlzYWJsZWQgd2hpbGUgcmVzdG9yaW5nIGl0cyBy
ZWdpc3RlcnMgb24gcmVzdW1lLg0KPiANCj4gTGludXggYWxzbyBsZWF2ZXMgdGhlIEdJQ3YyIENQ
VSBpbnRlcmZhY2UgZW5hYmxlZCBiZWZvcmUgdGhlIFBTQ0kNCj4gY2FsbC4gT3VyIGVhcmx5IGdp
Y3YyX2NwdV9kaXNhYmxlKCkgaXMgYW5vdGhlciBkaWZmZXJlbmNlOiBpdCBjYW4NCj4gaGlkZSB0
aGF0IGdyb3VwJ3MgaW50ZXJydXB0cyBmcm9tIFRGLUEncyBlYXJseSBJU1JfRUwxIGNoZWNrLg0K
PiBJIHByb3Bvc2UgbGVhdmluZyB0aGF0IHNodXRkb3duIHRvIGZpcm13YXJlIGFzIHdlbGwuDQoN
ClllcyB0aGF0IHdvdWxkIG1ha2Ugc2Vuc2UuDQpJIHdpbGwgbGV0IHlvdSBkbyB0aGF0IG9uIG5l
eHQgdmVyc2lvbiBvbmNlIGkgd2lsbCBiZSBkb25lIHdpdGggdGhpcw0KdmVyc2lvbiBvZiB0aGUg
c2VyaWUuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBNeWtv
bGENCg0KDQo=

