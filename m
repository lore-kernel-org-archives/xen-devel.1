Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0BF606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=evGRqBLL
Received: from list by lists.xenproject.org with outflank-mailman.1491033.1691948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxtz-0006gV-2J; Mon, 16 Nov 2026 14:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491033.1691948; Mon, 16 Nov 2026 14:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxty-0006gK-Ss; Mon, 16 Nov 2026 14:41:46 +0000
Received: by outflank-mailman (input) for mailman id 1491033;
 Mon, 16 Nov 2026 14:41:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xSxtx-0006cb-FV
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:41:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSxtw-00BMqu-Rr
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:41:44 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb161a-2eae-0a2a0a5409dd-0a2a4504af3c-38
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:41:44 +0100
Received: from [52.101.66.113]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb1627-b57f-0a2a45040019-346542718d39-4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:41:44 +0100
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by GV2PR03MB11211.eurprd03.prod.outlook.com
 (2603:10a6:150:30d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:41:39 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0592.012; Mon, 16 Nov 2026
 14:41:39 +0000
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
 b=w4iQm3nXhvGro7nnfRtCp/5T9lxQ2mxCkeLzXoClAVgqAlGhKXj/GxaXvvJdE877dmqSwMgjH/mJb/nGaBNmfSMupem3dtupnKlGQwNVMS0kVxbbxDintTVo7rKGU2Z9WHFRo9dBLM9t1DHcCmSKTrRB+zdVfIEHRBx/e9fSv6BM/L3LO7fdc8jVykoonXSAGSnabS44kl88Qz5gFzyQigI4NhH1L5fKCIaJkY3zACv50x0GcIAavmOFDkI2ZIhCs0tIIWfgUScDhUcdLrx8ugLeOBx2H8FuiAhZgLGsuRxIZCIeL/2IassOq0ltDNTyWOKMdE0BLnBzTS1sasafNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fgg9cHMriHhGOg+Y24vzMOHf2dI+HJEpVRu9jm6g36M=;
 b=cSYIh13L4h/OmvagLK6wkVMg/B/O2ulfjM3f25KLHNwHyV17xf2U4ShgrTHfO/hV2+Lf0/S2pnu1WPKkh/STSYgJDYs2HpY9XboHxUnbUFWE1fI4syiqMN88Tg5nYYlI1qMNDRs2A0kgZUshPQEC5rDhzeyxso3DvDJzA7VEkWk4x+TRNBCph32SUqEWFVECRBoHYPsz6VAKfBVlIoqqY1cKyIt6hD6LaOd952J/DMRYN1b7iRfRQHklf+TN0ryHlOdLaM/vapAvFhbfJnYCEe40jl3srr9uTzE8lKktj+lwxIjrTccsFzt+HCit2neDOL55MJSEhHY8sVSFmC9PKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fgg9cHMriHhGOg+Y24vzMOHf2dI+HJEpVRu9jm6g36M=;
 b=evGRqBLLsBdjxQSXWNT2b0Qe94LBQwuT1G9GSdq3L3OIyobzfoRSXOSo/Y2dsdqUN8usl/VYEC8FqWKEWkh7O9sTXd6vu7rTLGQBDTyYfE2nOkOjHBQ1q6HgaQT2ogBNbrOHOWSgV7OvciyGyxjzjBoijoZOuuayKtoXUfngNX7pHZDbWA1peF4hsYiO9YLF+gObhBN/dS2rGS3kDkfoafdMYgE5HZYAgEVr7moI5ZVlhwpbX5Ik27RYZ1pphLL6Yv9+Z7KAYx1GtcIqT06dgrBoc7BMNlbOeSRgg7YqtD7UyP4KIiKrlgjyH0tXLKb//rXN2ihe5LoovsIVGqom4g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v16 3/6] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v16 3/6] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHdddiWmb+yVDTzJkawQsEb2R66UQ==
Date: Mon, 16 Nov 2026 14:41:39 +0000
Message-ID:
 <573dcbe8068394042bb4dc89e7392845a8d497cd.1794839953.git.oleksii_moisieiev@epam.com>
References: <cover.1794839953.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1794839953.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR03MB11113:EE_|GV2PR03MB11211:EE_
x-ms-office365-filtering-correlation-id: 9a71b66d-e8b1-4988-54c4-08df43efb927
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|261026135527099003|261026140227099003|261026121527099003|261026130827099003|261028144727099003|261021135927099003|261021133027099003|261021121427099003|261021123027099003|261021130227099003|261022075727099003|261022105027099003|261022115727099003|261022113327099003|261102123227099003|38070700021|56012099006|11063799006|10067099003|260925022911599003|260925021311599003|260925021911599003|22082099003|18002099003|261009223027099003|3023799007;
x-microsoft-antispam-message-info:
 Jv/RLNmDY/06uo3NerrJEgsFVPCe24w7ILobmBRsMGDsAD2wbLZgcXpSau0EQ43FtZQ0vM8RABLbMXng6cmUXQJveo6ZsleYLBZRqn/2yrgPBLYbAuU+Q6lR68haInWd6Kefjco/ReRr2LGpaW5gt/u09uVklVlA3o6w/45amGowfswGBT1M/FdHAh8noBKWEpBSbueRQ/NH8OVRaGo+SIOgLLYMpmh/oAqZ8NrhjHM35TVg5zzx4bhn0if+6qzWek7CcptzlIhAv/2W6/fwOK5eswGgPx8rbwswbGVhNc5kzPHLGcuXw4a2k56TVBvfTGlla8nRor1GmFEXa19+vmADpEU/34QUDfDcaWtspqd2q3K14eP8D4yqcTE9espxam9rCQzOSu0UdXK2zMDTp9MWLHaGxbtMrRykdLEz4saqUeQZ1qnPlTj0urhGvd0Pceet7oK7xDMcfUA3Qo4yJcW6xkoK9sYDB/er972WWGwlDwdB12b7vnN7cdP/2Hb2svXTXln/nXo9TJUR5ycEEbJ8GGAz2dmge51zIqIgssiEVLtGTLlWTGaLkWohJ1u3BRFvTFZtkjDhVySOYDKUY1t1pRPlb0Vkfu+RXULiWSmyK4V2YkSDZqMgdflWnVrV+X8pxn0qBo2ZNVlxZjmQdOyHet2+5aWft8Rb4PD37T5AcZWwZJBWnZDwKpPRwd9Fo5suwmmAbcr1UwekiN6KHFBDNmg6QYxwIJJ0iaELcPA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(261026135527099003)(261026140227099003)(261026121527099003)(261026130827099003)(261028144727099003)(261021135927099003)(261021133027099003)(261021121427099003)(261021123027099003)(261021130227099003)(261022075727099003)(261022105027099003)(261022115727099003)(261022113327099003)(261102123227099003)(38070700021)(56012099006)(11063799006)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BZfEf5Xit7WxqURUKfUouVvDTYui/il+D6uL+b7xhjFud+J0uxBGdZEDIp?=
 =?iso-8859-1?Q?n/23aHrl1lWF1yq03V5fgLhXtrGraLrjQxxkL7XqAPsq9VN7IhWHJ6WxKQ?=
 =?iso-8859-1?Q?A3Sb1ak1jbbUVRM6emFn38djgmiipUsQNxxc2mLOHyvo7XJS3ClAsOntwf?=
 =?iso-8859-1?Q?xSnjicG+RttJRkuzENaBgejC9iOwTeSZGHWl6Uf79JDgtzHGN6RJEKmQJh?=
 =?iso-8859-1?Q?pYbTLHeonF2JAsqQ+4w+XC5nOJLBhCmdWzfSSbtjipUXLjTosLZW8ma7FU?=
 =?iso-8859-1?Q?VEyUDAdYB8MQuqXOYbLpm1ca9OrJVpLoRKS0NR8SnU55XQoAZVthQwSAlE?=
 =?iso-8859-1?Q?16OUoCAihGP+enuhkgmp+Idk+YcPnlI8E6tk2ozfz0tMLMmcAr23rtNtrp?=
 =?iso-8859-1?Q?41rmpuMtpCNt+yXkyHBxNpRP3hywn6Pf8fLw+pQW0yMX49Lj7K9p5u6Bj1?=
 =?iso-8859-1?Q?0JW8WOTDBgTIPfYfuSqbKyWNa6IpDGyxb126FWN09HKBePFrvG16uqbB6L?=
 =?iso-8859-1?Q?hAb0/uGhh0Sxq84NjmdSehYNQkcJDKR18Pd5Uj4CHdsbU3EGhJkye/P8MU?=
 =?iso-8859-1?Q?pbUP4sLpsFp3lfsV4avc1Z8q+LwTuF62wcxK4qB29h8a6qjp25kkQf3AKv?=
 =?iso-8859-1?Q?HrQCo8d3c5n2vyiFVpFGwy7U7uv5PJbXpucAz3l5tkFDpoggj2vUZJr9Ol?=
 =?iso-8859-1?Q?s2eRh5KkfvERZvs65HlARG31yG99kLcch14KdxBS3EHyXoZidM7qnHFEZz?=
 =?iso-8859-1?Q?r1rNg9bYVGRLQ5JRX2K+ih0YMp40hQnbSSDUzIiN9iMgJreiF8sdFqmshu?=
 =?iso-8859-1?Q?HJdU4XRXwOCh97PxtZrDOv2DvUMM2Djqj92P+jeKndvu4n4837zcjUiDcm?=
 =?iso-8859-1?Q?FIi6ZxIloPgDR5C3tBv1Mlcpn/LKYw/AET95se15xW12ZH+m+Y3w/I34vp?=
 =?iso-8859-1?Q?S+xGrXCQQr/0/DT5jk1oBled6ctkIXZBTudGjZyaYjsCX84ducLIrEFH2k?=
 =?iso-8859-1?Q?i0Ka2WlAH6B4QInWBk4j62wC+583NO57HRq/OKy04jrA6RxsSRLisscJrx?=
 =?iso-8859-1?Q?2t1/vN8nUkPOXRQ6XSB+q37XB+S+FHYP88WuMnzOMW6ua3GIqJcxxchW2Q?=
 =?iso-8859-1?Q?C4ajwGOSiKP92sANr/voWjByarBk6qz9R+RTZhqW8VM8cBJWPV6JajAHMD?=
 =?iso-8859-1?Q?83/WXfDhBM11CpMdOGV3VY317v5PEvJA763UH+L0/yeFNwUEG4RO/k21OF?=
 =?iso-8859-1?Q?DUdDaFHJV+8h/hXykhJIpZeqIksfCKf0Hle2HtyyctkRzhwexxTJkLQK0Y?=
 =?iso-8859-1?Q?WuHFEsE6hZe5ZbAQw3/1WwLk4MjrARkB5Y9vXfLKpBFx/AxoAZ8BZ7m/17?=
 =?iso-8859-1?Q?lIagvNduFyzfFgrb3v7wi2MuhIcEr5OFlrH5Gvjf/NqCbXeld8vSFqp0Aj?=
 =?iso-8859-1?Q?koueYL3YSJS7pwenNIGb/p1H7fwNs4EjKTDFBcpNLRSvhErVSOLCAtgr+Q?=
 =?iso-8859-1?Q?czLUa8ZIakOjTg52KRR2p5JW3nx0IIl7sym10ao6wesIwj2gi5ZmWZx0eg?=
 =?iso-8859-1?Q?uQsg/3vUCOmFU5jWCe4YxZ+1hFOrb+iaDOduss+/LMo9ySEBRBL89BdPEs?=
 =?iso-8859-1?Q?DdUBAUZn18W14bucqfz6VGyYQuXMbuFXykwb3JDxcVd/d52K0qDC8+eTe0?=
 =?iso-8859-1?Q?k1oAsH3U4defXFLKZHRUF36evo3TuRdv0k6jabERw/PLVH3e53/CmbfWdk?=
 =?iso-8859-1?Q?+SNF1dQcAdZC4F73oHFIY1jbJjwY0v1igkIx/ZQWsxeGhC+J3thGXJ4Tbb?=
 =?iso-8859-1?Q?0YQkhDron29yuj6JHfsswOHpzkJ1t3o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a71b66d-e8b1-4988-54c4-08df43efb927
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 14:41:39.1880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6oFk7KGV9T4q1ObrP5zfgovOkLTFmXCKkYyBR1XSOhqb6nsV5o08BFnqirNdSKRpFU9X/lMnELvN6FROBaLXhzMmO7KdVheRg+af4T82TAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11211
X-purgate-ID: tlsNG-ebf023/1794840104-50AD8B50-5DDA12FB/0/0
X-purgate-type: clean
X-purgate-size: 10172
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce memcpy_fromio() and memcpy_toio() helpers to copy between
regular memory and a memory-like I/O region on Arm. The generic
prototypes live in io.h so other architectures can provide their own
implementations.

The helpers copy a byte sequence: byte accesses are used until the I/O
pointer is 32-bit aligned and for the trailing count % 4 bytes, the
aligned bulk uses 32-bit accesses. Only the I/O pointer is aligned, the
regular memory side is accessed through get_unaligned_le32() /
put_unaligned_le32(), so the access widths issued on the I/O side do not
depend on the alignment of the memory buffer. These _le32 helpers pair
with readl()/writel(), which are little endian accessors, hence the byte
sequence is preserved on either CPU endianness.

The constraints on the I/O region are documented next to the
declarations in xen/io.h, the arch-specific access pattern next to the
implementation.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

(no changes since v13)

Changes in v13:
- memcpy_{from,to}io(): align only the I/O pointer and access the
  regular memory side through get_unaligned_le32()/put_unaligned_le32().
- document the contract of the helpers in xen/io.h
- reword the Arm implementation notes to state the concrete access
  pattern
- drop the incorrect claim about avoiding endianness conversion from the
  commit message; note instead that the _le32 helpers pair with
  readl()/writel() so the byte sequence is preserved on either endianness

Changes in v12:
- Add missed R-B
- correct the Emacs footer of both files, which asked for 8 column
tab indentation while the code is in 4 column Xen style

Changes in v10:
- removed extra include in memcpy-{to/from}io.c files

Changes in v9:
- reword commit description to refer to memcpy_fromio and memcpy_toio
- ordering obj-y in Makefile
- rename ALL_LIBS to ARCH_LIBS
- drop io.h and move definitions to the common header, fix comments to
be arch neutral
- update comments for memcpy_{from/to}io implementation

Changes in v8:
- switched to ordered accessors to address the ordering and barrier
concerns.
- updated the documentation to match the implementation and explicitly
state the supported access sizes and granularity.
- rename memcpy_* implementation files to memcpu-* to follow naming
convension
- fix indentation to match Xen style
- fix intendation to match Xen style
- move memcpy-{from/to}io to more convenient library place

Changes in v7:
- x86 guidance: removed the speculative note; header now just says
  each arch supplies its own implementation or macro.
- name spacing: dropped the double-underscore; the helpers are now
  memcpy_fromio / memcpy_toio. The header also explicitly allows an
  arch to define these as macros before including it.
- updated io.c to keep 32-bit transfers safe on arm32
- moved to __raw_read*/__raw_write* accessors to avoid endianness conversio=
n.
- split the helpers into separate compilation units

Changes in v6:
- sorted objs in Makefile alhabetically
- added newline at the end of Makefile
- used uint{N}_t intead of u{N}
- add comment about why 32 bit IO operations were used
- updated cast opertaions to avoid dropping constness which is wrong
- move function definitions to generic place so the could be reused by
other arch
- add SPDX tag to io.c

Changes in v5:
- move memcpy_toio/fromio to the generic place

 xen/arch/arm/Makefile            |  1 +
 xen/arch/arm/arch.mk             |  1 +
 xen/arch/arm/lib/Makefile        |  2 ++
 xen/arch/arm/lib/memcpy-fromio.c | 56 ++++++++++++++++++++++++++++++++
 xen/arch/arm/lib/memcpy-toio.c   | 56 ++++++++++++++++++++++++++++++++
 xen/include/xen/io.h             | 25 ++++++++++++++
 6 files changed, 141 insertions(+)
 create mode 100644 xen/arch/arm/lib/Makefile
 create mode 100644 xen/arch/arm/lib/memcpy-fromio.c
 create mode 100644 xen/arch/arm/lib/memcpy-toio.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index cdcec8cd03..ba61f9e5fd 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -8,6 +8,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
 obj-y +=3D platforms/
 endif
 obj-y +=3D firmware/
+obj-y +=3D lib/
 obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
=20
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index dea8dbd18a..009bb22c45 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -2,6 +2,7 @@
 # arm-specific definitions
=20
 ARCH_LIBS-y +=3D arch/arm/$(ARCH)/lib/lib.a
+ARCH_LIBS-y +=3D arch/arm/lib/lib.a
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/arm/lib/Makefile b/xen/arch/arm/lib/Makefile
new file mode 100644
index 0000000000..07a0d9186c
--- /dev/null
+++ b/xen/arch/arm/lib/Makefile
@@ -0,0 +1,2 @@
+lib-y +=3D memcpy-fromio.o
+lib-y +=3D memcpy-toio.o
diff --git a/xen/arch/arm/lib/memcpy-fromio.c b/xen/arch/arm/lib/memcpy-fro=
mio.c
new file mode 100644
index 0000000000..98339a5cfa
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-fromio.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+#include <xen/unaligned.h>
+
+/*
+ * Arm implementation notes:
+ * - Byte accesses are issued until the I/O pointer is 32-bit aligned and
+ *   for the trailing count % 4 bytes; the aligned bulk uses 32-bit
+ *   accesses. No wider accesses are issued.
+ * - The access widths on the I/O side depend only on the alignment of the
+ *   I/O pointer and on count. The regular memory side is accessed through
+ *   put_unaligned_le32(), so its alignment has no influence on them.
+ * - put_unaligned_le32() pairs with readl(), which is a little endian
+ *   accessor, so the byte sequence is preserved on either CPU endianness.
+ * - The I/O region must be mapped with device attributes; ordering is
+ *   provided by the accessors themselves, no extra barriers are added.
+ */
+
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        put_unaligned_le32(readl(from), to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/lib/memcpy-toio.c b/xen/arch/arm/lib/memcpy-toio.=
c
new file mode 100644
index 0000000000..c0be79586d
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-toio.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+#include <xen/unaligned.h>
+
+/*
+ * Arm implementation notes:
+ * - Byte accesses are issued until the I/O pointer is 32-bit aligned and
+ *   for the trailing count % 4 bytes; the aligned bulk uses 32-bit
+ *   accesses. No wider accesses are issued.
+ * - The access widths on the I/O side depend only on the alignment of the
+ *   I/O pointer and on count. The regular memory side is accessed through
+ *   get_unaligned_le32(), so its alignment has no influence on them.
+ * - get_unaligned_le32() pairs with writel(), which is a little endian
+ *   accessor, so the byte sequence is preserved on either CPU endianness.
+ * - The I/O region must be mapped with device attributes; ordering is
+ *   provided by the accessors themselves, no extra barriers are added.
+ */
+
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel(get_unaligned_le32(from), to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/io.h b/xen/include/xen/io.h
index 164a20c5d7..0b60be27c1 100644
--- a/xen/include/xen/io.h
+++ b/xen/include/xen/io.h
@@ -67,4 +67,29 @@ static inline bool write_mmio(volatile void __iomem *mem=
, unsigned long data,
     return true;
 }
=20
+/*
+ * Copy a sequence of bytes between regular memory and a memory-like I/O
+ * region, e.g. shared memory placed in RAM or SRAM mapped with device
+ * attributes.
+ *
+ * The I/O region must behave like byte-addressable storage: it has to
+ * accept 8-bit accesses at any byte address and naturally aligned 32-bit
+ * accesses, with plain byte-storage semantics in both cases (no side
+ * effects, no dependency on the access width). An implementation may use
+ * any of these widths, but never wider ones. The helpers are therefore
+ * not suitable for device registers with access-width requirements.
+ *
+ * Neither pointer needs to be aligned. The access widths issued on the
+ * I/O side depend only on the alignment of the I/O pointer and on count,
+ * never on the alignment of the regular memory pointer.
+ *
+ * Implementations are architecture-specific and may impose further
+ * constraints; see the respective arch/<arch>/lib/memcpy-{from,to}io.c
+ * for the exact access pattern.
+ */
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count);
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count);
+
 #endif /* XEN_IO_H */
--=20
2.43.0

