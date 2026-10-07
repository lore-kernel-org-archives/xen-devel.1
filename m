Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFA7CA6006
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 00:07:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441836.1659431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBf-00031B-FT; Wed, 07 Oct 2026 00:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441836.1659431; Wed, 07 Oct 2026 00:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBf-00030b-AQ; Wed, 07 Oct 2026 00:07:11 +0000
Received: by outflank-mailman (input) for mailman id 1441836;
 Wed, 07 Oct 2026 00:07:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xEFBc-0002K2-Da
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 00:07:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEFBb-000T69-QD
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 02:07:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58cfa-8faa-0a2a0a5109dd-0a2a4509c6b0-38
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:07 +0200
Received: from [40.107.159.123]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d2b-be1a-0a2a45090019-286b9f7b116a-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:07 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS4PR03MB8229.eurprd03.prod.outlook.com (2603:10a6:20b:4fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 00:07:06 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 00:07:06 +0000
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
 b=jaSB5S1uM7ebrc1sZmvJzD1tebm2b4+9ysCgFDG8PH+ZmXJsdiHkVxqeR/BwhuFg3GAnl0hZ+acDHGDvPhNJXQx+i78sSz2gU3IRaWL0sQAL96NeekYMf/MXDqKYdjoia/ptELR2dfZeuE/dXjN7xw6Uz8hcZfOe1ZVsT00jB8G1NgiZl33la+m6lkXJoUu4q2fb+HUdd4qju8e8/Mkjxd6EO9xD3HmaYQfZ8zpRaPrHAA7XnZ5JW3nl9f8vE7VuoGQlWJSAz6XL6KGCodSCtFWuEGVJjKCTdlhnawin0TXvEi1/XFhn1XuQpNs5WI1XJEqEr99k5DNbciSSuidnsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGi7QK8sJ6G2H3RYWWAXc6OOMSXEcdq8lHLWXANTsUA=;
 b=Q/8u1S09mMdY36BaSjmc4SsPV0njfOqOKifHwbgbGpVl1q/NO/0kNBV9EdFNyawXd9sSCmlZKg4mJe5BXjGsfcQbm3NZFySsjDlkoE61nYuAiqB4sXxCwMvsog4BBqMlRccpQmzrZSiopJ5mnMfdj1Uu2ogzFgPyJ37LZ9PUKLA2/pS63LaeUQPts54kj6tY8wo1FiETykrCHAryHp5EeYa/GanWeha6IjXq1fjdIU3zFKgyj0NKjQzhGmP6ynke9Vx9kzL7uWzmU8zQWPSgsFF0Z4iR9m0hjS7vUoKNSNQv4PTsHwElH76FPLp0l9xCALvrXLew2yTMImiML/aGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGi7QK8sJ6G2H3RYWWAXc6OOMSXEcdq8lHLWXANTsUA=;
 b=vly2Oy9YdKx0UyZyNjLYz2vxr1Ytz28SNB4REeesB2R3uWLywhkHoMPrMsCrMrhbIqksBE367fkdDvym8SLxXyLblO1iQZ+9TOrBK9pU9l1L6k/w5ojKklp3NbGwjAjPKJcEeaq4MscJyl86pbsO9/M+bMN0t+B/6agsBB/L03BHQei/WLtUUG8spuoQTwMZv0eFVn6e5oFmakk9PIo4lf9iQKn+4PkfQmDvgSYMXZErkDAPmJvZiBdcjZoKJbNDrshiWs6ysKGAsTOqz2TBGJnaDOOI+CDrtpIRK04ZJEfDhKAQfiit/pNRXULM4bZ/2nbzBifo0JSRjXI2vfrELA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Milan Djokic <milan_djokic@epam.com>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH v4 14/22] xen/arm: vsmmuv3: Emulated SMMUv3 device tree node
 for dom0less
Thread-Topic: [PATCH v4 14/22] xen/arm: vsmmuv3: Emulated SMMUv3 device tree
 node for dom0less
Thread-Index: AQHdVe/Jhd313uJS3kSv+TjF+jgGZQ==
Date: Wed, 7 Oct 2026 00:07:06 +0000
Message-ID:
 <1a0f289fdb6f88695852553599f7ad45bcc5a133.1791328190.git.milan_djokic@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
