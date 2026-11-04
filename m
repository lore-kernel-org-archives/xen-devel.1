Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B50B606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 04:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=LYv7kAui
Received: from list by lists.xenproject.org with outflank-mailman.1471295.1679787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOSbx-00089Q-Gu; Wed, 04 Nov 2026 04:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471295.1679787; Wed, 04 Nov 2026 04:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOSbx-00089J-CU; Wed, 04 Nov 2026 04:28:33 +0000
Received: by outflank-mailman (input) for mailman id 1471295;
 Wed, 04 Nov 2026 04:28:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xOSbw-00088t-B7
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 04:28:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOSbv-00Ac15-KP
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 05:28:31 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6aeab40f-2eae-0a2a0a5409dd-0a2a4503918c-38
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:28:31 +0100
Received: from [52.101.65.84]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6aeab46f-fae8-0a2a45030019-346541547770-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:28:31 +0100
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com (2603:10a6:20b:d4::24)
 by PA4PR03MB6768.eurprd03.prod.outlook.com (2603:10a6:102:ee::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 04:28:27 +0000
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416]) by AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 04:28:27 +0000
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
 b=AiAzqDAdW2PET4qxDC8UVaJ20nGqhbcMEoJa1FdZMncHE7BKHDDG11xW9saGSfADPYTeaKPYcmgudcPkuBWytXlAaJ83eNIdmQnYBRk6KHwq2ShgxTd9Lv3NpzmM8U+eomaI8PIfED3rbjr8PCCiw6x5fhJ/PhZEpN8c8VnItQFUFDznADqfd9uNZnqsG37OArQJ7dfwA83IwZqm6yL9vyE+s1xlS/biEokbYya0zai88KIggmLR/XIhdCrUI3uxLG4hrfPAfwEWfz2FSsTiz8KjZJBSFAodWh+UuYLwE0pK6EG1Gam4u72uXEFhGolK3MHGCyZAcSITExihfTFYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRht7ADK3OkGCrMq17SjVmzvxhfyy1n/dOFstz7OzA8=;
 b=oOfT7d3brUF2opfw7hulzZ/ofgCbS0S4FfiPfqMC5ehK+Y1CWNKcB2Ewvp7bX55rzlLu698t9z7u8VgrLT7EKJ+z7Z4jWQq3r45AfNoP54DBO23wxw50FYhqIQFhhwK6oLu6oxRhJilV2Ot9wqbqkW6/u6flKixRJz5RrgVjF3+3z8i0bcz12AzIeUe/gPHVOIs0no49g10aufihdUSzrUsm78TvwGLZzR1Topgoat9e1nLaHBXfMO2Zr/eSXciy4r878zoNxM+QAzP5cPn9KBbwWRJM0i7/hPM7te0BK6slmxBMv6pPc+gApCZ06y+5+NMlXt1nDeuwM1NFPb3+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRht7ADK3OkGCrMq17SjVmzvxhfyy1n/dOFstz7OzA8=;
 b=LYv7kAuissaDOJrPxNudQLfijMnr8jUEUsoUzQfY05MBCbAqDL7M9oeSeXPTdJCyf9bQWdQoT0xac5AOm+4VyK/u3vi33moq2BqchQeTxIDxcyEPtoMOw5BkEZXn6atdTPhFCni6ueLKpGx5uy6EUYmY9X6pSjHj7swHwsq+twENY7jaRZQB6vJhBIhm0Jjuy+RGOCZK5QcAKufwdQy1OPRTAqMwGfnM3eSCo0uyM9EUdhzqxLqDWiwikfXsyCk084aiAa+xDfXz8lJ+fsd80yaKnWaDh2tOdSyJ0qM4dOatoZKnHn7TEFS2cZuuqg8JO8DjpNj7KoMs369eEdcfLw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v15 6/6] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Topic: [PATCH v15 6/6] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHda6I58Jpp38R9BUi7o+T9Doedpg==
Date: Wed, 4 Nov 2026 04:28:27 +0000
Message-ID: <874idxmd91.fsf@epam.com>
References: <cover.1793717221.git.oleksii_moisieiev@epam.com>
	<04ebe91599a7861830afb248b1b7792af6dfe4d6.1793717221.git.oleksii_moisieiev@epam.com>
