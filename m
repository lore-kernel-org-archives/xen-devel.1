Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43431CAC59A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Sep 2025 12:17:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1126022.1467729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ2-0001br-4p; Thu, 18 Sep 2025 12:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126022.1467729; Thu, 18 Sep 2025 12:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ1-0001bi-Vh; Thu, 18 Sep 2025 12:16:39 +0000
Received: by outflank-mailman (input) for mailman id 1126022;
 Thu, 18 Sep 2025 12:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kqio=35=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uzDZ0-0001YH-5t
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 12:16:38 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52de59ac-9489-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 14:16:37 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8720.eurprd03.prod.outlook.com
 (2603:10a6:10:3ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 12:16:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:16:33 +0000
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
X-Inumbo-ID: 52de59ac-9489-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGTQNHIOBgp8kr2qc5dOGEo3lO7RxOMGvRmM3amneqGXix75X0b0kzpalfuGwrzcYb11MGUp3WzQA+X1yCRXXlNTACZJ2fFRwdbF8+vXgCKLtEeCdayZPQMpWrgddxW5Ok7SgMTQa8czae6i4vP6v7NMezYTVJYy1+ull5I4XGO14pGnZTT8ferYIiBwQMmh+1TPWkNwmc0Z2dhKNyB1/vSwhBmheAM0w2V4/Kz9XtV6SuwFQnHkUvdc7ME2KCr9q0rJVupgdYTwEJjrEaAy3hKATGBlAwirnmM2f7VqkBb9mo2c2m259ayRgx4HGeeOpnvk/I624Z+0H4u7d6zYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sennabp90pHyVkqi/NAsNLhiu8Ito5EffSRJtk0ARQ=;
 b=qagio2egHXz328i18C3cYqI7K+VdtHPCUaM5fCsgk66y4OldAf1zcxMm4ZGv0tgqxmY/4EvuyogIgXzumXQKtvnkDuY7mrExfg8h7hXymQIJTwbASFF1s+N9OG7b/pOKBdcUs3GcV97qJZujFLnBz7qqAw+lSQAJkXXf2ADQwVVCALgvUAkPjGgnXv1aZSmDZG2VSVzzAZUE2Yq/gSSzNsdAkEIfIePnLonJxfYGbbQR59DbxiS/A4K4rt2l9tIFC9e2N2FTCcvp1yQjoa5PwZl4oNa3LM8kEXWXl7zYp8mvRwbA+ktDWVECWJEMPFcbxPadrkt07Ng73TlfnTURnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sennabp90pHyVkqi/NAsNLhiu8Ito5EffSRJtk0ARQ=;
 b=U/L7aHQsJOyikmiu6uuKbNHvwmCpGJJVL/7vLADHPzauWVbLBB8xI9iCobxiTnRP7tufzXPJffqXGXGtqUbvb2G19XrjHZjgbeEazAGvdi2lU6PEQ869wf3FdKrwcxDv1SeO6EUXdg1XPdUGI0zUVlyVlLstal3VzUJpkgNY9wHl2yKCw2Cd/aJQN69XRcKYamBV4sFFl0VzE74xB/vmcN8XYtheshEhJIbnBljSapAGJYgN4ONwtPVnoOXuXhDUpTAkfv9jU6jAL6i9hAC0+2FOvuWugZS6Cg5Z4kfnuwzB6qySilzM3iiHhoaVW+0hx9Dxv0jZJbdiIzmD57flFw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v1 0/4] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v1 0/4] Implement CPU hotplug on Arm
