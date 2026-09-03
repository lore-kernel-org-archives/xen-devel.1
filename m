Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85100C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:50:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406957.1640120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25xE-00056l-2K; Thu, 03 Sep 2026 11:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406957.1640120; Thu, 03 Sep 2026 11:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25xD-000568-UU; Thu, 03 Sep 2026 11:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1406957;
 Thu, 03 Sep 2026 11:50:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x25xC-0004mF-Ki
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:50:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25xC-000oCa-1S
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:50:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a995ed5-e002-0a2a0a5209dd-0a2a4501b102-42
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:50:02 +0200
Received: from [40.107.162.6]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a995ee9-5984-0a2a45010019-286ba2067687-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:50:01 +0200
Received: from AS4P251CA0007.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::11)
 by VI0PR08MB11326.eurprd08.prod.outlook.com (2603:10a6:800:300::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:49:57 +0000
Received: from AMS0EPF0000056A.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::98) by AS4P251CA0007.outlook.office365.com
 (2603:10a6:20b:5d2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 11:49:57 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000056A.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 11:49:56 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:49:24 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 11:49:24 +0000
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
 b=coJgUUaB/fl2XxXZNDOgZngk5dU0HLOZc3+m79F1yQBiUxEEOZjnC4EHmVjJBoZtgGmpcA4GgEfjc/eh7tli/c9QbhYMGQYI2NMsHNKFfRGfoZN7/t/9vewIkalHGMmuQjLknLsT2RxvJMGtMPIqnoBtAAY015lG7T1K+jeaLGgTppTGDHQugpj3hrEuFEpVcPvItSbo1/XuDM1znzs10JpMnlHujd4CtBbR+sww1Hv92Pl/loY0/QGft5ecxyNkWVM+dna+vSv4UbClPlE1HYt02ZqdTdbwwG4jDjQlkkNLO106Ne4APgvXW51tU2EXmPDEeGAcvYEtCIMzivfnvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xpmOnyFDbq9RXvXSHv9f63mxmbv160i/LJZm6JCLyg=;
 b=WvownICTyH5iRWHgLiIqWvXMYt7htp+XK5ER1aQyAhZ5Ktg16Ch5f0Wk6VhBityfYDydW5AN928+n/ANuRxEFn27A9F0ixscoMQloIFAVCF+esnUpXqcasbpOoqyYgYweduIm32X2aV+ilaUYdX74pX4zqWciIhD52HWzgG2vxtstXF8Ofjf6N3DEz1I/w4769xsid/TB7DdvQ/qpBH30UBbxsd4HGHZA/QzjtQChhy/Bu7ECPV5WUZnZUWS1b2yZTFH5uTkilb6yGJZQ/3cTt+It6pB7FT9a2A04HslPYZxgmPt0PdJ4iff4kO6t6ckOVDEX9es63PRQqU64TBgWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xpmOnyFDbq9RXvXSHv9f63mxmbv160i/LJZm6JCLyg=;
 b=RDNFH59C1hE22Ec4Ec02sqR49i7/daVZxwpH1n7JUu1+BfAmhxfT/+PHS/FOffgfoKNmS897FhCU4e7+HCy6/UZbXN6pTQgMpyo91/5ikm2b/IPq4Y4zG+hs9QLgExiWhiEJ05whA0OUOWx2ksnsasKSqK5EMvsCrPqvp+jbTMA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqfSflDcvCCj0Hr7Na2WFYpapgEB65bLPDAg0Utt5RDB5frXze0yJ0zhWVT7FNUKQuTsFKUu2+v5YRHXHZA6MSEEmX2dZvDURexcE1gtbEe0QN382U1he05LfIBtyqyopESscMRd5eNo7v1R3bzvHOIskpMuaCi+Cd1JHqCtvt3Y1zJJwTWGt2q1ksuEK2rixijBZ2qyemwGDSEMsZcJs0ctnw0lRlNr9xkgpmaFx9wLJU3GGmFbUm6vU5eFQiKFTcJqYr3Fr6W3LzCm0YDOMGMann7IAam6t3UQvHXJ3hu5dO5L8Sz49/WKWzv/xCnRKD2wYtyxqODcJkrP4WHxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xpmOnyFDbq9RXvXSHv9f63mxmbv160i/LJZm6JCLyg=;
 b=m8v3roQMf6F4uC/qxhBl1a0EgFgGzru3iCxJ3hVk07eNl+ZT5J0QEygZkL00jO6/yo6blsvEuiQ+3ZJp8srghp1oQYsedMgjnB2/hNr9bRJCZ9ULtUiywfhIklNxaemiAEIk00OpLK8/gW0coLW2v2YGq2KauiRkC8A9w2uwmULb1fUUah1qWSeR0EIGJqGq9y5L426HhwDFFWRbSMvB9GHQ9jZmrKe8bN+6DAyF19FD1xREk6lXrGCcwff7SX0tCIQMKT4PXEoQHB1NdYwJmb0lgcTzqeKqorgWAxYFkiTLk0ewgDDO3ZMaT/r1IaF2KRJSuK49JnLEYyx9vI1M8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xpmOnyFDbq9RXvXSHv9f63mxmbv160i/LJZm6JCLyg=;
 b=RDNFH59C1hE22Ec4Ec02sqR49i7/daVZxwpH1n7JUu1+BfAmhxfT/+PHS/FOffgfoKNmS897FhCU4e7+HCy6/UZbXN6pTQgMpyo91/5ikm2b/IPq4Y4zG+hs9QLgExiWhiEJ05whA0OUOWx2ksnsasKSqK5EMvsCrPqvp+jbTMA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH 2/6] xen/arm: Introduce arm_smccc_guest_smc()
