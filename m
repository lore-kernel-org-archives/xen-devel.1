Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35575606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=c0NZyoZS
Received: from list by lists.xenproject.org with outflank-mailman.1491036.1691976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxu1-0007MG-3q; Mon, 16 Nov 2026 14:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491036.1691976; Mon, 16 Nov 2026 14:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxu0-0007Lo-UD; Mon, 16 Nov 2026 14:41:48 +0000
Received: by outflank-mailman (input) for mailman id 1491036;
 Mon, 16 Nov 2026 14:41:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xSxty-0006eA-UJ
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:41:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSxty-00BMqu-AT
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:41:46 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb161a-2eae-0a2a0a5409dd-0a2a4504af3c-46
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:41:46 +0100
Received: from [52.101.66.113]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb1627-b57f-0a2a45040019-346542718d39-7
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:41:46 +0100
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by GV2PR03MB11211.eurprd03.prod.outlook.com
 (2603:10a6:150:30d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:41:41 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0592.012; Mon, 16 Nov 2026
 14:41:41 +0000
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
 b=Csf1vF1V7Z99lnwZtHiIMfk2MWVt31l7AKtabf4WIkcxB8KHQhHdX/8FwZYYjK6UzB8aLjyiD65lYzl4d6AWLXf1E+oDPruF0WqMJ9DSysU8PFJqkShV1XMPAibz/Nwz6a6mnz7D+OQnB2x6xEGsJPrrBj5ap9ztOHUv41EeQNsPYTn1frOzkdXL0W5YU47cDg+00AR7l2vVCxUjZCOEEvBes7sYKZiXbQ0+3Ey6HZbAAoC9gkbfYDiZ5aJwJHngqEKSIir59SayzUxGMLxcE0xEwZcVbtPZWZm0qjx9334+cIW3X2JTXHXQo1gzDipVggfifQqsi4dJwalKb2lydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPbeoBdLxR0jKsM9ClJGzAg/zJ+VggFYKFyOH4PSLK0=;
 b=NqhcU9e8YBd5da6nTims4qwB80fMY63+did4+VZa0oSm/QikxBfaFUMymYN+s/UcbL9qIqwKgjybwTz6a7RdO9vul/GHlgQ5r/Zq913e7z6mcXNUxsSNUkGEXp2X/dIglqqNCL+K97ToBhQGU6rYkwExVWqHRgM9FUX63Xe9xTN+IHmtBpWlZ+5VEE4i13cWVyr5aaWsQR89bP25zxfnr2bWUlUVqXLRtSiPPcEtD7WOP+bm6cFo7n4DBJIz/Lsbj8ROUj6EydsmsjVFgXZFz8K75AJWjkokebM4wqdgyMXxzKV/D1JyEN9iB/LH2w1KVKq8RSeBRpxAaGvV0sQaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPbeoBdLxR0jKsM9ClJGzAg/zJ+VggFYKFyOH4PSLK0=;
 b=c0NZyoZSVl4Ij+ZecKihH2XGUoR+zWDpgbxwCWiOFUiv+2iUiK61dDxq8Ld2Egcb2x4KvRPHqe84/6t7KRd3clUh+ildmjf/xxD+Grk/ep3B6OlpFx6aGrTZ1BhaWishfCqkGyaAm978eaG1sUBIm9L5AJqZgMsRAwt6S3z5bQWZqVu0oFiN5k3hKz2Z51BDzM2PnHM3fiy9E5mtUP0+HN+reClEuyfpdJ/DCWYlnULktNA9pEdY1hJGY8wynce7Y+TTcTdjKfYFLcgN7gECZj0evkAHl5CJBIqdTeEUjXwimsOLN2/1Bt2WqD5v+Bv4zn5/QBFYa7GKnOSFW7tVwQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v16 4/6] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Thread-Topic: [PATCH v16 4/6] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Index: AQHdddiWXJg4oXa1gEmNDWvyhUvCnw==
Date: Mon, 16 Nov 2026 14:41:39 +0000
Message-ID:
 <1b9d9b424ca6ace85d0c80983baea8dd0812d3f9.1794839953.git.oleksii_moisieiev@epam.com>
