Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE7DCA5FED
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 00:07:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441861.1659457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBs-0004qt-7Q; Wed, 07 Oct 2026 00:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441861.1659457; Wed, 07 Oct 2026 00:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBs-0004p9-0z; Wed, 07 Oct 2026 00:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1441861;
 Wed, 07 Oct 2026 00:07:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xEFBq-0004a5-3H
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 00:07:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEFBp-007ODb-GB
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 02:07:21 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d2a-e002-0a2a0a5209dd-0a2a450b958c-10
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:21 +0200
Received: from [52.101.70.138]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d39-b7e8-0a2a450b0019-3465468a6cd9-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:21 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS4PR03MB8229.eurprd03.prod.outlook.com (2603:10a6:20b:4fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 00:07:15 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 00:07:15 +0000
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
 b=QD8WkecedgUnd8ra4T1eloQ4PDUN5pRw3zCLtawl/tySvDZrJxgaeNPtyg8juKN64pipOsQKbgwPu9NuekM/ZNQUhUUCn8lR2vzR6+Y0dESWSIz9E4R0fVtBO/14Haz0guDaodw9kEpYe4JKi77OJf3IdEdzd83Rx3gpTLmY5kS8CnCE1fv6ri0N9qO796dfFPXqb7khugHvvTjLed/5QwwyaEPjSDGDWxKxwRrE27Aq6Svia6wQQ9eQKPutV2cvk3hT4P6lz/K0KAgyS1v6KUAcIuNsWJILMbZ3tKUag6rlxpcoTdq1GiFvlDj1p57oWKGzUew+13/4Dw+PDsqYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kscvqz8u7u+M5aaWMtuJsELU0uoAhmtsAXdnJMs9oFY=;
 b=oyC54tHpKdhyZJk/h9o2zYcwZgqSV2oJRruBLd8QFnIGF77b1uZuOWgaBvmTp1BNRyDLZ3Hd/BLsaBfdt/oh5W5AuBZEBR8g7+FIGOJtxM+fFOINDz2stHJ3NS1nq0icnbpMMu0TGVHu5DUh1g01j27qNY40JMnu3fK6EAXrjSvJSzPQo87SbL23F0Ze39/azQS6kgTc3FUAX75vCNxp9M7t6adUirSIIf8ZyiLlWvnnBoyFYXXV7AbQTfIvstShEtfxfkRkhiueEWQRWR44itP6swUNs8gr+VNBLN1ADZUnc7MbVifu6TetTjJkX+SGEhTrrjgsQAlnK5iG4fl/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kscvqz8u7u+M5aaWMtuJsELU0uoAhmtsAXdnJMs9oFY=;
 b=g16gJ+vJx9njFU0CQJpF45rT0f/lIT0cGClgg8ItigO1OX3beEO5ZjJeTchd0ylSXumhGD+gPBOvbCAdmPs08RdWznWxGXL1IHMCye5VsZEK1LWVo40XuvmW4kTNV5DJ4OEBgZwJQ+q5y/W3yEBhCtvLfbBAmmX55r22okk8WmvEZkW/vAmWq7DJmMnwnsinGOXl46G856N13NMMgk+D8VLhziXlVxW/RiXbUqfGKiS1NvHYZwhw71kB+ymhBPiCpKJbiGF39Ak9is160t8CiRBcEwnGJzDTr/q6Pp/OdOUyXX4KFuX9B2rSDT0uKctwxcA00tnB5gWWPUAReC2gwQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v4 17/22] xen/arm: vsmmuv3: Add support to send stage-1 event
 to guest
Thread-Topic: [PATCH v4 17/22] xen/arm: vsmmuv3: Add support to send stage-1
 event to guest
