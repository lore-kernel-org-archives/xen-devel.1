Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3625EC982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 08:08:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424853.1649060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Te1-00016l-KH; Fri, 18 Sep 2026 08:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424853.1649060; Fri, 18 Sep 2026 08:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Te1-00016e-HI; Fri, 18 Sep 2026 08:08:29 +0000
Received: by outflank-mailman (input) for mailman id 1424853;
 Fri, 18 Sep 2026 08:08:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x7Te0-00016Y-Ay
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:08:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Tdy-00DgIs-Rp
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 10:08:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aacf174-8faa-0a2a0a5109dd-0a2a450992c8-36
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:08:26 +0200
Received: from [52.101.83.73]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aacf17a-be1a-0a2a45090019-346553496f5f-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:08:26 +0200
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 (2603:10a6:800:33d::10) by DB4PR03MB8682.eurprd03.prod.outlook.com
 (2603:10a6:10:384::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Fri, 18 Sep
 2026 08:08:24 +0000
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04]) by VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04%3]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 08:08:23 +0000
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
 b=sWBLC8h6iS3yaD6NReWdZY45JJzRsFHvnyUicW2eCtEP9nzdM8hdwl5/y7jVbrvhmJQKu9tOlqrF0mJyi+vRDxktmNuCYCslWrxKmjBW8V1cz0b72slOnaxhBgHQBWls+aZ52ks73qniSFce77gC3nfqh7hgwUoevqNv+BseVU5mF3ixLsp560+ZVdBcf2N8fu3tV8yWzkAL83yO9qWnZtCwbFBK7kaumbJFmvqtpVeOtaEvCSUhV1xcZzBZxIigVchFu9ERMj7c8pbR7ujVHxYoo0LhoNnKQwZcX6VZgn2Zo9VjnLTIxLkWxGbJpP0ogHB/r1WZGgMyLLnLu1tEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6+n1hGOzr9TmaAtRS0gAJhj3pgZH7cMOCZq4RYAa3s=;
 b=by0CV3tJsLhhv9skwfPO0BNukwFgnUPsvtT78GfluAnY8nicPA6PODFuMByGQ+bEXykaFUJkJ3deCktFNlytqgQ3pJAeh9zpedsr6/zR5MoUNbNhMXUIHoJ4P4ZMeelbwvGWQtaHzlQIdPzgRAPuZa8ClrAe0lQcWX+nUujBba9eDtKoRg4upOrCmMZzuBNJQAHEfyQGFOTji8IKJGu8GBFIQJ5bDtqdasm2DWRYlZDULocC1h9Ts637t1sC+cunicoOX1YJINu34DlnaS2u264IoYAXMIMv3l2KKu2nwmCmW0GsMNhxa6SUax0a/i2a4CvpDHj4cYEnQ3gh9lBOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6+n1hGOzr9TmaAtRS0gAJhj3pgZH7cMOCZq4RYAa3s=;
 b=VtOMYl+85RG2Zpz4ncualfZPUgCCPIHS+Z9PiicdFUH+DIHILhZvP39C6TPPCFw4CG81mYPX4qHs+VmV5nK3UAOT4EH2d3QWWBeW6H7eWF8Qj3Afc84cETHxTKGqDTk/h5bDAc4nxmRPvXBnWHf3A9slcFDqAcNPpP5kzO2yS2HCMqX0EKzX0ElJ+ngcS4H6jueszZwhHUGZgGqRpxl/n0EkBYeJy8L+Jtv5al9L4BVjQnaBAt6eYx1JgGkf6uZxdEl2mtI+EQgMuae/YyF9bjaK9dhGgNnrvcJyMg74l8sGS7CmJ+Qxw877Eyjkv4KqOIg35h2HliePNetMxaANDg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v12 3/6] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v12 3/6] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHdQb7XwQvbnxLqDEGK19PLXXgae7bJAQCAgABYGQCABnW1gIAAIbgAgAQVsQA=
Date: Fri, 18 Sep 2026 08:08:23 +0000
Message-ID: <5dc8dfd3-c228-432f-b812-6a60b038552f@epam.com>
References: <cover.1789055542.git.oleksii_moisieiev@epam.com>
 <6bf8f9dd61da4d0fbea096b863f51db08df46c56.1789055542.git.oleksii_moisieiev@epam.com>
 <1d8be2c2-a56d-4b81-8e36-c4f97099c879@suse.com>
 <c9b06223-07b9-4c00-949e-874a6167e2d4@epam.com>
 <a7ba1f23-668d-4697-8de6-9890c64835fe@epam.com>
 <852f47c4-bd95-4e44-b409-ee805a07a5d4@suse.com>
