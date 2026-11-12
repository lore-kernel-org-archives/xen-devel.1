Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18050606A33B
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=KBOCsI7G
Received: from list by lists.xenproject.org with outflank-mailman.1485336.1688539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRIT-0001Hq-Nb; Thu, 12 Nov 2026 09:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485336.1688539; Thu, 12 Nov 2026 09:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRIT-0001Hj-Ks; Thu, 12 Nov 2026 09:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1485336;
 Thu, 12 Nov 2026 09:40:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xRRIR-0001Hd-Om
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:40:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRIR-006Vr8-5M
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:40:43 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6af58988-8faa-0a2a0a5109dd-0a2a4508caa0-38
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:40:43 +0100
Received: from [52.101.84.81]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6af5899a-f659-0a2a45080019-346554519e72-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:40:43 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by MMZPR03MB258219.eurprd03.prod.outlook.com (2603:10a6:190:33::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 09:40:40 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 09:40:40 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcuwDuZkbtKsEDyfVrn3HUawO8T/8ZlbBrYkht4JNYPbACcjbJUCD31jmRciBPhWKpeiX5NamPivpiu0N97EzrP3YHdyquF7JkqQkO8DzW7iKKB9UbHw3GwSuLgrtst5tUdHjFZrFDXisKIAzkmKAFO/B8IkQgPhDoH/AxH2pFjlJKp8stlpzcWoqkpAeyiebE0+jc43AdyS5jMw/98vGi/l1PrbRL0HNFFGTbTuzR728qBPf0y0TaQ3wVLonxExj8ISkJce+5TRJgOizlRlQYo3EtE1kIbbfRAYvuu3EmarLGW2zl/bGF7aJrYBbk4dA8CQ12VO99WTvMn5Zf1iWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUiIMzwyoMjJ2POb9n0304bpk/9VJZ4w1hAn3rL8iVA=;
 b=A5vkVBN/Ob9VxUUdr1O0TKWbNv3U000F7oBN2uiW8ImO7K9zGSsuEEYGXsNKZWzyAUwSoYONpPrAKopjPeHwiTWl7K62Tmxlw1js6rGSM4wEkCeE+lsJR2L+ehbaOSrq5zw+9VmrBxaE7sIPXWbwvK2DgMhcfZ8ruZNKoTaMZ+DwueXeO2lyaK6NEHRh7KaSlc0SQ61wmDC/X1isrUnpSNCOptlOLKlBbfFY6g0rq00f9Y2woMkcnXfwPQI6e9Aijz6MbLJYjup54wajWU093JFii/ZiGOYPuxhtFffcVA3mmIq2dbqapmyiUM00k3ZjoyYXXAMfMXBX6zDr5Txn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUiIMzwyoMjJ2POb9n0304bpk/9VJZ4w1hAn3rL8iVA=;
 b=KBOCsI7G5JOZWyzzDjlmN/9Cgge4dbK03J7jBFr+ZtV9EThNYANMgId47ebamZpQEv5PaTyUlz2h90icuNPDiE+O8feBrXWFJKClSrWXxTOQNFlvVIcTsv6EBfLNXWFvweg5/UposkLfXFJvUAVXHUX2sY+llFoSpDIp6LlHhcdqd7zZanXuxcFjBENSIWv0JdxPwVQP2iVI4UcnSDqtxSuh4EcraBSxqOLoa2rn4KleGSFigbuBYw0y/QO+X7b/klDypdvB0aTHKN40iC+n3Iym+2GDoKy7nAbpaReicfwRI6wbVLyuxsy09DwEXVM07ofXajEoDHwrwuF0owTCxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <63b40883-e32c-421d-8114-f02564d8322a@epam.com>
Date: Thu, 12 Nov 2026 10:40:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/22] xen/arm: vIOMMU vSID->pSID mapping layer
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>
References: <cover.1793726692.git.milan_djokic@epam.com>
 <112c09580e509dd89db411fd61e556d8637582d4.1793726692.git.milan_djokic@epam.com>
 <20261110095654.551557-1-mykyta_poturai@epam.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <20261110095654.551557-1-mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0632.eurprd06.prod.outlook.com
 (2603:10a6:20b:46f::6) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|MMZPR03MB258219:EE_
