Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C03B606A331
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=qdeyFvXg
Received: from list by lists.xenproject.org with outflank-mailman.1491032.1691942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxty-0006e7-PX; Mon, 16 Nov 2026 14:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491032.1691942; Mon, 16 Nov 2026 14:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxty-0006e0-MY; Mon, 16 Nov 2026 14:41:46 +0000
Received: by outflank-mailman (input) for mailman id 1491032;
 Mon, 16 Nov 2026 14:41:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xSxtx-0006ca-CG
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:41:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSxtw-00BMln-Fm
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:41:44 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb161a-2eae-0a2a0a5409dd-0a2a4504af3c-34
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:41:44 +0100
Received: from [52.101.66.113]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb1627-b57f-0a2a45040019-346542718d39-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:41:44 +0100
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by GV2PR03MB11211.eurprd03.prod.outlook.com
 (2603:10a6:150:30d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:41:38 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0592.012; Mon, 16 Nov 2026
 14:41:38 +0000
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
 b=Ef4Hd1sfUQ9gc1zQs9GdVj6ZfVc9oTA3kXAfaCvZYYHujzjUK8DlEOtrhki2k4/0teoHr+LWEEzQDYc/eH4Oyxvk/a5xiHNOOunRjhUNx1iwavY56R5MYRpkycWJ4SIZiSPUhHioSnWdUUY5ASsSZ+WdhqV3CXKInV/6hd792u69uh3LzGGUIpFrQ16aagk55pzKKw02Xyi7Bc8DVhbBddkxYd/fGMdRYWvaXxGyRB1WL8sc/DkfnJsWvVfLSPsXlI//IHVEdxQt71gJ8zyGuN2oM7aahG0At8LkOYRsqOdjaiuFb+bS2vquA7yz0aO9udytDSJqwCXhDt7mIgGGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaPlyiQF1WAzVJ67Z+NxO+5WCG19GCRvpAl3HPh9kPA=;
 b=HXCRcotoZRM/GgfaDN5K1cepmBjNa/KhmU/xIYZdaVXZo/AxmquI9999mWZnyYjDM49NkE4wjnhRzez024WaAjojaEeneelIVT4wpQUsiYUw5+z853DUmUvRzppO3lz8kgVKuSALDHpE5cmI+IpPKiVz97q2X/f9EEKZlnXcOnxW/rW9d8ruGM+/Gj12GqDnzi5Jl7oRHoEnBJAwrpvsydo0pihMSq4OjCruGfYY9WNhh7yfp572l5o4dmQ9Ossz0qXp6VElregnsrv7mRamG/URYDy9ToYc4o7D4x80FCxi7UOc8awURajdRubXfwtgge+30mQjxeSFmXG2CvmTeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaPlyiQF1WAzVJ67Z+NxO+5WCG19GCRvpAl3HPh9kPA=;
 b=qdeyFvXgGwsB3qoj2CICqJ1w+VEZJsXHPkYAz1wOfmBXh75JeXTrSSf+TP08G1x/N6PM29kUTmqPL9l8PTaEKzoWo14lqJ9+eCfYn3qn5qy3qfQwByDQ4Wk6K7A9+Hf0h9LGytNhhQm/hI2Qtzu2To/43xXJuozIQ+J2oq8ub1JkY5WLWs3sme+U3nVPGp33pMPD97BGHsVVWgWyFXe+87ziC5pq0paMuPGvSw/+BpOFL3uze+6oK1+Gv5vLdSpW3GZCy0e2C/67WdYrAr3KG14k9icHU3r+dirTUiYm2CMIcqLRK3cT9YmmXUOuFwJDOTely+9BDLfq+Sc5vxneaA==
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
Subject: [PATCH v16 2/6] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v16 2/6] xen: arm: smccc: add INVALID_PARAMETER error
 code
