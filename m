Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93288CA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 14:23:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441543.1659143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE64q-0006am-4r; Tue, 06 Oct 2026 14:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441543.1659143; Tue, 06 Oct 2026 14:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE64q-0006af-1x; Tue, 06 Oct 2026 14:23:32 +0000
Received: by outflank-mailman (input) for mailman id 1441543;
 Tue, 06 Oct 2026 14:23:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xE64o-0006aZ-I9
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 14:23:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE64n-00GDKV-QS
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 16:23:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac50452-bab6-0a2a0a5309dd-0a2a450aeaa4-44
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 16:23:29 +0200
Received: from [40.107.159.113]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac50461-f2d2-0a2a450a0019-286b9f71681b-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 16:23:29 +0200
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com (2603:10a6:102:1da::11)
 by AS8PR03MB9560.eurprd03.prod.outlook.com (2603:10a6:20b:5a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 6 Oct
 2026 14:23:20 +0000
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e]) by PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e%3]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 14:23:18 +0000
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
 b=NT4ytPG+BkKkMz8EuA3XVt0lI8dhYmI5YCH08kt1KUpevGEnaEZYKRjLlx6XLDqW6y5SR8XeGjeRgRGskZ9f8W1TKMDFa8zz/ApYOvT3WV2nGEeaqGn/jRKMtstLsFGu5yYuMEZeRl8R21e9D6oq5ALy+Du+frVSmT80sbWqfMIVhxYlbh5VqCPbtgh4mHa9MuLwhSeRTdEfcNT1Lx1vOtSOQQ0gLlbZ5d4Z9Z01sU5CKKM4bc59CyKiy6tf2KL51IlScpdqFNSugvIHpXYOkkt4dgSVnhmIuYS+/HrKFORXqr1brBew9PkA/VBxoWG5BODilUvjXyFV29JMGOXq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgShQoPWGyW24mcGZ9e2lq1F4W3v9OLSLZhEXQO5kQ4=;
 b=P8i4Vywt7ca9ucRD/vyyuF5Fx7gL7bALW5DhDuXX+bohzyPqKmX20Pn8ujIB7HQ/LfjNh3nxmdN/4GLsVMPQ0Lf5roXYSZLWWqTo+o8e2pdTPmPf/TM+UTdLAQC1l5T4pd1Rv86iC+sIODV5NUjPGkPPw1m5Z0JUZ5DpUt6Twn1GNauFzVBRSCzQaTdIIodEIkbaAWgzmoX3g+tllB4Nkkp2/S7SYgyH/BtLX3CvhVySjuERWE6IIz/yABOQ8EK4VvViAa39Jvki3uPTIZ1WRmZCCMk+oEn08ho6C2dHyY+qqpU6Vx/3kewodH8EgZBLxC9CCvFjMJ3/PT4Githncg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgShQoPWGyW24mcGZ9e2lq1F4W3v9OLSLZhEXQO5kQ4=;
 b=s6gfbUzV7TEaZcsab9SOY6UTniHC7vqDDNzf6pVztBhZYJh5AQIcYd/pWRVDJ8Z5rSkmdtEevGCRnTNBJUTqmU5nLs0jjD3wMBFfBaYgP8cGYCVgiXY6eXIU5GhF4svTIofL09Xp2JAD1wceeW3epwUHQ8IuawYHGFDY3/qtzF+BqKcgni1mvmGYDfkdAQcVXEilH2W0RUeGiQ1cXrAQfOAX4a0F2tUdqOCMJz5cQgkAUh4I0GM9giigC3wa02+UmKcFgzkKCGcu9+xP9BoyAaEbeRnanXo3JtLYA13B3pJb+PuN8Pxb8gG5tjxUz+pfKUCfCEGeVXZn7LzkwMeCRA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
Thread-Topic: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
Thread-Index: AQHdVZ47rgN8qfc/LUyZracn12XLUw==
Date: Tue, 6 Oct 2026 14:23:18 +0000
Message-ID:
 <2f67ef7c4593d3ab94b75b5b819e7e046e055796.1791293680.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR03MB7531:EE_|AS8PR03MB9560:EE_
