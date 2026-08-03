Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132FFC55162
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:01:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381174.1624737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmfa-0003Iz-Lm; Mon, 03 Aug 2026 07:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381174.1624737; Mon, 03 Aug 2026 07:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmfa-0003Is-I7; Mon, 03 Aug 2026 07:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1381174;
 Mon, 03 Aug 2026 07:01:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wqmfZ-0003Ic-EB
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:01:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmfY-00A7ql-Qq
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:01:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a703caa-e002-0a2a0a5209dd-0a2a4503be26-28
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:01:04 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a703caf-fae8-0a2a45030019-94a392174b60-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:01:04 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6736XQ1h3932701
 for <xen-devel@lists.xenproject.org>; Mon, 3 Aug 2026 07:01:02 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012012.outbound.protection.outlook.com [52.101.48.12])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fswuhw3xk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:01:02 +0000 (GMT)
Received: from CH2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:610:54::40)
 by IA0PR16MB5548.namprd16.prod.outlook.com (2603:10b6:208:493::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 07:00:59 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::e) by CH2PR11CA0030.outlook.office365.com
 (2603:10b6:610:54::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 07:00:59 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 07:00:58 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6736xJfM3670003
 for <xen-devel@lists.xenproject.org>; Mon, 3 Aug 2026 03:00:58 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4ft2pt14kv-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 03:00:57 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id qmfPwSXo1JrM7qmfPwfgOJ; Mon, 03 Aug 2026 07:00:57 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=vzj
	SlYxWBpGdDqVv+pIg3kuEssbNQ05qwEZxS4CT5kE=; b=OHMoeNqraqd7gRDrOY/
	hxnKpNCBlqzMbxHTCg7nx8WZisTuddCc/mUOkzCqVIhhKeGyG0dgl48pPQSBJrdJ
	1uO6kKT8JMr4DzNBdAYjfQdWkmDoajU+UAIZjUNV3kJF4ETX04ocgn/5imcNcpsv
	XKoQ+S88Ok051ZsWaEobTHa4h0kr3hld2HBvJyRfRNeVnxIxbzsgJQxoy+NU67x+
	O1opqEUSnIF43zv9uAMdjoS/z0u5Y6p5+mwNLIU6DhOV+J+KWD5PIW1tSmsxIJ5V
	X5B3LLDlOPXDT4rXaYOKv3GxLUJl+q7UbBvqudfiNUZhYtl1lq+3AOfnyHTbyMWB
	/Jg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUIo7bdY1qQ6YbZCsZDxT97QMhOqYo1bj9krhD9KGh0I2AZ1F1PTqSAQwpAOQ/9F5lJTP1cDTQOhCdb2fA4xlnxdQLRSXhcfn3OJ0d4BIJkNvAXXAQ1CX/oO6awOL5nFMOB0X9UhxNAOpNCuTcO5SR5wFrsrSPxKevmdXfKpGavH71RilHBzCkVdwCuAREINfaJslyFGUaRic9xnsfqjqo5eMCHrcT8/DbjEL1Z8VfwbYi3vK+4kE+UA7xAKK0h60JWrlbJ0YZlG16s5JOTiZr/f0j+5WITiAd2khiItL7zuQQAqpBpfNDmXVYkFLS8aUs4Q2DK4BBQDO4vdTfuSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzjSlYxWBpGdDqVv+pIg3kuEssbNQ05qwEZxS4CT5kE=;
 b=hfXziwWO6rJx8Vnujfghd8Fqqr3+XnPN2jd3F7RVlB0tQ1CkdeZYSe4ZMruHbCho3U5MDRxQWnSPzAu6hzdpXm5xTe8lJzljD0uctuG2xDLFLIyopXPGVDh+jNlGVjdWOOryYV1kDfMNTYRjwy2t/Yfi6F8+dEX3KzuTPgBVX+FxRccU/on4pG4HSwyg/sKkKZb4Y++GWjWE1arviU1UGgchnRPEn3seqdZyfDWrdbT8fQlBvapbG/fZI3lFckx3/Y3JPTicMw+uxIthcta7YB0tfzdPiCY65SAAYT4rKDhy9audRN5EJFNA6x9k/Ogi1Hqqrk7E/M7ca0ESNlrd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzjSlYxWBpGdDqVv+pIg3kuEssbNQ05qwEZxS4CT5kE=;
 b=DvYPBylp+/VmyURyxRA0CfuiuGfvDVj3rTDwbBM6JSJpF4UPVgk/9/DaIUHL1Qb3ahdQqmc3J7T4IjvYBZufEiFNnGdk9SiMZC/E6hvMY09mzo8TCF4oO/y3zaOMkmTWshCxa4Z5Feq1tDugKhjpGQOsg40HtBxGCjs4SN9VAAU=
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
	ppserprodsaar; bh=vzjSlYxWBpGdDqVv+pIg3kuEssbNQ05qwEZxS4CT5kE=; b=
	B8d03+LmESuJ0GwIXspIFyq5kuqgY712rNetCPjKqvMRZWLVziUbiAaYD24z+HzG
	zndul9XuXKoC+mOh3wDcaxOmXvlQGFXCL9GuRjd8p1sVXtXRMCRFeVfY20UweLFD
	MSAX9+97hF+goyqHr+FwhovQnActH66hvm4jlt09yEQ2vbuDx03qwRXVi8D+Rmtv
	cUXzOr3WoRfL7QQYczFGUkdLyitZGLWshzY4VMyYIodOzGkWDVHXcs74g94ojq7z
	ouD9v7wpwAZy01San1XAya7FaM4Ln2PlYjljYQrtE9fSvqaDx1DY7Z2Wlo+BuRRK
	OYpLYaNUTKP41MdQirwyEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=vzjSlYx
	WBpGdDqVv+pIg3kuEssbNQ05qwEZxS4CT5kE=; b=eTsLJq/kLbM4E9hrm5eq+09
	q9osCTtjIN2pxRfQtiRNazGYUvZMnzufkk2WvZxzGoycOqIlJ15gqb2Oi+bbDxiq
	tvly12/sGQXp5ZmA4Aw6CqTvXhmWTUlzDHyam2uAPLRPZ4ykDGUI71K7miOJEo0f
	Df0MdR7vDzju0Ys9UvzVGGnrsGpbcg8KfRz3rhW9+d97kRpTRdOtkoqeeTXSrbtU
	0p4lssNih7ePFSTgb46vqnEBm036SwLNs2JlgqLpjG3Ae/Mf9jDtZmjeOww5VUQh
	HTNKFtlTuXGqqMx48ufW3o/F/SJwZlStYIS2fzmoszJSv05grD0fvAxnqrmw5bQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qmfPwSXo1JrM7qmfPwfgOJ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 2/2] xen/common: add keyhandler to show Xen command line
