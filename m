Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8260D606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 17:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=OQM3mqTU
Received: from list by lists.xenproject.org with outflank-mailman.1465050.1675915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMULC-0004wK-Nw; Thu, 29 Oct 2026 17:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465050.1675915; Thu, 29 Oct 2026 17:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMULC-0004wD-Kg; Thu, 29 Oct 2026 17:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1465050;
 Thu, 29 Oct 2026 17:55:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMULA-0004w6-Ma
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 17:55:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMULA-006XHH-2v
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 18:55:04 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ae3885e-2eae-0a2a0a5409dd-0a2a4508ca5c-8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 18:55:04 +0100
Received: from [40.93.201.68]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ae38876-f659-0a2a45080019-285dc9445fbf-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 18:55:03 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS0PPFF7CE02BD0.namprd03.prod.outlook.com (2603:10b6:f:fc02::39a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 17:55:00 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 17:55:00 +0000
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
 b=h72JyTfQ8zNcjC6lGVFh2V3wBjdNO7flrH4z2lgTG0CxeCeTVeqTeG2QwQgvBy9N2HMpU+0Eg/1e6B/6/m2NPpJtmzOm7nz72AbuZ8njcYV4pZiLbARAQfARyb7gfm4QXvZ3Pp9typiMXllpgrLYUxkay6OQ2qQVK4BYbkHP/61313kj0m9y33c6B+Z+c2RLo1KdvEh9Zvbk1sKmrHWWa4NXWkgKJxzHOeVNm3Q4w4W57Wf094obcpAjetJH/O8LAXp+c9Mh/3T1BfpTF+DLDEIj/j472z6dgkzTZ3Ofq6xW6Anm9mH3EI67fd+xA0vFiA+/513TsFB7WmGc+8j/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGab5AIaR1STeapt5WDS0Xtnl2GjCzzUijhZvewu1AI=;
 b=DJ3sBDT9lTZexORZjef+f1ZECj5ZmX5d1YCEwdTO2TixMdgY89pMCI9niIV23MJDPE5hG07Y8tjqEnuUtMdqBG/7uXB9gkp200JA+IBBBXgHV2OgTVUZ14OnPMjk05F0vB9tt8UljlqSYiyGs1L/hgouisxP2ulZqBS4vRBjNfqQGgMH7ixwlUjtMhMrc33xT3gkOkfhCRLFOVaMepoEldLAiMijn9GYX/1WAUeZY4Lm7G0WZNpBtfszFHJMsu7vEG0Ida3XvnUouLqRRTXGgexBzorA3JDyVqy2+1SwUCeg+erOrO+NJYZPqUx16IWBaoLmQXh2CuiIJbFiAyDeSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGab5AIaR1STeapt5WDS0Xtnl2GjCzzUijhZvewu1AI=;
 b=OQM3mqTUw1yTnYZqwknKwJllgH/25GmSlaKe5pxfegTjxzyrSUK6ZPGI219ZvybUcNor5NjVBFKH1lB9juEwLcyhpfEhv9nTsN2ZANTCQiEiskiiH3X6fVmdJRvFSuXI7RtcymTXy4EPwuYUNMjuXBmvbbWFefFX1CAM58DTuIU=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: =?utf-8?B?Q2h1bmppZSBaaHUg77yI5pyx5pil5p2w77yJ?= <chunjie.zhu@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jason.andryuk@amd.com" <jason.andryuk@amd.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "roger@xenproject.org" <roger@xenproject.org>,
	"teddy.astie@vates.tech" <teddy.astie@vates.tech>
Subject: Re: [PATCH v2] x86/nestedsvm: write back V_NMI and V_NMI_MASK on
 nested #VMEXIT
Thread-Topic: [PATCH v2] x86/nestedsvm: write back V_NMI and V_NMI_MASK on
 nested #VMEXIT
Thread-Index: AQHdXTzn+Hkg06vIsUeaRhcdK6IUircU3j9P
Date: Thu, 29 Oct 2026 17:54:59 +0000
Message-ID:
 <CH8PR03MB82744855BF65535C54D7A3C7F06E2@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <bdc00337-6197-40e8-8515-6e4c0024c0a1@citrix.com>
 <20261016070611.255322-1-chunjie.zhu@citrix.com>
In-Reply-To: <20261016070611.255322-1-chunjie.zhu@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|DS0PPFF7CE02BD0:EE_
x-ms-office365-filtering-correlation-id: 8cfbd4d9-3a9b-4785-ca7e-08df35e5c04a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|261026140227099003|38070700021|4143699003|56012099006|11063799006|5023799004|261022105027099003|261021121427099003|10067099003|261022075727099003|261009223027099003|261028144727099003|261021123027099003|22082099003|18002099003|261026121527099003|6133799003;
x-microsoft-antispam-message-info:
 11EYPlGx872ph9T9CI4t9dxW7PDztqb1H6PGID5RV//m7mHN+twT08Ajq+BGAL9X+zgphHj0boCEVdoafPCZitKqRsYvMUoBX/PQxkuz7dmHnohurkSHHYaJZ8A0Q/5vQ6Rc6z41ZTiaSR+K0WRfdjhnuUJULNmKQ7/K0tr3+D9685E9IVuAdG39Y1N8rIHYstQHbSBdZWt2OKmn1iRKv6zEQB2Csw0tG7oesTwsOj+6DAwVu+S/nR4SrKmQneOFwCDEMDwwPJ7WTP0fKbB7X845xFY7FspKh6vXI0LjmDl4hEOVRsSWD/f3z4p2jd+K1+V7I8SkmkuhQy32gsYo2iUpBydTCYlo41u7ckEcNLNmBmRye4fwV6dmJ9I+SYMXWToeuGAC4qky9yIsnI1EFyE31wK9yVaPcJNIpRWY01wn5vV4n6TGNFwJFfOFIlgQH45FyEh7dEaGE22KbNHJuvG32wFdxfp+Yi1ymKDjn/KjiLFV8Tuqrg+0z/XqrM2q/4w12qPPZ8FI5393lQrHAjNBhUrEsD1ydUd9fRi3fWIpcfRIuocPf5CE+lCv1OtxjQkkFFit5xY/18Py+4E1cI3JRaFFh2lCkmf+TwvpMlYD+bSglf73ZdSMlwh+AILiX8PamRnRhU9NLLXkOlJd7eb595f/OaxW3fNmOQgP8iw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261026140227099003)(38070700021)(4143699003)(56012099006)(11063799006)(5023799004)(261022105027099003)(261021121427099003)(10067099003)(261022075727099003)(261009223027099003)(261028144727099003)(261021123027099003)(22082099003)(18002099003)(261026121527099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UE1md0NtZVlYbzFxT2pUcDdvMjM4SzJTRkFQaWwvTGFVdWtRdDVsK29yWFY4?=
 =?utf-8?B?bEx5K01WdjVuR1JTZkZxSFhzSGdVMm11MmRFMERLQ3g1eG1tWTU3MXQ0N0g4?=
 =?utf-8?B?YmtTSkRCZlVJYVRLOVdvU29UVkV0c2MzN0xqY0xKa3ZJUmxWV3VRVEJjWTI0?=
 =?utf-8?B?Wmk0TGtrNEgzNzJFdGxCTm1pRWZQTzd0Y0lUM3J2SDNBS0gzVEV4ajFyN1dh?=
 =?utf-8?B?a2dLVWVPL09ZYzRqbnJrTnV3TnFlTjBPT1owOWFpQ0hJWTJEcXdKOFcyaDly?=
 =?utf-8?B?NndNRzRlcW5MQ1dhOW5TSml2YTlWREZ4L2RSNkNMdnpzOVBTTHc1c2RhWFIy?=
 =?utf-8?B?MFhxRzAzV1gzcGlwdTVBWjdCMkF5NTk0dVNWNThiNGVuUkJ1YWVHVFlEclRH?=
 =?utf-8?B?MFpUNHJ6OHFnei9VMXE3MXVjV2lqYVBUNmhiZ0J2cFBRSGo5RzRBUWE5V1Nm?=
 =?utf-8?B?c2drc3BVSDZhWStaUEQrLzl6UGtPbVRGQmhoOHBGVG1MQllBYzdseFRoVXZw?=
 =?utf-8?B?VHRMQVBPVWJQMm15aGFlK0JyUFNJT2lKK3VXWVQ3T0xiZ0JxN1ZxSTdUYVc4?=
 =?utf-8?B?RUdqMnV1bVdOdUN4WVk3M0ZmelYzbm5XTG9yUVdkTFJ3cThZd2lqS2RNU0Jw?=
 =?utf-8?B?bmVSdXdUYzlLZWJ1azM2UVR2Wkt0VWZJUlFsZ2d4V1VZMHBHdVR3M1paWUxO?=
 =?utf-8?B?ZkVHMFBpcjhGRlJtWDJvU2xYM204bE5BTXRvY3N2N0tkYVkxb2tLaGFRQXFR?=
 =?utf-8?B?NVVaanhQb3UxdHhHOGxBdlpnT3hWTVpJUmRXdUZidlc0RUJzb2c2MzNWRmha?=
 =?utf-8?B?VGozMWpvM3ZRTG1GWGtIa0Fkc0dvemhraWpYWjN5Rk54UjZmbEVla1F5N0N1?=
 =?utf-8?B?VWVXengweFo4UE9SQ01teVNmbnByejVjNW5pVHhOd3BKZ3hFQi9FcmxwNkdH?=
 =?utf-8?B?cUxaT09PN0dTMnBxRnN3N2JLL3VJRjRtaG9MOE4vV3ZJL21tWm9ZV3JsSmFL?=
 =?utf-8?B?L3hIUHh4ZmRZSTRPL2R4cUhMVDFTL3J5aDZ4VkdCOFhubFBhYUlBQi9SYmtU?=
 =?utf-8?B?WXhCUWNJN1JRMzgwbzBQN09lLzRPeU5pN0Q0NXNrVFkxMGpmcmxuaUZDRlZU?=
 =?utf-8?B?ZnBQRWFhSmkxdXhZVGZkaEcybVVISVhhQ0J0L0wwa2V1UStCUURRdytSVGo4?=
 =?utf-8?B?TUVMdEVOb1RuYlBhem1rTVZqa2drVmVmNUhWM3UxdW5mRlVoNkNYV09OdU9F?=
 =?utf-8?B?b21pMG0rWlNhSjQ1Yy9mbGxSM2p0QzJhbTd1SkxNMVJ6T3dTYXJXY1R1ckxJ?=
 =?utf-8?B?RU1yejZsa0tzT0RNaTRET2hqYlVRWUowTHVILzJYQ3VacUlOK2pZcTlQM0tJ?=
 =?utf-8?B?YktTQlNLYXBtMFpwMFRMcWFuVWRaOEhubCt3V2plQzN5VEZ6OVl2UXBmNUhN?=
 =?utf-8?B?MTQ4R0FhZnhFOWRzT0lBd0FiYndHQ21HMVpMblZlbkp6L2o4TTVxUjRaRmE1?=
 =?utf-8?B?K3dmL2c4dnk1STRIM3diUG5uRGpQNXAwY2w4QlMvNGRvMzRNblJUR2pqMTFl?=
 =?utf-8?B?cHdmeXRBVXVxUGl0OXRQOTVaMWY5aGtJQUt4NEZMdjNreGpCYTFyQ0ZrTStj?=
 =?utf-8?B?UVNEOGU5M29iUEp3Q21kdERzd0liSmtadmN6eUp0NW9PcHg0ai9lZGVkbVdk?=
 =?utf-8?B?NkNrRTV5R0YwRjRZckwzNFJoOWRES1FJb2s0d2I0citqVnliUm82bEk0Ujh6?=
 =?utf-8?B?ZDkwT3ZNemFGWm9NY0RBRUdZWnBtUVRJeC9tc2RPMjJaODVpY05yTVZQN0RS?=
 =?utf-8?B?RUlaS242MEJmc3F0TFpJQk9KYzREbEF6MVN6TU5nSnFzN21VZ0dFcjBxOGts?=
 =?utf-8?B?bmVGdGVybHRrR0t0QTRDNzNFOERBb0JsdmFDWHN2RldoTktRTVNRVXBCV3Fl?=
 =?utf-8?B?dVV2M1lxaUt5YlhLbVE3QWNYNnUzSmF3OW14eEZvV2VEVmVlSHRGTndNbVpN?=
 =?utf-8?B?Qk9jaE9EVHcxY2tOYUxpZW1mMHIyemZyR0kzUDZ6TGxYbkljOGtRTkx1ZU9B?=
 =?utf-8?B?SlplSUdWY3dTT2hjNDgxVXRHcFZ2SWRvc0I1UDRuRU9XYk1wYkl2bWYvSFBZ?=
 =?utf-8?B?VUYwSDJ5dm8vYWdmeUNlcUJyUEUvVEdiM1kraCtPenlQYkRXbUYwMDBRUmlx?=
 =?utf-8?B?REZDQ2piRmk4cThFVm1YeWZlQmp0d0Z1VmVrZmJXeTRxNHd1U1g1bWF0NzdF?=
 =?utf-8?B?TUZYNXZpbE5xRnhHU25SMmRJZFMyYUFkMEJ6U2pYcmJpTnRMT3JPUmpFbFlL?=
 =?utf-8?B?dUdYYlQyNC9oTE94T1dMSlQ1K1NpWDBXU3BSZ3R1cGJtTW5tYzFBZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfbd4d9-3a9b-4785-ca7e-08df35e5c04a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 17:54:59.9217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiFhA8ZJanD4GekcemF0rLY4BC+KXe6iV6m5y9RzkY9FKg3x/uHoDstAEB0mAXBNBnCWYqXYWFj0Yg7DNoACigMtObvgWEl8ToGZIfzw5Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPFF7CE02BD0
X-purgate-ID: tlsNG-c1860d/1793296504-D775B87B-190D8FAE/10/78276251493
X-purgate-type: spam
X-purgate-size: 4894
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3Jn
PiBvbiBiZWhhbGYgb2YgY2h1bmppZS56aHVAY2l0cml4LmNvbSA8Y2h1bmppZS56aHVAY2l0cml4
LmNvbT4KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTYsIDIwMjYgMDg6MDYKPiBUbzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZyA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+IENjOiBDaHVuamll
IFpodSDvvIjmnLHmmKXmnbDvvIkgPGNodW5qaWUuemh1QGNpdHJpeC5jb20+OyBqYXNvbi5hbmRy
eXVrQGFtZC5jb20gPGphc29uLmFuZHJ5dWtAYW1kLmNvbT47IGpiZXVsaWNoQHN1c2UuY29tIDxq
YmV1bGljaEBzdXNlLmNvbT47IHJvZ2VyQHhlbnByb2plY3Qub3JnIDxyb2dlckB4ZW5wcm9qZWN0
Lm9yZz47IHRlZGR5LmFzdGllQHZhdGVzLnRlY2ggPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+Cj4g
U3ViamVjdDogW1BBVENIIHYyXSB4ODYvbmVzdGVkc3ZtOiB3cml0ZSBiYWNrIFZfTk1JIGFuZCBW
X05NSV9NQVNLIG9uIG5lc3RlZCAjVk1FWElUCj4KPgo+IEZyb206IENodW5qaWUgWmh1IDxjaHVu
amllLnpodUBjaXRyaXguY29tPgo+Cj4gV2hlbiBWX05NSV9FTkFCTEUgaXMgc2V0LCB0aGUgcHJv
Y2Vzc29yIG1hbmFnZXMgVl9OTUkgYW5kIFZfTk1JX01BU0sKPiBhdXRvbWF0aWNhbGx5IChpbmNs
dWRpbmcgb24gSVJFVCksIGFuZCB3cml0ZXMgYm90aCBiYWNrIHRvIHRoZSBWTUNCIG9uCj4gVk1F
WElUIChBUE0gdm9sLjIgcmV2IDMuNDQsICJOTUkgVmlydHVhbGl6YXRpb24iKS4KPgo+IG5zdm1f
dm1jYl9wcmVwYXJlNHZtZXhpdCgpIG9ubHkgcHJvcGFnYXRlZCBWX1RQUiwgVl9JUlEgYW5kIChj
b25kaXRpb25hbGx5KQo+IFZfR0lGIGZyb20gdGhlIEwyIHNoYWRvdyBWTUNCIGludG8gdm1jYjEy
LiBWX05NSSBhbmQgVl9OTUlfTUFTSyB3ZXJlIG5ldmVyCj4gY29waWVkIGJhY2ssIHNvIEwxIGtl
cHQgc2VlaW5nIHdoYXRldmVyIGl0IGhhZCBsYXN0IHdyaXR0ZW4sIHJlZ2FyZGxlc3Mgb2YKPiB3
aGF0IGhhcHBlbmVkIGluIEwyLgo+Cj4gQ29weSBib3RoIGJhY2sgd2hlbiBMMSBoYXMgZW5hYmxl
ZCB2Tk1JIGZvciBpdHMgZ3Vlc3QuCj4KPiBGaXhlczogODZhMjAzYWI4ZDM4ICgieDg2L3N2bTog
U3VwcG9ydCB2Tk1JIG9uIGNhcGFibGUgaGFyZHdhcmUiKQo+IFNpZ25lZC1vZmYtYnk6IENodW5q
aWUgWmh1IDxjaHVuamllLnpodUBjaXRyaXguY29tPgo+IC0tLQo+IHYyOgo+IMKgKiBSZXdvcmQg
Y29tbWl0IG1lc3NhZ2U6IHRoZSBwcm9jZXNzb3IgbWFuYWdlcyBWX05NSS9WX05NSV9NQVNLIGl0
c2VsZi4KPiDCoCogQWRkIEZpeGVzOiB0YWcuCj4gwqAqIENpdGUgQVBNIGJ5IHJldmlzaW9uIGFu
ZCBzZWN0aW9uIHRpdGxlLgo+IC0tLQo+IMKgeGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3Zt
LmMgfCA5ICsrKysrKysrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2
bS5jIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMKPiBpbmRleCBmYWFjZmUwMDc4
MzIuLjNhMGFmYTk4MTI5ZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9uZXN0
ZWRzdm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jCj4gQEAgLTEw
MjcsMTIgKzEwMjcsMTkgQEAgbnN2bV92bWNiX3ByZXBhcmU0dm1leGl0KHN0cnVjdCB2Y3B1ICp2
LCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiDCoMKgwqDCoCAvKgo+IMKgwqDCoMKgwqAg
KiBWaXJ0dWFsIEludGVycnVwdHMuwqAgI1ZNRVhJVCB3cml0ZXMgYmFjayBWX1RQUiBhbmQgVl9J
UlEgKEFQTSB2b2wuMgo+IMKgwqDCoMKgwqAgKiAxNS42KTsgdGhlIHJlbWFpbmluZyBmaWVsZHMg
ZG8gbm90IGNoYW5nZS7CoCBDb3B5IHZHSUYgYmFjayBvbmx5IGlmCj4gLcKgwqDCoMKgICogZW5h
YmxlZCBpbiBMMS4KPiArwqDCoMKgwqAgKiBlbmFibGVkIGluIEwxLsKgIFdpdGggdk5NSSBlbmFi
bGVkLCB0aGUgcHJvY2Vzc29yIG1hbmFnZXMgVl9OTUkgYW5kCj4gK8KgwqDCoMKgICogVl9OTUlf
TUFTSyBpdHNlbGYgYW5kIHdyaXRlcyBib3RoIGJhY2sgb24gI1ZNRVhJVCAoQVBNIHZvbC4yIHJl
diAzLjQ0LAo+ICvCoMKgwqDCoCAqICJOTUkgVmlydHVhbGl6YXRpb24iKS4KPiDCoMKgwqDCoMKg
ICovCj4gwqDCoMKgwqAgbnNfdm1jYi0+X3ZpbnRyLmZpZWxkcy50cHIgPSBuMnZtY2ItPl92aW50
ci5maWVsZHMudHByOwo+IMKgwqDCoMKgIG5zX3ZtY2ItPl92aW50ci5maWVsZHMuaXJxID0gbjJ2
bWNiLT5fdmludHIuZmllbGRzLmlycTsKPiDCoMKgwqDCoCBpZiAoIG5zX3ZtY2ItPl92aW50ci5m
aWVsZHMudmdpZl9lbmFibGUgKQo+IMKgwqDCoMKgwqDCoMKgwqAgbnNfdm1jYi0+X3ZpbnRyLmZp
ZWxkcy52Z2lmID0gbjJ2bWNiLT5fdmludHIuZmllbGRzLnZnaWY7Cj4gK8KgwqDCoCBpZiAoIG5z
X3ZtY2ItPl92aW50ci5maWVsZHMudm5taV9lbmFibGUgKQo+ICvCoMKgwqAgewo+ICvCoMKgwqDC
oMKgwqDCoCBuc192bWNiLT5fdmludHIuZmllbGRzLnZubWlfcGVuZGluZyA9IG4ydm1jYi0+X3Zp
bnRyLmZpZWxkcy52bm1pX3BlbmRpbmc7Cj4gK8KgwqDCoMKgwqDCoMKgIG5zX3ZtY2ItPl92aW50
ci5maWVsZHMudm5taV9ibG9ja2luZyA9IG4ydm1jYi0+X3ZpbnRyLmZpZWxkcy52bm1pX2Jsb2Nr
aW5nOwo+ICvCoMKgwqAgfQo+IMKgCj4gwqDCoMKgwqAgLyogSW50ZXJydXB0IHN0YXRlICovCj4g
wqDCoMKgwqAgbnNfdm1jYi0+aW50X3N0YXQgPSBuMnZtY2ItPmludF9zdGF0Owo+IC0tCj4gMi4z
NC4xCgpUaGUgaXNzdWUgaGVyZSBpcyB0aGF0IFhlbiBhbGxvd3MgTDEgdG8gZW5hYmxlIFZOTUkg
aW4gdGhlIGZpcnN0IHBsYWNlCndoaWxlIGl0IGhhc24ndCBleHBvc2VkIHRoZSBmZWF0dXJlIHRv
IEwxLiAgVGhpcyBpcyBiZWNhdXNlIFhlbiBibGluZGx5CmNvcGllcyB0aGUgZW50aXJlIHZpbnRy
IGZpZWxkIChleGNlcHQgVl9JTlRSX01BU0tJTkcpIGZyb20gVk1DQigxLTIpLAp3aGljaCBpbmNp
ZGVudGFsbHkgYWxzbyBhbGxvd3MgdGhlIGd1ZXN0IHRvIGVuYWJsZSBBVklDIGFuZCB1bmV4cGVj
dGVkbHkKZ2V0IEFWSUMtcmVsYXRlZCBWTUVYSVRzIGFzIHJlcG9ydGVkIGhlcmU6Cmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC9DQSthQ1MtSGE0alNZRmZ4aE93TUdpR0pQZENPdGdC
Skx0PTNRPXY5ZGZwNlNRSnlzNHdAbWFpbC5nbWFpbC5jb20vVC8jdQoKRmlyc3QsIHdlIG5lZWQg
dG8gZml4IHRoYXQgYnVnIGJ5IGNvcHlpbmcgb25seSB0aGUgcmVsZXZhbnQgc3VwcG9ydGVkCnBh
cnRzIG9mIHZpbnRyIGZyb20gVk1DQigxLTIpLgoKVGhlbiwgYXMgYSBzZXBhcmF0ZSBzZXJpZXMs
IGV4cG9zZSB0aGUgVk5NSSBmZWF0dXJlIGJpdCB0byB0aGUgVk0gKGlmCnN1cHBvcnRlZCBieSBo
YXJkd2FyZSkgYW5kIG1ha2UgaXQgd29yayBjb3JyZWN0bHkuCgpSb3Nz

