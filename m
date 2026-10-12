Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AE1CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 20:49:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446599.1662716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGMxJ-0004mR-NR; Mon, 12 Oct 2026 20:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446599.1662716; Mon, 12 Oct 2026 20:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGMxJ-0004mK-KD; Mon, 12 Oct 2026 20:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1446599;
 Mon, 12 Oct 2026 20:49:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xGMxI-0004mE-RQ
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 20:49:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGMxH-007HmJ-7h
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 22:49:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acd47c1-e002-0a2a0a5209dd-0a2a450a805c-8
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 22:49:07 +0200
Received: from [52.101.69.72]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acd47c2-f2d2-0a2a450a0019-34654548b54b-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 22:49:07 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by DBAPR03MB6408.eurprd03.prod.outlook.com
 (2603:10a6:10:194::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:49:04 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:49:04 +0000
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
 b=sgLoSrNuGWodVN7wcfd1MjJsXf2h1FEGYogkZl8HmC82bB/sqrAMrGKJb60OIGaGGw03+s4O/6JUsTwwM57emJJuPdAgfTqHQWHW/6bhkrEpeY6B/yRkyfYdHk5NmYcwkXxrCY+2eTp2AQE9cc0mf3uj9rmxP6NuVAm5rg5pKOL88nIwWv4WWa5bp6EPcPyXriY3RCMS1mtg1Sb9ugxm7VcSnNP/kC8kfDkX2oRMTrPEknQGyq/C+DY/50Fmm7NiVaiT3MPIpv4hCWZzkbKYxF9OxVqIAwYIKv3JhHKyCXtO5wqQGgc2zPV74rh9RrC0d01iSFilOf96sgRxzyolLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JMJZ3NGsj36GPx+oHzG6prpExv9HE2gV3Modk9pemg=;
 b=EEDujCm23notyZactZeG0asnY/7cSL9sm050ek+Nyez/HurbdGTxBeLMAweIkTPk2AoDY1jMZ810mT4ZDjv1k3jigUSMN84eYjtFWfrFQRe522ThFdY7CakYoqniEOdVbjHmZayC032sEzj2+67yreXxl4ni8HksD6TtPBc/G+GDikSSudh44z2N09RY7TbsvNkSbh0vLChR5jXedO8rTAdZOPBpt04I0zAVW1HHk817W41SKdrPcvvpEvaVTXtz7tFC/5GSRCiHULySoNsJZpnCE1C3ypqkBnH7XKtcYhpMKP6BUakYw4MLFtls8mFXnkl8V5bVBLP8l8tu4ino/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JMJZ3NGsj36GPx+oHzG6prpExv9HE2gV3Modk9pemg=;
 b=GXkNyUvuedzMJhpVFi5dVUSBEprcpR9RjcwY688WLJtFpAhpcxfOaZzUXegTrJruh4MT57bHB3oNQ8H2L4+Oj/5Id6xCyBgBp9STFreiAMhTHl8+Rr17gBp2qPU00VrOh8Fpzw/0FDy2DXuIOteQrArtcvcrRGhhudkxHB5WvJGslQf7MGe6NUmHGWJsGhULaQIh28rq8IA3AWDef4IOM9MnA0GPox84TBFJf1GfSb74228uSd3bCZq0j1LoPFw8VO4ezEbnNaEbBGPWPshE/RgEn6KHFlaBO1/M9F65m5K2pqBRGJcV6kXDtU8pgaNL+N7+K3d453D0C9gHRt2zqw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] Eclair: scan the last xen-syms linking pass on Arm
Thread-Topic: [PATCH v3] Eclair: scan the last xen-syms linking pass on Arm
Thread-Index: AQHdWose+3ny6aV1J0Gq+fH4413ZRA==
Date: Mon, 12 Oct 2026 20:49:04 +0000
Message-ID:
 <da077c781fe07f776946475521bd06409a9af100.1791836668.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|DBAPR03MB6408:EE_
