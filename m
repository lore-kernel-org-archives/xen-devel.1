Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAF5C88E7D
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 17:41:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421995.1647601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6X9J-0005Xl-VL; Tue, 15 Sep 2026 17:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421995.1647601; Tue, 15 Sep 2026 17:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6X9J-0005Xe-Se; Tue, 15 Sep 2026 17:40:53 +0000
Received: by outflank-mailman (input) for mailman id 1421995;
 Tue, 15 Sep 2026 17:40:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x6X9I-0005XY-Fb
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 17:40:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6X9H-00HXrj-Sr
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 19:40:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa982eb-2eae-0a2a0a5409dd-0a2a4501a2ce-32
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 19:40:51 +0200
Received: from [40.107.201.19]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa98322-5984-0a2a45010019-286bc91304a0-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 19:40:51 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS2PR03MB8418.namprd03.prod.outlook.com (2603:10b6:8:32c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 17:40:48 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 17:40:48 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gqsr7afEe8MXHi4A9Nh+Zmjw+Tg8+nrqfbB41Mg6zzGVPejOnH9MUvQS6PHQWgw5Ir12xnRt6jNxL6HSOUGt/iWHvKYA5sPoQSH/+ssq+m1LzWNR1/BCaPr+XG04lRkoEyqT9YhR1aeUPXGUZVW3iwqM/RN4mosgJFL31DNedrlOUkx5NamAUAtmxqjmRV7dlmCi7NJyUpZsSN+oK7U+9TMaKQxd2qDEg8HP1Wqcxbj7PlRrCnizGh0PdLuBk28u81TeAA+BPEMg4t1cUtTgW8+NtRmWhYQU86D+D3z6p34FTG5FjBt2c05wdvjqKfmR1/a1msWCuoGjYDhLxbHi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUrYNOI9r0C0mwIIGWx2ncqfPsgZgCcsFQo4810CMeA=;
 b=lDMacFVP/DK6JDL9irPgdP5mAuy4tLSLbLFH9QBewVd8CXIToOBLr0eICPTrjJdrWcg/Alsn3dim3dj2f42HrsvtM2V4aM0/0qZ1tO3zSKjsSXJcx/3KIu3yc5lYBt+K/b/diymSrvxWVm+VeOMtNyL0ZFZNu66/rNNv2fqbvyKfgY4BKm9OtORtCRcCB3ZQrMeqwq69mxR636VElUMQQd/PPV1YtRQ+5RZH43zK0VG7/JbnY8mpXBjnjcmnHN6CTol9eCFFVLOoU+M95yF/x7QFTQgjZlPgpLq79wmgIAcU/0qaw6rxxNTbyKElpLQqFIFaKIWgRPKyCYJtJku3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUrYNOI9r0C0mwIIGWx2ncqfPsgZgCcsFQo4810CMeA=;
 b=HOnDeN1/65PKazYUxejH5HN43hB/rGaLEy4WkBusinNtPu83ajK7wUyvgeLklwIEzheXo5WLsvUixBbKGy2W1Ca2gdJlqW/crJ2LV4hirDFU+9fpjy2G6fFveboc7mvy1zeP/EnS8nIw41YtuB1H4vcz6FzUrIP/yeV3LTkJJ4U=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "teddy.astie@vates.tech"
	<teddy.astie@vates.tech>
Subject: Re: [PATCH v2 3/7] x86: extend update_intpte() to support atomic
 get-and-update
Thread-Topic: [PATCH v2 3/7] x86: extend update_intpte() to support atomic
 get-and-update
Thread-Index: AQHdQWMYYuOEW7sUTEmdu2MmKUu4LbbJV30AgAaXyo0=
Date: Tue, 15 Sep 2026 17:40:48 +0000
Message-ID:
 <BY1PR03MB79960A870CEBD61B286E339BF3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-4-kevin.lampis@citrix.com>
 <0aedfbad-29ae-4083-89b4-5c662398553d@citrix.com>
In-Reply-To: <0aedfbad-29ae-4083-89b4-5c662398553d@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|DS2PR03MB8418:EE_
x-ms-office365-filtering-correlation-id: b028f62b-9aa0-444d-abdc-08df13507a78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|38070700021|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 k+TIVgZcXnk4MtYWpB5tXyhiFnmp8Gd3rD+MwgjJg5H8o7rEfLzZppklT8hEvcXDEm8I0JHBC0vGvs0IfaRSNVjaQ1wY3V7pdx7NIFJKM0vbrHPd/Z1VswvrALMZiePWxcQOotV6TINbj5nHONWARNp7VccEVtLzfQV21mpz6EdQx3enr5P4hlv3zxTpocDIZIEV97OLCB7KDkJvHJQNf8CHm1MuY3v/onzIoIRpH/yciDO/aL5f7uTVvp5mHf3//mQeJUFPayxzEoXeEBWs95teXA8rQp2j4a0g/tRuPKb+yoXLImZlojaX9nKLEQk4NTE9wnj9HJneG77LOl6ZfbTFmUXgAJRq3DqqULNBwr35lhEcQEtNg2EQFZBFlJOBqxzEdHYk4cAOaZAmX7xUERd3A7/MUjgcjBkR6KmJD82Pq1Fnmr0SMDXeiGjBf6VHKcnM48uZGQ4HwgR886zn2mQpswLNViRqih+7ItioNKvVRRxqXsrCl7mZzoT7z2bSpoHkrCH7NsFWCARRiUwgjo1y9d9DvX+s8LbR5i96EJmPaxnvRzuzgZBH0r7GjdtKan52NMty3Hi8YcftX8x6WcrjZ+kjJZ+7S0tHDuvAxWWeMz9OczqDRA3Xm5UeccssPEr2CoDUCr/mdJiqUlIiEIzHzSH3WOc6iFlkk4Fj0YEmftWeP9T9H4uL5HNaL9/0/lTWq/9hNUy16wChBQi4Rq8IlmzPsDRxYvM8kZDdFbs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3N8opkPzxWymciWYmRuw26PIv3m4Nwp6/RriaDHTn9vZDw0AM8J+AvvCxJ?=
 =?iso-8859-1?Q?l5n2ef/+l0tcMbRXMbOQEJITAhkSqHroV3xCXKwpY6Dw96CXqJR0SvMFM1?=
 =?iso-8859-1?Q?BhM4eLhkY7ZJIheE7q4fPceXeNEMJiXYMea5PzEb9O/8ch907uPPCv+ajq?=
 =?iso-8859-1?Q?eNFu70+GWmOUBfZFc15zHLmhlwQ0aSZ18yHonIkAop3OqOgSag8+IkZZuP?=
 =?iso-8859-1?Q?oXHTLMc40DpYUp299f2y1RTUZM1e+UhwvjbBt7hI/lZSXyS8+ZDRi+plVQ?=
 =?iso-8859-1?Q?N6adqayItoxMXIB5hTcEg48N+hUy08LgfP8xgKAcq/BDdKTnFZAzDem8F3?=
 =?iso-8859-1?Q?aM0HEPiuGnbejbSor0KvqTmnT0tnnqWesVIGpstHIUDSVCCoP/eLm56iBC?=
 =?iso-8859-1?Q?HjJC8+jZcKpGI2Mz2I8uvgyUjUA9zAHS7XCXEzYnbs5YVsqowKgL95DIuI?=
 =?iso-8859-1?Q?686GNcS7KtKDL6IMBJWw4B5thpKKL6oxIrJxLBeuRZ4n0x5ZjNrCuP6TOV?=
 =?iso-8859-1?Q?pXlPUpUAkherZCS+ZAAVrSOzSoWlieajLlQECgVXFXPRO539OiMjJ8ySz5?=
 =?iso-8859-1?Q?8GCbsVN5eLi/N+QwDl3CVdqpn8xeB50+j1OLevdAZBGHhtkw0Rtl8vtAgF?=
 =?iso-8859-1?Q?8CmH3TbN6UZuT8KHCE0SA+Dc/Yy+6ywuSfrmKMudMGDFW13f6OhMau8cRd?=
 =?iso-8859-1?Q?PGu4xp5Ajrbc3HSaxSWPqg8j2k5kFuHfE1XeiDc85l+GAQvNaVjcOvt7QN?=
 =?iso-8859-1?Q?efKsmRlWSRBxvjhJwpUP4A1+RugBmAUaPMzOlUkk4T1lwmQa6ZB2cOfqIA?=
 =?iso-8859-1?Q?oXG7cA/D2sS9ZdFnOJBEOZAJ9HzjlszXKKlA+CU0qBr02i7oioPwK+a7CC?=
 =?iso-8859-1?Q?acbtK7MeYpc0GmT9Y8YuFGESz5KFxU+hjWuAhg02TzLdUHvaiYWrXT3K7+?=
 =?iso-8859-1?Q?+b6zX3pHoch3nt7YvEuRJskTCn3jHvsRwL6+fsLvFim/y/MdVVPQwnot/F?=
 =?iso-8859-1?Q?kjhLcXMb6JICLiKHNZ4/CObyd8WT2n8nUXRMtv4vui7tTZwH8kaUjHM1zk?=
 =?iso-8859-1?Q?VA+DZYIK0f3oewtBSKV1C00KGr6ocrHK7EDwnzl+Lu+eO+KgGDes5/rsvz?=
 =?iso-8859-1?Q?Aad+S3zo4Q7yyYdT5b0x/ptXTGwkqhNQ0gKW83JovFwskfhY3jbBHt2beS?=
 =?iso-8859-1?Q?VGoisb3Q1HJEyvRj4N+MN3VdVF3PK7wxIFlOlQaRdihPP2OVS7xvNfO4Nb?=
 =?iso-8859-1?Q?ZXbwbHidBKxfooQPr8yo34BR+zImzbTYPL1Pkv6Sr/uB2HlRu6fqr1tDUx?=
 =?iso-8859-1?Q?BenpXZkQTglYE1rzw12/+42tu63VNX86N9AULNBnTIrhsr1i8oQX/EaOdb?=
 =?iso-8859-1?Q?CpUfq2Sob11Z6QOSVFfZ1+F48Q4Z4v95h6X4eIK+qthnPRfSskE77mJm9/?=
 =?iso-8859-1?Q?wJiM+GZPMXVz8eCN/0g4/vj3NtezLMPVhd9rdhPREj6vFafNvG9GFfGB4w?=
 =?iso-8859-1?Q?2SlESy/B9REQ6tBpXDrqBLPtrzgGQNC+vbrGkQPg1oRj2XM4C/vMNwoUJT?=
 =?iso-8859-1?Q?4aOZOUHfaYFy5arlS97U95LVC3x6LpLgKw+Y0eaGObxcNihviPvJK1wugY?=
 =?iso-8859-1?Q?EomGgjtnfNFlobhpY8q4mNdDz8YV1UR/F/blZr4ecStD/Yw6tlExR5nAGn?=
 =?iso-8859-1?Q?cDN27IxOM5wh5KSevFfVuh4H55MEaBWgwEYAJi0NRpYQ9ge979tuwHHwF+?=
 =?iso-8859-1?Q?w08MaIoinbxVeoUWPqSX0a4rxFDWFWU5LUpUg+wUH1HuQW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b028f62b-9aa0-444d-abdc-08df13507a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 17:40:48.2868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5ybPd6r8I1gvswsGtdKTX0Q//g78XbdcC2w/Fd3/hU3tIUtUUDyUa0jHAc6NuTFw43zeIx3tMZgtO6k8IDtcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8418
X-purgate-ID: tlsNG-d62444/1789494051-1D87F757-E3B7FE8C/0/0
X-purgate-type: clean
X-purgate-size: 616

>         you want to wrap the expression in _t ## e_from_intpte(...) to=0A=
>hand back the type safe version.=A0 In turn, this lets you remove the=0A=
>'.l1' part of the assignments in the following patch.=0A=
=0A=
That would be much nicer but it trips over `-Werror=3Dunused-value`.=0A=
=0A=
I don't know a way to solve this without adding `(void)UPDATE_ENTRY(...)` t=
o=0A=
every call site or doing=0A=
    #pragma GCC diagnostic push=0A=
    #pragma GCC diagnostic ignored "-Wunused-value"=0A=
    #define UPDATE_ENTRY(...)=0A=
    #pragma GCC diagnostic pop=0A=
neither of which seems very good.=

