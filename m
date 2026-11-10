Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6EF606A32E
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wtm53N/3
Received: from list by lists.xenproject.org with outflank-mailman.1480940.1684712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhOw-0008F1-G4; Tue, 10 Nov 2026 08:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480940.1684712; Tue, 10 Nov 2026 08:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhOw-0008Eu-DP; Tue, 10 Nov 2026 08:40:22 +0000
Received: by outflank-mailman (input) for mailman id 1480940;
 Tue, 10 Nov 2026 08:40:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xQhOv-0008Eg-5G
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:40:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhOu-00DBa3-AP
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:40:20 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af2d86a-bab6-0a2a0a5309dd-0a2a4506b426-40
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:40:19 +0100
Received: from [52.101.43.66]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af2d871-195a-0a2a45060019-34652b42f341-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:40:19 +0100
Received: from BN9PR03CA0418.namprd03.prod.outlook.com (2603:10b6:408:111::33)
 by CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 08:40:13 +0000
Received: from LV8PEPF0000005C.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::63) by BN9PR03CA0418.outlook.office365.com
 (2603:10b6:408:111::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 08:40:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005C.mail.protection.outlook.com (10.167.245.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 08:40:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 02:40:09 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 02:40:09 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 10 Nov 2026 02:40:08 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGUX7GRx6IXRebxc4tdRdglazJnNo5ZIaMolqKrJd40KPyaZ6JjKM7tWekoYu90HE/2T4wZ/bPBrGqrNY4XIO3A7JzmDGaocrAxDH9CGIvHYPlAZsF9F9DBLNCQhDXGGoh4fq2Q2mRztuXcBuWK/ibQhXEGuBUveNV23n5is0Q9uYELM6RCOAr1aIuAveRxHJOaLfkCHJzVWXuFWMD1MOffmoCs/rFYHFWKQszv29Z2R7X4r8R3PJS4Jercfn1yX3/MubKVxoKP/2ad6I+mP/3Cht9EhMDe0ydsmnxYijZGcbgDdO8QEe995kDrbPu39m8akX6Dl1z4abDcg54MEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+bxrECeo+2g4JhQax0SnKleMhwv6wD7FyawoYE5JmA=;
 b=CN42YeXhCiH8jiXIIz4rfd9o2ICH+3XWrLtaDpaqs7H23FENcsn59X/RG/2AbUAPkqhlN1awzt0lxoZR7MHMxog+rIykBx9P2wV9cDA/05u3ABGL8Lp3xSJSTIWySCc7Q8frYLXlra5PdxMZW1pp+IhtxtP9Zb3osgP/bJsq9XhKAyIGVF6bI4dTtHbvDFoqt8lPQ/bRl3JVgrnfXs/NZzQ+A+5E70AvyWzBJ9KiGbsvzU2+xG2iKaF9hu1JyVY3avnhj9NFZAoyZx97warAltiWaCCk0D8g5gj1GCfZq+Y5gAH7NTxvi5a+GEO+18SQSoiGGgJlAHKe2xkHflv43A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+bxrECeo+2g4JhQax0SnKleMhwv6wD7FyawoYE5JmA=;
 b=Wtm53N/3UkR0sq407IlAmFXvV2nb6sFkvTEmX73kZWqF5PtvMR1BMl1VXJTiIAjJcGLO6NshCn4T/4XbIOiQLImYg/FK040gWVajic6IjycMT9GjYdBR9BhXMbOQD5ZrraanzTEImyrTRab6P2OuNa+O9IWPN+7lF5KqFWiq2PQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <5c990b07-55b8-455d-bba5-026529f243dd@amd.com>
Date: Tue, 10 Nov 2026 09:40:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen/arm: traps: enter the SP_EL0 vector group for an
 exception at EL1t
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261107021442.253612-1-stefano.stabellini@amd.com>
 <20261107021442.253612-3-stefano.stabellini@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261107021442.253612-3-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005C:EE_|CY8PR12MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9241c1-1786-4893-018b-08df3f063c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|22082099003|18002099003|10067099003|56012099006|4143699003|261102123227099003|261021123027099003|261021121427099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	0doLQ3N0IMP9seW1wlYKuTnO+ViwW+MC8eGqANAUkBOzvKuiG0EapMOrhyH/XtHovUd0OPisErrZzEB12T3AJkheok4UJoWUWMunCKZHVe788TIpOM5qNQGCEOTfAPxrUaNMcBB6z1QZQGBeO76haJiYjBBZA/uy3947I7PO42H65csL9hNct1bRPkegr0roEnArorw5HpihJ4rHkVb5MFww1lHtc/luNBmOH3fpV1BNcUHvsy8gIJN+rjEoYyimb7pEVO48HfWH4SBM09o00zJ4AslmZtbx/l2r43YLw/8aMi35MkbBbuX7h0gb1LkRrfgpNC3m38vZgrS7BDSIyRyjLFWPXunxtrjGkNIbe8kItSDi+awcNNvekIftayNeSEotmRw0CVzb3wA/9MkrUerV24Qy214oq5qAlYyFtx5BXUBh46Es8JJgXzLVPBfhuGDrD8ip4ugkurVFgGXQZKl7vbL9ysOcx4dLwoJhGTdeigyZ5k4JoiobXv6M1Rz7MexJygLTBUdBuKfDgICMrNaOrqQeAytm3WVxYMXHLSTurATMW3Rn0fVNNC7RS1H0BsRv8SOIzUUTWeE7EQ4TmRZesfbXDGdlGP3mKVIR3lnE8l5rs3d/2VWf8DtUeF9q/HuKjEHvO/CumhCt7gjHUKUNUyjZ4FtJZLEnVkxOISaH9HFTs4oNHJmkKM2OexItUf76JdNrmZ6dSuGThLIKPA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(261102123227099003)(261021123027099003)(261021121427099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	no6OTJMh4ZJEMxPNBi+iOy1YRB6a+EVtlCiPC03XYQjseqnwE9zNubk9UIGcdw5+2FRNqdYSMmUJYuL/6WfLaOHaLbCR3W0HV5l9qJY29bp0H1LRsclMcrEUznixtBu1WSTHcFondoQ1FNVKr1NGXQ6CRPbwtiT3vOBsclUc1Sm9DrUaPcTTOn3VyzsTm3XcdMKMP54WfOA74wW5F0zlslZGz7+z0143/tnaK12h1VrCU9Q6nmaxlP99+83C9D+IV3LTZ6b9KThOkprcAAAhqco1b/tMcAReIiwBrgWMkv6oayKk77dASrB+ue9eAC3i30rWY+0AsknhDF0Jgo/uEvWM6nJ30sgQGjjQ/XqWlfR9oNgxK27O/KFalbfvrPdVHH3jtL0+x6GIFE7Q3Yn9tYl+KBX3iHHCdjTKM1XCqCzIZVrvIrR6VJgmXot53ZeE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:40:12.5927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9241c1-1786-4893-018b-08df3f063c72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413
X-purgate-ID: tlsNG-16d1c6/1794300019-FD20877B-D7705ED9/0/0
X-purgate-type: clean
X-purgate-size: 755
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 07-Nov-26 03:14, Stefano Stabellini wrote:
> An exception taken from the current level is delivered to the SP_EL0
> vector group (offset 0x000) when the guest was at EL1t, and to the
> SP_ELx group (0x200) only at EL1h (ARM DDI 0487A.k D1.10.2, Table
Please cite the latest Arm ARM, if at all (here and in the comment).

> D1-7). exception_handler64() used 0x200 for both.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Please move the CC list after ---.

With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