Thread-Index: AQHdVe/PKxNpTP5Tkk6OtCTrm7j3dA==
Date: Wed, 7 Oct 2026 00:07:15 +0000
Message-ID:
 <94ab2741c9c61f2b66d9c5a207f913f4241c42a4.1791328190.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: f0055713-f892-4ea5-c6c3-08df2406f1ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|10067099003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 Wdv97aaRUAjeXSNhMq4LbuLhAGGde3XHZ4XnLkVE+6KEWB5S05A91QBxi9DYzKEh/aaIJ45of1s2fY+UtNZIn2e4+xnhqW4eAjZPOHbEGbRR2+FIzn5625trnBPiU47x7fiQXaQfRjyZ4De+ARn3ioJH2UdEJApibOKC4SLiw3BUEesJnVRuJ6n384WUcn/bNsb/VUuqAl4UeD28ue7aw4ls+Ue3k9d9wm5iqbx4dyH7IFpwFDpjki59k8Vlo8j0Mb3t4FqRVZMhKW6Y0HxhjvBwK51DNSWdTt4WaDENeuW0Fa8woVOEUVA1CBy0Tl4i4bL5GlGE3dNdbWTJVGc5C1ZtlXZdMa5Lnowt3UpLA2WAXqpcO+clTnLNDbawwUnJK7V9aaLT7/IH/+W2lUEolKwIpyX9Ryj4J9ZrBHo6Aj2BrjTV4/DpP8hKwKeCMHaCVuAGX0wtMbrQJL2RUxZBLY1+2V9zWiIVwQicZrWn7u8tBF9otyfSqsCPdPwzQa6raDXdUulrmk1IzEcrxZPbFtQgR+g6YYhHdavlnOMcyY5rAfyDTL4xwTfROlvzoacbBpiKb2rEHA0J4gV+tPB53rT05If2oxfCjN3FIrT2+d03TaA0ZzuqDuLG2rojXpZ6MtCy4YJG5a2wPD2IJ2cqyKn/f44DPZscQNjZKFOBmR+D8VxPKQQPz0z5pZb8QRKu38nXVTSgekcUTV7M3i5SXp+j/ywo2L0htOFbuk5r4GM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWRQUHd6Qyt1UzZhNVNHZ2hqZ0ZBdGs2SHY5K3R1UFE5Y0JQT05PdjlSZVJt?=
 =?utf-8?B?cmtUelVHVmhBNEJIK1BGYTU4TTNoMHErRnY1UW1sUHFVMjhzUkloSHdqVG5m?=
 =?utf-8?B?VnpiT2pVUFBYSXc5dVFBb1ZoOEJ0bU9za3I0Rm1lOHhtMkdpUHlab0NIaU5y?=
 =?utf-8?B?MHpoOFNGU3JoT3FmQWNMeWpyKy9mUThrNnM2L2JtZ1dubk1ueW5lQi9HRjlM?=
 =?utf-8?B?WnlqeERreG1xU1NJUmpVRkhsUkQwMkVSVEFBTWJPMnVSU1UxWTJLWFUxeTA4?=
 =?utf-8?B?dGNaNEQ1c1p3SGJXVkdNVDZHVDJQZmkxQTNvZGp5aWpoTEY5MnlSbWxNN0pv?=
 =?utf-8?B?TDYzUDJ5UmUwaktnYWs2TVBEaGJCaEZZalZqM2RlMkg5YmUreTNIN2kwblZL?=
 =?utf-8?B?eWU2YzlmNUYydm5mUitwcWlkalhKWTQzTXo4OERyNG82ZHh0WS9ad1owWjNj?=
 =?utf-8?B?MnNKT1ZCTjQvR3F2dzZGRkFSdHF6ZndIWjNYMHZscE1BL05mbnp5UG0wa29S?=
 =?utf-8?B?ZWgvaWo3WjNENm5MSW16RGRMemQ2TWt2WitwVEtZaGFORmNYNEFmbnB2RWp3?=
 =?utf-8?B?dVlYNkM5cFA5SUVHUmo5cTdvUVNmdzhLUDhTWGtUd1RNcjVJVGU0d2VrQ082?=
 =?utf-8?B?TTRqUFNlNU9waWtmVVo2b1dubHkwL045VkpQNVY5WUZBNUlpclBHaHZXVm5V?=
 =?utf-8?B?U1JNR2p6TjQ0TEI3K1NOc1VLeWR5OUI1YmpybWx1eFBxUzRVMnVUUHltWVNy?=
 =?utf-8?B?aTlCSGg3bFF4ZXFFc3hDU0NXeTdDTlM3b3ExVzVTZldMZ05MZ2Vwb3NvOXlw?=
 =?utf-8?B?R3VqdnB4RFNERVlCQUVUbytsT21zZm9xaDBqWSt6aHpxUGdlbEE2TmNTS0Qv?=
 =?utf-8?B?VTFtQXdLVGp0ckZ4UXRBWDNGQy9WaXBjTG01Ky9wRzM0blFBejBRM2RUY0ZX?=
 =?utf-8?B?UjZEeEhxcnZXVVNhKzlGTzJDOHRmMDBzSWs2V3FYbFc0YVdaQWVVUzRyZUdZ?=
 =?utf-8?B?eXd5alJWc2lHMTA4UkdYVWRTOUhzQmQyZ2VNcEMwazdEU2t1b3JmMkVnViti?=
 =?utf-8?B?eDBRN1BPT2gxSDdiQnV5YnlqYjZTMHBQc1ExNG1KdFFFYWNhdEdPc1FhQ3B3?=
 =?utf-8?B?MXJJQWlvSVlkWnd4MTdrUk5vVmRhREUvK1JHL1VCODk5V0MwaUtSUTlEN1Jn?=
 =?utf-8?B?cHg2WVc2VzdLcEZYTFc4VnlQT0pvV2Q0MEgzWEkvMTVFR1VRYWtrSDZ5d2tX?=
 =?utf-8?B?RzRLTUd1T3E1VVpCKzVyZlM3Z3VpcjFodjY2L1VmaGR3YXFqVzZiTzJJN2ZY?=
 =?utf-8?B?RlNCQzRkT2ZXeU1iWWRSYW9tLzVtQXVqWlZuWGFlajh0SmI2ZGFBeDFBSWN3?=
 =?utf-8?B?NkYyNUZiUzhLZzhxdFl3dHJMejRLaEYzYXNVZ1JLT2xFM25NbnpKU0hlaTlB?=
 =?utf-8?B?ZkpmdGViQzk2QjR4ZUJGR1RlWVdOWjArYWNnRHkzcERQcEwzd04zczR1TFZl?=
 =?utf-8?B?Q2h2ZlBHRU05Z2xmVDBzN1kwdmkrR0lqQWwvMW01czR3TGpJNG9QNzk2UXd6?=
 =?utf-8?B?SGY5ZUZUT0lOakRhUGphbVdPZlZ2ZjFhcjZSRmxpSy9nNU5OeEdVL0E4UzI2?=
 =?utf-8?B?RFhndElkOFFYcEEwWUVBdTlsRlhwUVd0bGRHV2hpL2NCOGJMaGx4bHlHZTYz?=
 =?utf-8?B?LzhTU3pXUkMrUkY0cXdoQU13Y09ZYk5wQmlOWVdicHRWRHFKMHJLQkE2OXVQ?=
 =?utf-8?B?VG05T2U5TE9WVXNzT041cWx5QTVwTnNWbVJ1akxXU0ExL0tQZUxlOG9wSnZ4?=
 =?utf-8?B?dVFkU1AwYTI3THk1SThsYmszNjV4REptdmc3MS9aVTBuUVIyVmdvOEk2dUVJ?=
 =?utf-8?B?Z01xenozdExzSmJWWktxdUh3bEVwY0lscUR0ZHZMREY1WVd4eHIzSWxtZFhH?=
 =?utf-8?B?ekpuRllOWklFb3Brbnc2d01EbnN4c1Bja0ZYTFhBcHpQbW1TVjRwVHduci8y?=
 =?utf-8?B?WDJ3dkFzRUE0RE9JUTdBdFlLNkVHMFFCeXlTWjNBNjZtZnJDYnoxSk11RHdj?=
 =?utf-8?B?aHYxVDlWaHRzM2djM3htdEJjWFE3ZitvRmJJK2NXTlJ2MWhLUk9DTUhTbTNH?=
 =?utf-8?B?Uk85bkpWZHY5S2FWVGxjYU9SR290SWJLME5aN3o3S0h3YjBkcUpIUlpYQ0pT?=
 =?utf-8?B?QmsyOE1ieDV4bnVqY2xTUWM5cllpbFZ0RGg3WmhDL083YVYwcTk0LzJhbllX?=
 =?utf-8?B?d25VTTJTUmhJZDBsclN6ZFRhRHN2WkhEemVIZzI2dElKVk1uak5uZmZTS2d2?=
 =?utf-8?B?dnhhT0Ezcm8zbXF4T1hiZzVqWnczeXo0VS9WL3dGWkZyUTlndmtqdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0055713-f892-4ea5-c6c3-08df2406f1ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 00:07:15.6579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7r34BC/KTndro7X72eRJ0LS4lqgt7oMQ92ulL7eDTfOT0ySZY8Imjj60Fv26rgir33lh1jVkOxYV9/HWwRvM0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8229