Date: Mon,  3 Aug 2026 00:00:47 -0700
Message-ID: <20260803070047.3097846-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803070047.3097846-1-dmukhin@ford.com>
References: <20260803070047.3097846-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|IA0PR16MB5548:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ecedcf11-c9e6-481c-0823-08def12cf8f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TzGJhZT0cGIVequW9NT2Lhf7qdE41ImTRKgT5boIV9tAG8sYu0MdePzqYs19FGfYyVa6AYZO2haZXP78Sa5yVt3FNTYqYzhmvGrvYgVYzNTjSqj+59IoW1/EOQ/QUZVgVTjKpjnwy40F3OO4555hJXUBjUVtCoITbv3Rnq1nRhaDtyqtIt6SqtcVax1nOugvpD/FPnEMB2vwvdLqY2bCzNAIs8YSu783FgRsdVZs6IFZg5tMBu5lQv4Cxa9LSKPl8L9rhT6Rov3Ass2QgFuG268XIEC9NpwwjCk5P/vhAfBKYogjW8gLJl3gsRAJskcvSyGYV9EK8YyM8PId0pDxlKJOgSqgAjeFjrOPipyQsZDyQyfVD6+DD92YfLHEBaAVieJYH5qlr0GtCoiWYIbbB0AMtX/5j/VoBm+R2kQtNWzSwSxy88Q9U3MDuxDKkp03h4xp6CYk2niC18v1i7KFjA1D+sSbD6UtvPYsKmrDSeNznQpEv9QE4KduyUMhQYx2GSAiNHhYf4l1gNSIreB369Fv9bA/aCwivWHzSZ87JhBB2g71wywY1XI/4WH+OGGO/a/mw6XBm2uuKakltPoRR/P/hUyeL0k1IKE+uAhLo0jBZ6yGIYXbfnuUVchhWwJDLE7lhdqqV0INNjT5OYeu8SKycE/EyKNVCU8shugPe+cpPdEiiy+w2jISBq0IgMTUiMhyU2NfvfOiSCrTIsuDKQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jg8zgoch5brPANMZ3XuHzNy1fLpUReZIYCbON75pDa+W+HPbWRM9rnI+Z3C9BUVfwDL8fIWazA+zzYORYZhyMmQdPluhXWrseZjtojZUU3hb3QGkLNqYOTo9V4yAQaGCs+gDG0ZkRUR1aZ3PNnqQzcniuLdye8keYuecFTbYVIFCPysjHvzyhwANEQ/X2Pju2PNvA4JxB3LA2SR9xk3kj9/LChMLzVAKvZOCDCnguqX1mP7yhSzcNRr4LoA13mZxhCUmGO9lwSNGCwW/pSiNrndAgeF/BWRYP0m+N8gSovdBZDEik8JuBElKw9tFvER+dmDStYTjNDwCTZhflLFcEZFRqtlErs3hr+jz67fZ5ZmjKdUKDAkaUF0BEnqx481dJcd5sHTOFNlCtXqaFy0v0Da7DfO2Sea0jDtmcQ8F6pohd7itooqrHT4NNm9Bv+9+
X-Exchange-RoutingPolicyChecked:
	PgP1uXEapN1K7iST7kgOhCdbzU3LvVjL22K5HRD1tNSWcb0revrySQGjYNpHB+KoMQmrgufvy1XCvdCs0PfkNuqmFeWoZI2iKNQxtNg5VfjrETMetc2wd3ItJ1MquwppgSmbd7Igz5VEA89WEnQGQZRIlTd37J9cVnFqwidN/HQM3WkSEiQpciMKY1JZUguZ8RJlh+dUeELp4fCC5hu785aBIdlThi2z3hMrNOmi5MgQJJd8bgtE+R8syIszyIVFNUQokWor3kpFZg5bLbE2iFJnMmm9ysIB5kCU7S+ucl0h5hxXKIbICnwfHO6cDu26BfOzAZcM0EpJygJqzxZ07w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bQugfy34CCvY/z/PRfFDCGp1Mnuqq45wm0MhWgxF/62ue7675Sd+CApshGWEqiRLr4ou0BBZv29Z3zB6t4hGAMylNVY9yWKgJwnQU6poWEkFgX65A3JVndB3eVEa0hxwa+aqaoxpoL4M0QS+zrPeosYrjM6TfSVALSnrYKFcG2AAHDMVMgBtjVc9NJwqrhEylpWZ58bbLyn8fJyaI2ACp7mSLXdpAaSUuK9V58Gv4DmCNT90eBqVZo5tjryEzfVXUaBwlPOVk+2R4QUeR5an3pEmHAGWQw+KzHevpfNbFa++Kwyg5xmO7AMCbrgzFJ30nb8ILP/GcIlEb3yO1oJFkVziwMkcvHNSM+RwoYWOJFE5JPOJ7v8AUfWS/wTzHoPSebBRcvvYuJycjFOL2XSb/i7Ylbzwe/70QmxuO7LZlcl3Nmc+MIB8r1lHlhBurXZwe+kM1hzB1JP1HXtRBX7UOrMujShaH8nPUh46i+Y0K67jg7EnT96UAoFYQ3MFPspNjlIx16dThjIX8OIHBtY925nWbd8KgbK57Os8k25LbfJXkWuXvKB7WYoZykBroKYyDBD9B3dZu+o4M8q8E2BMHxEUcOsMfkj+vWz8NpBOLeGR02XSf1T1EhiJpxihaZQ2
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 07:00:58.8743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecedcf11-c9e6-481c-0823-08def12cf8f0
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR16MB5548
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA2MCBTYWx0ZWRfX3CT1Q6fNnpM5
 i6KkieIYKoTkv4RO/mgjrg2xy7JCJ+sYOFs3rqOEMRqYNQEUbCejiVNR66JWPKchda8f9SNKblf
 x/SxsQYUm3sUlG6wldqSmDpxjYDt4MbRkSImuVc5B7qJOPb9MWiO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA2MCBTYWx0ZWRfX08XMUj3yLEy0
 i2LShH2g74tJSN6f876g5O+iUiEDDF+QcwKoVH8i4NnsEZHE4/MqHVMXNXQH0t8QNquw6bBBlWn
 Urz4P+NCgE1N4Mj4MjQku35+E5Snv3DgiBUHwy3i8SqwptOJBXLm3MgYZshaq+RYYvTNaf1Evnv
 /Z8t/ME42yexzPIj2zHLul1X3YeOeUTl6GF+z0aS26A8pK+P1Mv1xemofv7ibMmy0s9b9uZgxqW
 Sp6Gx2CbUGYVMP/9ct2/hj6emH4yKluTO9hHz4doc+NFDzgWO0hsduqThULawP7T7XCMYFem8ka
 xWkUrMmjFqqvkeaszsXXR8NuFWidQUqiQYFzR97JugxfSRRNnrcMSk0vOv3ROwWEtWRlBEBo9iU
 T5+OXANSX82Tj0rSv1v9Cd32mbxi/LEK0M3N3FTqgssjFRj0Xnekfnvn4jGN61fn5mWaP/4TcMc
 HHhGc7LpqWfB+bSvB8Q==
