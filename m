Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9858606FB5A
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=OO7C0Jsl
Received: from list by lists.xenproject.org with outflank-mailman.1468435.1677537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNtUL-0008Tf-33; Mon, 02 Nov 2026 14:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468435.1677537; Mon, 02 Nov 2026 14:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNtUL-0008TY-0O; Mon, 02 Nov 2026 14:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1468435;
 Mon, 02 Nov 2026 14:58:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNtUJ-0008TS-P8
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:58:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNtUJ-000JLJ-5j
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:58:19 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ae8a508-bab6-0a2a0a5309dd-0a2a45099af2-14
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:58:19 +0100
Received: from [52.101.69.101]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ae8a50a-be1a-0a2a45090019-34654565f262-4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:58:19 +0100
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by AS8PR03MB7906.eurprd03.prod.outlook.com
 (2603:10a6:20b:421::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:58:16 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:58:16 +0000
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
 b=HwyZqclq+3Ba8rqwMpHjT407G7+39KeKqguFfsCyjFKMinsIB44Li/6lToCTiJVZbv9sYINAXAU1rVT5iN+QEqNS0Yd1IbEAGaswrgayAA4tX8uoklb22v85aE28dI1z/4dmrhwtWoBIJFjdCWAxqq9jmRvNLGoABlYjsHJ3/QkzK15iYSfQAqDQvXDG24VjfDxzA7vZ3BI0YXx281X3UebAr4HxFRpZVrx/uTSQqssfnK8bAQ58JNwFVLhFPIeM8L3phvo0Jp122YRv8tDWj6SmGRuHUTA5dSe3WTzzocT79jphZ1zUI2yPzVkfDOnELmber3muESeTIzAPLHnWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZf0bdoohp4mZdmIhDhsgy/IY4IhgqiMoXm+nqn9zmc=;
 b=KaVAFPVQwmHY3gqsJr9aGPQJOw88J/9AeGbV5uXjnU07nczwDX5n/qGoa4cYGt1EPniW7kFAN3Z9CmoqVZCbTJMZhxikFqdE7da/H1xGOAby/zXG0uk2YaMZKjFVMqmalPwZMxxaR5toKcyg2KyQqAG8OihMCu5GCvX0VeIMXbO7fa+4Z/vA7u4DsQn8Sn7VAYtWh1C9WIGKow0e8qJ2ur0FA/kxn8zrYNYXm0kl6QyzyFVBxU/OZzNHiUFPOQFu4e64hHX3Wjoyex2PM0Ml33E1HlpXaan5dH5ESgezFEGkyGeybULRdxeo7LxbwDgaJg8EE+kmYd6XNsq/fBBIPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZf0bdoohp4mZdmIhDhsgy/IY4IhgqiMoXm+nqn9zmc=;
 b=OO7C0JsljhBMSqclWz5lByzg4ZthX8t0Mx7cpKzBwRt3JE+54qkeR8qksqNlCMEKg1oaGIpQAV2z23SV4ayHgpCTbRFvXF+kRA1BJFn3o9F7TOOLJWnDgmtOVXLr6RTmGAqDle0I8pymjb+SRJVf7H3riOg5JbyICM5/UZi3Mjgrclqv2a76uhq1TF6M66/DWtEQjUTOEiqjMn1qmeTW013gexRWPtF61CxvyUr65wPP9zYyeg2ngur+bB55qtAI+V8UsaBgcWvzREkjpLt8PaJkkRnMWccxmDQQeQiXZloyiFFdC1qLgStryzVr+BKHki8PRymN2f4cB677dp2SLw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy
 Astie <teddy.astie@vates.tech>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v6] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Topic: [PATCH v6] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Index: AQHdatqXsGoVpH5TiE2rv7ud88hJMg==
Date: Mon, 2 Nov 2026 14:58:16 +0000
Message-ID:
 <f8bf3e87dac3bcd0d8ea680fcce055c133aa9e87.1793374283.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR03MB11113:EE_|AS8PR03MB7906:EE_
