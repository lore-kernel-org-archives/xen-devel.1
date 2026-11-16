Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C30606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 08:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=jTA9BFr4
Received: from list by lists.xenproject.org with outflank-mailman.1490268.1691204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsGE-0006KK-BK; Mon, 16 Nov 2026 08:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490268.1691204; Mon, 16 Nov 2026 08:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsGE-0006KD-8c; Mon, 16 Nov 2026 08:40:22 +0000
Received: by outflank-mailman (input) for mailman id 1490268;
 Mon, 16 Nov 2026 08:40:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xSsGD-0006IY-49
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:40:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSsGC-0070BM-Fw
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:40:20 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6afac171-8faa-0a2a0a5109dd-0a2a4502a3ca-6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:40:20 +0100
Received: from [52.101.72.113]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6afac174-6ca4-0a2a45020019-34654871f831-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:40:20 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by AS8PR03MB6839.eurprd03.prod.outlook.com (2603:10a6:20b:29a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:40:18 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 08:40:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImMXTBxkntsNCsc8mI2oDlOPo3cMFbh5dQcJx9GG/f6GJx6cxCd4wzopdqgtmxIXgsv0FJgz65JGKd3CVlvz6JYHsy/d1a1J9Qg9NoTc6zROjt+kZka9pskFiTOL0Cw7Uvjp5HGUlxwT4ltwfWXzsieEu/dTePCzb0s7KLoOmuskOG6CS84bs1FFUSFydIhPS/bCbwPmjGtgoKYo52dWhDlcrHPwOWAlIwCBbbcwQbz0xzWvrgbdc3sDst5phpjn2d4tSIlalT3ta/9PTj0xeTHmOgamNKhxL0GsqKq1Bt16RTjHfpvKA/FdaXj8Z1WmBlYfdNs+pEIRCsIjSqsHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhT1RCekLw+BX01i9UD9UGm/jvbKqEJuiOR0KsBNI/8=;
 b=trE/84MJ/YOI3d+we+wbUkbR9t1OV4OtZNwXVpsxe4QaKHE5YEf6nbUFQTw7GfDVrvI656ZauyOHHiaLYI3dtYJEBhVa1pdr5xikEPsDCY02Pd4QxmyIMAbRpKdLjrQP56Wb0c3G3Yy2y63g269ryhqKrhBSBurpeOqy+KZ8Jpb7O+uYyT+vfAKpTmVaQQocFgLO1g83lx9pGOqyQDD4d1C9nZSFqhXtZoU2huYkYp/A08NA+qctlrEFi4LuZHDxD1hU7HP5+5YnILrEik0/VAKK4t3q7U7bW5ZsMOWbWiGkmemeAgFksZ1VSmmG8/0Z11mEc8+gGR4mUwrHN6txdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhT1RCekLw+BX01i9UD9UGm/jvbKqEJuiOR0KsBNI/8=;
 b=jTA9BFr4sUwahdN1zgh+hnpt058aVLdtPK5iPQ8wZezrjjox04P1/too9JpukhqbAZ+VpkxPlQRFKSilfMYbsqn3gY1vJjpZFwuBRni/urFjb9URjjGbCb+VPVubs+JWG7/3wz9WtgMlcpmIgYyX8w/kbi8r0iIdOiMMsnWHH8uHQozAlkYAH2PJ9ZtQEjo/gYYCaIGQB9hJRZT82yDlLj2TvvNqSEgcfXrYYFh7UwP0U9xrmHnKM/ZASxlT2RkYkPUJaJ5GLTh0W5QIexgE5bZd8Fln0Z5iox8ekcC0v1sHemUAEIDoEkUjp0qzUvELoMeqK4NYDJv7QIoSzUGaYQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/2] Add R-Car Gen5 PCI host support
