Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2E606A320
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=l+Nzn+na;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=l+Nzn+na
Received: from list by lists.xenproject.org with outflank-mailman.1482051.1685923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQo9X-00081F-29; Tue, 10 Nov 2026 15:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482051.1685923; Tue, 10 Nov 2026 15:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQo9W-000818-Va; Tue, 10 Nov 2026 15:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1482051;
 Tue, 10 Nov 2026 15:52:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xQo9V-00080m-HK
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:52:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQo9S-00EeEp-S7
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:52:50 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af33dc7-bab6-0a2a0a5309dd-0a2a4508d8e0-24
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:52:50 +0100
Received: from [52.101.84.10]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af33dd2-f659-0a2a45080019-3465540a3368-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:52:50 +0100
Received: from DUZPR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::7) by PAWPR08MB11456.eurprd08.prod.outlook.com
 (2603:10a6:102:50c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 10 Nov
 2026 15:52:44 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::65) by DUZPR01CA0044.outlook.office365.com
 (2603:10a6:10:468::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:52:44 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 15:52:44 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by WA4PR08MB600330.eurprd08.prod.outlook.com (2603:10a6:1d0:33::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:52:11 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 15:52:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DDyokH2x/TbC10kjGc9u0JotsEAFNEzpf6dvtC4n/VpmpCwQP9QUPpnf2hhBpfEqHQ30geqo7yhNm7Fs36o/YYfOJskreYS+uSYxQZkkFSxCcBVGBA/eRSwcEKj21XCvhc8DmI/tr5S+NMN+3d/NW+yd7l5Jh1Fm5OZDrfgvPLvIzsKz9ZFktp5mFVTVU/yJw8SrA2UT4L3We+JPl0yb5Uilo6WL6doaEX6UrrKJLQYuCt2Sr7j8JqRX27Jzbv2XASPSymd7BQ6gUwOZrKaXjKMGJfxyHAkCpRmLf0gcXUnfk1Qzud1iQoEToGtxMOYhUQUm5ljqTys9V8/cUUsnsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExlQu0ZQDAFYwDb4+2fdM5N7jIxT3CMWUqU7XTPtjv4=;
 b=QGOyxhzvmLc7oiI2YnDfrq68RKS3pfEoaNq0Z9oAXHaxHYaKBGidCaoK8D/FuCS0N2zLvrTY2FPB1NTHLhk+osaSXVAzQuwcAVWTAaA2mZ22CPe6tf1WSRqG+jD5tfkjzyGXZXtnOPQY9lHvjGfQ5hQrQg4bXLFZGYOAXf2Q5StK7O3zT8W4PZXYGGy6NZPb+eQKXFIoyl1/hmvyHW40pc1gHIbIJCx7Fg0Y9VBajjI1r+u8AlMtj0CExAjL8PVhsv1+Kz3as4BxQv8ncb0uoniM2AO5GkXN1iUNGNAO5is7EGGXxB7pQN9sC5KSZJfUhOZzUu6ILxVX4Y4kEV14Ew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExlQu0ZQDAFYwDb4+2fdM5N7jIxT3CMWUqU7XTPtjv4=;
 b=l+Nzn+nakCg/8H8YNKganULJGWVMMMoS3d1G+n5BaPtpelyY/vcj67OXI7Tzx5Fh9sZJmrujzuJRJy6Ckcp63Tnk8T6QKAQivLMw3nost7vziiX41J9iQuCF5THZigqkK1kcucSFRTpTRbWpIPy7HFrQleGb2YJVO5xj3UpwIkI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hp1g9dlpY8JdieFr6rb2/hnex4aqAmeFG4oVdGllW3wdBkmbuTK8F/Jlxt7habGJiddBhlEICQgqVppbeRQMij7bd3zKCM4YxFoht+ePWp2Y2m/O6dxHhhpBG5KoBrkZaAwOET7C2jv+FjROBuwjwRHj5A2jQ9KorqXddOf8v26bcml3iYHxKzPbJb2Xe2lMjwQUKC1RQCWXxR3ss0O1WAvA//3oPcUkgPhvFK0E5KbrPOMOThevwA4CkbzeY8c4+XcIca50yVccqTT5rYLfcoqeFq3CbDy/P7u0vB6ykwabEc5REkG6CbX3czQlxN9rybAWCD3wlzMCBduFkU63AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExlQu0ZQDAFYwDb4+2fdM5N7jIxT3CMWUqU7XTPtjv4=;
 b=aGD9qtgoUM+XuP60GMqpvi/a9Q4r2zno5e1skleVR3w4HNwhenpn6Y1DqSohhUVQC5+llMQoHVDBGPUnDJ0iPV/qztxStOM7bhgRtRzfggOudG02xR9u0EhJ8reWFan3bhwqED1gO6KujRKPS4J0FBe/YqVoinkVivavTQQFtB3PcK8Cd+X2AjiFHeSQjSMBYHK9j5n83LliWosXM20xQ2Tjft6orrntHz739PPtQGnT49MSP5xGg6t5e5RZ4yXqGk1JkRlpd9ME62eC2/R3nsUx4U2MxapzIwJ7n2La0KgSZzWYcTuxZEcggzQy/5AGB7+eBz6TzQt3yEkxrC+OOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExlQu0ZQDAFYwDb4+2fdM5N7jIxT3CMWUqU7XTPtjv4=;
 b=l+Nzn+nakCg/8H8YNKganULJGWVMMMoS3d1G+n5BaPtpelyY/vcj67OXI7Tzx5Fh9sZJmrujzuJRJy6Ckcp63Tnk8T6QKAQivLMw3nost7vziiX41J9iQuCF5THZigqkK1kcucSFRTpTRbWpIPy7HFrQleGb2YJVO5xj3UpwIkI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Mykyta Poturai
	<mykyta_poturai@epam.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v13 13/14] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Thread-Topic: [PATCH v13 13/14] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Thread-Index: AQHdZlcRA6twTaYxgUenk4cIA63J3bcniiuA
Date: Tue, 10 Nov 2026 15:52:11 +0000
Message-ID: <67C4EE43-9CC9-4911-9369-79F8264B8EAA@arm.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <815a067a28bdc1db079cc3ad068e3ef74b7afe5c.1793129971.git.mykola_kvach@epam.com>
In-Reply-To:
 <815a067a28bdc1db079cc3ad068e3ef74b7afe5c.1793129971.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|WA4PR08MB600330:EE_|DB1PEPF000509F1:EE_|PAWPR08MB11456:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e5dca5-d31d-4672-cc9f-08df3f42a8fe
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009221227099003|261009223027099003|261009223327099003|261009221727099003|261009220027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|10067099003|11063799006|4143699003|56012099006|38070700021|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 kpREf5XcoXXISylyA6f7lQ9/LHWTTAywWQAoTz9IeUJc/qXj1CMZTQFpqPVrccfRI2dW65QISV/npVbmthmW+780dEkE4xiIx93LnIGXexF1Vcj/dmcbkxfMLL5KqXCPTbC20sCfZ9JuQZbOIvmJ8xaOprTL0TVqjPHkz93JW+GSEC2UbygYwTjYdM+7GlAYRnWv9nesmPJKABDKr7k8VVs+QOS/CmZtdCKUiKLu+rNpLRKL/Ye0QdZ3agQiMuFpRUGB8N6zWAirXud2oXnevSKZAMoww7Iv55ojttbmbHUCn0te6rop2GYUFHJizwOLTKdXGgmLbtBRp56LBWT0hCPI5dlIN2drpFRbMSul8tQCaTYu95dbz+pxuN49vKibDxxJ+cql0nI34Q1qxERakD2PQvT/4TnDtJVj8NSk0rdqTXkZ4ttbLEYD2KyKIgDImk9YHNK6C0wgw26A+bQKVlW1LCIGS+dcgyBUJY3xaXKyqkq6LXW477hihSOh5LIaO5l3fQYgo+zai13QTbzYBfRHRUQwdmNYHXjaQDLy2ohu6SA3SZ9WlJ1WvJ3eDX1wUjo9wjk1jhxmI89nQAFs5KNwAjT2wuIW4BeooXhjBWzr6sWJ21AJ/6m8GaY+uvZ8mMYyYsR9B2NYhLhy7lGGIHrIJPLG//dVo8pACK5Y5sD+s/7Fg13GZ0CoKkmhZpbqBeONu84NeLIc+0wgehivsrQ3PHcDHFebEsLT8HwSJck=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009221727099003)(261009220027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(10067099003)(11063799006)(4143699003)(56012099006)(38070700021)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <169F470710D98848B70534F5A9646965@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 p5MjbLB1xu+mGN48Itv9X1BQHlcmEnxOOme4blqOmTYPZ3gaF5ehP0UOT12TARIItkZ9jhyuAAAEEtrrSQQTkyq1wvqbsoGM0DgOgbXfHwtG2l2skPBvr3akeEMpJij/lUsPIH21hZKM3iiMn6NxwINyu6wPLA90ffwGfk18mZqEshtbeelc6LmetLvkrdjpghUeBvq9BRq3fuGaeuwypicN96erRC7Ag+5YiH1vPz0Ti+UyyhdqGCoUUppdYbXetjcidXtYA0Rr5msGRFszFFe2Pqw1xQ5kvEXe660X7qxyZkNx/91e4eqdKhGpuwUlxBdxCz9SRDT3DoUNRN9jGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR08MB600330
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3ab2d52-869c-4086-0ba7-08df3f429572
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|82310400026|36860700016|7416014|1800799024|23010399003|35042699022|10067099003|18002099003|6133799003|22082099003|261102123227099003|56012099006|261028144727099003|261009223327099003|261009220027099003|261022075727099003|11063799006|4143699003|261009223027099003|261009221727099003|261026140227099003|261026121527099003|261022105027099003|261009221227099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	v2G5au3P4bIa11FmxNCW2+1Kd77Id08/OPO2Rx+tIvPPZnV0LpPwaAxrQQ2FL/TBOtSWlJFfL651Ryf9PnVNASuMzVHOTAnnd0/JVDiZ/bxCWkvHKscuVBy6fR8n57I/OQ+onGZPB0oO5FFu0060XkQ307h1ML0D6Y+H53P8OpjG0Y5HnyfqSOi6oDGwo+8YVCZOCoMZaTDeAuITkiyCEV+Ewv1GdbVvGbRv/Ml+xkqwEfhq9OK2YUvSHeqSRBL1gM0TIyva82GP30EazlKVBuUdNvbrBo96TmQ808BQx+pbPdgU0xlgRnBOumMLZqpVp3jvisTAoo0qzNixPtSX0CAk/rfoa+wLDKomU40inJCtYvKNkbWNOv2jjRM41BmH+CWBGkDED71AqBIcv4LAchcJQ74JI0yZnv1k9EnM+JgDSOIsjzDvHF0T1LXLxyiV6/ZgzEAk4AwcLWekiGWAsecq3kxiFzNNj483jie0Xdm93hLpnFTMENe23+n+n4O0gWU4gEEbpFQ1QPQDxOiy+0pRapbC4cfuEUYKYCn0LCxVOGiiI7D/likrIcuS//AL7BvND8EZTOkLMyShBCd7nzHkKxX4ICistlhhUxcc/VtZ2YljrgEdmA11uBAW7o7gpTYy76PbsubhTdPnAFxrKyFz0kkiq1knBpOrA8RWzjx3gKNJsPyzTcNTty+yxnDTcdTyjW86xqxdBR+Fz24p/w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(36860700016)(7416014)(1800799024)(23010399003)(35042699022)(10067099003)(18002099003)(6133799003)(22082099003)(261102123227099003)(56012099006)(261028144727099003)(261009223327099003)(261009220027099003)(261022075727099003)(11063799006)(4143699003)(261009223027099003)(261009221727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261009221227099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e1tQrl88RdwMWlZKQam7wOYrW7qQgnAhwk1kwE4v/N82GU4RNHumR9r2lRIyhrXDJkFneD/bl1GZ8K9OW91KiRW6uS4blMd8Fhyb6K5Apsw0bbcL2cIBZHUZCGDL6RMlDMQP4iOFgbve61RGMKt3tTe4jWJhh3GyQ+1gHcOAWYVlxdlWtkrhINwLRNyB9e25Y1HpJ0ovxCnsJUmZb/QcfTlKf/3x50NbXLjalT+eTVso/D4zJ/9y/uaoDqG9hiRV6MIIi8mxwdAD6DcPFrteHp+gNX84vs+nZmA0kyjs+X0Fxy86ArpiXvpOmrtApc6m29l9e/xMRInam4T7vs2ZaLRRpsfxXea7QgkJJfYyHzL4JRAmB1G0zrWwJMa02jyVYWhI51bqJPZFJOr/rGefgcLg0BFlsjt0bMRRx1LtwdB4lv/gtLliZwaRuN807VlS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:52:44.4337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e5dca5-d31d-4672-cc9f-08df3f42a8fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11456
X-purgate-ID: tlsNG-c1860d/1794325970-D614687B-2A881DC0/0/0
X-purgate-type: clean
X-purgate-size: 21560
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 27 Oct 2026, at 22:06, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
> capability for platforms where the hardware domain can be parked with
> SHUTDOWN_suspend without calling hwdom_shutdown().
>=20
> Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
> non-control domains, including the hardware domain when it is not acting
> as a control domain, the call is handled as a guest/domain suspend reques=
t
> and parks the domain in SHUTDOWN_suspend.
>=20
> A non-control domain can suspend only while a control domain exists to
> resume it using XEN_DOMCTL_resumedomain. Return PSCI_DENIED otherwise,
> including in a dom0less setup with no control domain.
>=20
> Control domains need additional sequencing because their SYSTEM_SUSPEND
> request is used to coordinate host-wide suspend. A non-last awake control
> domain may be parked in SHUTDOWN_suspend without requiring the host
> suspend path to be available. The last awake control domain is treated as
> the point where the request becomes a host-suspend request, and it may
> only proceed when all non-control domains are already in SHUTDOWN_suspend
> and the host suspend path is available.
>=20
> Keep the control-domain sequencing and domain-readiness checks out of
> PSCI_FEATURES. They are per-attempt runtime conditions rather than stable
> PSCI function availability. Advertise SYSTEM_SUSPEND as implemented by
> vPSCI and report attempt-time policy failures as PSCI_DENIED.
>=20
> Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
> so that SHUTDOWN_suspend from the hardware domain can be treated as a
> domain suspend state rather than as a hardware-domain initiated host
> shutdown. This does not by itself imply that host-wide suspend is
> available.
>=20
> Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPEND
> capability with runtime blockers reported by Xen-owned subsystems. Add
> runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ
> paths lacking suspend/resume support. These blockers are runtime based,
> so they only apply to drivers or paths that Xen actually uses on the
> platform. For SMMUv3, the blocker applies only when Xen actually uses the
> MSI IRQ path, since resume does not restore the SMMU *_IRQ_CFGn MSI
> registers yet.
>=20
> Block host suspend when Xen uses an R-Car Gen4 PCIe controller. The
> PCIe BDF-to-OSID registers are not saved and restored yet. This does
> not affect normal IPMMU use or guest-only suspend.
>=20
> Add a struct domain forward declaration to xen/suspend.h so the generic
> header can expose arch_domain_resume() without requiring a full domain.h
> include.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>


With the Nit below fixed and the commit message updated to explain the
!MPU restriction as discussed with Jan, for the Arm and Arm SMMUv3
changes:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> # ARM, ARM SMMUv3

> ---
> Changes in V13:
> - Block host suspend when Xen uses an R-Car Gen4 PCIe controller, since
>  PCIe OSID state is not restored.
> - Deny guest SYSTEM_SUSPEND when no control domain exists to resume it.
> - Split the long suspend-state check across two lines.
>=20
> Changes in V12:
> - handle missing is_shut_down, change checking to call of
>  domain_shutdown_completed
>=20
> Changes in V11:
> - Mark host_system_suspend_runtime_allowed as __ro_after_init.
> - Avoid printing the SMMUv3 MSI IRQ host suspend blocker more than once
>  when multiple SMMUv3 instances use MSIs.
> - Wrap the Arm IOMMU host suspend blocker in CONFIG_SYSTEM_SUSPEND to mak=
e
>  its policy-only use explicit.
>=20
> Changes in V10:
> - Return PSCI_DENIED rather than PSCI_NOT_SUPPORTED when the last awake
>  control domain cannot proceed to host suspend, keeping PSCI_FEATURES
>  stable once SYSTEM_SUSPEND is advertised.
> - Shorten SYSTEM_SUSPEND blocker messages and use %pd when logging the
>  control domain.
> - Mark serial_suspend_available as __ro_after_init.
> - Mention the struct domain forward declaration added to xen/suspend.h.
>=20
> Changes in V9:
> - Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEN=
D
>  so that hardware-domain SHUTDOWN_suspend support is not tied to
>  host-wide system suspend availability.
> - Add runtime host suspend blockers for Xen-owned subsystems lacking
>  suspend/resume support.
> - Keep vPSCI SYSTEM_SUSPEND advertised through PSCI_FEATURES and enforce
>  control-domain sequencing in the call handler.
> ---
> xen/arch/arm/Kconfig                  |   1 +
> xen/arch/arm/gic.c                    |   6 ++
> xen/arch/arm/include/asm/psci.h       |   3 +
> xen/arch/arm/include/asm/suspend.h    |  10 ++-
> xen/arch/arm/pci/pci-host-rcar4.c     |   4 +
> xen/arch/arm/psci.c                   |   7 ++
> xen/arch/arm/suspend.c                |  40 +++++++++
> xen/arch/arm/vpsci.c                  | 119 +++++++++++++++++++++++---
> xen/common/Kconfig                    |   3 +
> xen/common/domain.c                   |   7 +-
> xen/drivers/char/serial.c             |  12 +++
> xen/drivers/passthrough/arm/iommu.c   |   6 ++
> xen/drivers/passthrough/arm/smmu-v3.c |   9 ++
> xen/include/xen/serial.h              |   1 +
> xen/include/xen/suspend.h             |   2 +
> 15 files changed, 217 insertions(+), 13 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index b9c5c40678..fd5f0ddb17 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,6 +19,7 @@ config ARM
> 	select HAS_ALTERNATIVE if HAS_VMAP
> 	select HAS_DEVICE_TREE_DISCOVERY
> 	select HAS_DOM0LESS
> +	select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
> 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
> 	select HAS_SHARED_INFO
> 	select HAS_STACK_PROTECTOR
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 30087b5938..3fb0a56d94 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -26,6 +26,7 @@
> #include <asm/device.h>
> #include <asm/io.h>
> #include <asm/gic.h>
> +#include <asm/suspend.h>
> #include <asm/vgic.h>
> #include <asm/acpi.h>
>=20
> @@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(voi=
d)
> void register_gic_ops(const struct gic_hw_operations *ops)
> {
>     gic_hw_ops =3D ops;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !ops->suspend || !ops->resume )
> +        host_system_suspend_disable("GIC driver lacks suspend support");
> +#endif
> }
>=20
> static void clear_cpu_lr_mask(void)
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index bb3c73496e..142fa1bfe5 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
> void call_psci_system_off(void);
> void call_psci_system_reset(void);
> int call_psci_system_suspend(void);
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +bool psci_system_suspend_allowed(void);
> +#endif
>=20
> /* Range of allocated PSCI function numbers */
> #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index c848fc6340..50dc6e9fdf 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -39,7 +39,15 @@ extern struct resume_cpu_context resume_cpu_context;
>=20
> int prepare_resume_ctx(void);
> void hyp_resume(void);
> -#endif /* CONFIG_SYSTEM_SUSPEND */
> +bool host_system_suspend_allowed(void);
> +void host_system_suspend_disable(const char *reason);
> +
> +#else /* !CONFIG_SYSTEM_SUSPEND */
> +
> +static inline bool host_system_suspend_allowed(void) { return false; }
> +static inline void host_system_suspend_disable(const char *reason) {}
> +
> +#endif
>=20
> #endif /* ARM_SUSPEND_H */
>=20
> diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-hos=
t-rcar4.c
> index e1e8eb0ee1..0d85ccf4f5 100644
> --- a/xen/arch/arm/pci/pci-host-rcar4.c
> +++ b/xen/arch/arm/pci/pci-host-rcar4.c
> @@ -11,6 +11,7 @@
> #include <asm/device.h>
> #include <asm/io.h>
> #include <asm/pci.h>
> +#include <asm/suspend.h>
>=20
> #include "pci-designware.h"
> #include "pci-host-rcar4.h"
> @@ -221,6 +222,9 @@ static int __init pci_host_rcar4_probe(struct dt_devi=
ce_node *dev,
>     dw_pcie_set_priv(bridge, priv);
>     dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
>=20
> +    host_system_suspend_disable(
> +        "R-Car Gen4 PCIe OSID state is not restored");
> +
>     return 0;
> err:
>     xfree(priv);
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 4d502216ce..187cad44d5 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
>=20
> #define PSCI_RET(res)   ((int32_t)(res).a0)
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +bool psci_system_suspend_allowed(void)
> +{
> +    return has_psci_system_suspend;
> +}
> +#endif
> +
> int call_psci_cpu_on(int cpu)
> {
>     struct arm_smccc_res res;
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 6ea4a0f9cc..c7c26bcf03 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,9 +1,49 @@
> /* SPDX-License-Identifier: GPL-2.0-only */
>=20
> +#include <asm/psci.h>
> #include <asm/suspend.h>
>=20
> +#include <xen/lib.h>
> +#include <xen/serial.h>
> +
> struct resume_cpu_context resume_cpu_context;
>=20
> +/*
> + * Non-PSCI infrastructure can make host suspend impossible even when th=
e PSCI
> + * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has n=
o valid
> + * suspend/resume path.
> + *
> + * This gate is checked only when the last awake control domain attempts=
 to
> + * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
> + */
> +static bool __ro_after_init host_system_suspend_runtime_allowed =3D true=
;
> +
> +static bool host_serial_suspend_allowed(void)
> +{
> +    if ( serial_suspend_supported() )
> +        return true;
> +
> +    printk_once(XENLOG_INFO
> +                "Host SYSTEM_SUSPEND blocked: serial unsupported\n");
> +
> +    return false;
> +}
> +
> +bool host_system_suspend_allowed(void)
> +{
> +    return psci_system_suspend_allowed() &&
> +           host_serial_suspend_allowed() &&
> +           host_system_suspend_runtime_allowed;
> +}
> +
> +void host_system_suspend_disable(const char *reason)
> +{
> +    host_system_suspend_runtime_allowed =3D false;
> +
> +    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
> +           reason ? reason : "unsupported suspend/resume path");
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index ac6af6118f..0131c297dd 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -5,6 +5,7 @@
>=20
> #include <asm/current.h>
> #include <asm/domain.h>
> +#include <asm/suspend.h>
> #include <asm/vgic.h>
> #include <asm/vpsci.h>
> #include <asm/event.h>
> @@ -219,6 +220,94 @@ static void do_psci_0_2_system_reset(void)
>     domain_shutdown(d,SHUTDOWN_reboot);
> }
>=20
> +/*
> + * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend tra=
nsition,

This line is over 80 chars it seems, can you wrap it ?

Cheers
Bertrand

> + * so multiple control domains cannot all observe each other as still aw=
ake.
> + */
> +static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
> +
> +static bool domain_in_suspend_state(struct domain *d)
> +{
> +    bool suspended;
> +
> +    spin_lock(&d->shutdown_lock);
> +    suspended =3D domain_shutdown_completed(d) &&
> +                (d->shutdown_code =3D=3D SHUTDOWN_suspend);
> +    spin_unlock(&d->shutdown_lock);
> +
> +    return suspended;
> +}
> +
> +static int32_t domain_psci_system_suspend_policy(struct domain *d)
> +{
> +    struct domain *other;
> +    bool last_awake_control_domain =3D true;
> +    bool awake_non_control_domain =3D false;
> +    bool has_control_domain =3D is_control_domain(d);
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( other )
> +    {
> +        bool suspended;
> +
> +        if ( other =3D=3D d )
> +            continue;
> +
> +        if ( is_control_domain(other) )
> +            has_control_domain =3D true;
> +
> +        suspended =3D domain_in_suspend_state(other);
> +        if ( suspended )
> +            continue;
> +
> +        if ( is_control_domain(other) )
> +        {
> +            last_awake_control_domain =3D false;
> +            break;
> +        }
> +
> +        awake_non_control_domain =3D true;
> +    }
> +
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    /* Non-control domains need a control domain to resume them. */
> +    if ( !is_control_domain(d) )
> +        return has_control_domain ? 0 : PSCI_DENIED;
> +
> +    /*
> +     * Another control domain is still awake. This request is only the f=
irst
> +     * phase of the sequencing: park this control domain and leave the h=
ost
> +     * running. Host-wide suspend gates must not block this intermediate=
 state.
> +     */
> +    if ( !last_awake_control_domain )
> +        return 0;
> +
> +    /*
> +     * This is the last awake control domain. It must not be parked unle=
ss the
> +     * request can proceed as a host-suspend request; otherwise Xen woul=
d lose
> +     * the last domain that can coordinate the system suspend.
> +     */
> +    if ( awake_non_control_domain )
> +    {
> +        printk(XENLOG_DEBUG
> +               "SYSTEM_SUSPEND denied for %pd: non-control domains awake=
\n",
> +               d);
> +        return PSCI_DENIED;
> +    }
> +
> +    /*
> +     * Host-wide gates are relevant only for the last-control-domain cas=
e. They
> +     * must not block parking of a non-last control domain, but they mus=
t deny
> +     * the last control domain when host suspend is not currently availa=
ble.
> +     */
> +    if ( !host_system_suspend_allowed() )
> +        return PSCI_DENIED;
> +
> +    return 0;
> +}
> +
> static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t c=
id)
> {
>     int32_t rc;
> @@ -232,10 +321,6 @@ static int32_t do_psci_1_0_system_suspend(register_t=
 epoint, register_t cid)
>     if ( is_64bit_domain(d) && is_thumb )
>         return PSCI_INVALID_ADDRESS;
>=20
> -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> -    if ( is_hardware_domain(d) )
> -        return PSCI_NOT_SUPPORTED;
> -
>     /* Ensure that all CPUs other than the calling one are offline */
>     domain_lock(d);
>     for_each_vcpu ( d, v )
> @@ -252,16 +337,29 @@ static int32_t do_psci_1_0_system_suspend(register_=
t epoint, register_t cid)
>     if ( rc )
>         return PSCI_DENIED;
>=20
> -    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +    spin_lock(&vpsci_system_suspend_lock);
> +
> +    rc =3D domain_psci_system_suspend_policy(d);
> +    if ( !rc )
> +    {
> +        rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +        if ( rc )
> +            rc =3D PSCI_DENIED;
> +        else
> +        {
> +            rctx->ctxt =3D ctxt;
> +            rctx->wake_cpu =3D current;
> +        }
> +    }
> +
> +    spin_unlock(&vpsci_system_suspend_lock);
> +
>     if ( rc )
>     {
>         free_vcpu_guest_context(ctxt);
> -        return PSCI_DENIED;
> +        return rc;
>     }
>=20
> -    rctx->ctxt =3D ctxt;
> -    rctx->wake_cpu =3D current;
> -
>     gprintk(XENLOG_DEBUG,
>             "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D%#=
"PRIregister"\n",
>             epoint, cid);
> @@ -287,10 +385,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_fu=
nc_id)
>     case PSCI_0_2_FN32_SYSTEM_RESET:
>     case PSCI_1_0_FN32_PSCI_FEATURES:
>     case ARM_SMCCC_VERSION_FID:
> -        return 0;
>     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> -        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED =
: 0;
> +        return 0;
>     default:
>         return PSCI_NOT_SUPPORTED;
>     }
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 5b289e444f..0a3e5d8a93 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -140,6 +140,9 @@ config HAS_EX_TABLE
> config HAS_FAST_MULTIPLY
> 	bool
>=20
> +config HAS_HWDOM_SYSTEM_SUSPEND
> +	bool
> +
> config HAS_IOPORTS
> 	bool
>=20
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index b41be89cd0..eac94cb888 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1377,6 +1377,11 @@ void __domain_crash(struct domain *d)
>     domain_shutdown(d, SHUTDOWN_crash);
> }
>=20
> +static inline bool want_hwdom_shutdown(uint8_t reason)
> +{
> +    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
> +           reason !=3D SHUTDOWN_suspend;
> +}
>=20
> int domain_shutdown(struct domain *d, u8 reason)
> {
> @@ -1393,7 +1398,7 @@ int domain_shutdown(struct domain *d, u8 reason)
>         d->shutdown_code =3D reason;
>     reason =3D d->shutdown_code;
>=20
> -    if ( is_hardware_domain(d) )
> +    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
>         hwdom_shutdown(reason);
>=20
>     if ( domain_shutting_down(d) )
> diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> index cf0abf1893..1cdf4968ac 100644
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -490,6 +490,8 @@ const struct vuart_info *serial_vuart_info(int idx)
>=20
> #ifdef CONFIG_SYSTEM_SUSPEND
>=20
> +static bool __ro_after_init serial_suspend_available =3D true;
> +
> void serial_suspend(void)
> {
>     int i;
> @@ -506,6 +508,11 @@ void serial_resume(void)
>             com[i].driver->resume(&com[i]);
> }
>=20
> +bool serial_suspend_supported(void)
> +{
> +    return serial_suspend_available;
> +}
> +
> #endif /* CONFIG_SYSTEM_SUSPEND */
>=20
> void __init serial_register_uart(int idx, struct uart_driver *driver,
> @@ -514,6 +521,11 @@ void __init serial_register_uart(int idx, struct uar=
t_driver *driver,
>     /* Store UART-specific info. */
>     com[idx].driver =3D driver;
>     com[idx].uart   =3D uart;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !driver->suspend || !driver->resume )
> +        serial_suspend_available =3D false;
> +#endif
> }
>=20
> void __init serial_async_transmit(struct serial_port *port)
> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthroug=
h/arm/iommu.c
> index 100545e23f..461e01703e 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -19,6 +19,7 @@
> #include <xen/device_tree.h>
> #include <xen/iommu.h>
> #include <xen/lib.h>
> +#include <xen/suspend.h>
>=20
> #include <asm/device.h>
>=20
> @@ -46,6 +47,11 @@ void __init iommu_set_ops(const struct iommu_ops *ops)
>     }
>=20
>     iommu_ops =3D ops;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !ops->suspend || !ops->resume )
> +        host_system_suspend_disable("IOMMU driver lacks suspend support"=
);
> +#endif
> }
>=20
> int __init iommu_hardware_setup(void)
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 58530ef2d1..247c6156cc 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -91,6 +91,7 @@
> #include <asm/io.h>
> #include <asm/iommu_fwspec.h>
> #include <asm/platform.h>
> +#include <asm/suspend.h>
>=20
> #include "smmu-v3.h"
>=20
> @@ -1888,6 +1889,7 @@ static void arm_smmu_write_msi_msg(struct msi_desc =
*desc, struct msi_msg *msg)
>=20
> static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
> {
> +	static bool __ro_after_init host_suspend_blocked_by_msi;
> 	struct msi_desc *desc;
> 	int ret, nvec =3D ARM_SMMU_MAX_MSIS;
> 	struct device *dev =3D smmu->dev;
> @@ -1926,6 +1928,13 @@ static void arm_smmu_setup_msis(struct arm_smmu_de=
vice *smmu)
> 		}
> 	}
>=20
> +	if ( !host_suspend_blocked_by_msi )
> +	{
> +		host_suspend_blocked_by_msi =3D true;
> +		host_system_suspend_disable(
> +			"SMMUv3 MSI IRQ path is unsupported for host suspend");
> +	}
> +
> 	/* Add callback to free MSIs on teardown */
> 	devm_add_action(dev, arm_smmu_free_msis, dev);
> }
> diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> index 3a71da767d..4c6f891221 100644
> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -137,6 +137,7 @@ const struct vuart_info* serial_vuart_info(int idx);
> /* Serial suspend/resume. */
> void serial_suspend(void);
> void serial_resume(void);
> +bool serial_suspend_supported(void);
> #endif
>=20
> /*
> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> index 6f94fd53b0..a941331035 100644
> --- a/xen/include/xen/suspend.h
> +++ b/xen/include/xen/suspend.h
> @@ -6,6 +6,8 @@
> #if __has_include(<asm/suspend.h>)
> #include <asm/suspend.h>
> #else
> +struct domain;
> +
> static inline void arch_domain_resume(struct domain *d) {}
> #endif
>=20
> --=20
> 2.53.0
>=20


