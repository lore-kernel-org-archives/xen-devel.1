Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23561C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:06:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416670.1645639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50xP-0004x0-Cy; Fri, 11 Sep 2026 13:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416670.1645639; Fri, 11 Sep 2026 13:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50xP-0004wt-9Q; Fri, 11 Sep 2026 13:06:19 +0000
Received: by outflank-mailman (input) for mailman id 1416670;
 Fri, 11 Sep 2026 13:06:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x50xN-0004vR-BH
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:06:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50xM-003p7L-Nj
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:06:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3fcc2-bab6-0a2a0a5309dd-0a2a450a96be-10
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:06:16 +0200
Received: from [52.101.65.123]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3fcc8-f2d2-0a2a450a0019-3465417b5a3d-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:06:16 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by BESPR03MB610895.eurprd03.prod.outlook.com (2603:10a6:b10:10f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:06:14 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 13:06:14 +0000
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
 b=nCLyb7EfYRMwUG5suVHV5oosogepWIqrUaC3Hu8DHWX0Upt6ri0B9xzxKKo9HNOL8UswCZBF89+rnZdPt2iG8M7PX9zWq3o3taBV0Nl4YftWxQhKjFwPB2k7gbF+1Ron+6HvuQbuH2bLOOaqXQYrUJfc2ODOtUQHkSxpMhmtF4Jr9xV5gGWulM9NCVZhRYYggE9Q9w24GUpScgNXY5ZJskEqJRT/U6Jnp/NHIb+LYTXaTj404653O7CG9BH4yBaMPkW4yxjzOSvfIwuFmUbDZkHMg/6ucGbMRaAe9OH3QWrkl/zpxpKoeI28V1twhA/govrSRw4xn9VwbiMvaFawpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5K3Fakczljm9GzsN8TcPKbpUXzJbqrxJZwgis0B6h4U=;
 b=QUX8HkviCcTdXy4MD7BVUjB6U0Cdoq+5ig/NnmYaK2iISVdpNOqdvobKQsLqwPsiHBQ0Olj6WNlxMdaILx7pRE1Tc119LCEC7pOF3dlo353/hYq/0FjYY0i2xBFFvNWvLGI2MOiE1yqrNebxuMITCt54MmqGbXYi/mhxVb7Ohwuy7121luFcQ22Kq7u3QxBnCnZD9Qp1D7Tk8rzS1pS+FhQhth/PnTjxA/Zy0gtK6EfjWix4qdNEUnwxS66NBbUeFJdlyAyVQ/2ry8cQ+9JwpBr1ZnHd7o7RAK8S7kmjR7u0ZWXTocUFrQ+U3QhoYzPZwZTRgm3pko1jnhmfAWc/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K3Fakczljm9GzsN8TcPKbpUXzJbqrxJZwgis0B6h4U=;
 b=RuxIOKgglUBS7KZeNUrxnfqcuLdghrnu1xGf6wBJHY5t6+T/Uhd/oyKxveDU77+pJB5Z48OvJwrj8Qxm2/SfdER5TyMfqOUFcEDd15NdcXjwJaPrKYn9NHg3El/Z2NTnbDK7yT9UEU6ppuJhmZ5PKl5v5t3U4IV4GBKuo82vWhyWY5QO5qLqQyLMrRhUktBsdlZgiD3I5hZbRhyWXEVKw8/jc+II0VADWI9WSUM9AhpSPze4wbFFQpbJNJGIyG60wVc27ickmZAG+k2fHIOYltHJX6/dMKzUDONE/INls7YlHMJ0MYAQRGh6uHKZ4K9ffCkUQTeYCRVtQir4xTWO1w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v12 3/6] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v12 3/6] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHdQb7XwQvbnxLqDEGK19PLXXgae7bJAQCAgABYGQA=
