Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E973DC88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:46:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415868.1645086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vxV-0002il-Mo; Fri, 11 Sep 2026 07:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415868.1645086; Fri, 11 Sep 2026 07:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vxV-0002ie-JU; Fri, 11 Sep 2026 07:46:05 +0000
Received: by outflank-mailman (input) for mailman id 1415868;
 Fri, 11 Sep 2026 07:46:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x4vxU-0002i1-7l
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:46:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4vxT-004rrI-11
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:46:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa3b1a7-2eae-0a2a0a5409dd-0a2a45018e6e-44
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:46:01 +0200
Received: from [40.107.208.53]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa3b1b8-5984-0a2a45010019-286bd035ac58-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:46:01 +0200
Received: from SJ0PR13CA0015.namprd13.prod.outlook.com (2603:10b6:a03:2c0::20)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:45:56 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::8e) by SJ0PR13CA0015.outlook.office365.com
 (2603:10b6:a03:2c0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Fri, 11
 Sep 2026 07:45:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 07:45:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 11 Sep
 2026 02:45:55 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Fri, 11 Sep 2026 02:45:54 -0500
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
 b=QZLq2Qkva7XrY8DRa+nSGZ3pq8ys+xXRY8KIfdhvL5MyiQ17CivT+cl5xamPv7dhHE46TrZdnV5R+6A83e9+NO/Sde8QcEnfCLhPuvcgduAKAdDqwi7nkiVNrvSMPWieEZn4eLesL22z86he1thkC20m6TdypOoZeo0dslD6mRO7bkJGijRMTjMR4vXeu74MsOe7TWbCZMIEz5gQqFcWddkfTSDc0mmnA46JzJy48VgPWyj06gs54sZPIJgl/U2iTJ6R+A4i9O2pzOE5r+fS4V7Wi3Bxn7sZr3to/QSs2ruBhYQ4kcXtNUs2f5BL0GVZgepEeF+P8wI74jmw8NgMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPpZeASj8xaVi2SPpnUHB0COXTDtAPNvOV/tuXEQzN4=;
 b=R23ENLFNqsjZXX0oqrAm1H1Ipwppfcs6XdcTBWTkqzt21z6wfVp4+n35y2Jkm/h/s8zfg60s9f+5Q/7Eg4NX1Y38WYuWxDQmKkSl1s2RZQmO8ZXGtIGDy/4rKqkOFe7CuO1M8VDi6tTibw6aOjfEsIp/5hscFdEg/9na9h0qIag6PB5rpyD9N0rRhxqCMdjHVTpMJFJJWsvdY+LtKp/AQdIGuwt1EAgmVojWdJjBQcHHosVzP7U/bWDr3J7TLf8Gz5LpslLNkveZsQABtt+CA0tOOKc1/T2Bnhjn3NDr5M27Xw+jDeYyy5X8OF8QAFom5gJ2h0z7AkPL9Z77EVK17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPpZeASj8xaVi2SPpnUHB0COXTDtAPNvOV/tuXEQzN4=;
 b=iT8+LZZX22NSTRneFndBzAxhMcfrVbdeVFUj9BuADmnXibaCHzyso00iu69FDdvcWDEpEh81ULuHOIFyqdxGsMsN/4eqGa8pRvW7lXJBRPKnx1Y5lZCjVnhIwaOTgF3JWHQn5cnbWEXNubg90EKWnCCV/5e9MJw76XdFUFqyk8M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d734d097-be4d-4fd0-9e61-3209f11d82b5@amd.com>
Date: Fri, 11 Sep 2026 09:45:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use __has_include() in xen/percpu.h
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260909115342.3376342-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260909115342.3376342-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: a8962232-5110-4aa1-a61f-08df0fd8b6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	UNd49sBtAzb6dXgMsZdbYHLHoStc4vuLtRrYPy/uwOZVh2Vl/aW2LGPL3gJ8DyID8FpTiq8NRutOWhaQ95nmnr8q8ytf2D4nKKv8uuCyzm8qNFjt04JFEOFf7AqddsDNP/3Dt2VjzVpxuVznpeuvxD7+MPILNbz+5RIkdTak9JLkG8UEWfVYbVeYDNIN/TKCBRs7GxmUyqvKglZxVvOhBSRqwp1mLgJGnaZsZk/ECeAQuGCOgT26wL0otRM4vV+TZrDm8eskGP6n8FjWcoOSqAKzysedzYxTFAxV7aayCGuKmH5Vr6HZE2WVphYic6QYYE3EJTlhpmSbScu5geUiRd0UcBdEj5jrnEK4QEJGNIT+mlBLHv1mOS9hoIBHGC3lkM0Dy36Xkj/pAYEMigvUHVuxmyKgrW3TgzfAFrGsl2sFixczfY0mfND51QhndzGrrn9y1LEj91TVT9XMUd9kkHHi2EC0G4ncyJl98bXJvSlyC4qkuQV4hHWs0XGbMNku0a4hawT1Eb8kohiXKUJimjNkwhyF7tdBTJp87oyBJNISZ2aZwQ4sxT0SCFsMluWd5vPuWA4hQPXT6lGiHh4UBPuz0s8a0MG34meqa4ULg4WZQJYTIRi2oIrnvXW6O9np8HOicMzoFtDo7WaDZxd/UzMWF9QcAKaKUuUmL4tykM08jLTiI+uKkG3IrXNBFdjCg22aCwtD/pgXNO21rV2CoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ubmE7bkPsMzLOcTPIT/HgL2/2p8mIO4k6Mmq6QonDM1CP/nJiy3tdiZOYRBklVrglnXOjm3bZcKRPC9bc+1R3RpGVlUKnIKPrLjWL26zvNABSmH79h29MHlDE9n3YiSYkCGsXWcFHBtwshqQFoNnPcKt+SMfjHJlnNlR5GtaFisqEjwlWetSo227sMlyO6/oLtAxEBfmKk+tlNevp7HRwr8+2O8cWzJL6su9U4Ftjr0h4InWHoJGuZ6sWn1KgOLlPKu0TN1TW7U7Day5jHksX3CCknJwGsotGD97NPXM+srZ3nMJe2IvukfoglFFLceEXsnZ7bsPitCAzvN5VXb3StSrAmqj6zlgJDkIJA3ptDhbjDxHHrZ7KoXfW4k9bGq4QAsQ9lfRA6V+eYgksBrCmnvfmGgV+3u9r/IOZnvYpli6k/y/rTSZhIP3rhwo5Not
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:45:56.1554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8962232-5110-4aa1-a61f-08df0fd8b6b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683
X-purgate-ID: tlsNG-d62444/1789112761-1F66C757-13D0C235/0/0
X-purgate-type: clean
X-purgate-size: 328



On 09-Sep-26 13:53, Andrew Cooper wrote:
> Only x86 has an asm/percpu.h.  Have the compiler only include it if it's
> present, rather than symlinking an empty file.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


