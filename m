Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E00CA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 09:49:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436373.1655076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBUS6-0005TJ-Pk; Tue, 29 Sep 2026 09:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436373.1655076; Tue, 29 Sep 2026 09:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBUS6-0005TC-MQ; Tue, 29 Sep 2026 09:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1436373;
 Tue, 29 Sep 2026 09:48:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xBUS5-0005T6-Db
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 09:48:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBUS4-008SZ5-MG
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 11:48:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb896b-8faa-0a2a0a5109dd-0a2a45088174-32
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 11:48:44 +0200
Received: from [40.107.130.99]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb897c-f659-0a2a45080019-286b82635e95-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 11:48:44 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAVPR03MB9551.eurprd03.prod.outlook.com (2603:10a6:102:303::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 09:48:42 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 09:48:42 +0000
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
 b=bVgenDrnfNQS+sZje/FcF8vTSIgs0sUovUqAsH18aoVru+scdcAfBqNqz8ZKh5PqJxKQnFArodYblZ6F1tt88L3bhKLERx4C33dHLAqowBvYY811GXUUgJlCQ+Ez0E3uLflVlwwPb8TuGSGdrQ/28OnZEm+FT4xaSP+e2Nd69XqPgzcTz3dldCXzrjIh+I4lMJrMxqmpqgix+Uwv64JXRm+aBzzeXHXOI3b2mGRCB/n3dB+oSWYZvoe8RYm/56T0IEhEL4Pqsqhj8gO4shoa0mGDWrToUc+r17ejeoxhM3hSqd5gQdlZdSte/jzmwNCeQUw7iM/q0fAZgNYxdkATMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF+r+n3AjReUdCAExrtgvlws/DD1uel99ehF0ITSJRI=;
 b=WWGT3fo8omwjiycjkyZof8mQy2QvoYOoZKebOCg2bvNK4EQeNRtbTGZB3mH3bfZvcdOarAZPEqeudB25gACd1CDfNv2yEcG22C0qib2JWmFje7R/o8tfEZAbKOZ8cm33jexj+CF+Zn4PH/2H4bjZn94ElK9uoI9JsQ6PMmb5cltcDoBWcaSqVohswyc9hCFBqbIWPLv7H+JoQhkc56hK4y9TFku8lP7LswPkj5ApLl1ByPYlu5z/ukGrae31KMqCfauFD4BBC4CfY9mUcvAktB0x8I6OQ+GfUY9C6MGz7/h22zQPK4h4GmQJEzvD/8YUe9XedAky1RiIkfki2iMBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF+r+n3AjReUdCAExrtgvlws/DD1uel99ehF0ITSJRI=;
 b=PSW+7bH6CtIfd84Fc5pN0r/24/e0CiFps7nuam7ReRpQm9oNIn9gddeU9/YTUbbuY0usKrpzRv5TXEa/FeBEPWNhQodCYETRpfLMqtzkG4lluinwzVQ1NW1dE/VQofZBbDeBTwF1KsLJNGN3HFikrmGmH2SMgeGDRlp2no9PvLZNqyjfbvDMxYHxidwxdVQ75EvLuIkUvMRiXoY4slM0AObpqwHxc91mHkLQiWqpis+uknwL6kNUO6UgB/wnkTZk08XNFbb2rTiiV26AwPEqFvh4Mvw4tSIrNr3ruw07CKk5mPELsWQlSKdDIqMujPbv/3UGJZL4LEXAWl9DDtfQpA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH] eclair: widen R11.1 noreturn cast deviation
Thread-Topic: [PATCH] eclair: widen R11.1 noreturn cast deviation
Thread-Index: AQHdT/e1WdmOtRNOG0e6Lpur+g94cQ==
Date: Tue, 29 Sep 2026 09:48:41 +0000
Message-ID:
 <c6632dd805a119aca54b9d1ae2eea68ef9c1334c.1790674358.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAVPR03MB9551:EE_
