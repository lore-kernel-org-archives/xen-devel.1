Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415D4C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 06:51:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372096.1619487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobew-000225-NO; Tue, 28 Jul 2026 06:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372096.1619487; Tue, 28 Jul 2026 06:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobew-00021u-Jo; Tue, 28 Jul 2026 06:51:26 +0000
Received: by outflank-mailman (input) for mailman id 1372096;
 Tue, 28 Jul 2026 06:51:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wobeu-00021m-I7
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 06:51:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wobes-005thY-Ir
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:51:22 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685167-5cb7-0a2a0a5109dd-0a2a450a894e-16
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:22 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685168-f2d2-0a2a450a0019-94a3921753c2-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:22 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S3a1x3263188
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:20 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fpmkg902e-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:19 +0000 (GMT)
Received: from SJ0PR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:33f::17)
 by SJ0PR16MB4045.namprd16.prod.outlook.com (2603:10b6:a03:31a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:51:17 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::1e) by SJ0PR05CA0042.outlook.office365.com
 (2603:10b6:a03:33f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 06:51:17 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Tue, 28 Jul 2026 06:51:16 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S3cs3D267517
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:16 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fnbk4jqar-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:16 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id obejwzxGhVWzXobekwjDQw; Tue, 28 Jul 2026 06:51:15 +0000
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
	:mime-version:subject:to; s=ppford; bh=GPBocsKxtAOpdEroq7ji4xJW8
	PUHMW0FIoJU5tPH13Q=; b=j5t5b1SBpEyGpJ56u5KKhMvZNRUfmirbDTzpi2yu6
	vTqgacQ5S1y2K++OuoLQXrwQxFSSKhlUWj7XM36jnpnXceWDnNTTTw3M5LTXLNeE
	J5Q9i/+zSPnGj5or4Z4b0xuRXfyyzLOlDWwWAlLm/3zPctnQuO/UEZFlFZH+mGKs
	Ftl8wzJd4L79p2eGHc4TQQi1X/QsVppeVbmtjOO+tDwurCGLHfBFXGlUdY48CTSW
	WBRXYAQ8Z1NYVO12iUZ2c3HhXi+shtVqBPYNivMLtLHcKfzWpUdVxma6GbwAIB8v
	gAIEOScGewgQvvwZTCQdU8RcNaNH954I5eNI70P9BzqxQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2vsnjebMu+yTuKiFx+49TLJkCSE0t7OVk15tHnkM2m+fH9VvUoJymBHKcF9kBaPR3k9o59QS8s3k29R/srDUw5gdsf4BqgSHLG3DI2XvSuqd/jWYpUzSay9uAcjE7acPsAYgLibmVGlQ9qRHQWiaZ1APmfZu9EE3+DZyexZ8Q9kAv0HMoTpObnnr6dd6AR47R4ndj7NLPrKBcv1cLHM2eIuwzY+4oj86sF464rHjBO/YsIJWte0xSSdqNR0TVjQnJNTISM7alHYxZ2/hRTr0nZkaSj1sdPMxk09EUrerzroWdgM06sz07Ol/+LUMThJRgLMRxbwQmMcEBZD8xrjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPBocsKxtAOpdEroq7ji4xJW8PUHMW0FIoJU5tPH13Q=;
 b=t6W08ocfgGXzs+Qzlo6N40XjSHrLoCZW8KYq3onl+rr+Zg3DMBXwIeUV5CBeORzcg+QqKr87d0Q6iRq55OnUgq6JEYi5rnfPy6uH02cwzys8ttY8o44oaBjgXbHp1/gwp63FVoF1pNfzToZy5TG9hQHQ6jDbYxTcBRWZv6XECag0+0TnP0DUTAygVA/iJ1wEd/GDqSK+CU1DgAvCNTJ6M2eJ+c/VqxN8ZzaAXcCmFOIWY2K161eV8Cp9HZ8fA/1t9qAYV0AqgR3cGPFtPJVEPHXwe3yRL8dXzfkOqAsf4FtFcUM/il3HWGxsoWZfXYcVkw47lOxKKuwl7LvHkismHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPBocsKxtAOpdEroq7ji4xJW8PUHMW0FIoJU5tPH13Q=;
 b=f/E5DAct+gOViDgRzAIB/UnBp51EEjbkaYUBMD06zlLU+cfm9MOvcmHiVoK/LdijClindQPFMDaXhupXdO8hvTunLSEzjrzkvQhzqgFDJkXY/8L4owwtnAySj9Uvg8DosMy39doAVrNn9Z0w8dZVKD1ouZ9BkhKQ9F94Jeiewa8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=GPBocsK
	xtAOpdEroq7ji4xJW8PUHMW0FIoJU5tPH13Q=; b=XtZet9ZaUEMG4DnuDYZaW4k
	SgqKkTPHuZ6iXjltLvIYXr+/72Wwrd414Ki/awSvxbEeL7ks76MPgX/dntbI22OA
	poOzxhSeoraBAcNOLZSjj9GdZqa6lsmqdQi02dQPN60tP7caMzJlmwxoS/DJ3NzE
	U/+tsNI1vEice6Guzso14+mx0WCvkvBgOJBvwEILEiojz9OlcCdQusBLSsGEWeGI
	JLwkKgojVfi35cUkEZxg8u1V+8tMD7eudOsEp20QHJcPBSJu0ZAzKmtIvfQnzFpL
	SQf+83q00AouMiBt0I40NMDiXwLHsr0RTRjTiv/qwk4EwgbRclNx1QfPkb3t7sQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=GPBocsKxtAOpdEroq7ji4xJW8PUHMW0
	FIoJU5tPH13Q=; b=d4+X2EupitbBxqOap1GZcSlfAvAuVA7aMt+IMDhEizUBbi4
	RmhuNHHeoeAI00N1ud8Qm32/vWw88D8oV2USc64uCwloNTbFdnrStb2xbEL4vqi6
	T5UUATO+dlmZ3ZLaWMZnXNdHxhof6lzv9fvZ0WqZJHDpwB3OUaFd3zIhgVzOzwcB
	RmsDyuQ2Jx4fI/3sgfAHbUm3nGMyOTzzi3g91u4zrXMBPAqHYqdkKiBy4gPYcb/8
	Pl5w52oPSg6nCebeSla2EjHX9OXE0Qs16VY/GYkgFDBMYQpMqMEWldDy1Lxq3M/D
	z3L2ckwY+8BxEh6uhwytIKJbPqX1Y0YyJ3ma11A==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: obejwzxGhVWzXobekwjDQw
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8 0/7] xen/console: some cleanups and configurable conring size
Date: Mon, 27 Jul 2026 23:50:42 -0700
Message-ID: <20260728065049.1318143-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|SJ0PR16MB4045:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6129a5a-7abf-4407-083b-08deec749f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|11063799006|10067099003|56012099006|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	zlzHfvGWum7iRaflvGBTHsycIcDTjjEuSVss7jYlCKTdj0n22G6B5sJDUdUen13fOEugsbtsPUxdDGW+gM97K2lt/kLyfmV+9AcOX1JqXQaP+2UxQmKEnOtW+8H+Qf3R9ln4iRJyVtBYdBW3FJC7qqxSEtnGFzbVRbJ23deIiPI/eUNN/4wHc8A0Vu/OGLIBMn6IiYQWO/xcJHNcRGyirr3RtgzHwnC2cwfIOgHd7CHRbUhth5Rw/KaAMPdJaKG4di0EjRw20hBBWj74iXor71An2PQFvOicoBCpfsBMSKVpnl7V++G6ZT8ai+R9W3GCL2PD5aKA+XJdaPmYz8RROdMLUYD6eIFMAAaK5XyokhNBi/qFCDk/494nfmWWQROCHh3699OHD9attdhKPYN6zvzAeiFhoMVojhynLwyEW1CiUTR6QvKmUzzJ2WoT5kjb+MIfM+H7Ujr4BzpShg7Pa8YQ8/Y0foTCv+UGzLFErR6tA5ePGHuh57JTNkebp97T0Bh51559JofuDnWNXMuSZ30/QJloUkoJl0kW53lpEs2iXXGlfRuJLqzKYVbbNKEYGl5K/iVoXo7oQhfeUJ1eeOwTcTPN1CrfC+V/9jGmesAMPzbfzrNmAawBWthRmTIwCNaKbcN5MvI9J5PcsqYCEEecrRRIkBUMUHLEv4G/eFqocHBZ13zAkGBQqIna22Ie2brafGC9wPD5ZH4j4j3LZQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O/CKuXwCjjbQ0KditPnCWEFDMTXxVyGG1p3/DhdrDf/c+bIqKR/TwdBH994W0qMb9lRw65gUUDKx7WUmDllpMDBUzBEXZx8BIMjUbA/3Jmlkh3UHR8P2S6CVFTn7ZqlZiVipb9r6wvzm8UmvB/iaPYk3HalnxOQZ10QZiKYQdDiC4QSfChrKwMREQF1mVJP4k7O0HdvJhriZ5xdO1H94J5/cs2TMpnD4LCzOV6kXQZTgLJjHjd+XcTZ9AMofJ0gHr/go13iLTY78CX/KcHKyBOo0aWta/leo6mzZPdYfRklWZEWyYmdSevXEgoZMksOlT+ztzulQb0YAs/tO2mihvrq94SLA7AIxBgsLOcc9ZG9ZLF+HrpqvpF+5e9gE5/mcak5nGUxAAyYbXzRkhFBd5gsCMt6sL7PXBCOGEgh+7sjAF/l1f1FGJovSDL+cuG6J
X-Exchange-RoutingPolicyChecked:
	j4ZXMWmZ9FVYSZ2etszQ0R1o+8PPc1ZHm98zYy9DWgIBJCtk10+QeK5Qy3Nb7iu1a1A8RuU2FRkxSmj+hDanItiwv5ZjqU/UZC7e1KriT+zzpH6YYJL09oeIB9NxEti1EkGS14uXetNc3M6VELx0fDX9srN61Krv7tU9GN9Slk/RouiGzLJ9LUgEmoDukfVl3xE+qmUnqMgcv07BcyURxWs6gr/2bvNlX+v+/bvdOq6DrPZOqjR+udqyGLdbEl0rK0UDfSPXhbwq6R5VfissiAGD5vhepE6ou5VDHRLiXPRyNZX5Y3+0J1xeD7eoxRa2ai7DY3e0vQlf8GNUC8iVLg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oxZ4EUoLnPBx5KsaqtVvnXMM77AFwkt/tYO1fBngmOixrXvLNoH8Q1VaSXdLVf4u1oijoCtTq2hLoduEArmF/toni1ByTgz4I8RY514EIh+4HrXbJoXYl9ng4TDqAGMjL+rhUttfxCQmbEtDAUX7bI+Mm9s9Gg+4XhhC9Yl+sBChI1I41X8KfR3/Xy32J5WgY8Chofqw6VG8kraps/GpQUmTCrK02f8GDaKhtWORZ9apUSx4IAXNjTeY3ABv2OPja9z7Go98GzwLZfJtZqqP7qBSfeMrAHZ+PfXf7eqthROeOZbT2Alx/C0oos9MsHzPcIaiFsPapJN8dCOqWs+D68JaEDTFt15ebL07229CE/hlHzJBccQrczTWOP/az3BsEpALdC7JNxlX9rsih4MvneRwP26lElUg35fDvz55m78e/MoA13dggDrDdcBv35ZwuAeWmOHQED0CNlyyHXHmmIh/XiJbAD8+yZ4k9L24BjzbbLew0RhvyDknUq3QnRbCA7wdXqss2Ksmd3vCFAv6cIMoDTumpEP4Mq0VxPwsWs4YCQYJ1L1BNpJB6YaTtvqL2K5AMZUsk7/+X+azCQ2+GjcsKeW+oH+yyMx8LI1a67qIvVTG0AawV0v3r6Rz69LQ+4wyPlgvRgzBXRyf5JTLSg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:16.7183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6129a5a-7abf-4407-083b-08deec749f64
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4045
X-Proofpoint-ORIG-GUID: 9aSqmu8mWpYUTUN3aULsN0PcTizs3M6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfXyTV9cG8Ievfp
 oDE2mYb9KSlSlovRLc1BC+t8BzkGngkzou8Uk2FllPgg0cMXqzHId4ssRH16kbJJWDJF6iNKlwx
 6mTbvqiMg0Bs9WPPNG32Ku1a5iyDoGWDgD4glB8X9/sLwLPqQe9+r/6AdwWxNTIQEx8HratGVOe
 dODoIrRd7iGVHtCvSw3NVxlmOE2/KMJMlbjmn1wqPiXPTvJOeTYnKt88tMJlU90oOK02fU3cKoE
 g05Ec7ujiL4kXTLLc7o+blaKpjVsqBBVVh0apIxSqhARRUroCsYpN8HGnjLzReR7vQjPpEudl0H
 C6O4c1yHhj6YmDMUZCCU9OrP5vKUuOe6g6PQGgPVMg8p0G/DIwLzV0jeshGex9prz4PYiO3lQKy
 1amQi1R5QAIF5TE+xwtlCt5idXORSwTUG4Gmybbn5Tebbw1+oZQW/7qXuy1B6IH1EvpS/HzfEDE
 iPcrvQcqLOARxFfaxxA==
