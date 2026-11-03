Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C03B606B127
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=PtM4e2cB
Received: from list by lists.xenproject.org with outflank-mailman.1469435.1678272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBlf-0001Df-PR; Tue, 03 Nov 2026 10:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469435.1678272; Tue, 03 Nov 2026 10:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBlf-0001DJ-J2; Tue, 03 Nov 2026 10:29:27 +0000
Received: by outflank-mailman (input) for mailman id 1469435;
 Tue, 03 Nov 2026 10:29:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xOBle-00018y-12
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:29:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBld-00Ac9H-Dh
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:29:25 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9b776-2eae-0a2a0a5409dd-0a2a450c984c-42
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:29:25 +0100
Received: from [52.101.69.78]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9b782-f479-0a2a450c0019-3465454e4cbb-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:29:25 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GVUPR03MB11404.eurprd03.prod.outlook.com (2603:10a6:150:35b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:29:21 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:29:21 +0000
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
 b=GtEAFNoww+Z+BgFz+PeUyQDbtE5moWgXwqw9Wdqs21SMAWkfymIKr9/2oKq3sHC11HZVEaiu0Zt0jgvH79nb64Xl/xLhK4UDIWHURhh0bbpFRxGhVPFsH9CDR4hey4rYlZneQRwMKaMO2PcSiRJUckeYbrhKBJK1TgKmDlQNkqna8ERP9ClFvZUp7FT2xIGq0zru30CqPh9JTz+gBy5E0LcoVaLcrnqW0wki3VJn2pE9cUPCmHggQABMeshh1QNLi+ac3RYtSu5VrvR1ToPJiXBoBbsr7hj55jqIaz8jNHfOwLdRt3CSAK9EYv/UtjFB5RBcYJmEMBHlGya5YDXXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmyJV2z2i0zx/4g7jYycmEWq4+mTFreYVSl+ZBWxbtk=;
 b=vVfK3vXSBiZk2KUU+tHNahalpyVP9t/GiDA2yezxkv/0JLs6Gg5fri23uRq6mCL6GrEq7PLdv1G6Jmu7P+eJRjMTVp78BOu2KONVgPrXsAhwDz1oAH9PiFGhuPspe0RA3LJOWLguW+Eapt+mwT/H0lg7iVK4g/GU3Ov3eCfXofrtEBf2bKGVjVuGzP3EJh2EQDZPNxlngABZYLuZEqGfPy0enFzErHv4rsJU6JritYmqw0Hbq7pNr+0p+vIvTmSzPDOGjCwGEArRtvHmQSo3EzN3JN8anc44BhUuW0XpRzUR+ljeFs0zjIVg7oAUr9OFbiCrgYVzgsPl9mfiAo95Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmyJV2z2i0zx/4g7jYycmEWq4+mTFreYVSl+ZBWxbtk=;
 b=PtM4e2cBedoZ9bICZ0ts+WBGhYLuU++gwBowTB1+K3iDoiU3fP468PEagISyWr8yjovsEORikkPpoO8dq1frWo2kpyqz70L6yDl1giFsyW5yiMhZvjRl3pKzFawJF+vlOFBFPoorh8XQGyl1LErDyxJFC+sGP8mH03IIQauout29k3Dbw2wJKiywqaSIR0+BcpHH4s3nP9+OOx+DC5eto1Qn8wqLm+VO+TXo2wdYHNuD8GV3CaJvgJ9ffrNRJv0IsVLbavSIDwcTYDkoMUlefm/+cRoArtJdq0ZaJpDQwNtv1NzPVPYrmXTzsvXkvgcVMbmmYlGFd+7VxA2UvymHgQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>
Subject: [PATCH 4/4] automation/eclair: deviate MISRA C Rule 11.8 for xfree()
 and vfree()
Thread-Topic: [PATCH 4/4] automation/eclair: deviate MISRA C Rule 11.8 for
 xfree() and vfree()
Thread-Index: AQHda34w0w1h9rHZXkauKb0cj6wBhQ==
Date: Tue, 3 Nov 2026 10:29:21 +0000
Message-ID:
 <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GVUPR03MB11404:EE_
x-ms-office365-filtering-correlation-id: 61a15adf-f0a3-4e1d-cdf9-08df399552d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|42112799006|6133799003|22082099003|10067099003|56012099006|18002099003|261009223027099003|261102123227099003|261021123027099003|261022105027099003|261021121427099003|11063799006|38070700021|261026121527099003|261026140227099003|261028144727099003;
x-microsoft-antispam-message-info:
 6Jnt54jObGV8GasljM3L2pHjXV8fmXNohqE4wQ0h+UHRjCpcPkhnk2UOzmsDjK68r/jydLP0sqWN3eDgCxCq+S1MKW9yXnA1CA7veFi31fXy50RlPneV8aPwXLRf8oyDxTXjp2Y46VC4BOfLpLPU3D7Hn7Ux1p5YaxtaOhxyzbEFatlTS6f8M0ZkL68P0U0FCdPpB5tOQ/vRcco2Spj/qeiEOHF/KasNB46e8kqohBkHseIp6eRXLED6zsGBZfk1R+YiPaPafnt2FbTLHv99WyoyA/p92oSNZTPN97dciCLllcFy+C1sZc6OfgcM3VHfAdVsJAWHW+tiSwuiNtrPOKNqavYtYU0Yz3o94t/XRjkxCdsSj+HYdiG7mVXc9clGVgF/2mvu0dd2rVlVn0m2oBDu4mVd+tkx2lAEiZCWRIZ0g2OP/q3O63x0mgaPAMGIwi/a6wF4waxBSNFtPo4EG+7RkUIqN5YDhJ7zW2HEdeG0h3D+TYIknGzuasvCecj9gY/rjXf3SVwdhBRTWCpzAiNEHjehh0mQK2/KyuLLjyPzKr2LdTWxTZ+weETEmAFl96Ldp/dyAVkNbV6yIqKMtLCt7gKL7BRVFBzBAqTRzx1HMcHhnFPFAsirWaWD1S6LmApDKqJKJ4FNt3sXI7qgCVhG62c7pyEf119deVJNfl7r1zFhHjOfc8H2PibONn0EUwuubZo1p/tLMvkXia5kJ7cJVSL3v8nz7MrpA/m1r4s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(42112799006)(6133799003)(22082099003)(10067099003)(56012099006)(18002099003)(261009223027099003)(261102123227099003)(261021123027099003)(261022105027099003)(261021121427099003)(11063799006)(38070700021)(261026121527099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXBHcUI3TmFPWWlwdldKOGp4T3B0U1pmdUtTaTZnd3I1WE43OWlXNXlLbGFS?=
 =?utf-8?B?dTZwb3YxWHdGMExQY21HSlo0SnVJZUg3c1NtbHRUMDJ6QXJpVWlYdUNFNENi?=
 =?utf-8?B?VTlsMzBhSjhTUWtoS0NqRjhxSkI5S0Z5V2s0RFNzNGZLMzQzVjdmSmtjMDJQ?=
 =?utf-8?B?RmpxLzhIak1KSkxZcHdlMm93ZTR1ZzN0THBzTVJsZzN3c0hEYnJaejdsQnpZ?=
 =?utf-8?B?YXVTWnpHZldlc016N1YwTVRFVzJISk1oZzBDU2x1YXk5aWVZeXVqV2NHM0Fj?=
 =?utf-8?B?VkozYVhodEY2YnZ6eGRhamlvcGU3bzRDU1BIVllNd1VmcG5ndzUxTVVMTGk4?=
 =?utf-8?B?QlY1VWNBLzRGQ0hYNUFPUHMrUE5HQTl6Nm1pWU9nOG9Cb3RTRjg0UmVienAv?=
 =?utf-8?B?Vi8zY25lblU5TVQvNXEzd2l4TEc2cXQ3aUhBNHlBcXowd1RWazVzSDhKMUNw?=
 =?utf-8?B?NkhMWG43N2NGbzFKaWRSWjR1L09udUpMeHQ0WDQwTC8vUDhDa0g5Wm5sS0pG?=
 =?utf-8?B?bjBoM3ZidldFN0tRR20wRXRnTnhmbUxKKytlYzVEOFBya1poeWJQemFSZmRJ?=
 =?utf-8?B?NnhHV3k1dTZWQ2p4b001SXlPaXljODdQYnN2enVyTnBHa2FIYnlSaFczdTBh?=
 =?utf-8?B?WlUwdytzbnYxUWIvSzJRVllqT3ZwcmF1MXA2ZUNDQ2lwM1hjeDZYa3B4SE5M?=
 =?utf-8?B?Y0o4dmN0alRyUW5PTzFoMkEvNjc1VWJNcDVaL2tWVzFmamRjeXlsYTRiMVBw?=
 =?utf-8?B?Lyt6RDFGSDlVbmFYdkNBSW9UQmtkbjNWVitvaWN2VlhlVDBsbGhkUFRldUdO?=
 =?utf-8?B?MkNzSXk4cGtEVUpiVTRpRUVqdy9pRzJmOS9IMnI5ZHNoOGpvREc4K2x1NW1I?=
 =?utf-8?B?bUR3WVJNNUs2dHpUdFZKbnNBMVgwQy9tZ0cvMTN0cFcwVUtHYno1R0Myc3NK?=
 =?utf-8?B?QjQ3RE9XSGJkcUFhTy95RTJjcUl4eUZ6dG9CWTZzckF1Uk9sRXlBejVpT1Ra?=
 =?utf-8?B?Q3JncFdRRGNTVVYzUmlDcllzSHZ2cWo3TGNpNTlESnlTOS9oZHpCck1WWHVq?=
 =?utf-8?B?OXNIcGp0bU9EODdNR09tRHpNaGdiaHp4dm1mME9QL1dTNjIxRVhyTitnWXA3?=
 =?utf-8?B?d0dCb202MkxuNEJLMmRzcUJWTlBHQkg3T0ZuKzFYQUE5dXZGMC9oRXZmVFJQ?=
 =?utf-8?B?eTZVTHF3WUtqcmxZRnExL2pRVWJ1M3dNQXlOY2NNNVFLUjBXaDcxdyt6K3hQ?=
 =?utf-8?B?SEpjN3BBaVd4dTNBMXZvTjd6QkxaUldFZERuNHUwS3RvZUVIQ2Jxd0RhQk55?=
 =?utf-8?B?VmU5eFFhRWRHVThsVWdDbHYyeDlaMmxYUjVnVkVWNUJGMldmV0FQNFU4MDJI?=
 =?utf-8?B?cWxBYXhuUHRydTBic3ZyajVXVTdXc2ZKK1d5RU5TRWxQMlgxOEQxNGlXMDhu?=
 =?utf-8?B?TWRaUFB0U09KdFAyZ3NzUDZmUjdQRXhNZU8zbkhxTnArU05yZ2cyRkNUN1ZN?=
 =?utf-8?B?U3l6c1dJYmtnbVV2QmZha0VPVVRESXFodU9TZzNvdUZtVnB0Y0N0Tjc3dGZS?=
 =?utf-8?B?ajhNUGV6RjZ2VWVLb0hob1NtbklHOFlNWkNpSStCS2hGcG5QWXJVekVsVjNQ?=
 =?utf-8?B?eGZkNXVtbWJncnhKVk9Hajg1TEFjcmw5czJLcllSZDlweXgwc3BFYnVoTDBW?=
 =?utf-8?B?WmZBZ3p2aG9ldlg5Qi9WbDB4eGdSL1huZ3VmbndQbWpPZmJOb2tYajlkY0I3?=
 =?utf-8?B?TW9vRVBrZHdsYnpOZGpZUUtsd2c1OGpLY0NOejJRUE83RFRPWkNaZEVPcHBi?=
 =?utf-8?B?Wm94dlJGSDlnTWxmdENuMDlDWUxmcWtoY21wZFVQbVU0TnBYczlPdGxNazNw?=
 =?utf-8?B?RXRUcXdqZmxjdjZSaEpsOHY3WGxOaHFERWtIeGllM1U3WUJ0MXBCVE5PK2Fn?=
 =?utf-8?B?eXNQZXNBWERpL2tqeEdOaXJnRCtJM1I4QVlQa0E0SEhqS3d1WVJybE5MdFNY?=
 =?utf-8?B?Z01CQ1FlTklhWVBnUFRkV1BSN2g5Rk1qNkZSQTFZSERqOEJaWFpsMkJtQTd6?=
 =?utf-8?B?SXRkVVViK20xWUZFeTdUeU82UDVpaEUyZU50b1dRdnZISnExd1VINXhnc3kw?=
 =?utf-8?B?cVJ2SmIzTWF3OThrM1ZpVEdRcDRseWIzRzlWOStPTTlGR1hNMkd1L3dTSURj?=
 =?utf-8?B?Yjh3R0lERmZaMFZyNlpVNlpCeWMrazkvZVg1WE1mNjhCaGFJc0pFMXlCV2lY?=
 =?utf-8?B?NFJBcGlvWUFrUnpZaGZvcG8yNE1IVWVVRUs4UlRhMUNkWXROd2tGNEVLMFg4?=
 =?utf-8?B?SmIvWlFXWHl2Y1pUd0dEUnVzbnhmTFlpVDRhVU56eFBWY0gyeHh3c0FpeVBa?=
 =?utf-8?Q?OieSbv9HIQMi2YoA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a15adf-f0a3-4e1d-cdf9-08df399552d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 10:29:21.2511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Y8EkspfnVfgwWC8YWPlsU4IOGs1CQW+j/igTmAP9En+2hrLTW//LEAGjxA+Z6v5/L+ZVHyJDRPlXSnziBIoT7hI4AYiWLMi789wfhiFygs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11404
X-purgate-ID: tlsNG-d25034/1793701765-036D6A5B-09B49C8A/0/0
X-purgate-type: clean
X-purgate-size: 4738
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TGl2ZXBhdGNoIHBhc3NlcyBjb25zdC1xdWFsaWZpZWQgcG9pbnRlcnMgZnJvbSBzdHJ1Y3QgcGF5
bG9hZCB0byB4ZnJlZSgpDQphbmQgdmZyZWUoKSwgd2hpY2ggdGFrZSBhICd2b2lkIConIGFyZ3Vt
ZW50LiBUaGUgY2FzdCB0aGF0IHJlbW92ZXMgdGhlDQpjb25zdCBxdWFsaWZpZXIgaXMgYSB2aW9s
YXRpb24gb2YgTUlTUkEgQyBSdWxlIDExLjguDQoNClN1Y2ggY2FzdHMgYXJlIHNhZmUuIFRoZSBk
ZWFsbG9jYXRpb24gZnVuY3Rpb25zIG5laXRoZXIgcmVhZCBub3Igd3JpdGUNCnRoZSBjb250ZW50
IG9mIHRoZSBvYmplY3QgYmVpbmcgZnJlZWQsIGFuZCB0aGUgb2JqZWN0IGlzIG5vdCBhY2Nlc3Nl
ZA0KYWZ0ZXIgaXQgaGFzIGJlZW4gZnJlZWQuIERldmlhdGUgdGhlIHJ1bGUgZm9yIGNhc3RzIHRo
YXQgYXJlIGRpcmVjdA0KYXJndW1lbnRzIG9mIGNhbGxzIHRvIHhmcmVlKCkgYW5kIHZmcmVlKCku
DQoNCk5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCg0KU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tv
cGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCi0tLQ0KIGF1dG9tYXRpb24vZWNs
YWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbCB8IDcgKysrKysrKw0KIGRvY3MvbWlz
cmEvZGV2aWF0aW9ucy5yc3QgICAgICAgICAgICAgICAgICAgICAgICB8IDcgKysrKysrKw0KIGRv
Y3MvbWlzcmEvcnVsZXMucnN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKystDQog
MyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYg
LS1naXQgYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wg
Yi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCmluZGV4
IGM3YTgwMGM2MmYuLjJmY2UwZDBmNjggMTAwNjQ0DQotLS0gYS9hdXRvbWF0aW9uL2VjbGFpcl9h
bmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCisrKyBiL2F1dG9tYXRpb24vZWNsYWlyX2Fu
YWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KQEAgLTQ1MSw2ICs0NTEsMTMgQEAgd3JpdGUg
b3Igbm90Ig0KIC1jb25maWc9TUMzQTIuUjExLjgscmVwb3J0cys9e3NhZmUsImFueV9hcmVhKGFu
eV9sb2MoZmlsZShodm1fZ3Vlc3Rjb3B5KSYmdGV4dCheLipfX2h2bV9jb3B5LipIVk1DT1BZX3Rv
X2d1ZXN0IGRvZXNuJ3QgbW9kaWZ5LiokKSkpIn0NCiAtZG9jX2VuZA0KIA0KKy1kb2NfYmVnaW49
IkNhc3RpbmcgYXdheSB0aGUgY29uc3QgcXVhbGlmaWVyIGZyb20gdGhlIGFyZ3VtZW50IG9mIHRo
ZSBtZW1vcnkNCitkZWFsbG9jYXRpb24gZnVuY3Rpb25zIHhmcmVlKCkgYW5kIHZmcmVlKCkgaXMg
c2FmZS4gVGhlc2UgZnVuY3Rpb25zIG5laXRoZXINCityZWFkIG5vciB3cml0ZSB0aGUgY29udGVu
dCBvZiB0aGUgb2JqZWN0IGJlaW5nIGZyZWVkLCBhbmQgdGhlIG9iamVjdCBpcyBub3QNCithY2Nl
c3NlZCBhZnRlciBpdCBoYXMgYmVlbiBmcmVlZC4iDQorLWNvbmZpZz1NQzNBMi5SMTEuOCxjYXN0
cys9e3NhZmUsICJjb250ZXh0KHNraXBfdG8oX19leHByX25vbl9zeW50YWN0aWNfb3JfcGFyZW5f
Y29udGV4dHMsIGNhbGxfY2hpbGQobmFtZSh4ZnJlZXx8dmZyZWUpLCBhcmcpKSkifQ0KKy1kb2Nf
ZW5kDQorDQogLWRvY19iZWdpbj0iVGhpcyBjb25zdHJ1Y3QgaXMgdXNlZCB0byBjaGVjayBpZiB0
aGUgdHlwZSBpcyBzY2FsYXIsIGFuZCBmb3IgdGhpcyBwdXJwb3NlIHRoZSB1c2Ugb2YgMCBhcyBh
IG51bGwgcG9pbnRlciBjb25zdGFudCBpcyBkZWxpYmVyYXRlLiINCiAtY29uZmlnPU1DM0EyLlIx
MS45LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYW55X2FyZWEoYW55X2xvYyhhbnlfZXhwKG1hY3Jv
KF5fX0FDQ0VTU19PTkNFJCkpKSkiDQogfQ0KZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvZGV2aWF0
aW9ucy5yc3QgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQppbmRleCA3NmJlNmIzMjUxLi5k
OGQwNzRhZTFhIDEwMDY0NA0KLS0tIGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KKysrIGIv
ZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KQEAgLTQ0MCw2ICs0NDAsMTMgQEAgRGV2aWF0aW9u
cyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCiAgICAgICAgcmVhZGFiaWxpdHkuDQog
ICAgICAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJUi4NCiANCisgICAqIC0gUjExLjgNCisg
ICAgIC0gQ2FzdGluZyBhd2F5IHRoZSBjb25zdCBxdWFsaWZpZXIgZnJvbSB0aGUgYXJndW1lbnQg
b2YgdGhlIG1lbW9yeQ0KKyAgICAgICBkZWFsbG9jYXRpb24gZnVuY3Rpb25zIHhmcmVlKCkgYW5k
IHZmcmVlKCkgaXMgc2FmZS4gVGhlc2UgZnVuY3Rpb25zDQorICAgICAgIG5laXRoZXIgcmVhZCBu
b3Igd3JpdGUgdGhlIGNvbnRlbnQgb2YgdGhlIG9iamVjdCBiZWluZyBmcmVlZCwgYW5kIHRoZQ0K
KyAgICAgICBvYmplY3QgaXMgbm90IGFjY2Vzc2VkIGFmdGVyIGl0IGhhcyBiZWVuIGZyZWVkLg0K
KyAgICAgLSBUYWdnZWQgYXMgYHNhZmVgIGZvciBFQ0xBSVIuDQorDQogICAgKiAtIFIxMS45DQog
ICAgICAtIF9fQUNDRVNTX09OQ0UgdXNlcyBhbiBpbnRlZ2VyLCB3aGljaCBoYXBwZW5zIHRvIGJl
IHplcm8sIGFzIGENCiAgICAgICAgY29tcGlsZSB0aW1lIGNoZWNrLiBUaGUgdHlwZWNoZWNrIHVz
ZXMgYSBjYXN0LiBUaGUgdXNhZ2Ugb2YgemVybyBvciBvdGhlcg0KZGlmZiAtLWdpdCBhL2RvY3Mv
bWlzcmEvcnVsZXMucnN0IGIvZG9jcy9taXNyYS9ydWxlcy5yc3QNCmluZGV4IDVmOWZlNGM4NjAu
LmRlZmY5NDdjNGYgMTAwNjQ0DQotLS0gYS9kb2NzL21pc3JhL3J1bGVzLnJzdA0KKysrIGIvZG9j
cy9taXNyYS9ydWxlcy5yc3QNCkBAIC00NzUsNyArNDc1LDggQEAgbWFpbnRhaW5lcnMgaWYgeW91
IHdhbnQgdG8gc3VnZ2VzdCBhIGNoYW5nZS4NCiAgICAqIC0gYFJ1bGUgMTEuOCA8aHR0cHM6Ly9n
aXRsYWIuY29tL01JU1JBL01JU1JBLUMvTUlTUkEtQy0yMDEyL0V4YW1wbGUtU3VpdGUvLS9ibG9i
L21hc3Rlci9SXzExXzA4LmM+YF8NCiAgICAgIC0gUmVxdWlyZWQNCiAgICAgIC0gQSBjYXN0IHNo
YWxsIG5vdCByZW1vdmUgYW55IGNvbnN0IG9yIHZvbGF0aWxlIHF1YWxpZmljYXRpb24gZnJvbSB0
aGUgdHlwZSBwb2ludGVkIHRvIGJ5IGEgcG9pbnRlcg0KLSAgICAgLQ0KKyAgICAgLSBDYXN0cyBy
ZW1vdmluZyB0aGUgY29uc3QgcXVhbGlmaWVyIGZyb20gdGhlIGFyZ3VtZW50IG9mIHRoZSBtZW1v
cnkNCisgICAgICAgZGVhbGxvY2F0aW9uIGZ1bmN0aW9ucyB4ZnJlZSgpIGFuZCB2ZnJlZSgpIGFy
ZSBwZXJtaXR0ZWQuDQogDQogICAgKiAtIGBSdWxlIDExLjkgPGh0dHBzOi8vZ2l0bGFiLmNvbS9N
SVNSQS9NSVNSQS1DL01JU1JBLUMtMjAxMi9FeGFtcGxlLVN1aXRlLy0vYmxvYi9tYXN0ZXIvUl8x
MV8wOS5jPmBfDQogICAgICAtIFJlcXVpcmVkDQotLSANCjIuNDMuMA0K