x-ms-office365-filtering-correlation-id: 280925b3-b9fc-4806-fc16-08df1e0ed874
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|23010399003|376014|38070700021|260925021911599003|260925021311599003|260925022911599003|56012099006|10067099003|11063799006|18002099003;
x-microsoft-antispam-message-info:
 q4WsBBWl26JVxK47lf4lq7h/L/4hlyRT4cK1XBp7j4CAKreQne69+O5J0XYrzIUmstO0iwSB7DY2nyqAQOYQczWzJQetHyjUwPChf38aejY3yHYZI/yL65YBEzuDjlFkgiANtkEmTPl8M6e5RP6xrR4eHApEYgcHyI/A2l0Q2LFISfqV4pVIgpxw6IHME9wZdbub6dJ0XxqfTQAhHaeogr+dNOYHNCmVCJnxvWU/zMUH067IZI3IlQkAbQm670oe8ey11SpzQ+lLJWmp83E9bv0EbVHhXRvo0qqFw37Pvs/5i3ALzQWAbUN+/pDD5sJnTfM8Z9x50dkfm9Z6/ku+VS6dlfLepmh8b0JIZsqICT1gfNHA0VGd19CDCppOq68/FMQgO+QSlCNsnAcBEhEhBtUNgXeHytpv220dNpl951Osvsb9JikdXJoqSESU8VG0d9SMXSoB2YebyQw8plPqnAJbZ9/CMjpLeQdIrHggWzMiK2/oKSy+am77LQr8pE1glwcekiOSixxS4usIuA5BNQEboc/3ad8BL3E2LY5coMxfXk7a08j974rYvJwu3awsawdXKtq7JzxObmL0FuXG2ZJ5ZHU+pLwYTicO7Egcv9XYEeX3Rz5v0C9mTUmg8QZ7s0UoAens2gV0QGZWMA1825x2sAjDqzgXbRCcb6lbaJvUpXxeHGV3ojWkd5VfAGSDsz6KnyfS7HYRWM/8TgyL1V/4/zvpKZJwh0+HaQRye4A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(23010399003)(376014)(38070700021)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?x/xr8xU8P3t24I+a7GXDiupnpv3PWHdTaKhDu+IU8AfEOUfHSbKSKW/odx?=
 =?iso-8859-1?Q?qF6XnCnAb7pm7phJFkPXKyEUJYqejaEozNSm+gm6ZcOeGnWIUxCLtvKSID?=
 =?iso-8859-1?Q?b24jlFivbWt+F23Zq2mEnMoC7Zr/NHMnbpKNkDAU+a0CawTiSOwTcIti3A?=
 =?iso-8859-1?Q?tU9YrjYd8mfvMUtOD+J8l6zBckbt85U5ti+1OKdvlsKIliHVPPrs1NSUfx?=
 =?iso-8859-1?Q?MDbBG5zYY5oM/56ksPUvlBfScxdgK3d7KT/S6h3OTgJrhvh58p8BU+4X4r?=
 =?iso-8859-1?Q?Ci9OgVjR1ZoR1H5PWTtIj7SuJiQZNk2mWoi/M1XsjeobhUWtnPU/b+pLb2?=
 =?iso-8859-1?Q?bFKue+pSqq5WMX32xAjZQT9P4PnXSszNLoKX+9iumR7LjKOeW5gjBBlcoX?=
 =?iso-8859-1?Q?4PPEsieNPWMyr75s47z6cRay0+eYTzvTmvcxPzdfoTA+V4wS0YDaTwc91y?=
 =?iso-8859-1?Q?A2Rzs7DtToMMSQI1sW1fE6U64nTvsiDfCeXgJPePK1VxzCia94j0eorVvw?=
 =?iso-8859-1?Q?oB2HjjJp2eOTv3vYSEC2X8oTieBu7jrBaDHUfkeuaZnwemzdQyWUDKCygu?=
 =?iso-8859-1?Q?6OL5EA+7sLy2apW5d5Zv2p7evEUq2uUSNsP9GK0jp4kIgdoLfMwVJ9mJuO?=
 =?iso-8859-1?Q?LWhgjIyaE+w7ECLXlO/4Zhmesv81oXjvrkknIwlNsU4oVcc3XbGhZO56oZ?=
 =?iso-8859-1?Q?JGYNPTXlpF1EesiQQUDH3SXJ1vf8QUDfU/SbinhHvONU/B82Ltu++b8SN6?=
 =?iso-8859-1?Q?lsB7b8FSwfHs9zMDDCb0pJE1YxmRMu9yceYYbeD9Ag1Jp3Cb7qj3u1aqeR?=
 =?iso-8859-1?Q?yo4Hf4PPyVliqACb7VS2athtymWCPqfIwCe/0AWkRKeMTUeFgJqtwLxpv0?=
 =?iso-8859-1?Q?fMTq28BQ94XXkju0u3KGvV3nEVqoL2U8asVYPuu4tuwInSBJUB5eKnc/Y0?=
 =?iso-8859-1?Q?vj055drgUv4AxjzG0embR1BgqYSy5M6xRkVh76XhX7xdcm5M0hAKv0Vv4t?=
 =?iso-8859-1?Q?hP/jLH1PPZDyHAL6tn6RrvdTqE3EFMmHCjvAuvOUPa2I9S/ryn8YuA4VBl?=
 =?iso-8859-1?Q?AjT0GSEh6dcmjXY8q6qcGJC+AKeiwkEWR40ZmreRzCned1HKg9mBoDW5x3?=
 =?iso-8859-1?Q?x84ocpB2iJ7KifKj4JY5L5SEOPf+b7QHPmfL4jwuDPCd35O0TcP8B8ANdP?=
 =?iso-8859-1?Q?7qoqK4ri6VfRhDT247vICTwiC5QBgvCV8AmJSasioqSxOI9RaRjzZTKlKn?=
 =?iso-8859-1?Q?6qG0M2vGeZcZ3bjZCVHtjKG9TVE0q9oSXFyslL4lsniLgVRAjvxRcFYBOP?=
 =?iso-8859-1?Q?RTnUxs2r/pBqnTSOQq6UtYyaWq0fiBpn+X9G1fsGycHqqBd15kVZJvg4IH?=
 =?iso-8859-1?Q?o2HGLHzpHxhXEKjU9Hl4ohdoLYxag2yfCNlN4DNU1O38IneAcYf213yeXK?=
 =?iso-8859-1?Q?vei1xldSCS2kgvxoH7DtO0/SiUSUNsGdjoFv7p1JA44W1fDTgzCIq+Cew9?=
 =?iso-8859-1?Q?YjN5sk3p7AED3Bkv4XX/M6OV8lx97sSSYCvINkzmj+unsahv64aaVOnUAX?=
 =?iso-8859-1?Q?g7e2oaffQCBvvqixVbrWCsJxAeAUlON85VM4080MDsj7zDexm61e4l010h?=
 =?iso-8859-1?Q?OpdE0tcBm4pk+Cg6e3qA+VsBf9XjBSMvFM2FAx7yiUxR9qGGDvMZ7Jod77?=
 =?iso-8859-1?Q?SCDNR3vgKzGLWjXv0p+6cUVkqeYtcAGgcmFKAVyPbnRfGT1yjO4vCd6shH?=
 =?iso-8859-1?Q?nK3woCvxpbfX8hnLT8no1zYTIu4qWSoWxmrS0bhtP6xkD6yaFfqgCa4rkl?=
 =?iso-8859-1?Q?w/IRiUSdajPa5FOhRq+vS2v5KyCMy6o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280925b3-b9fc-4806-fc16-08df1e0ed874
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 09:48:41.9526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqNvdWpIFy+PZRqPMbBb2Ae1JsKRYgsI0LE/O/EZrq/axI4nqachkwt6fgKR+FQrxH/oXKdU/bDienTm2nUZHNcx3lxhuNLzogUqmN5koxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9551
X-purgate-ID: tlsNG-c1860d/1790675324-CC37587B-B8FA3586/0/0
X-purgate-type: clean
X-purgate-size: 2216

