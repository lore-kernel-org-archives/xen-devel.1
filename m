Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64711C5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 23:39:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388675.1629669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtw3b-0003xJ-54; Tue, 11 Aug 2026 23:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388675.1629669; Tue, 11 Aug 2026 23:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtw3b-0003x7-09; Tue, 11 Aug 2026 23:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1388675;
 Tue, 11 Aug 2026 23:38:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wtw3Z-0003rk-Fm
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 23:38:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtw3X-00Ac6q-M0
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 01:38:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7bb25a-2eae-0a2a0a5409dd-0a2a450bada2-16
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:38:48 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7bb286-b7e8-0a2a450b0019-94a39217a844-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:38:47 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BNF3HD2385691
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:38:46 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4g07nauru0-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:38:45 +0000 (GMT)
Received: from PH8PR22CA0008.namprd22.prod.outlook.com (2603:10b6:510:2d1::20)
 by LV2PR16MB935061.namprd16.prod.outlook.com (2603:10b6:408:378::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 23:38:42 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::7e) by PH8PR22CA0008.outlook.office365.com
 (2603:10b6:510:2d1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 23:38:42 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 23:38:41 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BNFS1q228402
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 19:38:40 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fxpbskct0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 19:38:39 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id tw3IwyVxBXy1itw3Jwq5Td; Tue, 11 Aug 2026 23:38:38 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=Lm1MIZUbcpt9Ppy80hbub2jSV
	/sdSaOmrxo0lRNr5TE=; b=l556u8A3xMQd91qptN3ZOkvbP4GvBpFVJ4zGlYcvX
	6D0mD2eZjlxBfWeWdTeg+/ctqckoGcHBixkadEnozNP9ucILAc0SFOzYYzkjAHdu
	w4aL8HfdDLAyY0jUO1vEXBeHNYFo/Chs7a9q2dkb4rqP2PbnG0tfEPL0I+ZIkRlR
	eoHoqoCP0pjCQsTnsDjvVpfG55V46n1S2OxXJFHgi1grXq+a51uvE5OlGjCwgHEA
	VDMJEWiUIethqsj9rDtLoYBG2JJVHpk7UDxZ9XB7KNXCmd+qwI34MOdz7Mp689Tq
	QWHz3k+WuvCf5RQQCQWdI7+sho/Esz4jo4GZ8eLZdlVIw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIxMxcRgLj+20DeiA77F5w/a2jnjpgFUlK0Cu/SuIGQ9waWM5m17ChrQIXFplGA4gqjvoKAzxvZ8j4Bksn3We9cILiKqdUSNVyGhCz8+Yux4e7o68XMkYSPREn09JqYUdoV1dnAvP1mOZm22RarMipSBv5c4QfQ8hCUjjh9BLWzDEkFEK0nIjwChKf6SmTUNOa1XM6WHQf8fNnl9nvPkBDVHzcX+UBTtPhEOV19HGbhttGOPvH8siGwebh/eHV2m9tYzoKJCS5NysAJx+pE5ggIJO+99XqiXIgJrxpJN3mzcdVUQ1yPBY0j48/75pMQQca8ElfmDvgn7yyiegJ+SaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lm1MIZUbcpt9Ppy80hbub2jSV/sdSaOmrxo0lRNr5TE=;
 b=ZIAFO8SK3pYmp4mtBpxl9r/2kWFIjA+x0CkWW3jsJNd3QUlP3U9GbKYleC2y8FPEzI6yVAhpG92ixEUmSg+Z55Hge2AeVuJkQ+Nuu343FBEAT32Bs9jpw9LY/aYmJR8cOPpGzcDsV0IOw5mLlBSP2WnrKJtIumzjsQJfpmIO6bQBsixAarkfj4XLNvTHMQj5Pewn1Z1P/eAxl5m6hjj1ZbQ2rhtj/2wlRe1hT40Ln1IFd9ZxO9ZOuAuncKqcxADql+0ibUcpqj5NOJYod7KcZj3T/FPt6uOVLg6SmVxnGBIdSJYgE49Qr042XQj0XB1k0K2EyWDKYwUjVBxYfiQxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lm1MIZUbcpt9Ppy80hbub2jSV/sdSaOmrxo0lRNr5TE=;
 b=IUbR57kjXpM6eWkOqhEYQokuomAJYG9ioPd/3p6dXuY6r651ev3quCqK6oMx63pb+8fAwJFxo/p5Lu5G2fk1m8TsfHbiLoBN19IWPQ0WkOmiyjbKEXcchWgdoQ8/KBCQKo4k0um3rKjAAteyZbLZ8YmMN8RBx4rE4m5auP9qCkQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=Lm1MIZU
	bcpt9Ppy80hbub2jSV/sdSaOmrxo0lRNr5TE=; b=Q4yJHupJ5WgJOmtyBNR5IhK
	hetTz7vQ3v0ZAL2Xn2tLeJlvZPTGTQjouR7aq1e95/oVkRSAoxQIHuqpvUmThSfr
	3GIKdIesi3dpTP6m6pb/o2HelrEtmbs3Sxa1r4lrHMQqKq7vb9m/ufta7fDfTIY3
	gC0kJVLjwgNeDYzfpcflx4DpSZ95GjwsqH+aUjycAhkqeO5hezp3AUPj+w9PoDI3
	eK6N5V4qSG7cbsFxMaIyLQFBbI1oJGs525+gReTl2KCiH7pZFxTsDQCz30j5H51t
	f6dofxUSNAUFRZOsWRhprZ1gUqEX3cW4LUwW5idUwMN/czhQ2CD+mgKf0pwdcxA=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=Lm1MIZUbcpt9Ppy80hbub2jSV/sdSaO
	mrxo0lRNr5TE=; b=rf7B6diqH4TyXe1I+WfUDW6ftZSLJy0FJUAiSkSxJ7MY/nd
	XvP0J+M3lTZuZrcE/jSifuA2K9dX0ywGSLj88V4Q7CURIRgZ52cGn4MyPhkARX4D
	FI/1hccLsWnXnlxzkTS4aArDg96FqfYqSJFC8jng8i2rZdrroJKrxpax08fvV6xv
	0h6VIzk2hZf4URuLyVgPSz82RpMMfRXi3jZE+qJHckxVH1X2AHEa3TNabc/qJAKU
	ZL6my8K+r/l80WY7NiEieYMiZc777rBsL7f7w47lAnQ004bT88S5po8YYUG0iEi6
	Xc8E263pwhVvMzBTPwkAlr0syU4n/hHPxtHBa5w==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: tw3IwyVxBXy1itw3Jwq5Td
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 0/2] xen/console: updates to rate-limiting
Date: Tue, 11 Aug 2026 16:38:22 -0700
Message-ID: <20260811233824.1874525-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110197
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|LV2PR16MB935061:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 06ca242d-86f4-459e-6439-08def801acf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|13003099007|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	gsTHsEq/+KgchOnNbqWjw3VahIWen2JXfhDubQe1pUMKzOsu0o8cEnOaGQ9362qJuWeAFQQjmD4EbBEIaVrtlRAZ5SkZE6trZ3z3tw9P4DUXKAZD2QlnzzIqNk8dh019f9QsRthdCjVwITPq6Hw1vKv/Ql001YcS0Yu/8RY+NoIY6pvDs9CvQL25ju5qOq4mMPY+JTGaksGn1ta4u9lrDaFFtbyNCSNTYUGx4LVEb7mJtxSdDKWt3aZHmhcdzpF9fRT4Vt9XB4FR4vf1+JQljGMn6TkzKVxtMK4vlVnS8Mp1nfOeMBzFwBoE9Mv2uhHXMxdugVXfuKugRgHesT0Utnt6vcmwN+Mt3fQ7Nd77ihDIkwUeFEV9SeiCq3CIEYj/Fi5lMKduirIPER5bQtpoCskYEcxtlYBQG//8PefITR2XQf62Wrif/x4fVkGbjkuaR4Hm9P+qIHdapn4zB3do6eZBpk+qbV+mF5nFecDY3jYUvaBxX56M8kjs6PyLmhZfg2aK33+Yogvl535irXwt0cfowvnk8aeIJ62hCDSJuwMdXIGoueNic9El5+HpjYIG+p6wH98vww/6FGZ5PmcmHj4ajQDssjayp7sU4pu5j9EdibPIgwguiKJcvi3EHMCXzayZq8xMsLN+4kpb08nAJ9DLY8nkCzA51AuP2GaO17zCqN6SToZoTRwR8oFE5mqdxEvwf6r7laHB8t6AyNFzYw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(13003099007)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+2kQ9r82I9XtR2sWW5CIJtFz613i5np3WRkkAbeb+Ri/bRVg+ezuPAMdLvchbkjn5ZwnK/J2gfzCdO3mJIcDxm8yeAdIHlU4SeGqN7xjMUFe85C/rNAJIklaixzQI4m5ktABBBECh+8J3UzRC5JUeihRY0Ga9Z1tbGVY5LFASK7gdRQMTnyZr/vWrhtwJHMVyqBMFDgvcNKQwhXVnfXVMateCvU11WDN+h3NRGZPsORHjax3Qb+YE0uMcchMz7agUuNnVDjEZRirSX49Y1XDqP3VGDelc27waxyY6I5knO5G1Vv/eIC1vs9OaSp31OFm1kyFoaV4Kl5vaHbFAZzY7FIdXM2tH9U6xpr7Q4G+GMHX9zrcTV5lktwhXVO2w2lBECBJgNT85lqW1EiuOfMflFlHrMK8Z8VfJIb9PfgYCltiOx3Oa8bx2HW8EC7x0m6Y
X-Exchange-RoutingPolicyChecked:
	Fsapvt+5hw6dzzx2I4pRQYW4FyR2L/pIxR11F4oucH5inmVYVvZABXU7hcabAX4kVKIYh2dTml7/EEr54YV48chbQTz/KNKAqzBwUmtV0QSif4gUhri9JpjTJqrN1wH1MwHHqxyZFQ1Xu2iJvZK4ZATmjF+pxL3uhXAG05yQ7lzNG7CC3UYRjwZLOTgcPfMHy8LtMG/f2GnJmJYtLzV+nuvI2fEgFcvHvcrzlP0E8Ti5Qf2p13WpVTqaNFHeQFhcItCKDLD4/BIWvIYrryp2517Z3VfNBcOZ/YbxDoB0/E+lKXG6udMtv52+qLzkbI0qAvWfikVflrCdUVAClGYsCQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nrr9Oxnwl7Criz7dINc5hOgSjJAjHV44QHk/PAlWsuDDd7MnQWR321OsDFWQ51BZ0ysv6iTEEHKIYxWTxscdOdZlk8MXtOHcwkC0/fxPx+fKZEe4R9lwmthtzG2gSOErRsbsdwRpQjZps3o3YiKcv3rQi/zY6FsJ9oAZ7gtFdRrh/LQDbkuxkdQfN1dHVOB5txe9vCg9VFxnrcgIbunoauAfOQ+QaAf1dxRRmJ/6dLQg3WJw1xsPqj/H+KbfaaAqTtto1/Csr+kowjOL6P9JFNBP2EPdzOZVSbRTv+BKUS0hMaRqVwOZWzokECnZt40shG1k9VmpiLmb8XEzTCkKxp2Hlno8JLjrcXHgxi68755L43CaFLQH2mqgKzDK9R8gHkNau4UTQCfkQ5Qgefd8iocy76zp5jSfg8IpHUY+VGrM/zVFoO9RkpUEUe/QYCXZ54KmG0lS3ITdoXLAx3SvuZq6fKbBA4KyPf6h9UPa9Fy6posZM9HZHoKP99xrYGossFeLYC8rCN8rVXyuoHBeh7ysL0QdbESEEqv6Eog/d5gcy3E8BFWOZ1qMacc06QzrBj+HTI/jSfcrhYufRopqxClWJFLjvJRsJdzI63Lv8jyYmRuDhBQkQmWuCU1XuNMJfXC8SBYkV8DPPug3LzDDqA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 23:38:41.1680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ca242d-86f4-459e-6439-08def801acf3
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR16MB935061
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE5NyBTYWx0ZWRfX4XTzCkyjGNGB
 ira8tAwnV+oFUoZrbOLugRIW0z+qGWCcM3UCs0ZPaCXY0tAXVEt6XOO3dc7gnfYDAcaogJKbMNW
 iTzr1rljQEaf9uT7VwZxvxCTaczY7+Q2YCLmecy9AqraXptH1QfEScfMvgrqKcSRH+2gudgaz5R
 4fZkvvqxb2Yg9iOzqGi6T2uUmx6ysLtu5pwyXyiBiSBLedbLnvpZhI7WD+TCh9BWcPfOB73XUw2
 0JkQoJjr2IVWpGebowew0EWg0I+yir3a9hrh/OzE3gWHXTPST5vIBdZRxtu6j+gkAWb5wkH/qVr
 4NdpBHeTUC7nzu1HDa5jJboArTN0JD6W1+uVXJC5Nk1ePSniVMGFXLCzG7Nh/oMPdlHw6T/5rDI
 8iHTxWPlSxR6IRcgEfTLzseHxFmEHIo2gCT3iUBx+ceETCjyQVVGCHF34QP9mYU+zThG3t6tLpY
 uCVoQVHCB7U1A1jtcmA==
