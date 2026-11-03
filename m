Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F70A606B130
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=dBqlSv/w
Received: from list by lists.xenproject.org with outflank-mailman.1469433.1678258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBlb-0000td-4h; Tue, 03 Nov 2026 10:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469433.1678258; Tue, 03 Nov 2026 10:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBlb-0000tW-12; Tue, 03 Nov 2026 10:29:23 +0000
Received: by outflank-mailman (input) for mailman id 1469433;
 Tue, 03 Nov 2026 10:29:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xOBlZ-0000gT-SN
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:29:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBlZ-0030SG-8n
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:29:21 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9b772-e002-0a2a0a5209dd-0a2a4502ebcc-32
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:29:20 +0100
Received: from [40.107.159.106]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9b780-6ca4-0a2a45020019-286b9f6a61d0-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:29:20 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GVUPR03MB11404.eurprd03.prod.outlook.com (2603:10a6:150:35b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:29:19 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:29:18 +0000
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
 b=y7kJizY+OehPe2BMuQ9QdTww+BEzUZyu7+jzAopMnhd/YoSnBV4nB8Zb5PfapptH+vM3Ub2ToQI956QEQ4ADIj+FfdAfYXMxqdWPO4lohLm6Y/iXja6Nj6D9NSvcRMsQbtA+JogroJGnmUjyehZ/KV+nZ9AkRm2PHWJxAuiYz1kJ9S6kL/2CjgC9yQN/byj//lFU3BQLlBdYw32tRgPMhK0Vt1FhpDHd07RKsfKc+ZfY6Yq4lmVvEqVTXPmrpL2AzHmzmu32QCulw+gvrpl+vbaWMjOHacFdD56b/mQXJvWi/4v3wxHYEFBXnIJ3RrNo6e3XuxKl6+53mxTvRRtYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmiPFQmUYyT/jB4MHBpHaH92O7sxAxWv+3/3HBRBYL0=;
 b=SgdR14f72OX7oOoIQ+9dcfmGKfhz4pKbwXhQb63iliNLNRNgwoIsmAFzXAEh85CM0FOv56xqtJAfL50Ps++s/bQv2CjY0Qnl4JkKeNLZtV2FHIM5Ip4rBwtt56ULmw/zgLPze8D9FP0PIOSz61bSaPyY9XZhPfAx5ZOJoiw3JBkUrq+o8rEPpTwcEtDB4wIrZ1KN2ZntGKqCDWTuYZ38OigmEBDPmpM2rsIWRRrtU6OjJgZwNyIJ2PlsCLlG0wuFD9npphkXqeVxBp5HNnNM7nsNzezHMkU+DTHNjzPkprImIDPaQg5DV4iAgs5iaBzWShaC5ushfYGiYmEZKntaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmiPFQmUYyT/jB4MHBpHaH92O7sxAxWv+3/3HBRBYL0=;
 b=dBqlSv/wekfFdf4QVBZFp5go/7pXg7wXQ4d7gePNsglZTCMqk9CFIV8OaUrAAMWO2ewu3QheXDL3yUzBoic3dq5+G9sYYaQg7FHcMoSKVCA0YUpNuY63oPQ9q+CdnirApy0CIk5zCsjdQ+b5IHpwtrMPqT2HlbV+QjflR/efaLcf9aApndH1xCEPO6TvVtRUugKm6uSFqPnMVIXVvG8BBt7TQTiZ96729vVqa0Sw2QX2o2/mrOeLiMrW4Z5TKiFAkPZNMilSQswPVwWfbL5Uoa+lfWzOoqrtmiXibFaOt3gT+x21DST5EkfgmiIPojGbjQPzUyYlmJghEAgF3sb/Mw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/4] xen/arm: acpi: resolve MISRA C Rule 11.8 in
 acpi_xsdt_modify_entry()
Thread-Topic: [PATCH 2/4] xen/arm: acpi: resolve MISRA C Rule 11.8 in
 acpi_xsdt_modify_entry()