Thread-Index: AQHcKJYSskXGqEBZlUi2OIJnUdiQ4g==
Date: Thu, 18 Sep 2025 12:16:32 +0000
Message-ID: <cover.1758197507.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8720:EE_
x-ms-office365-filtering-correlation-id: 250c0179-65fb-4382-337e-08ddf6ad34ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sxeWfBQNHYiN3Ls55c1Ny8XP39lYt0cIysBwzgj3LOaeM+1QDb3YFIKrZ6?=
 =?iso-8859-1?Q?PQrKgaC2FsbrFqo1PIlnNToyG1BH/35cKhuDtCStrBwwZTKmI3gAXeAJi7?=
 =?iso-8859-1?Q?yW51RtnZA66kaCMJaYhIw2Fu+z6Mob6QvtQp5YEpNNPQAWYm8jq6MhQY75?=
 =?iso-8859-1?Q?acTWxNjSj+ZDE+6Z3PVQ7hv/714GfGj9djaJ7wo6rtpPktk+dF0YnlFipC?=
 =?iso-8859-1?Q?33OK/b9CaUFIjIPbrKPg72t4jdP8aAMR6aRipLNa95b4pgPbt7xCBiS4ah?=
 =?iso-8859-1?Q?CVF5RNZ/K/Rs9fdxCD85ma0ost7Wn17a2I95jASIS7E4AK/nVxj0XumDws?=
 =?iso-8859-1?Q?vz3Ojt+a2xz/IWAsz9wu8y0sCJwhPKeJgUfOLTSoLap58SerOH0ungiqCC?=
 =?iso-8859-1?Q?JsSSHl7iGFNzl+NkPj74jtKVFa6TsOUNb4eETrdm0hpsCSUeh3rjJxw1bW?=
 =?iso-8859-1?Q?qKVM6MGr/MbNTOQtKiSk53Pm4CQBJJcl2rMbn56vQXwvD+UZip4pj5R0X0?=
 =?iso-8859-1?Q?kL1sn/VUzjBjExwNnltsSE5TD9eMPXUN9Q/0DWU8KIodSaucne361SSbTm?=
 =?iso-8859-1?Q?B5gT6Ur8ttW90SNaXPzTmvtj562sAXvPUGEFDLTG2y8ZqcSxtnAuMpq/On?=
 =?iso-8859-1?Q?zlTGQbFvZsNjWPGLrzqevAc3nFB0IKbMT+xSm19aiNFHB9HQNM0jAfvKS8?=
 =?iso-8859-1?Q?G0yzTDug+yYXmn8nqi+QJBuQsbIMFJDjJTe9yCS/ov1m6VwCYuvWErkdlm?=
 =?iso-8859-1?Q?0BMvyS8LsHC5+d3JuYgl4W8Ycb7kMxDlsxB0M3z9OCpTJ/X7lx+VzHiG4+?=
 =?iso-8859-1?Q?MkCGz4D8OnK6Gd0qXZNV6IkljAgCmuX6+Ng8sTFhjZyCUZkVhW8gLIfsZd?=
 =?iso-8859-1?Q?Ndl6asXmNkRvuaD7mMO5JYc96o5JVkWhph1eoJldxxXCp6Y0t0vsCpz1hG?=
 =?iso-8859-1?Q?WRXSEt08nTpr0+eBVVXWh99J7k2XJu2frsDMDop2pHwAM6EBOrGVb+gC25?=
 =?iso-8859-1?Q?1EPc7uSx7bBIm8E9M69/z96jAAHFPg8+g/oK4eR0Yj/M3fhnwkVMOIT/2b?=
 =?iso-8859-1?Q?LUE37OIoHdkqfloNtSGsnWYRGgC05Ek8fGrGMNDg5IF5P/JDRO7/q565oj?=
 =?iso-8859-1?Q?JxAJNG5IxKJqxdt4OWdJ6nXBOK8CK8T9uY0pFXvCl8Jrmai7npDN14yNzi?=
 =?iso-8859-1?Q?pK/dIAehPRwonEuGQfK86+oIik+YVE3U/JAiLfaQ8MTm9vOKH8DYq1Jo+h?=
 =?iso-8859-1?Q?OcGUU6EEgcFq5oP1q1AJyI1YHq+KuZ7ENHq9pMfag6CnD+WT0GA8yV6G3W?=
 =?iso-8859-1?Q?kQRAwrjsq9vsQ33BciDYSOxNMWXmo+pNN5CPiEtwzaojDvLRpr9VYhPqw7?=
 =?iso-8859-1?Q?Tx6MW2jmXpO0l1r4x3QkblMN1Vwjq03OFVFXeWkpTg945Qbcr2xzddWwhk?=
 =?iso-8859-1?Q?3acU5IQ0yXqHNHC5l4482fCSZkKxj1f50neSpB/b5v7bqua6nxXEp39gr4?=
 =?iso-8859-1?Q?YIP4DhSpCvvVIIrp3vFKV6ei9r8JOignWUskvgCpN+5Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?U0i1rzqJZakDq4dk1Un69NvvVB7u+1XNVMQT0kdae3+XNgjDeXj3gr5fxU?=
 =?iso-8859-1?Q?UVJeNH1PNDJ6XPWTduz4qbRKAeXYEWvSBESykbGlgjUvvKMfVS/rkOObXN?=
 =?iso-8859-1?Q?+Yb6FvlnQtBabTXQpyGepjljYZvSNmD94Yx09MtBUb0Pu1xrU2T+MOLKzY?=
 =?iso-8859-1?Q?AWt3nGX1aSlwI1FH/HfqPjAYqngcyD28lGUStOrK5L3QRAHuGMaomDSc1i?=
 =?iso-8859-1?Q?eReb7f/IBxaJAUZzCwTiNgxAPfkPlm895Gba3PatuFzvfBFK2PF0ZscqUl?=
 =?iso-8859-1?Q?Bs6yQnvzwpabtMmQJ/ofXILhwRrp1hd5ZySPQTmIrDWIlKIcZKpe/N25cB?=
 =?iso-8859-1?Q?cT3vZaq8LDfHu82oNJL8RcJBLlFK49bPcRA3iUhB6VcNtdBMBa81TYASIa?=
 =?iso-8859-1?Q?/0GtHWUGvjhoJqLPrHnkyQtnw3BIgPqx+EX/J30UcBQBRA0PCnnqDuLrri?=
 =?iso-8859-1?Q?xyDQo3emz4PGvBfPb5gGN3M6xCIQsynBuLmDQSEVKyKgy/26kI6IJPcRBJ?=
 =?iso-8859-1?Q?+AZ+HrNw/1Y3jObPJUhwbN87ubfZ/tzXZGGVE55ufYoL6UKBpJQ4C8Cmik?=
 =?iso-8859-1?Q?I/rbPS3MsmhWsRViMDNH229ui4aszUh8g+4Dyh/BDSpAxClRVBXLdb2sD5?=
 =?iso-8859-1?Q?NtL5vr/w5OmmVCh3Gw/PIE5afYq7nPVzIyACEOrdjL13tLqZp5dgYPgoR4?=
 =?iso-8859-1?Q?ADxAE+n22geOaVh+t5GkfWQz6Mlv3HbHSTK9PeX18oIrUyjoXbneSrJlG2?=
 =?iso-8859-1?Q?q7Y962KGvA1KXVS/c7sk0K/P2PIiKX25k6WMDKgPFNrT19IqWk0SJrlVg8?=
 =?iso-8859-1?Q?BJKJPJWlL0U1HAvP8Dsa/fbbWhk/T1Cyxguc8HMcYmiGq39OoqYmGVV7aL?=
 =?iso-8859-1?Q?1lrgCZORTCYO4vG/adC2FjaWjd3B5aUxjczQzYLzbokV9hikwcctywhqAV?=
 =?iso-8859-1?Q?S4jPLi0H3BJLbEJ6YY2/CMSJRRMPNy6BlcRuN1XRZUSEZxeXpJF7+1//FT?=
 =?iso-8859-1?Q?Yuf/w3jMKTpyVYutdDKc4O4DnlKdu40J1f27ARAQ7kOrLEO9UWlfDgdyTH?=
 =?iso-8859-1?Q?bWd8VasvQUxq8zR3fZJCGh15lu6JQyGVF9uFOaz0jCOkrl/z22D5dDhne9?=
 =?iso-8859-1?Q?KLYAaKYW9of8uUSn4+ub4n40jfSxqHCkkXE8OS6qK04IND49HMl+UxvS3s?=
 =?iso-8859-1?Q?dYwQfMnAPTN3NqBT+FaKN05uucNM+x02xeP3Npsyd1t+NjMIbgQLyhRpq4?=
 =?iso-8859-1?Q?caa47MLOgAoOnGSmFOp7FNsKtaedMCJeGXeMKTwJEC72bX7CEdhXS63Mp6?=
 =?iso-8859-1?Q?dOwVgkwumXqiwRwq3aMm5yRg05u+LnPavNkXrugukwbLfx8bxBgaWocbKe?=
 =?iso-8859-1?Q?z3wh7yRo5mJghVWI3cPFoH03XauEGKXfhPQ/ZI+hVRFKmcuP8d/ehnaCo4?=
 =?iso-8859-1?Q?COZEptyCReN3Ljkgk0WWwyXL8Tw7KhYGhIKDht1/mXJWyXNft6rIShFwNU?=
 =?iso-8859-1?Q?u7ldYIW0yS70zwPIQEtbuvE0Yr7FvBytWMYnIVN8rSJ4LG4YDvLhJKZ8Ej?=
 =?iso-8859-1?Q?3ds1ZPbatpmdANs54oPSusvYhcezlGEBrpSzakasId4cDywlH4j4aSKWjZ?=
 =?iso-8859-1?Q?an2rrHbsmJ4UdD/L1lwB+r9MhSQC4K0xp2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250c0179-65fb-4382-337e-08ddf6ad34ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 12:16:33.0821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fmmH78YRgaJYYKwKETQ4pWklYspMFlVO3jSmG9zqVMIbDydrcJPTjlqORGiqHQ+b+XAjQL1LqsxRzPH1r1vsqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8720

This series implements support for CPU hotplug/unplug on Arm. To achieve th=
is,
several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented.
2. timer and GIC maintenance interrupts switched to static irqactions to re=
move
the need for freeing them during release_irq.
3. Enabled the build of xen-hptool on Arm.

Tested on QEMU.

Mykyta Poturai (4):
  arm/time: Use static irqaction
  arm/gic: Use static irqaction
  arm/sysctl: Implement cpu hotplug ops
  tools: Allow building xen-hptool without CONFIG_MIGRATE

 config/arm64.mk                  |  1 +
 config/x86_32.mk                 |  1 +
 config/x86_64.mk                 |  1 +
 tools/libs/guest/Makefile.common |  4 +-
 tools/misc/Makefile              |  2 +-
 xen/arch/arm/gic.c               | 10 ++++-
 xen/arch/arm/sysctl.c            | 67 ++++++++++++++++++++++++++++++++
 xen/arch/arm/time.c              | 20 ++++++++--
 8 files changed, 98 insertions(+), 8 deletions(-)

--=20
2.34.1