Thread-Topic: [PATCH v1 0/2] Add R-Car Gen5 PCI host support
Thread-Index: AQHddaYbeaWcLQ03g02AvTf+IOUjJA==
Date: Mon, 16 Nov 2026 08:40:18 +0000
Message-ID: <cover.1794817300.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|AS8PR03MB6839:EE_
x-ms-office365-filtering-correlation-id: e63ac834-72a4-4e4b-17a5-08df43bd3e4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261102130727099003|261028144727099003|261026121527099003|261026140227099003|11063799006|56012099006|10067099003|38070700021;
x-microsoft-antispam-message-info:
 O5TUTRmDMm3ukOtswghaaFMuyTU2T08M5+FG58AhRAqAJYJvi10rz8e20aJwsN0TlAeQrTjeiTwekxw+vjgFN6eJRq791/cQCQlYRaSGTrB6kDJs2wZQlHEomitD/EzfJ6fkSJG1R1XMFzuGRG66Em83Hv0utuwnnBdG+KZtJfsVKAiQWKsE8cMu8QSImUtDobnzLSMognL9EAprncrERinKXYKenVp18E7MGAIFsfJqvcHABmK+3ztncQfH6oLdd4D2r+iAWKbhPx5/a7y08Y4Pt9PfQtIeK6bFskjb5lP2giP0XATSpVgrkVHlHPVsItrccLkrw9jGZ6Odd8/8SGLSlI/fwEIlB/BESdOUCmy+ocWc+w+3gajqqRVPvTUOVTqFAPl61A/lfEuSweB12MQb9KjjuJ6QBNdgAXbdlUe7Wb5Opmya4EKCKpVl7o5eylbfPTuaXIKupI3qV64IWVmDsIe353zwpDfo+zzTfHZyHDhRPjrayEUDrnskRP5nVZmquKzhWIPOO0Xd9py1BRNo9zXdLANCzpfMSBXFkZUn+hqnqyF/92iwB4RXxFBocV5YV3kahqdJJ4BOhdQ54VlJZ4uPFpZ698qs4wTjTsbdO6kuBeSzPgJ7tr1eRQwZoJ2x8Kl5BwQHlzqX53FnnALeTjwVLdFYWtW2lavzLSZugBAu2nQOR3bW3ovmDkI3Zzdmr+HG4Ke7vGsRjCUcTnjjAs4o9Cxse2sFTz2v0XM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(11063799006)(56012099006)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ehy4eiMhEPf/rWY1/ZkoJhArtUcL3Zr5GdDPec/sLF9bYSaoM9fyCkil8l?=
 =?iso-8859-1?Q?Zg1Wy8MtKysS+pNz1+CSkWCRVgQBdEdg9Sd1vvQ28ec+D8cslxh0/IYeh2?=
 =?iso-8859-1?Q?FIcfyCT8jUNAz9Gqu2sre7CZQQM67RNTgBxU/uvJj3YbBkGwHR2ADd9TIT?=
 =?iso-8859-1?Q?4XvqgDDZ1irEWXuI88v2yykXEiuK9fzNHUwUuIZQ/snkOL4VCfP+nHzhEg?=
 =?iso-8859-1?Q?48tXdNJZp9nINDeTXWLqJivljR0Dql75UxQ0SkAoCRmn+nQ8XnBil1uI3n?=
 =?iso-8859-1?Q?vRPZCuGCl10QfEIrokQgr+qoOaobdRgvLzQcMzS77eyvtAxfVnf+LLLwny?=
 =?iso-8859-1?Q?BRd9cL3rJtEYDUd0JxyV7lkR85Ek/cXXnz7nCG9ZLfu+cu4d+oL8tzP2Ig?=
 =?iso-8859-1?Q?t0kQoLsQ5P0mKcUMSCrkqXen1wH8xhFcxRRiD4aipde/0jz8CIIcwVKMlP?=
 =?iso-8859-1?Q?zQ2//HT2lRnShVzk25n6E+RsUxl0l7wm84mWkDnSLZNOU8Hr7j20CqJ9/h?=
 =?iso-8859-1?Q?MVHjiuQvPhG4bJLAKsD24+rAutDytop0riLNVA7V/WB9QErH6bi0i+tQ1z?=
 =?iso-8859-1?Q?3EREIUM6Z9dP805kzfQhC6VfvlUHJ4DEw6IzksJEkT6ntJfkw4surTydj8?=
 =?iso-8859-1?Q?30BtJBjZomhbyatbf8tSuXgqaEsYmds4f/IcfnWccxJgNJhYzcbkzbmqU6?=
 =?iso-8859-1?Q?TpTH3jcGRi8QP13gBNUZriWIKPfSihfgHurT45kWSuZlOdFVPu4ZeGwo3+?=
 =?iso-8859-1?Q?/w0Dawa9GEtnxTqTOz3PzE533z7HoIYBk+S+5lOhRdEixicHjCbO6VzUs0?=
 =?iso-8859-1?Q?jrARmiI+5aAaaDxHViiu+AdiAy8heetPcC/FgFhYf2FkrrFBqxHcDWPsKf?=
 =?iso-8859-1?Q?+rRnhZ08ERTtZAtoUveKD0QixRH9Ikd3KArdfNzejaQf6KP8ZimIWctZfk?=
 =?iso-8859-1?Q?egXOhdBA6gGKiTfMB0I0NDLUJV21WFSRlGCP9xG3gXp4Qw/nzxjCPamb62?=
 =?iso-8859-1?Q?4aaKFaQOtlNX9gZD1g1TsX9m6ZLp5dkQFZpHK11b+unBOeQ5L2YDItoaTo?=
 =?iso-8859-1?Q?W3i35AD2QvNWpQDF57P/RU/31kdZjJfYo6D2r+By5XMqvn0roslxyvQSst?=
 =?iso-8859-1?Q?iWEX3cpEWdX7FtgYLsxA2QrOeD8uGRaz+N6AMwf10IqFtX01vbgLElj2bH?=
 =?iso-8859-1?Q?1OMNlsBQVoWmj8W05/eqonnyOdZ0eyrCzb5XATHTR0x9Q9nCt+o0BdmxWi?=
 =?iso-8859-1?Q?93lD7g8NY7a0+wYKI69mHAaeYS2CP/Kawpq0uQyCfL9BNUulBrZpDrWiby?=
 =?iso-8859-1?Q?CO+rJvCv0vi4G/+31oPVdEIOj5Wa3XwL5YQ8H89rLog2jAtUTfYas+QbP+?=
 =?iso-8859-1?Q?qC2fltU6V8KrY5Z7Vwr8W2/bzelq2eWZJVt2Di3lCH5JWRo74H2LM+BDct?=
 =?iso-8859-1?Q?x7dcfGyT6bQH36L1WOBI1MO3kE0LJdFk8JhgtUgGaobMx5AsF4LsY6kMqU?=
 =?iso-8859-1?Q?16L2gV7XWWM5eYYCdluIxZLuH+fZHyoY/TIrpe4GvAA1VGukRgPhXmtPYS?=
 =?iso-8859-1?Q?o3ssuSNhrzG49KuWA7sm2kYhQ/u+tNz3bIyuI6gxeiB2SDyU4O8Uuv7Szr?=
 =?iso-8859-1?Q?0ooH07nU8LhIIvqSNjpWjZeFuf282RrMXGedHPDoTuBrzsNrGBjJhTCcGc?=
 =?iso-8859-1?Q?cCV/06xWSGDdJPCNl9yWIDqnzadSQUTDHFuABtC/8054/kqxuFOCKQuhWu?=
 =?iso-8859-1?Q?FezG8jzbZmwt3fASV4xK9/zuq4MHaMzUpDuUd2n7VHu/4r8kyhN3CiQTlQ?=
 =?iso-8859-1?Q?RYKH9+Cmag=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63ac834-72a4-4e4b-17a5-08df43bd3e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:40:18.2609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FIeHes0mEoOTxHHs8EkMsItGA6ULJI6RveJHhWj3MnLiN4dj+1yB6qdB5O/98V5bGHaJDKzJm4uMNBDynDR/+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6839
