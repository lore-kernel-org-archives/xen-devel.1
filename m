Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5FA606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fw2RK9lI
Received: from list by lists.xenproject.org with outflank-mailman.1481821.1685723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmCM-0008M7-0t; Tue, 10 Nov 2026 13:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481821.1685723; Tue, 10 Nov 2026 13:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmCL-0008Lw-Sf; Tue, 10 Nov 2026 13:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1481821;
 Tue, 10 Nov 2026 13:47:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xQmCK-0008KV-JQ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:47:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQmCJ-00D1Mf-Ur
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:47:39 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af32071-8faa-0a2a0a5109dd-0a2a4502bfec-38
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:47:39 +0100
Received: from [52.101.193.2]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af32079-6ca4-0a2a45020019-3465c102f498-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:47:39 +0100
Received: from BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 by SA1PR12MB9003.namprd12.prod.outlook.com (2603:10b6:806:389::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 13:47:35 +0000
Received: from BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c]) by BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c%4]) with mapi id 15.21.0569.009; Tue, 10 Nov 2026
 13:47:34 +0000
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
 b=LHKy9Q8SZlv7KNFPy0VnwdJU/HiPRPhK11rCivUk8krDFn4EWL1/L4CSD9ThsFeyVEX/p3Gf9OABOxn9rXCbvyLWOvcPit5Gxtp/FkmhbK3XDlPyWq+Vo66qrW2MdpeRvqkqDbuW2hzBSoCx9N1/WrLLzAwv0FS6UtZ+gDW02dlxU926MDeuoAceDPUqq30nIfDx05eBYppdrhCQ97R9EEVU3zoJwB+I0E/HtsN9z2psX33UvWiCuF19sbEWl0FB/PD9L/u0ObX81VTDqAiOQ39CXLqtvWO580lATcpwFQFpq0kWd2qJvrzM8S15ilncn/pim+IYQ+56BWzMrSJSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuOC0z7hPR0t72EWgKTlQyVtr1z3gRV6UdQk15BflLQ=;
 b=JCEuZs1FleHb3XBNg7pVDof0LbZYqO1zZCPIjJF5Wn6uRIMo5EyoAkBy7KxSRinpUXTS5aPg9L17dO1aZ3Y2MLk4XLLhda7zL4dPjJ+/CmHx2XlSeIqqgE7rq+tCgVgOKvCEZHD3kIm+jfYsAn7YvR33ZEXTnfb9THGiQwi5uBSjNtXzj8hD0Dl4SYm4NDlIz4ixaN34JaL0dhXF/3XW1TkbNgOf1wX/p390T6rXayIsgQV0fBVhzv/uNgdEfJDCQ/WPgTddlT0jRHB7RsoFRnYdF9fZloZRtjKNIbABB6C4QZ1sPBwICys1ayJ5HbF24s9b3EToh0wesVzkRLqccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuOC0z7hPR0t72EWgKTlQyVtr1z3gRV6UdQk15BflLQ=;
 b=fw2RK9lIR9d22oJlBMpiljjdXdaFzPW4mWRKVqk7iILB24nZtgjHSZZIq4K6IMlM9/19mmR7XsDlLxhhGZZPnZNf9XWKRvz3jdMeUxfmRSLoZ3h3z6vozTJ2y0+z+gme+GnYuCrpujmGH1fF2wvSZCWML4pCHzPr3BiyfVJ7R5o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6204b804-47da-434b-85a2-3843a7a0972e@amd.com>
Date: Tue, 10 Nov 2026 21:47:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] automation/eclair: deviate R2.6 for the x86 emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261110132442.2891216-1-shuaidong.chen@amd.com>
 <93875740-8661-41af-b4d9-836a4ae85dbc@suse.com>
