Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58BD606A332
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 17:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=qbCLCYdW;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=qbCLCYdW
Received: from list by lists.xenproject.org with outflank-mailman.1492951.1693187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTMdr-0004Gm-79; Tue, 17 Nov 2026 17:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492951.1693187; Tue, 17 Nov 2026 17:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTMdr-0004Gf-3a; Tue, 17 Nov 2026 17:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1492951;
 Tue, 17 Nov 2026 17:06:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xTMdp-0004GY-Q0
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 17:06:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTMdp-00H7uW-68
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 18:06:45 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6afc89a4-8faa-0a2a0a5109dd-0a2a45088c14-4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 18:06:45 +0100
Received: from [52.101.69.67]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6afc89a4-f659-0a2a45080019-346545431e21-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 18:06:44 +0100
Received: from DB9PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:10:1da::27)
 by AS8PR08MB9953.eurprd08.prod.outlook.com (2603:10a6:20b:635::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 17:06:31 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::1c) by DB9PR05CA0022.outlook.office365.com
 (2603:10a6:10:1da::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 17:06:31 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 17:06:31 +0000
Received: from PR2PR08MB4761.eurprd08.prod.outlook.com (2603:10a6:101:17::21)
 by DU0PR08MB7392.eurprd08.prod.outlook.com (2603:10a6:10:353::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:05:58 +0000
Received: from PR2PR08MB4761.eurprd08.prod.outlook.com
 ([fe80::b71f:1158:311d:f87f]) by PR2PR08MB4761.eurprd08.prod.outlook.com
 ([fe80::b71f:1158:311d:f87f%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 17:05:57 +0000
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
 b=EdYm+xska9OyZg7uwSUsdS8F57A0KSBCCG3nf9wUcHAojrPdbdjv0O6pUBccaCh6AkuUS3hTN3PHd9nNL5BZ/nn5uvPynhqpnbdd1aZnfnN1vpPNIpRsL+iPIpnv+KmH3MhsmHe6iO0PdKSI8h2r/LKwMLX3KOm5sWDFBWawgnZsAvV8kJOAk7GoRWx3Vzr/6a3gO2HEeUSDaTmZ/bKs8TeDAEdhP9Syq2FOGBNwTpyHNwUSbhP3WmN/j2HG9oXvS81PNs9yLKEs/iBrsndMihE/g4gV26hVYrHrjdOT8PCH+e2Sc6cQ/NrCtM6rbWSTMARBRFFknsrckO3YBvhN4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8YMF/6lR5dWZV+ZozIRPx71N2HuQHw43ptSMC5NS8A=;
 b=zW6V1cGUobPyFO/KBReuUXliQJ2bQV/OYL3ndO1A6R3oR8j3zTr0ewR4iAIJyGmbDQLbbl2CX5ZLHJlarJpcu8JKn6IlUn9onMD+uSP2BraARnb+LJqIQALpMhP0lUf7KGN1JpKCnCDrjmZu/A9xu8/kct7mhy15SDiw0XdkuhNbQKQC3XmYDkNbrJ8FFiaQCe7sUFSLgjNr/sT+ri6Efb/uhgXQMveLdy+rrcXnovYvf+UTkqiuvOa0Fhj+hMNHL2erqYF3oo6yQ3ArSgmfINdtG40lBLJ+CoMLwHGYbrIDDqPT/oBGnW6Tp12Um7VqFYBP2e6zxtup+IntLmpnjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8YMF/6lR5dWZV+ZozIRPx71N2HuQHw43ptSMC5NS8A=;
 b=qbCLCYdWAKlOhxlSngcEiFKr5KcXkfM4vvWPjvC5VrEb5C93xNjapBLyD/DQTKGz1+I9/YY6551ZjWtfo38RNUh/cwcBnZjbXmvSs8xEi+4f+j64sX9T7iU38Q0kkbyTmb6gHo4+DGQ0ZAWDuaqpcr95I6YMX4+RNRWS00yECuA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BB4MBnpVUA968p5gavKWS3AzKch9T6+334Ww0zCWBKYpMnNamVqNSQMCnBnKl5FhPHlnYcwqTFb3DH0XU/113uYth5xVHW5yo5cZow6y2p9RMQex9k5Wb6dOCPJ3eTG4qBM1ix444R+AD6uGDV7Hdr+OTy9QnwvxXR+EmtpMpFS2SmqJ3cauullQ7bTNHmellJuRwgXjp//Isoqcctsnt2MgRGSliaFLWSYv7eD0o/UOYmHqZzkGqWgK+jkQDDMt4lyge6CaBHUlSns7OkhJx6Sd8xO8N0LeaWKk30/Hn0hee+x92wbP6zEEK+/slmkM5PG2HGGqudGjkaiGWvQnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8YMF/6lR5dWZV+ZozIRPx71N2HuQHw43ptSMC5NS8A=;
 b=bEWtA5Xz4VWuvQDEBZ3zerVowthc66lsg6QjfRvz7CCr6qQYvzd9cLWZio1NCz6jr12Y0iyb8oro0H4pnpKT+RvFf4UxQfKNvX/R2nAMMT+wAx5fkoIzA/kz6t7gt+q4mVLOxEI1o3GtG9r/cxjZSwS6yRcCTQ31k4MRfJJ4rR3m9NAhXZlBsveWi1W+ABmCq7Q28nJwZa0/DFrTiWAaWtwQIr09qQQOZM6CuSzg4fSss/RisbR6RhD9PHfhRDz4MVJhyDUhpCavlnl+Rt/EqrRnlR5PDf04kY5IDeOfMWHNISOpAlcxpU7EJFM7gYOcHC+h6ui8O8m7xytMr/5MDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8YMF/6lR5dWZV+ZozIRPx71N2HuQHw43ptSMC5NS8A=;
 b=qbCLCYdWAKlOhxlSngcEiFKr5KcXkfM4vvWPjvC5VrEb5C93xNjapBLyD/DQTKGz1+I9/YY6551ZjWtfo38RNUh/cwcBnZjbXmvSs8xEi+4f+j64sX9T7iU38Q0kkbyTmb6gHo4+DGQ0ZAWDuaqpcr95I6YMX4+RNRWS00yECuA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v14 15/15] xen/arm: Add host system suspend backend
Thread-Topic: [PATCH v14 15/15] xen/arm: Add host system suspend backend
Thread-Index: AQHddi/Cw6UNaUDiK0+4QYmQJ/KNarcyf2eA
Date: Tue, 17 Nov 2026 17:05:57 +0000
Message-ID: <6D7FC4DC-35C8-4690-AC42-9C19CCBEFF7D@arm.com>
References: <cover.1794873792.git.mykola_kvach@epam.com>
 <992b26751105ac4859e371f98e7756c71f5d758a.1794873792.git.mykola_kvach@epam.com>
In-Reply-To:
 <992b26751105ac4859e371f98e7756c71f5d758a.1794873792.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR2PR08MB4761:EE_|DU0PR08MB7392:EE_|DU2PEPF00028D0C:EE_|AS8PR08MB9953:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a31bcaf-6fb6-4fc7-01be-08df44cd2054
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|22082099003|261009223027099003|3023799007|4143699003|56012099006|5023799004|11063799006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 /7rCfBhsKsvBW8hJi+Ipf33FQUcv8BLC30uzBju4j4XiPjGGqcXhFKWue/eHNonr4LHNy+sf2fxRMmoxHHDJaUQ8tR9IOJA2qjfDT9tD+aB7WM0UNjWo8lhr5dej7WrE7CJOtYEs79guOcZ6Ky+GEdm/c5CJhh474tU+3LJY6SmdYCNYmTRHeNEuLr2R9eagTErZaUOIzL1C1MTpXx3uqKzxJx2GqbE3GfBolFT1ZpqQcrcH9e+ZaxB2D/d6Tds9aImiQlI6qrfRJHp5r6YpP3xa1rfNHh2scpVUxklsHHNtSK+HaaAhz8AxC0xEP96zn2ox6MuKKV4DAZBrPg2HnJfW5dP4Cr1QswfaxdduM9fVqiynLzm1WzTLXt6mCT945NWQauyNgzEUe+I66hJZXbMBL9Gm3XYNy9Sbmx7Qo6zasZpXDWmZfW3nS3VgmhxHYMaAIJAOMusFDOyIHT1RuX6OL2jncLacyLTiZpq2IGxQifsMTz2o7wSoqmhHL9u+CV7t8618yHr+iJALCcqW65EOVeTYXPBseLTj1F0cQQHrDoidMm3I3h7WG+RMS/RxdH2Vt/RLDzU/gUmem6Dd4cqRpQ47TVkIoynNTZl/4Uxp3R72NwS57639K+KpqjNk4VCISyK4a0RcO0XBzyo4GaAo+o3D4x7+vA+G+eCRUGO/eFC8VgLtzg2D61qZpIifaoTaFO/Dqd+em0b01GECUlW6/henjWUvZrsjrsl+aG8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4761.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(3023799007)(4143699003)(56012099006)(5023799004)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A715D62B2B59074491B05F4978BE4020@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 DNzHpgd6I2rC+4Efz1UHwXXZ++Wszeh4yUZDV2LPm8JcduQXdo8X3ilFhq+2osDlYzYUR0tY9h63Ie+e4Iz2PgfXBZ462DQi1DXzQRRiZ5NCI/LoDvwDVOxBattkfl1+RcnKYGa7kkYCSMQQVq4JWYH11ZeKGqN+y0w6KkRsIhd0bqh+RD5/SsGUTThrV/pCOoCeDYKVau15NpTNmKupLNRgTcR067dQHtTZvWALcz/CTryZKFDZEaGGAr2aL4z6mJMTHmOhR3PjKhnsevX/6QMyATpiSkDeU0dCU5P98gx7mXb0rp4EBpyghnir+7vtjbekIDwFOl8535rkQY9HVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7392
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5cb732e2-adc6-419f-1487-08df44cd0c89
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|14060799003|35042699022|1800799024|22082099003|18002099003|6133799003|261009223027099003|3023799007|11063799006|5023799004|56012099006|4143699003|10067099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	nfsIsjKrmdCcnKh0GUf7cJ3JjhE8V4ZzAMCr/HfFZl5CGu8fRgIy1yu6p9368ZbjX+HAY18vcOH1Gb/1IygcRQJEa+asVP5KfrkQyMvztJjpQ5UeQ7RQf3T1mAUo17rZFLS6bPkmcJgVNc85+tTbq8pa22lEWbq+i5QID6/IBt+mwkenxTLrh8zcuuc01ITopFgZm2SktaCE8hgSriRsQTALdVIwoIJXjE2ler0vFI1paKST6uD47cPIcZgZ7Avrmjzl0P6LJE2yq9S58SRgNmcJiolI/bKiZsGmsZJ1TqoB9PhTn4xxS9X65tWv8RA6hm/YdnXpiiVFid2x5G3KXI2bn2zNMF3K53C3uKvPJT/S0RsAz9NvaPpFhelVzbdlUZzQUKuSsq4gv9DS6i/KgV71oY98jgwySn8W1NIRHO21R/4yU6DwXDvqfSlRckwoTYw7VIxo2YFD6ajdArTvkyQSjj181m9ItZZdp3Jh7HGmCuejxBnCMtykXAe8FRwCHNBqwsK9YrdRj/M87mEmEl0otDIW8KGaHj1i7W8ZCY4l5FeoEPr4jh3GLGNb3RaEqeIQFqqJoFMroDjFrdC+nOSKWuJcpKEpfsLlkzF5UhdoIT0XAfJndtH1EWBDB5NNB9JsqCDt//Skw2JTVhGZGj467pVFYf7BSZdXPbOOeegM5QmSnmFbnh1fN+eiEDdssQgJCTn7MdieLfezTRs78g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(14060799003)(35042699022)(1800799024)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UKhANFw6kQEHts+Edol5ARe9zrVK5i8N1wIAv/ejMPLPQk1Di5/nT2IYmC7HdxCwnsFv7XXoH2vjl7A3yF+QDU+wN93Jl4+zsoqV4+wVxuF3/ft9AE+1D+Cy4HEedcOKDaj9PPT8vVbn/q7M0plgvBQLmHv5YHQ+PSzm4Au5fMxPkQD/RtH4RsfVDfiiGIfikHr3/uE2HrCAVY0E49Xgkp87T6OQxdDtkZgIwGrdHoRGLlvBpwrQdeLuh6XRbFuyikVRrethJ2KiZav1Z/23RIpPdQ7G3yPeySk350MZToZMWKV/AOH16hJagFll02w5McE14/tuPkPq4Y7ehNVIwzdVfWE0o5b/KjbQXg3zQIyHN2Zb0zcSccIaX3rP2ngwIozr6NXicIiiiUFmmd9rVnv1MAYMP/r/NJ29Egvp3r/gpJbD/63VEpE82/mSwQe0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:06:31.0182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a31bcaf-6fb6-4fc7-01be-08df44cd2054
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9953
X-purgate-ID: tlsNG-c1860d/1794935204-CF75B87B-1DE8C1D6/0/0
X-purgate-type: clean
X-purgate-size: 15523
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykola,

> On 17 Nov 2026, at 02:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> Add the Xen-wide suspend/resume backend used after a control-domain
> vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
> runtime driver blockers and control-domain sequencing checks are handled
> by the preceding commit; this change adds the code that actually drives
> the host suspend attempt.
>=20
> The backend runs from a tasklet scheduled on pCPU0, because non-boot CPUs
> are disabled during suspend. It freezes domains, disables the scheduler
> and then disables non-boot CPUs.
>=20
> Host-side suspend participants are handled in phases. IOMMU and console
> state are suspended first. Local IRQs are then disabled before suspending
> timer and GIC state. On resume or failure, the completed suspend phases
> are unwound in reverse: GIC and timer state are restored while IRQs are
> still disabled, local IRQs are restored, and then console and IOMMU state
> are restored.
>=20
> On boot, init_ttbr is normally initialized during secondary CPU hotplug.
> On uniprocessor systems this can leave init_ttbr uninitialized, so set it
> from the boot CPU before entering suspend.
>=20
> Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
> only selected when UNSUPPORTED is set and MPU is not set.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in V14:
> - Add INFO level to suspend entry and successful resume messages.
> - Replace the generic resume status print with a WARNING on suspend
>  failure after the console has been restored.
> - Use warning-level printk() instead of dprintk() for console and PSCI
>  suspend failures, keeping the details available in release builds.
>=20
> Changes in V13:
> - Explicitly discard console_resume()'s return value. It always returns
>  zero in the current implementation (MISRA Rule 17.7). No functional
>  change.
> - Remove the redundant rcu_barrier() and its outdated comment before
>  enable_nonboot_cpus(). Per-CPU areas are kept during suspend, and
>  cpu_up() already waits for pending RCU callbacks before CPU_UP_PREPARE.
>=20
> Changes in V10:
> - Re-apply boot CPU local errata/workaround handling after SYSTEM_SUSPEND=
,
>  before resuming the rest of the host suspend path.
> - Move set_init_ttbr() declaration to asm/mmu/mm.h, since it is
>  MMU-specific.
>=20
> Changes in V9:
> - Split vPSCI availability policy, runtime host-suspend blockers and the
>  domain-readiness precheck into the preceding commit.
> - Trigger the host suspend backend from the control-domain SYSTEM_SUSPEND
>  path.
> - Reorder the host suspend/resume phases so the timer is suspended with
>  local IRQs disabled and local IRQs are restored after the GIC and timer
>  resume paths, before the console and IOMMU resume paths.
> - Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.
>=20
> Changes in V8:
> - Add a pre-suspend check in system_suspend() after scheduler_disable() t=
o
>  require all domains to be in the shut down state with SHUTDOWN_suspend
>  before proceeding with the global suspend flow.
> - Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
>  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
>  with an arch-selected capability instead.
> - Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
>  CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
> - Rename need_hwdom_shutdown() to want_hwdom_shutdown().
>=20
> Changes in V7:
> - Control domain is responsible for host suspend.
> - Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
>  config is disabled.
> - Use IS_ENABLED() for config checking instead of #ifdef.
> - Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplif=
y
>  control flow.
> - Factor hardware domain shutdown condition into a helper
>  (need_hwdom_shutdown()) to avoid preprocessor directives inside the
>  function.
> - Squash with iommu suspend/resume commit.
> ---
> xen/arch/arm/Kconfig                 |   1 +
> xen/arch/arm/cpuerrata.c             |   7 +-
> xen/arch/arm/include/asm/cpuerrata.h |   1 +
> xen/arch/arm/include/asm/mmu/mm.h    |   2 +
> xen/arch/arm/include/asm/suspend.h   |   2 +
> xen/arch/arm/mmu/smpboot.c           |   2 +-
> xen/arch/arm/suspend.c               | 152 +++++++++++++++++++++++++++
> xen/arch/arm/vpsci.c                 |  10 +-
> 8 files changed, 173 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index fd5f0ddb17..c3e32fb683 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -9,6 +9,7 @@ config ARM_64
> 	select 64BIT
> 	select HAS_DOMAIN_TYPE
> 	select HAS_FAST_MULTIPLY
> +	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
> 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>=20
> config ARM
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 35ad98d29d..5a7f127495 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -782,6 +782,11 @@ void check_local_cpu_errata(void)
>     update_cpu_capabilities(arm_errata, "enabled workaround for");
> }
>=20
> +int enable_local_cpu_errata_workarounds(void)
> +{
> +    return enable_nonboot_cpu_caps(arm_errata);
> +}
> +
> void __init enable_errata_workarounds(void)
> {
>     enable_cpu_capabilities(arm_errata);
> @@ -818,7 +823,7 @@ static int cpu_errata_callback(struct notifier_block =
*nfb,
>          * fixed to expect an error at CPU_STARTING phase.
>          */
>         ASSERT(system_state !=3D SYS_STATE_boot);
> -        rc =3D enable_nonboot_cpu_caps(arm_errata);
> +        rc =3D enable_local_cpu_errata_workarounds();
>         break;
>     default:
>         break;
> diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/=
asm/cpuerrata.h
> index 1799a16d7e..b93521326f 100644
> --- a/xen/arch/arm/include/asm/cpuerrata.h
> +++ b/xen/arch/arm/include/asm/cpuerrata.h
> @@ -5,6 +5,7 @@
> #include <asm/alternative.h>
>=20
> void check_local_cpu_errata(void);
> +int enable_local_cpu_errata_workarounds(void);
> void enable_errata_workarounds(void);
>=20
> #define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm=
/mmu/mm.h
> index 7cebc60298..776aef8b1c 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -110,6 +110,8 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
> extern void switch_ttbr(uint64_t ttbr);
> extern void relocate_and_switch_ttbr(uint64_t ttbr);
>=20
> +void set_init_ttbr(lpae_t *root);
> +
> #endif /* __ARM_MMU_MM_H__ */
>=20
> /*
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index 50dc6e9fdf..889a6509d9 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -41,11 +41,13 @@ int prepare_resume_ctx(void);
> void hyp_resume(void);
> bool host_system_suspend_allowed(void);
> void host_system_suspend_disable(const char *reason);
> +void host_system_suspend(struct domain *d);
>=20
> #else /* !CONFIG_SYSTEM_SUSPEND */
>=20
> static inline bool host_system_suspend_allowed(void) { return false; }
> static inline void host_system_suspend_disable(const char *reason) {}
> +static inline void host_system_suspend(struct domain *d) {}
>=20
> #endif
>=20
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> index 37e91d72b7..ff508ecf40 100644
> --- a/xen/arch/arm/mmu/smpboot.c
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
>     clear_table(boot_third);
> }
>=20
> -static void set_init_ttbr(lpae_t *root)
> +void set_init_ttbr(lpae_t *root)
> {
>     /*
>      * init_ttbr is part of the identity mapping which is read-only. So
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index c7c26bcf03..815e41242a 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,10 +1,18 @@
> /* SPDX-License-Identifier: GPL-2.0-only */
>=20
> +#include <asm/cpuerrata.h>
> +#include <asm/cpufeature.h>
> +#include <asm/gic.h>
> #include <asm/psci.h>
> #include <asm/suspend.h>
>=20
> +#include <xen/console.h>
> +#include <xen/cpu.h>
> +#include <xen/iommu.h>
> #include <xen/lib.h>
> +#include <xen/sched.h>
> #include <xen/serial.h>
> +#include <xen/tasklet.h>
>=20
> struct resume_cpu_context resume_cpu_context;
>=20
> @@ -44,6 +52,150 @@ void host_system_suspend_disable(const char *reason)
>            reason ? reason : "unsupported suspend/resume path");
> }
>=20
> +/* Xen suspend. data identifies the domain that initiated suspend. */
> +static void system_suspend(void *data)
> +{
> +    int status;
> +    unsigned long flags;
> +    struct domain *d =3D (struct domain *)data;
> +
> +    BUG_ON(system_state !=3D SYS_STATE_active);
> +
> +    system_state =3D SYS_STATE_suspend;
> +
> +    printk(XENLOG_INFO "Xen suspending...\n");
> +
> +    freeze_domains();
> +    scheduler_disable();
> +
> +    /*
> +     * Non-boot CPUs have to be disabled on suspend and enabled on resum=
e
> +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to P=
SCI
> +     * CPU_OFF to be called by each non-boot CPU. Depending on the under=
lying
> +     * platform capabilities, this may lead to the physical powering dow=
n of
> +     * CPUs.
> +     */
> +    status =3D disable_nonboot_cpus();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_nonboot_cpus;
> +    }
> +
> +    console_start_sync();
> +    status =3D iommu_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_end_sync;
> +    }
> +
> +    status =3D console_suspend();
> +    if ( status )
> +    {
> +        printk(XENLOG_WARNING "Failed to suspend the console, err=3D%d\n=
", status);
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_iommu;
> +    }
> +
> +    local_irq_save(flags);
> +
> +    time_suspend();
> +
> +    status =3D gic_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_time;
> +    }
> +
> +    set_init_ttbr(xen_pgtable);
> +
> +    /*
> +     * Enable identity mapping before entering suspend to simplify
> +     * the resume path
> +     */
> +    update_boot_mapping(true);
> +
> +    if ( prepare_resume_ctx() )
> +    {
> +        status =3D call_psci_system_suspend();
> +        /*
> +         * If suspend is finalized properly by above system suspend PSCI=
 call,
> +         * the code below in this 'if' branch will never execute. Execut=
ion
> +         * will continue from hyp_resume which is the hypervisor's resum=
e point.
> +         * In hyp_resume CPU context will be restored and since link-reg=
ister is
> +         * restored as well, it will appear to return from prepare_resum=
e_ctx.
> +         * The difference in returning from prepare_resume_ctx on system=
 suspend
> +         * versus resume is in function's return value: on suspend, the =
return
> +         * value is a non-zero value, on resume it is zero. That is why =
the
> +         * control flow will not re-enter this 'if' branch on resume.
> +         */
> +        if ( status )
> +            printk(XENLOG_WARNING "PSCI system suspend failed, err=3D%d\=
n",
> +                   status);
> +
> +        system_state =3D SYS_STATE_resume;
> +    }
> +    else
> +    {
> +        system_state =3D SYS_STATE_resume;
> +
> +        /*
> +         * CPU0 resumes directly from hyp_resume(), bypassing the CPU ho=
tplug
> +         * path that re-checks and re-enables errata workarounds for sec=
ondary
> +         * CPUs.
> +         */
> +        check_local_cpu_errata();
> +        check_local_cpu_features();
> +        BUG_ON(enable_local_cpu_errata_workarounds());
> +    }
> +
> +    update_boot_mapping(false);
> +
> +    gic_resume();
> +
> + resume_time:
> +    time_resume();
> +
> +    local_irq_restore(flags);
> +
> +    (void)console_resume();
> +
> + resume_iommu:
> +    iommu_resume();
> +
> + resume_end_sync:
> +    console_end_sync();
> +
> + resume_nonboot_cpus:
> +    enable_nonboot_cpus();
> +
> +    scheduler_enable();
> +    thaw_domains();
> +
> +    system_state =3D SYS_STATE_active;
> +
> +    if ( status )
> +        printk(XENLOG_WARNING "System suspend failed: %d\n", status);
> +    else
> +        printk(XENLOG_INFO "Xen resumed\n");
> +
> +    domain_resume(d);
> +}
> +
> +static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
> +
> +void host_system_suspend(struct domain *d)
> +{
> +    system_suspend_tasklet.data =3D (void *)d;
> +    /*
> +     * The suspend procedure has to be finalized by the pCPU#0 (non-boot=
 pCPUs
> +     * will be disabled during the suspend).
> +     */
> +    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index d42fcd766e..bcd4a9ae8d 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -239,7 +239,8 @@ static bool domain_in_suspend_state(struct domain *d)
>     return suspended;
> }
>=20
> -static int32_t domain_psci_system_suspend_policy(struct domain *d)
> +static int32_t domain_psci_system_suspend_policy(struct domain *d,
> +                                                 bool *host_suspend)
> {
>     struct domain *other;
>     bool last_awake_control_domain =3D true;
> @@ -306,6 +307,7 @@ static int32_t domain_psci_system_suspend_policy(stru=
ct domain *d)
>     if ( !host_system_suspend_allowed() )
>         return PSCI_DENIED;
>=20
> +    *host_suspend =3D true;
>     return 0;
> }
>=20
> @@ -316,6 +318,7 @@ static int32_t do_psci_1_0_system_suspend(register_t =
epoint, register_t cid)
>     struct vcpu *v;
>     struct domain *d =3D current->domain;
>     bool is_thumb =3D epoint & 1;
> +    bool host_suspend =3D false;
>     struct resume_info *rctx =3D &d->arch.resume_ctx;
>=20
>     /* THUMB set is not allowed with 64-bit domain */
> @@ -340,7 +343,7 @@ static int32_t do_psci_1_0_system_suspend(register_t =
epoint, register_t cid)
>=20
>     spin_lock(&vpsci_system_suspend_lock);
>=20
> -    rc =3D domain_psci_system_suspend_policy(d);
> +    rc =3D domain_psci_system_suspend_policy(d, &host_suspend);
>     if ( !rc )
>     {
>         rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> @@ -365,6 +368,9 @@ static int32_t do_psci_1_0_system_suspend(register_t =
epoint, register_t cid)
>             "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D%#=
"PRIregister"\n",
>             epoint, cid);
>=20
> +    if ( host_suspend )
> +        host_system_suspend(d);
> +
>     return rc;
> }
>=20
> --=20
> 2.53.0