x-ms-office365-filtering-correlation-id: 9a567c6c-99dc-4671-2786-08df38f1b9b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099002|18002099003|3023799007|38070700021|56012099006|11063799006|261022075727099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261009223027099003|261028144727099003|261021135927099003|261021123027099003;
x-microsoft-antispam-message-info:
 7+2XmSycwA3NPbURHkSuJ/A2G31rE9SPVNGBTT2u68eDQPasvpj1+Kk4KWkcaitZ9sO7FYuadrdstDqFCyJYGhXgL18fMmMQQuY/BBGYHld3cIOlFXR6sFtq81j5wlqmE0dCZMGN/naRn9Mpts6ni+zrVKA9yzOI8e3H8TMkfz+YX3E0ajACdk3oAxtc2OqB6JNdXkaXfxMqrvTMrPKhKGkPic74yFvikIy4AErz8JvcT/7i8r5IZh9/Pg+T/omZFg7ptOwsSZkp1L4Gzxe3EkySexx+OQU1TMo2i7FjcHWiuEfiaAi6OVlU2yETWkZpCfjbHHf9/1bABGw+oHf8e+qCqe+zLDQYcDhHn/HxqxGjd4dGgYoWLmRKqqoNd1MJGASvRfNO/zSoUGUedtAjSEuWKoQ9x+t0sGZ0zJkKkXUdShFsr1aNBL4esEtUst/f+A/LJ9W33IHQS1dVSB+Oqwzp0MFuktAt6V7ScPtkieM/11WqAUg5+YU6y4hJIAPpDmEXpOJfQm/PiTG+umm372Tf7udEK89zCcnL4JG2MDjUhbcJQyOxl+KR8lxcfAtNihKyNjhWuxGZS/gHf4ncSfNnsYHsyF5vtGy90l75eBKbL08mNorzhd3QA8YVi9zjszdCi0weBwz9wy+rCEyiHYrbDR5G16VbvZz88moZ/QyfrFsKTahTFfdO+uYCb8lEvI/m5AeL6LoBL0UGL1I5jBAmNOzuiZBEVfNDErC+UQk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099002)(18002099003)(3023799007)(38070700021)(56012099006)(11063799006)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261009223027099003)(261028144727099003)(261021135927099003)(261021123027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1ppdvXa5/WWPdwyAiPC3z93qYCzZh5UZJUHBTGoOF/2/uhNY8hyDJ8EmIE?=
 =?iso-8859-1?Q?hXuyZGcCYpxyOAZJ/0Q7Cbx7pd+4ZBIh2eY/ooYSfJLKob5lSsrl2PSfVV?=
 =?iso-8859-1?Q?e1N4WWGI+VEBAs7lWsjV/BOpaRqTcdVZzS9JzbJTk5hzdVyBH/9mPq/UZ8?=
 =?iso-8859-1?Q?lhXzvxkyStVZrOwDd4vFjNnhmBMOdCyfQ5IM4TYtT/Osxj4zo1rskuwm6M?=
 =?iso-8859-1?Q?Jphm/CnNxCLJ66DhQkCA/67dTGgjmHPpbgnRbVzvEw7oiiisZ3ATlRnw2e?=
 =?iso-8859-1?Q?XS1W9LucknUD3lKAISq78RN0W/S/AJ+dwg7oh8FG1FG8mCuDEhlaPCOPAn?=
 =?iso-8859-1?Q?CUNmjAnQTEHoyZp4fwD+xGiZBRw6acWOQtrio37tVckgSm/XuuaBFBmxNp?=
 =?iso-8859-1?Q?8zRhvh5s6cz8YJILkZidbN1Qqun6Dx9By1eskUdCD6PePewGma2yzOegf6?=
 =?iso-8859-1?Q?nmbNP/EUgdk1yE8AfJpltW2XbeYJbZNfLlgbNDO/Z8hgpyTUmr+Y9uneHs?=
 =?iso-8859-1?Q?YugbIveXpRZ3/YSd02XBSVOTbKP3AGu3qbaVbHTVjLypvAdanqJU+pZ26F?=
 =?iso-8859-1?Q?bv3CBsFMb9g+fq47H8qYbMusDRpl1S2nay1stpbxP0gqwpfIhhCpynaOce?=
 =?iso-8859-1?Q?DhqkAGRG95j68+Tykf8Q6twMEj0dECex41voVW5bixKanStlerDp8Si46C?=
 =?iso-8859-1?Q?BpmLYE88lz46j8uJzlsS8aRa2cplzHVDvyHBvB1H9lj8FbWKENCtOOC+0S?=
 =?iso-8859-1?Q?ZdGYZ8g/ftw2hNDwf+nAvz9r90lVBgcJ0s3pqsFRKp4YWlpH6L2kGdRu4X?=
 =?iso-8859-1?Q?WI56xUVGj/DiFagvo9ovm1oAOdJi8HzI9KQ4O51vHF2Pm67Bf2wB+kHCe7?=
 =?iso-8859-1?Q?FaUwTl85d4PNzRo24imAW/IY69Zsa2Q3XaLHyvKO8iJq50Vke3Be4qjFXP?=
 =?iso-8859-1?Q?bsE0ACuEdKgR0kRN8vro3RJM/AwN3bEkEytDeF9Nd0mpZAXOUeVD75dfil?=
 =?iso-8859-1?Q?MoZhPfuLJLIIbPAdQoEw4GZWu9Jge5zIX6LSE+S83gGtYZQvzZWvHVFLUQ?=
 =?iso-8859-1?Q?Br8c4dUbG+X7nXAH3okfXSn9ZOabXDn33mE0zc5y2jSCZTVo47h8l+7nhW?=
 =?iso-8859-1?Q?P06DcbprAx6Ji3WmSddhrhw97261pUyfuIq3ScDY6YfjCxE7iqmowqOxoW?=
 =?iso-8859-1?Q?hBqxTcn6X5M8rxmt/7vaPuJh6PB//TcVwqxlZj2UiaebQkByJapsJa2tGD?=
 =?iso-8859-1?Q?S7jH9KFQxIJ4r0cwH6SYxgNN8zDQHS7NBHlHGgAPWqHWpNloPGXeNQn4RF?=
 =?iso-8859-1?Q?Z4Ba9wTFsoSZTGLD6I2JgAj0Wu1Acd2ALoA/pk/zGJal2ybUee3L5zNyBb?=
 =?iso-8859-1?Q?RlpGOBcp1sBkXIMcBIp/BUgQiU4KhPwpl3Z37c6zdOOXnw9c7NtLopWrfz?=
 =?iso-8859-1?Q?b0EBLdw8BefVjDbBvU858tSGSyhUHsCkeJjX/csFbGBCasMx/huoj4k+BH?=
 =?iso-8859-1?Q?KXNmC8aazPgrVyuCqrbk+B0gbdmLsp9L+nHtcbQTpcns1vYRcAiQuzvr9s?=
 =?iso-8859-1?Q?8c8pAegioIG5U2ZZjm1fozB3sYykGlb1C4iavWolkbNbaSCRjuvqbz9Et4?=
 =?iso-8859-1?Q?LWrlZr3/W/kKsUDcAYN1NaL4VOPvM25A8Z1CjER75Zc8xBudSRY3COOPuJ?=
 =?iso-8859-1?Q?Lu4ch4eAEIWrsD7r4lV/YdeMRnAnSE4NsyeawJwSRuTXx8TpWEjTlInwNr?=
 =?iso-8859-1?Q?kYqCCZeD3+2PPtelGOL4qFfPUWTnRAtqJ2piiSzjp2foFJzYf88uKMB+G/?=
 =?iso-8859-1?Q?rYBCi0b1CO6ww+ymdMt5zWk6SDARus4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a567c6c-99dc-4671-2786-08df38f1b9b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 14:58:16.3665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysBEOe79kTn19XDLUP8jkgjQ4Yq8NdAYlDvBR3dlEpqAik/EsJkAGvtv7QHIRT69KJHqGGmaUOjamu386BbXmcH0r1EHvc+/jW+VULmcJbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7906
X-purgate-ID: tlsNG-bad1c0/1793631499-BD2CC034-CD226920/10/78276251493
X-purgate-type: spam
X-purgate-size: 12154
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce HAS_DOM0 and a default-enabled DOM0_BOOT option in common
Kconfig. Arm and x86 select HAS_DOM0. Expert configurations can disable
DOM0_BOOT; this patch implements the corresponding code exclusion on Arm.
Making x86 honor the option remains a TODO, potentially as part of the
Hyperlaunch work. In particular, x86 still builds and boots its legacy
Dom0 even if DOM0_BOOT is disabled.

On Arm, exclude legacy Dom0 creation and its private memory, vCPU, SVE
and LLC coloring options when DOM0_BOOT is disabled. Hide DOM0_MEM in
that configuration and disallow ACPI, since the alternative dom0less boot
path requires device tree. Keep the x86 DOM0_MEM setting and dom0 command
line parser available until x86 honors DOM0_BOOT.

Retain the domain and hardware-domain builders, guest SVE and LLC
coloring support, and Xenstore domain setup: these are also used by
dom0less guests. This is a switch for legacy Dom0 boot support, not for
all control-domain or hardware-domain functionality, and it does not
claim to remove every unreachable path or establish MISRA compliance.

Check for dom0less mode once in the Arm boot path. Otherwise, create Dom0
when supported or panic when neither boot mode is available.

RISC-V does not yet have a legacy Dom0 boot path in this staging tree,
so it does not select HAS_DOM0.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

---

Changes in v6:
- Use the single dom0less check and else-if chain suggested by Michal.
- Exclude Dom0-only memory, SVE and LLC coloring options and code.
- Make Arm ACPI depend on DOM0_BOOT.
- Expose the common option on x86 and document the implementation TODO.
- Explain why RISC-V does not yet select HAS_DOM0.
- Replace the broad dead-code/MISRA claims with the actual scope.

Changes in v5:
- rebased on top of the latest staging.
- add Ack

Changes in v4:
- change Misra rule to 2.1 from 2.2 in description
- remove extra dependencies for ARM architecture from DOM0_BOOT
- rephrase DOM0_BOOT help by adding hyperlaunch
- DOM0_BOOT is mandatory for x86 architecture

Changes in v3:
- rephrase error message when dom0less mode wasn't detected while dom0
is disabled.
- rephrase help message for DOM0_BOOT config option
- update DOM0_BOOT dependencies for X86

Changes in v2:
- decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
suggested in ML) because in this case HAS_DOM0LESS should be renamed
either.
- fix order of HAS_DOM0 config parameter
- add HAS_DOM0 option to x86 architecture.

