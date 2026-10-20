Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D2A606A320
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=UbqcFC85
Received: from list by lists.xenproject.org with outflank-mailman.1455217.1668796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Js-0001Jz-DV; Tue, 20 Oct 2026 09:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455217.1668796; Tue, 20 Oct 2026 09:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Js-0001Jk-7O; Tue, 20 Oct 2026 09:39:44 +0000
Received: by outflank-mailman (input) for mailman id 1455217;
 Tue, 20 Oct 2026 09:39:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJ6Jr-0001GC-Hp
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:39:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6Jq-00225F-Uc
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 11:39:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736de-2eae-0a2a0a5409dd-0a2a4503a702-2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:42 +0200
Received: from [52.101.66.96]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736de-fae8-0a2a45030019-346542601808-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:42 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8671.eurprd03.prod.outlook.com
 (2603:10a6:10:3eb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:39:40 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:39:40 +0000
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
 b=NbuZuMgZdEBkPTiPOwO8fx5oORluFe2xAwGLSnlsxqatgTEvRYA0LFS/28TfbAk8jCvv4Gb95z3B8cejqBjllJMtQJJNxs1Gidvl24yLJ3snioQFpRpujLAxd1SCjiDSp4rUW+3sOSnQkphwcO4mCsFaEJs+4KF7xu5C89xFRudn1MY+MqKUwHwKgFEllNwEulk7rr1VL0Lb7db9SqG2VezfpGpXBjCvDMJRBIb46JPc5I9s9K75SRKJrjNx3SpqyVwmwXP/R4gSVhnkoluh38x81tudkr/4x7y7kJBrgcMoDQrsyYLtXeBQtQPlf1jzCiSOb/9Nuw69bAodQa8Fjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSH/shLHqfzfi6a2PE83Muqm7Z4QFle5WSXa99NiJOg=;
 b=jNEAcOMC0WLo031x5/GLOqDZUYr0EDAvOzeO/NV2I/Nr3oBxzYvR7U4L4GwBrDcUD3DS96Y//uT2sWWAoEgvQoIamMfQXqHVHFhSpYB3Lwq7AxX8+AsdduB8yc1R3mEaOZ1UGd6++Tlr1pUx0WY+FtSBZS/XaSByq2MVmugqW4axEmtD0wJMNYTT9/mMJhmHAOE4Qo5lBcRkclznSLu+FhFJ009KUf/L6N4KV+Am6sBYbykBKGAiKUs2dyBVxcDwe7AsKSdISm153307nYbwAbTKvliCD0IzOVEh+qM1HOIlpOVZHzHGgNjR3HPCGqtjTYi06HL81VvU+HkerCOtUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSH/shLHqfzfi6a2PE83Muqm7Z4QFle5WSXa99NiJOg=;
 b=UbqcFC858lLj713eP8AmfRzkgX8WYPAlwh9x4gRaTx2tWDiTJ8hGB64k3SytnCC4QLYjeT3oOqTBdkAbT4v1V/GAtBaaYZgKI7Tkz1mwpVUaqYSEAW+1FvlB/gft5n9W+b4Aljp08s9MpR4tJ8tuHX0sptBVwAcSawcJDtPIuAjWz1+Nsxv/m7bUpoVEsQOH0gwWip4qVn8ZDP9a+aFj3bA7hzxjQNo60DaywtR1u0EmcVlqVX9QaSDwVfbMHPA7WmS2uPRlVksTGEAdeQPzvknbx8+C9KStiAvqFbY1cFt46cRMJWudXLgYLcXaN2c6d6u3Dm17D/Xj/UesECTWdQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 3/6] Kconfig: Make cpu hotplug configurable
Thread-Topic: [PATCH v10 3/6] Kconfig: Make cpu hotplug configurable
Thread-Index: AQHdYHbowdij+hqO0Eqr0KOoURLsZA==
Date: Tue, 20 Oct 2026 09:39:31 +0000
Message-ID:
 <819a5c697e06e45115a330fc2907fbfd4d166ea1.1792480416.git.mykyta_poturai@epam.com>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1792480416.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8671:EE_
