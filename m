Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABFB606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=DdEmGffA
Received: from list by lists.xenproject.org with outflank-mailman.1498226.1696101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUPjL-0004Y6-30; Fri, 20 Nov 2026 14:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498226.1696101; Fri, 20 Nov 2026 14:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUPjK-0004Xz-W8; Fri, 20 Nov 2026 14:36:46 +0000
Received: by outflank-mailman (input) for mailman id 1498226;
 Fri, 20 Nov 2026 14:36:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xUPjJ-0004Xt-I9
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 14:36:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUPjH-00ArAj-Ru
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 15:36:43 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b005ae5-bab6-0a2a0a5309dd-0a2a450ac79c-40
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 15:36:43 +0100
Received: from [52.101.84.86]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b005afb-f2d2-0a2a450a0019-346554566c0e-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 15:36:43 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by MIYPR03MB11759.eurprd03.prod.outlook.com
 (2603:10a6:290:78::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 14:36:39 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 14:36:38 +0000
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
 b=EUosSt+fO9JVJ9/bnIsldH/XgskO0m+Xd/Oj/20qMXwmq2JDJ9xPRh40luLuIU1EcvKLToihfzkS/pp+47XwkEBZoQS6j3fHbf67ebHfxL5miCgVMvj1QJjh24tfKUt9Fk8MeR4i3VrjdrD6938zsh7CTDM/vAL7TLEl5fiWKp5x6BZQTwxedUAiQP3CHO3mO8RoEQ+ofgX6uWTsjtfxs6YkLCfCJCYizTU5/CoZflH+kF/uiKV0gTxbkSbWF3sndDTL+CoZ7ABgaqz6xvqcmZ0CEkhsMUELmRw3immMpIubtg3jRbanyQAt2B6x/HtN7ezD1LvVmlmUXu2GLdG5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7V4kDl716LYw87g82pX2bW9hC8fnGQW5s/e2GlvkXI=;
 b=V80tFKFztXRSNBkNyR0bKu/Hc9rcRrZ2hhINm2RQymd1/eWdljmIK+omxkbOqyfWZ2E8777FE2cvuLpFlEZ8uD0XVWTu+IqPHmOB+TyVOp5Lalan5yr3CQftTPicJeD88eFA6W118yebRN5ag620YxWISOfdOXNCJ8qa/Ee10+KfTQRX4gptoP2MrpkDQhelFJ3Hr1EMSiAGgi3Qf7AbP/09t5PP8Y3UaAZJhCbH/TF6peez6iTNMkn3VutyKT84+NPr3+kavLkd/HghUpbKhOfadyY+aCTagUamRvCL9neA8qYbmbknrTx/HuFBAs/dr5IPJp9BKEIxvAqSn3NSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7V4kDl716LYw87g82pX2bW9hC8fnGQW5s/e2GlvkXI=;
 b=DdEmGffAZw37bM7igzOWmmUXBAkwG787PoQz852QyUFZPvFBQe+kIjXA7n9GFn08/zmZTj8YPz2fbN9UpaOv3BcnMVosP4602mJGfTe/HTE1qh/vUVzHXc63Zt+WZ92dSa82mHHFmnWTxKeYJVZJPVTsqny2O8kLyED1peD+u/FIn026mmF0+p9aKLgnAHG8PaBdzKOifleJEWH97fFfwr8yO0411nJo858ihjwQQU+dKiOTdrd02Fw2Os43L9mR7Cew25o4BsH3OlvfXq8KHKmKtHBTqYA47RQ4LkjVz0RZZV4C8+6QFzd/Aq93fkzleyXmOH2CMRnAvxfRq64nbg==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [RFC PATCH] xen/domctl: require a completed shutdown before resuming
 a domain
Thread-Topic: [RFC PATCH] xen/domctl: require a completed shutdown before
 resuming a domain
Thread-Index: AQHdePyNb0G+EmfpWk25fQ9bzS2vuQ==
Date: Fri, 20 Nov 2026 14:36:38 +0000
Message-ID: <20261120143631.145677-1-mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|MIYPR03MB11759:EE_
x-ms-office365-filtering-correlation-id: 9b26b839-5d86-4fe0-c23a-08df4713afc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|11063799006|56012099006|10067099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261021123027099003|261102123227099003|261021121427099003|38070700021|261022105027099003;
x-microsoft-antispam-message-info:
 P2ZJuUzoibCb8u6yD6cHELqlteSKoZx4LbTPyH/dCSG4y+6tQOC/rjpIiyK+p1leCuTEPgtxKLs1Owo+M+tNgIzfaNexbhpLR3zCbygOhCCWledH8hcd/Ss/mBZDcHGFIRUpwvIEPDRl5OlYB5++BQqbZ7uk0D9eDqpdrKwq8Y+YCyH8gUIgciFNqxVpRhMCCjf6D/bHoiMotoK4snPkesFpm5GXHrCtSVjj0vvQN0ud2hPBjIApdJvsgSubLSABSDlWgkAn09GkGtWc+IoC9ELOd5365BvTMABeMdO/2lz26r0LLcK87XVKPfOj62Tjq5bOBSUTjj6C4t0Yq0byNKdcGXAdc9tAUF5q2WcvEw7gnTuXKGPdsn9zKRP2RLxJg7N6ry6gRf1+ic5iBX4fH1V1Bt+Dm1d2VnQvxUxG2dZWW+bH5+GgM9eutcPXuy6Eg90Xbyh3a2jN3R5dpnrtM0NTikXIM4bzP8PPF778jMD38+2u67oJPh8R54pg0Fa/B51oUhzmrIWfG5vej+M9myshOFZotSAToHSiSHUgDtY0w3GvbdzGYZJrrGemtUxGXtqn38GuamXLzVRvKPKH8Hnkrd1kQb6BdtgUL+v/MERj5Xl62tTJIh7xWiyM93trL9RVi9kAO503h61RS6UTwv/2Ag+141os9XsJpNB0N5w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261021123027099003)(261102123227099003)(261021121427099003)(38070700021)(261022105027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+UfFdxMjM2irgy1WOfo+U6cvfs+eA4+BuXJsM6CVWSQMoO5hfvFQ0XQfQ5?=
 =?iso-8859-1?Q?q2LHrEIinb6DGEng/dUX0RRbWZxFLFiDhoLClvtrvPbMMMmYvzJ42G7G9s?=
 =?iso-8859-1?Q?b0t/6dMEELwhNPRll6lpc9aBpBZOiy4NCpED9Gahsjbo48gE4Bolym1ftM?=
 =?iso-8859-1?Q?mmDOWFtDv2N21shcmN79S2cwJfVD1VeEyl4nqBBsh98F5hkCgUIz/K9dT1?=
 =?iso-8859-1?Q?vuUsQSfCK8vPSV++JXiO3IpFUBXYwHhi+8qUJ7Tr7qwQMsI6f6EXd6haPo?=
 =?iso-8859-1?Q?CLMJ3B5sSMUaJVSWZWAbmAMHhYoJB3I3ezizo+uy1wzaz8arCdHFaTPQ1Z?=
 =?iso-8859-1?Q?Tjoh0+ma0vq5i1SnNbvlih7pznZzVDGgBoV8rfs6PlhWCpB1AmPRJv/Iz5?=
 =?iso-8859-1?Q?xMW348Mix/tcHbdgHIb7I+vW8yd8mvMGzLropDEMpwOCT8n0dKpe7IvLGZ?=
 =?iso-8859-1?Q?a7fc91BxJGT1On4sBNXWhDY+LYJN//lFhGFz1mJqRgiIXABSs5FkCYCC3U?=
 =?iso-8859-1?Q?BWBIEOF4V6TPEIklXPAtkHzsAg7u/EjRvxw2FWgTWm06/6X0JT44yEeV5j?=
 =?iso-8859-1?Q?gfjSPBwZJrGRi7E+SHL5o6jj98X1Ijtcfup5+Ug4rxMwCBFHW0Pxol2jGZ?=
 =?iso-8859-1?Q?8XwGiqIE6+1xYwK+egaJQG4U/iZVWThvu/7GCowGBdvSbyraz4hotGVkck?=
 =?iso-8859-1?Q?qLHSkgzYtH0eJTZS69CYEetfkSpX4SlDR9ypX771HnwPyv/6a5blcfrC/c?=
 =?iso-8859-1?Q?4XOHU+04kfhGZkpJGIGfyNnPKM0BICpmGgcj7e0ikwbwd1VgtNtiQaWyBT?=
 =?iso-8859-1?Q?F+J07bJwGoBbOPS085eU5x+x2CSRJYAbbgJir+xaP+U8/RF8ElVlJ/Z4D5?=
 =?iso-8859-1?Q?wX/vqmRX/MMS94/bkJgH8erKQ39MP0sW1xdIMuxHzhZNYeBLLYUS82slhE?=
 =?iso-8859-1?Q?tiw1ymNVWIf8H65hFso16XiwAluZlGcUtlnLk0kU7flbF2KEjaG0323v2z?=
 =?iso-8859-1?Q?eO1zRnBtswxLPylWUluzTZFpILUFi7+HGZHHVC1aC1mFFCRUbQ/wsC2tei?=
 =?iso-8859-1?Q?BsFoP+yFwHVFIsTF0Zk95smlywjIV6o4T7DrGzmEZpQQ4ecFmDPOT1BnkJ?=
 =?iso-8859-1?Q?Q/U9CEMFz04eOrYvaLI/Nw9mZULrVhRVyo/sY2MtuasJP8irFHCZlmW9oe?=
 =?iso-8859-1?Q?VBZFkE+r5wZyPbU+jSUnGXwswI+fAsYIRGsdeCHMa0P3x6r+ucNvOOzyHk?=
 =?iso-8859-1?Q?V80OLXi8kM8ZOZWfR372P+cK0fJPuK7jwuQNDmkRbiS+nLW0sopmd9bvUm?=
 =?iso-8859-1?Q?bqUZFGo2yXhS80JXwsp2OGsP6FLYiVgxxedZLxmWYpotp5H8judxFJ/Ir2?=
 =?iso-8859-1?Q?N5qopM8gMB2VhZ+1ugqJkRmaFVqN4DIbKMtuMexla/dO9EL3R/NKbT8ljh?=
 =?iso-8859-1?Q?tBNlmxC138fSEp+rpQzQK5oSFTSceILIAsY9g1XLxRLQEt+MAVG15TlEHr?=
 =?iso-8859-1?Q?UYfM9Xl4I9ovAKSthSk95aaN7W2b8BbSSfB9KP1hFqwfngqjSm4uIN5wY4?=
 =?iso-8859-1?Q?V4esh6gbZFgoGGvwJF8/VFTyJeqakF1+ut747xtQgL7+7fHuK0wyzXwJIn?=
 =?iso-8859-1?Q?XV+ZklT2nTlLQFK127S9rxwGUd0GrxzwBF/FuZXAg8G1OeT8pJiu1vri77?=
 =?iso-8859-1?Q?TMGDzHB5uJ5MonpcQ6k8bIqIvkOtcQvDJmvlCdRtgUnDFeIzUhlo4QwswY?=
 =?iso-8859-1?Q?LPw0YcUjl9nALvgt21WFkRNAyryWpWxAi1YOarGOxW4E4T?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b26b839-5d86-4fe0-c23a-08df4713afc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 14:36:38.8460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDT4qbPcf+ncTVlwzfWKZuPPGDme0BxdLY/nYtIyxJ0f+JmvGcQuULOx6QixM4kzGGqM5QN+4rLcSZjNhjjtYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR03MB11759
X-purgate-ID: tlsNG-4011c0/1795185403-518C5CFC-AF234914/0/0
X-purgate-type: clean
X-purgate-size: 4568
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

XEN_DOMCTL_resumedomain can clear a reason set with SCHEDOP_shutdown_code
before shutdown starts. It can also undo a shutdown while a vCPU is
still deferring it.

Check for completed shutdown under shutdown_lock before changing the
domain state. Return -EINVAL if shutdown has not started or is still in
progress. A repeated resume therefore also returns -EINVAL.

Soft reset already checks the vCPUs before resetting domain resources.
After a successful reset, clear the old shutdown state and release the
shutdown pauses without calling arch_domain_resume(). This also works
with on_reboot=3D"soft-reset", where the shutdown reason is reboot.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Follow-up to the v2 discussion of "xen/domain: make shutdown state explicit=
":
https://lore.kernel.org/xen-devel/a0de8496-66cb-4e7f-854e-fcc0053bd666@suse=
.com/
---
 xen/common/domain.c         | 22 +++++++++++++++++++---
 xen/common/domctl.c         |  2 +-
 xen/include/public/domctl.h |  1 +
 xen/include/xen/sched.h     |  2 +-
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index f3a2634d5f985e094236f81c49acbf6f9ebc8d58..470406af22725b150a308923e63=
a60cf26822168 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1425,9 +1425,10 @@ int domain_shutdown(struct domain *d, u8 reason)
     return 0;
 }
