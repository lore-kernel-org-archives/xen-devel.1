Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED8FC44508
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 20:19:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363307.1615027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk64m-00062F-A5; Wed, 15 Jul 2026 20:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363307.1615027; Wed, 15 Jul 2026 20:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk64m-000628-6j; Wed, 15 Jul 2026 20:19:28 +0000
Received: by outflank-mailman (input) for mailman id 1363307;
 Wed, 15 Jul 2026 20:19:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wk64k-000622-KS
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 20:19:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wk64i-003bD2-FT
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 22:19:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb34-bab6-0a2a0a5309dd-0a2a450c9f50-22
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:24 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb4b-f479-0a2a450c0019-94a38ff1e344-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:24 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FKJK2j3596318
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 20:19:22 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013056.outbound.protection.outlook.com
 [40.107.201.56])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4fef36safr-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 20:19:22 +0000 (GMT)
Received: from SJ0PR13CA0132.namprd13.prod.outlook.com (2603:10b6:a03:2c6::17)
 by LV3PR16MB5598.namprd16.prod.outlook.com (2603:10b6:408:1e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 20:19:16 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::3b) by SJ0PR13CA0132.outlook.office365.com
 (2603:10b6:a03:2c6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Wed,
 15 Jul 2026 20:19:16 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 20:19:15 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FKICXn3692040
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:14 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fe3eu8x74-7
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:14 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id k64WwNIkQt7Zdk64XwpK6v; Wed, 15 Jul 2026 20:19:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=5LP
	Xre7WHxzRpNUWwTfqR7IVxEsybrZ0r9yBOHRPlAY=; b=Gr3Ex4fhqJFJ+PWqK63
	bNJbjxAeT7Dxbup06iCZMO2sv+oY70iI/mbHhURozI2qPnMr28EGC3FS2/9Zx6ZU
	6arvEWMOy+O4qBUnePCgiuAlLoY7V3+4uv/A4zsERrGnH9FYJ/piEImNN1BxT5fJ
	dofKhqhopwKvFcwm1QuxNfbXAcPX2aTl2CiObLqyOMwVFuELwTCaOKMexnmsXqz9
	jgzXYO2/6TsEnHbfk6UUGBaM+zKH2IN8bjmVGF6FJa9x/+cQA2WrxlwBbGQ2d7O/
	p1i7tDvRIiK0sYK/ehFeo3BNq6O38LfOQGgFNdtU746jyXwzZB/dvb/oHmPgvfW3
	BWg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iN0/RhDXiYZKkHFqFCQvshTZIggLuXNE+2CTczydI2lXAVxk10NzHVvx2xYZRZJ7OajAjLOlCoag33f0JWpgK3+9mITUMGRm0TfMIMaKvRdv9dC6dxGyAMnxD4DWh+AAa74nNlSDQeKtCIHe5ED+qx8Y+u+X7K7HsQgJwv6REwrVaQGGXIweyjI0F6pn9WQp26Ot9wthFNP8sgAcj9MnL1VESZq4fGGcB9Efkn835cIApeotOf/EF51eDm5FoYEokCSa0PWWdxo4GXhNBp6nJ0qVE2QZGyLXNAqdM4M2skuRv4IsK+lXTDvT0e/rt0HEXz+dpvtOdjfYAIFyOW44jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LPXre7WHxzRpNUWwTfqR7IVxEsybrZ0r9yBOHRPlAY=;
 b=ftZEIC8xwwoetHlDII521WnqszepaEhmuo0OtmE/7CEex/HVRNHzfmGeOTVl1+ayF8r5bkFz+q+xGaMqcipQzd26pOZlofnzFyBq6MdnAiVJjE63Mcr8ZCz3ZgMskVTC9tpooHyfs8yfeHzLZ5bhVNegwf/Hrubrgafj/Om52rMqcWbnMv1J82TYrqd0hrIS/KX44wHac16/2X8WSwqCJy+g/jaHK5Sq70eu7YgkuHzjEIGf13fb8JA+AU9/oqt0Eaf/5J20eApPC4fTsrFyXmcJn2WQ+lg9GCwkUzMqGl46u77D46GkATbVpwI/bdeFw5hWgjCcBudf3PCDbESL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LPXre7WHxzRpNUWwTfqR7IVxEsybrZ0r9yBOHRPlAY=;
 b=jrFjr+bCaEU2DmTpJg/3RvymCYYiHYYadBNJtWsBH+bFs+UwVgWKfb8rT7771XK+S+09lpzb4UVvNEOURx/p7edk2NpnZGbiZWTENaUcKE+bHdTGa6kzhdze2vk8Mr7XMdEa4O0ZT2Qeg2BAHNF1sDB06QmLxosYOCqFZXkSWqw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=5LPXre7WHxzRpNUWwTfqR7IVxEsybrZ0r9yBOHRPlAY=; b=
	ZNvwaW6misbBtaZftVaEDUFKxGyhVgU121d15ASeTOTdwSC7ibfGNSlU/AF6jF5d
	K3tZCzCHwZQbRY40jU34a2+uu5J6cI+mUTDoX2Q89EztAqHi5cfHgQNl981NBSBO
	FIG6QwDc108pPXIudgGpeEOH2+SNri1yDkTMWVxp6lO6zj/hifE6n1FYnmLRBbv4
	iJ0pWngiNLPhmYzxlUbWEvMYIOP+5cjp/HmmIFMnpjZWgX2dDXKze+gpXqNttXfO
	reb0njidT+nd3vgxuaZFK2TnaQ1dxFvr1pHGg27MsWhnAKOkqc6mUkLyuFgallpv
	D18tWrXVz45a8ScXL1pLlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=5LPXre7
	WHxzRpNUWwTfqR7IVxEsybrZ0r9yBOHRPlAY=; b=ta/bbgu/22sLy/ab5r1hV/6
	xrzc0zoQOnKRaLusivC9+iF4/+Ejyqr7R+e1g8Y+WBeLBM1B7cvWuiF2Zti7oH45
	QtN/zGE2Jg3Ly0ZDkGm9hwId//XaoayGz+Pd13nrpBeX/ANVOYqbNmkeWwtb7vIz
	uukTAh7Q0cH4PcWR60JB00C2LYrMTlJe2YEudIsGzc3NuVJxQoYN1WO5ZXZwY6ug
	1PVbjW6+ywVJncA7oLwAlDtD9QUfX5VK1jw3EDQQMlBvp5U2RQQ1fb4jEjCgOHON
	Ma734J0CV7O5O3qzLkqVQ58OZ2VCT30Cwmioa12uBXer4duqJL1d+6ij2cxvZ7g=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: k64WwNIkQt7Zdk64XwpK6v
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 2/4] xen/console: correct leaky-bucket rate limiter
Date: Wed, 15 Jul 2026 13:19:00 -0700
Message-ID: <20260715201902.2984407-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715201902.2984407-1-dmukhin@ford.com>
References: <20260715201902.2984407-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150203
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|LV3PR16MB5598:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a991b745-f816-4868-d664-08dee2ae57c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fsvKSvK7UwOBdGjoNyrhu2eLomTYDVvWg0U8NjlYS9FU8iFR+CpeEHOAXFW0GqxA6M+Gm16Pu86JPIEG505mFlgmjflvOanuXSPxC8ynWrBBLdhln290JCMPxkSQWTH5Z6R9m8ZJwYbxRIO3AQaVwWeUCn5p9JbG9NraTmKNABM+5cbufVBhQ/bc0JjlGvk8kVDL24lDjXks4DtC0DinwE8sd2nGtJk39qCU/FbfcBHs236NKodWrTnWlb72mgDemtGSkq63y3AoXUk9yhLPOHPizcdCPlE/LOLulOZIS10CmX4wP8t/Niv1ioxxJ2z8GK/rfgfyrG7ZzcAX9dQYADy5kNanQ56OJuTXdWWxfUpKwkYuwg2uSYid2/HVscRSDvZxDTo3sazxWZ5x5RZHQLI6NtlMugLR0jFDRfQ2QTMWhmI4cGDclkVzrqOq6wl4Ip7sz/m2Pfpzgubv7/XydlLyIAmDLa8Z3eCQQ9mVWTkAqEhwjNsor0jFopKLB/kRzhuW6VmmblZ/420Ji9uueDKqSv7iq0/L0ZpSrwESkAqyUb22Ox6qWBvFvHuiRkjwv5voQN5GH/FW/D1fz9MZ/VqUgAOPOeWtWhhCf8pMpe51NlIiLDFFPYJ5Q9+brSyOMpeLjrucXsoQukuyykGxw6baN5pWNqcRpJU4bmrK9yQu/MPey8/QJmZ+qkFPFjiU1uZaDCoA9IJZbU/bkrZlsg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h0Y5L0jGZXZo9ZWzZl3knZNFR8EU+hGjIhEH0YtnnOHbh+PQfwrkWO4++FPP34dZEsPL5TWNsyqwU7N0BpmvS6q2SA3DU9CIeR7TbRz5GKGyX3jf6H1aRXIxX01cND/49DfmdaeReNzwHDUC7A0x3DZs/MYkkTq0LiRQTU9tL1u86RWbjkOtt7GlUSL5AVixJEJ5vBLALjS6RFdGpuWPXIl3Z7RY4urxR43KFLi161wnkHV259l9HniFpDOSn1LLXWx9/W5+Quin0sHvgdkTUHUQsh+0Hye6QzzDa6X6ZwnvYi/IA++3DOt95mDdbkh5ibaDs9R6Ka+MLWeDwWi1x7Bp3nBE4U4rSelpBr7uL7JUGB/E/BFjKkfd0/fJbtKpXXeGvCCZocD7i65nKmdBkBZ1ECri+oN0WPcuMwbCLHD7GzNT4iK0EpQPBXNdhHtt
X-Exchange-RoutingPolicyChecked:
	lt/e39y/+Gj7b1MNtOSEXhGNo7wraYU45PCEhCd6F/ZpM/rj7cBlvSqU+2QsNuGKFQy3ktfyuWs5YWGiCwlfCykvzX6J15kdNdNNJdMgv7+ROpT8DZKnnzrzkhmPis0h9Jq9wI4qufMaLI/NWKftAVWWdeIwfacjV0oqXwEroDCxbjtFBHaOpdDGbtVk5BABquM9ROAxGe7glgRVsyO0L+cISDXq+uZx+IF/l+8BV/VtXO+J25NzF+vp47KY6H2zotoVKayrVgHCVG9HR5Dh/yb3IlvHwV6VO2QCqtJbzwplXmP9qXT1wchywlVpgrIPI/LrXHPBjcwciya3MAWLnw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ok7eI+g34z+p097+Bmao6nhA7sDSzCIadXF7yuGD7T+7WRtmyBDaDE7A84ShOYAC54oTsoNAobrx3ePEmN/W9bKlOdoyFNQlMhS5GfJ47araEjQYTS6PvdwAQxO6Ewl26WTOCKtjsfnpSIVsnSs+UMpymuszohTxPAtl3oRnRLzp89olUBdQmlMeXTBComIXca3ldmWaHyxhtzwPrxvoOaXczqNlrNXtU4l44zqmN1Cj7djmga2fy96yC0NW2mkXVYGvmiGQjbUjbBta4go3XrfZ+EiPI3cpOHY5CleYR0tnFONrQYhN01LNOEUWaN9b7qNcckmBFxiiG9wIpqX514/AKpnNsZG1eE5IDtDydUj/OImBGR8F63wDm1/5t/rm6H21s2Pe0p59I1Ac9cEfrVgbe/d3N++Zny7UHiwJNnTZ40b6nTHGdV9dKH44BAa7tdCzdFgBewHfCyN+7/JpRGjxUbQwH1J8DA16yhyuL2vFIsrnhDQIictZ+zsgyBrrAwSx24Gt6sMvtKPZePZVcFOVXf9hSJVCaIBXadp0WrhU69wBzrE+x82/uU6lLe0u9sVoLSet+autdDWbQ/gFL0PPNwE9RA4rDvh4s2P1e8CqQougfgPhcdb4Blq+844J0lHY0hgnssGSeRDQKA9esQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:19:15.5027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a991b745-f816-4868-d664-08dee2ae57c4
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB5598
X-Proofpoint-GUID: hepNAJkcW8etb253cbj--kuPvujRQJF_
X-Authority-Analysis: v=2.4 cv=FZcHAp+6 c=1 sm=1 tr=0 ts=6a57eb4a cx=c_pps
 a=NVF+LlzI6OJHpaJcpVMg1w==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=cbNQJ9GKAAAA:8
 a=LB0Ib6n2NbWcIVi9NEwA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX4ENuFz6MOKg7
 2p6P6OKp59jfTxy2/gu/O+7cWQSwM7PdIXxvhvcmkAc+w8xcxrNbC04q6A5gkqFB39SKs9+//d0
 4ZR3zpimnzjbn5khL4BkgLggBEIhCgW0groGxZgSpgETE9NQjnDCbxXRRzTFbHEE9ZY+CXhBlU/
 8wsY7V1aEJ1l8+5yBdHp9qenyPw7rq5QVFO6fdqx+h4T2LMUim/lvb+zMe0caXKkBXLc3T9QTMc
 4jvaDKllgeVvSERNoh9uGeA0ue20jwOCNc8l2Y9RSn/kWDh2sXj7jjBkOEE2P2gXd/lqH1KUQa3
 7TpbZ4J4b5RUryJLJhbt+/ba3MNEOpdlMcjNoriSBkVl/O1Qch+djQJ8p83AODKTHyJ9qBO+UcW
 ao2jQBvfrpuJUTvZjeBdTdmMiIENM5wCbwhi4i8z6e531WFHD0kUBb5GmghcokZMYFZFcPI/AuE
 5VIbJfg+HxcPMOX6GOg==