In-Reply-To: <cover.1791328190.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|AS4PR03MB8229:EE_
x-ms-office365-filtering-correlation-id: 04520825-e138-4f63-b0cb-08df2406ec2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|56012099006|11063799006|10067099003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 fLNOKbuCJqOkg+6c6Kc0cNJAktfPt1v78njvcogk/mnr2m6SqkxImmwXjV26WWmoCAIIiFH4qOA5HwyAbgg78a8lDfbC6ECmmXU7GVo0OZJs0tXjziZZ7YGICpD2hCPjhd8vxc6N+2IMq0pViAxDv4IS/Lrkhz1o5JHgRM+/KExO/l1kyorKhRV5bvcSLLpgBQtVrtMLc4EZ2wAUKhivg76cE0/dBRbYqZ49DxTLt5c5LZoNAQE1jz/rcS3cZxvRTlAgmYN1SP69eOtwBOeop2XUHRLWbHXhxFlTSKYjPTrAWGsJYOKii7bczgL6HtRUKDwyOX8JqZa/TbAA1A2K3H4/7ueCPULRO7Z0xdgOmFCyClcEYmjcuszr6EEZDmpFhnX2JFhGvLN5JAJolQui4dmfY58G3XWqLyeVsbYBC4xaWwZyupfGhjRenzmKBAgHj757SmBfI/wFHBBYeiUKCxw7dARJz+cTA6AW1SGKrlfNdpZlh4+MLoCeJuJzNUpoY0p2oiwkt/giPO167oxmTxaIskHuavTdS9Zqb8D5sQZhoiw+NxLOOKFlgyoBIE/04r80EvrMVsoXIVyjKG4VOh85OdV0HeU5ChKZkcpsXle03UP+d8UHHzBjnV3BiJjWortuHMy43a61mBtBzicgnaDKti3menqoOPzmLEkhNG5An3gJBmZVgw3Cnz5KC3GN75MhcXayPyblWZLIfEJ7rynJGhuQtmqfe5cLx2Oqs74=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXpjYmp4Q25uME9nb0pvZmVHYWpUbWJ6ejlhWnhEemlOMkk4L0NaeUZGR0R5?=
 =?utf-8?B?R04weGI3YkRnMjBQQmM3TStDb0xQYlJTaktNVnp0S3BtcUhyRkRHZmJhR3dQ?=
 =?utf-8?B?K0dEVitBVDhPRTFJUzVrNXBaNXk2Ymp6TUlGTy9xWUNucWNYeWlvUWFRYkM2?=
 =?utf-8?B?MXhiYUNvTGVXUHQ2eSt1anl0KzVwaUNFRjJqN1l0eUVGbS9pUHlacmhjNk44?=
 =?utf-8?B?OExVUGY5OHdDOTM0eHVkRk1qYjRMQzZvRnNFSU1pUFVlOFczVW8wZ3RCNkl4?=
 =?utf-8?B?czVOTkhRT3JlWGluc0UzUnF4U2xaV2NkMjZnMFBMeGFZekxnQlF1ZW91dDlF?=
 =?utf-8?B?SUpQUmRveUVrajBBRSs1THV4WVJDZ21rWndIU2NNMWhlVXBwazg5b0RzamFj?=
 =?utf-8?B?RXBQRlJwcmRXU0IzY0JqSUNUVDdDc1daTSsyd25ud3Y2ek9veGJ4cVoxVkNP?=
 =?utf-8?B?d0dNOEY2MnYwalpOOSs3OXJoL2VlNXFyblZhLzF3V1NZdFZuZWc3eGN6d3Y0?=
 =?utf-8?B?M3dwbXhNcFV0Y0YyVm9vd2pmci9uRlpCL0t0VGFJanNvL29UZjEyOHJ5NHNQ?=
 =?utf-8?B?azhYYnRlR0s4dENPa1k1VHRaTHFZQlJTSDRQbHN1Y1NlWDU0RUVPeklCTFpK?=
 =?utf-8?B?Sk93djd5MjE4TlVkRjEvTGdMa2JJaXErQmxnbUxrRjJqTUtFSE9SMFFpSEF4?=
 =?utf-8?B?L0RWeW9oR0NXZVJNd1NJTGZjNXV0aXIzUHFtWENBa0IvQlJQckk1TnZzODFh?=
 =?utf-8?B?WUVNa2RiZ0J3R0dDSDczVmg2em9HNU5lazdpdW9idXd0WEhVZ0VpSnRuUlhE?=
 =?utf-8?B?S3ZaMUZKUUxlWG9relpRUGNtNzM2bVJGTy9nQ3ZzTGJyUmluamdNeEZSSWwx?=
 =?utf-8?B?RmFHSXMrSFB2aVdZOFR6NmVDY3BpMTkwSEJZSHRxNVFKS1VHNFZFMzhjRXVu?=
 =?utf-8?B?VmNqSEZ0TjZtMGxZRVVvRTdqbWZORVFjOUZBbjRGNG5GZlRDYU9SdmJMeHha?=
 =?utf-8?B?emcxNkxhN0RkeUxYdU1BM0NaVVJOWXhleXJ3dzFmUXlLeWJ2QkFkVDBnMVp6?=
 =?utf-8?B?UldCTEdtTnNQa2tRUVllUzRMMHFNWVRvZlNURUppaklrYTc1c0dsMUIzQ2d0?=
 =?utf-8?B?WUpSa2tWMEs5VmFYekszK0hTdDBZNVlDQWdLbUM5SVUyQVdtRTV3VThsa0o1?=
 =?utf-8?B?anhMU2taQ1ZGNkQ1S1oyTzdDT0Z5ZGF3VjVMSWdXd0hiK1RxbUJYeGpGb29v?=
 =?utf-8?B?TjNXVlFCODdmd1ZzQUZXazR2cy9ESzA4ZzBJek1RQURXSHFQU3RXMEtOTnNH?=
 =?utf-8?B?bUtRc0VacisyQk0rMFh4T3Z5cEpKcnJXVTZRMXk2di9aSmdUTHpxdkdZTDlO?=
 =?utf-8?B?RnhTTUt0S05hR2RYRG44OUt3dGd6WFk0NWlwUnc0T1NnTGYvYVJ5bnRpdWhU?=
 =?utf-8?B?MWpSQ3ptVHhmczBzK1dqaUptSUZrYXVlY3hJVENvWUtwV0NIS2xMY1JYTGE1?=
 =?utf-8?B?ODgvWGVrUkhHbU1rT1BHMXczSE12OUV3T1UzTFN3cVgzaHFYWElOZ09QNktZ?=
 =?utf-8?B?TVhsM2JhRW03L3R4OTRja0tGeG0xOWJEY0F1WkhhbU1IRUhPeUVGWXk0Wnpq?=
 =?utf-8?B?N2RUdDAvZExCSXpEL0w2R0ZWUy9yYWZYN2wxRnNnUXNHaTRyS2I0Z3YwcGlw?=
 =?utf-8?B?aVlDMWhlS001SUpXSUZDRUJ3anZVYXZYSjU5dTdtM1UydzRTcTZ1WFh6QUt0?=
 =?utf-8?B?c0Mwdkt5Zk9hUzRKSHFQdWY5dFZuNzVJSXF3TUJuOTFYWm5JeG1ZaS91RUVT?=
 =?utf-8?B?QU9iYW42M1AzYVgwKzJLY3dUS01DczNrR1pNb1Fna2tmM3gyWktxN2sydi9p?=
 =?utf-8?B?dGNheCtFcTN2VUVHM0d6Q08zdEFRRGFqcWRKL29qK1VUc0VaNm56SVJweW5C?=
 =?utf-8?B?UkNLcEtsSVhVQStialJlV2NocGFsM21Mb3hHWXM1SHI2ZFBnOVBsMEJEcGV5?=
 =?utf-8?B?RWZ3a0ZOa2dpcHZ5WGhSNzBYRHFUMDJydU9vVVJ5UVlJWjk4OEUvMUhGMUtq?=
 =?utf-8?B?Y2xRa3JTSzFLenhTemtHeS9URk4ySmdsSlB3bFowVVNGcU1jdzVLQXdMc2hV?=
 =?utf-8?B?MjVoaW4vV0c3S2ZEQy9qVmJzL3VoSUJpMlE5OXdaVmxXckIxRG9XNGpaZVFS?=
 =?utf-8?B?d0VaS0xaQUpFRmF6SlI1Z1dLbS8vNUtwY0haTG1qS3pLMzJZSjFCNXNoQm1Q?=
 =?utf-8?B?TTVGcXd2RVovZGNBR2J1cDl6aCt2WG5JYk1KcUxmcysyNjl0ZGpjNTVCeVht?=
 =?utf-8?B?T1VrT28xTUFucXJWQWJCMjhyRzNkd1RtUnlOeDR0WWFyaUZRKzNEZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04520825-e138-4f63-b0cb-08df2406ec2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 00:07:06.0269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AoDj6tRTOzCa0nkse4jIOlucyyJoB6QtkzGtM5zHJEUVJJhwg0gnOSKbaPH89TPUz/lTe+auaJ5pyLUmp6NnZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8229
