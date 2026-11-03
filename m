Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ACE606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=S9BnW7CE
Received: from list by lists.xenproject.org with outflank-mailman.1470344.1679107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIL6-0000Qs-IG; Tue, 03 Nov 2026 17:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470344.1679107; Tue, 03 Nov 2026 17:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIL6-0000P1-Bh; Tue, 03 Nov 2026 17:30:28 +0000
Received: by outflank-mailman (input) for mailman id 1470344;
 Tue, 03 Nov 2026 17:30:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOIL5-0000IK-G9
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIL4-0082tl-MC
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:26 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a2e-e002-0a2a0a5209dd-0a2a4505e898-6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:26 +0100
Received: from [52.101.66.123]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a32-4cb1-0a2a45050019-3465427b9e4f-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:26 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:24 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:24 +0000
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
 b=E3vG1bBF3N1moRGwqk2e9wvs1j+o0/y05/WY/t10iTTzCXmhCcJ49tM3pL49jVFGH/YVpl3QIfJa240/tFC0NJT9FZEzsjJd8/bdeJNrztqXpHEUtiv18e2xLqvba2sBxdF7XgPmExtAX3kZ0k0KPQaoTyKrRWFJ0DG1lBPaGWJVYSIu1SUbG0q7FUOK7f8q8iuNxJ9RTA+Zf2KTlWRa39oKiiKxlq89CNpN04Q4LQMjFoZ/prrNVzYMXQKcekoko+OtT6zayw5VptfNnP+LqKY3ZZyaHSlAhi4td5g36vfDoBg2lkdfVrci6aCB7ZpbKAhg00Dt6jymAfR3qZtkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h65T3qN5ENkSABqnFxXdapmONsngVT2rHLs98PX3ddU=;
 b=ahkik0El3DTnwq2VaEFtBcdLaUzM51tKW5lUmWBhIo8pFSOFk7OwQlWgy3OmX3UiSomex5ZsyJmbf5BjPy01HcC+VVDSTK2GRnEpwi21EyeqNLqXhdvSPdoRowzsNHfdZ0dgYA6VIOn0JW4rX8MPVj+pkepMf234lqy73XRS1ZqAif2bdtMI918JWNIgHwUlmjezVnCK128+VhQboSyFiCtt7XQ4bydRVTm65qPLlcmp6FvD/E4wT4jdvJl5MQV9VRsiqDn/aoL6fNA2gfImzGLB3zMJFhn0v11k7wsQKkPYbMohZKL0bAMXLEgEBjnbIPWLjptTIir+wLIsQ9eUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h65T3qN5ENkSABqnFxXdapmONsngVT2rHLs98PX3ddU=;
 b=S9BnW7CEoxpxsQTdRicJBpWGmCshVNUx1G1s5/cpjGLV88FvvoMuRFj4uIWvJAJk4E+Qn4oA/IcMxcbkYvWDoDoq3tOT515jxQyepEnmMWBCUMEAt9JxwW+Eeo8bmMsiqvPVVF3XAPNSKSOExSGr7HCWIi0xRFMRMYAeSUCVGsS5yPnFeCr3Kv3Xjhv6NVNh4sU7K+X8fRa+r47E+ZBtA1nLEJnIbJEDACUxNG7pDHceZxVXABqNhh7u2XqYoEcaYUipgPxmQePg26sFMmlAaU7L7mG55YY4I7otjXycIB2ZmYY8rMgdvKsjpiaUMVMbDemrnnmQCHtrC2KBemfJ/A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap
	<gwd@xenproject.org>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v5 06/22] tools: Add XEN_DOMCTL_CONFIG_VIOMMU_* and viommu
 config param
Thread-Topic: [PATCH v5 06/22] tools: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Index: AQHda7kC/hJHclJuGkWXi0K+IS/7rA==
Date: Tue, 3 Nov 2026 17:30:24 +0000
Message-ID:
 <d4f53b05a484bbb0d95cd539af889b21f3748bcd.1793726692.git.milan_djokic@epam.com>
