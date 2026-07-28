Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4888FC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 06:51:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372103.1619540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobfC-0003Wu-Iw; Tue, 28 Jul 2026 06:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372103.1619540; Tue, 28 Jul 2026 06:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobfC-0003We-Fp; Tue, 28 Jul 2026 06:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1372103;
 Tue, 28 Jul 2026 06:51:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wobfB-0003Tk-9Q
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 06:51:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wobfA-00A9s5-ME
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:51:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a68516f-2eae-0a2a0a5409dd-0a2a450284a2-38
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:40 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685177-6ca4-0a2a45020019-94a39217dfce-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:37 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66S4snKk544592
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 23:51:35 -0700
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011065.outbound.protection.outlook.com
 [40.93.194.65])
 by m0482516.ppops.net (PPS) with ESMTPS id 4fpntjgnsd-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 23:51:34 -0700 (PDT)
Received: from SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13)
 by SA0PR16MB3871.namprd16.prod.outlook.com (2603:10b6:806:86::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Tue, 28 Jul
 2026 06:51:32 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::93) by SJ0PR03CA0158.outlook.office365.com
 (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 06:51:32 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Tue, 28 Jul 2026 06:51:31 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6d3H72911163
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:31 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fnbs72m2u-20
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:30 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id obeywuJbpERZKobezwQkAy; Tue, 28 Jul 2026 06:51:30 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=oOT
	85RKKWjGhkhbuQtaAN75IZgB45d1wpAc2pCHqaKk=; b=AWH13VJlnzLqNyUFtZJ
	JvAlri7UO2mPt4yMraY4mBzilKVXkweSstInRaAPKQUa8fYjWhqDWVP5m4HTDY8S
	tsUuazimGnTWu942MkE2athFo2zldTudzIsgNH+pZrAe3qPDS0kH5pf+06ZxfBip
	QMiHfzaefEjqM/KzZesAf43I5lHxumZH47GOSRbpHCC58iQ3WwKHyOsSeC3bVJC/
	7Yi29IubT5x+7k+8VSzxLyOJnnxLLgwHMEWx1ESl49q8OBejSddCs+Xt0z0cZWIA
	ofJjcrpwWS6siHVweif9ly7iZ3THKY11CDUgDazDhhXpf8sG5IiISaZyDVHTIYjg
	skQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxJjirFVZqA2udzz/dsgxCV72Mph1aCsz8aCKLe3LnlfyHpYNSPavfrDcRHGP8QcdV3ji8K45SSjlWoBqR2GQu9wG78BaJ7V3omMECAT1/xK4ydIfN9C4BBOL3eK6eqwhisrKIqiDXy8nOKpqAQbeLUdtEqlhsivbpaLnRGrr2WIt5ktsh0icmRMH7C5ExtyH/f5cCln+dIAtaDf/iZqq5ZVuMK1Vs0Y84P8/18S+Wf+Mq4tCSagy3jt97yxr8qhOlB3rQ+Tunn9azuwEzPtOD9mqXOBbR0+0cZm3UMwZDwPOz4vfxAR0Hkv2nArgMfeDFOr5qcPPw9OtcIXp1bGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOT85RKKWjGhkhbuQtaAN75IZgB45d1wpAc2pCHqaKk=;
 b=LB7EPdQMb1U9WZxmjYFsOe4cvvnEVj/cB/XXi9ZXDoe+O1vy4Vy3Mo6g4pUtPQNad5ZTJ2cyWubZF/8rtWIT1oq6/PmIKX6VcerQsCaYHOLqt9Y21NUyFYdmjOnBryBmzlOjT9sNL7PHN/Ey1TL8Jzxt4AMBwxgEy9sMvQbU6ttwtRgfGhZPt5zYyARuZtHcAitXusmYTQQzp+cXtItdX82Pck32wCa9x09G6lwZTwH8uV8B/ni8MYlx8g4P6fRlbSl1U/uYnFtvLt7V/ptRb465KkIWuQwaPPFGcc0CgmVfhFOgL8bgwHro4VN8jnxO+V5Qr+ql2AFKj+DSc2UIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOT85RKKWjGhkhbuQtaAN75IZgB45d1wpAc2pCHqaKk=;
 b=QN155A/rn8zzr4ehn27b89J53ypGa4qK0gkqUVS3ySYxd5WHv1RPp9jX2hL+C8CS3PnNlKFIW3zJCy9h1sx1jMIArkqwYmc7JT5+SYSnWYu3U4JYeCNhkkfkDJzus2rgsArehdWaU2bm2lva1jxb+paRBI0h/UPQV5i+SUh+GPU=
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
	ppserprodsaar; bh=oOT85RKKWjGhkhbuQtaAN75IZgB45d1wpAc2pCHqaKk=; b=
	OGXlE1y92RKi3YNStOqGYdLte0m6/IRdWLnZhXXDI/mjsWvX1qNTf+TZm2AMSZgu
	3W7RzFQEyzDb8TXUMWyqY2mFjvsZuLs/DeCTC7ogWuijzRvHLcnf9eJhKp83egPq
	gk9ojsgOlBXsVIDqfKj/jyh3wvuS1mMxd+Ky/SWVnLaPdHj0V0lzA2f5z/lGz0wY
	baRZ7+MSKed+AXtcZ73xnQ4F3be70Qr26EAFIqbkpBqgO5T/SfLNJ5sRWSz/IZZ2
	THRK0aGYa/FRvSCD/C9NSycHTOBaxr9j8jB4bl1BaA354NxwDb0V6CSihJ/5vg/k
	npFNJUdchn6P9yfzVC799A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=oOT85RK
	KWjGhkhbuQtaAN75IZgB45d1wpAc2pCHqaKk=; b=PDhTjVa490xLy34gTjgYFzt
	MuF4tQldaQ/vxDgddBrW/mVY8Z+NKjW6dijM+GcSuxS9vT8DNYtbJX8BZeRV5H/A
	i4VlVFgWkNz7ynSHmSD7ECH+MZT88CgAUczuTpl2ERyfZtHwDWZ9LxPvNRUcr3e3
	qGbTkfFKnm5Og5IbEPVTNUqzWJuZ2a3+rLfP2ZXyqWkjJ49Jfbxyx/T+qA2kjcU+
	b8XXrlVG3mPbg2sJ17Fgovwp9gTkEqZwk4PPDGSc4vHFZrYW/SdnXemPcgrvXfM0
	f0HguQ0/J8kdGqTAqt9XMYlOq/VJyFW5LP+E71HFWj/kusigL6CgJXTAFUtrYSA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: obeywuJbpERZKobezwQkAy
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8 6/7] xen/serial: harden serial_tx_buffer checks
Date: Mon, 27 Jul 2026 23:50:48 -0700
Message-ID: <20260728065049.1318143-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728065049.1318143-1-dmukhin@ford.com>
References: <20260728065049.1318143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|SA0PR16MB3871:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: abbbd726-c69b-4209-5112-08deec74a889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ULynf9Vm/bjTCyT0/JZTthhuMWH1kpprxoyBfjGGY0dOvHflcCeRk7wAvRqMsEJW9gUhDo0H2iRLdLa7x0NItar7X9+CrGGIljZWz/twcZKOLtxI5ztptgSARD3EED8Nb95XioGwi2pxLeivHhkHQ4KHG+ecilcWR/FJESqRHJICXVk28wcaDuHugGIbWN8yz1YTrzPGuv4e7yBoaYeUwLl8GxNoYnR63bTHymrHV0u4VTVhr1TmTtvIjx3hdkzRyiBj3LqAjMZ0RAHTRPvxzg4ByJKcb50T9iD4HIX7phLW1TfHO2UvIAaTk7yKaWpKA6H3aQh6HzYpeeo6zlVZV+HaCWIC5I4HoVcPQG6polu7DS1rmHVZx51GXOn2MwbaBDfxvxkXWFyXnsqCf0rdRK5Czy9+Ydhu5NlOFjBoeTvMYjiRBpqiP2Wi96qno6t2qS/AUSXNVOcaHPGdoYcpz2itBHS26XxvasOk0FOPbpdfmAPil9P+Ro35+qeXyHU0Y9J2w7/tvJglF88UfcQ0GdBX/zUfo9E/cILLLWpF9qtvo8ZHpS/+ETJLemnBHhvULJwDdPxp7WxXqIHcoXU0e4nUWhGnzoB4OlNuWOKxJ6i7N4Z7fKpfOE2YYm2FVbJb5inuIEI+swnMHmVfDaBoe0OVhqhxCTF1JZOSqLIADKoDV5M8gbq59tu/NdWLbY2FlUXPzIwrDku9wGO6CT/bUw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BhQp4ucjLeQY6ocRjkUOAnJwhuF/SHL5BynDYKv43mVV7vo+AKepPvCKAiZEb7BY30POKL2IN1bHYBEyM5wYgOrhuVe/m+sP0KV2E+2efEdeqQp1LI2DTWeAnEb0n0Q7OjWM+J2TVnv24IfCu/ZL8DSpgLUkEWO6x7FYGmM//Oa++TwJnkizsOeEMmBAkYzosNy8aGWvjVCWMeTO4XzkiWRPhu06uwKUow741x1PekmWbdtwYKZFWHgCzFFPyd17AX3YA25y+yMVCYwEI4R26vSiYGlgfUsCiDiZdmCAjbUA/UyUJhEZFSxRlANlwbWmv8H7rGFQRqXSNKuv/+wVEZpMOhANo7WVAulwroe56yfz2zWFPocxTmQkE25S9mYh1u9N5du5nrccd4ULFPIKzPBvruZIRyZHmQ1ROPclT99SRU0W31+d+peEnPLam1am
X-Exchange-RoutingPolicyChecked:
	MddEcUW5OJvywa/7dzQyL93LQRwZYMTwqtcnuTJeOUUdnP+iUUnwp12008BIKOmGBo5Rts4NMuR1TfvOmvNPl6BAWjbdekKctQQPjiZLqIcGSmtMeLEpxdJKa0LRLb0o7BRI67pVTDk/C0DAxvQDEaxxfjDaRrYCKdonSnJC9GUQ7Iy738WltMGfSgbWCkMHILzdXjVjWjJE9p/fVzfUG1P+/jrcIZOTmYZbZK5kYLSGEdq78Sqe73+ZyrXatnhhgNEylhCIx4XvXKOQMN4nPnKGpL/poRvP2ag2G1ktBiIgUJHbrTfpXkYNn/mSV4siCHaVb459irbSOWfLlPJePg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SYrNbshshMO627MJc1TFhglZ719iQvEWU8IRoKj/Ez+guRBw4EG1tYHiEKKnpx01RL2mH6F62AbljRwW7D2fdq/+x61mUFF0i5WLSt73k+Syr46QhNZC8dTacF4ljIZ6fNDVpoIASbtPYUL/8R+nIHkH5ugp6rykTwE7hzkNHGCLxd1NlfAMbIpl+A6B0e9x7SVgwnTzuOlaJ6Ei23d9/30fMd/O6p9g6QKGjBncbreV4xluqE8Z8uXWtjegryhB2fOhaeAFydPGIq7G8RCUN0LF6xqA42XLmKi4MSsdfdcdUTHdriIe4TcKXt0mysd0N0TGbjniMPmJ1kJBQec27DHXOg8chDrWxUe383uh1tJK6KQCfZibixg2MLyxDX4QvawlJEyubaRUq3OKDi8q9HN5K0xluPbLeSTgTObFiJPa+sDt3ZgPqJ/bhUvWlARHBaYcx6+oi/6NBlhupvS9yAy+7TVvvSXPKSdsNkWrvQKE3Tmap47+ePymL7rJjK1Uwsimi9/fpysALR3gh8ND5oSX2xhmv+umXrQZHo7dhQvUWKbs7K4SO1D3u1Vnj5dRBIaGsPNB1jIu0TaZf9GbJGSBKjLCVdIkqAWxpx9fX5dYxBS/zyZ5MehIELWm9Ga0AngHEKSUvoyds+0JI7pQcA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:31.8480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abbbd726-c69b-4209-5112-08deec74a889
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR16MB3871
X-Proofpoint-ORIG-GUID: iN7Ie-5aOfWuDBL4T4-hxc8E4Eq0oH0C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX4tDWtFFonYre
 l2r6EfZv2wYA4m/Ou+7YSbRbAu0U++Y8l14NbLXgDsyHsdoR/1mZlEZh44f3m4rsp29I+zp8wVX
 VqibeSqpIuCV+9AA2/kT9p+TQU7eD7L7UEYBP+GwGIGrxnXe6YCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX4ea7+a6hZtLi
 l2uTh5guPpj4B+sxyIL+PJ4N7E0TO0NIiZFIdAVxobRxmvke0xhLNOcQM7Z6dy8aKQt/B3CJDiu
 CE02aoClmBGJXeLgFW9KWo+39AZyXwahYbrH1cwqPHje28rNmqDpWxoiglQLQrQgarWiWCpx+y7
 an1SZ/0PV8dja9e9aR3SuaR9idOR/Jt30j6elmye+htRlv5hsIY7mz0654X8kouP/N0/1YQ0D4N
 kw2nNdLAWhovoK3375g7RfCgsDil3y0ZCRxiYQtO2TrN16Z7wJ62XP4XmBd+Ti+K0ZI/4c5jttI
 Q0pyCS49wGBQ389r1AUBaxjhTMHloF+nfzVzfeWDoiNtf26Y9+x/Wwy7aFRsrj3ORmi7ej6twRE
 GiVk+J4xj156RH+gTORKTv7tpZfL5kmKZYYvWS2GVdn7xDk5k+cJLOFudgc7/Fkd/jfp/CIbN3b
 SMXDwqcZys1+xXCHo6A==
