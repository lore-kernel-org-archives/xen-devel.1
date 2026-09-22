Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA4CC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:40:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429017.1651955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91fa-0005ct-VR; Tue, 22 Sep 2026 14:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429017.1651955; Tue, 22 Sep 2026 14:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91fa-0005bz-R7; Tue, 22 Sep 2026 14:40:30 +0000
Received: by outflank-mailman (input) for mailman id 1429017;
 Tue, 22 Sep 2026 14:40:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x91fZ-0005TQ-Bk
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:40:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91fY-00AHxl-OO
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:40:28 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ab2934d-bab6-0a2a0a5309dd-0a2a4506e4aa-28
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:40:28 +0200
Received: from [40.107.159.85]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ab2935b-195a-0a2a45060019-286b9f557f3a-5
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:40:28 +0200
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 (2603:10a6:800:33d::10) by GV2PR03MB11837.eurprd03.prod.outlook.com
 (2603:10a6:150:36e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 14:40:25 +0000
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04]) by VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:40:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOT679ArTBr/HeYuDf8sgS5VQ1asvZts8bqtzOihtIXEM0FS8Zv8Cd/rTP40fJ+gI7iCAmOjZkp8QI9Ch4ehDrY6oJHXB9nxpvoTTNZs9wYuEOQNOlVX+nth3Ndkso2EK9ggcmstceSy3IsbWMknf0V1uaDa24aS3SyWbdHFFqnKEFg4U0EZpQ7PKOmIsCsbycFrEM88Zasw1sbVpwLgZnd8sIQl8Lf/hhYCZ2q90kpdFF8+NC0xhP59/juCH3sdeduMzaHwpB2RdeMuPSilMr4eZvh260T9Yy9a1wD2Quxgr0S5rENhXhcejwJaJPThMa/CZzeIY3dqcQwrbWcBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaPlyiQF1WAzVJ67Z+NxO+5WCG19GCRvpAl3HPh9kPA=;
 b=r8i6blBpijXjGWUQXMLzNRLrDA4Cf+nmuCqZNMTozCOQdTjUlNe0zZKCFeffWT8ytGTuRGL+oSh0qHpC/8Mu9RmzxqrRyY0wLhc1liXHIe6OZATXxL+eDqw61p3HWvAn2I/oy9BlfMMkk8LENyHy4tUxSc9hve+yyL1MyUPHcPo8IyuuWY6L66RxLOMuwxh95GcpUDYLz30WhbYQV1J2C24ZXe6lIRltrPCrndrcE7Q3CkKUQpb5fRUh795OJr3WUyYeLHzIrugKonnUpXQNHe0Mf9t+si0tOyKnycfPv9KAERYwaD7qzEs3dGqTtMDc6XfB5uxncsBwxK4fnbM21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaPlyiQF1WAzVJ67Z+NxO+5WCG19GCRvpAl3HPh9kPA=;
 b=BRQoM9JTpObxHDmWpXPAcgCFFTPsfbDbz8+tvQv1dOZION+kuhPa+9YNe5yP+YpejRE8wKbE3luGh7Ig/krF+2iE/ZuiFF82KjCTjNHKDBYNSX+ur6oVb7WcQILWC1k4u7L/l0BXzkhB0ygJ/0ooOPZZ+BnMjq7TK8xs7meMMPA37Vyx8gScmrHfTbClMulktVvDAuS/rDWYJZCidlzML3X/YssYhbpavwpK3zx2yWRfIwC3zNi3ejus2i/nneRHY/TztK1QQeJNc0LsMizxfq1cRnx5fQuU0atCgTn1RxAgP7GPz7prUv8eFIDXK7im70AgsisVGMDJs7sDwJSmJA==
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
Subject: [PATCH v13 2/6] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v13 2/6] xen: arm: smccc: add INVALID_PARAMETER error
 code
Thread-Index: AQHdSqBNho+F8L2W9kicIm5Tp8rY8w==
Date: Tue, 22 Sep 2026 14:40:24 +0000
Message-ID:
 <07687288fe00a8a6a7bde67ab35a9039605c2734.1790087968.git.oleksii_moisieiev@epam.com>
