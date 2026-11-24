Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A1606A323
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=dDGc1YMG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=dDGc1YMG
Received: from list by lists.xenproject.org with outflank-mailman.1501392.1697455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVuXz-0006Z2-A2; Tue, 24 Nov 2026 17:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501392.1697455; Tue, 24 Nov 2026 17:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVuXz-0006Yv-6N; Tue, 24 Nov 2026 17:43:15 +0000
Received: by outflank-mailman (input) for mailman id 1501392;
 Tue, 24 Nov 2026 17:43:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xVuXx-0006Yo-42
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:43:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVuXv-004KnA-NS
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:43:11 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6b05cc8c-2eae-0a2a0a5409dd-0a2a4506a6f4-30
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:43:10 +0100
Received: from [52.101.69.63]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6b05ccae-195a-0a2a45060019-3465453f895b-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:43:10 +0100
Received: from AS4P195CA0050.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::8)
 by PAWPR08MB8933.eurprd08.prod.outlook.com (2603:10a6:102:33d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Tue, 24 Nov
 2026 17:43:06 +0000
Received: from AMS1EPF0000008E.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::6) by AS4P195CA0050.outlook.office365.com
 (2603:10a6:20b:65a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 17:43:06 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008E.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 17:43:05 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by DU5PR08MB10636.eurprd08.prod.outlook.com (2603:10a6:10:523::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:42:31 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:42:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bFjaniMB7Uwrr5WdcBvCtpF/ZuXyOc/aFc50PlVSBbn0LNPSgHgwCvrzlg5F74s+Gi3+dlyqLwPlCZEjS62Yb5uZoj9fsZhmP5I9TTx5vjEJa9Qvq67TesuBbZBaQruINjKxLKrbzKN3ysi5PkDfxKPeWnC+fWleBpv6wKz/CouByra7VhtflVpQ0lDwRqFX+XdWAiuaOWoP7YesKnC5ue+4+e3ZIuojalEgMRrVx7HBj6Hm/X3/BqJ6EbMtNX/QQ2Z8oaGla2TCQJJR4WqZllFQZPlAkQPIll4ISuNw2Q664i/uHPM1e2+f1wgq1So7j/wJ72+F6aXBq80hZNiDyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Yn1VKXsfCjSXLVsfyDKydpn/WbjucjwTc+yAGL2zY8=;
 b=u+Jck6V82RfskFaXFpq9YohIAv76uDYaAuUPOSl673aBR8UcZ4esjqS/iWoWJCd7K1IGoAYpX+cyHwtrzQfMN6Kf/YNOgdlmHrSuoAZk9t2tHzbnphAsdYlXaqp/yECpn+EIXhlVrxk/Hv6d+B6cvxbiDzkmu+qgyAPW95Szif18BBuWRz5fyq0mA22jxWefZ/W13afx4Ux/bcBY9D/atyppyoGEyCC3dsOJj3gM9ZgvRBAKDN8BVDM8KzXyrErz4qiDC1xXivn87M3o5lQYA5YVve9cd/68VwVDwIMSuYjkBZ0PHEBE+Jdv4LRVCnzrsR0aRzO66KdIcPNtCryL+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Yn1VKXsfCjSXLVsfyDKydpn/WbjucjwTc+yAGL2zY8=;
 b=dDGc1YMGVbtEbrJn3q6DlJ1gMaEq4F1L+DsNmEn6RF0Zr7jXMbbFBuSixcjmsx68xvC9aI4qOz+bMguo5Q1MYXX1axNOM6MzBrdbcN+JSZdUV033GN6kBHfC5WUOydG4ZaKpI546bvDreynLmtt1p6qG1MtH0IbMgS1Gh7UnUEY=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uuj9r/97/mcLu329NOrTogclbImxBlv26bC9e3eFZ3QfCmCIUb7Xyt0uFoeSvLJSs/lzWfNXHOrn5epXhpKdVoiIqa9y8Vipu2ujviDoukj5alcWpZY2B+D9mFTHoCrnnzTOnN2gvsx5nHhm8O/JDEMFU+bDcW7svuvpn9Z+EYCyI7jmRhlmZvDsDswTvO+Onx1gXiJuSUU9Mo2HmO/b3Az5wuve47KrPyBLsvgY0x0lOiI70maoWg4p9InKZi2BYhmQ6l/ha3Hyo4Ym3wUDvCOoCnPwHZJRWGIjFVusNrgVFSP2AYkRM0yZZd9RARjx/BqBSfZU8WHq5PPvC0cfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Yn1VKXsfCjSXLVsfyDKydpn/WbjucjwTc+yAGL2zY8=;
 b=yshiWzu6EGJdKC+93rx1Ovq8/VsZCQBrOndzOzid76RqgCUlJ82/UE5X1xPVu3aDNXkqCWO96+tOrRbFUkmrjYo+C+fsI11ho8Qf/ZSOgplJbzJdPBV/k5ETto2fqTLVINwI3jjigCzyHikNy3h98ijILW5eM7FGMAstwFdWuDK6RXT5JPeSZxeS0Z4ilS7hF/un5IJLpDqOw9g0y3tF8FSe37nYfp4Mdbnk3gJx9yQL8Jyh2O5nLLEOL4SgpiqQhBg8t9K0MCk3JxJg+uRyHqXadTCbhx0x2T9ZWk1GGGQagErZIzaPXLeaslZc3R0yAbFKmK06sNxUL27sbSqSlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Yn1VKXsfCjSXLVsfyDKydpn/WbjucjwTc+yAGL2zY8=;
 b=dDGc1YMGVbtEbrJn3q6DlJ1gMaEq4F1L+DsNmEn6RF0Zr7jXMbbFBuSixcjmsx68xvC9aI4qOz+bMguo5Q1MYXX1axNOM6MzBrdbcN+JSZdUV033GN6kBHfC5WUOydG4ZaKpI546bvDreynLmtt1p6qG1MtH0IbMgS1Gh7UnUEY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] arm/smmuv3: clean stream tables for non-coherent
 hardware
Thread-Topic: [PATCH v2] arm/smmuv3: clean stream tables for non-coherent
 hardware
Thread-Index: AQHddcA7KSg86rXuDUWg7Tm+9FjlvLc9is4A
Date: Tue, 24 Nov 2026 17:42:31 +0000
Message-ID: <69C4106C-8D52-4AB1-9046-EFFAF0D6A120@arm.com>
References:
 <29e61dc16bff44403131d87a85c0050248d87309.1794829488.git.mykola_kvach@epam.com>
In-Reply-To:
 <29e61dc16bff44403131d87a85c0050248d87309.1794829488.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|DU5PR08MB10636:EE_|AMS1EPF0000008E:EE_|PAWPR08MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8d9215-13ec-4aea-10c5-08df4a526557
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|38070700021|261026121527099003|261028144727099003|261102124527099003|261022105027099003|261022075727099003|261021123027099003|261026140227099003|261021121427099003|11063799006|56012099006|10067099003|261102123227099003|22082099003|6133799003|261009223027099003|18002099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info-Original:
 9tGMXaKW9qHiSHz40+rumZZ2y2XuI23a7ivxa4HZKlX2EhalNbBtC9I04Oy4FptQWFYB6Trp5UWjWSaLt3Y9dBfkHa1E2b5H3xjFOQ0UiFpPbzG5VW/92Lh1jsqxlxWizTWXf/fb6YrR4BWGc+v+eXI2qNJL0K/5+/QPruCEtHkTbz7To5iqpocvzQ/MQmt5lt//6HPab5qnJeYIEgfgsCQcI2FQRNwvqSAfnvYc+XT7e68C7/ClHJmWJTywoy0eXD49Hj5frorabocVGSW5jYynCIkbrsfnYr5fJXtPz5jGQRxXbS2IaUnt+4SKCrdEWTGREjBfueQtven8hhHudodrMxmcyEMMeLu9l1WiN+US5WHVjbV+KwWbm/UlVx4Hc4VH0PgI0KnaAeKNqxetZBVSuRgCpUtnIT55GbVN97OMiCypnoG5v4M3F09zi6kxvqqQ++IfLZ7jte+AjAhny5kgICl4lCoZsEOkuU6JoEZKY7MGeeeI5iSjh/wxsLkCgWmUzQtEPuq0lHe6zngeHwFQlPDkMeKo1MW8hcV9xT2nptwT4WnWaO8EOjl6EiPTam5T6tiuE9ovexF7ZUU1o4d6u1hDGDOeEdxxp5V0Hn4SVTmq2X4wteN4HQrS0iOxwibDS+cTOsM//mbbUWw6Nza4++7/yN+a1oagkDUiVgo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(261026121527099003)(261028144727099003)(261102124527099003)(261022105027099003)(261022075727099003)(261021123027099003)(261026140227099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(22082099003)(6133799003)(261009223027099003)(18002099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_69C4106C8D524AB19046EFFAF0D6A120armcom_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 KeMhRhxzXjV/glrkzyeHe41mJgrtokwMDXVDtdUrNO3R/kaYksTO+C3gVT5hd9eBHPgWOIQjE1gTOMiPqojMIcMssCHsFmvArbudw4+LbbfmB27OHIXKowhaeK+fARHM7QZc5IiqmKrHNZbPtbk6vFEDjakHK/+Rkxlj/vwDpjRYd9aR1kuIpQQIYci+JxJLMaM2DRds9/tiIn8oxbuP4vCUMc6Lu57ow0kzAwmSQvrdCMN3mg5MJ8EhG0YUPELa45DxFtFBIaRRqD9eHtMsY9sm1XDUKyFjqfLHiD93y/n7PwZvTqCbqgb3yeynEOGNDNMPRoOVEC6V5W0eppnWMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10636
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8377c5c-9568-4337-07b4-08df4a5250be
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|36860700016|14060799003|23010399003|1800799024|82310400026|56012099006|10067099003|11063799006|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261102124527099003|261009223027099003|18002099003|22082099003|6133799003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info:
	kqPuBeRGl8NVwhCIzSPgMDxZRhPNYvDNOqcFqJcBGOhQfcrOB/E/d5KgZ6m4UfCpogL/MKhUch2OQ4YNk8QGwKoNi3lyiC5hzl0+g67+OAa0yw4YXwHklKStlt8zmZnU0Joe5DYfWlQtlr7V5U3gfgSdUxQG4QfrXmSiXU3bnw059h//mUPYcaSaCMKKd3igmQzmXGhaPkpOFkFG54zDpDi5SJylLllvwwcPNIyuY7NfvdJwE4D70wOCf46M+EXEfWo7aYJXOalZD4omernbhnglun8VBYLaQIqAR63cPxPEZKoASJaeZPmnlmue5ce/rxtkIzosuQI6+E4of0r2TOni/TjBCLqRqO5mCZdAYnm2dZfp5Km/N6VZa6BHe6K8l61OckdElvE71vaLckDlQjKUHj66Iomc58JMPj+khDFSVB6j2+vIzmy3xX7zB3l+VZXlVAKqspoaU0Y0EuRqz0NNYzopKYXBlZGrs38kp1BBJaZLOnN1Ri5LxEYwXsh1cICI9QbDPvPHPbeOB3XpLvzct4FKoxaE6jYuW17ZgOd9wG3Xsa2O6CpRSJXPHgQVJYMQ+OmPUuB3i4PRwkU4uyrH8H1xDirqRB7lajtmMjR+k+M+0jiDqzpM2rQotczvZc5oNRdYQ5OhnQdBKcG8Zw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700016)(14060799003)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261102124527099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7LummnxqrLRSQekGeisOrRmKCo6AFFWda6RvFSAaJjNMb1WrvAChbkzMMtyLduJC2wkFU77hoycErxN+xwuHpycwTc6mmXnYk2WZQT5gd/RI0eSOxjnEa5wITwpzreYWKje/0iojQIDAo+RSLvsLuC+BhXLA8oYIEnKPgwmMrnlXVqSSjn7hPGx90WJuOv2t9mQPONrDr3WUslbPN2oHcmn/Fg7aiGZI6fLO604lVBuc4nYxOtH6T6jExFfyDY5fWtl39/0rksCaxbGcFMrGQpbCqaSv3hJKmGSFXjPSo9dlGlAX9IXIukbbnrrUBS7Jy2Pb7AXOw103MgCpqn3colGP53vLRUkWfTDEUecRq0lgUAHaxAfxDlCqIX5P2Sa83Z/YZ5DpWvmk7cQ3Tfvc/tGhWsvOX2ON2PpT6JR8PhPb9rrlkah1AYZu/QYJi0yO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:43:05.6853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8d9215-13ec-4aea-10c5-08df4a526557
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8933
X-purgate-ID: tlsNG-16d1c6/1795542190-FD60A77B-34F5D31B/0/0
X-purgate-type: clean
X-purgate-size: 16090
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--_000_69C4106C8D524AB19046EFFAF0D6A120armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mykola,

On 16 Nov 2026, at 11:47, Mykola Kvach <mykola_kvach@epam.com> wrote:

Xen's dmam_alloc_coherent() returns cacheable memory. A non-coherent
SMMU cannot see writes that remain in the CPU cache.

On Orange Pi 5 (RK3588S), NVMe initialization failed with C_BAD_STREAMID
for SID 0x4100 while the CPU saw a populated L1 descriptor.

Clean new stream tables before use. Clean updated STE data in
arm_smmu_sync_ste_for_sid() before issuing CFGI_STE and CMD_SYNC.
Keep both sync points around the dst[0] update.

Clean the L2 table before writing its L1 pointer, then clean the pointer.
Skip these cache operations on coherent SMMUs.

See Arm IHI 0070G.b, sections 3.15 and 3.21.3.1.

Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
Assisted-by: Codex:GPT-6.1
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Rename arm_smmu_clean_strtab() to arm_smmu_clean_dcache().
- Pass the STE pointer and clean size to arm_smmu_sync_ste_for_sid().
 Clean the given range there before CFGI_STE and CMD_SYNC. Keep the
 original clean ranges, both sync points around dst[0], and the
 explicit cleaning during table initialisation.
---
xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++++++++++++++++----
1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 232df2421c..945a18a7a1 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -637,6 +637,14 @@ static int arm_smmu_cmdq_issue_sync(struct arm_smmu_de=
vice *smmu)
}