x-ms-office365-filtering-correlation-id: 6136018a-55cc-4078-3774-08df2e8e107d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10063799003|18002099003|10067099003|22082099003|11063799006|38070700021|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 Yt9kSoAFaOVmOzdiKFIBHM5jJrIq8+cfn2LLq+jjFiFCcW023qCtfuvhlok5phzIbAv+83vWgG00B8SGNrtYpUhUdLiTLAwQ1iQT+ORSbGug+LsIaTwBhOnSK/yUamzjiYMTsALp1nGCfcpUmN9WrTtwiY3PyGXSWFeCeaPbi6pAyd+hkO7VUjrl4pQWT2adHqLGhZBEwJkmD/kuqkjVed0nVNyTw4uHwx63r+5aiRWqho7c2+0y3vfxtwrxIFd/97na2L2eIJJ2BTjKYunVxxYIgwZfx6qQT6DKUHyYtkVJzMMgwNEbcipnaz8vsQI9vvl1qUF8WfAvStF0CVnosoJYkS6s6LJycij9S5IxHnAGw3iUtlRq/RMSpHgIHgbGpHe8eFdWH7T88k30gPHXRSAObFLj51DI/E+yHvhya3eCzPnG2BjAjpCmGDxr+0bRgCcrv6Xc/BEjeI6F9R+gjNrMrXILnyt/urbOUDFBGe5c60AEz3pSiWnQ1/lrbYbg82U4eqznCRDu13KmkXA1g3eMiE1qpwow2RtOrKU1omrI+4ORBy6Xuh3SB+iYBhF3tURNrwe+4wzm6vlLpxf/MML8TLBXAgDYuI5xPjvp37WwqHfuS9IkJ0ZJHo0zioU9h4PC1BBc/Nk7lfcFN2DP3o4teXPIoLc9IO5Ju1IY9tsi85BlAQ3V4mXDA7hne8mX9KF0Ra09jCYe3J7iVwIx9FNcuTgD8QdAcnFmUc/SBpU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10063799003)(18002099003)(10067099003)(22082099003)(11063799006)(38070700021)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TBHzOGCSrh1MXo4Fg697ioI22eL8aEcMPHvsIexDnRdeJtTaQPJKyoIROy?=
 =?iso-8859-1?Q?6BG7fHAn7eRtwKTzqvY3q8tkfjaW+rPdSbCAHrG6JPqvLhC/FGsvy6Z5sO?=
 =?iso-8859-1?Q?Da0fHxhhg8Tu1am+0ZH4A1yjamAaCy5RXQ0gVGr1i8CODH9ZEPONfWqfBA?=
 =?iso-8859-1?Q?sWQlZCEsyocuv9ly3QZpv69p4JhD15wIBreKoOM8TL9XThI/0GJuOsYyca?=
 =?iso-8859-1?Q?aUT9Db7fjoWBfpYxhFgh/1f0Z6UdZ6Ioy3qx9eUdr5NzejtpQOjUQ7d7US?=
 =?iso-8859-1?Q?jJIzfJ8FLBqY4CiIpZONM2KSCh/a90HRwmrzbhTLsPlLPaHIZK9DBnoWF5?=
 =?iso-8859-1?Q?814scnuLvG5RJhgb7wZ+XkEDXMpzBrzFYLFFWtbS6n+EISHqeD1LSKT0Wq?=
 =?iso-8859-1?Q?2hzxsIDal5QPe/uL8L36dF3/h19Yqg7QAISP56Zd2153QJSBEBBxYF9kE5?=
 =?iso-8859-1?Q?eAd+tcqBtcYjrFFRlwwlMMxSswJKREu3EbyBQpDFACOAnk03p/75htYuVe?=
 =?iso-8859-1?Q?jjOiANwiA5KZODF+NgMUnQKOYt0A0nAfg3xZWqEDJEhK/KPNKsFxem0ozl?=
 =?iso-8859-1?Q?WV97r/pCYdPvPtY9C4VjB5GqbYg9T+Z6tSwu01utdOKMG6L1NEtw7t2Xio?=
 =?iso-8859-1?Q?D6rj31fKai4sSQ1/e88iIKd7Xekz09TV1MODWiPun5t+0CpJ+WEjkspX0Q?=
 =?iso-8859-1?Q?HeUBnBq9SYAVbehnirogvfEY36b0kdLxjMNaDnAL5oXM7ypFM/OVGr0oIM?=
 =?iso-8859-1?Q?BkWiP22RSsCc7Drl8Zzufwg+3jbvqodtSTLqqv2/vOJMuSezjCUji0UW9S?=
 =?iso-8859-1?Q?mF6LMfMa/1/OvzPWOG6IsMTWj3mhkSqKS8VzhEccubJ6tQhEGEMnKCFujU?=
 =?iso-8859-1?Q?XL5HKlpeAuALzsjPyF0VdTRlF3cRlGxx39qlMfJekmyfmcG8Nt1JMjSH62?=
 =?iso-8859-1?Q?cc/zgO/g0dTkatPTPP7ODiL2EuOn0WJHf+7OQMZXDKqcdsuRl3DZvn71i3?=
 =?iso-8859-1?Q?SfeEdZbcXsLYWFWCMAUNDDlwDpVaIlHQeL0qYSPmvJfVNSMY3KaVBngysb?=
 =?iso-8859-1?Q?xvWEzc4aqqlcjSQDQHIIGeBERhybtaaKhx2RqrjmXJByo5upDot9ZotFeV?=
 =?iso-8859-1?Q?NLug9qGWx/5YH3hB2snn34Wi/wdeMAHj+Q4E3TGfr9vxtqT0afGit18lqX?=
 =?iso-8859-1?Q?uwnOPwTxEFlFzjr5+WgCxpWqpzzlhnYJ1qsECH5qV1yPNq2pmA/MfnQmTV?=
 =?iso-8859-1?Q?VDrGBSjdNDkkpOWtcWOsj6QbFaD95TkDFcgFW8yWDNlIn10Tqkot2R2TsV?=
 =?iso-8859-1?Q?JXS/g5fOuBAxVuuFwJDNaosYHm+pTy1Gsm0u0T7qhTRE8l9KVjGM37li7x?=
 =?iso-8859-1?Q?JKJtnczK1nKSd7KT5quD84pcafgJSww8jJtbOXSMjvLgn4LaSJhePEUzVM?=
 =?iso-8859-1?Q?91OCu0eOrpZeISd6cYP6fRI3EmS0OmsNrhM51j6sHIeynS4Ohf7GbF2ftW?=
 =?iso-8859-1?Q?z3GCwrPhkjpmVTqqGjPhUl0bQ2a6Lr5SR/AQW7sGswSx7EpovzMBHdhD3r?=
 =?iso-8859-1?Q?UV6nYkbAf1x9TzvG9hMwdje77jpHpfy1tDOh5zCOgnx4i8td9UnBZRBWvc?=
 =?iso-8859-1?Q?N6LDly3FZ01XXwK24Skwt5VaSXcAiC2gpTc9voWJA0scu8rgxrbYCEw1q6?=
 =?iso-8859-1?Q?RRgE6mJnvg00iW9h9X+sLH2Ud9MQ4c+QGORtPX9M7U4sf1Cqq+mPWXrNMJ?=
 =?iso-8859-1?Q?Z4OT4uSmen0HFnSzkB6V/GW0S43GDBDqYs4ZlxWYvOP7+uP18qlYerRWvR?=
 =?iso-8859-1?Q?m0N5AmfMnQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6136018a-55cc-4078-3774-08df2e8e107d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 09:39:31.1802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGnvaSqbWyWfQQ03iMVhig5RWTGc9ybHb5y7CoKKJCWnZElJKlxvggq48E+MMzFtBF7ccdiZjSxNzXBwz7ijDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8671