Thread-Topic: [PATCH 2/6] xen/arm: Introduce arm_smccc_guest_smc()
Thread-Index: AQHdOUMMzhvvHg/ZrU2g327RhKMYgLa8wfSA
Date: Thu, 3 Sep 2026 11:49:24 +0000
Message-ID: <3AB8A50A-7BEC-4B70-8EB9-5BD2AD31D1DF@arm.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
 <20260831121944.2908139-3-andrew.cooper3@citrix.com>
In-Reply-To: <20260831121944.2908139-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA4PR08MB5888:EE_|AMS0EPF0000056A:EE_|VI0PR08MB11326:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd932a6-3a5b-4f12-a36e-08df09b179eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|56012099006|4143699003|10067099003|11063799006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 LcAaEzIwsvBRgaZH8RTVJXyFj9uYk4tOeelENuVn/gB364uvOvghidl3ZFr+cz3X5nlhCCVIFKLAfe/TrQQezFKUrprssHC7guZNIn6+MzDJfOMFcY/kt1Z1CxlhytvZIDC7bkE9aK+WIuUb5SVdsGxLdjvlfPnwt2dOrtoiE+msDirpS6k6wBakWSNd6yQp5hjjkSl95cZc6xXqaj2MpUMJwI+1ZOx7v8vDxJQyg3PccNG7CMmVrw0h7vWTUzIGsOhCxpmC2opMfr+h1ku+Pqhbj+eJD6KgdifsfEww7D5p+VGBvPxJx48X4vTKT17IgingFwpUm5coQGoAaC3MUs+2OyEEm/Fd7AfZDoT1FU7DKWf/hGF8ogC52p7qjT+StYMHCpjS/8pz0c0Qf1q9cJtLvNQ3ER924rVjB/p4z11yQhUHv2Fy5rODlHh5WwMeR5EvRrInpzMM1v1vkevBB5NxLIQyf7kTeipKb5snRZCkK5Wb1JH3GOWNnNFUPD48qK0GkJLLerqPjl3zXl76MpQn69rrXYNqO4dKL5j7W5sRDkh+5ETMwlc/Tvb/AOzFUFt8DwHoWG6r+94F70zZ+Tq87FX22+Wao6xBq2rXu5xdHWJKIOggsR3oaS1Ywmxp0kpuHZIamnQLFd0x+7HDCBmiCrc4vkZoj2LSGdQkxK7nJ+oTOHrJmHJ+0JwXzff2u8RTXar9g1au4M2E8NtSVej+GbmQn6oRJQVcEVEJpKU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(56012099006)(4143699003)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EB4F01B0805EF84391FA9690266F0D0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 zoJmok7RicK1vat/5EEPz+EgedWVQNMHvjGwrUW5nkCQRpQh0FaIsGL76NWgJmPMnQDu8la2sUXwK6okQzJdJcetrFUehGuZt2YnAnvzcp/myfl97irUU++LrGBTCN4T7v+yd416y8CdZyvf+NZZG/yaJ1EeFrDpWaX5N6p///a58qtMiDgDqZTb8+JR+XfWwbIwiCWfpy6Oq+cj5E/+ZDxBPGupG6l0Od/KocfFlYAOiLL6HF2S/u0iCtaj3nKpbz/Zk5cPvUiuN3UOcbFxxp9zF46oWGXLDXG/cWv7JeyaNK3bkPOgqtqTvefrbEFtP9iiBRhkTEi2h/viGa2rMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000056A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	383686ac-c281-41ea-3ef6-08df09b16666
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|23010399003|1800799024|35042699022|82310400026|36860700016|376014|6133799003|18002099003|22082099003|10067099003|4143699003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZqFwDAUzETfkYxPksHPXA6oO3l3CFa0+hn7mE1QgjWjbD9MNSCrAGj4ybsN7y19aeO1y/JdWJ4YE7jFJwpPitXsdjG/3iQnNWeFoNzlq/33KFM7iddPto6ezw349SRq5CyoilZKVXrg5KKjkQM6eFi9hNnEFc3wZVVosQRAJhhRxtpLOQ6hGc9OF4K3/0Bk/F+Jele9RY4vbg/wF4d4SP3laY7WRsKQU1PCIjatzCUjY0UhTB6sUkHhZKJoOV/1PYt/quavdV53mmHE58rUufHj9YUDTbJ1gu9fscecweIkHWjgS6AcQHivBdXOC2Z2JFbP4u5x8p0BU9Y+XKXXFmwxm+NV56hqn40K2LuBwEp2cba/YF0xpXesa6EaVkzew+C14I+G64ZGqLjy5bUQt+3Amv2qAgJJKJM2s9AIv3bcC9UXqoGlK+YL1EiH1/1kzRNDStRJGNlu2CoU/ZukKiTfjW40s9aZss70qrLK/TAz/Zeh0YbxXi+nzVRTS5XQ+VsM9KeY0bpmrtWZPSbRBtYaDSl2KgdVePEGZMMSeRnzENDvmO3cBPu8AF+m6u3FzSwr7P0ldZj2oivG3ZGyC4gNIR1SAGGXW1DLUL9+8jfAhvE4IVfl/2k57m/TCdd9c/YdCsXuJ6DcVBM5LryEe4bHl3RQZqFeggP1Yn53dDQM=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(23010399003)(1800799024)(35042699022)(82310400026)(36860700016)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ll4R3LzbcHpbxK1BnnUQG1G/GHKSasBksg2S6YzaGbgWG8FBPftOgthrAv9ZJ8DinINSPe4BZZIB1/znrkcuav6I/9u/Z+VKNGSeqNcnBSyN6XgeWjKdd796K1GeQd+hMeWhaVgTcgxcsREIbqBk9z9grcedgvH27rSYCe3jWyWy/ijq4GI6coONbijSnpMeQGbFYUpkRNdWRhgTuIz9PDIeS0WyFuB+lnPZ1i5wi4Y6ctV0ByQHjmnUHuhRWB45fzGcW/L08+8GTLcMzVX3ZoiT5AriJK+/Qh1AxaIyEe+NMXmNu2auoX/ORBOe8LI8XF48CxpsYL86EIu1AX+GFauYeWHN8m9mgcYsy1RfroTE0OsFrd2OFkS77WdaE5USyht5KeA/ECoJC7ojwIxOaqy69j28CBvE1fJV3UYMPfI8qiG9O1rUCNnK5MTTSbNL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 11:49:56.8137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd932a6-3a5b-4f12-a36e-08df09b179eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000056A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11326
X-purgate-ID: tlsNG-d62444/1788436201-1D272757-654379B6/0/0
X-purgate-type: clean
X-purgate-size: 8978

