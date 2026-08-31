Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F591C61DE2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 10:01:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403904.1637852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0ypB-0002yn-HZ; Mon, 31 Aug 2026 10:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403904.1637852; Mon, 31 Aug 2026 10:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0ypB-0002yg-Ej; Mon, 31 Aug 2026 10:01:09 +0000
Received: by outflank-mailman (input) for mailman id 1403904;
 Mon, 31 Aug 2026 10:01:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1x0ypA-0002ya-7T
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 10:01:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0yp9-004MMi-Jb
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:01:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a9550da-e002-0a2a0a5209dd-0a2a4505bbe6-32
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 12:01:07 +0200
Received: from [52.101.72.128]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a9550e3-4cb1-0a2a45050019-346548808b6d-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 12:01:07 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB7173.eurprd03.prod.outlook.com (2603:10a6:20b:2e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Mon, 31 Aug
 2026 10:01:05 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 10:01:04 +0000
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
 b=zRIW9v0BqbGlLqUv2YVvyH5Rknrmwk90Aurhm5Y8QvZdrssTYH2wdhHZGa1OyRgsmeS0UgzAmVV+EmRC3VboG3O+IGsSedUFudlcxR/Pl8VFmHwdA7wstVcD2WbOKZa19OBF6wxIWZ32qlcwRYRNltYmYoID3DRV39w3AuvZbFWiSoG4t6vRt5o9T8ZIX2yPsXfLNT/bKpDIZefEUxQXDOQK5zLyaTS3ecLaeTaevhJjRDvbEsDtNt8Ty22SJJzavg50NDVEoYl2dS5QTmfrcySAJ+h53IjwLUY1F0N36di1U8p2xnzQ7CGhPSBkAMg8Bliv10ASuG2p+j5yKp/N+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HykNjhIBYfJ6PHoZUXrRkvO9KXiMlB3MOWM3eIiVK3g=;
 b=h5efXjVAgEEry9NYyNBPOmjrz95O1Dl1xJVMVDsdq9aGpBZMB7nWXPKYbqYr79dBS9l0So+0yHjL5w+TJeJLLlA4V6bJdfiHRj1u9M4Z4qZWn2hyW9XqYKFvv/EiroNN0eEbzN+clN/XPf0Xccu8C2/9CNQ/tV6FHZRnhM7zKXMJXjSJ31khC/MooAhwVE+TQ1qG4FKKcHyh5WKgoZOJZgjVAk9wEIE6nxj/aWCS2x3mfk/E9Pw5HcevGbWYlQUJDHrH26U3+Vz7ArWaVVQy/wEu/yCcoCgpwWYxpnOz/AB3dU/gJJc0kkDGDi/mjs57sxX4DV0CVeCucVC5e2CaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HykNjhIBYfJ6PHoZUXrRkvO9KXiMlB3MOWM3eIiVK3g=;
 b=DqogpB9go3kvtoziAG2ODZyS8xTmzE/K84TNs1fGFYXCeFrSWktJz469sOLx0g4omaVDM0pCNIZhmLPPCA6ONjRB2EGsMS3uGTRCCtlDoleKimBhCvt2KQJvOz8BRnrBpLA0EeMgJXqFoeaayDzMhbpcCxA7PUZiJzepmeG/pa2BKHIDzlXHjh9hxMRYkmjt3TRCt6gtEEbp7H059nSRBY3c/WE4TwI6ketyN7iMHLN0SKzFkcCX4KKiKHgYz/6/V/Rn5eS49vDLlWtc9G2/h8kjT7MYsX4Wuccn+uRd9SXE5LvC6OfvLU/qMM38URFQku85fzXS57emj2gZTsz9nw==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 1/2] flask: add const qualifier to
 security_context_to_sid()
Thread-Topic: [PATCH v1 1/2] flask: add const qualifier to
 security_context_to_sid()
Thread-Index: AQHdNgfAVxs877kedUqP8J7OTWLOvLazBE2AgATu5oA=
Date: Mon, 31 Aug 2026 10:01:04 +0000
Message-ID: <5564a32f-31fa-4629-beb4-d87d19c2944d@epam.com>
References: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
 <ee0ce49467ac1ee1cdd017323e70c8a865269f39.1787821757.git.Sergiy_Kibrik@epam.com>
 <1b680cd1-c086-4aa1-9a8c-f89d9743918e@suse.com>