Thread-Index: AQHda34uogvF1bUNYUC6rEVk8qUrxQ==
Date: Tue, 3 Nov 2026 10:29:18 +0000
Message-ID:
 <3533b0c51c28689ae7ef05cf8ca88b49d72eba5f.1793699713.git.dmytro_prokopchuk1@epam.com>
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
x-ms-office365-filtering-correlation-id: fd81a79e-4e28-4232-0e0d-08df39955174
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|42112799006|22082099003|10067099003|56012099006|18002099003|261009223027099003|261102123227099003|261021123027099003|261022105027099003|261021121427099003|11063799006|38070700021|261026121527099003|261026140227099003|261028144727099003;
x-microsoft-antispam-message-info:
 eV58Wv17TNV53z8SMf6hhGVFYO0C8ITm08Z0qmqLfvnSzoNunZfdb/AIYZquxI1A/WOAi/Y8RgXiKfiHIgLzDkDCiF0awKd/qrmCL02vUiha3/VAyFiAn5ttptuPv8jW8Mdm0hHk2KF8svpJrV1x05BLkuyEtFFUPF5zfk7cg55diRblySdskkdKoo+3UAFSnC9YdAyu1+FkylBqZjM1QuPO7EEiAf7zQ4yZNTKUngzQZSHY6WaVfIbhairMUXMIkfD/uuEdgcQY9r7s2ayF7dwQS8s3WdQ/6x89hIZBKokB1iee3PQiWnpwjV2YxrKy1NRwBPH9JeeayIiQsHAHBELxdWWse8T0c4rhFpQm+Nc3PaqFzxOifn4Nb8sk4Tsi7pc0juD1MeMOGwb/D+vz4rCbSohtXt8AczvOdtQDEJsI9Y1I5EqKeTUxcJjdgcmFpuIgglwjZyg9fp6dCM1rvWl3mzkA6iEZvJxcDn+nDsl1Wlo0WUu63HIm/Bza5GsI6q82XS2D98X+1IaJS3u3AE8UkOnQOgYP0YKZCbg/yoFhJkoudsn2sgYnJQ6W9IG9Oq3COP6kylfwRiJJ5JU1id9J2OweKVtfQHTylGFwXce6GWhXiNQ7N0eo/HR+R9ITg14E9xUqRGCwsWoLFZeV2xT4pmEGYLXPDZlbbG4s5bk2zk/B86bZSe6F4oiifF60M/w4SqAOo2VjdfzADODgxYB7gUCxd0Wyp65mH6x3UtU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(42112799006)(22082099003)(10067099003)(56012099006)(18002099003)(261009223027099003)(261102123227099003)(261021123027099003)(261022105027099003)(261021121427099003)(11063799006)(38070700021)(261026121527099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2hmd1p2M1VNRUI3NWFIVkJFQml3SkRORTJuWlNRaitPVFRnWDRZNEQzN2F1?=
 =?utf-8?B?YWVIMk0xUXdya0RPSkp6Y05DUENFcndWVVdQN1lqSmVZRTY4TTl5MEhXZTFv?=
 =?utf-8?B?QmJsbHZMaUtkTyt6bElrMzBKSEg2Q0VDVmd4RmdxZFRhclhaTmJmMGxCNXRK?=
 =?utf-8?B?YmJ0RTc3WkYwWWRuMFhMa3RCcVo2d2hFcFN4dmtJb3VvaTdRVVNBZlNuaFdY?=
 =?utf-8?B?cGZ2bGlkQThDVVQ5WE5HL0R3U2dUVUhMZzN3NHdyY2RoRXdFeWJZOGFuekRD?=
 =?utf-8?B?QmF4cVhLQlp2M2pRMGVjY2cwcXBrOFlDcGp5L3Y4QmJhUzJZOWRxUjN6aXgz?=
 =?utf-8?B?b29HZ2lyOWU1dmJBY01KK1VudUwrejNaNkNaTkFNRlIrTDFZWW1pcU9vSG04?=
 =?utf-8?B?c2x6M0hiR2gyZ21DQkd0NnJMNkFnOE1oRWp5blVkbFZKSFRHTDA5ZVYxS1lw?=
 =?utf-8?B?V1NkWUh1MndsNnZGd0hZOUx0YzVGWFdvUUlhbnpGQ0Q4bFU1Y1hPcTEvTlRS?=
 =?utf-8?B?WlBHQnk1MUF0SHlsTzl6VS81Wnd1N2FOT1FCOHVZQ2xhcHpoS0MwS0FINFpi?=
 =?utf-8?B?WEVQbFpocFhsdlNoK3Z5SGFxYVNsd2tod2RhV2pNL2crMTVWU3NLWHFpUXE1?=
 =?utf-8?B?ZlhRRFNyOEJjbC9HL1ZUU0kvUy9nWkd2enluRHFCU0ZnK0s1UGo1bWpvM1Ro?=
 =?utf-8?B?VlNMV2Flc2dVVmw2cXM5YVA0bGVUYjA1UFJ4Z1loUnFXcEhiRGpmVEJjZVlI?=
 =?utf-8?B?K1J3Mjhzb3NKdlV6SjlTSmNYd1dHYUJReTNiaVVPdDQwTlBaMlNHZitHcm1L?=
 =?utf-8?B?dHc0YUNVMHpQdzBvSXVZckg0K1BkU0U0TmYxSGJEamdMNHdmcXZWUXNWZU5o?=
 =?utf-8?B?bkxrK2JLOUFwMnpRdUY5TXZxNWUyUG1UWFN2RzhZL3cxbm1YSEtuSTBFQUtQ?=
 =?utf-8?B?N0FWbHE1V3BEOWFhWkhxQjNJSWtFS1A3SEh1UEs4L1J4b2xPdGw0NTJrYkZ4?=
 =?utf-8?B?TGFvaHZyYjhOUHV2OXVKTnhDVkhDWUNHdGlMLzM2M0w0ZnRFenQ4bkZGQ0ND?=
 =?utf-8?B?ZFMwSHorWkZOM2M1RE94UHM4aWtsbjZDYUVBUjBVOXZTR3NaT2tOa3hwbnRx?=
 =?utf-8?B?MlZOS1o0T3VCN1EwQi9xY1RPN0tUL2h0Yk5EeTJIVHZnUUt2OTFTNzI5cHJC?=
 =?utf-8?B?YjlYM3VCdW1SSkc1SWR0Kzk1R1dEQlo0UEZGT0dxaDhyckdZZzRvbmxPWkhv?=
 =?utf-8?B?UytpYWpyWDFoS1hwRXNkdFMxdDEvYmRuK29jV2VmTDJkdmxjbzdPWVNpRWw0?=
 =?utf-8?B?UWExenU3UTZyYWJoZ0E5elFneGk0V3RFT0RGTUFwWXZRZ1RwK3hFZWh3Rm1S?=
 =?utf-8?B?YnA0WG9EOFpMSk9DY2tZKzdERG9rWTV1WGVsWHJCOTZjNGxOdXVqekxwTGhP?=
 =?utf-8?B?RWdYT2NFR0VKY1hod01taWpXbmRqbmNob2JCSHFWNDBPelh4TDJHdmlBdlla?=
 =?utf-8?B?SzhmcVZpKytsZDFPM2dWMGplNGJ4RHg2Z3lFdjNLV3ZOUW9ZZjRET0hmQUg3?=
 =?utf-8?B?bEZyNDU0TFhmbEk2YndjNk0vN05lOG5yeUo4bHkrYURGYWRiaU1mamJOYnRB?=
 =?utf-8?B?WUZRWE0yVG8vckg5bkc1SVorL3Y3Y2JISDh5UnBkenlqdm5UYmpjcFo3WkJO?=
 =?utf-8?B?RWw4WXNsb1RMZE1kZk56QmxPTko2b1hLUFRONTB0cjhsUmJVNW5ub0lRVmRk?=
 =?utf-8?B?aHhreWdSYVBJSWpVQ1k0cko2RXV6YUpVQUZFK2oyMTNuWlZaVXMvU3ViTnFl?=
 =?utf-8?B?MmY4cmxoOU9xRUd4Z2xYQVkzNFpQTDk3VWFyODVmK01RYnc3Q2w0eWVCNGM5?=
 =?utf-8?B?NjllV0podXI0cUJLalNxMHhHRi9WcklGRElCdElOOEFtanhtbHUyNUhmMXZG?=
 =?utf-8?B?dXBOQ2VtaXJUcDhxcVYvN3I5aDF6ZU5DMUVFQUl2cFVWZTNiUkdndXRyS2tx?=
 =?utf-8?B?YWR4R2Nibm45Y2tzTDdESlNxdkpxMDRpUlU3T1k4NUVmMElYTmM4MDZZQTlj?=
 =?utf-8?B?TG1VZWFkcWRzZzNITFM1emJaa3kvTkhJTUppY2VTSWtSYnBSN0hQdVd3cmh1?=
 =?utf-8?B?VCtZSzlqOUtreGlodzE3MXYzZjdMSU1mQ1k0cThtdDN2QWNMT3YyQ2xHLyto?=
 =?utf-8?B?SVhkVXFVZ3ZuaUFadStCY1EyVVVsS3lUTkkySEF6d0lUdjcvS0ZMQWp5MUoz?=
 =?utf-8?B?ZnBaT2N0Y1F4NFQyVGd5ZzF4d3lJV1lSRG5kajFyVEROdTlPbkpRYUNpWjJ5?=
 =?utf-8?B?SFl5WlZER3QwRlo2QUFMdVdnWFJoRTdsSk1WTTF6R2VrWkdEWGJXcG1rbml6?=
 =?utf-8?Q?7Sv1LK2y3qknryxE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd81a79e-4e28-4232-0e0d-08df39955174
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 10:29:18.9353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTgBvBoA3s4VWvEcIcjPDOy04L4TaxpFANrneSnyUCRADsrlDogPSwHpwcuinNZiYpp95+NjBuvOrX9QYHPemHBuYzAmDkkOGIiNMKZxq2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11404
X-purgate-ID: tlsNG-720697/1793701760-F28B42AC-2310129E/0/0
X-purgate-type: clean
X-purgate-size: 1692
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QUNQSV9DT01QQVJFX05BTUUoKSBjYXN0cyBib3RoIG9mIGl0cyBhcmd1bWVudHMgdG8gJ3UzMiAq
JyB0aHJvdWdoDQpBQ1BJX0NBU1RfUFRSKCkuIFRoZSAnc2lnbmF0dXJlJyBhcmd1bWVudCBvZiBh
Y3BpX3hzZHRfbW9kaWZ5X2VudHJ5KCkNCmlzICdjb25zdCBjaGFyIConLCBzbyB0aGUgbWFjcm8g
Y2FzdHMgYXdheSBpdHMgY29uc3QtbmVzcywgd2hpY2ggaXMNCmEgdmlvbGF0aW9uIG9mIE1JU1JB
IEMgUnVsZSAxMS44Lg0KDQpVc2Ugc3RybmNtcCgpIHdpdGggQUNQSV9OQU1FX1NJWkUgaW5zdGVh
ZC4gSXQgdGFrZXMgJ2NvbnN0IGNoYXIgKicNCmFyZ3VtZW50cywgc28gbm8gY2FzdCBpcyBuZWVk
ZWQgYXQgYWxsLiBJdCBhbHNvIGF2b2lkcyByZWFkaW5nIGEgJ3UzMicNCnRocm91Z2ggYSBwb3Nz
aWJseSB1bmFsaWduZWQgY2hhciBwb2ludGVyLg0KDQpObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQoN
ClNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBh
bS5jb20+DQotLS0NCiB4ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVpbGQuYyB8IDIgKy0NCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2FjcGkv
ZG9tYWluX2J1aWxkLmMNCmluZGV4IGRiMTZmN2ZhOTQuLmE3N2E1MWFmZDUgMTAwNjQ0DQotLS0g
YS94ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVpbGQuYw0KKysrIGIveGVuL2FyY2gvYXJtL2Fj
cGkvZG9tYWluX2J1aWxkLmMNCkBAIC0yNTMsNyArMjUzLDcgQEAgc3RhdGljIHZvaWQgX19pbml0
IGFjcGlfeHNkdF9tb2RpZnlfZW50cnkodTY0IGVudHJ5W10sDQogICAgIGZvciggaSA9IDA7IGkg
PCBlbnRyeV9jb3VudDsgaSsrICkNCiAgICAgew0KICAgICAgICAgdGFibGUgPSBhY3BpX29zX21h
cF9tZW1vcnkoZW50cnlbaV0sIHNpemUpOw0KLSAgICAgICAgaWYgKCBBQ1BJX0NPTVBBUkVfTkFN
RSh0YWJsZS0+c2lnbmF0dXJlLCBzaWduYXR1cmUpICkNCisgICAgICAgIGlmICggIXN0cm5jbXAo
dGFibGUtPnNpZ25hdHVyZSwgc2lnbmF0dXJlLCBBQ1BJX05BTUVfU0laRSkgKQ0KICAgICAgICAg
ew0KICAgICAgICAgICAgIGVudHJ5W2ldID0gYWRkcjsNCiAgICAgICAgICAgICBhY3BpX29zX3Vu
bWFwX21lbW9yeSh0YWJsZSwgc2l6ZSk7DQotLSANCjIuNDMuMA0K