Hi Andrew,

> On 31 Aug 2026, at 14:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> Both {get,set}_user_reg() are out-of-line functions, leading to awful cod=
e
> generation.
>=20
> Introduce arm_smccc_guest_smc() to operate directly on guest registers.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Looks good to me.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
>=20
> For arm64:
>=20
>  add/remove: 0/0 grow/shrink: 2/4 up/down: 27/-864 (-837)
>  Function                                     old     new   delta
>  symbols_addresses                          35096   35120     +24
>  symbols_names                              42958   42961      +3
>  imx8qm_smc                                   544     348    -196
>  scmi_handle_smc                              372     152    -220
>  imx8m_smc                                    576     356    -220
>  zynqmp_eemi                                  864     636    -228
>=20
> For arm32:
>=20
>  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-160 (-160)
>  Function                                     old     new   delta
>  scmi_handle_smc                              392     232    -160
> ---
> xen/arch/arm/firmware/scmi-smc.c            | 16 +-----------
> xen/arch/arm/include/asm/smccc.h            | 29 +++++++++++++++++++++
> xen/arch/arm/platforms/imx8m.c              | 16 +-----------
> xen/arch/arm/platforms/imx8qm.c             | 16 +-----------
> xen/arch/arm/platforms/xilinx-zynqmp-eemi.c | 17 ++----------
> 5 files changed, 34 insertions(+), 60 deletions(-)
>=20
> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scm=
i-smc.c
> index 0835ddeeeccc..a0cc6c6192f8 100644
> --- a/xen/arch/arm/firmware/scmi-smc.c
> +++ b/xen/arch/arm/firmware/scmi-smc.c
> @@ -50,7 +50,6 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
> static bool scmi_handle_smc(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
> -    struct arm_smccc_res res;
>=20
>     if ( !scmi_is_valid_smc_id(fid) )
>         return false;
> @@ -63,20 +62,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs=
)
>     }
>=20
>     /* For the moment, forward the SCMI Request to FW running at EL3 */
> -    arm_smccc_1_1_smc(fid,
> -                      get_user_reg(regs, 1),
> -                      get_user_reg(regs, 2),
> -                      get_user_reg(regs, 3),
> -                      get_user_reg(regs, 4),
> -                      get_user_reg(regs, 5),
> -                      get_user_reg(regs, 6),
> -                      get_user_reg(regs, 7),
> -                      &res);
> -
> -    set_user_reg(regs, 0, res.a0);
> -    set_user_reg(regs, 1, res.a1);
> -    set_user_reg(regs, 2, res.a2);
> -    set_user_reg(regs, 3, res.a3);
> +    arm_smccc_guest_smc(regs);
>=20
>     return true;
> }
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index 53cdddb690b7..832157f43734 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -202,6 +202,21 @@ struct arm_smccc_res {
> #ifdef CONFIG_ARM_32
> #define arm_smccc_1_0_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
> #define arm_smccc_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
> +
> +/* Make an SMCCC v1.1 compliant SMC call with guest register state. */
> +static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
> +{
> +    struct arm_smccc_res res;
> +
> +    arm_smccc_1_1_smc(regs->r0, regs->r1, regs->r2, regs->r3,
> +                      regs->r4, regs->r5, regs->r6, regs->r7, &res);
> +
> +    regs->r0 =3D res.a0;
> +    regs->r1 =3D res.a1;
> +    regs->r2 =3D res.a2;
> +    regs->r3 =3D res.a3;
> +}
> +
> #else
>=20
> void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
> @@ -251,6 +266,20 @@ void __arm_smccc_1_0_smc(register_t a0, register_t a=
1, register_t a2,
>             arm_smccc_1_0_smc(__VA_ARGS__);                     \
>     } while ( 0 )
>=20
> +/* Make an SMCCC v1.1 compliant SMC call with guest register state. */
> +static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
> +{
> +    struct arm_smccc_res res;
> +
> +    arm_smccc_1_1_smc(regs->x0, regs->x1, regs->x2, regs->x3,
> +                      regs->x4, regs->x5, regs->x6, regs->x7, &res);
> +
> +    regs->x0 =3D res.a0;
> +    regs->x1 =3D res.a1;
> +    regs->x2 =3D res.a2;
> +    regs->x3 =3D res.a3;
> +}
> +
> /*
>  * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
>  * @a0-a17 argument values from registers 0 to 17
> diff --git a/xen/arch/arm/platforms/imx8m.c b/xen/arch/arm/platforms/imx8=
m.c
> index 669dd517e057..efb0ad20d6e8 100644
> --- a/xen/arch/arm/platforms/imx8m.c
> +++ b/xen/arch/arm/platforms/imx8m.c
> @@ -50,7 +50,6 @@ static bool imx8m_smc(struct cpu_user_regs *regs)
> {
>     uint32_t function_id =3D get_user_reg(regs, 0);
>     uint32_t subfunction_id =3D get_user_reg(regs, 1);
> -    struct arm_smccc_res res;
>=20
>     if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
>     {
> @@ -122,20 +121,7 @@ static bool imx8m_smc(struct cpu_user_regs *regs)
>         return false;
>     }
>=20
> -    arm_smccc_1_1_smc(function_id,
> -                      subfunction_id,
> -                      get_user_reg(regs, 2),
> -                      get_user_reg(regs, 3),
> -                      get_user_reg(regs, 4),
> -                      get_user_reg(regs, 5),
> -                      get_user_reg(regs, 6),
> -                      get_user_reg(regs, 7),
> -                      &res);
> -
> -    set_user_reg(regs, 0, res.a0);
> -    set_user_reg(regs, 1, res.a1);
> -    set_user_reg(regs, 2, res.a2);
> -    set_user_reg(regs, 3, res.a3);
> +    arm_smccc_guest_smc(regs);
>=20
>     return true;
> }
> diff --git a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx=
8qm.c
> index 3600a073e8ba..7249e14ab640 100644
> --- a/xen/arch/arm/platforms/imx8qm.c
> +++ b/xen/arch/arm/platforms/imx8qm.c
> @@ -67,7 +67,6 @@ static bool imx8qm_smc(struct cpu_user_regs *regs)
> {
>     uint32_t function_id =3D get_user_reg(regs, 0);
>     uint32_t subfunction_id =3D get_user_reg(regs, 1);
> -    struct arm_smccc_res res;
>=20
>     if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
>     {
> @@ -106,20 +105,7 @@ static bool imx8qm_smc(struct cpu_user_regs *regs)
>     }
>=20
>  allow_call:
> -    arm_smccc_1_1_smc(function_id,
> -                      subfunction_id,
> -                      get_user_reg(regs, 2),
> -                      get_user_reg(regs, 3),
> -                      get_user_reg(regs, 4),
> -                      get_user_reg(regs, 5),
> -                      get_user_reg(regs, 6),
> -                      get_user_reg(regs, 7),
> -                      &res);
> -
> -    set_user_reg(regs, 0, res.a0);
> -    set_user_reg(regs, 1, res.a1);
> -    set_user_reg(regs, 2, res.a2);
> -    set_user_reg(regs, 3, res.a3);
> +    arm_smccc_guest_smc(regs);
>=20
>     return true;
> }
> diff --git a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c b/xen/arch/arm/p=
latforms/xilinx-zynqmp-eemi.c
> index 2053ed7ac5f6..326c8a1ba6e5 100644
> --- a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> +++ b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> @@ -51,7 +51,6 @@ static inline bool domain_has_reset_access(struct domai=
n *d, uint32_t rst)
>=20
> bool zynqmp_eemi(struct cpu_user_regs *regs)
> {
> -    struct arm_smccc_res res;
>     uint32_t fid =3D get_user_reg(regs, 0);
>     uint32_t nodeid =3D get_user_reg(regs, 1);
>     unsigned int pm_fn =3D fid & 0xFFFF;
> @@ -187,20 +186,8 @@ bool zynqmp_eemi(struct cpu_user_regs *regs)
>      * can forward the whole command to firmware without additional
>      * parameters checks.
>      */
> -    arm_smccc_1_1_smc(get_user_reg(regs, 0),
> -                      get_user_reg(regs, 1),
> -                      get_user_reg(regs, 2),
> -                      get_user_reg(regs, 3),
> -                      get_user_reg(regs, 4),
> -                      get_user_reg(regs, 5),
> -                      get_user_reg(regs, 6),
> -                      get_user_reg(regs, 7),
> -                      &res);
> -
> -    set_user_reg(regs, 0, res.a0);
> -    set_user_reg(regs, 1, res.a1);
> -    set_user_reg(regs, 2, res.a2);
> -    set_user_reg(regs, 3, res.a3);
> +    arm_smccc_guest_smc(regs);
> +
>     return true;
>=20
> done:
> --=20
> 2.39.5
>=20


