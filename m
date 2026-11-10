Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F98606A332
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=a6RTUyNj;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=a6RTUyNj
Received: from list by lists.xenproject.org with outflank-mailman.1482042.1685915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQo1k-0005n8-9U; Tue, 10 Nov 2026 15:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482042.1685915; Tue, 10 Nov 2026 15:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQo1k-0005n1-6R; Tue, 10 Nov 2026 15:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1482042;
 Tue, 10 Nov 2026 15:44:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xQo1i-0005mU-SJ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:44:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQo1i-000vx3-92
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:44:50 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af33bf2-8faa-0a2a0a5109dd-0a2a4509e6b0-0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:44:50 +0100
Received: from [52.101.72.11]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6af33bf1-be1a-0a2a45090019-3465480b4afb-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:44:50 +0100
Received: from AS4P192CA0037.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::28)
 by DBBPR08MB5882.eurprd08.prod.outlook.com (2603:10a6:10:200::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Tue, 10 Nov
 2026 15:44:47 +0000
Received: from AMS0EPF0000056C.eurprd02.prod.outlook.com
 (2603:10a6:20b:658:cafe::2a) by AS4P192CA0037.outlook.office365.com
 (2603:10a6:20b:658::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:44:47 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000056C.mail.protection.outlook.com (10.167.242.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 15:44:47 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by MIWPR08MB519056.eurprd08.prod.outlook.com (2603:10a6:290:eb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:44:15 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 15:44:14 +0000
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
 b=ku0G15ysBUHqhlbG3RFK+dHdAgISyD/ndsrk7CRVoNc9vRfx+Ni6149wO0YteUjngWUCy2dvVYEJKuLq1XzG5/m7QmZvKtVprYqCXOYsGY2uQdkUoaLTAhX+gRMq/D1msmMFF1ZSQW+DtxgZMI9KwcmHffOBKJUE+ygbFLgVPjKaGXfggE6cMyOtiTWEmd6SrlFVoUPe6hncE7IieLzVvA6OCr4hVjrmVBYsndN0gn0CEeg0qlZwHkmvY+q3O7ucs1PWtlPEoeRlDJ6EiQlWuHtEhRURU1cuHPpucRRADAN1vFFKXWtPf8Ao86cxuxYDi/k+MP/ku6pR9tS+NNPuCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIzJNE3wMNU85lqL0ldU8ZX6OY2XfsRLT5zWSOjNh5k=;
 b=og6bIn+XCxdG+Af/BfXzCkebhNWF1sEBWKTLmcalUX/JtgYewRofYQyW8yJy98LQrPfG4f4zE7umMT0LCuRkypiT0ia496nZawATffUXLbrbMXK+0md7yYbJDbhPAJHigckhIM/hpr/ZR5tdbvhq0UWkmM3N6GuXiffh/oa3pRZeojzuj1XOR8tt9Hbv3iMSEhkW0cWylapvuOOTMv4gHiDZYxKQD5VdvqPJnA24kFJg1UTAPMHYOfQvEXb1A62Rgo08cp9Okz7bu+4Wn6YFky9a4uRjtCU9ixw7Nqwsk0v5Z/WOZ/hlTQ94EXRW14mKIzpDIgLpF6oyvvSu3Zv2TQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIzJNE3wMNU85lqL0ldU8ZX6OY2XfsRLT5zWSOjNh5k=;
 b=a6RTUyNjGj+6VRwnjEzm4uh+nAjZMn4QxYf/aV0CveeLb7aB8mvdlXQJ4tRGAxDDoIGVKiJHtNp+6+7O3b5Rb3QrIHilKloUCLEcODfFHumEO+TnXAWJCuqHZ8dTXVXCWzpfxpUUr7a/VkcaFH7nSVbQWfDEiH9GJUxoHLv0Z/Q=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaWo92m71+Ih0jJJiEii5Gn3pHkPwi5C08gOPxSVirDX1QDqV/73y0CC4sHAGskfnrI+6Ei69yrSBV9hXzool4s6kQPxEuD3vUsbJc3GblYw1BZ965sId4vmr/0EDrYU1gy3PMCWc+cHrehnx6w8VGjmzvTedoAodeKzsDiMpT2f02BfxK3iQOI9MboCvzx75IaPlEe7XXt6fs6UkcitLxekfLVHmc6BxpwOnmY4NhJCGXdvVs6BN4w0c2FdUso5zOjgIF+nVhTkMQ0kzQb3Q2j9CGovvHYrK3dgSYh/eKTcw7WO3C+DGrhbcTuKL54uDYTQmBysYc0fA1KHfop5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIzJNE3wMNU85lqL0ldU8ZX6OY2XfsRLT5zWSOjNh5k=;
 b=ad8IpaG7842gg7CqozSR6LQKHGGWNxDtQ81RtmZmvKneZlqhX50f6knqx/d8RclDBBJrWd5ELV8rUPRbDPpHUJNT0cjy8W0fgOv5fvLiCP1WZ6RAng4LjSzI65ObM8961qq2z1vh+zV+mdZw0K8ve8ReIWdzo/YnWmtQ6gpjDmtDe6WeAmnOu42oST6TezWODvRZSHeFjXcGflDAICG45R0MNlt9hzydX0x9Oq34t4BxyoFzeUu9GRvn8Miq7hBS/fYiuK7IGWRxxuYqnJPZ77wJX9nNLho0HpB/nMII6xf6f2NNBLXldPxoxQ7bqnB713wTNzPBOz5vRg6o60+NfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIzJNE3wMNU85lqL0ldU8ZX6OY2XfsRLT5zWSOjNh5k=;
 b=a6RTUyNjGj+6VRwnjEzm4uh+nAjZMn4QxYf/aV0CveeLb7aB8mvdlXQJ4tRGAxDDoIGVKiJHtNp+6+7O3b5Rb3QrIHilKloUCLEcODfFHumEO+TnXAWJCuqHZ8dTXVXCWzpfxpUUr7a/VkcaFH7nSVbQWfDEiH9GJUxoHLv0Z/Q=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mirela
 Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Saeed
 Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai
	<mykyta_poturai@epam.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v13 12/14] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Topic: [PATCH v13 12/14] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Index: AQHdZlcNHt/05KXWiUODWrDkEVf3hbcnh/GA
Date: Tue, 10 Nov 2026 15:44:13 +0000
Message-ID: <1050B3E1-8361-442F-89C8-C58192E891A5@arm.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <85786d24cb2f835de97ca8c3cd9e8181a26b4bef.1793129971.git.mykola_kvach@epam.com>
In-Reply-To:
 <85786d24cb2f835de97ca8c3cd9e8181a26b4bef.1793129971.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|MIWPR08MB519056:EE_|AMS0EPF0000056C:EE_|DBBPR08MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 40fa3cbb-759b-42f4-110d-08df3f418cc3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|11063799006|56012099006|5023799004|22082099003|18002099003|4143699003|6133799003|10067099003|261009223027099003|261102123227099003|261022105027099003|261021121427099003|261026140227099003|261021123027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info-Original:
 oWTU5OuaGvIaQLdsGSNlqhvS7SS/Kq1UC0O7FAOZZ0q09GSHPb7avyLtku4x+dbJlomOxc5CvYcsmOl86Is5Pcq/IY/uet0lL6N+tDcMkwslHCHLVczGnojC0wyXZVhzkz8tAYST0DmZiV7UOKnX/dbjzH06Nd3hVpSpMnw3Z0ZrY15vxF8sayY7bCUICkQ4sGKlC7gPEsOxeUAVO7dfLsQ6MtLQOVjrptxbR96TeWeleHbknZKZdBfh7XLg3wlmBy7iBnYyKlOGPHGmn+eRbrF75AP45bElGaHPZt3FFzwOQKQSkohhWs+wCF8DnVsR+0bHBdvPCvzgU0YTywaKEtZoILm4CfM3gC1Gy8MIyp4GfTP4nZQYBt1P8ZiDrLPAuRBX+iVf9B2vjtquK5xmmlwPlzWYqzR+KqPhonAhKf7fXmaZIfnZcJ+GFtsoYWN1UTzSnwJGfWW0JA1dmMD+oxNpJWFM+V0Fostp6mNFI5XGQV0W4FfbjsS08pjP9lb1dg8d1U052Eald1jGP8qJiMsRwlQm14s75SeuZEPZFOU6r3rxzydutdNY94R+7pMN/Y4VehgAI3JzAX2sjieBdPtD2DyLlB3xmjp1aOMR1jK18JJVaRzWBx7KCLnqycdTfejvyP0VIc+p19jy3Ka7NZp7z3msocaRedUtURQrKXKe7r+x3sU3dzFxnA1Aac/I9+rjyvlCNDmzBvbGMF5yAyJlSOxLrEn+tNb/YkmeRuk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(5023799004)(22082099003)(18002099003)(4143699003)(6133799003)(10067099003)(261009223027099003)(261102123227099003)(261022105027099003)(261021121427099003)(261026140227099003)(261021123027099003)(261028144727099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9555064AC37F14DADF08632E2D1C013@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 wVtMD1yD+yV19NxnFTUUgKgW9J8J/1QqC22URLIqMLblat5jOZGNMFlLoKQ8F70bmhLiFU7AYwpEYE1ITaa9GNFwSxdUL7TDBVyxufTcNy+sUDUROj1WB4JN1vmmzNfSo6Rzh9JUcTewtNKRsTfQOidzdo0jUHFwUh1AuROXfFNmEQUTNDIEatDk2r4bE7geqjaeSTFfM93AfMLwTrHzpg0BAqsH4wgc38Wm28cOxqQlZU9vRSzL+SGsh5OZdQbMONwFDhPebU7gHVmlk5Pm4lynoaZwT0LReC2zMEkcKLfMUEx5gPWJ6ipUZBsgvldRHLyJvOI1O0inlbQCsfcJjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR08MB519056
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000056C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f97e43c4-31ef-4ea8-41f2-08df3f4178b8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|14060799003|1800799024|35042699022|23010399003|18002099003|22082099003|6133799003|10067099003|261026140227099003|4143699003|11063799006|5023799004|261102123227099003|261028144727099003|261022105027099003|261009223027099003|56012099006|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	xOrZhLPsaasA5yzrS7eDM1IfWGPZHtgux5vnH+ctYWnaUSx7QOoRzhRUqeN+U89WVA76DvSwi1Ps54v+oUSvpxPzNnt/NyAptoeWQ513RoiH3dN0ecfSRfTFeqTviUaXJcwBHbOs5afAeQlbN6ar16T0QdJV5Rykq82/DUtaFTHHQIoiAacXwIrVDz8bg/qwZlUgFqzh02mPXoTexv2UJLNWGSqPUPY8211JzC7Sad8oo0EDRNlKks2tpM+gfuNwlsKMzZFz8SuK/vV619KLKljcwxrGKMiZ2XxQ8C0Thd3I8/kebhbMqgFwmASYuDMPVDQcOAGiaMSouKmU46AR2d/WE93XVujCdgJ686hRV7QnkzJinF9GB+wTNBT8ySajsyh2kDEdGy8VvSXXtYEV5ACCUpNKzrMC4nYhjZV9wtiVueC9VnafvHwazWVbOEl2YqExCb5HYnXN70a/12WzLTh5aJahYdK4Kdv5cmsg6+rYsaQBxvZJjG04oZ8pfqetUDxo0keeaMjQ314kH8TyKuo0n4DXo2SiGgC1kHmkjqvSuJ8oaeyCvaKa53l+QeDjX/91KXIaO8MyOeDcgbinZ/pGRaAdwvRH+FC2WnFgkJ+f3TbYbwvWe9k6WNFXtEdxll8jMJvzdTwXFysd6c1DcjHRym37Qdj5+T403MFA9+pYvCGrZ6TR1+GYBd+I+QUCfIsy/3ydO5A7zND1thKdBw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(14060799003)(1800799024)(35042699022)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(261026140227099003)(4143699003)(11063799006)(5023799004)(261102123227099003)(261028144727099003)(261022105027099003)(261009223027099003)(56012099006)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+SusTt1Z3tybZJu6TzmPmR3ZwoT3M9Y99CImooiL7ueUEWfD5EodlstHoN1G+fDgkaXUIM20NTAJSS0eAkzIGi+1NtxMJ7SQDZbIkg9p+zV2oYSMnZWCzoH4CdqcRIcA/NF8r/UOkJjue7rm+8Na8enhFPA/Xe3G58WHw3T0v9US8Fvx3RC+F7KQG/f2k6cBivIXTSGucHs8NZtOJ7AsCILOUa1JleZf2nJhdeEgWfXFndYDc/UeWvLTOb6GyzQlyWqMTwQpnBcseVbzUI1RdFuuEmqH4VGI3e9GHaA5siHpmctD88q4lTWk0V003sQj4joYfZkZTfWQUDbS+UDq2TdOFTtjHgY0aKltVFz0Zpqv1v+YTJd/H4zWVCYmVZ7kWX61ZME6+V2Bn9r/7VBwWkDGIGoN/hv+J+0CKThqYiVddSn59047ewxqI5lxZtRl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:44:47.5923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fa3cbb-759b-42f4-110d-08df3f418cc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000056C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5882
X-purgate-ID: tlsNG-bad1c0/1794325490-BC6CA034-0BDA3D2A/0/0
X-purgate-type: clean
X-purgate-size: 4644
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 27 Oct 2026, at 22:06, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64
> platforms. Pass the Xen resume entry point (hyp_resume) to EL3 together
> with a zero context ID, matching Linux.
>=20
> This patch wires up only the host-side PSCI SYSTEM_SUSPEND invocation.
> The resume trampoline and context restore are provided by earlier patches
> in the series.
>=20
> Only enable this path when CONFIG_SYSTEM_SUSPEND is set and PSCI
> advertises SYSTEM_SUSPEND via PSCI_FEATURES.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Looks good to me:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v13:
> - Use the result returned by arm_smccc_smc() and drop the result pointer.
>=20
> Changes in v9:
> - cache SYSTEM_SUSPEND support using PSCI_FEATURES and gate the host call
>  on the cached capability
> - keep the cached SYSTEM_SUSPEND capability read-only after init
> - log whether firmware reports SYSTEM_SUSPEND support
> - pass an explicit zero context ID in the SYSTEM_SUSPEND call
> - drop the stale note claiming hyp_resume is still a stub
> ---
> xen/arch/arm/include/asm/psci.h |  1 +
> xen/arch/arm/psci.c             | 32 +++++++++++++++++++++++++++++++-
> 2 files changed, 32 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 48a93e6b79..bb3c73496e 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
> void call_psci_cpu_off(void);
> void call_psci_system_off(void);
> void call_psci_system_reset(void);
> +int call_psci_system_suspend(void);
>=20
> /* Range of allocated PSCI function numbers */
> #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 967cb4b77d..4d502216ce 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -17,23 +17,27 @@
> #include <asm/cpufeature.h>
> #include <asm/psci.h>
> #include <asm/acpi.h>
> +#include <asm/suspend.h>
>=20
> /*
>  * While a 64-bit OS can make calls with SMC32 calling conventions, for
>  * some calls it is necessary to use SMC64 to pass or return 64-bit value=
s.
> - * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
> + * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
>  * (native-width) function ID.
>  */
> #ifdef CONFIG_ARM_64
> #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
> +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
> #else
> #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
> +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
> #endif
>=20
> uint32_t psci_ver;
> uint32_t smccc_ver;
>=20
> static uint32_t psci_cpu_on_nr;
> +static bool __ro_after_init has_psci_system_suspend;
>=20
> #define PSCI_RET(res)   ((int32_t)(res).a0)
>=20
> @@ -60,6 +64,26 @@ void call_psci_cpu_off(void)
>     }
> }
>=20
> +int call_psci_system_suspend(void)
> +{
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct arm_smccc_res res;
> +
> +    if ( !has_psci_system_suspend )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Context ID is unused for the Xen resume path. */
> +    res =3D arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND),
> +                        __pa(hyp_resume), 0);
> +
> +    return PSCI_RET(res);
> +#else
> +    dprintk(XENLOG_WARNING,
> +            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disable=
d)\n");
> +    return PSCI_NOT_SUPPORTED;
> +#endif
> +}
> +
> void call_psci_system_off(void)
> {
>     if ( psci_ver > PSCI_VERSION(0, 1) )
> @@ -223,9 +247,15 @@ int __init psci_init(void)
>=20
>     psci_init_smccc();
>=20
> +    has_psci_system_suspend =3D
> +        psci_features(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND)) =3D=3D 0;
> +
>     printk(XENLOG_INFO "Using PSCI v%u.%u\n",
>            PSCI_VERSION_MAJOR(psci_ver), PSCI_VERSION_MINOR(psci_ver));
>=20
> +    printk(XENLOG_DEBUG "PSCI SYSTEM_SUSPEND is %ssupported by firmware\=
n",
> +           has_psci_system_suspend ? "" : "not ");
> +
>     return 0;
> }
>=20
> --=20
> 2.53.0
>=20


