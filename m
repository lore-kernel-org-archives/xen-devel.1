Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04ED606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 04:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=rfm//xob
Received: from list by lists.xenproject.org with outflank-mailman.1471272.1679777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOSCg-00044Z-ET; Wed, 04 Nov 2026 04:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471272.1679777; Wed, 04 Nov 2026 04:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOSCg-00044S-Bj; Wed, 04 Nov 2026 04:02:26 +0000
Received: by outflank-mailman (input) for mailman id 1471272;
 Wed, 04 Nov 2026 04:02:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xOSCe-00044M-L6
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 04:02:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOSCY-004fjc-Qk
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 05:02:23 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6aeaae38-bab6-0a2a0a5309dd-0a2a4502a1e2-6
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:02:18 +0100
Received: from [40.107.130.107]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6aeaae4a-6ca4-0a2a45020019-286b826b5234-4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:02:18 +0100
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com (2603:10a6:20b:d4::24)
 by VI0PR03MB11252.eurprd03.prod.outlook.com (2603:10a6:800:333::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 04:02:15 +0000
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416]) by AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 04:02:15 +0000
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
 b=QwBiqciYKGz6EqDwfUYZQJgwQFjg+Zn94CcvFxCa4l/9srsMtoavUc3GPNvlAOmD/7yaLhptqQ+d1MwtgKEQUSuwCMMCekAgIvQjhhPzIqjHXg6m7ctwOjvDUicgpmW9WVcsEW1LnPzdet4Il+9jHWaj8rKeRiWLeUnDP4NtBQXn41NKqodbXvEQMBOZMZHtwRRgvPDJxU/V1TvDp5Fig95DKO383aaFM1P+mJHBSn7IxCvyr2DD4VPtOmj2Xs9wYTujlChTRD7tj084M/5Fd/Li+zlcN2xInYiaf+L22ElXz9z5qBCEnA+0lH3NKwmtZfpFuAF5zmNBePuhVCiCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trhjAyrQ7+3CTUr81pxeGetCJ/nM4MIHU2VH05ROFdY=;
 b=qpwpZrovqtZPeXpKU/qSwU2sr3d56cgwJkiIS4uw8eVm5TnS/I9XgWOCyWIo+znab4qKdHi0lCcvwi7cw5xSqSwV5npbjeZ2QY2/OBjLqh+kEcKfUOS5iPLM6XgvVsPqDT1MiAopwBEUYwsIEY7463IVgRftsgl0sD19r+zFk4uX8MuRNsqaEUlcSwm27vO6u6ee8iMcYO7TY0ppp1sMkAaZ6qqIjKOWbbaIS5UuhAazPaZlohPQKMc9fh+AJpTX6711q7sCE8V3A9x2RaE65kKP7EHya687QenjsbmgX/9c9h87ZFvvN1GkhkmZWCKhgza+pPj5kjZpDoz4fiDzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trhjAyrQ7+3CTUr81pxeGetCJ/nM4MIHU2VH05ROFdY=;
 b=rfm//xobVmVGcqh7FkdIt5dD0CBGdbGfgw+eNkxh1D184Ug1aZkdCgU3573NQUZsUfdiPRMOepPLLFOiAjCy7cwpz+TVaGJMIKpWhgnkgnjBFcEbWDbxwMZl/YsgpQLTFzZwWOnlqsmuLyGb0njkwJkDMzyoZ6sya6FhE7JfwqHXRavROz4+8C3aukLUgosSntrOZigQECWvZcnQJzgazsV4wbfr7LuqKbmIEE4J2af8ZpmwJkPAyAZhtljL5c2FphGVTkD5EhecsuZA5DEdO5IAMqE9GCSc2ZrIlhPFNKXq8vkqciKjpFfYV6lgIUjSUwZgEuXsz6aN1UhuTfIxdA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v15 4/6] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Thread-Topic: [PATCH v15 4/6] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Index: AQHda6I5GzExcGGajkKEjRRj5IyqZw==
Date: Wed, 4 Nov 2026 04:02:14 +0000
Message-ID: <878q39nt17.fsf@epam.com>
References: <cover.1793717221.git.oleksii_moisieiev@epam.com>
	<a918c12ec2c60f85fdbfd707e309669e2d173732.1793717221.git.oleksii_moisieiev@epam.com>
