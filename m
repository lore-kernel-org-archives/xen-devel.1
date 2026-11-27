Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0B8606A332
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=LarbxfDA
Received: from list by lists.xenproject.org with outflank-mailman.1504832.1699866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWuOT-0003um-N8; Fri, 27 Nov 2026 11:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504832.1699866; Fri, 27 Nov 2026 11:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWuOT-0003ue-K5; Fri, 27 Nov 2026 11:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1504832;
 Fri, 27 Nov 2026 11:45:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xWuOS-0003uA-9m
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 11:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWuOR-002Nuy-Ek
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:45:31 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b096d4b-2eae-0a2a0a5409dd-0a2a450cbb04-30
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 12:45:31 +0100
Received: from [52.101.66.94]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b096d5a-f479-0a2a450c0019-3465425e5687-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 12:45:31 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by DB8PR03MB6139.eurprd03.prod.outlook.com (2603:10a6:10:141::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 11:45:25 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 11:45:25 +0000
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
 b=nT3hdTH5c2/ZTOEHgWlxaUb+YwCWX7izIky4O05SS6LfVmkiGyvStTvOgGOctIcKK/KAMjdd1N3nLfbouLlxNNcGni0PKrPjmi/Tg6zAyuVMCRSHpmDRgxoB9cN78k/y9OmFkS53j4f0Is1216w7GvY6hQ4xCHsap0uL+RDq+RzbuseyswJsOSioZvxcOg25g2aR0kdG5sZP8mHrwqmAhSfTIiZ0m8ziCPYSnOn/QV1TTspn+1qVJ3eSpELGODzzPSq475vKn78zkpYdFPszAfwZGODHdCv1HPeIJ7K7JzQKHtzKiJ6lA9Odl8TcyMx9Ur7qliADSYcUMW2ne72HVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8LBRlYnTu7Pk3Hchf50EPEUJ3NPJO5O0QXewANzx44=;
 b=CqCyaPjSFbRq3v1PgVkQXiUOtVPYOgGd6ws2grr5maZAL1MNPCHB6WsZ7KojRuz7LR/+zL7t6FWc8dl/ibhBaRoWU3ynon51mLybP8kG0M2LTLyRrMrMyqxTpOFzsqTMb6KDsSxvkJZKRTNot5Jav/wzAtEI7eCFOt2VUClyiBRI/TV40OUwj/2SXMQBnq4SneodWjOzYXuURc1ZVBCy2qFeao/KmQ150IqQtyZMEby8YnPO8h8i5Zl5w5uXHdNABRJs6bdhDncpVRoZCXubUN/AcKsI6fuzcTSV0d6RIavFkxIOuIuhDxjr/16QPkwx/fd6ECxIL9QZCWM53bpSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8LBRlYnTu7Pk3Hchf50EPEUJ3NPJO5O0QXewANzx44=;
 b=LarbxfDAwg+M3vfG2yReEnsMJJpyNJ5fXjRoSmYcSd91XgTzynzUoCdY8Hsk52eThMQ4r6X/SIObM3y4IAkpyJBIcZlF0UT5PsaHjpwqFDybaN7fPMemI3xoZ3Ew3OP6DUYnKy34Q2W7IG+3PeSfKZ7W2AA2e1bgtYkBpnOi/WkUF0Mb1xlFflihcs0EP2K/G4PTzJcVMeTzJsp21g02E1S9OaPsq4Em6sFOJkWi7j/wXulUqxvCwd6Z/hahrfg7OWhIKMywfAooEQntyaRrByW6h6o5+H9u7Km+c0u3BUO5HYx0s1+LIVIUTVd95VbmgeVtvhudrTNNji0EV26Ncw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v12 0/6] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v12 0/6] Implement CPU hotplug on Arm
