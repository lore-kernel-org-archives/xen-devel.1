Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B5606A319
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 16:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=fND0P6iL
Received: from list by lists.xenproject.org with outflank-mailman.1454614.1668175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIqdI-0000hn-SZ; Mon, 19 Oct 2026 16:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454614.1668175; Mon, 19 Oct 2026 16:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIqdI-0000hg-Pv; Mon, 19 Oct 2026 16:54:44 +0000
Received: by outflank-mailman (input) for mailman id 1454614;
 Mon, 19 Oct 2026 16:54:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xIqdH-0000hT-Eh
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 16:54:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIqdG-00HRaQ-Q2
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 18:54:42 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad64b47-e002-0a2a0a5209dd-0a2a4502deea-8
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:54:42 +0200
Received: from [52.101.83.130]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad64b52-6ca4-0a2a45020019-34655382d97b-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:54:42 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by WA4PR03MB982538.eurprd03.prod.outlook.com
 (2603:10a6:1d0:34::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 16:54:40 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 16:54:40 +0000
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
 b=xgqVXVldj3Z5LvPAWAAQnFWAab3wnWB75HTy8+a5kqeWeljXvQxcTmRYQ+nPWZ2ZzWFidTbxbPKq+VjKRfuObFBTe8+pve3NONz8jTl7+4PFsEBBQgXy6gUa9EqJasc9BP9vWv9UXDfADH5v0nKZma839tNP0QENB0WN/xQ29Q5rWJVzTNxQIUZLAnCMpwSgvaJ2CLgxbEUbqFlzZt8KM5KomSynWmkX6ernLvaZ0KXT+oVZMfjWikWyh5xBBD2oorn/MV3oa6qMq4nBcXs19c7KTiH4658wijLv4pEQUVlTXG3erELF/LyAp6nT1sDTL4tK6wjlSPwZ6oqJeiApMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1QXZm+csZjJpL1tDYRP0Ue67yhh1zn9jsr1tTTJYAA=;
 b=Ibskdg7hVkgCWkaH2A16fVRy3WjjCo/mZnwTt6nMA0gwtUq7O+i42RaGHhFHCr0775O1/3a9dbBR32lARiBIQIXOwTRCCcJesMb7/libudPo2C0v0oSnWK5SB6VnScLuvSykOT99SsNJvYmKz00S4t4+PC1h8nAJYgeCdG3/WXGW6Ci3CdxeMH1XpwkjV8Wylz6f8STIxlBF/7pr7hqpViT9fHmeukP21KzCGsMfJZF+smKzRWgTpzfygTBuojb3IxrvvBYC51rvgUQTtztU3fn7ZFADNYqkggI6W5FrrEkn+IABsjggiuev9ouwMX4MS/c33nuxQ0aDhNbcGVnkyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1QXZm+csZjJpL1tDYRP0Ue67yhh1zn9jsr1tTTJYAA=;
 b=fND0P6iLUOeZcQZsypsAd0cP4artyqtR+bBccInUmJ5te9NB9c25VyusEQeQaBPpJgSPcGhpB/heqShFhIJlFQ3n+HYqPkB2MBUrt04ZSNeTmt/xiq8l8zpH4Hc2Zf4mBVXy1pHYj1nI4n4v2fcHAFtLYRWPOyb8x10WZUgmEZdbiqOK9SGMNDMcHZhG8A1MJXj/boWDXkXQd6IIiiMSbd/mMkvSgr50C+0+JcUXCm+zSoGJBXDGrwYGStx/goldxrfKmlC+8VhpR22SYnYz+QKg03yqwxYQa34aSuv9HQ1ICrPm5Uc2W4eaGqOaRXb+etErPwmZ99qEZ3uCJttMEA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>
Subject: [PATCH] misra: deviate MISRA C Rule 10.1 for boolean operands of
 arithmetic
Thread-Topic: [PATCH] misra: deviate MISRA C Rule 10.1 for boolean operands of
 arithmetic
Thread-Index: AQHdX+qIyAZynI9P8UKq+juoFEFtXg==
Date: Mon, 19 Oct 2026 16:54:40 +0000
Message-ID:
 <a536212d9cb18b5c23d06c1c06b9a8ae03941440.1792428626.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|WA4PR03MB982538:EE_
x-ms-office365-filtering-correlation-id: 4be4aa36-e1c8-44b1-1fa0-08df2e01aab5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|23010399003|1800799024|376014|7416014|6133799003|18002099003|10067099003|3023799007|260925021911599003|260925022911599003|260925021311599003|261009221227099003|261009223027099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 6KnmkQOn7TTZkRRusGKj9w5gQlNUwCufQXCKKOI6dIasx8vVvMXL4pN7wWHgEidtLVIOn5XIyFDjnY9saSFDkDPQeJet4B0LC3ZgxAaqai8rmwGEDMT4RjpXZmNRob7Q8BnGUZPrUr7fGfVekzw+ss59fMd0lhd9oDqQYdIP9Jlc4q5Z2eK+prvxtYNU99eNeIif6GSVV3uOi46zc1+W6+S4PU7I5bRmYwZkRK2EUiHKejqduUHJpo7wiDCKVYdWrS6Iindcjisr2fwlTa+0lmOgCe8yaIEXw9zJ4wlEBa4C/Dj03CsWrlw69fOKGDWHBXh9CPz0BW4Cc/AEVraFerHK+gyy3TcKAENdr0eWzL8+L6bUBMaHqWs2wI0bKgasdqnCYKwt6Q8yO76qow5JFgqB1fl25UVA/PlCVVlDUcvYfvIm91ba5RRCTUannwXRLJXDyEWytmcID0GDIU8C0PqXB0g1Qfb+G1NYmM2a3LRfZZA+g8gSP84pNmhXiwYVSrGIZlTocRWPagV5/DVaMt+FLT+ndsW8r06nbjY9DXK68qWv0IoqoNMHSxYcmz6ePemC6l0TxLRMaXixLjkAczaq43MfnNpAjbIpKYZN8RFShOgGOIiVzMkrcoGO78das+2ydEcDSRV9nYVjTUwpQy9mLisHiEtvB8N4Z2oMv+bZz0zunhXnsfiQWaBJQ7ZldB/BDs1j9P2JfTZZnOpHPD3wj3oznT/Zq3g6bTJ+grA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(23010399003)(1800799024)(376014)(7416014)(6133799003)(18002099003)(10067099003)(3023799007)(260925021911599003)(260925022911599003)(260925021311599003)(261009221227099003)(261009223027099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lBqwSUk9vRyhJS91rlUEZKuYLh35BN0dGZuYMPNFulaD3NhtNFNn15CeW4?=
 =?iso-8859-1?Q?cmo9tFEFV37ArFc4e4/jzV7nnNRAtO9HMnsfMluJ5M0I34N1jOf5GakaJo?=
 =?iso-8859-1?Q?K7gDkq/9R++kkBaVvVrVeloTvysjMix1K7oKERMWHI7sxURzyG4mBONRn6?=
 =?iso-8859-1?Q?UIBqk2PlR9zQk5d9H3XTtJhQC6ylhRgDYwb1Ybj8MAl+2nEVqtAQeeboUy?=
 =?iso-8859-1?Q?6RZeMhe9eqhQMhSBKHtkKyqx9ameledAr9e6yt3mN2CxeGikZba2Wm8Vgx?=
 =?iso-8859-1?Q?+LnnnDqGgyWzV029ZTDsiJpyEXldpvP0zCQ2tS4w72+vyZlHUJszYnJp3s?=
 =?iso-8859-1?Q?/FKQfPNuEAArKR18xzfi22dVWdjPRgLVxfvWy6LYtPl8hTX40NQbfqPF4g?=
 =?iso-8859-1?Q?OLnYa3MUzumrwxWkxKppI6CqobJ9Q7ewSLh9EpW/eKs1WJBpPXpeUZcOwM?=
 =?iso-8859-1?Q?F3yoGx3HVHX5y3VJWDmmbOgAUpyF9hh+oPqOfrcuR27mdkLJz4QA3vgG8E?=
 =?iso-8859-1?Q?NQiHqK4huK4082MvJGfKSzZwJC0vhjxRUbNnR1WEhm8JR1TycAwAngbHJX?=
 =?iso-8859-1?Q?W+ITdFQhTwNCYieZlNBFJU6cxoy03BU9IASew4koTYGS4+vVQQOrYJqffO?=
 =?iso-8859-1?Q?GjJPVLsJG/s/3JoxIxSLuFMaZ54up/ZigbU12aTUzqDG6OxmQ9dY12uxIW?=
 =?iso-8859-1?Q?polbU8ApANB0Tt6XIfPWlWCPXRWuR6s3eljkFOtMSbAn4iQWNuLoBKNbx8?=
 =?iso-8859-1?Q?Wvoxx1LbGdZYzeZgpqnmkA47hQXu0g6y6EfxCp1IgXhFXw3bsr+1Kjoyrz?=
 =?iso-8859-1?Q?wCfLDfd5tyTmGy77ttP2fRAyRJFJatWDY95tqKhLj+0oYUWPI+bLMCpyo2?=
 =?iso-8859-1?Q?M++Og9Mol6nW7K4cXtYo40CuxJcWc7si+TMM7PJX8scJPavV00HcHRSqjs?=
 =?iso-8859-1?Q?XTezcnJRtpDxmXfxZN8CR/xrJx68h5bUkAtRPCV3Ey3CVGW5UfyiXfh0qy?=
 =?iso-8859-1?Q?vwkWK2RxlXT4K1qGgF/vTwyEUcpCpp4VoOrTilHD2RMkHQfyHyskD3D/ki?=
 =?iso-8859-1?Q?bXGMwbjBV3VFc//6YQASWy60PgPq5WMwhL2QjhvAtmmIlaDSAdG86Oc6M/?=
 =?iso-8859-1?Q?Q9mfHQXD8sRFbqc9yfANFnyTBrqvBW0iYO2keF6IQhBjPVrlee2KbnhJyF?=
 =?iso-8859-1?Q?Dlk0CUmiayapRUIo6qxavllGJ2B5piKQSrjo7igyJbRa7OtwRglog6FNVp?=
 =?iso-8859-1?Q?WjQ7eajVE5euWhJsCC+9e5ZxwKmd2zYxOlEGLlDa1tkeM2yPEnk2go1z6x?=
 =?iso-8859-1?Q?Z1ZVSJpUpGYvl1nutnFWWCph/xtPMZRPYQBExF7n5WRUilSTWvPshPLQy8?=
 =?iso-8859-1?Q?DX4/8/BqSP2MleZL8/ckfMH+0+ndDkoLMmVGyuZNBp9UBTYGLffnERtBi3?=
 =?iso-8859-1?Q?yJcab7JOvUdD6A3UjVQtD9vpdhlFmdu+iI6GghMO6VkK202pNhwusv1mob?=
 =?iso-8859-1?Q?xIl9fbZC+4NRlHd/vLu92yYDfW9oHjCpJm+APUQTah0CUYlQtbStSMQDMC?=
 =?iso-8859-1?Q?3+iORiuuU4aDQbefk7L4OkFHpyL31dc9/LmI2Vq4PHynVehh54GEpndMAR?=
 =?iso-8859-1?Q?m3n21v7L24LnisVZbRJNuyk3vfU0Fm3Id3vFiZZQTgc0VHrC+C2eTbKltE?=
 =?iso-8859-1?Q?B6mEZU2ewoQpIgk6ZId/pVe0RxBBRxQwuLXMcJRCpCa1Z6sSUDWwdZCUBD?=
 =?iso-8859-1?Q?xtl5s0MprBLopl1R/Uy4W5/SIS3sEVXLZBmmGAUghTYuDmUxu7K1BPxmQT?=
 =?iso-8859-1?Q?1mXcH/6SLFtSpY4YVy18S3jTXM1ExHs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be4aa36-e1c8-44b1-1fa0-08df2e01aab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 16:54:40.3301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQyiYKYFn8mPQC9e2d4aSeIRXRp1j8pZlmktR7iNSf9QMTdm76J6PjlxGwTvhlJGtKKgqi4rei9cf87jmabioOOlR95Eq9Ci9U7e3Zn0N7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR03MB982538
X-purgate-ID: tlsNG-720697/1792428882-319CB2AC-8AFA6550/0/0
X-purgate-type: clean
X-purgate-size: 3666
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MISRA C Rule 10.1 states: "Operands shall not be of an inappropriate
essential type".

The result of relational, equality and logical negation operators has
type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5), so using
it as an operand of +, -, * and their assignment forms has well-defined
semantics.

Update ECLAIR configuration to tag such uses as safe.

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Current patch resolves all ARM Rule 10.1 violations (actually, there were o=
nly two),
and resolves around 55 x86 violations.

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2963748389
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
 docs/misra/deviations.rst                        | 6 ++++++
 docs/misra/rules.rst                             | 2 ++
 3 files changed, 13 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 6cdb10a129..8bfb1a0f89 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -335,6 +335,11 @@ still non-negative."
 -config=3DMC3A2.R10.1,etypes+=3D{safe, "stmt(operator(logical)||node(condi=
tional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"=
}
 -doc_end
=20
+-doc_begin=3D"The result of relational, equality and logical negation oper=
ators has type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5),
+so using it as an operand of an arithmetic operator is well defined and we=
ll known to all Xen developers."
+-config=3DMC3A2.R10.1,etypes+=3D{safe, "stmt(operator(add||sub||mul||add_a=
ssign||sub_assign))", "src_type(ebool||boolean)"}
+-doc_end
+
 -doc_begin=3D"The macro ISOLATE_LSB encapsulates a well-known pattern to o=
btain
 a mask where only the lowest bit set in the argument is set, if any, for u=
nsigned
 integers arguments on two's complement architectures
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 6bcc2adf95..5aeb3ef9a3 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -347,6 +347,12 @@ Deviations related to MISRA C:2012 Rules:
        well-known to all Xen developers to be a comparison with 0.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R10.1
+     - The result of relational, equality and logical negation operators h=
as
+       type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5), so usi=
ng
+       it as an operand of an arithmetic operator has well-defined semanti=
cs.
+     - Tagged as `safe` for ECLAIR.
+
    * - R10.1
      - Xen only supports architectures where signed integers are represent=
end
        using two's complement and all the Xen developers are aware of this=
. For
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index a59cf1782e..54b1cefba1 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -387,6 +387,8 @@ maintainers if you want to suggest a change.
            compilers' extensions)
          - Implicit conversions to boolean for conditionals (?: if while
            for) and logical operators (! || &&)
+         - Results of relational, equality and logical negation operators
+           (0 or 1) used as operands of arithmetic operators (+ - *)
          - The essential type model allows the constants defined by anonym=
ous
            enums (e.g., enum { A, B, C }) to be used as operands to arithm=
etic
            operators, as they have a signed essential type.
--=20
2.43.0

