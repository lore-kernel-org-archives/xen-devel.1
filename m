Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D013CC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 07:56:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446713.1662813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXNA-0000x7-Pl; Tue, 13 Oct 2026 07:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446713.1662813; Tue, 13 Oct 2026 07:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXNA-0000x0-MX; Tue, 13 Oct 2026 07:56:32 +0000
Received: by outflank-mailman (input) for mailman id 1446713;
 Tue, 13 Oct 2026 07:56:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xGXN8-0000wu-Of
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 07:56:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGXN6-0013MA-GO
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:56:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acde41b-8faa-0a2a0a5109dd-0a2a4508eda8-44
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:56:28 +0200
Received: from [40.107.130.97]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acde42b-f659-0a2a45080019-286b8261389f-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:56:28 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by AS8PR03MB6709.eurprd03.prod.outlook.com
 (2603:10a6:20b:290::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 07:56:25 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 07:56:25 +0000
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
 b=oLzn74/6tgj+8Txg9SD0IPrdo8+LalZnsV3JSVun+PyEAjdhQSlgL2MVXnNAzJbzQl0GXwGXlcyBxQjZI1QujQZj4BBhAwebhY7oJkndb/hqLTHf+Wmuqv2iMz+F6vmLbYRb7XG248eIDVNKtFwDVKSYGvPkHWu7kC7/MJo1GiRWBAsj1gXAL074fdEP4kd+iHIN04Lx3zZnAXs5aX2rHV5vABtOwTRkfJgcbMIT9zQsdXPTZ2NJRQgs/08Q+Etvj9gdvmji7wQB/NCnj7NxXpI95VwtTgzylK3fWHBXSKToGSkxrrFNvSuysQ12dJfaTWYg4HUUwqS2ZKzKKclUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMYMA/KwPHjEVJ8bC31LLOq6cVzWd+H96Cfq1RBleIs=;
 b=yALR5k4lExwFvA46Hyc7VELWGMeYp5JOejcoJCXItM40bYh3reM3Tdnni3NBLFrvMRIHVzEorHc631oOvZutvj0gVnW3yyjIHN+diqZHcrAMKg4i/7QoVsgSXTXlPzxdSO5e/WIHwY4FpsbQ6zo/3JrWqJSaViYcrB3/s5C2BTicdXPpDlFfetl12CDvZqohC5utTMMNXJQPlW6GbSsJerLgjpCSdddWegconi6mbIhcty6Xtxxgli2zqN6JOBSwYq4SFIIAsT9mfmtRBR2tG0IZ1EnaW+pUm8ZlyHchcFydqdX4Zg0hK+P0TkgJrjUQLQgFWx6sXm+fyRseieO6wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMYMA/KwPHjEVJ8bC31LLOq6cVzWd+H96Cfq1RBleIs=;
 b=kwsxzXIP14YxyINlGXItNEdKYERjVQVeU/xtg4rMlPQb6MbRka7Yl9Jx0vR+rkVEGhtvmOh0K3u/R0R6FLcjvp90YPXFhKntuXLVtqXdbn2f/wocI1FjAgrDSHT9WY/NXTSPRUl7ES/bwD7lNfq+kFvvoY0f0lFdF47QbEfLvU3OZi9w4Br6PLnDla91KWHsmtNMPxMb02eOjksa7qWvkDyeX60/IkazrvrXF5j0IyFrst8SnVIfHMPjVZKRquEoibpJO7SNNhbc44q0An/IKCOdGz2Tvc6Te6hu+wCxPWUgOwPSBzP5KaaDWNQytBv2Fr3X089ix2Q2nKHbwjiGOQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>
Subject: [PATCH v2] automation/eclair: generalize the noreturn
 function-pointer deviation
Thread-Topic: [PATCH v2] automation/eclair: generalize the noreturn
 function-pointer deviation
Thread-Index: AQHdWuhYpZfkS0sLoEKj8O8bb8Y05w==
Date: Tue, 13 Oct 2026 07:56:25 +0000
Message-ID:
 <a1200bca22212f81bb2265b761a7de5fc91e798f.1791877354.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|AS8PR03MB6709:EE_
x-ms-office365-filtering-correlation-id: 2553713c-917e-4de6-1d11-08df28ff7acc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|23010399003|7416014|376014|10067099003|18002099003|260925022911599003|260925021911599003|260925021311599003|3023799007|11063799006|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 S1c8guNKyFYBDR+7jRGhnkyHqaxbHOaLFDJqFBOWRwnffXtpjO+jNBD3AHCLDxkKqXRcTUcTQos/TiywYa9qlqY8O2LQDSlm1iTs2DHznkRp/Jb+DLcjdJhSVNNNZ00jHP+nQV1MfoaHpuJBMOcnfRRD51GHS86Er+QYGVJIjT9zET3XGMi9et2eIGYcwRvHjxcmK4VxKUiYi/5NdRUxu9COHHV5Sy25QhiXufDBVKcUq727ioE6dIitEtEAXiE+GujN9J8eUJsq5juFn9nkZ19n2ABueY52dPdUnJTltrIJ4opvc4+V1ei32obx+/UVWeuEN7sAAT02icUXgL/Fl6OrhKCZ0l6wsNOtUKNO3/S6C5jotKwkWU7szlIZeNSBO/E80A9Q+eLlipD+kuVZQ2Oyg92Rg0q1rIxQAX91+4TzZ7TjsRExX1+51p3TJcXCCT0jRl/bBwkGOvVc9Ox1OXIZs5cVNkvdkv/ju/nmUm6Y785pSbfNCZ9fWcPX4mG/ncr8TBAs92kLCybLmWCE6/VBsI38jx8g1NdLTLbcEySdiy45NKcmXSEqqRQC4igLGafvkkp0aaeIgHVMHMNa1tGjxK/c8ar1khldeA9XMFUhS0821fHoYKFr9eIUn8VOWSiVJsO4t8ie1EeWnBWE79FUqs+2dSfXMaWX4AStvio=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(23010399003)(7416014)(376014)(10067099003)(18002099003)(260925022911599003)(260925021911599003)(260925021311599003)(3023799007)(11063799006)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2FhRjhuYkNld2x5V0llSFpSWGNrdzhUZHNIRE5uUjVTQTVBcU9hamc4TFE0?=
 =?utf-8?B?U01WeW9CQXlnY1pnOTJZOU1OZ2tKY3dPa0FPVk0xRHFEK05CcTlBby9URkc5?=
 =?utf-8?B?eDJwdG5uand0UUF0c2E3QlRIU1JFN1BycWduRzVkSlZIL1QrOHo2eklFcm9D?=
 =?utf-8?B?TXhEZU1GMzNhbllyWmlRV01LSEJVK01mR3NjY09wQnpWdVNCVTkwRVdWV0FP?=
 =?utf-8?B?clpRMEhXSy9Ra1hFSVQvTlZtS0lab01XZ0ZHVE82eFd6Tmo2TTFxSUFMVnVE?=
 =?utf-8?B?a0FCRFh1SmdjVkxZZW1Ycis2TGNxNldWL2ZZVzY0YXp0RzNiSEQ0c05hMDl4?=
 =?utf-8?B?ZmRIbVNjYmhOdHJNd0FJY3g4QlU4TUJrOFJPTVFYQk5iNlpOZkQrbHVtR0JT?=
 =?utf-8?B?K3JoZlA5eVZCRWFHODMxeDQ2dkltdk9ZdVdNeS9Od29XaEFnaW1qa1dCYVBL?=
 =?utf-8?B?d1RTZTJWMGZSUmQrL3BlSWUzN2NVaDhxZTRHbU9xOU1RY1lBMTNrczRjSjV4?=
 =?utf-8?B?TnhsKzZ3WVNDTmpQbjFzaVVVWE05UTEvM3U2Y0dGdEJ3eEdnZVpHc2x6QUxz?=
 =?utf-8?B?M3R4bncxWjVTU0F0MGg2TzVXQnFmalZNckRjZFJmNHptMGxFSjVrQ1dOUnZI?=
 =?utf-8?B?azZiM05ibkZaZ3JIYmZ6akFjQmZhVzl5c3BtSTR3ZFA5YjhPU28ydGNIWnpN?=
 =?utf-8?B?cmdyczFXQWl3TmpEbHFFaWlXcVI5TElpRWpPSUQyUGRDSENEWnEybFFwL2ZZ?=
 =?utf-8?B?alFiNkhmdnZXNVdqQlg5SHBtK2p4KzZxc2xESjdVU1V5cmpXQktjM3d1Z3RM?=
 =?utf-8?B?d0psZklhRGFnWFd3K1ExRzlnMHArem1TZ3ZVZ2VxcDAxT0VFMXpKZ0twL1hs?=
 =?utf-8?B?RjR6V2VWek5Fdk51TDNoOTNGNkprclMrT3VBSEFyT2toVUZTdkE3dEFXSUh0?=
 =?utf-8?B?dm10N2thWDBQYlhCcC80THlqTENGb2cwcjVhYjUzMDMvRklwVWJUYVg3b0hV?=
 =?utf-8?B?b3ViNlRIREhvWGxzTTZqT1dxZlBSQWZtcVA3MHhWdFRVMWFFVXFRT0lFbVVp?=
 =?utf-8?B?UDUrQ1BmNjRkelN2eWZhZkJlU04zVVNpRWFGRHBhODkyTHhIUmZQVDN5N0ZQ?=
 =?utf-8?B?UGpoOVpxK01ySkdISHc5S09FQ2Q0OUQrM1Ywa3hDcTNieVR0Q2h3bWMrVEIz?=
 =?utf-8?B?d0QrL2xjN0dZcW8zQXpnL2IzTVRCTDUvVXBTRUVnQXVES241dzVDOHRIb042?=
 =?utf-8?B?a1RZeE03UDlaNGpKNHlPL1g0bnB0ZG11dy9SaitMUUNqY2xKdXRmVW0xWGhK?=
 =?utf-8?B?MHMzQ2JuZkVoZjhreG93dnIwcG9ERThWWTRtcHJ5U1IrQlB0d3VDV1BUeDZL?=
 =?utf-8?B?Um9nQmZpRTBQRUt3VGNZS053cnd1eUJUQThDdmdMT3NqWStlV3FKdnMrTEI1?=
 =?utf-8?B?Qi93MHZZUHJMZHFSKzBjb09ZSFpESVhIRlk1b1dOaklRY1pNdzVVODhLTmEv?=
 =?utf-8?B?QURVSk84ZjNJL0orNlhBK29wTEpBZm9sY3lHaDNnc0M4N09WdytTeDRLZTAw?=
 =?utf-8?B?LzhjZmFLWXNOSlJlTitZRnpZd1RJbW5Wd2l0d2NMTk5ZemR2S3hQTGtzUUNG?=
 =?utf-8?B?dHozNElFNVUvR2xtZ1VQRkR2S0lGbGFrM0RoU3o1VUtYS1pyVVNDcng5VHhu?=
 =?utf-8?B?aXVqNXRiZ3JwSHd2N0VJdWxuSCtiZTJNUDE1aGVoZENLS3FuM0YrMEhXK04v?=
 =?utf-8?B?Q2QyNnJjL3FCQk5ZYjVxOXZ2VkdOMytmKzNPQWZ5UGNBUlNVTkNoQlJ3aCtn?=
 =?utf-8?B?OWRnT0Q3YzdrTExhb3lhbzM1Y3luQ2VhMFpFcUhPZEh3cWJRQURBY1VxaXZ6?=
 =?utf-8?B?VUdpT1pzSUpxMmd1ZkR5TUFncmYycFNLN240K1NHM1ViZXIrMEl3UTU2R2M0?=
 =?utf-8?B?TGFtUVZLdWIxazBwWDNYSnVZMERkSUswckVnclUweDBuN2pTV003ejh6bE1G?=
 =?utf-8?B?ckJCekZoemRaL3MwRE9aV3FGN0taNkhtdE5XWjNUYWcvMXFLQzBpeUR0d0tP?=
 =?utf-8?B?NFZMbG4xSCt3Um1RN1IvZ280NHJvZXVlV1RsRjg3dFltZXNORkdhMEZFMlRY?=
 =?utf-8?B?NThNTVlMdVlIOW9yeTBFT2pIblJkY3hLaUwvWUZ1UXJ6Rytwd3JjazVRL0lW?=
 =?utf-8?B?ZDJmaGdXTC9MUzFNMVViMytSa1NDdHUvN0NRczIrb0pQOW5IQTRqRVVjOHZO?=
 =?utf-8?B?MVdlR3NZOXpnc2h2RzVDc2tPcmprelEzMGh6ZGRWWUR2V2dUeG45SnVMRVlS?=
 =?utf-8?B?dGZ6MXMrVmtEcGFqSHp6OFZhSmdHQzZ5VlpBTHpoUGZkRVFKVGFqa0JmVURo?=
 =?utf-8?Q?eEbKpIZTQKsnIB/0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2553713c-917e-4de6-1d11-08df28ff7acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 07:56:25.1655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fmd87fvHlsn1jIaFO1MoLWJ3EE1nIYu7lRYwudiRtPFt4wMFCXxLRnwnAnEm8gN4a84OgAC1FAMPmuoNP3Zr/gUU+5uIJZPTbdNfPDAPJuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6709
X-purgate-ID: tlsNG-c1860d/1791878188-CC57487B-DF54247B/0/0
X-purgate-type: clean
X-purgate-size: 6126

VGhlIFIxMS4xIHNhZmUgY2FzdCBvbmx5IG1hdGNoZWQgdm9pZCBub3JldHVybiAoKikodm9pZCAq
KS4gQWNjZXB0IGFueQ0Kbm9yZXR1cm4gZnVuY3Rpb24gcG9pbnRlciBjb252ZXJ0ZWQgdG8gYSBj
b21wYXRpYmxlIGZ1bmN0aW9uIHBvaW50ZXIuDQpjYW5vbmljYWwoKSBjb3ZlcnMgdHlwZW9mIGRl
c3RpbmF0aW9ucywgYW5kIGNvbXBhdGlibGVfZGVlcF91bnF1YWxpZmllZA0Ka2VlcHMgdGhlIHBh
cmFtZXRlciBhbmQgcmV0dXJuIHR5cGVzIGFsaWduZWQuDQoNCkRpc2NhcmRpbmcgbm9yZXR1cm4g
ZG9lcyBub3QgY2hhbmdlIHRoZSBjYWxsaW5nIGNvbnZlbnRpb24uIFRoZSBmdWxsDQpyYXRpb25h
bGUgaXMgaW4gZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdC4NCg0KU2lnbmVkLW9mZi1ieTogRG15
dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCi0tLQ0KQ0kgdGVz
dCBwaXBlbGluZToNCmh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZGltYXBy
a3A0ay94ZW4vLS9waXBlbGluZXMvMjk0MTM2NTI1Ng0KDQpDaGFuZ2VzIGluIHYyOg0KLSBkbyBu
b3QgY2xhaW0gdGhhdCBkaXNjYXJkaW5nIG5vcmV0dXJuIGxlYXZlcyBjb21waWxlciBiZWhhdmlv
ciB1bmNoYW5nZWQNCi0gd3JpdGUgdGhhdCBjb2RlIGFmdGVyIHRoZSBjYWxsIGlzIHVucmVhY2hh
YmxlLCBhbmQgdGhhdCBYZW4ncyBiZWhhdmlvcg0KICBpcyB0aGUgc2FtZSAod2hldGhlciB0aGUg
Y29tcGlsZXIgZGVsZXRlcyB0aGF0IGNvZGUgb3IgbGVhdmVzIGl0KQ0KDQpMaW5rIHRvIHYxOg0K
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vZDY4YzU2NjA3NzgxYmZhODI5NzY2YWVkMzZlZWIzMWYw
NjA4MGZiYy4xNzkxMjI0NjM4LmdpdC5kbXl0cm8uXzVGcHJva29wY2h1azFAZXBhbS5jb20vDQot
LS0NCiBhdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wgfCAg
NyArKystLS0tDQogZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdCAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTAgKysrKysrLS0tLQ0KIGRvY3MvbWlzcmEvcnVsZXMucnN0ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA3ICsrKystLS0NCiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9lY2xhaXJf
YW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlz
aXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQppbmRleCA2Y2RiMTBhMTI5Li4yMjY3OTNmNTJlIDEw
MDY0NA0KLS0tIGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMu
ZWNsDQorKysgYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5l
Y2wNCkBAIC0zOTQsMTEgKzM5NCwxMCBAQCBjb25zdGFudCBleHByZXNzaW9ucyBhcmUgcmVxdWly
ZWQuXCIiDQogfQ0KIC1kb2NfZW5kDQogDQotLWRvY19iZWdpbj0iVGhlIGNvbnZlcnNpb24gZnJv
bSAndm9pZCBub3JldHVybiAoKikodm9pZCAqKScgdG8gJ3ZvaWQgKCopKHZvaWQgKiknIGlzIHNh
ZmUNCi1iZWNhdXNlIHRoZSBzZW1hbnRpY3Mgb2YgdGhlICdub3JldHVybicgYXR0cmlidXRlIGRv
IG5vdCBhbHRlciB0aGUgY2FsbGluZyBjb252ZW50aW9uIG9yIGJlaGF2aW9yIG9mIHRoZSByZXN1
bHRpbmcgY29kZS4iDQorLWRvY19iZWdpbj0iVGhlIGNvbnZlcnNpb24gZnJvbSBhIG5vcmV0dXJu
IGZ1bmN0aW9uIHBvaW50ZXIgdG8gYSBmdW5jdGlvbiBwb2ludGVyIHdpdGggYSBjb21wYXRpYmxl
IHNpZ25hdHVyZSBkb2VzIG5vdCBhbHRlciB0aGUgY2FsbGluZyBjb252ZW50aW9uLiINCiAtY29u
ZmlnPU1DM0EyLlIxMS4xLGNhc3RzKz17c2FmZSwNCi0gICJraW5kKGJpdGNhc3QpJiZ0byh0eXBl
KHBvaW50ZXIoaW5uZXIocmV0dXJuKGJ1aWx0aW4odm9pZCkpJiZhbGxfcGFyYW0oMSwgcG9pbnRl
cihidWlsdGluKHZvaWQpKSkpKSkpJiZmcm9tKGV4cHIoc2tpcCghc3ludGFjdGljKCksDQotICAg
cmVmKHByb3BlcnR5KG5vcmV0dXJuKSkpKSkifSANCisgICJraW5kKGJpdGNhc3QpJiZ0byh0eXBl
KGNhbm9uaWNhbChfX2Z1bmN0aW9uX3BvaW50ZXJfdHlwZXMpKSkmJmZyb20oZXhwcihza2lwKCFz
eW50YWN0aWMoKSwNCisgICByZWYocHJvcGVydHkobm9yZXR1cm4pKSkpKSYmcmVsYXRpb24oY29t
cGF0aWJsZV9kZWVwX3VucXVhbGlmaWVkKSJ9DQogLWRvY19lbmQNCiANCiAtZG9jX2JlZ2luPSJU
aGUgY29udmVyc2lvbiBmcm9tIGEgcG9pbnRlciB0byBhbiBpbmNvbXBsZXRlIHR5cGUgdG8gdW5z
aWduZWQgbG9uZyBkb2VzIG5vdCBsb3NlIGFueSBpbmZvcm1hdGlvbiwgcHJvdmlkZWQgdGhhdCB0
aGUgdGFyZ2V0IHR5cGUgaGFzIGVub3VnaCBiaXRzIHRvIHN0b3JlIGl0LiINCmRpZmYgLS1naXQg
YS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0IGIvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0K
aW5kZXggNmJjYzJhZGY5NS4uNDMwODExYjM5ZCAxMDA2NDQNCi0tLSBhL2RvY3MvbWlzcmEvZGV2
aWF0aW9ucy5yc3QNCisrKyBiL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCkBAIC0zOTIsMTAg
KzM5MiwxMiBAQCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KICAg
ICAgLSBUYWdnZWQgYXMgYHNhZmVgIGZvciBFQ0xBSVIuDQogDQogICAgKiAtIFIxMS4xDQotICAg
ICAtIFRoZSBjb252ZXJzaW9uIGZyb20gJ3ZvaWQgbm9yZXR1cm4gKCopKC4uLiknIHRvICd2b2lk
ICgqKSguLi4pJyBpcyBzYWZlDQotICAgICAgIGJlY2F1c2UgdGhlIHNlbWFudGljcyBvZiB0aGUg
J25vcmV0dXJuJyBhdHRyaWJ1dGUgZG8gbm90IGFsdGVyIHRoZSBjYWxsaW5nDQotICAgICAgIGNv
bnZlbnRpb24gb3IgYmVoYXZpb3Igb2YgdGhlIHJlc3VsdGluZyBjb2RlLCBwYXJhbWV0ZXJzIGhh
bmRsaW5nIHJlbWFpbg0KLSAgICAgICBjb25zaXN0ZW50Lg0KKyAgICAgLSBUaGUgY29udmVyc2lv
biBmcm9tIGEgbm9yZXR1cm4gZnVuY3Rpb24gcG9pbnRlciB0byBhIGZ1bmN0aW9uIHBvaW50ZXIN
CisgICAgICAgd2l0aCBhIGNvbXBhdGlibGUgc2lnbmF0dXJlIGRvZXMgbm90IGFsdGVyIHRoZSBj
YWxsaW5nIGNvbnZlbnRpb24uDQorICAgICAgIFRoZSBjYWxsZWUgZG9lcyBub3QgcmV0dXJuLCBz
byBjb2RlIGZvbGxvd2luZyBhIGNhbGwgdGhyb3VnaCB0aGUNCisgICAgICAgcmVzdWx0aW5nIHBv
aW50ZXIgaXMgdW5yZWFjaGFibGUuIFRoZSBjb21waWxlciBtYXkgZGVsZXRlIHRoYXQNCisgICAg
ICAgdW5yZWFjaGFibGUgY29kZSB3aGVuIGl0IGNhbiBzZWUgdGhlIG5vcmV0dXJuIGNhbGxlZSwg
b3IgaXQgbWF5DQorICAgICAgIGxlYXZlIHRoZSBjb2RlIGluIHBsYWNlLiBYZW4ncyBiZWhhdmlv
ciBpcyB0aGUgc2FtZSBpbiBlaXRoZXIgY2FzZS4NCiAgICAgIC0gVGFnZ2VkIGFzIGBzYWZlYCBm
b3IgRUNMQUlSLg0KIA0KICAgICogLSBSMTEuMg0KZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvcnVs
ZXMucnN0IGIvZG9jcy9taXNyYS9ydWxlcy5yc3QNCmluZGV4IGE1OWNmMTc4MmUuLmJkMjg4YmJh
MjkgMTAwNjQ0DQotLS0gYS9kb2NzL21pc3JhL3J1bGVzLnJzdA0KKysrIGIvZG9jcy9taXNyYS9y
dWxlcy5yc3QNCkBAIC00MzUsOSArNDM1LDEwIEBAIG1haW50YWluZXJzIGlmIHlvdSB3YW50IHRv
IHN1Z2dlc3QgYSBjaGFuZ2UuDQogICAgICAgIGFuZCBhbnkgb3RoZXIgdHlwZQ0KICAgICAgLSBB
bGwgY29udmVyc2lvbnMgdG8gaW50ZWdlciB0eXBlcyBhcmUgcGVybWl0dGVkIGlmIHRoZSBkZXN0
aW5hdGlvbg0KICAgICAgICB0eXBlIGhhcyBlbm91Z2ggYml0cyB0byBob2xkIHRoZSBlbnRpcmUg
dmFsdWUuIENvbnZlcnNpb25zIHRvIGJvb2wNCi0gICAgICAgYW5kIHZvaWQqIGFyZSBwZXJtaXR0
ZWQuIENvbnZlcnNpb25zIGZyb20gJ3ZvaWQgbm9yZXR1cm4gKCopKC4uLiknDQotICAgICAgIHRv
ICd2b2lkICgqKSguLi4pJyBhcmUgcGVybWl0dGVkLiBDb252ZXJzaW9ucyBmcm9tIFt1bnNpZ25l
ZF0gbG9uZw0KLSAgICAgICBvciAnKHZvaWQgKiknIHRvIGEgZnVuY3Rpb24gcG9pbnRlciBhcmUg
cGVybWl0dGVkLg0KKyAgICAgICBhbmQgdm9pZCogYXJlIHBlcm1pdHRlZC4gQ29udmVyc2lvbnMg
ZnJvbSBhIG5vcmV0dXJuIGZ1bmN0aW9uIHBvaW50ZXINCisgICAgICAgdG8gYSBmdW5jdGlvbiBw
b2ludGVyIHdpdGggYSBjb21wYXRpYmxlIHNpZ25hdHVyZSBhcmUgcGVybWl0dGVkLg0KKyAgICAg
ICBDb252ZXJzaW9ucyBmcm9tIFt1bnNpZ25lZF0gbG9uZyBvciAnKHZvaWQgKiknIHRvIGEgZnVu
Y3Rpb24gcG9pbnRlcg0KKyAgICAgICBhcmUgcGVybWl0dGVkLg0KICAgICAgICBFeGFtcGxlOjoN
CiANCiAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZnVuY19hZGRyID0gKHVuc2lnbmVkIGxvbmcp
JnNvbWVfZnVuY3Rpb247DQotLSANCjIuNDMuMA0K

