Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC1CC61DBE
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 05:25:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402625.1637628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0BZP-0002D5-LE; Sat, 29 Aug 2026 05:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402625.1637628; Sat, 29 Aug 2026 05:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0BZP-0002Cy-I4; Sat, 29 Aug 2026 05:25:35 +0000
Received: by outflank-mailman (input) for mailman id 1402625;
 Sat, 29 Aug 2026 05:25:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1x0BZO-0002Cs-Jt
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 05:25:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0BZN-00C3Vx-AH
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 07:25:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a926d04-8faa-0a2a0a5109dd-0a2a450ca2ac-22
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 07:25:33 +0200
Received: from [40.107.159.86]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a926d4c-f479-0a2a450c0019-286b9f56e4e0-3
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 07:25:33 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB9141.eurprd03.prod.outlook.com (2603:10a6:20b:5b4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 05:25:29 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%7]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 05:25:29 +0000
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
 b=URMwO7PZ6lnRT77zMgrf7E94O0mLZ33vyk8hyCn+2KzLhrarUTa6xnhXCZ4wQiUSC+s+9+hFnRClpE/dkvL/uRplk+wnDXYfjqt7dilv/E3yPcIJtJiCBCODrRel5VM9OIRAuj5oEPgmXsftne+f1MW3mI5AZhv+uaZGaQ8kifeHyzU+K1ib8hI62pO8zGVim1/Ham3ophpImlpdpRDBKkIl0Wt1DUvGId0s8RWSwlLHa7ze2aW3vkAdpb/odTjijGibKeHNKDc7Qb4Djs2gpQkXvI+CeNO+PqDPqhzt+ZNn2VuEIBsgV1lKKm74aEMzgGF05M5hHPvnwHNQlLbQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHySOglTQQblm+/wqUboCywaasdOcIjCnXEuaaSMMXI=;
 b=VOzio4b4vUj3CltBt/225EOWpXFB9HQphYrlJrAnRVzxCYDax6mdqE2ONmGwQVuVYcJlTOLvfmBnYyCDI56ctfJ/1/fPqynTi75tyCTmjczclTErfeJ2XUMNfGcI+YVWBiHiYB+QeocwJnCJEPjffo+06I2BdAKDobvPFSwQqZmcVewBu/OZYxSSValsAMRKRHy1tJ0GS4qcI6PTiBifht7erWh6h5KDh69AkWcaounSHXtMnVbRTnBD1MhB+z43oS4C9zOrbJxY+T0y2/hBL7aRsObGivgqQ+CTFL/rORucQUYgVCphDW7BzMq1iMRev0zKdIt0N/xp5FAiG8mWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHySOglTQQblm+/wqUboCywaasdOcIjCnXEuaaSMMXI=;
 b=Aze7H5Ta9cjI2roRjtX/5akOsyQMpYM22VFnVEN4pKxomQJeWN7A/DkO4etqXSGA9OFefln+2QCcBVMW+eo4flqSI2vIxDbdMaxt2kCYu95t1kffqWXJcHRP87A1Ge/zY6hqTyi7L2eNWBqJZEOXOX3Ep3DqYxd595x0pyHhTns+vyfG9UY6Cd5TcCeRpnTOPH1KbhVHGMV3Bvcro9P3u+B7wDr9T/pcnyimbLFGXztl7xXM3ys8Iaqg/VNUQJvpceeT8dZis9++war74imfCO5Hx6DJ00U+svNAQx4DDV+K7rW0JsXjy3IY5akoBAtCdCTdatqSMaLj+ZNSSo5K8A==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v1] xen/xsm: flask: restore sidtab state on policy load
 failure
Thread-Topic: [PATCH v1] xen/xsm: flask: restore sidtab state on policy load
 failure
