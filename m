Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA03606A33A
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=O6t4hcAC
Received: from list by lists.xenproject.org with outflank-mailman.1472203.1680164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOdp1-0004uS-QP; Wed, 04 Nov 2026 16:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472203.1680164; Wed, 04 Nov 2026 16:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOdp1-0004uL-NI; Wed, 04 Nov 2026 16:26:47 +0000
Received: by outflank-mailman (input) for mailman id 1472203;
 Wed, 04 Nov 2026 16:26:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOdoz-0004t4-Rz
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:26:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOdoy-00HQae-UM
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 17:26:44 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb5cbe-8faa-0a2a0a5109dd-0a2a4509bb78-4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:26:44 +0100
Received: from [52.101.48.68]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb5cc2-be1a-0a2a45090019-346530448573-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:26:44 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB989099.namprd03.prod.outlook.com (2603:10b6:510:3ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 16:26:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 16:26:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4H+kyLyMjfw6KhAVo65/W+3OYMA9BNLXZPvi7Blu7c3fwTfFA6JHTCU46YtMRhw1JWgQF655DTcrKEKsBN8k5kNw9smwdzw+tYg9F4XkNFwn5FDV2/m5BBCg57Wz4p8wY5/2F6NwnArANrgOmLPqDDMdN2cNMIwJdNIsCiK0BF/6b3siH9OWANOaQY/6n+y51Ds6AsZ+Ctg70d0MvCn0HgDB8VY5YH+AJx+VFi+xYv7mTRJHAQUijKkOE0oIA8GoCxcqje7ZFkjc1PRSunQlodjB8n6VXai+i6tN1VdaJANkXBuf9/98ktWthFHfMCU1PAeK+vtKKJXscw9xGlPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzEK3gzuj+8QXHftfDw4UE8h9LAlmr6hLfSRZ+Ewkhk=;
 b=dyH5LhnX+vJh8yGDM1shT7sQD030CQ8Xip2hvAoB8C8sLGOOxSKk3hpUm2amuckvTKVwjaZo+/G5ufUWm01o7eZsJ6bCI84qweD1HD4+/Q6Z5xLjATJYBazG9FB3Jzg4LEAdTBse2cDg5g3XErJxGnRiUfkcPvukmHdog2o3W4IBjzm1cwfZtCY7JigOlvdT33/eVMQcPGXPIAa1qfR4OybYjXZ1T0m+K3yKPnCR/DJlPczpJFoWCNvOB5qKCOeiSx/JYMqohwWz+2Uf9y5OfPbamPjd3W4YCk4jo4IQCoMlVoY73vH5vv8L9hf7TEgoicfDlIgK/1fJ2YrK+jkhhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzEK3gzuj+8QXHftfDw4UE8h9LAlmr6hLfSRZ+Ewkhk=;
 b=O6t4hcACOnXFY1kDx0acZOCEjxqjiv/syen/1LLAqKKC7PqUb3HKoAV+kXCBMTd6Obpqw+OkK18kPXT07WZgKCXN/uoGp/ri8nVBslGB1FJvy1Wc2Qt4zfMwnOU7AII5oFQZZ8vWCDBEKTSqMV/I6M4zYyZuOIWDh2nxG7rDUPg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3263bece-7df4-4b45-bfc4-cbec83e13657@citrix.com>
Date: Wed, 4 Nov 2026 16:26:36 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/build-id: Drop xen_build_id_check()
To: Jan Beulich <jbeulich@suse.com>
References: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
 <20261104135133.2209628-3-andrew.cooper3@citrix.com>
 <28839e8c-bcde-463e-8617-92576ca8e8e6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <28839e8c-bcde-463e-8617-92576ca8e8e6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB989099:EE_
X-MS-Office365-Filtering-Correlation-Id: cc59410b-0249-445c-9608-08df3a90685a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|11063799006|56012099006|261028144727099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261102123227099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vpq/jB3vukKCMd+jQaav0A3AT6xa7oWswhj/eLSdJUTjbrCu8WdF/31vFOjpHrL+yBgW1nZMFGg/Gl5J52KaKenocv8B2WlNP7tpzglswbrRQ1rUmY5ApAZHLddvkijZT2nWkLtlf3vkJbeZprzfDGeouCsMIXvyvITCivcFX+b4jWgpBzCbFIWm0Xx1XfuVmmD2Cg6NiKVzJSsYYs5bqPlkbYUzWVA1mthqgBFUND+GNgKZdqtirjOQF3rJetezXulZKCKrpWuMOyQzqeidAksxQ+L3DRVUWjl5s261tPhMXghX1ZM/UFQkds+H+zhOqPEh7XQ6/SM2W6kAfiZJlRj+xHD4IB1VIl3Sxf7ccwYkwXwG3b6TmrpwiMVst6CLhjjbrVq0QxPZ9onaBDv8cxOKslL2+C9cOfFXWKQqfrD/l/Tt5tswhsEIw9hes5e8mO9aG79XHjRObfG7f2hyiXjSVWQcY878cYXZJuRwUrx74QayBz6OMmpuJjIv6sJ+rGoyFSWRfckbDYXO7dEoXApZzhRnOfV9l4WQ1ERikPBWKfNwmHwFqeYGn+bVb7/ruBu2zqm55ho9gmodL416JZEY5yOO91eXzdpxv/FXhgR09EL6oQeCAqthKzGp/yKAteQZqmE8/jk49qkxqk9UPprxywxstWogVSfX4G2Tkls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261102123227099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHh2Nm9MUnZ3RWhzV0JLZ2xmbHF3Wi9qMmxuVUF2VWtEclZvTWRzRHd3VitI?=
 =?utf-8?B?a0gyYzV5Qkx3UWtrMHllS0xOc1JIMlJVVmEzejVXMjBIeFJTcHJhTnlTeXdu?=
 =?utf-8?B?MGFTa0tnVkd5S0lVcUZEWlJrZThkWTVsc3cxTmtSaTBLN2xobG1JZzdXNmMz?=
 =?utf-8?B?R1hpSHlJaStlWEZwZ0hpZmFFZmE1YkdDOWpFanN2RXdNYm9XNFZqUGQ4UUFr?=
 =?utf-8?B?T0JiU3NSVGZNSnRORG9OeW02bFdCNE5vMk9lRWVEd0FUQnh3RC9tOXlNNjBD?=
 =?utf-8?B?QzNBeFJ3K0t3RVAwa1UrSytOeEF2Z3dJSGVvWElDRWJnVU55VjZ5ejZ0OHUr?=
 =?utf-8?B?c2xlYkFuaEU0R0cyWGFaM1hDVitaN1drSFU2VmNhLzFhL29YOUgzZENqcFR6?=
 =?utf-8?B?RUVTZGVoTDhTa1E4YTZablkrMzZXM2pHRTVhbzNnNkRGQ2RKcW5nR2tma2Q4?=
 =?utf-8?B?UXhHWFk1L0d4RnUyS2NOR1BNL0tXUTVqNytUNXZLcldKWDZJdHZmV0MvRkhD?=
 =?utf-8?B?b0tNMk5pdHF5QVVJTDZVb1VBVFgrTUJHbER6NWJwOEFIK1RJZ3lpeTdoUTdX?=
 =?utf-8?B?RVBIK2pIc24yVTVFT3ZQbU5pcXYyem1LbEdmVUlYNFhDc0pQTlhObnV4bThI?=
 =?utf-8?B?OXkwamFWU29qUE1LZ09seWN2bGhKOHhlT2NKbWVDTHNIWUFRbDN0RDkreURR?=
 =?utf-8?B?d0NtZUtzN1VJQUF0eWYydzRFeThCdk1tM3QxTXQrZVVWUVhaa21pUldoRWxl?=
 =?utf-8?B?azVOdEhrSU1PcUVWZzEwMmRFUFk1eUZ0NWYwbFdPOGxkNzltSlJSTzNWWDRK?=
 =?utf-8?B?czdBY2NGZzI5VzVkUld0SUtmRnc1ckwzZlY4NzFqRk5SQ0QzdVJPbEpqUGxr?=
 =?utf-8?B?b1hmWERFZ2padGYwcUNnYnd5dEdUcWVmcFRzM0FLOGcxTzdQY1NLVE43ejNw?=
 =?utf-8?B?SXhaRm5KT2xUaFJYT3B4R2UvREpNbnNrblhGNWVaRlBEZFE5N3puVC9KQnR6?=
 =?utf-8?B?R05MdlRlZW1TVnN2KzlMZVVGOGx6YWdjbUlyeWgrWTBwQzFSRzFhR1FVcWlP?=
 =?utf-8?B?VlRxYUsyOGRUa2VscGZFZHhEeExkeUlPUDVMcVlTaSs4RGltazdDWDJCK1g5?=
 =?utf-8?B?UEF4VzRHdm1HK0pIZ0pkRG5EcjhsSHRGRmFyckJrV003TXV0VWZNdFNqbWM3?=
 =?utf-8?B?TEt4OEUyNHl1WlJLRE53SFF3cXRENmpJMGJqSG1kVURhT3ptMEhnZ3NuMjRm?=
 =?utf-8?B?cE5UcDI2d3loendYV1lORndlc2lUcWVkT0F3RytncUFXU3A0MzJHckVKY1VY?=
 =?utf-8?B?Mm96eVRodVlJSjFjSzFPZ2pjbFh4TEpBYkFrRkJXYmVGajZEb2FaUjJsQ281?=
 =?utf-8?B?NHkvdUVVR29kR2syTWNIY2ZxRlRzUXdzbjQwdEFwK0xjZEJhbENJMC9tL3M4?=
 =?utf-8?B?ZFY5TlVCM1hEVFlaRlI2blAwWjRHa0sxelNzZDdBVVNJdEVMN0Y3aEczU2ZX?=
 =?utf-8?B?RWNWVVRvdmNGMFpuMlpzUCtvbVlkWTA1OUoraGl3TXk1RXF5MHFOa29zaVBW?=
 =?utf-8?B?Nk0rcFlwam9scGduMVNtTytEMkhJZXFwZVpmdFMzVHF5T0hoeGRZYlo5aDBW?=
 =?utf-8?B?QzFiQ05GVENpM2FUVmdkMHRYc1pYWFc2RFRWYWFudmZoaTlwc3phY1BIYmli?=
 =?utf-8?B?MnJuT2VqMk1wMjJkdDY0QTNIYlUyOUVqcHg4c2pIUDhKQnVGR1lRUUxyTzZk?=
 =?utf-8?B?dXB4Zmljc1M4S2lzbDl3MkFBYzZ0dzk4bXluNG9qMExkYWR4enpMREZCYTdk?=
 =?utf-8?B?RytxdDh0UWxCczYxU3VZVHV3RmM0RU03WHA4WFJxRzV2ODVGMjE2MWwxSXpU?=
 =?utf-8?B?MCtwNVZaSzBSTnlyZ2I2MVFFNzJhOHpBZnBoT0U0Si9rZWtxOFp1UGh5ekdZ?=
 =?utf-8?B?c0RjUDlwWHBZT0JSTkxUcHV5RE43WDdNRU5hL2FiMjBlUW8zamNOZnRSME02?=
 =?utf-8?B?bFFtVDVBTm5lVi9FdFVscmFyd3NIU2xoanZybXVXQVp4SDJHcVExSldOTVoy?=
 =?utf-8?B?QVlnZlFBZFEvaUN3NkFtNHFpc3VvQ2xObjZLNmxxb2E0UmxjQ0dacERoZmU5?=
 =?utf-8?B?ZGJLSE5lNHoyTHBscElmREN6ZDZQdlgvaTczVWZKTGt2Y1Y5eEdCUG1LQnZS?=
 =?utf-8?B?NkIvTko3QXpZakNkV2N6YitRbGlZTnI3VXNuamw1eWx4NWtqWlVCNXVwcGd6?=
 =?utf-8?B?UkYzSlZxdjZGbGNSeHdSZDEzeThEcmJUMkg1SmNzR2F6VlJRVEhZb3ZrUUpW?=
 =?utf-8?B?SmZPMlk0cjB6ZFhqTjdvSkIzWDJUNXRabjQwTG5hTlg1TUVidFlxQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc59410b-0249-445c-9608-08df3a90685a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:26:41.1085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3lXmFkhkM+rBuJfjA3+e3BkELQkq1oGgO4bueGg421PVMrYBwOkZBbx/xUwY1zM52ii/3qEpee0IfNA22KLCEyC9MdattHncEvFh0HIX/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989099
X-purgate-ID: tlsNG-bad1c0/1793809604-3BED6034-E0065595/10/78276251493
X-purgate-type: spam
X-purgate-size: 1302
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04/11/2026 2:51 pm, Jan Beulich wrote:
> On 04.11.2026 14:51, Andrew Cooper wrote:
>> The function is misnamed; it really is looking for a GNU Build ID note, not a
>> Xen note as the name suggests.
>>
>> It also has an awkward API to use.  For a GNU Build ID, the content is always
>> at +16 from the start, so really doesn't need to be returned by pointer, nor
>> is it necessary be doing additional checks on the returned pointers being
>> valid.
>>
>> Switching to is_gnu_build_id() allows xen_build_init() to be simplified,
>> returning after the first successful find rather than passing an rc down the
>> function to skip later checks.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks (subject to the API needing to change in patch 1)

>
>> The 16 probably ought to be a define somewhere, but I see no obvious
>> candidates in the ELF spec.
> That's for NT_GNU_HDR_SIZE in patch 1? Why should the ELF spec care about
> GNU notes?

Oops.   I wrote that note when I was still using raw +/- 16's, and
forgot to remove it when I introduced NT_GNU_HDR_SIZE.

I meant elf.h, but decided to just reuse the NT_ prefix because
everything appears to be ad-hoc.

~Andrew

