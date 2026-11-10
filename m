Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56E60A380F
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 14:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fuBvY4AC
Received: from list by lists.xenproject.org with outflank-mailman.1481914.1685804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQn3x-0002v7-18; Tue, 10 Nov 2026 14:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481914.1685804; Tue, 10 Nov 2026 14:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQn3w-0002v0-UR; Tue, 10 Nov 2026 14:43:04 +0000
Received: by outflank-mailman (input) for mailman id 1481914;
 Tue, 10 Nov 2026 14:43:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xQn3v-0002uu-E5
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:43:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQn3u-006Vut-NJ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:43:02 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6af32d72-e002-0a2a0a5209dd-0a2a450883bc-26
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:43:02 +0100
Received: from [52.101.43.53]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6af32d74-f659-0a2a45080019-34652b3580cf-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:43:02 +0100
Received: from CH0PR03CA0349.namprd03.prod.outlook.com (2603:10b6:610:11a::33)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:42:57 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::ac) by CH0PR03CA0349.outlook.office365.com
 (2603:10b6:610:11a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 14:42:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 14:42:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 08:42:54 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 08:42:54 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 10 Nov 2026 08:42:51 -0600
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
 b=uZgtm4+uKcQwahlPFMJElxLNgtB7dS9SrJqif2AYR7EQ2A9GUHwEhBC1SQ2j/5KuwDb76/laPRwXer4VfXiEGwrri6ujuZrqrAAmBAA8l9gZ2y8HqvFPxRXaTOXclGN8jvNKuHPr+vdEVMnqQq2HtMb48BL2kNKd8hFWGATMWhAkDZL78JHhe/h9W47NtHf5js5sskLZlDBMpE2e57bAH8NfepUX0lVUo82LFf/LP8YytLeYZ2YfriUJzkfj7PS6JKags+EDmdTfzpFKuyfBgoGBmg5K742PnhdfPqRst+4MMlqLcg76NC2+MKrsNlzmc2WjK5mpGgEzM2kDjHFNpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8TcAOni+Qh7k7bIA00RkRD3Nyf7J5RQOKbwSAJ9zIU=;
 b=PAgCEGG9+lvIhdca0eVMz27i3BpJxzlp3ogJGYVrL1gX19vixy+LxxD0zFmvdRKeam3OFA60zRHBttGJ94mijijtYE/8Vnf2qo1KhCUWoa/hcpdTAH7NHUzLbnUt3K1G4aFqOyIJUEKzURbqyHKt2p+Ywbreku20NnGm6WHjlUDXRGrBLQS2OOpl0iYl4K0GKuj45+3+3sLbBCpv+sT4gP/bYajJ2HthTOSquifIo0xP+yx9hx8sVKYZVgZRgl9KAj7SW9w9wctdlLuceo1wD2jaz8zy3TdGUnvbqXEOVVI+R78vw+d6ojZ+pZ4Ks8QL4BFgYCnG8jyWmKp3iA9olQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8TcAOni+Qh7k7bIA00RkRD3Nyf7J5RQOKbwSAJ9zIU=;
 b=fuBvY4AChUCiCAYNl1bPFZp3Mj66ukwxw9v05mR3+jiU2OVBscDXb8gsddilkJ/jJI+hS6R1NxkruHUIa+s6ICPgxlwVO1Kco0PtZxQ2A0MT6N6PvojSoI89s0MbWq1kBYDCTnRwTV6T6amm8CmpkPZnnRghYFoCoPN8jtLas/c=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <864762ac-64c4-499c-aacf-5527390bd95d@amd.com>
Date: Tue, 10 Nov 2026 09:42:06 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself
To: Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
	<xen-devel@lists.xenproject.org>
References: <20261106231818.482564-1-jason.andryuk@amd.com>
 <d15b8c70-840c-4de7-a047-823a31952567@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <d15b8c70-840c-4de7-a047-823a31952567@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 34642db5-b051-42e5-eb2f-08df3f38e8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|18002099003|22082099003|4143699003|11063799006|5023799004|56012099006|10067099003|261028144727099003|261102123227099003|261009223027099003|261026121527099003|261026140227099003|261022115727099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	+/9g0zc1Ge3YS1ZmjSd4tyNRmidHUs/XNVCoEP3RWP3eAXIbmNAALlhVhZGcb06eFba+9e7V9i61W06e9zntVgOd2U5Us0WK1YuMpPrgD69Jt/RZgqcMfzLQYGRNypRq1cfLNpRAHOX6PGMqVUMstCInwR7FLeYYjPLhFkKzd9EOXhxnnS+C+40RjfJ9RKWnbmcBW51iB5fh6ueYOmHRmM6RyJ1C+/0uQ/ORcl+sWxgcPTHubNUG30s1kt/XtYEvlsZMhyyva/J2+gFcyjcucU73/GAYJCK6IUceRLTJT+KwdfmzxDRhdVvLI9W5PjO0sXx22snX6Zzwwi5Ip1jRd+pamIWwoIh7Ua1mbziPy8Yf/rxzDDvikz0LdZZUGrfr+trjOJgaCCfKOBkTZpqMncUmxy8tRPmuNTyI0BUdRH6t9ywlgTV/0vPaXb78EXyYelfOP6P3NnlT1KmXptVmdjnYte1IDxSNc5UnMiL2U2gwH0c/qeb/fpEaG0WVNU084cT+X0GhXoGQ1nBwxjxEKQLq7OZx8F45TSwy451bQo19nKk6ZTRF3i0AmO0+NGNOqjyLLA9AggRI6gk5riA/HcGIxgNPgXfpSDcHVIhA9Cpkyor1cdoRr9qcoPnjb7G8Krhfg+xITYHc4ThmFtGI874mqmtNK66k8St1boY2hbAR4WmypLCiwPkkURJs/w3S
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(261028144727099003)(261102123227099003)(261009223027099003)(261026121527099003)(261026140227099003)(261022115727099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nh3wq1fK/ar/VCJQJbg2hipHBMj5B+RUi9Y6r50Id5CN/7Gl3vv9eSdETvg94ZHZ0vzmMlAa1AhsLzmPlJVI+K+t51s87u8yghpuzrpdTB9InfL8s5aYywi7EmygXVqPCcG0ckFgRJ0fkPbRVXAH9Fxa2FZ3x6dCLK+3pF49pnpu+PStxYtK1ZxTg/yi8TvCwqIrYR0+Dysv7uvdNAkYE2NRviIb0wmpGfweJm9djZXvJM0NOH4wbcsM73d46C2Oatj+AK/QWUFMx9aw8l1x9vFvsU5MySQZf5tk3CRrSlgT1Bp4F+RMi3wyCKZtx6ZwZ1dtNrxq3o48zZ8PWkkKrz0hnmYRc4/+smNCu91eHvilQ5Ohf4cWe/mb4nOv/UF/FieIp8Yp5FrCETzG76ixHk9HJGZKC3L6HdYD9MD0oS3xrgQ9l2144lTqYNSzg4N8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:42:56.8695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34642db5-b051-42e5-eb2f-08df3f38e8f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779
X-purgate-ID: tlsNG-c1860d/1794321782-D614687B-7351031C/0/0
X-purgate-type: clean
X-purgate-size: 1444
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-10 03:42, Jan Beulich wrote:
> On 07.11.2026 00:18, Jason Andryuk wrote:
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -224,6 +224,16 @@ static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
>>       return ebmalloc(map_size);
>>   }
>>   
>> +static void *__init efi_arch_mmap_buffer_virt(void *ptr)
>> +{
>> +    unsigned long load_base;
>> +
>> +    /* RIP-relative address is the current Xen load address. */
>> +    asm("lea __image_base__(%%rip), %0" : "=r" (load_base));
>> +
>> +    return ptr - load_base + XEN_VIRT_START;
>> +}
> 
> There's nothing specific to the mmap in this function, hence it's name is
> a little odd.

It is paired with efi_arch_allocate_mmap_buffer() above, so I wanted the 
name to indicate that it is converting mmap_buffer to a virt address. 
`ptr` needs to be within the image, so it has limited applicability. 
It's handling a special case, so naming it for that special case helps 
limit its use.  A generic name could be misused.

Having said that, I am open to renaming if that is desired. 
Alternatives could be:
efi_arch_xen_phys_to_virt()
or
efi_arch_image_phys_to_virt()
or
efi_arch_xen_image_to_virt()

> Also the asm() is lacking a number of blanks. (This aspect could be dealt
> with while committing, but a possible rename I'd prefer to be done in a v2.)
Oh, yes, sorry about that.

Thanks,
Jason