/* Stream table manipulation functions */
+static void arm_smmu_clean_dcache(struct arm_smmu_device *smmu,
+ const void *ptr, size_t size)
+{
+ /* Xen's dmam_alloc_coherent() returns cacheable memory. */
+ if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+ (void)clean_dcache_va_range(ptr, size);
+}
+
static void
arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *=
desc)
{
@@ -649,7 +657,8 @@ arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_s=
mmu_strtab_l1_desc *desc)
write_atomic(dst, cpu_to_le64(val));
}

-static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 si=
d)
+static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 si=
d,
+      const __le64 *dst, size_t size)
{
struct arm_smmu_cmdq_ent cmd =3D {
.opcode =3D CMDQ_OP_CFGI_STE,
@@ -659,6 +668,7 @@ static void arm_smmu_sync_ste_for_sid(struct arm_smmu_d=
evice *smmu, u32 sid)
},
};

+ arm_smmu_clean_dcache(smmu, dst, size);
arm_smmu_cmdq_issue_cmd(smmu, &cmd);
arm_smmu_cmdq_issue_sync(smmu);
}
@@ -736,7 +746,8 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_m=
aster *master, u32 sid,
* the STE regardless of whether the old value was live.
*/
if (smmu)
- arm_smmu_sync_ste_for_sid(smmu, sid);
+ arm_smmu_sync_ste_for_sid(smmu, sid, dst,
+  STRTAB_STE_DWORDS << 3);
return;
}

