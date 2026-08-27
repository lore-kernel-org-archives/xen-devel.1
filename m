Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CE9C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:38:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400448.1636110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWYj-0002gw-OE; Thu, 27 Aug 2026 09:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400448.1636110; Thu, 27 Aug 2026 09:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWYj-0002gg-Hl; Thu, 27 Aug 2026 09:38:09 +0000
Received: by outflank-mailman (input) for mailman id 1400448;
 Thu, 27 Aug 2026 09:38:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1wzWYi-0002dJ-09
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:38:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWYh-002LkA-D4
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:38:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a90057f-bab6-0a2a0a5309dd-0a2a450ca456-2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:38:07 +0200
Received: from [40.107.130.73]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a90057c-f479-0a2a450c0019-286b82493340-4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:38:07 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS2PR03MB9562.eurprd03.prod.outlook.com (2603:10a6:20b:599::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 09:38:01 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%7]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 09:38:01 +0000
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
 b=th+imLn7P8Q4jh7KHsShJh9bDfhhF4qcaVWVKV/Mmyum/waR3DlgS/OTMSi5ki5WWt4UXO6tRSP4TgWP+xqdLV1jo6wISULkmQA2MnWr0YvxsFK0di8lL9tG883+LCJCYxvvvwQpJaMsywGEQsly+JhqztR6K4uag0+2a6tjaWB8pR9i2qB7RU2ikVvOyA8Hc0ikRH8TBYfk57nwRl0ZDHBOz0LJaIhgTcplJkR283tIvD8yvZlJkpSs+ylSNKVs012B//giFi7CpunKSja/3vx43C5T/twuhJKZ9BmV60TZ79kQ/cvilHWMGd1lXetPjekAHjbPrbGsgZlyT2LNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwmCA8Q9O7G1J/I8ZQMK0FpJAXxpRT2z/dIkKHMIEdY=;
 b=csHwo+VSS0KUxEI9e2YVMRZZPLSd386074dr+e3pm5JRhGnysqOU1ik9zzYgt0zys6FShPPd1Im2qm/IuA3yE/qbhQJsTxW0otFrTGH2ghnXx1AL2915bb/XVxEOKBcs769GpFTyoy3C4rzlwtneIAu/QzAuqk3LFVEAHCNfwLXU6hI8wPJu0YjuO1+fY1wAeIe2igd72hPanUNUHZxRn06aJm/GeSGbWG7rMIn9gsM7KrG+sB2RRcM4CUxGpXaLf6XHWvuXRzGR3Nyv+kPnk6PfQrcih4HT92CA9yzmYgt8AvqyRV+qAH3PO8aODujfYSrVtK65BUccvjmCIBkkVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwmCA8Q9O7G1J/I8ZQMK0FpJAXxpRT2z/dIkKHMIEdY=;
 b=QPNUg2qIdNp0TrIQxSR8fqMuo+qmvdVhPAhKQLNmp90Sdq50oV/VAqguEWKrauZN3fk+q8xUn0+0Day7zRGLIJHzdHIW8D8SDqvDG7VCtCKqwfHtg+SWO9qXQqPJlj6yoAJFEfaA+bUqcbOeC4QumCQEVCaNdYRv5P8JiJjF3BdFOyrSHMjllYlLUExzox9yItZyqz1SDcMG1xWr2Q2TZNdfOk++WMzRSkfOapExHLG3P0yGXAKqYRoRJSxRj4rhXrQWycuI17jkc0UGShMuiEnrU6VTKDDOgsTnWRS4AYfkpHX5o1mm0ZbCXRO86FtrVbEVHbAsrBlDnX01tDm9EA==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v1 1/2] flask: add const qualifier to
 security_context_to_sid()
Thread-Topic: [PATCH v1 1/2] flask: add const qualifier to
 security_context_to_sid()
Thread-Index: AQHdNgfAVxs877kedUqP8J7OTWLOvA==
Date: Thu, 27 Aug 2026 09:38:01 +0000
Message-ID:
 <ee0ce49467ac1ee1cdd017323e70c8a865269f39.1787821757.git.Sergiy_Kibrik@epam.com>
