Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B193606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 20:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=trE/BJyw
Received: from list by lists.xenproject.org with outflank-mailman.1493206.1693311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQDc-0004HS-QS; Tue, 17 Nov 2026 20:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493206.1693311; Tue, 17 Nov 2026 20:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQDc-0004HL-M1; Tue, 17 Nov 2026 20:55:56 +0000
Received: by outflank-mailman (input) for mailman id 1493206;
 Tue, 17 Nov 2026 20:55:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xTQDa-0004HF-Nj
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 20:55:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTQDZ-0038HB-4N
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 21:55:53 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcbf56-bab6-0a2a0a5309dd-0a2a450cd12a-6
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:55:53 +0100
Received: from [40.107.130.91]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcbf58-f479-0a2a450c0019-286b825ba6ec-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:55:52 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GV1PR03MB10607.eurprd03.prod.outlook.com (2603:10a6:150:203::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 20:55:50 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 17 Nov 2026
 20:55:50 +0000
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
 b=gUMW3NFzBbmBDDJNTKk2eapQEOGBPtOinfmW+lV5AP3fVhU7f3iJxJakjSM4nA7w0h7UR0olEqjh2qMjH57gG3ixUVLmeS2SLAVAFPki4HzIrs5IoPgO+pcAfGdzl1lu4OYxDQ59z1go5ZtFOR1IRQ0KsIKdKiuoNKezDdjUq95IWbmIofI7Swd07Sq+vMwqKQ47exPM45gLlF4VIrAIZS+5miTVIVBPPTReRVk3xpQWu4fFJmN5+DhIK+uubi/88hHnvO263JEEd/0HZLD40gzUmVhNfjRdMTEhML0d1g19blJwefiW69oztxQGRJpdTwOKQt8U2yUKKao1wTxyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYkqbDbK7u+marUQNZLoNIgBWgm+pKFGZslX9BnLqqk=;
 b=C4EW3M4493LsmQz/3vIN35UzuEZqEf0Re2ng3zE2O4w/RGND1BE9lHWELiV9z7XRLWR9BBiqi2a1Q1w5h9WhDPjuaJnZhAngQQlZxZ9Hg16AJ9ONd2Y1U39T6xvsW94PnKsSwT8hR79m7jER7DF0z9yH25aAbLDa1SAj36I3O1e4J0pJ7wJ5kXelvdTZhxu6csI2ZRsfIynROH2sMgRUeP/yr76zovEs5+92ZiJH+ZovQEEdqOc9tsq3d+JcnvZ1zdX2Wbq7/Ns1DMHtcRAbTxS9xAg1lzS9tuc8lnN+ab5toeRRXQjPVsgCCf+Dfod+ecTupg8MAjH6wXK9gWf6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYkqbDbK7u+marUQNZLoNIgBWgm+pKFGZslX9BnLqqk=;
 b=trE/BJywYl5vyEou0OoWp06DnSANeCOWT3qDEZ/NCixxCQEn2UoK3upJLasWQSx9fRfxorJi+5nwcS5121YpO1j+02e1rQ3v59b5GnSOIrzzCHdbmp2E/WJWLlFUomJUGCCjniIy1vZWd4l2MoJHayr9frM38DuhoH7CKr5DiFUiIlhdKhSNFz121htTuBP84DgSYLlnaLk39C0WFzPRbC4e1pWPeItLh10S4qvyTiBVhQsoFv8IP0KOsId5cOj7QpFGdv++1XlmbOfCbTvFpkRjKpYcMJjRmUIyr3J2V9zEhkjqeNS3LdCPPGBEBsPGlNrKWxzy0LUJg/Dr1pAEHg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.com>
Subject: [PATCH] PCI: deviate MISRA R11.8 for the one-time SBDF initialization
Thread-Topic: [PATCH] PCI: deviate MISRA R11.8 for the one-time SBDF
 initialization
Thread-Index: AQHddtYGdAaplnsBm0mPFarnWPL2Rw==
Date: Tue, 17 Nov 2026 20:55:50 +0000
Message-ID:
 <ed06386df3f5ae485a409e8c0bed10b01d7fd33d.1794948091.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GV1PR03MB10607:EE_
x-ms-office365-filtering-correlation-id: f14ef6b8-5c8f-4820-8754-08df44ed2953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|42112799006|376014|1800799024|18002099003|6133799003|11063799006|56012099006|261026140227099003|261028144727099003|261009223027099003|10067099003|261021123027099003|261102123227099003|261021121427099003|38070700021|261026121527099003|260925022911599003|260925021311599003|261022105027099003|260925021911599003;
x-microsoft-antispam-message-info:
 tFBaWleRFqzWzuHWMXpQ+fOq6XtA2Tcbk1HuS4/CIG3pn+6qUfSPJNqGbhQjzMn/7xV3I/5t4TJsDCmDM3TEvIuGvKpncrSZKSA4NIOR/FI9ftb/KjZHXIHR7boMG3QCb3PC0RtSQznqB2m+Ee0k+ovrHjB4s6DGj51jqrFXFavA3PeGhnw+h8xq+02+kSAnJSrW/3JlNEBmXsMGz8pXg6REsg/t6FnAHEjgsSLPQ33LB+vRg+YC/EKKDmt+lEXZW68Z4cNcMrPUQDXDhHfqtDKzwPwGYwe6ekQKUWrz60YbeBjYLl+/VfxErktGHLtySlcB5Hh2n0OOxt/d8CKLgFW6ninkhj6UEt+x6zWESubgqQ/+Ap6pAfYFJKgVljcRAYLQ243hB0I+nMeRKif+VUQ1IlAvzsgb8SfHcpBUDyVPUqdAwQEtk62XEX/LQU/ZeTmskQvhgC/BH06suPpVd2O7CzVxMUqol6gyMwAH9ht2Z4VvvBIbvzOpLaE5zHsWT0HsdCCSyzTy+oOrxRNRXt9r44XyS4aLnsQCWjVonF2P/KXNC3n83kdZ8a4W1M7sSLOVjKr7Kd0vZdQsMt5AJDnvHvG/dWGpmqt7OnuN/AL/i2VbPU4UnG5OzAJYGbCt3lMK0JlWzNUWeku5zD281j0IEPEzyjEuFOkcRvM+KDYNKqdD/c2obgKqXErluKY1k9l0Fs6Pykpzc4qw5Q1iShE1PkPhjCizQRwOftdqkjU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(42112799006)(376014)(1800799024)(18002099003)(6133799003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261009223027099003)(10067099003)(261021123027099003)(261102123227099003)(261021121427099003)(38070700021)(261026121527099003)(260925022911599003)(260925021311599003)(261022105027099003)(260925021911599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUNjVk1nTzQzdlA2NEhLcmdVR3UxM1A0blBWcmhKSUxkTkpOSHYwVU5zTVNL?=
 =?utf-8?B?Q3dHZmQ5N2owMUFHT2FHTEtYa1VXWWFwUHljY3NJMlVYYi9SdFZtWnFFRjMx?=
 =?utf-8?B?a25vWmtMUTYvc1RWRVFsU3dqMHhLOUtwT3FhakFpSHVKNHpXQUtRRkNxeHl5?=
 =?utf-8?B?MklIUks3RmtRWGhmbmkramY3QWhjRlBaNkNvYm02alF0TVB0TUhIdytFU3FT?=
 =?utf-8?B?WXovS0o1cGxLTGRTaWs4aTJUTFZCRWt3L25kNVhTamlhUnIzYVdrODhEeXZl?=
 =?utf-8?B?T1R0enc5QXRWSWJ6Kzk5WkN6TlhNZGJRR1JkY3BTTmprbzFGejZzbnBQV2ox?=
 =?utf-8?B?dEZMK3BlK2dJNitUZE42RWErbVVQeC9nbzhCbzhKUmRDVG5BbGl3ZWlkZVdp?=
 =?utf-8?B?eHdtaVJ6dTJCTXBNVnovRHV6TXRmVXVReG1YSUJGOHltU1RKNXA4S2NrRVpW?=
 =?utf-8?B?TUdXYkY1cUJtdTNsa0o2UCtBTEt0M1BNaGhTSWlNdlpHdnlTYmFVa1djcDkz?=
 =?utf-8?B?WEltWHNVUU9xdW8yVjRETWs0TFAwZitldFMzOVg1bVZSOHdHYzFtZ2drMkJS?=
 =?utf-8?B?WUNIbzN6MDI1ZkJQN1V2WFZrd3Z6My9OaXV4emcvaDBwZGZoTWErbTZ4T0VR?=
 =?utf-8?B?YTJkcm02T3pSVzBkeVFKZklrTVRpakhRbkFQU2ZGZUR3TFY4MFdDZDVLK3lD?=
 =?utf-8?B?RytiTkI4TFFzLzJQczRpTTM4aldaN29VQnNWK2k4ZmJTMzA3QUZHT3ZGMHV4?=
 =?utf-8?B?cTExQnlMTUlBTGM3bEFHaE50aUJ5T2FSckZPVUp6YjJ5bmJnK3Z6cDhzWllM?=
 =?utf-8?B?dkVxVDYweGxaR3hHY1l0MFR6QnZkMnF6VDJnMzRpd0tmNVA5aDU0QWRiQjFi?=
 =?utf-8?B?MFQ3OUY0VHFvMnBRbDNvVTkwR2pGQS9GNHNLMGp3UmZHRkRXdERwbGtoZWhU?=
 =?utf-8?B?K1A3eXg2MlBKdnJoSWpEUnB6MEt0M3JwSTlydmNFQlg1MDdwTG1NRWdIaUsr?=
 =?utf-8?B?RElXejFOY01Ua0ZoeGJGa0laalVQNC9HZHNJdjE1MmpvcU43bTRLOUUxWUdN?=
 =?utf-8?B?cE5odWZ0Nkppa3ZEcFlVM3JkcWtBQTloS1dBbytyclRhdXVkampEUXRvN3ND?=
 =?utf-8?B?eVRQaktRQmxJdUxJb09RdE94VTFiUSszOUROZzJobGRwUkdMSnRYY3NGM3d4?=
 =?utf-8?B?RjAvYTk5dkdyMjE1dUQvRndEZHUyTVA2YkxSS1VvdUI1dnNCWnJLci8vY09J?=
 =?utf-8?B?OEQvV3ZQeExHemVVMmx2dDl3Uks3NmZVRHkxVmhrTWFQb2JpcHdYcVVQMmNn?=
 =?utf-8?B?TUtTVzB4aEU3Sm40L2dVQ0Zna0N5Z3Fpck5SNndNLzdxSytOWUFYeFZmbEZ2?=
 =?utf-8?B?bXp0L3BmTU5WYUp4S0x0d0dxNGVxdGxaOUVQM0dpZWlueWl0cFpoQkcyUENF?=
 =?utf-8?B?WG11Q0hjVDd3ME03ZTFUbkJ2TFhuaktvSGJ1LzM1S2R1VWxYaGc1UjZVM3Js?=
 =?utf-8?B?bHhmN004RDlob0Yxblk2Rzh2NDZ0NGp4VndmY3NtSXU2V3JxenRwdVlQSUJu?=
 =?utf-8?B?aGw4OFAwSldFNzRzMWthSXNEWUZyajVmazkyY1NFM0NreUVyYW9UcHlWczFP?=
 =?utf-8?B?dUJsU2ZlelRSTFFhY1NBUjZ1cWFZcDN2RUJ5WkhYd05UQVRNY0xuVzlIS2JD?=
 =?utf-8?B?RzJDMkJzQ3ArWUdsVmFnYkxuMGlrZ1g2cjFLa1h3cGx3eSt5dWhuTmcrL3Iy?=
 =?utf-8?B?MlY2TlpOcFB2ajNpeTh3MG9tWDhFT1RlWnRWcjBFaUpXb1N4L0N0TDYyclBI?=
 =?utf-8?B?ZGRudTNNa1VRTlFLU053NS8wQUhXVlBLTTgrcGRWTUVYS3dVUVhnWHRrTjlV?=
 =?utf-8?B?NVo3MURHL1g0Y3NMVmdtV1JSZHpjZTRVUHp1OGdQMnljRXo0dy9YWGhXR2t6?=
 =?utf-8?B?d1NIajUwc1l0NFA2M1hRa3hhN2o0UXJmM2gzcjRMeFVGczNRT2tHNnFzVzBU?=
 =?utf-8?B?K0Zzdy9OVVEzSUU3eHRsY2o4OTZhS2puWmFvcmsrZWJVdVNCOUVNQ1RkQVQ3?=
 =?utf-8?B?aHdFZ1puSDN6Nk9EWVBBK0gyT2ZwMkRmTVNJaGpZMmdGQVZ3TXNtVUIwY3pr?=
 =?utf-8?B?WFk0Q0lYRG9nVGhCcjh2WVVCUjFZbHIrQ3NFbE1xdkxpNzdScTZCUmpLSEdH?=
 =?utf-8?B?dVI1SkJ1cnk0MFhoM1Qyd3Zid2lhb2VaY2RFMDJmK3dLaW1IT0p1bUg4QXYv?=
 =?utf-8?B?OE81NStUVEZiMUp5T3IyZVdMbGJSdk8zRW9qelgzNGJTMUtaVnpNR3BPVlZR?=
 =?utf-8?B?S20rcjMvZkxHOVlFeThsdXJQMUxtdEJXajBYQ2Y4S2lucnJ1VzNHV2VNcnpn?=
 =?utf-8?Q?KkNkFxwNnDIlloC8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14ef6b8-5c8f-4820-8754-08df44ed2953
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 20:55:50.0981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzHvNcj/ETA1vRhwS7ydJUurXwm7nR3DoCsg2XUVzCSUX6EEBlh1R33+p/whh8biEYFYLtSjY5tDlUU9hccuN1U4iZLnt4OZoTsHtB2Q2D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10607
X-purgate-ID: tlsNG-d25034/1794948952-76CDBA5B-B27906DA/0/0
X-purgate-type: clean
X-purgate-size: 3080
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TUlTUkEgQyBSdWxlIDExLjggc3RhdGVzOiAiQSBjYXN0IHNoYWxsIG5vdCByZW1vdmUgYW55IGNv
bnN0IG9yIHZvbGF0aWxlDQpxdWFsaWZpY2F0aW9uIGZyb20gdGhlIHR5cGUgcG9pbnRlZCB0byBi
eSBhIHBvaW50ZXIiLg0KDQphbGxvY19wZGV2KCkgd3JpdGVzIHRoZSBkZXZpY2UgaWRlbnRpdHkg
b25jZS4gc2VnLCBidXMgYW5kIGRldmZuIGFyZQ0KbWVtYmVycyBvZiBhIGNvbnN0IHVuaW9uLCBz
byB0aGF0IHdyaXRlIGdvZXMgdGhyb3VnaCBhIGNhc3QgdGhhdCByZW1vdmVzDQpjb25zdC4gVGhy
ZWUgc3VjaCBjYXN0cyBwZXJmb3JtZWQgdGhlIHNhbWUgaW5pdGlhbGl6YXRpb24uDQoNClN0b3Jl
IHRoZSB3aG9sZSBzYmRmIGluIG9uZSBhc3NpZ25tZW50IGFuZCBkb2N1bWVudCB0aGF0IGNhc3Qg
d2l0aA0Kb25lLWxpbmUgU0FGLTE1LXNhZmUgY29tbWVudC4NCg0KTm8gZnVuY3Rpb25hbCBjaGFu
Z2VzLg0KDQpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNo
dWsxQGVwYW0uY29tPg0KLS0tDQpUZXN0IENJIHBpcGVsaW5lOg0KaHR0cHM6Ly9naXRsYWIuY29t
L3hlbi1wcm9qZWN0L3Blb3BsZS9kaW1hcHJrcDRrL3hlbi8tL3BpcGVsaW5lcy8zMDgxMDY3MzYy
DQotLS0NCiBkb2NzL21pc3JhL3NhZmUuanNvbiAgICAgICAgICB8IDggKysrKysrKysNCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8IDUgKystLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kb2NzL21pc3Jh
L3NhZmUuanNvbiBiL2RvY3MvbWlzcmEvc2FmZS5qc29uDQppbmRleCAzNTg0Y2I5MGM2Li4zNTAz
ZDJlODA4IDEwMDY0NA0KLS0tIGEvZG9jcy9taXNyYS9zYWZlLmpzb24NCisrKyBiL2RvY3MvbWlz
cmEvc2FmZS5qc29uDQpAQCAtMTI0LDYgKzEyNCwxNCBAQA0KICAgICAgICAgfSwNCiAgICAgICAg
IHsNCiAgICAgICAgICAgICAiaWQiOiAiU0FGLTE1LXNhZmUiLA0KKyAgICAgICAgICAgICJhbmFs
eXNlciI6IHsNCisgICAgICAgICAgICAgICAgImVjbGFpciI6ICJNQzNBMi5SMTEuOCINCisgICAg
ICAgICAgICB9LA0KKyAgICAgICAgICAgICJuYW1lIjogIlJ1bGUgMTEuODogb25lLXRpbWUgaW5p
dCBvZiBhIGNvbnN0IFBDSSBpZGVudGl0eSIsDQorICAgICAgICAgICAgInRleHQiOiAiVGhlIGNh
c3QgcmVtb3ZlcyBjb25zdCBvbmx5IHRvIGluaXRpYWxpemUgdGhlIGNvbnN0IHBjaV9kZXYgaWRl
bnRpdHkgZmllbGRzIChzZWcsIGJ1cywgZGV2Zm4pLiBUaGUgY29uc3QgcXVhbGlmaWNhdGlvbiBw
cmV2ZW50cyBhbnkgbGF0ZXIgYXNzaWdubWVudCwgYW5kIHRoaXMgaXMgdGhlIG9ubHkgd3JpdGUs
IHBlcmZvcm1lZCBiZWZvcmUgdGhlIGRldmljZSBpcyBwdWJsaXNoZWQgb24gYWxsZGV2c19saXN0
LiINCisgICAgICAgIH0sDQorICAgICAgICB7DQorICAgICAgICAgICAgImlkIjogIlNBRi0xNi1z
YWZlIiwNCiAgICAgICAgICAgICAiYW5hbHlzZXIiOiB7fSwNCiAgICAgICAgICAgICAibmFtZSI6
ICJTZW50aW5lbCIsDQogICAgICAgICAgICAgInRleHQiOiAiTmV4dCBJRCB0byBiZSB1c2VkIg0K
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvcGNpLmMNCmluZGV4IDU3ODQ3MmQwNjguLjE0ZDU5YjEyOTMgMTAwNjQ0DQot
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvcGNpLmMNCkBAIC0zMjksOSArMzI5LDggQEAgc3RhdGljIHN0cnVjdCBwY2lfZGV2
ICphbGxvY19wZGV2KHN0cnVjdCBwY2lfc2VnICpwc2VnLCB1OCBidXMsIHU4IGRldmZuKQ0KICAg
ICBpZiAoICFwZGV2ICkNCiAgICAgICAgIHJldHVybiBOVUxMOw0KIA0KLSAgICAqKHUxNiopICZw
ZGV2LT5zZWcgPSBwc2VnLT5ucjsNCi0gICAgKigodTgqKSAmcGRldi0+YnVzKSA9IGJ1czsNCi0g
ICAgKigodTgqKSAmcGRldi0+ZGV2Zm4pID0gZGV2Zm47DQorICAgIC8qIFNBRi0xNS1zYWZlIFIx
MS44IG9uZS10aW1lIGluaXQgb2YgdGhlIGNvbnN0IFBDSSBpZGVudGl0eSAqLw0KKyAgICAqKHBj
aV9zYmRmX3QgKikmcGRldi0+c2JkZiA9IFBDSV9TQkRGKHBzZWctPm5yLCBidXMsIGRldmZuKTsN
CiAgICAgcGRldi0+ZG9tYWluID0gTlVMTDsNCiANCiAgICAgSU5JVF9MSVNUX0hFQUQoJnBkZXYt
PnZmX2xpc3QpOw0KLS0gDQoyLjQzLjANCg==

