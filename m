Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B66606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=qQsbQvKk
Received: from list by lists.xenproject.org with outflank-mailman.1491037.1691981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxu1-0007Qb-Gd; Mon, 16 Nov 2026 14:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491037.1691981; Mon, 16 Nov 2026 14:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxu1-0007Q6-8W; Mon, 16 Nov 2026 14:41:49 +0000
Received: by outflank-mailman (input) for mailman id 1491037;
 Mon, 16 Nov 2026 14:41:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xSxtz-0006hm-9P
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:41:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSxty-00BMqu-Ki
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:41:46 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb161a-2eae-0a2a0a5409dd-0a2a4504af3c-48
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:41:46 +0100
Received: from [52.101.66.113]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb1627-b57f-0a2a45040019-346542718d39-8
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
 b=g8S9qF/4GD/VP5fQV5sOJQaCWqWqQ4vJaJpAKAXdtlyfGPllMvNe4tHPzxoTqZiCdGZzrW3IlQ2Ot/YHayTgyxkfXAh/hlHB6a7sO7BW0Pkv7Xkvtjc6jJtD3z2x7QCaQGUzeuL34NHVHCR38RivV6uVCO7Wj/f5nJ6wB+f6pmtW04wrDVwXAbK2kt1MNmnQFAOAwATvWVXYVhMjGXMgIbUE1uy3ovvtdY812x/aq5DiJYDzegvND/okshlzjg2GBbOUEI9C6bgzLvOlRfudY1Z3vaxz4J+paSKw8BwnBn+odpirc3T0abXVVvuqLyO2Jeqk0gP9zd47r31z7e432A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DYIXbzLMR33EgXn2802OVqeBnV2sN4/5SZ9JohGO9E=;
 b=IF6DmR+sGym4WNWg1Lgo/mqFuAk+dhNTSPeQzfROeqfL2/xPn82Ttb68vCUyxEg/m6abw/Vo0e8GlH868cqh+HOvoEp1Yjrmy7QONL2MGqkWvqOaAks/fbH/Y6Ss/q/z3Hjk6Vsmr3SIwSjwzgPxuWvssBgtjWm1Q/V3RoWKcpwLVdwNTEgKuVPZ2aUVi/ch3Puv3al+XyVJ5qAMPgd5kRXLtyf0cQRwXFGh/N0PsKGrGfjuhH4TZjrMfoF46fTU8r3gokM79M/Inc+SSJ3TVsRk0b0hH+Mftn7g5n2MjP3zO8ZtrCLSyZa3a5QFwDqu25+pYiJkJ+eLH8T4SDmK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DYIXbzLMR33EgXn2802OVqeBnV2sN4/5SZ9JohGO9E=;
 b=qQsbQvKkCeVb4AZDSI2WVDz8zRZGA4R2KiODMUHTZtKj0Sbkw6b5ZL2CCO+m34+fYybf53GXy17edWrWNPV/b0s0y1idyZ/hDcEqzo5hZOUl97P3MS1oC6HstuPECg83fafRInIla4b2n3uHvpYJYm6zkpQYBGg4umVxe1zhAMi7Mb69aK5LNnmySHmwwCj+cqI4KSLrz6CiEN8Dgf2nQGbahh1EIshI0DQYa0p9No5QUJZmgkkmMuITultnexisnKR2+RoMs08J8r1psg+bqKtib1U4qwcEsuh2rX5HfmX2cK6nhkzQ5hbgMmaxZN3WG9VC59J4uyzybKsV2KXIQQ==
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
Subject: [PATCH v16 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Topic: [PATCH v16 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Index: AQHdddiX8LH/GhthO0m5LuxgjklNCg==
Date: Mon, 16 Nov 2026 14:41:40 +0000
Message-ID:
 <4fedbb5bffdfe96365e530c985e89cd50b61fb5d.1794839953.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: 080acd82-5cce-491d-8fa0-08df43efba79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261102123227099003|38070700021|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|6133799003;
x-microsoft-antispam-message-info:
 5ZqCR2OgUgbVJNm0FneTzYPhKSGMCxukDPYJDppjv9S0egxeT5Qe6uYXkZXRnDYsbuZ1mcKFodAJoXTr8ZJwWInWYGDakdv8/B0FyKZuUKKWWD7ZDqXQRAw3oghLR9w4N2Xlja8h8YRZwgQ1crmH1W6KXQyNfnTIX2no4e4NcxOAD6ga+e8ktV3LBOIpgyxKxxigqMiGCGGxRO7SRkfhYj7eyltwrtA/wobKjJoHkQ2hhMMlG/X9DXTfH8Cl6O1rekuunbwmDd7t5oBz81F8jr/a+UQGAc7sDUP96NfVv6DW7pu/y9xz7vsmPribDWzdSUC7Mkhq7Sqq6Eias9dCtaqOkjb6VX4hFOJjmK8mfxFQBnchD/Qj73SZEANXKtzn40Qus2k4J3EOa4FJP0gDWiZH6A7D3im+e238mcMBrV2Xq9bxTaEl4iI6FvKP+2d5CVrhwYZkrSimwoV37BGO8Gj38aFKE1UmG1Fnv8Owe1L+jhatBcxqHYPWaDqMpeiLA+/Xo6tN9te44LQ6fzPuTq8vPlrfnxkiq3V7hVdackGTWRNK9u6g7Iey6FkiutGq7VtUgvfRZeSu0iYdpmCWbTNgcbFG/NkpZB/P+sWj7UG0F7Fp0qm7Lt1a47qMMhPgXMn42GsQ9vAsE/xlVO6Xb3LeRD29AkL/Oqy/aE5elXAAmycpIrOXpSpUZlNuPejU1in8MiD86fpokDN2UDHOdMz9FGH5IaAg0WlAYsfOyCM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261102123227099003)(38070700021)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rNZJLlW5pX6ex6KcIRfoiYEH9+9TguqtJglD5Lo7uxuCeC5FNjSlJ2JOW/?=
 =?iso-8859-1?Q?ziDdrZTuDXgqSBoU9xRkgd8mCw8vWxwycnoeRbwydHer7l7ignlLXiRjRR?=
 =?iso-8859-1?Q?AwlAjQ1wKi/uQpVHqf3nfgy5l0RzIVK+FppRF8C4PxwqiVnLOJ4b0QLxx9?=
 =?iso-8859-1?Q?kdTfvFWtpH+Myq/mxc13F44wmymOJeZRiM7M7Td2zWDIX4y30f565bfZt5?=
 =?iso-8859-1?Q?Ex8fnMNtVBh2WXT/PVFQi1I+EJe03ckZNbC9bWUy7JrOQL6F6lqCD0964a?=
 =?iso-8859-1?Q?sCXnrDl+XXGw4CCiDwPWudcnlj3fLseIcOtY66a3zKgQmEFu+TyEhSWwvx?=
 =?iso-8859-1?Q?0Lkkuao+eFpFzzkojHA92cKsXr/mgK4eHZuccly5lLqCd/Nue2TWfoTjGB?=
 =?iso-8859-1?Q?VXImFcpztv8qB6c23rWkJJD93Q0j8Veqc+Qq6f7IXRL8IXnmeMpcImg0SM?=
 =?iso-8859-1?Q?9gQbk4+JsSR0FgyUHaTTxGYvwlZXONRVaXnjy/tdNZsL7PpYESKCr/AHo2?=
 =?iso-8859-1?Q?Rl0+EreNgG70Pbx+0X3oGJxzmZbL4kP74kPCXJwrx6o22NFPY7YfXyU/xs?=
 =?iso-8859-1?Q?z0qaJOBu4+Iev9Zqp9jVHOW+nb2g0awFlY/O8ECU9Kefki3pVWHx4MIAUU?=
 =?iso-8859-1?Q?fBGoA66rB21dqTi6wiT/Q9XNuMk6kcxzSIB/dGDgYa8rr2QGrs2vA8e79r?=
 =?iso-8859-1?Q?IgcnFxNcCZujG60pgwYuIUhmqATC2t9eMQhaQBH0Gkf9E0kcLxjjx5ChQi?=
 =?iso-8859-1?Q?6mJi0Ry18RybOFpM4mZV7EkQOkR/S5KLv3sRqN/zJcUIPHJLmENcaIdR7g?=
 =?iso-8859-1?Q?I+kIqqhEWE0VRhaqRaDyqXNumOkGUFzpVknhhQ0g2wdjYv8VixwFGcBJy6?=
 =?iso-8859-1?Q?7Z2v8KutPGv7sqVx5XxB45WMFqwwcv4q2OHtJ3LP5fS5HPUJnwkZKBLMlO?=
 =?iso-8859-1?Q?PDOGEpxg3QSOzEw6vJXuh1lGF3ybWlXiNA1QIX80lORxEf1Z0TcVLMIjWR?=
 =?iso-8859-1?Q?8dV59PvrMgalD15IKZB3KSjqFHKZJKoJh/OCGyTlu2X7ALsAcwawms1Ifd?=
 =?iso-8859-1?Q?eFYft5rqxE6xBdwxyea6z+6A5EfyzrL9OHPe3R9ngQygBLdBWCngVy8KPu?=
 =?iso-8859-1?Q?nVGRfxhqhY+CjM1rD8/jZGNslrpQaaFtc2KzVMe1z7ITkQ/4ZuQd0C2qGT?=
 =?iso-8859-1?Q?rLh0tv0Fm8ppdxGqD4+HHNHXWX1FdAlv59pFmFrqI9ku85rFR7Ya1FTMiu?=
 =?iso-8859-1?Q?9mJvn/hm6DUTNZXkZUBMMSdc5lp36oO/nwKDutKH6BABhieUytyu5GpL+8?=
 =?iso-8859-1?Q?F6clcE05nsrqRlRvxNkNWvjliOz0eLU23Icr7XfLU3msbSenoOfYKR2PdF?=
 =?iso-8859-1?Q?jbJBWMKHpafDbKCU23z+WvYIK4XxWhJnslI2jQC75qwWJ8ZRLKMAG6NVEy?=
 =?iso-8859-1?Q?24AezCmZ9yCZHyq988x5sNHdPrh4oz8NdRfVEbIR6ESTLWv3Ay44I5CBFH?=
 =?iso-8859-1?Q?XnZ7L07Jgw2d+qJWWlk6HRSufH7MoCOt+E2O+1B7IsVZKwT8VIY8eXJhg6?=
 =?iso-8859-1?Q?fyVxLbqEKiA2B7F1f27qNYAu4bKglUD2dGQBsZstAjRaOWr1fwvAweSv1B?=
 =?iso-8859-1?Q?oWQVwNEHIG1xdneTtqkHyvpIkvj0dXMqSROokjCis36tfOkS2DDQQiZKlP?=
 =?iso-8859-1?Q?ogGsC1yVg1yKjvBHW6qT6EHZFq/3Rxm/45yiQokIVHaxaK8/bi7XBNx8Ts?=
 =?iso-8859-1?Q?5VOB1YEXxu3LzwRwwI4zyUlG/nipBFeKkxUVUTMU2tn2cCDGT2QMexLS9U?=
 =?iso-8859-1?Q?xIfQt1FubjGXHaQVOrkrykR+WAodNM4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080acd82-5cce-491d-8fa0-08df43efba79
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 14:41:40.0775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MYEJN5j6JZXzW/3RH/0xJsxgUwFkDLbTfOIIn7cr+klL52OromRNXyrs8EaAS3nvkdo34VzDbjNNomUnk3spjMgT5C9SDHR4M1rph2d1Heg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11211
X-purgate-ID: tlsNG-ebf023/1794840106-516D2B50-AAA39C5A/0/0
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