Thread-Index: AQHdN3bNfFShEBvmK0m4+E/2G7r3aQ==
Date: Sat, 29 Aug 2026 05:25:28 +0000
Message-ID: <20260829052527.678306-1-Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|AS8PR03MB9141:EE_
x-ms-office365-filtering-correlation-id: 3a004a85-3f9b-48c3-713b-08df058df04c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|56012099006|38070700021|11063799006|10067099003;
x-microsoft-antispam-message-info:
 bJ69mvn5oXk20ee2aN/+FDSa9zP+0VU6zEWhJyiiKUPGJbtT5l6+P+ky7pHvQM5T1efLmzUFW8aAAm4WagWkkMQrCTN54kt8huLs6Ol4GzLasRVQamr1EpCsLpL0+6fdV3ORMM+v1n+A/tLZCrJofESCr1fZ0cNLOvoJDNeyOX/V3u9yy4wbnayKg/RO/ofgcYkz4cqH0K+dQyDy5isTPxM4CdmtOcqeSFOepSiPUXstP6RQ+/8iCbMq0t4jbBMEJJEza2+IOdnS/kwyTTERAKTGPslDZMjguWOs8qXZNs1Tl2hDatWSiW+JGVjbVSaREw/4yPoveReveTtCMyE7lj4Z4JZaowzN83DzpLOyUkMaFu6m1zgRDubG3aP1pA8nMlt5Dn1o9Bp5+y3p3LWobKvHOkZyeUV1tzqP+L8X//hqGGVOm9a/DeFX1btG+o1esem2fJN1eanhRpjkeCIOExo4TGH58fJYAgq6IyvEKA3XUIynmomlcD0kLQfDBOmQ9214n3SIe0vTO7hIkTLgDvZL/BhWo6a5CTk7f+Q/W6hmkT/5iawio1d3xusifYfHWB1C1v9iEJvfKsxLzMxFiUNbGNEp+9spTbQFmCMCetUpvvP3MwI3ayG5H69/Xhv5n7v7YD13RDYi1CY1zh+IVVlDgudbowu2BhhKxu9x+jICy+jnLl2Mzg+H2QRougOpJGnXEJ5k9/lSD8ieXViMmfGPNxoAiMju4O0NSaFfFsg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(56012099006)(38070700021)(11063799006)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Z1qU6kruMtp2u3TvM4wxOBFPxr+IMD72HiH5SGjmgSa6nKDgxkwcM+9Xe1?=
 =?iso-8859-1?Q?DXSeTSkn1fQkQIE7n7gct5ktcZXbBixcZomCtvnvV/k84MNvM4+QAAfmn6?=
 =?iso-8859-1?Q?SOKnmdW0S1Ne085RM4uth0NvV1fsnAhZwgPAewTnTFOBDSTIGH9jY4gIHE?=
 =?iso-8859-1?Q?TF0inQvcJntMEKe9BcxFG4fTDuhlID4N2mOEbRwFGB2MPVeBPGP+isPZsO?=
 =?iso-8859-1?Q?0N3a4TR/mV0oz4/yzinB/uXLaM6vzsLFtQaDLN19Q8b6bmaC+S6U+V2Z7t?=
 =?iso-8859-1?Q?keQpG6Fj8DVH1OKvviHbYTTpnZ4MZQDVAA4KvwCXsQwiAzn1VcfcJee2FZ?=
 =?iso-8859-1?Q?Znax7zyu9OdKuRaIulKgnLm7fiDgiKc/0r+GH3a7KCJn2rE2Mg2w5RSvmb?=
 =?iso-8859-1?Q?KpDTY5G4iDn0V+N1fDmlnM0Ah0b6onr/4uhwXRvuG0KUAopu/19ryFU58T?=
 =?iso-8859-1?Q?U6K82Z291i0egMZYOcBB6ow1+/DvYwpXd1JfFi/GT1kDVeHZq/rJ98ZjZw?=
 =?iso-8859-1?Q?V2ZxYKP11IAda+MXz+ARKklg2QNbJmNNXhLJTlU2EGzX1aupfO97spiQmn?=
 =?iso-8859-1?Q?D2sLiElLubRRUvyqjd5iEHIxhvvPZ8Ch6WiG/OqHxbhM3rpd/8d83lYMdp?=
 =?iso-8859-1?Q?huUbuXGgv+Jk6hSV35Q31hnM+Mf0cwd5/6v+LPDnZ0qY6F33eWr6aFGle3?=
 =?iso-8859-1?Q?zixW8MZaSfzqfgZxZwtq2Bz/dcT8KlXB+5ugR+SYtcXSuyfcNc4ehcV8Mk?=
 =?iso-8859-1?Q?TFN9GvxKUAOKltwrWTUG+Rm/6MoV84IAYoFBSx+77ZDLlR2aGI/eZIsXLv?=
 =?iso-8859-1?Q?bzicP6aI7abnMvpMEoSN03TVDPtuwYcL8h9mQMkPjy8aaxlkFyprf9MoOW?=
 =?iso-8859-1?Q?DePyXf2xK/MwPSi2NOUt99Mi1zwBFkiIsJcPcLf2wGyZfPcbEe8p0pqECl?=
 =?iso-8859-1?Q?cU2tKuDpMVCGPKwVmSeZTRGn9hx39SBoxlMG3wqicJ+uzTya1p4p/9Wqqi?=
 =?iso-8859-1?Q?Y3yhMCtRYTYU6M9QkIDd5ozi9KCJLomeJ4t2en41CtiIpFkv9GglAemPko?=
 =?iso-8859-1?Q?SWbWNmf8jCQzaw+XUZhx3IyqOVjadpKaLo3wpkiIhTdca21RjtYCqwCsJj?=
 =?iso-8859-1?Q?5xpAcaHZMj1NsRNSYTqvBuCadSRZPaoKZSSkRa3ea+Bc6GC1NUblKwGrup?=
 =?iso-8859-1?Q?NyYP7hQUArQ7etCA7UA+cNimEphKOlUhpzpussU8IZjAeIlzdHzZ7C5gkR?=
 =?iso-8859-1?Q?9WSLYUyYfRgFlUSAHiFsxc3LYK4XsmzeT22khOdl0G17FzcXfd6xyaER/U?=
 =?iso-8859-1?Q?dUQ5O06NhEc1GTDZG9Q7C2F0cp3eFj9jsRl+qURH7IB/FNQQWhOmbY6DJq?=
 =?iso-8859-1?Q?joaIneCrS44nFkL4XRUPPs0LuU6WEZIPn629vVRXb7t1X5I1wbbNiI3C5S?=
 =?iso-8859-1?Q?XlpJZUYbpx2xjuy9+SCZEfRz7YLH+W+dH3KnOSD+dy5WjfwslK+LsNMB7n?=
 =?iso-8859-1?Q?DPNgo9h5LYGSkMUsp6mA4YQafNL7SoDBoiVs20FwUw26JUveTBqsQBx1xo?=
 =?iso-8859-1?Q?9iw6VY8UILLzdMsIdkG01x4h4Qjdb7jRXN6bDOwUb1AoQF8dO/Hj5kxswB?=
 =?iso-8859-1?Q?PVdhaRUPX9aupD9jAcA3apj5kAxzx5EumWEB5evvJBRGxt6azrhw7iHbw1?=
 =?iso-8859-1?Q?lvTp8i3bIkie6PrrnnxWZvbKhl9DVzkpgBfSnifl+0Bx30KJO/1flud7iu?=
 =?iso-8859-1?Q?ihZPXCZGiAQ9cTHxeJmDkk9NjqnfilOPOftymIw4fVYI4DnNmH0S+jcpAT?=
 =?iso-8859-1?Q?0P1kQIXasjyWtpAe89atPa4yDlREbb4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a004a85-3f9b-48c3-713b-08df058df04c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2026 05:25:28.9901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ku0cnWMr/KZJx4qT/++t3h0MY0b1s076V9Ys13MzTj/s68nCkIsfLhCpIbdXAGgu6McBEkkrJ5qmJLeTypCChw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9141