X-Proofpoint-GUID: 2Ke1h0DB-RlHEMINttMYzlXeUG1ejo9J
X-Proofpoint-ORIG-GUID: 2Ke1h0DB-RlHEMINttMYzlXeUG1ejo9J
X-Authority-Analysis: v=2.4 cv=Xc25Co55 c=1 sm=1 tr=0 ts=6a703cae cx=c_pps
 a=TVJYqPbIpBJCeYGeirASbA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=IgJ0wlFFhhnA7GDi3u4A:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030060
X-purgate-ID: tlsNG-33051d/1785740464-6E0D14E9-684B3292/0/0
X-purgate-type: clean
X-purgate-size: 1462

From: Denis Mukhin <dmukhin@ford.com> 

Currently there's no way to print Xen command line on the emergency
console for debugging purposes (e.g. 'xl' is not available in dom0).

Add new keyhander 'X' to do command line printout.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
v1: https://lore.kernel.org/xen-devel/20260730061459.2702672-2-dmukhin@ford.com/

Changes since v1:
- moved implementation into kernel.c
---
 xen/common/kernel.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index d1bef9ac2b2b..9f334c92e3ab 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -5,6 +5,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/keyhandler.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/param.h>
@@ -505,6 +506,21 @@ static int __init cf_check param_init(void)
 __initcall(param_init);
 #endif
 
+static void cf_check show_hypervisor_info(unsigned char key)
+{
+    printk("'%c' pressed -> showing hypervisor information\n", key);
+    printk("Command line: %s\n", saved_cmdline);
+}
+
+static int __init cf_check misc_init(void)
+{
+    register_keyhandler('X', show_hypervisor_info,
+                        "show hypervisor information", 0);
+
+    return 0;
+}
+__initcall(misc_init);
+
 static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct xen_varbuf user_str;
-- 
2.54.0