In-Reply-To: <1b680cd1-c086-4aa1-9a8c-f89d9743918e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|AS8PR03MB7173:EE_
x-ms-office365-filtering-correlation-id: 6c04c730-0610-427d-d30f-08df0746c520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 GFPp1DAAjU0WSm9sY/Sn9rkQkj0J1joOhIeJrzyiS5RNG43I5fKFBXJGVPIDXTD4tdx9LTU4QkN9H5/lKIimgFKNMs9jarO4coG23BXgMVpoRT/jOX8jQeihwyB28mdjgW64fiuMRzlfIYpxSU1LqKJJRuJZeJB+8zDJPB6RGSEG/bN9gn5WCy0QeZNlKxc4UWvHXQKjz9IykXeL/IVrnGX6c5pm80KViswcxG68mxL4CdlzSR8bpLKE+BfpLxK6fkXtuUGEFA3x5x2xgrZznD6SDTqIBgHBgynzEvkcg7s4+ZeSoHns3hr9yhKp/Xy2cT6gQjiwkS9fWlEZ3Et75cjJ/l8+OGwTDuSPXo2q3OKZxUg4Q8ZC6fRctt5wNNiLYCXz78PKV3fNoP0eoG+VmK8fFD0+hgDeK1og0KoyofpjtW/UELDpat1zuzaF/Vdgnxytm6/seCHRjdMzc32R/QsqDdDHywBEASZAl/eweohe6cK3nvwTLMSvU5gmYfqKKnxZIt0gMTirginZjunk4VzKZtVHoy3mwjo78GuSxrf/GrePLC4fiHxPnOosxls8MsiTTKZ6psfdWP87UIpjSPizxoLzf1s7AWEan13rrWTUuXTwV4QMs88frN4EvXv+HWbGn0hs/RQwfq695XZvfNM8vmm7gjE/i0xWjaB/vXPlLtBEdunKBJ1rb133NYBcb3gv6YDpmQ2R9meHmpg2RVAJ6DkpsvrAAV6uH8wI+Ak=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blVKZU4xbG93OCtpaUd6Z2RjK3ZTWXBXU0Npd3dsS2RQdGpNblIxQXRIcEMx?=
 =?utf-8?B?RGpiVTJxdmR4eWFrS3o5VUtyTktoWXVTVlJJSjIrMHBWVEZkcnJIa01aTHJX?=
 =?utf-8?B?LzZGZkpqbTJSOEZ0M2FyVytYVzZsbkNIUmtyUXQ4WWhIYkErb3BnSTQyVitv?=
 =?utf-8?B?R3piYUVpYWU2dExCS09rcmNYMEN2SEt6Ylg0bWw5dEgvZ2p1bzRiaGdTTndk?=
 =?utf-8?B?d2IyNVEzOXc2Q1J6alpoS0RHVm9nVkdjOEZwS1AzdHVDVE8wMnhpQXZud3Qr?=
 =?utf-8?B?aHR4aW5KbUdZZmhlS1hIWlJ5VWp5UmUzemllZU5MRDMwdWJvZWZUMGxDbjlm?=
 =?utf-8?B?Z2oycFc4SzVOakFDSmdHamlreTRJYjFrbHBxYllKLzIrSDI2VjVsNHl1T2R3?=
 =?utf-8?B?cU01c0ZmK3VVeHZpZU9LWWU1RTk0Y3RjS1FrN3NjcklnRGREZ3BnbDk3ck9i?=
 =?utf-8?B?SlZFNlRSbXNpNnpJcDVYWmVjaTR0dWxJZ1pvNmx5SXkvTjlFdjFDZkR3QVc4?=
 =?utf-8?B?T3hDNGdCYXJOTXlJOTU1bXlpNmpNb0ZRTTRlaGE2dGlyRHRlcks2eXN2NjZw?=
 =?utf-8?B?MWpialJCekpiWC9LOUhsTU5paURobUxIQUpHZkE5eVR0Vkt5ektkanA2WWE4?=
 =?utf-8?B?RHFyWldzdVZDdWQ4OFBjU1RheXN3TThsSSthQnRnc0kwMnk3NjA2RlZRMHFW?=
 =?utf-8?B?bVhYNWN6M0VnMzNOQVZZZWthVXgzaDFETC8zU3I5bEUvQytoY3ozT083MW80?=
 =?utf-8?B?VVM3Y2pUbXNPQnFDZkViMWtxY2oxZkNzMGhSNkNNQjZsN0R5clIrclJrK2po?=
 =?utf-8?B?V2o1WExveE1uUzZ0Z1Z2eDV3MXR1MmVWbncrejNwV0dodjhNa280SGZ1WDB6?=
 =?utf-8?B?SEhncnJZZTYzMW1pTXlIT1pyWEhzUktnSTlXaWpoWmdmdUdoMGVwekdoU3FR?=
 =?utf-8?B?TWJwUjdCQlhiU3BLOTlYU2ZzMTk5STJFN2dZVVB0M0dleGNQNDdSZEN6RGZy?=
 =?utf-8?B?S1BsM3NmcHRTL2JDM09oa3l1Rk4xMGNIb2pRRjl4bFA4QTVqV1dxOGV2b0Qv?=
 =?utf-8?B?ZEtFSE5vbXZab0NMUTZTUUM4N0pxMTlIcDk0UkV3djhqWWZzNEJHRVdXaTZG?=
 =?utf-8?B?VmlIazZwdDQ3M05tYit5QnlzVTA3M0VJekRGQVNMTGFacE1wTDlBTXlTYXVz?=
 =?utf-8?B?RFA4YVpnczRrR1BWcUFHWmgwSEZ2QUwvSHZRL0xCTkM4YmhaSTFURFp1eU1J?=
 =?utf-8?B?RVNST0YvbkFkbUowMjI5QThZcGFUQ0xFNmMwcHNYOHppdS9ybnY1emF6c1pt?=
 =?utf-8?B?ZStWdkN3UTVCSVJjVXVZcTFkOUR2SWNYU2tWUXdUOXZudTJ0S0xTb0tnVFRN?=
 =?utf-8?B?OWsySFRnWVM3eEZIRjZyTXJtRjhlSFFOVzJuRFJTVXNLVTlZUU5MUHNXOG1z?=
 =?utf-8?B?OUJ6c21KRVFQSG9MME9jS0I4c1hVQnlhSjR6RW1lRWt6UVlNSk91VVBrNnpk?=
 =?utf-8?B?MXBYTXdNcFFoUlptaEhDc1R1UWh2ZlQvVnRnSGNCNm83WWtUQndTckg1NGJ3?=
 =?utf-8?B?SkhIbFhBQ3djVFVPZHlvR25CZUNmeXpLMWMxZVpkNnhPZmY2K0UvT243RGN2?=
 =?utf-8?B?RWlldkF0Q1l1VkNQcU9JS1M3bmY3MnJmYVBONDhHMVdPOEN0MmZtVVBJa3Y2?=
 =?utf-8?B?cS94MWFKYlN3NW1xUStmQXdrUVh6MXAwbWVyWVV5Wmw5NFhkWU9TdTl3R0NF?=
 =?utf-8?B?SEpHUEM4WnlFbzJUU1ZVcTRnd0V5RGkrYW1JWEN2cTJaUytoVjV4RFJyeTlx?=
 =?utf-8?B?VDUwVExvRUJxYUdlNjlSQVdmUTBHeithZWtrYmJEbzlxYWhrVjBXTlhEajB6?=
 =?utf-8?B?OWRkVmJoM2xzR1pUSjc2KzEyMUpCcS9nMEc0cUhLaTRjamVncktJTC9aVmNs?=
 =?utf-8?B?alNEMFhMRUlqU2JqWWJJbHEyeSttWXM5ZnUzWUZTVjMxaFVtL3AvUTZXNHlh?=
 =?utf-8?B?TVpoYjZGYU0wRUp4RnBKd0QxUXRPVEcvOU1sMEVmak9SVzZ5WmdNUzNTaHdr?=
 =?utf-8?B?a0lKSGVJYkZFeEtmS1pxRnRwV2tsKzNiMStlMDFqcFpIUWtwZFdESnNXSW5K?=
 =?utf-8?B?WjV2SmRxOFAxUzRoT1VBcXNYV25UWm01WWJ1bTg5KzdwbGxvd3NRcmJUa0ty?=
 =?utf-8?B?ZFJpa2x3ZFJUdmJ4Q01lazB1Y0pZbHJsUTk5d0NuYTc0d1dYd2ZNZkIrQkJ2?=
 =?utf-8?B?eitvUW1odWZ5TFQ2L0hiS04zU0hkMDQ1Z2k3QmkyVnJJdEtVWmlicG91bFFB?=
 =?utf-8?B?SlF4L1F5U1N0WmhYdlRnU29TOEFMeWhyems3eDNvZU9odDkrdUJGeWhTbkcw?=
 =?utf-8?Q?4/0WS2kXbqtUqELY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34E82F80C1155948877E64734AF4DA29@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c04c730-0610-427d-d30f-08df0746c520
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 10:01:04.6008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0QEMYE8CheQ44MpkJY+Oq2JA1Lgt54aTBE40EjsgM0gYz7W3Z7jaXUbFP6cexHkjgXfgOBdTuakzFaYPAPy/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7173
X-purgate-ID: tlsNG-c201ff/1788170467-F72B32A1-A3140AB9/0/0
X-purgate-type: clean
X-purgate-size: 502

T24gOC8yOC8yNiAwOTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IC0gV2hpbGUgdG91Y2hpbmcg
Y29kZSBhbnl3YXksIGl0IHdvdWxkIGJlIG5pY2UgaWYgdTxOPiB3YXMgY29udmVydGVkIHRvDQo+
ICAgIHVpbnQ8Tj5fdCAob3IgZWxzZSB3ZSdsbCBuZXZlciBjb21wbGV0ZSB0aGF0IGNvbnZlcnNp
b24pLg0KPiBJIHRoaW5rIEknbGwgdGFrZSB0aGUgbGliZXJ0eSBvZiBhZGRyZXNzaW5nIGFsbCBv
ZiB0aGVzZSB3aGlsZSBjb21taXR0aW5nLg0KDQp0aGFuayB5b3UsIEphbi4gQlRXLCB3aGF0J3Mg
dXAgd2l0aCB1PE4+PyBBcmUgdGhleSBleHBlY3RlZCB0byBiZSANCmRyb3BwZWQvY29udmVydGVk
IGluIFhlbj8NCg0KICAgLVNlcmdpeQ==

