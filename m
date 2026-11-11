Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C106606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=m5Qcni7g;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=McCtXJTJ;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Zu1DBPvt;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=D1zFb+DF
Received: from list by lists.xenproject.org with outflank-mailman.1484930.1688284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRELy-000490-PB; Wed, 11 Nov 2026 19:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484930.1688284; Wed, 11 Nov 2026 19:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRELy-00048X-Lb; Wed, 11 Nov 2026 19:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1484930;
 Wed, 11 Nov 2026 19:51:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xRELy-00045k-4G
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:51:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRELx-001WVa-H8
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:51:29 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c73a-2eae-0a2a0a5409dd-0a2a45068760-6
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:29 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c73f-195a-0a2a45060019-94a39217dfd8-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:29 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYk562829567
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:27 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuxm9qgx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:27 +0000 (GMT)
Received: from CH2PR11CA0021.namprd11.prod.outlook.com (2603:10b6:610:54::31)
 by DS6PR16MB566951.namprd16.prod.outlook.com (2603:10b6:8:4a5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:51:23 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::44) by CH2PR11CA0021.outlook.office365.com
 (2603:10b6:610:54::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:51:23 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:51:23 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXMak075518
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:22 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkwgn2jh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:22 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id RELnxf8EAQVyyRELnxGApd; Wed, 11 Nov 2026 19:51:21 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Hyp
	WmXGSVJwaNtFzb83l9/dq/EobfE2tMNYmNPwO1yg=; b=m5Qcni7gaUXaMY9bXDu
	o+y3DkPflEwsqLZNfNCWxpvvjWoHiJYJPDKtyAfqfk9yxcruI5PIXXsaZk0cGteK
	NlrCdPKKQbb2yRtdjAoR8wDpSMJt186fvFDfiJrHFD6DdguHJegCLvGSSKile28W
	N5ZuVstS82MUR3ZfAEAiaopgQKw1DfYA8WsTF7Vo3tnmchW64ysR7h3bLwNPpC7O
	q6vrwabg5Z3Syp9rcmCZ4+impVdy7VbhbvUBuVXe7sC+Rq+NehpN5P7iW/fmVDKc
	8qQNfG3dMxgFbO8IjhXspcJif9YK5GT9OVABvhVqbIfl8PjTYmbUsX2YqQheqd5U
	osA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATmapbIywWhfHyMuScmYXms/V9DuKbGZDw6f9QCgZubO5JwymICq7cQ8KoWDItbU3qbFqB/q+36UcltTuXw8VRWRNq7SX+WT5+pRfDUoc3Q8DkR8fEDBGVvkA0fc7Bhzt2ZYwkdOTK84x0gUT8fY2q21wr9SoymLdOp3B4j0ZGuqzIArsy2wMbYrsjC3m1Gh+VVuDiY6q9D0KEndukjct71XN9LcHJSXvuX5aJ/FuBKoQZ768RNxnQ8/n0hwBX5XanFxrAt5fyHng1RpWhKbQv/lSxa9VVON4wh17gTQ/w8Lx7qoVOf9tpSfmx+dWPJYFsBEx+Yt9lbafQSTwXes9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HypWmXGSVJwaNtFzb83l9/dq/EobfE2tMNYmNPwO1yg=;
 b=UzCZqX3X66eBDASKhLpKHW8fwIOPlF1yl6DZQ+lEHni69FX5UiQseA60d1dEfCpL6TgrNFyHmzVmt99qYtKCwkUN+J3Sg4PAir8FiDlSoj8N+PhMJp984ezMazoonpo5zuQV2yh9J7F7TKFCeeMo6cu/kdOE5cPOCKL8gTHOc+IbGGDM1jJMVLXxMoGGF3W0Y6HhUo5MgoZciWGyfBPG5eQU5/pJiQ5+k5pAutX8Y1afR5ariqB/65B70r4BPuUmV5y9t7tSXo9qtUwOyPqro2KqnMC9C9fPjMffKvxXFfiOT7tK297WNaiLtvumox2ZOFP3sU4uL8SjcPzd/osMBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HypWmXGSVJwaNtFzb83l9/dq/EobfE2tMNYmNPwO1yg=;
 b=McCtXJTJ80dFCj6Paqta6R08diybjC25aX/HTKBiXj2Taweytub4soGF9x/chDbdvyc97aZsVA3QXpGRf580izjzV5iV2V9muoFFrF77sqTmCmnphUHEdVkxIenSCNcOWHv0YiLLF5rxrZgGmnDPkeSdouVf+EtLSwhjHzGEI7k=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=HypWmXGSVJwaNtFzb83l9/dq/EobfE2tMNYmNPwO1yg=; b=
	Zu1DBPvtrgC89dfMsgwaHUQpI55+EZI+xr0C86qIwlzN+psq95MIXwqmEiGsErGi
	4rMpkkXIpPVvV+FUGUNQV3QlsOXCAcVD0AzVAcNfkPh7sT//D/iZR7z5STlh1AFJ
	dKJmM4ExgTub3pgF/9y15UpnuVJzijm0D+fiiHARv+Yaod5ou2un63t73pGJ8yKI
	WhapQJq0URNF2opTw7CAufao6L+VPakglAmeWMPT2HVRBJJAkT+1CynPmUz4mEAR
	eOMh/ppf1GXAEOOg05kw5y1l1PGreBrwaphbgy9AtbRxhgQ9zVgPPBnBRCbLkTly
	sXCca1jMEUTXHhXvkUFHRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=HypWmXG
	SVJwaNtFzb83l9/dq/EobfE2tMNYmNPwO1yg=; b=D1zFb+DFesAr9d1DwZse5Dt
	0b98FMiMoh201SEGgCJI656pxLadLMkm1ntqndqUc8u6TzFEMQXMCpo/fowlI2gc
	mEtuAvpB1VGPjduHaWPIPAqUnoLjBLgDi6u3xckbbAgpaADQNX6jQZ0nDpESYbng
	vdygkVWbhTar8j+ez+W7FDz2rL7TDLpygciq9S4Jl36Z1UL8HSKXbEDqLBJwQZ2H
	kc8eLd/iBHKQsIKVa7M5LE3ntng8hzAEzEnyBqOn3ZZ7ADFmHEfZb9Zs3HaPMUeR
	haNm9+FYuvlck1CdaZ2FbxIKIJJ6qm4OOOtr/R3WBrXctHW6mBNZAfCBoZ8GFKw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RELnxf8EAQVyyRELnxGApd
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 2/6] x86: introduce cpu_relax()
Date: Wed, 11 Nov 2026 11:51:05 -0800
Message-ID: <20261111195109.1070169-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111195109.1070169-1-dmukhin@ford.com>
References: <20261111195109.1070169-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|DS6PR16MB566951:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b9c8e0fa-c029-4975-2610-08df402d2a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|10067099003|11063799006|56012099006|261021121427099003|261026140227099003|261022105027099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XwUCtzYPX8T0Ot0+y31hKe/saStWn28S+M04M+RAJvm5YcpP+2X8w73AN1ywZa2wg4/GB1pJzgb3p8giSC2qiKCU/Mth93TgAtG6I7qTvLG+5ZeCRJ8I6ZTBHOf2083vZsOmPc5jqVaVZvSbgZqJzHyHk5omd2pM3wD5qvttOhmI+ciD1dMGD9Mduhufs3Z+P0f2JSnUJ97NCj1bsIo7yRkQyk3WaiRZiqY4dh6IjAnbCLZPLmD+scIxzq9OP1xOm6SwoXCN/gBhGVwSv1GnLSGuEJc51foUqZ30XpPtelcEyM9Sg9fvHoWMu+iMwZRKzo8icAxGYBdfR8XBjJaZ7VOiczbIt7Pwxd2d11+JZbuuokboVdNvRFsqzlFPjosnu7l2NwagueBfVcq9uuhFJdgho/2+TBIT5nxSo+FTDXmEp/7AH7VvN692uzU8RYrIOb9JsXqOetk/Z3JrdYzE87zsA7BZZBlHyhFrBjgLk6GdRtr2QoHxY4aCulL8OAURMg5AVbnCdhHWA8vP2T39Y9zQLZjLY90by7tedhJLtlZoMb7Wo5/L3bmzgQR3aMjmIt0FoEc4OE8hwqsb5FI7heQOL+pgKY9hmLj58rg3J+CmYwwtutTarLLnfE5EctVpdDJec0pJvtRSy770oU71EAui0NxnjXQ5PmquVp1hDm1kevYXcguLda0tf2oOwqyA0GKF4xkIRJEWpMgXWKzxmA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261026140227099003)(261022105027099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AGeU9BLV2yHCnI+T57EqXbNwoHHdo8bqeqm/JOx4CU5mUGKyYn9kWSkdg6/KvuKyZHhBfAM8jYFG6OmjK0b+g8kL0VM/HTBjJHsEGmM4SsVHJk4IHIOrShf3N5S2j2yQcFtPOkjQfltmRSghD9GUAiCkBwclAgtShhhRRoZXZTKf5P4GjAurUj2aWBOJK4ZLkgohvIS4k33sgyAHD0FVtNwb6moaw9jN7H5I0UGwWXzXJdaA4v/tp4BHEI0yhIixiVA4ybRG5A72lNF8V9b5wVDs0WYkg9dsspmHd3aA203ZBAVxpjYr5kBdG80NOdm7Q4Dqmd1IRrz30oP89Ga5+wvnnZ4WqJ8M599gWJxiIUCbZx+XhbIBMF7kgelE+UAksfC4rwfJMaIXRQ4I3sDIeC0LuWmPCF2e4YN2nfhnLT+ya4eeLALHWx+NkymDBHa+
X-Exchange-RoutingPolicyChecked:
	uPZRxKM2sJ0y/j8UFrRz7KGhHeNklF0Nr8exrWKpIyojuvtfC49NNFLkRnRjg742QsjT8ye9uEU8umHwH32UnyspjN4FO7hgikFX+P0ENelbcNhf+azW04qT0MMjaDgKbYmXMQg77xlCl8H4hi4SW/uu4IwaessxAtOsBdaYirUDrTcUExr/1wom39LL3682qN+gHupKv83GP7QcXXgjTyfzRxerBngghDlc+/ZoGyTfX182rexCkCTzBsgdlWCTb1J1ZCrQCsetxcqQYs6bo8aPUGnDSKmZFWoFPE35SE+Qey9ijrnE0UyGfSkXzoK7/a0TVWhwSpkLVb9awjFWUQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	064oIqzBjqpmmb/qd3DEjbrLvyhPuGFtMDloTk8K9tTfIhqgydS1ld9tzUca1ZUn+mbnvwCQfoD5Cry6D86TuzCDiQj5nZGeylhqaWWsY4rXf3qj121FTx6w4GQc3dii9VuZLTouYK2nE5PcvptnK+PLR0WDzumAMCjrOYwOMX1SdohQRtZxnJ++aMjMP6r+wl+IWBmzwZzgy+X4cxJHV88w2bF5oRuW2XCyiY+3t/T1y0l44YxSlZsfOUnV3qyXKuyzu4RoccrMEU8uQQIW6viu325ArXAKegmvT8DHus5xvtfvVrJsg9jTtW7Es54+XLF31o45fanj/afOkiWyaal8Qg/XPPTf4r7HBY49SPkDrPIQwN6fqFCMONkLzoJla70E/j2frG/DKcQpeAZf1Et1ioSvatIAxQtQ1pqGylVuA/mx4+XESWzxyr0E9/S+4Zeg41J+M03FFQa8U/P0oULVEST3saWEuVtJQ5hwgNNUYsNVB7sGMZxEpyT4RvStRANnlks08SfnPYpxltEY3mQTEo3538pKhOyj5zXLsEX00e1Ou0LRpjYYpEPF19Fq1QXysjTZyMbrZpat1qyb6HOXYujidrwsDiZBhCY3JzO9NhSrwTJWoo5Cz5VZTglfXhMEY0JljMlSgtmF7+VOAQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:51:23.2416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c8e0fa-c029-4975-2610-08df402d2a1f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR16MB566951
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX/Aib7Mh9hKyN
 olFXL5AgmQ/3jCZDlG71nEIU6e0fqtLPNO6aU0XKi4O2pf/qwxSwNSn5yLzJzyoa1EU40SLbvzB
 dkWhyhIp8KpqdrjGDdyAlPqx2BEF4FzULfALuJsueScqoRtqJRu0
X-Proofpoint-GUID: 7_FrrMSwE-79-wlH6wfbRTgbjj364VBX
X-Authority-Analysis: v=2.4 cv=ZKBCCn7b c=1 sm=1 tr=0 ts=6af4c73f cx=c_pps
 a=P8hJoqhRnqo/cwUvmyxmUw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=oX6sQOh5f4QriJ02HC0A:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXzTTMhSeK+aly
 hUpo7dfwv0fjZxR0oefWqE6uTllLm9dTIKIbTvQ1GKDKp5P4ZT7GpEyBjYZWlATVYwrxYRqvEzc
 6J67JyD/QL2zL1A0RjAv7njPbdKt+6ZjN9bQ3J8Fd+OxIzNudYJ8AII3zfo1XJjMJlYgFnKOyPz
 3Z1o4CuYN3SkT46vh5xHsQNJKIsmxNnWh9VBlKe75xZW7xiMxp8mfZyKTgv/Cr+61cbeO7YTkmp
 DmlbaAOjtR17AifT/Bqa0aA7E35gc5XJVx/zz3KM437Rrw46oBAOpCYJwPaElrhf09xC0HdXukY
 o2f1wcdi+D5V0+yboqDWVk3cmMbwWdnmpPfJcxUVPni2+viRxOsc+lIiq5xHvyjFVh7UruxL0pn
 wYkLER9zoLkrMFpicwinh3uXwuYKx7sfS0f3LR7f7fAbtgI81ig8rQ8BxfvnMVxQAcCdXzTrhu3
 irwsy/qy1pZH+kIVGcQ==
X-Proofpoint-ORIG-GUID: 7_FrrMSwE-79-wlH6wfbRTgbjj364VBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-16d1c6/1794426689-F6C7777B-7F78FBE4/0/0
X-purgate-type: clean
X-purgate-size: 636
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 arch/x86/include/arch/processor.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/include/arch/processor.h b/arch/x86/include/arch/processor.h
index 9cf2fe08669f..9db352f18c7c 100644
--- a/arch/x86/include/arch/processor.h
+++ b/arch/x86/include/arch/processor.h
@@ -190,6 +190,9 @@
 #define X86_SEL_GDT       0
 #define X86_SEL_LDT       X86_SEL_TI
 
+/* Pause for busy-wait loops. */
+#define cpu_relax()       asm volatile ( "pause" ::: "memory" )
+
 #endif /* XTF_X86_PROCESSOR_H */
 
 /*
-- 
2.56.0


