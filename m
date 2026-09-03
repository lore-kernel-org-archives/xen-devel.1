Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231FBC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 09:21:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406598.1639814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x23cp-0001DW-8K; Thu, 03 Sep 2026 09:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406598.1639814; Thu, 03 Sep 2026 09:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x23cp-0001DP-5c; Thu, 03 Sep 2026 09:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1406598;
 Thu, 03 Sep 2026 09:20:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x23cn-0001D5-8e
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:20:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x23cm-005cJw-LY
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:20:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a993be6-8faa-0a2a0a5109dd-0a2a4504e442-46
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 11:20:48 +0200
Received: from [52.101.84.33]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a993bef-b57f-0a2a45040019-3465542180bb-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 11:20:47 +0200
Received: from PAZP264CA0120.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::19)
 by DU2PR08MB10158.eurprd08.prod.outlook.com (2603:10a6:10:46d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 09:20:44 +0000
Received: from MAD0EPF000008AA.eurprd04.prod.outlook.com
 (2603:10a6:102:1ef:cafe::5f) by PAZP264CA0120.outlook.office365.com
 (2603:10a6:102:1ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 09:20:44 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008AA.mail.protection.outlook.com (10.167.241.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 09:20:43 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU4PR08MB11030.eurprd08.prod.outlook.com (2603:10a6:10:576::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 09:20:10 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 09:20:10 +0000
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
 b=Fxtfd1xABnQdOirXxSQtzmz5mmyEgKMu9Fg6y0n2zyeIqx+D/S8EZkH5o4tom+3NSfDiwxSR9ZuJAkyMIoHEQxgx6fnboVi40HfImla9uniuTeokAGVnm0GonGNQsrAxfRjQPRZ4rV8ZXdrsFlLr+bS42Jd/lh+hNpikuRLC9/HMtGbruGARTe0kvEhEv3ZsVRIQ7+v2lfN/NNZ8AhdSGtwDuVhLJOD2EATotMeleZrP8REtnuo8UtruBZhLmCWADU9O/rryD3tOm+oceioNvIuehb+vrIWujtWXQXvRuAxu2umif0crjwhu/gRXASc5eCulpFcX7Z4sMPB4yDBpNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hHuL4I2oFm8NvTfq0T2CtO+nJ4iac649hs93dOGMrY=;
 b=umIGJNP15wpWQvvTsf7hmznX3q0vrgeosGaFPTrZKpjFssvSDwiKFaQ+ewZu/GpWktjnsG0Xek4LxFTNmfMmDEYp/H1kFjq69CHfVSEuC4LKYYyd1QelEQ2Y1k+pMKuHFPfVThiZR/NzV/KRB/ftN5n0TgclFFgJVa/mSVnOCMBbXR3HEv790ycuWoZNXcnysUD4st2TI7xX8LTwvaxzpOoe6TwruDDCXq6H22PhZHCA5XtYDuhVkOqjGQwf5ytFW+Qz88SGoBXXUwRoZkz0rdaOL1tMAAvoWApa7DMroKLRhh3eIOGor6WtWEZ7LeJ0C0Ot3K7vRf0YT0msteOh4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hHuL4I2oFm8NvTfq0T2CtO+nJ4iac649hs93dOGMrY=;
 b=GoCH1di3DLfm5JIDhxeW4GPqKAn1+vO2uZHeYe/rWSlZhIqgnklMqm92gbpTbhypQPtBN6MsWVWDN/n2xID2KJWjRWF9jRWTuD1dgYZ6l1/EzL+S/IGQJTuT3JwQpyfhcXoED0dEv72Tjf9kARRZrbZKtYSnGyCxwSNCaH6qgv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ok9ioLAQbeLQX7SbXtnpGYSGVg8GsquRl3it6/4OJdQPK7sypdMKvBYRnW7MKIutvsMYUEC/Yc6C/Hv9fMsxxW7WQyXGkQIfoBPq4kLIq74iaXtmyuB55PLP58cqWqEnFPgrRQ6xnLnsnDx/P3lbc3R1mR7KPuIGQDT/DAAsRHhYYQXDNjGVBPJb6YjxdXhamM5TA08kSnTOO6iRKHBrXtwOJSkEPrrA5b9vEYFGT3PSodRsIrzQ7Ymtg2n18UOO2FFU7R6AYbCKOB6jHKfCEYAnu1aYMpZQKxUx/hJhe+4w+cPa8isyMA7H00O1c6slEJORmFs6Fe1INkfB8mNk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hHuL4I2oFm8NvTfq0T2CtO+nJ4iac649hs93dOGMrY=;
 b=WY+Y22XLq4hQF4rGKjuoWfEqOZ98dFL8/4GEa/W2MHO0xlCmKA0gsknLuDsbCD5FYNkgUY0E5GhU+eDpn19fGwVeydf3fQqPGjfhYWNPSBY6s4qjGrB2T5TVfkuZt2p3Dq1EYxZ/bIE3yWCFqNFXqKSw+hz8ZZXhMedAd4+pp93OQVml4tOrRWL2eNxY7bqZyQ7JGaWCRiFAqN5qbEpCw7+dx04NHnH2aD0B8Ky4K3oj5ry6CulkonGlFcSGtlyrvg+4tTvG8OAZkq+wk3Nxah5pHfOZTh7RJ1pGdisQC9NShb3cpYnhXycqXf+lUuy+FZeCbYG8Yio19xykBfUVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hHuL4I2oFm8NvTfq0T2CtO+nJ4iac649hs93dOGMrY=;
 b=GoCH1di3DLfm5JIDhxeW4GPqKAn1+vO2uZHeYe/rWSlZhIqgnklMqm92gbpTbhypQPtBN6MsWVWDN/n2xID2KJWjRWF9jRWTuD1dgYZ6l1/EzL+S/IGQJTuT3JwQpyfhcXoED0dEv72Tjf9kARRZrbZKtYSnGyCxwSNCaH6qgv0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH 0/5] xen/arm: Fixes and improvements to SMCCC
Thread-Topic: [PATCH 0/5] xen/arm: Fixes and improvements to SMCCC
Thread-Index: AQHdOUMI/reoS+h4I0eq7LCk/pFqt7a8mEKA
Date: Thu, 3 Sep 2026 09:20:10 +0000
Message-ID: <646DE9C5-6708-47B9-A4EE-9111E101A038@arm.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU4PR08MB11030:EE_|MAD0EPF000008AA:EE_|DU2PR08MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc16853-0a11-49d4-01c4-08df099ca179
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|3023799007|10067099003|22082099003|18002099003|11063799006|56012099006|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 pffjMcBtOlpxsIQeNUXXB1TBrgOj0uWHjH+npfC6NdReAcr66A0IJ1sUKSNAGrZW7M56QEIxzjgs0UWGB1iAinkEDrfELDft3BkKfDo+o3QtGpjAqiHn7opMlhv955lRKd0LbNoxBheEx9CGwgUlX9OBJ3CmynnjqJ7tHiYzwn4Dw70KwdB9cAHoNqs2p3XW9KyQ9t98ur7KCnqkYQNg+8+MiVkTW+Sxuz8fhkFHO9ua/K3TEcnukwjOtrNokremzHQATwh3rT6FZOIL2wyK1KJwBiIDHssmGnEHjI2M1WK93xTsALvYmeMCTJj32Mole7VP7vqGijXAL3XmYy+ck1bIjT6odZ9PFuVh9WDQi8bfuUvNS0hzCJrg//lWmB+0ZiOp5pWn8Rw2oI8/m3H4Vghm895z8xAEXoruzl9SwjZN/r/XGFqlAMWztgYG74KwQNtdpXRLDS5ad+uo+8F4tF5rQZWwOQoJN5JUFPmPiKFeHdpJqfKTfJ//MOa5CZ57vrLg/rGSlyx4sUper3c8a6QhVYXoTuNKMn8eSDxeBURJAOZnjKDvmMp8Ovi876nMc33ikJi+WQuw3AWKPEQ7UowH+0xgkTQYwDUZ/tWSWFsdFWkix4OVgw2i9EKuL9elIqZFJdK00KneUL3BQwAWcX/YT6ZVS/6efgy5DhcT3pSzv4/KMs2YENaikTcEXCFgrW4rf1O2qJZZr6NgpzcrTAazht06Kj5McdJw6nRr2sE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A4E18478D9A31D4F8DFE8E44279C6FC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 L84xysjth/eGKeZSuNhfbdu/O2Np5mlZNNAUZHUlDCvYLg5xUuOcHXHntJONycQE9ZIt9qJf+CLS1LiZTuIXThD6+D5mREpuVNfxEjitdh3nH3HswqZgrWQiWO3MhSpA0LzW4mIaYSWL6/vVb1ayLNVtcQOGlu84XQsrAhwYHZVgOsEJ5nBVY5lRWhdOtgTpI1SFhZ2HLkzcdPP8aJLoL2YoV4G5hjwsyKSapF+YrDmQVx05RopjE0CnhRJGioaazlvUVUDQga6kmHVebGBFSNLqVv34rA2g//mBwTAyAy3Ls94vG8F+VKrVwi0vu1DQ3s3e5pvcnTUg3RxQDjpddQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11030
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008AA.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e9bc255-b1d8-491a-1298-08df099c8d64
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|23010399003|1800799024|35042699022|82310400026|36860700016|376014|13003099007|22082099003|18002099003|11063799006|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	JySbLsGICJI1pPTVSZ3WQDfaI8/38d7NqENKY7oekuQIHet/6eeHAfWOJgiQtI0YUpn8Stk2T4mKc4Ie24fBb/+K+5KLKsIJDfZK/m80reAjw3QjUfLzqWCDeiH45OE5kI0igcTbK0A/6odaqEns5h4XOYUgqD3I3UOrYESmVDIerC7wSvTTqb/b6FHPrJ3d9TaJov1YMYdn7GJ0C1yuwyBoXNXdxesUFaDwFrGp3AboKYJksUZNbGMsmNPq5JupuVIFC3w1oK52ylLEZvvkPsxX25SsnbtdiaG6b18d3gIchwkK68YQSiRvlNn9xxwvyVu/ZS1k/J83f757BGoxqlzIMINhjCMZcXPkdpx9VON+vDT2nhoafy0+P1NDntFDb1XsXWigtmXaYmHxwQSHinp9tY4iaLOg+QEGrj7nomt9+8MX+HUcj+O2o69fLhhzV5lWpIZsDmO/PIerctk3Nu8Tg8/c/jBNKoLAW4/SCiWs5RTZxZGJLHpSd39UizBKZFUgtzgVHxSJin5biWdyn5n2N36TVzma2XjYgx71quB3A47O45EftzUZtl0iEm86/a1huBYpLdkfvrfv++5cBntrOeYR/Bqe+jvhfqMILESQe8+kXh6G1bvWJzYDOnCy+zA1zEvHDXMwQUFsOlrLZkjDqO9Ejwfi3Pab9ggvTg4=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(23010399003)(1800799024)(35042699022)(82310400026)(36860700016)(376014)(13003099007)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JFYBHOtIKbcVqCHVtWuPuqAnPfOBpGw+BjMS8E8x9W+91B4vhUxodbqwNF0gYZ5Q7geGDIFT/1TL/z2PF7SSEotwxWXTZsYs6H+Df+d6mVY/wNN7Rd4hcSojjx2SvQ9TmAX0VTm7am1LVu0pn02w7lHOElhybSgDYDUpzwFPZvfgcvaWpAT6oSOgfzyergBXSYzIuPjZuP1d4NNODWvSwa3WdjUxxwgAlZdzJ1xDju8ZtURzQ5uqAFKWKOit1drunuM9He+8CyNqq5mZMg2Qz5XKtET/CsZ3RlF/qEYjwIW8iy6T0ajIuUjlDa9ss8rGS+0pk2xNzHQqZZxhvRi29rsY1anyC2xN1+YN7nj+1Hy3H9CVuTeOP7/5Sx1LAkvirMMiNynBSpoiJOC71+brM9CHFmwprzoOIWZ9C+t6Ti38gLdV3PUBhFzWTIxZFfjF
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:20:43.6911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc16853-0a11-49d4-01c4-08df099ca179
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10158
X-purgate-ID: tlsNG-ebf023/1788427247-528C9B50-9187EE0E/0/0
X-purgate-type: clean
X-purgate-size: 1686

Hi Andrew,

While reviewing those patches i found out that cover letter is saying that =
the serie has 5 patches but then the patches are number out of 6.
Is there a patch missing or something went wrong in the numbering and there=
 is actually on 5 patches ?

Regards
Bertrand

> On 31 Aug 2026, at 14:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> Patch 1 is a bugfix for the issue reported by Jan Setje-Eilers.  It needs
> backporting to Xen 4.22.
>=20
> Everything else is because I couldn't bear to leave the code generation i=
n
> such a bad state.
>=20
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/280540979=
0
>=20
> Andrew Cooper (5):
>  xen/arm: Fix evaluation of parameters for SMCCC calls
>  xen/arm: Introduce arm_smccc_guest_smc()
>  xen/arm: Clean up 32bit arm_smccc_1_1_smc()
>  xen/arm: Rewrite arm_smccc_smc() for arm64
>  xen/arm: Rewrite arm_smccc_*() to return by value
>=20
> xen/arch/arm/arm64/smc.S                    |  16 --
> xen/arch/arm/cpuerrata.c                    |  18 +-
> xen/arch/arm/firmware/scmi-smc.c            |  16 +-
> xen/arch/arm/include/asm/smccc.h            | 241 +++++++++++---------
> xen/arch/arm/platforms/exynos5.c            |   2 +-
> xen/arch/arm/platforms/imx8m.c              |  16 +-
> xen/arch/arm/platforms/imx8qm.c             |  16 +-
> xen/arch/arm/platforms/seattle.c            |   4 +-
> xen/arch/arm/platforms/xilinx-zynqmp-eemi.c |  17 +-
> xen/arch/arm/psci.c                         |  17 +-
> xen/arch/arm/traps.c                        |   4 +-
> 11 files changed, 165 insertions(+), 202 deletions(-)
>=20
> --=20
> 2.39.5
>=20


