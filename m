Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1C5CA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 11:52:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443242.1660619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEmfe-0002BS-8l; Thu, 08 Oct 2026 11:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443242.1660619; Thu, 08 Oct 2026 11:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEmfe-0002BL-5L; Thu, 08 Oct 2026 11:52:22 +0000
Received: by outflank-mailman (input) for mailman id 1443242;
 Thu, 08 Oct 2026 11:52:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xEmfd-0002BF-KL
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 11:52:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEmfc-005T0N-TL
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 13:52:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac783d1-2eae-0a2a0a5409dd-0a2a450ae50a-48
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 13:52:20 +0200
Received: from [40.107.162.138]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac783f4-f2d2-0a2a450a0019-286ba28a320c-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 13:52:20 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by PA4PR03MB8223.eurprd03.prod.outlook.com
 (2603:10a6:102:26d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 11:52:18 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 11:52:18 +0000
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
 b=EyU5ZGETtHfOr68qXGAhr4IefJVo96vCE1couCn9Kh+3/CVZtbBS3JREHIG/EdPPuSEwhUQB7BmknSOej+ldRD31GyQM+ZrPK1lNa0sQTgjKAl9aYNRrS1QFrPS4lCaLm6UUY4olmP1zBrjFRwPQ8dva7QeU3KWSxlEaySNqvZ/Ih77jc1tZIfg336y4A2n5xXZdVdyxSgCx73PQhdH8VkI0j9Ma+47837Jk7w6u/QcgOuyOKFAgL7ReQPHh69O4rkC6FclnR6J9OQHXEc3yqPOJG/5Zs90b2u51MrVR5j6uwYGckbswpgtsnSYntLx63GVv2D6gg4lI1oeAIzNKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZDA2glfVKsohaT+q9MvuOP/DiisaMtmTAUR0MP4+R8=;
 b=sDVKvYUoCVqhhtXmH75mJYtsfdjwUrMVPaIbIIrvzbpxiSx/gj64wIRSk5RB2N18/f3JlGPIE0U7g3nueyjbIBgbZLNwVtaO/Jp1BgVgwAXxwKfNEcn3XkSqspCIb/Q40cYLhECrPsgo5uVO+QwungswSsbucGVChaNwyDzd6/luP9eXVtwOnlJHk8B1fj+WcxIht3Evmktak1hSD2Dw/kru0D05fssnyT+CQjzlYDnvzrTB3Tnab6f5pJnpVpL2Q6RCY31gRHcaqDE9bcKZs2Kz8gsXKiC0POyltnFzy+tLor2JwhICHE8MA21Gvph7ct2UbY+3fZqhgnuiSPrBNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZDA2glfVKsohaT+q9MvuOP/DiisaMtmTAUR0MP4+R8=;
 b=PyBNYmL8Y51VoORCqGf9ukoMtY2qdoe4UdDMId12Hid4qRM0F5tAhPt1YptPK1ykR37ASuKBNGN1RlsTiB4jhxbMxPkWNbRWkbyHI1XOmWL0qOlYyuvTy1A2/Z+Fa54PA4BiKZVmcvmskmiMQBBWfA7vjW/1TQI2znTDiwUaOgMKxuaAsylITlQ8r8shHdEcQAsL4zkGccQPEADPXOaqbIR6I4yqJeh+ECQ5LpCX1SK4afs+i7ivgFi6Ra1+ZY3+RaBmzBm9wU6nRc+QvEuOFdrtXHRkCuwr9fZSL60Y8fLZQbV0hE3VPRYSjsZGiTZCG6lABJUS3mKFFXRH42LjUg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] virtual_region: address Misra C:2012 rule 18.3
Thread-Topic: [PATCH] virtual_region: address Misra C:2012 rule 18.3
Thread-Index: AQHdVxt4SHehqFazWUu0IFdrUKTAbA==
Date: Thu, 8 Oct 2026 11:52:18 +0000
Message-ID:
 <2281ddbddfaec79635ba8d2cf8aec669ac858e89.1791458533.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|PA4PR03MB8223:EE_