X-purgate-ID: tlsNG-d25034/1787981133-018C5A5B-B34EA14B/0/0
X-purgate-type: clean
X-purgate-size: 2145

Error path of failed sidtab_map() leaves global sidtab in shutdown state an=
d
system unable to allocate new SIDs in sidtab_context_to_sid().
To restore sidtab state new function sidtab_activate() is introduced, it on=
ly
resets shutdown flag, rewinding effect of sidtab_shutdown().

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
New function is not strictly required, this also can be achieved just by
doing sidtab_set(&sidtab, &sidtab), but this way we would rely on its
undocumented internal behaviour.
---
 xen/xsm/flask/ss/services.c | 1 +
 xen/xsm/flask/ss/sidtab.c   | 7 +++++++
 xen/xsm/flask/ss/sidtab.h   | 1 +
 3 files changed, 9 insertions(+)

diff --git a/xen/xsm/flask/ss/services.c b/xen/xsm/flask/ss/services.c
index 35ad1034ca..f5cee1e0b0 100644
--- a/xen/xsm/flask/ss/services.c
+++ b/xen/xsm/flask/ss/services.c
@@ -1427,6 +1427,7 @@ int security_load_policy(const void *data, size_t len=
)
     if ( sidtab_map(&sidtab, clone_sid, &newsidtab) )
     {
         rc =3D -ENOMEM;
+        sidtab_activate(&sidtab);
         goto err;
     }
=20
diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
index 69fc3389b3..5d1653cd02 100644
--- a/xen/xsm/flask/ss/sidtab.c
+++ b/xen/xsm/flask/ss/sidtab.c
@@ -314,6 +314,13 @@ void sidtab_set(struct sidtab *dst, struct sidtab *src=
)
     SIDTAB_UNLOCK(src);
 }
=20
+void sidtab_activate(struct sidtab *s)
+{
+    SIDTAB_LOCK(s);
+    s->shutdown =3D 0;
+    SIDTAB_UNLOCK(s);
+}
+
 void sidtab_shutdown(struct sidtab *s)
 {
     SIDTAB_LOCK(s);
diff --git a/xen/xsm/flask/ss/sidtab.h b/xen/xsm/flask/ss/sidtab.h
index 0e48ec6eae..5d2dc9c7e1 100644
--- a/xen/xsm/flask/ss/sidtab.h
+++ b/xen/xsm/flask/ss/sidtab.h
@@ -48,6 +48,7 @@ int sidtab_context_to_sid(struct sidtab *s, struct contex=
t *context, u32 *sid);
 void sidtab_hash_eval(struct sidtab *h, char *tag);
 void sidtab_destroy(struct sidtab *s);
 void sidtab_set(struct sidtab *dst, struct sidtab *src);
+void sidtab_activate(struct sidtab *s);
 void sidtab_shutdown(struct sidtab *s);
=20
 #endif    /* _SS_SIDTAB_H_ */
--=20
2.43.0