Content-Language: en-US
From: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
In-Reply-To: <93875740-8661-41af-b4d9-836a4ae85dbc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To BL0PR12MB4754.namprd12.prod.outlook.com
 (2603:10b6:208:8e::26)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_|SA1PR12MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b86920-7db3-4a5e-00bb-08df3f312cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|261026135527099003|261102123227099003|11063799006|4143699003|261021133027099003|261022075727099003|261021121427099003|261021130227099003|261021123027099003|261021135927099003|261022105027099003|261026121527099003|261022113327099003|261026140227099003|261022115727099003|261026130827099003|261009223027099003|261028144727099003|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	qiZvPxOI8e604RoPKjqqda2jLdId9Ntp30TDYI+Hs4yiTbUyeU9JqUuGfQe0BYyIVPmi9gt5vV0RRohokw6F0M0I+62AS2ibJMN2+D2A8aKsYByHbzerYX4AYnmUG7eDAhT4XuJCq5m2kiDm9/YZDlPR1neE9hey+yHDCbHz8Gd2JZkXP3VsrbZtyTNYTzCvhJNOhRqV39/JCwkQzY3TLHy4wWgbaCayRJofaU0bX1jqAyViXRdT6mPsoe9j02NsXMVBCVXe60EpZt1FCwdm6uYtItIpANks4rQMvq+elY1rw1hko+XScxVOdEzpjuDj1ls1L1UtGJmHMOeg44kYaM5nadxcCU8ZjXKKAsFQYqdiePvUeKs4CGnardEMdW3nFcpPVNe0kmFE81+vwBHuocns8/J8ixJ7qLXbSOlU0jjLScf8YYuIK65GkpByrZMud9pP0vS/VXq9BR0Ky7Wm4ffqrFyRKqT5cYpRvnthDNtQ32UfwKj7TFMAkEAqFIanY+LR+W1ZcrfQMKwFAR/BEaDgzJviZlkMGDSH8pxa+ATVuJeAkGGWr5Z86D8ZmNZDmqEl+aGa3T92k00+GurWcwuBqErrFtTBmCBmeVXVexrh+yVS+1Q44g2ZjQPMnbJkO99ztjIJOCbvHG8naaW2+o3eznzGmIdHONjV+USWU5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261026135527099003)(261102123227099003)(11063799006)(4143699003)(261021133027099003)(261022075727099003)(261021121427099003)(261021130227099003)(261021123027099003)(261021135927099003)(261022105027099003)(261026121527099003)(261022113327099003)(261026140227099003)(261022115727099003)(261026130827099003)(261009223027099003)(261028144727099003)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkgwL1dNODBKbFdQYTNlZFlpRkhVRDZMNkRwZ0tvcjNyQ1JVYkxDWUF1RmRt?=
 =?utf-8?B?LzdhQ2RGQlVESHI4S3M0b0s0V1ZRRWJMdTFBUUVhcmVobGVmclJkU05SNyt3?=
 =?utf-8?B?bVJsdmg0UGRXSlJuZm5WWEFhSjNTdWpxaS9hOFJ2NzZxcEpmQzk4MDlMcndw?=
 =?utf-8?B?UVlDUUpQcW5iazRFanE4c3doblMxWXM1My95UWN1TWcxNHpTYzdNWEc4UWNZ?=
 =?utf-8?B?ekJPd2QycGxLS2Z0dVVNOFZ1ZWlPU092ejFQanZINjN4emF5SUwwSXBXa2FW?=
 =?utf-8?B?bjhYUTV0REVSZTRoVTNNTzYxbFFFYzlLdUNaMnJXR0llUnN1Y0NWVkQ5b0Fl?=
 =?utf-8?B?eE5MU0RYYW44ZzlEL0dLdFpyWmMzQ2RScnNFa05ac3RLUXBjYjdQOGdKWWxn?=
 =?utf-8?B?NVJaM1hMWFNOeGNZOGdsWTN3QUJTclZaeFFUUWdHbHBiWUVsSUZnd1dHZXF0?=
 =?utf-8?B?S3AycnAvYjJwL0ZpbC9jUmU5dklpVE1qQzJ2cE4zd3YxQVY4T2dxSTl0elcr?=
 =?utf-8?B?MGdObmVKMkp0S3pkL2hGSitDUjl0SzVtY2F5TzNDZTdZSlVPaGNrd2xsS29G?=
 =?utf-8?B?eTVjVFVQeHZpbjI0TitST3pEeXU0aW1Hekp3cklxL0xERTJOd0tTcVZmTUNU?=
 =?utf-8?B?eGFvUzZSNzd6ZHVleWcwSHlTMnZmQVRscGUvRHhpVWxZRGsvOXMvVjN5S0pk?=
 =?utf-8?B?Q1hqWXB4TEZjVDRJNFllQTFKbG5MNjJxaHRuaTFhNElpc3hwcWNEcEtSWTM0?=
 =?utf-8?B?NTJWSEdrMlIwUSs0eW02RnVKNEFtR3BQNXFRMUhlekRyU0dtaUNEcmJsRFlp?=
 =?utf-8?B?QU1kMTd3TnRFK0t4UnBzMDVVbTdrekMzU0hhRU5JczZjNFU5MkhneGxtdUxu?=
 =?utf-8?B?RGFhc2ZVclJmWkg0TzZmSTdIdUMyL1VZTm9SY0J6TWRTZDNmVERHWjlQbFJR?=
 =?utf-8?B?NXBqTW0rdlRqTzdWOUtyTGt2Lzl3Y1lVNUlXMEE2R2RTUVYvTEhaUG81TFVw?=
 =?utf-8?B?R2VtSGowRHBWSzJVazJJS2Ird2dzcDljWDE5VlEwMzJQV1ZadExlSGpuNS9q?=
 =?utf-8?B?U1hRZ2wrWjBaTFphaUlvNVRiSE5mbzBuc3JUa3BlcXFhVngvdjAzbUFKSDRl?=
 =?utf-8?B?Z2RMN3F0S01rZ2hsWElHRlUvbXBsbGtGaTMrQjkrS0pvVlRmT2p5Y1o4VjFS?=
 =?utf-8?B?ajhwMHNDaU9NRnlhRWVSelB0b3FvVnZJUHlrRHQwK2JkbWRSVFV6RTFTcGYy?=
 =?utf-8?B?N280ZVN3NXJ6L1BYSktVTXhPemNQTHpwVzRUa3kxd09IMDhxRjVXNXp3czhF?=
 =?utf-8?B?S3F0bHFIblJlK3N6bjE0RDlnVG4rUi9VSEtBYys2a3c2L0pZZktvRUNBdXNK?=
 =?utf-8?B?OXFvWmYvUmNuL2lNRlVUbmNZdEZuVGZCdFBsMEJMaXRGRXZGeEFqY29sNzhj?=
 =?utf-8?B?bUZKenQwd25tekJ2M05UeVkxMGdvSmhEcDQ0ekh0clh4cHNNWWhId2RpOEgr?=
 =?utf-8?B?Q2VCazN2U0MzV0xrclc1VnY5Rk1sTGI2Q0xBUFJJVXhnZXZ4ZnZrSjBFcVZM?=
 =?utf-8?B?bTJLUklkYnlmRi9EMzdtc21wWXRuQnRFRmcyMjI3RkFMdDhBaThEUTJhNTZE?=
 =?utf-8?B?UXpFeXB1ZTc0aXZvRERMZEo4NDRTNVVuaWVmQ2pTdXJUemFKKzN2TW0xdEQy?=
 =?utf-8?B?b2VMaVBXeVRKL3BzWlkrb3N0ekMxN3MyWUF3S2FPeDBqWC9LdEttdjJMQUtN?=
 =?utf-8?B?QmFlMVhKRHhXTUJnTXhuT29FYldpNkpNdFhNdlFUZUFFVVdnQUdkcWQrTWlL?=
 =?utf-8?B?N1Q0QW5yQmY5UTA2VUZHREFidzZzRVFOd2xDdGNUS0Rsa0RJSlVCYVdvUXF5?=
 =?utf-8?B?cEZiOExKM09uSlVwc3VJd09vK20xbUJsdDhMRTlSL3AzWXJrL2RSdEovbXFS?=
 =?utf-8?B?VEZmQ0RVaUZESXNtVzVNSVpZUmM3R2Y5ZUMyUFJTKzVVRndDbmM3WFltOXZa?=
 =?utf-8?B?aWJheHRBSUduVnh2U3o2alFzSlZzWGtEL0l5T2Z4MFFLZVd1U3dIQ2RTRlZO?=
 =?utf-8?B?MGZMbGE2VzVXbHlxQXloOHF1WTVxeHJIbTF1WXlMWEszUzJqVUNCcVRYVlZs?=
 =?utf-8?B?NGk1Z082MGhXYVlhTFMzdmZyWDE4WDRrb012SjhNUzUvSGJ3SFhsbmtEcUJr?=
 =?utf-8?B?Vm9zbnZjK1pZbjRqRGxkM2p6ZFN4ZDhvbTlnUXdiT2wyMUhiVG5UZ2dCRkpX?=
 =?utf-8?B?Y0huNjE4STNpdGdkam5XTmp6UDl4SDZURTR0NVNUVTdxenhYRDR6SFprb0J2?=
 =?utf-8?Q?P7letrsHSAcGPlY0xY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b86920-7db3-4a5e-00bb-08df3f312cb5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:47:34.8852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asEZbWIURMdlD5lEVWVuoE6Vt01slJbSl8636FQge52G55FK11zQHa5lO4mg1LUmPvByJFmZfkFEU3+l4jcgUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9003