x-ms-office365-filtering-correlation-id: b1f85738-2559-439d-7149-08df28a240ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|23010399003|5023799004|11063799006|38070700021|56012099006|18002099003|6133799003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|10067099003;
x-microsoft-antispam-message-info:
 CBxwf3bV0Oh5/PDtZFd4wKyB/8L1h3bbEInuFZlqa7cHFKBndHaJ1DG43Xf37XTDreZydjUVuBZXWTkv+zwE+MZCoNdaWjtzSiETiTg06NInkm9SiRiOjrNK/N18Pu0doT3I+9Ydmc/7lpTdIRaQnFleq0buUsZ+TuAbd3fsQBlRTTC9PmAZTUvVn32bV/aI99z9UFwE+R0Az1yMIjyzbPg8Qki07faXU9koqaGtYHNumMsOw5eaYEkN+B5XqhgoR1kKtHXYT2qd2pArLAwzx2BgBJymZj+tFVJtuES1L8kCgB4TH9jkvs9UD9Gkn6FNB326ryQdXa4RSOxlkP3FzkKDHpo7XAbjWTNF9/2MNLjLmOc3d2pMFSZ8MtT0S7095Fp7HOnRYR6QlNmyeFTNK0MxMkYmEllzuQGUJLBt6gpCvS5cjIeMct/6SivWrr0LDE9yyCyASMxQC7zvF3WZmj668WtWlonGtgqfWC+MR+jmBSiFPH5TQ/Kb4VWSQ4r5r9IRgVXdXldhVYc5V8XU6VQuFfAe89iJVIDQg4yXRv2kHEaAhVmVvzKo6kg3pvrM2A0U3L/oiMHbsvqMMnkHQmA8mFxcZMKhwkbn5ta3pdZ9HoTRhpsW9DijFV+okTdmRM8/XTxZtfd0Ve2xkegxm3GEGFuiFrAMvfRZJo4sHtM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(23010399003)(5023799004)(11063799006)(38070700021)(56012099006)(18002099003)(6133799003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Y83hoaX2wCr9oyZXeYmqlT3lo49ifrfB6B1MU9uLGNgx/5BRgcM3yFlqfc?=
 =?iso-8859-1?Q?XTOYuq21ihL8AqqhzXOTOZrZSRSz7wdGTpsGcQHUU+2+L9QKXcbf37EI4x?=
 =?iso-8859-1?Q?vyiJT4mtz5oQwiI0kY54X95LwGfiQ0VCK66rhDpRGVbZn3NNIBhr8CxaKE?=
 =?iso-8859-1?Q?XrQLac3plLbVNkuEPwM5Vq83WouN/yzRza4Yrt3kEWJimzCfds8A8nRUT4?=
 =?iso-8859-1?Q?oDqZQuH3/k9xZ4ZQ1FAgMo2Z46aFYzncvuh4gWI17PvMHQ3VCM/kTR+HT3?=
 =?iso-8859-1?Q?SsvPFROSgA0VtiE/Pn3IEbA7TJgu8xP6k5Bls0xnqIe0ck+52d4XoRGKI6?=
 =?iso-8859-1?Q?K9XiZ/WsTvJPvfQq5QXzNefvVHe/SLmsTZSo+6SnIIMu7ZYInMPvrK2tqt?=
 =?iso-8859-1?Q?cThK1ww74SL/mupKpxoBto5RmV08SSRXHvabALKtOz24CFB2yFF/yQEHWc?=
 =?iso-8859-1?Q?V6IJCG45PlYt2JR8WRqM4r1qB3UXfMsiMATLokrUCQloy5+pVQ4sJT2Ogb?=
 =?iso-8859-1?Q?7fV1vOdc//5w2To5eBRS3HRcdei9e1MTyUgwODlhCJGLDa0x/i46cX08eJ?=
 =?iso-8859-1?Q?LGcEmRYXROGHMkpm6IO3cS+NHzgzrdGapLxWdKFbvrj3bygx6NYmawBnMc?=
 =?iso-8859-1?Q?Uk3E4tXnNCiXqUcJHp5qNXS0RiYuZN0oeJTtP5lkrT21dk+FWUB56AUXnQ?=
 =?iso-8859-1?Q?I4pGPyADmIIj+yFMxe4QOqeGiZtmCBJIwFu9mOjf1rLfCcI8UWAP+A1TXc?=
 =?iso-8859-1?Q?6WVQDNvi7YomctOxaNYd9X6wtnLVOBg4XRTXomroHubzKMmZMUwnRQlyKt?=
 =?iso-8859-1?Q?/FNA/Pkg4NEhY+S5lJFNxKY9DdChSUb9pfwEkFPgtJ0MaUL9bFVl8SAE0n?=
 =?iso-8859-1?Q?yvI3mBnDk45+1DtZrn6ZY525Xu+NLxmNQ1zMBnRNbRvdjJhKRFsSq/83nZ?=
 =?iso-8859-1?Q?llSfQ4vMCQ9GvSIcUYRqj6vy8EW3NlSAV6vGiMphahWQGFpwNhN5fLFC0l?=
 =?iso-8859-1?Q?E9Ei1zNfqeTIm1wh5WGlqZKDlKhAu8Vs0wlHjtUpwNhq2BoE3GLOetHkr2?=
 =?iso-8859-1?Q?JdixtKnGziDh6dBXadexrDDwjGZ1jpj8AylWNTI1MlPIxx8IyqVALph4EE?=
 =?iso-8859-1?Q?jlNcVAze0Jo/TZY/kDN7dKlVMNI+bfFwrwJirK9EH8bZ42pHLAxrE9YhPr?=
 =?iso-8859-1?Q?2zjePgUAmnoAaB3+yZVIFD3/3lFnNYqNEpjC4R0pruPGAMO0ksupd0h3j4?=
 =?iso-8859-1?Q?u526snj7LuyYFTVJ/v2e1OXGZFJZ3RY86CF2dW5hxgSrki4deFZcrayols?=
 =?iso-8859-1?Q?xiaFK3hBiMOGJAXkIfUPajRCWu7renFwEEfNmLiKphP+kDguNj8Ua/X+CP?=
 =?iso-8859-1?Q?B/Hn+JV0bL3GinMbQcuUNaeSqh1Adw9/1Hv+duFgg1Unu9J6GDrvglOcTW?=
 =?iso-8859-1?Q?nUUy8pl+AdgMS72SSa/RF/KzdR+QV+u1Kyq84o1vke/j8UvFp/hLcBYCCt?=
 =?iso-8859-1?Q?iezLyFiBus4Xys1Sd4eIKXyoKqh0b8KhZqYZWZd7z+D/IWIq6jA367Fx3V?=
 =?iso-8859-1?Q?+St9qB6WLQ5ERrwtEQKcc+JxHcrdKvORy/XSAkyY++2A4O2DhrhhXVipE0?=
 =?iso-8859-1?Q?cblhYyAnBRqBKqYtl2rcdcrDJWZFIq5wTbDffm8YSdTE6E8dfsQHSSeB8e?=
 =?iso-8859-1?Q?QnfyKYr5MGqwUo1PPf7c8MmrvH5J++nwXzhNjRuYmIkbAckLqVIhwV2KlI?=
 =?iso-8859-1?Q?7lQKAwMna5Ej/9jknDcdXSp7FaP++vUQE/HqPQsdyutKIDLdoC4MlEhiuY?=
 =?iso-8859-1?Q?8ITh91QMVifNuZ0uTa7l6IhU6TF1k4Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f85738-2559-439d-7149-08df28a240ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 20:49:04.4177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cEDLXfLNn2MtQM6ZjzLauZG4UUoc0yt/e3j6dzTi6zRdzMGHxfBstVxOAVZZpeyidb5Ivi6qWE8rIU9sCpRspq/E1LyB08AO69XcHC/OGOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6408
X-purgate-ID: tlsNG-4011c0/1791838147-50ECACFC-D7143245/0/0
X-purgate-type: clean
X-purgate-size: 4009

The hide pattern .xen-syms.[013] leaves pass 2 visible. On x86
LAST_LINKING_PASS is 2, so that is the final link. On Arm
LAST_LINKING_PASS is 3 and the final image is .xen-syms.3. Pass 2 is
usually only a symlink, so Eclair saw no program link and reported every
translation unit as unreachable.

During analysis preparation, read LAST_LINKING_PASS from the architecture
makefile and the pass numbers from the foreach list in
xen/scripts/Makefile.link. Hide every pass except that one. An earlier
pass that is a real link stays hidden. The generator runs from
generate_ecl.sh, together with the other ECLAIR configuration scripts.

Fixes: a401b5c9dc35 ("Eclair: re-enable scanning of the (almost) final link=
ing step")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pi=
pelines/2940065908

Changes in v3:
- generate the hide pattern from generate_ecl.sh, which prepare.sh already =
runs

Link to v2:
https://patchew.org/Xen/e73c282694e68083305d03219f983bf74a8bf494.1791392326=
.git.dmytro._5Fprokopchuk1@epam.com/

Changes in v2:
- update commit message
- generate hide pattern before analysis
- read LAST_LINKING_PASS from the arch Makefile and pass numbers from the M=
akefile.link
---
 .../eclair_analysis/ECLAIR/analysis.ecl       |  2 +-
 .../ECLAIR/generate-xen-syms-passes.sh        | 20 +++++++++++++++++++
 .../eclair_analysis/ECLAIR/generate_ecl.sh    |  3 +++
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100755 automation/eclair_analysis/ECLAIR/generate-xen-syms-pas=
ses.sh

diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/ec=
lair_analysis/ECLAIR/analysis.ecl
index c6e1a7a95d..df1006bcaa 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -37,7 +37,7 @@ their Standard Library equivalents."
 -doc_begin=3D"Do not analyze intermediate linking artifacts, as they do no=
t differ from their final
 counterparts for the purposes of MISRA C static analysis."
 -file_tag+=3D{xen_efi_tmp, "^xen/\\.xen\\.efi\\.([01]|alt\\..*)$"}
--file_tag+=3D{xen_syms_tmp, "^xen/\\.xen-syms\\.[013]$"}
+-eval_file=3Dxen_syms_passes.ecl
 -frames+=3D{hide, "kind(program)&&target(xen_syms_tmp||xen_efi_tmp)"}
 -doc_end
=20
diff --git a/automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh =
b/automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh
new file mode 100755
index 0000000000..e3795e8234
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+# Hide every xen-syms linking pass except LAST_LINKING_PASS.
+# The pass list is the foreach in xen/scripts/Makefile.link.
+
+set -e
+
+cd "$(dirname "$0")"
+arch=3D$(echo "${XEN_TARGET_ARCH}" | sed -e 's/x86.*/x86/' -e 's/arm.*/arm=
/')
+last=3D$(sed -n 's/^LAST_LINKING_PASS *:=3D *\([0-9]\).*/\1/p' \
+    "../../../xen/arch/${arch}/Makefile" | head -n 1)
+passes=3D$(sed -n 's/.*foreach n,\([0-9 ]*\).*/\1/p' \
+    ../../../xen/scripts/Makefile.link | head -n 1)
+test -n "${last}"
+test -n "${passes}"
+hidden=3D$(printf '%s' "${passes}" | tr -d " ${last}")
+
+printf '%s\n' \
+    "-file_tag+=3D{xen_syms_tmp, \"^xen/\\\\.xen-syms\\\\.[${hidden}]\$\"}=
" \
+    >xen_syms_passes.ecl
diff --git a/automation/eclair_analysis/ECLAIR/generate_ecl.sh b/automation=
/eclair_analysis/ECLAIR/generate_ecl.sh
index b955783904..b97fc55fd2 100755
--- a/automation/eclair_analysis/ECLAIR/generate_ecl.sh
+++ b/automation/eclair_analysis/ECLAIR/generate_ecl.sh
@@ -20,3 +20,6 @@ accepted_rst=3D"${ECLAIR_PROJECT_ROOT}/docs/misra/rules.r=
st"
=20
 # Generate the list of linker-defined symbols (must be run after a Xen bui=
ld)
 "${script_dir}/generate-linker-symbols.sh"
+
+# Hide every xen-syms linking pass except LAST_LINKING_PASS.
+"${script_dir}/generate-xen-syms-passes.sh"
--=20
2.43.0