X-MS-Office365-Filtering-Correlation-Id: 689c30e7-6ad7-416f-6e87-08df40a10360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|4143699003|56012099006|261021130227099003|261021123027099003|261021121427099003|261021135927099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261026130827099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dYCNKkOcKTcgsm1XKETvuS70uQC97OpFBcmDlefur04/0GDzU4VBWwg4Z62n0Ye1AFJa/4aNH+3jAtlGJO6rouyBr250rn34auYlXlPte2nESrhAQcPSfX8QD56eZwqNzbjxqhHZcMq/IR1GMQ7rFngKH3IzdJC2c/WSocrM91hvx/CC6CmLhtHHsKdjJ4flePnzSyRZHocJ/nmsmqLbX8CkLUz8YtZWhNfC0TKim51CIUPKIs1qSUv/7JYF6vaGiW6+BMxf5kEQgFmhsPj0w0fihZVNDXlXniXlmN+rhQz42niS3y1ylfrWeROXdDuzRqxW/nrZP67zpgzPOQ6hrGmMnWitedP8ReSZEjPgYH6vjrZfntTuaHM8IC7Y/NgkgzIlO5luqnD6lJOiHS5iiKMjcQrQXwoS1/oDBiG7AdBMuTuu5PuKyIiE+AFvmHw87AJ8lSvoBA1N3GFeKFfFda3B6WB8ARy9Jt83c6iZuGfST4W9leTv2Dem6bWL2M6P7atHzziiyy0Ouf/AulN9VHWT2VPsoR8mrl4ovSaCKlES3OzxHo92xsutY6LA7FDzLeMJnTV+Y9sLzIwG2eGX/oAJnOgE1M6/SiUFdyUhvdwe7b2ME6xo4V6Z+Ooy4U0KU5zOpQlFwN6YMz+6keitqRv51hXD6BScV0B63vm9Cdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261021130227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261026130827099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjV4NTlmU25BSGo5UVhVenVtQlFrVHBqLzhOU0RuRUh4RlZIZTgybTAxem5R?=
 =?utf-8?B?L0pnZTNUdWdkQS9hOWZsaTQ4TnI1WHIwUXpjcllWTnc3MjVHSURxd3JNWWlY?=
 =?utf-8?B?U09ZU0FZWUxZU1pkbEpiazNLWkE0WE5TVHJJTXNIU0lwbXJHMzdaam5VZWZ5?=
 =?utf-8?B?MHI4NDF3akZzcStJU3RsK2tVa3BMR3N2S3RMM09yN0t2WWVWS3lSaWxxbWdr?=
 =?utf-8?B?a2cyK3JSdDZKYTluaEtod0VFV0xjMUpvSk1HZUkvL0lIMTIydVJ0OEthMklM?=
 =?utf-8?B?S3ZZWFhTRHZIRktsQzArNjdCWXlnSE1TeHlsK0oraUlUV05KVWhEY2ErRUZ0?=
 =?utf-8?B?amtxek1YRmVNRlhETmRJaHA4eWFRNlVjMlJEbGE5d1p0ekVua1Rta1Znc3lU?=
 =?utf-8?B?Wi9rc3FFT0lNMklvUUVRTk5nc1NnbUNjcDRQaTFEQkRPeTlwczk5bldXSVBk?=
 =?utf-8?B?MXJWM3lyeWE0RXJMWnJTMjFoeW9VZUtJc0pMVnRBaGFSd2JxYTJOVVFyWTRm?=
 =?utf-8?B?UDdTOHpyY29tQzJ6V1RaelVNakVmTHRPNDRSd2hwbmdxVlJMZVpBVSs3WC9R?=
 =?utf-8?B?RlZkSXFIdGhtQ1N4OUF6M2tnNS9nWnRobVdqYVVuMy9ZRmxNSFNiU1VFQUNI?=
 =?utf-8?B?cDMvYWFhbjludmlRQVNYNllDVmdDY0VZM1MzdTNWMHllNUFHRm94ZDRjaTQr?=
 =?utf-8?B?NGtnVVB3MEo0UEpjV1BaTGZzVlVNNFVveVFHWmFtcWlSTzBhUEo5NVA1MmJW?=
 =?utf-8?B?cm5VclpGbEttQldwWTlsOWZ5ajJCc1RzSFJqdkx0MFV3UnlaVzVzc0FqOFVx?=
 =?utf-8?B?Z2NHOUhMSko4Z0NiRk5PU0N6UDB1WWtLYS84Wk9QZWpwV05FaFFRellpdldt?=
 =?utf-8?B?Qk4xYVYvTkk4UEtYYTRmUlRrS0FMOEM3VHRadkJWMnJZb2haV3RZTC9KUTdC?=
 =?utf-8?B?UUgvbHpHd3lpS24reEZINEMxa2hIK0UvODk3azVQK1JpQnZqWGdSU3I5cmhm?=
 =?utf-8?B?ei94bkwrTTdDRXp6SkMzRWRwbjVlMVNYNEJMNGQ3RDArR1FIRUJ6VXRyRkl2?=
 =?utf-8?B?UG1BTHkxNjY5b0F2UGtXTTAwTjFadWVnNFB6dkpMSzRrM0diSXFnRVNhUENU?=
 =?utf-8?B?R09GL2VNQ2NXZHBKSzFGQkFucnYxMXU3U0JIcjBaZm9nWElGQmdjN0JKTGxn?=
 =?utf-8?B?TE9oNEJOaVdWNGxKbXkxTnpVOVdyMVQ5TDRRaDlnY2dWMk1YdEV0SXp6amFy?=
 =?utf-8?B?RE5hM1p1VEJFVWZTSFpzT3RYSlcyaHF5T0NUUjUzMU1DZmRGM1NLb2VKMlBW?=
 =?utf-8?B?d1czdkR4S2xMU0dvM2FmNHNOa2Z6L3dBUzF0NkNUejZueXBZVWQvbGYvQ2E0?=
 =?utf-8?B?MUtKUHpFUldxSFdqT0lkNm5NNkJMclVRblVFbG9HZEY2WEF5dVJ5SUt0OTFR?=
 =?utf-8?B?NGFSK2NmNkNTZm8yUHV6and3djZxZVFtUDYvalRvWTJGZzNjNjdnT00ycjhl?=
 =?utf-8?B?TFBFYzVCaXNsd3QzSHVBQTUvckw4bFJ0YlY0YmhTWVZMeUtLY2VlWU95OGpw?=
 =?utf-8?B?U1hMYUhyL3NPckpvbVAzN0dVVjdOTTQvR3Jib3VLYk5HWk0xSU5RbzFaakpp?=
 =?utf-8?B?dkR6V2NpRys2VGswQVZST3kxZzNHbnpNSWc2SWxiT0pHUmZSb2RwNW1aVVI2?=
 =?utf-8?B?YjdBY0FiVXRvaFRsQklIdFJWMGQ1aVlUdklENDVoQ0NJWDc5ODI0Z0RvZW9T?=
 =?utf-8?B?aGoxbnE1cFF5azFCQS9pQTM5enUxbjBXNnJ1OEZ5UldCcGZQWnhBQi9Mb0dR?=
 =?utf-8?B?OE4zejhBNm5TMDJzdnZaN0hmN1Fkbk1IN2ZuZ0RhWGVLWjY5SldPcFlUQUJx?=
 =?utf-8?B?OU1PVEx5T2Fwak1YeXhxNWo0cE9yNnlIWWdNdXVESzhrSGZacndxTXl4aXVm?=
 =?utf-8?B?ZE5MZEdyOFBNQWFTaXI0RmRMT2lkN1RpMXE1NDVSQmJPcTUyS21pWGFFZklv?=
 =?utf-8?B?RTQ5dEkrNTlldHRTVUJNOXJBbk90bkhOUU55U3MwOTJtSnloWHBUVDc1Q3Zz?=
 =?utf-8?B?UFppOWpPTGJZZFJXVXhBc2FkWkM5ZmZBTWUxNDdPQm0zcU5ZUlVjUGFTQ2F0?=
 =?utf-8?B?ZDBRQVdRUEtybWlNTU1YV1VsNE1mTHA3ejBDdzlJVFhrUlFMeXF2UGlndndX?=
 =?utf-8?B?MlBQdTZBYVRmc0pvQW5SU3ZWVUM1Z1BNa3ErYmNJbHdqcTNPMmtPREVmWjlZ?=
 =?utf-8?B?OUdpOWIwRVdTaFBSN1diYksvNklpWjJhZXJOaFdUOGh4T0w3Vm5YZitORURB?=
 =?utf-8?B?L09lQ3VWU1R5SDUrMGM0dmZOSUxYODVVRENYZnpPdEZ6bFRZY09sdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689c30e7-6ad7-416f-6e87-08df40a10360
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:40:40.1877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU6q8NmDOse0A3MW/ueipmOjJS0+wQ2hoZ0DmvRW00W7TvqBlrC9b8IQ2pPphbsVQZkMmwjde9bHVzumE9qwEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR03MB258219
X-purgate-ID: tlsNG-c1860d/1794476443-CCD7087B-9247D6CB/0/0
X-purgate-type: clean
X-purgate-size: 20774
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykyta,

