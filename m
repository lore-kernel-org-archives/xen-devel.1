Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB7C606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=C0LvN0f6
Received: from list by lists.xenproject.org with outflank-mailman.1455152.1668712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5RQ-00064T-D7; Tue, 20 Oct 2026 08:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455152.1668712; Tue, 20 Oct 2026 08:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5RQ-00062D-4l; Tue, 20 Oct 2026 08:43:28 +0000
Received: by outflank-mailman (input) for mailman id 1455152;
 Tue, 20 Oct 2026 08:43:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xJ5RO-0005Xf-85
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 08:43:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ5RN-00EVzr-Kx
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 10:43:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ad729ac-e002-0a2a0a5209dd-0a2a4503caa8-18
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:43:25 +0200
Received: from [52.101.84.117]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ad729ab-fae8-0a2a45030019-3465547526e8-6
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:43:25 +0200
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by AS8PR03MB8395.eurprd03.prod.outlook.com
 (2603:10a6:20b:527::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:43:22 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 08:43:22 +0000
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
 b=wl9/kYlMAQYUbhvSWtuAc899cPlI0iN4Rs/REI6UZ4cr8pgzY+JtlKqBc16+cjyZBW2W3NzkrBHuphzN6UXl2j1D653RypnU43cA8qnGHM+3vowazwuwkRslxXPKwH0OF3gu7O4+FaFHROLc7ueGnENqmY09wqxxpLj04tscs+evg/8pF+Aq9hC0z1lKx5RFK5IINhTH8K4sLjLicpe9ldstY9dLSvPdN4Kb4kH7XL5aytwI+OJxiekAtfupWYAe3WANYu7n2lhx5LyLRsvW4l+VBY06rbwRsmdparP83tAjV2179muuKX8FP76dx3KHlSkfuD8FQzU34eZ2uURDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DYIXbzLMR33EgXn2802OVqeBnV2sN4/5SZ9JohGO9E=;
 b=orHoBcT4W0S6snqnRv+IfaspqSmB15Ls0MhaFjr7r/JAhq99DsqUqAIbXzUshUmqsDFSkhyorxZXYLD1RYU9hK/Lw/OnGWrAANAjVG2TZhxSo0lvhgVrwOj4ta/IBff/0psqdBS1sWhJDuP7+J30aIWJwbNG8JW/ZNxXTpjrQ5hoOW9hxn0VYx8kV/G6j1kv9WhRKLXZ7QGfzZjSGN+Aq3ZqYXKXZhUbBGkAmWTp0sQj1O4o9UJlxvFL0EwTPW8yPMrMFG5dpaUYBpO+Rx/XQjnJmRqg3Z88IGekkSwDg56fYTZwb1okEVe/2wJcIMbveEcj9PLRMwN+r5CfO60epg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DYIXbzLMR33EgXn2802OVqeBnV2sN4/5SZ9JohGO9E=;
 b=C0LvN0f6E9GcNiukJe14i5nHMdWiWqrbHEkbKGiWxQ7fLDQhF8F/fRse1UsahAIExtaxV/nsCE2O3nKUY/2eoDjczgUAdR98vcxOFe8JLshgESmOSBIKaH2gH0p5d9hoSh445S9229CdqxKRPSrA8UwA3dRZmOWZuFCU3OnFq6vjyDS5cAeBZcqJhk8ljWacV1WJjzSG8PATHQAfSmB2f8Hp1tgZ7m40T1f3yoDtC1K0mzHrPOpbR6zX3flWwPkDWnOTmdwDn+sRpkoI/2Dlto/NBt1diAeF2gQcb5f+z1oyMYWKscnFWMPIFVMrBtKLLRGADpVwXLNG/fEICeyQ2g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v14 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Topic: [PATCH v14 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Index: AQHdYG8PVPoz1quH8USwCU7AQlcM3Q==
Date: Tue, 20 Oct 2026 08:43:21 +0000
Message-ID:
 <4f863f8c656a41dec40274cd5cb504896a060880.1792485704.git.oleksii_moisieiev@epam.com>
References: <cover.1792485704.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1792485704.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR03MB11113:EE_|AS8PR03MB8395:EE_
x-ms-office365-filtering-correlation-id: 3fcda0df-43c1-4cf8-56c6-08df2e863304
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|7416014|6133799003|18002099003|22082099003|38070700021|11063799006|10067099003|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 v9c6j76NzP1FZTOMEj8VITSJhM+3TH5VOG1C7gDm4hnJGFQRC/qZ+11Q0X2RDWEhEvT75xkrd11H2CCCMmT6zENo9dLF2ndQyrHHsf/jnb5g8J0o+P6AUXW0t8AEXzNCX3CuEzm/L2Xxx2HEoM6SL8BAubeoiig6jbyzTqI8C++F+dXRvK85mOhE/NGcnLFwx7uNw+gNFDTl9Md3ByOh6uap+6Bz7nl/M2yb6RxaY6idhfQJpMyG+al34vw1d7qTvKdBhHDY1dslYsZ/12GH8EZ9pWGMwf4u3rplGipNurq2VPdVTUiB3gXFYmgsflGjJJDGP7gTtpsmI9V0jEsC8zdHhbMK/d6HypXarQGHAfta6NqkGKqBmWheUazk20UHcJXz6zaxdLHbmVqhKXpd0+6rYixzJ5P2W6BgGfxuP4BhYuyH31hvBRgeQtpcicFFv+/LjFhGH34ZKxeZv19resrXej2Lj0jkV7LJogGgD/Vvkjj1EnKPYf46WUXYvLd045stcvWU7dAntT4+1TSk7dyfDqy/AezQB1aKBYhG/17YOqIacF/HUM0ipgpsAuBxohQeRh9fQK/nYi53sVLUsrBgqUhZfYvGVtedjWABpc5NLF3NL/zmL6NSuC5w8LnOmXOZ62XBaBAOW509J7Ggez+Ckh9UMRJi9hIOGntCT+flS6q2viE3ginH6s5t3B9RJkd012Ua9BUIbkk3YQAtRlcRp/tP3of0FJhE/9T7s98=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(7416014)(6133799003)(18002099003)(22082099003)(38070700021)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vzq2327vxp71ZctARHZ5QeGzCJsWlUkBjz0uvK8ufw3xSXe5pK4jIBmdS3?=
 =?iso-8859-1?Q?ypx28L8eJY5gpSyYkcAXImqovDe448IGEdZfY286xtX4IYHUMNcAShc6yC?=
 =?iso-8859-1?Q?XgG2IsbcRJ/w86BdnOvD89kn+cSHr6/34yBJpEOJlvAJmxx1dmJYhDtW/k?=
 =?iso-8859-1?Q?ZcrU3y+uHVtLPm1rPezvOba3mjPiyBBtMnMHpYup8WSLiHOA5uqlhPwixF?=
 =?iso-8859-1?Q?A+mwuwYelfxwWTQIajYcu+LsfZNY710kO3YnOuSmCyw1rJzq+AYp/6YkLj?=
 =?iso-8859-1?Q?bQz/uF/rxXCPCS264qKpzI5CwgdPHwlT1r4UDVp++IjR5liv/Br1iAue6o?=
 =?iso-8859-1?Q?1uZLU9Sx+NJ4bV3x5wA78G+e3YoOwR3oiyIccRLp8bWmNhJ5oLzQUVDD3e?=
 =?iso-8859-1?Q?TgH+XKFPgHKg1YmQgDPlu6JIrHQoftT0fzJNho8qobYQEjNmCoF5m1Qbz0?=
 =?iso-8859-1?Q?q5zz6LBhCql6aKV6Km50FByJfgE/qjo2hrZ4xzkhNSGyVjAIzjY2Ab+Jsc?=
 =?iso-8859-1?Q?WucE1Q+UXSwHqrdq55s6wAZob0gBwdX9uXQyOV/0lmsjIhcTJc7YtLOthK?=
 =?iso-8859-1?Q?whddJZAF+rAATRn31eCesGnxJyT00IHOwzl+NzbU4c5iRCf7VueuSn0RtV?=
 =?iso-8859-1?Q?3xNAlZ4aThAExdTHqdl0fnBBFOTkPTNCz2nc0ueV9XZqh6/Il2tl9j16O4?=
 =?iso-8859-1?Q?fIfRUJuu50okzxex3Xj7TzniM8eundNgh/O66d+2xBb/byamYgCtEM/lFc?=
 =?iso-8859-1?Q?9V4uZJHO+Fkwyo4toTkrcI4VXUZu0KHl/wIcTGoZ9B1xoKaPG3ACzCmQXo?=
 =?iso-8859-1?Q?pF0d3y6PMf7TQQA1J0Q2yt5qkdmE9SurrStgDaZTwIz/bM9zREmSLh/U8N?=
 =?iso-8859-1?Q?uWQi5AbBNrebRqm4QLWAs5eDoZ4IM68u0t+/T1bYiqXgwcwZkSMboPJ9GE?=
 =?iso-8859-1?Q?RkpmePh/pmU2Hy4CW/dhD3VcEPJJnwOju2Ym0jrN3+f9GBuP1x3NblGaLc?=
 =?iso-8859-1?Q?3ls9W4AtHeXRxnFcQJrOajLKj6Si5sUEhv0gVXKZqq+mliWeLxpf46CJnQ?=
 =?iso-8859-1?Q?qDMJK5jp75GpUq8tx3L5myY7YPfMhLcUls+SSRyG+5HkDI+wELvC3LHsvs?=
 =?iso-8859-1?Q?cTFhoooel5Oa7jQfkhkQcTyxcPBmhEAPjOeEX/WXp8SHH8MDdEK6BK1unI?=
 =?iso-8859-1?Q?R5tmgw24Lz8Oo+Degp0v/JUh7itQfkckI/z0BqppRuKMMLAlzz6PqeswNM?=
 =?iso-8859-1?Q?EkZgtSOALrOhFxEoFETvpOLGPX0Y2AlW0BHwK1sO5d3LB5ey8bIcsemqqL?=
 =?iso-8859-1?Q?2jFsB1dJZb0AdHyXACI8b1ISh6gM4C2UiqbfncpYkZyX5nrg6P3c+c85Zl?=
 =?iso-8859-1?Q?3BordwNUL6UZXPYsIr2dIc+Sha+tyzbZpkMPD4UsYkY6CiISp28PfM3O4R?=
 =?iso-8859-1?Q?hwt+TtiaVghbnkYH+NrSrFp4Q6D1XMTkQUl2MoCLz/57tFGIEgUbh7bqfN?=
 =?iso-8859-1?Q?bCHSTDdtwi+qN1FmM+OSNFeJ12P1CVrLMPAmiX5e+oodiMBITPbQH7x+AD?=
 =?iso-8859-1?Q?l4O3pg2InHAzgbY7SYd9DSQ74o1IUayHTKEHCXgQFcjgQvl61bbgW0k5vS?=
 =?iso-8859-1?Q?9hCkLg65xi+Y7/nuHLLRx5+eD8HtpYPLufmoR6EnFZnSutKP6MmKwwO7x7?=
 =?iso-8859-1?Q?+JgxW5m1L2yhlSSC+sYBmXUufZvAiS/BvhrtqJyOeRJvbqNySgNRWVoZqM?=
 =?iso-8859-1?Q?vk/Eo0LWJ4zHvERA+sSCNJMvulwNefyzBMHiEC2MxtuRDpfih4h8ImckxK?=
 =?iso-8859-1?Q?Gy02w/oygPbeCVUiPyGr2/gWmIyVQV8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcda0df-43c1-4cf8-56c6-08df2e863304
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 08:43:21.3450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Um8Wh+DaPWfC0OtzGjVT2gTmaoLQD+3gPTRv4HEdh47KsrrmX6lQZWwODehPtDmeUt0JjUqBPpkn6XqlyH6S4P9KZt6Ac7anF8G4+Ot3mAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8395
X-purgate-ID: tlsNG-33051d/1792485805-6ECCB4E9-32C2ED15/0/0
X-purgate-type: clean
X-purgate-size: 7327
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Plumb the SCMI SMC multi-agent type through the toolstack:

- Extend libxl_arm_sci_type enumeration with scmi_smc_multiagent (value 2)
- Add agent_id field to libxl_arm_sci structure for per-domain agent assign=
ment
- Update libxl_arm.c to translate libxl config to XEN_DOMCTL_CONFIG_ARM_SCI=
_SCMI_SMC_MA
  and pass agent_id to the hypervisor via xen_domctl_createdomain
- Add xl.cfg parsing for arm_sci=3D"type=3Dscmi_smc_multiagent,agent_id=3DN=
"
- Document the new xl.cfg options in xl.cfg.5.pod.in

This completes the userspace side of multi-agent SCMI, allowing xl create
and dom0less configurations to assign unique agent_id values to domains.

Series-changes 12:
- reject agent_id in xl.cfg when the ARM_SCI type is not
  scmi_smc_multiagent, instead of parsing it and discarding it
- perform the check after the option loop, as type and agent_id may be
  given in either order

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

(no changes since v11)

Changes in v11:
- Fix agent_id documentation: clarify it applies to SCMI SMC
multi-agent support only, not plain SCMI SMC (reviewer feedback)
- Remove "non-zero" from agent_id description to match accepted
range [0..254]
- Remove "UINT8_MAX (255) is treated as invalid" from user
documentation as unnecessary implementation detail
- Add LIBXL_HAVE_SCMI_SMC_MULTIAGENT feature macro in libxl.h to
advertise the new scmi_smc_multiagent type and agent_id field
- Add agent_id validation in
libxl__arch_domain_build_info_setdefault() to reject invalid values at
the libxl level, not only in xl

Changes in v10:
- Split hypervisor and toolstack changes into separate commits

 docs/man/xl.cfg.5.pod.in         | 13 +++++++++++++
 tools/include/libxl.h            |  8 ++++++++
 tools/libs/light/libxl_arm.c     | 13 +++++++++++++
 tools/libs/light/libxl_types.idl |  4 +++-
 tools/xl/xl_parse.c              | 27 +++++++++++++++++++++++++++
 5 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b19c25c8d1..9d38ac0f7e 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3184,8 +3184,21 @@ single SCMI OSPM agent support.
 Should be used together with B<scmi-smc-passthrough> Xen command line
 option.
=20
+=3Ditem B<scmi_smc_multiagent>
+
+Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI ov=
er
+SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmwar=
e-A)
+with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
+specified for the guest.
+
 =3Dback
=20
+=3Ditem B<agent_id=3DNUMBER>
+
+Specifies an ARM SCI agent id for the guest. This option is mandatory
+if the SCMI SMC multi-agent support is enabled for the guest. The agent id=
s of
+domains existing on a single host must be unique and in the range [0..254]=
.
+
 =3Dback
=20
 =3Dback
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d294fb36bd..be25f23288 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -326,6 +326,14 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
=20
+/*
+ * LIBXL_HAVE_SCMI_SMC_MULTIAGENT indicates that the
+ * LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT value is available in the
+ * libxl_arm_sci_type enumeration and the agent_id field is available
+ * in the libxl_arm_sci structure.
+ */
+#define LIBXL_HAVE_SCMI_SMC_MULTIAGENT 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index aa8fa852fc..f92922abea 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -237,6 +237,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
         config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
         break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_M=
A;
+        config->arch.arm_sci_agent_id =3D d_config->b_info.arch_arm.arm_sc=
i.agent_id;
+        break;
     default:
         LOG(ERROR, "Unknown ARM_SCI type %d",
             d_config->b_info.arch_arm.arm_sci.type);
@@ -1897,6 +1901,15 @@ int libxl__arch_domain_build_info_setdefault(libxl__=
gc *gc,
         }
     }
