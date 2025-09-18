Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3862ECAC5A0
	for <xen-devel@archiver.kernel.org>; Thu, 18 Sep 2025 12:17:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1126025.1467762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ6-0002TD-0G; Thu, 18 Sep 2025 12:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126025.1467762; Thu, 18 Sep 2025 12:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ5-0002T5-Tw; Thu, 18 Sep 2025 12:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1126025;
 Thu, 18 Sep 2025 12:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kqio=35=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uzDZ4-0001YH-LI
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 12:16:42 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55b51d1d-9489-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 14:16:42 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8720.eurprd03.prod.outlook.com
 (2603:10a6:10:3ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 12:16:35 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:16:35 +0000
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
X-Inumbo-ID: 55b51d1d-9489-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPDsVc+eDVt76bCHLIid+pppMn9RI5e0/Fwy5gq6aEiFWsZueC9NVFkfDmEO6Y4hu0g/eeRSNM+yDLXeHiToKWy366fNxF0ScTS22w3hzJjk/DWYTz/cH6NP9nJ2eW1cZ8XZgaHsQmuNbBRq0K+X9lKjl2C3FHeLKm5iQzwVf0IWJpq1KZEnxXlXUCzPZNVdmgPj5MgRlnjPwEbv+s2BCjlohQiGRn71yAye8zvqnmN3L97Vcfp1D93j2shqYq/Z+lwsAZE9TVNaurilQj5rwNydL/4kfuEknJj3AvIoytOx8cuAsBU6442rlajau4b0MSni4o8ELbl1mSePhqEO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reDYiedqoZNI03qhIvZun1ctpUFxzc7JosMbd9+r4uE=;
 b=IQ3YeTiUDCEFSx7DeDI12MJQhS7vkG7px4hSZ0/L0vOLZ4X5+ffyqAGPy910FYkvUH+OMfZNubDNVS6trgZC4F+Bc5VjoonsHhk/QcrmuojLfdiZKJOaHpBBWzFHhYHlQGUwvZd+o+gEqTDCH/2dFx3pLebrBQvPB3epYqWLvc7DB0+p8dgWsbqJk/Tup0s2KPk883z0fo2LMYnVjlv/7n4biAlOHtR9soU3Lg2MiyRQQMos3G3o7bn4E3uYGLL5/LrPzKbqi0Fl+USk5ernXI9C6ZbxGckHllJ7Xeg4JUA/i1mVoAOIO5EqIZUuw7RXhgfk1fMQkFw57v/6hNVA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reDYiedqoZNI03qhIvZun1ctpUFxzc7JosMbd9+r4uE=;
 b=HYhHi1yb2BpBcRhsRff8aplFw7rFb6R3/cPBAvYIlinGzzAs5CATqA0z7GN/tociu8ZOOKfcKJg4IHau0JgQKsUEMEYzMy8mJ2UHHMQRJaKINApl6frtRs6Pl8KdWpMbnzQ6naw6pBz6XOZkrC1bX2fUHycj31MH94eO8hNWGfOuEIHjWICrMc7aku2hpOj4Xo2nEIwB5itAgFDKnTn7EYmRccth4MTKWP5xfhvmLNpKStA1NudFCju9ZBV24+p8uzK9aeUFPCi12uLiuolepKfQR9HxUC4tlPTV/AekOTzG8BeG0q7VzbzlEtMUu8fP2mlnPFZ9IGjqujokNoPN0A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen
 Gross <jgross@suse.com>
Subject: [PATCH v1 4/4] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v1 4/4] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHcKJYT9WcJIkqhZk6dQ6fXEj6SxA==
Date: Thu, 18 Sep 2025 12:16:35 +0000
Message-ID:
 <7d10f4d063a55920acbb8d477b885552379a6116.1758197507.git.mykyta_poturai@epam.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758197507.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8720:EE_
