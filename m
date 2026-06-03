Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C6BCD6E57
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 15:53:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326926.1592198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnty-0003S0-WE; Wed, 03 Jun 2026 15:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326926.1592198; Wed, 03 Jun 2026 15:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnty-0003Rt-TH; Wed, 03 Jun 2026 15:53:06 +0000
Received: by outflank-mailman (input) for mailman id 1326926;
 Wed, 03 Jun 2026 15:53:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wUntw-0003Rn-OF
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:53:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUntu-004SWf-TT
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:53:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a204dd0-2eae-0a2a0a5409dd-0a2a4501b64e-30
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:53:02 +0200
Received: from [52.101.52.3]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a204ddd-c1f2-0a2a45010019-346534033c1b-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:53:02 +0200
Received: from SJ0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:a03:33e::15)
 by DS7PR12MB8345.namprd12.prod.outlook.com (2603:10b6:8:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:52:58 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::af) by SJ0PR03CA0040.outlook.office365.com
 (2603:10b6:a03:33e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 15:52:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 15:52:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 10:52:57 -0500
Received: from [172.18.181.126] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 10:52:56 -0500
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
 b=cqBpdoPHrA3Ji7Xk6Z+W9WOERyNI403QjawCRBbupDKri37nSXjnE+FGzDiYrKhY0olN2a1BEDWrNPcjKBcNmJG27ObNbRAaHSnSW9r/YP8A8x2thvhW8ysgwwgS4sDw07YpiKgqCrmrGtdNafasIlmFKYh/V3mSNwUexVORzdtnLQlcy2oUvdUsyRS8rr+1eJxAndCJDW2CF7iWNI6kir5f621uuSfKiEyPgKzMEGzFqH0Af/OHV6vEEzmA55L+thJkueF/qnfoDIzz0qqtj4aYwpscJkSUe5pfJSGrZqGKdCDyfmTiKrBcwZeM/I79NUxPHk5HdjOd/5z/uaGZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYxQsyzgO3G/SOmXhY9eloCKV3BTbp4sn16HVgECMvM=;
 b=Svy/BYxIeMbg9CxU7fFqtHJe3lNdC9Bb7GOxyJ8qw7QUnhVlHQgL1JP6FY8XZ2q68+SwyvhM8wC8Mur3nADoslWP5CfwGgbOxcxhwe0cXhBDzPlPeteySQ5nOpxr6zrC/6mCxCQHH/hKmk64h1UZeDhNwymYbPCyoy7qcqx0ZxzgfGaSc7d38Kvc11CToabaelp+Q9Tf0JVz4bpedSoPOimZ4KltRfZfLSFt5hc2wbSBg3dzucHZVsHKhjTCF2WgAOXRszBRK06m1UlmNdJmqco84mPjS1eYeQS2aWaKF2St0bbK7diY02EPbTAMC32G6SGtzztSu5Hd4jxaN8txKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYxQsyzgO3G/SOmXhY9eloCKV3BTbp4sn16HVgECMvM=;
 b=ALIigEkzMWt8nx872BHTJLDgzbxfxKHzkk1xrJzVdwWpEn3flYTUkBImmrn8cT/MQh1jv5hFMrLW9kWVXLzJNS6ohez+ziru197N2Q5dIZZ2PgItmsZ6ZnVrcA3Gvt2VLNF89HALfjGH9GyY1xFJMW+hL1sp/a83zk98WRyg0is=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <476fbe14-b86d-4bd4-bebf-81f8504516e0@amd.com>
Date: Wed, 3 Jun 2026 11:52:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] x86: use / "support" UDB
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <deb26054-ec00-483c-bc18-1edc1b4599b3@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <deb26054-ec00-483c-bc18-1edc1b4599b3@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|DS7PR12MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 85003ea8-2f1d-4534-2132-08dec1882eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|11063799006|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+l4rmepQDjxFKEeb1cSxK29965APA0kGqyiJ5TVCcnpKA94o7aVrADjA9o9dwQKXZf7pGQCsnNhGl4dzo1XdwmZwFIdqzIlfVYCf6StdV0V7a15SvYDdtpTtSSvEFmP0wiEqzxT8wA4mo8nRCCGCyU9r2CEauFU3v3QNn1HxZdFxCpRmXEPeK2/a6XS5ywBbMkplvfN1Mcau+m4LLaB33Seq840lcdAqplh2NEllGJiHPTPhpgIutVrlbxyFgT5wC/dhaYhbZSdugVzAGN66XGeUwipsnYEZI+fhzA11gQ5o1TzLCzjEEsjuBedO/EMsbjyzdm5RgsDs/ULVqfu5waGys/Qmu49lHceHCmrJGF8npKXKRtNK2ksDLaPRV3YB1Elqgq2h+0V5fkVd8mP8DgzMw9w4bY3QipyiOpnGp3tIpnbFX4ZveRdtD1+9hDdHScZrZKV3L9NZisvD0YnptZhXc7pPAzFElTaY/k/Mp9DiEwxqNHB9kaBI5GPfnTyxC64Q6WsQd8JOqoruSiIJQSg2dTRNN9OXZSXcnotzv0jwFqsa9FBDl5DDS1zpoSMji2pVjuuNnBU6lkwMRfdQmeH8+GcO2dy5tOc6Klq9FvW9n4bgm4VlRQNuAAwKHoB/i1w+GjYUkCmCSXp61ABYSdlFEjpIQlfoEy8DwDW50SqoD53+67p/PxNX2AcYrkSPUX+7VJT766wb7ANqSe3g8gVo2E40Z+gEx7nl3hfDPpo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XSFTs8PQUvbNlEhIcnHHTf0GeRZg7BNJ8i9JW4UVGGbfkw4UlPspMK774CApBLpB653bUL8Vhy/mYz0zOrZHWk4OLGrKkAmewUw5+BNL+vUYBYMXVxtma4H5atJU+dLdkbJ0HC0aqMBopAa3ynkj/I/McNbdogiQ4YZzMCRS0lPymNNKQuYqCbAQ6xawPxzptq9/lqzfdkKoWAd7eAPcxOm6dyzDxDJZoawia6TPcxs3FrUfnGEHSpMOPXxJ++MnrD6CogFpzH0E0yZDVAWk9HG9Gf8xZr4EeqD6Edh+hDcAjN1ENKOfkzHb/Hf/czVpqw6qrvhbMBPTk24lqSoMqoTmOlRlVDsfQhUllI61QQAkBdAXpdAaYBt34vxQBVbjNM6Zm433rrtxrZEomZZ7B4xFPrcjsvQlibj+j1vyjhSgiMtm2ZWXJOyn6yKsNTgg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:52:57.9160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85003ea8-2f1d-4534-2132-08dec1882eea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8345
X-purgate-ID: tlsNG-d62444/1780501982-AF35AFF4-99EDAE1A/0/0
X-purgate-type: clean
X-purgate-size: 839

On 2026-04-08 08:12, Jan Beulich wrote:
> With opcode D6h now firmly reserved as another #UD-raising one in 64-bit
> mode, use that instead of the two-byte UD2 for bug frame marking.
> 
> While there also make a minor adjustment to the emulator.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Just a heads up.  I was testing Xen with Fedora 44 QEMU 10.2.2 TCG, and 
a BUG() did not fire as expected.  Single stepping over UDB I did not 
see any registers change and execution continued.

QEMU 11.0 does emulate UDB properly - the change was:

commit a71706fc116d263c6661b5c7176150dfe0298d29
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Wed Dec 10 09:42:01 2025 +0100

     target/i386/tcg: mark more instructions that are invalid in 64-bit mode

I didn't check earlier version of QEMU.

Regards,
Jason

