Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15521606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=mZZEBEXJ;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=AXA9Iqvz;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=ny2/Ae/5;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=PSn9ANwt
Received: from list by lists.xenproject.org with outflank-mailman.1484932.1688298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREM6-0004gY-4G; Wed, 11 Nov 2026 19:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484932.1688298; Wed, 11 Nov 2026 19:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREM6-0004gO-1F; Wed, 11 Nov 2026 19:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1484932;
 Wed, 11 Nov 2026 19:51:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREM4-0004eM-Is
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:51:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREM3-001WVa-VM
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:51:35 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c73a-2eae-0a2a0a5409dd-0a2a45068760-14
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:35 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c746-195a-0a2a45060019-94a38ff19fc6-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:35 +0100
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYWit2293537
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:34 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuayj4cn-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:34 +0000 (GMT)
Received: from BYAPR21CA0008.namprd21.prod.outlook.com (2603:10b6:a03:114::18)
 by LV0PR16MB7138.namprd16.prod.outlook.com (2603:10b6:408:32b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:51:30 +0000
Received: from CO1PEPF00018863.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::1a) by BYAPR21CA0008.outlook.office365.com
 (2603:10b6:a03:114::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Wed, 11
 Nov 2026 19:51:30 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CO1PEPF00018863.mail.protection.outlook.com (10.167.249.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:51:29 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZYJW3211161
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:29 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htnr353aj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:29 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id RELtxFcRtVfAbRELuxwVBC; Wed, 11 Nov 2026 19:51:28 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=iol
	FKRKhXaBACatoryQ7JhP2ESvytQ9xsNhX+W0kYeY=; b=mZZEBEXJpioIPFw11r9
	/rszRl7AQIbMPZYDHTvmsgbMTaV+Sxv9pKEUg4Y7PcCDBHNrN+I6dIbnrIGYv1MS
	q/QvhSUjbleLMmMNJvoPtAaorGNVvuM8MvwXZXTB7GC1ow1ysZ/VbJq3TWFcmHj7
	XV7S/SuL8ln/u0kAegTEcPT0zTxDjSfM7CD4vYHGTt/B14APnFTgbxR3z5Bjzedj
	V7HKrXcaP6wKTBCGMG8XK7uJ0oOCOtE7tpGq8xiLszx/pv7efN4uSuLoDPP2ATNa
	5g3ZvRWrbPS5XvonmWkfbXgd9VSZN+wcynqFKVOyhbgkcCQtC0cynlprkVpCfaDV
	A1Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScgIUwK3rVHKYZVF5Gs7ayLEjv9OtqT4dCf79vh7c4aj+Rj+PgLOl7ojR1Atscaaihas/kgPcMcDKxnJWt2vkxOyqAEHc7JRioOxcK3pXf08bAi1gEYkY1lgzPQo6VEnkTKq5Zr9qzQjOyaZslijn8FAcTJVgrr2ISKdOnNZ9Kxq4he4Qq08ua8CD3NVCoNfwUgDfGav4OTU8rHPfoxEHfJxfcNXz8mohW0Ksh1L36/8r/eaDg6nRcmX1rEOyqAJVTxjhpwa5ColKG/Mr6DTL5k9IvwUpRYCUPvbfhlkTbYfaSkKcfIO4pa/qpYeFRt3cYrQ9TI5CziJsPPK2+ipsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iolFKRKhXaBACatoryQ7JhP2ESvytQ9xsNhX+W0kYeY=;
 b=Ovh2UAZn3Q593bvHO5kdn/e6ymtbVC4HIgNZK0J8z+r3K4RfDJUGx5tvbMpgV1oMSCDc9I2x8l85zaXwt6EA6n0ohL2CTLhZsJtx9Ul94w5J3QF34dE2dpas2P9nIDrWPw+h4iJrY4Q/8/50xMZBewYYf/K5/82NGItu/fUZf5Uv7W2f9pw5hDgcHTM3byiUk+6aE22fMIf8cljol4FM/Drm8MfMdLaFnkPvXG7YNHjUzQVszyAbBkn+iZwXCBnYHa5i0JEpsNKM4KRprjH2d8xRisS8OgsiObVbp8cn21gWCd6+wTsdfvhkt/TYJspqw1J+9fZhcSWadNQjsp489A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iolFKRKhXaBACatoryQ7JhP2ESvytQ9xsNhX+W0kYeY=;
 b=AXA9IqvzjTRdr5zUckYJ6OXcXIoeUlwP/sIhlJ/Jciw6F5KvYNlmM3MsWxu9eiWW8au+BJqt31/ce+0ot4O634GfIVVbqgz1UDbflFKZ73OyrbMS9vTWRs/m3PCW5+f9mIBrYuHHKRLZNu3ECg41DAK6327pwYTsZ8NBF6IGDcc=
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
	ppserprodsaar; bh=iolFKRKhXaBACatoryQ7JhP2ESvytQ9xsNhX+W0kYeY=; b=
	ny2/Ae/5p+BBOPLShqZxQLrCBb0v4eialuSL2+0zDaOJCP04LXa/RpaT45DT+U4P
	Z9aWv0OKLUF1nq4iLudmxqHicEingB4XLFYfj51+h0OylRb095gfSieGZ+IJbcos
	iwO4KfLIXfzK1/tgElzzic1TH1bN7g8MhmoRuZ4iMR8Hcxj6iVTyPW/ksZh88IkF
	oBhiP4bKQbexxVlT8FIJQtAjVHuRXf19Wj5zg9zhDxIw3u2k8zv73QcNWAe/btIT
	Q3bt/Lqf5J5mvvP+lrtKdkLOouSOpOY0SyDz9wRt/ywURUYyF7XuZk9gb67brcug
	+oIQzaT8ekEstyw//kHdzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=iolFKRK
	hXaBACatoryQ7JhP2ESvytQ9xsNhX+W0kYeY=; b=PSn9ANwt25cFJQYSVAzRmSd
	vnDkFs8kNXibeUDfHowo3ya/adwBWOjsfCI+SubqODKdG1kBCQiy0YirATsu9KzT
	mwzoH+qJt4ali7uRvmA7vSILRxggS3eDkvR/FDdAo6q4sfIr/L4/yxJfEyp6Z5Ss
	C9bjSjo7qolXH0dq/XQbxPaHAj8rtW/ENHbDBF3lfWuTbp/J/0CPWisefLa1j4ca
	tQr+X7dW71IxitUIszJ4B3tEeL794G9KF/MUthhxckJF9WvLyj2vE7NbFlal6EDu
	FDTNwU2ukYaL/rTNbF3tKerptsala1Mvqs5S3NNkWyL3+tV6gSq28Y1v8B8C1bA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RELtxFcRtVfAbRELuxwVBC
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 4/6] x86: skip registering unavailable Xen console
Date: Wed, 11 Nov 2026 11:51:07 -0800
Message-ID: <20261111195109.1070169-5-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018863:EE_|LV0PR16MB7138:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1726b89f-dca4-4dcb-1f0b-08df402d2e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|261102123227099003|261028144727099003|10067099003|261009223027099003|261026121527099003|261026140227099003|11063799006|261021121427099003|261022105027099003|261021123027099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oy5gDNizea4ybbQF75aOU3WZBEMF/h7wnB+6M770XjU/HtGsHC1duGdUfMkL/5vlNjEqUxd8vaNPK/z7V7cEJwUQdFabV4xV67HLSAiK1rQUQzI6Jt0q0RV6Y8W/4O9kufj6WY6aq0bLUVfcOWEwHreDTy2XS1nF6N8qwR+4TxYvbda1OteSFOsWQgs4pPu8u4zZFV8q2w9BJ8bxNADbyq3M9gGfCKQ0880azX/lALXOa7BoOEtrJCvhOH/XKessiYJyIKbyCog2iWJUozp4m8bpl9vRvzdG3LnJt9AICBp7rlDHhb0mdr2LteRjE+zhOboZwv7t61jHPsCIGY4jmk4AE2jnhPnmEbEx6r59o5bFeYgcHJgXbqTRSxJWPPBp/C2U5ckSAt9CAgJCVtZv8ZQHB9ordw+12jg549hCghW4K6OJanUOQva5MRt/C7al7xnKjn2b9K5f5r6wywXmwjo1jPcQ2NouctfGRKcjuyRjneCpc7PQhROtKFtNOeZu/WlXGaBhiadNQZY/UakMYtLo/MqLHizHtVfTSw13mCWyanFamNLJ2JZrwdTE4xG51abKUnJoij3oITn1x2ISjc3259PrEKBzStXj7/rFtJqwENrSeXw450fztFAZOSc9Ra+ltOuh3QxBX564j00Vewin2bgFbdO06swRZu2pgdiPO7RdQHlK0nccz2ef+HiPQ8QBl0kS42qlbsaK0WTZkg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(261102123227099003)(261028144727099003)(10067099003)(261009223027099003)(261026121527099003)(261026140227099003)(11063799006)(261021121427099003)(261022105027099003)(261021123027099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/WCR685ZELVvp7qyFAFM+yYSH7wJPhFqniTgM1jFTQh2BM4WIxKo7rHA1Ki4bNmnl7UMwFGT2joRByP15R2MqlZtCFR8YxlexEoXmNrCcA2lWvKRHehsR+feoeRU99vZuHFeAVyG0kWRTWMplvpgSDsQiUzI+T0Qu7Qy6qiRHCLoC5m9j4x50uhI/yLdn8XW7PEAHeGm291caeXU0cyEZqSBCa/tju2bCnC2h5JGRwoFRGcnaZr4JL7jH79jFF0nzq9c6ZDHVZFTKKPx4iCOy3+Bz/aBRdQnsG35PZJj4aIsPH9/Z/xH8jbE7xaXL+HSg9UgTBHuYtOIURalVl/r2Fju8X4/lNkPBBI3PY1eyMXSXdsEr0NAfJhFIC852D2wPOKweA8kcBV7iH+y2EBq8w48LIHn5AGn5niTM76qzN/M7UiHTMva/BcEI1JjDKon
X-Exchange-RoutingPolicyChecked:
	oBfhaLjHw8CfghzF+OJyiQ7XU2ngEI4sbdjHvQYTrAneC79ragIGUnowLDAVB9GAkc30r2EsT9gChp1EU1cunBqn2wFnynjKBRySzlPEnjak0kHP5K3UwvcpxeB3RH2/uBlgBByv6zh9StFUU3PW/yYMr7TPyT4laPpA9Pbszn3kacHyHGFuBIxHrsdE5BtrCF68KB9WMANkGfSEptgePc75SOKi1m2L3hFiL8S2gKhcRTghYgOpNeC+lzrfb0RMz6ehiayQXIltf71Zyxu4IRrXnOh5cuUorVL7uJWWK6RHzdnD4yn22zEByxJofDPNO+Wcbpb5E7iZYlPobttSRA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TFVdQzA/YqA2LV+jlz69BBmU4dRTtohQ126F1q4fsBLe+r8jFvUxsRY+OVFMoyrdLL2XT6cav3TrgjVH8mRVG6qBfxPGTAVjB3A6vgUfxktffXxV/NDWA69/siehUg2fd+eI/InhKIlHOGTZRP2irUGcmj2gWQnx3lGfCVGcMezpe9HdZWxS2nvkd2GZuMHribtWOGIslBziIt9V9d731TRMiZawH7vEm+i+4d3lQO274WAJsOoipBLJvSelFKOHhzuus7vYiX3F+0fND9husGnlppcgvZ2EiG3EcUivcEpoxBRSBs/+TeYiasqWSf1FAQSxlhF5Umbg39vAM0eVWnEPGpExRVvJlzg92SorbVHYcysfIoSUeBeBXrZzmZ5tFWAmb7WZzNRcTNsYeLasmoG41wZajEqylEPmUOfLQ7H74IlT0IeIYHhABndFFd9K7ZLgYk/CCKGxAHyx34deS5Al/AumqKMzCDICheN2PgOf0EBmg2L8ZewakbgrjOrbbBri5dS7ZjFOzPB2JnbSUbpJR+QVG4LRajLWbn3ADG7OxJPn9USB/E69r0pga5wwVyXmUsPwFxzNotxw3bTq78glWsS5j0EmKbDUYR8Z83pvSRcDldKaFoeIjmhmOvhSmbdUqgHPtwu2OEF/rVTcJQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:51:29.8623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1726b89f-dca4-4dcb-1f0b-08df402d2e09
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018863.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR16MB7138
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX4s9by/OYDEi5
 mwZ9GPjKpHnDVu70Db5GZ3iUwFqXPPqjWumyUzQq+6/cCb2m1zOVYqIg6duW37FW5ws21A4ktNs
 Dl7JaPbEzuodPh+ClA0I2U/z+3KwYOvnJohd8+qFroiecWX/3E6v
X-Authority-Analysis: v=2.4 cv=DPEacCNb c=1 sm=1 tr=0 ts=6af4c746 cx=c_pps
 a=miuBlqXM8bFb40OTON37XA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=cbNQJ9GKAAAA:8
 a=B9uSqQtBgkG1tBy4WOUA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: bmlDPGM9cU9aWHRPwh5dtBlFQXb2Lg1U
X-Proofpoint-GUID: bmlDPGM9cU9aWHRPwh5dtBlFQXb2Lg1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXwwy8BgQVnvap
 B2tJGA4gMH5enUPmdp8sgjmcUotzZuVU+UC6K9kwPrYggKhPXb3tTkqTlaDasH4PuHlIU97Gd8a
 +ind5uqx7B/koOf4dT1a529D6kQdTNXDtvIA5YxO+j0wmyHgKmeA6BlxrcV0GRscbYBGJDMnTKu
 T1QuQZevV8LYAWBdZL8AYDVaDnLvmgWS4xu9KJV6iZPdV8d/hmz4gjcUkbCybpl+IZJl9glx4Kh
 YktcyQe/Onfuduy+7UeyFwz6/Z5OD71n4xS4ePJB8QmB+iQomHnflWYeDxpbSSLLVjHdGrTQTRa
 9dDuvtOFkg6BL5kStjndSs4JX8C2FQdLRbi63xkr44RMAT/3UQ9TQU0xUAz30flFH+9GqsZqu0x
 sVRGC8lN3u5PaxaWqBCZtK3Ekp/UgLUD1L/K7YOIkGyeflTjp6aMcdGPelmbGwOaHfnV8c3/+Ni
 dcLnSvaX2xu6lYCdtxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-16d1c6/1794426695-FE27077B-4E0F9E16/0/0
X-purgate-type: clean
X-purgate-size: 1828
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Do not register Xen console for the test in case HYPERCALL_console_io
is not available.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 arch/x86/setup.c        | 5 +++--
 include/xtf/hypercall.h | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 8fea6495de1c..725abe289a05 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -250,7 +250,7 @@ static void qemu_console_write(const char *buf, size_t len)
 
 static void xen_console_write(const char *buf, size_t len)
 {
-    hypercall_console_write(buf, len);
+    (void)hypercall_console_write(buf, len);
 }
 
 /*
@@ -297,7 +297,8 @@ void arch_setup(void)
     if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
         register_console_callback(qemu_console_write);
 
-    register_console_callback(xen_console_write);
+    if ( !hypercall_console_write("\0", 1) )
+        register_console_callback(xen_console_write);
 
     collect_cpuid(IS_DEFINED(CONFIG_PV) ? pv_cpuid_count : cpuid_count);
 
diff --git a/include/xtf/hypercall.h b/include/xtf/hypercall.h
index 68b3da111d85..475eb771d472 100644
--- a/include/xtf/hypercall.h
+++ b/include/xtf/hypercall.h
@@ -194,9 +194,9 @@ static inline long hypercall_argo_op(unsigned int cmd, void *arg1, void *arg2,
 /*
  * Higher level hypercall helpers
  */
-static inline void hypercall_console_write(const char *buf, unsigned long count)
+static inline long hypercall_console_write(const char *buf, unsigned long count)
 {
-    (void)HYPERCALL3(long, __HYPERVISOR_console_io, CONSOLEIO_write, count, buf);
+    return HYPERCALL3(long, __HYPERVISOR_console_io, CONSOLEIO_write, count, buf);
 }
 
 static inline long hypercall_shutdown(unsigned int reason)
-- 
2.56.0