References: <cover.1794839953.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1794839953.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR03MB11113:EE_|GV2PR03MB11211:EE_
x-ms-office365-filtering-correlation-id: f7691459-6a29-4763-1863-08df43efba59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|261026135527099003|261026140227099003|261026121527099003|261026130827099003|261028144727099003|261021135927099003|261021133027099003|261021121427099003|261021123027099003|261021130227099003|261022075727099003|261022105027099003|261022115727099003|261022113327099003|261102123227099003|38070700021|5023799004|56012099006|11063799006|10067099003|260925022911599003|260925021311599003|260925021911599003|22082099003|18002099003|261009223027099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 UItG48SDjzIZrQaInY2wpTK/hDIx6nn5kBBquwuj52BecAZfiQKrISEJ1Bol5QKDCHs/ZsvZ/RspJ3Ou9UAWycqO1Ojv65s1lIFavTGLlUcV9Lw/aSvrMdbhL1prLXqZCTaFQGTzvCMhOJuUwafevMOWvzUgVNWbKcjqhd3H+djeEJ0ockpRJpyg01qmdI6Tisl+7u6NcjzDmHWp6cF/UCB39MxriKegSApXshAVuNHLKOw8jh4MZcbicd5BZo9iIoYVdeEX8u07Q7eYU47yxiKwgW3oyGV9ixCevJh8oG6LyzI1ex575UjOYJTDAcdtVIl4c4dKKLT5ClF66UcmFJOYvn3UUSEGTTcuaq6KjSuqr3Guu469nUhlKFo5Ek/Z3J4k09LfQEjCdySHIMCFRz3qRvH6xIZjB0ZtiOm1lyFmhdGcmjQgMowCqIG8nGnD8Bg+yDLhroaS8Eb5xCr2cikJEUa2ZdqCUt7tnwZ9PUvOcZUL7FHNWfmg+kzM73rFOXHkvjpS8hbpYvZeUy3z/iRVv7a/8n8IBHUMOQk7sKcfVYLwEs6mWwDyoiM9QYqo5eI5rOKuJzoX2v/C6lWbTyOZdCdL/TugTg2xbgW4vpTaYmD2NV9PhA3wkg110WFucSi3AcH7o4alCpGwh4oUTdVTqsVd+kUg1GYuL7VSepY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(261026135527099003)(261026140227099003)(261026121527099003)(261026130827099003)(261028144727099003)(261021135927099003)(261021133027099003)(261021121427099003)(261021123027099003)(261021130227099003)(261022075727099003)(261022105027099003)(261022115727099003)(261022113327099003)(261102123227099003)(38070700021)(5023799004)(56012099006)(11063799006)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(22082099003)(18002099003)(261009223027099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Vjz6ZzoeCsk1e4WIWfEYw34P3ZYGyuuq+ZAQ061g731NWaE9zIszzIfh1n?=
 =?iso-8859-1?Q?BrFSYpu+47yvZKxhVWKBypE2FDdF19kDsme9qaKE6FxMIF+lBSdKuNMtnY?=
 =?iso-8859-1?Q?Nng8cwykeHWxyBwCpdNRYeD8Fx1IBnEvu0j9HDtY+AI/W+c4qh8Qcb2vE0?=
 =?iso-8859-1?Q?xG4HqaSUP9pjCLsBopSkKB63fxVwvVONFlwBXT1Zq8jgqdCJKVexLAzBi/?=
 =?iso-8859-1?Q?nzAt0I5JusMVRspCiCKPHg4HemX5CGYe1fZsayNrOqtIK/oYzcpYOiniH2?=
 =?iso-8859-1?Q?mfMati6MV8CxPjihcg4vRV5A0oCWN0+VNfftqr7P9i5A3Vq/XE4Xkid+Dx?=
 =?iso-8859-1?Q?V+HNtG1DxWvbci4qGEzcZm+gk4UXzgggHi6BkKxTdne3Q4F8TFZt8i8gEw?=
 =?iso-8859-1?Q?/3Qe3jaJ9wB5DK+dYZNUrYRajDMXv8MR71A3TFE3gwIMDnwqkFEWa5TsC3?=
 =?iso-8859-1?Q?IjLCZETpCcvrUDr2wvpAQCRZG7ncdG8mDufP7rm7MXoBCL2qvWgMXOULmD?=
 =?iso-8859-1?Q?OF8CleIrR6ZT82IMHiz3AaEqsCdW3oMgmoQbM8kOSXIJkuamVWHyJV8/yQ?=
 =?iso-8859-1?Q?X3QuTMnyhgPupXvcYYzgcXzNYgxxX9jAZw7PXIBkrEmgBtS4bItQ+YdOTm?=
 =?iso-8859-1?Q?jI6OAGcE8KYZo+71kEIkeAA+MV0+uZovhOxc4+WzWaEy0dtVbEhmnKC9uT?=
 =?iso-8859-1?Q?zlzrarcrYPmLlqlK9w+qpFm+NGOaFgdLGBMlIIxScoiiYovz+xsv/zBqLX?=
 =?iso-8859-1?Q?WXj3UQcMOydIZOHvMA8PiLA5SUhu2980lznKOL6+m+XQuXNTBgg+P3Sfq8?=
 =?iso-8859-1?Q?dNtTwsb+uAXAujNZcrqrHeYMYTprZm9fclXfuqODmxLrb6Tt8jP8on9/SC?=
 =?iso-8859-1?Q?urx3x9MEklb1FzVYUgHITTQ/8Ff1/ldz7ZgpBT/6s6Qd3dFK1dE+EmWVSg?=
 =?iso-8859-1?Q?Bdp0ewyBcf07sb4Ipn4s194yC3ERrrV0oyfA8+egJVQydusqI31uRpnQW4?=
 =?iso-8859-1?Q?8RIGVJLPsUKrO3lrVo9vWqd2CyFxeFQ0lAR9S7zjxN8gSJtXvKrOOoVqJo?=
 =?iso-8859-1?Q?543GPTzLvqg83k6NJDUMVHhe6QBW6Xq2ZuTW//gNBAh0uZWqYLk2t6ysyX?=
 =?iso-8859-1?Q?sWY0cheZqi424nWW7dkEnMt84NvYYrvmQavEi5jVwoJ8KJgFp9Dj1J6b9+?=
 =?iso-8859-1?Q?I6+dztnAxwWehlxHBaU+LdWmYCGTtLd1GoQptxqud9WNE5MqEbcScBzZmG?=
 =?iso-8859-1?Q?6JJO5UX27T3TTc/xy/LxjrtWPvMP4CsL2dHvdhxnVFWMPX6AzFcaC9HRVS?=
 =?iso-8859-1?Q?JGsq9YohQR+I0ro4sAE1E13rU9i9qAbxHqAROZtuBfXHieoqDnJz94NNhN?=
 =?iso-8859-1?Q?WvUQw6OffvkSOyfcx3qYg/b8RvtKVzJ0pGl0EGp6LwxYj7B/fdAxSTx8s4?=
 =?iso-8859-1?Q?gIHxZEW2acIsxY432vMgwcpGUbyjElAWcNop6VbfzPS4QpGIccc0k2Qdcm?=
 =?iso-8859-1?Q?naA8ezZoFCOfatvkYfvMALvI9htITuHG5UvARM8V5+hWNZaTS5GML+YcjT?=
 =?iso-8859-1?Q?Hhphu4Sap6HJ6Rh36nbw4FIFq2qHY//fZO7x7/6WnEFbxnK3VwECkL5S9x?=
 =?iso-8859-1?Q?880l7BLvVLnzWG94nVtdq2r9NLfJW47SPH95GJo7WHAyRtjRGfVdG28NTW?=
 =?iso-8859-1?Q?BBsbAilooECq9CL7fw21PcqD0ENHABiP59Bc1hTb2gDRBYEdDunMOpSCzz?=
 =?iso-8859-1?Q?P3DxZ/NXO1VdTXCRoJ1PRLKTS3JTOYRhHGbaaL85pyWDqtoLLmYxeNzerS?=
 =?iso-8859-1?Q?1Qh4+Dt9T1V0MYsAqzmHxs+sIpa0q0Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7691459-6a29-4763-1863-08df43efba59
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 14:41:39.6945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cu+NOKyxDh4nnYLzRY9gP9Vp87oDqI8ffQCQFdVlJxkqWXzMvbFUHAhy8NB7vENe7vzzyl3JB9Akh6hO2gH05sB9Z6ExPuJjscaumalMAUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11211
X-purgate-ID: tlsNG-ebf023/1794840106-518D18F0-EB411527/0/0
X-purgate-type: clean
X-purgate-size: 76617
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an SCI mediator for Arm EL3 firmware, such as Trusted Firmware-A
(TF-A), that provides a separate SCMI SMC shared-memory channel for each
agent. Xen keeps a trusted management agent and assigns secondary agents
exclusively to domains, as shown below.

  +-----------------------------------------+
  |                                         |
  | EL3 TF-A SCMI                           |
  +-------+--+-------+--+-------+--+-------++
  |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
  +-----+-+  +---+---+  +--+----+  +---+---+
smc-id1 |        |         |           |
agent1  |        |         |           |
  +-----v--------+---------+-----------+----+
  |              |         |           |    |
  |              |   Xen   |           |    |
  +--------------+---------+-----------+----+
         smc-id0 |  smc-id2|    smc-idX|
         agent0  |  agent2 |    agentX |
                 |         |           |
            +----v---+  +--v-----+  +--v-----+
            |        |  |        |  |        |
            | Dom0   |  | Dom1   |  | DomX   |
            |        |  |        |  |        |
            |        |  |        |  |        |
            +--------+  +--------+  +--------+

Each channel consists of an arm,smc-id doorbell and a shared-memory buffer
whose address and nonzero size are Xen page aligned. Xen maps shared
memory as Device memory. Guests exchange messages directly through their
assigned buffer; Xen checks the SMC function ID before forwarding the
call synchronously to EL3.

Require BASE_SET_DEVICE_PERMISSIONS support. Query its availability using
Base PROTOCOL_MESSAGE_ATTRIBUTES before registering the mediator and fail
initialization if the command is unavailable. Firmware must enforce the
permissions configured by Xen and prevent untrusted agents from changing
other agents' permissions.

Keep BASE_RESET_AGENT_CONFIGURATION optional. Request an agent reset
through the management channel when relinquishing a domain's resources.
Warn if reset fails, explaining that device state and permissions may
persist and agent reuse may be unsafe. Unsupported reset permits teardown;
other reset errors propagate to the caller.

Bind only to the arm,scmi-smc management node inside a xen,sci-compatible
node beneath /chosen. Other SCMI nodes, including the host /firmware/scmi,
are ignored by the mediator. Describe secondary agents as xen,scmi-agent
children of its agents node, with #address-cells =3D <1> and
phandle. At least one enabled secondary agent is required.

The optional single-cell reg property specifies an agent ID in 0..254.
Use a matching hexadecimal unit address for an explicit ID and retain a
node label for domain phandle references. For example:

/ {
    #address-cells =3D <2>;
    #size-cells =3D <2>;

    scmi_shm_0: sram@47ff0000 {
        compatible =3D "arm,scmi-shmem";
        reg =3D <0x0 0x47ff0000 0x0 0x1000>;
    };

    firmware {
        scmi: scmi {
            compatible =3D "arm,scmi-smc";
            arm,smc-id =3D <0x82000002>; /* Host OSPM agent smc-id */
            #address-cells =3D <1>;
            #size-cells =3D <0>;
            shmem =3D <&scmi_shm_0>; /* Host OSPM agent shmem */
        };
    };

    chosen {
        #address-cells =3D <2>;
        #size-cells =3D <2>;
        ranges;

        xen {
            #address-cells =3D <2>;
            #size-cells =3D <2>;
            ranges;

            xen_scmi_config {
                compatible =3D "xen,sci";
                #address-cells =3D <2>;
                #size-cells =3D <2>;
                ranges;
                xen,dom0-sci-agent =3D <&scmi_agent_dom0>;

                /* Xen management channel */
                scmi_shm_1: sram@47ff1000 {
                    compatible =3D "arm,scmi-shmem";
                    reg =3D <0x0 0x47ff1000 0x0 0x1000>;
                };

                scmi_shm_2: sram@47ff2000 {
                    compatible =3D "arm,scmi-shmem";
                    reg =3D <0x0 0x47ff2000 0x0 0x1000>;
                };

                scmi_shm_3: sram@47ff3000 {
                    compatible =3D "arm,scmi-shmem";
                    reg =3D <0x0 0x47ff3000 0x0 0x1000>;
                };

                scmi_xen: scmi {
                    compatible =3D "arm,scmi-smc";
                    arm,smc-id =3D <0x82000003>; /* Xen management smc-id *=
/
                    #address-cells =3D <1>;
                    #size-cells =3D <0>;
                    #access-controller-cells =3D <1>;
                    shmem =3D <&scmi_shm_1>; /* Xen management agent shmem =
*/
                };

                agents {
                    #address-cells =3D <1>;
                    #size-cells =3D <0>;

                    scmi_agent_dom0: agent@0 {
                        compatible =3D "xen,scmi-agent";
                        reg =3D <0>;
                        arm,smc-id =3D <0x82000002>;
                        shmem =3D <&scmi_shm_0>;
                    };

                    scmi_agent_domu: agent@2 {
                        compatible =3D "xen,scmi-agent";
                        reg =3D <2>;
                        arm,smc-id =3D <0x82000004>;
                        shmem =3D <&scmi_shm_2>;
                    };

                    scmi_agent_domu3: agent@3 {
                        compatible =3D "xen,scmi-agent";
                        reg =3D <3>;
                        arm,smc-id =3D <0x82000005>;
                        shmem =3D <&scmi_shm_3>;
                    };
                };
            };
        };
    };
};

To discover the secondary ID from firmware, replace only
scmi_agent_domu: agent@2 with the following node. Omit reg and the unit
address, but keep the label so the domain phandle still resolves:

scmi_agent_domu: agent-domu {
    compatible =3D "xen,scmi-agent";
    arm,smc-id =3D <0x82000004>;
    shmem =3D <&scmi_shm_2>;
};

Xen always discovers its own management agent ID. For secondary agents
without reg, send BASE_DISCOVER_AGENT on the channel described by that
node's arm,smc-id and shmem. Validate the response before inserting the
channel, rejecting invalid IDs, duplicates and clashes with the management
agent. Supplying reg skips mapping and probing that secondary channel.
Discovery failure aborts initialization rather than guessing an ID from
the node name, phandle or SMC function ID.

Dom0 selects an enabled secondary agent using xen,dom0-sci-agent in the
xen,sci node, as shown above. An absent property disables SCMI for Dom0;
an invalid reference warns and disables it. When enabled, Xen copies the
host /firmware/scmi description to Dom0 unmodified. Its doorbell and
shared memory must match the selected agent's channel.

A dom0less guest selects an agent with xen,sci-agent in its xen,domain
node. Add this domain configuration to /chosen, alongside the Xen SCMI
configuration above:

/ {
    chosen {
        domU1 {
            compatible =3D "xen,domain";
            xen,sci_type =3D "scmi_smc_multiagent";
            xen,sci-agent =3D <&scmi_agent_domu>;
            /* Other domain and boot-module properties go here. */
        };
    };
};

Both selectors contain phandles to agent nodes, not numeric agent IDs.
SCI initialization completes discovery before boot-domain construction.
The optional SCI get_agent_id callback, dispatched by sci_get_agent_id(),
resolves either phandle to the configured or discovered ID saved with the
channel. It does not issue another discovery request. Existing channel
acquisition enforces exclusive ownership; invalid dom0less references
fail domain construction.

Toolstack-created guests continue to select a numeric agent_id through
arm_sci, for example:

    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
    iomem =3D [ "47ff2,1@22001" ]

The guest's partial DT must describe the corresponding doorbell and guest
shared-memory address. Dom0less guests map the same channel through
xen,reg in their partial DT.

Use Xen's management SCMI node as an access-controller provider. Devices
reference scmi_xen, which declares #access-controller-cells =3D <1>:

    &i2c1 {
        access-controllers =3D <&scmi_xen 0>;
    };

Dom0 and dom0less device assignment paths invoke sci_assign_dt_device(). Fo=
r
toolstack-created domains, include all passed-through SCMI-managed devices
in xl.cfg's dtdev list, including devices without IOMMU protection.

Keep Xen's shared-memory descriptions under xen_scmi_config and leave the
host OSPM node and /firmware/scmi unchanged. These descriptions do not
reserve RAM. If buffers occupy system RAM, the platform must reserve the
whole firmware-owned range separately in /reserved-memory before Xen
boots. SRAM outside system RAM does not need a RAM reservation.

Factor out the SCMI protocol definitions and shared-memory transport,
record the feature in MAINTAINERS and SUPPORT.md, and document the
pre-existing scmi-smc-passthrough command-line option. Full host and guest
configuration examples are in the binding and hypervisor guide.

[0] https://developer.arm.com/documentation/den0056
[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/access-controllers/access-controller=
s.yaml

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v16:
- didn't add R-B from Volodymyr since changes to commit were made
  which requires additional review
- require BASE_SET_DEVICE_PERMISSIONS support; query it through
  PROTOCOL_MESSAGE_ATTRIBUTES on the management channel and fail probe
  before registering the mediator if the command is unavailable
- warn when BASE_RESET_AGENT_CONFIGURATION fails, explaining that device
  state and permissions may persist and agent reuse may be unsafe; keep
  unsupported reset non-fatal and propagate other reset errors
- replace numeric Dom0/dom0less agent selection with xen,dom0-sci-agent
  and xen,sci-agent phandles to enabled secondary agent nodes
- resolve agent phandles through the registered channels so both explicit
  and firmware-discovered IDs work; reject malformed references and nodes
  that were not registered as secondary agents
- add the optional SCI get_agent_id callback and dispatch both boot-domain
  selectors through sci_get_agent_id(), keeping domain construction
  independent of the SCMI driver's private implementation
- when reg is absent, discover and save the channel ID during probe;
  resolve either domain phandle to that saved ID without another SMC
- retain secondary agents' optional reg property and the agents node's
  address/size-cell requirements; add labels for domain phandle references
  with explicit or discovered IDs
- update the boot DT binding and examples for the phandle-based selection
  and the required permission command

Changes in v15:
- rename the shared-memory helpers to scmi_put_message() and
  scmi_get_message(), and remove redundant volatile parameter qualifiers
- use writel_relaxed() consistently for the request control fields and
  explain their Device-memory ordering
- retain the naturally aligned shared-memory structure and verify its
  transport field offsets at compile time instead of adding __packed
- correct the SMC diagnostic wording and wrap long lines, retaining the
  size-error diagnostics as agreed during review
- document the limit derived from the Base protocol's eight-bit agent
  count: platform ID 0 is separate, so 255 agents plus the platform occupy
  IDs 0..255 and fit in the eight-bit domain configuration field
- use paddr_t for channel physical addresses, PRIpaddr for their
  diagnostics, and uint64_t for DT address and size decoding
- initialize channel status through an MMIO accessor
- mark free_channel_list() and the Dom0 DT callback as __init
- move the response trace before the cleanup label, skip it on send
  failure, and rename the label to cleanup
- use %pd for domain diagnostics

Changes in v14:
- replace the flat secondary-agent list and its cell-count property with
  xen,scmi-agent child nodes under agents, using reg for an optional ID
- scope secondary-agent parsing to the management channel's xen,sci contain=
er
- resolve discovered IDs before insertion and reject duplicate or invalid I=
Ds
- validate shared-memory phandles, addresses and nonzero page-aligned sizes
- retain shared-memory nodes under xen_scmi_config and document platform
  reservations separately, following the review discussion
- update binding examples and commit description for the child-node format
- match the const-qualified SCI domain_sanitise_config callback interface

Changes in v13:
- fix typo in commit description

Changes in v12:
- rebase to the latest staging
- return EINVAL if xen,sci_type=3Dscmi_smc_multiagent was set but
CONFIG_SCMI_SMC_MA not set
- put arm_sci_agent_id after v8r_el1_msa and before pad to preserve
order. Reduced pad from uint16_t to uint8_t to fill the gap (was 2
bytes before adding arm_sci_agent_id and left only 1, so used uint8_t
to preserve structure size)
- fix scmi_handle_call to use arm_smccc_guest_smc helper function
- update send_smc_message function to use new format of
arm_smccc_1_1_smc
- guard the Dom0 SCMI agent id setup in create_dom0() and MA related
funcitons with CONFIG_SCMI_SMC_MA
- fix the xen_scmi_config example in booting.txt, which placed properties
after subnodes and was rejected by dtc with "Properties must precede
subnodes"

Changes in v10:
- Fix tabs in MAINTAINERS file
- remove duplicate SPDX tag from scmi-shmem.c
- add cast to ARM_SMCCC_INVALID_PARAMETER to settle the sign since
ARM_SMCCC_INVALID_PARAMETER is -3 which is part of the spec and resp
is the default smccc call structure.
- update free_channel_list. Add spinlock to avoid race condition and
a comment with a description of the function work
- preserve error of smc_create_channel in scmi_probe
- check scmi shmem address alignment as wel as it is done for size
- check for d->arch.sci_data !=3D NULL in scmi_handle_call
- use SCMI_SHMEM_MAPPED size for iomem_permit_access
- change len type to unsigned in shmem_{get|put}_message
- rename shmem_channel_is_free to shmem_channel_status
- add comment about skipping message status when getting message response
- Set correct agent_id ranges for dom0less and a toolstack. Agent_id 0
is not binded for dom0 so can be reused. Also mentioned that
UINT8_MAX (255) is treated as invalid agent_id.
- Split hypervisor and toolstack changes into separate commits
- move init list and spin init after initial checks in probe call
- fix typo in comments
- clean resources when sci_register returns an error.

Changes in v9:
- sort and refactor MAINTAINERS enties
- remove Spurious changes
- add extra check to avoid ASSERT when calling unmap_channel_memory
from assign device method
- set correct tx flag to SCMI_BASE_AGENT_PERMISSIONS_RESET when
freeing resources. Flag should be set to 1 according to the
section 4.2.2.12 [0].
- fix dt node copmaring
- moved channel->shmem check from ASSERT in unmap_memory_channel to
"if" statement. This will prevent firing ASSERT if
unmap_channel_memory was called twice on the same channel.

Changes in v8:
- update xen_scmi func_id in commit description
- updated documentation with the new DT format
- updated opt_dom0_scmi_agent_id setting to avoid it to be equal
SCMI_AGENT_ID_INVALID.
- changed SCMI_AGENT_ID_INVALID from 0xff to UINT8_MAX which makes
code more clear showing that UINT8_MAX is theated like invalid
agent_id and couldn't be used. Also excluded SCMI_AGENT_ID_INVALID
from acceptable value range
- remove outdated xen,config property ignore, added xen,sci compatible
to skip_matches in handle_node
- add documentation for pre-existing scmi-smc-passthrough command line
option in alphabetically correct location (in 's' section)
- add note to commit description about documentation for previously
undocumented scmi-smc-passthrough
- Fix SMC IDs in DT examples (Xen management uses 0x82000003, Dom0 uses 0x8=
2000002)
- Add explicit note explaining why Dom0 and Xen channels do not conflict
- Document dom0less multi-agent configuration example (xen,sci_type / xen,s=
ci-agent-id)
- Add scmi_xen node to agent-discovery example with #scmi-secondary-agents-=
cells =3D 2
- Drop dom0=3Dsci-agent-id command line handling; Dom0 SCMI is now enabled =
via
  xen,dom0-sci-agent-id in the xen,sci DT container
- Refresh docs and examples to mention the DT property instead of the cmdli=
ne option

Changes in v7:
- rework scmi nodes for xen to match on compatible string instead of
the direct path

Changes in v6:
- updated scmi-shmem to use io.h from generic location
- update scmi_agent_id parameter to be provided inside dom0=3D parameter
list and have the following format "dom0=3Dsci-agent-id=3D0"
This change was done as a response for Stefano comment and
requires a lot of code changes, but produces much cleaner solution
that's why I've added it to the code.
- fix file comments and return codes
- fix lenght checks in shmem_{get,put}_message to use offsetof
- remove len member from scmi_channel structure as it is not used
- set scmi-secondary-agents property to be mandatory since if no
secondary agents were provided then there is no sence to enable scmi
when no secondary agents are populated to the Domains
- update documentation in booting.txt, added xen_scmi node to the
example
- adjust d->arch.sci_enabled value in scmi_domain_destroy
- fix lock management in smc_create_channel call
- avoid extra map_channel_memory command for Xen management channel
because collect_agent_id call unmaps memory if DOMID_XEN is not
set. So for Xen management channel we can init domain_id ad DOMID_XEN
before calling collect_agent_id so memory shouldn't be unmapped.

Changes in v5:
- fix device-tree example format in booting.txt, added ";" after "}".
- update define in scmi-proto.h
- update define in scmi-shmem.h file
- scmi_assign_device - do not ignore -EOPNOTSUPP return
code of the do_smc_xfer
- remove overwriting agent_channel->agent_id after
SCMI_BASE_DISCOVER_AGENT call
- add multi-agent files to the MAINTAINERS
- add SCMI multi-agent description to the SUPPORT.md
- handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
for smc call
- updated collect_agents function. Set agent_id parameter as optional
in scmi-secondary-agents device-tree property
- introduce "#scmi-secondary-agents-cells" parameter to set if
agent_id was provided
- reanme xen,scmi-secondary-agents property to scmi-secondary-agents
- move memcpu_toio/fromio for the generic place
- update Xen to get management channel from /chosen/xen,config node
- get hypervisor channnel from node instead of using hardcoded
- update handling scmi and shmem nodes for the domain
- Set multi-agent driver to support only Arm64

Changes in v4:
- toolstack comments from Anthony PERARD
- added dom0less support
- added doc for "xen,scmi-secondary-agents"

 MAINTAINERS                                 |   1 +
 SUPPORT.md                                  |  11 +
 docs/misc/arm/device-tree/booting.txt       | 215 +++++
 xen/arch/arm/dom0less-build.c               |  17 +
 xen/arch/arm/domain_build.c                 |  40 +
 xen/arch/arm/firmware/Kconfig               |  12 +
 xen/arch/arm/firmware/Makefile              |   1 +
 xen/arch/arm/firmware/sci.c                 |  12 +
 xen/arch/arm/firmware/scmi-proto.h          | 183 ++++
 xen/arch/arm/firmware/scmi-shmem.c          | 129 +++
 xen/arch/arm/firmware/scmi-shmem.h          |  45 +
 xen/arch/arm/firmware/scmi-smc-multiagent.c | 875 ++++++++++++++++++++
 xen/arch/arm/include/asm/firmware/sci.h     |  17 +
 xen/include/public/arch-arm.h               |   5 +-
 14 files changed, 1562 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/firmware/scmi-proto.h
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
 create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c60afc93a5..cd6d1243bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -534,6 +534,7 @@ SCI MEDIATORS
 R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
 S:	Supported
 F:	xen/arch/arm/firmware/sci.c
+F:	xen/arch/arm/firmware/scmi-*.[ch]
 F:	xen/arch/arm/include/asm/firmware/sci.h
=20
 SEABIOS UPSTREAM
diff --git a/SUPPORT.md b/SUPPORT.md
index eb07332462..dc41a6b2f3 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -972,6 +972,17 @@ by hwdom. Some platforms use SCMI for access to system=
-level resources.
=20
     Status: Supported
=20
+### Arm: SCMI SMC multi-agent support
+
+Enable support for the multi-agent configuration of the EL3 Firmware, whic=
h
+allows Xen to provide an SCMI interface to the Domains.
+Xen manages access permissions to the HW resources and provides an SCMI in=
terface
+to the Domains. Each Domain is represented as a separate Agent, which can
+communicate with EL3 Firmware using a dedicated shared memory region, and
+notifications are passed through by Xen.
+
+    Status, ARM64: Tech Preview
+
 ### ARM: Guest PSCI support
=20
 Emulated PSCI interface exposed to guests. We support all mandatory
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-t=
ree/booting.txt
index 3787d2e2b6..8ddddd5bf8 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -331,6 +331,21 @@ with the following properties:
     Should be used together with scmi-smc-passthrough Xen command line
     option.
=20
+    - "scmi_smc_multiagent"
+
+    Enables ARM SCMI SMC multi-agent support for the guest by enabling SCM=
I over
+    SMC calls forwarding from domain to the EL3 firmware (like ARM
+    Trusted Firmware-A) with a multi SCMI OSPM agent support.
+    Select the guest's SCMI agent with the "xen,sci-agent" phandle propert=
y.
+
+- xen,sci-agent
+
+    A single phandle to an enabled xen,scmi-agent node in the registered
+    controller's agents child node. Required when xen,sci_type is
+    "scmi_smc_multiagent". Xen uses the referenced agent's configured or
+    discovered ID. Each agent can be assigned to only one domain. Missing,
+    malformed or invalid references cause domain construction to fail.
+
 - v8r_el1_msa
=20
     A string property specifying whether, on Armv8-R systems at EL1, a dom=
ain
@@ -847,3 +862,203 @@ The automatically allocated static shared memory will=
 get mapped at
 0x80000000 in DomU1 guest physical address space, and at 0x90000000 in Dom=
U2
 guest physical address space. DomU1 is explicitly defined as the owner dom=
ain,
 and DomU2 is the borrower domain.
+
+SCMI SMC multi-agent support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+To enable SCMI SMC multi-agent support (CONFIG_SCMI_SMC_MA), provide the
+Xen-specific agent configuration in the host DT, matching the channels
+provided by the EL3 firmware. The configuration must be in a node compatib=
le
+with "xen,sci" beneath "/chosen" (for example
+"/chosen/xen/xen_scmi_config/scmi"). The
+Xen SCMI mediator will bind only to the "arm,scmi-smc" node that is a chil=
d of
+this "xen,sci" node; any other "arm,scmi-smc" nodes (for example under
+"/firmware") are ignored to avoid stealing the host's SCMI OSPM instance.
+
+- agents
+
+    Required child node of xen,sci. Describes the secondary SCMI
+    agents available for assignment to domains. Set #address-cells =3D <1>
+    and #size-cells =3D <0> in this node. At least one enabled child with
+    compatible =3D "xen,scmi-agent" is required. Each such child has:
+
+    - reg: Optional single-cell SCMI agent ID in the range
+      0..254. When absent, Xen discovers the ID using BASE_DISCOVER_AGENT
+      on that channel. A malformed property is rejected. With an explicit
+      ID, use a matching hexadecimal unit address, for example
+      scmi_agent_domu: agent@2 { reg =3D <2>; ... }. Without reg, use a no=
de
+      name without a unit address, for example scmi_agent_domu: agent-domu=
.
+      Use the label scmi_agent_domu for phandle references in either case.
+    - arm,smc-id: Required SMC function ID for this agent's doorbell.
+    - shmem: Required single phandle to an arm,scmi-shmem node. Its addres=
s
+      and nonzero size must be Xen page aligned.
+
+    Agent IDs must be unique, including IDs returned by discovery, and mus=
t
+    not identify Xen's management agent. Children marked disabled are igno=
red.
+    The management arm,scmi-smc node remains a sibling of agents, directly
+    under xen,sci.
+
+- xen,dom0-sci-agent
+
+    Optional single phandle in the xen,sci node, selecting an enabled
+    xen,scmi-agent child of agents for Dom0. When omitted or invalid, SCMI
+    stays disabled for Dom0; invalid references produce a warning.
+    The selected agent's arm,smc-id and shared-memory region must match th=
e
+    host /firmware/scmi channel passed to Dom0.
+
+Place the SCMI-specific shared-memory nodes inside xen_scmi_config, while =
the
+platform's existing /firmware/scmi and its shared-memory node stay unchang=
ed.
+Shared-memory nodes describe channel locations; they do not reserve RAM.
+If the channel buffers occupy system RAM, the platform DT must reserve the
+whole firmware-owned range in /reserved-memory before Xen boots. One
+reservation may cover several channels, including channels not listed in
+this configuration. SRAM outside system RAM does not require a RAM
+reservation. Moving the channel nodes into /reserved-memory is not require=
d.
+
+BASE_SET_DEVICE_PERMISSIONS is required. Xen checks its availability using
+PROTOCOL_MESSAGE_ATTRIBUTES on the management channel before registering
+the mediator. Initialization fails if the command is unavailable.
+BASE_RESET_AGENT_CONFIGURATION is optional; if it is unsupported, domain
+teardown continues with a warning that device state and permissions may
+persist. Reusing the agent then requires platform-specific care.
+
+As an example:
+
+/ {
+    #address-cells =3D <2>;
+    #size-cells =3D <2>;
+
+    scmi_shm_0: sram@47ff0000 {
+        compatible =3D "arm,scmi-shmem";
+        reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+    };
+
+    firmware {
+        scmi: scmi {
+            compatible =3D "arm,scmi-smc";
+            arm,smc-id =3D <0x82000002>;
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            shmem =3D <&scmi_shm_0>;
+        };
+    };
+
+    chosen {
+        #address-cells =3D <2>;
+        #size-cells =3D <2>;
+        ranges;
+
+        xen {
+            #address-cells =3D <2>;
+            #size-cells =3D <2>;
+            ranges;
+
+            xen_scmi_config {
+                compatible =3D "xen,sci";
+                #address-cells =3D <2>;
+                #size-cells =3D <2>;
+                ranges;
+                xen,dom0-sci-agent =3D <&scmi_agent_dom0>;
+
+                /* Xen management channel */
+                scmi_shm_1: sram@47ff1000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+                };
+
+                scmi_shm_2: sram@47ff2000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+                };
+
+                scmi_shm_3: sram@47ff3000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+                };
+
+                scmi_xen: scmi {
+                    compatible =3D "arm,scmi-smc"; /* Xen management agent=
 func_id */
+                    arm,smc-id =3D <0x82000003>;
+                    #address-cells =3D <1>;
+                    #size-cells =3D <0>;
+                    #access-controller-cells =3D <1>;
+                    shmem =3D <&scmi_shm_1>; /* Xen management agent shmem=
 */
+                };
+
+                agents {
+                    #address-cells =3D <1>;
+                    #size-cells =3D <0>;
+
+                    scmi_agent_dom0: agent@0 {
+                        compatible =3D "xen,scmi-agent";
+                        reg =3D <0>;
+                        arm,smc-id =3D <0x82000002>;
+                        shmem =3D <&scmi_shm_0>;
+                    };
+
+                    scmi_agent_domu: agent@2 {
+                        compatible =3D "xen,scmi-agent";
+                        reg =3D <2>;
+                        arm,smc-id =3D <0x82000004>;
+                        shmem =3D <&scmi_shm_2>;
+                    };
+
+                    scmi_agent_domu3: agent@3 {
+                        compatible =3D "xen,scmi-agent";
+                        reg =3D <3>;
+                        arm,smc-id =3D <0x82000005>;
+                        shmem =3D <&scmi_shm_3>;
+                    };
+                };
+            };
+        };
+    };
+};
+
+This keeps the host OSPM channel (SMC 0x82000002, shmem 0x47ff0000) separa=
te
+from Xen's privileged management channel (SMC 0x82000003, shmem 0x47ff1000=
).
+The xen,sci subtree is omitted from Dom0's device tree.
+
+To discover a secondary agent ID, omit reg and the unit address from its
+node. Keep its label so references remain valid. For example, replace only
+scmi_agent_domu: agent@2 above with:
+
+scmi_agent_domu: agent-domu {
+    compatible =3D "xen,scmi-agent";
+    arm,smc-id =3D <0x82000004>;
+    shmem =3D <&scmi_shm_2>;
+};
+
+BASE_DISCOVER_AGENT is required on secondary channels only when
+reg is omitted. Xen always uses it to discover its management
+agent ID. Providing
+reg avoids mapping and probing the secondary channel during
+initialization. Domain phandles work with both explicit and discovered IDs=
.
+
+The xen,dom0-sci-agent and xen,sci-agent values identify nodes, not agent
+IDs. When the referenced node has no reg, Xen sends BASE_DISCOVER_AGENT
+on that node's arm,smc-id/shmem channel during mediator initialization.
+The returned ID is saved with the channel and used by either selector
+during domain construction. A discovery error fails initialization;
+neither the node name nor the phandle value is used as an agent ID.
+
+Dom0less example (multi-agent)
+-------------------------------
+
+Use the same Xen SCMI configuration as above. Remove xen,dom0-sci-agent
+if Dom0 does not use SCMI. Add xen,sci_type and xen,sci-agent to the
+predefined guest's node under /chosen:
+
+chosen {
+    domU1 {
+        compatible =3D "xen,domain";
+        xen,sci_type =3D "scmi_smc_multiagent";
+        xen,sci-agent =3D <&scmi_agent_domu>;
+        /* Additional domain properties (memory, cpus, kernels, etc.) */
+    };
+};
+
+The guest's partial DT and shared-memory mapping must use the SMC function
+ID and shared-memory channel associated with scmi_agent_domu in the agents
+node. Toolstack-created guests still select a numeric ID using arm_sci in
+xl.cfg; they do not reference host DT phandles.
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 7bbb2eafb6..8c0adb9ead 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -293,6 +293,23 @@ static int __init domu_dt_sci_parse(struct dt_device_n=
ode *node,
=20
         d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
     }