@@ -762,9 +773,9 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_m=
aster *master, u32 sid,
dst[1] |=3D cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS,
STRTAB_STE_1_EATS_TRANS));

- arm_smmu_sync_ste_for_sid(smmu, sid);
+ arm_smmu_sync_ste_for_sid(smmu, sid, dst, STRTAB_STE_DWORDS << 3);
write_atomic(&dst[0], cpu_to_le64(val));
- arm_smmu_sync_ste_for_sid(smmu, sid);
+ arm_smmu_sync_ste_for_sid(smmu, sid, dst, sizeof(*dst));

/* It's likely that we'll want to use the new STE soon */
if (!(smmu->options & ARM_SMMU_OPT_SKIP_PREFETCH))
@@ -805,7 +816,10 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_dev=
ice *smmu, u32 sid)
}

arm_smmu_init_bypass_stes(desc->l2ptr, 1 << STRTAB_SPLIT);
+ /* Clean the L2 table before writing the L1 pointer. */
+ arm_smmu_clean_dcache(smmu, desc->l2ptr, size);
arm_smmu_write_strtab_l1_desc(strtab, desc);
+ arm_smmu_clean_dcache(smmu, strtab, STRTAB_L1_DESC_DWORDS << 3);

I think there is a case we need to handle here. arm_smmu_add_device()
reaches this path after the SMMU is enabled.