x-ms-office365-filtering-correlation-id: 724c8204-b68b-43c0-2b1f-08df25329ad1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|42112799006|366016|1800799024|18002099003|10067099003|38070700021|11063799006|260925021311599003|260925022911599003|260925021911599003|56012099006;
x-microsoft-antispam-message-info:
 a1XUUD3luA3j5qsxyXWNTcjAVQ7sR+HR1zJio9qWuOxy7rMkY/u+zsAAWkFsZPbSo5OCnhHlXqlhcouNtttJa2Iv6YooU/bpI/yX+I+EI3qGdOkR0ZYMHcpuzX1ism1W9Ax0n5O/HNLrLmYINRzqRNE16GlKL+KJyCAP1AWuUExFCYR3vpGoVijTpATP44fjpDCYdWrOfKinU0DpJksA+/Kr0DrGKhL+tp6dmO1JYJ3MxCSrk/pd7NfAEyfKrFALu3RUwheDlELnVvy/08GptsZnUABsy8I4/ljfos7grx0riLYi3UUjURqcIUzKB2iI3gWM8NGfLZnKtWgOprPNYf9ymVnjnXWnp3RVXQP9H+K8pLM/loA/StVPX1CtXy19yRmfGuEIy4wc4pnaKj7u1KtEpzCk6IP/jx9d+cQji+7UxRDh7ZmQYneiOsXiZ9OtroTbxBi2eWwSevrdnYyTAWRvX3IcRu0dWZQueYfQLP+SvUByctrEyhvp3J/8Mjw/A4VsxlVD4muRYY/o0vUypKipaMQCPuOpmE3JTWwUfErZXPur5k9eEuWIntBqt88FIc5lucDjqOrErI4WJ5zeRjfmG6/cfs7rs06tmdPXXb5jt9bToKebBK2KOxtZrqdvJQxe8JN9St6/TJolgtgKXu4sA/aUvCa3Vzbfds4FB8w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(42112799006)(366016)(1800799024)(18002099003)(10067099003)(38070700021)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?e+MmtGZb0T3lA5SG8pqDYNAs20+jIekReAkd2iKH5AzD1HsfeeG3ZGK2DA?=
 =?iso-8859-1?Q?daTiyPliOeObAsWMd0dmTckBADtv2+Cececb1SWZZ0oUqbXX5lbEuaFR1P?=
 =?iso-8859-1?Q?wD2VffKvHp/XDTu6YkMMDTR1HE+qNiDPI6eX/ObQYovT7TI1ruj27MIKrY?=
 =?iso-8859-1?Q?o/srzDGvZWnW3UFvI11DYkNoiHE1EKuOQeb/st3K2rR5o9yWi1YNe2wPJv?=
 =?iso-8859-1?Q?TUZah40IYKJ5/KCS97KhxsYtWW8y6n13BO0YUCqyEYnF39pjuQP/tKfzDB?=
 =?iso-8859-1?Q?n7SYDelO1xKFKvemCcifdauNv8kWsQPwhTGyUm2TJwnRfMGWSbkmmz2twD?=
 =?iso-8859-1?Q?+tsbM+NijZeC0zzv51yDBdxuRMs/dcau4C+QMSemkFc2TzH9tPSAFoGydd?=
 =?iso-8859-1?Q?RhWM8dAUr7i11dA94gEXOt9IhS9zOlrPqzOdL7fBlmsLOToqxhAUFlmeyI?=
 =?iso-8859-1?Q?ksXVsltbZEnzwbB2/0t9TX1E5w7Z9R76nRdKBYdEf9Vx1JJDIXBoK8bHTN?=
 =?iso-8859-1?Q?RmsYbyOovLmoSL8VG1X0hn/XvXkAy+eXMI94LIPW1Ci8EtMR556aey0n43?=
 =?iso-8859-1?Q?SKGC45qsXbqOOC4Qnjl1P/hLQF7qG3sdEdJDZCA6fQZXuyjzlkT8VUwGSW?=
 =?iso-8859-1?Q?Fxa5fzdSB3L0F1m1KAsPathchMRQ/UPHkcLRrHEhhP9T6W9h0tYoN4Q8zt?=
 =?iso-8859-1?Q?y5Vu0BimfvDPbX+jCbyjy7ZNqFpxsYqfWT+hJSD9o9cJeLxMZfjZ0cp3Tz?=
 =?iso-8859-1?Q?uwFxeFdpoHyxmrq/ywOFSxDZ/Kpfhjm+qNCyC1CHfThr5FtW2hUUEYb/iI?=
 =?iso-8859-1?Q?DOt1r5A1Z7o9DHd+qqjJcB0P5TtTyclL1zmLsIwOqO80Ww9GJYWvtItGQR?=
 =?iso-8859-1?Q?0jkkqAHLNVZydb0Oj2KXou3lubAHjhEgrBDmBM7pt5aGT6iHz3PRPoAkk0?=
 =?iso-8859-1?Q?dTnsOnBoGQO14eaK8zvoecLr/rilXwJZbh2U1bmrlwcVrD9OkGv6D0zxfF?=
 =?iso-8859-1?Q?70SP4xUYSCveVtQgAolOWkBOU9t0+C+HnlFwVVnIU5d3ZoZaFW9UZbIIjU?=
 =?iso-8859-1?Q?pYWqNjtaKzekrGjptWafXNucvs1zGmq+MWwLUazhZF0xquZVQPsdKpnsth?=
 =?iso-8859-1?Q?BQ8bRRKYVbUeBgbrP9jv5FvpeMUwWredHoXltBjysR3z0B6ThNsRUkisda?=
 =?iso-8859-1?Q?y++UeQYnfZ/mn2lZ8PT6H9XmRSOXLeYcQ/3Qs2Aqbmg1O9gOrKwwzILOrj?=
 =?iso-8859-1?Q?3+vcFJJrRRGauUl1GCHKDBB84qSwn5DlEFzKrqpUwhTrHusKJ6I3TpW/sK?=
 =?iso-8859-1?Q?naQKn8/BNNZEmdWQF37el1EkHH34CAvlA48uzpfnNV/ONTFccHtrCdVyaj?=
 =?iso-8859-1?Q?hqX+dScLhH5sGmx3YjP+drrYN5ybx+Mc0kkgscYbrg0MwPC4/IAGwvR9tQ?=
 =?iso-8859-1?Q?kb20nf0feO/6w4hmfKpegJXLJDQfu6YNWuS8FF4G+/Zmsg10xsDeGfxtmP?=
 =?iso-8859-1?Q?KLFyZuUfZ0jy5It6dNiI/0dlX60nkM7NoWKCwm01gpEzVzr3aIco+KTQdu?=
 =?iso-8859-1?Q?n4DJ91T1Wpk4i33d63/0Kb8U4DlxRvV398owV6svWHotnP0SNorUSoBGuD?=
 =?iso-8859-1?Q?PXX8RjPjfW3/knW055Xk+ej18lxq28x5plmTt9M7y+wkDkCz96UlMoE+HW?=
 =?iso-8859-1?Q?7WiX0W7SgBhzcRyZnl94LdpC3KxeNM/W9JgzMsAhFTCk1/Dlk5qgSBo+1O?=
 =?iso-8859-1?Q?GvGQ8cBjDsVxFIWWu7nbgEkAy3OhObF/FI8BY04sitIeUEbZ4nZqSkBcHJ?=
 =?iso-8859-1?Q?P3+Nxz2MZeAOlkjxLU/AQk1haqmK6M0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724c8204-b68b-43c0-2b1f-08df25329ad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 11:52:18.5327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jZUou34u7RLHgo+U4RKLHjDCopdez/l1aiFbP9jWLOsBZ65uJB0aKLR7A/Sk0r5FlfEAtVeVpJyAbDGZcqVM6KMyE3EUGtCj+0qPkUCyLyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8223