References: <cover.1793726692.git.milan_djokic@epam.com>
In-Reply-To: <cover.1793726692.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|DBBPR03MB10511:EE_
x-ms-office365-filtering-correlation-id: 009dff00-0ae2-4752-98c3-08df39d02506
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|260925021911599003|260925022911599003|260925021311599003|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021135927099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 3/ShUJllZWZdlFd0g+D0pADIkGsep0X0tFp9k5csQdugYt3O9gbkWEESdSZj+PIg0OXixZRW7p6QxvFcFtl1kFsm8nWV1EXooEOu5foYo1q7xd+FqGLNEOD+ek963laFDtTqDdzDMZEZEQxdpYmlTHMRiCpCqN1RLq8J1dJ48NRScMNeb0qUq2qU9zCaf4aWcwlvDRufbFlJg5WXupqd0D7jaEAWQGmJVJKDQ35+HTyePqCpxHPUAN1+qH80Mg6dJc+EZfeo6CYsjRDr+vj9UxE86gGrblECiXSsV4xLFdlcwCZgw5Amhqtkox3jvhTquopZVPgi2xfSjyIlR9bA3JLftYrW66F8GWGrXZIPdMiNymdeej+cdrfUS6y+u6mqFuudKrKwlvgDdNfDcTzz18QddXGLD2k8jShojziLqywVFS4+gpAhJKGU53kS6/WnbKGNq9xMMVp1Ag7WP9jNC/hV+HlT4LITp3XgqjylfkcU6y199Akl8+94pnsFfm9v2QXD5aKAsGHOpUFKb2aaX1huC8UPDi/Az1JwyXnHcMjw0geVo0uUcW1lImkzG8WEr8rJ89ZnCDSKh5Fspkb6OHUcqJtil69AjPNjiuQSsgu0cdFXa9eizLenW5pajw8atYJ3lkGs6Oq62y+fVzDa2cUMd20SLWYjvbaekhRkUkt6lIDz8BAgbsqsvzRuK9CnzeXYlgOb5yrfmbcwexzuhCrOKNvb5vBrNh7q4W3W+24=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(260925021911599003)(260925022911599003)(260925021311599003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021135927099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ov2DBTz3QvoNF80fyv7pUjw8eHVCkESgMUicL6Mmxr3YasR7dsjux9wkAO?=
 =?iso-8859-1?Q?ioMNndxPggNNmvilhfUNe78vErwRQ6RqmfQOGPFuvT+1LIMKUNE0wqqA38?=
 =?iso-8859-1?Q?3IzQoAg5vP/AQvtp5V9lWx1uBDaXWvj4wFxEQU8RcVuTLNE327vvr8urwY?=
 =?iso-8859-1?Q?k8dBR7s62VmOVcTgrtnG2cnY/qzicVQ3q2c1bfXnZISc6I4tDSTl98iug9?=
 =?iso-8859-1?Q?85h/If4k8tyy5FFU0eF6RQxvAs2i1ndImtjej1x0WugyAbT+LFw9Wh/ref?=
 =?iso-8859-1?Q?Zharei+FrZOFMyaRjod29h4o0zdENdY8/UEFwkSIFlKgw1nS+F5k3uLYnu?=
 =?iso-8859-1?Q?zOoV6mDT1FFihgHB3zu584MVKeZitrwF1W2uGYlhSWh99kZ8LDTDSj4cSA?=
 =?iso-8859-1?Q?Kj8nruwdCs/yWczIen9a0zEr871JnmqilOUI1YSjLHvOA8J/Z2/HtUorYk?=
 =?iso-8859-1?Q?63UIfan/OBUGgWxw9jMiqtGFaORYkWQzfpX0NvtNBVWg8zzTdInXvaOG43?=
 =?iso-8859-1?Q?h6Zcro6GzGfyKgpxmjwflGPPIJTh3+hu3duXFVLOmLJ53Nu3U84giy01aw?=
 =?iso-8859-1?Q?/6VD0c69jq5gt+LxpfRKhATP/kWwH3DLiJMYrdHYv8rKawiXJ5Z8YOD2x7?=
 =?iso-8859-1?Q?AwCtFQ1sOKLPE50LeOJshHErygfUsFWlt6NsKQvapXLXcCfbrK+7pL3BbA?=
 =?iso-8859-1?Q?K+rGnjR8IqMrsznFHBgLrZ3xpWPoWeTdK2nMdXojfuvLH7aIoKHPsDZei4?=
 =?iso-8859-1?Q?YfA+TTGGGnL189yJo0Lx8giW5cFnf5jQWGsGoDZIZRcZqx9hg8kbNo4h9X?=
 =?iso-8859-1?Q?L/a80Wr1MVDQ46yjT9zK2ss9/2tUoP58my//2oR2ZaNGWYg/2bc0oHh2ph?=
 =?iso-8859-1?Q?Sd63PkXz9hqshhBxKrp3D1IJDpnNR4U/B8819A/l9G3SlZXnymO2MTfeuv?=
 =?iso-8859-1?Q?gWkYklcHrdwjSbbuUojwacmdlbONYdjHRUAO96q+zirDY4EU2TkkxoRffV?=
 =?iso-8859-1?Q?lmXB9iP4/zPbUOLkye9gM6tH1+21uJwKO9OtiznC0TeCZ5jA+NhZLe6sSj?=
 =?iso-8859-1?Q?OMle7YAcNd49fAyYDDjp/CC1xiLDic4qzVvYDVU5X0YWwEophXjYQJ/B9r?=
 =?iso-8859-1?Q?9s2nfuzFiyFJPMJJ7ignTo+HFgXph+W35HGXaXiC/FPwr5Gm2i8CT2+BtP?=
 =?iso-8859-1?Q?g2ruO4clh+QEPIhC/CEvGkqazVgKcVzC2pLgG2MAn20m6LNGa43bF284mD?=
 =?iso-8859-1?Q?jgEZpPaB/0ZMNU8tVaT9BVQ4CaMKwpAlyxl5s86Ey/2UO89UF9NN2rZOjz?=
 =?iso-8859-1?Q?rzPYA3euAUtJySyGiatE5cYnj9Lz9/37TB38YkBHbdo4FAg5RSyvcFxD0a?=
 =?iso-8859-1?Q?IqI9Wn5caliFZcqeYifQxjpXfwNGoTXy0HwR7daAPunYo8MFUFQIb2TUgu?=
 =?iso-8859-1?Q?yLlgV/K5P/Pt+M5ojUdhHSif/NyzgJfZZHmsubT+FtS66hhqNZ8XQ7rVU3?=
 =?iso-8859-1?Q?Un0ys7i6tsCDCV8Ec8P3e4BCSzEpQCeYYgOERtC34pwgt2Ib3uEIOZyVov?=
 =?iso-8859-1?Q?Y7Wqjqb5XU9HQsn9TZHzM1aM2XcRSi/yjffYI8JQGrVriGqc+rFUZfK5b7?=
 =?iso-8859-1?Q?PJerridwGbg8VU6GxtPoiRhFMcvHMWPDeDdQDDlLYQIHS8lMGmok4sri7r?=
 =?iso-8859-1?Q?eZxFKvRLco7GreOJrxXma16AykLuy+k6AI3gXL7UTaH6+x6pA/93W9H/Aw?=
 =?iso-8859-1?Q?brPxzeSzu7FzzQmOrMxdhNA/n6WX47ustKLnkBo1RyTxYlKFceRRDihfId?=
 =?iso-8859-1?Q?HMD6EEUNfA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009dff00-0ae2-4752-98c3-08df39d02506
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:24.6313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBN4AYVDNsiVccH6JD3aJJycebXqKsGwMrkb+0/Y4kYnkznwmRlce5FtXcWejKc7YBVCQ7QuiLuDRfY3RSq12Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-c201ff/1793727026-F56AD2A1-6E8C79C1/0/0
X-purgate-type: clean
X-purgate-size: 6669
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
enable/disable vIOMMU support for domains.

Also add viommu=3D"N" parameter to xl domain configuration to enable the
vIOMMU for the domains. Currently, only the "smmuv3" type is supported
for ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
Acked-by: Nick Rosbrook <enr0n@ubuntu.com>
---
 docs/man/xl.cfg.5.pod.in             | 22 ++++++++++++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  7 +++++++
 tools/include/libxl.h                |  5 +++++
 tools/libs/light/libxl_arm.c         | 13 +++++++++++++
 tools/libs/light/libxl_types.idl     |  6 ++++++
 tools/xl/xl_parse.c                  |  9 +++++++++
 7 files changed, 64 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b19c25c8d1..3920911033 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3190,6 +3190,28 @@ option.
=20
 =3Dback
=20
+=3Dover 4
+
+=3Ditem B<viommu=3D"STRING">
+
+Enable an emulated IOMMU for the guest, allowing the guest to configure
+IOMMU stage-1 translation for guest-assigned devices protected by the
+IOMMU.
+
+To enable the emulated IOMMU, specify the following option in the VM
+configuration file:
+
+viommu =3D "smmuv3"
+
+Currently, only the "smmuv3" type is supported on ARM.
+
+For this option to take effect, the passthrough option must also be
+enabled. E.g. if passthrough is explicitly disabled, or implicitly when no
+devices passed through to the guest while the vIOMMU is enabled, the
+domain configuration is invalid and will be refused by Xen.
+
+=3Dback
+
 =3Dhead3 x86
=20
 =3Dover 4
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index 6ab23a708f..254e040802 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1273,6 +1273,7 @@ x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
 if err :=3D x.ArchArm.ArmSci.fromC(&xc.arch_arm.arm_sci);err !=3D nil {
 return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
 }
+x.ArchArm.ViommuType =3D ViommuType(xc.arch_arm.viommu_type)
 if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=3D =
nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1815,6 +1816,7 @@ xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis)
 if err :=3D x.ArchArm.ArmSci.toC(&xc.arch_arm.arm_sci); err !=3D nil {
 return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
 }