x-ms-office365-filtering-correlation-id: 82a0a59a-26c8-45bd-dc93-08df23b55e3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|42112799006|11063799006|260925021911599003|260925021311599003|10067099003|260925022911599003|56012099006|5023799004|18002099003|38070700021;
x-microsoft-antispam-message-info:
 ZMQZ3uQBE0srj6aEmqHQTP2iJYPCkpNcvuqF452JdMtKjZ1i72uc4bdN+9ak6TW19JEgPBrefBwhpEwNUNoaAig3wN0VgM4aYjKr3ZI+lCf8P/+213WKUEk4q3oGcGRXUoUbF5GFBrtyYp6Whs2FygYagPJttZXPiEkwsOdrVTIkwtJLb6yQdwI8sEeBcd/jBZzgJwzn6dGLn5VZZeI6TGXd1CfDwUpN9t3iL0d1B7zBBDv/TviuNdXySEwcIoD27ScnkzeXZF80m9p/2DdXbGlwiFua98fwYaRzI34I+XaN6x8uaJBnUkLZWDvrdC3KpbW0j2e86ER21MTLtIUs0IGGUAebzhGYFlKxXFZdGslzeazrFxddJHVEj6MR0iuFyTDRpz/wX5vKh1E7xi0lB+JBkqF4D+azsFXqu1HFx5sfN9JiMkDAtJucXafyPcNoj9GrU2aV7keygYyC1qHDUmbeCWkIzthzYDVm2AYinluC12smD2QTqucLo9UPjdb7TSo4UvnjahOF4R853XehAPwHKT/xXp8JzkJ7Ku0v4BP2iD7RbqCoZpEEkx9dipjdIbfGMzb0UN9UKi5A4fUf3mTT5AMbR0mrDJdc7Is4YPeOVMY/3kYOyL1rjUcM+xfLvOyB/E3hSpItttC9WXKF3lf/kB4MtFBwwvq4nLaWbGDZwx/dZC/rx+2WhIkBj/eb9ROfp0Oq3f876zoeTI9L9iFTryJxJIM2TngpbFCfbvs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(42112799006)(11063799006)(260925021911599003)(260925021311599003)(10067099003)(260925022911599003)(56012099006)(5023799004)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Z0Dr1aTkMhrLj+jrpgXB75zSMmY75wX62DasgE6IY/83KTJItULXbe3lT8?=
 =?iso-8859-1?Q?WgpnFJoDYDhGPiCmPgQxUrn2F8TXJzOBey4luL6PEMbwIFMyp9FPmWKpt9?=
 =?iso-8859-1?Q?KOTK/zGbj20tfrY1edQHuqFVxaZNBJm0E+PczmJu2z4Rmhz1wM4WBMzvXH?=
 =?iso-8859-1?Q?daVHdqHgqvVWrz1YRI6diQEg3+9dHw7Wm01IfXhNTtUMLXV3wxfVoy4tOy?=
 =?iso-8859-1?Q?7P1uind0vOr5NQ5bCYzbdF5QxXhtbdS1lUqNJve4fmAoEC3meD9QevhG17?=
 =?iso-8859-1?Q?RLtNO7e4SVjCqX6puHMYSENEBu3pTtbhHiitTKWxPGwqBfDcEd5WXwvURh?=
 =?iso-8859-1?Q?2I3JmrKPDkoBWezwzn3+msQS4luNga122K8EZK4Z+yVWROtWepGBk2n2TS?=
 =?iso-8859-1?Q?L96V7PehC7HlB9UeREDafMMCSQjq8XxTefOyZLfbyoLKBcmUIai/LO9QNP?=
 =?iso-8859-1?Q?9vZLcynxDIz9+pwKTyPBDiU08w0Dd12gewWVN0TqKeQk5XFyEjF5d99hsx?=
 =?iso-8859-1?Q?B6S5YGIRkRqwK7n2USGUlK4BIkelGbDYSNAo0zaCrCwM4ollqu4LifF0Sj?=
 =?iso-8859-1?Q?iTwhTzWSaXrT34ZUR8/1F/Brve1O+QePAas+rX1RWQP00vMavHBjB84w2i?=
 =?iso-8859-1?Q?BGmqDOz0zIK9ZXd3Nf0yjlA9zzeFlqmWpGyBAPMwUK5OWXwaP/BVnyy07e?=
 =?iso-8859-1?Q?PxeHDPD2FxJ95wkBAHR04WEi0GIEdqNZuDoFno3ITPcG2mfGdtPc3paSU/?=
 =?iso-8859-1?Q?V7rCPW/bzQK/vZCRZjQVyEraHo+QuO9jyv1pcVKt20LQ539wbH9KezPlNu?=
 =?iso-8859-1?Q?QQDRf7GO/BzfnKpDNk/IPOSt3EPl8gMzwqVxt0s/iMHz6nxc4XldO8+sWC?=
 =?iso-8859-1?Q?/NWqEYaZzychZ4H6+EfpPwxg8TjMbfwNA5NOKPjxUVg4Rdw8VjMk0t6LkV?=
 =?iso-8859-1?Q?DUCBPIts5/9BxdtDfNdFo49VVdLQwfrxk5l2soz0VkD2eqaWslMXjGi4Yc?=
 =?iso-8859-1?Q?4l+0R51fKfpjPDmCMXQUxxc3f+8cmgO8ibDhLwtDGIrO34/KcLEGDKD3lA?=
 =?iso-8859-1?Q?TOecHvfmYsPzLr3mdJ4xEJb9PhKBjALaXt/t+rLmJsOF4BCHcPnPrISA2N?=
 =?iso-8859-1?Q?1q+c4orwXqIpbCU1dHkbzQ6p9sAmh/UiigHYbp3RGxfgX6YPREp0MrH8G0?=
 =?iso-8859-1?Q?eh2kAVsZ34Ys1i5U1jYjyQDg+hSwmeURcjjBp0ITAb2H1kEk6t2aRhy0tA?=
 =?iso-8859-1?Q?ocfm6iGYdVErq/mN8buW0G2TewM97vKK26jCstRa8ZASLy8JezhqY3bKN1?=
 =?iso-8859-1?Q?ljeWDIyqitfx0z79T1rmBDw/SauDES5YLBBgwrpVihghyfo8KL+gNJriSv?=
 =?iso-8859-1?Q?WWIfePRj68OiUyFG9d4B1DUxhHMxjV6nZz1R8d7b3HF9fDUSbe7jCr2MU+?=
 =?iso-8859-1?Q?E8Ou3LxZl4DwyDSVRuOc5i/rSzRFHwiTA/DtNBL5kDNZM8KGwPYrhvqg6n?=
 =?iso-8859-1?Q?NjJQw6xRx3tLaL5nyxfMALsDOcrvziGppQB5siHm33CWIEc3YA/GNwydH2?=
 =?iso-8859-1?Q?8YryrKdpBo94lg43KzqcQkQgQR2o86h8SWBCyAYKIlBb70xMFYk3MeahI/?=
 =?iso-8859-1?Q?/+DX6ScOIUskc3tv7sqPhYhjGr7Gj5E34bzWKFpxIwrqKGLkkYYujMeT08?=
 =?iso-8859-1?Q?P7B59kQA1ejPeTDaCwniePwuwO1eo8G6w3NB+PQyAO9sZl6/7+5qQS+E32?=
 =?iso-8859-1?Q?c97GRJ1+9stZNEbtmyGP3weIiMf6ihNwmEkHmR0uy2X4WOBeX/2/NlTlOV?=
 =?iso-8859-1?Q?w0/Ulc+JsOMXyCguYbfj3wA1sWFLfIY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a0a59a-26c8-45bd-dc93-08df23b55e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 14:23:18.6753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lcpXjyhgzJMVaPU4k6sp1oppUrPKX4gSYjlVDvWTgM1fzG+bkt/9RftBQAkH0lS3c48uSZOatD5HuDHmyPIzvrzKztjQF8clx11w89sTo7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9560