x-ms-office365-filtering-correlation-id: 88da5d1d-48e1-45e9-c3c1-08ddf6ad3637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gU8UOtsZhsxsAdKxfAtXKoE5Kof0SrAktB+9VnxpdDx0sXIueTmiA62x7F?=
 =?iso-8859-1?Q?9ZPx8thfqOm5fR5zeUn26nPcoR+1JK0VRAqHd+JeRwMZCTKkU4o/8hobKf?=
 =?iso-8859-1?Q?LEGbkBmUY+nK1YH0mnYNOHDFz2TJwROX6S+tBQxFHcA3Mus4JuMKlhdMj6?=
 =?iso-8859-1?Q?pDpw2jZftiynaS31T7Fy6mmC1uEQMRLk/6DdXxiNetfBbcnnCsUR9TWzG1?=
 =?iso-8859-1?Q?eGMOlCMYsnq6EYKe5aWPShopIATeOvbgo3DGlEjMvIxhCUDF+Q7RKJGHBn?=
 =?iso-8859-1?Q?5H5IHJaVN3Snkyn96KUSWmlsxXGQxBUzL/zo0ygeUObLFFAlk5n2iLctTz?=
 =?iso-8859-1?Q?WAX2Cj/l3q7ieidXxc57pe9AIktevEGKjaW0GDrX89I9NCPjTWya58PYzY?=
 =?iso-8859-1?Q?QCxd8FfTIWQd2dGqfy4ZrFEZpLR0fkn+nAX7PPgDCE43fSw+oDzqfDK1AU?=
 =?iso-8859-1?Q?3zNgG2KA/yAqKbkJoRTrJtUkxwfBsVyyFsNCWswK1e+G5KWpNz2/sr1lyx?=
 =?iso-8859-1?Q?PxXHJO39rYOG4oUgVjhNFeiqzGzUCuysATfhfeEfaikp6eUWI+IQHwNFs9?=
 =?iso-8859-1?Q?TPqdYpnA9jeSvz8SyJQ75nHQUh8IyXhxFObxQc4r6V1oWImwB1g0Tu7PXr?=
 =?iso-8859-1?Q?wCsbu99/kL9/2VR+n3PSacqHmwh7U6LlL3HJ2MdU+2i0vkf3lh1r4heeCu?=
 =?iso-8859-1?Q?MjZRs3KHG484klZkxLVIsE+u1RzGrT2P38iTBMgMd2rwgIqIHvwOsARWlh?=
 =?iso-8859-1?Q?9ZM4CvldKN/cmKdsqqQGuIwes0EOJ3jk+OOIqNfKxzWU7aeGB4UAC7fZkI?=
 =?iso-8859-1?Q?zWgjp9k+xiQUXNPAx3U2NlQQZd9zqUOM9S7A5oiPN4gDnEOuBZ51TMm1tg?=
 =?iso-8859-1?Q?l7nhyoO3r7kr9H40E8Av2cljrlA8QlKlCeDCBeYJkibpqh8abinjoNEw3q?=
 =?iso-8859-1?Q?oi3rfhdzP24j+iqhPcSHdc2HI8vDiwmf/qJaVxhQSigs4IcEBkvgL87j3M?=
 =?iso-8859-1?Q?ag8PZCzvsQR95rnQCCLatTSsu2smC7LHiwHz56vZKQf9A+f8fsx+9YnAgM?=
 =?iso-8859-1?Q?P0Z2O6BDsawOQfXA9nW3UZ+R6324reyJVfyj/kUhpdKnjxx7Rts5w5MfJF?=
 =?iso-8859-1?Q?IT0+7pIABKF9/oEks4UchRXweUsItF4MBYRaVNkuZr6418eygYv81uCu/Y?=
 =?iso-8859-1?Q?O3eRMgcr6jI3qwztCj2SrUEsXjSD+/2N+O3FsmSZMFExDvBsjlteAnUQR5?=
 =?iso-8859-1?Q?AZNXbbBqcZ5U+YDkFnWVvkHaaByRaiZ5QuVlkmKhnEdgnjAcfu0MNLYhaa?=
 =?iso-8859-1?Q?wK3znByd7lYmO7hXUrCLDCi6R9Uwdj6ODELqD6b7jYvOcMt1Dnj3XIETBp?=
 =?iso-8859-1?Q?Tt7h1dpYmn6Iw1PRrugzSYv2exFN6WSmQeK5yCajhxHGthKgE8WTky0ASn?=
 =?iso-8859-1?Q?8i2/6GHA4h0T7drRmvyvYanXBIj2elgFDiTlpcKtYUjAf5ES+UPZuqJDSk?=
 =?iso-8859-1?Q?5ujCNSxor7O84kWUPbX92eHL3bm9IxPsumN3AB9aPenw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dnV6VChZr/8hH7dCqFUYyikaQ4x8ze5rG+vYvnBOfGP66u58CN7TD3dq9D?=
 =?iso-8859-1?Q?6T7wLmzmuGW+RyNErxmKLK/At8wfD6hnNXvG3zQ+ExJ8rGSk7LAVvosJqN?=
 =?iso-8859-1?Q?1lkGsGPPwBFe5U0frLTB12qdBhsdjhnprHh36pR6kaw1rTAN+xVwRjOLys?=
 =?iso-8859-1?Q?f9bc0gNofyuB3wO2gwt4qrOGZxFWnOlSG7LNsiRqRjGj+Cb1PSwJwQRRVe?=
 =?iso-8859-1?Q?5t697cozgLfDcj3m4+Bb4ezhH/+BqYmba363mxAcIwPk71a4Kr4MFdlHwQ?=
 =?iso-8859-1?Q?6dB3rdHFC65rCIApj/75VTUE7YWjn6hHeuDlHyvXM43qAjhENI3FcLi1Ki?=
 =?iso-8859-1?Q?X+RyRO8mXa+c/QzAy9eQ4uLdjeHqQcUl1lj3TK6LJMwyGac7Y/zgMsP5bA?=
 =?iso-8859-1?Q?eyA/Gaf4p6wQrXdYjD4LvSdQPk6nRPbLLmxHtBjdhqYK3f1ikbGtw89ve7?=
 =?iso-8859-1?Q?uiL95uC1WECofU6L4+FP+OjMCb8rh+YUFpoLFECvVroKM6zWwKsHQxQ4iA?=
 =?iso-8859-1?Q?N5+gQkwuIRpc7w8ZzZ8afwS+y4OGhrbeDGBYOj/KMOBrgaLhKt3b3eTH/+?=
 =?iso-8859-1?Q?pJEPUEbSJMIWdk4C7YjxpFxj2mmmV70rIP4ja4aJvcL6FWc5XFZU9+eTRm?=
 =?iso-8859-1?Q?vOlJyJtL8m69c3JPv4vjOwOZA5+WtzLbxwSwHwXuSj3KOPvpIv1uLeXbZa?=
 =?iso-8859-1?Q?EspIx2x5vYCycJmv/bIo6mMuuEZY76aZfQEDDclKwvWo52pGAE/C9IVAfW?=
 =?iso-8859-1?Q?vl3XC+10uEFw8UJsZoNAmQf+N88YIti5KtkPXv+mpdgj7s8pnv4O/hvmj9?=
 =?iso-8859-1?Q?hrDfmWgXMAtstz7lv8c8JH8BCmJa6lMFRkOW7huUCvVvrZLRSqPEoa4Foz?=
 =?iso-8859-1?Q?XRZat3bgHrTF6EOe9HAFiGQihRsrE1i9zr4X62i2V95Bb2lq53dd8MQ6jY?=
 =?iso-8859-1?Q?A7MiajKEZ+JalNmHwuqeKw0dxxl0zPRAppY2DnXTu3c7Cftd5YTwGO98Bm?=
 =?iso-8859-1?Q?pFL34vUPYRCiUWbO5ig9i3+37iDAuwqMkgVLutneGcRLn8CZC/MdXAa34X?=
 =?iso-8859-1?Q?WDfLc1xAnHv69Wdjy5DmrOJy3Ddl5TdaexLB642y+M3eOVK98jBiC7NMvF?=
 =?iso-8859-1?Q?REvjFGD89HEZG1DHZPovFtSiJxC4ard/5uBisTzqUQMZ9yxgd33Snu4MrH?=
 =?iso-8859-1?Q?daB/WIVArBBrMoBIX8Bt0NLVGhXhFRcsNJyUNXitQtvyp4NvS+45pWsmcz?=
 =?iso-8859-1?Q?EEVBCDtU7qV0aixGkPJfzP2XP9AG/0zLtHaPiwkhOaNx5xg90IfNAu71c1?=
 =?iso-8859-1?Q?hyGBVAom/otxFCBFHF3o31nD9ud+i/H+1wHj7LsyjyNqUFMoxrcTvSzFJO?=
 =?iso-8859-1?Q?B2LG3u2692edRTyT+wCkSkZQhZVMHMZ5uXALmr/YM68D92qYKNKoOq9o6f?=
 =?iso-8859-1?Q?Z9cHHxNsvpQukVvqlDHlZpAs198WZS9m7PHPJq5U+766Ybmi3esHFWY2Tt?=
 =?iso-8859-1?Q?AgNY2FQTCLEkdiFBT7kzLJHG6u3+sU9CuaqQbKvc1x8zKHOYlUz5Rtz8Dy?=
 =?iso-8859-1?Q?OiPkmNpDSjxjeE/PJhdbjdoYHl7qB5VVAjJSeoYrZ9R7IrtOchdU/FiaIU?=
 =?iso-8859-1?Q?Ome/zPLtq8BfUPYUr6wnmLiUyYgjFG644lH2TxucVGIBCG7QG7/yECNA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88da5d1d-48e1-45e9-c3c1-08ddf6ad3637
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 12:16:35.5798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPqztZdw3cEFfqK3/mMqDsTPavLr47teiUBDCiN/SoVPE3ATF4HYXbKDjhk0Cg+yxwsEjRXWR4HufAYe7Y0ioQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8720

