Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2346DC88E53
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:26:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415789.1645043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4veW-0003yo-3J; Fri, 11 Sep 2026 07:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415789.1645043; Fri, 11 Sep 2026 07:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4veV-0003x8-TI; Fri, 11 Sep 2026 07:26:27 +0000
Received: by outflank-mailman (input) for mailman id 1415789;
 Fri, 11 Sep 2026 07:26:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x4veU-0003lV-LS
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:26:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4veU-002rD1-23
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:26:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3ad19-2eae-0a2a0a5409dd-0a2a450a8f38-36
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:26:26 +0200
Received: from [52.101.83.103]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3ad21-f2d2-0a2a450a0019-346553679a5e-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:26:25 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB8025.eurprd03.prod.outlook.com (2603:10a6:20b:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:26:21 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 07:26:21 +0000
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
 b=RgAKAFsTJVhjZbZwZjTyl3PbSXVjHNA6qMZmlnm7nono9+qa+0SPldVcFiqJhcsdthZnQQkC7WL3ak7y34zW4T6fQ1RATN4rToYj0CZNByxKOafVzuSYsm/Jsk5nVMAYQR96O85RcdzaechtdcxyqQBLLtCyRxEPLxj5o36NDw/SU1E/go4P0eQ8DCyacjPVPd3KQsRQUoV8gB35i0xxZ3FKW36sTz1VMKatB+oxKZLp3An6duNI3W1McJ5X2/GbN/4qCusJMVwiOuOJx3eQml8aIzC7KXIyWRFpfljBqGdJMOflo3e/efvgbeDPv6xygCCW2d5Tga5HWY/eiuJ+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEB1ygg7k6uOLA8RSrzyTOVwxUCmQNEb0WWQgAfiVjU=;
 b=bAR0og0XmIQSOTLriN0ORw6Dixk8Vq1nNlv32NdZcB0gEGj2WN6jZOtIWzkTJwSuJ69/LLvYnuaeU6h3K5q1oqWIz2SHj1eWl9l3Iq6jtTkb1naN3tYnUfzrvkjYDB/VKXTrqg/D2QWrCaj7WM/EetbXHFFpuffTNGNWB0fTOIDSkdB9rn+nHEiIiXiBp0uJ7U2iZSdrYJI0r5e+lqHjgjM8Tm5WPen+rNe5KEXVyJjGb7lssh0dfAYZ90hB6X24OSYGVcgeFem34AqGSxB2TnAEmxIvOs2hswUU1y6rYvVVZVZVr7oEqGRuObkP9zU8vlNmwvx9qGTGLzQ+gqVbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEB1ygg7k6uOLA8RSrzyTOVwxUCmQNEb0WWQgAfiVjU=;
 b=rh+NHbTK/mOMgY0KVg9tNtU4HUt08dS8AjnU2RbJNI3Cv3vUPR9Guhl7zL7eyDTSKqxOlCJY9SZj49NDsix+BUIcQy7MQDUmKmU7stjV/mL4/kcMu27aoFaClVMFLLTBmnH6g4PlW2H2/kHr+rsRARjLEuhAqkYVAYkr5XpuF78GA157hJ+tRQSF+XF/Tel26/ShvrDw6oXyBjYRZ70lTLSHGg3FRhQsXeRlznqrXTj2G5ZVqQDIPWNRcI39Y7aEKkOp/1oY9OC7yBB4qH9CiSrPYTaa2+a2JxFiMJ/KHLXdHXaaD34gBO/qt2PhZHItegH1377JXN56FHvEYUJBfw==
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
Subject: [PATCH v12 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Topic: [PATCH v12 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Index: AQHdQb7XToeGpjO4Y0i7HZGVFc1Wmg==
Date: Fri, 11 Sep 2026 07:26:21 +0000
Message-ID:
 <d11996ff36ca08932daec1ea699faa40fb55c3fc.1789055542.git.oleksii_moisieiev@epam.com>
References: <cover.1789055542.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1789055542.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB8025:EE_
x-ms-office365-filtering-correlation-id: b0e4f619-9e45-47e0-fac1-08df0fd5fa45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 FtwgBI0jjz8d0AVrCEyZG4ZKJFNL+zodgehiFgow3wjRoKyuw8AzGeI9Oz9wxJpZRzZM4i/mpt0at4ps+BxiJZMcgpRfxTfkGcTbH3lryX3Wpd8D6uKBWUKfvqEblF0BVoZa9SEW/6IyQxuolR55elefrbvmrCKxuidmIeZowBt7rTli+8x/Z1/uuCSFu426RuthhXfLPYccrPGK3+utmIJRBXmQwXJFM7m4KGZ5Ujw1b75GpJd8gJCHBHxI6OfQko39vkGm1ZKaUP3lIoGmLaCzdi/LdQpPlVv4WCkkxaGZp0Ob0jtMu0FlqNyuLrAYA7ynWilcx9LMulBfwvvaDODbG3qpkqdZDK7mDypKURLojX88bcvZ4GAz92YsfasANnlopfVnIjrYIevafOv+Adg3pTyEfeZJ27Qv8dkEzXz1JKEylnozDIJK/MkUTe+p8sQPVAXm/iwkMMbyQUOc9gUzhYNnuFyiLzo2QiH59jqO6VTF60uODSc47/hnfVmfaShUe2kzk9jtQ9KWMcvtvIbEXDyS2a2InlYuJfvOvQhOzLb4B6K1HsP9K5Bsw8Sg9Bv/apLUcc0DvJuNXyRvfVZQBryUHrUIs99T6IfGr2hPodv/ComeMwFOqLmBtlF/BvprqwM2tNelcfi1+DjNd2hsp5U6pcv9P+9oawx9yzU1MTzNjzUWmItUCGMS8Mi9loiDS5jwDBD5J7LWaSrlZ6NBjBCIJsPhTiVF5VkJw9k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ClA3Tf5hszpjOCNaVvW/GrWGRWoN+Jg9ZsD/xRa0sc5KKxcfN15qyknODg?=
 =?iso-8859-1?Q?UBn/ireCWclUeN6ElN5VP4a360Mr22NjnnOQhEXwdWcEUK6W15rq3htTBX?=
 =?iso-8859-1?Q?1p97fKjLmSzJ2rPiqOHPT3EZmTr9Mwwxw7T9WIt+kZInWdNDtZFVZba6Uq?=
 =?iso-8859-1?Q?Y2hFw8NIKY+QEBohYr96/MGTLXlb6a5gjrnMu1XIoOk1UGzbiB/P5JjKw+?=
 =?iso-8859-1?Q?F04n+5qvt2l1kSUpmfCLktXtWbMUaoHQpVIa200Jc3WJc0FqJIzpGDFPKE?=
 =?iso-8859-1?Q?kUFGJdzCiWEPGyWTsYFWFgnQ34c45/1FeDeENBlk8HmyS5DfuNkBtvDPZv?=
 =?iso-8859-1?Q?vJHlf3fX1bTL0hxv5qQjzy71Np+dUDjNuE/0BmRkPPX8tmXRSn4hAjTC2Q?=
 =?iso-8859-1?Q?R/rrvs3sWZfJc/3RyHJbgeLCtVvMTxPZ3L1/PIqhOzwuK9EOAq2aZpY7sY?=
 =?iso-8859-1?Q?AKgXORTrTn9t3MPC4oGIrVbq+a21Wx055P6oTFr2DZ99eR9Bd6fniPhgts?=
 =?iso-8859-1?Q?r8QNfB2l+E0E8F7JlGtPLPgBqnyUzHemjOatwj01Zhq31lltwoZY8HmySv?=
 =?iso-8859-1?Q?7gWIlg9wg7RQbgswjdfR9/qcaBeLA073jA7a391+qaZBI5nf7FnJs77ahG?=
 =?iso-8859-1?Q?uD+4TI3HPYCQU5x8/HzgOkxwWsHse2AyK980t11456x0PZ2Ur8z+LOFFSB?=
 =?iso-8859-1?Q?k7tZFlQoE3XXWcu30uehfzABtQyanhAoWE6/5zK3WBjWULMoJgATmzA+OA?=
 =?iso-8859-1?Q?+zpjpAisCaVeOTNwU2RvxjEd4Jfgru9SShPXygj3ke2SAMDsI8WGTmhcTH?=
 =?iso-8859-1?Q?z16cZ51f0LTTgVUd/eqAympwHoV3cElk7KbOgxZCBnMXhAAMrwR8TGw7VE?=
 =?iso-8859-1?Q?z7eKKpM993Y6kJwE4DOkduiB+P2y5AOZeYat0Wt4yQkPeIbgXnwn1o93Og?=
 =?iso-8859-1?Q?U1uwOPmsw8lnmt10yApiVtFT+EQKpYuKaWNiARLgYdEo9Pe+dtaPea20Iq?=
 =?iso-8859-1?Q?2bH5xPwpcVHDXW9r0qiIGdeGPRyzYVme6F8TmpYXFfg9RlXD51ZpDX2S8Q?=
 =?iso-8859-1?Q?YKi1mMT8LFYf0w+wu2XHIH6ZWsPGa1cqQT2kYg6XogOQ0ocl0Ij2tjr7aS?=
 =?iso-8859-1?Q?joLrqg80Qntr9b3f+LRzDSVO1ZQV2wt7Y7v8ukvX3eiYfeaA2BXYuCe6+T?=
 =?iso-8859-1?Q?trHOc1kbGXJmpigXo2hzlqrEZ+5/Nan/ULvxp8XwgVxw+ZjpWDO86nyAwf?=
 =?iso-8859-1?Q?NqFQNq5NuxSju3B4LN+RIjXL3kwOwNiVs1F5QHnAXKxg6z9w56dhB79xTe?=
 =?iso-8859-1?Q?LvTFK2V2KDwH1nLIhhAUkgwe8OS9PbU+M5FdLtaDuG/1gzMMmlD/6r7VdF?=
 =?iso-8859-1?Q?A8ogO4hQYGOEAmf7pz7MI06FuhdvZo0KsvBkiBBMsusyFYL2iszOhwPAG0?=
 =?iso-8859-1?Q?L9Curm71JrAcFSCAURK5O8c0P31E9Scicp/ixt7E8z2n+BEpT22jq+QSWv?=
 =?iso-8859-1?Q?qnaMubItIAq3AjdDZmqc7qMWg6N6gJfMvUC28PtHNZKZZI1RTev71WpDNg?=
 =?iso-8859-1?Q?ro1dTdOMqHY0xSgeMQ9lmiEOSHnKadJjGZqwzGUh4St/iG/Kpovb+j1pFh?=
 =?iso-8859-1?Q?OWRkOuGnJMBYO4wqgMvZeRziEFrFKa9COqOaHeQADx4xiv0VGilPxYCqU5?=
 =?iso-8859-1?Q?hNydChXmADKzsNwsi3awmDxM8MMeEZ5VqzBwgYD3vsGsOFXZpgpHymKm+H?=
 =?iso-8859-1?Q?5PTXbbfCDze9nurdLtHLyiQPq8PfrKTDnIerp2/BydR+eLwW2qBmWKlreM?=
 =?iso-8859-1?Q?io3iTY8Yi8mBj/YepMO4gojLxmgFmI8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e4f619-9e45-47e0-fac1-08df0fd5fa45
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 07:26:21.1044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bBvZt3vdiuxl7DCUKkvYK6UTrsLgtclrf1CdfZrMfi2SDm4QNybC5p357mouEvdWPPlXgeXB7axtty9Z8atyi2l9j/YbuEbme/OdSSUzsCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8025
X-purgate-ID: tlsNG-4011c0/1789111586-5A9D9CFC-54D4495C/0/0
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