X-purgate-ID: tlsNG-42698a/1791331641-AA6DA9EA-20F7853D/0/0
X-purgate-type: clean
X-purgate-size: 6988

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNClN0YWdlLTEgdHJhbnNs
YXRpb24gaXMgaGFuZGxlZCBieSBndWVzdCwgdGhlcmVmb3JlIHN0YWdlLTEgZmF1bHQgaGFzIHRv
DQpiZSBmb3J3YXJkZWQgdG8gZ3Vlc3QuDQoNClNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxy
YWh1bC5zaW5naEBhcm0uY29tPg0KU2lnbmVkLW9mZi1ieTogTWlsYW4gRGpva2ljIDxtaWxhbl9k
am9raWNAZXBhbS5jb20+DQotLS0NCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12
My5jICB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKy0tDQogeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL3ZzbW11LXYzLmMgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKw0KIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92c21tdS12My5oIHwgIDggKysrKysNCiAzIGZpbGVzIGNo
YW5nZWQsIDk4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL3NtbXUtdjMuYw0KaW5kZXggMTk2YWM2NjBlZi4uZTQ0Zjg3MmQyZCAxMDA2NDQN
Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCkBAIC04NzEsNyArODcxLDYgQEAgc3Rh
dGljIGludCBhcm1fc21tdV9pbml0X2wyX3N0cnRhYihzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpz
bW11LCB1MzIgc2lkKQ0KIAlyZXR1cm4gMDsNCiB9DQogDQotX19tYXliZV91bnVzZWQNCiBzdGF0
aWMgc3RydWN0IGFybV9zbW11X21hc3RlciAqDQogYXJtX3NtbXVfZmluZF9tYXN0ZXIoc3RydWN0
IGFybV9zbW11X2RldmljZSAqc21tdSwgdTMyIHNpZCkNCiB7DQpAQCAtODkyLDEwICs4OTEsNTEg
QEAgYXJtX3NtbXVfZmluZF9tYXN0ZXIoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSwgdTMy
IHNpZCkNCiAJcmV0dXJuIE5VTEw7DQogfQ0KIA0KK3N0YXRpYyBpbnQgYXJtX3NtbXVfaGFuZGxl
X2V2dChzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11LCB1NjQgKmV2dCkNCit7DQorCWludCBy
ZXQ7DQorCXN0cnVjdCBhcm1fc21tdV9tYXN0ZXIgKm1hc3RlcjsNCisJdTMyIHNpZCA9IEZJRUxE
X0dFVChFVlRRXzBfU0lELCBldnRbMF0pOw0KKw0KKwlzd2l0Y2ggKEZJRUxEX0dFVChFVlRRXzBf
SUQsIGV2dFswXSkpIHsNCisJY2FzZSBFVlRfSURfVFJBTlNMQVRJT05fRkFVTFQ6DQorCQlicmVh
azsNCisJY2FzZSBFVlRfSURfQUREUl9TSVpFX0ZBVUxUOg0KKwkJYnJlYWs7DQorCWNhc2UgRVZU
X0lEX0FDQ0VTU19GQVVMVDoNCisJCWJyZWFrOw0KKwljYXNlIEVWVF9JRF9QRVJNSVNTSU9OX0ZB
VUxUOg0KKwkJYnJlYWs7DQorCWRlZmF1bHQ6DQorCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQorCX0N
CisNCisJLyogU3RhZ2UtMiBldmVudCAqLw0KKwlpZiAoZXZ0WzFdICYgRVZUUV8xX1MyKQ0KKwkJ
cmV0dXJuIC1FRkFVTFQ7DQorDQorCW11dGV4X2xvY2soJnNtbXUtPnN0cmVhbXNfbXV0ZXgpOw0K
KwltYXN0ZXIgPSBhcm1fc21tdV9maW5kX21hc3RlcihzbW11LCBzaWQpOw0KKwlpZiAoIW1hc3Rl
cikgew0KKwkJcmV0ID0gLUVJTlZBTDsNCisJCWdvdG8gb3V0X3VubG9jazsNCisJfQ0KKw0KKwly
ZXQgPSBhcm1fdnNtbXVfaGFuZGxlX2V2dChtYXN0ZXItPmRvbWFpbi0+ZCwgc21tdS0+ZGV2LCBl
dnQpOw0KKwlpZiAocmV0KSB7DQorCQlyZXQgPSAtRUlOVkFMOw0KKwkJZ290byBvdXRfdW5sb2Nr
Ow0KKwl9DQorDQorb3V0X3VubG9jazoNCisJbXV0ZXhfdW5sb2NrKCZzbW11LT5zdHJlYW1zX211
dGV4KTsNCisJcmV0dXJuIHJldDsNCit9DQorDQogLyogSVJRIGFuZCBldmVudCBoYW5kbGVycyAq
Lw0KIHN0YXRpYyB2b2lkIGFybV9zbW11X2V2dHFfdGFza2xldCh2b2lkICpkZXYpDQogew0KLQlp
bnQgaTsNCisJaW50IGksIHJldDsNCiAJc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSA9IGRl
djsNCiAJc3RydWN0IGFybV9zbW11X3F1ZXVlICpxID0gJnNtbXUtPmV2dHEucTsNCiAJc3RydWN0
IGFybV9zbW11X2xsX3F1ZXVlICpsbHEgPSAmcS0+bGxxOw0KQEAgLTkwNSw2ICs5NDUsMTAgQEAg
c3RhdGljIHZvaWQgYXJtX3NtbXVfZXZ0cV90YXNrbGV0KHZvaWQgKmRldikNCiAJCXdoaWxlICgh
cXVldWVfcmVtb3ZlX3JhdyhxLCBldnQpKSB7DQogCQkJdTggaWQgPSBGSUVMRF9HRVQoRVZUUV8w
X0lELCBldnRbMF0pOw0KIA0KKwkJCXJldCA9IGFybV9zbW11X2hhbmRsZV9ldnQoc21tdSwgZXZ0
KTsNCisJCQlpZiAoIXJldCkNCisJCQkJY29udGludWU7DQorDQogCQkJZGV2X2luZm8oc21tdS0+
ZGV2LCAiZXZlbnQgMHglMDJ4IHJlY2VpdmVkOlxuIiwgaWQpOw0KIAkJCWZvciAoaSA9IDA7IGkg
PCBBUlJBWV9TSVpFKGV2dCk7ICsraSkNCiAJCQkJZGV2X2luZm8oc21tdS0+ZGV2LCAiXHQweCUw
MTZsbHhcbiIsDQpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3ZzbW11
LXYzLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYw0KaW5kZXggODcz
NDJmZGY2OS4uYjcxNTExYzJlYiAxMDA2NDQNCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FybS92c21tdS12My5jDQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUt
djMuYw0KQEAgLTMzOCw2ICszMzgsNDkgQEAgc3RhdGljIHZvaWQgYXJtX3ZzbW11X3NlbmRfZXZl
bnQoc3RydWN0IHZpcnRfc21tdSAqc21tdSwNCiAgICAgcmV0dXJuOw0KIH0NCiANCitzdGF0aWMg
c3RydWN0IHZpcnRfc21tdSAqdnNtbXV2M19maW5kX2J5X2FkZHIoc3RydWN0IGRvbWFpbiAqZCwg
cGFkZHJfdCBwYWRkcikNCit7DQorICAgIHN0cnVjdCB2aXJ0X3NtbXUgKnNtbXU7DQorDQorICAg
IGxpc3RfZm9yX2VhY2hfZW50cnkoIHNtbXUsICZkLT5hcmNoLnZpb21tdV9saXN0LCB2aW9tbXVf
bGlzdCApDQorICAgIHsNCisgICAgICAgIGlmICggc21tdS0+YWRkciA9PSBwYWRkciApDQorICAg
ICAgICAgICAgcmV0dXJuIHNtbXU7DQorICAgIH0NCisNCisgICAgcmV0dXJuIE5VTEw7DQorfQ0K
Kw0KK2ludCBhcm1fdnNtbXVfaGFuZGxlX2V2dChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZGV2
aWNlICpkZXYsIHVpbnQ2NF90ICpldnQpDQorew0KKyAgICBpbnQgcmV0Ow0KKyAgICBzdHJ1Y3Qg
dmlydF9zbW11ICpzbW11Ow0KKw0KKyAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApDQor
ICAgIHsNCisgICAgICAgIHBhZGRyX3QgcGFkZHI7DQorICAgICAgICAvKiBCYXNlIGFkZHJlc3Mg
Ki8NCisgICAgICAgIHJldCA9IGR0X2RldmljZV9nZXRfYWRkcmVzcyhkZXZfdG9fZHQoZGV2KSwg
MCwgJnBhZGRyLCBOVUxMKTsNCisgICAgICAgIGlmICggcmV0ICkNCisgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsNCisNCisgICAgICAgIHNtbXUgPSB2c21tdXYzX2ZpbmRfYnlfYWRkcihkLCBw
YWRkcik7DQorICAgICAgICBpZiAoICFzbW11ICkNCisgICAgICAgICAgICByZXR1cm4gLUVOT0RF
VjsNCisgICAgfQ0KKyAgICBlbHNlDQorICAgIHsNCisgICAgICAgIHNtbXUgPSBsaXN0X2VudHJ5
KGQtPmFyY2gudmlvbW11X2xpc3QubmV4dCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCB2aXJ0X3NtbXUsIHZpb21tdV9saXN0KTsNCisgICAgfQ0KKw0KKyAgICByZXQgPSBhcm1f
dnNtbXVfd3JpdGVfZXZ0cShzbW11LCBldnQpOw0KKyAgICBpZiAoIHJldCApDQorICAgICAgICBh
cm1fdnNtbXVfc2V0X2dlcnJvcihzbW11LCBHRVJST1JfRVZUUV9BQlRfRVJSKTsNCisNCisgICAg
cmV0dXJuIDA7DQorfQ0KKw0KIHN0YXRpYyBpbnQgYXJtX3ZzbW11X2ZpbmRfc3RlKHN0cnVjdCB2
aXJ0X3NtbXUgKnNtbXUsIHVpbnQzMl90IHNpZCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50NjRfdCAqc3RlKQ0KIHsNCkBAIC0xMTE4LDYgKzExNjEsNyBAQCBzdGF0aWMgaW50
IHZzbW11djNfaW5pdF9zaW5nbGUoc3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBhZGRyLA0KICAg
ICBzbW11LT5kID0gZDsNCiAgICAgc21tdS0+ZmVhdHVyZXMgPSBmZWF0dXJlczsNCiAgICAgc21t
dS0+dmlycSA9IHZpcnE7DQorICAgIHNtbXUtPmFkZHIgPSBhZGRyOw0KICAgICBzbW11LT5jbWRx
LmVudF9zaXplID0gQ01EUV9FTlRfRFdPUkRTICogRFdPUkRTX0JZVEVTOw0KICAgICBzbW11LT5l
dnRxLmVudF9zaXplID0gRVZUUV9FTlRfRFdPUkRTICogRFdPUkRTX0JZVEVTOw0KIA0KZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92c21tdS12My5oIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYXJtL3ZzbW11LXYzLmgNCmluZGV4IDlmNGM4NmFiZDUuLmQ0YjdjZjgw
NWYgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuaA0K
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3ZzbW11LXYzLmgNCkBAIC04LDYgKzgs
OCBAQA0KIA0KIHZvaWQgdnNtbXV2M19zZXRfdHlwZSh2b2lkKTsNCiANCitpbnQgYXJtX3ZzbW11
X2hhbmRsZV9ldnQoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRldmljZSAqZGV2LCB1aW50NjRf
dCAqZXZ0KTsNCisNCiAjZWxzZQ0KIA0KIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2luaXQgdnNtbXV2
M19zZXRfdHlwZSh2b2lkKQ0KQEAgLTE1LDYgKzE3LDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBf
X2luaXQgdnNtbXV2M19zZXRfdHlwZSh2b2lkKQ0KICAgICByZXR1cm47DQogfQ0KIA0KK3N0YXRp
YyBpbmxpbmUgaW50IGFybV92c21tdV9oYW5kbGVfZXZ0KHN0cnVjdCBkb21haW4gKmQsDQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2LCB1
aW50NjRfdCAqZXZ0KQ0KK3sNCisgICAgcmV0dXJuIC1FSU5WQUw7DQorfQ0KKw0KICNlbmRpZiAv
KiBDT05GSUdfVklSVFVBTF9BUk1fU01NVV9WMyAqLw0KIA0KICNlbmRpZiAvKiBfX0FSQ0hfQVJN
X1ZTTU1VX1YzX0hfXyAqLw0KLS0gDQoyLjQzLjANCg==

