Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4A4CA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 16:20:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436154.1654933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE5A-0002eV-I8; Mon, 28 Sep 2026 16:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436154.1654933; Mon, 28 Sep 2026 16:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE5A-0002eI-FA; Mon, 28 Sep 2026 16:20:00 +0000
Received: by outflank-mailman (input) for mailman id 1436154;
 Mon, 28 Sep 2026 16:19:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xBE59-0002df-7l
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:19:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBE58-009zmN-Kp
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 18:19:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba93ac-8faa-0a2a0a5109dd-0a2a450ac300-8
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:19:58 +0200
Received: from [52.101.84.1]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba93ad-f2d2-0a2a450a0019-34655401d5c8-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:19:57 +0200
Received: from OS6P279CA0089.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3e::11)
 by DBBPR08MB10817.eurprd08.prod.outlook.com (2603:10a6:10:539::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 16:19:50 +0000
Received: from CPH1EPF00000524.eurprd05.prod.outlook.com
 (2603:10a6:e10:3e:cafe::27) by OS6P279CA0089.outlook.office365.com
 (2603:10a6:e10:3e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 16:19:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF00000524.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 16:19:49 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV2PR08MB11820.eurprd08.prod.outlook.com (2603:10a6:150:303::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 28 Sep
 2026 16:19:16 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:19:16 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qqw9sjKM7wIHeZkWGQUznp1fr1BMlYqpL9tdD17Dis8Rbpa0E0ig2M0I/ycOX71QOKrEzxyXuNmb9dgWugQmSw7jU4FKbYqF7WDqajD27RShin3uMcNh2G5M9CSlkU+sbu8r9TDZRweLd68AWpUlR6+jfz6m8P+x6eqmSKbG1jISM3qix+N2tmk1WNeaqrrqZPKkNE9XbDlOyjlmmJp5xXc7IIYatFpOF35VQEPdkF+tIlp+fG/gU68/B0mfAmOesuryB8+XlqJHCnxDIHP9hVIj9IMNu5BjYleU4Xms7o79U1huFOKByDxCpNc3sQGfpkCOsYTfCGGaSo2D0Oz6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QqYBaYwY+iNPo6SGI3/EYaDvg1MJ0DCfztmcsx+RcY=;
 b=JQGviU1QHWvzpFVlvoYZRPkN+wxui1DANOHJbAvINflOVebc3vyWJ5PuEb4IdPCO1bO1Iiban+/02sOxnQOjimLw/6PuxfhPLXs0tRIqtLm3UcAeqLl67dIEFubJ8ikoVrbvQJZJE09ryyAS6Qb3cyrUy8yq1anfi99kRlTxvUwi7XwwsIclFYxmemqpDBzb7lxj+kw39gzzV6QcQ7bqPP+Vny+va5F3hh903LujdptlThWWcDsdMFywZnCkMQJDV9c01n2oaxh3ez6UfDr1FcSRFUUMRks5DEu8qWBBnel18DKGzK1WMkq8ruHtJNTrdxRvGBE7qg9mlHKx5/3U5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QqYBaYwY+iNPo6SGI3/EYaDvg1MJ0DCfztmcsx+RcY=;
 b=fw1UM02R2BHnlzmc5WC1WS7IZldbONiAju7/xg8MaJ7Dg2Lo5XdD7t/U1vSXKy0x4Dv8WOGX8KGI0xE5pFotDH+NxtjWkOrjIITl4NANvaof214bKaB3U9pUlTdBUjx4+J5gUBaW8B/pDCnI2ZB+dWn2LZ7YXR2POvikaXb1PxI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QqYBaYwY+iNPo6SGI3/EYaDvg1MJ0DCfztmcsx+RcY=;
 b=fw1UM02R2BHnlzmc5WC1WS7IZldbONiAju7/xg8MaJ7Dg2Lo5XdD7t/U1vSXKy0x4Dv8WOGX8KGI0xE5pFotDH+NxtjWkOrjIITl4NANvaof214bKaB3U9pUlTdBUjx4+J5gUBaW8B/pDCnI2ZB+dWn2LZ7YXR2POvikaXb1PxI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v12 13/13] xen/arm: Add host system suspend backend
Thread-Topic: [PATCH v12 13/13] xen/arm: Add host system suspend backend
Thread-Index: AQHdNjDuSKQY10MR1UuKTuEsgQRVSrbkXcgA
Date: Mon, 28 Sep 2026 16:19:16 +0000
Message-ID: <D16C084A-6BD6-4AF2-AB0F-80F29A3DC8C3@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <9d3cf11530edf478ae7a597f1c0934f4b7b1a270.1787838455.git.mykola_kvach@epam.com>
In-Reply-To:
 <9d3cf11530edf478ae7a597f1c0934f4b7b1a270.1787838455.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV2PR08MB11820:EE_|CPH1EPF00000524:EE_|DBBPR08MB10817:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a67de59-c67d-4132-ad3e-08df1d7c521f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|10067099003|3023799007|18002099003|6133799003|56012099006|5023799004|11063799006|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 SeIlZ/m6SSKMZj9VY4Mho0iT9NSFYTqenhvLFsiJFphQ098rMtDjs2L/cR+PnK/LoulNfh7JSOLWjYnGK/saRuyNuXDULCMJlPvfF5njwdd7dRksg9ZRbh6PlpmNu8Wwf1C0Lp/+hZE+kaiZSVolglOep6fUxv5EoWkCLsxRLt3YXcQYhlcQjJipdcRv6C3H3+jsevR74T916ngX2/7md3smVH6squjj5tPWUP0aBp7vQKb6ANeWwnDpIbwMg8gqBzz21dw5upEGahxyV+q7pn35x5fvhzGyH5l/uVVkXd51N3RT8c2acp4fTt5l60jvR/wNic4OpQcpZUydsvDcqPBO/GA1QQDYemIcQ40ej3/avmPSuuWSSS3PNsDpLrdJhH1rQ7Dz2STOftwrz3npdoKxrVus/EwGwfQivTlOKK+gdNwBnAGqJOTWZUoxmb2bJ2+laz7HdptSWEeUTVrTNr+KxtLi0zMFy/zEuflF8WyDpVWloZTblbPzEnOdUbXNmFmYQbeR0KX2b2NkAX9Od8mkQXMJJMz1ZGsOn5oulBWly0L4dsEaQ/IBH7L1DocKQOdhEAj3iu1GtV4VAdlRpPXOXSZlNVq2ykrmokRacE1cq7myMhuxiaJyFSYeDUVIRm+aXNWRd6UkITyNBBN7Yz1s4g8fVYSNsBQBXLQrflVnuKO89+D0x/NXbQgBIpIiYcK6W9QRR0XuD6KlfV8fBrirBU2s0PYbBKwFUhF4Cv4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(10067099003)(3023799007)(18002099003)(6133799003)(56012099006)(5023799004)(11063799006)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4A92C5CC51CD9D46A12D15B12EA3E418@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 k/oYzw23yiacpmda+9z9qaYWZBGR6clbKEqaN64USGUSV3pXN1g7VSCeY7sq3/9VFzL6M4IHRbM1FXIwrtF5E/81inmEOqtfdHm4SJ6epkOdi7FixhPVsu2y1gm7PQCfEeCg/tV3nHPnfsODj02YhDMZwtd07ZjWTnC2orGZA4I/5Pyk0ZmrVeBP5zVYRyui2OGQW5LrvkuOvcefdrMAJmSstoP1lbLC/zot9Uo2kFjbQbn3M4Z+zgZaPzQ6H/BUgMpYGhjuD6FeL1CIWw070JmfBGdD+2rbWgCO/7vds8vryH/bwFt4Ng/U0CtzqL3GVM3yRZ22I4EcvTfXma1W5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11820
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF00000524.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b1b4acb-6752-44f6-7d76-08df1d7c3e28
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|35042699022|82310400026|14060799003|3023799007|4143699003|11063799006|5023799004|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jNKaPdH2NvETREVkIzOiM6lWvxM3OyvwcCd+0PZ/Vtw8Jihkzxfn0R6la7Z2lQzFKgh4B6qkQnnxzQKP0hT6wu0I4DDsh76a1f0wMSUHzQ5Ut2cdq1QeWigEePif0HouTdmUQHKoiCQVOhHdKaqOngD0ijN3WoIfgXqHSV2WmgihYbiifxZdN5y6/hicqQ+YUeAtcxglrRlvAC15UPMFDjcJxEEVVPLVkIsv+Pl0/5zQKUA5OR6JXV6lnRuicL5iY0bi4VupyLUVES2CF25e9yE1pT7x3F8HltlWABu4FGqLlV3mAl3ISgiRYMsUOIRzj3mIK0rIOmIuduAIAwZdaSVc53tHEteKOlC0IJBcW3ktqm8W3gSBeHbbhwCVhEk1Jjdd1pqqPzVYu4+wHOWnwayFNi3plr/ok6Owi6wbKryMebWCRayQ3LdZMLBEfKN8ihKKo9bPokuuJZbIMCYkaJZMUn3w5adUfGGo8Dx2k/8UcuvpFJ8S3dQCHHgvVNVpu1scwVbokk8+RhO8FWnywpfVRaV7G6MEkEIi7BxKgpz+vtZGYtEl11DzDz9fIDFGUsYlDaQJcU9bNjaAUf/9QyqImXBDY2sm62ggvv1pEU7oWc+VFCYo2/T1zzT/kgXI79BVIGnL13/eBJ8EYqrpTKL7Cc+vCmPqUZUizJH6Ox46mjoS7A78eGM1ev3bgE/2ZXnW79txizdepNB+Ip0XUQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(3023799007)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uyOT3HNHIYr13PWmn0/17P3LFGPN+VVGoj+4tEzxk7KcEzCSdK9jPhV+6qw+s+9XkqK24GNg2e/zH29e4OLgBkk4c02vyL6hMEshqJxK9dR585sh2i+vA9vwpAKbHz5GhSfAOIU4MS4I76qOC1ZjGoPJ8k2vquYgkYvwSoZWaGCCcyak+ly5fpnyYiK64A8DMbOGQsXBx1A2KWCDhWJyNGWYxPT5It7Zy2WVIXolXw+bgQEmbxoQjN5Ed2FUo1g+H/Pv1VmDRnMJDT1DKg+m5/muyzmXgJqWhBF0WQR0eQkegbrjW7NRw+rBXHRWmTJu3mYc1rD44vdnYQVNN2VPOHzGWjrlMUIhs3pdl01PZHhlrSapfRrYp8NU3tFHCRkppT5Y9Ll8ng+epkfx3M49qm8MKSBc9adYq+b0uU0098LdWkwj5h7HB8KEazOcuH5C
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:19:49.9336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a67de59-c67d-4132-ad3e-08df1d7c521f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000524.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10817
X-purgate-ID: tlsNG-4011c0/1790612398-52CDBCFC-CA1FB2BD/0/0
X-purgate-type: clean
X-purgate-size: 15337

Hi Mykola,

> On 27 Aug 2026, at 16:32, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> Add the Xen-wide suspend/resume backend used after a control-domain
> vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
> runtime driver blockers and control-domain sequencing checks are handled
> by the preceding commit; this change adds the code that actually drives
> the host suspend attempt.
>=20
> The backend runs from a tasklet scheduled on pCPU0, because non-boot CPUs
> are disabled during suspend. It freezes domains, disables the scheduler
> and then disables non-boot CPUs.
>=20
> Host-side suspend participants are handled in phases. IOMMU and console
> state are suspended first. Local IRQs are then disabled before suspending
> timer and GIC state. On resume or failure, the completed suspend phases
> are unwound in reverse: GIC and timer state are restored while IRQs are
> still disabled, local IRQs are restored, and then console and IOMMU state
> are restored.
>=20
> On boot, init_ttbr is normally initialized during secondary CPU hotplug.
> On uniprocessor systems this can leave init_ttbr uninitialized, so set it
> from the boot CPU before entering suspend.
>=20
> Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
> only selected when UNSUPPORTED is set and MPU is not set.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V10:
> - Re-apply boot CPU local errata/workaround handling after SYSTEM_SUSPEND=
,
>  before resuming the rest of the host suspend path.
> - Move set_init_ttbr() declaration to asm/mmu/mm.h, since it is
>  MMU-specific.
>=20
> Changes in V9:
> - Split vPSCI availability policy, runtime host-suspend blockers and the
>  domain-readiness precheck into the preceding commit.
> - Trigger the host suspend backend from the control-domain SYSTEM_SUSPEND
>  path.
> - Reorder the host suspend/resume phases so the timer is suspended with
>  local IRQs disabled and local IRQs are restored after the GIC and timer
>  resume paths, before the console and IOMMU resume paths.
> - Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.
>=20
> Changes in V8:
> - Add a pre-suspend check in system_suspend() after scheduler_disable() t=
o
>  require all domains to be in the shut down state with SHUTDOWN_suspend
>  before proceeding with the global suspend flow.
> - Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
>  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
>  with an arch-selected capability instead.
> - Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
>  CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
> - Rename need_hwdom_shutdown() to want_hwdom_shutdown().
>=20
> Changes in V7:
> - Control domain is responsible for host suspend.
> - Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
>  config is disabled.
> - Use IS_ENABLED() for config checking instead of #ifdef.
> - Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplif=
y
>  control flow.
> - Factor hardware domain shutdown condition into a helper
>  (need_hwdom_shutdown()) to avoid preprocessor directives inside the
>  function.
> - Squash with iommu suspend/resume commit.
> ---
> xen/arch/arm/Kconfig                 |   1 +
> xen/arch/arm/cpuerrata.c             |   7 +-
> xen/arch/arm/include/asm/cpuerrata.h |   1 +
> xen/arch/arm/include/asm/mmu/mm.h    |   2 +
> xen/arch/arm/include/asm/suspend.h   |   2 +
> xen/arch/arm/mmu/smpboot.c           |   2 +-
> xen/arch/arm/suspend.c               | 156 +++++++++++++++++++++++++++
> xen/arch/arm/vpsci.c                 |  10 +-
> 8 files changed, 177 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 9027aa17eb..da1585ec50 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -9,6 +9,7 @@ config ARM_64
> select 64BIT
> select HAS_DOMAIN_TYPE
> select HAS_FAST_MULTIPLY
> + select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
> select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>=20
> config ARM
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 3a32183618..e6499aaab3 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -782,6 +782,11 @@ void check_local_cpu_errata(void)
>     update_cpu_capabilities(arm_errata, "enabled workaround for");
> }
>=20
> +int enable_local_cpu_errata_workarounds(void)
> +{
> +    return enable_nonboot_cpu_caps(arm_errata);
> +}
> +
> void __init enable_errata_workarounds(void)
> {
>     enable_cpu_capabilities(arm_errata);
> @@ -818,7 +823,7 @@ static int cpu_errata_callback(struct notifier_block =
*nfb,
>          * fixed to expect an error at CPU_STARTING phase.
>          */
>         ASSERT(system_state !=3D SYS_STATE_boot);
> -        rc =3D enable_nonboot_cpu_caps(arm_errata);
> +        rc =3D enable_local_cpu_errata_workarounds();
>         break;
>     default:
>         break;
> diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/=
asm/cpuerrata.h
> index 1799a16d7e..b93521326f 100644
> --- a/xen/arch/arm/include/asm/cpuerrata.h
> +++ b/xen/arch/arm/include/asm/cpuerrata.h
> @@ -5,6 +5,7 @@
> #include <asm/alternative.h>
>=20
> void check_local_cpu_errata(void);
> +int enable_local_cpu_errata_workarounds(void);
> void enable_errata_workarounds(void);
>=20
> #define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm=
/mmu/mm.h
> index 7f4d59137d..ee73a77777 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -110,6 +110,8 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
> extern void switch_ttbr(uint64_t ttbr);
> extern void relocate_and_switch_ttbr(uint64_t ttbr);
>=20
> +void set_init_ttbr(lpae_t *root);
> +
> #endif /* __ARM_MMU_MM_H__ */
>=20
> /*
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index 50dc6e9fdf..889a6509d9 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -41,11 +41,13 @@ int prepare_resume_ctx(void);
> void hyp_resume(void);
> bool host_system_suspend_allowed(void);
> void host_system_suspend_disable(const char *reason);
> +void host_system_suspend(struct domain *d);
>=20
> #else /* !CONFIG_SYSTEM_SUSPEND */
>=20
> static inline bool host_system_suspend_allowed(void) { return false; }
> static inline void host_system_suspend_disable(const char *reason) {}
> +static inline void host_system_suspend(struct domain *d) {}
>=20
> #endif
>=20
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> index 37e91d72b7..ff508ecf40 100644
> --- a/xen/arch/arm/mmu/smpboot.c
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
>     clear_table(boot_third);
> }
>=20
> -static void set_init_ttbr(lpae_t *root)
> +void set_init_ttbr(lpae_t *root)
> {
>     /*
>      * init_ttbr is part of the identity mapping which is read-only. So
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index c7c26bcf03..3fe2ffa4fb 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,10 +1,18 @@
> /* SPDX-License-Identifier: GPL-2.0-only */
>=20
> +#include <asm/cpuerrata.h>
> +#include <asm/cpufeature.h>
> +#include <asm/gic.h>
> #include <asm/psci.h>
> #include <asm/suspend.h>
>=20
> +#include <xen/console.h>
> +#include <xen/cpu.h>
> +#include <xen/iommu.h>
> #include <xen/lib.h>
> +#include <xen/sched.h>
> #include <xen/serial.h>
> +#include <xen/tasklet.h>
>=20
> struct resume_cpu_context resume_cpu_context;
>=20
> @@ -44,6 +52,154 @@ void host_system_suspend_disable(const char *reason)
>            reason ? reason : "unsupported suspend/resume path");
> }
>=20
> +/* Xen suspend. data identifies the domain that initiated suspend. */
> +static void system_suspend(void *data)
> +{
> +    int status;
> +    unsigned long flags;
> +    struct domain *d =3D (struct domain *)data;
> +
> +    BUG_ON(system_state !=3D SYS_STATE_active);
> +
> +    system_state =3D SYS_STATE_suspend;
> +
> +    printk("Xen suspending...\n");
> +
> +    freeze_domains();
> +    scheduler_disable();
> +
> +    /*
> +     * Non-boot CPUs have to be disabled on suspend and enabled on resum=
e
> +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to P=
SCI
> +     * CPU_OFF to be called by each non-boot CPU. Depending on the under=
lying
> +     * platform capabilities, this may lead to the physical powering dow=
n of
> +     * CPUs.
> +     */
> +    status =3D disable_nonboot_cpus();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_nonboot_cpus;
> +    }
> +
> +    console_start_sync();
> +    status =3D iommu_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_end_sync;
> +    }
> +
> +    status =3D console_suspend();
> +    if ( status )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%d\n",=
 status);
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_iommu;
> +    }
> +
> +    local_irq_save(flags);
> +
> +    time_suspend();
> +
> +    status =3D gic_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_time;
> +    }
> +
> +    set_init_ttbr(xen_pgtable);
> +
> +    /*
> +     * Enable identity mapping before entering suspend to simplify
> +     * the resume path
> +     */
> +    update_boot_mapping(true);
> +
> +    if ( prepare_resume_ctx() )
> +    {
> +        status =3D call_psci_system_suspend();
> +        /*
> +         * If suspend is finalized properly by above system suspend PSCI=
 call,
> +         * the code below in this 'if' branch will never execute. Execut=
ion
> +         * will continue from hyp_resume which is the hypervisor's resum=
e point.
> +         * In hyp_resume CPU context will be restored and since link-reg=
ister is
> +         * restored as well, it will appear to return from prepare_resum=
e_ctx.
> +         * The difference in returning from prepare_resume_ctx on system=
 suspend
> +         * versus resume is in function's return value: on suspend, the =
return
> +         * value is a non-zero value, on resume it is zero. That is why =
the
> +         * control flow will not re-enter this 'if' branch on resume.
> +         */
> +        if ( status )
> +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=3D%=
d\n",
> +                    status);
> +
> +        system_state =3D SYS_STATE_resume;
> +    }
> +    else
> +    {
> +        system_state =3D SYS_STATE_resume;
> +
> +        /*
> +         * CPU0 resumes directly from hyp_resume(), bypassing the CPU ho=
tplug
> +         * path that re-checks and re-enables errata workarounds for sec=
ondary
> +         * CPUs.
> +         */
> +        check_local_cpu_errata();
> +        check_local_cpu_features();
> +        BUG_ON(enable_local_cpu_errata_workarounds());
> +    }
> +
> +    update_boot_mapping(false);
> +
> +    gic_resume();
> +
> + resume_time:
> +    time_resume();
> +
> +    local_irq_restore(flags);
> +
> +    console_resume();
> +
> + resume_iommu:
> +    iommu_resume();
> +
> + resume_end_sync:
> +    console_end_sync();
> +
> + resume_nonboot_cpus:
> +    /*
> +     * The rcu_barrier() has to be added to ensure that the per cpu area=
 is
> +     * freed before a non-boot CPU tries to initialize it (_free_percpu_=
area()
> +     * has to be called before the init_percpu_area()). This scenario oc=
curs
> +     * when non-boot CPUs are hot-unplugged on suspend and hotplugged on=
 resume.

This line would need wrapping as it is over 80 chars.

> +     */
> +    rcu_barrier();

