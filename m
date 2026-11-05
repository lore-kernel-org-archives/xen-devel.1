Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593E2606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=ex7o79w4;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=kNMoRiBS;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=OtqrAVQT;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=vBf4avrC
Received: from list by lists.xenproject.org with outflank-mailman.1473216.1680873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNZ-0007k4-AR; Thu, 05 Nov 2026 01:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473216.1680873; Thu, 05 Nov 2026 01:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNZ-0007jY-4m; Thu, 05 Nov 2026 01:35:01 +0000
Received: by outflank-mailman (input) for mailman id 1473216;
 Thu, 05 Nov 2026 01:34:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNX-0007SG-5k
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNW-000xGY-IA
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:58 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd3a-bab6-0a2a0a5309dd-0a2a4505ed80-8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:58 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd40-4cb1-0a2a45050019-94a3921731ec-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:58 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mYSf1469773
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:56 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013002.outbound.protection.outlook.com
 [40.107.201.2])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdk511hm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:56 +0000 (GMT)
Received: from MW4PR03CA0302.namprd03.prod.outlook.com (2603:10b6:303:dd::7)
 by SA5PPF62FFCEA39.namprd16.prod.outlook.com (2603:10b6:80f:fc04::910) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 01:34:45 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::94) by MW4PR03CA0302.outlook.office365.com
 (2603:10b6:303:dd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.21 via Frontend Transport; Thu, 5
 Nov 2026 01:34:44 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:44 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50noKJ3231662
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:44 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrnp92-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:43 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmNFxugmKz55iOmNGxXIW4; Thu, 05 Nov 2026 01:34:43 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Kgg
	dkTBONLpG3Nrk6HtndLPsZ+Hk+ameXYc1oBVj1jM=; b=ex7o79w4fmZ5/WZnAG1
	v7iv4nv6IgvhF58XClz8hOpB20JuJ9ISzQ4W7H16BcIfC/iN9rrsM4ucMGxfELj3
	j0hpFGqa50l2F2r35UPmN2CNlSnirlwVFbmfthfS7YNeD8CAIVPPUrIuLk5dKfAd
	F6euxmwQZ5KvpnQMz/TL5PSJDKO+2sTSjHCIGcMcv3OPlOYCWvBHHyi5+fiXGt3l
	h3lwVuuCv1Ng3k0bD99RykpSLrmi3XyvE3DO6ziDps9Ix+sHe62FsdJ0ujqFC2Xm
	szAZioVBaB4fAEJMiQU/JimlkhNG4v1cJJr2x1k1dnjRHK7Tb/TawH62cMmXaRII
	qRQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3cqgSjQWL1rGQ7+QDQ1iuOuiN3hVZFD13jEFym2HzTqGYMkfvNQRk7KKCIk+497ASNx8HUouH28/TogxpH6r3eb5C1bhmvhy8OFW5495s+LSTTiHNqvMjntvtsAxoeMENpmVXyjeDIrqwhoadhOi48ShlYAnSVSm3f0ytl051uVy8W5oik1Ol1I5GJYnnpzhvkam5SgfeJiginNYasRt0UwTcI/a3fu2HD0PdTXiNZiPJWgnoUnTyjtK8h4f1lI5/eFdrdxtaIC3J1hKTUNTUD9U6kaOE6VOSWr0GvU4jxzTeNA88C8PqHGkFgKmwoP7Pom1xWYuLRfGHpIvBOBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KggdkTBONLpG3Nrk6HtndLPsZ+Hk+ameXYc1oBVj1jM=;
 b=k3h+IKAQA+GzIB1W0wgUMaDIOpUSSuLfcJh+FGNGB4/l366srjZw92fxz7fjYJ16e3qwYrSqLhZXVgpogKs8bOxBLR7NZLKhZYaeES/ZxoxLoYPkskTgwA2KwTjxVc8ahMjh/ao5IpAuN4UC1YUYxKhhETA8r3S6LFmK3sImLss98AOnb/b3XWxRYWtkEprGgvTeOI6aIORzWTWOUs1sxlzs9colKoRE1tn0SbdeKuyHrwmdfiiWK9U7b8eYdWHuiLyaymzhFrBxyytojBdgK4BJnPghIekOBUS7ywzQIr1lvKD8M6NDcMj5hIiYOqmw7c2ZYtZvZHt5xutKl1qH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KggdkTBONLpG3Nrk6HtndLPsZ+Hk+ameXYc1oBVj1jM=;
 b=kNMoRiBSo5eGXjGB3LrsrKhefcp5zR266IXbEjErAXWcKF0n/2tcf6fI7CCNfwi5SrfvJSip5wakcHNRuj46dagZJG7WKy7hEPWlfFQzIUimgs8wzTrqLW/HLj7uv0/DLeb2h4nlu/We50j/PDSVc+hUraxrf9HBoP2yRk2dIBE=
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
	ppserprodsaar; bh=KggdkTBONLpG3Nrk6HtndLPsZ+Hk+ameXYc1oBVj1jM=; b=
	OtqrAVQTTHyTG3PPKmWKbC2zcn+u2tb4tT1O7d0jo8B9PS39pG7GD07ctNpvwRCE
	z1qWh70JKh91dL1SN376TfDGA01ThBUKW3qdqai58djQocIn0n4R+BozN1vehN5J
	KgGDqxCrqRky1oAbGzIyccwr6XB4Q6+SPe9LdfiywaWNM894OZZ16mlmMIGHkZe3
	LV5xl+VLtV0jMpFFRd1xaIFyc4TnaTxmd7riG0wQwNP9l4Vg9UmKbD1dWCOqWHPI
	gkkDuRse0Egc7UCuaInLdVHclNZXnKWwC8tYjkVs4snsT5nBO7xL3zmRjHjS8eti
	Et+fuPeFDkvJmosxiWQwCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=KggdkTB
	ONLpG3Nrk6HtndLPsZ+Hk+ameXYc1oBVj1jM=; b=vBf4avrC1JQDWVz/O1IJUvS
	M3YVoPuCv7FccOQbIpX7BOhA4P6ptfjrPfs+MZzgZtJ9hnUctlmT5Ilvs/wtRZEZ
	WRSoTINM0Tpofgck2tWvWL470Yn8gtS3lfjukK6qXbEOCgrLHNMqnnmjtKbTXZaD
	DU1C18jm2ss7As5KO6De7GVw4Zy1DhOXRUc3Z9ttPFNLqDhnlwxuis6dLDQY/HJc
	RByrnSFNBhOis5JccIiK5EWC8TCTZbhkg/bXjEPwVwRcgI59gXd3QRdYuydRu/dB
	o8E6UrrVEzXyEAVAYzWofO9mKH6YweGcRe+GyEafOQTQscMIYeEqbxSInYTCXhQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNFxugmKz55iOmNGxXIW4
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 14/28] x86/hvm: vlapic: update signatures of both vlapic_{clear,test}_*
Date: Wed,  4 Nov 2026 17:33:31 -0800
Message-ID: <20261105013347.719392-15-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013347.719392-1-dmukhin@ford.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|SA5PPF62FFCEA39:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8587b89f-83e7-4023-4e3e-08df3adcf888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261028144727099003|261026140227099003|261102123227099003|261021123027099003|261009223027099003|261021121427099003|261021135927099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	MTk8XXRxqlbzou3/xpknZIYVD8LmIr2T7IoTnu92WhHmCtRIIWa+FxDNT7likvODJhi+WpgFr2TWYNIiKnEKv9g9F0CDFIwq5OkNW8ojOkBj/VQdai6CzHuxqbHj1I//7fddbcyoTRGFah/w9poFWKtqCIFU+/OPLPwgKKr87+i6LzbqwZKmIK29T0/xsedorH4EZF2VV22tA+c0OUL63wGSNz114g4nvlUEH/Vs1H6ibRg+gAguTKSyUj3YkF8ZP5B/CCWerFEbH0yuhNjWfV2J2ozcVPRXybiqPSWmWS6RWwjrR8RRM/zLxdkJ6aRZ8WbBD8KoP6Kv9Poz3DZuYJXfOoXIwGEfJqzRXG4KwgFqCgOrX2Evxfy2Ru9NBQZH5v+DluxMn78VdplI3bnveqqfACxekV7wyjTlGP5wNuR4hN7Ie8W89kbWlQEs1UxOICDMPIVXoHthvD0UospaqF5guxIGGL3TurCbWNhnoVKEWE7N0xL68QGdJ0cYf2zLLIS+pdIZg3IdcysQK2MDbdMZ2fr4RoFC55cc3UCQ74KOd6MTKw9B+TRx3Ys3ouZPfJKchVJwsYPLwaBtSJiqZT1yMHZD1hUUGO+UH/JtEptnVgfFhUeSJVDYdTLdfUmK64vW4gMWIaH4Z/ASQaocG6DsuHVOUKjrIMQLrbIzgdYv28NzAAH5qTHl2RqA9buA1pGqZciEu2XHPyM1EtitIQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261102123227099003)(261021123027099003)(261009223027099003)(261021121427099003)(261021135927099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E1tP51nUNcBc+4TQCnOaRk9B0OnVt2u9K1tIV19AmFtxyekpuMVPtYQo1iDxXlX1T2lSwLL0qLzpYOZEJKwVlXS0gi2/mGNnNI0pxltvbAUvZfNlMGdh2ELj4VW/3yr53ja9UoRYNDN6G9NagHDOSf/fPwP+T0ZL/+HexmX2WCeTSh8BA7tBsxXAxAt2Fb+o88uanp2r7qK0AlScevEhCKsC1bQhDKFFP3SClfgVCxrouVwXWRdwZNuqakUjmeSDGC3ID2vr4EL690rYldhwWTcAwV8ZMVvtYZ0Nx8kHyBI4hAOpVCt72qnQ+aOj52EpZ7zV/7TrHEILpZv6MFAsSUde8OlCK3JDHksLvd4eg1NeV3KFPk3Nkuec/IGb00mezancK2eRkWKA6my5DI14Ct9lrG8If6UGNZZuYXuO7H69r1ME7s2Mh0wfg3JCUley
X-Exchange-RoutingPolicyChecked:
	vJOM1YTQk+UduZCY+RL+YZc8VJ0UEeuIx3p1F/OMZ//4dWWlnAcXKp3fQeOBsyPHXE41hEgmUlOHlyhap0UA1hLEJZWj4xAj8sjgcG0V+016c42KTpQjXS8oSwq1ZM61YUx1ic9LvX/uZVXaK0RJ9T0d5yKoHWcrRmR09tgdwMk8BQGO982GaNNUDpC5WCK1JzI0D71a87xkE4Qzb0kRQdckD8PQXawnj2FV8TUoEC/vnWQyHzFTOxO/BBiBF8LG3niq7F96DvECRQ4/arnsf4CSexhm6493lkdFKxzcfyH1hJPoOJBVpKqtJ8BkjSccmPwGohaS1TttJiidBunpug==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rrGAJB2OI6WmT5qSfWvZ3htP+A4QGpWxeYd5JvDWMpqZXFkMajEV6xOfCoMUNlseBv8yrEH0O8GNCmmwKeEWa/1sSGqehiyM75Tp3GfB7GhYfbKh98kvigLopp0sMRjbP77iYTGx0kvUPE1LGUiE0cjsX0cuWAmYv9nKLrlQ9D3sESz/PIK4VLXVjChA2uRHGQlmlDjqM+QAC0h1bVtTnxQrcOIeWbgGRctkxAPhdGzfzqs6UMZu5UJYK+mEpSbUUUduHI6tCNXi/Vgw+L3jsHpZH8o/9gl9sajpVgOZ7Yxn83yQG/JeLJGyZZGsW60BQ5QL++kMP2YnNG/6W4sN6IeEj54W6YCOJ3SgPlaoqpUQAjNhiAW3jWRJe7JYe7v+S/xHHA46BLEH1EYjTTak5u0xOxjmgFTnczprecVGvK85wlv1xiW8jvEesdbJ81kljHSdw7JPr4ue+RvQuV4pvauGUWDZW59D259Y5RvBPCuTek/g8YOoJj5ddXOLk64toHBDOSG/xy9jezS/xRElDQ9tqeOH2UizHDO9SVRRvdfXscujzdJ5CX/JgL6aRtk8vSjvA/EYSMuyNda7TlgO7Q0yXcHx/33KnTwYRz7AgEdLdhVPuW1uXL/wqW/EgwyRICjsNqAyS0+lmm3fMEnUTA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:44.5479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8587b89f-83e7-4023-4e3e-08df3adcf888
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF62FFCEA39
X-Proofpoint-GUID: yGlsVi8ch0rTRn4Q8leWj6OgtYsQ-BD_
X-Proofpoint-ORIG-GUID: yGlsVi8ch0rTRn4Q8leWj6OgtYsQ-BD_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXzOIftse1mrFP
 5KnUhwAzGZ7mWLMnky5m58jhuRp/hQaauHjajxAeKT+q5njQKtlEhUzpUP/lu2MfTgFS2FqvgOn
 X0J/GcGTFUbmP8O/kloiob/pAmNCn+IWgP0lx1UUaRW8UQUJyWyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX43uSmvA4rz9g
 gUh5St1uhMVMzmAenS5tr8ugWEz8RjM5IBdI7Ti0r0iogoJS/ShvHuog0+ZUCxt5hHmv2lKb6Dd
 6Wjo8VVoOMlbIcfs+3J8TddrPs5uu3CmgGDI88BSPshBViSm8ueFOz+M97WG7MI3qFsNRkOQaj4
 xmui4coErXOjsMmTuTLrBp17sPtt8ClficS8yfAV5pG8SxlgNYeWO462AdbYdEy/TY0XOXy5+DI
 54SYleKCWMXM8Qa9c6hhkK9dbWc4K3FQ+hU0SUzc4ONntvykEiFAGlcgigycEpPyJ/p64YL3qCx
 8N2kUhSbXYz8MZvof8XDTO6eR1fhUWLXsbrRbZgaHusF14W4BBYrueMcDY2XshK775lSpSXlz+h
 2LeI8BfLOHIrqPtCw+eXzGOvEW3lTPY6DwmDx7a5Hm057gq2juC7qEFcZw4kpKi0/SdHFcUxOJv
 Ln/DOEuXypQvPKl6ypA==
