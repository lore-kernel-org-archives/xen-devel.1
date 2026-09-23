Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000B7C98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:36:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430917.1653323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P1L-0001P7-Vh; Wed, 23 Sep 2026 15:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430917.1653323; Wed, 23 Sep 2026 15:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P1L-0001Oy-SU; Wed, 23 Sep 2026 15:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1430917;
 Wed, 23 Sep 2026 15:36:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x9P1K-0001Oq-L2
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:36:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9P1K-009bkY-1Y
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:36:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ab3f1d7-bab6-0a2a0a5309dd-0a2a4504c198-32
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:36:29 +0200
Received: from [52.101.66.50]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ab3f1fc-b57f-0a2a45040019-346542320ead-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:36:29 +0200
Received: from DU7P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::12)
 by DU0PR08MB7461.eurprd08.prod.outlook.com (2603:10a6:10:354::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 15:36:21 +0000
Received: from MAD0EPF000008AB.eurprd04.prod.outlook.com
 (2603:10a6:10:54d:cafe::a9) by DU7P195CA0029.outlook.office365.com
 (2603:10a6:10:54d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 15:36:20 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008AB.mail.protection.outlook.com (10.167.241.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 15:36:20 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB4PR08MB8199.eurprd08.prod.outlook.com (2603:10a6:10:381::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 15:35:48 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 15:35:47 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gJaVQoq1iE/YxRGDYLCcXPaKlsfFzgo1wpOnwueDzGDRFs20dMLw8q4JZOZ9wsrVF0e/pOFBuhwFHrVfMfuvYiKtM7DoZSM+mxHvs4Il/WaRr5P8sAWwgAcvtxVfRI/T6TFRQMYHJdUDuTlOAM99GAZEsBmC5eDB2ZG2+sPzEoHA7dKgvhBBS5yiTzcOKIM2LOI0OdhR0deOkmQhnEh3rkLt8/82cQiRxQuab7kWSDrHLfN7e77IMG0xL2FTfPruzvYMkxMTobJVuG21jspN12QlwGCQBsfd1i6U2OZL+yXBqGpmbpb3LjrTwcbeMXuHMcBCFa70OFuVI9iiYenP2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HA6H5Lbqp1/jEz1rrSO74xcs2U73mWUnuGOQt/8Wfzo=;
 b=W+eEr/MgEuZKUIbZ7518il6wX8v9Xn3ISzDVIKuQF2d3yEQtxAWpWDFBnHwV2Q3N31WBHaQA06TBydiNW6/e9OtiG+Aw26ci6E5tAA3L5cBPTz5j3hda81vliIUTRYZGlbQUudJgekegvbeg03NvctwmIJorjJ+N1ge0zKKSooT5/WIkgW5K+gzOqhSou/3b9B9bH9NtamSAwVvGrj+NuCgRI/uYIt/s2ObRSEIBwMJ6IpPqpoiQyMdvZPHjAlIrQqKY8ICpmdyieuXOXFv5AzQB7vd4p+7z0P2qhGepWSPgw9K6HBwrtEquGXLXvCprWwfy+KfvR6v5dYSN1He5Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA6H5Lbqp1/jEz1rrSO74xcs2U73mWUnuGOQt/8Wfzo=;
 b=bnnqv1E+chaJGw3cN6wXrPBKTOA48ODkOcUXxkp6nyvwK1wLSY+dus8tN8OOpWUw78ngrmeofGxlThqTqk9rwrTfhrPbf/Bnc8IHffXyyMJAr6c/4+hOxj/wgdlf0B6OnFz87VR9Q+5mOFMe4iqZb8/MVP4490zxpGrdKik6j5Y=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ob4F24hXvaesML8or7HBAsoZeyjgZFwE6NOxyWygRFJN/ywn200SFIfXRMIT8Nlnvtd7eVAdd/iWk5e/9zgweI9Bmr5TPVouRVLR7uXRyZrozKdjSY3LJb8R3uxvBs1JLmDERai7OJoFNvlwdg9srBQIshtf9Zro4vX3WSmY/VvLklvlhHz/6Me5HHQjHMo1Hh8ECQ9U4W7SIeE9m689r8z3xcv7P7QE8f0yRyVa7Pyfa18+d9b8cPmgrnp8jEa9l9FxdeAoKtjdI33uo9Mi8ITzNzF0j9oC93Mdxff4UPFY3YTaNmYFxvdd2kQ04NmjkkG7eLAqjjXudIC8rDBTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HA6H5Lbqp1/jEz1rrSO74xcs2U73mWUnuGOQt/8Wfzo=;
 b=TGajbvVGh+/diEBZe+vVXVr/VzW7NNbu0TNohquzX+f3BLmbD50eCr6WQefwy+qV4DiPS7cH05+CP0iBVQ9oCirUEuP68uCoUAeotEkWqn5/ExlbjE5Gzs1UBDSnHDGlRSaK+sCREcmHGu/X3ZAPNh/xYSWT0l/ieGRH14/DzGcF66EjXwPRcgRUZhfIR855qoUgm00QjOJkYsRzfWArlbn1eMTqZD6wk2QXYc1nzzkQ7o8pT9gHr9p7igsvp+GdDUVybKu8N/w8YxLQkN1KbM3+MVD5NYZo/ys67eJu8mAwyrszjZKBF0hDYIe9pDuVxc5QdxPXv5CLAr0SrTbE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA6H5Lbqp1/jEz1rrSO74xcs2U73mWUnuGOQt/8Wfzo=;
 b=bnnqv1E+chaJGw3cN6wXrPBKTOA48ODkOcUXxkp6nyvwK1wLSY+dus8tN8OOpWUw78ngrmeofGxlThqTqk9rwrTfhrPbf/Bnc8IHffXyyMJAr6c/4+hOxj/wgdlf0B6OnFz87VR9Q+5mOFMe4iqZb8/MVP4490zxpGrdKik6j5Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v12 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
Thread-Topic: [PATCH v12 04/13] xen/arm: gic-v3: Implement GICv3
 suspend/resume functions
Thread-Index: AQHdNjDlfHyU+mM4Q02Y6q8l8URxnLbcdfqA
Date: Wed, 23 Sep 2026 15:35:47 +0000
Message-ID: <FFAA90D5-0507-44D5-AE59-127955BD4586@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <1f311886ad3162f59749210c7dce26f9d089d010.1787838455.git.mykola_kvach@epam.com>
In-Reply-To:
 <1f311886ad3162f59749210c7dce26f9d089d010.1787838455.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB4PR08MB8199:EE_|MAD0EPF000008AB:EE_|DU0PR08MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 795d81b5-da79-4efc-ca97-08df19886a92
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|4143699003|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 71BqpSx8lw/shhRP/feg1dbEiCYO173ox7BmW680LwegfFE1/4qDS6+x82Un1ccfJ5DMiBZHlQZLFOwMBG4cNeGryFWQuqPKfL5vnggw/WUTYV/KczCnUSJKe2cKMvR588wzxQSuWFsOxqqb2N6U+pP/Jb7nrHsxwjtGPTPhiqX8znafzOWVz/65T27yS6qI/0elrwcuykH+85mzY5OhPBkoFgicUovshbaCUJCA1Pr5gtyA7HThF2DHfbgDRmOvkE/w4Ue/mjUvbrwG0Wu6TSg6AY8TZ34pYMFUx2CWLzrqjJUBuaCGV6cSJ8Q5MT2c9AThpMyTpsSkc2UkZRRtR+x9GZHF50o5RBO2KgILmuWkuKN1pcFYLwonKsrcnK18UR4FY1Wk9TO/kJsiNkrdF6A6SLe2UXVlcNjdY7lhk5U57tpV0P6nPNhkcuYhoIPP0AGdVedMXB4Bj1miHP9lriyeZsv8ib05bbf9gvJ5Opqe1ckM7GnS5/KgwEn1S2Rw+h+nZjH44KS28hL7aGh21orikSWplTpV5K8iRP6s3FyTmcA/7tMp8sS0okskiEHqaNL8Q7LNhF3e5j7pYe6mNzS6AYAiE9faSccTEKsJ080QXw90ebl/TIgdeRIAu0UzrJsJ1G8pjhvb7IHUBP+t8mEm+vx8yw2rFuOliFzpsPsW21rtOUTaKEGiGUi8iNnoXHb+u4fn+1tI4yUbY6m74HhjvHBDi6Wm+Z5Zf+WWxtg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5A0C7CB6FEDD084181EC2D91B18A8A2A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 hLNx7sBSNxTVjb+p9q1zzyMkSuH4Qu4uI2QECUGJmgBmW2/W32XFZIw2xMvP1cTbZv88LqeObkQyeaLK4YtAdiIB22s2Dt46CgLrZgIL3fKyaT9LwEzLDJ5N1mKNkNuyf6rHAplRJ546LGr2ThPaRXgmxx+TYBwNfNq0o6POL0fX3l1+ENS0zufE6gjDSbeh0m2x5fD29YRaJdPCZwHQiu0ElzzBQFgJRPt8Ip5G/iqDXJZdBSlVr9WRZHgw4XmE+V2/D4ntHJOwA3QI/S1exW/TRofUnX4dmsnCsjEbWTDFz6cX9mPkfcFrgClurxUYStHqpTYbztBTyv5B9o53ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8199
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008AB.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	707f074d-5ed7-40fa-7fab-08df1988572e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|36860700016|1800799024|35042699022|376014|23010399003|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	AqAwo1Nns62OSIHxQpbaYCOfz+eHiKTV/vVisDU2uN2U287LMoqMUWg9hcn+UxDSzFmk3Vv6PniQhYntrEhORnmghVn7tVPPwZGHGr6g6pwAL8EyOa47QMxFlZk6pcybmKWogLNhPVqFozvk/69mFPvbym44zgM864jnmiUqNGqvQwlnuCNWKIBFYxXzKlkQufvxDQK3yj2MY98BjegH2PA1d3JzNis18920j7J28pNnCSGswJ3oR8vPKS+nEyGwIclQIqr45VVHLc8vsXE4McSiAyH8T2D6+ps69FNhuimWOsNm5mNv88Ci6siX8xpLOcCs7JlvTY4xGcFQAzASGL+Z+qVNfWhpbqtW2JRClgC+tOdA0YVnaOviT1PxGjNfiojPdxf956LCNu81NMErumTANbjakkNou8jaEJ9cWPdD//3VUTw67WP3NpBEofXIOPVUfPThqL+K/e1FTOB7TytLHLqXUWhg1IKDz+o3XPcVj5MoymxocXnNjati7NBgceBj60SOXzretywHIky+LO9z7kuz0UQKhZoxjyG+ShzTwv4zjhKAzBAnVzK3GNKhJSb+OAGxJE1L7OuAfxS+c6jNHQX/YXx0CcSDTP8Inti2BqCDBGO75nTzhCblkkKvS1WGESVSyhNGu3cUhVgmexKlSfxeppKKlZnMwmlt+I/yMtXoEC1E1WgCqJWPG+AXdl9E2+DC190/tzWhGrVsHw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700016)(1800799024)(35042699022)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O7jVVsEcbn7QuMOAdRfhbUAuDKql6c5sLaaE4Fr2GMZwKaHCT8L2oic+sc5GqwLr7mDidV/f5NJtv0nVxWulRAL97f3sB69F1dKRE73aag1/tbflGPwMtiejONwbaGTGPGdozGo280Tb0jVkMXq5eD+uPJm34OyLtNbNXINvkFrYfpv6w9TeS6xnpQYbPGhHnI9Xh1KCpQe/X1IqFtKmCaygiiSYKblJxY3PlmAESHpMypiH/JksPhRAF63V5FmBC71hj82FXxKMn1YhAecoZv/wle3W0C7cHA8d9hMMglVLKBvrPvV8Pa91VsmCxAm9040vSYoHLblymYYbH8ach6fgd7hkZTXv0EI3PPWFaip/LQIPePGwgoyoDze6T6Yr7jGYsE9ksMGH7KfBABp+aBRtv5cP8cvA4R4X6XkSVQ2sT9oxXgumaWGcbDStNNZW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:36:20.2299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 795d81b5-da79-4efc-ca97-08df19886a92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AB.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7461
X-purgate-ID: tlsNG-ebf023/1790177789-C34C3B50-F015FFF9/0/0
X-purgate-type: clean
X-purgate-size: 23235

Hi Mykola,

> On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
>=20
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
>=20
> Before continuing suspend, also verify that the physical CPU interface
> has no Group 1 active-priority state left. Use ICC_CTLR_EL1.PRIbits to
> decide which ICC_AP1R<n>_EL1 registers are implemented, so Xen does not
> read an unimplemented AP1R register.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in V10:
> - abort suspend when the physical Group 1 active-priority state is still
>  present, deriving accessible ICC_AP1R<n>_EL1 registers from
>  ICC_CTLR_EL1.PRIbits;
> - re-enable the redistributor before restoring CPU and virtual interface
>  state on the suspend abort path;
> - panic if the redistributor cannot be re-enabled on the suspend abort pa=
th;
> - avoid saving/restoring reserved GICD_IPRIORITYR and GICD_IROUTER entrie=
s
>  for a partially populated last SPI block;
> - disable Distributor group forwarding while preserving affinity routing
>  state before restoring Distributor configuration;
> - disable SPI/eSPI forwarding and wait for RWP before restoring
>  GICD_ICFGR<n>.Int_config.
>=20
> Changes in V9:
> - fix the suspend-context comment typo and split dist_ctx declarations;
> - restore ICC_IGRPEN1_EL1 on the suspend error path;
> - re-initialize GICD_IGROUPRnE during resume;
> - restore GICD_IROUTER only after re-enabling ARE_NS during resume.
>=20
> Changes in V8:
> - use right rdist base for prop/pend baser and ctrl
>=20
> Changes in V7:
> - restore LPI regs on resume
> - add timeout during redist disabling
> - squash with suspend/resume handling for GICv3 eSPI registers
> - drop ITS guard paths so suspend/resume always runs; switch missing ctx
>  allocation to panic
> - trim TODO comments; narrow redistributor storage to PPI icfgr
> - keep distributor context allocation even without ITS; adjust resume
>  to use GENMASK(31, 0) for clearing enables
> - drop storage of the SGI configuration register, as SGIs are always
>  edge-triggered
> ---
> xen/arch/arm/gic-v3-lpi.c                |   3 +
> xen/arch/arm/gic-v3.c                    | 458 ++++++++++++++++++++++-
> xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
> xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
> 4 files changed, 466 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 847da26ff7..a63c8c4979 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -467,6 +467,9 @@ static int cpu_callback(struct notifier_block *nfb, u=
nsigned long action,
>     switch ( action )
>     {
>     case CPU_UP_PREPARE:
> +        if ( system_state =3D=3D SYS_STATE_resume )
> +            break;
> +
>         rc =3D gicv3_lpi_allocate_pendtable(cpu);
>         if ( rc )
>             printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%l=
u\n",
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index b16888ad84..038bf41142 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1078,12 +1078,12 @@ out:
>     return res;
> }
>=20
> -static void gicv3_hyp_disable(void)
> +static void gicv3_hyp_enable(bool enable)
> {
>     register_t hcr;
>=20
>     hcr =3D READ_SYSREG(ICH_HCR_EL2);
> -    hcr &=3D ~GICH_HCR_EN;
> +    hcr =3D enable ? (hcr | GICH_HCR_EN) : (hcr & ~GICH_HCR_EN);
>     WRITE_SYSREG(hcr, ICH_HCR_EL2);
>     isb();
> }
> @@ -1190,7 +1190,7 @@ static void gicv3_disable_interface(void)
>     spin_lock(&gicv3.lock);
>=20
>     gicv3_cpu_disable();
> -    gicv3_hyp_disable();
> +    gicv3_hyp_enable(false);
>=20
>     spin_unlock(&gicv3.lock);
> }
> @@ -1926,6 +1926,450 @@ static bool gic_dist_supports_lpis(void)
>     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +/* This struct represents a block of 32 IRQs */
> +struct dist_irq_block {
> +    uint32_t icfgr[2];
> +    uint32_t ipriorityr[8];
> +    uint64_t irouter[32];
> +    uint32_t isactiver;
> +    uint32_t isenabler;
> +};
> +
> +struct redist_ctx {
> +    uint32_t ctlr;
> +    uint32_t icfgr; /* only PPIs stored */

Can you capitalize first comment letter ?
s/only/Only/

> +    uint32_t igroupr;
> +    uint32_t ipriorityr[8];
> +    uint32_t isactiver;
> +    uint32_t isenabler;
> +
> +    uint64_t pendbase;
> +    uint64_t propbase;
> +};
> +
> +/* GICv3 registers to be saved/restored on system suspend/resume */
> +struct gicv3_ctx {
> +    struct dist_ctx {
> +        uint32_t ctlr;
> +        struct dist_irq_block *irqs;
> +        struct dist_irq_block *espi_irqs;
> +    } dist;
> +
> +    /* have only one rdist structure for last running CPU during suspend=
 */

Same here
s/have/Have/

> +    struct redist_ctx rdist;
> +
> +    struct cpu_ctx {
> +        uint32_t ctlr;
> +        uint32_t pmr;
> +        uint32_t bpr;
> +        uint32_t sre_el2;
> +        uint32_t grpen;
> +    } cpu;
> +};
> +
> +static struct gicv3_ctx gicv3_ctx;
> +
> +static void __init gicv3_alloc_context(void)
> +{
> +    uint32_t blocks =3D DIV_ROUND_UP(gicv3_info.nr_lines, 32);
> +
> +    /* The spec allows for systems without any SPIs */
> +    if ( blocks > 1 )
> +    {
> +        gicv3_ctx.dist.irqs =3D xzalloc_array(struct dist_irq_block, blo=
cks - 1);
> +        if ( !gicv3_ctx.dist.irqs )
> +            panic("Failed to allocate memory for GICv3 suspend context\n=
");
> +    }
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( !gic_number_espis() )
> +        return;
> +
> +    blocks =3D gic_number_espis() / 32;
> +    gicv3_ctx.dist.espi_irqs =3D xzalloc_array(struct dist_irq_block, bl=
ocks);
> +    if ( !gicv3_ctx.dist.espi_irqs )
> +        panic("Failed to allocate memory for GICv3 eSPI suspend context\=
n");
> +#endif
> +}
> +
> +static int gicv3_disable_redist(void)
> +{
> +    void __iomem *waker =3D GICD_RDIST_BASE + GICR_WAKER;
> +    s_time_t deadline;
> +
> +    /*
> +     * Avoid infinite loop if Non-secure does not have access to GICR_WA=
KER.
> +     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
> +     *     When GICD_CTLR.DS =3D=3D 0 and an access is Non-secure access=
es to this
> +     *     register are RAZ/WI.
> +     */
> +    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
> +        return 0;
> +
> +    deadline =3D NOW() + MILLISECS(1000);
> +
> +    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, wak=
er);
> +    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) =3D=3D 0 =
)
> +    {
> +        if ( NOW() > deadline )
> +        {
> +            printk("GICv3: Timeout waiting for redistributor to sleep\n"=
);
> +            return -ETIMEDOUT;
> +        }
> +        cpu_relax();
> +        udelay(10);
> +    }
> +
> +    return 0;
> +}
> +
> +#define GET_SPI_REG_OFFSET(name, is_espi) \
> +    ((is_espi) ? GICD_##name##nE : GICD_##name)
> +
> +static void gicv3_store_spi_irq_block(struct dist_irq_block *irqs,
> +                                      unsigned int i, unsigned int nr_ir=
qs,
> +                                      bool is_espi)
> +{
> +    void __iomem *base;
> +    unsigned int irq, nr_priority_regs;
> +
> +    ASSERT(nr_irqs && nr_irqs <=3D 32);
> +    nr_priority_regs =3D DIV_ROUND_UP(nr_irqs, 4);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs=
->icfgr);
> +    irqs->icfgr[0] =3D readl_relaxed(base);
> +    irqs->icfgr[1] =3D readl_relaxed(base + 4);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
> +    base +=3D i * sizeof(irqs->ipriorityr);
> +    for ( irq =3D 0; irq < nr_priority_regs; irq++ )
> +        irqs->ipriorityr[irq] =3D readl_relaxed(base + 4 * irq);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
> +    base +=3D i * sizeof(irqs->irouter);
> +    for ( irq =3D 0; irq < nr_irqs; irq++ )
> +        irqs->irouter[irq] =3D readq_relaxed_non_atomic(base + 8 * irq);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
> +    base +=3D i * sizeof(irqs->isactiver);
> +    irqs->isactiver =3D readl_relaxed(base);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
> +    base +=3D i * sizeof(irqs->isenabler);
> +    irqs->isenabler =3D readl_relaxed(base);
> +}
> +
> +static void gicv3_restore_spi_irq_config(struct dist_irq_block *irqs,
> +                                         unsigned int i, unsigned int nr=
_irqs,
> +                                         bool is_espi)
> +{
> +    void __iomem *base;
> +    unsigned int irq, nr_priority_regs;
> +
> +    ASSERT(nr_irqs && nr_irqs <=3D 32);
> +    nr_priority_regs =3D DIV_ROUND_UP(nr_irqs, 4);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs=
->icfgr);
> +    writel_relaxed(irqs->icfgr[0], base);
> +    writel_relaxed(irqs->icfgr[1], base + 4);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
> +    base +=3D i * sizeof(irqs->ipriorityr);
> +    for ( irq =3D 0; irq < nr_priority_regs; irq++ )
> +        writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
> +}
> +
> +static void gicv3_restore_spi_irq_routing(struct dist_irq_block *irqs,
> +                                          unsigned int i, unsigned int n=
r_irqs,
> +                                          bool is_espi)
> +{
> +    void __iomem *base;
> +    unsigned int irq;
> +
> +    ASSERT(nr_irqs && nr_irqs <=3D 32);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
> +    base +=3D i * sizeof(irqs->irouter);
> +    for ( irq =3D 0; irq < nr_irqs; irq++ )
> +        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
> +}
> +
> +static void gicv3_disable_spi_irq_block(unsigned int i, bool is_espi)
> +{
> +    void __iomem *base;
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(ICENABLER, is_espi) + i * 4;
> +    writel_relaxed(GENMASK(31, 0), base);
> +}
> +
> +static void gicv3_restore_spi_irq_state(struct dist_irq_block *irqs,
> +                                        unsigned int i, bool is_espi)
> +{
> +    void __iomem *base;
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
> +    base +=3D i * sizeof(irqs->isenabler);
> +    writel_relaxed(irqs->isenabler, base);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(ICACTIVER, is_espi) + i * 4;
> +    writel_relaxed(GENMASK(31, 0), base);
> +
> +    base =3D GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
> +    base +=3D i * sizeof(irqs->isactiver);
> +    writel_relaxed(irqs->isactiver, base);
> +}
> +
> +static int gicv3_check_ap1r(unsigned int n, register_t apr)
> +{
> +    if ( !apr )
> +        return 0;
> +
> +    printk(XENLOG_ERR "GICv3: suspend aborted: ICC_AP1R%u_EL1=3D%#"
> +           PRIregister"\n", n, apr);
> +
> +    return -EBUSY;
> +}
> +
> +static int gicv3_check_active_priorities(register_t ctlr)
> +{
> +    unsigned int pribits =3D MASK_EXTR(ctlr, ICC_CTLR_EL1_PRIBITS_MASK) =
+ 1;
> +    int ret;
> +
> +    /*
> +     * Xen enables physical Group 1 interrupts through ICC_IGRPEN1_EL1,
> +     * so only the physical Group 1 active-priority registers are releva=
nt
> +     * here. Use ICC_CTLR_EL1.PRIbits for the physical CPU interface, no=
t
> +     * ICH_VTR_EL2, which describes the virtual interface. ICC_AP1R1_EL1=
 is
> +     * only implemented with at least 6 physical priority bits, and
> +     * ICC_AP1R2_EL1/ICC_AP1R3_EL1 with at least 7.
> +     */
> +    switch ( pribits )
> +    {
> +    case 8:
> +    case 7:
> +        ret =3D gicv3_check_ap1r(3, READ_SYSREG(ICC_AP1R3_EL1));
> +        if ( ret )
> +            return ret;
> +        ret =3D gicv3_check_ap1r(2, READ_SYSREG(ICC_AP1R2_EL1));
> +        if ( ret )
> +            return ret;
> +        /* Fall through */
> +    case 6:
> +        ret =3D gicv3_check_ap1r(1, READ_SYSREG(ICC_AP1R1_EL1));
> +        if ( ret )
> +            return ret;
> +        /* Fall through */
> +    default:
> +        return gicv3_check_ap1r(0, READ_SYSREG(ICC_AP1R0_EL1));
> +    }
> +}
> +
> +static int gicv3_suspend(void)
> +{
> +    unsigned int i, nr_irqs;
> +    void __iomem *base;
> +    int ret;
> +    struct redist_ctx *rdist =3D &gicv3_ctx.rdist;
> +
> +    /* Save GICC configuration */
> +    gicv3_ctx.cpu.ctlr     =3D READ_SYSREG(ICC_CTLR_EL1);
> +    gicv3_ctx.cpu.pmr      =3D READ_SYSREG(ICC_PMR_EL1);
> +    gicv3_ctx.cpu.bpr      =3D READ_SYSREG(ICC_BPR1_EL1);
> +    gicv3_ctx.cpu.sre_el2  =3D READ_SYSREG(ICC_SRE_EL2);
> +    gicv3_ctx.cpu.grpen    =3D READ_SYSREG(ICC_IGRPEN1_EL1);
> +
> +    gicv3_disable_interface();
> +
> +    ret =3D gicv3_check_active_priorities(gicv3_ctx.cpu.ctlr);
> +    if ( ret )
> +        goto out_enable_iface;
> +
> +    ret =3D gicv3_disable_redist();
> +    if ( ret )
> +        goto out_enable_iface;

I am wondering about the timeout case here.=20

gicv3_disable_redist() has set ProcessorSleep to 1, but returns while
ChildrenAsleep is still 0.
This new error path then calls gicv3_enable_redist(), which clears
ProcessorSleep.=20

Could that happen before ChildrenAsleep reaches 1?=20
The GIC specification says that transition is UNPREDICTABLE.=20
How should we handle the timeout?

> +
> +    /* Save GICR configuration */
> +    gicv3_redist_wait_for_rwp();
> +
> +    base =3D GICD_RDIST_BASE;
> +
> +    rdist->ctlr =3D readl_relaxed(base + GICR_CTLR);
> +
> +    rdist->propbase =3D readq_relaxed(base + GICR_PROPBASER);
> +    rdist->pendbase =3D readq_relaxed(base + GICR_PENDBASER);
> +
> +    base =3D GICD_RDIST_SGI_BASE;
> +
> +    /* Save priority on PPI and SGI interrupts */
> +    for ( i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
> +        rdist->ipriorityr[i] =3D readl_relaxed(base + GICR_IPRIORITYR0 +=
 4 * i);
> +
> +    rdist->isactiver =3D readl_relaxed(base + GICR_ISACTIVER0);
> +    rdist->isenabler =3D readl_relaxed(base + GICR_ISENABLER0);
> +    rdist->igroupr   =3D readl_relaxed(base + GICR_IGROUPR0);
> +    rdist->icfgr     =3D readl_relaxed(base + GICR_ICFGR1);
> +
> +    /* Save GICD configuration */
> +    gicv3_dist_wait_for_rwp();
> +    gicv3_ctx.dist.ctlr =3D readl_relaxed(GICD + GICD_CTLR);
> +
> +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> +    {
> +        nr_irqs =3D min(32U, gicv3_info.nr_lines - i * 32);
> +        gicv3_store_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, nr_irq=
s,
> +                                  false);
> +    }
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> +        gicv3_store_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, 32, t=
rue);
> +#endif
> +
> +    return 0;
> +
> + out_enable_iface:
> +    if ( gicv3_enable_redist() )
> +        panic("GICv3: Failed to re-enable redistributor after suspend ab=
ort\n");
> +
> +    gicv3_hyp_enable(true);
> +    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
> +    isb();
> +
> +    return ret;
> +}
> +
> +static void gicv3_resume(void)
> +{
> +    int ret;
> +    unsigned int i, nr_irqs;
> +    uint32_t dist_ctlr;
> +    void __iomem *base;
> +    struct redist_ctx *rdist =3D &gicv3_ctx.rdist;
> +
> +    dist_ctlr =3D gicv3_ctx.dist.ctlr & GICD_CTLR_ARE_NS;
> +
> +    /* Disable group forwarding while preserving affinity routing state.=
 */
> +    writel_relaxed(dist_ctlr, GICD + GICD_CTLR);
> +    gicv3_dist_wait_for_rwp();
> +
> +    /*
> +     * IHI0069H.b 12.9.9 says changing GICD_ICFGR<n>.Int_config
> +     * while the interrupt is individually enabled is UNPREDICTABLE.
> +     * Disable SPIs first; 4.7.1 defines GICD_ICENABLER<n>, n > 0,
> +     * as the per-SPI disable mechanism.
> +     */
> +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> +        gicv3_disable_spi_irq_block(i, false);
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> +        gicv3_disable_spi_irq_block(i, true);
> +#endif
> +
> +    gicv3_dist_wait_for_rwp();
> +
> +    for ( i =3D NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i +=3D 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * =
4);
> +
> +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> +    {
> +        nr_irqs =3D min(32U, gicv3_info.nr_lines - i * 32);
> +        gicv3_restore_spi_irq_config(gicv3_ctx.dist.irqs + i - 1, i, nr_=
irqs,
> +                                     false);
> +    }
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> +    {
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + i * 4);
> +        gicv3_restore_spi_irq_config(gicv3_ctx.dist.espi_irqs + i, i, 32=
,
> +                                     true);
> +    }
> +#endif
> +
> +    if ( dist_ctlr )
> +    {
> +        for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> +        {
> +            nr_irqs =3D min(32U, gicv3_info.nr_lines - i * 32);
> +            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.irqs + i - 1, i=
,
> +                                          nr_irqs, false);
> +        }
> +
> +#ifdef CONFIG_GICV3_ESPI
> +        for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> +            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.espi_irqs + i, =
i,
> +                                          32, true);
> +#endif
> +    }
> +
> +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> +        gicv3_restore_spi_irq_state(gicv3_ctx.dist.irqs + i - 1, i, fals=
e);
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> +        gicv3_restore_spi_irq_state(gicv3_ctx.dist.espi_irqs + i, i, tru=
e);
> +#endif
> +
> +    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
> +    gicv3_dist_wait_for_rwp();
> +
> +    ret =3D gicv3_lpi_init_rdist(GICD_RDIST_BASE);
> +    /*
> +     * If LPIs are already enabled, assume firmware or the still-powered
> +     * redistributor has valid PROPBASER/PENDBASER and skip reprogrammin=
g.
> +     * Return -EBUSY so callers can ignore this case.
> +     */
> +    if ( ret && ret !=3D -ENODEV && ret !=3D -EBUSY )
> +        panic("GICv3: Failed to re-initialize LPIs during resume\n");
> +    else if ( ret =3D=3D -EBUSY ) /* extra checks, just to be sure */