On 11/10/26 10:57, Mykyta Poturai wrote:
> On Tue, Nov 03, 2026 at 17:30:54 +0000, Milan Djokic wrote:
>> Introduce a vIOMMU mapping layer to support passthrough of IOMMU devices
>> attached to different physical IOMMUs, including devices with the same
>> Stream ID.
>>
>> Add a new generic vIOMMU API, viommu_allocate_vsid(), which allocates a
>> guest vSID and maps it to the input pSID and the backing physical SMMU.
>>
>> Once the mapping is established, the guest uses the vSID for stage-1
>> commands, and Xen translates the vSID to the corresponding pSID before
>> processing the command on the physical SMMU.
>>
>> Implement usage of the new API for dom0less guests. Allocate vSIDs when
>> creating the guest device tree and replace the original pSIDs with vSIDs
>> that are subsequently used by the guest driver.
>>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>   xen/arch/arm/include/asm/viommu.h       |  12 ++
>>   xen/common/device-tree/dom0less-build.c |  35 +++--
>>   xen/drivers/passthrough/arm/smmu-v3.c   |  10 +-
>>   xen/drivers/passthrough/arm/viommu.c    |   9 ++
>>   xen/drivers/passthrough/arm/vsmmu-v3.c  | 184 +++++++++++++++++++++++-
>>   xen/include/xen/iommu.h                 |   6 +-
>>   6 files changed, 242 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>> index 5ae21042f0..3d0eb92655 100644
>> --- a/xen/arch/arm/include/asm/viommu.h
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -34,6 +34,16 @@ struct viommu_ops {
>>        * Called during domain destruction to free resources used by vIOMMU.
>>        */
>>       int (*relinquish_resources)(struct domain *d);
>> +
>> +    /*
>> +     * Allocate free vSID/vRID for the guest device and establish vID->pID mapping
>> +     * Called during domain device assignment.
>> +     * Returns 0 on success and sets vsid argument to newly allocated vSID/vRID
>> +     * mapped to physical ID (id argument).
>> +     * Negative error code returned if allocation fails.
>> +     */
>> +    int (*allocate_vsid)(struct domain *d, uint32_t id, uint32_t phandle,
>> +                         uint32_t *vsid);
>>   };
>>
>>   struct viommu_desc {
>> @@ -54,6 +64,8 @@ extern struct list_head host_iommu_list;
>>   int domain_viommu_init(struct domain *d, uint8_t viommu_type);
>>   int viommu_relinquish_resources(struct domain *d);
>>   uint8_t viommu_get_type(void);
>> +int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
>> +                         uint32_t *vsid);
>>   void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>>                               const struct dt_device_node *node,
>>                               const void *iommu);
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index 970f89ef68..3b2a888698 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -32,6 +32,10 @@
>>   #include <xen/static-memory.h>
>>   #include <xen/static-shmem.h>
>>
>> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> +#include <asm/viommu.h>
>> +#endif
>> +
>>   #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>>
>>   static domid_t __initdata xs_domid = DOMID_INVALID;
>> @@ -333,11 +337,12 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>>   }
>>
>>   #ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> -static int __init modify_pfdt_node(void *pfdt, int nodeoff)
>> +static int __init modify_pfdt_node(void *pfdt, int nodeoff, struct domain *d)
>>   {
>>       int proplen, i, rc;
>>       const fdt32_t *prop;
>>       fdt32_t *prop_c;
>> +    uint32_t psid, phandle, vsid;
>>
>>       prop = fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
>>       if ( !prop )
>> @@ -347,10 +352,23 @@ static int __init modify_pfdt_node(void *pfdt, int nodeoff)
>>       if ( !prop_c )
>>           return -ENOMEM;
>>
>> +    /*
>> +     * Assign <vIOMMU vSID> pairs to iommus property and establish
>> +     * vSID->pSID mappings
>> +     */
>>       for ( i = 0; i < proplen / 8; ++i )
>>       {
>> +        phandle = fdt32_to_cpu(prop[i * 2]);
>> +        psid = fdt32_to_cpu(prop[i * 2 + 1]);
>> +        rc = viommu_allocate_vsid(d, psid, phandle, &vsid);
>> +        if ( rc )
>> +        {
>> +            dprintk(XENLOG_ERR, "(DOMID=%u) Failed to allocate vSID for "
>> +                    "pSID: %u, pIOMMU: %u", d->domain_id, psid, phandle);
> 
> Missing \n?
> 

Yes, I'll fix that. Thanks.

>> +            goto out;
>> +        }
>>           prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
>> -        prop_c[i * 2 + 1] = prop[i * 2 + 1];
>> +        prop_c[i * 2 + 1] = cpu_to_fdt32(vsid);
>>       }
>>
>>       rc = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
>> @@ -365,7 +383,8 @@ static int __init modify_pfdt_node(void *pfdt, int nodeoff)
>>       return rc;
>>   }
>>   #else
>> -static inline int __init modify_pfdt_node(void *pfdt, int nodeoff)
>> +static inline int __init modify_pfdt_node(void *pfdt, int nodeoff,
>> +                                          struct domain *d)
>>   {
>>       return -EOPNOTSUPP;
>>   }
>> @@ -374,7 +393,7 @@ static inline int __init modify_pfdt_node(void *pfdt, int nodeoff)
>>   static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>>                                    int nodeoff,
>>                                    uint32_t address_cells, uint32_t size_cells,
>> -                                 bool scan_passthrough_prop)
>> +                                 bool scan_passthrough_prop, struct domain *d)
>>   {
>>       int rc = 0;
>>       void *fdt = kinfo->fdt;
>> @@ -397,12 +416,12 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>>       node_next = fdt_first_subnode(pfdt, nodeoff);
>>       while ( node_next > 0 )
>>       {
>> -        rc = modify_pfdt_node(pfdt, node_next);
>> +        rc = modify_pfdt_node(pfdt, node_next, d);
>>           if ( rc )
>>               return rc;
>>
>>           rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
>> -                            scan_passthrough_prop);
>> +                            scan_passthrough_prop, d);
>>           if ( rc )
>>               return rc;
>>
>> @@ -489,7 +508,7 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>>               res = scan_pfdt_node(kinfo, pfdt, node_next,
>>                                    DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>>                                    DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> -                                 false);
>> +                                 false, d);
>>               if ( res )
>>                   goto out;
>>               continue;
>> @@ -499,7 +518,7 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>>               res = scan_pfdt_node(kinfo, pfdt, node_next,
>>                                    DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>>                                    DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> -                                 true);
>> +                                 true, d);
>>               if ( res )
>>                   goto out;
>>               continue;
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index f213b3de12..b0ec004960 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -3103,7 +3103,7 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev)
>>   }
>>
>>   static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
>> -				u32 sid)
>> +				u32 sid, const struct arm_smmu_device *smmu)
>>   {
>>   	int i;
>>   	unsigned long flags;
>> @@ -3119,6 +3119,9 @@ static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
>>   	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
>>   		smmu_domain = to_smmu_domain(io_domain);
>>
>> +		if (smmu_domain->smmu != smmu)
>> +			continue;
>> +
>>   		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>>   		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
>>   			for (i = 0; i < master->num_streams; i++) {
>> @@ -3347,7 +3350,8 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>>   }
>>
>>   static int arm_smmu_attach_guest_config(struct domain *d, uint32_t sid,
>> -		const struct iommu_guest_config *cfg)
>> +				const struct iommu_guest_config *cfg,
>> +				const struct arm_smmu_device *smmu)
>>   {
>>   	int ret = -EINVAL;
>>   	unsigned long flags;
>> @@ -3357,7 +3361,7 @@ static int arm_smmu_attach_guest_config(struct domain *d, uint32_t sid,
>>   	struct iommu_domain *io_domain;
>>
>>   	spin_lock(&xen_domain->lock);
>> -	io_domain = arm_smmu_get_domain_by_sid(d, sid);
>> +	io_domain = arm_smmu_get_domain_by_sid(d, sid, smmu);
>>   	if (!io_domain) {
>>   		ret = -ENODEV;
>>   		goto out;
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
>> index b4b91ab1cb..e476567b49 100644
>> --- a/xen/drivers/passthrough/arm/viommu.c
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -76,6 +76,15 @@ int viommu_relinquish_resources(struct domain *d)
>>       return cur_viommu->ops->relinquish_resources(d);
>>   }
>>
>> +int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
>> +                         uint32_t *vsid)
>> +{
>> +    if ( !cur_viommu )
>> +        return -ENODEV;
>> +
>> +    return cur_viommu->ops->allocate_vsid(d, id, phandle, vsid);
>> +}
>> +
>>   uint8_t viommu_get_type(void)
>>   {
>>       if ( !cur_viommu || host_iommu_list_incomplete ||
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index 24588affe9..5d225ccc08 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -86,6 +86,8 @@
>>   #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
>>                                       FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
>>
>> +#define MAX_VSID   (1 << SMMU_IDR1_SIDSIZE)
>> +
>>   /* event queue entry */
>>   struct arm_smmu_evtq_ent {
>>       /* Common fields */
>> @@ -133,6 +135,14 @@ struct arm_vsmmu_queue {
>>       uint8_t     max_n_shift;
>>   };
>>
>> +/* vSID->pSID mapping entry */
>> +struct vsid_entry {
>> +    struct list_head entry;
>> +    uint32_t    vsid;
>> +    uint32_t    psid;
>> +    struct arm_smmu_device *smmu;
>> +};
>> +
>>   struct virt_smmu {
>>       struct      domain *d;
>>       struct      list_head viommu_list;
>> @@ -157,6 +167,8 @@ struct virt_smmu {
>>       spinlock_t  cr2_lock;
>>       spinlock_t  strtab_cfg_lock;
>>       spinlock_t  irq_cfg_lock;
>> +    spinlock_t vsids_lock;
>> +    struct list_head vsids;
>>   };
>>
>>   /* Helper functions */
>> @@ -379,8 +391,31 @@ int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *evt)
>>       }
>>       else
>>       {
>> +        uint32_t sid = FIELD_GET(EVTQ_0_SID, evt[0]);
>> +        struct vsid_entry *vsid;
>> +        bool found = false;
>> +
>>           smmu = list_entry(d->arch.viommu_list.next,
>>                             struct virt_smmu, viommu_list);
>> +
>> +        spin_lock(&smmu->vsids_lock);
>> +
>> +        /* Translate pSID->vSID */
>> +        list_for_each_entry(vsid, &smmu->vsids, entry)
>> +        {
>> +            if ( vsid->psid == sid && vsid->smmu->dev == dev )
>> +            {
>> +                evt[0] &= ~EVTQ_0_SID;
>> +                evt[0] |= FIELD_PREP(EVTQ_0_SID, vsid->vsid);
>> +                found = true;
>> +                break;
>> +            }
>> +        }
>> +
>> +        spin_unlock(&smmu->vsids_lock);
>> +
>> +        if ( !found )
>> +            return -ENOENT;
>>       }
>>
>>       ret = arm_vsmmu_write_evtq(smmu, evt);
>> @@ -558,6 +593,71 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>>       struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
>>       uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
>>       struct iommu_guest_config guest_cfg = {0};
>> +    struct arm_smmu_device *phys_smmu = NULL;
>> +    struct host_iommu *host_iommu;
>> +    uint32_t psid;
>> +    struct arm_smmu_evtq_ent ent = {
>> +        .opcode = EVT_ID_BAD_STREAMID,
>> +        .sid = sid,
>> +        .c_bad_ste_streamid = {
>> +            .ssid = 0,
>> +            .ssv = false,
>> +        },
>> +    };
>> +
>> +    /* vIOMMU->pIOMMU identity mapped for HW domain */
>> +    if ( domain_use_host_layout(d) )
>> +    {
>> +        psid = sid;
>> +        list_for_each_entry(host_iommu, &host_iommu_list, entry)
>> +        {
>> +            if ( host_iommu->addr == smmu->addr )
>> +            {
>> +                phys_smmu = (struct arm_smmu_device *) host_iommu->iommu;
>> +                break;
>> +            }
>> +        }
>> +    }
>> +    else {
>> +        struct vsid_entry *vsid_entry;
>> +        bool entry_found = false;
>> +
>> +        spin_lock(&smmu->vsids_lock);
>> +        /* vSID out of range or no vSIDs allocated */
>> +        if ( sid >= MAX_VSID || list_empty(&smmu->vsids) )
>> +        {
>> +            spin_unlock(&smmu->vsids_lock);
>> +            arm_vsmmu_send_event(smmu, &ent);
>> +            return -EINVAL;
>> +        }
>> +
>> +        /* get vSID entry corresponding to passed vSID */
>> +        list_for_each_entry(vsid_entry, &smmu->vsids, entry)
>> +            if ( vsid_entry->vsid == sid )
>> +            {
>> +                entry_found = true;
>> +                break;
>> +            }
>> +
>> +        /* vSID not mapped */
>> +        if ( !entry_found )
>> +        {
>> +            spin_unlock(&smmu->vsids_lock);
>> +            arm_vsmmu_send_event(smmu, &ent);
>> +            return -EINVAL;
>> +        }
>> +
>> +        psid = vsid_entry->psid;
>> +        phys_smmu = vsid_entry->smmu;
>> +        spin_unlock(&smmu->vsids_lock);
>> +    }
>> +
>> +    /* vSID mapped to invalid physical SMMU */
>> +    if (!phys_smmu)
>> +    {
>> +        arm_vsmmu_send_event(smmu, &ent);
>> +        return -EINVAL;
>> +    }
>>
>>       ret = arm_vsmmu_find_ste(smmu, sid, ste);
>>       if ( ret )
>> @@ -578,7 +678,7 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>>       else
>>           guest_cfg.config = ARM_SMMU_DOMAIN_S1;
>>
>> -    ret = hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
>> +    ret = hd->platform_ops->attach_guest_config(d, psid, &guest_cfg, phys_smmu);
>>       if ( ret )
>>           return ret;
>>
>> @@ -1189,6 +1289,13 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
>>       smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
>>       smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
>>
>> +    /*
>> +     * vSID->pSID mapping layer is only used in the context of domains that
>> +     * are not direct-mapped
>> +     */
>> +    if ( !domain_use_host_layout(d) )
>> +        INIT_LIST_HEAD(&smmu->vsids);
>> +
>>       spin_lock_init(&smmu->cmd_queue_lock);
>>       spin_lock_init(&smmu->evt_queue_lock);
>>       spin_lock_init(&smmu->gerror_lock);
>> @@ -1197,6 +1304,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
>>       spin_lock_init(&smmu->cr2_lock);
>>       spin_lock_init(&smmu->strtab_cfg_lock);
>>       spin_lock_init(&smmu->irq_cfg_lock);
>> +    spin_lock_init(&smmu->vsids_lock);
>>
>>       ret = vgic_reserve_virq(d, virq);
>>       if ( !ret )
>> @@ -1317,8 +1425,16 @@ static int vsmmuv3_relinquish_resources(struct domain *d)
>>       if ( list_head_is_null(&d->arch.viommu_list) )
>>           return 0;
>>
>> -    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list )
>> +    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list)
>>       {
>> +        struct vsid_entry *vsid, *vsid_temp;
>> +
>> +        list_for_each_entry_safe(vsid, vsid_temp, &pos->vsids, entry)
>> +        {
>> +            list_del(&vsid->entry);
>> +            xfree(vsid);
>> +        }
> 
> Can this break for host_layout domains? The list is only initialized for non
> host_layout ones.
> 

I'm not sure whether this would cause an issue, but the cleanup should 
indeed be skipped for direct-mapped domains. I'll add a check to ensure 
that the list is initialized before iterating over it.

>> +
>>           list_del(&pos->viommu_list);
>>           xfree(pos);
>>       }
>> @@ -1326,8 +1442,72 @@ static int vsmmuv3_relinquish_resources(struct domain *d)
>>       return 0;
>>   }
>>
>> +static int vsmmuv3_allocate_vsid(struct domain *d, uint32_t id,
>> +                                 uint32_t phandle, uint32_t *vsid)
>> +{
>> +    uint32_t i = 0;
>> +    struct virt_smmu *smmu;
>> +    struct host_iommu *host_iommu;
>> +    struct arm_smmu_device *phys_smmu = NULL;
>> +    struct vsid_entry *entry;
>> +    struct list_head *vsid_head;
>> +
>> +    /* vSID->pSID mapping layer not used for direct-mapped domains */
>> +    if ( domain_use_host_layout(d) )
>> +        return -EOPNOTSUPP;
>> +
>> +    if ( list_head_is_null(&d->arch.viommu_list) )
>> +        return -ENODEV;
>> +
>> +    smmu = list_first_entry(&d->arch.viommu_list, struct virt_smmu, viommu_list);
>> +
>> +    /*
>> +     * Find the physical SMMU corresponding to the device-tree phandle.
>> +     */
>> +    list_for_each_entry(host_iommu, &host_iommu_list, entry)
>> +    {
>> +        if ( host_iommu->dt_node->phandle == phandle )
>> +        {
>> +            phys_smmu = (struct arm_smmu_device *) host_iommu->iommu;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if ( !phys_smmu )
>> +        return -ENODEV;
>> +
>> +    spin_lock(&smmu->vsids_lock);
>> +    /* Get first free vSID index */
>> +    list_for_each(vsid_head, &smmu->vsids)
>> +        i++;
>> +
>> +    /* Max number of vSIDs already allocated? */
>> +    if ( i == MAX_VSID )
>> +    {
>> +        spin_unlock(&smmu->vsids_lock);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    entry = xzalloc(struct vsid_entry);
>> +    if ( !entry )
>> +    {
>> +        spin_unlock(&smmu->vsids_lock);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    /* Establish vSID->pSID mapping */
>> +    entry->vsid = i;
>> +    entry->psid = id;
>> +    entry->smmu = phys_smmu;
>> +    *vsid = entry->vsid;
>> +    list_add_tail(&entry->entry, &smmu->vsids);
>> +    spin_unlock(&smmu->vsids_lock);
>> +    return 0;
>> +}
>> +
> 
> Is it okay for multiple vsids to be mapped to the same psid?
> 

Yes, this is allowed and needs to be supported, as the same pSID can 
exist on different physical IOMMUs, while all pSIDs are mapped into a 
single vSID space.

>>   static const struct viommu_ops vsmmuv3_ops = {
>>       .domain_init = domain_vsmmuv3_init,
>> +    .allocate_vsid = vsmmuv3_allocate_vsid,
>>       .relinquish_resources = vsmmuv3_relinquish_resources,
>>   };
>>
>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>> index 253f8bb6cb..c94ee4f08e 100644
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -312,7 +312,10 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>>   #endif /* HAS_DEVICE_TREE_DISCOVERY */
>>
>>   struct page_info;
>> +#ifdef CONFIG_ARM
>>   struct iommu_guest_config;
>> +struct arm_smmu_device;
>> +#endif
>>
>>   /*
>>    * Any non-zero value returned from callbacks of this type will cause the
>> @@ -391,7 +394,8 @@ struct iommu_ops {
>>
>>   #ifdef CONFIG_ARM
>>       int (*attach_guest_config)(struct domain *d, uint32_t sid,
>> -                               const struct iommu_guest_config *cfg);
>> +                               const struct iommu_guest_config *cfg,
>> +                               const struct arm_smmu_device *smmu);
>>   #endif
>>   };
> 
> Isn't arm_smmu_device a little too specific? This will be a problem if other
> IOMMU implementation tries to add support for this. Maybe replace with void* and
> let specific driver cast it to it's own type?
> 

Yes, this is already done for the other generic vIOMMU APIs. I missed 
applying the same approach here. Thanks for noticing this.

> Thanks,
> Mykyta

BR,
Milan


