Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B87606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 00:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uZVnGxE9
Received: from list by lists.xenproject.org with outflank-mailman.1455065.1668607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIxjR-0000FC-6M; Tue, 20 Oct 2026 00:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455065.1668607; Tue, 20 Oct 2026 00:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIxjR-0000F5-3K; Tue, 20 Oct 2026 00:29:33 +0000
Received: by outflank-mailman (input) for mailman id 1455065;
 Tue, 20 Oct 2026 00:29:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xIxjQ-0000Ez-8z
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 00:29:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIxjP-00FsYp-MB
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 02:29:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad6b551-8faa-0a2a0a5109dd-0a2a4509a27e-38
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 02:29:31 +0200
Received: from [40.107.208.32]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad6b5e9-be1a-0a2a45090019-286bd0203fb9-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 02:29:31 +0200
Received: from BN0PR04CA0097.namprd04.prod.outlook.com (2603:10b6:408:ec::12)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 00:29:24 +0000
Received: from BN3PEPF00022BC4.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::6c) by BN0PR04CA0097.outlook.office365.com
 (2603:10b6:408:ec::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 00:29:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC4.mail.protection.outlook.com (10.167.248.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 00:29:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 19:29:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 19:29:23 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 19 Oct 2026 19:29:20 -0500
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
 b=m3VYQTgi3cIgOI11bg6r3XA0ar4PW7U2kVxYOAxo7e9RMhF6s+98q9JnBOtjuNvcXmWJSjA3I3VNTOMqN7ze4A7AaARxwDXg6vC/IvcJ4uF97FHRSK3IT7ffQkZiXIzwoPRY6wQMQ9d1Rp2FGKmTV+SL7GJ560f2abAmppbPBfNH8ArxzjbqC1MezDP3KlvKfaRT+4Gazu47Z7ldNw+Vtsy9hqQqxUR0pozrCcT74GMizy33loHj9sq4+MKMOKI+NW00QckujEffqVBp3qik60JhguLHyeu3WZh+Z9+kCpSuw7w3mBGWZifgRZI2Dq+jTYyQMJduW1wyqvDUk9WyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TDzjaB1CsC+v4d6fNQUgbjYY/jzjV5+vqvFpqFwdro=;
 b=MQW20aESQ9NJJahkivNer5pl5zaSUzt8qD1Aci0Kn2GF+MuIEoPTiuR6ce67xDgG+Ib8z7PEm+NJ/xHhfFWCwdUTy8RQei2sYllnjyUdgp8l7xqspKb1xC8P420xHlGd60wrF83XCq158gpVCRuW9afdanhY41C6NsXNk4wKdQ3dzxWomObQ5hX1euIR1PdK2Mg6dsEM5b+oZ9QBb3ohq7oCX7YHtm4JTY7cXy6NFeUGjUvaC7LFpckY9qw+2+m20Kr0R7VBJZ0+LvZXVdH6jHSSFq0TSd/IqT7EAWgo/EnZHRL3cLQe5dcuh+wt+ZWl2hNkq8RqauhceyZ1N33GPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TDzjaB1CsC+v4d6fNQUgbjYY/jzjV5+vqvFpqFwdro=;
 b=uZVnGxE9NbBpgvWjO6DVTs7Np96lb9RkeeIxiRThdfsoxtagOwR4zLe41MHPAhmsKWRGQAuWTe9kNkTz2PcIlj3JUkmuVrHToTpv3N9v5Yh90VevgxLEhDRKCqMeWxD6repmA8ZFhGh9zzTutOakAyJUN+MnhdoqhETHtLjoGiU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9c6c4c93-9782-4192-8528-fb05ec1ebce4@amd.com>
Date: Mon, 19 Oct 2026 20:29:21 -0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
From: Jason Andryuk <jason.andryuk@amd.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
 <25df5d8d-7cd3-4344-86e1-8af883fa9a65@amd.com>
Content-Language: en-US
In-Reply-To: <25df5d8d-7cd3-4344-86e1-8af883fa9a65@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC4:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: ffde64ba-4454-4fd9-6121-08df2e4130e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|7416014|82310400026|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CFqSIjwyxGTXQ5MEDkQWvSmBCrfEbwQK7C6yaDXuMBComfhPSZy0CJAlzciMM2xuSqiEOIAQwKEsntI76PYGz5inYyfNS+LMk4LEeyxn3PKPOhZJrOpar6qktW88aA1NeeuCcuBpHNoNhR+A+gG1d5ZXulgVJweEZo8DGX570TD4san9FeXilsTSeFpXhxvEOH5cGJCAcXaxM1iLV/M6RLLigdZCy3vdsaq3f+UeDuSYPJzKXHhrvhqcivr2j4LTICUlbKtX1EKmXwZYZc27eg2154u+nWZaeiOtYMqhyfb494Df3ighIXvSJ/4bNjnTatUL001kj7rUVXSUdgR1H4um0WzJ/3j2kmBsQOdvhmFcmHhG2ACymyDa3512USGwIp/80ZKAq6pmckUsDQTV9RxbDRCmnJ2Osi1cUzgwGaEJLMp+GsQZNDzVUFrL5VndruzmyGgI6hwDJXbULzAx2y0o2bhlHWGEtf+qtCn8H5RDr+kk5N1TFNPOiCYv9eaZ6YK2g/POej1yBIxEEbuFtQ3RLKzugWwa8uOiInxbsp7xusvk4G0WEXI9foOsIuoMbdrmjGnRMEGuSLZcVptHsdFSWhF21k4QNQENvuD85/B8dnLV4J6hzE+qUFe7gUPbCGxiicTt9kb4p/S2xCaVszEVzSzkjNlxR0+nAx5kyAE9F2y1UpYi2edImQj2PHzxhnCgRlM6Z8QbKPjVD/N9jQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(7416014)(82310400026)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BuE62R5OUyVQF/9CceNOsxqyKJD/2f/2cgnkXdQwp3uyl9D6lBad6Teaz7gHsQkI1inPJLMwJWydv2eM8kxgQFReJOCd7i/B6t11e7E6zpaq4vtdYtKszb8w7/fpgCrGpZIep8Js0nPWbkvVHx4zuDxK2renac2pu9p8gH+9f/zlWXCEq+vA8yQyswJy+qN+hXqhj7bjFPyukH2Kj/mD8zl35DKcq7hKZ+PeyQIaaZrkfwdBXwB/w9ee8O4WxGDiUhpSavfw+CVIc/ttnvBM4dL+LJu1uChzjDMR865GMKxZNU38B7e0MjKgy691USlGASS3v5MmpD0RNGUpsDNLN2u6ZhbwN6kl45GOm+FPVPS3+ywI+52KwOvF52KiBHFbXxBI+4xL6v34PaenzHYosLl5r4uTLku/RX32MJRl/OqjzeUkSRfRmQo4L9ttUYCA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 00:29:23.7299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffde64ba-4454-4fd9-6121-08df2e4130e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653
X-purgate-ID: tlsNG-bad1c0/1792456171-BFAD0034-BB263F8E/0/0
X-purgate-type: clean
X-purgate-size: 1294
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-19 17:47, Jason Andryuk wrote:
> On 2026-10-15 10:08, Mykyta Poturai wrote:
>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>

>> +        struct vpci_bar *bar = &bars[i];
>> +
>> +        /*
>> +         * The upper half of a 64-bit BAR holds no address or size of 
>> its own;
>> +         * the handlers reach the lower half through its type alone.
>> +         */
>> +        if ( pf_bar->type == VPCI_BAR_MEM64_HI )
>> +        {
>> +            bar->type = VPCI_BAR_MEM64_HI;
>> +            continue;
>> +        }
>> +
>> +        if ( pf_bar->type != VPCI_BAR_MEM32 &&
>> +             pf_bar->type != VPCI_BAR_MEM64_LO )
>> +            continue;
>> +
>> +        bar->addr         = pf_bar->addr + vf_idx * pf_bar->size;
> AIUI, the PF has the SR-IOV BARs, which are sized like normal.  But I 
> thought the pf_bar->size needs to be reduced by some factor to get the 
> per-VF size.  I can't find where that is done.  Or am I wrong about this?
Ok, I looked around and I think I was wrong.  The SR-IOV bar returns the 
single VF size, and it is up to the OS to multiply by the number of VFs.

Thanks,
Jason