Comment first letter capitalize:
s/extra/Extra/

Cheers
Bertrand

> +    {
> +        base =3D GICD_RDIST_BASE;
> +        if ( readq_relaxed(base + GICR_PROPBASER) !=3D rdist->propbase |=
|
> +             readq_relaxed(base + GICR_PENDBASER) !=3D rdist->pendbase )
> +            panic("GICv3: LPIs already enabled with unexpected PROPBASER=
/PENDBASER during resume\n");
> +    }
> +
> +    /* Restore GICR (Redistributor) configuration */
> +    if ( gicv3_enable_redist() )
> +        panic("GICv3: Failed to re-enable redistributor during resume\n"=
);
> +
> +    base =3D GICD_RDIST_SGI_BASE;
> +
> +    writel_relaxed(GENMASK(31, 0), base + GICR_ICENABLER0);
> +    gicv3_redist_wait_for_rwp();
> +
> +    for ( i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
> +        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 + i=
 * 4);
> +
> +    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
> +    writel_relaxed(rdist->igroupr,   base + GICR_IGROUPR0);
> +    writel_relaxed(rdist->icfgr,     base + GICR_ICFGR1);
> +
> +    gicv3_redist_wait_for_rwp();
> +
> +    writel_relaxed(rdist->isenabler, base + GICR_ISENABLER0);
> +    writel_relaxed(rdist->ctlr, GICD_RDIST_BASE + GICR_CTLR);
> +
> +    gicv3_redist_wait_for_rwp();
> +
> +    WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
> +    isb();
> +
> +    /* Restore CPU interface (System registers) */
> +    WRITE_SYSREG(gicv3_ctx.cpu.pmr,   ICC_PMR_EL1);
> +    WRITE_SYSREG(gicv3_ctx.cpu.bpr,   ICC_BPR1_EL1);
> +    WRITE_SYSREG(gicv3_ctx.cpu.ctlr,  ICC_CTLR_EL1);
> +    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
> +    isb();
> +
> +    gicv3_hyp_init();
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
> /* Set up the GIC */
> static int __init gicv3_init(void)
> {
> @@ -2011,6 +2455,10 @@ static int __init gicv3_init(void)
>=20
>     gicv3_hyp_init();
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    gicv3_alloc_context();
> +#endif
> +
> out:
>     spin_unlock(&gicv3.lock);
>=20
> @@ -2050,6 +2498,10 @@ static const struct gic_hw_operations gicv3_ops =
=3D {
> #endif
>     .iomem_deny_access   =3D gicv3_iomem_deny_access,
>     .do_LPI              =3D gicv3_do_LPI,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend             =3D gicv3_suspend,
> +    .resume              =3D gicv3_resume,
> +#endif
> };
>=20
> static int __init gicv3_dt_preinit(struct dt_device_node *node, const voi=
d *data)
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/incl=
ude/asm/arm64/sysregs.h
> index f3c11d871e..2261620316 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -16,6 +16,11 @@
> #define ICC_SRE_EL1               S3_0_C12_C12_5
> #define ICC_IGRPEN1_EL1           S3_0_C12_C12_7
>=20
> +#define ICC_AP1R0_EL1             S3_0_C12_C9_0
> +#define ICC_AP1R1_EL1             S3_0_C12_C9_1
> +#define ICC_AP1R2_EL1             S3_0_C12_C9_2
> +#define ICC_AP1R3_EL1             S3_0_C12_C9_3
> +
> #define ICH_VSEIR_EL2             S3_4_C12_C9_4
> #define ICC_SRE_EL2               S3_4_C12_C9_5
> #define ICH_HCR_EL2               S3_4_C12_C11_0
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 3714cfeb7d..f741587322 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -94,12 +94,15 @@
> #define GICD_TYPE_LPIS               (1U << 17)
>=20
> #define GICD_CTLR_RWP                (1UL << 31)
> +#define GICD_CTLR_DS                 (1U << 6)
> #define GICD_CTLR_ARE_NS             (1U << 4)
> #define GICD_CTLR_ENABLE_G1A         (1U << 1)
> #define GICD_CTLR_ENABLE_G1          (1U << 0)
> #define GICD_IROUTER_SPI_MODE_ANY    (1UL << 31)
>=20
> #define GICC_CTLR_EL1_EOImode_drop   (1U << 1)
> +#define ICC_CTLR_EL1_PRIBITS_SHIFT   8
> +#define ICC_CTLR_EL1_PRIBITS_MASK    (0x7U << ICC_CTLR_EL1_PRIBITS_SHIFT=
)
>=20
> #define GICR_WAKER_ProcessorSleep    (1U << 1)
> #define GICR_WAKER_ChildrenAsleep    (1U << 2)
> --=20
> 2.43.0
>=20


