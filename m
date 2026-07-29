Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0332FC54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 07:25:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375212.1622444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyfd-0006qJ-6f; Wed, 29 Jul 2026 07:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375212.1622444; Wed, 29 Jul 2026 07:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyfd-0006qC-3h; Wed, 29 Jul 2026 07:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1375212;
 Wed, 29 Jul 2026 07:25:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1woyfb-0006n7-4q
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 07:25:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woyfa-004vRH-9a
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 09:25:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a69aaed-2eae-0a2a0a5409dd-0a2a4509da00-26
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:25:38 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a69aaf0-be1a-0a2a45090019-94a39217dff6-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:25:37 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66T73kmb419413
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 07:25:36 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013007.outbound.protection.outlook.com
 [40.93.196.7])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fq4my3204-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 07:25:35 +0000 (GMT)
Received: from BN9PR03CA0565.namprd03.prod.outlook.com (2603:10b6:408:138::30)
 by MN6PR16MB5407.namprd16.prod.outlook.com (2603:10b6:208:476::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 07:25:32 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::84) by BN9PR03CA0565.outlook.office365.com
 (2603:10b6:408:138::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Wed,
 29 Jul 2026 07:25:32 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.1
 via Frontend Transport; Wed, 29 Jul 2026 07:25:32 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66T4bvc31788477
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 03:25:30 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fnbs745jv-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 03:25:30 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id oyfPwmWSaqFVloyfQwVWWl; Wed, 29 Jul 2026 07:25:30 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=ahU
	dlfdxd+A3zLj5zNn6SxYqIoT62B9ILeo4nkM51SQ=; b=g2Bx4cBQY/372Wif/Qz
	eWXFPX6/QNHg0YT+6YmZJ0Z02u6v04v2KHhtdm5Vp+BG8oStjQaqnDQgiLDBitPl
	3LxVEp45hnIal3hezTdhCu5fG0CXmdb3GZ3pxPdDT78XZ/RgEYECZ3VDJJJxNvN5
	bAfLCxc3OLj/bStqrgrKcwYYHJ7SrisoFLhY4rwHWC29Y8EroXy104UJj8bA4DgC
	VGo9/uqG28oxwr4gA+kYKxqQ8tFkDOlj7scc4YlvNxU10RygBNmtablAMM0dNrHH
	t0al8WbdYIMwE92d9VAJFk8xOG6wJ3yvuX60nTuXqMDmzYsT6nGl/MdfrsMgvesp
	TxQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPtKAjI+GTs39DPbqlySzVR3iLANzx29XY6Ml+OIhNgL/cgtaRZDd3IkFqXDY8T/G1vksLWHQ+DHHcn9vmKJoWDRotanPDiYQlu3EK9n6Etxytxtpav8Kc0DPdOisHIx/xzX+Yc0dvSNWkMh+YxuKWNdN7xOrkKGtaVRvNkZ7HQ5QIsNhpd2G5i4YxnYIzTA8aq2OBFrWeCT73mmRm2/LyphRA3kVe/uhx/4NuZSpyrit0MW7bXLG0dNpizVNhLZQIQ5iGEtPF19QnzUnh+vSE4r9l2qB1vWPr1FIRIddZyCv49oS9hzM7TWYd903Y+zAxLGhneaLrZ1/CkAWVWYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahUdlfdxd+A3zLj5zNn6SxYqIoT62B9ILeo4nkM51SQ=;
 b=Bz/ZvkZmlHCoGGQpOuh4AmzRWS08tsIjqSzWwlzSzUKNVEU8EF2wnKOMwRUv/qP/QrlRttqA8tXyEUsfDZ1b5yHF5a9cXT4ZaimEXwcHqTpCXJ0pPvJOaQhm8wqAJ4C8Af8QN62Y7i0NaMekiaw05V6GBXGv+5LkjVEGGM7sw2pZWhCazlxpSst1tAZoAFJuLhQmnmKM1ClD6j5HX/Tvfg+XaRbCn7wumw511DqWrxUxpySj+cg1hDHXeY1nlHjsC79CmNQDDx+ALUcQhPtj0olXwI93VwG3v7ZYcymWLpysoOHUFy2O3m8jdHKlNHeNzBlfbZkC7I8BMdtLgIPT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahUdlfdxd+A3zLj5zNn6SxYqIoT62B9ILeo4nkM51SQ=;
 b=Xxao2xkI0QQo+2pFFbYCUW0gouZFBqLSSzO3OoYEZ6ffBA5yfurvHsnXLFcpcm0MDwfxQqEN86oexlqbr9dxCETRuUNOOFVD96BE9Ac+LWaVK2mkedqfDWRkfSt4NuHBi9kdJxLcOGqTmu87jO331AqdEYFPDK37PWv13DxBt2I=
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
	ppserprodsaar; bh=ahUdlfdxd+A3zLj5zNn6SxYqIoT62B9ILeo4nkM51SQ=; b=
	Mwsvy0/gdM+5Hattv71ARLDeBK3/N3b7B5tRZ+q4cNotyJi59rbeZVGSW+j64xBB
	TiA+ckKDB5rYIq2lgUwNI2Y5mdE20lgY3nzGRKR5WJyxhBltuvd/hAduifN9tbmG
	w+qJvkTftd5gLYJQ2RXSS+YzrlWUyaVJSCUFJEeo7CJLzVL3YMqLm4UWoeOVIlmp
	4psId9V5YFTNp4UpLGmsuZQb+jDjM88qThLWPNle5v3dQub6WUuMp+vSv5b9trJP
	kAHBtGKwoa+aw3XCeq0DSLHk3HYw56bjX/CFSMsNcdHHIMdv4o+dQOE6HOKyoX3K
	X5GPL6uugwZ5lhE24YHmYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=ahUdlfd
	xd+A3zLj5zNn6SxYqIoT62B9ILeo4nkM51SQ=; b=rbGfX4ss1riq2An8CNoGOUc
	cwX2dX9pMfW4N5FRwNxxrxu6tXG+iCmgkT7n4iuyzRaGacejtUWdTqK7ZryDX9Dv
	aR6C2iqYIwukzv1XR0sO+lj6x+epK//7dbbzZ1yXyaOkqlYMR5ZWkAdxXFaGBI8G
	BNT/ykZRs3slz9013LrdhiZEp+fQciOCVW/2/3DFYBPhKUHgF7zh6mZ0nvo6XCp/
	T5HqqqeGXU1msF4Lhi/FmXdIYso9i20aDwJzmR6sJfr3vK847jS9aUApC8sljwE9
	rdTRPooXKA/7eQsCE5TO7R4s2fxBcj3RxZrt4SHW10gMk1WprUl0EHCgiqEPTEg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oyfPwmWSaqFVloyfQwVWWl
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 2/2] xen/console: add compile-time rate-limiting controls
Date: Wed, 29 Jul 2026 00:25:20 -0700
Message-ID: <20260729072520.1556970-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729072520.1556970-1-dmukhin@ford.com>
References: <20260729072520.1556970-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290058
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|MN6PR16MB5407:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eee30175-3529-477e-17e0-08deed42930d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|6133799003|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	zqLXqyPArcncYMOlNLbWWQk5ZsIOBnNP0HrQc1TFjd3Sxz/pldFvExtLiJNM2ve9g+O9Xh8HIRZn54EO0bisW0T0DExK0Ac+BruoTCrNwUQA2NvuOJvrMtuKFgtc8Zs5QmuOTfHIYqYkdWIODugU1qImERHBCro+ce4mrKi9GK31VHWtWbBAeVNwElTLw9/u+PvcoYbbRYoH90u9+Y7v8XTr1hM2TbeAwmklx0Mr6deMMdTY41GROZmPq3I5yYZ4GUwncvv0sJUMC0YTVQYqCOg7+s/1U3ZWpG6oD8IqR+sIGZmiT3q1G7O+UCOl/ebAbHurtQwY1jqN5d7CG6FjcfiBtbmQSZAthTUnsTeMXr5MfPFabIM4YNn5Up6UpZ1tpevuhwVcd6SifXzmCrtA+8rCQsWV7ZQ0WAqFwLZWQv5QOcsbA910IVpX42K0M70jn6f9BVyTwM+yUvipsG1aoeuAzzrOO0NPWhOUdw0HVH6s5OlgoTvPUcxoIjMAlx1JSkxoKFVoOugaeUpH6wJ3olg6NsZJCdP6gOPpG7U8769x4dl5Ur0Pewk3hpc9ZtdCloWlN5nd5bWa/+ZwIRL+ZQUG9fczK+CpjHg3LVTtRuiEa+c+14HSeshacKoun4uXoDA2ptGc9svW5XIgIPGyG47IVpWhkjJ0RJdiMyK9F+KEWsuTvi7XYl3OCBYAKkM2mimoYuTRqgVeambwfUKIOw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nY5GPVkL5jdHMf2vt26q5p2PBqo5DDjC+xJ24MoU80RgtZptXBsx7AQypzjVQRNUL936JWktIh4VShxywKj46jHa0knWtiJC28OsKd4SY6X8jM5722hnkE3SU9xVMy/+DDmUVdw8N5xYN6Hy9Oq1J2z98Kf5EIhk3wNneRmCGy34ZcWdEjErL4pMeO9ZhH8FfrrGEfWWqxqBGn3HciCEAe2rVGN6uhaOhvpCIMDPSPQ8T2fnPdIwIoC4SPjilrflsLuJeD3kD7UT3EOEt5CpG1NlxJt6ipTYsxtxPo+CwpH6IS1r7M90hNOtQaPbuMKNMPM7Bv3LE8JQ1EaKtJXgq73lWeIhsyvhptKkauDCpRk1r9G5MWL++UlqGOli28TaCo0EdddtW7xH2xPFTV4lmLp90B3zTLIdZiAD0Tf11X5UANP9jM2ZxUaEb2wZ/IeD
X-Exchange-RoutingPolicyChecked:
	BjsB2ezVE9huyFLFg6L7VEH3zE+u2oUQm3/vLzvVjC9wH6IR4BCMzDHBFXyqjodTSdTp1hSaWuzb4B6dmYPsGf3/vLlkG56W4STsF4HOAvrf7teyi6xU+eV21usjiYvUNVsceqRG9nH/td6XcX0oDSdvvZv338J3IVu/hqssSeh39Yk5nWInIhAhi374UVtxn7BBEl1IP9gS0J1H7DzS6G1eSwHI/NR/bBpNEeJQex3ey6cRSHo11uSsudpAKiDNy8BluK+xPEsX83EVhLWBALpFZSy/6rN7quMcqLeAzeDDRD3uGRNkqTQswO9GnDZt5VeEgGva2suaUeuqTaKwkQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ccuv0+/4Rr3tSXPLW3Tc6fNubalCy3xe6s1iNh6FlYOt+or4nhLKug/OpeBgAj+T30x5ufc90YbQzPHMUaTR7S50jpmFo//aWffbS0bSZ/hk+tTPlOYQYF70k1+zp8aF/1R+eSrvh0gPxkA7aN+TQ+u7Jd4Wtoar12suTHu5y8seclIvSDzHSi3hwHvGKhEe8Wqjg+2UDST6RJGDGFIS9uVs2bLkBgO00seMuvF0g62iidC9gzAPEJzb8Zbz4OquA5ihwTBh9pDixricYaQuLLeuX5MSmz6Bs3Sq3AEiAJ2yrPlt2x1cA5ie0mxzyQq1sv1c622yqZKluY5SZM+n7KBWhhypnLZ8cPseGVNFrFc3hG84yaOxNRl2likKTAxROOSbf9K3DJog2LISCpr6FvZpps0ZisI5KL9FlHvgCCRaLVtNY1AlrGuni16+1I/TyOMDvDEx6YiOWWz2UfbaWtcJ4k8VyxeyhxihSBH7TRMDCwaoYF4xSbXMNTJl+XvztOXZSzJAdstXC8cT2I0DXwV1tTNx2YmpRGbaYGIHSlNyYokZC3L3D7/jIIM6YdZbxUWjGV5tdaeJJAK6IdKqU86pr7c+v82D6MKIb0BpLDe2LlNQTCneHYUznoMBTck/9J3e+ZUo5k1wuGZzYbeiVg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:25:32.2914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eee30175-3529-477e-17e0-08deed42930d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR16MB5407
