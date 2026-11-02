Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9894606A329
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Zr9juM2q
Received: from list by lists.xenproject.org with outflank-mailman.1468253.1677347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsXp-0004V2-7V; Mon, 02 Nov 2026 13:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468253.1677347; Mon, 02 Nov 2026 13:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsXp-0004Uv-4c; Mon, 02 Nov 2026 13:57:53 +0000
Received: by outflank-mailman (input) for mailman id 1468253;
 Mon, 02 Nov 2026 13:57:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xNsXn-0004U5-CH
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:57:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsXm-0006aT-Kq
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:57:50 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae896d4-e002-0a2a0a5209dd-0a2a4507afb4-38
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:57:50 +0100
Received: from [52.101.66.112]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae896de-b4ea-0a2a45070019-34654270d32c-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:57:50 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by AMBPR03MB11430.eurprd03.prod.outlook.com (2603:10a6:20b:76c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 13:57:48 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 13:57:48 +0000
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
 b=dbhiX1EsJBPku2oPFni2FnMPM/Y5GJwZPievaqYCjKWLj56wR8EDNkx5A6jypH+H2MYyYzI9X2hTqEH86PFEGLRI2botCXwk1hXNwyqRMp1A3gBsIDOX4CvoQ0pdUbI4qeHBFtI3LC8EMOC5rkkT8S5b/kS0yqPdBXlyucDdYMTUOFewFkg5tc2bJHsLZCoN99KMUsYXYoc4qHPXlxHwQvfoJI/TmN4Yto5uLb7GqCUvXbPWYqvCTeiCPEqogdlAV3e8K9EaG4RkDdhVro4py70NZyplbsjubGzp4NLO/wlEe+orsHlVVgUpKfmBp1agmncYd48q/vq7CCT/FQqKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaNew0/Wvxkjveg7fokiXz9DmrXpF7MWcx8jfBrqunY=;
 b=xPI/Q4hUfvqPj+19JRFRLWH1Hsxr0PgZGrHeUkXwTELEV7YNGSZMrxaB3cZGUD7+0ue+9q1wgovhLWxHLeiQAYCeiKp3jv6lgORGA/yWy2mHZ88NB9NeIERLlSdWkC4kS48xsZ8XmwLsohUHGogFLAhGJ2FXz2282NWJOpc7ToYQRmYDhVSsg+W4nEaGFRkRscn9ARFH2Mdw42z2VhfDTa9DAIxZVfdR4LJzmnz3d3QNE07+Cu5ixzJ5Ga+l0WI3lyukpGvO7N8tYeCyM0zLl5Oe+IACYX4DOwvXiwUUMPcITK/Fd4a6Ssjz17ek2IEdJt8USCdUp1QJfkD4sQRg8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaNew0/Wvxkjveg7fokiXz9DmrXpF7MWcx8jfBrqunY=;
 b=Zr9juM2qNGq1cCvcw728DqgL6imwehyhHdWjRvwyUsOMDPqPNg/7/RWDBpcxvyRrHJhQTo5ogS+VeU1d4JgEbE9t8GGk9sNk4AoLV4/y73k5scjSdqRkPputOkKKQrtu+IAgh1LnRq266SfrPfdSW78CAwV/fInlO2LQAHsa/cUYEDZnONtxd96ekVJQeMsVZ9EhwA6tC/ALu/6Mtj+rP5gYOYKRG0+v0+ompGD2hwK8fXlx0MA82xgj9bCw34sAlCFQATXlOQdEmljkjNPZ8ECrzpQs40e921kfAH9FtXVHZaUEDp5R/eYNAojoNNy75Z0bAo31DuImdScEQY6RDA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHdXK6sWnTwG0FjdEmPa5OC537fErcTDN4AgAfUFACAAAXEAIAABDSA
Date: Mon, 2 Nov 2026 13:57:48 +0000
Message-ID: <f9539ce5-a558-4e57-971b-7756a50401e8@epam.com>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
 <fe02f3ef-a215-4c81-be64-e2a5a30ae3e8@suse.com>
 <8d339d8d-ea7f-452b-8720-164dc9244079@epam.com>
 <aab7c1d8-fa64-456c-b37a-162ab3e2ae1e@suse.com>
In-Reply-To: <aab7c1d8-fa64-456c-b37a-162ab3e2ae1e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|AMBPR03MB11430:EE_
x-ms-office365-filtering-correlation-id: 6fd2a4a0-91f6-4a6a-fe34-08df38e9475e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|38070700021|56012099006|4143699003|11063799006|5023799004|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|10067099003|6133799003;
x-microsoft-antispam-message-info:
 xecCC/k+NCNGlUTHUmz4MR5quE8ffLVUc2wdzqxZh5wXjOijZ36PVHASUZqzo1tuH/tWg0Zo/7BdyKERudyx1a8MMl0IHmM4Ay6arF5E9Poczg6IFD+vLl2z5n6rAjFBdgoyYw/WSHmycYl8qitnYCRjwl6Fg2yzZqxlJDeoD5jiZzaHKtEr9J+H1coBwfxuLOXh81TFeZ4KhcM52Mnt6NzFvCBFY4G/HYuwReUbK4PbVuTbcBl2KiObZxOmx9Z4e6eYlMSZMK0ZtMaiFWFg0Tgm9SsOfli1jRDPvvD7bHf909xJVURtmGlhOVXHg/12NuUSJ1IjuHqzE4ubPi2WjU3C2BU1y20C0b9F7XC2RPgm4oMGZl0XYI5aX5DyhliZnD49Oz4nSzfHhZnN8OfgXJRAXiPR9uluOTUdv/KnnyybwDBxKtUmpY42KP18zryvddeVn7fv0hqhG55Su+74ySGq1o3QD0bULr3rb2VZSXE0SU6lhcRXyFtct9+/b2R3k8pvtJCCZ4txdhms87+xvw7HOjSltbaMGGFh+7iz8tXjfXtpBZGRlD4loBhQY4c2b9ORRtnpYJRE02JYsHdPT9GjdvicCpFZLCOHluhWLqdxD4hkWTGNTHxmH6uyJ3OFW0r3GoJor2KAH2QF5aLAk+Wss9QKL2YqoHr3KjeUwgRCyun+9GaSHL1Ty8/k5FwDR9hyPDqdX2Dg4FUUmZaJlq1Y3UftU3G2sl9eNagxoPs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(11063799006)(5023799004)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(10067099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnJRMDV1WlhCVFdrZGRZWFNIQ1RPeUhkNkN5ZFRwRDJ0MGpCNEJRVml3SmhI?=
 =?utf-8?B?N3ViaDc4Z25JcEpyNkFZNzhvZVJXZU9yNWNMMHVXMDJlZStlVk0yUlkzL3Fa?=
 =?utf-8?B?SG95bEpsTWNROUtQczkyaHg3akprR0laeUp5ZmRpZG9Db1pvNFNyZU1xS1Zx?=
 =?utf-8?B?OURRcWVJd3M0aWFPOWsrR29ZdFJ0RUJJaUtGWUUxUGUzSENkMks5cnd0N1ly?=
 =?utf-8?B?aUlTQ09keFVjL2NRV2NEU2Ivcno3ZEpwbUdWWllYQkdJTzFYakpSeDFYeHBN?=
 =?utf-8?B?WmpPd0hIVmRyMjJ3OWg3ZzlIR1hwL3VYaGFsdlFHQ00rQUkraElhWmtOU09y?=
 =?utf-8?B?TFphZG5EUFJQbmsvSnZDc0lEVFU3cHlnWEtBa1pkeXhYSGR1NkRSenl2ZkdM?=
 =?utf-8?B?ZGNXR09rOHNZWUlVR3MxdmFhWjdtYjgwM0RmU3VHYy9naitBTk9yMVRKOGJS?=
 =?utf-8?B?M3JkckpPSklHVWhQOXRBMC8vYkh4dXRYcGljKzEyeFc2cXZibVRWN3lVU0d2?=
 =?utf-8?B?SmJnMGtiWUFKaDNSR2pidGVYZUpVNWRzU01ERlhOeVJnY0NXZjdTcDdyaEw0?=
 =?utf-8?B?OXpEOFpsaUhlK2pWT1J6RlRxaFJaUk44d0FiclVLRmdVd2tyTkc5SEcxOXJR?=
 =?utf-8?B?RHVuNW5MU2hKMDg3b2FYVDk5d0YweUdvcUxnK3MraS92NEY3bmt5c0VWNEhP?=
 =?utf-8?B?VmRINnZZUVF4a2tqc0lpeWJFV2JWL1ZmSGhGS0Z6K2pJSWpXOGlpSG1WOWlm?=
 =?utf-8?B?cytNK2lGcjloZGRwaXBZUGFDSWFRbGxKQUFaOW5wYlZNOURITkE5clNmWEo3?=
 =?utf-8?B?VFNIbVFVVTdoKzhsMksrNzVYYVdxeElsaEhoT0ZncUJMM0pqVTREbS91aTc0?=
 =?utf-8?B?MzVBNUtRWUxRTmZ1RVFPUGEwWVU2SnJpbk54dzVSNkJmbjg2d0o4ZVdTZXlj?=
 =?utf-8?B?bTBRQVZYeVlBYmg2Q1VWbjl1Y0RxMmMwT1VEOW14K2d2UkRCRk83RndnZkNB?=
 =?utf-8?B?Z1NmVHBoT3VtVFc2czBXTHRtVE44REI3NVJFMjhRTEVaVjdGS3Njbk9uNWRL?=
 =?utf-8?B?MDQyMXVyR3dSdUR4cWVCOXRYSGRNdWpycUlJRTZCZ3BuMk9uZStqZDRsdDJw?=
 =?utf-8?B?QnAxanhzMzQwWkx2R0NxcW9uUUZ0NjNUTTRUMGxxZWxpV2gyN29nVERCV0dm?=
 =?utf-8?B?K1hSSWdPamViSzlFdjF3MHRnZDcxVER2UWFnWGNkY0tzR3FCRy9zbnNQeVgx?=
 =?utf-8?B?dnp3eTUwdFA0Q2ZjbFg5ZE9zMTkwOEF0YVJpNHJvUzYxVDRWdGJNcW9Sc2d6?=
 =?utf-8?B?OUNzWUVlWWo1NldzbnA2aG0yWlZZVU5FODJtaEJyT29oeU5EYk1kVTY3M2k1?=
 =?utf-8?B?SEg4ZTRZcnpVU3pweUNycWtScFNlUi9pbHhhZUVIWHBpVU96aEovY0RjcEhx?=
 =?utf-8?B?MGVpOFRCMHBwb0xJaEhpSWxRR2k5bkw1RnRlbnFOWVA5UHIyeHMrMGh6SVg3?=
 =?utf-8?B?V2lxS1FxUFkzSDU0Vks4aWRWalVLYUhTNW9PNjR5Y3hUZ1hGeHZzSlpXVEtB?=
 =?utf-8?B?bWF3VUoyRFVBelB4YWtwNjU2cTE2S1BLQ0Uzc1QrZ0k1eTNLVlNSOGRyUDJY?=
 =?utf-8?B?b2ZOUzcwZ0NDWUlOZXY4elBodW5FT2VTWC9iNGMwT1p4QWIwL3JQTkxESURX?=
 =?utf-8?B?MCt5cnI0UEh2OS9Hd0NBQllFQVN4cWVIa0xuMWRTcFlCdzBId2Rrcms3VjFJ?=
 =?utf-8?B?K25yRkEzdGpOa3JwMEQ5WGF1MkdMc0RxT3dyVmdPK292YjY2NExqSXBVSGJO?=
 =?utf-8?B?NWFEK1A4ZEpEWE1UUnhMRnFESDI3akVsRkgza21aQWlOWGdNcU9rbDY5bE5n?=
 =?utf-8?B?V2ZLd044YUtob1ZINmlCVElydDVwdXFsd2hYZGZVMy9taUdyVmpOcFNkcXJy?=
 =?utf-8?B?Ykp6cW5VUlN3WEVpSmdDOGhVWHZaN3FycC8vcnRwRjY3S2dEK1BPbTloMDh2?=
 =?utf-8?B?QWwzYkRlMGh2aFlmVUVxU3RGTXgvUTI5bGNncDc1R3ZzNFhFMkp2YlVPdHJZ?=
 =?utf-8?B?T0VJZTY3b1hSVXJxMmtHdWZISTBjNWhKeTkyZGFKcDl5TWRMKzFOODg5WWMx?=
 =?utf-8?B?eEdacWtvdStPanlydHF1ODVvNGx0blNMQ2lRZWNlV0FCNjJRR0dwRVVXTUhn?=
 =?utf-8?B?aDJIM3N3RkRTSjdqdEFDUUVmZE1xbk5BUitsOWZsRFI0bmtHYTl4L1V2V3RW?=
 =?utf-8?B?cmFWeWV5akRjWm5JQ0JORnJpNS9OamVnYURET0dJMDlhUy8yYmtHZTNoU1B6?=
 =?utf-8?B?L3FZOXBJRUJyZTBQUTlNMkwwd0ZJb3BkZ05DVTRVMnlUOUsrTE1HQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1FA026F8F2ACE4DA3DC455DB5A0BFBA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd2a4a0-91f6-4a6a-fe34-08df38e9475e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 13:57:48.5706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uUJgSspejinXmNrFhWG5sscitq86YKzgta6LiMG4X2aIhIcl9WGC8tZVPYz43goBZxH1EqhqHlHaW337PB6vWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11430
X-purgate-ID: tlsNG-ef75cf/1793627870-A6EDEAE4-CED55691/0/0
X-purgate-type: clean
X-purgate-size: 3100
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCk9uIDExLzIvMjYgMzo0MiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAyLjExLjIw
MjYgMTQ6MjIsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gT24gMTAvMjgvMjYgMzo0OSBQTSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTUuMTAuMjAyNiAxNjowOCwgTXlreXRhIFBvdHVy
YWkgd3JvdGU6DQo+Pj4+IEBAIC0xMzksNiArMTQyLDQ3IEBAIGNvbnN0IHVuc2lnbmVkIGxvbmcg
KnBjaV9nZXRfcm9fbWFwKHUxNiBzZWcpDQo+Pj4+ICAgICAgICByZXR1cm4gcHNlZyA/IHBzZWct
PnJvX21hcCA6IE5VTEw7DQo+Pj4+ICAgIH0NCj4+Pj4NCj4+Pj4gKy8qDQo+Pj4+ICsgKiBNYXJr
aW5nIGlzIHNlcmlhbGlzZWQgYnkgdGhlIGhhcmR3YXJlIGRvbWFpbidzIHBjaV9sb2NrLCB3aGlj
aCB0aGUgU1ItSU9WDQo+Pj4+ICsgKiBjb250cm9sIHJlZ2lzdGVyIHdyaXRlIGhhbmRsZXIgaG9s
ZHM7IHVubWFya2luZyBvbmx5IGNsZWFycyBhIGJpdC4NCj4+Pj4gKyAqLw0KPj4+DQo+Pj4gV2hh
dCBhYm91dCBwY2lfdmZfc2V0dXBfcGVuZGluZygpPyBIb3cncyB0aGF0ICh0byBiZSkgc2VyaWFs
aXplZCBhZ2FpbiBtYXJraW5nDQo+Pj4gYW5kIHVubWFya2luZz8NCj4+Pg0KPj4gSXQgaXNuJ3Qu
IFRoZSB0ZXN0IHJ1bnMgYWhlYWQgb2YgYW55IGxvY2sgYmVjYXVzZSBhZGRpbmcgdGhlIFZGIHRh
a2VzIHRoZW0uDQo+Pg0KPj4gV2UgY291bGQgcHV0IGl0IHVuZGVyIHRoZSBoYXJkd2FyZSBkb21h
aW4ncyBwY2lfbG9jaywgd2hpY2ggaXMgd2hhdA0KPj4gY29udHJvbF93cml0ZSgpIGhvbGRzIGZv
ciBtYXJraW5nIGFuZCB1bm1hcmtpbmcsIGJ1dCBpdCB3b3VsZCBoYXZlIHRvIGJlDQo+PiBkcm9w
cGVkIGJlZm9yZSB2cGNpX3NyaW92X2FkZF92ZigpIGFueXdheTogcGNpX2FkZF9kZXZpY2UoKSB0
YWtlcyBwY2lkZXZzX2xvY2ssDQo+PiBhbmQgdGhlIG9yZGVyIGlzIHBjaWRldnNfbG9jayB0aGVu
IHBjaV9sb2NrLiBTbyB0aGUgdGVzdCBhbmQgdGhlIGFkZCBjYW4ndCBiZQ0KPj4gbWFkZSBhdG9t
aWMgd2l0aCB0aGUgbG9ja3Mgd2UgaGF2ZS4gSXMgdGhlIGxvY2sgd29ydGggdGFraW5nIGp1c3Qg
Zm9yIHRoZSBiaXQNCj4+IHRlc3Q/DQo+IA0KPiBObywgc3VjaCBsb2NraW5nIHdvdWxkIG1ha2Ug
c2Vuc2Ugb25seSB3aGVuIGhlbGQgZnJvbSBiZWZvcmUgdGhlIHRlc3QgdW50aWwNCj4gYWZ0ZXIg
dGhlIHJlc3VsdCB3YXMgYWN0dWFsbHkgYWN0ZWQgdXBvbiAoaW4gdGhlIGNhc2UgaGVyZTogdGhl
IGJpdCB3YXMNCj4gY2xlYXJlZCBieSBwY2lfdmZfc2V0dXBfZW5kKCkpLg0KPiANCj4gcGNpZGV2
c19sb2NrIHZzIGQtPnBjaV9sb2NrIHdvdWxkbid0IHJlYWxseSBiZSBhbiBpc3N1ZSBoZXJlLCB0
aG91Z2g6IFRoZQ0KPiBmb3JtZXIgaXMgcmVjdXJzaXZlLCBzbyB5b3UgY291bGQgYWNxdWlyZSBh
aGVhZCBvZiBhY3F1aXJpbmcgZC0+cGNpX2xvY2suDQo+IFRoZSAiaW5uZXIiIGFjcXVpcmUgaW4g
cGNpX2FkZF9kZXZpY2UoKSB3b3VsZCB0aGVuIGJlIGxpdHRsZSBtb3JlIHRoYW4gYQ0KPiBuby1v
cC4gKE9mIGNvdXJzZSBwcm9wZXIgY29tbWVudGFyeSB3b3VsZCBuZWVkIGFkZGluZyBpZiBzdWNo
IGFuIGFwcHJvYWNoDQo+IHdhcyB0YWtlbi4pDQo+IA0KDQpNaXNzZWQgdGhhdCBpdCB3YXMgcmVj
dXJzaXZlIHNvbWVob3csIHNvIHllcywgY2hlY2tpbmcgdW5kZXIgdGhlIGxvY2sgaXMgY2xlYXJs
eQ0KYmV0dGVyLiBXaWxsIGRvIHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KPj4gVGhlIG9u
bHkgdGhpbmcgSSBjYW4gc2VlIGFjdHVhbGx5IG1pc2ZpcmluZyBpcyB2Zl9zZXR1cF9tYXA6IHh2
emFsbG9jX2FycmF5KCkNCj4+IHplcm9lcyBpdCBhbmQgdGhlIHBvaW50ZXIgc3RvcmUgcHVibGlz
aGVzIGl0IHdpdGggbm90aGluZyBpbiBiZXR3ZWVuLCBzbyBhDQo+PiByZWFkZXIgY2FuIHRoZW9y
ZXRpY2FsbHkgc2VlIHRoZSBwb2ludGVyIGFoZWFkIG9mIHRoZSB6ZXJvaW5nIGFuZCB0ZXN0IGFu
DQo+PiB1bmluaXRpYWxpc2VkIGJpdC4gU2hvdWxkIHdlIHJlYWxsb2NhdGUgaXQgaW4gYWxsb2Nf
cHNlZygpLCBvciBqdXN0IGFkZCBhIG1lbW9yeSBiYXJyaWVyPw0KPiANCj4gSG1tLCBpcyB0aGlz
IHJlYWxseSB0aGUgb25seSBpc3N1ZT8gV2hhdCBpZiB0d28gcmFjaW5nIHBjaV92Zl9zZXR1cF9w
ZW5kaW5nKCkNCj4gYm90aCB5aWVsZCB0cnVlPyBUaGVuIHdlJ2QgZW5kIHVwIHdpdGggdHdvIGNv
bXBldGluZyB2cGNpX3NyaW92X2FkZF92ZigpLg0KPiANCj4gSmFuDQo=

