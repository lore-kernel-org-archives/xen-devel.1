Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF79DC624D7
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 10:27:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406691.1639858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24f1-00037r-P5; Thu, 03 Sep 2026 10:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406691.1639858; Thu, 03 Sep 2026 10:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24f1-00037k-LA; Thu, 03 Sep 2026 10:27:11 +0000
Received: by outflank-mailman (input) for mailman id 1406691;
 Thu, 03 Sep 2026 10:27:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x24ez-00037d-R8
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:27:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x24ez-001xje-7v
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:27:09 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a994b65-2eae-0a2a0a5409dd-0a2a4509988e-40
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:27:08 +0200
Received: from [52.101.83.27]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a994b7b-be1a-0a2a45090019-3465531b798d-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:27:08 +0200
Received: from AS4P190CA0043.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::14)
 by PA6PR08MB10624.eurprd08.prod.outlook.com (2603:10a6:102:3d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 10:27:04 +0000
Received: from CPH1EPF0000051B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::66) by AS4P190CA0043.outlook.office365.com
 (2603:10a6:20b:5d1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 10:27:04 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF0000051B.mail.protection.outlook.com (10.167.241.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 10:27:03 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GVXPR08MB11495.eurprd08.prod.outlook.com (2603:10a6:150:2e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 10:26:30 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 10:26:29 +0000
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
 b=kDq1RG7KDA7RYX9+81s2PEsWFIZCrMcwW27R59H5qYwhmmq8Q1Bdf6n/kJvd5GFd2/5tgUtIqL/zAAU7UCodwrdolUFPzLfhmdlfiZ4I8xYWzo6p4bRRokvwXezJuoNcD19BfZXbVw45aEuLQ89+KeP6cY1Kd49IyOuLPqkqRzYLSu1twVS2AJAroZVZDhfzpKuHLyOVX9yJNbcryXtCk7KYrhY+6Ewl9Akac18V99v+uZGkpwR8+qxn40HaUOZMmOCfIFYfvlm//MSzA+rWUX1mVUeI8o/CjzBQtJe+eSs2T54DWS3KSsB1g2ABjZKQuR5dtigpriPamZnnOwn7cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCcZVbHCGvMx16VOmquTT6JQ1l4wBT3+WxQqwWRIYa8=;
 b=umXa05lxjaznk1lH+wQG8Qn+KvHqewQ455cSocDP802pdkPVGsJulzEQyMK/jK7A6L1WeaN0GCUQcMGqaOM17JozCwUG30fnQY4TuYd2uv/slWmV+1nlSWdXIk9/h+aE1/LoF3uTBe9v0U96Kw4KD0Oy6uFAXnMyM5f0ZjEoFfQWtldgwGBvn/Ol3bKlT5625Fv3/uAXZNkR4TeZYNuvOwQsW1lD25Adnu/F8TaYIHeMb2R3Xl+f9NdfciA+w/1WSp9QRRCUCPXNRb11+T/cJ6rxworULl4s1JZm4Zn7VQ8rwwk3CNDaW/9mTiYZp1Qs1rkjeHHFgo/W7PGj6I2ozA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCcZVbHCGvMx16VOmquTT6JQ1l4wBT3+WxQqwWRIYa8=;
 b=fPTT2pYt+XKHvsCLLZjZ3Sn6j4Lsa+yRmYPKM9AfZMyKy3HfMyu+8OwZoWa48ecOg9gi2MPG2DUUIXxsmL0oHyzjc24LrJhXFGq8/+P7axvTqbVlFVDHT47lTq6Ljf+n2CX7Pq9NWAKwA5cx6Tr62G3khQ154q50m6zZHJHqKYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYPhpGJ+A5g6Ob6susJuQDINQj+yD7ZU2ZIBdK3g2hlLISsRCx6kd1rLM3PBw2PpD2DPmFrL0f8GpDdWpxb9Nzn+LnjjKTTTe12E8v/dBcIAQF41/q6IgvsS/xWe6lRuOvvVHuQBFWFgyWFS21nERZoEi6dFfS2WeezpcaDz2/tus9kIGW1pEAeTrHDmIcLqScPW8rQGxb10zM/oMHuBfXe61Rv32n5+F8IXHwk7RgTzEJRVkNXbjXDp/k7z9leT1YjWe1X7+kgow4HrhNyCcHSlMejcisQDlLvkSBVoFnMNarOwfRsFZcyjWyTS9Jw8q28XmTLAKEErjThqvsk1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCcZVbHCGvMx16VOmquTT6JQ1l4wBT3+WxQqwWRIYa8=;
 b=u8QRXuzeVfVpMwsW4dOzYLCUqJGK9N4TUWHCgICfTJRu91X8HAs8oGuchvh+dCHN6D6GQPKHDWxusyfUBxB4lqGAsrHDszraLHf+p5xZIu8ERxVX+LDADph6KDHGuvZ9x0YehNYjIiyesv67ih2ob9O8Z6izz/DtdszRdlLfIC5Utq6TZx13z9LwUdgx7cni5ASD62my9d1Lu8gycj7zsy7HxbsW4u2b7Yvsund7p5GQad4ZEJURWSYZ+XqL16yqNcA1KEFFmeGb3jeo/6HbePvEw6YIe1CihK35MCcf30gXxmilMsZCPwWvyrMuiqwJUC5Iz+l1bin2zY8DQKlGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCcZVbHCGvMx16VOmquTT6JQ1l4wBT3+WxQqwWRIYa8=;
 b=fPTT2pYt+XKHvsCLLZjZ3Sn6j4Lsa+yRmYPKM9AfZMyKy3HfMyu+8OwZoWa48ecOg9gi2MPG2DUUIXxsmL0oHyzjc24LrJhXFGq8/+P7axvTqbVlFVDHT47lTq6Ljf+n2CX7Pq9NWAKwA5cx6Tr62G3khQ154q50m6zZHJHqKYI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH 0/5] xen/arm: Fixes and improvements to SMCCC
Thread-Topic: [PATCH 0/5] xen/arm: Fixes and improvements to SMCCC
Thread-Index: AQHdOUMI/reoS+h4I0eq7LCk/pFqt7a8mEKAgAAEdoCAAA4RAA==
Date: Thu, 3 Sep 2026 10:26:29 +0000
Message-ID: <1EC30A21-2C04-487E-982A-5A404E86AA3F@arm.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
 <646DE9C5-6708-47B9-A4EE-9111E101A038@arm.com>
 <b796e561-e8ba-4911-b765-3f2fbf46842e@citrix.com>
In-Reply-To: <b796e561-e8ba-4911-b765-3f2fbf46842e@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GVXPR08MB11495:EE_|CPH1EPF0000051B:EE_|PA6PR08MB10624:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b3b43d1-d63c-4ed9-f459-08df09a5e56e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 dMFY8KTvXV238q94svyuD6k95YC3h1Dz0hTlmc4SL4iMjJ4Qe002wxL7ZXGeYiCPvfx0YjojNULOZP8YZ/H16vw2YShJ3mWLeC4l2qj/XcZ1nbQniWtMjHscbD7/oNwtzvppZ1usxPbLsqDxNvFe3GZlVmzLBC//0Lwj/Jx/JX7Wkv60AE8w/7HTCtiwbTuNlhKEVb+CQxABN/jrs8Gzv1YpqldZ944q/qbrJRBJZEXGxYh6y5/al+JaUTxmu17Xg5DizYoUgvhl3cDPBd3+zqJAfh06YNWThGhS08dABvpnhbyUaGNkrABAh92h+UspceEqYqWlDJx4BJ7eRwZcEoEYPkHsBM/iETfgqXPITM8D32pe8tbi+U4tKkp9iIDaFf2VQzfs021FEBgflLkwauhlnGtNyx+RWMUO+igTnLoPsu0eT0jZ5HBd+p1Boy6lpDJu8KkcPaoVdEhYtFqA+2FfkdPO2mPsaFQQQ6XoDFOl+8XehAJbMSbI982jZPvvvmolLImLBiYA3ALxNHRZGJl9XAtOxx4bKvbopOE04g2Tv1PtBK2lIGEFZB5qBw5eSYRODy38+E6Q/NF5xGZq7BL8nNoLnBUGgrIo/zikgp2HiKe831g8sXETqapwynGfvbPD472o3t4aoS/hMAhn5t9K79oTPBz6h49SB77yOMM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE9D8450797D3A46ACE8D1354E391077@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 kU2lQtMBO1kHzDaYwi0pqGvNjZczGHAumonhUFdR6EHNPrDwR38raOGlVQNRipJbvfDLaSEpAM5rNyt5oEnztkMEXwrKCAvt22tT69ec2/dKGIIsMQ2j7oh4HTa6u8p/gwDJNFHnyWR4F23TiyZolN9M24xOcUV+xrk52z4lgXHVnbpyUTqSQlpe8NS5SH5jDnG/hoBK1lFJ4/gmykSYm0fr6M+d5/X+fk4pe1b0EiGptJxPty1DKhuXt3dhKTBKdJmUFV/hf3CSXkbUJMREctAs4cJ+kwewostadCXk0RSca06I7RqO671LX1rfh7ZMiwrDshCqUn0PgTu23JSfcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11495
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF0000051B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff6c9548-151f-40b2-6ee4-08df09a5d131
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|35042699022|1800799024|14060799003|23010399003|10067099003|11063799006|56012099006|4143699003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/N8jKi3fH2Ls7xPLPcDMlTGDnSd+XDyAD6CyYAufMgxl1s6Cy8RmZ3j7UymDkwkkcf38IznQg04MYshwCvJTJQ3MAd6m1pxp7LhfNVQTTkKYpDO0IjWRGLB1LFXnbheVNxyHa4NIzP/vXTYTVX/k+JB5e9U1rOaWZQ/UfpTlQpnRIWpuGyUzi0ebt3JRg4Rj8MMqr1z5wUbmYYTf1D6HxJiib6vutxAJSuwtx7293jslYdEEBUJWQIRqzHmvGZRPyE5Chv1kzGImF9DQu7tJAWPqtxGU/PUyVDACoLoIUxjyeKBZOgrGzSCfIbsQSgUdqHzgzMRwNg+Kefb3FNYeyBswV0LBFuiWz/+g+tHXAiD+qD56rpx4Eezsh0IRO2qfc8dUMhMeui/tBRbol4bf8z0Dfb0RqYPlnfFPfb5qt66HRE9JL3cseKqlHpVuoZb+9wouvMhwyYcCFCwCQZXf3tI96CjoJzPEso7x6+A3ftgEO5F7rD3SfAiNxtloLguMJBeeM522ZdmortBlZbtdn1cHpCH16xw8IxN17Oor8nL0QuOcfCsXVe6CCM+60lBaPFykJEhvRQVBOPhSuNdgbGgS/3CQWh63uIb1n8ZmSEIln30HRCzFDIhv+iHW6GJe
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(35042699022)(1800799024)(14060799003)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9ACfyQgxWivHPN12tSAwN+ocG0iuDVScRRWwM2kLp/0rzgrAza3pbHAPhI8xyzWeXNAq+DXWljIDOrSf7YtGYfr0ETWy+5JLRs73TMmDlHq91B8Pnwl7VZs5bfMNvArl2stQHlb4XTYMKRHd2EGtwNi1rUrOWQzL6iAqRou+klchq5UsjmKj1M2WWCARCGSpsdr+DHCN3hrtunWURT9RCIkoU3zZwMelheQe+Q8cI412BNRdkKOr5T68lTxNrpc5lCiQB2a7i2EXSgMIrOODXfdhl7CjnekKrnEbKM4CsM281ML//xHq36t9hUcspyNjFc8OU3y3MjiBlwADPg8b48PeEwpjEgMbQWneqGCnwab6yMhGvCbO87xjN3zaftpXsdwhlQLycYyQFKfrJCtGqZydu5cc557PI9svgUdtMtj3E3F6liRX3nlojVcTFXqU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:27:03.1994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3b43d1-d63c-4ed9-f459-08df09a5e56e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10624
X-purgate-ID: tlsNG-bad1c0/1788431228-BEEDE034-DB14505D/0/0
X-purgate-type: clean
X-purgate-size: 753



> On 3 Sep 2026, at 11:35, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> On 03/09/2026 10:20 am, Bertrand Marquis wrote:
>> Hi Andrew,
>>=20
>> While reviewing those patches i found out that cover letter is saying th=
at the serie has 5 patches but then the patches are number out of 6.
>> Is there a patch missing or something went wrong in the numbering and th=
ere is actually on 5 patches ?
>=20
> Oops, that was a mistake with git-format-patch, I expect.
>=20
> The 6th patch in this series was
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D5504b16eea=
5e661b67d4fba3cf9283d85b9dd3dc
> but I ended up submitting it separately.

Ok then 5 patches it is :-)

Cheers
Bertrand

>=20
> ~Andrew