+    else if ( !strcmp(sci_type, "scmi_smc_multiagent") )
+    {
+        uint8_t agent_id;
+
+        if ( !IS_ENABLED(CONFIG_SCMI_SMC_MA) )
+        {
+            printk(XENLOG_ERR "xen,sci_type=3Dscmi_smc_multiagent requeste=
d, but CONFIG_SCMI_SMC_MA not set\n");
+            return -EINVAL;
+        }
+
+        ret =3D sci_get_agent_id(node, "xen,sci-agent", &agent_id);
+        if ( ret )
+            return ret;
+
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA=
;
+        d_cfg->arch.arm_sci_agent_id =3D agent_id;
+    }
     else
     {
         printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n"=
,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 72f6f7539a..bc2a24b71b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -88,6 +88,36 @@ int __init parse_arch_dom0_param(const char *s, const ch=
ar *e)
     return -EINVAL;
 }
=20
+#ifdef CONFIG_SCMI_SMC_MA
+/* SCMI agent ID for Dom0 resolved from a phandle in the xen,sci node. */
+#define SCMI_AGENT_ID_INVALID UINT8_MAX
+
+static uint8_t __init get_dom0_scmi_agent_id(void)
+{
+    const struct dt_device_node *config_node;
+    uint8_t agent_id;
+    int ret;
+
+    config_node =3D dt_find_compatible_node(NULL, NULL, "xen,sci");
+    if ( !config_node )
+        return SCMI_AGENT_ID_INVALID;
+
+    if ( !dt_find_property(config_node, "xen,dom0-sci-agent", NULL) )
+        return SCMI_AGENT_ID_INVALID;
+
+    ret =3D sci_get_agent_id(config_node, "xen,dom0-sci-agent", &agent_id)=
;
+    if ( ret )
+    {
+        printk(XENLOG_WARNING
+               "Invalid xen,dom0-sci-agent (%d), SCMI disabled for Dom0\n"=
,
+               ret);
+        return SCMI_AGENT_ID_INVALID;
+    }
+
+    return agent_id;
+}
+#endif /* CONFIG_SCMI_SMC_MA */
+
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
@@ -1480,6 +1510,7 @@ static int __init handle_node(struct domain *d, struc=
t kernel_info *kinfo,
         DT_MATCH_TYPE("memory"),
         /* The memory mapped timer is not supported by Xen. */
         DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
+        DT_MATCH_COMPATIBLE("xen,sci"),
         { /* sentinel */ },
     };
     static const struct dt_device_match timer_matches[] __initconst =3D
@@ -1975,6 +2006,15 @@ void __init create_dom0(void)
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
+#ifdef CONFIG_SCMI_SMC_MA
+    /* Resolve the Dom0 agent phandle provided in the xen,sci node. */
+    dom0_cfg.arch.arm_sci_agent_id =3D get_dom0_scmi_agent_id();
+    dom0_cfg.arch.arm_sci_type =3D (dom0_cfg.arch.arm_sci_agent_id !=3D
+                                  SCMI_AGENT_ID_INVALID) ?
+                                 XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA :
+                                 XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+#endif
+
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
=20
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 5c5f0880c4..972cd9b173 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -29,6 +29,18 @@ config SCMI_SMC
 	  driver domain.
 	  Use with EL3 firmware which supports only single SCMI OSPM agent.
=20
+config SCMI_SMC_MA
+	bool "Enable ARM SCMI SMC multi-agent driver"
+	depends on ARM_64
+	select ARM_SCI
+	help
+	  Enables SCMI SMC/HVC multi-agent in XEN to pass SCMI requests from Doma=
ins
+	  to EL3 firmware (TF-A) which supports multi-agent feature.
+	  This feature allows to enable SCMI per Domain using unique SCMI agent_i=
d,
+	  so Domain is identified by EL3 firmware as an SCMI Agent and can access
+	  allowed platform resources through dedicated SMC/HVC Shared memory base=
d
+	  transport.
+
 endchoice
=20
 endmenu
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index 71bdefc24a..37927e690e 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
+obj-$(CONFIG_SCMI_SMC_MA) +=3D scmi-shmem.o scmi-smc-multiagent.o
diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
index 371eca019c..d3c143de55 100644
--- a/xen/arch/arm/firmware/sci.c
+++ b/xen/arch/arm/firmware/sci.c
@@ -29,6 +29,18 @@ int sci_register(const struct sci_mediator_ops *ops)
     return 0;
 };