In-Reply-To:
 <04ebe91599a7861830afb248b1b7792af6dfe4d6.1793717221.git.oleksii_moisieiev@epam.com>
	(Oleksii Moisieiev's message of "Tue, 3 Nov 2026 14:47:14 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB6070:EE_|PA4PR03MB6768:EE_
x-ms-office365-filtering-correlation-id: 324cc903-4569-4a7e-345c-08df3a2c127f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|42112799006|38070700021|5023799004|11063799006|4143699003|56012099006|261021121427099003|261026140227099003|261021135927099003|261102123227099003|261009223027099003|261022075727099003|261028144727099003|261026121527099003|261022105027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 aDOXmCus6JOEFcwBVTn5pOXR8fzELsXosv4nQ4YHUlRlprz8S7ExprN4EuhljbAheEIbM9rFpFslznU0g2zS9qcDdrkkxKDar+f31LNwLI0yP2SLuiVCbURhflKxotJj3eRAjfuX2VQ1WhXACgbt9L6on1TT4yKWD21wpEM3ZtMw5bwxbBTCX3hyZK03x9cba9fNxHaHBncFfOSuLuIFuuWTXm+kYh1bt/a8l+g9CNSl5Wjch9Zdv1G3em6KT9zpy8hDP217DQ+xpaMfAONOkg9SgXQneNDdZMML1ThLzdrpkte2b51qdMSlBJ2uGu/3HTTF9tHqTZQ+8cnQxTE/V8IelRsQPUd6ouHnfICcSeozGZpuG8pqBMZwOJO8JJU9xKD60QR0FYH/dw1vW2g0DNGOQB3a0clbBsRMx5OdPCz2vOpsiea5998yXWsSlAx2ACzqezaRonx/npEGrbVBdZqIfgt9IFmjqZgmBu1i6VELwCcRPB9cYqkhH9Mow9/ppyrCwu53kqrTXARvyMqRYYxZ2fC+scZdOI+HFnaqNlzvYxgiVrgxVHStyBvGPcd9IXGgKKwB2VorA4c41FTz9xa72oshj+VYW7u8Imf/x0ZS7mebyL/yKfGC95/bWjCbZmGOFEC6PQDbcnWhhniIBtUsFy/QQgplJ0pdjtsdYq4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB6070.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(42112799006)(38070700021)(5023799004)(11063799006)(4143699003)(56012099006)(261021121427099003)(261026140227099003)(261021135927099003)(261102123227099003)(261009223027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tlZauyBwxsrZmu5PTVtQyh7WxubA3lDNCxu9RUtfB/Di38rDqSwqw0payr?=
 =?iso-8859-1?Q?amTEEsxxaiuKzMjg96sZdEvRMQ4C3g+OKSgxZ/rkPtTxJLZJYw13Oa/6EY?=
 =?iso-8859-1?Q?bwDKDGGKSBnsRdpYYa291O0KCOl1sH2Xj3aANZ6LNLeL/pVkIxXz7Fkx3B?=
 =?iso-8859-1?Q?wZ9LjQaNLQk06xE2/YurmnF/A8z6MUcB7OXoKt87nV59V1PZsAA7++KXGx?=
 =?iso-8859-1?Q?EvOTdzh1vAo1958zjGnKnVsYzAQRWZLly1iJWj9h7ur9ZSTj+VPa0J4rPv?=
 =?iso-8859-1?Q?o03MWq/XaBwrF6hnJX62+QPWxwoaH7ggu3yd1oRPSw9cmYjrg37up/K4+G?=
 =?iso-8859-1?Q?JxaGEBYM/Qtq554HNZaDES4vVYJyHufQht0cpjRXj4SZ3BcR79UuGV09MH?=
 =?iso-8859-1?Q?1yfr926GhaHvdd1WmsbFuiadDEHH4LI3qkXXJZ5KPutUbG7klXATnhwRMZ?=
 =?iso-8859-1?Q?DpOEHdHtZB0UU7TtTgbMetFFVGEEwSOtQWOQvjeAorBaKeLuir+ZJLnq1W?=
 =?iso-8859-1?Q?mowfqHZWV2Pu2QELio6gttcOT+7Zz09X42z1VwS+P4bS112vtWb1/BWIZk?=
 =?iso-8859-1?Q?qzxQb7ZIMZny0xcRl+0r5Noim2RXwy9B3u5v+80/TDvbmjTiv0NoN3FcaS?=
 =?iso-8859-1?Q?U/Jf5zdtkZnJmsCw94InOUlf668mMGPIW7xxoRADbBA0TXtoaFYtAynJzt?=
 =?iso-8859-1?Q?sePK3JJf8j6buNo/kV5gD9RzUhcReOzhc960fAU/GdSo5nz6BEhe5As5PL?=
 =?iso-8859-1?Q?zyRjRc1AyWbUBgGujG3ov66xVXEg7xO13m3D/y+yz14mriqhsjXNu47gqH?=
 =?iso-8859-1?Q?GEWAH6m5pCOGELnMv2Ey74DCTIDERzHcMRD/T05ziAfEH5HDrZXv2U4LMV?=
 =?iso-8859-1?Q?fmrh80U4JGNrQiyrmu/Y8+jhtnuV/ZIPlGIMDTbMwwb8Xc1IUaeWbzBIS+?=
 =?iso-8859-1?Q?npoHkIiv/WzgrareaKa7s5AkcLVJHNmP58kEvveKvrcMYK3kd76/FPkj0Y?=
 =?iso-8859-1?Q?fy3phSbhpAJ3qfWPyNZc/IayVMHnAIBwlP/wdlWE3T1TTMfdBbGFadGiD9?=
 =?iso-8859-1?Q?ZcCsgmoOs6bz2OBEnNwUE9XQBzlpisjfE+TzJ1iEC2ttfDSyNd5jeriGBW?=
 =?iso-8859-1?Q?oKzMi2YglePkAWRC18xW5Y7rzK2kLmtWjMV7JX5tf6YKp8kRtXMuBo84by?=
 =?iso-8859-1?Q?60MGmGzpA49jxZoBJNOO1tIgHN1WaVVRFFSAaObbmf9tc54/X1AqstxXju?=
 =?iso-8859-1?Q?S3uF7zqjeslm4Nu/2xu0wTM9bAba4OXgN1TCELJQgUaLz77U/WV9vwDfVn?=
 =?iso-8859-1?Q?0TWL4PIbC557xtD/kxq08nhl/NbGSC+P0bfx+qPofOSq3lwHPyhq6V5Nfy?=
 =?iso-8859-1?Q?GvZN71IM2Qxgr3lGlmLwLHP3olen3pIkYNNlVgit2w+/2mD7GO9Zk1yVeb?=
 =?iso-8859-1?Q?wLm0O0ps/ZhmcpuugW4op21PrAxhmis87NPyfrDfINHS/LlOBDUAyjmuPo?=
 =?iso-8859-1?Q?iHXyJtrgY/AOltGkI809UEXGz05/g7Xp5aV1DGXpsoBdba+i6vsp+cQ1KD?=
 =?iso-8859-1?Q?w0Tq7ta4tbRV/pU1Dgvbgj9bDvKngow4f08oBmg4BI7QuVCYAFe2yz9K/t?=
 =?iso-8859-1?Q?koezobyqVC/YDXPEOVTCbk0y5lO7rvuwBJo4YFkYZIJHEKHF1pcqR/EeFL?=
 =?iso-8859-1?Q?pVAzKlNlDESzSHI10USzW9FDqk/Q0Xx9G4Pf5hBJE3xbo4qxM61reRs5Pn?=
 =?iso-8859-1?Q?a81XtA0CZXt9hNSYdxgEIfxnUu0GBfxPAqzJGh97LziTJe9o/YFQ64orSt?=
 =?iso-8859-1?Q?Lp2S3SRoQsbdoP4V1RvGXyFR/axrJ6A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB6070.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324cc903-4569-4a7e-345c-08df3a2c127f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 04:28:27.2665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/10ShI5mO3zXF17sU9x0i6kOHHUZzUzbVoEbpD8zmkdW6E/5biHQUlAD3W6uTY6EDPdsTIqH3hYP1BfzKFJ7bLtFv37J9uxk5Em3nR3Vyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6768
X-purgate-ID: tlsNG-33051d/1793766511-764FC4E9-1AF56BD1/0/0
X-purgate-type: clean
X-purgate-size: 21730
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,


I'm sorry, I postponed documentation review till we finished with code
part. This was my mistake. I didn't expected that it require serious
proofreading. Anyway, I tried to highlight most glaring mistakes, but it
would be great if you proofread it by yourself once again.

Oleksii Moisieiev <Oleksii_Moisieiev@epam.com> writes:

> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Add SCI SCMI SMC multi-agent driver documentation.
> It includes a detailed description of the SCMI multi-agent driver.
> This document explains the driver's functionality, configuration,
> and the compilation process. The Xen SCMI multi-agent driver is
> designed to provide SCMI access to system resources from different
> domains.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>
> (no changes since v14)
>
> Changes in v14:
> - describe secondary agents as xen,scmi-agent nodes under agents
> - update host, discovery and dom0less examples for the child-node format
> - clarify shared-memory placement and platform RAM reservations
>
> Changes in v10:
> - rephrase section about /firmware/scmi. Mentioned that this node is
> taken from Host DT and copied unmodified.
> - fix xen,reg address for secondary domains for Dom0less configuration
>
> Changes in v8:
> - update documentation to match the last DT format
> - fixed RST: "... code-block:: dts" -> ".. code-block:: dts"
> - update documentation with dom0less configuration example
> - update documentation with new param xen,dom0-sci-agent-id
> instead of the command line parameter
>
> Changes in v7:
> - update documentation in section of the xen_scmi configuration which
> is matched by "xen,sci" compatible instead of the direct path.
>
> Changes in v6:
> - remove all HVC mentions from the multi-agent doc
> - update sci-agent-id parameter description in the documentation
> - add missing Sign-of
> - minor fixes across the document
>
> Changes in v5:
> - rework multi-agent driver to leave Host Device-tree unmodified
>
>  .../arm/firmware/arm-scmi.rst                 | 405 ++++++++++++++++++
>  1 file changed, 405 insertions(+)
>
> diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hyper=
visor-guide/arm/firmware/arm-scmi.rst
> index d9698f4e4b..25459d22dc 100644
> --- a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> +++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> @@ -36,6 +36,8 @@ The below sections describe SCMI support options availa=
ble for Xen.
>
>  | [1] `Arm SCMI
>  | <https://developer.arm.com/documentation/den0056/latest/>`_
>  | [2] `System Control and Management Interface (SCMI) bindings
>  | <https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml>`_
> +| [3] `Generic Domain Access Controllers bindings <https://web.git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/device=
tree/bindings/access-controllers/access-controllers.yaml>`_
> +
>
>  Simple SCMI over SMC calls forwarding driver (EL3)
>  ------------------------------------------------------
> @@ -189,3 +191,406 @@ except explicitly enabling SCMI with "arm_sci" xl.c=
fg option.
>      ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
>      ->        xen,force-assign-without-iommu;
>        };
> +
> +SCMI SMC multi-agent driver (EL3)
> +-------------------------------------
> +
> +The SCMI SMC multi-agent driver enables support for ARM EL3 Trusted Firm=
ware-A (TF-A) which
> +provides SCMI interface with multi-agent support, as shown below.
> +
> +::
> +
> +      +-----------------------------------------+
> +      |                                         |
> +      | EL3 TF-A SCMI                           |
> +      +-------+--+-------+--+-------+--+-------++
> +      |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
> +      +-----+-+  +---+---+  +--+----+  +---+---+
> +    smc-id1 |        |         |           |
> +    agent1  |        |         |           |
> +      +-----v--------+---------+-----------+----+
> +      |              |         |           |    |

Xen, I believe?

> +      |              |         |           |    |
> +      +--------------+---------+-----------+----+
> +             smc-id0 |  smc-id2|    smc-idX|
> +             agent0  |  agent2 |    agentX |
> +                     |         |           |
> +                +----v---+  +--v-----+  +--v-----+
> +                |        |  |        |  |        |
> +                | Dom0   |  | Dom1   |  | DomX   |
> +                |        |  |        |  |        |
> +                |        |  |        |  |        |
> +                +--------+  +--------+  +--------+
> +
> +The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared=
-memory transport
> +for every Agent in the system. The SCMI Agent transport channel defined =
by pair:
> +
> +- smc-id: SMC function id used for Doorbell
> +- shmem: shared memory for messages transfer, **Xen page aligned**.
> +  Shared memory is mapped with the following flags: MT_DEVICE_nGnRE and =
_PAGE_DEVICE, indicating that this

Do we have any line length limitation for .rst files? This one is 114
characters long.

> +  memory is mapped as device memory.
> +
> +The following SCMI Agents are expected to be defined by SCMI FW to enabl=
e SCMI multi-agent functionality
> +under Xen:
> +
> +- Xen management agent: trusted agents that accesses to the Base Protoco=
l commands to configure

"trusted agent", not "agents"

also, "that accesses the Base Protocol commands to configure..." or "that h=
as
access to the Base Protocol commands to configure..."

> +  agent specific permissions

"agent-specific"

> +- OSPM VM agents: non-trusted agent, one for each Guest domain which is =
 allowed direct HW access.

"non-trusted agents". Also, double space between "is" and "allowed"

> +  At least one OSPM VM agent has to be provided by FW if HW is handled o=
nly by Dom0 or Driver Domain.

"Hardware Domain", probably

> +
> +The EL3 SCMI FW is expected to implement following Base protocol message=
s:
> +
> +- BASE_DISCOVER_AGENT (required for Xen; required for secondary agents w=
ithout ``reg``)
> +- BASE_RESET_AGENT_CONFIGURATION (optional)

How Xen can guarantee that SCMI state is sane, if it can't reset agent
during domain destruction?

> +- BASE_SET_DEVICE_PERMISSIONS (optional)

If this is optional, does it mean that each agent will have access to
all devices in the system?

> +
> +The number of supported SCMI agents and their transport specifications a=
re SCMI FW implementation
> +specific.
> +
> +Compiling with multi-agent support
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +To build with the SCMI SMC multi-agent driver support, enable Kconfig op=
tion:
> +
> +::
> +
> +    CONFIG_SCMI_SMC_MA
> +
> +
> +Driver functionality
> +^^^^^^^^^^^^^^^^^^^^
> +
> +The SCI SCMI SMC multi-agent driver implements following functionality:
> +
> +- The driver is initialized from the Xen SCMI container ``xen_scmi_confi=
g``

Why "container"? It is called "node" in Device Tree lingo.

> +  under ``/chosen/xen`` (for example ``/chosen/xen/xen_scmi_config/scmi`=
`).
> +  Only one SCMI interface is supported. The SCMI configuration must live=
 under
> +  the Xen SCMI container ``xen,sci`` beneath ``/chosen``.
> +  The Xen SCMI mediator will bind only to the "arm,scmi-smc" node that i=
s a child of
> +  this "xen,sci" container; any other "arm,scmi-smc" nodes (for example =
under
> +  "/firmware") are ignored to avoid stealing the host's SCMI OSPM instan=
ce.
> +
> +.. code-block:: dts
> +
> +        scmi_shm_1: sram@47ff1000 {
> +            compatible =3D "arm,scmi-shmem";
> +            reg =3D <0x0 0x47ff1000 0x0 0x1000>;
> +        };
> +        scmi_xen: scmi {
> +          compatible =3D "arm,scmi-smc";
> +          arm,smc-id =3D <0x82000003>; /* Xen management agent */
> +          #address-cells =3D < 1>;
> +          #size-cells =3D < 0>;
> +          #access-controller-cells =3D < 1>;
> +          shmem =3D <&scmi_shm_1>; /* Xen management shared memory */
> +        };
> +
> +.. note::
> +   This layout keeps the Host DT unchanged for Dom0 and baremetal Linux =
by
> +   using func_id 0x82000002 / shmem 0x47ff0000 for Dom0, while Xen uses =
a
> +   separate privileged channel func_id 0x82000003 / shmem 0x47ff1000. EL=
3
> +   firmware enforces permissions per agent_id, so there is no conflict b=
etween
> +   Dom0 and Xen channels.
> +
> +- The driver reads secondary agents from an ``agents`` child of the

"child node"

> +  ``xen,sci`` container. This child has ``#address-cells =3D <1>`` and
> +  ``#size-cells =3D <0>``. Each enabled ``xen,scmi-agent`` child specifi=
es its
> +  doorbell in ``arm,smc-id`` and a single shared-memory phandle in ``shm=
em``.
> +  The optional single-cell ``reg`` property supplies the SCMI agent ID
> +  (0..254). IDs must be unique and distinct from Xen's management agent.
> +  At least one enabled secondary agent is required.
> +
> +  The shared-memory nodes remain under ``xen_scmi_config``; the host OSP=
M

I don't think that "remain" is a correct word here. Maybe "stay?". Or
reword it altogether: "The SCMI-specific ``shared-memory`` nodes should
be placed in ``xen_scmi_config`` node"

> +  shared-memory node and ``/firmware/scmi`` remain in the platform DT.
> +  A shared-memory node describes a channel location and does not reserve=
 RAM.
> +  If buffers occupy system RAM, the platform must reserve the entire
> +  firmware-owned range in ``/reserved-memory`` before Xen boots. A singl=
e
> +  reservation may cover multiple channels, including unused ones. SRAM
> +  outside system RAM does not require a RAM reservation. The channel nod=
es
> +  do not have to be moved into ``/reserved-memory``.
> +
> +.. code-block:: dts
> +
> +    / {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        scmi_shm_0: sram@47ff0000 {
> +            compatible =3D "arm,scmi-shmem";
> +            reg =3D <0x0 0x47ff0000 0x0 0x1000>;
> +        };
> +
> +        firmware {
> +            scmi: scmi {
> +                compatible =3D "arm,scmi-smc";
> +                arm,smc-id =3D <0x82000002>; /* Host OSPM agent smc-id *=
/
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                shmem =3D <&scmi_shm_0>; /* Host OSPM agent shmem */
> +            };
> +        };
> +
> +        chosen {
> +            #address-cells =3D <2>;
> +            #size-cells =3D <2>;
> +            ranges;
> +
> +            xen {
> +                #address-cells =3D <2>;
> +                #size-cells =3D <2>;
> +                ranges;
> +
> +                xen_scmi_config {
> +                    compatible =3D "xen,sci";
> +                    #address-cells =3D <2>;
> +                    #size-cells =3D <2>;
> +                    ranges;
> +                    xen,dom0-sci-agent-id =3D <0>;
> +
> +                    /* Xen management channel */
> +                    scmi_shm_1: sram@47ff1000 {
> +                        compatible =3D "arm,scmi-shmem";
> +                        reg =3D <0x0 0x47ff1000 0x0 0x1000>;
> +                    };
> +
> +                    scmi_shm_2: sram@47ff2000 {
> +                        compatible =3D "arm,scmi-shmem";
> +                        reg =3D <0x0 0x47ff2000 0x0 0x1000>;
> +                    };
> +
> +                    scmi_shm_3: sram@47ff3000 {
> +                        compatible =3D "arm,scmi-shmem";
> +                        reg =3D <0x0 0x47ff3000 0x0 0x1000>;
> +                    };
> +
> +                    scmi_xen: scmi {
> +                        compatible =3D "arm,scmi-smc";
> +                        arm,smc-id =3D <0x82000003>; /* Xen management s=
mc-id */
> +                        #address-cells =3D <1>;
> +                        #size-cells =3D <0>;
> +                        #access-controller-cells =3D <1>;
> +                        shmem =3D <&scmi_shm_1>; /* Xen management agent=
 shmem */
> +                    };
> +
> +                    agents {
> +                        #address-cells =3D <1>;
> +                        #size-cells =3D <0>;
> +
> +                        agent@0 {
> +                            compatible =3D "xen,scmi-agent";
> +                            reg =3D <0>;
> +                            arm,smc-id =3D <0x82000002>;
> +                            shmem =3D <&scmi_shm_0>;
> +                        };
> +
> +                        agent@2 {
> +                            compatible =3D "xen,scmi-agent";
> +                            reg =3D <2>;
> +                            arm,smc-id =3D <0x82000004>;
> +                            shmem =3D <&scmi_shm_2>;
> +                        };
> +
> +                        agent@3 {
> +                            compatible =3D "xen,scmi-agent";
> +                            reg =3D <3>;
> +                            arm,smc-id =3D <0x82000005>;
> +                            shmem =3D <&scmi_shm_3>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +The ``xen,sci`` subtree is omitted from Dom0's DT. The host OSPM channel=
 is
> +copied to Dom0 when SCMI is enabled for it. Xen uses its separate privil=
eged
> +management channel to configure the other agents.
> +
> +To discover a secondary agent ID through ``BASE_DISCOVER_AGENT``, omit
> +``reg`` and use a node name without a unit address. For example, replace
> +only ``agent@2`` above with:
> +
> +.. code-block:: dts
> +
> +    agent-domu {
> +        compatible =3D "xen,scmi-agent";
> +        arm,smc-id =3D <0x82000004>;
> +        shmem =3D <&scmi_shm_2>;
> +    };
> +
> +Providing ``reg`` skips mapping and probing that secondary channel durin=
g
> +initialization. A malformed ``reg`` is rejected. Xen always discovers it=
s
> +own management agent ID. Thus ``BASE_DISCOVER_AGENT`` is mandatory for t=
he
> +management channel and for secondary channels whose ``reg`` is omitted.
> +The former flat secondary-agent properties are replaced by these nodes.
> +
> +.. note::
> +
> +    Note that Xen is the only one entry in the system which need to know=
 about SCMI multi-agent support.
> +
> +- The driver implements the SCI subsystem interface required for configu=
ring and enabling SCMI
> +  functionality for Dom0/hwdom and Guest domains. To enable SCMI functio=
nality for guest domain

"for a guest domain"

> +  it has to be configured with unique supported SCMI Agent_id and use co=
rresponding SCMI SMC

sometimes you write "agent_id" and sometimes "Agent_id"...

> +  shared-memory transport ``[smc-id, shmem]`` defined for this SCMI Agen=
t_id.
> +
> +- Once Xen domain is configured it can communicate with EL3 SCMI FW:
> +
> +  - zero-copy, the guest domain puts/gets SCMI message in/from shmem;

"to/from shmem". Also, "zero-copy: ", maybe?

> +  - the guest triggers SMC exception with agent "smc-id" (doorbell);
> +  - the Xen driver catches exception, do checks and synchronously forwar=
ds it to EL3 FW.

not "do checks". "Perform checks", maybe?


> +
> +- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen man=
agement agent channel on
> +  domain destroy event. This allows to reset resources used by domain an=
d so implement use-case

s/so//

> +  like domain reboot.
> +
> +
> +Configure SCMI for Dom0

"How to configure..." or "Configuring..."

> +^^^^^^^^^^^^^^^^^^^^^^^
> +Set the Dom0 SCMI agent ID in the device tree using the Xen SCMI contain=
er under ``/chosen``.
> +Add ``xen,dom0-sci-agent-id`` to the ``xen,sci`` node. If the property i=
s absent, SCMI stays
> +disabled for Dom0 and the SCMI nodes are removed from Dom0 DT.
> +
> +.. code-block:: dts
> +
> +  chosen {
> +    xen {
> +      ranges;
> +      xen_scmi_config {
> +        compatible =3D "xen,sci";
> +        xen,dom0-sci-agent-id =3D <0>;  /* Dom0 agent ID */
> +        /* agents, shared memory and scmi_xen as shown above */
> +      };
> +    };
> +  };
> +
> +The Host DT ``/firmware/scmi`` node is copied to the Dom0 DT unmodified.=
 However, for Dom0 SCMI
> +configuration, Xen relies on the ``agents`` child and the ``xen,dom0-sci=
-agent-id``

"child node"

> +property from the ``xen,sci`` container under ``/chosen``. If the ``/fir=
mware/scmi`` node is
> +missing or disabled, or if ``xen,dom0-sci-agent-id`` is not provided, th=
e Dom0 SCMI agent will not
> +be configured.

> +
> +.. note::
> +
> +  The ``xen,dom0-sci-agent-id`` value must match the ``func_id`` and ``s=
hmem`` pairing provided by
> +  the EL3 firmware for Dom0 (for example in the ``/firmware/scmi`` node)=
.

Well, maybe better to use phandle then? Like

xen,dom0-sci-agent-id=3D<&agent@0>

> +
> +Configure SCMI for for guest domain with toolstack

"How to configure..." or "Configuring..."

> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +* In domain's xl.cfg file add **"arm_sci"** option as below
> +
> +::
> +
> +    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
> +
> +* In domain's xl.cfg file enable access to the "arm,scmi-shmem" which sh=
ould correspond
> +  assigned "agent_id" for the domain, for example:
> +
> +::
> +
> +    iomem =3D [
> +        "47ff2,1@22001",
> +    ]
> +
> +.. note:: It's up to the user to select guest IPA for mapping SCMI share=
d-memory.
> +
> +* Add SCMI nodes to the Driver domain partial device tree as in the belo=
w example.
> +  The "arm,smc-id" should correspond assigned agent_id for the domain:
> +
> +.. code::
> +
> +    passthrough {
> +       scmi_shm_0: sram@22001000 {
> +           compatible =3D "arm,scmi-shmem";
> +           reg =3D <0x0 0x22001000 0x0 0x1000>;
> +       };
> +
> +       firmware {
> +            compatible =3D "simple-bus";
> +                scmi: scmi {
> +                    compatible =3D "arm,scmi-smc";
> +                    arm,smc-id =3D <0x82000004>;  <--- smc-id for agent_=
id=3D2
> +                    shmem =3D <&scmi_shm_0>;
> +                    ...
> +                }
> +        }
> +    }
> +
> +**Device specific access control**
> +
> +The XEN SCMI SMC multi-agent driver performs "access-controller" provide=
r function in case
> +EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and=
 provides the
> +BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an age=
nts have access to.
> +The Host DT SCMI node should have "#access-controller-cells=3D<1>" prope=
rty and DT devices should
> +be bound to the SCMI node using Access Controllers bindings [3].
> +
> +For example:
> +
> +.. code-block:: dts
> +
> +    &i2c1 {
> +            access-controllers =3D <&scmi 0>;
> +    };
> +
> +Use domain's xl.cfg file **"dtdev"** property to assign SCMI devices fro=
m toolstack to the guest:
> +
> +::
> +
> +    dtdev =3D [
> +        "/soc/i2c@e6508000",
> +    ]
> +
> +.. note::
> +
> +    xl.cfg:"dtdev" need contain all nodes which are under SCMI managemen=
t (not only those which are

"need to contain"

> +    behind IOMMU) and passed-through to the guest domain.
> +
> +Configure SCMI for predefined domains (dom0less)

(the same as for previous section header)

> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +* add "xen,sci_type" and "xen,sci-agent-id" properties for required DomU=
 ("xen,domain") node
> +
> +::
> +
> +    xen,sci_type=3D"scmi_smc_multiagent"
> +    xen,sci-agent-id=3D2
> +
> +* add scmi nodes to the Driver domain partial device tree the same way a=
s above (toolstack case) and
> +  enable access to the "arm,scmi-shmem" according to the dom0less docume=
ntation. For example:
> +
> +.. code-block:: dts
> +
> +      scmi_shm_0: sram@22001000 {
> +            compatible =3D "arm,scmi-shmem";
> +            reg =3D <0x00 0x22001000 0x00 0x1000>;
> +    ->        xen,reg =3D <0x0 0x47ff2000 0x0 0x1000 0x0 0x22001000>;
> +    ->        xen,force-assign-without-iommu;
> +      };
> +
> +* For SCMI device access control configure pass-through devices in the g=
uest partial DT according to
> +  the dom0less documentation and ensure that devices SCMI management has=
 "xen,path" property set:
> +
> +Use the complete Xen SCMI configuration above. Remove
> +``xen,dom0-sci-agent-id`` if Dom0 does not use SCMI. The guest selects t=
he
> +secondary channel described by ``agent@2``:
> +
> +.. code-block:: dts
> +
> +    chosen {
> +        xen,domain@1 {
> +            compatible =3D "xen,domain";
> +            xen,sci_type =3D "scmi_smc_multiagent";
> +            xen,sci-agent-id =3D <2>;
> +            /* other domain properties here */
> +        };
> +    };
> +
> +.. code-block:: dts
> +
> +             i2c@e6508000 {
> +            ...
> +                     reg =3D <0x00 0xe6508000 0x00 0x1000>;
> +    ->        xen,path =3D "/soc/i2c@e6508000"
> +    ->        xen,reg =3D <0x0 0xe6508000 0x0 0x1000 0x0 0xe6508000>;
> +    ->        xen,force-assign-without-iommu;
> +        };

--
WBR, Volodymyr