X-Authority-Analysis: v=2.4 cv=CM4amxrD c=1 sm=1 tr=0 ts=6a7bb285 cx=c_pps
 a=wPn5mG08gX1eKnPfDThLSw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=2bYBL94XiJOHY0pNdiQA:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: QSnvp4bJtSk2v-AZJ9Ojc63bAXpXnLuh
X-Proofpoint-ORIG-GUID: QSnvp4bJtSk2v-AZJ9Ojc63bAXpXnLuh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE5NyBTYWx0ZWRfX4y6ZmYPffmi5
 JHTCqWGtipXlssFeaEUl536T4RcDHSb3DLp3IUvFGoM7Uyb8ucYYmGt+zaF2wL2PyH6MhIvss60
 TRrWcaDYC6LlynTEs11bdSOgWzAZf2vy7+dsBDTKrneps2vlF7Wx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110197
X-purgate-ID: tlsNG-42698a/1786491528-A96C29EA-7602727E/0/0
X-purgate-type: clean
X-purgate-size: 748

The series introduces compile-configuration for diagnostic
messages rate-limiting.

Patch 1 is a fixup for the rate-limiter to adjust to new user-defined
rate-limiting parameters.

Patch 2 introduces compile-time rate-limiting controls.

v4: https://lore.kernel.org/xen-devel/20260729072520.1556970-1-dmukhin@ford.com/
CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2751536715

Denis Mukhin (2):
  xen/console: re-calibrate rate-limiter based on user input
  xen/console: add build-time rate-limiting controls

 xen/common/Kconfig         | 30 ++++++++++++++++++++++++++++++
 xen/drivers/char/console.c | 34 +++++++++++++++++++++++++---------
 2 files changed, 55 insertions(+), 9 deletions(-)

-- 
2.54.0