=20
-void domain_resume(struct domain *d)
+static int domain_leave_shutdown_state(struct domain *d, bool resume)
 {
     struct vcpu *v;
+    int rc =3D 0;
=20
     /*
      * Some code paths assume that shutdown status does not get reset unde=
r
@@ -1437,9 +1438,16 @@ void domain_resume(struct domain *d)
=20
     spin_lock(&d->shutdown_lock);
=20
+    if ( resume && !domain_shutdown_completed(d) )
+    {
+        rc =3D -EINVAL;
+        goto out_unlock;
+    }
+
     d->shutdown_state =3D DOMSHUTDOWN_none;
=20
-    arch_domain_resume(d);
+    if ( resume )
+        arch_domain_resume(d);
=20
     d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
=20
@@ -1450,9 +1458,17 @@ void domain_resume(struct domain *d)
         v->paused_for_shutdown =3D 0;
     }
=20
+ out_unlock:
     spin_unlock(&d->shutdown_lock);
=20
     domain_unpause(d);
+
+    return rc;
+}
+
+int domain_resume(struct domain *d)
+{
+    return domain_leave_shutdown_state(d, true);
 }
=20
 int vcpu_start_shutdown_deferral(struct vcpu *v)
@@ -1804,7 +1820,7 @@ int domain_soft_reset(struct domain *d, bool resuming=
)
=20
     rc =3D arch_domain_soft_reset(d);
     if ( !rc )
-        domain_resume(d);
+        rc =3D domain_leave_shutdown_state(d, false);
     else
         domain_crash(d);
=20
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 83405a766a54cc45d34cd1f5797778d7e20c3528..2420ad17213ce05e2a78f99b9e3=
86e944661e1cd 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -672,7 +672,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_d=
omctl)
         if ( d =3D=3D current->domain ) /* no domain_pause() */
             ret =3D -EINVAL;
         else
-            domain_resume(d);
+            ret =3D domain_resume(d);
         break;
=20
     case XEN_DOMCTL_createdomain:
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 4ca8a2d7ca65e21c3c1020d9428d6f180f7fe783..974c9327e74d2288e582708e2eb=
6b62d9cc3cbac 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1311,6 +1311,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_settimeoffset                 24
 #define XEN_DOMCTL_getvcpuaffinity               25
 #define XEN_DOMCTL_real_mode_area                26 /* Obsolete PPC only *=
/
+/* Return -EINVAL unless the domain has completed shutdown. */
 #define XEN_DOMCTL_resumedomain                  27
 #define XEN_DOMCTL_sendtrigger                   28
 #define XEN_DOMCTL_subscribe                     29
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ce1fa636db368d0e5c65fac1b13f9f6d908216d9..fd19bd075eb3af6e0ed67b9e76f=
9f28d5cb3ec69 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -849,7 +849,7 @@ static inline void put_pg_owner(struct domain *pg_owner=
)
 void domain_destroy(struct domain *d);
 int domain_kill(struct domain *d);
 int domain_shutdown(struct domain *d, u8 reason);
-void domain_resume(struct domain *d);
+int domain_resume(struct domain *d);
=20
 int domain_soft_reset(struct domain *d, bool resuming);
 =