With CPU hotplug sysctls implemented on Arm it becomes useful to have a too=
l
for calling them. Introduce new CONFIG_HOTPLUG to allow building hptool
separately from other migration tools and enable it for Arm.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 config/arm64.mk                  | 1 +
 config/x86_32.mk                 | 1 +
 config/x86_64.mk                 | 1 +
 tools/libs/guest/Makefile.common | 4 +++-
 tools/misc/Makefile              | 2 +-
 5 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/config/arm64.mk b/config/arm64.mk
index c4662f67d0..d4995c8991 100644
--- a/config/arm64.mk
+++ b/config/arm64.mk
@@ -1,5 +1,6 @@
 CONFIG_ARM :=3D y
 CONFIG_ARM_64 :=3D y
+CONFIG_HOTPLUG :=3D y
=20
 CONFIG_XEN_INSTALL_SUFFIX :=3D
=20
diff --git a/config/x86_32.mk b/config/x86_32.mk
index 3cc046d9bc..0c88862ad3 100644
--- a/config/x86_32.mk
+++ b/config/x86_32.mk
@@ -3,6 +3,7 @@ CONFIG_X86_32 :=3D y
=20
 CONFIG_MIGRATE :=3D y
 CONFIG_XCUTILS :=3D y
+CONFIG_HOTPLUG :=3D y
=20
 CFLAGS +=3D -m32 -march=3Di686