CONFIG_DOM0_BOOT Kconfig option was introduced to make the Dom0
regular (legacy) domain an optional feature that can be compiled out
from the Xen hypervisor build.

The primary motivation for this change is to enhance modularity and
produce a cleaner, more specialized hypervisor binary when a control
domain is not needed. In many embedded or dedicated systems, Xen is
used in a "dom0less" configuration where guests are pre-configured and
launched directly by the hypervisor. In these scenarios, the entire
subsystem for booting and managing Dom0 is unnecessary.

---
 xen/arch/arm/Kconfig                 |  3 ++-
 xen/arch/arm/arm64/sve.c             |  2 ++
 xen/arch/arm/domain_build.c          | 10 ++++++++++
 xen/arch/arm/include/asm/arm64/sve.h |  2 ++
 xen/arch/arm/setup.c                 |  7 ++++---
 xen/arch/x86/Kconfig                 |  1 +
 xen/common/Kconfig                   | 14 ++++++++++++++
 xen/common/domain.c                  |  3 +++
 xen/common/llc-coloring.c            |  6 ++++++
 9 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index b9c5c40678..4d696ff33f 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -18,6 +18,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE_DISCOVERY
+	select HAS_DOM0
 	select HAS_DOM0LESS
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_SHARED_INFO
@@ -105,7 +106,7 @@ source "arch/Kconfig"
=20
 config ACPI
 	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPOR=