References: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
In-Reply-To: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|AS2PR03MB9562:EE_
x-ms-office365-filtering-correlation-id: 89c5b2b4-b60f-493a-e12a-08df041ee2e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 kF/7e+e53lgACPHSAqZLCSHvDG60PMc1n7SPk/DRysCE4OHJ527bAAafhlsur/hIXUnRn87EMjn7ihZhRHryOwTeOHkT4cSctVR3+7X4zWUDKs27Uvquk1dFBwSDYnCV51ZH8NSY4hP7pkhIvHNE9cWHWmBFWuqMnEHJPrNdFuMcNHpFfUTxMMmwGCxhZCXmo41/Ez7VEAufqgZgtBTAJ0kEFjzj/HaMoF1YqmWKRONr63vNQczD3BDe01E0WV610q6jkmyHkcouItERTlVoizYZaz+b2Ay5PH1LR8TzxB6UZ9wXKubpI9kDeseHbEgRMbrUnKYQvhgk/pzDcV9qG43+CD4k4m0LRm+CwQiMpW4dtotpqZ7I9iE46nQA7+LNYztaJbzSLPXjdvtnf9H0R291vGbNeiH8737YGAuvasq9V5e8T9O+n2nwhKLvjDrG41RyJPHe0pSuT4KcZkiRm6QX5SllmEX0cqmmK6UsEQnEBr08JhKOepgTzWM2/eLUD+E713fTthWWQtUsMPndHUZwhvXb9SGkwegpN9SBBCZsaMjiAxrZf9iDWdKjN+/332xPo6eFMI05Gu9/oGe2Im78XeZQ3TQB4V1LQji6x8K1g/36sZDwv5NmRD0MY8bXJKnFmaURmnkkltHrea69rpEQYEo2J4XqqO+LYngLWO5AHIZeeKRmy0MkJdxHwnvHs/qYkoIKJTF67L+fspB2l1liACus4pXgkaJbIEnpbu4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXVrYXNqb1Ric3lBQjBzNU1kalFTM2JqTWJuc3FsS29rVTJ5eHF2UUFWcVYx?=
 =?utf-8?B?TlFPdnZFMmJEK2doT2IwRXg2Z1BaRENBblBOc3pQMmNpdWM3MEFmVTh5Wkk2?=
 =?utf-8?B?R0t3dDd0ZGdXVmdQckdxZ0YzbFZhMUJtSU9WNlQxYWdmeWRETXhid2RZZ3Mx?=
 =?utf-8?B?bkpLRFVUWjJsUG9MU1MvRDB1OWdlSkdoTEZzNS9zemVvd2QwM1F1SGpHVGZh?=
 =?utf-8?B?Zm1LRjFxREZxYmFnVHBHbXYvSFNGdUdHa0ZZUUF4VHdwQi9CV1Fwdyt1SXE3?=
 =?utf-8?B?YjdIRitpNUtFeDhwcFZDSHFQTmh2TnFncGtRdGlOanV2SktyV0dQdVRxQ1FD?=
 =?utf-8?B?UWtwUThOTUtjNWRBbDRsRWpTS2NmWTZMTkRLNnEvbEFObkw2eWxycjVjcDJ2?=
 =?utf-8?B?cHJuV3RGMFFFa2plaG5YZnphdWw5WXl1K1VpbXQyTkNLcFVFeDJJbEVpRlNu?=
 =?utf-8?B?bkwxNUpHNUFDRGMvczNlZW5YRXVFdmROY08va05XR00rbUdWeEFpYVFlUzV3?=
 =?utf-8?B?RjNHcXVmS3dPY1dOVFFnb1hXbHNqajVhZDlvak92Yy9GZHhXeUZaSlEvUlVE?=
 =?utf-8?B?eE40b291VFJSRlpaaFBoWGV4ZmR0RmJ1R08xOUtJWnQreklMam9UZkViNnlC?=
 =?utf-8?B?dys5REVIa1IxcndVTUgrMXFzOWVsWXU3TkZLZnh4MlExNGs4ZzRmck1MVmVk?=
 =?utf-8?B?ekxHdkNUVzlvMjNsVW9ORDlsbm96ZE5uV0tLcWxPUWN2UEkwaWtxVVZNYS8r?=
 =?utf-8?B?RHNhSjZBaXA3MlY0UjhEekhnbjFXdUlyTnY2VklrZ29JdVFiMkUyaGxlSUE2?=
 =?utf-8?B?ZTVvak0xN2dEc29aR21WMDNvaWsyQWNIVU44dEFyMStUeHA2TytReGhvUyt6?=
 =?utf-8?B?V2s5TFZxZmZTYUY2REhZMmdlVFRwTlNvdDVWSDJlUThWb2FmQ1lxVTlOMmIw?=
 =?utf-8?B?eHVzMjc4dXVXZzdhYVlkak5XT0x6VkdlOGRRRGJJd2N1SzlISDV1OHlFc3lz?=
 =?utf-8?B?SEUzZWtReUhLUUovRW5UNW9LNmtSTzdsbFVyeXNuam5reFdxenlvczVOdWRD?=
 =?utf-8?B?Q2FlMStVRWRKa1JrVEtndUZpcUE5eTRPeHRBY3k5WDFWQkJhWGRhRFovMnUx?=
 =?utf-8?B?QXcyU0ttTndXVit5dVFUaGNNaWMrVVdqNEhBdUFiczcrWWlZWGJSRXZ4ajQx?=
 =?utf-8?B?NEgxQUZ3czQ1WklFVzJKNWs0N2liVnFQNTdaMUVEcW0zYkliSUlDVjZKM3R4?=
 =?utf-8?B?Y1ZFV0lSKzRYS0p6ajFiQWRzUnFybHNjWnFKZG8yVklKOWVNdktWeFhzbnA2?=
 =?utf-8?B?MnRaejNWY243UDZJdHhGckpJeEo2UWhIaEkrcWZEcFNiMG5zUnFOTElNVlor?=
 =?utf-8?B?bG5kQXUxdm9iUHNKVUxpSmlkM2dGd0MydEtuMVZnY2xhQjRzUlY4THhRVkVy?=
 =?utf-8?B?UWVocGE2cGpkZTRpYXpZclNnek9IR05aR0xLYU5RSER3R2R5VTZTTDNIbysv?=
 =?utf-8?B?ajJCNGVlVmlBWDBkc09ibUFTRUlSMDdPaWpwc3I0eHJKSVpEak5WMHN1aC9t?=
 =?utf-8?B?UVhMT3VHRGVURHFzaHQzQ3lKVWszM0UvQ3o5bURZUUw5WUNmNmJIR2dOdm5P?=
 =?utf-8?B?ajBsWk81Yitjb1d5MUpZNXZRNGZ3K2VJanRySVpGSXAyUTVjbTcrSU5LS0xm?=
 =?utf-8?B?aDViQ21RaTlVUlVpMFVlMU55YWdnYWZRSjlHQ0ZYV3pQTXY1SS9sSlJSSnU5?=
 =?utf-8?B?bVA0dHY2MXRhTmRLMjZuWk95cXZuZm8rcDV4ZTdqSllXMjJaaXQrZGFpSFJh?=
 =?utf-8?B?b2tob0MzSUhOSEhwQUdKK1dkZ3ZqNG5wMVpjeDFSWTN5eDZob2tDSjZ4QUVE?=
 =?utf-8?B?Z0JQMms1MDZ3a0EycHBLV3BaLzdiZjhqc1hVMnhYakZDRWxpTTl3dmJKemgv?=
 =?utf-8?B?dlIyaExKT3JKUjRVYUpFQzVaQTdKM21OdnZHN01LUnJpT2l4Y1pZM2dDejJz?=
 =?utf-8?B?aXoyUjBGc09aQVcwN1BvM1BPWDdGZkdKQUpIWUlHQ2VVdnZMRlNESXlQb3Fm?=
 =?utf-8?B?czhnY1k0eGxkQmp6MmN4WHY2UUxnaWJ2V0tMN2srUFpPOHhzUURNUjg2OExL?=
 =?utf-8?B?ckJqU2VLc1dadUNPU0o2NytzdWczMXVuZ0c4alNMUWJaQjljODMxNW5FOUt4?=
 =?utf-8?B?bUlSTDJQcUZvZUZLNEVqdS9QMnR5amU5VlY2QzdGQWp5OThzQTVVbzY3cmV1?=
 =?utf-8?B?SisrOGE0WU5pSm5NWjgwanFOd28zbk1STEFvUEc5dWhoL255SmYrN1pKYmUv?=
 =?utf-8?B?c2ovMWZ3UzdwLzlUdG84Rm85RWZaZnFHckpRYnUveUY1YXhQOW1TQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c5b2b4-b60f-493a-e12a-08df041ee2e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 09:38:01.1679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZBK9Ka6hD4VPvsoRUC7btbmwLsU1f8OlBOG4LKDXSZyNrIxEbSfqkSy2LSLoV1x4t0yaaRgcJsJF327TljKyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9562