X-Proofpoint-ORIG-GUID: hepNAJkcW8etb253cbj--kuPvujRQJF_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX2+NTxcOkDJF/
 R9CN3VuBA4xMObjMx2WkYIwaWWH5E4XCHnDRUVcHDdD7bCeUe6FE78/z7vyDel5JgUGH5N4SnkS
 WganGEO+wAkvrUKtkvLIIcmnLWFDcqTnYIwPmD80uFASJhDPzRL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150203
X-purgate-ID: tlsNG-d25034/1784146764-776D6A5B-9B91C767/0/0
X-purgate-type: clean
X-purgate-size: 1974

From: Denis Mukhin <dmukhin@ford.com> 

Use existing printk_ratelimit_ms and printk_ratelimit_burst variables in
do_printk_ratelimit() instead of hardcoded values 5000 and 10 respectively.

Ensure rate limiter is disabled if either printk_ratelimit_ms or
printk_ratelimit_burst is 0. Make sure no unnecessary initialization is done
in the corner case.

Also, simplify the limiter code by using min().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- fixed typing and 32-bit integer overflow problem
---
 xen/drivers/char/console.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 5d395f882e08..de9f2432445d 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1274,21 +1274,26 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
                         unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
-    static unsigned long toks = 10 * 5 * 1000;
-    static unsigned long last_msg;
+    static unsigned long long toks, last_msg;
     static unsigned int missed;
+    unsigned long long now, limit;
     unsigned long flags;
-    unsigned long long now = NOW(); /* ns */
-    unsigned long ms;
+    s_time_t ms;
 
-    do_div(now, 1000000);
-    ms = (unsigned long)now;
+    if ( !ratelimit_burst || !ratelimit_burst )
+        return true;
+
+    limit = min(ratelimit_burst * ratelimit_ms, UINT_MAX);
+    if ( !toks )
+        toks = limit;
+
+    now = NOW(); /* ns */
+    ms = do_div(now, MILLISECS(1));
 
     spin_lock_irqsave(&ratelimit_lock, flags);
     toks += ms - last_msg;
     last_msg = ms;
-    if ( toks > (ratelimit_burst * ratelimit_ms))
-        toks = ratelimit_burst * ratelimit_ms;
+    toks = min(toks, limit);
     if ( toks >= ratelimit_ms )
     {
         unsigned int lost = missed;
-- 
2.54.0


