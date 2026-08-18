Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D215C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 15:11:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394269.1633108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLSv-0000Cj-IN; Tue, 18 Aug 2026 15:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394269.1633108; Tue, 18 Aug 2026 15:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLSv-0000Cc-Eb; Tue, 18 Aug 2026 15:11:01 +0000
Received: by outflank-mailman (input) for mailman id 1394269;
 Tue, 18 Aug 2026 15:10:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwLSt-0000Ac-I9
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:10:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwLSs-00Fcyx-Fx
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 17:10:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8475ed-2eae-0a2a0a5409dd-0a2a450ac3c4-44
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:10:58 +0200
Received: from [52.101.201.40]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8475fd-f2d2-0a2a450a0019-3465c9280b7f-4
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:10:55 +0200
Received: from BN9PR03CA0382.namprd03.prod.outlook.com (2603:10b6:408:f7::27)
 by CH3PR12MB8401.namprd12.prod.outlook.com (2603:10b6:610:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 15:10:49 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:f7:cafe::7b) by BN9PR03CA0382.outlook.office365.com
 (2603:10b6:408:f7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 15:10:49 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 15:10:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 10:10:48 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 10:10:46 -0500
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
 b=pX/E7YfH9pfwNT6Vx0Ve+WZqiqlf3ryA/A8vHIh95mvDGGwJ9dRz+PRB42ZBfjL9rC16IjEXRc20oJ244hdwphjPZEhPbYVyEZUxd4qnNlvzspDoXasC1MUnD0zTNII3lg+6WLDh64xApucJY8RojQYhKVQqKFOQHafq1PZTt2qFGbpriEXMRQuiono5BBsFP9XZVUzHvhaL7VVTpQ8tmjcXd5qsGJBx2BOw+UOzxv00j9WHFVOsQpH3to9I0qeJXNrW4VTRk4y53ywadakqTassyi7OR3PsQdYgtCPLix/QdhE8Iy/AeEU0ni32E6d7O+EBA7mM++ra3S+ZUkA2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBknbZWDj/0htpZZ+qXSXeosH6Y9ULnrkqGxMw4M1Nk=;
 b=b7OL86NN/O/iK6JxfDFY13ck7B/4zC/38XsDCw8g8bfPPnyJ3d1wAHU0nMv/g5svyk9wxH/TFACNZRNwQBb4MtcHu8IhhYbgtXeCLX/a1FTpAGJhn6S3U28JI3dF8hH5tKN+eCOLsyCkWn+s0+6BCJ38wFMaXGi1OKe797xDV3G8DSwKVIXf37ZRXA/kZkcL4o6q8uLqn44wo0xIP9p+pzo0er/mH9TcEwXFRMGWWCo/KhmI8AtlAa1Lsb+e5d9Ab1yp4B2WAOy6yZLlHJtV89WwDgbyW4k9zKuFRpwfb2nPw9WEuTCPjbY627YTrnpj8Vha1T8D3ypvVUSLn2aWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBknbZWDj/0htpZZ+qXSXeosH6Y9ULnrkqGxMw4M1Nk=;
 b=yimgmC2r6SkhWVV6ISXCK+WQaE+GU1korqMrInekTDH7HxZvfXS0lM5sJh7ZclX9+KvHBSN3obI3od5m7PIxvVhmn1soWQrTWyI+Jh64Dvxgbs/9hUPRRY6jaZrYYF3zjCSZVATH7sEEclBxG6n54Z69yfCk9giWtkhxi+i63dA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <7ef46d06-7674-40bf-816c-71f6935394fb@amd.com>
Date: Tue, 18 Aug 2026 17:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] time: add "NOW() good" indicator
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CH3PR12MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0ff625-63fd-4900-f442-08defd3ae31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|7416014|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qBeDGkHxIATQy22qfK8B8Wq0USnh7PZOpGNpYO2PhZ6UI4EAzz9ZLGhb5VNpIUqrlIeR328RP00fM935Gjas9ps5ZOko59P92nExkjCU5cWYBpaGga0/k8cyN4RAJjV/riXF+lOa/43JvSo3wNArooAryV/JWiPM8q98X9vSRTw1zLCIZCMaVHG9kffygK2ZN05M9hkh7hyx3pSEhzdn0TxRxgpAjxxWlGEyIV5RgCUSYpZ5mtBILZ5oZ0JpvNq21lFKyDeKoHqBdf0s1ixK9xTJKdId+d1f3ar1sSX3hP+kDLeiLuly9Y/c33iCZnDGlicLCSHichOlUtiRvjJmQ4JgHMGKknRMJMa9oyuSDg6j++8w9EwoTlHECiUd3nr7/9nZ6EJbIKSlMnBRGMNc1ZcnltJKO7Tz0psdhSrk/UEk7rCQC9oi6VZcwYbDIvcac//88+u7UIOkkOgFzG6ub5tEN6UqQin/m1c1q8xJWcoRUdqK6xHZkcaoYZ9BeaBxqHh9Al4pPdPI+n5XxuqL1PWUOeUHYyFqF+tIraEWxjQhYQpq2a6iYVKlW3eE0LsWG3p4kr3x61UTe4fGGqtHHteQZ55EAdyFjbniBm/IP9XP5e202iowmK/a1872c9g/NW6xRd+c4Whcpg1jtZrp8ZOLW/4wOzEg+LzOxdADvcL/GiCv+K4LEbxHdTTTZqmuywBEiwVwhgIPjQx3PYe9IQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(7416014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pKDtnnffxLHO5nDFbb8Xcee0PaNUXf8diLRVbNMAJVjbd4lPfn9iiut/eWfrxfTjwdMQ7G4sPOypzuHCys8Ua2jCGLLuEsDYUaky893XEhf/sAF3N4t6JmlpOPTmRENKRp5XQtP5/74hQ+kXO4BAVHs0gn1JmKkIcapGHyq8wuzEA+yYiU71dbG91qXMzjCPO/TKx7WcV5SOZSvIfjoZcY+upO/v6T4KWovUAETrYQKq1xSci/Qt2u1l2KBbPPDzKsJFWbt8JD5zXN/CLgwunWKCjRKuWnGdNngOdECqy/z621zTyMzkvl+zTXmD1tE5sQ4SrMqzI9tCcDZ7116XOsr3yHflgTJV9txZkq2M5mT6ZXa8SBk3lmGO0FsNdTuSICnW8G1WEQIxflo8fPhRiFUdhiA070PPGDNjo61tEFKG9/6qlX7r5a37RWJB1VBm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 15:10:49.3032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0ff625-63fd-4900-f442-08defd3ae31d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8401
X-purgate-ID: tlsNG-4011c0/1787065855-520C1CFC-597ADFBD/0/0
X-purgate-type: clean
X-purgate-size: 853



On 30-Jun-26 16:06, Jan Beulich wrote:
> printk_start_of_line() checks for a value of 0 right now. In order to be
> able to have NOW() return at least monotonically increasing values, that
> needs replacing by an explicit indicator.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

> ---
> Arm and RISC-V may want to consider whether their initial get_cycles()
> can't be moved yet earlier, such that the indicator also can be set
> yet earlier.
On Arm, get_cycles() just reads a system register and it could be moved earlier.
That said, is there any rule as to what should actually be considered a start of
time (i.e. the boot_count value)? At the moment, this denotes the moment where
the time driver is set up in preinit_xen_time() after validating the frequency.

~Michal