- The SMMU may already have cached the inactive L1 descriptor.
- The CPU cache clean makes the updated descriptor visible in memory.
- The later leaf CFGI_STE can leave the inactive L1 descriptor cached,
  so DMA can still fail with C_BAD_STREAMID.

IHI 0070 section 5.1 requires a non-leaf invalidation when an inactive
L1 descriptor becomes active. We should issue a non-leaf CFGI_STE
followed by CMD_SYNC after publishing the updated descriptor.

There is a corresponding fix proposed for Linux [1].

I realise this issue predates the patch. Would you mind handling it
in the next version, or would you prefer to do it in a follow-up?

The rest of the patch looks good to me with the changes you agreed
with Oleksandr.

Cheers,
Bertrand

[1] https://lore.kernel.org/all/20261110-smmu-l1std-cfgi-v2-1-dabcae9a593c@=
cs.columbia.edu/



--_000_69C4106C8D524AB19046EFFAF0D6A120armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <148BBB273E8EFA42BF2342F178338E1F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html aria-label=3D"message body">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
Hi Mykola,<br id=3D"lineBreakAtBeginningOfMessage">
<div><br>
<blockquote type=3D"cite">
<div>On 16 Nov 2026, at 11:47, Mykola Kvach &lt;mykola_kvach@epam.com&gt; w=
rote:</div>
<br class=3D"Apple-interchange-newline">
<div>
<div>Xen's dmam_alloc_coherent() returns cacheable memory. A non-coherent<b=
r>
SMMU cannot see writes that remain in the CPU cache.<br>
<br>
On Orange Pi 5 (RK3588S), NVMe initialization failed with C_BAD_STREAMID<br=
>
for SID 0x4100 while the CPU saw a populated L1 descriptor.<br>
<br>
Clean new stream tables before use. Clean updated STE data in<br>
arm_smmu_sync_ste_for_sid() before issuing CFGI_STE and CMD_SYNC.<br>
Keep both sync points around the dst[0] update.<br>
<br>
Clean the L2 table before writing its L1 pointer, then clean the pointer.<b=
r>
Skip these cache operations on coherent SMMUs.<br>
<br>
See Arm IHI 0070G.b, sections 3.15 and 3.21.3.1.<br>
<br>
Fixes: 452ddbe3592b (&quot;xen/arm: smmuv3: Add support for SMMUv3 driver&q=
uot;)<br>
Assisted-by: Codex:GPT-6.1<br>
Signed-off-by: Mykola Kvach &lt;mykola_kvach@epam.com&gt;<br>
---<br>
Changes in v2:<br>
- Rename arm_smmu_clean_strtab() to arm_smmu_clean_dcache().<br>
- Pass the STE pointer and clean size to arm_smmu_sync_ste_for_sid().<br>
&nbsp;Clean the given range there before CFGI_STE and CMD_SYNC. Keep the<br=
>
&nbsp;original clean ranges, both sync points around dst[0], and the<br>
&nbsp;explicit cleaning during table initialisation.<br>
---<br>
xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++++++++++++++++----<br>
1 file changed, 23 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c<br>
index 232df2421c..945a18a7a1 100644<br>
--- a/xen/drivers/passthrough/arm/smmu-v3.c<br>
+++ b/xen/drivers/passthrough/arm/smmu-v3.c<br>
@@ -637,6 +637,14 @@ static int arm_smmu_cmdq_issue_sync(struct arm_smmu_de=
vice *smmu)<br>
}<br>
<br>
/* Stream table manipulation functions */<br>
+static void arm_smmu_clean_dcache(struct arm_smmu_device *smmu,<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple=
-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre"></span>const void *ptr,
 size_t size)<br>
