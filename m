Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F04C606A6A5
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=EwYMA/kH
Received: from list by lists.xenproject.org with outflank-mailman.1498489.1696201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUVam-0004Cy-I5; Fri, 20 Nov 2026 20:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498489.1696201; Fri, 20 Nov 2026 20:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUVam-0004Cq-DJ; Fri, 20 Nov 2026 20:52:20 +0000
Received: by outflank-mailman (input) for mailman id 1498489;
 Fri, 20 Nov 2026 20:52:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xUVal-0004Ck-B1
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 20:52:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUVak-00AMSQ-DQ
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 21:52:18 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b00b2f8-8faa-0a2a0a5109dd-0a2a4508ba48-6
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 21:52:18 +0100
Received: from [52.101.83.75]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b00b301-f659-0a2a45080019-3465534b9e70-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 21:52:18 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by MI3PR03MB972747.eurprd03.prod.outlook.com
 (2603:10a6:290:204::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 20:52:15 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 20:52:14 +0000
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
 b=i70xlf3AltHVR5iyYy/8Ux9f8TZgZqxjGkpRcWLNI69MnWvh6MkulSJ1jKqE/128Z/0U9P3gdzBq6W/g9PQ7JfGCS3EjLx8qfHO6MQMTAmr9hUY+3zcPsXaqoKxsHSaTXS6KTOXegqzFFtsZpGEflcKDoUOIYkku4Df/uZGCImIyZkW4jM5cKYBHA0a7tMVKPZTZEm3VkKKYLtuWSt9aXkoPEyyspIpPqlzwQPiXrRHWky2akHyyMPws/tYmPKCqgtAOMm4U8vQz+XsR436pEnxdDwtLrYFbiTjsYRJ/SpjCVjjgG2AniZhWmfzgNOrWh6PJqxLcieiRKZbexOTpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMPvKSzhDPgoKgOrw/x+lObknh/fOYrWvlw9dsMDZVM=;
 b=L6vtwwbZZtxQyPwAkzbFY5qOj1valn49r0fyBy5tgyZ6n4ql2vXmDMEuGXhD77/sIAtwsB4UUgFayXaewYTBHFL9gFSIylDbhu2M4v72loXmOc/wkgHXRo+tgR4GAJkwBb/uR/2fyCuefVxtFn67Z5zFcCm2PhvgT2embn99OHrE8ZW3pcR+dLLLLbafHNuRHXx07KrLYKSlYXuyTN9Xz78QmBmpOkCgHR3pf33z+d6Vb/HFhyTMHllUxpU0nx5f4kP2Hsv8cNcKytK/qc0mTHTjId2+BY3wrCWD1qk2ZK8P+jxdL0OYKDlITG6D5NCpL0dgT3nOTt7/myIju6BSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMPvKSzhDPgoKgOrw/x+lObknh/fOYrWvlw9dsMDZVM=;
 b=EwYMA/kHtG8/UsSwyeGk2zW2JC/7UZUWfkDXl1SepNQ0oaZIyVVAHbmYXRwsj8W/iHWJvPpdK0R8qkO3ZRqkWAyIrn5t8u0H9/x2l8CM6O6r3AAn3eJ8sAxGGhrjv0jCwFYacEFZJDcmW5aUCC3VrMavBkKk7mLJZNK0p+BFAEeN4h85BDHWDrqT7CxQNynayFeTbBKDGKqIBr2DekJ+R6lidLBp2buJBqEn9Jcij2UrNRQV6AqLySu4in/qnTgM5fnIfk0OFs0aOy2oclgkFMCnZCYWyG3TpQ7mtcbAHkb0dgQIsQeyCt3NbT1CCU4VICdKkeP5qcR6ewyPsI2kfA==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: its: unlink the guest device when mapping fails
Thread-Topic: [PATCH] xen/arm: its: unlink the guest device when mapping fails
Thread-Index: AQHdeTEFZ0qAZvDC30y5Z8fo8wRpjg==
Date: Fri, 20 Nov 2026 20:52:14 +0000
Message-ID: <20261120205205.398840-1-mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|MI3PR03MB972747:EE_
x-ms-office365-filtering-correlation-id: cbda6be0-b6c2-4e3b-0008-08df47482800
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|261021121427099003|261026140227099003|261102123227099003|261022075727099003|261022105027099003|261021135927099003|261026121527099003|261028144727099003|261022113327099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 Vp0BDkRktnSzuCWV6wGJNMAk3ZIasgeF6T5gpnB1kcPjMfmkwOtzwtS35S7dG2S/eD3EB7dEcuD8E2BdVrnDcXwufkCQ8zbL3o28QNxkbmb3SEf65ncLf9DtLLM6T4XBymMwEjSskzLQNKcUoERG4XbReDYICi1QC4JD25LQ+/gYkVtK9s58IKJ0pmv2rZ1EUCaBVM5aT7bmoPbO0LTOhTyQR0sNURmUf2mdA8QAIX0YDWTHp9eUHM4fV9kZO338muGUIbN27yt8gDux5tYUPI8zoJmg1U/w8i3NmxE1crHavgH0MVLkpi0f1s/vFgaoq90OtamSAXX1U8OEiPWkjVWTnnuTUvuESURUiKFTEsrmbnmb2Vt4C/7Sb1eJOLCe6PEcFz6gqJ2lXEcf3IV79PJt/kgjlWiMui6KkMLG2AgRKTrtyKTGYbpeE7wZAVdXiWSuWtKpxbqbhCKuFReesDJdRCb49eSVIuZC/IZmBlLVtD3YgqnMl2iOEWol9xxuPRtq1E6HROT3nkk/WdaQ8AOoMSDRb3BQLnNULYuovQrpVa5vux92dGXioYtRoyy9PkeVMbWb2ItakGoLHBAlo7RB1BZ1zOr3IhSnet6M9iZLpvxglxI7YNTExzaCgmhYvJosaiPfGs/Nkr952B4EPtlorgztYjAshNADa4Z7X/dki4KzgSje0jcZoHGRJKc1knvy6WE2TYi87Q7k5cUb8Grtm+u6euPJ9LyY3X60Pcc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261021121427099003)(261026140227099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021135927099003)(261026121527099003)(261028144727099003)(261022113327099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0oWaX3loIK7X8EYBGZcz095RDbfU7gUGCnkhjXkVg7vPmOEfbaXkvvSn0b?=
 =?iso-8859-1?Q?lg+gJysHpRwAiMDVee1i8EJ/0+jwSIs1DH2KjlTLkP8Jo9DOnwvKIhlhEf?=
 =?iso-8859-1?Q?yfvJHl5e25xSTVT4nb7yU48bpHkQ58JieDLFoq+mRqCCKjMUuw5NR2mtLK?=
 =?iso-8859-1?Q?GkESFFRQ4lVWmwhtGa4pgvJUXwRS1U8Mmyn8eCd1B82Rsfb/cyYD0KgngP?=
 =?iso-8859-1?Q?V1zYdZAIGbxBy6ko3oTKACNsPfnn70EilR7ytykIrPNTeag8yFj9QC+YNw?=
 =?iso-8859-1?Q?zCKoT8jP/W7PZQSbsc7R3Rlp9J6pjAQ3T7PILtvBPFgBKp/ERjmh7KS+54?=
 =?iso-8859-1?Q?Ibx6bs2Md2naUFyAVpZgxFVVoXgP3fWdufBrbugvcueVV0ZY0cK0d5D3Hj?=
 =?iso-8859-1?Q?IJfDf1Sx0GQREIYXZkPAjjZ3EXSGDs5Tv6/MCCdXgA/9SzfORyoa5u3iXS?=
 =?iso-8859-1?Q?5fmuoiWPAwa/3TGUnpc5yzK3ltwEgSEpSchxSoyVuY3X6pb8LpMTDubT2Q?=
 =?iso-8859-1?Q?z9eJr0fBgfNKmYVweLoTjSB/EYpSAETLHV+cYK6NWUGncl/aI6a04WQjZz?=
 =?iso-8859-1?Q?GWVCpoQPJGGrJrMYIGrF6Zrds5MDKQP6HUSacs3nS62Zsw3Xr/DQiY4NeP?=
 =?iso-8859-1?Q?7qucrJESfZGlzaFbwIlHUTHrIjMgBzxtSWl5otRlm1cKu5hD+JYSMLtaWB?=
 =?iso-8859-1?Q?I18UAKwQeUav1EW8KSSldP5/5q1rRqVYSusJqm4SMLFC0YRe0SssBCPVe0?=
 =?iso-8859-1?Q?cZMk7+JYy5GPlYJcKy9DFxdUC+VJ2qsWd/ZLNs+27w9D0zrW5stJmIpJnI?=
 =?iso-8859-1?Q?RYD8S4x7tmcq5T5WyF5Ruja4usor7CRBs2nPk6yRt/Xq6yulQ1HVVBvv8K?=
 =?iso-8859-1?Q?TXx9As4203N2t1In6kSKfaywlRDYU1dRKHLpc7YUEi+Vg7ih+TtF5Zk60Q?=
 =?iso-8859-1?Q?LyCqgA0G90+gYfFrFSNFFJOJ6HZD/nQaqLDTfIuqALaKOCJQ3ZlglB0cW+?=
 =?iso-8859-1?Q?fu6X7mK7YM6bJVsEFRA0LT8cmKH0dswQOLf5ghnBYs2rkxLPUM79tLU5h7?=
 =?iso-8859-1?Q?v2nC+w8mnVDMPGf+u62uFOv9ERi24+jC68sFT2BizIM9pcsVR6WWjUY8oS?=
 =?iso-8859-1?Q?fZw4qKKUjD9SRo/Ln2PWphIcfPGdaEfspUWDX8HggD3FeQstMlBCipfwuY?=
 =?iso-8859-1?Q?flrTfGS3kpzZ5UOEREZUtWTXa+X+1uGQV/e7s5nicqbDQSDzDJSCkL8z/M?=
 =?iso-8859-1?Q?Xyw4DDm1qJ1VY+tzUyWZxhleLdE/Zp2dMYtd9IUCM1wUmonwHzw+FtRxbz?=
 =?iso-8859-1?Q?O/Cl2tMJ+oOTr0aR+aO90jV3fBlUOBCS2/ZovwxhxzujdAwVUZSpXqx11r?=
 =?iso-8859-1?Q?wxlZE42xz9pZ/wbECWpR+b5iTVLf8z54f2HEiFo/0L+i1qaulpAsVgHOBk?=
 =?iso-8859-1?Q?/CHcflF+arO3y3TLvKiImRIkQ9s7roqocoeQlMbA52ljDyZRQGiiEzoRaF?=
 =?iso-8859-1?Q?YP6aQkslXmSs5pwnshgxDCPVuAcB0Bw956eKtCqWe5dtSLuxivpAU+40k0?=
 =?iso-8859-1?Q?N/3Skp8pfj23RT7J9wZyw8xkrHr4DX0eKCg0S9fuRhdofABlWyPqmqgeP9?=
 =?iso-8859-1?Q?i32zlTcRWvgYZUI0GRml+8g8UD+6dsPfLHhN/uEqUOBWqKnAGhv5nHTyhQ?=
 =?iso-8859-1?Q?cnoNdVtW/UGdnvdKf6Im5Lqq3v7ose6Gjurt+U4xJSom6bsKHd/T9gqgxI?=
 =?iso-8859-1?Q?CQJtju89a+otLX7cy0lsED0ij5TVHxmIz3ylfRXWpfq5AH?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbda6be0-b6c2-4e3b-0008-08df47482800
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 20:52:14.4081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIDvCIhB63x2e+GDnNEuD3w6dGT1cN1mT9AQSCWmy9FEYaaPvWJVeFcDiU/731vdkWfEJjXJGgmw0XscVyFlkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR03MB972747
X-purgate-ID: tlsNG-c1860d/1795207938-CD94A87B-2205B465/0/0
X-purgate-type: clean
X-purgate-size: 1428
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

gicv3_its_map_guest_device() adds the device to the domain's RB tree
before it allocates the host LPIs for the device. If an allocation
fails, the error path frees the device but leaves it in the tree.

A later lookup then walks into freed memory. The stale node corrupts
the device tree, and remove_mapped_guest_device() frees the ITT pages
a second time. The double free hits BUG() in free_heap_pages() and
panics Xen.

The hardware domain (Dom0) can trigger this. The host LPI pool is
limited, so Dom0 can fill it with large MAPD commands and make the next
MAPD fail.

Erase the node under its_devices_lock before the error path releases
the device.

Fixes: 69082e1c210d ("ARM: GICv3 ITS: introduce device mapping")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3-its.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index d561def0e4..f2fe596490 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -915,6 +915,10 @@ int gicv3_its_map_guest_device(struct domain *d,
=20
     if ( ret )
     {
+        spin_lock(&d->arch.vgic.its_devices_lock);
+        rb_erase(&dev->rbnode, &d->arch.vgic.its_devices);
+        spin_unlock(&d->arch.vgic.its_devices_lock);
+
         /* Clean up all allocated host LPI blocks. */
         for ( ; i >=3D 0; i-- )
         {
--=20
2.53.0