X-purgate-ID: tlsNG-4011c0/1791460340-508CDCFC-0D865313/0/0
X-purgate-type: clean
X-purgate-size: 1582

find_text_region() tests whether an arbitrary address lies inside
[text_start, text_end). The address and those bounds are not known to
point into one object, so relational operators on the pointers are
undefined behaviour and violate Misra C:2012 rule 18.3.

The bounds are cast to unsigned long because addr already has that
type. The type is wide enough to hold a pointer, so the comparison
result stays the same.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
A deviation does not fit because find_text_region() compares an arbitrary a=
ddress
with bounds (as was proposed here:
https://patchew.org/Xen/901917945f704643e95842a773be9e8676f76d10.1755690681=
.git.dmytro._5Fprokopchuk1@epam.com/).

Casting resolve this MISRA violation.
---
 xen/common/virtual_region.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index 1dc2e9f592..a30e6b9c30 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -83,8 +83,8 @@ const struct virtual_region *find_text_region(unsigned lo=
ng addr)
     rcu_read_lock(&rcu_virtual_region_lock);
     list_for_each_entry_rcu ( iter, &virtual_region_list, list )
     {
-        if ( (void *)addr >=3D iter->text_start &&
-             (void *)addr <  iter->text_end )
+        if ( addr >=3D (unsigned long)iter->text_start &&
+             addr < (unsigned long)iter->text_end )
         {
             region =3D iter;
             break;
--=20
2.43.0