+xc.arch_arm.viommu_type =3D C.libxl_viommu_type(x.ArchArm.ViommuType)
 if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D n=
il {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index 39bf9962d1..112b2825da 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -531,6 +531,12 @@ type ArmSci struct {
 Type ArmSciType
 }
=20
+type ViommuType int
+const(
+ViommuTypeNone ViommuType =3D 0
+ViommuTypeSmmuv3 ViommuType =3D 1
+)
+
 type RdmReserve struct {
 Strategy RdmReserveStrategy
 Policy RdmReservePolicy
@@ -620,6 +626,7 @@ Vuart VuartType
 SveVl SveType
 NrSpis uint32
 ArmSci ArmSci
+ViommuType ViommuType
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d294fb36bd..4ffbaba179 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -326,6 +326,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
=20
+/*
+ * libxl_domain_build_info has the arch_arm.viommu_type field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_VIOMMU 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 47b662ea5c..7f1adfd79b 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -244,6 +244,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     }
     LOG(DEBUG, " - SCI type=3D%u", config->arch.arm_sci_type);
=20
+    switch (d_config->b_info.arch_arm.viommu_type) {
+    case LIBXL_VIOMMU_TYPE_NONE:
+        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+        break;
+    case LIBXL_VIOMMU_TYPE_SMMUV3:
+        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3;
+        break;
+    default:
+        LOG(ERROR, "Unknown vIOMMU type %d",
+            d_config->b_info.arch_arm.viommu_type);
+        return ERROR_FAIL;
+    }
+
     return 0;
 }
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index ce697303b6..a585d24964 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -562,6 +562,11 @@ libxl_arm_sci =3D Struct("arm_sci", [
     ("type", libxl_arm_sci_type),
     ])
=20
+libxl_viommu_type =3D Enumeration("viommu_type", [
+    (0, "none"),
+    (1, "smmuv3")
+    ], init_val =3D "LIBXL_VIOMMU_TYPE_NONE")
+
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -746,6 +751,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_=
SPIS_DEFAULT'}),
                                ("arm_sci", libxl_arm_sci),
+                               ("viommu_type", libxl_viommu_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 0ccece3e8a..4e5bc84ca3 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -3080,6 +3080,15 @@ skip_usbdev:
         }
     }
=20
+    if (!xlu_cfg_get_string (config, "viommu", &buf, 1)) {
+        e =3D libxl_viommu_type_from_string(buf, &b_info->arch_arm.viommu_=
type);
+        if (e) {
+            fprintf(stderr,
+                    "Unknown vIOMMU type \"%s\" specified\n", buf);
+            exit(-ERROR_FAIL);
+        }
+    }
+
     parse_vkb_list(config, d_config);
=20
     d_config->virtios =3D NULL;
--=20
2.43.0

