Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321D2CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 10:35:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446121.1662170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGDNA-0008JW-DK; Mon, 12 Oct 2026 10:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446121.1662170; Mon, 12 Oct 2026 10:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGDNA-0008JP-9x; Mon, 12 Oct 2026 10:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1446121;
 Mon, 12 Oct 2026 10:35:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1xGDN8-0008JJ-Ca
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:35:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGDN7-00BZBQ-IO
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:35:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6accb7bf-e002-0a2a0a5209dd-0a2a4503c72e-46
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:35:09 +0200
Received: from [40.107.130.138]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6accb7dd-fae8-0a2a45030019-286b828a5716-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:35:09 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PA1PR03MB11363.eurprd03.prod.outlook.com (2603:10a6:102:56b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:35:05 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%6]) with mapi id 15.21.0496.019; Mon, 12 Oct 2026
 10:35:05 +0000
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
 b=jfv+yyoQQXxWNLMNEaTl364gTejEjng3mzk/Fze3sxpIhLBi9qPXGxYjZil2ijwL+b0JQgZ+ZYtwllza5413LY5pShoOxdEwmj4kvV/gIJwpA1IB8fCr1okn4npolEJcJTKgrjdy+nDII8OkkpSc3Y7tdHWo7BtlN2vQeCtOd82qQ/6sHnnWWSWOr/nhM/c0Qed/RS30k72jy42UZES9Vmd1iSER7slrTFCCFK3v3tBLU2+HTDc3dAwUlDGGz5jPKeGR1tpXheVzvW1i4zX98umAJIcnbJUN7C9SUM+D2hpz0tDdGjEwBp8Th99EvfHFP7J9wP0buq83LH44bnW3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wNqtXDBjGhsye4upC2DSzCQvfIpnWcmdwayz8TVGyo=;
 b=Y5QLiOT5IOHDCiDE9h2denjFbDvxZ4Lafuxgf3Feh09dyEISrHpnKKLMWTQnsGVw4oR64uSPOC8bxNpCh8irjUSMsR58mNVLqpKodh2zfbHrycSULpel6mkvyaUI6UWDBnxNfLRxqva6oX4JshNbuHTPn+9mmEIIBSGUBD+mDEguP8dtlrEXUIdEjXSMAGtzMkmBxfMzdZsID8dws7VRx2ugpY0mBlc0hYpVFj0t34zxaEoDnYnzWokZRXFhEWfsfgiqOIEweG7z0oGf3wLC3Xn0U+RBxAzDrnD2MFNmRxyXzjIvk4FbdmXUgrw4P/ZBx4PN+CAJwiALQVOc9EnXeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wNqtXDBjGhsye4upC2DSzCQvfIpnWcmdwayz8TVGyo=;
 b=hVmY3JIKg64i17I1Xfh4UKfOUpCZNhRbtQFSGPGYBlQMHfq9s7zM5GQPdtslDw6/D2CQVktIxXvwZywcN0mvzFBqS1b0xg7HMKVlf7OnScV7+ibnWZjKNiU93XAqNcG4eP1Ylxl8LMAhf4Tld09DdN6ntuE72LK0vwF+XkMjoLeM8twIZh0k4zX6qOfWXWUVEWvtpvjsRVNqvxVwDTnGg3H/Gsx5thmWBrkyNaQde3ZWMCNLb522/DjWQdUiciMOaI1DB7uitlHqUiHCVlqiaJsTv4DuSwHfQdDmP0UcQoZaBkZ0gNmE3TFAWEt8SgPXDlYuXe9svLXGwKYhscAGyw==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "Daniel P . Smith"
	<dpsmith@apertussoutions.com>
Subject: [PATCH v2] xen/xsm: flask: restore sidtab state on policy load
 failure
Thread-Topic: [PATCH v2] xen/xsm: flask: restore sidtab state on policy load
 failure