Thread-Index: AQHdfmTKjAaMUururkSzVhUtjMqgQg==
Date: Fri, 27 Nov 2026 11:45:25 +0000
Message-ID: <cover.1795775931.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|DB8PR03MB6139:EE_
x-ms-office365-filtering-correlation-id: 90ee74f5-de98-4edd-ef7f-08df4c7bed11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|38070700021|10067099003|11063799006|261102123227099003|261026140227099003|261021123027099003|261022105027099003|261026121527099003|261021121427099003|56012099006|261009223027099003|261022075727099003|261028144727099003|6133799003|18002099003;
x-microsoft-antispam-message-info:
 oQw0xB5bUdtC+raxZU5yxslGjwSoK/jkxEJLRfT5g7S/i2lgkqnJ2p5YOgPlu2Ld9aZTRtHbzcjnC//Uv4CWROnXjMWfzOwoUDBd7bTZnLLbLBMR2CCqRpRtaZvGsq5v8pGTVDHhz3jRNSC5GYY+MB3YQi/5A3r0cDWcVvc4nijxeMHolbNfexE8Cf16P8gl8aXLpZcY3wjP6GBFpDFma+OKoAoheza9L386h99+pczDQdP9x/euQi5vc+jCM5B6OE3bHJk4R4Qw2xfCzoCpURfigpwKm1wAMfM+F9TPiC31iTj2ULSH4A3AAcE1a+72ZDEGBsfSJTbRpL+YubL6XJ11MVtu9YwDnwhIrZARHBTClgoG6YIbC2tsxXo8fff9WM0k1a/pVkKBYWqCefsMYbRzlblU1mtlnHL1I7idT9g7kRXE6y5PP0wM+FHoBEHRrEOxAl6uA49nkRc8YNcLUq+Vlks6qvAJIxR3aZ/d0UqH1xLoi4n4vjoeJr3acpwEkcUjUnHZPNK8VXboiGYYZtTkLEtNasdTce1jhWsw668LAiHlXmiuIiSaoZrfVyLZe6/Rp83AZL5t4n1ONMu00g28/xFHWyvOeizjzVrKg9Me3LntSzPP8TeYL0EeS+5zyyh7GerxeKNsGFDEBXK8MXM/jPDWBUODCq0lWQ4GRrZiRERJbTq+xs4hF9Dote2HxnQV2fJnuGoD24lupdD1VldbJ59kINvYb8djckJF42I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(38070700021)(10067099003)(11063799006)(261102123227099003)(261026140227099003)(261021123027099003)(261022105027099003)(261026121527099003)(261021121427099003)(56012099006)(261009223027099003)(261022075727099003)(261028144727099003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWROdEMrQjd4Z3hsUjVLeFBCbU5JNTZxdHZVRklVNmNjV1FxZzRYR0oxMm1v?=
 =?utf-8?B?V2xueE1pVHByZzIycEIxRXZkOC90bnJmT3kzenIybVZaeTY0TWp5S084U1JQ?=
 =?utf-8?B?RC9oZ3BXZzltVmg2V2oyczVxUDlQZllaYUFhYTZGamNuUkVDd28wK282aHB3?=
 =?utf-8?B?d0FBVkJOT2I4RytVdm5xdmNKdkE0c2RTVWMrOUt0SWJGOUNFSjRnNXV0N0p4?=
 =?utf-8?B?MThaRHZ1RVkveWdjbGN4VUEvc1FOL0JMR28xRmlya0VESmg1a0xBS3N2QzJL?=
 =?utf-8?B?RDBQSWliamZ2c3VTdzFtb0M4N0xyWStDNGhIY0FzMFpmT1hBWFF4bE42K2lB?=
 =?utf-8?B?c05nQi9hSGluQWdkL2lFY1BoZ3M3eW8yU29YVGhkWVRQRzV2VFBVVTgrNnpI?=
 =?utf-8?B?RW1Rb0szOThQVW9KeWNrRzNreE9peExSYXpralRuOVFiMVVQS0FmcmhTWVlD?=
 =?utf-8?B?Z3RaR2lYY0ZwYlVtbm5DajBPejlMcmxwVGRWVFpURG1iaFZ4RTdONElQT2FR?=
 =?utf-8?B?OGJvRFpTd1MvRStQZlRzOFlEU2l1TXBUS1l3WmFzaWVDS2VES3RsRDg4eVRx?=
 =?utf-8?B?SVNFQUFvZy9lWmtRVWVpejZibjJHY2VTU0lUclZBVHJQZnY1T1pBcGRrSEdw?=
 =?utf-8?B?MU5EWnB0WjVESDRGUkovN1YxaGh1TXZCMzE0WnFZOERtL0tpak5sZHBLY2d2?=
 =?utf-8?B?K3pXeGJpcGU2eUVGQy9TRnFCUTlPdEEvaTZZNFFHRlFrKzNGNkt0VGswc1g0?=
 =?utf-8?B?QjF1U1ZpNnk4TGhsc0FGTlh1UlZqcXcwdDhLSDBTQVo3SDZEWGgzRDNCYkJO?=
 =?utf-8?B?MUhzNmVsQzBjZ2plNVhMcUszd2RSeTk2bkxrQXVkQnZxZ21WSEhqMWU0YXdm?=
 =?utf-8?B?YVI0K1IrZjJjZzNRa0dYMGZVUEJFbUR1dFlMeUN1TGhSbVVVN0pNbnE0Y1Q3?=
 =?utf-8?B?Vnpsa2V2azJ5bk5CTm81TU1QUXhKa1VwSWRLb2tFdmdqYWppVWVzQkJ1ckNN?=
 =?utf-8?B?SFVsY3JreHB4a3hqcit1K0Z5cmxHc1oyUWh4Q3RxLzRiU2pRWm51SXYwMXJx?=
 =?utf-8?B?eENGZVNUY0ZHRFFQMXAweFpWL1Q2L2tFUEczN0dQNWFLeEcvTENSWTBqR1Q5?=
 =?utf-8?B?M3BCL0JhSTdOWGJHeHNleGxZWEJIUWJWbi9CSUlxNXZNaEdsL016bzVDcm1M?=
 =?utf-8?B?bVJ4TEJ3TFFTRC92QXF4Sm4yTUxkS0JKUTNpakdUd2IxT2doQ21lanhvZkRz?=
 =?utf-8?B?Z25BL0VBcUdqNU0xVTA2NDU4bXh5NThjOTIyTTBPUklpR25LeW83Sy9Zbis5?=
 =?utf-8?B?M1FxWG5ENTQrWHNtYWNicHF4NXk0Wm9kdHkvUnZ1Ti9EV01SQ3NPZGhRY3hP?=
 =?utf-8?B?cG92TzdjOHlnem5aRzlmL2Z0cmxxM3RZRDdoemh4N3VTSUdjN3FqU0lSa21T?=
 =?utf-8?B?WWtTMW9Bd2pSSExlV1pMbUZkT05JMkw5dXY1MW14THBjc01xQzZlaUZOOVY5?=
 =?utf-8?B?V01rYk56R2lObHprZjI1QVBZWjF2YXdEWlpoKzlnWFFKR1lQcmxmS25pcSti?=
 =?utf-8?B?MExjaUtsOXF3K0MwcWp5SE1VLy84VG5OS1hXZ0pGK01LeE5UV1k1V0lDejhV?=
 =?utf-8?B?QXFoTmsxL29KTW53YjQ1RmNvVHZOMVBBRmRhTmYybWRGVGJkS1pZajZIbnVt?=
 =?utf-8?B?OUxNbENITjM3bDFBcGxWMUlWVDhNSjUyWFpZaUIyVHNaOGV3TjlRZFBEMWhU?=
 =?utf-8?B?OEp5T3hEMVUrZTRHYUZSQjBNTnpQQWlKNVFvZ0U1QzdkUk02RWNFUFpKYUsx?=
 =?utf-8?B?QUcycUVDeUVrZVRFMmJSZEIzaWFuWnF3Vks4VGhLUTZkZzdPbXZIVHFJS1lN?=
 =?utf-8?B?TWx0elE5UWtVeHYzMGJTQzE4VWVwRDA1UnpwcU9VYnNOZVcwZzAwb09kYWNi?=
 =?utf-8?B?WWd0c3V0NUE5aTZTOWo0em9PT2dhSE9IbGpQZWJqMnhJZHdsKzE3a2tZbktp?=
 =?utf-8?B?aE54endQdzRWTDM1UDdPNzArbjRpV1dTc2tlQ2lpbkswb3Exanc0UUNzWm9s?=
 =?utf-8?B?M3hSRXVvVEsveVI1S0M4TjNjaXJxZlh2TmhXUE1PbU1ZWC8waFhlYUR3bFRK?=
 =?utf-8?B?dHp4NTZhYnJYTTRJUzE0T1Q4Wk1HVjlreW0xbnU4Q1d0ZGdPVnFrc0pmS3Zu?=
 =?utf-8?B?cnEvemJ4QmVKVlVvWkh4VzF0ck5iU0tDaGFzMDBGaHdkTW5rZnVEMS93aWxa?=
 =?utf-8?B?U2JQVEFIQnpTdmNTWm9ObktpdzBlbnRSUHh2RXFsSUdjOThoTFFLVk5iM3NN?=
 =?utf-8?B?WDdEQlY3UmhENWVWdEFMVmFkMFVKbTliRjFoUGtIdjZ2a2lxSWV6Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ee74f5-de98-4edd-ef7f-08df4c7bed11
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 11:45:25.1051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FaozTCGag7f/msE/OxPiCfJtsVjeKwytiewUBL4pwTFN7k4VGV4JsAUeezfw7ZJkgxoq2MV6hWkUrzuT0GqQPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6139
X-purgate-ID: tlsNG-d25034/1795779931-5073FA5B-D2C2B5A9/0/0
X-purgate-type: clean
X-purgate-size: 3450
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciBDUFUgaG90cGx1Zy91bnBsdWcgb24g
QXJtLiBUbyBhY2hpZXZlDQp0aGlzLCBzZXZlcmFsIHRoaW5ncyBuZWVkIHRvIGJlIGRvbmU6DQoN
CjEuIFhFTl9TWVNDVExfQ1BVX0hPVFBMVUdfKiBjYWxscyBpbXBsZW1lbnRlZCBvbiBBcm02NC4N
CjIuIEVuYWJsZWQgYnVpbGRpbmcgb2YgeGVuLWhwdG9vbC4NCjMuIE1pZ3JhdGlvbiBvZiBpcnFz
IGZyb20gZHlpbmcgQ1BVcyBpbXBsZW1lbnRlZC4NCg0KVGVzdGVkIG9uIFFFTVUgYW5kIFItQ2Fy
IEdlbjUgSFcuDQoNCnYxMS0+djEyOg0KKiByZWJhc2UNCiogbW92ZSBpcnEgcmViYWxhbmNlIG5v
dGlmaWVyIGZyb20gQ1BVX0RFQUQgdG8gQ1BVX0RZSU5HDQoNCnYxMC0+djExOg0KKiByZWJhc2UN
Ciogc2VlIGluZGl2aWR1YWwgcGF0Y2hlcw0KDQp2OS0+djEwOg0KKiByZWJhc2UNCiogc2VlIGlu
ZGl2aWR1YWwgcGF0Y2hlcw0KDQp2OC0+djk6DQoqIHJlYmFzZQ0KKiBzZWUgaW5kaXZpZHVhbCBw
YXRjaGVzDQoNCnY3LT52ODoNCiogc2VlIGluZGl2aWR1YWwgcGF0Y2hlcw0KDQp2Ni0+djc6DQoq
IG5ldyBwYXRjaCAiS2NvbmZpZzogTWFrZSBjcHUgaG90cGx1ZyBjb25maWd1cmFibGUNCg0KdjUt
PnY2Og0KKiBzZWUgaW5kaXZpZHVhbCBwYXRjaGVzDQoNCnY0LT52NToNCiogZHJvcCBtZXJnZWQg
cGF0Y2hlcw0KKiBjb21iaW5lICJzbXA6IE1vdmUgY3B1X3VwL2Rvd24gaGVscGVycyB0byBjb21t
b24gY29kZSIgd2l0aCANCiAgImFybS9zeXNjdGw6IEltcGxlbWVudCBjcHUgaG90cGx1ZyBvcHMi
DQoqIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMNCg0KdjMtPnY0Og0KKiBhZGQgaXJxIG1pZ3JhdGlv
biBwYXRjaGVzDQoqIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMNCg0KdjItPnYzOg0KKiBhZGQgZG9j
cw0KDQp2MS0+djI6DQoqIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMNCg0KTXlreXRhIFBvdHVyYWkg
KDYpOg0KICBhcm0vaXJxOiBLZWVwIHRyYWNrIG9mIGlycSBhZmZpbml0aWVzDQogIGFybS9pcnE6
IE1pZ3JhdGUgSVJRcyBkdXJpbmcgQ1BVIHVwL2Rvd24gb3BlcmF0aW9ucw0KICBLY29uZmlnOiBN
YWtlIGNwdSBob3RwbHVnIGNvbmZpZ3VyYWJsZQ0KICBhcm0vc3lzY3RsOiBJbXBsZW1lbnQgY3B1
IGhvdHBsdWcgb3BzDQogIHRvb2xzOiBBbGxvdyBidWlsZGluZyB4ZW4taHB0b29sIHdpdGhvdXQg
Q09ORklHX01JR1JBVEUNCiAgZG9jczogRG9jdW1lbnQgQ1BVIGhvdHBsdWcNCg0KIGRvY3MvbWlz
Yy9jcHUtaG90cGx1Zy50eHQgICAgICAgICB8IDEwMiArKysrKysrKysrKw0KIHRvb2xzL21pc2Mv
TWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgOSArLQ0KIHRvb2xzL21pc2MveGVuLWhwdG9vbC14
ODYuYyAgICAgICB8IDI3OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogdG9vbHMvbWlz
Yy94ZW4taHB0b29sLmMgICAgICAgICAgIHwgMjkzICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KIHRvb2xzL21pc2MveGVuLWhwdG9vbC5oICAgICAgICAgICB8ICAxNSArKw0KIHhlbi9h
cmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICB8ICAgMSArDQogeGVuL2FyY2gvYXJtL2dpYy12
Z2ljLmMgICAgICAgICAgIHwgICAyICsNCiB4ZW4vYXJjaC9hcm0vaXJxLmMgICAgICAgICAgICAg
ICAgfCAgNzkgKysrKysrKy0NCiB4ZW4vYXJjaC9hcm0vc21wLmMgICAgICAgICAgICAgICAgfCAg
MTEgKysNCiB4ZW4vYXJjaC9hcm0vdmdpYy5jICAgICAgICAgICAgICAgfCAgMTQgKy0NCiB4ZW4v
YXJjaC9hcm0vdmdpYy92Z2ljLW1taW8tdjIuYyAgfCAgMTEgKy0NCiB4ZW4vYXJjaC9hcm0vdmdp
Yy92Z2ljLmMgICAgICAgICAgfCAgMjEgKystDQogeGVuL2FyY2gveDg2L0tjb25maWcgICAgICAg
ICAgICAgIHwgICAxICsNCiB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vc21wLmggICAgfCAgIDMg
LQ0KIHhlbi9hcmNoL3g4Ni9wbGF0Zm9ybV9oeXBlcmNhbGwuYyB8ICAxMiArKw0KIHhlbi9hcmNo
L3g4Ni9zbXAuYyAgICAgICAgICAgICAgICB8ICAzNSArLS0tDQogeGVuL2FyY2gveDg2L3N5c2N0
bC5jICAgICAgICAgICAgIHwgIDIzICsrLQ0KIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAg
ICAgICB8ICAxMSArKw0KIHhlbi9jb21tb24vc21wLmMgICAgICAgICAgICAgICAgICB8ICAzNSAr
KysrDQogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAgICAgICAgICAgIHwgIDMyICsrKysNCiB4ZW4v
aW5jbHVkZS94ZW4vc21wLmggICAgICAgICAgICAgfCAgIDYgKw0KIHhlbi94c20vZmxhc2svaG9v
a3MuYyAgICAgICAgICAgICB8ICAgMiArLQ0KIDIyIGZpbGVzIGNoYW5nZWQsIDY1NiBpbnNlcnRp
b25zKCspLCAzNDAgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvbWlzYy9j
cHUtaG90cGx1Zy50eHQNCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbWlzYy94ZW4taHB0b29s
LXg4Ni5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL21pc2MveGVuLWhwdG9vbC5oDQoNCi0t
IA0KMi41Ni4xDQo=