In-Reply-To: <852f47c4-bd95-4e44-b409-ee805a07a5d4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR03MB11419:EE_|DB4PR03MB8682:EE_
x-ms-office365-filtering-correlation-id: ea200908-2843-4837-bee4-08df155c02ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|22082099003|10067099003|4143699003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 NNdYlGU9brHtTOldTbQ9rH0B65xResO2wrx8qc7lCfrWsjSZJYKFeaYjskDSJBe/zM0zD6l28EWGpTN053xP3daVfgJNUgzoQw1nGQYSgYIFtzl/PIpaXWRBVwBdG5oTa0WC1wzTz9lAfzE/qGpk7LY8FMVbK//lP85eYl7MOyBq0tzrh9Qc2HNWYe1sNpP/7ixDNDYXgJbVCirTMdR7MfYfgrpbZE5U5nz60ed2wr2BAhTFZz1CQPXh1yT1aVf9urRL34nNMKOgjllGfWFSCB9C1ShmjwLj9CKLXoUInnkmFjmaxenvxoWuMxvEiwUQW8OkCprkJK/A8haUwJySuc1EIeB1zJLlTBIY0+LondUFLQN1pWwvfqiYBvJWEtRJAmUvClKpylSkBbqbymiuQJdfvdKb83vscQRd0B+tPe161t/8vFlELanBEa9M1EjkUsE6Hc8lg/Xm2HOTF8BQ64ebOXrMokSirejX8Kt4W/5v1E8HivhL/wtkuKDndrP4TTrm4dFv9TEr0MdyjZgl8SuJ1NI9Y/qa42NfFn9TFG8Ky85XIqLr67+8ymLjG+zg2Kgfs3akb4stAkgj2EGwViQD5XwkmAPeFvzVTJ/JwcJFTQPK/YGxZ8FtaNyLPpDZFVFL4WvXm8+qiHbBeJWvXRLykFg+LafZu3Us8AWSJ22+pIbz0yFA71DfvkZkgYEioXRyw8tQMpRqtnqBpdAYqxVBGnbKtR/fB4K277I6X+Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB11419.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(22082099003)(10067099003)(4143699003)(18002099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anlJTGFOVjNtV0NVSEI0TmRBOEJYUE5LNjA2Z0d3dlBKZDNSUWpsVU9VSmZZ?=
 =?utf-8?B?clJaTUh4Q0dBZkFHTFo4dExmSlVJUlh1bW5qaU50eWJUM0JaTFVheXZPYmNu?=
 =?utf-8?B?WTVzZVB2S1Z2QnhuZlZwKzlNN3hoaGhHVHJSMzZzSUgvUXhDcGlHOUlGdnZl?=
 =?utf-8?B?WGp4VnRwZk9POVZaWXJhQlFPVC9ORUZveVg4OTR2N3F5U3QzRkJpWFB3MUwr?=
 =?utf-8?B?MThJamk5RTJBcVJHTVNVTUl2UGwycTY2MGgvdlV4bGEyNHZzZXYxWWZ4VE5L?=
 =?utf-8?B?c0w5LzN5UDl2b04vV09HSVhkaXhMM3g3VytVb01aWDlpMzNCNFcrVGJ0aDVn?=
 =?utf-8?B?Y2tIRk91azdIU3d0Y3RzOXdBS3pjVzgxUkZTT2N4cS9qSnVaNkFGaTh1cXVM?=
 =?utf-8?B?b0lJZVphL3Rkd1BRcU5EL2F6Uk9Mbjh2eFY2djNZOFJkYjJvUmRZbkE5SThl?=
 =?utf-8?B?SlNXUHNYRGRyNnRxQ3Z1bnZSVnhYd3hwZmdPSGhHbm1OUlhYQlYzcTZtdGFi?=
 =?utf-8?B?N1U3eWtGZVhMYnM1dGdHaTNVSS9DYVVtM0FZdTRmNCtMN21kYWlEem1zbHVp?=
 =?utf-8?B?TU5aUlJtQVVGcHIzTEdMdFFXZUdDeERWejZyUXBHdUw4T1JJVTBZOXM2MUFU?=
 =?utf-8?B?MWR3VUg1RGN5SDBGTEliTitkSjgvU0JhQXhtdDQyeXhPRys2RUdXRWgrR0JG?=
 =?utf-8?B?aWNVcXYxVEE5TzlKOC94OENOaDd6M0RsWjJWQ0RxUzRzUFQ2ZWRvUGtaWlFo?=
 =?utf-8?B?eDZIemRMZ21ZRG1mRmFWdkVnVEEwN3R4VkY2R2hhZm82TnQzRFRhZnc3NVVM?=
 =?utf-8?B?RXpyd3p0SFcyQndwdVNWZ2JKUmVyaGx5SFFXVXJYQk9Kb2dEeU1EdDJjMWxr?=
 =?utf-8?B?VlBqaElFUVJhTVkwOGZTR2ZTc2hUU0h5bnd5R1FjeTZzbU13TENKM3Vwc3ll?=
 =?utf-8?B?YjlpN1g1eVAwZFlaelIrSEhBYUp2Q2V3THVDYjhFVXh3UHFzYTNnZFVvSEVJ?=
 =?utf-8?B?Sm5hMXlrSCtkTW15dXY0ekExR1ZqVTZvZXZpWGZyaHJ0M05BMjJ1d0JDTG1Y?=
 =?utf-8?B?bDF5bTJPTjNMTVA0K21rRzd0TkZNV0xVMUtpUTIrU0tiVUR1dGgxaXNxQkNO?=
 =?utf-8?B?QndtMjlIZ2JueDlFRnE4dDQ4eXYvb21Zd0g2R0ZmSWlXUFdzQ2EwWlBuY0lJ?=
 =?utf-8?B?T1lBL05VYjM3NWRrTkNDY1JFYmxRMENoTjFWRzBBT0doOEF0MzRET0VUVnlI?=
 =?utf-8?B?N2VTSUU3MXA4T2VrVkRUMi9ZZVBCSDk2c01PLy91ZjNtQm54Sk1uNHQrRG9M?=
 =?utf-8?B?OFNFVnhLUEtMZHY1c1MwQjdINFA3MlpjeVJIK29wd0FMbmk1Q1Y4T0NOSHlk?=
 =?utf-8?B?TTAvaTlEZ1FKcjJ5N3RGZnQ2L0dUVWZvWGRPL21lUlBSM3FIWXAwdmV1ZGF0?=
 =?utf-8?B?TG1oQ09XWUFjdndEam9qTFdXOThha2QrdnNHNG90SVJ5SUM0L2FidkNsRkd3?=
 =?utf-8?B?TDZ2SG5TaFpweTN5KzVKQWVKQXJjSzM4ZysyTEZoN1NwMXMrWTFSYmlnZWYv?=
 =?utf-8?B?SHQ0WTg3cjZoeTN4YXdJVVRHazVTY3JzajRQek5rcDhueDNCYVhmN2t5dFJq?=
 =?utf-8?B?eG1iY0E4MjgyYS96aEk0M0x3RllpUGhqZzg2NXFsWWJGcjNNRmMweE8ycVVX?=
 =?utf-8?B?Ny85NG0wNmVJa1BhUTYyd1RVRHpLckZQTGNpVUZiUmZvQ0VvU2RTMzVHWnc1?=
 =?utf-8?B?ZVNKVllDdW11UG5vTG9FQmFGamYyUmNHTlA0YkorU2s5bjdQUEJOdnlWb2RN?=
 =?utf-8?B?RXdQZlpmNFlkKzIzNjZCaUJ1YVQ3Nk5FRHc3YjROZlBrRWJJdnNocFZSRTdG?=
 =?utf-8?B?RktBRjJwQ3pEaW9sWUJZUU5URHZBbUZqVkJnTTFvUklNNEJXUUpkaEFubFJQ?=
 =?utf-8?B?Y0hublhobDVGVHVZeWZBUUJWUXNYM1prSzdTaGV6SmZnYmluTm5ZeGliUG53?=
 =?utf-8?B?cDdXMFpnNzkvVjRQQVhza0JXUDNaUy9TeGROREhkeTBYZm1YZ2tnVDQ2VGY0?=
 =?utf-8?B?UlFCZzZ5STBmK1J4NmhpZWlha2JsdFY4dUg1Zk9qQlhxaTlqMTZjakE4Kysv?=
 =?utf-8?B?bkMwdFZWbkY4Nm03N1pqMmxxNHlMQmdPeVpNenZWb3pBVjU2aERselFLc01P?=
 =?utf-8?B?djNVTHlQT2FoVXFDeFVXRTRCNkIzNVMzbms0Znp5U25mVDk2ZEJZZTdIOFV5?=
 =?utf-8?B?TTlNMXpwK0c4bVBSUGRCVjEya2VaUTA3SnZlbzhkWTkxbkFJU0I5TWoyMlNW?=
 =?utf-8?B?VG56ZFJvL3pyazdudkNGMndVNC8wU0NGQWg3d3NGcmhvcGc3S1hzUXp2akxs?=
 =?utf-8?Q?sxi4JyPPUOOIEv7k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <479004F459AEFA4F9836FE26C1F30598@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB11419.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea200908-2843-4837-bee4-08df155c02ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 08:08:23.7755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WpB8IOwXwj4/6t72C/dh6wfXmwQeDZrkFrWxVPV7hU47A7EnDkx+vbrB2YQHmGrX4NfRxn0n67Soe7Le2OE4MgaP2b+H85LrdCnUyyLZbyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8682
