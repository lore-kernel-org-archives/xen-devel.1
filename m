Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842F660A2601
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s4AemwTU
Received: from list by lists.xenproject.org with outflank-mailman.1498071.1696074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUMdK-0003Pi-0Z; Fri, 20 Nov 2026 11:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498071.1696074; Fri, 20 Nov 2026 11:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUMdJ-0003Pb-U9; Fri, 20 Nov 2026 11:18:21 +0000
Received: by outflank-mailman (input) for mailman id 1498071;
 Fri, 20 Nov 2026 11:18:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1xUMdJ-0003PS-9X
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 11:18:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUMdI-003oXz-8R
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 12:18:20 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6b002c69-e002-0a2a0a5209dd-0a2a450c9a5c-38
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:18:19 +0100
Received: from [52.101.61.40]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6b002c7a-f479-0a2a450c0019-34653d2887ff-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:18:19 +0100
Received: from BYAPR02CA0025.namprd02.prod.outlook.com (2603:10b6:a03:54::22)
 by PH7PR12MB8053.namprd12.prod.outlook.com (2603:10b6:510:279::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 11:18:02 +0000
Received: from MWH0EPF000DD310.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::7e) by BYAPR02CA0025.outlook.office365.com
 (2603:10b6:a03:54::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 11:18:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000DD310.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 11:18:02 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 05:18:01 -0600
Received: from [192.168.1.21] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 20 Nov 2026 05:17:59 -0600
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
 b=EUXO1T1dIxXRlvKQPKpFN2XKnTAS4T3kcyQ6jcBC9C1SpeorbumXEqQBx/TK3yySHBRLyOIhENraV4PZzSaVX10A+nin3NOcAAaQ96WWw74fkodwqhAM5Kn36lSLgJyGJm9sx+8OPTRrzT72g03HxYznXibvc30hkpy0PmxbeDjnTEt6521M5HU4YS+9N4oKI//5zjcLTXgp1OWz4H1iZSt6jAaeaoQj7AU8C9u0wzGol9FByYajGar87E/k/cyEmD/So6rTO/cTyG+cUlwY+jazdYVIAbJgRw2r4GxuSzlifp1WclKR4tBGg/9EzS24ioDI4/P2obUE0GxE0s1rAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1cXXqe72+tKMbfCZJXgKhrA9+bFY4xdOJGYZDSsfnw=;
 b=pjQCSxwezEh0qYbaC7AnPZhXMm0SDYRWK1YEcKaulX+lmkG3H0mPnMef3cgYIU5/hJ0b5WEB3nIL4DjMtopUvOd0e+hKfaGa7wgj37ygT7yp5d1fLndZEi9QR7KSOMvwXyOnw8f73Jx9KpDu/HCRtBkQZMAAfiL9XSZ1mVmZAEI0mXuYi8WSvOKCY37Iwv38s9dn6Iwha3SB/KSrAkkz41+mgBsuyXCAPbBBPYfUkgShgHYo7HvZGWyzaoUH4XqRJ6qzZ7yFXOED0fVEdZ8rTyJ6cu/xWbJz1oMt/x4QQxfqClBiSfDuoQyC6CK6IRpaBkTZamoxiaz6BKiY5WQr1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1cXXqe72+tKMbfCZJXgKhrA9+bFY4xdOJGYZDSsfnw=;
 b=s4AemwTUtYgK7reIC6xpL9nMfUWy7KJBD8L7plmJV0PFWwmAdLyfctUqj0pIjrGVANab7STkq53f36w9J+XViUkAOpblPPC9jL0G0yiFulENsrgrmFWA+btugkDP5ayQscwNf5r3mz5JBt1U7EwdsV+i5t4IHGaxK/OZJdwKfDI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <5715d818-5351-4250-8983-abee0aeca938@amd.com>
Date: Fri, 20 Nov 2026 11:17:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 23/26] docs/fusa: add NS16x50 UART requirements for x86
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>,
	<andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger@xenproject.org>, <xakep.amatop@gmail.com>, <dmukhin@xen.org>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-24-dmukhin@ford.com>
 <0445ed54-9f51-4486-9e40-bce77e30eb35@amd.com>
 <2b60d4d6-6b3b-9970-4909-8d0a1644e24f@kernel.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <2b60d4d6-6b3b-9970-4909-8d0a1644e24f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000DD310:EE_|PH7PR12MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 638c1b6e-52eb-4841-49fb-08df46f7f0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|376014|82310400026|23010399003|261102123227099003|261022075727099003|4143699003|56012099006|261026140227099003|11063799006|261028144727099003|261026121527099003|261021121427099003|10067099003|261022105027099003|8126099003|261009223027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ov5Yi/k+usO9ujLzzLwp3DCtwNF6ZoPa40t378XQ8BFr2pjWXDO69p3rRd79uLjpV8jPeB0ee1d5AvwiKHjg+A7+FXebyZX3IvdbGxSxs1djQpv9LG8FJ7Cr2fAlrH5MRFBf2pzSAQghH5tr3D+ocJaGhxiNw6oM/obzUBWJAO0+CQ4ZL3n3tU5gAJGtXbp2Gq0f6dklfliw8QislkgVAaEwZdg9ZbWekxS8TEc+h5JnIIM6+zReHhojF879n+Ti2YSr1MDgINBhpC31ZPne/iaRdszqHveuH4NgxIluTmXjthE8vuo8bXdmZaUkzkT+z2wALz26ABG7xIQfzGZG3SvKx1jauFD9wa6ov9oga8uPIi1xb0gUKY+VOlE2T9PWjsvEU1Xyoijbz3/HC+MMp8da9dqriy2XBka0EyjW2yaq2Jbe7X2vEBYjh/C3u9m7+R5souVuJexVEi9x7EVy0zqowz/sLpqdseKFKEWN0Te7eAr9PdZaG+JScVJsLf0gCdAdasBqLhm/cfNJOACSxvaSuwjSCIvGnRL2EWwExTBems6UzRwJesv8JZxVde31J6RnXP7I4UD2jCwqwhqluGerwz5avQj696DEwS9KlV8sPe84pBWts3fKXpUfreB7M29rs6U2beTN2f49AAVvOKnYk8LfdW/xpJ0Y+IQKqWQQ5p8esSPdhOqnRDGk/H0cBpXqQEgliZI79/mJpB1q0Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(261102123227099003)(261022075727099003)(4143699003)(56012099006)(261026140227099003)(11063799006)(261028144727099003)(261026121527099003)(261021121427099003)(10067099003)(261022105027099003)(8126099003)(261009223027099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V4Y+XtjFkludcYT+duR2HWk+iaP9P/pbsfAiBrbfY/ZPTuk+QoTkA8lbJIyx10pLK/pbOLFyBOlh8jUXSdy5asef44d8iKtcm+LYk78JpToc8V/7+NjmOaTvll62BtOi8YScbEVfgr6bRt7fSIl5hiS+4t/PkPz5X9Gr2KF0vk89qtzOa8ZE+Ojdb3bXEIK0469DdVAHe6pFOUgJBaSRpq6DMss7uxVV46eIdD7hg2M1kHEo0gy6RjOk6G40Auww6DV21ZNogfByHa7oCh8rPILuphM76rqP0Cnl1beYALdx2E3/npuVCmCB3ofQqRWW1Pt9t/UpwHqol5E6reNx9LTpvrA6GeMlsQteB2kdlLLv94Ss3luxEmUzd2JYXu3yiBVGUIaLF9xdFYty2h1bf3fSiNL33YMDtnC6R5aaufCvww1+4vKCu+W972EBn6Lm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:18:02.1103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 638c1b6e-52eb-4841-49fb-08df46f7f0e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000DD310.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8053
X-purgate-ID: tlsNG-d25034/1795173499-5093EA5B-BCD511E6/0/0
X-purgate-type: clean
X-purgate-size: 2729
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefano,

On 19/11/2026 22:22, Stefano Stabellini wrote:
> On Thu, 19 Nov 2026, Halder, Ayan Kumar wrote:
>> Hi Denis,
>>
>> The requirements look good. And it is great that you have written the tests as well.
>>
>> So from a FuSa perspective, these requirements are 'covered'.
>>
>> I want to confirm the tests for each of the requirements.
>>
>> Refer "[XTF PATCH v1 6/6] x86: add NS16550-compatible emulator test"
>>
>> On 11/11/2026 19:47, dmukhin@ford.com wrote:
>>
>> From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>
>> Add the market-to-design traceability chain for the emulated
>> NS16550-compatible UART exposed to x86 domains.
>>
>> The design requirements are written one per row of the test_suite[]
>> array in the XTF test tests/emul-ns16x50/main.c, so that each
>> requirement is covered by a test case.
>>
>> Additionally, document the assumptions Xen makes on the domain in order
>> to provide the functionality.
>>
>> Introduce XenProd~x86_emulated_uart~1 as the product requirement the
>> design requirements cover, and add the two new documents to the toctree.
>>
>> Finally, fill in the maintainer of the FUSA (x86) entry and extend it to
>> cover the x86 product requirements.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>>   MAINTAINERS                                |   7 +
>>   docs/fusa/reqs/design-reqs/x86/ns16x50.rst | 386 +++++++++++++++++++++
>>   docs/fusa/reqs/index.rst                   |   2 +
>>   docs/fusa/reqs/product-reqs/x86/reqs.rst   |  24 ++
>>   4 files changed, 419 insertions(+)
>>   create mode 100644 docs/fusa/reqs/design-reqs/x86/ns16x50.rst
>>   create mode 100644 docs/fusa/reqs/product-reqs/x86/reqs.rst
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 327adf4641a1..2c0eaaea2d24 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -335,6 +335,13 @@ F:	xen/arch/x86/include/asm/x86_*/efi*.h
>>   F:	xen/common/efi/
>>   F:	xen/include/efi/
>>   
>> +FUSA (x86)
>> +M:	Denis Mukhin <dmukhin@ford.com>
>> +R:	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> +S:	Supported
>> +F:	docs/fusa/reqs/design-reqs/x86
>> +F:	docs/fusa/reqs/product-reqs/x86
> Hi Ayan, Denis,
>
> The MAINTAINERS file is not hierarchical, so with this change the x86
> directories would no longer be covered by the maintainers listed under
> FUSA.
>
> Could we have at least two maintainers listed? Ayan is already a
> reviewer; if he agrees, we could make him a maintainer so that we have
> two.
>
> The rest of the patch appears to be acked, so I can make this change on
> commit if we all agree.

I am ok with this.

- Ayan