X-Proofpoint-ORIG-GUID: MXKK-4bMjPO87WZDhlJ8dk82DKqNSSpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OSBTYWx0ZWRfX6n0SA0+9xUgB
 7jHJY5Zs5Sx0DEQIOlgsLaOz2biGPqXqdPijOBqkUCMdxuCrUNMnTSLj73P2th+Fuy/udjaEihb
 BBMPwodYOH4fgRrdboaor6OMERtBm9LxDiN98hEB3veE5rzUvsQG+Lk1enXeudoc1ndPpYoICo7
 e5fyQuPrrGcWTrtO6Hc5NLrby+s05mFq9W1+YG1S5IeOmVArXwjKEn1YwomH3Pzi3Z+OXeLHqWh
 MKWx97MEIYqoEshnz2G1x7uDyuJ3cSv0zKfs7FSIAJA4a6uNlTaz4yVTP4EdgRFENPoxZ/KP3EL
 rSmovnEMbx1Zd/1vK5TYgl5NryGPdD8W4GPbkcxIyBTUtt9AYcXjvMV4BC9dqhO2ZuaZspRZBym
 qQGU7fTp+1PelsTkYJ3bbGpCPaDaadoed3Z70gv+OChjTWHMA9WIxTtHoMbCH32ewLs9URrWHD/
 7rIv+yY5k8c20GBIKwg==