=20
diff --git a/config/x86_64.mk b/config/x86_64.mk
index 8614457b03..25cf965507 100644
--- a/config/x86_64.mk
+++ b/config/x86_64.mk
@@ -3,6 +3,7 @@ CONFIG_X86_64 :=3D y
=20
 CONFIG_MIGRATE :=3D y
 CONFIG_XCUTILS :=3D y
+CONFIG_HOTPLUG :=3D y
=20
 CONFIG_XEN_INSTALL_SUFFIX :=3D .gz
=20
diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.c=
ommon
index a026a2f662..96a1141511 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -7,6 +7,9 @@ OBJS-y +=3D xg_private.o
 OBJS-y +=3D xg_domain.o
 OBJS-y +=3D xg_suspend.o
 OBJS-y +=3D xg_resume.o
+
+OBJS-$(CONFIG_HOTPLUG) +=3D xg_offline_page.o
+
 ifeq ($(CONFIG_MIGRATE),y)
 OBJS-y +=3D xg_sr_common.o
 OBJS-$(CONFIG_X86) +=3D xg_sr_common_x86.o
@@ -17,7 +20,6 @@ OBJS-$(CONFIG_X86) +=3D xg_sr_save_x86_pv.o
 OBJS-$(CONFIG_X86) +=3D xg_sr_save_x86_hvm.o
 OBJS-y +=3D xg_sr_restore.o
 OBJS-y +=3D xg_sr_save.o
-OBJS-y +=3D xg_offline_page.o
 else
 OBJS-y +=3D xg_nomigrate.o
 endif
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index c26e544e83..64b4d77051 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -16,7 +16,7 @@ INSTALL_BIN                    +=3D xencov_split
 INSTALL_BIN +=3D $(INSTALL_BIN-y)
=20
 # Everything to be installed in regular sbin/
-INSTALL_SBIN-$(CONFIG_MIGRATE) +=3D xen-hptool
+INSTALL_SBIN-$(CONFIG_HOTPLUG) +=3D xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-lowmemd
--=20
2.34.1

