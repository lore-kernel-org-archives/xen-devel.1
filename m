Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DE1C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 03:18:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389401.1630121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuLxT-00013m-7b; Thu, 13 Aug 2026 03:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389401.1630121; Thu, 13 Aug 2026 03:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuLxT-00013e-2G; Thu, 13 Aug 2026 03:18:19 +0000
Received: by outflank-mailman (input) for mailman id 1389401;
 Thu, 13 Aug 2026 03:18:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wuLxR-00013W-NZ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 03:18:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuLxJ-00FqZc-HE
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 05:18:15 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7d3747-2eae-0a2a0a5409dd-0a2a4509dd6e-28
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:18:09 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7d376e-be1a-0a2a45090019-94a39217c19e-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:18:07 +0200
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67D2JWXZ2260180
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 20:18:05 -0700
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010020.outbound.protection.outlook.com
 [40.93.198.20])
 by m0482517.ppops.net (PPS) with ESMTPS id 4g11q1sqe8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 20:18:05 -0700 (PDT)
Received: from SJ0PR05CA0179.namprd05.prod.outlook.com (2603:10b6:a03:339::34)
 by SJ2PR16MB5796.namprd16.prod.outlook.com (2603:10b6:a03:56d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 03:18:02 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::76) by SJ0PR05CA0179.outlook.office365.com
 (2603:10b6:a03:339::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Thu,
 13 Aug 2026 03:18:02 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 03:18:01 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67D2Kjqf3241892
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 23:18:01 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fxkgccvt0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 23:18:00 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id uLx9w2NBcRJvquLx9wFQfv; Thu, 13 Aug 2026 03:18:00 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=4343t8Syuieu+BnOI9GiZfKdRgH
	7XpgQgORJoVmSd2U=; b=FWwrPGZUuS3nA98LGKOwP7Qh8h7w8mihYhbAETvuexn
	GHEiOPnsWV0WoJDlTieBdLsStDXWI5bXCuPVbV5cspJ/w4kau8A4bfo++vTzzz7a
	h1nsc9tfleNku49fHEwpT+rUSjlWqhWS80qmNCwGykA3LQRFkbShViBEfONGBKn8
	2tg9DqXcuxv8IKzBZbM1ePq4zqKeCkAlb2RIyEkGZ8Ch2RGMFp3om4aY6o2xIp61
	9O4e+jZv/0X12AUGE8wg9d3cCxD6m22oFBtGw/dJuBnLLrpGLhPxOoHTBoapJJjC
	QGFRb1xrkwMdD6hMflBemX9+0Kf79gbxUSpU/4H7Fjg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ifg5YD5+Pmjr/YNRuMJ4L+c3roq5d4UA4bxJsUW9H6Wynr2FN4zgY3I/dPnR9ENDH4bVTFvU525mse7ako9q89kIvajRlj7s13P/53qZWzi+/uTDnt44+PGG+DEHRJz+L2MbmVK6BtjZJroRFpO7MlZ0eU7pOjHzTw47D6rAxAjiluCmNpoFSnXBGqmkz9zW1etJnbvH4zrpuU8m4Pk9BeNSCudorKu+tlbprHd5T2SF6re3AcXnG0YaIrlyj4fhro3fwl2kCKNrDzgh9wEvHDrNEdqtUwLZMQMUi3u5KjaJGl+Y0tzSeWjilkYAW+5rrsUsDvpqtiBwR7QL58t1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4343t8Syuieu+BnOI9GiZfKdRgH7XpgQgORJoVmSd2U=;
 b=OAsyoCz1PJmRTwGx0jqjRIPZFNZBR+O0mteRdVSW8MY0Iu4ezpieI3IzGF+I7PdomY1lWBPJ9BdhZmq4I7unsLt2UPWzykvAOo4YABLp3M504gajLXYCSc2X9T+oeY7JK1tj5Q4xwOTeJ89Id0pZ1TzUmwbN3XEhxwJUcEDEBZreXNELG9kUrTdIae7UGPVFd8gfdmOOtQZE/Au8i8glsa3DRjtZtTOlK+GodtX5AYzJA+hekkBjMx1hjP42uk3FN2Z1W8N/UN7P2UUlMa4oKz/H1IwmgXApMmxWad8e3EXiaRB7GZ6z1rUHQO0bDudVE5p30673xqwzQ9ed9v9tXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4343t8Syuieu+BnOI9GiZfKdRgH7XpgQgORJoVmSd2U=;
 b=jTeHiv84nwAD2F7Z+eW0RC+C1Aec+5SAwEizgTPpNaAIf4IweqDdRwQjNxiy2wrVuro0VUp90Ao7JAza2dw8HMfMbjT5nuFZNyaxhUMZ8HchLivlcYYfRXLFqUa11Y8nU6I3XhqxeNm7J/dpMPu9bRN90ySShecvOButHy163i4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=4343t8Syuieu+BnOI9GiZfKdRgH7XpgQgORJoVmSd2U=; b=Jz1BaaWEhE8S
	6lISUyGM8G3Y+oQ8FW8tIFdQLu/iZiHo85ljkFGaW+AFg/1y0BDdd7xAcQDXjtnL
	Lw5W2HNyMzdM1llxScnu/+oB28GGtu1I8L2qHwQQFlh/mCuvuDcsHs+x3m7sWDws
	sfliBz+ecXYJVl8tLrYhikqn3Xe8f+CLId7iTiCnDMWN3oUMOdCqq9XTrr9nLoTz
	TL9y3GIWHhlJPeI/92YYQOlACCL4JcEVMGmIle8rJtEweutN21W0why6WLUOJ04a
	rk2IphOoT92jxpXODeEBTO+eWdrnAVUvE0dJ9NaNJjcNNCyNtbiGOFTBtFNI0FJk
	RFAV4VLA4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=4343t8Syuieu+BnOI9Gi
	ZfKdRgH7XpgQgORJoVmSd2U=; b=GPeqJHJTKS9kDzWnWO4IpYMYHZF0zzmsbNgf
	+0FKiKYZH9RP/u97B4UF8NcSsf0P1qv8CJK/zgOeBdDpk/S/TufVguMuqlFXVBlR
	gu6TILCdt+TkEr+28RwANcKhEadkAeH5sjvx2AG3N3y/iUHUWp1Ug9iITICUwy9u
	yoQOurIbRsHWIgXCNgx31yiFxJbB46Q8M1S67UIPxVVN6mqTIdI8MZYIt3e9EKBB
	iyENEhP0DpOoU7GTMxLIv91bALUiKD+qcgVS36WnnONni61AQu4uaG8VneA6EExB
	p/W6C2zt6axLUQ0c+swbXcW5oG9kgi2536aFK7CDqv8DmfYZww==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: uLx9w2NBcRJvquLx9wFQfv
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Wed, 12 Aug 2026 20:17:58 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 2/7] xen/console: use 'unsigned int' in
 contring_{flush,puts}()