X-Authority-Analysis: v=2.4 cv=Vq0Txe2n c=1 sm=1 tr=0 ts=6a685167 cx=c_pps
 a=rl9QZQJB4f+cLtFzzj7oTw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=DbMjhcVk2PN3n7I2qccA:9
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: 9aSqmu8mWpYUTUN3aULsN0PcTizs3M6T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX6yb+eLnehzcQ
 1Ke8phVsEnH2COuYF597GPQenKaTF+BzeEJoK6013s1jnqYgjOIrVXAQfwjoEkhwYC5NfhdeQc4
 QIPNx50kq4nNpi4cTsBAorKy0+GzNiblyOWXSuxvCRM3yP1EgaBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280060
X-purgate-ID: tlsNG-4011c0/1785221482-50ACCCFC-0AC13541/0/0
X-purgate-type: clean
X-purgate-size: 1438

Series introduces some cleanups in console conring and serial
driver buffer management code ending up with adding compile-time
configuration knob for conring size.

Patch 1-2 correct the data types used in conring management code.

Patch 3 updates the conring buffer allocation code.

Patch 4 updates the serial driver buffer allocation code.

Patch 5 optimizes code in conring_puts().

Patch 6 hardens the checks in the serial driver buffer management code.

Patch 7 introduces CONRING_CONRING_SHIFT to select compile-time
conring buffer size.

[1] v7: https://lore.kernel.org/xen-devel/20260713181619.672176-1-dmukhin@ford.com/
[2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2710713367

Denis Mukhin (7):
  xen/console: do not use XENCONS_RING_IDX in console_init_ring()
  xen/console: use 'unsigned int' in contring_{flush,puts}()
  xen/console: switch conring runtime allocation to xvmalloc
  xen/serial: switch txbuf runtime allocation to xvmalloc
  xen/console: use memcpy() in conring_puts()
  xen/serial: harden serial_tx_buffer checks
  xen/console: make console buffer size configurable

 docs/misc/xen-command-line.pandoc | 10 ++++-
 xen/drivers/char/Kconfig          | 21 +++++++++++
 xen/drivers/char/console.c        | 61 +++++++++++++++++++++----------
 xen/drivers/char/serial.c         |  6 ++-
 4 files changed, 75 insertions(+), 23 deletions(-)

-- 
2.54.0