X-purgate-ID: tlsNG-bad1c0/1791331627-3B8D1034-843649A5/0/0
X-purgate-type: clean
X-purgate-size: 4074

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNClhFTiB3aWxsIGNyZWF0
ZSBhbiBFbXVsYXRlZCBTTU1VdjMgZGV2aWNlIHRyZWUgbm9kZSBpbiB0aGUgZGV2aWNlIHRyZWUN
CnRvIGVuYWJsZSB0aGUgZG9tMGxlc3MgZG9tYWlucyB0byBkaXNjb3ZlciB0aGUgdmlydHVhbCBT
TU1VdjMgZHVyaW5nDQpib290LiBFbXVsYXRlZCBTTU1VdjMgZGV2aWNlIHRyZWUgbm9kZSB3aWxs
IG9ubHkgYmUgY3JlYXRlZCB3aGVuIGNtZGxpbmUNCm9wdGlvbiB2c21tdXYzIGlzIGVuYWJsZWQu
DQoNClNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KU2ln
bmVkLW9mZi1ieTogTWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+DQpSZXZpZXdl
ZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KLS0tDQogeGVuL2Fy
Y2gvYXJtL2RvbTBsZXNzLWJ1aWxkLmMgICAgICAgICB8IDUzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KIHhlbi9pbmNsdWRlL3B1YmxpYy9kZXZpY2VfdHJlZV9kZWZzLmggfCAgMSArDQog
MiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vZG9tMGxlc3MtYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jDQpp
bmRleCBmODc0Mzc5MTVlLi5mY2U5Y2RiZWY1IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL2Rv
bTBsZXNzLWJ1aWxkLmMNCisrKyBiL3hlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jDQpAQCAt
MjE4LDEwICsyMTgsNjMgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV92cGwwMTFfdWFydF9ub2Rl
KHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pDQogfQ0KICNlbmRpZg0KIA0KKyNpZmRlZiBDT05G
SUdfVklSVFVBTF9BUk1fU01NVV9WMw0KK3N0YXRpYyBpbnQgX19pbml0IG1ha2VfdnNtbXV2M19u
b2RlKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pDQorew0KKyAgICBpbnQgcmVzOw0K
KyAgICBjaGFyIGJ1ZlsyNF07DQorICAgIF9fYmUzMiByZWdbR1VFU1RfUk9PVF9BRERSRVNTX0NF
TExTICsgR1VFU1RfUk9PVF9TSVpFX0NFTExTXTsNCisgICAgX19iZTMyICpjZWxsczsNCisgICAg
dm9pZCAqZmR0ID0ga2luZm8tPmZkdDsNCisNCisgICAgc25wcmludGYoYnVmLCBzaXplb2YoYnVm
KSwgImlvbW11QCVsbHgiLCBHVUVTVF9WU01NVVYzX0JBU0UpOw0KKw0KKyAgICByZXMgPSBmZHRf
YmVnaW5fbm9kZShmZHQsIGJ1Zik7DQorICAgIGlmICggcmVzICkNCisgICAgICAgIHJldHVybiBy
ZXM7DQorDQorICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9zdHJpbmcoZmR0LCAiY29tcGF0aWJsZSIs
ICJhcm0sc21tdS12MyIpOw0KKyAgICBpZiAoIHJlcyApDQorICAgICAgICByZXR1cm4gcmVzOw0K
Kw0KKyAgICAvKiBDcmVhdGUgcmVnIHByb3BlcnR5ICovDQorICAgIGNlbGxzID0gJnJlZ1swXTsN
CisgICAgZHRfY2hpbGRfc2V0X3JhbmdlKCZjZWxscywgR1VFU1RfUk9PVF9BRERSRVNTX0NFTExT
LCBHVUVTVF9ST09UX1NJWkVfQ0VMTFMsDQorICAgICAgICAgICAgICAgICAgICAgICBHVUVTVF9W
U01NVVYzX0JBU0UsIEdVRVNUX1ZTTU1VVjNfU0laRSk7DQorICAgIHJlcyA9IGZkdF9wcm9wZXJ0
eShmZHQsICJyZWciLCByZWcsDQorICAgICAgICAgICAgICAgICAgICAgICAoR1VFU1RfUk9PVF9B
RERSRVNTX0NFTExTICsNCisgICAgICAgICAgICAgICAgICAgICAgIEdVRVNUX1JPT1RfU0laRV9D
RUxMUykgKiBzaXplb2YoKnJlZykpOw0KKyAgICBpZiAoIHJlcyApDQorICAgICAgICByZXR1cm4g
cmVzOw0KKw0KKyAgICByZXMgPSBmZHRfcHJvcGVydHlfY2VsbChmZHQsICJwaGFuZGxlIiwgR1VF
U1RfUEhBTkRMRV9WU01NVVYzKTsNCisgICAgaWYgKCByZXMgKQ0KKyAgICAgICAgcmV0dXJuIHJl
czsNCisNCisgICAgcmVzID0gZmR0X3Byb3BlcnR5X2NlbGwoZmR0LCAiI2lvbW11LWNlbGxzIiwg
MSk7DQorICAgIGlmICggcmVzICkNCisgICAgICAgIHJldHVybiByZXM7DQorDQorICAgIHJlcyA9
IGZkdF9lbmRfbm9kZShmZHQpOw0KKw0KKyAgICByZXR1cm4gcmVzOw0KK30NCisjZW5kaWYNCisN
CiBpbnQgX19pbml0IG1ha2VfYXJjaF9ub2RlcyhzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQ0K
IHsNCiAgICAgaW50IHJldDsNCiANCisNCisjaWZkZWYgQ09ORklHX1ZJUlRVQUxfQVJNX1NNTVVf
VjMNCisgICAgaWYgKCB2aW9tbXVfZ2V0X3R5cGUoKSA9PSBYRU5fRE9NQ1RMX0NPTkZJR19WSU9N
TVVfU01NVVYzICkNCisgICAgew0KKyAgICAgICAgcmV0ID0gbWFrZV92c21tdXYzX25vZGUoa2lu
Zm8pOw0KKyAgICAgICAgaWYgKCByZXQgKQ0KKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
KyAgICB9DQorI2VuZGlmDQorDQogICAgIHJldCA9IG1ha2VfcHNjaV9ub2RlKGtpbmZvLT5mZHQp
Ow0KICAgICBpZiAoIHJldCApDQogICAgICAgICByZXR1cm4gLUVJTlZBTDsNCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9wdWJsaWMvZGV2aWNlX3RyZWVfZGVmcy5oIGIveGVuL2luY2x1ZGUvcHVi
bGljL2RldmljZV90cmVlX2RlZnMuaA0KaW5kZXggOWU4MGQwNDk5ZC4uNzg0NmEwNDI1YyAxMDA2
NDQNCi0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kZXZpY2VfdHJlZV9kZWZzLmgNCisrKyBiL3hl
bi9pbmNsdWRlL3B1YmxpYy9kZXZpY2VfdHJlZV9kZWZzLmgNCkBAIC0xNCw2ICsxNCw3IEBADQog
ICovDQogI2RlZmluZSBHVUVTVF9QSEFORExFX0dJQyAoNjUwMDApDQogI2RlZmluZSBHVUVTVF9Q
SEFORExFX0lPTU1VIChHVUVTVF9QSEFORExFX0dJQyArIDEpDQorI2RlZmluZSBHVUVTVF9QSEFO
RExFX1ZTTU1VVjMgKEdVRVNUX1BIQU5ETEVfSU9NTVUgKyAxKQ0KIA0KICNkZWZpbmUgR1VFU1Rf
Uk9PVF9BRERSRVNTX0NFTExTIDINCiAjZGVmaW5lIEdVRVNUX1JPT1RfU0laRV9DRUxMUyAyDQot
LSANCjIuNDMuMA0K