Message-ID: <an03ZgUB8AdMjT0x@kraken>
References: <20260728065049.1318143-1-dmukhin@ford.com>
 <20260728065049.1318143-3-dmukhin@ford.com>
 <75ed4871-f9ac-41c5-a631-b9894a84f221@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75ed4871-f9ac-41c5-a631-b9894a84f221@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130020
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|SJ2PR16MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2ec9fa-24c4-4058-02e9-08def8e97bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	HcmiLmTlVN8t5N3ds155JDKDYDOKzcPIwnLb/sAUdL2FyBrbdTkaV1bwX0os3yR1Z2M4Hh3KZpVqp6tno6XBeke7ZatUdw3FfgKezy7OMwo5pyVonn+zkl5l9RfG+d8elivoFX9BVp5PcNkZi61NuO1vyRB6f3M8rX8MC5F++wb10Q9lZsx5ArYQLqwtaeT/Yk7CTPWEVbMLPShs6C0ZEiwhXuBEXD6iTsnig+I5Xlzk1h+tJUnOxePVgQ5oiHlwmKRXv043wEZxOXGVQt0358651PuUb8Ugqj6KSKehRkykHfVquHyEgNVeMh36u+0JyREpMRjCJmfyT9SwZkq9C5udA5P7LA2U2gzCHRNz1fVjaf3QlCPLiuLiEvroHZ7ArFef1lHV+ITZrn2b3GOPmzMKN3OEn9xfdwcI6K1Zc0pECnrYO0DJR0rN853ELlY3OsXiZJk+ezWsSZKRCO3BdW5hej48d/LzSrIfzPOe5dUc4hRRPurHYBh83QmJVzJ2eQBPS06K3iHpTBElfC8j8VP+XEBxzlZOaOtnEUcWdYlAFS8/DpLkwosU6VK0jlqNjd1LZ8h1VgMcWSWhCRFb3ipslkmT/P/b1yLO3JWt0WNOwD73OmVNy9By1IUyvZbgTKsOLeHgqKHTEFpKEapl99ESmaPRy2/PmA0iBST+f/yV4kByz5IdWdbJS6h56G080RwI0VAjz4PJtEQZa/m8dA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PkUrI9E7W3f/luVTCHZqAe5flxnEl6aceT8IzZQln/oRXDL3PcVVfFqQAQNeIFAF3wnEo5RpVCnNybIYBt6T12V8qGopquObXOE8HZy8Z86cz5d6rC7zMhe0arLZ5wBTRlemiquHFj/FGsu8TLqjgt4Twl50a88aLiRpi1ZJW7eCmsoyD08AJGmODzY/pgbCSIZNDC8RV5qBxrKrDtgqBFYx1c4aJPCIQcKkScdCXRi3noMDGrUkVds2CBWT1kS/0WVEq6A5UjDa02Jpb5PNq0iBrz6M+ySXAQFytAnaZ/9Girph5ryRygSkxF5OR+y1GC6t1rIh0NnuNi4y+PVwQlBTPFk7CayGv/XQ2vzNC+4LODxYqlgEQRFgrVWqeBMtXhFjeByo3UaxBMfsKYVy04/zjnsZ5rjTUAGGnmK9w2QtHAVYkIcbaLbrgbulb3iN
X-Exchange-RoutingPolicyChecked:
	jkFC6Vr5snA4+U5bTDEMnWOgZukZIJbXYYR6J0+HXLZUe2HtBGGxhalDxkNCzCGdwGm1NaVl823tCzMsKfPSBGmF5YZCaNaAVKCDHGghE+F3cHx0x+CYA2FHPHs/O/jIa9JStHrt8yxNgR6bDX+JUkcsjk++L/lNY+Rt1iTiICPaX0cklsELMZ8yHizEUP9h9eeA31nn7PRJvQFQn2Hzty9+Wx74QnLV94i/l1rQ4qM1KXKZNxUEROfFe7dJJIdGx6jarhBRLUKi8KMBV300H5NZSBsCoZBohosbPbcIKjwfI8q2EwBVGfx1XoREUGv+LhVZEZMgBbc/G8biXfezpQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R42oWNzTfsbpnJdYnHJ4Tl8JbpDM6OqpZ/P9cdacgzj6ZU3+GhRAYnfy0I2jYf1QLpSz0ptlOTNm7ievFeqYiu4B/xd6Ke+pY/MFPpK0rdI8SkmKO/9D644/EENDP+PnwAvW3jw9ZiHSv+vt1Jxt4fdXxlY03ajwd8UB3P+0FQ86wDY9IC761WWZ6m5GOllFTYm/N+LmCFf0IGkeghhDfOZ1WGiOz9DOkFAO6GHEldY2FtFrp31QZaXxNGOimShZnvfMgYfaiJpZP3DaolOBOLJDcroVT5zzFkJ9zALz49xP46ESaWBVGxgO+6k4wMbs+8kbNaSDH3G5UwzBzsHhVv3z8zHG6/3kxVFyGKmHzPmFDUrIKPWH6lLOlSSnoI0fVz9RP2Jr3DDzrSITUzEwX8yyZyAhqWylNcADuLwJ1oEmNHBur5YR4IkFyh/NFUAPWdoz8SoQXe2W6dFHxFv4loflo2ex8OU4Pluu/62BRm15dI1MUxhlExBggO4EqeTYaYCEkuDcDvjxBgRagCFuTrHzN6V57DbI1CweT6DoOdpvTt5QISnV4vQKn2gt0NWsVkQsiumudQJiOCo/ezc8j+dkmOAJf0PRhlRWAUV5Vpy9W4nVcBAtQmGEZi/UzjRlFoPGMda6EnjUdY4VTaXJSw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 03:18:01.9611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2ec9fa-24c4-4058-02e9-08def8e97bde
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB5796
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDAyMCBTYWx0ZWRfXxw86Y0I0qATz
 Sk/9GGeDQzHyPCp8cVVz0v/HDWtbl6zZomN8RUGHd8/3L0VKSKcX2zRl9f4GimZ5u4E4jlEzFif
 GxQVGSyeEkxsD/SbOUKEPLPsP9qA0gQFY2z7Fuau8xfJCpFUnSZJwi+VRYrg+65JHWJqKv6jON8
 T1i5fTa4fZSN1AShENjGD1QWJRePkpLhAtx/gro7uiePlJxwj9VUskHZC5WHtdRoJqSQNrZpa0D
 tQMKFLYohj5CrqxzcW/jmuzsYa/XzLJ9kNuhnnhdF+mt05qhzM/alaOKE5ogl80KH0LF6UfKEIm
 XxYQcbPaGZ21EReiXxrAhWZhWebytWjBDYTxMoRKC6+2jCpKwp4EkV9P9HDfJdO4/T/JVgWOF0Z
 rNfbY7Gdli6S/Ot6LMeje362HllzWdklsuajodAKfLdjDn5deo8T/Gu9LYUznm4x2W6BdvKE3DJ
 7Yb44nS+bD0/raB6m0A==
