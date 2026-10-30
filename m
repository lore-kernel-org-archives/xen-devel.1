Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6901A606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=BSm1P5R1;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=BSm1P5R1
Received: from list by lists.xenproject.org with outflank-mailman.1465497.1676023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMiz2-0002DF-Cz; Fri, 30 Oct 2026 09:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465497.1676023; Fri, 30 Oct 2026 09:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMiz2-0002D8-7y; Fri, 30 Oct 2026 09:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1465497;
 Fri, 30 Oct 2026 09:33:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xMiz0-0002D2-SK
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 09:33:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMiz0-00CAPp-8m
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 10:33:10 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ae4644c-2eae-0a2a0a5409dd-0a2a450cb3fa-38
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:33:09 +0100
Received: from [52.101.70.48]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ae46455-f479-0a2a450c0019-346546307819-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:33:09 +0100
Received: from AM0PR10CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::18)
 by CPHPR08MB883815.eurprd08.prod.outlook.com (2603:10a6:380:107::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:33:07 +0000
Received: from AMS0EPF0000056B.eurprd02.prod.outlook.com
 (2603:10a6:20b:150:cafe::38) by AM0PR10CA0038.outlook.office365.com
 (2603:10a6:20b:150::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Fri, 30
 Oct 2026 09:33:07 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000056B.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 09:33:07 +0000
Received: from DBBPR08MB4758.eurprd08.prod.outlook.com (2603:10a6:10:da::16)
 by VE1PR08MB5821.eurprd08.prod.outlook.com (2603:10a6:800:1b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 09:32:31 +0000
Received: from DBBPR08MB4758.eurprd08.prod.outlook.com
 ([fe80::2a9f:d8ff:26ff:d54c]) by DBBPR08MB4758.eurprd08.prod.outlook.com
 ([fe80::2a9f:d8ff:26ff:d54c%4]) with mapi id 15.21.0546.021; Fri, 30 Oct 2026
 09:32:31 +0000
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
 b=bEA3YTw5KJk1zoSRCRvcvxykJE76nJ4HwRDGjrSDQlBR3XCP6iRHy64sQF/4CJJMzJNY0seb5TJQOGVWdyPblIPqlh3sODBqWuCekBm72UOSFaXEMeHUCZ24AWiYeJOKA11Ishvt080AZjmpRoSImDIV7PzK2PS9yJ4mxiP0pLx7kDyUvfAi4c+cUc93XSfmTi5nhHW/V4283M6zdfZQ2tJpCryQi94cnguEr/SzdFgueYnM6tRA8XYpyhGAaRm3m9vkpTRvgkECGkNQkwapKuUonULVfrHUC4T8Z0sUobluT1cnLSdebfnWsI87n783Jb+dk99fuU/grECFkP+QVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FO/6dVE3HNPjmSjoSUjUYCjGOT9clWzW0SYiW5FxKE=;
 b=vkO2nWhg06IWYDH5wghFJk6583PtSY1z6ea2ypkB4TH5DapNUVx9iVDU/QZSdAx2mZRwgJcC367wMy9H9XiX8/NvzG0QqO7ioFwobp62o7nUaQhhpBv+K1eilzrMwENqMAOWiwMP5Uv03z0fgXL9bXKSoBr2t5iO5NNazPQ68xI5zy1UvajNXvzmn6YkslMYKTgmXVmU0lOdh+c/PE6JgBxiyZ9jgmoRK05ksxnirSVPftrtvnDr4GqFk2VKOSKE3xxAUZ+9x9KmUxSd2fNq1VmBgN/hIAvOh2iP10WnzLXDT0bJ31PB1gvrMVMMZMDLhAM4OYMt+HTb+0ftDkTdKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FO/6dVE3HNPjmSjoSUjUYCjGOT9clWzW0SYiW5FxKE=;
 b=BSm1P5R1DMHy6TLMUhz25QxlldfsNfqhs8+inKPVQ9VdmK0wtPHn8xKeQNTh6qn6vj1w0TfEQRc/K9++lt5WWU84tlWK/POUS26nbMbjIgbQkeTBcJWOUVYgASQh+8/2GoH/trOdvzsEG/f5s9aP+3DrQCKCjzYQnuw+rIy6ebs=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWJy/nATVWREoMgMeiLqV1m3f6sinoiRWHmjcuMpJ3/SSKaZxSyZHiuzTsurqWspK1arrUveW/3MYxK6O0wgrj3zknNsyInvy44+zk6bvPdCr3FCIkjEI48qZ93E8oZVLRER/5ljegmnZWi7GAzneusfwu9YjS2tng2wA/T/6IqdadcMwYkRVwQ6vyrDM04gVSfeWwsaWMkvWSe/r9Y+uwHz4LSleE2XodsCtSoa4hSAANj8wbmlbhQum+d6rRpwWenlVyQPWmJ1ceSaxJk7Gznfdignro+FS+nECtCafSvLyN97va1wY2E0L00UQULT+ai42qqEvzcLhD6LDr8oOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FO/6dVE3HNPjmSjoSUjUYCjGOT9clWzW0SYiW5FxKE=;
 b=Oh/UC46nDchk9tNjpzyFkatJRlm4p7+pt439BYgGZfKRuf/8sD71vbGwcnxbjh7uWJm4wsd5T9FDQm14T3TgEWVhxDcAGvkuGM6zuwTB2DwFQarfzvy2g58sB9gP4yELWZe3VXZVEWFU1+akdXkJ/61pAvyLickactJ+K2/gpehUqWn1aL+Nlh525AgXPyDeA8wRzpykCeVHQDW6rKwH9sVZsWJt+oe4t/U0qi2CM2ErD9BNXeruqNTl5XE3L+IppcvQFTbdzRJ0VFJVE8lwKiIaWKbLSb5aXODRqH83wZs4j5+GKHoaWM4Ejt2Ksi1ye0Q1cEH5a86ETUmME05tag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FO/6dVE3HNPjmSjoSUjUYCjGOT9clWzW0SYiW5FxKE=;
 b=BSm1P5R1DMHy6TLMUhz25QxlldfsNfqhs8+inKPVQ9VdmK0wtPHn8xKeQNTh6qn6vj1w0TfEQRc/K9++lt5WWU84tlWK/POUS26nbMbjIgbQkeTBcJWOUVYgASQh+8/2GoH/trOdvzsEG/f5s9aP+3DrQCKCjzYQnuw+rIy6ebs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v6] xen/arm: smmuv3: Add support for removing devices
Thread-Topic: [PATCH v6] xen/arm: smmuv3: Add support for removing devices
Thread-Index: AQHdZhd6qHbitDeIwk6I1fMybh5L7LcV1vGA
Date: Fri, 30 Oct 2026 09:32:31 +0000
Message-ID: <C18924F6-6E70-4FBB-AF86-C6DF932C1F32@arm.com>
References:
 <099ab694a01c3550e65853ed4cca06efd7043d68.1793107742.git.mykyta_poturai@epam.com>
In-Reply-To:
 <099ab694a01c3550e65853ed4cca06efd7043d68.1793107742.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBBPR08MB4758:EE_|VE1PR08MB5821:EE_|AMS0EPF0000056B:EE_|CPHPR08MB883815:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d194dd-7b9e-4d5f-281c-08df3668ce0c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|11063799006|56012099006|261026140227099003|6133799003|18002099003|22082099003|261028144727099003|10067099003|261021121427099003|261009223027099003|261022105027099003|261022075727099003|261021123027099003|261026121527099003|260925021311599003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info-Original:
 CCbrnpxDGWTPOYhNaK/eZ5USTm02IcvfuIFcgBRwpgpQ8UymIUVkjQmIhC29JPZvrlbvBotXNjw3O2l8zXb3esttDLYdZq39tICzVkbf5FpdKQKkpfB5Ld51Cyv6VQ9ERHRyeUl7+BALwCmnG9sTH004iNy4hh1lfBf/P2iVLJIOOst0/QH262MVSdeTqHNCzRRHYlmA4Xc2W39++RrY5gQyRBhclXH/rr076ag2cTj5Y9Lv8QaKguFsNZpfP4fzAVUgSuf222GE6SvCktSkoOTuYKzTlhoVnHFqXMWyi9crWv6PCk/QQWDIfEL3EA07QoUPIRdeoiFVKVYDP713F7rUMdVidm03oVyme5NemNWCQV6iLAe7Hs2KGu3ioc51pP5c7odq7ayZFA/ri/P3fYmLp7ilyV8R94EN9YwJEiLbTYBGrrE5sUuj3ezL8RVWeasYuLZ2dlaLWVtLxei2yAwR5zU0HnX5NCHBpTgbOrKJDJ18SLhxqneOZ60PbQjqsZnyME2TvCFu+4phwwL9zim3lZmOR6/GbQb5FRinBqX/3llqRqH9bsgXF2WDLfzIgSqC+Hmuv18QG1++xESIwvuFI+Q9q5uFE8Obte+kWJIn96LckE+1XsQ/M2J4triySGVAxI/cPp/aTS1llQzggeq02CXrN4MhY1rSjO61nDY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4758.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(11063799006)(56012099006)(261026140227099003)(6133799003)(18002099003)(22082099003)(261028144727099003)(10067099003)(261021121427099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261026121527099003)(260925021311599003)(260925022911599003)(260925021911599003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <68CEB219EB53BF459FE30FED46FC9D99@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 iwWmG2eQ8EZ9tlN4bTaK76sclTXZazhV+Y36hSRt6DOpsuuD5ttlIadGXPVqxkhGarCI9HnMtj47dF2Q7MXjPK5pHhxToN5eGYA048jDAJwUz9XSqHW7gqhMUgeJmytPtywFL2YnAFxTNTb2PUv9d59FaYTndy3Y3/56gfY1l90oAjQ72pisswksd+4e12AIizVTzdmJNxMyNHKIQDO5nBPCilmeMdqj++QOAMwS4vNy/7iPKVdZ8oF+DPr2vDD+ucCRgZLA8Uk6H6op5tgMxQzQ+J3qSUH45ZN5p3RH101rmtWiRu/J6Kbb0fvrBR9V0G+sK31KZKhL7lVl+3BgJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5821
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000056B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee5ec916-a58d-43e1-903e-08df3668b8e8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|23010399003|14060799003|36860700016|1800799024|82310400026|22082099003|18002099003|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	aSpc30YeLpbc4UL4LasFyTmNly2dlei0ocX0klRVpb5i5pSsUKX/ug+vkl91cqQnskKvyZUfhXAcUDfigjNeGgfkF9wvxhBpXoSWZXu8+6Eiv+XqBvA4c0GS4CLEg19s9+nQAkehHZ+Hu9Ssu/dL+Rjh9MmS29F9OzEAc2cs57ULKWYpo2m7rYYJG/SAuPzN4GJtLmMNHgsdVUiEZEI3ekiu2BYjGix2hKRVxwEh/5cfj7FRAlEo8iq/dZ6aAFaNnCsznMfeSQJL1H7tDc4awdw59Ztd3fYrg1ibq8BUT24TcNa+FmBkQS5JEe6KfpM+bo7PXnvP+NLIj0DmYidGxflx9XAljrQjmzJ3A8Zb6N80Ir7H5cK492ijdCAznJEa/eRnYJtlcIe7v8IHfg7h5hQwdrybEBnRP2JGxKjQNBCOeG+4UZ+M056Dht0GAHS9KtfXEyxjgMgiRIKWbyyw40sVtKQZmhpju/ob9GuXFFiC8ttCSnhc+K7SVrQe9RpGtB3XN86ylsEshvrSjAqIFcrEY08dqlwjPpgXbiqWa57y5QiunBZXie/rp36A2G3pSRvtFGg4A8wW5Q06X8ldU5Cp5ypew/0V/XE0sGn2pclKjgXkuajCD8VqEJsPNvoBARMBllayFkNImJrQbgi++Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(23010399003)(14060799003)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XNs6s1EcNCY76rmzXs0IiyPxuoXVu6w2qdX7ctuwll+P/fIqEJGfJxZVLRNp0l7GH6wvuf11+GOnQlz71N1AdVooqiQ2Fg4a5O8oB1mn8RX52SoYWQu+WJkXlgW0lBbrlCqY2+J3lW0QjCUt8hDWSBSqgkHNCuzoZ07t7Dqp0pXOxFQ/1ftD8uNqHEAPdTVHoqFzu3hPJbFFZw8a6JE9jnRqThva7Z8MI9/hLkJNw77HQxh2t9P2gu/j84+GDfsU29U/9R3N+HpdS/eV4vHmRFD3BI50DNpkP7JTLyV6MC9EaBxYMPBtg7EEGOT5J+ZP5iRiJh9D8T4ZQGi6sU5oZ1+PSREWLY9SfJyZ3YnGx9ruAivIKvs4BZ0I2yoeUWSfOZJR5q2auKjcOLA6OnHe8FelnFnRhQEt/KIyM52sFFsK7zlwS49Ef1c/4P11/7ku
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:33:07.0266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d194dd-7b9e-4d5f-281c-08df3668ce0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000056B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR08MB883815
X-purgate-ID: tlsNG-d25034/1793352789-5073FA5B-C96268DD/0/0
X-purgate-type: clean
X-purgate-size: 6879
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykyta,

> On 27 Oct 2026, at 14:31, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>=20
> Allow for removing devices from SMMUv3. arm_smmu_deassign_dev handles
> most of the work by disabling ATS and zeroing STEs. Additionally, unset
> the dt_device_is_protected flag and free no longer needed smmu_master.
> Free iommu_fwspec for PCI devices only, for DT devices it is handled by
> generic IOMMU layer.
>=20
> Rework dt_device_set_protected to accept a boolean parameter, update
> callsites.
>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

For SMMU side of things:

Asked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Tested on QEMU with SRIOV series[1] by repeatedly enabling/disabling
> VFs.
>=20
> [1]: https://patchew.org/Xen/cover.1772806036.git.mykyta._5Fpoturai@epam.=
com/
>=20
> V5->V6:
> * move deassign and disable_pasid into the PCI branch
> * set dev_iommu_priv to NULL for DT devices only
> * collect RB
>=20
> V4->V5:
> * drop dead domain lookup on the DT path
> * remove assert on  arm_smmu_deassign_dev error
> * drop redundant IS_ENABLED(CONFIG_HAS_PCI)
> * fix indentation
>=20
> V3->V4:
> * s/u8/uint8_t/
> * assert pcidevs_locked
> * assert deassignment is only reachable by PCI
> * fix build error with HAS_PCI=3Dn
>=20
> V2->V3:
> * free fwspec for pci devices
> * remove testing note from commit message
>=20
> V1->V2:
> * check for phantom functions
> * simplify pci/dt device split
> * improve error handling
> * don't try to free master for unprotected devices
> * rework dt_device_set_protected
> ---
> xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
> xen/drivers/passthrough/arm/smmu-v3.c    | 60 +++++++++++++++++++++++-
> xen/drivers/passthrough/arm/smmu.c       |  4 +-
> xen/include/xen/device_tree.h            |  5 +-
> 4 files changed, 65 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index fa9ab9cb13..0648f9b407 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1367,7 +1367,7 @@ static int ipmmu_add_device(u8 devfn, struct device=
 *dev)
>         }
>=20
>         /* Let Xen know that the master device is protected by an IOMMU. =
*/
> -        dt_device_set_protected(dev_to_dt(dev));
> +        dt_device_set_protected(dev_to_dt(dev), true);
>     }
> #ifdef CONFIG_HAS_PCI
>     if ( dev_is_pci(dev) )
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index bf153227db..232df2421c 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1493,6 +1493,63 @@ static int arm_smmu_assign_dev(struct domain *d, u=
8 devfn, struct device *dev,
> static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
> 				 struct device *dev);
>=20
> +static int arm_smmu_remove_device(uint8_t devfn, struct device *dev)
> +{
> +	struct arm_smmu_master *master;
> +	struct iommu_fwspec *fwspec;
> +
> +	fwspec =3D dev_iommu_fwspec_get(dev);
> +	if ( !fwspec )
> +		return -ENODEV;
> +
> +	master =3D dev_iommu_priv_get(dev);
> +	if ( !master )
> +		return -ENODEV;
> +
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev =3D dev_to_pci(dev);
> +
> +		/* Ignore calls for phantom functions */
> +		if ( devfn !=3D pdev->devfn )
> +			return 0;
> +
> +		ASSERT(pcidevs_locked());
> +
> +		if ( arm_smmu_deassign_dev(pdev->domain, devfn, dev) )
> +			dev_err(dev, "Removing anyway\n");
> +
> +		arm_smmu_disable_pasid(master);
> +	}
> +	else
> +#endif
> +	{
> +		if ( !dt_device_is_protected(dev_to_dt(dev)) )
> +		{
> +			dev_err(dev, "Not added to SMMUv3\n");
> +			return -ENODEV;
> +		}
> +
> +		dt_device_set_protected(dev_to_dt(dev), false);
> +		dev_iommu_priv_set(dev, NULL);
> +	}
> +
> +	dev_info(dev, "Removed master device (SMMUv3 %s StreamIds %u)\n",
> +		 dev_name(fwspec->iommu_dev), fwspec->num_ids);
> +
> +	xfree(master);
> +
> +	/*
> +	 * For DT devices the fwspec is freed by iommu subsystem, but for PCI
> +	 * devices we need to free it here
> +	 */
> +	if ( dev_is_pci(dev) )
> +		iommu_fwspec_free(dev);
> +
> +	return 0;
> +}
> +
> static int arm_smmu_add_device(u8 devfn, struct device *dev)
> {
> 	int i, ret;
> @@ -1571,7 +1628,7 @@ static int arm_smmu_add_device(u8 devfn, struct dev=
ice *dev)
> 		}
>=20
> 		/* Let Xen know that the master device is protected by an IOMMU. */
> -		dt_device_set_protected(dev_to_dt(dev));
> +		dt_device_set_protected(dev_to_dt(dev), true);
> 	}
>=20
> 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
> @@ -2867,6 +2924,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
> 	.unmap_page		=3D arm_iommu_unmap_page,
> 	.dt_xlate		=3D arm_smmu_dt_xlate,
> 	.add_device		=3D arm_smmu_add_device,
> +	.remove_device		=3D arm_smmu_remove_device,
> };
>=20
> static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index d63c901551..4d2f71f152 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -825,7 +825,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_s=
mmu_device *smmu,
> 	if ( !dev_is_pci(dev) )
> 	{
> 		/* Xen: Let Xen know that the device is protected by an SMMU */
> -		dt_device_set_protected(dev_node);
> +		dt_device_set_protected(dev_node, true);
> 	}
>=20
> 	for (i =3D 0; i < fwspec->num_ids; ++i) {
> @@ -862,7 +862,7 @@ static int arm_smmu_dt_remove_device_legacy(struct ar=
m_smmu_device *smmu,
>=20
> 	if ( !dev_is_pci(dev) )
> 		/* Protected by dt_host_lock and dtdevs_lock as caller holds these lock=
s. */
> -		dev_node->is_protected =3D false;
> +		dt_device_set_protected(dev_node, false);
>=20
> 	kfree(master);
> 	return 0;
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index 06d7643622..76ae1e674a 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -300,9 +300,10 @@ static inline domid_t dt_device_used_by(const struct=
 dt_device_node *device)
>     return device->used_by;
> }
>=20
> -static inline void dt_device_set_protected(struct dt_device_node *device=
)
> +static inline void dt_device_set_protected(struct dt_device_node *device=
,
> +                                           bool protected)
> {
> -    device->is_protected =3D true;
> +    device->is_protected =3D protected;
> }
>=20
> static inline bool dt_device_is_protected(const struct dt_device_node *de=
vice)
> --=20
> 2.55.0


