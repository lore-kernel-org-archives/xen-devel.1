Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B42606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 09:23:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1474289.1681456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOth5-0006LE-2d; Thu, 05 Nov 2026 09:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474289.1681456; Thu, 05 Nov 2026 09:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOth4-0006L6-Vw; Thu, 05 Nov 2026 09:23:38 +0000
Received: by outflank-mailman (input) for mailman id 1474289;
 Thu, 05 Nov 2026 09:10:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Anandu.Padinhare@electrifex.com>) id 1xOtUW-0002f1-OY
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:10:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOtUV-0035Kk-Me
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 10:10:39 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6aec480d-e002-0a2a0a5209dd-0a2a450c965e-8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 10:10:39 +0100
Received: from [3.110.59.157] (helo=repost.tmes-in.trendmicro.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6aec480d-f479-0a2a450c0019-036e3b9daf09-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 10:10:39 +0100
Received: from 40.107.57.114_.trendmicro.com (unknown [172.26.44.244])
 by repost.tmes-in.trendmicro.com (Postfix) with SMTP id 4619CC000211;
 Thu, 05 Nov 2026 09:10:37 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (unknown
 [40.107.57.114])
 by repre.tmes-in.trendmicro.com (Trend Micro Email Security) with ESMTPS id
 7951CC00042A; Thu, 05 Nov 2026 09:10:32 +0000 (UTC)
Received: from MA5PR01MB11455.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:193::20) by PNZPR01MB11218.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:289::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 09:10:28 +0000
Received: from MA5PR01MB11455.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::efe4:29f6:26da:6618]) by MA5PR01MB11455.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::efe4:29f6:26da:6618%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 09:10:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-TM-MAIL-RECEIVED-TIME: 1793869832.496000
X-TM-MAIL-UUID: d9363bb8-0c50-4ed3-9aed-44bf214ca6f6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCxYD14E4sPVoW0axkYIL+lYqHzgt3O3rjKnG8QX7lhb1y56YGIBiX5UhSdrx23ORLmZNp1uoMTjmUnCsvf7YqffRiTTlD9p141wrJI+avM51Yq15/1D21BOhLcQP8uEvEj0B88d/ysI5H/ui/zHLpQqLmgKE0qgXd8wph6BvDVvCBB5ul5AlIfVL+4Izt8SepT7Fxmvn3BKZu3CldMOPrSr84yKaUoiCAZuzFfPQhJqbFw31yv3g3B+0prkbHO1VQWx+ZHlZOszpAe6JNme0WIgx0GPlRanQQGr83npo/AYrS8bfZavR/GtBcTK6PK2WhbH6udCw51z2HIWDOVDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M02mJb3jaXljVyHD2w6LUuX1f0Ld0KFuP+FtWfSHlY=;
 b=mEBAI8ErlIxQVs6lMRppsnKUaH6FyYuTtmddGpb28opVjExxsyaqKpLkRJOYTOMYL7fR6ndysw3ZD+2kPhFYenc1ZxcD6e4Nzib9G2xmSp8Im9Kt6XqCbkDo0mnDDfPz7UXwzBI3VR8IJQpl/GurO3LZyMMJpQs7dpzC+MYER2DcsJvfS63pZ/sLma9feMxvZ7rZE/E/aWVixqc13gVlLCltA25u5t2rqCtW5FxA6nNIBpMW5qmPNm2MwhCA5g4tCKF51hB5YtAAHsbeEP/8Hih4sTxrS9GqSSwtsDhACxg2tvnuXfnQTwcgLEOqb9lOW6xC6eopcaGTFd/94f0KiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=electrifex.com; dmarc=pass action=none
 header.from=electrifex.com; dkim=pass header.d=electrifex.com; arc=none
From: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/EFI: fix padding of EDD strings
Thread-Topic: [PATCH] x86/EFI: fix padding of EDD strings
Thread-Index: AQHdbQRh3bU+0D+v9UGVw8dMUNUEuQ==
Date: Thu, 5 Nov 2026 09:10:28 +0000
Message-ID:
 <MA5PR01MB11455822E04DAC972F77A25A7FD772@MA5PR01MB11455.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=electrifex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA5PR01MB11455:EE_|PNZPR01MB11218:EE_
