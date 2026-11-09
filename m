Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B45606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 06:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dtKDe/sM
Received: from list by lists.xenproject.org with outflank-mailman.1479571.1683499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJ8D-0005iv-U5; Mon, 09 Nov 2026 06:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479571.1683499; Mon, 09 Nov 2026 06:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJ8D-0005in-PX; Mon, 09 Nov 2026 06:45:29 +0000
Received: by outflank-mailman (input) for mailman id 1479571;
 Mon, 09 Nov 2026 06:45:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xQJ8D-0005iH-0c
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 06:45:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQJ87-009aez-6T
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 07:45:28 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af16bec-2eae-0a2a0a5409dd-0a2a4506e2d8-42
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 07:45:22 +0100
Received: from [40.107.208.41]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af16c01-195a-0a2a45060019-286bd029d478-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 07:45:22 +0100
Received: from SJ0PR13CA0209.namprd13.prod.outlook.com (2603:10b6:a03:2c3::34)
 by BL1PR12MB5754.namprd12.prod.outlook.com (2603:10b6:208:391::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 06:45:15 +0000
Received: from CO1PEPF00018869.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::67) by SJ0PR13CA0209.outlook.office365.com
 (2603:10b6:a03:2c3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.7 via Frontend Transport; Mon, 9
 Nov 2026 06:45:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018869.mail.protection.outlook.com (10.167.249.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 06:45:13 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 00:45:13 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 00:45:11 -0600
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
 b=Eb0G1TSeqdUTnRmKjeZKjtCpeteTVnhPa8F7hID000IkpRqaBZg5H40HY5yb2pvrt/2lIZ95kEdwkLR2rUCys2+aRiTkRzmRVCT8BB+oe0NjXYHVaI79Dc7brjcXoZjopgmsLQCzcsYKW8qEXb/Cd8pPawBhH1MX1HoP+kC02vTtML0rjfXI3snahdDSZjvjFXoM6xml24GfsG2I5g3tVCXkKkixW9Gslsx0VxScOU3idtvQ0N5hIKbBZnSBiwjP200NCZDlYqfV1DMuicbYi/ubV+BKxC64s2sCSVt8e9SnXgBIckz54Yr81Vp6yO/359i8tSWNyMeV/U72Q5MVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXaQ4PHQ0Z8inNQky96Zla+pjMqZp/VfA8uQo1fZJrU=;
 b=McTDASo9n7vQe9Ff14WWI+ZLRJImClTPtiAHH9SU4dNl6gzBCR5lxAxvHa53EAVuf2O8dS8qFhGqW25ug3h7nA+gw7CSGbtiKkrL/B+uwj2xGrD8TNskoosau258ITCcPsPAq5PUZ4nrVt+sF7N3rSdi6Ca3YY0CAz1tGiY+0a0wI7ojrHy0a8jp2aURy9hXbbhFRwDUhm9FzkRCcjwOXePT/Zb19/Fa4m4rAE8AvLPh9yglUfjeYb+D+fOZJ90kZsSZA86oh6L/Io9Mz8torSshoOtwg4Qqs2obNUHpbxBwGkPa5LpfSLrGpk4hRs5DLrEwlhA9y0Dw/whMr+hzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXaQ4PHQ0Z8inNQky96Zla+pjMqZp/VfA8uQo1fZJrU=;
 b=dtKDe/sMw/4IijpY4k3oHFLQUUzOTuMkDiB9TJq2p7S4+OuIOcQBYFIbyubivjq8Lu4agW0oY6XjR7WoU2EQTsN0/0IOVPjkLlBUtX/RePcIEkNxmGyAcvSZ3WKrPUFLj4UcnpQNvpqoDNr//5Hb20d/n9tLVukz2Zoo+IlIKuM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d1965ddb-1a4e-4152-acb3-b9a5f5e57f80@amd.com>
Date: Mon, 9 Nov 2026 07:45:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] common: Convert !test_bit(_VPF_down) into
 is_vcpu_online()
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <1793282364.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1793282364.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018869:EE_|BL1PR12MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d50da6-939f-41a6-c1ea-08df3e2d01f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|23010399003|376014|36860700016|261026121527099003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nX9RMy8CbZ3ra+deGYIzlxkUwUWjJiP8NvOWDyJ7w6MxNjmTliERdPAsdtDAilLbobENbUobPDC331+WW4PS4WkGagY2J3rLXZ3Fv6pPPjCnQw6jcEd6Xso9aMwsENSLQInHGfqVxJWDY3Zr0/zPGa2qOX4pbjRKRKCwLOimo69xGvOZBIF9l5MMf2jTlwx5LQg60EzazyW4cq8he9mkt1UjsFjFlEGAnV3nb89ciA55jI04+4veRDmJBWMQkmDJxpB/hKkB30/Vv6meBQB5ZEMHlk6ZS9Dno/e9BdJ8mXLXw/3Kk4imVhxgH6jdDuBO6Wto325gmzbjM1z6naJ3QBY8oYk0Rh0xu+ZZVe73NSC7hIBnLq3Nv0PnOEU9DBTfuIPufzlISouYlp5fCoef00DkfEPQ61lz2deOwJfMsaPM32UEVP5kFAS0TKGkz0Jx/8pVWEstagtGOu1EM6CNMP8aS0nERS9xLGuNcHHb6S8YGSFKbEq48T1NlXhvKdCtzQzoPzcZ4YrqupWTHehsycfvActe3ZZw8ZmhjhUZOOgcYIg4oSPOkpUo8hu/KLF6UbnxH2jGNGUia0wn7t9o9Q4rxhFDPRbhlta+5ocwv6MiTkI52DOXJXE1yuYfCXnj5KJGv5ugTsbWNYWrV5kjmDeio5+gmHNpKiiTH9Pbx4bRHDYEcg8jm+pGjIs53kR0tZ+kTUCCMs3SYFl5Vfei5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(261026121527099003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2nJeu70EJQDsgsouEA56MsXQbZWq0mCfkFnmC/9RvHNzP9w81KVSu+D46YhI9jOZFpTMpaCgH2Z16l5tjwWWGA5yUkYvHpJ6zAroC6YcW149GKdyITddo4d1O35nWEaTXWWCKQJXLCNjWl9tjr1STpQ8T9XOqiroAbvr50dqxTVYekzzvE5zWDoycGQGXK0MbF+Uq5YPgfQ4r0OPdYN/fen1ywrWmU3oD2zIQDvJfhJKxl1xFhC4Fw0hEkdGSOu27BgJHr8UArKmpx3MOmv+9U/lAYoS5plSkotFrrQJ1XlfD0s8suwIwzeBGwVQnpzC0dp4kD+fw/V5VG3FEFsw4cGyTNfFd9ZVVzgLToe0o6GDpPmf8smXnKApUu1iyqUT6z/uvOcGICoZg8uuCtgGZOM68U2Fg/uEATbLxULvis7o8ipwPCA2M+/9gzLqJgRe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 06:45:13.6672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d50da6-939f-41a6-c1ea-08df3e2d01f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018869.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5754
X-purgate-ID: tlsNG-16d1c6/1794206722-1ECC577B-49328A3C/0/0
X-purgate-type: clean
X-purgate-size: 258
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 29-Oct-26 14:58, Teddy Astie wrote:
> Do the same for test_bit(_VPF_down) into !is_vcpu_online().
> 
> No functional change.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