In-Reply-To:
 <a918c12ec2c60f85fdbfd707e309669e2d173732.1793717221.git.oleksii_moisieiev@epam.com>
	(Oleksii Moisieiev's message of "Tue, 3 Nov 2026 14:47:13 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB6070:EE_|VI0PR03MB11252:EE_
x-ms-office365-filtering-correlation-id: 3365048f-2d77-4ec4-aed8-08df3a286945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|42112799006|38070700021|261022105027099003|261009223027099003|261021121427099003|4143699003|11063799006|56012099006|261102123227099003|261021133027099003|261021135927099003|261022115727099003|261022075727099003|261021130227099003|261021123027099003|261026121527099003|261026135527099003|261026140227099003|261026130827099003|261028144727099003|261022113327099003|10067099003|22082099003|18002099003|3023799007|6133799003|4133799003;
x-microsoft-antispam-message-info:
 3jBNjwY68T6WqwP22cvbyEK6kg3zLvHIet8n0ulKAu+KN8zDAa2Dh7Ov9PZYMYShKGKCJE63ne/UcUoMboJ3pXUH6K15WxiWINwjO+F0dXkFnhfjQKub2LjqnMjPXWNLT+DRbiVPb3EoEpQJUsv/XAv6ZgbMaZSEAlBqDM0o1Qm5qnG7369HuLHe6t04WKNnkOx+rYj6Ut6I6pj2KQSIC0apc+94JGm5C5BXTevHXgvhWBTaxwCMoc50LGf9jmxz5Hwq9hnI3H0luiUDoen5B1alB4VqCA4mXLhCchjNRrlb7QozF6wYJd+SyIEbgQJiAtvNoRxSeXXtSOAVRoOvxSsbcl7MIVcyFrsi710uV8kUZb87F93rRh6M4ROmezStpPKjR1/yhBRRASE722TYOpj38zQOULwc7KdRgCZITTza/9BkMe21nP0x6jaCgdEdtaessD+/EB+cZArZcDhHR9lC9X1x2egMmF7vDC7KIXBp9TSD8sLXd8Xu8xWQiR7GR7QBG6d7eN772FMf3g2BOiVHNsZ1n4MfOWVkM0xwWlEft6nZYtl45emMacfWJncGx5dkU5hx4got4hlaRbzp0+lGMq7Do/LJM65XNALI4bgMXO1Ybirc0o5NK28LQXudPROomfclG6kkFBfJYOcUMEcqBxcVFzE6xm/9FMlIczA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB6070.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(42112799006)(38070700021)(261022105027099003)(261009223027099003)(261021121427099003)(4143699003)(11063799006)(56012099006)(261102123227099003)(261021133027099003)(261021135927099003)(261022115727099003)(261022075727099003)(261021130227099003)(261021123027099003)(261026121527099003)(261026135527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261022113327099003)(10067099003)(22082099003)(18002099003)(3023799007)(6133799003)(4133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OsdK01Wcgb3Vxtp0ziNBgVh+a0rtzhcAQyJOzAqy+iV6xgTsBlkr/ydpbq?=
 =?iso-8859-1?Q?eevQSZu5akQ9J8GBBIJ5WgaS2P97k5a5a0358DNGfNzo248YGpYRp3+7Ku?=
 =?iso-8859-1?Q?2iibpaFE9zyAvu2On6wk2CD93KB7e8j+W5fXtBJwzg3mEJPSukVbW5ZHVe?=
 =?iso-8859-1?Q?4Ckb5+Hw9nrjyAI9Z5w/59vCSAhWMFQeO0S3JGkchan1DzUmy6Ukq1YaaJ?=
 =?iso-8859-1?Q?lBxA01ea7Z4tmAkjubAqPvsMjI/L7TGPEJF2yFMdEFf5P51MnmCP1YmYBl?=
 =?iso-8859-1?Q?xlfj83ZNvNBVRCSYr8uUZQyAMPMzMD5Gp01JktmzPrab+Oc0yqiBogM6Iz?=
 =?iso-8859-1?Q?zJbNGyUg5srpJuMwPUlvjWLe6SReIxTa5ApZdKOqLn5YIf5xtaVgDkE0Xy?=
 =?iso-8859-1?Q?xCc3mXWGP/9Y9mEEf+4g1jtIcEzznNXLqcV6CRQddiFLe6s0wGD/cqrTtG?=
 =?iso-8859-1?Q?IsoznFW4UiFvlLF5wxQjJ34wKJGvPJxHkvcLk/RtaCfP/u2XbtYCX7bnaY?=
 =?iso-8859-1?Q?3NiUfN1k2A6EbwMiUZSM/CehqPotFk6YcNnP55nle6prnBRUTuh4MX7IPW?=
 =?iso-8859-1?Q?y+xvEZqys7qlZFcF6fuuvt7sPkbdcDxvDw3dWWWN6nCU+5pat3TS9chdN5?=
 =?iso-8859-1?Q?OYw12V7aP07sHVw/Xq09FCYJN0HPWjTh0v+kNKTpeYgCwPAnYktBTgmG1L?=
 =?iso-8859-1?Q?CHuipWmP//TfFXk9iG4jG2KQ66AsoaCNQMaR8bjZScoINwHnCpxwUmZYDu?=
 =?iso-8859-1?Q?Rxgjh2IB3DOdhWhArCCETniTljHfZ/lUj5iPAPiBPGfQnsIpZ2XUfbR586?=
 =?iso-8859-1?Q?+FHUZWSNLFhbcMZ4qpcq4rDiD6abVSF1Ichr+nm91YcIU++K9VEh1CMFUM?=
 =?iso-8859-1?Q?A4PvkpxjV8lrG1ExY0IHQmeYQUH35lGfV2LscZ3bHWOuPvJyFxykeguoKi?=
 =?iso-8859-1?Q?5ga2tgfoAtWWT/seBKtd4NfY7aq1O7a+1AZQTcoHPWovSR+i1wq5XkqWNw?=
 =?iso-8859-1?Q?VGiSU44Bnz6DkbQDeGwqgZoOumPPAbNhiBJulS9nUgmO/Itm1AQaiOiJP/?=
 =?iso-8859-1?Q?c6ZQ+Wmu0a5tSZrvJOAQecE1CiO+1Tj3qQwAj7FkGmcCMdJqkxtcBMQOnT?=
 =?iso-8859-1?Q?Ns7RLGoZI28c+pMybAucmR1HTbeCXY6RUj9ea5XUf0mr2U2X7VJOeWuUPY?=
 =?iso-8859-1?Q?FmLzsGEm/XgDtrviO74XPmWIj4M6SFGrTKaKpgr1krkSqRu2VWqh3R0kut?=
 =?iso-8859-1?Q?d/+TFpTH4Mnp12qRUBeJgCjQJ1HyBQJkUkAM3hNIYzXFbWI12ghjnhA5eX?=
 =?iso-8859-1?Q?myvOX18FrW0o2eBAdZFtegkNhAeN1HfOhsqh/6yWCuFEoOM1VsqhuiSmr0?=
 =?iso-8859-1?Q?Gf97EKa2QvjmbkXP799C7L6Y2PoYOXXVQkdtKJ2C4HftCtQM4PtcxPK4J7?=
 =?iso-8859-1?Q?xn2oX3bQ3sP9f2jzDSGYw1Po/x9BmOP9WHh0OMa9IYPH14zAez9p5t0qmU?=
 =?iso-8859-1?Q?ixMgeQZZ96eZ3852X1qqAsRv0FDcmwx+V7KxN+t9kDWYEr2MhvyFwzV6So?=
 =?iso-8859-1?Q?KA9NKXdf7aeCgPwQJnpS0P6J4xiuG5xetg5EjNQAsscoCEI8JoFjJebSoy?=
 =?iso-8859-1?Q?uysPJKwih1qHNvIm3k0c582sH51LpbV5wHdv8VPdUFItRv5RDZ5xKRqkg2?=
 =?iso-8859-1?Q?NCVOOU9VHq1iwvnhF170Gnic6MvuG77wRL6FnWKGADIgcuCfhif8fwAgQU?=
 =?iso-8859-1?Q?lvNJRjMF6orkXtcT1VyG3smpXyQQUDGvhNWY+xnpOwmVcsDGOVrg/qZF27?=
 =?iso-8859-1?Q?3mdUh/L/bZfRrE4fIY9XocmY8gZQIsE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB6070.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3365048f-2d77-4ec4-aed8-08df3a286945
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 04:02:14.8637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHQx1IQA5oiWiqEi+iyP4qAaNsc7i3zZuPzK3NjS0+DJgdFar1Rk6O5+yRaPo0p9g6+Ws08Nqs4HNTW4bSP9iuo2KmSlh7RuWFagULJZpTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11252
X-purgate-ID: tlsNG-720697/1793764938-F16AF2AC-C94CBA73/0/0
X-purgate-type: clean
X-purgate-size: 13152
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksii,

Oleksii Moisieiev <Oleksii_Moisieiev@epam.com> writes:

> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-=
A
> (TF-A) which provides SCMI interface with multi-agent support, as shown
> below.
>
>   +-----------------------------------------+
>   |                                         |
>   | EL3 TF-A SCMI                           |
>   +-------+--+-------+--+-------+--+-------++
>   |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
>   +-----+-+  +---+---+  +--+----+  +---+---+
> smc-id1 |        |         |           |
> agent1  |        |         |           |
>   +-----v--------+---------+-----------+----+
>   |              |         |           |    |
>   |              |         |           |    |
>   +--------------+---------+-----------+----+
>          smc-id0 |  smc-id2|    smc-idX|
>          agent0  |  agent2 |    agentX |
>                  |         |           |
>             +----v---+  +--v-----+  +--v-----+
>             |        |  |        |  |        |
>             | Dom0   |  | Dom1   |  | DomX   |
>             |        |  |        |  |        |
>             |        |  |        |  |        |
>             +--------+  +--------+  +--------+
>
> The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared
> memory transport for every Agent in the system.
>
> The SCMI Agent transport channel defined by pair:
>  - smc-id: SMC id used for Doorbell
>  - shmem: shared memory for messages transfer, Xen page
>  aligned. Shared memory is mapped with the following flags:
>  MT_DEVICE_nGnRE.
>
> The following SCMI Agents are expected to be defined by SCMI FW to enable=
 SCMI
> multi-agent functionality under Xen:
> - Xen management agent: trusted agents that accesses to the Base Protocol
> commands to configure agent specific permissions
> - OSPM VM agents: non-trusted agent, one for each Guest domain which is
>   allowed direct HW access. At least one OSPM VM agent has to be provided
>   by FW if HW is handled only by Dom0 or Driver Domain.
>
> The EL3 SCMI FW is expected to implement following Base protocol messages=
:
> - BASE_DISCOVER_AGENT (required for Xen and secondary agents without reg)
> - BASE_RESET_AGENT_CONFIGURATION (optional)
> - BASE_SET_DEVICE_PERMISSIONS (optional)
>
> The driver binds to the arm,scmi-smc management node inside a Xen-specifi=
c
> container compatible with xen,sci under /chosen/xen. Other SCMI nodes,
> including the host /firmware/scmi, are ignored by the mediator.
>
> Describe secondary agents as xen,scmi-agent children of an agents node
> inside the same container. The agents node uses #address-cells =3D <1> an=
d
> `#size-cells =3D <0>`. Each child provides arm,smc-id and a single shmem =
phandle.
> The optional single-cell reg property supplies the SCMI agent ID (0..254)=
.
> When reg is absent, Xen discovers the ID using BASE_DISCOVER_AGENT on tha=
t
> channel. Use agent@<id> for an explicit ID, and a node name without a uni=
t
> address for discovery. Disabled agent nodes are ignored; at least one
> enabled secondary agent is required.
>
> Resolve discovered IDs before adding channels to the list, so duplicate
> IDs are rejected consistently, including clashes with Xen's management
> agent. Explicit IDs avoid mapping and probing secondary channels during
> initialization. Xen always discovers its own management agent ID.
>
> Keep shared-memory nodes under xen_scmi_config and leave the platform's
> existing /firmware/scmi and host OSPM shared-memory node unchanged. Chann=
el
> nodes describe locations, rather than reserve memory: if firmware buffers
> occupy system RAM, the platform DT must reserve the whole firmware-owned
> range in /reserved-memory before Xen boots. A single reservation may cove=
r
> multiple channels, including unused ones. SRAM outside system RAM does
> not require a RAM reservation. Channel nodes need not be moved into
> /reserved-memory.
>
> For example:
>
> / {
>     #address-cells =3D <2>;
>     #size-cells =3D <2>;
>
>     scmi_shm_0: sram@47ff0000 {
>         compatible =3D "arm,scmi-shmem";
>         reg =3D <0x0 0x47ff0000 0x0 0x1000>;
>     };
>
>     firmware {
>         scmi: scmi {
>             compatible =3D "arm,scmi-smc";
>             arm,smc-id =3D <0x82000002>;
>             #address-cells =3D <1>;
>             #size-cells =3D <0>;
>             shmem =3D <&scmi_shm_0>;
>         };
>     };
>
>     chosen {
>         #address-cells =3D <2>;
>         #size-cells =3D <2>;
>         ranges;
>
>         xen {
>             #address-cells =3D <2>;
>             #size-cells =3D <2>;
>             ranges;
>
>             xen_scmi_config {
>                 compatible =3D "xen,sci";
>                 #address-cells =3D <2>;
>                 #size-cells =3D <2>;
>                 ranges;
>                 xen,dom0-sci-agent-id =3D <0>;
>
>                 /* Xen management channel */
>                 scmi_shm_1: sram@47ff1000 {
>                     compatible =3D "arm,scmi-shmem";
>                     reg =3D <0x0 0x47ff1000 0x0 0x1000>;
>                 };
>
>                 scmi_shm_2: sram@47ff2000 {
>                     compatible =3D "arm,scmi-shmem";
>                     reg =3D <0x0 0x47ff2000 0x0 0x1000>;
>                 };
>
>                 scmi_shm_3: sram@47ff3000 {
>                     compatible =3D "arm,scmi-shmem";
>                     reg =3D <0x0 0x47ff3000 0x0 0x1000>;
>                 };
>
>                 scmi_xen: scmi {
>                     compatible =3D "arm,scmi-smc";
>                     arm,smc-id =3D <0x82000003>;
>                     #address-cells =3D <1>;
>                     #size-cells =3D <0>;
>                     #access-controller-cells =3D <1>;
>                     shmem =3D <&scmi_shm_1>;
>                 };
>
>                 agents {
>                     #address-cells =3D <1>;
>                     #size-cells =3D <0>;
>
>                     agent@0 {
>                         compatible =3D "xen,scmi-agent";
>                         reg =3D <0>;
>                         arm,smc-id =3D <0x82000002>;
>                         shmem =3D <&scmi_shm_0>;
>                     };
>
>                     agent@2 {
>                         compatible =3D "xen,scmi-agent";
>                         reg =3D <2>;
>                         arm,smc-id =3D <0x82000004>;
>                         shmem =3D <&scmi_shm_2>;
>                     };
>
>                     agent@3 {
>                         compatible =3D "xen,scmi-agent";
>                         reg =3D <3>;
>                         arm,smc-id =3D <0x82000005>;
>                         shmem =3D <&scmi_shm_3>;
>                     };
>                 };
>             };
>         };
>     };
> };
>
> To discover a secondary agent ID instead, omit reg from its node:
>
>     agent-domu {
>         compatible =3D "xen,scmi-agent";
>         arm,smc-id =3D <0x82000004>;
>         shmem =3D <&scmi_shm_2>;
>     };
>
> The agents child nodes replace the former scmi-secondary-agents list and
> `#scmi-secondary-agents-cells` property. The xen,sci subtree is omitted f=
rom
> Dom0's DT; the host OSPM channel is passed through when SCMI is enabled
> for Dom0. Full configuration and domain examples are included in the
> binding documentation and the hypervisor guide in patch 6.
>
> SMC ID Configuration and SCMI Connection Compatibility:
>
> The configuration allows the same device tree to work for both baremetal
> Linux and Linux Dom0. This is achieved because:
>
> - Baremetal Linux uses: func_id 0x82000002, scmi-shmem 0x47ff0000
> - Dom0 Linux uses: func_id 0x82000002, scmi-shmem 0x47ff0000
> - Xen management uses: func_id 0x82000003, scmi-shmem 0x47ff1000
>
> This works because the privileged SCMI connection in EL3 firmware is not
> tied exclusively to func_id 0x82000002. The EL3 firmware supports multipl=
e
> SCMI agents with different SMC IDs and shared memory regions. Each agent
> (Dom0 via 0x82000002, Xen via 0x82000003, other domains via additional
> func_ids) has an independent communication channel to the firmware.
>
> The key distinction is that Xen's management channel (0x82000003) is used
> for privileged operations like agent configuration and device permissions
> (BASE_SET_DEVICE_PERMISSIONS, BASE_RESET_AGENT_CONFIGURATION), while Dom0=
's
> channel (0x82000002) is used for standard SCMI protocol operations (power=
,
> clock, sensor management, etc.). The firmware enforces different permissi=
on
> levels for each agent based on their agent_id, not the SMC ID.
>
> Therefore, there is no conflict: Linux Dom0 retains its standard SCMI
> connection for hardware management, while Xen uses its separate privilege=
d
> channel for mediating access between multiple domains.
>
> - It implements the SCI subsystem interface required for configuring and
> enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
> SCMI functionality for domain it has to be configured with unique support=
ed
> SCMI Agent_id and use corresponding SCMI SMC shared memory transport
> [smc-id, shmem] defined for this SCMI Agent_id.
> - Once Xen domain is configured it can communicate with EL3 SCMI FW:
>   -- zero-copy, the guest domain puts SCMI message in shmem;
>   -- the guest triggers SMC exception with smc-id (doorbell);
>   -- the Xen driver catches exception, do checks and synchronously forwar=
ds
>   it to EL3 FW.
> - the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
>   management agent channel on domain destroy event. This allows to reset
>   resources used by domain and so implement use-case like domain reboot.
>
> Dom0 Enable SCMI SMC:
>  - set xen,dom0-sci-agent-id=3D<agent_id> under the xen,sci container in
>    the Host DT. If the property is absent, SCMI is disabled for Dom0
>    and all SCMI nodes are removed from the Dom0 DT. The driver updates
>    the Dom0 DT SCMI node "arm,smc-id" value and fixes up the shmem
>    node according to the assigned agent_id.
>
>  - pass dom0=3Dsci-agent-id=3D<agent_id> in Xen command line. if not prov=
ided
>    SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT=
.
>    The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shm=
em
>    node according to assigned agent_id.
>
> Guest domains enable SCMI SMC:
>  - xl.cfg: add configuration option as below
>
>    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
>
>  - xl.cfg: enable access to the "arm,scmi-shmem" which should
>  correspond assigned agent_id for the domain, for example:
>
> iomem =3D [
>     "47ff2,1@22001",
> ]
>
>  - DT: add SCMI nodes to the Driver domain partial device tree as in the
>  below example. The "arm,smc-id" should correspond assigned agent_id
>  for the domain:
>
> passthrough {
>    scmi_shm_0: sram@22001000 {
>        compatible =3D "arm,scmi-shmem";
>        reg =3D <0x0 0x22001000 0x0 0x1000>;
>    };
>
>    firmware {
>         compatible =3D "simple-bus";
>             scmi: scmi {
>                 compatible =3D "arm,scmi-smc";
>                 arm,smc-id =3D <0x82000004>;
>                 shmem =3D <&scmi_shm_0>;
>                 ...
>             }
>     }
> }
>
> SCMI "4.2.1.1 Device specific access control"
>
> The XEN SCI SCMI SMC multi-agent driver performs "access-controller"
> provider function in case EL3 SCMI FW implements SCMI "4.2.1.1 Device
> specific access control" and provides the BASE_SET_DEVICE_PERMISSIONS
> command to configure the devices that an agents have access to.
> The DT SCMI node should "#access-controller-cells=3D<1>" property and DT
> devices should be bound to the Xen SCMI.
>
> &i2c1 {
>         access-controllers =3D <&scmi 0>;
> };
>
> The Dom0 and dom0less domains DT devices will be processed
> automatically through sci_assign_dt_device() call, but to assign SCMI
> devices from toolstack the xl.cfg:"dtdev" property
> shall be used:
>
> dtdev =3D [
>     "/soc/i2c@e6508000",
> ]
>
> xl.cfg:dtdev will contain all nodes which are under SCMI
> management (not only those which are behind IOMMU).
>
> Additionally, this patch adds documentation for the pre-existing
> scmi-smc-passthrough command line option, which was previously
> undocumented.
>
> [0] https://developer.arm.com/documentation/den0056
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> [2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/Documentation/devicetree/bindings/access-controllers/access-controll=
ers.yaml
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

[...]


--
WBR, Volodymyr