TED)" if UNSUPPORTED
-	depends on ARM_64 && ARM_EFI
+	depends on ARM_64 && ARM_EFI && DOM0_BOOT
 	help
=20
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index 23a9d0ba66..08ca49bd7f 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -13,8 +13,10 @@
 #include <asm/processor.h>
 #include <asm/system.h>
=20
+#ifdef CONFIG_DOM0_BOOT
 /* opt_dom0_sve: allow Dom0 to use SVE and set maximum vector length. */
 int __initdata opt_dom0_sve;
+#endif
=20
 extern unsigned int sve_get_hw_vl(void);
=20
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 72f6f7539a..f047d49f24 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -44,8 +44,10 @@
 #include <asm/grant_table.h>
 #include <xen/serial.h>
=20
+#ifdef CONFIG_DOM0_BOOT
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
+#endif
=20
 /*
  * If true, the extended regions support is enabled for dom0 and
@@ -54,6 +56,7 @@ integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
 static bool __initdata opt_ext_regions =3D true;
 boolean_param("ext_regions", opt_ext_regions);
=20
+#ifdef CONFIG_DOM0_BOOT
 static u64 __initdata dom0_mem;
 static bool __initdata dom0_mem_set;
=20
@@ -87,6 +90,7 @@ int __init parse_arch_dom0_param(const char *s, const cha=
r *e)
=20
     return -EINVAL;
 }
+#endif /* CONFIG_DOM0_BOOT */
=20
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
@@ -124,6 +128,7 @@ paddr_t __init hwdom_get_fdt_alloc_size(void)
     return ACPI_DOM0_FDT_MIN_SIZE;
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 unsigned int __init dom0_max_vcpus(void)
 {
     if ( opt_dom0_max_vcpus =3D=3D 0 )
@@ -136,6 +141,7 @@ unsigned int __init dom0_max_vcpus(void)
=20
     return opt_dom0_max_vcpus;
 }
