Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E4CC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:40:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429020.1651981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91fc-0006Bg-J3; Tue, 22 Sep 2026 14:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429020.1651981; Tue, 22 Sep 2026 14:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91fc-0006A7-En; Tue, 22 Sep 2026 14:40:32 +0000
Received: by outflank-mailman (input) for mailman id 1429020;
 Tue, 22 Sep 2026 14:40:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x91fa-0005Xk-T5
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:40:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91fa-00AHxl-9X
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:40:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ab2934d-bab6-0a2a0a5309dd-0a2a4506e4aa-36
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:40:30 +0200
Received: from [40.107.159.85]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ab2935b-195a-0a2a45060019-286b9f557f3a-8
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:40:29 +0200
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 (2603:10a6:800:33d::10) by GV2PR03MB11837.eurprd03.prod.outlook.com
 (2603:10a6:150:36e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 14:40:26 +0000
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04]) by VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:40:26 +0000
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
 b=HwO+e2UqOklDKYhOHy9UV61zRYHwQObPH2xxdSgi2kfJfNkimZCH9hG8AJFCboYiGFa+YgjgycPmC2+ldjDt/6khfOmDd9Wfrpvob95c+gDEB4Ntm26OujvDCRFsRIu5h+6jK3FLW7psl47/GgY6odB2+UwSyvTjLSWnKrb3AQ35jISVJ4mYA9GjU6iyP9D/m/yETn6hpEwKsWwN5LrJmZvrQxFq3O88iC4sQ2oK6yvD5+ZP0wElgr2N4H4ASm04Qkgj7YjKFVkjVbXey0UIvZ/EHo8gbUAy43T00m2n/+ACaVLguJvG/WYv7eM/7LyEHx2s/VKbObLiXFh9EZZmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEB1ygg7k6uOLA8RSrzyTOVwxUCmQNEb0WWQgAfiVjU=;
 b=hfgbueMYE+8xijYsrrEyYFjQ8asN/DVROhL41Ye1Bw+D/b90eVmCUnizJnbbqRnxO3pUUECycr7Z1WxOGHQVkjlrG3QoU3FFNl/XCUfcd7Q4JHnau6TPFlpZQQ/+3RFxDFlT+hd3fQRkwp0BlX7YXlIZkN8m9EqUnieYVcsDKhGV11LDLeui/E+AtttL/HaKjoMwS4rcADswpsAJU2uSPAP1XAfXO5/WV9KeOIN/GWvFYQ3vSWWJwGpRgto4ZGDO1a/UpqsQCo6iJMA2CYGMAI8uulUV07tg0nSkuB+Ot0gCjUnFdRWXtGKgJ2MyKPb7b+qawLMZGAcGLUyLalrFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEB1ygg7k6uOLA8RSrzyTOVwxUCmQNEb0WWQgAfiVjU=;
 b=ENk+GCvZhlxsJhSKOaxr+goAS9VeoOIvej4DvX2en7MRTsELfIRMoReCMK5sDyGZCfOL+rExHfmWkBn7Z7je98gLReV6E8cx4Fmk2Vz/LL0tce0lFgU6qMk6SGrcJRo/ZxCjTijdGftjIHYglyke8aMEGlbvf/1wiqSQGZSv12AXJaEd6UI60HMfOhIBiDJMFahXA7TkAZwU0Pa7lXbYag5RsFGGvNb17enKfrwmG9o3SiqcclH0Cgif2L28cpH2Xfg6oorI9fKQwuQWhp7Ve5tQ8oBVYoOY8e0ERuFGXNsZven12Zz1ibYrMW/Q1Dseb/MdWC0x7W6bSNFFwTRS4A==
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
Subject: [PATCH v13 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Topic: [PATCH v13 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Index: AQHdSqBOqljHv9ZNakqZnuriu076kA==
Date: Tue, 22 Sep 2026 14:40:25 +0000
Message-ID:
 <2e4d8d0624f831a8f4758cfe3ba681722d5dbd1b.1790087968.git.oleksii_moisieiev@epam.com>
References: <cover.1790087968.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1790087968.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR03MB11419:EE_|GV2PR03MB11837:EE_
x-ms-office365-filtering-correlation-id: 98da9db1-6bc8-436e-d312-08df18b77144
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|38070700021;
x-microsoft-antispam-message-info:
 Co+xjBdtMX82VLjqauwIFp/DwBi2lY7kuJhmeT3x+MaqMuYpyFKd3grjxFJWxJiDgSQFVsvWhLL+RpnOwNqT9EFKFSZDniSpy3GHvcsRYKZkFyjL8oDR9dNJ0UzL73dWs6ExIBHsYNeT0FLANc64ZRUIgj40Cz6xs/8j1jXanIKTa7igJO0zlTKdIMD50IdN1M6OF6zIk2gNoOZSmpGD6pViYdS2aElyNkeSI28JgVrk7wnr6m0XqbJpa0r4quZ14uP6clAzHg87NijnEvkNb8ON7TNJPBllPzCrx8YCwjF11vyYiJ2BbEF+nTbnR135hjyKrO358pOllDxv/Q5FFRq4pmda9uxUwnS6LUMw2F8sxC1a+CxuRsOP3AhrORRgefuhmSqbE8CObfiFZmibf49c7TQ3Z8aJvJ+8zSJEh1VbDFYg9bjXgiH/gUzrXFp9CJO/GkM/Hn5qSPXMC5b8U3w1GFzP5y6ssrhvcJFar2r3jkeXi8HazgLZ+vaNCmZ+iTM7cg6piaaURjWU5d4999qXMUppcFC0SCZhDjvOOQ3ZPM56PPxASOmXrX5GSMjJiZYBfnwKHGxyw50D3SnkXYOSehubLhdH6r20r1kHbWaaVW+ytfB1C709jIajMV49AdFfOCOS2ngTWZ5/JSzi8ndmgMaq3s0UlmJx/WC5QeqZjcRImZoSZ7MQKIP8bcxkQ2a7ptDrJXqF7IHXfBenlAEUomiq+Ik1VrjE0E0w0dQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB11419.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3GSpx8JRO/mr2j2qQMOv0+l35/iHU5wqspMTjBWdlSb5miSRrkanm9+kVy?=
 =?iso-8859-1?Q?ZenSrh+A77XEqFCdKR9iPYbO2O9I6N/RIY5dR8pWmbcaStD34ZvuX+UlrL?=
 =?iso-8859-1?Q?evMwV9cvZtXjrBYjotNA5JyPv4f0d5DCaMpi7a2EA/2RiF6q+qQJLjy8fI?=
 =?iso-8859-1?Q?3Cx5MoORRJlz0zUBOks04VLwPxKVLmBGGKMTjY8AEaWnLx25J90N6muVMV?=
 =?iso-8859-1?Q?DAQEmStIxEB9GReXEZxMThZlxutzf2914c2z85CcSnbsOjSNzck4AusaKw?=
 =?iso-8859-1?Q?QbF/FR9QSTptlziGXb4a63/qBlCuKfb7YMgQKFH8Ts4FKjknT22yPUS3tb?=
 =?iso-8859-1?Q?rM3T+fT0Y+3yvVhIRmK4ZVSeYDZewJvU4mgwDBR45yFILZbW6vNvrmB7Ln?=
 =?iso-8859-1?Q?U772dc+2kWay31HShfjZ/cusGK0mPBuFXnwgcQZbL17++gVMPwoThg2OrS?=
 =?iso-8859-1?Q?cRiAgO7XVyiB1nYh1aS8G6uRw+FdEXphaJrkr/oUf7sSBUERIfk7l8+hXq?=
 =?iso-8859-1?Q?A1O3U4dVgn93plReTg3SpW1uzWSxbg1dFUxN/7+nMcBuNtsg961xrUvJWN?=
 =?iso-8859-1?Q?/RSz3E0Xp7P1q1nONwY3jw4hKdIT3gnd1k5Ebj5Sj3E+1SCiPoKrlRlT8r?=
 =?iso-8859-1?Q?uzRBBP0HCqPIx9e6RznNa9XafkMQ30aLb5yzh7w4tDJi8uSQ0+8vXZB2wc?=
 =?iso-8859-1?Q?BdbDsou5JDMEjO03IevtE3CZuAUmbvqc3obexpoVE+qW/vZuSVpBhL9iQ7?=
 =?iso-8859-1?Q?UV3fDf7D/nHsbhiu9cWtsyPy4cEAP7ZYEtWznJPYJ/aacFg/nQdtids6b+?=
 =?iso-8859-1?Q?uxUwSlSnh96X6nLulYwJzw+gjWnQ+sV8JKHUYsWcOG7sKkU1oy2RBOkwGd?=
 =?iso-8859-1?Q?2IUcTQOQPoX6E5by878s01GFKJCE1gyh2NJM0/e5RhLgBc+WRP5K/0MEqs?=
 =?iso-8859-1?Q?7eUOw+FYOVzcDQk6J6Yfc++Y/fQHPuflt/wv5jqfqGhXjVC0oxfJwhjSji?=
 =?iso-8859-1?Q?zmxFBljT2gQP+fATXMl9AzyyfOg2KWEJi1Re6sCrqB5CG/lyKxLQWizkNC?=
 =?iso-8859-1?Q?nYDswzVSNkoQOdR20/t4faBSJJCvzw4vcaUR4LP4EjMow9MyHvefDWCIvB?=
 =?iso-8859-1?Q?qWMyojI5h94nUklXlkC1u0iZwiZ7UsM71wYGARPRW9aD7+4allkCCKieWV?=
 =?iso-8859-1?Q?6D3AQonaHDgh63bfOzlm7vF7qbz/kFuhFTAdyVbFO5Jqdnj4ZK46A/llw3?=
 =?iso-8859-1?Q?UZEh/Bxde1J+U8qKMq59wByWft5cGDrQJ/PLtltYr0jGsSS067Dj3gAYzh?=
 =?iso-8859-1?Q?sPLqeTYeCp4U5KqW4EfEh4my52rKjnLCI2ziul7Bo8M60L8UMVTmSZeszQ?=
 =?iso-8859-1?Q?ydeQDgIBKONSgUyRYt5euY3cR6R38hCd6I8PpqMnAzoszCVv3tP6LVLIq2?=
 =?iso-8859-1?Q?dKZsoouGRP3Og9AxDnMIbjYA6+PQcKkWETBwW4IQ1dkW0sUE7jIxamgAh8?=
 =?iso-8859-1?Q?/0CXGIHv8cJoncPt6TiNyqVuQzKqibi4f3XZA8/qQgagHd0+chMQS7fyg+?=
 =?iso-8859-1?Q?nBQt16bRBnO5x+v80zA50/6MgMd8R5bfyvvKgIiYynNQJAQUG4FRo4wv+t?=
 =?iso-8859-1?Q?GltOwO86m3fmCjBNfpfC3WfcO270+fAcgj7yv3Sdr05tbK1iL0WFDFi/Zr?=
 =?iso-8859-1?Q?whexckLuwLw1eFsTpd9AnbiEYFK+J+VICDhwuMvUiPWqASYI/PBhbG0Cwi?=
 =?iso-8859-1?Q?pGqUbDc7eaFYHGXOP5ZdtTNGSFA5KWKt66fLD1nZOCkkHiX/Pwo8Eox/eq?=
 =?iso-8859-1?Q?Sh+qgUKEIuIMGaq0og0dxftw+H7C+AA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB11419.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98da9db1-6bc8-436e-d312-08df18b77144
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 14:40:25.9546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FOQQxf6UxRInvtDlAsAq29PTlABCHMc60QRQQ7dZFZpwlcI7fMgf/ojVg3QlPRkuYk+k1MTUx6JI5GpQvt3xQpq0w9pJCJ9xyNuKV/yZ/U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11837
X-purgate-ID: tlsNG-16d1c6/1790088029-F540B77B-1F10B7D7/0/0
X-purgate-type: clean
X-purgate-size: 7327

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
index d34951edb9..1dec511f20 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3179,8 +3179,21 @@ single SCMI OSPM agent support.
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
index 7c098edab6..9f46566739 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -318,6 +318,14 @@
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
index e4407d6e3f..3adb90c286 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -240,6 +240,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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
@@ -1837,6 +1841,15 @@ int libxl__arch_domain_build_info_setdefault(libxl__=
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
index 3c35f873df..9830671ca4 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -554,11 +554,13 @@ libxl_sve_type =3D Enumeration("sve_type", [
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

