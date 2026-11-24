Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F988606A323
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=XoDeLKdG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=XoDeLKdG
Received: from list by lists.xenproject.org with outflank-mailman.1501240.1697293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtVR-0003h7-AI; Tue, 24 Nov 2026 16:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501240.1697293; Tue, 24 Nov 2026 16:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtVR-0003gy-5A; Tue, 24 Nov 2026 16:36:33 +0000
Received: by outflank-mailman (input) for mailman id 1501240;
 Tue, 24 Nov 2026 16:36:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Pierre.Gondois@arm.com>) id 1xVtVP-0003gq-M8
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:36:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtVO-00HAy5-Nb
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:36:30 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Pierre.Gondois@arm.com>)
 id 6b05bcfb-e002-0a2a0a5209dd-0a2a4505bb96-44
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:36:30 +0100
Received: from [52.101.84.35]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Pierre.Gondois@arm.com>)
 id 6b05bd0d-4cb1-0a2a45050019-34655423b0f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:36:30 +0100
Received: from DU2P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::30)
 by PAVPR08MB8800.eurprd08.prod.outlook.com (2603:10a6:102:2fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 16:36:23 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::17) by DU2P250CA0025.outlook.office365.com
 (2603:10a6:10:231::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 16:36:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Tue, 24 Nov 2026 16:36:22 +0000
Received: from BESPR08MB999898.eurprd08.prod.outlook.com
 (2603:10a6:b10:109::23) by DB9PR08MB8482.eurprd08.prod.outlook.com
 (2603:10a6:10:3d6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:35:48 +0000
Received: from BESPR08MB999898.eurprd08.prod.outlook.com
 ([fe80::d62a:5300:bc89:9f62]) by BESPR08MB999898.eurprd08.prod.outlook.com
 ([fe80::d62a:5300:bc89:9f62%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 16:35:48 +0000
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
 b=wTkM4TFjm3XaeUP/Y5hSr+kKJQf5P62mfaBoNBhLyEB1nhLMy4PGnZviwCKGeyWJdMgsj82NTKzKiP2g2uXl8UEIcFoHK7ld0I4Tdh0mYI7vCfOCXZKMVNM/3oahd6CSIeW+RXlkmAGhuzIxYQdy+GriPRZVvsE5l6e3JcAMk9t5NgUXGhLfNbUkKoC9lX32AbcXHuqxo6fEM1Nm0eDLrB5V8hM3KelyEdMGLqcDoMR7ebYPOkmBuCEJOPxxFJrhBM9ELPa4bCde+jw1eGKhT62YtcqzIHs+RXNVPwzSd63o5veG/2rYtvU2E6dXUU0FydeN6kWOXbo8nh5pJEkOog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0jaPzajAbeZEfoTdS4IUecfk/J2hlW785QNb0Hsa8A=;
 b=mEXDzMowDCwNkLJFoRCLEYklJ0FgjzAqWNjDQl4nM+MoJKnH6PmPAtviSkcUw99a1zKZT/6aahh/WYwALZIkGqgm4Xe2gQn4KwLGklNpjebE2/fK6fDXfQRvJr0mtXZ0di82M/XY7KIWzZpSLhz0qEbbIJ1bPzBucNi65s+x0RGwpjrF1hiqc86isPBt8UM3K1aHZm0MSyf02lDCIYORc3vtyE0M19lZshQv1oTqWHbhB/eTDZJIAAB/rKje3k13quyYlSSWk3nRceC/2D7wYEPwJ9AYR8saV6kSPT4eI1K5Uyvgt+dV0TOTQGUeNlywdJNMznb3OOOOd1Il1tFVTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=outer-limits.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0jaPzajAbeZEfoTdS4IUecfk/J2hlW785QNb0Hsa8A=;
 b=XoDeLKdGjnYbzCVIzQNKstM/hL0MeRUWfDAl2OIIEuOzjFm6flVKIZYuT/GmXx3b6Kn6OQGN4Xq21f+aXGLrJr5HbAnxe9A5dyFhi7+aZUdOLVSGvR2g7CCz8hyla3HgWBaa5c+cTbyxqqM0F4bWzmcPZvl8cZcIyf2pJV0xAbM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6zQlZWgfNB2OW2oL+sqOAh9MiBQh3tyz2owrx0PkfE/liZzuOA4JRo3I+rMCvNavuVrzbzTK1aq+2mO6LhH+m3kRCYOs8yQQQMZ9Psiz3Iari/9ZxVbzheg8gBqiYVXQ68AUO15CLdU5zhgSi7xVTxrLkr8Htf6oiqAr83DHhRXjVCCysG7ad41sXcKsgerK8cNmc+VevryDNBSdXS7vf86NZDWvLCjRYDyR/HJbntp+mGd2cYdlw25BkdXSxTNZ2bYr6cBlmijtGbwZIfNmIhYUPrEmkbJbybdTEO1TVGjn7wH1xWOvl6l0sv0obNH43ZpNm3O/adGAmofXqKWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0jaPzajAbeZEfoTdS4IUecfk/J2hlW785QNb0Hsa8A=;
 b=WVdvuL1AWSy5EHJqk3V6Wvmo90CraHxrhkPNyOlfsgNELvrJJ6OMWJ/YDPpQ8lACapy6KjnypVLsdxNsSaHdyGdskMKJmxf6L3clSnTbumSCGJZdBtr3Ify+7LcldD5U3ZFTOieCJdqNxy3/46b2scB5tBhFTKeNvgQffXiBjXxyBxlZNwBXJu56x41Vs2+JlvH7xXIoSx7hcLRH0Dz46uGPuANq5zwW97Jq7yscOT6MlFDgwurcuni2amxwowOOcDcXgGkmf2oX/qh7xBj8kPkBPG4alUrddHVS4+r5ryiEXxb7rJKKqigK9Tzo3R8/tNhLoo1qT10GgU1O/sQtrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0jaPzajAbeZEfoTdS4IUecfk/J2hlW785QNb0Hsa8A=;
 b=XoDeLKdGjnYbzCVIzQNKstM/hL0MeRUWfDAl2OIIEuOzjFm6flVKIZYuT/GmXx3b6Kn6OQGN4Xq21f+aXGLrJr5HbAnxe9A5dyFhi7+aZUdOLVSGvR2g7CCz8hyla3HgWBaa5c+cTbyxqqM0F4bWzmcPZvl8cZcIyf2pJV0xAbM=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <9fa19cc8-91ad-45b8-bff4-afbd10219bbe@arm.com>
Date: Tue, 24 Nov 2026 17:35:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: ARM EFI: should bootinfo memory banks be reset before retrying
 ExitBootServices ?
To: Julian Vetter <julian@outer-limits.org>, xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <3d783a50-06bc-4c6b-815e-bd42ce5e54d1@arm.com>
 <f62e1e86-ae7c-498e-95e8-ec790e734a3c@outer-limits.org>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <f62e1e86-ae7c-498e-95e8-ec790e734a3c@outer-limits.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::21) To BESPR08MB999898.eurprd08.prod.outlook.com
 (2603:10a6:b10:109::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	BESPR08MB999898:EE_|DB9PR08MB8482:EE_|DB1PEPF000509E5:EE_|PAVPR08MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f391813-8cef-40d9-f408-08df4a4912f7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|4143699003|261022105027099003|261021121427099003|56012099006|260925021911599003|5023799004|260925022911599003|261028144727099003|260925021311599003|261026140227099003|261026121527099003|261009223027099003|261022075727099003|261102123227099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 wy9zpklzGBrQ45jnaJDDpT969tlT3ChjCGQ0dQCX21yKsExNHr6B463fL2rL2zYXqRiVV9m3s7bM990xEgrk7pWw5uwiL3ApUj91y1+5v2yOJTbOeWrn5Ji2fVHC8do/zXRqZYibioTvQoLnjhBCvI+MMfN6TolKdbxx2bGqJGEUqEE3nkrKCzeFaEaBusesRi7N6ihalvc2sIOSR1uoLgQuT18bowPp3NFmKdeOZoq2dh9ZF8ujDwcZ9f5R4Mf6ROybjQgJhZX7wEHm+8HfYPnPEvPbq0O2yRA7e27eutSULr09DRyuLskGNhTcnR7oJJN8A00lHYm483YwDsc5f9oI9a2wOzx9t0riyuahgiHJe+wvYQ+xFn8CktGzP8is9GleCd08U2vWkz+ZNJEfJ2F0u2w+i23oVsUKRDyF4Co/UaexrHo7ZFod01R4AhlG9Wr4xHu3/Sv5WqjpFeCti2Ap79/OIoAe4eDjRMNDNZL6uFsgitY9K7746iuuAhVk04YyfYyKIa2gktIJlXqqAbE51UoKBkKwEYyE/7ZMIGhZuXcVDyACrr+Bz3L9PGabL9Iojt6vbSww8YVq3lWRTudZq4CPNreXj4nRzdf2tkCLLIgX2hDRqZYcBPdHTO+qoneuKwuy4YlLL95uo1DQArsx/rlnZNmNQ0fI4A8Zgrc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESPR08MB999898.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(261022105027099003)(261021121427099003)(56012099006)(260925021911599003)(5023799004)(260925022911599003)(261028144727099003)(260925021311599003)(261026140227099003)(261026121527099003)(261009223027099003)(261022075727099003)(261102123227099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 CBZ/t0GcBaXptJz5cASpr1jPBXoCMaH59QfAExchBtNsznawO8LkKCpRec18L1mSw/mLGXkHCrSA9oAvn7JPHvT/Ye2dnQt5karPlcPoGNFJkmQ8FDcnSAGRKiJWu4BPoHKC8CYnhMI6ObmgLSdAS2TSSyUg6xN/PuZpmCG/OOhNEsiQVFPAMFHSOkFH0pqfVex33hFrmjtqekz7UTl3V3P0I5nB5HlrnZ40oMZcj77HxLTvas2JYwx+q1mNYJp4F1NJ0PSQJbzgFgNrKghapjxKf1Xd0ZoPt43H9QCWaC6cuf4rwdVoJc08NUjZaeJKESAP98kkDedPkbM7O9AbxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8482
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	32a2fe38-6fbc-4b41-745a-08df4a48fe75
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700016|23010399003|1800799024|82310400026|376014|261026140227099003|261022075727099003|261022105027099003|261026121527099003|261028144727099003|261021121427099003|261102123227099003|10067099003|11063799006|5023799004|4143699003|56012099006|260925022911599003|260925021911599003|261009223027099003|18002099003|22082099003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	UhB+RjCyu+AsOsBY/Ee4akA4GKWINMlL/TzJIYTPPUEI+GoLDVXuiBzEWEhpvdTZM2lSt73iWhfU2ExhcEV7i6OeEpiIq0dMrIHf23xFK9p13w3Dp9EkIScEHsbbC+14E/Mp9pY6Th5XPHSV4suDJEx4XjhBkKN545TkbXRbOV+/OMHOCqOhrub0Y+pYS4j/2/tbuwjpP81KH6fZajk7MTCW6M12eHGhWuFTXcZOSWdMhka0QqZxdYdRfq2Mhdm8E83TAej0G6wmZ5lFxoHkhfzSM8kwU00iug1FWiB17ZvWn6V3b6/FEqbk+4+2kNa2HyJuNHfWrLffxq4kr9t3RfSe6l6coFkwd3Dp5R39ne9/ehnU7X1m8TMg7s1fk4L/Ww9oVQQNXs+o7EdBwk8/KN8VgIj/P39+7FYS+l1J9rKOLYFimEM7VqaRRP5cB8DJf2LTdbMf7oH5CsQQyuCRC7jdUV7rmx+GoGgTyWSae3oqVv3wglisQuXR/3SLe01ddveo6cehrCbCrDUVBl1mxCLYXtw7erd9JpseeM2YO998ES3Itwc01yCfUTrNQJKKG14UQxUQ2OCKnymrjzJjj2nC+PvqVe+sOHJupSZy7xz6kCiQNdp/JTlKqPzO4Pkk8Ay0+AfFTCMIDn6NS1ols29w1fld9mZBrZuJQgBkA5uLirdBEIkFtw5sW/kyVya6b1XSxMoA3ulNHJ6zFSAdxw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(261026140227099003)(261022075727099003)(261022105027099003)(261026121527099003)(261028144727099003)(261021121427099003)(261102123227099003)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(260925022911599003)(260925021911599003)(261009223027099003)(18002099003)(22082099003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fPUR/KIuNAE6DkQR3NTC1J2rUSfthmMG8SklOixT9zGqvZlkBzRQlJzCy4dwjy5bLK8SxMHDd0ZaGq86FX4mMhzl3lStZxGnfvSL6nmD0y0mGUGnzh495aBS1m4GUNDWtGxQ9WSm+Mxh5eDyDN2JwD4WQmtnRPjtVyOz1OVJQ0EWlkAF2c/GgVsJpmpT88xXBpLZmptK0kxpWVE3H7EZ6hMUyjz+W+NhX/jRA3GKbxT25Urf2dPNDdm/G0uQRw/q6b6E/cQVvqves46g3fJ1vhy/jmZiZCy5q9qvpaYou1a9iVubyTkybYoOg1w2yI9Jo5BNuc0Ik350NEzIk6H3KVIgfuGpv5gDOinWcGqnNURTLBnhs8wdLEzt6CLN6n1Yw1941XOpMEgDqWRDIPoruZVqYoywgCcdPicubA8gkoBbP9K8KV1ghe47VBCwnEwc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:36:22.0200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f391813-8cef-40d9-f408-08df4a4912f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8800
X-purgate-ID: tlsNG-c201ff/1795538190-2491C2A1-E68587DB/0/0
X-purgate-type: clean
X-purgate-size: 2836
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Julian,

On 11/24/26 15:02, Julian Vetter wrote:
> On 11/16/26 17:11, Pierre Gondois wrote:
>> Hello,
>
> Hello Pierre,
> I can reproduce this on QEMU, and the change you suggest fixes it.
>
> My Setup:
> - QEMU 11.1.3: -M virt,virtualization=on,acpi=off -cpu cortex-a57 -smp 
> 4 -m 4G
> - Firmware: qemu-efi-aarch64 2026.08+ds-3
> - Xen: staging 3b65ff9f372fb85 (debug, early printk on PL011), xen.efi 
> started directly from the UEFI shell
>
> Without the change, the first ExitBootServices() call fails, 
> efi_exit_boot() retries, and every RAM bank is added a second time, 
> and Xen hits the BUG in bootmem_region_add():
>
> (XEN) RAM: 0000000040000000 - 000000004668ffff
> (XEN) RAM: 0000000040000000 - 000000004668ffff
> (XEN) RAM: 0000000046800000 - 000000004688ffff
> (XEN) RAM: 0000000046800000 - 000000004688ffff
> ...
> (XEN) Xen BUG at common/page_alloc.c:308
> ...
> (XEN) Xen call trace:
> (XEN)    [<00000a00002cb498>] 
> page_alloc.c#bootmem_region_add+0xd8/0xec (PC)
> (XEN)    [<00000a00002cb694>] init_boot_pages+0x44/0x1b0 (LR)
> (XEN)    [<00000a00002cb694>] init_boot_pages+0x44/0x1b0
> (XEN)    [<00000a00002c54f0>] bootinfo.c#dt_unreserved_regions+0x70/0xac
> (XEN)    [<00000a00002c5c50>] populate_boot_allocator+0x124/0x1c8
> (XEN)    [<00000a00002e2c84>] setup_mm+0x60/0x84
> (XEN)    [<00000a00002e337c>] start_xen+0x118/0x988
> (XEN)    [<00000a00002001a4>] 
> arch/arm/arm64/head.S#primary_switched+0x4/0x24
> ...
>
> With your change applied, each bank is listed once and Xen boots 
> through to dom0:
>
> ...
> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000040000000 - 000000004668ffff
> (XEN) RAM: 0000000046800000 - 000000004688ffff
> (XEN) RAM: 0000000046930000 - 0000000047a4ffff
> (XEN) RAM: 0000000047ff4000 - 000000013fffffff
> (XEN)
> (XEN) MODULE[0]: 0000000045b58000 - 0000000045ccafff Xen
> (XEN) MODULE[1]: 0000000045cf1000 - 0000000045df3fff Device Tree
> (XEN) MODULE[2]: 000000013dd4d000 - 000000013fffdf13 Ramdisk
> (XEN) MODULE[3]: 0000000041bf4000 - 0000000043ffffbf Kernel
> ...
>
> I see in the x86 that the e820_raw.nr_map in 
> efi_arch_process_memory_map() is reset for each loop iteration. On Arm 
> the bank is appended to the previous iteration. So, I guess resetting 
> the banks is the right call?
>
> Pierre, are you planning to send this fix as a patch to the 
> mailinglist? If so, please add my:
>
> Tested-by: Julian Vetter <julian.vetter@vates.tech>
>
> Otherwise I'm happy to post the patch with your Suggested-by.

Thanks for reproducing/testing the issue. I'm not too familiar with

Thanks for reproducing/testing the issue. I'm not too familiar with
xen mailing list, so if you could send the patch it would be of
great help,

Regards,
Pierre