X-Authority-Analysis: v=2.4 cv=b6CCJNGx c=1 sm=1 tr=0 ts=6a69aaef cx=c_pps
 a=B1kIKGfTVomdQYahC0fm5g==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=cbNQJ9GKAAAA:8
 a=F-48PRZmIzLXcS3vbwgA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: MXKK-4bMjPO87WZDhlJ8dk82DKqNSSpm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OSBTYWx0ZWRfX57reLSo1KJ+C
 1HkoAAx5tDKhmHUQl1+aOLVcM3S4YUm0Yr8jevYdxoAXh1HyrvT9EY7xXoMyqAwJE5mviDGjeXg
 B5pucvyLrAwi2aS0LCTiy/CM0TzFwzYiLJ7fgbHCnZfhZ2+kSQ8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607290059
X-purgate-ID: tlsNG-bad1c0/1785309938-BF6D2034-580EDD09/0/0
X-purgate-type: clean
X-purgate-size: 2860

From: Denis Mukhin <dmukhin@ford.com> 

Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
for configuring rate-limiting policy at the compile time.

Use symbols for global rate-limiting initialization in the console driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- added note on security support for non-standard configurations
- gated menu with EXPERT

I kept both settings for now.
---
 xen/common/Kconfig         | 36 ++++++++++++++++++++++++++++++++++++
 xen/drivers/char/console.c |  6 ++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index da80fdba8469..749d3bfb08e0 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -672,4 +672,40 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
 
