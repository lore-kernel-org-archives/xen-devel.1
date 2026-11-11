Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7A606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=OvwyY5PL;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=ghDQNZqY;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=L6kpkFHP;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=HSUQZ5YD
Received: from list by lists.xenproject.org with outflank-mailman.1484728.1688100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJI-0000O4-0v; Wed, 11 Nov 2026 19:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484728.1688100; Wed, 11 Nov 2026 19:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJH-0000NZ-TO; Wed, 11 Nov 2026 19:48:43 +0000
Received: by outflank-mailman (input) for mailman id 1484728;
 Wed, 11 Nov 2026 19:48:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJG-0000C9-97
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJF-004SUA-M5
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:41 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c678-8faa-0a2a0a5109dd-0a2a4508a0aa-30
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:41 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c698-f659-0a2a45080019-94a38ff152ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:41 +0100
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYu702703525
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:40 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvt952tmh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:39 +0000 (GMT)
Received: from BN9PR03CA0588.namprd03.prod.outlook.com (2603:10b6:408:10d::23)
 by LV8PR16MB6332.namprd16.prod.outlook.com (2603:10b6:408:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 19:48:36 +0000
Received: from BL2PEPF000352CC.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::5f) by BN9PR03CA0588.outlook.office365.com
 (2603:10b6:408:10d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:36 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL2PEPF000352CC.mail.protection.outlook.com (10.167.249.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:35 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZm3t3211986
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:34 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htnr3537d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:34 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REJ5xlr1Mam0hREJ6xXdbc; Wed, 11 Nov 2026 19:48:33 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=6Za
	LftDYUNhBhMkl2tQEq+TkgXfg0uHuIEM01ce1wcE=; b=OvwyY5PLKGDdFyfhIwk
	frhTZb3iy5MbteqHSp35pEozAzWz+QocMmYf8ZlEodLTkI9BhT75M66eHCr3kQ2/
	Db/L5inWI5J0DNT/RA/uE3sok7ej1REh61POD+VAjI5CHyMjeW/zGy8HTJ3j3oLc
	GcpiU7nUJ/47PI+DaH9+UyAxl8JPZ05aHX0qs+ghrvfR7mVc9pzgyPjQOKwe3plT
	czGQVecY8mADUgnC7cXON+tjRzYQWyCPOtZ/0EMR3M2zp9HcdHIC1VdSZI7hC9MM
	IteXrl46qozgYPQF8QkYHXGgo6y/b7t0et2ZPGkySfzQUZpp7a6mlDHEtHxiN/Dd
	OWQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJ061i617Qil3hx6WycDDDJ95VTLb/qafsjW/jJXJ/2dFOaSBE0XXNMdcpRAEsxjwljhgIEmzJkd4nc7ahIkG32pfdJ7dvYdwhMMA2cTW5UpzD5/yDJ/TSac9S+2w4fChodcTPDNkTvLvfORAxBIElUuA7ZL5wf2gmbTqYmukASTGNJOEdovLEO94Y8BBr/qKOz+y0Q9LS1fXgNqATbrgVDE3dEr0r5TtOCC5JgOIw/VbbjI9MyTnW8m0TYK/wJCV37L1bwqhtGxp/O9ii1IxJTWx3cNjshR00lorYYPLuRFAQ0HFfLACaBg6ozla0rYyf0NZc5nG6BmIqc2/VpkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZaLftDYUNhBhMkl2tQEq+TkgXfg0uHuIEM01ce1wcE=;
 b=tqEz03QWNz4aygayLO8qOnfPt8TMw7XiCz0tm0vNTGuMbUvTbl7XMOXua/8F7IVFft+oWGpdywCqZ7+wcs/DuJdA9dp69iscUYuL4Ev3yH59jWPEGL8qySz23ENK5PUvBR493wzefyoJXftTPZQxQ4hRl/YVXITAmPJm3v7sfX4Ae6lgnLij/0csXSJkbly7nEbYyqIx1oNJJD9ozltK+nMn3t5oJdiRla1lfGeuagryhQyEh4pnONkeivjqzwnFNUtE7kaB0zhkNnAn275q0fSH1GpmXpuWhfTjzf4US3NRdmDCrOe/m40uB5gtP9EXuczrpeWjib8Gq9Z+axwuaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZaLftDYUNhBhMkl2tQEq+TkgXfg0uHuIEM01ce1wcE=;
 b=ghDQNZqYkGPfXEXrIxGq1GA4gMWwx2VEXDo5F1/fw5OYrBsW593apgc5DUHcwhoP4jWQ90KnQtNvATYzlnXz0IJuf67B6eun6A2GdNlowX52lUOnQnaGnCpWe5KH2afJUkGtg94+I8i6i9vy77tgQnsueYZd1waT68z7/XBYMq0=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=6ZaLftDYUNhBhMkl2tQEq+TkgXfg0uHuIEM01ce1wcE=; b=
	L6kpkFHPcHHqddS1asU2s4oPnF9yqRkfG3ovQQpKP0r04LU5pvx60T4dX7v6r6kS
	50d6uKPLZvtg8djfplp0zHT3SkIZWLjs0BsNmrozngyS9YEjKxqCT6WTBghSExjy
	Tuh9NNYoZ+NcPJdwAQMoahoCe96ZJeaupazV+JnkiuJ8CYFOK1ZlrOQ3/7HicAcA
	4pcz/xQzcaRK7F4HuzXwWvMV0/xk57gCVoLzcaU9bKb8KC5T0KgwNX84J1BcN/cf
	RCQdkyKsQ/oDpKM5XJ6hTDHUciE5icUAF6jdUP9LD0f+EZBUWTVYag0RxSoiB0Cj
	awooAPsbWNR/MZtwl0KR4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=6ZaLftD
	YUNhBhMkl2tQEq+TkgXfg0uHuIEM01ce1wcE=; b=HSUQZ5YDQD4R9JYWbU6ZNab
	EdEyrarzrWbBPiKTjAG0BgWYqqBPt8n4VaRi9TO0cCHfMVIsCOxyulggvMcpdq9v
	P8jCk96pHhMU1XI0fYL/0ecBz4eEGOEnyqNbyAkR1GjG5Xa1vMpvsVLsuHt/i2A1
	olw32L+gdIEeG0+bZTjGIWK4Ma+7WIDdRiRfKoHiZ8bwPpzxpknMXWEEfdwaZyaw
	LOwem2FY5i5nPYbIih1Lh7nu89A5TBePD9VkdUj02K6DTo2s8l3ZTurA2kAxMMLp
	7P/qvuhk0fpju9p1ZTl4ZdcDyFY6KgURhkUMaMJ4K6vQjTdMJyIHXDh0DHxqJcA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJ5xlr1Mam0hREJ6xXdbc
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 09/26] emul/ns16x50: implement MCR/MSR registers
Date: Wed, 11 Nov 2026 11:47:43 -0800
Message-ID: <20261111194800.1070016-10-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111194800.1070016-1-dmukhin@ford.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CC:EE_|LV8PR16MB6332:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c363a1d9-8767-406e-a79c-08df402cc638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|22082099003|18002099003|10067099003|11063799006|261022075727099003|261026121527099003|261021121427099003|261021123027099003|261009223027099003|56012099006|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	LN3zRpgH/gkfQnU+kx1Hpsb/IITgOEdIMzN6Z0V8bR4DXNCllGi4f6RegX9leBnAnayEd3L2atld6UDs7MwP94FAQbpJk/WCgyG9qO9F+7Cnc92Wktx9t+wEKMhIiJnl/gAAoaTJfs5sxgvrb5Js623f+qd1iH4K2GM3xOevtKOjNH0vUAjvmk5noeLYTb+tZb8u9xj+/79UvE4svTdHQ5Vgw3eE9yN6nu0PbwEnCtn5rrYyVL0DAfu+UV5y0g+liJr2CIxubQspudsNaHRWwX+n+0CIB/lbrEiwHEAfktO9o0Rrc1Dq0ehI9tghSdUfsyc0XQW3k2CYWGaSiUih23nO/7y9d32AQ+BxQ0tb+rzbkC0PyIpxF08oiSezwg99UDMSo2Im0kwMstWTIAZbLod0w6WV6/O3Zi5BooCwkvIaOe7jLddNqWA1lm08qMLiUBPrvRmjXsBy/mDpb08OTEdcGGnimMmTyrcqgZmi1EJSkiJ0MMzdlJCqWW7pJOv9oQTLs68uwU4OHpOwbndK06JKq04WWlpG4n0DAMIKHgrOV2/zh78grDCH1XnVnExDvzUwyIfaV9K5m8ehAE3IYZAzNHU6sAEjf2OjpVtyh1AfLKqwKNjHtxcxn/iHzWHQXpE3ExVIkV1URNFH1FURnmkarqno3OlhbNfQfgg24xdfZJ4U90bwQjJEjh3IltS69RtneHsKvzS4EFi1sQ5maA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(261022075727099003)(261026121527099003)(261021121427099003)(261021123027099003)(261009223027099003)(56012099006)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0k71tWY9WvVg09DzQrUfwepMTKAmk+NrIML1DkQp6IdoZBJ0ApyhVS+jClialdHrIi18eIGPQeY07PXux8wQQxotC00JC2WQGaQ7c3GFOi8Av9MiKTaTqnN00qyx0KU42il4O4sR8vNifYXQlVvKGbDDzd3Kbwy4JhrCevQYpINLxXeX5wW8Rgj3pnrm0DlSQ0+QzGnEgBPQrUdOQxYubYMwWdv1ap7xdBr74D3V+o2YSm87abRUozEIuB2F33Zn9EZ22xENq83+SypTiFQO/rVhMWVjYZjpdtzjzG82az2DHnd34uci9PtD9VOVxUThgupDICujDKBJoJ4rPRRCXznWERdiRvDdtHf6w/H5m4l0hlBcME30zE9fcdZ4Ct4AHrsgHb7tyrgcRo4SwsdFUhyAqxl/WkpVBWlzK3tJBlWNKX98pUBRjMs3UOl+MB6N
X-Exchange-RoutingPolicyChecked:
	0dEkof/5Px+ElQ12/jHOniUo0bgGADAkUonvC6ayFrjxaQ8ouWHHcgruwVk/8rkd5w+pDRvwuaAaLriOIfXu1UaPPSnprERLOSKwMyXxla8sldUR1A2p8Akwp2DuZTkKHET/QZ/iFu9747FuUHBlWibvCTtu5uhJHCNXNet1xB12dBrXQc1Z4wMN+UEdLUcBfEvdFhrsgx1mPHsWXlsjFdvtJzhclh1ig+5otquV9C5nEAx2vwaPjlSBNMxo4J/yTyLAXvwSxrVSVMGZDT9sRVdDBj5iUya0i6ycJIHUg8qWlMDu+o5ZLdzC/4eTuecJSoF2MLXKR5xqkiE4NaKHSg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9cXqRBmjeRLB4N8poCsBDjYT+Ih4ALZiX40zzeo6fhK5O/RSmk1s2GZThJ41qgtrkTrHfJdU4jH7+6h4jLl9oMtUPFkPrb7oGQmw4e3MbY/biuiD13kqOCpzQ15Jd3eCDxHSDd0ou3r+0ynvwPWaXQnlTBJ2lkhy00DlOo5nB701UTzqmmsvMM1T7XvMdxJ5JnPW3qrQIYPrA4HcVaJwUNx95/HausgTRvyjpbp4wBrRGn6gdESF3P40QackJ76C2qL8RVJyM2aYkXYU4qNt5Prf1FNo+DaaUuUrK618CC0IlzFMqyxGkPs1N8xfVLxbcG+lFXtH4ULrOSYQI/jV/ykd8JG6J3xmDBbHRDHy/lLoa1vfw/CvEYca9Uc0YxbF+eNfW3UkAP692PaBXmZRLj5O3kKN0oCyYHKwChlbU2OBbVd7XKZcrD6UdVloJHYP5zygoVTp5jjt1lnNWl766mMb0r6dtCsgCaclWrjYZkjTDXHXGwWVlZ/FtKi1rO6PQuJGBhgcnGCAwtdqgCmLwlRjl09T+eMiJZICc29jRxkdH4gT+D9PymGIQ3CGAYm+TGwaP7X4YTqRbtwzp3r1hr34rhGQFWAGFhkNwKgnu3NZrIbpXj57+DEf86D4yVd5nkfZ2IQjheAXkMbfhZtmGw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:35.5923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c363a1d9-8767-406e-a79c-08df402cc638
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6332
X-Proofpoint-ORIG-GUID: wWGa4xwtg9PG6VmqvWfiby2vGxQAubuj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXzK+aAdvSFCJz
 YthFZ0PlTz6UyiK8sKThq3vuVvPwo06e01agQdtmQ5p1vS6QoELAkgssKKaRmJz8bCltFE/N5i1
 QCi58GHnONqkHQIAMGLQWPDGXd9A26AgjPAFBcWcEchqQKppII3f
X-Proofpoint-GUID: wWGa4xwtg9PG6VmqvWfiby2vGxQAubuj
X-Authority-Analysis: v=2.4 cv=cdVHPXDM c=1 sm=1 tr=0 ts=6af4c697 cx=c_pps
 a=JgOmb2+ItGzuqF5frRSN9Q==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=cbNQJ9GKAAAA:8
 a=uA07Tb_QpJ_SVJTQTaEA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXxapt80n9LEz3
 7X5Eceo9b7bS6xIO5Io6LZJshWOfRc10DWz6zsEw1NHIBXDdyXpoinC6OfPP83QfL1Qnl+iMEyM
 fWZ4NKWiGQ/Ch0rMgNL7PiQlyrWPa0/7gJWrDofUgjxYMSqWi5TCqMwNe08fPl6CieQFWNEXP+G
 mt5soq2gTccqBhdsT6JVulMSBHGp0LRccZ2ChH4nszIDTulHBalGxvBGDFcpKJhMA7R2HJ4lKp1
 AiEemZWJlRuB8RF0cL/UTX3WvBZOBK9lA2OJhnhvMmdc1QZ9j+LE4/WenU24avOU6hI+mz/TJDX
 WoIkfWVAkLXV1pUlTgRyISNRx++PfCm2lw+an6QLEKb8VHK4vhj8WtAJdqFl05VcagXxqUq938W
 PXJW64HRJ/raOcb3vISPdP3wf7kNLkjQyp0/5fh/FaLkRsLnw4pmUrJKtCJaEy40sU86amoC51c
 jq9RXvb5TMiX3o/x8uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-c1860d/1794426521-D775B87B-DA3EF37F/0/0
X-purgate-type: clean
X-purgate-size: 4690
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add MCR/MSR registers emulation to the I/O port handler.

Add implementation of ns16x50_iir_check_msi().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 76 ++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index e80815ccf6e2..9f530e589495 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -69,6 +69,10 @@ do { \
  */
 #define UART_LSR_MASK           (UART_LSR_OE | UART_LSR_BI)
 
+#define UART_MCR_MASK           (UART_MCR_DTR | UART_MCR_RTS | \
+                                 UART_MCR_OUT1 | UART_MCR_OUT2 | \
+                                 UART_MCR_LOOP)
+
 /*
  * Number of supported registers in the UART.
  */
@@ -136,7 +140,7 @@ static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
 
 static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
 {
-    return false;
+    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
 }
 
 /*
@@ -193,6 +197,13 @@ static void ns16x50_irq_check(struct vuart_ns16x50 *vdev)
     uint8_t iir = ns16x50_iir_get(vdev);
     bool asserted = !(iir & UART_IIR_NOINT);
 
+    /*
+     * On a PC-compatible UART OUT2 gates the ISA interrupt.
+     * Linux'es autoconfig_irq() expects when it toggles MCR.OUT2 during IRQ
+     * probing.
+     */
+    asserted &= !!(vdev->regs[UART_MCR] & UART_MCR_OUT2);
+
     if ( asserted == vdev->irq_asserted )
         return;
 
@@ -254,12 +265,63 @@ static int ns16x50_io_write8(
         regs[UART_LCR] = val;
         break;
 
+    case UART_MCR: {
+        uint8_t msr_curr, msr_next, msr_delta;
+
+        msr_curr = regs[UART_MSR];
+        msr_next = 0;
+        msr_delta = 0;
+
+        if ( val & UART_MCR_RSRVD0 )
+            ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %#x\n",
+                         UART_MCR_RSRVD0);
+
+        if ( val & UART_MCR_TCRTLR )
+            ns16x50_warn(vdev, "MCR: not supported: %#x\n",
+                         UART_MCR_TCRTLR);
+
+        if ( val & UART_MCR_RSRVD1 )
+            ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %#x\n",
+                         UART_MCR_RSRVD1);
+
+        /* Set modem status */
+        if ( val & UART_MCR_LOOP )
+        {
+            if ( val & UART_MCR_DTR )
+                msr_next |= UART_MSR_DSR;
+            if ( val & UART_MCR_RTS )
+                msr_next |= UART_MSR_CTS;
+            if ( val & UART_MCR_OUT1 )
+                msr_next |= UART_MSR_RI;
+            if ( val & UART_MCR_OUT2 )
+                msr_next |= UART_MSR_DCD;
+        }
+        else
+            msr_next |= UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
+
+        /* Calculate changes in modem status */
+        if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
+            msr_delta |= UART_MSR_DCTS;
+        if ( (msr_curr & UART_MSR_DSR) ^ (msr_next & UART_MSR_DSR) )
+            msr_delta |= UART_MSR_DDSR;
+        if ( !(msr_curr & UART_MSR_RI) && (msr_next & UART_MSR_RI) )
+            msr_delta |= UART_MSR_TERI;
+        if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
+            msr_delta |= UART_MSR_DDCD;
+
+        regs[UART_MCR] = val & UART_MCR_MASK;
+        regs[UART_MSR] = msr_next | msr_delta;
+
+        break;
+    }
+
     /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
     case UART_SCR:
         regs[UART_SCR] = val;
         break;
 
     case UART_LSR: /* RO */
+    case UART_MSR: /* RO */
     default:
         rc = -EINVAL;
         break;
@@ -360,11 +422,20 @@ static int ns16x50_io_read8(
         val = regs[UART_LCR];
         break;
 
+    case UART_MCR:
+        val = regs[UART_MCR];
+        break;
+
     case UART_LSR:
         val = regs[UART_LSR];
         regs[UART_LSR] = val & ~UART_LSR_MASK;
         break;
 
+    case UART_MSR:
+        val = regs[UART_MSR];
+        regs[UART_MSR] &= ~UART_MSR_CHANGE;
+        break;
+
     case UART_SCR:
         val = regs[UART_SCR];
         break;
@@ -529,6 +600,9 @@ static void ns16x50_reset(struct vuart_ns16x50 *vdev)
     vdev->irq_asserted = false;
 
     vdev->regs[UART_LSR] = UART_LSR_THRE | UART_LSR_TEMT;
+    vdev->regs[UART_MSR] = UART_MSR_DCD |
+                           UART_MSR_DSR |
+                           UART_MSR_CTS;
 
     /* NB: report 115200 baud rate. */
     vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & UINT8_MAX;
-- 
2.56.0


