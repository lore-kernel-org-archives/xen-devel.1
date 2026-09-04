Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3D1C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 12:09:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408375.1640993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Sj0-0006si-T2; Fri, 04 Sep 2026 12:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408375.1640993; Fri, 04 Sep 2026 12:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Sj0-0006sb-Pw; Fri, 04 Sep 2026 12:08:54 +0000
Received: by outflank-mailman (input) for mailman id 1408375;
 Fri, 04 Sep 2026 12:08:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x2Siz-0006rr-Il
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:08:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Siy-00GQOE-Uv
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:08:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9ab4bf-bab6-0a2a0a5309dd-0a2a4504b17e-30
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:08:52 +0200
Received: from [40.107.162.8]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9ab4d4-b57f-0a2a45040019-286ba2088e79-4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:08:52 +0200
Received: from AS4P195CA0046.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::27)
 by AM8PR08MB5555.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Fri, 4 Sep 2026
 12:08:49 +0000
Received: from AMS0EPF0000056A.eurprd02.prod.outlook.com
 (2603:10a6:20b:65a:cafe::8a) by AS4P195CA0046.outlook.office365.com
 (2603:10a6:20b:65a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 12:08:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000056A.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 12:08:48 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB9050.eurprd08.prod.outlook.com (2603:10a6:10:47a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 12:08:14 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 12:08:14 +0000
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
 b=TdURaDGFh93m/rHFZy22EfCifIPOmomEpZxXo0yKCxCHL7/l59TPUZOX9WY98gpGVZuOfofVdBHF9DUGI68si3Kc6Kmnx9BfzRrBE/tVp1KMuQls6oHGcNyCsjtw1od3CHYT9yZmWRB5cHc8J6bicu8zDw9VatKln+1ptPYT0/GjY1L6DFqyoi0vb9y2L/HkaZLBCoBtKeJ5OQkgKM55X7JA70F5tzOhBusVL4acOHaNqldsuJk22cLYkyvzu6wi/BY7bU/c7mK39TPbBqpAn75/Y0/sjDrhmWQwGkD1YqoLlDIUMvB1S2PqOkW35lGZf2wj4S1skhc2QxpN0r1JwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxLwEAMhmo17uxWlJyGZKHqeeRrXoOvc5qWiUbbbdSg=;
 b=ybCSS4mFtQAq2Lu86VRLsWx0EbbL0sXXvNQuEYEpH/uw4o6/ZPS1TYoD+KmthuKdTfbNdhMFtUQ3pOwRC281fjgbT54pvKh93auaYbmvF/L+XYWHV9JU4l0WAgGCvyNFEzhcWDyLQYB9qVS13wsAcDCnfC0NQ3wBjhlc4WH3lAqzATUp0tU5rqkOR+EtxvWwsZDvoMdPl0WH0ldJN94gvUHADjmPA/orABQ3baWXu0VNE8fLwpD7opz/12DVgkltexrEY7k5Y9LtAFCYMl8H22Fcsytx/s1m3hxFf0gYrVxR3rxsp/tmHKe5ZbIT7A/5xIREZeqRuyL7XeH2/RIj0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxLwEAMhmo17uxWlJyGZKHqeeRrXoOvc5qWiUbbbdSg=;
 b=MDdcWRo6Fhgkci/ATh7n/WVXgLHyHitV4mFp46JxPwjNrxbQLA4oP7J/QMrQFYmmL4DPS2jBKVGaWxoQh2tFzI+UWWMHc+NblpG4dRCc3usjqCSONBan84on+95A1cwjgmrIvJbqNN6oxSpY3a9vmMT1YhxSYuaf2/6y36Fqvk8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPFjYjsbs6Ko8IuJk4t7IB1Lb57hI5FLQ5tyYl/iOokfm6QYIAI7G//5T84QYAuGBDQkU39Zxl/ny0WR0+wDQ+7Ui5+4WBkQaKG3TAIyLGNOJZRItngtlUUAzjvnZldqo/+PDjAnqGOe8v/gb1gX+y3Zx9ie7yfqPndff8V8eZgIGciugomajoZ2Mtl4RoGsxQH48EAUWRi8pCdQl1bCXs022KRW8casRbsJ4RnHh4PyYoOkmn0IGnnt2mYUkcU+u8PvpCfDGFW6mdPjpU3JbrGkOJjWYQ1m1l7jGO/WBguEsfMs7kpP708Nmx6wlTaq9vq1QkdjhKiV73G92RP8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxLwEAMhmo17uxWlJyGZKHqeeRrXoOvc5qWiUbbbdSg=;
 b=RyEZN8duB/GKM3CBYkNiDa0HVe3KsX+7bpXOvm8OVKWqP+JdPGAN3a4GjxuJVF6wzF7ssR8bRk1IcpwlghxqnMYn2a7Ww+Pq525myZu1KYbmcL91OVj8UDAkk1460SgnZ+FHqkT5YoMD8wqpsasSOdrNFyl+8iLi0yH1b1JzJUvYl8RlcmVLPiio5HyvJ45Yx3/dXBuyuiES/voCGk/rvWWkHMHDMIw6AqEpoPeoEVp4fcv7ptLMjVklQMHhyPUJ7r6osbBeSwVBjwp1VyEojPG32gN770PyNdzO43Vd0+YL4X/qtaEUe7K8Mhrkh794l5Y98fZBsxr2/YvAbUsSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxLwEAMhmo17uxWlJyGZKHqeeRrXoOvc5qWiUbbbdSg=;
 b=MDdcWRo6Fhgkci/ATh7n/WVXgLHyHitV4mFp46JxPwjNrxbQLA4oP7J/QMrQFYmmL4DPS2jBKVGaWxoQh2tFzI+UWWMHc+NblpG4dRCc3usjqCSONBan84on+95A1cwjgmrIvJbqNN6oxSpY3a9vmMT1YhxSYuaf2/6y36Fqvk8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH v2 3/5] xen/arm: Clean up 32bit arm_smccc_1_1_smc()
Thread-Topic: [PATCH v2 3/5] xen/arm: Clean up 32bit arm_smccc_1_1_smc()
Thread-Index: AQHdPF5MaImMoDplI0uGAg1xhuIeaLa+U1WA
Date: Fri, 4 Sep 2026 12:08:14 +0000
Message-ID: <EFCD20E1-7F3F-4E1B-910E-7796BE37A437@arm.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
 <20260904111228.3022634-4-andrew.cooper3@citrix.com>
In-Reply-To: <20260904111228.3022634-4-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB9050:EE_|AMS0EPF0000056A:EE_|AM8PR08MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf815f8-0f1a-4bb9-9d54-08df0a7d46d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|4143699003|3023799007|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 z67eRCPy+qPY39U3EcYddm0L/OW8cIqbu9ZX2NfiLWotvP2mMBGvEmPie440yfU99wsyItzZOZuc5SBYF4p97sgSsSLiN4BvfyfwkIWRsEmYS+BT4r3G8ysjuDuHRGu710qc1GxED/0Xo3BHGfsxqy6XQkSJk3OeOe5qUeWVrTAVhgZSWsAL8bd80cuA1+uT2bhWARmV0kjrXD+xDVsyXvlbxw0kfnJMoO2TF5cqLoj8Th+jHHZOl01rUDAbohQPOExzFEpOvbpYkdnv4RSDSPyExtwIEBb9U5A+O3MVkE/aUdk5bKmeOfoCUYVhYVV4Hei/uPaCaPchBTMf8r1XjJNJRssuyRVEpg10sOtIdVrETmUGZWjDrPjK1m6GsLdDCE5HU5oksLRTepPyY+zBuEetzyd2DRbRnZPV3865R74hz/mDe2pvkvW8uxdwYF5fWWh+4/e9nVYNya028nrAfKvYWiY2Mj4zY0x7+3K1NNeCqlBJN/hIvo+aOvaoVANJmweuEFSWk+OV0qhKQEjSHxViMgMLshmdxZxBXk7x1w/CpLo5uyoAQYolBLR6BcBcY9D//8HZsvOT89fTcu3lqXkqX68Egl4oG/pPU1V3DS6sIqTQ91NGwGEHVL0cGlV2YfcAbHXPCQHqRkOdYgFtsSWu/Ftw5GAS/M34BgwcGi4XMNFBNW3/uO22ME+kXR6MRaoDTkWGWiNfrn9e/r5bO4X942OlTAyQOklrp0N3w7M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <537AAFB8F8EB9F4996DE2836601A1DEB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 pSej11UB/OSC0lXSs3u/zVdQLImirEHlOaW8lvPDhq5o1ghE26IKmGukQim0F1hWPt+1rXjEQ3ZwnI+/tzb4UHg09kaSUxYTcD79eHDZCfnz10/Fg5DmKlFLEelm3bUAo+xGt84AFgUbd9o2JmizyzCT1e4VkrhgIxOkheWJiEM2zqY8u92DTkpVTtz3gNEerGPuLrbHoNJaUcmFGZ5eYUIIBkGSbBvphCutbuiZLH6HyLoJit9ris/gnG+cKk9IG5/H2WeAqTlKCul4VjVPpiSzqguXzLdHH2BlVg9nHHJu7F2l5hOGSO2+ZWmLXWcirevmGaCOcdPgnSr1Bnn0Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9050
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000056A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c892eac-5730-4eb8-b0fb-08df0a7d3261
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|35042699022|1800799024|82310400026|36860700016|14060799003|22082099003|18002099003|3023799007|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	H3x2vc4VJ5IfR0jWFqJjjtXhNve2/zJ9cGd7Y8rXjYGaNva5RApygJY/HrUG7nG6GaZhsv71l3nxg4p6Uj4Ng1SDhYDfv4/ywT87s40Ly/W3dHU+N+uiY5TELaUb2vV6xcHpS9G0hh1Iqz9Lf2xDrhJpchvQtS+VvxuQDxoz7/eXW+UlZ2iEYDAQqt5RGmIShNjtGAZxWR6x7CE/dDsWNKIKpbAHPvdcI9uoi7RiSt7NHu1KTXiDdyKhsCwaxIvuJsQ77kBjbaRnmImo/8tUX0+OMgkJY+E/KYypM+APRdLO9IqwEv9KWNeVRiJ+E3g0wQKm2Ha9EzAFX8nFVjqqcO3lwAoIV173FrmSfyCD0X0fuIU0wyFznKqlf9XpIc7XD3hFoa3ty9SDJaMNOudX/GfVCYrZHo9zQ4dAmpEBzEQGpHkS+h3SFD2k1C+QU7pa19/teYEqqCSUdZA31C/IHo/73SFi2UZ8a276WS9ImMaXLuKEJDyh3yYeWRyRPup52XIw/F7IERQXXPvtYPVMH/mSzRcDhnL2IQyZM211LBPmtkQOIv6tiuBYSw5rD5Bl5dEUd04Gk5vDBuOOXgi7rZbPk55oHYJs736lxLSKSJ4weoMp2tsHyjpjmIgMTU14zxsDNBBXrOOisW5yQ6EeNDGzi3AhSW/MCs6zCIhTeJs=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(35042699022)(1800799024)(82310400026)(36860700016)(14060799003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UpBUh/HUwW7/NJclk3Xh4vMi8uQYqQKKG8T+eAvRBidd4RMMYYqdPf95ioRl2JFGVG2MWbOtzBDZyt6g+2qKEK9h5+34c3hgTLtq32TcObi4hq/ZAS3Xmy1/UYgWC4IOpDdi3UZmntngVNM8mx7lO4RNM9nhDVzsJU4wE8rtOqfy6LDohGE4k2QUENuBVCdGjhAv4Es8CH0velAOCOLoyYJG7ktYDjOGLRg67SSiUI1sqFATRv9dQ5hvYkGJjAl7hVAT1meJxkJ5Rn7I1GWiJTdk9apoktUTfRkTY1lkaGk5prO+ANC91tYqf2Sl+07z8v5v4RsEzsM2d6EynpbUyDQW5pdyZFAgkWLk5izvDGfzK6wsuZuPtJvT7iVUZWfqpVW/k6qDaSTsD3mdBdNtD7fr6KXtZmn4Y9rKGaiIwvnVBPIm2fKBQjwNfIOZj9wa
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:08:48.4560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf815f8-0f1a-4bb9-9d54-08df0a7d46d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000056A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5555
X-purgate-ID: tlsNG-ebf023/1788523732-502E4B50-5192CCAF/0/0
X-purgate-type: clean
X-purgate-size: 6009

Hi Andrew,

> On 4 Sep 2026, at 13:12, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> ... before making a related copy of it.
>=20
> * Drop __constraints() so the output parameters are visible in the same b=
lock
>   as they're defined.  Use PASTE() rather than opencoding it.
> * Adust the indentation of trailing \'s for consistency.

Small typo to fix s/Adust/Adjust/

Can be done on commit and retain my R-b

Cheers
Bertrand

> * Drop the newline at the end of the instruction.
> * Indent the if condition correctly.  ___res is always of type
>   arm_smccc_res (declared in __declare_arg_0()), so drop the typeof().
> * Drop arm_smccc_1_0_smc() as it has no users.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
> ---
> xen/arch/arm/include/asm/smccc.h | 45 ++++++++++++++++----------------
> 1 file changed, 22 insertions(+), 23 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index 832157f43734..5fe54013ac83 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -56,6 +56,8 @@
>=20
> #ifndef __ASSEMBLER__
>=20
> +#include <xen/macros.h>
> +
> extern uint32_t smccc_ver;
>=20
> /* Check if this is fast call. */
> @@ -115,24 +117,24 @@ struct arm_smccc_res {
>  * This is manual register scheduling for the asm() statement, and any ot=
her
>  * logic to evaluate may clobber the already-scheduled registers.
>  */
> -#define __declare_arg_0(a0, res)                            \
> -    auto __a0 =3D (uint32_t)(a0);                             \
> -    struct arm_smccc_res    *___res =3D (res);                \
> +#define __declare_arg_0(a0, res)                        \
> +    auto __a0 =3D (uint32_t)(a0);                         \
> +    struct arm_smccc_res    *___res =3D (res);            \
>     register unsigned long  arg0 ASM_REG(0) =3D __a0
>=20
> -#define __declare_arg_1(a0, a1, res)                        \
> -    auto __a1 =3D (a1);                                       \
> -    __declare_arg_0(a0, res);                               \
> +#define __declare_arg_1(a0, a1, res)                    \
> +    auto __a1 =3D (a1);                                   \
> +    __declare_arg_0(a0, res);                           \
>     register auto           arg1 ASM_REG(1) =3D __a1
>=20
> -#define __declare_arg_2(a0, a1, a2, res)                    \
> -    auto __a2 =3D (a2);                                       \
> -    __declare_arg_1(a0, a1, res);                           \
> +#define __declare_arg_2(a0, a1, a2, res)                \
> +    auto __a2 =3D (a2);                                   \
> +    __declare_arg_1(a0, a1, res);                       \
>     register auto           arg2 ASM_REG(2) =3D __a2
>=20
> -#define __declare_arg_3(a0, a1, a2, a3, res)                \
> -    auto __a3 =3D (a3);                                       \
> -    __declare_arg_2(a0, a1, a2, res);                       \
> +#define __declare_arg_3(a0, a1, a2, a3, res)            \
> +    auto __a3 =3D (a3);                                   \
> +    __declare_arg_2(a0, a1, a2, res);                   \
>     register auto           arg3 ASM_REG(3) =3D __a3
>=20
> #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
> @@ -158,12 +160,6 @@ struct arm_smccc_res {
> #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
> #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
>=20
> -#define ___constraints(count)                       \
> -    : "=3Dr" (r0), "=3Dr" (r1), "=3Dr" (r2), "=3Dr" (r3)     \
> -    : __constraint_read_ ## count                   \
> -    : "memory"
> -#define __constraints(count)    ___constraints(count)
> -
> /*
>  * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
>  *
> @@ -189,10 +185,14 @@ struct arm_smccc_res {
>         register unsigned long r2 ASM_REG(2);                   \
>         register unsigned long r3 ASM_REG(3);                   \
>         __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
> -        asm volatile("smc #0\n"                                 \
> -                     __constraints(__count_args(__VA_ARGS__))); \
> +        asm volatile (                                          \
> +            "smc #0"                                            \
> +            : "=3Dr" (r0), "=3Dr" (r1), "=3Dr" (r2), "=3Dr" (r3)        =
\
> +            : PASTE(__constraint_read_,                         \
> +                    __count_args(__VA_ARGS__))                  \
> +            : "memory" );                                       \
>         if ( ___res )                                           \
> -        *___res =3D (typeof(*___res)){r0, r1, r2, r3};            \
> +            *___res =3D (struct arm_smccc_res){ r0, r1, r2, r3 }; \
>     } while ( 0 )
>=20
> /*
> @@ -200,7 +200,6 @@ struct arm_smccc_res {
>  * v1.1.
>  */
> #ifdef CONFIG_ARM_32
> -#define arm_smccc_1_0_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
> #define arm_smccc_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
>=20
> /* Make an SMCCC v1.1 compliant SMC call with guest register state. */
> @@ -217,7 +216,7 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
>     regs->r3 =3D res.a3;
> }
>=20
> -#else
> +#else /* CONFIG_ARM_64 */
>=20
> void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
>                          register_t a3, register_t a4, register_t a5,
> --=20
> 2.39.5
>=20