Thread-Index: AQHdWjVYBo9DplgOwUK4YbEqpVPTqw==
Date: Mon, 12 Oct 2026 10:35:05 +0000
Message-ID: <20261012103504.964430-1-Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|PA1PR03MB11363:EE_
x-ms-office365-filtering-correlation-id: e8eb8d69-301e-4bf2-a2f4-08df284c7ac2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|261009223027099003|38070700021|11063799006|18002099003|56012099006;
x-microsoft-antispam-message-info:
 jbQw+ltm+SdFstHR3IZ+wvBjTt1FikCExtoPSAlV1oASK1fzq5rcM294okkdekVtO0JxEDbwZU5d+XMzA/61hwSQlb22QeS7ARlkyFfKl/hEVg8aZzeuI2lGWXCe07zi28lnfSgJHQOOPC+otOrqOvBp5UHdei52Vx/8hlQXRe0KrsnRuq3FlBGV+U55cVIVdl1Zhiz+MnyMt6v/exwrMwQyYNAP1Lz2slrUm4WHl0hKSgHjFSHd8r/g8xWLgWEXLaTS4UjjLyHxuL3O6/TyvaXy4IFXQCOHBEWvODob32l/5frBwSi9VVyWiSbo7QCDqS1oJqB4y5vWvEIql1HvblvIP0/N48xQL2tCB7gM534YN90vkxU3JpaYSx1BiBdAyO+Qshac8QZuG1UUdT/KpxSTS1bQAysMqz49mF2yubqsJsGUdexwCCfg3nhqDGm1/+X/SyePP8bZ3PUmxePP+fi7Cfwv0BgwCtVQxj3PTkhUK3cdXogbS567RDY+aDIV5SVVYTynzkHsloyalczBoaeH0kcY/Cs6ysbcmtJQTMQGrMXq0xnR6lbnC0RX4MauLmg06cjwiCFdzKHlXKPdBxUKMYvn60ffnLGrjXdcFqWaiu44aI1YO5oXUoNRgLdADjnJQRkcJ/vXicGCPRW4sk56ZRaEQkKPIoC6q/BlOzPfEBdVGrCr9FQ/nu8bIglkI4ezBr4b4ZDl2XPQRdltDRGRs/MT/jib8XMy4Y0Trio=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(261009223027099003)(38070700021)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?i6jZBdG5O9d3bevUVZHaPzW59h2alTDQ1I5JKup7hnU0LHuOQQR+pA5cf6?=
 =?iso-8859-1?Q?3ym7W4qG+Ub8/mIZu/PU5/qP0t/k6raxIDnAKyCR1U/1zSVflg4nP8vyr5?=
 =?iso-8859-1?Q?EXUmtMM+ox3YOMdF4iL1Ahj5QsSzMe80ysrNAddIQq4g260SNMshLxwx01?=
 =?iso-8859-1?Q?WSqUXYUU+nGW88Q7sx0l1ELj1gZgiSUn5GZxr5+yJH42CsgY+v235kXwNZ?=
 =?iso-8859-1?Q?+vBVHgifkspuEbb0w6YOY77LkR2Oz5S7oIFK2lHKIhNrz3pEw/y0oSnx2k?=
 =?iso-8859-1?Q?1CS8dY5XWIs/n7Rx1xfeTMfb36PZ1KWQdJX61ctD3B79JteZHeIODSAZqe?=
 =?iso-8859-1?Q?Y2TOoCSv7B52xaqn2XlFyINiHrmK17U80+mPMgX1CEekK3VUmal23ZQ7hx?=
 =?iso-8859-1?Q?metwrjkQUwg5R2dJz5NFYY/Fc86gGGMaKXeTxrX6G6xm/0VbEHP+lYIDki?=
 =?iso-8859-1?Q?D+lRKPndVS40qlaYVRlM0/+sBi91CfbclQRQR97AZgvuiK6jncX+aJpkcm?=
 =?iso-8859-1?Q?2q6WNgh5QpHWHMl2m9qg6jCzOjmzxfGcWmhcwMFmw3X0/2o6vVJlC4yrrU?=
 =?iso-8859-1?Q?Lyr0EhTm8z8sNxz2C67sctWMhN/PXMnmaVQRWvS53LxhqVrQ+pMAPO71Ya?=
 =?iso-8859-1?Q?0+Ryt9NXsO9pmB1qBsS1gqWvssBw1yh/yxom5g/ZgpiXSaaLfFf474t5Si?=
 =?iso-8859-1?Q?LsemM0ZM8hxKzLfnqC1NieimZV4LZp0PqBScD2bl1qy8qEoYRNWU9ZtvmF?=
 =?iso-8859-1?Q?S8w9mTJEDOzn1fIDPC6BP/bOmsWF00zhzCbliqkxNj7sF0SZfwIaxU7J+P?=
 =?iso-8859-1?Q?vs1MgALzYrsRGcBLtkFgZ9MiPwws4eCBUPu5dAcwPo7wT1MWSipXHawc8q?=
 =?iso-8859-1?Q?Ano7bJQBM84shCWGupwcnh06qOzynoM3F86hwKLo+LuFJh/ad4+Z/TyMYW?=
 =?iso-8859-1?Q?upsVtkcaWBhkms4xS8vkGB9z9yGKL3z/ZvnP/h5imPHJPx3Kkyk7RMRQnb?=
 =?iso-8859-1?Q?pQ+Z/w4vaHKRdxITjRaximixwfDBPn/tHwH+MAX+FCRoC23XOwhHxJ2mrn?=
 =?iso-8859-1?Q?QSftQNWsiTlpsDi0hq7sjsZs73ydqp4ECgVoJne53YD10oCq7VSRh/abfC?=
 =?iso-8859-1?Q?ZhE855RACX3jlhdTZ6ySbdtAJBI850ooanOY9lDBroKfLPvROqmhrEYl2s?=
 =?iso-8859-1?Q?rwGpfEshhtbXStBOnztQ4kX+yzz/DJ08mkRRHg8Vo7nakRVpmpa7VWQUUv?=
 =?iso-8859-1?Q?/eXLTQ4rwukFn9vdTk4tPHziDKEYjPFCNi/p/KciUiTooNXBMaOoMQSn64?=
 =?iso-8859-1?Q?7oIbzpDbqOSydFnD+/60yfBg/qTp57LnSDy4SpePXejZH1filIXMCFDsAB?=
 =?iso-8859-1?Q?Ag4tVHg5oUkFhvkRyoaR82D16usr4Tn6fwGBQcblxMeetmv/D2LGY2Sa4k?=
 =?iso-8859-1?Q?5r2JQpe2gfnTAdl30SHZRumPBYhKdnJk/VdbM7s+OfAck963Aq9VaoGJ/j?=
 =?iso-8859-1?Q?Tv20LR96/vtRtg+rjo3InsqmknMTsx4BbGJsfKhxfk2TU/aj+Nb3KslmZ0?=
 =?iso-8859-1?Q?lt/pCC4wHcLCSGyaWsqfmv43RR2B+3Y7bYUWSjnsYUUnZx0v4mFlZYJtCO?=
 =?iso-8859-1?Q?TSvg1q8F2AwnE89DFfSc3xRVfm34KPJccXWgtguOhuNCDZM3biFQiiVtOt?=
 =?iso-8859-1?Q?7RXe7ay588WwjgV1Eoqsc6rqQ9q2WLugpaxilkamsHIgNe3//ZYshdWRQ4?=
 =?iso-8859-1?Q?5H+69zGNnuEET4mF8pMfjCrywN9JjYahgVa7T0pFUfX39JD3eFjhmT4lGi?=
 =?iso-8859-1?Q?KmYjcWdQsw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8eb8d69-301e-4bf2-a2f4-08df284c7ac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 10:35:05.1697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGcVEBFuNLbVFrN7IG8MTQ8PNs1TMxZoc+yLiGKp89DLfUdemEauuWmv62dTcj/rdzJEvCkamtIaYxb4KikWBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11363