=20
+    /* Sanitise ARM SCI agent_id parameter */
+    if (b_info->arch_arm.arm_sci.type =3D=3D LIBXL_ARM_SCI_TYPE_SCMI_SMC_M=
ULTIAGENT &&
+        b_info->arch_arm.arm_sci.agent_id >=3D UINT8_MAX) {
+        LOG(ERROR,
+            "Invalid ARM SCI agent_id: %u. Valid range is [0..254]",
+            b_info->arch_arm.arm_sci.agent_id);
+        return ERROR_FAIL;
+    }
+
     if (b_info->type !=3D LIBXL_DOMAIN_TYPE_PV)
         return 0;
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index d819955108..9b38c8f6de 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -555,11 +555,13 @@ libxl_sve_type =3D Enumeration("sve_type", [
=20
 libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
     (0, "none"),
-    (1, "scmi_smc")
+    (1, "scmi_smc"),
+    (2, "scmi_smc_multiagent")
     ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
=20
 libxl_arm_sci =3D Struct("arm_sci", [
     ("type", libxl_arm_sci_type),
+    ("agent_id", uint8)
     ])
=20
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 01783731b5..6bb3325c98 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1290,6 +1290,7 @@ static int parse_arm_sci_config(XLU_Config *cfg, libx=
l_arm_sci *arm_sci,
                                 const char *str)
 {
     int ret =3D 0;
+    int agent_id_set =3D 0;
     char *buf2, *ptr;
     char *oparg;
=20
@@ -1308,9 +1309,35 @@ static int parse_arm_sci_config(XLU_Config *cfg, lib=
xl_arm_sci *arm_sci,
             }
         }
=20
+        if (MATCH_OPTION("agent_id", ptr, oparg)) {
+            unsigned long val =3D parse_ulong(oparg);
+
+            if ( val >=3D UINT8_MAX ) {
+                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%l=
u). Valid range [0..254]\n",
+                        val);
+                ret =3D ERROR_INVAL;
+                goto out;
+            }
+            arm_sci->agent_id =3D val;
+            agent_id_set =3D 1;
+        }
+
         ptr =3D strtok(NULL, ",");
     }
=20
+    /*
+     * agent_id only means something to the multi-agent driver, and
+     * libxl__arch_domain_prepare_config() only reads it for that type.
+     * Reject it elsewhere instead of silently dropping it. The check is d=
one
+     * after the loop because the options may be given in any order.
+     */
+    if (agent_id_set &&
+        arm_sci->type !=3D LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT) {
+        fprintf(stderr,
+                "ARM_SCI agent_id is only supported with type=3Dscmi_smc_m=
ultiagent\n");
+        ret =3D ERROR_INVAL;
+    }
+
 out:
     free(buf2);
     return ret;
--=20
2.43.0