X-purgate-ID: tlsNG-720697/1794818420-F1AAD2AC-39A993AE/0/0
X-purgate-type: clean
X-purgate-size: 1082
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add R-Car Gen5 PCI host support to the existing Gen4 driver. Gen5 uses
the same DesignWare integration and register layout, so one driver
covers both.

Drop the generation number from the driver file and static symbols. Keep
the rcar4_ prefix on the exported OSID helpers, as the BDF-to-OSID
registers only exist on Gen4.

Add the "renesas,rcar-gen5-pcie6" compatible and skip the "app" register
range on Gen5, as the hardware does not have it.

Mykyta Poturai (2):
  pci/rcar: Rename PCI host rcar4 to rcar
  pci/rcar: Add support for Gen5 PCI host

 MAINTAINERS                                   |  2 +-
 xen/arch/arm/pci/Makefile                     |  2 +-
 .../pci/{pci-host-rcar4.c =3D> pci-host-rcar.c} | 49 ++++++++++++-------
 .../pci/{pci-host-rcar4.h =3D> pci-host-rcar.h} |  6 +--
 xen/drivers/passthrough/arm/ipmmu-vmsa.c      |  2 +-
 5 files changed, 36 insertions(+), 25 deletions(-)
 rename xen/arch/arm/pci/{pci-host-rcar4.c =3D> pci-host-rcar.c} (81%)
 rename xen/arch/arm/pci/{pci-host-rcar4.h =3D> pci-host-rcar.h} (88%)

--=20
2.56.1

