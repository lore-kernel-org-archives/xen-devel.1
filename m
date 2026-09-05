Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E521C624D6
	for <xen-devel@archiver.kernel.org>; Sat,  5 Sep 2026 08:30:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1409397.1641325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2lmy-00051f-PY; Sat, 05 Sep 2026 08:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1409397.1641325; Sat, 05 Sep 2026 08:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2lmy-00051Y-MV; Sat, 05 Sep 2026 08:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1409397;
 Sat, 05 Sep 2026 08:30:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x2lmx-00051S-0B
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2026 08:30:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2lmw-009mgI-9T
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2026 10:30:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9bd300-2eae-0a2a0a5409dd-0a2a4503bae0-8
 for <xen-devel@lists.xenproject.org>; Sat, 05 Sep 2026 10:30:13 +0200
Received: from [52.101.84.33]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a9bd314-fae8-0a2a45030019-34655421e1f1-3
 for <xen-devel@lists.xenproject.org>; Sat, 05 Sep 2026 10:30:12 +0200
Received: from CPAP307CA0004.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::17) by
 DU0PR08MB9846.eurprd08.prod.outlook.com (2603:10a6:10:445::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.4; Sat, 5 Sep 2026 08:30:09 +0000
Received: from CPH1EPF00000525.eurprd05.prod.outlook.com
 (2603:10a6:380:3:cafe::26) by CPAP307CA0004.outlook.office365.com
 (2603:10a6:380:3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Sat, 5
 Sep 2026 08:30:09 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF00000525.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Sat, 5 Sep 2026 08:30:08 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AMBPR08MB696964.eurprd08.prod.outlook.com (2603:10a6:20b:78a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Sat, 5 Sep 2026
 08:29:36 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Sat, 5 Sep 2026
 08:29:35 +0000
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
 b=Adpk4JDD3GyIvGPFwyI3IT0UQocRD1sX2iOL8M+7qul/bciZHc9lKSoTHrGi5gbpPNkj8xuvRRQe9fPLk6m4vuViYeBf5trUKLYUprFLjprP4Zo/QV2dMfPDwFFvyicVBlipNIlPGQoi6eRLZHLE4zXnqw1pCh0MVyii7zSTztTAp4C2CBtxidJvXNNcTyf1+32wHfoN/NRKOVhYHYtyD8B18vvyCuWZpDYdI3lSy6Fn8oNQ0mKqCNPGLoZjF/UrYM0nSi1CU+T7mSoTNyME02eTgw2ECAFPe0NOVjGhIyioDocIfujiXyjsycCissRlVbfpdvdn2zJo/Pvn2ydVcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65NLJw5aZZ3lvys9uj52mrYTJnMsAcXdZ85K453K9hE=;
 b=XCIyMwUAFuslSbFiEvrTV69vqxj1+HKpwB1TMuyisDok41Pl1rnSlTBAiWPJnfavUrGA3ptKXBER+wwc/Wij73JPk5eXlbJs0TJXVSQJk69O1HIFSLbdKtU1OTDCZMuqEFzq70+jYW7qytN4n381tOSDNiDLq9cbHaLKOTU/CBJfI7VVNgAmntZM8neW2fRbgF/66aBpA3XGOyXtU5gOwh76sGdwBKsS5v8+uOaWA2DujUR9KxXHI0kLD672ENcWEF0pzOBGHOe6yjSYYbsFI7bsNWXYEW0UAq4Me2LO0Ql7izUkab7+VgaV4C1CHvC52xAOgZ58jHFdMABcCZnbTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65NLJw5aZZ3lvys9uj52mrYTJnMsAcXdZ85K453K9hE=;
 b=gl0KYGUxtV8X7CUfcZcOlYjXSbiz3hVmpGyJcOteS50AvHD1RpI2iyTAJiKLuoy0m7SkVv5SALnR2nffRWXRXQXz4Cv9jby3gOPP82b/3sGE7NSonMxo50rB6uQ4LLGjWuSoqNjqKzwT3i6bN1OtWCFsY/3dqA8joqJTwSl/F3Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkqmtKHxe5OeVY+ZZthKZoAljRwf6Xal7LWN0Q4LhNOr1oTnUNCq7EspVe8P0Iqh31pA0NbfEd4xnnw4qeEYxYUL8j6PRn90lim9/Cv4NJS5GM9A9R7ZJoaySsNPvILDAqSf5PEiZcNzQKFT7bitSGj81xy7KqbX+uSxJpeKqDgCsaWjk/J/FW82kla9kEio6Tyik878nKGZluOPV6+LcuxH5pv+JCaJnwXJIAKgtscZmC0O9lHuibsIrrmzcbM9W0QRKp0r2+V1jbeDzuBTlHV0lVYWFbXqYjoq1RPX7MVBMNvqTRYNmkT+ZHy1lSaDingQHL3nUJZc8z8KPw7HrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65NLJw5aZZ3lvys9uj52mrYTJnMsAcXdZ85K453K9hE=;
 b=gRKFqYc5QcHo+g9QCKePp5CLx33RGqq608jY93SEnahbCpiNKDGraBRK5VT+Yc68vrgbjUYC7iPKzBv5JtGVBBPXjuSLoQX9ptDTowfZC8XAFOGU/0BhZ1OnP6MUdF2SLoDuxzRekvrde1UVpGhDMoMLLB79ZnxrY51SAZKx3nhOMSo5ApQHPzl9eeUqVPoRa4wsKLaWwihTIAO+L7WNIYeG9swlGgkz6TFr7BiofqtFETy8GGwcGi5zSicOMgdlJXrmyj5AvPh+cCRPCDzizWeaUMaSyh8HfjKZb4V8hdRc0O2WJxp2/I5ICcOg6LwPq3MrvOM2pOCZPXSGg4Qx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65NLJw5aZZ3lvys9uj52mrYTJnMsAcXdZ85K453K9hE=;
 b=gl0KYGUxtV8X7CUfcZcOlYjXSbiz3hVmpGyJcOteS50AvHD1RpI2iyTAJiKLuoy0m7SkVv5SALnR2nffRWXRXQXz4Cv9jby3gOPP82b/3sGE7NSonMxo50rB6uQ4LLGjWuSoqNjqKzwT3i6bN1OtWCFsY/3dqA8joqJTwSl/F3Q=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH v2 5/5] xen/arm: Rewrite arm_smccc_*() to return by value
Thread-Topic: [PATCH v2 5/5] xen/arm: Rewrite arm_smccc_*() to return by value
Thread-Index: AQHdPF5PySaNy6Ey5EKldcmUqkyt+ba+VLAAgABmmwCAAO1IAA==
Date: Sat, 5 Sep 2026 08:29:35 +0000
Message-ID: <8D81C513-CCA2-445B-830C-A8825E3D818C@arm.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
 <20260904111228.3022634-6-andrew.cooper3@citrix.com>
 <9301544B-8F8D-4E27-9BFA-B7244633B41F@arm.com>
 <1dbfedb4-d3a3-4d11-9b24-dea509c38dad@citrix.com>
In-Reply-To: <1dbfedb4-d3a3-4d11-9b24-dea509c38dad@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AMBPR08MB696964:EE_|CPH1EPF00000525:EE_|DU0PR08MB9846:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe242b8-c9c7-4ce6-cbf4-08df0b27e529
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|3023799007|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 hG0bzLvVTWjhaM+PaHYZEzdcqbZkpHua18R5ipkVdSJQ4sko3AqNM+6Te4T4lWGQrOwyEmE06egXK5vL30msO9TLELhSFTe91803Yim4Sdu2sQwMc0NHSsm3arOq6mCYFFiKT1X0fitD4ox/JsNwmDzTNFCAJD5qgXOmFvRiTRmF8RFBrCzYWzc5DxR4EEr+fmRGXmquv2M+qGjCYy/A2vaZbxqYTele0W0FVg3EuCj6ztKtGmqKQsZjEu3EJN+Phb4cijS9uQzqJULF/ruDfOXLhvbEOqbYVEkHYeypmndDXYbIGMuuqBdkcLncL4p9tQg/efqC2VrY5UlLyloJkel3B0QrThUS8AuCSz1ESje4ELUDuLr/rnEy3rCiw99FNMqdN3GgmQyaRWygDCTntAezPH3SSMc52wnvWGuN4ctfoo8UUWcr5uqAN2uYGb+2vvC/sRTo+Fag2NRsXAzDPnGRzfrmZ8Fx/kUkViTQ8wrj7SDXxhcELu33f29PM3GbHWfduE05zBAqdyC/dCWEyreMJPTy/0oovp1BgJ/NtHtTQ2SEAGVVk65Z8gQDS0bqZDPS51DGgFebd8XzI1l7tHvOKwsRPNeeJxRUhbnnYvVJ6BrsoWO0XFjXIUoo+o66ERtseePINy+gm9i2I9932V4oenJyL87u7a3jqBfWy0gfm5lNwKnvMN3Y4jbtG2B1ZbQE3b8YRodpBiVc4wTlbgEX+fYyQzicknOuqVtaFYQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(3023799007)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <804F10032889A9478F9F9AF21D9050DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 UXULFL+kgMAw+nDdwjEUh/7d6ZpC+wIg8Il2tv6BYpx/yFQL2hxqqz4XjXjY44LWQoD7i6G6vJZnqVNUFHhoV6Kh9BjYGXHp8xsL+Gb/OJnHQh5mzAsJ65sGZcJzklIPFJ9dzDzpKpRpw3wFbcqE9jA1naceOuE/L77qAROtlahHdZ6p5m2Rk8+EWFw9vntEmcNhrlar5WpFUwc/nCgPeSexvoXv6gRmEuCNsrR/hXguX68FIx5528sdl0b7Z8F47wiQyN262TFxOB0V3PAKio0FdFiJZspR3KBEna/UFRpCl7nuOb4i64Tvby/6xw7sI+yQB+ZUA2o2J36/IXgjlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB696964
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF00000525.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a90a0d00-9ef1-40aa-d68d-08df0b27d152
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|23010399003|82310400026|36860700016|376014|10067099003|4143699003|11063799006|56012099006|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	FwGv3e2teHAQ07xeg424B6KTQ9y+b5MI5VLDaE2FqzSAJaNAC6Br/MZAC3/sAR2pdl0xCf7RpoLzQxG8i1X5NzLPsE26M5BjiOFa7P0eHw+UJ+oIRrl4pz7fdKGFBAtCwuHnIdy31TJO2w+FweManaXofBAOTVmF9AQK3K22TjFngieq6ukHSizrh4O4MNv7qMBGaBw9kk42NsRFeMFR6s/Ut9q6VvQ8gznKbU0+1sZu8vkpH2tvNiNSqaZ1OStZU8/4mqy4csEjLoP7Znm0Duh4N8rWtqNfEUlmjLS0eLK60nsc1+1l+3O8LMpSMwoCXSF5xGocoOfWx2VSKFVhhUQxiS4aa1sAZ1kJWTY0iy1Zoz6d+l9D19MCOyIAw1BmnrWA/VlCzFlQuVakf/mjfMTPh3/ai8Kal4p3Ms5kQ5ukefk/fUBJoPAAFHB21j/Jie9SIB8cbVCeFG/8pwfuixkMkphWhk442HwZz7iea9mMwrl/3eZPnHhduGimj6vb5tQvHM+XamG9jNCdF9pscH0p9SscjPaN7m8rlNcjZ+ybO6/bZdA0VITV1HetlkzcENfezASraHO9KKXAbD3oyIEE5yum1dAT2m5v7T/lZTa38Mt9VJwd0AKtuqng+TymDrQpErEq9eohEPsyTrLSXjHawCvaF7JbrZYS3dZ/3rw=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(23010399003)(82310400026)(36860700016)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4HrsRyTmiJ6T1rrfY3KSQ+9OPUI/PL6m7MloI5fohZ3iuCU1G9UC+G1bjPzz52Au4WXqIeLFu2XXezu6qEltups61rYEn/pbBqKHN2RzSfo6CYJQ5OFUzC1qVxzoioIHUqPXohfJYBHn9IV5jnisegGf6o6GItKje8kfVnVDUMd58981/w/HJKvobqpLUuxM4PqRt6MdPY3PlfhDUuHCqANilf4Pt0DYgRp75v8POjIlmssRBaDBbvDNFCNQcYcxOe33YFaAE0pJNB2VvGvVckIATaVe6V4hlJNdy47wqn+OnKRwPxaLvkPZl3hDfVgJRLHdo977ZBLdFKUpPrXBuWp2Zm9TmcwpczOplz0y1Gck2CCjzfEQ9kr7wmvhupP8GPfIXQEp/DfpMln1TnoG7vkZcIjJM796nCjD6i8HOloBjSMMyAapH2Jyc7u6ovdF
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:30:08.4862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe242b8-c9c7-4ce6-cbf4-08df0b27e529
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000525.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9846
X-purgate-ID: tlsNG-33051d/1788597013-6F0C94E9-D6AEF782/0/0
X-purgate-type: clean
X-purgate-size: 2824

Hi Andrew,

> On 4 Sep 2026, at 20:20, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> On 04/09/2026 1:13 pm, Bertrand Marquis wrote:
>> Hi Andrew,
>>=20
>>> On 4 Sep 2026, at 13:12, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>>>=20
>>> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/as=
m/smccc.h
>>> index 4ed2a40ed0ac..2d0f2db0b256 100644
>>> --- a/xen/arch/arm/include/asm/smccc.h
>>> +++ b/xen/arch/arm/include/asm/smccc.h
>>> @@ -181,21 +174,20 @@ struct arm_smccc_res {
>>> * makes it stick.
>>> */
>>> #define arm_smccc_1_1_smc(...)                                  \
>> The comment would need fixing on top of this  as current
>> one still describes the optional @res argument while now=20
>> we only take a0 to a7 as arguments and return the structure=20
>> instead.
>=20
> Are you happy with this delta?
>=20
> diff --git a/xen/arch/arm/include/asm/smccc.h
> b/xen/arch/arm/include/asm/smccc.h
> index 2d0f2db0b256..c7763acd7f7d 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -159,15 +159,14 @@ struct arm_smccc_res {
>   * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
>   *
>   * This is a variadic macro taking one to eight source arguments, and
> - * an optional return structure.
> + * returns four values.
>   *
>   * @a0-a7: arguments passed in registers 0 to 7
>   * @res: result values from registers 0 to 3
>   *
>   * This macro is used to make SMC calls following SMC Calling
> Convention v1.1.
>   * The content of the supplied param are copied to registers 0 to 7 prio=
r
> - * to the SMC instruction. The return values are updated with the conten=
t
> - * from register 0 to 3 on return from the SMC instruction if not NULL.
> + * to the SMC instruction.
>   *
>   * We have an output list that is not necessarily used, and GCC feels
>   * entitled to optimise the whole sequence away. "volatile" is what
>=20
> The overall comment now reads:
>=20
> /*
>  * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
>  *
>  * This is a variadic macro taking one to eight source arguments, and
>  * returns four values.
>  *
>  * @a0-a7: arguments passed in registers 0 to 7
>  * @res: result values from registers 0 to 3
>  *
>  * This macro is used to make SMC calls following SMC Calling Convention
> v1.1.
>  * The content of the supplied param are copied to registers 0 to 7 prior
>  * to the SMC instruction.
>  *
>  * We have an output list that is not necessarily used, and GCC feels
>  * entitled to optimise the whole sequence away. "volatile" is what
>  * makes it stick.
>  */

Looks good to me.

With that:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ~Andrew