=20
+int __init sci_get_agent_id(const struct dt_device_node *node,
+                            const char *property, uint8_t *agent_id)
+{
+    if ( !cur_mediator )
+        return -ENODEV;
+
+    if ( !cur_mediator->get_agent_id )
+        return -EOPNOTSUPP;
+
+    return cur_mediator->get_agent_id(node, property, agent_id);
+}
+
 bool sci_handle_call(struct cpu_user_regs *regs)
 {
     if ( unlikely(!cur_mediator) )
diff --git a/xen/arch/arm/firmware/scmi-proto.h b/xen/arch/arm/firmware/scm=
i-proto.h
new file mode 100644
index 0000000000..1c8a170918
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-proto.h
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ *
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef ARM_FIRMWARE_SCMI_PROTO_H_
+#define ARM_FIRMWARE_SCMI_PROTO_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHORT_NAME_MAX_SIZE 16
+
+/* SCMI status codes. See section 4.1.4 */
+#define SCMI_SUCCESS              0
+#define SCMI_NOT_SUPPORTED      (-1)
+#define SCMI_INVALID_PARAMETERS (-2)
+#define SCMI_DENIED             (-3)
+#define SCMI_NOT_FOUND          (-4)
+#define SCMI_OUT_OF_RANGE       (-5)
+#define SCMI_BUSY               (-6)
+#define SCMI_COMMS_ERROR        (-7)
+#define SCMI_GENERIC_ERROR      (-8)
+#define SCMI_HARDWARE_ERROR     (-9)
+#define SCMI_PROTOCOL_ERROR     (-10)
+
+/* Protocol IDs */
+#define SCMI_BASE_PROTOCOL 0x10
+
+/* Base protocol message IDs */
+#define SCMI_BASE_PROTOCOL_VERSION            0x0
+#define SCMI_BASE_PROTOCOL_ATTIBUTES          0x1
+#define SCMI_BASE_PROTOCOL_MESSAGE_ATTRIBUTES 0x2
+#define SCMI_BASE_DISCOVER_AGENT              0x7
+#define SCMI_BASE_SET_DEVICE_PERMISSIONS      0x9
+#define SCMI_BASE_RESET_AGENT_CONFIGURATION   0xB
+
+typedef struct scmi_msg_header {
+    uint8_t id;
+    uint8_t type;
+    uint8_t protocol;
+    uint32_t status;
+} scmi_msg_header_t;
+
+/* Table 2 Message header format */
+#define SCMI_HDR_ID    GENMASK(7, 0)
+#define SCMI_HDR_TYPE  GENMASK(9, 8)
+#define SCMI_HDR_PROTO GENMASK(17, 10)
+
+#define SCMI_FIELD_GET(_mask, _reg)                                       =
     \
+    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
+#define SCMI_FIELD_PREP(_mask, _val)                                      =
     \
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
+
+static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
+{
+    return SCMI_FIELD_PREP(SCMI_HDR_ID, hdr->id) |
+           SCMI_FIELD_PREP(SCMI_HDR_TYPE, hdr->type) |
+           SCMI_FIELD_PREP(SCMI_HDR_PROTO, hdr->protocol);
+}
+
+static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t =
*hdr)
+{
+    hdr->id =3D SCMI_FIELD_GET(SCMI_HDR_ID, msg_hdr);
+    hdr->type =3D SCMI_FIELD_GET(SCMI_HDR_TYPE, msg_hdr);
+    hdr->protocol =3D SCMI_FIELD_GET(SCMI_HDR_PROTO, msg_hdr);
+}
+
+static inline int scmi_to_xen_errno(int scmi_status)
+{
+    if ( scmi_status =3D=3D SCMI_SUCCESS )
+        return 0;
+
+    switch ( scmi_status )
+    {
+    case SCMI_NOT_SUPPORTED:
+        return -EOPNOTSUPP;
+    case SCMI_INVALID_PARAMETERS:
+        return -EINVAL;
+    case SCMI_DENIED:
+        return -EACCES;
+    case SCMI_NOT_FOUND:
+        return -ENOENT;
+    case SCMI_OUT_OF_RANGE:
+        return -ERANGE;
+    case SCMI_BUSY:
+        return -EBUSY;
+    case SCMI_COMMS_ERROR:
+        return -ENOTCONN;
+    case SCMI_GENERIC_ERROR:
+        return -EIO;
+    case SCMI_HARDWARE_ERROR:
+        return -ENXIO;
+    case SCMI_PROTOCOL_ERROR:
+        return -EBADMSG;
+    default:
+        return -EINVAL;
+    }
+}
+
+/* PROTOCOL_VERSION */
+#define SCMI_VERSION_MINOR GENMASK(15, 0)
+#define SCMI_VERSION_MAJOR GENMASK(31, 16)
+
+struct scmi_msg_prot_version_p2a {
+    uint32_t version;
+} __packed;
+
+/* PROTOCOL_MESSAGE_ATTRIBUTES */
+struct scmi_msg_prot_message_attributes_a2p {
+    uint32_t message_id;
+} __packed;
+
+struct scmi_msg_prot_message_attributes_p2a {
+    uint32_t attributes;
+} __packed;
+
+/* BASE PROTOCOL_ATTRIBUTES */
+#define SCMI_BASE_ATTR_NUM_PROTO GENMASK(7, 0)
+#define SCMI_BASE_ATTR_NUM_AGENT GENMASK(15, 8)
+
+/*
+ * DEN0056E, sections 4.2.2.3 and 4.2.2.9: the agent count N occupies
+ * attributes[15:8], and agent IDs are sequential from 1 through N.
+ * Platform ID 0 is separate from that count. Thus N =3D 255 allows 256
+ * identifiers (0..255), not an ID of 256, so domain configuration can use
+ * uint8_t. Protocol and channel fields use uint32_t, also accommodating
+ * the 0xffffffff self-discovery input, which is not an ordinary agent ID.
+ */
+#define SCMI_MAX_AGENT_ID UINT8_MAX
+
+struct scmi_msg_base_attributes_p2a {
+    uint32_t attributes;
+} __packed;
+
+/*
+ * BASE_DISCOVER_AGENT
+ */
+#define SCMI_BASE_AGENT_ID_OWN 0xFFFFFFFF
+
+struct scmi_msg_base_discover_agent_a2p {
+    uint32_t agent_id;
+} __packed;
+
+struct scmi_msg_base_discover_agent_p2a {
+    uint32_t agent_id;
+    char name[SCMI_SHORT_NAME_MAX_SIZE];
+} __packed;
+
+/*
+ * BASE_SET_DEVICE_PERMISSIONS
+ */
+#define SCMI_BASE_DEVICE_ACCESS_ALLOW           BIT(0, UL)
+
+struct scmi_msg_base_set_device_permissions_a2p {
+    uint32_t agent_id;
+    uint32_t device_id;
+    uint32_t flags;
+} __packed;
+
+/*
+ * BASE_RESET_AGENT_CONFIGURATION
+ */
+#define SCMI_BASE_AGENT_PERMISSIONS_RESET       BIT(0, UL)
+
+struct scmi_msg_base_reset_agent_cfg_a2p {
+    uint32_t agent_id;
+    uint32_t flags;
+} __packed;
+
+#endif /* ARM_FIRMWARE_SCMI_PROTO_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.c b/xen/arch/arm/firmware/scm=
i-shmem.c
new file mode 100644
index 0000000000..fd68c8ee1a
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.c
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SMC/HVC shmem transport implementation used by
+ * SCI SCMI multi-agent driver.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/err.h>
+#include <xen/io.h>
+#include <asm/io.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+static inline int
+shmem_channel_status(const struct scmi_shared_mem __iomem *shmem)
+{
+    return (readl(&shmem->channel_status) &
+            SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE) ? 0 : -EBUSY;
+}
+
+int scmi_put_message(struct scmi_shared_mem __iomem *shmem,
+                     scmi_msg_header_t *hdr, void *data, unsigned int len)
+{
+    int ret;
+
+    /* Keep the transport layout naturally aligned for 32-bit I/O accesses=
. */
+    BUILD_BUG_ON(offsetof(struct scmi_shared_mem, reserved) !=3D 0x00);
+    BUILD_BUG_ON(offsetof(struct scmi_shared_mem, channel_status) !=3D 0x0=
4);
+    BUILD_BUG_ON(offsetof(struct scmi_shared_mem, reserved1) !=3D 0x08);
+    BUILD_BUG_ON(offsetof(struct scmi_shared_mem, flags) !=3D 0x10);
+    BUILD_BUG_ON(offsetof(struct scmi_shared_mem, length) !=3D 0x14);
+    BUILD_BUG_ON(offsetof(struct scmi_shared_mem, msg_header) !=3D 0x18);
+    BUILD_BUG_ON(offsetof(struct scmi_shared_mem, msg_payload) !=3D 0x1c);
+
+    if ( (len + offsetof(struct scmi_shared_mem, msg_payload)) >
+         SCMI_SHMEM_MAPPED_SIZE )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of the SMC message. Data is invalid\n");
+        return -EINVAL;
+    }
+
+    ret =3D shmem_channel_status(shmem);
+    if ( ret )
+        return ret;
+
+    /* All control fields use Device memory, which preserves write order. =
*/
+    writel_relaxed(0x0, &shmem->channel_status);
+    /* Writing 0x0 right now, but "shmem"_FLAG_INTR_ENABLED can be set */
+    writel_relaxed(0x0, &shmem->flags);
+    writel_relaxed(sizeof(shmem->msg_header) + len, &shmem->length);
+    writel_relaxed(pack_scmi_header(hdr), &shmem->msg_header);
+
+    if ( len > 0 && data )
+        memcpy_toio(shmem->msg_payload, data, len);
+
+    return 0;
+}
+
+int scmi_get_message(const struct scmi_shared_mem __iomem *shmem,
+                     scmi_msg_header_t *hdr, void *data, unsigned int len)
+{
+    int recv_len;
+    int ret;
+    /*
+     * First word of msg_payload carries the returned status; exclude it f=
rom
+     * recv_len so only the protocol payload is copied back to the caller.
+     */
+    int pad =3D sizeof(hdr->status);
+
+    if ( len >=3D SCMI_SHMEM_MAPPED_SIZE -
+         offsetof(struct scmi_shared_mem, msg_payload) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of the input SMC message\n");
+        return -EINVAL;
+    }
+
+    ret =3D shmem_channel_status(shmem);
+    if ( ret )
+        return ret;
+
+    recv_len =3D readl(&shmem->length) - sizeof(shmem->msg_header);
+
+    if ( recv_len < 0 )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of the SMC message. Data may be invalid\n=
");
+        return -EINVAL;
+    }
+
+    unpack_scmi_header(readl(&shmem->msg_header), hdr);
+
+    hdr->status =3D readl(&shmem->msg_payload);
+    recv_len =3D recv_len > pad ? recv_len - pad : 0;
+
+    ret =3D scmi_to_xen_errno(hdr->status);
+    if ( ret )
+    {
+        printk(XENLOG_DEBUG "scmi: Error received: %d\n", ret);
+        return ret;
+    }
+
+    if ( recv_len > len )
+    {
+        printk(XENLOG_ERR
+               "scmi: Not enough buffer for message %d, expecting %d\n",
+               recv_len, len);
+        return -EINVAL;
+    }
+
+    if ( recv_len > 0 )
+        memcpy_fromio(data, shmem->msg_payload + pad, recv_len);
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.h b/xen/arch/arm/firmware/scm=
i-shmem.h
new file mode 100644
index 0000000000..2577e9c661
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ * Shared Memory based Transport
+ *
+ * Copyright (c) 2024 EPAM Systems
+ */
+
+#ifndef ARM_FIRMWARE_SCMI_SHMEM_H_
+#define ARM_FIRMWARE_SCMI_SHMEM_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE  BIT(0, UL)
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR BIT(1, UL)
+
+struct scmi_shared_mem {
+    uint32_t reserved;
+    uint32_t channel_status;
+    uint32_t reserved1[2];
+    uint32_t flags;
+    uint32_t length;
+    uint32_t msg_header;
+    uint8_t msg_payload[];
+};
+
+#define SCMI_SHMEM_MAPPED_SIZE PAGE_SIZE
+
+int scmi_put_message(struct scmi_shared_mem __iomem *shmem,
+                     scmi_msg_header_t *hdr, void *data, unsigned int len)=
;
+
+int scmi_get_message(const struct scmi_shared_mem __iomem *shmem,
+                     scmi_msg_header_t *hdr, void *data, unsigned int len)=
;
+#endif /* ARM_FIRMWARE_SCMI_SHMEM_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-smc-multiagent.c b/xen/arch/arm/fir=
mware/scmi-smc-multiagent.c
new file mode 100644
index 0000000000..c612902321
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-smc-multiagent.c
@@ -0,0 +1,875 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/err.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/string.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/vmap.h>
+
+#include <asm/firmware/sci.h>
+#include <asm/io.h>
+#include <asm/smccc.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+struct scmi_channel {
+    uint32_t agent_id;
+    uint32_t func_id;
+    domid_t domain_id;
+    paddr_t paddr;
+    struct scmi_shared_mem __iomem *shmem;
+    const struct dt_device_node *node;
+    spinlock_t lock;
+    struct list_head list;
+};
+
+struct scmi_data {
+    struct list_head channel_list;
+    spinlock_t channel_list_lock;
+    uint32_t func_id;
+    bool initialized;
+    uint32_t shmem_phandle;
+    uint32_t hyp_channel_agent_id;
+    struct dt_device_node *dt_dev;
+};
+
+static struct scmi_data scmi_data;
+
+static bool scmi_is_under_xen_sci(const struct dt_device_node *node)
+{
+    const struct dt_device_node *p;
+
+    for ( p =3D node->parent; p; p =3D p->parent )
+        if ( dt_device_is_compatible(p, "xen,sci") )
+            return true;
+
+    return false;
+}
+
+static int send_smc_message(struct scmi_channel *chan_info,
+                            scmi_msg_header_t *hdr, void *data, int len)
+{
+    struct arm_smccc_res resp;
+    int ret;
+
+    ret =3D scmi_put_message(chan_info->shmem, hdr, data, len);
+    if ( ret )
+        return ret;
+
+    resp =3D arm_smccc_1_1_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, 0);
+
+    if ( resp.a0 =3D=3D (unsigned long)ARM_SMCCC_INVALID_PARAMETER )
+        return -EINVAL;
+
+    if ( resp.a0 )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+static int do_smc_xfer(struct scmi_channel *chan_info, scmi_msg_header_t *=
hdr,
+                       void *tx_data, int tx_size, void *rx_data, int rx_s=
ize)
+{
+    int ret =3D 0;
+
+    ASSERT(chan_info && chan_info->shmem);
+
+    if ( !hdr )
+        return -EINVAL;
+
+    spin_lock(&chan_info->lock);
+
+    printk(XENLOG_DEBUG
+           "scmi: agent_id =3D %d msg_id =3D %x type =3D %d, proto =3D %x\=
n",
+           chan_info->agent_id, hdr->id, hdr->type, hdr->protocol);
+
+    ret =3D send_smc_message(chan_info, hdr, tx_data, tx_size);
+    if ( ret )
+        goto cleanup;
+
+    ret =3D scmi_get_message(chan_info->shmem, hdr, rx_data, rx_size);
+
+    printk(XENLOG_DEBUG
+           "scmi: get smc response agent_id =3D %d msg_id =3D %x "
+           "proto =3D %x res=3D%d\n",
+           chan_info->agent_id, hdr->id, hdr->protocol, ret);
+
+cleanup:
+    spin_unlock(&chan_info->lock);
+
+    return ret;
+}
+
+static struct scmi_channel *get_channel_by_id(uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    bool found =3D false;
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            found =3D true;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    if ( found )
+        return curr;
+
+    return NULL;
+}
+
+static struct scmi_channel *acquire_scmi_channel(struct domain *d,
+                                                 uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    struct scmi_channel *ret =3D ERR_PTR(-ENOENT);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            if ( curr->domain_id !=3D DOMID_INVALID )
+            {
+                ret =3D ERR_PTR(-EEXIST);
+                break;
+            }
+
+            curr->domain_id =3D d->domain_id;
+            ret =3D curr;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+
+    return ret;
+}
+
+static void relinquish_scmi_channel(struct scmi_channel *channel)
+{
+    ASSERT(channel !=3D NULL);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    channel->domain_id =3D DOMID_INVALID;
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static int map_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT(channel && channel->paddr);
+    channel->shmem =3D ioremap_nocache(channel->paddr, SCMI_SHMEM_MAPPED_S=
IZE);
+    if ( !channel->shmem )
+        return -ENOMEM;
+
+    writel_relaxed(SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE,
+                   &channel->shmem->channel_status);
+    printk(XENLOG_DEBUG "scmi: Got shmem %"PRIpaddr" after vmap %p\n",
+           channel->paddr, channel->shmem);
+
+    return 0;
+}
+
+static void unmap_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT(channel);
+
+    if ( !channel->shmem )
+        return;
+
+    iounmap(channel->shmem);
+    channel->shmem =3D NULL;
+}
+
+static struct scmi_channel *
+smc_create_channel(uint32_t agent_id, uint32_t func_id, paddr_t addr,
+                    const struct dt_device_node *node)
+{
+    struct scmi_channel *channel, *curr;
+
+    spin_lock(&scmi_data.channel_list_lock);
+
+    /* Check if channel already exists while holding the lock */
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            spin_unlock(&scmi_data.channel_list_lock);
+            return ERR_PTR(-EEXIST);
+        }
+    }
+
+    channel =3D xmalloc(struct scmi_channel);
+    if ( !channel )
+    {
+        spin_unlock(&scmi_data.channel_list_lock);
+        return ERR_PTR(-ENOMEM);
+    }
+
+    spin_lock_init(&channel->lock);
+    channel->agent_id =3D agent_id;
+    channel->func_id =3D func_id;
+    channel->domain_id =3D DOMID_INVALID;
+    channel->shmem =3D NULL;
+    channel->paddr =3D addr;
+    channel->node =3D node;
+    list_add_tail(&channel->list, &scmi_data.channel_list);
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    return channel;
+}
+
+static int __init scmi_get_agent_id(const struct dt_device_node *node,
+                                   const char *property, uint8_t *agent_id=
)
+{
+    const struct dt_device_node *agent;
+    const struct scmi_channel *channel;
+    uint32_t phandle;
+    int ret;
+
+    ret =3D dt_property_read_variable_u32_array(node, property, &phandle, =
1, 1);
+    if ( ret < 0 )
+        return ret;
+
+    if ( !phandle || phandle =3D=3D UINT32_MAX )
+        return -EINVAL;
+
+    if ( !scmi_data.initialized )
+        return -ENODEV;
+
+    agent =3D dt_find_node_by_phandle(phandle);
+    if ( !agent )
+        return -EINVAL;
+
+    /* The channel list is immutable after probe; called only during boot.=
 */
+    list_for_each_entry(channel, &scmi_data.channel_list, list)
+    {
+        if ( channel->node =3D=3D agent && channel->domain_id !=3D DOMID_X=
EN )
+        {
+            *agent_id =3D channel->agent_id;
+            return 0;
+        }
+    }
+
+    /* Reject disabled agents and nodes outside the registered agents node=
. */
+    return -EINVAL;
+}
+
+static void __init free_channel_list(void)
+{
+    struct scmi_channel *curr, *_curr;
+    /*
+     * Called only on the __init error path, before any runtime users exis=
t,
+     * so no other thread is iterating channel_list. Keep the lock for the
+     * whole drain for clarity and to avoid misleading readers about possi=
ble
+     * concurrent access.
+     */
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry_safe(curr, _curr, &scmi_data.channel_list, list)
+    {
+        list_del(&curr->list);
+        xfree(curr);
+    }
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static int __init
+scmi_dt_read_channel_addr(struct dt_device_node *scmi_node, uint64_t *addr=
,
+                          uint64_t *size)
+{
+    struct dt_device_node *shmem_node;
+    uint32_t phandle;
+    int ret;
+
+    ret =3D dt_property_read_variable_u32_array(scmi_node, "shmem", &phand=
le,
+                                              1, 1);
+    if ( ret < 0 )
+        return ret;
+
+    shmem_node =3D dt_find_node_by_phandle(phandle);
+    if ( !shmem_node ||
+         !dt_device_is_compatible(shmem_node, "arm,scmi-shmem") )
+        return -EINVAL;
+
+    ret =3D dt_device_get_address(shmem_node, 0, addr, size);
+    if ( ret )
+        return ret;
+
+    if ( !*size || !IS_ALIGNED(*size, SCMI_SHMEM_MAPPED_SIZE) ||
+         !IS_ALIGNED(*addr, SCMI_SHMEM_MAPPED_SIZE) )
+    {
+        printk(XENLOG_ERR "scmi: invalid shmem range for %s\n",
+               scmi_node->full_name);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+/*
+ * Handle Dom0 SCMI specific DT nodes
+ *
+ * Make a decision on copying SCMI specific nodes into Dom0 device tree.
+ * For SCMI multi-agent case:
+ * - shmem nodes will not be copied and generated instead if SCMI
+ *   is enabled for Dom0
+ * - scmi node will be copied if SCMI is enabled for Dom0
+ */
+static bool __init scmi_dt_handle_node(struct domain *d,
+                                      struct dt_device_node *node)
+{
+    static const struct dt_device_match shmem_matches[] __initconst =3D {
+        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
+        { /* sentinel */ },
+    };
+    static const struct dt_device_match scmi_matches[] __initconst =3D {
+        DT_MATCH_PATH("/firmware/scmi"),
+        { /* sentinel */ },
+    };
+
+    if ( !scmi_data.initialized )
+        return false;
+
+    /* skip scmi shmem node for dom0 if scmi not enabled */
+    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("  Skip scmi shmem node\n");
+        return true;
+    }
+
+    /* drop scmi if not enabled */
+    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("  Skip scmi node\n");
+        return true;
+    }
+
+    return false;
+}
+
+static int scmi_assign_device(uint32_t agent_id, uint32_t device_id,
+                              uint32_t flags)
+{
+    struct scmi_msg_base_set_device_permissions_a2p tx;
+    struct scmi_channel *channel;
+    scmi_msg_header_t hdr;
+
+    channel =3D get_channel_by_id(scmi_data.hyp_channel_agent_id);
+    if ( !channel )
+        return -EINVAL;
+
+    hdr.id =3D SCMI_BASE_SET_DEVICE_PERMISSIONS;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.agent_id =3D agent_id;
+    tx.device_id =3D device_id;
+    tx.flags =3D flags;
+
+    return do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+}
+
+static int scmi_dt_assign_device(struct domain *d,
+                                 struct dt_phandle_args *ac_spec)
+{
+    struct scmi_channel *agent_channel;
+    uint32_t scmi_device_id =3D ac_spec->args[0];
+    int ret;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    /* The access-controllers is specified for DT dev, but it's not a SCMI=
 */
+    if ( !scmi_data.dt_dev ||
+         !dt_node_path_is_equal(ac_spec->np, scmi_data.dt_dev->full_name) =
)
+        return 0;
+
+    agent_channel =3D d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+
+    ret =3D scmi_assign_device(agent_channel->agent_id, scmi_device_id,
+                             SCMI_BASE_DEVICE_ACCESS_ALLOW);
+    if ( ret )
+    {
+        printk(XENLOG_ERR
+               "scmi: could not assign dev for %pd agent:%d dev_id:%u (%d)=
",
+               d, agent_channel->agent_id, scmi_device_id, ret);
+    }
+
+    spin_unlock(&agent_channel->lock);
+    return ret;
+}
+
+static int collect_agent_id(struct scmi_channel *agent_channel)
+{
+    int ret;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_discover_agent_p2a da_rx;
+    struct scmi_msg_base_discover_agent_a2p da_tx;
+
+    ret =3D map_channel_memory(agent_channel);
+    if ( ret )
+        return ret;
+
+    hdr.id =3D SCMI_BASE_DISCOVER_AGENT;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    da_tx.agent_id =3D agent_channel->agent_id;
+
+    ret =3D do_smc_xfer(agent_channel, &hdr, &da_tx, sizeof(da_tx),
+                      &da_rx, sizeof(da_rx));
+    if ( agent_channel->domain_id !=3D DOMID_XEN )
+        unmap_channel_memory(agent_channel);
+    if ( ret )
+        return ret;
+
+    if ( da_rx.agent_id > SCMI_MAX_AGENT_ID )
+        return -EINVAL;
+
+    printk(XENLOG_DEBUG "id=3D0x%x name=3D%s\n", da_rx.agent_id, da_rx.nam=
e);
+    agent_channel->agent_id =3D da_rx.agent_id;
+    return 0;
+}
+
+static int __init collect_agents(struct dt_device_node *scmi_node)
+{
+    struct dt_device_node *agents, *node;
+    unsigned int count =3D 0;
+
+    /* Use the configuration containing this management channel. */
+    for ( agents =3D scmi_node->parent; agents; agents =3D agents->parent =
)
+        if ( dt_device_is_compatible(agents, "xen,sci") )
+            break;
+
+    ASSERT(agents);
+
+    dt_for_each_child_node(agents, node)
+        if ( dt_node_name_is_equal(node, "agents") )
+            break;
+
+    if ( !node )
+    {
+        printk(XENLOG_ERR "scmi: missing agents node\n");
+        return -EINVAL;
+    }
+    agents =3D node;
+
+    if ( dt_child_n_addr_cells(agents) !=3D 1 ||
+         dt_child_n_size_cells(agents) !=3D 0 )
+        return -EINVAL;
+
+    dt_for_each_child_node(agents, node)
+    {
+        struct scmi_channel agent =3D {
+            .agent_id =3D SCMI_BASE_AGENT_ID_OWN,
+            .domain_id =3D DOMID_INVALID,
+        };
+        struct scmi_channel *channel;
+        bool discover;
+        uint32_t len;
+        uint64_t addr, size;
+        int ret;
+
+        if ( !dt_device_is_compatible(node, "xen,scmi-agent") ||
+             !dt_device_is_available(node) )
+            continue;
+
+        discover =3D !dt_find_property(node, "reg", &len);
+        if ( !discover )
+        {
+            if ( len !=3D sizeof(uint32_t) ||
+                 !dt_property_read_u32(node, "reg", &agent.agent_id) )
+                return -EINVAL;
+        }
+
+        if ( !dt_property_read_u32(node, "arm,smc-id", &agent.func_id) )
+            return -EINVAL;
+
+        ret =3D scmi_dt_read_channel_addr(node, &addr, &size);
+        if ( ret )
+            return ret;
+        agent.paddr =3D addr;
+
+        if ( discover )
+        {
+            /* Resolve the ID before inserting it into the channel list. *=
/
+            spin_lock_init(&agent.lock);
+            ret =3D collect_agent_id(&agent);
+            if ( ret )
+                return ret;
+        }
+
+        /* UINT8_MAX is reserved as invalid in guest configuration. */
+        if ( agent.agent_id >=3D UINT8_MAX )
+            return -EINVAL;
+
+        channel =3D smc_create_channel(agent.agent_id, agent.func_id,
+                                     agent.paddr, node);
+        if ( IS_ERR(channel) )
+        {
+            printk(XENLOG_ERR "scmi: Could not create channel for %s: %ld\=
n",
+                   node->full_name, PTR_ERR(channel));
+            return PTR_ERR(channel);
+        }
+
+        count++;
+        printk(XENLOG_DEBUG "scmi: Agent %u SMC %X addr %"PRIpaddr"\n",
+               channel->agent_id, channel->func_id, channel->paddr);
+    }
+
+    return count ? 0 : -EINVAL;
+}
+
+static int scmi_domain_init(struct domain *d,
+                            struct xen_domctl_createdomain *config)
+{
+    struct scmi_channel *channel;
+    int ret;
+
+    if ( !scmi_data.initialized )
+        return 0;
+
+    /*
+     * SCMI support is configured via:
+     * - For dom0: xen,dom0-sci-agent phandle under the xen,sci node
+     * - For dom0less: xen,sci-agent phandle in the domain node
+     * The config->arch.arm_sci_type and config->arch.arm_sci_agent_id
+     * are already set by domain_build.c or dom0less-build.c
+     */
+
+    if ( config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
+        return 0;
+
+    channel =3D acquire_scmi_channel(d, config->arch.arm_sci_agent_id);
+    if ( IS_ERR(channel) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Failed to acquire SCMI channel for agent_id %u: %ld\=
n",
+               config->arch.arm_sci_agent_id, PTR_ERR(channel));
+        return PTR_ERR(channel);
+    }
+
+    printk(XENLOG_INFO
+           "scmi: Acquire channel id =3D 0x%x, domain =3D %pd "
+           "paddr =3D 0x%"PRIpaddr"\n",
+           channel->agent_id, d, channel->paddr);
+
+    /*
+     * Dom0 (if present) needs to have an access to the guest memory range
+     * to satisfy iomem_access_permitted() check in XEN_DOMCTL_iomem_permi=
ssion
+     * domctl.
+     */
+    if ( hardware_domain && !is_hardware_domain(d) )
+    {
+        ret =3D iomem_permit_access(hardware_domain, paddr_to_pfn(channel-=
>paddr),
+                                  paddr_to_pfn(channel->paddr +
+                                  SCMI_SHMEM_MAPPED_SIZE - 1));
+        if ( ret )
+            goto error;
+    }
+
+    d->arch.sci_data =3D channel;
+    d->arch.sci_enabled =3D true;
+
+    return 0;
+
+error:
+    relinquish_scmi_channel(channel);
+    return ret;
+}
+
+int scmi_domain_sanitise_config(const struct xen_domctl_createdomain *conf=
ig)
+{
+    if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
+         config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC=
_MA )
+    {
+        dprintk(XENLOG_INFO, "scmi: Unsupported ARM_SCI type\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int scmi_relinquish_resources(struct domain *d)
+{
+    int ret;
+    struct scmi_channel *channel, *agent_channel;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_reset_agent_cfg_a2p tx;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    agent_channel =3D d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+    tx.agent_id =3D agent_channel->agent_id;
+    spin_unlock(&agent_channel->lock);
+
+    channel =3D get_channel_by_id(scmi_data.hyp_channel_agent_id);
+    if ( !channel )
+    {
+        printk(XENLOG_ERR
+               "scmi: Unable to get Hypervisor SCMI channel for %pd\n", d)=
;
+        return -EINVAL;
+    }
+
+    hdr.id =3D SCMI_BASE_RESET_AGENT_CONFIGURATION;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.flags =3D SCMI_BASE_AGENT_PERMISSIONS_RESET;
+
+    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+    if ( ret )
+        printk(XENLOG_WARNING
+               "scmi: WARNING: cannot reset agent %u for %pd (%d).\n"
+               XENLOG_WARNING
+               "scmi: Devices may remain active and agent permissions may =
"
+               "persist; reusing this agent may be unsafe.\n",
+               agent_channel->agent_id, d, ret);
+
+    if ( ret =3D=3D -EOPNOTSUPP )
+        return 0;
+
+    return ret;
+}
+
+static void scmi_domain_destroy(struct domain *d)
+{
+    struct scmi_channel *channel;
+
+    if ( !d->arch.sci_data )
+        return;
+
+    channel =3D d->arch.sci_data;
+    spin_lock(&channel->lock);
+
+    relinquish_scmi_channel(channel);
+    printk(XENLOG_DEBUG "scmi: Free %pd\n", d);
+
+    d->arch.sci_data =3D NULL;
+    d->arch.sci_enabled =3D false;
+
+    spin_unlock(&channel->lock);
+}
+
+static bool scmi_handle_call(struct cpu_user_regs *regs)
+{
+    uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
+    struct scmi_channel *agent_channel;
+    struct domain *d =3D current->domain;
+    bool res =3D false;
+
+    if ( (!sci_domain_is_enabled(d)) || (!d->arch.sci_data) )
+        return false;
+
+    agent_channel =3D d->arch.sci_data;
+    spin_lock(&agent_channel->lock);
+
+    if ( agent_channel->func_id !=3D fid )
+    {
+        res =3D false;
+        goto unlock;
+    }
+
+    arm_smccc_guest_smc(regs);
+    res =3D true;
+unlock:
+    spin_unlock(&agent_channel->lock);
+
+    return res;
+}
+
+static const struct sci_mediator_ops scmi_ops =3D {
+    .domain_init =3D scmi_domain_init,
+    .domain_destroy =3D scmi_domain_destroy,
+    .relinquish_resources =3D scmi_relinquish_resources,
+    .handle_call =3D scmi_handle_call,
+    .dom0_dt_handle_node =3D scmi_dt_handle_node,
+    .domain_sanitise_config =3D scmi_domain_sanitise_config,
+    .assign_dt_device =3D scmi_dt_assign_device,
+    .get_agent_id =3D scmi_get_agent_id,
+};
+
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
+    {
+        printk(XENLOG_WARNING
+               "scmi: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
+        return -ENOSYS;
+    }
+
+    return 0;
+}
+
+static int __init scmi_dt_hyp_channel_read(struct dt_device_node *scmi_nod=
e,
+                                           struct scmi_data *scmi_data,
+                                           uint64_t *addr)
+{
+    uint64_t size;
+
+    if ( !dt_property_read_u32(scmi_node, "arm,smc-id", &scmi_data->func_i=
d) )
+    {
+        printk(XENLOG_ERR "scmi: unable to read smc-id from DT\n");
+        return -ENOENT;
+    }
+
+    return scmi_dt_read_channel_addr(scmi_node, addr, &size);
+}
+
+static int __init scmi_check_device_permissions(struct scmi_channel *chann=
el)
+{
+    scmi_msg_header_t hdr =3D {
+        .id =3D SCMI_BASE_PROTOCOL_MESSAGE_ATTRIBUTES,
+        .protocol =3D SCMI_BASE_PROTOCOL,
+    };
+    struct scmi_msg_prot_message_attributes_a2p tx =3D {
+        .message_id =3D SCMI_BASE_SET_DEVICE_PERMISSIONS,
+    };
+    struct scmi_msg_prot_message_attributes_p2a rx;
+    int ret;
+
+    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), &rx, sizeof(rx));
+    if ( ret )
+        printk(XENLOG_ERR
+               "scmi: BASE_SET_DEVICE_PERMISSIONS is required for multi-ag=
ent "
+               "support (%d)\n", ret);
+
+    return ret;
+}
+
+static __init int scmi_probe(struct dt_device_node *scmi_node, const void =
*data)
+{
+    uint64_t addr;
+    int ret;
+    struct scmi_channel *channel;
+    unsigned int n_agents;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_attributes_p2a rx;
+
+    ASSERT(scmi_node !=3D NULL);
+
+    /*
+     * Only bind to the SCMI node provided by Xen under the xen,sci node
+     * (e.g. /chosen/xen/xen_scmi_config/scmi). This avoids binding to fir=
mware
+     * SCMI nodes that belong to the host OSPM and keeps the mediator scop=
ed to
+     * Xen-provided configuration only.
+     */
+    if ( !scmi_is_under_xen_sci(scmi_node) )
+        return -ENODEV;
+
+    if ( !acpi_disabled )
+    {
+        printk(XENLOG_WARNING "scmi: is not supported when using ACPI\n");
+        return -EINVAL;
+    }
+
+    ret =3D scmi_check_smccc_ver();
+    if ( ret )
+        return ret;
+
+    ret =3D scmi_dt_hyp_channel_read(scmi_node, &scmi_data, &addr);
+    if ( ret )
+        return ret;
+
+    INIT_LIST_HEAD(&scmi_data.channel_list);
+    spin_lock_init(&scmi_data.channel_list_lock);
+
+    scmi_data.dt_dev =3D scmi_node;
+
+    channel =3D smc_create_channel(SCMI_BASE_AGENT_ID_OWN, scmi_data.func_=
id,
+                                 addr, scmi_node);
+    if ( IS_ERR(channel) )
+    {
+        ret =3D PTR_ERR(channel);
+        goto out;
+    }
+
+    /* Mark as Xen management channel before collecting agent ID */
+    channel->domain_id =3D DOMID_XEN;
+
+    /* Request agent id for Xen management channel */
+    ret =3D collect_agent_id(channel);
+    if ( ret )
+        goto error;
+
+    /* Save the agent id for Xen management channel */
+    scmi_data.hyp_channel_agent_id =3D channel->agent_id;
+
+    hdr.id =3D SCMI_BASE_PROTOCOL_ATTIBUTES;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    ret =3D do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
+    if ( ret )
+        goto error;
+
+    n_agents =3D SCMI_FIELD_GET(SCMI_BASE_ATTR_NUM_AGENT, rx.attributes);
+    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
+
+    ret =3D scmi_check_device_permissions(channel);
+    if ( ret )
+        goto error;
+
+    ret =3D collect_agents(scmi_node);
+    if ( ret )
+        goto error;
+
+    ret =3D sci_register(&scmi_ops);
+    if ( ret )
+    {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %d)\=
n",
+               ret);
+        goto error;
+    }
+
+    scmi_data.initialized =3D true;
+    goto out;
+
+error:
+    unmap_channel_memory(channel);
+    free_channel_list();
+out:
+    return ret;
+}
+
+static const struct dt_device_match scmi_smc_match[] __initconst =3D {
+    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(scmi_smc_ma, "SCMI SMC MEDIATOR", DEVICE_FIRMWARE)
+        .dt_match =3D scmi_smc_match,
+        .init =3D scmi_probe,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
index 6d8286b5cb..bb4d362590 100644
--- a/xen/arch/arm/include/asm/firmware/sci.h
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -72,6 +72,13 @@ struct sci_mediator_ops {
      * Optional.
      */
     int (*assign_dt_device)(struct domain *d, struct dt_phandle_args *ac_s=
pec);
+
+    /*
+     * Resolve a boot-domain agent phandle after mediator initialization.
+     * Called only during boot. Optional.
+     */
+    int (*get_agent_id)(const struct dt_device_node *node,
+                        const char *property, uint8_t *agent_id);
 };
=20
=20
@@ -88,6 +95,10 @@ static inline bool sci_domain_is_enabled(struct domain *=
d)
  */
 int sci_register(const struct sci_mediator_ops *ops);
=20
+/* Optional boot-time callback; returns the configured or discovered ID. *=
/
+int sci_get_agent_id(const struct dt_device_node *node,
+                     const char *property, uint8_t *agent_id);
+
 /*
  * Initialize SCI functionality for domain if configured.
  *
@@ -158,6 +169,12 @@ int sci_do_domctl(struct xen_domctl *domctl, struct do=
main *d,
=20
 #include <public/arch-arm.h>
=20
+static inline int sci_get_agent_id(const struct dt_device_node *node,
+                                   const char *property, uint8_t *agent_id=
)
+{
+    return -EOPNOTSUPP;
+}
+
 static inline bool sci_domain_is_enabled(struct domain *d)
 {
     return false;
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 14d51e0746..722c2d2e3a 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -329,6 +329,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
=20
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
 #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA  2
=20
 #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE    0
 #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA    1
@@ -347,7 +348,9 @@ struct xen_arch_domainconfig {
     uint8_t arm_sci_type;
     /* IN */
     uint8_t v8r_el1_msa;
-    uint16_t pad;
+    /* IN */
+    uint8_t arm_sci_agent_id;
+    uint8_t pad;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
--=20
2.43.0