Date: Fri, 11 Sep 2026 13:06:13 +0000
Message-ID: <c9b06223-07b9-4c00-949e-874a6167e2d4@epam.com>
References: <cover.1789055542.git.oleksii_moisieiev@epam.com>
 <6bf8f9dd61da4d0fbea096b863f51db08df46c56.1789055542.git.oleksii_moisieiev@epam.com>
 <1d8be2c2-a56d-4b81-8e36-c4f97099c879@suse.com>
In-Reply-To: <1d8be2c2-a56d-4b81-8e36-c4f97099c879@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|BESPR03MB610895:EE_
x-ms-office365-filtering-correlation-id: 1576ef53-df90-4c30-93e7-08df10057573
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|366016|11063799006|56012099006|3023799007|4143699003|22082099003|38070700021|10067099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 YvEbQ0307raUXcDXnSREEbhOsGDhJvfaYP0SF+tRwZCPoYSen9o+8RJcfbGZq0hoigIC64ZF8pszXJ47Qx6A2Rsv3pftnhVOzDLDieNWhzK7GBWVaHYiNMBUhHwk4zOAjrz+uESn0dbrTs3JniBp7ClTgQ1EYa4xcAVqLsqmsGpAqf0wT2J8G7deElv00lxM/0uA24I031cQdb6MXnQQeQqrtLgbVdG+Vw7sIzxs/e4zunpRMpUK8/h1gqioJ9rC6ALlZV2bQtbP6GL87I+ooq7BCM3VLyLfV260WTaDI2OXg73nD5+vcGoSLhafnAHPmIWrYkSGSb3Kb1928v3/sFnVNhwrAOeV+xZ/19dJqU1lzuUuhx22VYyLw8a7MHs8PN7mGcKUZw5qjalV1DbmyQ07NPkhHm3CFk6NDK5rg1vIEDVrBaYh7vq6ey6DaLpAUUN9OFQ6VA5+dSoC5220lXmk5x14MflSTshdtqhgbVpD6XqokWJJiWHUl6gum33+Qr9Pp7iJ2Z0A5Q90eHGTTmpiNomNcFx83vhN3TzLzba928y3KSd5fjXL86+yPAPtwNi/+m7uRfney+j76egFFGvA/dSrsrVuqlztE78OzzLTG5VDAyYOv8+YIDTPwe+4DjqFAFeXSp2QlB9GwlOgj7OdvvZQwFPEZCcnjXAbNmo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(366016)(11063799006)(56012099006)(3023799007)(4143699003)(22082099003)(38070700021)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTZnRG1yc29DeVdJNkFTT1hvdno0dHhUZlhrWlEvdXFwNG84SExENTlSaUtI?=
 =?utf-8?B?cU1laFBCb2dIUHF5eUdnS1dPVUlIZTBCZ2IySEhadHJwREdzL3VDcHExRDc4?=
 =?utf-8?B?TGg5MkJrTjRqTURpV2J0QktoTHNFOWRGZEF4eW1TTDVYenQ3Q1N0YWxPMFE2?=
 =?utf-8?B?QWpQNE1rQzhlWG9aVjdPMld2VlRmNDd4UTZhTExmK1ZBQ2JqSVVNaVo2WkE5?=
 =?utf-8?B?a0NFemZOWUxzeVhGa2syZXk2TitweEZpdzJyanc4aG5QQmNXNkRMODY5dG15?=
 =?utf-8?B?S0NWZWtoSldWWmJweElRV1RkSE1QTFFIRENGWWtxU0poM1AxWVB5MEVVZzkz?=
 =?utf-8?B?U1pBNGN4Mzc2REFiNXgwdkEvb1RxU3cwYnVEMnR6L1JnR2czN3F2cE1yQ1ZB?=
 =?utf-8?B?QW5CdjkxaERtUmhXQ0hVT1FzYlRLTVhaMk94YXFkUmJHYUZUMU9mNGlsek41?=
 =?utf-8?B?b1d6UzZ3ZXlnVG11bnpUNGpiT0MrYjdvVjZRUGNTY0Z0YVhOaUlRcmVvQktM?=
 =?utf-8?B?ZWR1RmpDQlRhcktEY2J1eDJHY2ZjN2ZGd1Q1OS9iaGk1ZUdXQlVuUTlrampT?=
 =?utf-8?B?Z0M2dkVuOW55dHFlSEEyNGRzSGVBMEtIOUQ3bERhT1lYYTRweERnSmxPb2dj?=
 =?utf-8?B?ckI1YXF2WlhyZDlMTTN6blRzMGRYYnBPaTZQUWk3UFg3eUFRTVVqdVBaR0w2?=
 =?utf-8?B?dkdQWEc4RVR6cGR6TGhNT3Zpd0ZpQytMcGRCdEV5blQxNmd2a1BDTTlhYXdh?=
 =?utf-8?B?QTV2RG5MZnhUYnpMSVR5cllwckpWREhkSGJoM2MrK1ZLQkR5TUkzOEh6VHlh?=
 =?utf-8?B?ZGJPZjVZMnpPcFZTRjlvaUlmelk1NXVUYTE1cXVIYmx0RUsvYWhYRTBSTHIx?=
 =?utf-8?B?Ti9uT2JkeFBFTnVpMkpzeE1SdXU4S0k3T2YwUDVSWkUwdWxBS3pLamFpWENM?=
 =?utf-8?B?UGNJTnBkUkVlSW9JSkNtV3F0TTJLL1JxTU82VExzSFlHbzErYmswWEx5Rzlz?=
 =?utf-8?B?Z0NHbTAwR0Y5U3lJeE0rYUdvKzRuZHI3a2FLNkRrV1cya29rWE1PNXNUT21J?=
 =?utf-8?B?NVFQS1BnWjgrVVB5Y010WW05QkFTM2MrbkhtRWlJbzFITGhaSTBNSU5JY0Vl?=
 =?utf-8?B?MXdBVmo1dlc0WTdDNnJBN1g2OUQ5VUZ1aERsUWdSVjFzakVhaFgyUzNJempw?=
 =?utf-8?B?OGo1dStNYjVaUWY5VHFmZ0Q2bCt6VXlHYXd4a05yQXVDRTdBLzdvaUlZWWF6?=
 =?utf-8?B?cXkzamROcFpydEt6STBPQWEvL0JVSlVySk9SSnBTb3BpMTh1WEpiYUJyTkkv?=
 =?utf-8?B?UnZMQkhpVDBiM29CMytpWjZyMEtEVjVNcWo4WUZoUCtiL3pqamM2M2IvdWlt?=
 =?utf-8?B?MjBIdTNRRUVFZVJRMnlOSU1paytRVUNFU1RPSityU29GWEVTU0FoQzlQRzVk?=
 =?utf-8?B?UU9HK0dxK1NSV2kyYW10czdMZjhocUhteFdXWlVHVzl6RTJTVFp2dGwraG9n?=
 =?utf-8?B?UmJNUDRlWExSanYxWUpSdHpQSUJNN2x5UmZPUXJuNUJlVytkc3k5L09KbmVj?=
 =?utf-8?B?bVlkWTZUMG14bEI5SXVEUXJEZUlFY1Y3VlJ2bU5Mdk8veDBhM2xoYU01dk5S?=
 =?utf-8?B?S0EzTExHQUxWTE1oczUzdHp1K0NodU5mK2I0dWsxd3FoZ3VVaUh3YVpDdXRx?=
 =?utf-8?B?Sy9RUjIwWW1SRkwrRWNNdmpPUVJxNXdyWWd1bVl6SFM5azhHVTJMU2RZTk9l?=
 =?utf-8?B?VUk4MzhXWUFnWklOanFhS2RpTU53dmJTV2Z4Mm9pUHArOXd0VUV5Znp1b0RP?=
 =?utf-8?B?Q1F3Y0oveFBvTEZWV2xUd3Jzb0wycVFaVnNiN0tPQnRxZG8yczdDVDBSZXdE?=
 =?utf-8?B?RlZ3eGhmWVp1bmpROTNwMjg2UzNMcGdMWVA2a1ZObHhFSk9pWXN2YUNLdTFm?=
 =?utf-8?B?Q1d3WVpTcXFtOUJIaGtyNnBVMDFsMWpRT0Rkcmd1YjdMb3YwZ2RnY3RCek15?=
 =?utf-8?B?UEVuejBoenN3aG02d0R4Vm1zSGFVRjhPR2xIbFNvMVh6eXNIczZhbnkxcUdU?=
 =?utf-8?B?dVdKbmIzaVl4VnNaUUZDUGxXTTE1dEV1WDRkL2VJc0RvR3RZM0xSZDU2RHYy?=
 =?utf-8?B?T1A0MFJCSmF5T1RadDVWeS80dnVKM1RhaGVmb2RLNlM3NU1PMFdXbCtZL0Rm?=
 =?utf-8?B?NmV2U1NBNDVGL3NwcFI2bHRSM0IvdGZFYXk4R215MkxldVVGWksxMHIyall2?=
 =?utf-8?B?UFhvUFhRdW1ZUFBmeUZQMnZSYzBUa1Q3S2JBUE80Q3BCb21IcGtKczJWRlZS?=
 =?utf-8?B?d0lXdWlVb1Q2ODFtZWd4citJTmY5Q1pjckdvZlBldkkvWStCN0ZVd0NpTkMv?=
 =?utf-8?Q?DraElMUl9jbPWjik=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <555389FB96A39B498E55C8C8C00A3019@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1576ef53-df90-4c30-93e7-08df10057573
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 13:06:14.0631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4ixhUhLBAI9cIB1FlzsD/HGlAwS4CMEKmCvNT9gpecag0yUMw1tnzyeWm2fcqZRQZl/ZLhbRXMsCEGkN5pxVm+/3sk8/jupYsrreJhL1is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB610895
X-purgate-ID: tlsNG-4011c0/1789131976-4A9D9CFC-EA094E19/0/0
X-purgate-type: clean
X-purgate-size: 7554