X-purgate-ID: tlsNG-33051d/1792489182-6C2E04E9-AB417C26/10/78276251493
X-purgate-type: spam
X-purgate-size: 3686
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For the purposes of certification, we want as little code as possible to
be unconditionally compiled in. Make CPU hotplug and SMT operations
configurable to ease the process. This will also help with introducing
CPU hotplug on Arm, where it needs to be configurable.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v9->v10:
* no changes

v8->v9:
* add "if EXPERT"
* add AB

v7->v8:
* fix style
* s/CPU_HOTPLUG/CPU_ONLINE_OFFLINE/

v6->v7:
* new patch
---
 xen/arch/x86/platform_hypercall.c | 12 ++++++++++++
 xen/arch/x86/smp.c                |  3 +++
 xen/arch/x86/sysctl.c             | 12 ++++++++++++
 xen/common/Kconfig                |  8 ++++++++
 4 files changed, 35 insertions(+)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hype=
rcall.c
index 6dee4922f3..361a4cd37a 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -735,6 +735,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         if ( cpu >=3D nr_cpu_ids || !cpu_present(cpu) ||
              clocksource_is_tsc() )
         {
@@ -757,6 +763,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         if ( cpu =3D=3D 0 )
         {
             ret =3D -EOPNOTSUPP;
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index ae4e5a66d7..e3c4c0d5e0 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -416,6 +416,7 @@ void cf_check call_function_interrupt(void)
     smp_call_function_interrupt();
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
 long cf_check cpu_up_helper(void *data)
 {
     unsigned int cpu =3D (unsigned long)data;
@@ -443,8 +444,10 @@ long cf_check cpu_down_helper(void *data)
 {
     int cpu =3D (unsigned long)data;
     int ret =3D cpu_down(cpu);
+
     /* Have one more go on EBUSY. */
     if ( ret =3D=3D -EBUSY )
         ret =3D cpu_down(cpu);
     return ret;
 }
+#endif
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 6bd4e191a7..10d485e633 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -53,6 +53,12 @@ static long cf_check smt_up_down_helper(void *data)
     unsigned int cpu, sibling_mask =3D boot_cpu_data.x86_num_siblings - 1;
     int ret =3D 0;
=20
+    if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+    {
+        ASSERT_UNREACHABLE();
+        return -EOPNOTSUPP;
+    }
+
     opt_smt =3D up;
=20
     for_each_present_cpu ( cpu )
@@ -120,6 +126,12 @@ long arch_do_sysctl(
         long (*fn)(void *data);
         void *hcpu;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b289e444f..5713dc1f9c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -646,6 +646,14 @@ config SYSTEM_SUSPEND
=20
 	  If unsure, say N.
=20
+config CPU_ONLINE_OFFLINE
+	bool "CPU online/offline support" if EXPERT
+	depends on X86
+	default y
+	help
+	  Enable support for bringing CPUs online and offline at runtime. On
+	  X86 this is required for disabling SMT.
+
 menu "Supported hypercall interfaces"
 	visible if EXPERT
=20
--=20
2.55.0