+{<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>/* Xen's =
dmam_alloc_coherent() returns cacheable memory. */<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>if (!(smm=
u-&gt;features &amp; ARM_SMMU_FEAT_COHERENCY))<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span>(void)clean_dcache_v=
a_range(ptr, size);<br>
+}<br>
+<br>
static void<br>
arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *=
desc)<br>
{<br>
@@ -649,7 +657,8 @@ arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_s=
mmu_strtab_l1_desc *desc)<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>write_atomi=
c(dst, cpu_to_le64(val));<br>
}<br>
<br>
-static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 si=
d)<br>
+static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 si=
d,<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple=
-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const __le64
 *dst, size_t size)<br>
{<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>struct arm_=
smmu_cmdq_ent cmd =3D {<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span>.opcode<span class=3D"=
Apple-tab-span" style=3D"white-space:pre">
</span>=3D CMDQ_OP_CFGI_STE,<br>
@@ -659,6 +668,7 @@ static void arm_smmu_sync_ste_for_sid(struct arm_smmu_d=
evice *smmu, u32 sid)<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span>},<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>};<br>
<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>arm_smmu_=
clean_dcache(smmu, dst, size);<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>arm_smmu_cm=
dq_issue_cmd(smmu, &amp;cmd);<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>arm_smmu_cm=
dq_issue_sync(smmu);<br>
}<br>
@@ -736,7 +746,8 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_m=
aster *master, u32 sid,<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span>* the STE regardless o=
f whether the old value was live.<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span>*/<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span>if (smmu)<br>
-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple=
-tab-span" style=3D"white-space:pre"></span>arm_smmu_sync_ste_for_sid(smmu,=
 sid);<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple=