X-purgate-ID: tlsNG-d25034/1787823487-006CEA5B-C45B0A7B/0/0
X-purgate-type: clean
X-purgate-size: 2042

VGhlIGZ1bmN0aW9uIGRvZXMgbm90IG1vZGlmeSBjb250ZXh0IGFyZ3VtZW50Lg0KQWxzbyBpdCBn
aXZlcyBtb3JlIGZsZXhpYmlsaXR5IHRvIHRoaXMgQVBJIHVzYWdlLCBiZWNhdXNlIHNvbWUgY29u
dGV4dCBzdHJpbmdzDQppbiBYZW4gYXJlIGFsc28gY29uc3QgY2hhciouDQoNClNpZ25lZC1vZmYt
Ynk6IFNlcmdpeSBLaWJyaWsgPFNlcmdpeV9LaWJyaWtAZXBhbS5jb20+DQotLS0NCiB4ZW4veHNt
L2ZsYXNrL2luY2x1ZGUvc2VjdXJpdHkuaCB8IDIgKy0NCiB4ZW4veHNtL2ZsYXNrL3NzL3NlcnZp
Y2VzLmMgICAgICB8IDIgKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svaW5jbHVkZS9zZWN1cml0
eS5oIGIveGVuL3hzbS9mbGFzay9pbmNsdWRlL3NlY3VyaXR5LmgNCmluZGV4IGVjOGI0NDJhOGYu
LmEyYzVmNDIzZjggMTAwNjQ0DQotLS0gYS94ZW4veHNtL2ZsYXNrL2luY2x1ZGUvc2VjdXJpdHku
aA0KKysrIGIveGVuL3hzbS9mbGFzay9pbmNsdWRlL3NlY3VyaXR5LmgNCkBAIC03Niw3ICs3Niw3
IEBAIGludCBzZWN1cml0eV9jaGFuZ2Vfc2lkKHUzMiBzc2lkLCB1MzIgdHNpZCwgdTE2IHRjbGFz
cywgdTMyICpvdXRfc2lkKTsNCiANCiBpbnQgc2VjdXJpdHlfc2lkX3RvX2NvbnRleHQodTMyIHNp
ZCwgY2hhciAqKnNjb250ZXh0LCB1MzIgKnNjb250ZXh0X2xlbik7DQogDQotaW50IHNlY3VyaXR5
X2NvbnRleHRfdG9fc2lkKGNoYXIgKnNjb250ZXh0LCB1MzIgc2NvbnRleHRfbGVuLCB1MzIgKm91
dF9zaWQpOw0KK2ludCBzZWN1cml0eV9jb250ZXh0X3RvX3NpZChjb25zdCBjaGFyICpzY29udGV4
dCwgdTMyIHNjb250ZXh0X2xlbiwgdTMyICpvdXRfc2lkKTsNCiANCiBpbnQgc2VjdXJpdHlfZ2V0
X2FsbG93X3Vua25vd24odm9pZCk7DQogDQpkaWZmIC0tZ2l0IGEveGVuL3hzbS9mbGFzay9zcy9z
ZXJ2aWNlcy5jIGIveGVuL3hzbS9mbGFzay9zcy9zZXJ2aWNlcy5jDQppbmRleCAzNWFkMTAzNGNh
Li43NjRhYzdkMWQ4IDEwMDY0NA0KLS0tIGEveGVuL3hzbS9mbGFzay9zcy9zZXJ2aWNlcy5jDQor
KysgYi94ZW4veHNtL2ZsYXNrL3NzL3NlcnZpY2VzLmMNCkBAIC04MTMsNyArODEzLDcgQEAgb3V0
Og0KICAqIFJldHVybnMgLSVFSU5WQUwgaWYgdGhlIGNvbnRleHQgaXMgaW52YWxpZCwgLSVFTk9N
RU0gaWYgaW5zdWZmaWNpZW50DQogICogbWVtb3J5IGlzIGF2YWlsYWJsZSwgb3IgMCBvbiBzdWNj
ZXNzLg0KICAqLw0KLWludCBzZWN1cml0eV9jb250ZXh0X3RvX3NpZChjaGFyICpzY29udGV4dCwg
dTMyIHNjb250ZXh0X2xlbiwgdTMyICpzaWQpDQoraW50IHNlY3VyaXR5X2NvbnRleHRfdG9fc2lk
KGNvbnN0IGNoYXIgKnNjb250ZXh0LCB1MzIgc2NvbnRleHRfbGVuLCB1MzIgKnNpZCkNCiB7DQog
ICAgIGNoYXIgKnNjb250ZXh0MjsNCiAgICAgc3RydWN0IGNvbnRleHQgY29udGV4dDsNCi0tIA0K
Mi40My4wDQo=