X-Authority-Analysis: v=2.4 cv=X9xi7mTe c=1 sm=1 tr=0 ts=6a685177 cx=c_pps
 a=JPuSXJPnATmcGobPKBfcew==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=cbNQJ9GKAAAA:8 a=sEGBgOXDICq9IEtvUCIA:9
 a=G69WFyCBNqGPyalROSdv:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: iN7Ie-5aOfWuDBL4T4-hxc8E4Eq0oH0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280060
X-purgate-ID: tlsNG-720697/1785221497-F36BF2AC-AE2B67C9/0/0
X-purgate-type: clean
X-purgate-size: 1697

From: Denis Mukhin <dmukhin@ford.com> 

Ensure the user-defined value never crosses 2GB boundary and always
rounded to the next power of 2 to align logic with console driver
conring buffer management code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- addressed Jan's feedback:
  https://lore.kernel.org/xen-devel/89029dbd-df1f-45d4-8a02-720cd6a42cab@suse.com/
- kept only check for large buffer in serial_async_transmit()
  and a doc update.
---
 docs/misc/xen-command-line.pandoc | 2 ++
 xen/drivers/char/serial.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1c711fa98086..2be8772b329a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2396,6 +2396,8 @@ accidentally leaking secrets by releasing pages without proper sanitization.
 
 Set the serial transmit buffer size.
 
+The value provided will be rounded down to the nearest power of 2.
+
 ### serrors (ARM)
 > `= diverse | panic`
 
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index cf0abf1893e5..ba1647309ab8 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -523,6 +523,8 @@ void __init serial_async_transmit(struct serial_port *port)
         return;
     if ( serial_txbufsz < PAGE_SIZE )
         serial_txbufsz = PAGE_SIZE;
+    if ( serial_txbufsz > GB(2) )
+        serial_txbufsz = CONFIG_SERIAL_TX_BUFSIZE;
     while ( serial_txbufsz & (serial_txbufsz - 1) )
         serial_txbufsz &= serial_txbufsz - 1;
     port->txbuf = xvmalloc_array(char, serial_txbufsz);
-- 
2.54.0