-tab-span" style=3D"white-space:pre"></span>arm_smmu_sync_ste_for_sid(smmu,=
 sid, dst,<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple=
-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre"></span><span class=3D"Apple-tab-span" style=3D"white-space:p=
re"></span>&nbsp;STRTAB_STE_DWORDS
 &lt;&lt; 3);<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span>return;<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>}<br>
<br>
@@ -762,9 +773,9 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_m=
aster *master, u32 sid,<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span>dst[1] |=3D cpu_to_le6=
4(FIELD_PREP(STRTAB_STE_1_EATS,<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-t=
ab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre"></span><span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre"></span><span class=3D"Apple-tab-span" style=3D"white-space:pre=
"></span>STRTAB_STE_1_EATS_TRANS));<br>
<br>
-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>arm_smmu_=
sync_ste_for_sid(smmu, sid);<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>arm_smmu_=
sync_ste_for_sid(smmu, sid, dst, STRTAB_STE_DWORDS &lt;&lt; 3);<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>write_atomi=
c(&amp;dst[0], cpu_to_le64(val));<br>
-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>arm_smmu_=
sync_ste_for_sid(smmu, sid);<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>arm_smmu_=
sync_ste_for_sid(smmu, sid, dst, sizeof(*dst));<br>
<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>/* It's lik=
ely that we'll want to use the new STE soon */<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>if (!(smmu-=
&gt;options &amp; ARM_SMMU_OPT_SKIP_PREFETCH))<br>
@@ -805,7 +816,10 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_dev=
ice *smmu, u32 sid)<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>}<br>
<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>arm_smmu_in=
it_bypass_stes(desc-&gt;l2ptr, 1 &lt;&lt; STRTAB_SPLIT);<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>/* Clean =
the L2 table before writing the L1 pointer. */<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>arm_smmu_=
clean_dcache(smmu, desc-&gt;l2ptr, size);<br>
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>arm_smmu_wr=
ite_strtab_l1_desc(strtab, desc);<br>
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>arm_smmu_=
clean_dcache(smmu, strtab, STRTAB_L1_DESC_DWORDS &lt;&lt; 3);<br>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>
<div>
<div>I think there is a case we need to handle here. arm_smmu_add_device()<=
/div>
<div>reaches this path after the SMMU is enabled.</div>
<div><br>
</div>
<div>- The SMMU may already have cached the inactive L1 descriptor.</div>
<div>- The CPU cache clean makes the updated descriptor visible in memory.<=
/div>
<div>- The later leaf CFGI_STE can leave the inactive L1 descriptor cached,=
</div>
<div>&nbsp; so DMA can still fail with C_BAD_STREAMID.</div>
<div><br>
</div>
<div>IHI 0070 section 5.1 requires a non-leaf invalidation when an inactive=
</div>
<div>L1 descriptor becomes active. We should issue a non-leaf CFGI_STE</div=
>
<div>followed by CMD_SYNC after publishing the updated descriptor.</div>
<div><br>
</div>
<div>There is a corresponding fix proposed for Linux [1].</div>
<div><br>
</div>
<div>I realise this issue predates the patch. Would you mind handling it</d=
iv>
<div>in the next version, or would you prefer to do it in a follow-up?</div=
>
<div><br>
</div>
<div>The rest of the patch looks good to me with the changes you agreed</di=
v>
<div>with Oleksandr.</div>
<div><br>
</div>
<div>Cheers,</div>
<div>Bertrand</div>
<div><br>
</div>
<div>[1] <a href=3D"https://lore.kernel.org/all/20261110-smmu-l1std-cfgi-v2=
-1-dabcae9a593c@cs.columbia.edu/">
https://lore.kernel.org/all/20261110-smmu-l1std-cfgi-v2-1-dabcae9a593c@cs.c=
olumbia.edu/</a></div>
<div><br>
</div>
<div><br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_69C4106C8D524AB19046EFFAF0D6A120armcom_--