x-ms-office365-filtering-correlation-id: d722cd3f-6fe8-4d53-dda9-08df3b1ca283
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|261022105027099003|56012099006|261021121427099003|261009223027099003|261022075727099003|261021123027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 uwSNMsJXcl7M37sQhmRer19iBjlgT49HI53r4vox8ORCBFL/HJjDJ5rubbd7B4ys7Fxw1dkNx6kPpRvDhvFQpdYFbB/jCSLT3LThLlbmIdnDcXig6dwSF5rUp9Cmz9VkkZ+8liR0nw1Frp1mEpnKerYRffdo7F+3JccOgcVj+OVke69X7SsXREMG1UjeJxxTzXEc20JLFRTc3sD17ok381fZwePEnWvLidqleJAvp16hxgAM7uGemInMHUaskSIllaQZynfo+3rhxUXVbsD42EpotXJfY2rYSQMldQhwKY0nf+51T5ycyN3Q4KcRcMRZHl3YoBsd63D1Y7mdzWV3A65rRv7L0CLlF2cNW3/IHIem2QF+J0MDWksu3ewpcNrEd9CD04Mzcw87RlzVAePbhjyLace9UTwHH6XEHLAvw6AzHHgSxO/01hyq+7FrLsNk34D7JxbQHrjesZaQk5mSG8+TQDwZPCHrJPghgi29jHnQbLNkVlGEH0dnYks7i3P+25dPmH0fxY2GUdqMdIP1PjaQBP6g6IKREF8dCsvesT7+IWrtFaVyS3CmykC7GgZhlyRPwPQRlmP5fo5t4dwh0vjn2tF0lHtBZlUm54yErbuirfQ+Ur+vA7n+tOomJUTFR9m5LtxZgUp1IkVufYqTIwDh5ufDXQuUazOfng3kAvPPQpkh4LWM7i3/PDUQPGGqKl+rZ0UEFBjp/dxBI/MBh4eOHOpa2bWkSjy8lwt36eU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5PR01MB11455.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(261022105027099003)(56012099006)(261021121427099003)(261009223027099003)(261022075727099003)(261021123027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UFHNwd3tUQ+fFLtokT1snLczbdRaKmW3JIPfsVzgXXR3hpt+Ca4cu8DVBf?=
 =?iso-8859-1?Q?fIdt/UwOUQi0d77J67n9rp3G1mAklkmK+TgbSt3xYnrKqSTclcHTOTl3uS?=
 =?iso-8859-1?Q?zugxkmlby1roDdJOL/nWOkRsMw9xJ02RZvZvXQgal3d551EjYXHEoSV1oo?=
 =?iso-8859-1?Q?e4DkFNKKvuUEQAYbZWeYvaVDgS8wDNbmNX7SobYhGxnzxYu5Lq7+ESZ4Cb?=
 =?iso-8859-1?Q?QAIg5xmmmcqaXckCXMW9sDU90iH4m0wEIwx9KNhdUY46LQVE1dLRgq/UHc?=
 =?iso-8859-1?Q?ZmnRXRDoVeZ6XU3wP7m8mB25VqvTQ3dL2XJZRZuNZ57G6NVgKsJORrdduZ?=
 =?iso-8859-1?Q?Gd+QAuBQ21+9rqJEWT46kekE/YQmfk/CWzBJWlGiiUc2v23Poz3LuG/n/H?=
 =?iso-8859-1?Q?bRkGWL/wQD2nQ3hhJPNuwUlyVRW0Kh5Dz+mec1TX7OdPGwlDAtEBqLS92/?=
 =?iso-8859-1?Q?4QNwOf19kKg06dEbBVoq2fT85ZgVOd9Ah/LeRg36nemWRMX6MxI4benu+j?=
 =?iso-8859-1?Q?L9XqjVCVr92seGWxf5yQIhB/eOFnb0ovUOIu3v5GVPuJoHqc6jTD931xic?=
 =?iso-8859-1?Q?byt/9qEtCIuJ49rIUQXso4JmWVEEj3BjoG5wTFHLNFhb6eUTvHkwubY5D1?=
 =?iso-8859-1?Q?oM0wmnwIKZfV3i298ZPRJ0boFGrs6qF2YRMCv0+YEzFZgu9oTwRMnu8pXs?=
 =?iso-8859-1?Q?PPZh0Bnhyu7GIGOcI+Jy8qQEA8Juqrh7vrxGjJGjmA/XwODe9kFlruq0HB?=
 =?iso-8859-1?Q?ucNGbatiJGmxJ9WgAmm2/yDshRCzn2uEGPb/GBOqZYEiixX7zIx9M4wiQT?=
 =?iso-8859-1?Q?4dvoDJJvKO32BinNzzYgXdq2RHVMlvqkMBHnyXJsv349Tg3Awagpp114zf?=
 =?iso-8859-1?Q?bIkWT0Xq00nZWx9WpQmbfQ3wAusDlSAA0/CcIyyziW3TsEQr/AIwGmHRYX?=
 =?iso-8859-1?Q?VwXvbcvosAruoR9Acm/nun5f6z1g3+pkH97vP5vRhP9EB5LhjYrbcrd16t?=
 =?iso-8859-1?Q?GWyV8nZ0Gnv04MKcSSlXFoQJqssXp2Sxjp9IBI2yc1ja+Qe7YODmmCQO4u?=
 =?iso-8859-1?Q?K297Y9gCWj1m5XcBb7y8QM6m/wKW+7pLDkujkwYg+nk9bQFeoZ7bqWdFyJ?=
 =?iso-8859-1?Q?e7Ft/sAqgGiNPwa6YehYotRk+yN9MyOmD/BvH9aq3o0VoS+aLAw3K/veDt?=
 =?iso-8859-1?Q?ici3L+DGHLshmOViUM+okGLaV7RhbKiRyh/IT8gMyu4Ubx4hH5nBJsr5ZW?=
 =?iso-8859-1?Q?kYxEsfrWMhlavGVkiOC9Z4yp1/bW44obTbfrdDJledX5d8+tGRWnMKGzQI?=
 =?iso-8859-1?Q?aggQFmg+9FGywda/waH9U/BxfUI+JZi2u6QMMEj/OVlEqPsYo6HpFmZeRk?=
 =?iso-8859-1?Q?D3PaXPCCYTCVJVesElZT9XTzDgwqr44Q9fazCr8bS8YVTuPfUpWZuwcQiI?=
 =?iso-8859-1?Q?PTIM+NhPUhIoEn/fopxBvbemSUFWXEcGIkl8YW18MRgOpXkqojaZXH+I2A?=
 =?iso-8859-1?Q?5gSGv+B/GeO9mF5Xda36yK3iQafyZJ+F5pyug36v3l+D/XlKMoPnlDJWBI?=
 =?iso-8859-1?Q?y3pWNv3PZIFVMMdn63TX24OeRq4yCi9p79ez1nYcTztGMc+lCEO/E8FHc+?=
 =?iso-8859-1?Q?t09rWAEMe2ygJIGh9iz30Vg7WF9w6giv/VOhFns6/Ujdoyhl+1SLVQwAGG?=
 =?iso-8859-1?Q?i1dWY+Ww3QJCUCreA6kWzd7+G2Grfv9xzbAobWBz5B15/1hFmKdEk3FRbV?=
 =?iso-8859-1?Q?0XjSPVnfefNIkOJVc95cpLp1SIkHP54CdovAU0NX7rnDg64JTUoRxRvnhK?=
 =?iso-8859-1?Q?E4aWmrxgGZmPb50JmG3w7G+PDrfnQr0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	JTG2wMUKOuXXn53nSAiap1FHo3LDZu98KRIHYvwBzxqrpYpJa7Bf8mn9NqHxRyfApqDKo/g1+3Dq8V5wxBf31neQy1LWLKXHqaak/9g7D661TjfiPTQcDkjVQraT7RlbQf9674rQaHKN24cTiYARs01dvuNGUu71BaldkstBFWn3IeMBneZyeufOnXS0Ggf9Y2QTKocB1EG1CuRiGbmsJjyRcBUHO9sVEeVT3s2jMMoSVuPECRmU7VSL7XZwjvqS6P6jxA1phzxdw2bwKzvVF040esrDnO/qr+3nk1d9egPK/0ImdsO/XuS6bAGJLMWflAOLOKdDk5mnd6uWTAoMhw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1SkMW7cQrcqgBumkRN92b81hVjQf6It63zTVQR7OvekhpaiIkJNN5gV4Vu0GYJEx/PClzIUp7yMDIlcV+MHgJjDOYuxzoYSUeq5uP6MAGUNsJOTm3X7eBcBECHvLJBAv1lTyDVITKv6CfYhAQH28HtX/iM+tmjjH8PE5HLlQAwDjV5I0+nYdRTeeedqx4NvZg0xLIui4x+om3I2UC37NX6DC0iA4tZwJWfaLbOoNA5uRWc7rFZMyPhT305nQmUSxX8TRMM6eueV43modQ7T+3dlwFcxe6Xgb9bVqYMxSs6OqPc+vRaj4rAYprpU63rRUYZl8iaLGvS22ci7AqexX5Jf2Sju3Jv0RRFOHiqitJjlaA2nzN9v8W/G3P2cL14qEcuv2skyvW9gd9fHEIRydQyNKI2dwHzctjLdAzQ+gKX45PA6pHp/VyLbO5lhm2WHT/Cj0sP5ANedwMrzK8BOQGIZjZ3k+dvLGFQyaiNp2C8QOy9MDlz8wO59HT59emxKRsyuzVSyLDzU1mWW9k/Ztvjoq9RzadEZkvS9v7jL1doahMTR8MxMWBVpGtM7idKiDAdAxwhLSNd0duUnxW6c3AmSU9WWmKyeMTCa4IWe/Z0A=
X-OriginatorOrg: electrifex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB11455.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d722cd3f-6fe8-4d53-dda9-08df3b1ca283
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 09:10:28.0646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f2626450-e675-4872-bae6-db17376f7643
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgo/5ri3ewBD9H8faaXriN1B0OB7dYqwsywzvH4SpZf3oBFAhe+TSHYR84Oxi18p+1cOjAzxZAvbnkKFxg/fuxmJcgA+15AdNhPeS5gIHUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB11218
X-TM-AS-ERS: 40.107.57.114-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.2.1014-30300.006
X-TMASE-Result: 10--2.091200-7.000000
X-TMASE-MatchedRID: WcPHsJbP/SoORb4PD9eWC50UyaWO1QCnp54G9fttJ00mfxCu1z+JwewK
	C3lNCUWRww/JyCiAIn9GcITFUtLEk2V5JEdzxR3ySIWxwjSbWajPaW4rD8GWjGV4iRXEyBMDGN5
	661rYcIKuDOe8YZL4TKpehZrsEMEFqTjJi0NXG+V80ZK0M+MRGXsXekkd9/R/8mB4uBzst3yLz4
	gav4lvdTKT8fDhc32NT7X7ygRwqps/dWulQasAdeT5AnjO7TXtUd1JKREWJmTW6I4Shu1jquihC
	Tu0kel4JLyRa7A4dIfCoxkUJ0PNYf2RVeqQBduyKiMPzmN80hknxTZ8oor9Y4RSKUQPSCOyJU0n
	G3tpe+B5MplrLPgz91Gm1/jBsHKQPRqI8WuVB+SMjkPo9btyqYZL0kaTKMbKBgTYbQNBR24=
X-TMASE-XGENCLOUD: 2db1ea99-ed0e-462f-b24b-aebd7f3d6278-0-0-200-0
X-TM-Addin-Auth: MX0a+sEutlXS9o3xz6imBWigpM+frT1GxaH3PvV4NHMBzInlIsHS584DExz
	TNRknCQl4NEPKIWdVWVJVyPznD4jUcxNNse+wyB7GlDdxsCXNi42GfBXxRtwzh0d4zWmWlr4ryk
	yzYupoJLMTGCA52vIyaYXGd+8vGXVnRXDDUiireew6XDVFM+WApA94bsxZcNsvcCtFr280iv3PQ
	12qHZWrxfglWagOeGpti2iTTqntyzivBDiZBdiMBPF9nCp9u+QT6xmJ2cozCzYXsHMB7mqWVpmI
	9r0tm40DXcXDxPTKfUHLeJaq+26LAT/G+Z7Vrdp9pPQ7ngz7lvOQunLqqg==.2kMLADFWrYvBef
	T+YkZ3NZ14QLK0ZH+wMZ2BmnDpizklle3UZ4Zk4GABrrmN1n8wm+TT85X6wAmFBcZr+zl3ploLI
	rpM1PgG7wADl8FMuP6vgQA57qiUA4FoSmx1fAswG4GzaEDsBecxV7UxkMoEsdjOIQuvG7rbaQzx
	wmkPbg2R1Ts+Dl6EumMUgKbqX5waqPNHlTDDDASqwxXSGFzYEz2rD9xRDOkCjA+YcFUQrTjIy/E
	Vm+pk3WYVSUO+XqRNIIqGOypp+5AgDjyURNngQNAm1m4D0rIVxgjFCmEYo/gFubwv1+zEBhfES0
	Ixu69kE0iAY4PAXOKvgAMZOIBZUw==
X-TM-Addin-ProductCode: EMS
X-TM-Deliver-Signature: 758F0381124C00613E1E767A0A4F6437
X-purgate-ID: tlsNG-d25034/1793869839-52530A5B-C7D436BA/0/0
X-purgate-type: clean
X-purgate-size: 2535
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

edd_put_string() decrements n in its copy loop condition even when the=0A=
loop terminates because the end of the source string was reached.  The=0A=
padding loop then writes one space too few, leaving the final byte of=0A=
the field untouched (zero, as boot_edd_info[] lives in .bss).  On an EFI=0A=
boot this yields e.g. a host bus type of "PCI\0" and an interface type=0A=
of "ATAPI  \0", whereas BIOSes space-pad these fields (SeaBIOS reports=0A=
"PCI " and "ATA     ").=0A=
=0A=
Furthermore, if the string exactly filled the field, n would wrap to=0A=
SIZE_MAX after the copy loop and the padding loop would write past the=0A=
end of the field.  No caller currently passes such a string.=0A=
=0A=
Only decrement n when a character was actually copied.  While touching=0A=
the function, also correct its indentation.=0A=
=0A=
Fixes: 51f03ec421fb ("x86-64/EFI: construct EDD data from device path proto=
col information")=0A=
Assisted-by: Claude=0A=
Signed-off-by: Anandu Padinhare <Anandu.Padinhare@electrifex.com>=0A=
---=0A=
Tested in QEMU (i440fx, OVMF, 2 IDE + 2 virtio-scsi disks) with a debug=0A=
build and a Linux 7.1 PV Dom0, booting xen.efi directly and via GRUB2=0A=
multiboot2.  /sys/firmware/edd/int13_dev8?/raw_data showed=0A=
host_bus_type "50 43 49 00" and interface types ending in 00 before=0A=
the patch, and "50 43 49 20" with fully space-padded interface types=0A=
after it, on all five disks.=0A=
=0A=
 xen/arch/x86/efi/efi-boot.h | 10 +++++-----=0A=
 1 file changed, 5 insertions(+), 5 deletions(-)=0A=
=0A=
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h=0A=
index d738b839ee..dab61c2d4b 100644=0A=
--- a/xen/arch/x86/efi/efi-boot.h=0A=
+++ b/xen/arch/x86/efi/efi-boot.h=0A=
@@ -30,13 +30,13 @@ static module_t __initdata mb_modules[5];=0A=
 =0A=
 static void __init edd_put_string(u8 *dst, size_t n, const char *src)=0A=
 {=0A=
-    while ( n-- && *src )=0A=
-       *dst++ =3D *src++;=0A=
+    for ( ; n && *src; --n )=0A=
+        *dst++ =3D *src++;=0A=
     if ( *src )=0A=
-       PrintErrMesg(L"Internal error populating EDD info",=0A=
-                    EFI_BUFFER_TOO_SMALL);=0A=
+        PrintErrMesg(L"Internal error populating EDD info",=0A=
+                     EFI_BUFFER_TOO_SMALL);=0A=
     while ( n-- )=0A=
-       *dst++ =3D ' ';=0A=
+        *dst++ =3D ' ';=0A=
 }=0A=
 #define edd_put_string(d, s) edd_put_string(d, ARRAY_SIZE(d), s)=0A=
 =0A=
=0A=
base-commit: bec8e3c1fb91b96f337c08c6daf1bb2563b320c0=0A=