References: <cover.1790087968.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1790087968.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR03MB11419:EE_|GV2PR03MB11837:EE_
x-ms-office365-filtering-correlation-id: f1f9a765-5170-4db5-fbc4-08df18b7709f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003|38070700021|3023799007;
x-microsoft-antispam-message-info:
 tuG4h3xsu9t6//uPGNkYS8SyO0MSkZabCgoYzzNpztgs65SutANK/WvRsa92cnPVzePjB5caEyvarnLGZS45N3arku7GmmA0WrfRZ1vVLJ8t7lghUAI8iaDYe+FNhAq4ymBjhPdHccfvrlO2zhuj7RRJcPcuacAelnDei13ZflmELJsqh+fRAvFcOORWV3MZB7UmPfrhVrDp0FN7z/nXoh7ucAQpwiD9D9yZaPUlgiz/FnxvcvbVf9YTGy2WBkec+xHX8r1lubnB8To+UYXbaZasQgkBZYldFWVJjjfh3LNZVNlkz57+98oRi9rU9SmeM58O4I43VdSzOzyhfM64/7KRa2FSAJG3vUbF5s2RG3SdxMx3tXbjhAuggco/2md3AGQvgWlhDWaLlQHFZupTZi85Akw1+TMg5/dSyvwkPWX5rN9RKygi/TiUfHbspVi2xkpILxY2qCEOqFBwcr8QioXbwu6XftaAFfNmsv5j0Im5EA5lcqANVKkMlw4iHp7iVyKgoYliQcbdVn6ZFsxOuQkSr0OaZDer+wRFnAN4OoXlvAUPHwD5hgnGscqU0opq1nyc/C4eaLPmwEM2yp/zjMT9eHYZR9FVbo3HLe2RfRjZbKTYuuHziHsKSLQkPR4acN/0vp6pFfrAhy76XhdNJwOrc05vRcz0Hkwaywhm92DNPwPhVlvQeiWpuh92fqBgyH+Hy3+98Ioe9aU3+m710mPtbmo7RdyH0fGZ59PbK6k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB11419.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(38070700021)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BS0WccDecmGc4U07wGInHxgi15hEFQk6oCiShnuPcqNgR87AZF+7BgymD3?=
 =?iso-8859-1?Q?+GK7lzBn6mRMy2yIm14cB8TrQmWRlKn+OSWNZTsoOImeNH6dklHXIqN+60?=
 =?iso-8859-1?Q?qss/RtoXD1823YHHnjvIVtmAOZjhyVgjTGCrbK6XbqO8u6ZOCHPZKXQM70?=
 =?iso-8859-1?Q?cSJPZ08D1ESbx2RpHyMulqHS1eKdBOI/TEKdNklroYCrOuzoOWGip+ov92?=
 =?iso-8859-1?Q?0U+XV7N+TGxj1icZD+BmJx+puc2bXg0rol/4EPqtyDOyK/f+6WpI2g9qLr?=
 =?iso-8859-1?Q?ow8WId+B7VZ20TuC4IUK4D3zM/gt/zs3kWtgXrD7iUssnJFg1AAT9Yxj64?=
 =?iso-8859-1?Q?KbZLSm9yN9DNFl/IWsG/IQvy5hCFL5beXR7CE0YaSx9dY4t5OTpzM1nCRY?=
 =?iso-8859-1?Q?YH4oBlPEuv53BmzJIPRw4CcGFwcdUnaqSHEkOa9RPKBYJBdVNbM/Y5z9yW?=
 =?iso-8859-1?Q?7eGZjB4n0DCxdRVOo3PcgDJyfQMIhdBb9YMVDExFmJvfbZ53AN3DsWEO01?=
 =?iso-8859-1?Q?/lOSXNt/fApYzB4Sy4U8gkueZA0DNDDeZqsdukr9ekaqePrarGVvbC+4aG?=
 =?iso-8859-1?Q?yEMHDsEOzS54MqD0l/ilK1NQ+Vq0Bo7fq//uvW7JQxLpzTqaAxvO3EM+3R?=
 =?iso-8859-1?Q?oqppJRo6mqDWTA0t5rrwtzB5X/nSk5GylcjnqDvZdbgc9yb2WvhxhgnisF?=
 =?iso-8859-1?Q?zMKYWIwTNEk9Pg8qlBmSFzcNJ455l1+YnOo2RKcp2U+8PERkfRq5Xef1gx?=
 =?iso-8859-1?Q?RErWRTfgj4urkuuHS2Jr5VvyBblha5yiBcU1nKyCmLM2q4LGIG5K1fPHqf?=
 =?iso-8859-1?Q?uTu50fQWXUNS4J/bjq0m1FrmQMuWVPKnVG+ZJI5HjFj4EycV8DsyrFJuhH?=
 =?iso-8859-1?Q?TBTUqYBkkkIlIx2ztuFFX6l30bV7AWAomwN/7ucFUb/Cw9C7W+/hpJvBOY?=
 =?iso-8859-1?Q?Gc3P9AbbuC+WaeOZeXyvttv9+fnqj5uy1kMrrePj0jO3ZcPu/u1kJ/0XQk?=
 =?iso-8859-1?Q?DGEIcts8MMDtpAx2Kq5qjvv36DuuljgfPznbsIFC61VUNj6dPB+zb5C90N?=
 =?iso-8859-1?Q?AlZ+fieB5KGGZTUghHnXYBqPlJCEuc5zY0lX4Dwjtb2YJwH2WL/i6iw0lW?=
 =?iso-8859-1?Q?AXNOWGwlRJP6pyfuiWKvPgdNvIVBGtgjcgEia4lg4f14SvR9GuAmq6+MqD?=
 =?iso-8859-1?Q?qqITpnDL0umINPqfCxLQZPjgZY6sISRKkWRsdkcOn1Zx51/v4Ny/FriseQ?=
 =?iso-8859-1?Q?kM4uALT163MKb2x2e+E9Pn0/8J8rp3fYr+xlcAmlBh/uZR25egttZd7uwO?=
 =?iso-8859-1?Q?NMmZRXiD8Ic22YeexFv0TneV4sKqdk5eF04MU9bRJd6F+ho2dW0XB6q23i?=
 =?iso-8859-1?Q?CT1WHweQfYuz21m1Qsr7pNBMg1gI8+DQJFV7Mx9hp3twyfDlKg1M8sDKgv?=
 =?iso-8859-1?Q?bfpl+dy6Z1WENLrlX++JhVuJxb1BO9Bdyh7lJE9pTax3c9DU0H4h/j98OO?=
 =?iso-8859-1?Q?o5Wb2+1efBV/SO/Lxk+YSgxEPDGsRKMYwv6Z1x8b6o1EP4wIWeQkJwQvdL?=
 =?iso-8859-1?Q?HNnoOREAz1UNpCuIEwj87Jy4o4+mJFZtySq2l0UTLn5m1TMn7kEk2yuoZn?=
 =?iso-8859-1?Q?cLvqpaClmWxULtq9Pvn0Df/MR4n+UdbpjKbHDrxywpXPme59Q/BlG7BKxU?=
 =?iso-8859-1?Q?Kkzb6O/+Sd5u/KYqv93Oa/HsN5DVeshgKexcn78qfZqlbQsfx9KL1paRzl?=
 =?iso-8859-1?Q?eR+kjuT80Abl4LArs4fWBomXsQqeAL20htkgsLYSu0lfi8GK14uIyo4Dhr?=
 =?iso-8859-1?Q?Ewk0GeHlbFWsHAWSJjXUAcw8BJwi2z4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB11419.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f9a765-5170-4db5-fbc4-08df18b7709f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 14:40:24.7229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AdYn8G/C+eLxNyuF4I1vlP1NvYLI4r0TlfBA67/SAtBpOaS8HRM26P03haJlInAiVOF3W87C8xF8S8YbMHdasxzbFSChNanZ6v/yclqlcL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11837
X-purgate-ID: tlsNG-16d1c6/1790088028-F4C0777B-58AFF651/0/0
X-purgate-type: clean
X-purgate-size: 1118

According to the "7.1 Return Codes" section of DEN0028 [1]
INVALID_PARAMETER code (-3) is returned when one of the call
parameters has a non-supported value.
Adding this error code to the common smccc header file.

[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---

(no changes since v12)

Changes in v12:
- add missed Ack.

 xen/arch/arm/include/asm/smccc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/sm=
ccc.h
index c7763acd7f..91c9bc1186 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs =
*args,
                        0x3FFF)
=20
 /* SMCCC error codes */
+#define ARM_SMCCC_INVALID_PARAMETER     (-3)
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
 #define ARM_SMCCC_NOT_SUPPORTED         (-1)
--=20
2.43.0