X-purgate-ID: tlsNG-720697/1794318459-309C32AC-E9AB0DB4/0/0
X-purgate-type: clean
X-purgate-size: 2312
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/10/2026 9:29 PM, Jan Beulich wrote:
> On 10.11.2026 14:24, Shuaidong Chen wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -55,6 +55,11 @@ removed by the compiler, the resulting slowdown is negligible."
>>   -config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
>>   -doc_end
>>   
>> +-doc_begin="With CONFIG_HVM=n the FPU, MMX and SIMD parts of the x86 emulator are compiled out, leaving labels with no goto targeting them, many generated by the CASE_SIMD_* macros.
>> +Annotating them would only add churn to the emulator, therefore it is deemed better to leave such files as is."
>> +-config=MC3A2.R2.6,reports+={deliberate, "any_area(any_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
>> +-doc_end
> Both the doc above and the one below specifically mention HVM=n. Yet the
> config= doesn't (and can't, aiui) limit things to that case. Imo either
> the HVM=n mention wants dropping, or this deviation wants putting in
> place only when actually HVM=n.
>
> Jan
Right, I'll drop the HVM=n mention. Limiting the deviation to HVM=n
would need the ECLAIR setup to load config conditionally, which seems
excessive here. With HVM=y the emulator has no unused labels anyway
(-Wno-unused-label is only passed for !HVM), so the wider scope doesn't
hide anything. HVM=n stays in the commit message only as the example.

v3 to follow.
>
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -116,6 +116,14 @@ Deviations related to MISRA C:2012 Rules:
>>          such labels poses no risks.
>>        - Tagged as `deliberate` for ECLAIR.
>>   
>> +   * - R2.6
>> +     - With CONFIG_HVM=n the FPU, MMX and SIMD parts of the x86 emulator are
>> +       compiled out, leaving labels with no goto targeting them, many of them
>> +       generated by the CASE_SIMD_* macros. Annotating them would only add
>> +       churn to the emulator, therefore it is deemed better to leave such
>> +       files as is.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>>      * - R3.1
>>        - Comments starting with '/\*' and containing URLs are safe as they are
>>          not instances of commented-out code.

-- 
Thx and BRs,
Shuaidong Chen