X-purgate-ID: tlsNG-33051d/1791801309-7488A4E9-8E8539EC/0/0
X-purgate-type: clean
X-purgate-size: 1996

Error path of failed sidtab_map() leaves global sidtab in shutdown state an=
d
from that point system is unable to allocate new SIDs in sidtab_context_to_=
sid().
To restore sidtab state new function sidtab_cancel_shutdown() is introduced=
,
which only resets shutdown flag, rewinding effect of sidtab_shutdown().

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Daniel P. Smith <dpsmith@apertussoutions.com>
---
changes in v2:
 - rename sidtab_activate() --> sidtab_cancel_shutdown()
---
 xen/xsm/flask/ss/services.c | 1 +
 xen/xsm/flask/ss/sidtab.c   | 7 +++++++
 xen/xsm/flask/ss/sidtab.h   | 1 +
 3 files changed, 9 insertions(+)

diff --git a/xen/xsm/flask/ss/services.c b/xen/xsm/flask/ss/services.c
index 57beaafa9f..9e01e8f730 100644
--- a/xen/xsm/flask/ss/services.c
+++ b/xen/xsm/flask/ss/services.c
@@ -1428,6 +1428,7 @@ int security_load_policy(const void *data, size_t len=
)
     if ( sidtab_map(&sidtab, clone_sid, &newsidtab) )
     {
         rc =3D -ENOMEM;
+        sidtab_cancel_shutdown(&sidtab);
         goto err;
     }
=20
diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
index 69fc3389b3..74fafba75b 100644
--- a/xen/xsm/flask/ss/sidtab.c
+++ b/xen/xsm/flask/ss/sidtab.c
@@ -320,3 +320,10 @@ void sidtab_shutdown(struct sidtab *s)
     s->shutdown =3D 1;
     SIDTAB_UNLOCK(s);
 }
+
+void sidtab_cancel_shutdown(struct sidtab *s)
+{
+    SIDTAB_LOCK(s);
+    s->shutdown =3D 0;
+    SIDTAB_UNLOCK(s);
+}
diff --git a/xen/xsm/flask/ss/sidtab.h b/xen/xsm/flask/ss/sidtab.h
index 0e48ec6eae..f664cbed60 100644
--- a/xen/xsm/flask/ss/sidtab.h
+++ b/xen/xsm/flask/ss/sidtab.h
@@ -49,5 +49,6 @@ void sidtab_hash_eval(struct sidtab *h, char *tag);
 void sidtab_destroy(struct sidtab *s);
 void sidtab_set(struct sidtab *dst, struct sidtab *src);
 void sidtab_shutdown(struct sidtab *s);
+void sidtab_cancel_shutdown(struct sidtab *s);
=20
 #endif    /* _SS_SIDTAB_H_ */
--=20
2.43.0