+#endif
=20
 /*
  * Insert the given pages into a memory bank, banks are ordered by address=
.
@@ -1865,6 +1871,7 @@ int __init construct_domain(struct domain *d, struct =
kernel_info *kinfo)
     return 0;
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo =3D KERNEL_INFO_INIT;
@@ -1903,6 +1910,7 @@ static int __init construct_dom0(struct domain *d)
=20
     return construct_hwdom(&kinfo, NULL);
 }
+#endif
=20
 int __init construct_hwdom(struct kernel_info *kinfo,
                            const struct dt_device_node *node)
@@ -1954,6 +1962,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
     return construct_domain(d, kinfo);
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 void __init create_dom0(void)
 {
     struct domain *dom0;
@@ -2011,6 +2020,7 @@ void __init create_dom0(void)
=20
     set_xs_domain(dom0);
 }
+#endif /* CONFIG_DOM0_BOOT */
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/as=
m/arm64/sve.h
index a71d6a295d..1315063a9d 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -35,7 +35,9 @@ bool sve_domctl_vl_param(int val, unsigned int *out);
=20
 #ifdef CONFIG_ARM64_SVE
=20
+#ifdef CONFIG_DOM0_BOOT
 extern int opt_dom0_sve;
+#endif
=20
 static inline bool is_sve_domain(const struct domain *d)
 {
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2cd1c021b5..ac282895c2 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -458,11 +458,12 @@ void asmlinkage __init noreturn start_xen(unsigned lo=
ng fdt_paddr)
=20
     do_init_boottests();
=20
-    /* Create initial domain 0. */
-    if ( !is_dom0less_mode() )
+    if ( is_dom0less_mode() )
+        printk(XENLOG_INFO "Xen dom0less mode detected\n");
+    else if ( IS_ENABLED(CONFIG_DOM0_BOOT) )
         create_dom0();
     else
-        printk(XENLOG_INFO "Xen dom0less mode detected\n");
+        panic("Neither dom0 nor dom0less mode was detected, aborting\n");
=20
     if ( acpi_disabled )
     {
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index e5535ac484..39182f6ce4 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -18,6 +18,7 @@ config X86
 	select HAS_COMPAT
 	select HAS_CPUFREQ
 	select HAS_DIT
+	select HAS_DOM0
 	select HAS_EHCI
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b289e444f..63735fb83f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -26,6 +26,16 @@ config DOM0LESS_BOOT
 	  Xen boot without the need of a control domain (Dom0), which could be
 	  present anyway.
=20
+config DOM0_BOOT
+	bool "Dom0 boot support" if EXPERT
+	default y
+	depends on HAS_DOM0
+	help
+	  Dom0 boot support enables Xen to boot to the all-powerful domain (Dom0)=
.
+	  If this isn't enabled Xen is expected to boot in dom0less/hyperlaunch
+	  mode only. Currently only Arm respects this option; making x86
+	  respect it is a TODO, potentially as part of the Hyperlaunch work.
+
 config DOMAIN_BUILD_HELPERS
 	bool
=20
@@ -125,6 +135,9 @@ config HAS_DEVICE_TREE_DISCOVERY
 	bool
 	select DEVICE_TREE_PARSE
=20
+config HAS_DOM0
+	bool
+
 config HAS_DOM0LESS
 	bool
=20
@@ -575,6 +588,7 @@ config CMDLINE_OVERRIDE
=20
 config DOM0_MEM
 	string "Default value for dom0_mem boot parameter"
+	depends on DOM0_BOOT || X86
 	default ""
 	help
 	  Sets a default value for dom0_mem, e.g. "512M".
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6b52713518..52c03fc2ad 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -610,6 +610,8 @@ custom_param("extra_guest_irqs", parse_extra_guest_irqs=
);
=20
 #endif /* CONFIG_HAS_PIRQ */
=20
+/* Only Arm currently honors CONFIG_DOM0_BOOT. */
+#if !defined(CONFIG_ARM) || defined(CONFIG_DOM0_BOOT)
 static int __init cf_check parse_dom0_param(const char *s)
 {
     const char *ss;
@@ -632,6 +634,7 @@ static int __init cf_check parse_dom0_param(const char =
*s)
     return rc;
 }
 custom_param("dom0", parse_dom0_param);
+#endif
=20
 static void domain_pending_scrub_free(struct domain *d)
 {
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index b5de5787c1..eb67306b21 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -34,8 +34,10 @@ static unsigned int __ro_after_init max_nr_colors;
 /* Default coloring configuration */
 static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
=20
+#ifdef CONFIG_DOM0_BOOT
 static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
+#endif
=20
 static unsigned int __ro_after_init xen_colors[NR_LLC_COLORS];
 static unsigned int __ro_after_init xen_num_colors;
@@ -108,12 +110,14 @@ static int __init parse_color_config(const char *buf,=
 unsigned int colors[],
     return -EINVAL;
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 static int __init parse_dom0_colors(const char *s)
 {
     return parse_color_config(s, dom0_colors, ARRAY_SIZE(dom0_colors),
                               &dom0_num_colors);
 }
 custom_param("dom0-llc-colors", parse_dom0_colors);
+#endif
=20
 static int __init parse_xen_colors(const char *s)
 {
@@ -243,6 +247,7 @@ void domain_dump_llc_colors(const struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
=20
+#ifdef CONFIG_DOM0_BOOT
 int __init dom0_set_llc_colors(struct domain *d)
 {
     typeof(*dom0_colors) *colors;
@@ -267,6 +272,7 @@ int __init dom0_set_llc_colors(struct domain *d)
=20
     return 0;
 }
+#endif
=20
 int domain_set_llc_colors(struct domain *d,
                           const struct xen_domctl_set_llc_colors *config)
--=20
2.43.0

base-commit: 7e020a4dd6ed30eb6c91a9abe2767034e2bb270a
branch: amoi_dom0_remove6=