X-purgate-ID: tlsNG-bad1c0/1789718906-FD469034-EF777448/0/0
X-purgate-type: clean
X-purgate-size: 3174

DQpPbiAxNS8wOS8yMDI2IDIwOjQ1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTUuMDkuMjAy
NiAxNzo0NSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiAtIGlvLmgNCj4+DQo+PiBJJ2Qg
cmVwbGFjZSB0aGUgY3VycmVudCBjb21tZW50IHdpdGggc29tZXRoaW5nIGFsb25nIHRoZXNlIGxp
bmVzIChrZXB0DQo+PiBhcmNoLW5ldXRyYWwsIHNvIG90aGVyIGltcGxlbWVudGF0aW9ucyByZW1h
aW4gcG9zc2libGUpOg0KPj4NCj4+IC8qDQo+PiAgIMKgKiBDb3B5IGEgc2VxdWVuY2Ugb2YgYnl0
ZXMgYmV0d2VlbiByZWd1bGFyIG1lbW9yeSBhbmQgYSBtZW1vcnktbGlrZQ0KPj4gICDCoCogSS9P
IHJlZ2lvbiwgZS5nLiBzaGFyZWQgbWVtb3J5IHBsYWNlZCBpbiBSQU0gb3IgU1JBTSBtYXBwZWQg
d2l0aA0KPj4gICDCoCogZGV2aWNlIGF0dHJpYnV0ZXMuDQo+PiAgIMKgKiBUaGUgSS9PIHJlZ2lv
biBtdXN0IGJlaGF2ZSBsaWtlIGJ5dGUtYWRkcmVzc2FibGUgc3RvcmFnZTogaXQgbXVzdA0KPj4g
ICDCoCogYWNjZXB0IDgtYml0IGFjY2Vzc2VzIGF0IGFueSBieXRlIGFkZHJlc3MgYW5kIG5hdHVy
YWxseSBhbGlnbmVkDQo+PiAgIMKgKiAzMi1iaXQgYWNjZXNzZXMsIHdpdGggcGxhaW4gYnl0ZS1z
dG9yYWdlIHNlbWFudGljcyBpbiBib3RoIGNhc2VzDQo+PiAgIMKgKiAobm8gc2lkZSBlZmZlY3Rz
LCBubyBkZXBlbmRlbmN5IG9uIHRoZSBhY2Nlc3Mgd2lkdGgpLiBBbg0KPj4gICDCoCogaW1wbGVt
ZW50YXRpb24gbWF5IHVzZSBhbnkgb2YgdGhlc2Ugd2lkdGhzLCBidXQgbmV2ZXIgd2lkZXIgb25l
cy4NCj4+ICAgwqAqIFRoZSBoZWxwZXJzIGFyZSBub3Qgc3VpdGFibGUgZm9yIGRldmljZSByZWdp
c3RlcnMgd2l0aCBhY2Nlc3Mtd2lkdGgNCj4+ICAgwqAqIHJlcXVpcmVtZW50cy4NCj4+ICAgwqAq
DQo+PiAgIMKgKiBOZWl0aGVyIHBvaW50ZXIgbmVlZHMgdG8gYmUgYWxpZ25lZC4gVGhlIGFjY2Vz
cyB3aWR0aHMgaXNzdWVkIG9uIHRoZQ0KPj4gICDCoCogSS9PIHNpZGUgZGVwZW5kIG9ubHkgb24g
dGhlIGFsaWdubWVudCBvZiB0aGUgSS9PIHBvaW50ZXIgYW5kIG9uDQo+PiAgIMKgKiBjb3VudCwg
bmV2ZXIgb24gdGhlIGFsaWdubWVudCBvZiB0aGUgcmVndWxhciBtZW1vcnkgcG9pbnRlci4NCj4+
ICAgwqAqDQo+PiAgIMKgKiBJbXBsZW1lbnRhdGlvbnMgYXJlIGFyY2hpdGVjdHVyZS1zcGVjaWZp
Yzsgc2VlIHRoZSByZXNwZWN0aXZlDQo+PiAgIMKgKiBhcmNoLyovbGliL21lbWNweS17ZnJvbSx0
b31pby5jIGZvciB0aGUgZXhhY3QgYWNjZXNzIHBhdHRlcm4uDQo+PiAgIMKgKi8NCj4+DQo+PiBU
aGUgQXJtLXNwZWNpZmljIG5vdGUgaW4gbWVtY3B5LXtmcm9tLHRvfWlvLmMgd291bGQgdGhlbiBz
dGF0ZSB0aGUNCj4+IGNvbmNyZXRlIHBhdHRlcm46IDgtYml0IGFjY2Vzc2VzIHVudGlsIHRoZSBJ
L08gcG9pbnRlciBpcyAzMi1iaXQNCj4+IGFsaWduZWQgYW5kIGZvciB0aGUgdHJhaWxpbmcgY291
bnQgJSA0IGJ5dGVzLCAzMi1iaXQgYWNjZXNzZXMgZm9yIHRoZQ0KPj4gYWxpZ25lZCBidWxrLiBJ
J2QgYWxzbyBkcm9wIHRoZSAidG9sZXJhdGUiIHdvcmRpbmcgaW4gZmF2b3VyIG9mIHRoZQ0KPj4g
YWJvdmUuDQo+Pg0KPj4gLSBpbXBsZW1lbnRhdGlvbg0KPj4NCj4+IEFzIHByb3Bvc2VkOiBvbmx5
IHRoZSBJL08gcG9pbnRlciBpcyBhbGlnbmVkIHVwOyB0aGUgUkFNIHNpZGUgdXNlcw0KPj4gZ2V0
X3VuYWxpZ25lZF9sZTMyKCkvcHV0X3VuYWxpZ25lZF9sZTMyKCkgZm9yIHRoZSAzMi1iaXQgcGFy
dC4gVGhlDQo+PiBfbGUzMiB2YXJpYW50cyBhcmUgdXNlZCBkZWxpYmVyYXRlbHk6IHBhaXJlZCB3
aXRoIHJlYWRsKCkvd3JpdGVsKCksDQo+PiB3aGljaCBhcmUgZGVmaW5lZCBhcyBsaXR0bGUtZW5k
aWFuIGFjY2Vzc29ycywgdGhpcyBwcmVzZXJ2ZXMgdGhlIGJ5dGUNCj4+IHNlcXVlbmNlIHJlZ2Fy
ZGxlc3Mgb2YgQ1BVIGVuZGlhbm5lc3MuIFRoYXQgaXMgdGhlIG9ubHkgZW5kaWFubmVzcw0KPj4g
YXNwZWN0IHdvcnRoIGEgbWVudGlvbiwgYW5kIEknbGwgcmV3cml0ZSB0aGUgY29tbWl0IG1lc3Nh
Z2UNCj4+IGFjY29yZGluZ2x5IChkcm9wcGluZyB0aGUgc2VudGVuY2UgeW91IHBvaW50ZWQgb3V0
KS4NCj4+DQo+PiBXb3VsZCB0aGF0IGFkZHJlc3MgeW91ciBjb25jZXJucz8NCj4gSSB0aGluayBz
by4NCj4NCj4gSmFuDQoNCg0KVGhhbmsgeW91LiBJIHdpbGwgbWFrZSB0aGUgY2hhbmdlcyBhbmQg
cG9zdCB0aGVtIGluIHYxMy4gSSdsbCB3YWl0IGEgDQpsaXR0bGUgd2hpbGUgYmVmb3JlIHBvc3Rp
bmcgdG8gYXZvaWQgc3BhbW1pbmcgcGF0Y2ggdmVyc2lvbnMuDQo=