Could you clarify which per-CPU area needs freeing here?
 =20
system_state is SYS_STATE_suspend for every CPU taken down by
disable_nonboot_cpus(), so cpu_percpu_callback() does not queue
_free_percpu_area() for any of them.

So I do not quite get what your comment case actually is.
Could you explain ?

Cheers
Bertrand

> +    enable_nonboot_cpus();
> +
> +    scheduler_enable();
> +    thaw_domains();
> +
> +    system_state =3D SYS_STATE_active;
> +
> +    printk("Resume (status %d)\n", status);
> +
> +    domain_resume(d);
> +}
> +
> +static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
> +
> +void host_system_suspend(struct domain *d)
> +{
> +    system_suspend_tasklet.data =3D (void *)d;
> +    /*
> +     * The suspend procedure has to be finalized by the pCPU#0 (non-boot=
 pCPUs
> +     * will be disabled during the suspend).
> +     */
> +    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index a41355d75d..5134e75c24 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -237,7 +237,8 @@ static bool domain_in_suspend_state(struct domain *d)
>     return suspended;
> }
>=20
> -static int32_t domain_psci_system_suspend_policy(struct domain *d)
> +static int32_t domain_psci_system_suspend_policy(struct domain *d,
> +                                                 bool *host_suspend)
> {
>     struct domain *other;
>     bool last_awake_control_domain =3D true;
> @@ -300,6 +301,7 @@ static int32_t domain_psci_system_suspend_policy(stru=
ct domain *d)
>     if ( !host_system_suspend_allowed() )
>         return PSCI_DENIED;
>=20
> +    *host_suspend =3D true;
>     return 0;
> }
>=20
> @@ -310,6 +312,7 @@ static int32_t do_psci_1_0_system_suspend(register_t =
epoint, register_t cid)
>     struct vcpu *v;
>     struct domain *d =3D current->domain;
>     bool is_thumb =3D epoint & 1;
> +    bool host_suspend =3D false;
>     struct resume_info *rctx =3D &d->arch.resume_ctx;
>=20
>     /* THUMB set is not allowed with 64-bit domain */
> @@ -334,7 +337,7 @@ static int32_t do_psci_1_0_system_suspend(register_t =
epoint, register_t cid)
>=20
>     spin_lock(&vpsci_system_suspend_lock);
>=20
> -    rc =3D domain_psci_system_suspend_policy(d);
> +    rc =3D domain_psci_system_suspend_policy(d, &host_suspend);
>     if ( !rc )
>     {
>         rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> @@ -359,6 +362,9 @@ static int32_t do_psci_1_0_system_suspend(register_t =
epoint, register_t cid)
>             "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D%#=
"PRIregister"\n",
>             epoint, cid);
>=20
> +    if ( host_suspend )
> +        host_system_suspend(d);
> +
>     return rc;
> }
>=20
> --=20
> 2.43.0
>=20


