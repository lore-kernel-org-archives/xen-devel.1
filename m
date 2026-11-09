Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF773606A32A
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=lf7Ug5XR
Received: from list by lists.xenproject.org with outflank-mailman.1480285.1684251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQRtR-0005ZH-NI; Mon, 09 Nov 2026 16:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480285.1684251; Mon, 09 Nov 2026 16:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQRtR-0005ZA-K3; Mon, 09 Nov 2026 16:06:49 +0000
Received: by outflank-mailman (input) for mailman id 1480285;
 Mon, 09 Nov 2026 16:06:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xQRtP-0005Z4-TP
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 16:06:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQRtO-004V8E-SN
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 17:06:46 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af1ef86-8faa-0a2a0a5109dd-0a2a4508e51a-24
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 17:06:46 +0100
Received: from [40.107.209.43]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af1ef95-f659-0a2a45080019-286bd12b5e79-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 17:06:46 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB5878.namprd03.prod.outlook.com (2603:10b6:510:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 16:06:43 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 16:06:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTXgq/TY28GsmL6A0k272O1m7hkc4Bo8XS9eR3Wfv4OVQNZiMrK0JAKmXkViBqecSvTCpsOhBXIZdB0IZolpCKSOOy3JahPn9ihXYxoMXnwN/yJAULcO2UYpMigRhRF62SEfn2OSV/OwRhGXu9QGgJEtYFtbaLia+f+sCX33Y9eQiW+v/v9+VhZqVsPZ4k2gMPoj9eS5gQUX0jl6btArjGG4GNNRUEhB1f8A1E742rd5c0L9HfOH/NzSyDIV6Tksn90P0U0yAr3Jaa8X52ZcXPQM/EifFXnu9neepyTJXtB0rPlUR5YAvxQc4725q/NHh1hBCOWjtSgldW/PfjY6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrBbg9qeRNTGjbHN/zoZou3tzMWl+pK0l51KwI7ES9Q=;
 b=HvcYL3JLwpgfBtTUirMbd8FB/xQnoiA9HEIeOf04peksQEsz9z84EEOI3/wT7cycopdPS5ZDP4fR7vSUvU+1kebS82r3A3Pr3AZH3bueyvGp3hk3DKmzTzQXiGIlhbT/dXksyxaMqlOnQvleSxBqYDf/CqqYU2XZ0bxjzS4gs6YjXM/JMEq0atkceUYmclv45bXu0Pwn+DyG7VWLdnZSXgn4iy3+h4Qs0mevOb37WfP3X+o3YcX9tHsabZJqSRZRnyzDL0r6Ri07QwiFL1TZcP6QfIawuMLtw4cOZrrFI54OjvegE4B8XZ1XB0cewBzKv1FJUlrybWZYUWOgyczlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrBbg9qeRNTGjbHN/zoZou3tzMWl+pK0l51KwI7ES9Q=;
 b=lf7Ug5XR0a06yoYCxcT1xfrFFP3qmOnp/mHB1NY0FU1yuCAqGX1ZLnFnNL9eC1Fmz+/JyrD2QPvRJPhHdsT3Mcf32QCiVS/QW56/4cQm6XIPIE9HJn8sMq8U16C2kAn9r90LGSappLUbZViWyKYJfLxJVni0jAUZMU5K412xj5M=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "roger@xenproject.org"
	<roger@xenproject.org>, "teddy.astie@vates.tech" <teddy.astie@vates.tech>
Subject: Re: [PATCH v4 1/5] x86: extend update_intpte() to support atomic
 get-and-update
Thread-Topic: [PATCH v4 1/5] x86: extend update_intpte() to support atomic
 get-and-update
Thread-Index: AQHdXY3RINolFVW7cESfMxyPtk2hkrcmAaoAgAALdDY=
Date: Mon, 9 Nov 2026 16:06:43 +0000
Message-ID:
 <BY1PR03MB7996CAE748F45AA16ABD3EEBF3732@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
 <20261016164815.3109065-2-kevin.lampis@citrix.com>
 <e62245b7-0510-4e18-8789-045726f113cd@citrix.com>
In-Reply-To: <e62245b7-0510-4e18-8789-045726f113cd@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|PH0PR03MB5878:EE_
x-ms-office365-filtering-correlation-id: 20bd1e6b-2117-44b7-cb2a-08df3e7b72ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 AB0HFCHt17Ad/kZBXSub/5A1Q16hNxYC0z6Nv8Tt4/mreu9qyh5Rg2KtlyA2/7WE8Qoj48Pfdk1dbFZ77bkJSHjuGLLgVzngNLjncJGi+upFqxgKeDK/nm3lKuf8VenUkVICEx/jrjhvZACrs9zpZjlBo0x3LgTSMfpcyl53+e+It4rJ8z8xFas6sOqp0Ih6lxwaE4H11aIPzF3fohJm7IJcODnvfX3cqvof+g/XVi63TSJ6Usm0MRRbK0i/zjmkIZ6AOIX8TNDw88Nnn+b1+Cikh9d7KHzWgWJ08sV0Er+EpmaoYWU96Kl2b+GoxR8xHK7czSpZhZisCMCOansO90uBcR2PusYenirm6O/I0m1PqriaoGN7vnApFpOj2nPoDyVsUNIloskwq2WkcJVmg03laOcz3jCnz/HilNn/Ef6DAqmzYYjaq7gulfmSSFyYqojXkn7iVSU++8EgJbhCPgzRzKlBmUsBYdeDWoNBKpSIxFV8L6ycsDTcJndAMue6XsaV+Cht+mmQ7pYf3g+sEiqAFIppMX64iHEnwiooqRZQyAaz9Ge7SdbDD+EkFNWmMFmSK5AwblkZoqnp5FE83vKlv3dB4/UyfZGk4x0Bkam5LiP+NUxryiGYYW3WsVGs1OdlnidxfUzwaxdkLo+tCZntKcIB2LjYTGyAnlHDBlgbPqlMm9F4wwPU0Nbwkv1K3qmQYk34/m1byOho73zUdQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ts4jd15AmItaZeejExNdkfdwxFIsTv3KubKVBjPF5AYPOLDV7E5bYd0S8e?=
 =?iso-8859-1?Q?reI3MyDy02j6uIe2a0PPCh76usb0cvmLZk/8/m4BQ7PgB35K5nOYNGVwYN?=
 =?iso-8859-1?Q?3j2y/2mva7irR8KW1PRtPNDKk1nEFgjm9yf8LRXKDjtqbge3U3KdCDCJ0E?=
 =?iso-8859-1?Q?kFvQVvw8kc56Bqt/3c+XOcxtOGmZ60hsnw1T77EYJ0WF44CekiharcTWq6?=
 =?iso-8859-1?Q?JjmTWG9KfMND6CLNdiEaqZzziz7zRQOLEMsfKAdq8HKmVrYxpcyU2fB25F?=
 =?iso-8859-1?Q?tmCd5RMGNes4drbo9Vd7GN+KQyNQ8dL/4DT1i1vAAu0ncUvlHJdTW2dJvt?=
 =?iso-8859-1?Q?duiZo3RPlOHgKags0pA+fACR6hHKBYBjqilH8YYFYXYnFPcgN7cAaYNJnE?=
 =?iso-8859-1?Q?Z8js6pRSFXtfouAaHSqLF/b4g0ocqAvZdIm3lx+u+/zM/h36ryKgFvRzH4?=
 =?iso-8859-1?Q?7LdLDFKdIwKPLYS1TNQGE+rYBFzsqv+QQcp8tD4W3HcXDKUpMEPbP4yboj?=
 =?iso-8859-1?Q?rMXSGo69P5DbOdt8IjooxX7Sznzwg/2iXGYCT3+5ob1qIZrI7I0xRhqYEx?=
 =?iso-8859-1?Q?VEGtmyk7WN0P48tPpp/Gm6bflA81FEJlGfgCAcEMCaRG0AgjJx4yqgSVNK?=
 =?iso-8859-1?Q?8vFVU9naW7pA8HL1EkVYMk3McrdvOBJO9o2HjhwQvJyR+UADZsqayW7xW7?=
 =?iso-8859-1?Q?4avBZHzV4K8DpUFxFNmImyG/Cihu2g+2wcmIL8XMVHgx11J1+30vn5u3AQ?=
 =?iso-8859-1?Q?ak1m9xwzOcCtWI14nK20hKloEVesyE36cPHCJ0qHTl2vZ5wsrL4PTlfK8g?=
 =?iso-8859-1?Q?mk4KMECXWE3MA3V2F4JW6EY7gf1aUc8XDLcw9eYZjCB4Xlg2CgS6GkU4r3?=
 =?iso-8859-1?Q?i4dKPf744ECndnLrGnODN7ti3DUBjvdz0ZnjmWE0Ukk9xOXUSeZlb7AgaK?=
 =?iso-8859-1?Q?K4KPZf9Tho9xH022A9qtVlWKhIE1jbSaxVzlqVIXaKIT5pz/Xr10EqOoZE?=
 =?iso-8859-1?Q?SUZjXKiV8yYYPqnroAxtd6XSXD8eLIOb69gTf0XIfNNpVQEn1trvf/MoYe?=
 =?iso-8859-1?Q?JR33KXeMN+MDyMk6l75TJHAobIkNj+qVqjNOPJH6fbvZbsJdarU0Ju1avl?=
 =?iso-8859-1?Q?fCaoK5xyWXBewEa9FxGULd2oQ/ckrnQu01svUmEpoh9qebILD+7qJemOfp?=
 =?iso-8859-1?Q?9vjizapfk67TCa0vrKFq7999CJSGO1BV09ji7HGrRuEocpzkzd1W9ufA+3?=
 =?iso-8859-1?Q?kHnIhTTDood7jB2ihbsrOC45dv1xGNx4pbm28X1KLyKrPFy7KDCnw4wj9f?=
 =?iso-8859-1?Q?F06Ozs4J/dH1wf4CeOxK4928mLvXlVSfDiFZV08W8bnuSnF2LO08nAI0TO?=
 =?iso-8859-1?Q?aMz/d/WfdDWj931yPsGyddTaxTWEdYqeiOTED/+msgTU57k3ehR8mAtG0y?=
 =?iso-8859-1?Q?2eBcEB4XLh/VTCteeG972igT366Ta5nyzksEvgE5fKIL+aNlH8m/ub65Di?=
 =?iso-8859-1?Q?B38H6GqpDzDX2f7hJXwkAcJVXE3ejz6JJl1ZRVN20n01IKfnyRxUhSrbTe?=
 =?iso-8859-1?Q?VDJND6uu4ojHFruRy6P6i9lEZvF8JL95Ioxa8FJowCiS7Rg2mRoBhRXF3d?=
 =?iso-8859-1?Q?Zxk3asFCByR0L7mgwCCmzIydKNxBNdJbhbWQNtfA8XRS5Z5kFLicLZdVhv?=
 =?iso-8859-1?Q?I8NicL3wHohNDx/sR7CBBFvCSIxqDKz2q2cChaY0ioLNy94aN7/x2beHZV?=
 =?iso-8859-1?Q?9moamoGqS91FAnt4vRBbEQzd1Y0nfzgVLn1R1d9ZNUpFuk?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bd1e6b-2117-44b7-cb2a-08df3e7b72ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 16:06:43.5365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Za+0ltMEaFRATgHgjyZgNkJEMjaTCyvCbEZOPfHnhyte7sUaSXeoYqtdPFNz2oNkKViRP8JV1w2w+Ou70+pyVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5878
X-purgate-ID: tlsNG-c1860d/1794240406-DFAD487B-DF678047/0/0
X-purgate-type: clean
X-purgate-size: 87
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>I can fix this up on commit if you're happy.=0A=
=0A=
Thank you. Please go ahead.=