+menu "Console rate-limiting"
+	visible if EXPERT
+
+config PRINTK_RATELIMIT_MS
+	int "printk rate-limiting time window (milliseconds)"
+	default 5000
+	help
+	  Specifies the time window, in milliseconds, for rate-limited [*] printk
+	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
+	  printed within this window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Configurations using a value other than the default of 5000 are not
+	  security supported.
+
+	  [*] Rate-limited messages are those controlled by the `loglvl` and
+	  `guest_loglvl` command-line parameters.
+
+config PRINTK_RATELIMIT_BURST
+	int "printk rate-limited message burst size"
+	default 10
+	help
+	  Defines the maximum number of rate-limited [*] printk messages that may
+	  be printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Configurations using a value other than the default of 10 are not
+	  security supported.
+
+	  [*] Rate-limited messages are those controlled by the `loglvl` and
+	  `guest_loglvl` command-line parameters.
+
+endmenu
+
 endmenu
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 76a1681670c1..2c7be1e61f3e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1353,10 +1353,12 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
 }
 
 /* Minimum time in ms between messages */
-static const unsigned int printk_ratelimit_ms = 5 * 1000;
+static const unsigned int printk_ratelimit_ms =
+    CONFIG_PRINTK_RATELIMIT_MS;
 
 /* Number of messages we send before ratelimiting */
-static const unsigned int printk_ratelimit_burst = 10;
+static const unsigned int printk_ratelimit_burst =
+    CONFIG_PRINTK_RATELIMIT_BURST;
 
 bool printk_ratelimit(void)
 {
-- 
2.54.0