Thread-Index: AQHdddiWzgUZD4G1o0yyIuz2iSLpdg==
Date: Mon, 16 Nov 2026 14:41:38 +0000
Message-ID:
 <0d3ea7f0726fa9feed4c108ce9217b52b1b3c899.1794839953.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: 08c064f1-6ccd-4ad1-252a-08df43efb8da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|261026121527099003|261021121427099003|261102123227099003|38070700021|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|3023799007;
x-microsoft-antispam-message-info:
 X8Rv978a+BrSxrsgDDEphAFKgs2aCqy9ff3zgaLoseZviAHVo3XCtMOY3GZAkRIwb3aTpe5eWAOp2wV/yyf6UOwwsLfiLKcd42tZsAoUAvyIZlFLy1oi+tOQiF9vlPMJe4TacE9SyXVvlgln3dRkv/HlOce4QkCn4P6kXjQNd1CCKo3uGScxRAz0Tvbr0+7xB7f+GGakpJdzUGuPLoJXEpNWCCZT9zUJ33yL2+bFHAoZ+GsCi3koMb5VP6Lq1JhDYbW3Fp0yoyX/Oz/elwuzm4tEBQYBXvyurQa/2lUKcQ3diOu0Z6NFRkcJVyf/jDk/Z1qw5OX819GOrLiyyzhNw/ycyrFlXSgxtV9G+39YDvcbVaFFCBfR11GFGoz7Snsa20Mx+RWrNu2PUkQlgpUQ2+X+VLCeeR3WJ7N2z7Y2NA+vevp6ve1p5EW6pxRYzeR4C1UaqmmBYWnWC8/E09L4hK/584yloBgYQP+dE876LG+vpbP4SeJOGTNNcygoWwA+Ra0Tf6MkV/bZSP2/Ipg2e8n6Q1INn35mONoFLNc0d1MDdwtTAcD/kYf6NX6lu/N2oa7Mrh3lpvLDlhJFK6FQvYVnWGoCHiHwM20mIB+0evwrdAkwMFQvL6TNGtVhWYXXcX8dwwAqILyXdZgS3/4PfCBwYfuZuy3Z7x48nHzOouU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(261026121527099003)(261021121427099003)(261102123227099003)(38070700021)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xV23Oi8Xogyk/XY2esINLMso2N6Zf3em7XwQEW0hGEggVR2lgj4n6fTBrT?=
 =?iso-8859-1?Q?ugnEwB/+TBUQBPoMMnU6/7ifoHfk/AtxZNXKBdeveAusOj+pcrc8+lg4TN?=
 =?iso-8859-1?Q?9bjFkrW1O+3H4zM3Mtyn1tCStI/NJHAZWMY6ijyZYth8/3e4AmO1kuEi5N?=
 =?iso-8859-1?Q?J9R2PwEtAvbrWpnq/2xdCoUbeZpTGkum8kP0Mde2TgcEG4YgDwi2qvQolm?=
 =?iso-8859-1?Q?fz2nsOJpHnvWTz+Du0j3RNwUDD44uTulBuFuI7uDx0CMEG8K3xxAVZojjm?=
 =?iso-8859-1?Q?0+jFQbArOnrTUptlJxxlhD4HiPMJHe5ZxePQo84FhHC7p5Lv0lH4ljk4N9?=
 =?iso-8859-1?Q?yd9MKXOgK8CDdt3zl34YKHGNHnFmXmGfmEeBSrNJ23SsRV6r9CHTaG9ViT?=
 =?iso-8859-1?Q?aLnnIDzjwTmvoj0Yl1Knz2lozq3MAk1cgUvqXXMyE4z7K9DNnKsJ5hkfYZ?=
 =?iso-8859-1?Q?G9ZjV+zRkP+mru2jmXixcaOB+P26sB6FX7rf52v5hqT6+8n35nytBDIfYA?=
 =?iso-8859-1?Q?0CKN6htiSHVa9R4q7rzuM6swORu/oHE6xrzkThxkI56eQKuWo7+XoGxbjx?=
 =?iso-8859-1?Q?cwIHYkaUEWyqgLIwS3yWTxzR8YzMVwRHYorNEuPojvScZQoBmguJ9ps9iv?=
 =?iso-8859-1?Q?G9Yu5JL18jdtIvVVQ55uU6fbGuJYvPanNMhV2p1mM3yfcN5cXJ6p5a/kDK?=
 =?iso-8859-1?Q?rGviECHC02Zv79M323nnALE6OWME2mtxo71e7t4b5JViBE4j++emab8Ho5?=
 =?iso-8859-1?Q?ubfOXFEy5QWwSOoJCdamXz+CylqIEd7aLNSfQTArAFrBc/mjgUbch4lPlH?=
 =?iso-8859-1?Q?N7D7TmHhHKsL6+kvOptls6pHxZPCtOSCRHNZc0XITyj8uRXB3610EnoSpF?=
 =?iso-8859-1?Q?jo0pCAK4z087mFQwftE8fPh0iIosKjCQt03hsoILo6xHaiDVepcCAqnOdN?=
 =?iso-8859-1?Q?YspctZfuexiAcwf+FXDnsz360ObQpB9oFytUG+zAaEyngePJei9ieCjnBy?=
 =?iso-8859-1?Q?Dxrd1NU8md7JcOnz3vKPTTbtRcwJ1kqEmuRzN3DO7/etm7bj9slYBZuY5P?=
 =?iso-8859-1?Q?dfIs9cyEKMNU1nLDbIfzpDkOS0KsknJC6OhYXgaESYtMtEznP87Ps3WF0X?=
 =?iso-8859-1?Q?UqEdMd6JlxjGJH+5Q4jsByQNiSX6mPZxJYyt9YZiInMRl/FwsJZ4ok6uLm?=
 =?iso-8859-1?Q?ECmxfgCR1Qvc18aPHKWEXvUB5Sa/jZAHCzt6DmSyjWiAhCm9Ho4S2QG2NE?=
 =?iso-8859-1?Q?s4koeMA09JHJXXYm8y4P1iIt7uSlU7BXrM/Qd40j9wjOn6HkRbzmqAWjmc?=
 =?iso-8859-1?Q?0s7N1ayMFxSDYBX33yKMA1QslCf7HE5PMsFXniGXVInssuU7pqm05j0muf?=
 =?iso-8859-1?Q?eLaHsKf7WQaPZHTXLGs2SdoIKUyO21DU4z1ZvZrYVlTlvd98o/Zio317nP?=
 =?iso-8859-1?Q?WhUJFJy71VMA7i4JJCGQXfJj6zHVlAPRTzcucbd1sTNuHFs6lq9zB7//xs?=
 =?iso-8859-1?Q?oB7fFG573v56BN/mcaxSttlVqA44LpRQMPIVs3SOP1noFeolpbCruRswEJ?=
 =?iso-8859-1?Q?1RaNlftyzoVfrEt5QgD5Ei32UgDbIxkO3TUf+fvI2QsRmnWFQ1yqq8uyHX?=
 =?iso-8859-1?Q?iXcRr0sJZu6sIkMkQFeX7uI7AhIonM569FkNZJ1WhxbyrJgsXbpJaTJEwZ?=
 =?iso-8859-1?Q?GEujdI4zepPND+yggUOAGoYxK069RLZw490fRuF4g0ILyj6k72Pdj81ESh?=
 =?iso-8859-1?Q?gzClsLhHDEcmhCPet64Ptjw/RWv0gmiapnd00k9aCFhaXVgBklQfFJjclE?=
 =?iso-8859-1?Q?Nn/Q4wdGNgcBLPlw1FfmXHRE5zfhDB8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c064f1-6ccd-4ad1-252a-08df43efb8da
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 14:41:38.7022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AClJXeCpOEY5Q62p1KDdWDQ9FGq+CLXLgfe1awF/BJNT7Bq//Sj4gNXsnVso8DxSHQuCzxnW+6LijMc0LgnKU448fw0mcZesLFsSkUqS1Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11211
X-purgate-ID: tlsNG-ebf023/1794840104-502E4B50-CC9E6AC7/0/0
X-purgate-type: clean
X-purgate-size: 1118
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

