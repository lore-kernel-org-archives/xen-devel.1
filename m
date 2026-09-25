Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C94C9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 09:45:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433603.1654077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA2UA-000563-8u; Fri, 25 Sep 2026 09:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433603.1654077; Fri, 25 Sep 2026 09:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA2UA-00055w-69; Fri, 25 Sep 2026 09:44:54 +0000
Received: by outflank-mailman (input) for mailman id 1433603;
 Fri, 25 Sep 2026 09:44:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xA2U9-00055n-3X
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 09:44:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA2U7-00HJzP-TX
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:44:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab64289-e002-0a2a0a5209dd-0a2a450a912c-22
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:44:51 +0200
Received: from [40.93.196.18]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab64291-f2d2-0a2a450a0019-285dc412ca39-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:44:50 +0200
Received: from SJ0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:a03:2c2::12)
 by BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 09:44:44 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::32) by SJ0PR13CA0037.outlook.office365.com
 (2603:10b6:a03:2c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Fri,
 25 Sep 2026 09:44:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 09:44:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 04:44:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 04:44:43 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 04:44:40 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEV3O3Z4zG3BnNnTK0KXmXjXb5n0vATjQrb20lrNPycXnGnAg1hdl7N9RTl+eJg3k1jTYVoPVM4qZZGoF8POlko2nkchz1htjkEhZYT1zpiIfgxoBxiEjWEUaIjygaRgGSgpwyWkb/zndAqbyiHKJrqw/utu86B2RpwQHlhpDBq5ghM82oPk1B2Jj1SyfnvE6EUHMMP+8iJyHHuK1NXiJtC7RBS2U0gocyMw3mg4/JCaPZCd0UHCjzHBp+YoM8kFmrj5RysZnTy88xkWyOHygGNxucbjm1jynb0euo0mbbGW1gloAqBl63GlW4RhETUNJQgMjdMyxn3bTkA/3URypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i28OjEiM8mx+Q9SHXTUbKcboZg2drHrP221eBpOLvuo=;
 b=hdKmVdiP4nHPlFRObL6xG9Xbip8xvD51zgIIjiy6GttYMwEJu4p9TarY3gWPwyd7la2Po7wUBMp1ZPwg/MLoXqcxjvpeOFt5bA6MXdenjH2dwl3AqkLz6wtzqzUIbY/GwijjAUOAnQch1nKtdKVyRY8uuncHKSN/iy41bDJWJ5TNlw8wY/fNmM6qJjtuIcILDpHjK1IuaVjhsidr4A0yoqxUjCNJCrnX6oI9+ngydbAvcOKa/SlTiJOcveOJyikLhCWsGquZSIzZ6aBeVcHWzv6O44pjCLVDrbsoIa+0sfOch1PsStMHPIL4vmNEn8yGu+5iyZ53Su78dtkOKbMeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i28OjEiM8mx+Q9SHXTUbKcboZg2drHrP221eBpOLvuo=;
 b=JPYDd5MqtXoce1Vi2lZ2ZOY38Fj7URL+J0Z+TJNGG0b1FAOLYEHSVE6Z+ssP5Om5jQ6reqq/33fWp8MSkmeO17mVxFnhRg1hzuQFWUYKiP2oKnr+Lvi/W5or5CcdvwdOCPPshqlnrY/2BfpDrtX1nYqS5sfr93BhR8ISJDRLnRU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1421f319-8e95-431f-9527-d492f8397cc2@amd.com>
Date: Fri, 25 Sep 2026 11:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Consolidate linker script setup data
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Teddy
 Astie <teddy.astie@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>
References: <20260923161935.24429-1-jason.andryuk@amd.com>
 <DLNO61C820D2.2TSH4227QA8DB@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DLNO61C820D2.2TSH4227QA8DB@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|BY5PR12MB4131:EE_
X-MS-Office365-Filtering-Correlation-Id: 787c5000-64ff-4429-197b-08df1ae9a11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|22082099003|10067099003|56012099006|11063799006|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	wfpUhWBNB6PG4Ac6WwOMwzKxP/c13Ys7I+KV1QkOQd/6gH9C62HSeWkm5E3ajTLUR4rXl/JaPm0tf7dO/oY5INHRt6ecInwJ+FHEuHTsA1GQjgcnX1HWdMHEI6oowLew9na9RTNQy85HZcrso0g8QCmWWsSEmVnr0Ipo/lENkWmRhz0u9uTXIE4C6GR87gJzXdeIyS9Myl2SCIQ/Ayz/xSF9JsRwSCArzcq6ygES29pFgpeqnvwj8LkSTLDm/y5+3MYIMjwrWcOc+5l22KKwp81Q2IS1Xdq2dHX046DDhZxhojrlmBk4c4ppooBAq6lGFg7462yItJp7n4jVfMjyNfqMGXYOlRGiyvNGiimzm77VgNgRcF8JOmJtko/jbNU3am7cfHGGlkSGkeqz1f9roSj2R5vzHeRBPuk6wWFzYAAsp+FnK7ojJRMAD2i241l90dNpRdjREDeDyU6S7g1yres2tnSYK4JeBmcdwvLNcJji3T7s/IL18yVgwTxS4a5MDHLKrk4uhoM/HANFxmBt//hxOThMqGCIhDqCu6Kz/bBsrGVvSRHO8F21Isz2ZFl2HN7vTO0QcLhHqw11uxAj3tvcqyelbV2X6V5Ehj7AnHEi42arAB+BCOO0tjDVG84BqjgdKUa3ImcyTXNdkRbuEKUtFTV8Y5GzgKpLYyjhYWlvYsBuclW/zn3rUvOsANPFuEyeSnj05wkNvgw3ucRxtg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(22082099003)(10067099003)(56012099006)(11063799006)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9NLNSlE3mGukb8nbsD6DekHydkF6eGSUazkuGibvvEGp5cuW4LaMu0TeuWW3LIUHVHIWq0nV/wOZ0E1O9g6g4j1042mie6FmvmvxqTrXpjdBZKyGAu+e5CuGS+vbXEq64XFf9qHeUxCuDPA/EL5y3+BakOaGKsLU8qrk/pCpw/1fKqxwB5bnBCm48KRT3XRfgwu4xbzQpL5WZYXabHUEnhxczJXMIThSb+QpYi3KnOvzE9fUcySx4OHScY6vGtVdqiSrkQMgF/6hw8txsehrIIXQGYDJrSwja5P15brI+qKMuuqd3QbFFm7khUNR4L5A8Xojrp4ztvJusRQCk3iRsPVstjVbH0oSP1xlqGbZbrr6Z+86PWnRhjb0YVEM8D9IrPyN+NHfps9RaFOAy/gAuaoqWe9z4D8QTka56msM7e/HF78C+lpHbeppNEaHXjoO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 09:44:44.1349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 787c5000-64ff-4429-197b-08df1ae9a11d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
X-purgate-ID: tlsNG-4011c0/1790329491-4B0D9CFC-352B4011/0/0
X-purgate-type: clean
X-purgate-size: 566



On 24-Sep-26 17:58, Alejandro Vallejo wrote:
> On Wed Sep 23, 2026 at 6:19 PM CEST, Jason Andryuk wrote:
>> .init.setup, .initcallpresmp.init, and .initcall1.init are duplicated
>> across architectures.  Replace them with a common define, SETUP_DATA.
>>
>> Suggested-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