X-Authority-Analysis: v=2.4 cv=BOImP1QG c=1 sm=1 tr=0 ts=6aebdd40 cx=c_pps
 a=uYXQfM3GD41LpGGBCGkGnQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=mmTB1-tFgOqA9qSa41MA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-c201ff/1793842498-71CA82A1-35597299/0/0
X-purgate-type: clean
X-purgate-size: 2027
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Update the signatures of both vlapic_{clear,test}_* calls to
pass 'struct vlapic *' as the first argument and correct 'vector'
to be 'uint8_t'.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/vlapic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index f929fdfd74ee..22c472d569b5 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -85,14 +85,14 @@ static int vlapic_find_highest_vector(const void *bitmap)
  * IRR-specific bitmap update & search routines.
  */
 
-static int vlapic_test_and_set_irr(int vector, struct vlapic *vlapic)
+static int vlapic_test_and_set_irr(struct vlapic *vlapic, uint8_t vec)
 {
-    return vlapic_test_and_set_vector(vector, &vlapic->regs->data[APIC_IRR]);
+    return vlapic_test_and_set_vector(vec, &vlapic->regs->data[APIC_IRR]);
 }
 
-static void vlapic_clear_irr(int vector, struct vlapic *vlapic)
+static void vlapic_clear_irr(struct vlapic *vlapic, uint8_t vec)
 {
-    vlapic_clear_vector(vector, &vlapic->regs->data[APIC_IRR]);
+    vlapic_clear_vector(vec, &vlapic->regs->data[APIC_IRR]);
 }
 
 static int vlapic_find_highest_irr(struct vlapic *vlapic)
@@ -166,7 +166,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
 
     if ( hvm_funcs.deliver_posted_intr )
         alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
-    else if ( !vlapic_test_and_set_irr(vec, vlapic) )
+    else if ( !vlapic_test_and_set_irr(vlapic, vec) )
         vcpu_kick(target);
 }
 
@@ -1414,7 +1414,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack)
          !viridian_synic_is_auto_eoi_sint(v, vector) )
         vlapic_set_vector(vector, &vlapic->regs->data[APIC_ISR]);
 
-    vlapic_clear_irr(vector, vlapic);
+    vlapic_clear_irr(vlapic, vector);
 
     return 1;
 }
-- 
2.55.0