The existing safe-cast rule for noreturn function pointers only
matched a void * parameter. Generalize it to also match unsigned int
and const struct cpu_user_regs *, so casts like gicv2_do_LPI to
do_LPI in gic-v2.c, and unexpected_machine_check to
mce_callbacks.handler in mce.c, are tagged safe without duplicating
the deviation.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pi=
pelines/2892634720
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 0b87bd1d6f..03116d236d 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -391,11 +391,13 @@ constant expressions are required.\""
 }
 -doc_end
=20
--doc_begin=3D"The conversion from 'void noreturn (*)(void *)' to 'void (*)=
(void *)' is safe
-because the semantics of the 'noreturn' attribute do not alter the calling=
 convention or behavior of the resulting code."
+-doc_begin=3D"The conversion from 'void noreturn (*)(void *)', 'void noret=
urn (*)(unsigned int)' or
+'void noreturn (*)(const struct cpu_user_regs *)' to the corresponding non=
-noreturn function
+pointer type is safe because the semantics of the 'noreturn' attribute do =
not alter the calling
+convention or behavior of the resulting code."
 -config=3DMC3A2.R11.1,casts+=3D{safe,
-  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1=
, pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
-   ref(property(noreturn)))))"}=20
+  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1=
, pointer(builtin(void))||builtin(unsigned int)||pointer(^struct cpu_user_r=
egs$))))))&&from(expr(skip(!syntactic(),
+   ref(property(noreturn)))))"}
 -doc_end
=20
 -doc_begin=3D"The conversion from a pointer to an incomplete type to unsig=
ned long does not lose any information, provided that the target type has e=
nough bits to store it."
--=20
2.43.0