X-Proofpoint-GUID: XL9RE7S9IsDDoRIXIUEogsE8IAcKZONy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDAyMCBTYWx0ZWRfX7FnNAziX7Pe7
 9g095VufEzSbE3nZ58w+3xfM0TLjKXFyZfEUbZsM63dmdqVMvy/S+O7WmMmRevSFiZSEnMzWuFu
 +J2ZPPRrHZm/nthpPfxdWKBrpRjWYSJSzn9WL4cSv00P3MIqfWpW
X-Proofpoint-ORIG-GUID: XL9RE7S9IsDDoRIXIUEogsE8IAcKZONy
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a7d376d cx=c_pps
 a=6EvF431pKSa3MhyLnoL1tg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22
 a=cbNQJ9GKAAAA:8 a=2CfHQkRvY1sBYW4dv3IA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130020
X-purgate-ID: tlsNG-bad1c0/1786591089-BE0C5034-89EF6A28/0/0
X-purgate-type: clean
X-purgate-size: 693

On Wed, Aug 12, 2026 at 12:30:59PM +0200, Jan Beulich wrote:
> On 28.07.2026 08:50, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > contring_puts() and conring_flush() still use 'uint32_t' to access
> > indices.
> 
> I took the liberty of adjusting title and description, as ...
> 
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -375,7 +375,7 @@ static void conring_puts(const char *str, size_t len)
> >  long read_console_ring(struct xen_sysctl_readconsole *op)
> 
> ... conring_puts() is referenced only by the hunk header, while it's
> read_console_ring() which is being adjusted.

Thank you!

> 
> Jan
> 