SGkgSmFuLA0KDQpUaGFuayB5b3UgZm9yIHF1aWNrIHJlc3BvbnNlLiBwbGVhc2Ugc2VlIGJlbG93
Lg0KDQpPbiAxMS8wOS8yMDI2IDEwOjUwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTEuMDku
MjAyNiAwOToyNiwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBJbnRyb2R1Y2UgbWVtY3B5
X2Zyb21pbygpIGFuZCBtZW1jcHlfdG9pbygpIGhlbHBlcnMgdG8gY29weSBiZXR3ZWVuDQo+PiBy
ZWd1bGFyIG1lbW9yeSBhbmQgTU1JTyBzcGFjZSBvbiBBcm0uIFRoZSBnZW5lcmljIHByb3RvdHlw
ZXMgbGl2ZSBpbg0KPj4gaW8uaCBzbyBvdGhlciBhcmNoaXRlY3R1cmVzIGNhbiBwcm92aWRlIHRo
ZWlyIG93biBpbXBsZW1lbnRhdGlvbnMuDQo+Pg0KPj4gVGhlc2UgaGVscGVycyBoYW5kbGUgYWxp
Z25tZW50IHNhZmVseSBieSB1c2luZyBvcmRlcmVkIGJ5dGUgYWNjZXNzZXMgZm9yDQo+PiBhbnkg
bGVhZGluZy90cmFpbGluZyB1bmFsaWduZWQgYnl0ZXMgYW5kIG9yZGVyZWQgMzItYml0IGFjY2Vz
c2VzIGZvciB0aGUNCj4+IGFsaWduZWQgYnVsayB0cmFuc2Zlci4NCj4gVGhhdCdzIG92ZXItc2lt
cGxpZnlpbmcgdGhpbmdzIChqdXN0IGxpa2UgY29kZSBjb21tZW50cyBkbykuIElmIHNvdXJjZQ0K
PiBhbmQgZGVzdGluYXRpb24gYXJlIGVxdWFsbHkgbWlzYWxpZ25lZCBtb2R1bG8gNCwgd2hhdCBp
cyBzYWlkIGlzIHRydWUuIElmDQo+IHRoZXkgYXJlIGRpZmZlcmVudGx5IG1pc2FsaWduZWQsIHRo
ZSBlbnRpcmUgY29weSB3aWxsIGJlIGRvbmUgYnl0ZS13aXNlLg0KPiBXaGljaCBjYW4gZWFzaWx5
IGJlIGEgcHJvYmxlbSB3aGVuIDQtYnl0ZSBhY2Nlc3NlcyBhcmUgcmVxdWlyZWQgZm9yDQo+IHBh
cnRpY3VsYXIgTU1JTyBsb2NhdGlvbnMgKHdoaWNoIG1heSBlLmcuIGFjdHVhbGx5IHJlcHJlc2Vu
dCBkZXZpY2UNCj4gcmVnaXN0ZXJzKS4NCj4NCj4gQXMgc2FpZCBvbiBlYXJsaWVyIHZlcnNpb25z
OiBJIHRoaW5rIHlvdSBlaXRoZXIgd2FudCB0byBnZXQgbWlzYWxpZ25tZW50DQo+IGhhbmRsaW5n
IHJpZ2h0IGZvciBhbGwgcG9zc2libGUgY2FzZXMsIG9yIHlvdSB3YW50IHRvIGRlbWFuZCBhbGln
bmVkDQo+IGluY29taW5nIHBvaW50ZXJzLg0KPg0KPiAoRnRhb2QsIHVzaW5nIGJ5dGUgYWNjZXNz
ZXMgZm9yIHR3byBvciB0aHJlZSBsZWFkaW5nIC8gdHJhaWxpbmcgbWlzYWxpZ25lZA0KPiBieXRl
cyBjYW4gYmUgZXF1YWxseSB3cm9uZywgd2hlbiB0aGUgTU1JTyBsb2NhdGlvbiBhY2Nlc3NlZCB3
YW50cyB0byBiZQ0KPiBhY2Nlc3NlZCB3aXRoIGEgMTYtYml0IGxvYWQvc3RvcmUsIGZvciBiZWlu
ZyBlLmcuIGEgMTYtYml0IGRldmljZSByZWdpc3Rlci4NCj4gU2ltaWxhcmx5IHVzaW5nIDMyLWJp
dCBsb2Fkcy9zdG9yZXMgY2FuIGJlIHdyb25nIGluIHRoZSBnZW5lcmFsIGNhc2UuIElPVw0KPiB3
aGlsZSBzb21lIG9mIHRoYXQgaXMgc2FpZCB0byBhIGNlcnRhaW4gZGVncmVlLCBJIHRoaW5rIHRo
ZXJlIGFyZQ0KPiB1bm1lbnRpb25lZCBmdXJ0aGVyIGNvbnN0cmFpbnRzIG9uIHdoZW4gdGhlc2Ug
ZnVuY3Rpb25zIG1heSBzYWZlbHkgYmUNCj4gdXNlZC4gRm9yIGV4YW1wbGUgImRldmljZXMgdGhh
dCB0b2xlcmF0ZSA4LWJpdCBhbmQgMzItYml0IGFjY2Vzc2VzIiBpcw0KPiBzdGlsbCBhbWJpZ3Vv
dXMgYXMgdG8gd2hhdCBleGFjdGx5IGl0IG1lYW5zLiBOb3QgdGhlIGxlYXN0IGJlY2F1c2UNCj4g
InRvbGVyYXRlIiBkb2Vzbid0IG1lYW4gIndvcmsgY29ycmVjdGx5IHdpdGgiLikNCj4NCj4+IFVz
aW5nIHRoZSBvcmRlcmVkIGByZWFkYi9yZWFkbGAgYW5kDQo+PiBgd3JpdGViL3dyaXRlbGAgYWNj
ZXNzb3JzIGF2b2lkcyB1bmludGVuZGVkIGVuZGlhbm5lc3MgY29udmVyc2lvbiB3aGlsZQ0KPj4g
cmVzcGVjdGluZyBkZXZpY2Ugb3JkZXJpbmcgcmVxdWlyZW1lbnRzIG9uIEFSTTMyL0FSTTY0IGhh
cmR3YXJlIHRoYXQgbWF5DQo+PiBub3Qgc3VwcG9ydCA2NC1iaXQgTU1JTyBhdG9taWNhbGx5Lg0K
PiBJJ20gaGF2aW5nIHRyb3VibGUgbWFraW5nIHNlbnNlIG9mIHRoaXMgcGFydC4gV2h5J3MgZW5k
aWFubmVzcyBvZiBjb25jZXJuDQo+IGhlcmU/IFRoZSBhY2Nlc3NvcnMgdXNlZCBkb24ndCBjYXJl
IGFib3V0IGVuZGlhbm5lc3MgYXQgYWxsLCBhbmQgd2hhdCBtYXkNCj4gaGF2ZSAod3JvbmdseSkg
YmVlbiB1c2VkIGluIGVhcmxpZXIgdmVyc2lvbnMgc2hvdWxkbid0IG1hdHRlciBoZXJlIChvciBp
dA0KPiB3b3VsZCBuZWVkIGNhbGxpbmcgb3V0IHdoaWNoIG90aGVyIGFjY2Vzc29ycyB3b3VsZCBi
ZSB3cm9uZyB0byB1c2UpLg0KVGhpcyBpcyB0aGUgbGVmdG92ZXIgZnJvbSB2NyB3aGVyZSBfX3Jh
d193cml0ZS9fX3Jhd19yZWFkIHdlcmUgdXNlZC4gDQpyZWFkbCgpL3dyaXRlbCgpIGluY2x1ZGUg
bGl0dGxlIGVuZGlhbiBjb252ZXJzaW9uIHRocm91Z2ggdGhlaXIgcmVsYXhlZCANCnZhcmlhbnRz
Lg0KaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vY292ZXIuMTc2ODQxNTIwMC5naXQub2xla3NpaS5f
NUZtb2lzaWVpZXZAZXBhbS5jb20vZDE2NjM0ODUzMGI5MjI5NjczZTFhNmUzYjI5ZmY0ZWU5MTIz
YWIyZi4xNzY4NDE1MjAwLmdpdC5vbGVrc2lpLl81Rm1vaXNpZWlldkBlcGFtLmNvbS8NCg0KSSB3
aWxsIHJlbW92ZSB0aGUgY2xhaW0gdGhhdCBvcmRlcmVkIGFjY2Vzc29ycyBhdm9pZCBlbmRpYW5u
ZXNzIGNvbnZlcnNpb24uDQoNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pby5oDQo+PiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vaW8uaA0KPj4gQEAgLTY3LDQgKzY3LDE0IEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCB3cml0ZV9tbWlvKHZvbGF0aWxlIHZvaWQgX19pb21lbSAqbWVtLCB1bnNpZ25lZCBs
b25nIGRhdGEsDQo+PiAgICAgICByZXR1cm4gdHJ1ZTsNCj4+ICAgfQ0KPj4gICANCj4+ICsvKg0K
Pj4gKyAqIENvcHkgYmV0d2VlbiByZWd1bGFyIG1lbW9yeSBhbmQgTU1JTyBzcGFjZS4gIEltcGxl
bWVudGF0aW9ucyBhcmUNCj4+ICsgKiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgYW5kIG11c3QgdXNl
IGFwcHJvcHJpYXRlIE1NSU8gYWNjZXNzb3JzIGZvcg0KPj4gKyAqIHRoZWlyIG1lbW9yeSBhbmQg
SS9PIG1vZGVscy4NCj4+ICsgKi8NCj4+ICt2b2lkIG1lbWNweV9mcm9taW8odm9pZCAqdG8sIGNv
bnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqZnJvbSwNCj4+ICsgICAgICAgICAgICAgICAgICAg
c2l6ZV90IGNvdW50KTsNCj4+ICt2b2lkIG1lbWNweV90b2lvKHZvbGF0aWxlIHZvaWQgX19pb21l
bSAqdG8sIGNvbnN0IHZvaWQgKmZyb20sDQo+PiArICAgICAgICAgICAgICAgICBzaXplX3QgY291
bnQpOw0KPiBGb3Igc29tZWJvZHkgd2FudGluZyB0byB1c2UgdGhlc2UgZnVuY3Rpb25zIGFuZCBt
ZXJlbHkgbG9va2luZyBoZXJlLCBob3cNCj4gd291bGQgdGhleSBrbm93IG9mIGFsbCB0aGUgY29u
c3RyYWludHM/IFRoYXQgaXMgaW1wbGVtZW50YXRpb25zIGFyZSBub3QNCj4gbWVyZWx5IGFyY2gt
c3BlY2lmaWMsIHRoZXkgbWF5IGFsc28gaW1wb3NlIGFyY2gtc3BlY2lmaWMgY29uc3RyYWludHMu
DQo+DQo+IEphbg0KWW91IGFyZSByaWdodCBhYm91dCB0aGUgYWxpZ25tZW50IGhhbmRsaW5nLiBB
ZHZhbmNpbmcgYm90aCBwb2ludGVycyBieQ0KdGhlIHNhbWUgYW1vdW50IHByZXNlcnZlcyB0aGVp
ciByZWxhdGl2ZSBhbGlnbm1lbnQsIHNvIHRoZXkgbmV2ZXIgYmVjb21lDQphbGlnbmVkIHRvZ2V0
aGVyIGlmIHRoZWlyIG9mZnNldHMgbW9kdWxvIGZvdXIgZGlmZmVyLiBJbiB0aGF0IGNhc2UgdGhl
DQpjdXJyZW50IGltcGxlbWVudGF0aW9uIGNvcGllcyB0aGUgd2hvbGUgcmFuZ2UgdXNpbmcgYnl0
ZSBhY2Nlc3Nlcy4NCg0KSSBwcm9wb3NlIHRvIGhhbmRsZSBhcmJpdHJhcnkgUkFNIGFsaWdubWVu
dCBieSBhbGlnbmluZyBvbmx5IHRoZSBJL08NCnBvaW50ZXIsIHRoZW4gdXNpbmcgcHV0X3VuYWxp
Z25lZF9sZTMyKCkvZ2V0X3VuYWxpZ25lZF9sZTMyKCkgb24gdGhlDQpOb3JtYWwtbWVtb3J5IHNp
ZGUgb2YgdGhlIHdvcmQgdHJhbnNmZXJzLiBBbGwgSS9PIGFjY2Vzc2VzIHdvdWxkIHN0aWxsDQp1
c2UgcmVhZGIvcmVhZGwgb3Igd3JpdGViL3dyaXRlbC4gVGhpcyB3b3VsZCBtYWtlIHRoZSBJL08g
YWNjZXNzIHdpZHRocw0KaW5kZXBlbmRlbnQgb2YgdGhlIFJBTSBwb2ludGVyJ3MgYWxpZ25tZW50
LiBJbiBwYXJ0aWN1bGFyLCBhbiBhbGlnbmVkDQpJL08gYWRkcmVzcyBhbmQgYSBsZW5ndGggZGl2
aXNpYmxlIGJ5IGZvdXIgd291bGQgcHJvZHVjZSBvbmx5IDMyLWJpdA0KSS9PIGFjY2Vzc2VzLCBl
dmVuIHdpdGggYW4gdW5hbGlnbmVkIFJBTSBidWZmZXIuDQoNClNvIHRoZSBjaGFuZ2VzIGZvciBt
ZW1jcHlfdG9pbyB3aWxsIGxvb2sgbGlrZToNCg0Kdm9pZCBtZW1jcHlfdG9pbyh2b2xhdGlsZSB2
b2lkIF9faW9tZW0gKnRvLCBjb25zdCB2b2lkICpmcm9tLA0KIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgc2l6ZV90IGNvdW50KQ0KIMKgew0KLcKgIMKgIHdoaWxlICggY291bnQgJiYgKCFJU19B
TElHTkVEKCh1bnNpZ25lZCBsb25nKXRvLCA0KSB8fA0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICFJU19BTElHTkVEKCh1bnNpZ25lZCBsb25nKWZyb20sIDQpKSApDQorwqAgwqAg
d2hpbGUgKCBjb3VudCAmJiAhSVNfQUxJR05FRCgodW5zaWduZWQgbG9uZyl0bywgNCkgKQ0KIMKg
IMKgIMKgew0KIMKgIMKgIMKgIMKgIMKgd3JpdGViKCooY29uc3QgdWludDhfdCAqKWZyb20sIHRv
KTsNCiDCoCDCoCDCoCDCoCDCoGZyb20rKzsNCkBAIC0yOSw3ICsyMiw3IEBADQoNCiDCoCDCoCDC
oHdoaWxlICggY291bnQgPj0gNCApDQogwqAgwqAgwqB7DQotwqAgwqAgwqAgwqAgd3JpdGVsKCoo
Y29uc3QgdWludDMyX3QgKilmcm9tLCB0byk7DQorwqAgwqAgwqAgwqAgd3JpdGVsKGdldF91bmFs
aWduZWRfbGUzMihmcm9tKSwgdG8pOw0KIMKgIMKgIMKgIMKgIMKgZnJvbSArPSA0Ow0KIMKgIMKg
IMKgIMKgIMKgdG8gKz0gNDsNCiDCoCDCoCDCoCDCoCDCoGNvdW50IC09IDQ7DQoNClRoaXMgZG9l
cyBub3QgbWFrZSB0aGUgaGVscGVycyBzdWl0YWJsZSBmb3IgYXJiaXRyYXJ5IGRldmljZSByZWdp
c3RlcnMuDQpJIHdpbGwgZGVzY3JpYmUgdGhlbSBhcyBjb3B5aW5nIGEgYnl0ZSBzZXF1ZW5jZSB0
by9mcm9tIGEgbWVtb3J5LWxpa2UNCkkvTyByZWdpb24uIFRoZSByZWdpb24gbXVzdCBzdXBwb3J0
IGJ5dGUgYWNjZXNzZXMgYXQgZXZlcnkgYnl0ZSBhZGRyZXNzDQphbmQgYWxpZ25lZCAzMi1iaXQg
YWNjZXNzZXMgd2l0aCBlcXVpdmFsZW50IGJ5dGUtc3RvcmFnZSBzZW1hbnRpY3MuDQpUaGUgaW1w
bGVtZW50YXRpb24gdXNlcyBieXRlIGFjY2Vzc2VzIHRvIGFsaWduIHRoZSBJL08gcG9pbnRlci4N
Cg0KQW5kIGFsc28gSSB3aWxsIGRvY3VtZW50IHRoZSBBcm0gcmVxdWlyZW1lbnRzIG5leHQgdG8g
dGhlIGRlY2xhcmF0aW9ucw0KaW4geGVuL2lvLmggYXMgeW91IHN1Z2dlc3RlZC4NCg0KDQpXaGF0
IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIGFwcHJvYWNoPw0KDQpPbGVrc2lpLg==