X-purgate-ID: tlsNG-4011c0/1791296609-52ADCCFC-686E0B87/0/0
X-purgate-type: clean
X-purgate-size: 1771

Hiding .xen-syms.[013] assumed the almost-final image is always pass 2.
On x86 LAST_LINKING_PASS is 2, so .xen-syms.2 stays visible. On Arm
LAST_LINKING_PASS is 3 and the final image is .xen-syms.3, which was
hidden. Pass 2 is usually only a symlink, so Eclair saw no program link
and reported every translation unit as unreachable.

Stop hiding pass 3. Passes 0 and 1 remain excluded.

Fixes: a401b5c9dc35 ("Eclair: re-enable scanning of the (almost) final link=
ing step")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pi=
pelines/2918036491
---
 automation/eclair_analysis/ECLAIR/analysis.ecl | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/ec=
lair_analysis/ECLAIR/analysis.ecl
index c6e1a7a95d..4078c14a3c 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -35,9 +35,11 @@ their Standard Library equivalents."
 -doc_end
=20
 -doc_begin=3D"Do not analyze intermediate linking artifacts, as they do no=
t differ from their final
-counterparts for the purposes of MISRA C static analysis."
+counterparts for the purposes of MISRA C static analysis.
+The scanned xen-syms link is the last linking pass (.xen-syms.2 on x86, wh=
ere
+that pass is final, .xen-syms.3 on Arm, where a further pass exists)."
 -file_tag+=3D{xen_efi_tmp, "^xen/\\.xen\\.efi\\.([01]|alt\\..*)$"}
--file_tag+=3D{xen_syms_tmp, "^xen/\\.xen-syms\\.[013]$"}
+-file_tag+=3D{xen_syms_tmp, "^xen/\\.xen-syms\\.[01]$"}
 -frames+=3D{hide, "kind(program)&&target(xen_syms_tmp||xen_efi_tmp)"}
 -doc_end
=20
--=20
2.43.0

