Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A839BC5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 15:40:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387602.1628860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtS75-0005l9-G8; Mon, 10 Aug 2026 15:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387602.1628860; Mon, 10 Aug 2026 15:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtS75-0005l2-DJ; Mon, 10 Aug 2026 15:40:31 +0000
Received: by outflank-mailman (input) for mailman id 1387602;
 Mon, 10 Aug 2026 15:40:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1wtS74-0005kw-5v
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 15:40:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtS73-0098Dt-33
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 17:40:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a79f0eb-8faa-0a2a0a5109dd-0a2a4507aa5c-6
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:40:28 +0200
Received: from [52.101.57.56]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a79f0eb-b4ea-0a2a45070019-34653938efdf-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:40:28 +0200
Received: from DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) by
 LV3PR12MB9439.namprd12.prod.outlook.com (2603:10b6:408:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:40:25 +0000
Received: from DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a]) by DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 15:40:23 +0000
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
 b=tiipi1qKGKHbHC7MFEX9/lXtkyks5yGkPFq5xazp5UdaqNu+Sj78hKxTLEGmbVYs9XJ9KlbWHA9hZZu8DIW5YLHXfHJiaz8FhKSGAY2XnU9YBbkysZxBdqGA4Z2RM5iKizLXyN3j9r0ijfDHKbGbOTf4NGw+ampk4ZHqc3qI73WTHXQ2adzuPFF0LY5nnQumzlUpFPf2bV/ZLjivgPSa34DwB1UcfBJpz/pRPVxPvaemdMIF0EB4jRK2DZpx4HoiAoZOAxEz00VDedXGpM2ZrThwv4IfACmayqR7D1YcozRWLMS0vDxBNc6BiyVeBtAm2xodSl5fHo9AMGPj/q6CxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLQH6i+1RsBXNMnLQnCymGu9+MWr54FLe3zoM/hw45o=;
 b=fZy6xoGPH9CD0a3bqTCNdbPARgjA9Htu5NRUzuaSOABpzH2AUMGxFj7gpYTMNCpzUMwzyXHrSwxVhzVDQPs7moh7ZbYiv/QQgIbnDyfqAGJZvS3ehtTHniZZgQn0oBYcX4zY/YqBdRS8Gkg95SL680PsoaZsEOWe+BsmvSSOSHtyn0dTKayI5Ix+QQSYCk/2FAGO8oaasuJfJAEFCC6TKd3QJDsQ9SiU5H+mPK8luEu5aXyG0u7FYVi0UnAkzmp8hL2hahRaDe5dXCB9eqm1sXhQoSm4EljRSMvZn455UhLPS1OCc+CEoqROwKPy7AtnKRANe0ffudUXzVw43GIqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLQH6i+1RsBXNMnLQnCymGu9+MWr54FLe3zoM/hw45o=;
 b=tfP61KIBOa2spXuLjZipld4ySrKWt2J4KTSCgACDp8ajq47l+tJx6ZmqQc8UwPw6FQrqqbR+7xPvOzMQAUrqbKzsTxIye4dMRj/52xB2Go1NBYOqYE4OCkoFZ1qhunpdr9hdFOzJWtJtUygWgVNCsGqg7pG2lkSoyBBfq3gqJHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3a3267a3-01e9-419c-9d82-dd4867056732@amd.com>
Date: Mon, 10 Aug 2026 17:40:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/pci: prevent cross-device accesses in
 pci_mmcfg_{read,write}()
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260806152619.23881-1-roger@xenproject.org>
 <20260806152619.23881-2-roger@xenproject.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20260806152619.23881-2-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPCP307CA0007.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::7)
 To DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6472:EE_|LV3PR12MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a66409-c7e4-45ba-42c5-08def6f5b0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|3023799007|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	D5oSoCxy9edBa7t7iaUrgk6Zm0+ljEXAMMsEAhSWFio7GSTq/DNkrN9g26ibwGicrkuf/iK7FzqocPPDtOJq6NizMAxlHP+lPFgf6cSZE2kpIm6JYBorfGNYRt3T/s9fpX7CmmFIjQRTo/KpXHYUgYVwc7s9S2i+pu/ngHekS6bNgI7eekVZAaZrLBSoNmdxaTCwNnv714pmG3yia+pr6sxvVWNINiXnePs1ZQ9R9K5wxgiP/HZ/BjG4Lys+rEEpZzINgKW8H7PRci4elopOvO77RgJ8LSLKX6hHMkZ70zmmTQuQmilcoK3OkrTDghrI/Bh8J4UfqyFgmGTxVhSf4xxKNg657JGUmfrl4lTVhpJ00QSb+l907TLYpgHCR6myekamvlpJ75ZLcrusBVar2mzv51CQ1pGVyr0Ue3l8ADZlvTmXed09H6V1wcqc4b64Nwq3ssKL5f8UIyBUpEeNiBsGiN6ZpyZYY1CDPZSsAci6l3XfNNLGl6OTNsVatx3pE0OO0XIyFSNbiXj40OFld4jw/cpakBLqW6XcxDyCy7g8Vtnj5vgAgLVFcCEhiNf1ghW+vaBhQstTD5vEPGxv0QL0UK0b31dhmLkk6RagbUCgIBlbcgjrYMnizYsrE+bI6x8q7ZbOmbU+jxxbC26SfSaX0h3STOyd4nKC+jv2uVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6472.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhnSUtTaVFnMU5EeFhNUzMzbklsSDBJOHBVcHpNQVBNOElCSWtaM0wzb2Vw?=
 =?utf-8?B?VVVoVlliL0lRckxnbnlPTTBnbThrV053bWQrbmhPSi9KQzI1K2lsVU9rRU9Y?=
 =?utf-8?B?dkNKTTRwVlAvQ202dUVUR1ozZU5GNU1rVExYY0FrRjdObGk2K3lwa0tSK1Fv?=
 =?utf-8?B?RzZVYnpNdFhPT1F1bUZmakdFODdqM2xMd000S1U2c2dGODdCb3VEbVpUUU1Q?=
 =?utf-8?B?UkZtYkM0dVRpKzRoUE5EbDQvTkp3MVBoUk84MVVaOGNwT1UyMU9DRWZxY1NT?=
 =?utf-8?B?YmZZa2ZIUzVUOTNCbVVoM1AxejJReEc5NzFnOUVENFIwdlpGMXRDS3FTTHJp?=
 =?utf-8?B?c3hJZlc1bWE4cmdOWDh4ZnRUbDM2d2lLZ1lIeFpjR0FleVdEb28wdU96dzJu?=
 =?utf-8?B?eWJocFBJV2xFSHErWkM1Q2h0emZ3UnVkR2JyWWF0VTZTTDF6UHBqN1Z3Zmpz?=
 =?utf-8?B?ZGFUWjlhQ3FyV0I5cWUxeVpEcEZ4Z0N6Ykdnay9oQ2xFb1ZtSmp0NHYwVVBV?=
 =?utf-8?B?MExtUHFWVnNNQk8zc2kvUENOV0dxMHVnNVJncXRDd1ZjbnJyRlZhWXNBYUUv?=
 =?utf-8?B?cFEzZUYveHJGbWFvLzNPR0l5VVhvTnphcmdQd2ZqNFN2Z2p4cTBoNm5IWE9D?=
 =?utf-8?B?S1lpSG9WTXRzNDBQekpDd090MXBCeXU5S2gzejk0YmdNWjZoNXBoTWNYU1d3?=
 =?utf-8?B?Qis0SnFySThZakdITkZ0NzVoT3VHbE1WdFcxTkVPdURpNlN4MEZPb3gvMGhY?=
 =?utf-8?B?aHF4dFMwNmlSTmh5Yk91RjlMRzE2NkdGMFNCWWZNTzF3dUU3RFBBdk5QQTBt?=
 =?utf-8?B?THJHbXZWL3paMjBRWGo3VW1KN2xvRlArY2VhSmZRQzZLeUpUSjJJQmRuWXBk?=
 =?utf-8?B?TGNMbGF3SVdsRDhnWkRLVWtRVmRQaWNoN25XYU1LQ0dDM096SkNsb1pQQTA0?=
 =?utf-8?B?bjlkb0dyQmJ0eDluRnF5WDF3S2FKcE9rZzB2SC9Gcmk2RkhOWVlZb0E2VVg2?=
 =?utf-8?B?TTdqbmwyY29tUjNJeVh1RThjRzNaa3FVaVZ1bWVpcWh3VDRRWXVvSnI1azdj?=
 =?utf-8?B?em0wK0hlTUhDYlp0TkRDL3lvbXZjY2ZodlpUZUlBSDNTc2d5dUhGaUlIZVdn?=
 =?utf-8?B?cDJxZGRic1F2M1FEWUZDK3pDR3QvVmsydTFveEg2RmVTTVlNdHpQQWpVcldH?=
 =?utf-8?B?dGVleWZIRHkzNVJ2YmphMEdiTFV2cWdTNWQyVDM4SEY3eUpObm0rWWJySnpm?=
 =?utf-8?B?WGZ5OElMQkhNbW52azVXbUVvSmpTSGJSR0pRSzNZUnN2a3U5TlhqOHpDU1Nu?=
 =?utf-8?B?M29RZlk3aVZ2Wkc5eUxlTWFwMDl6RFYwbjFKQmFiMlJtRXJORkFvd2pDbzUz?=
 =?utf-8?B?ZnlISW1scHhmVGFNVzE5L2JkZUVMalJTdkdMVzI3WFFOdFhJWVRoWm9WbCt1?=
 =?utf-8?B?UTl4R3lYMVJpeVBuNU1rNi81bDFDTWVhZTdQL3F1YUJMK0xiYlVJeUNOOXVX?=
 =?utf-8?B?ckhXQjBoMU93bC9mdmpSeUg3YkJJOERnaTE5SXhCTHdsMkdlWVBBREtwQkR3?=
 =?utf-8?B?UVZwKzRCQXRpSUsxMXRXR01iQlpQVXdXbkRCM3UyRjc4RC9GaXV5Z2RqU1N1?=
 =?utf-8?B?Y2tMa055T0hPZk5ZZUdFczdaOVJxVWlNUFFkYTFaUk1IYlZvOExrOXUzc0ZX?=
 =?utf-8?B?Rzh4SzJ5TDZRQVREcEJjNzZRT3YraDhOb0xuekc4QzJNMUtqdnJzUU9wcC8w?=
 =?utf-8?B?cEFlNExVQ0xNRFphRER3SGMydGZBYzIzOHZYK0FadktrcTM5YlNLdEZHc0Vh?=
 =?utf-8?B?TGVobGRQelduWW1RSUpMVStoWGZGc1ZJT0REVWtWZFFGajRoditUNmoyL1Jj?=
 =?utf-8?B?cXY3Y3kydDAvSVNNWno3S3ptWmswYzNLbFg4OTF3T2o4b2xDdXV6eUhvSlE1?=
 =?utf-8?B?TTJsN3JVMlkwRHdNcDI0NmVyb0RxS2I4ZUNzeGlWdmRGdXZUbEhKeTZqSTQ5?=
 =?utf-8?B?M3kwL2dUeWVwRzhwaFhndGlMQWVsNWJHZmJEbm41M0FTem80TmJvRVhzNi9j?=
 =?utf-8?B?QzRnK1U3L0tBNjVPbUJiWHlhS2xXQ2t1aE5wb3dTeHNXMEQ1MnEvUm9XdFNY?=
 =?utf-8?B?cmtKWFFrUkdXUnpYNHBXTWdGWlRnSDR3UWt3YWNuNWlSazU2cjVrVWNpNXA0?=
 =?utf-8?B?dU1jWlNPZU9YZFV6T0swQlhJRCtDKzF3bHZEalNPSjNZVlAvVThnQWIvZ0Jh?=
 =?utf-8?B?cUlrRExXakMrM3lOYnBXOEJYRVZGbVV3TVVrWnpTdENFekloanp4aHEwQnND?=
 =?utf-8?B?dHFFNXVKOHdXZ2diL1NiYzA5Y2Y4T3lrc0NLQ0Y1YkhBSFh5cy9XQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a66409-c7e4-45ba-42c5-08def6f5b0d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6472.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:40:22.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71eXWvjvt/PAnXEWqY6KapE6yQbpSABIRRX1lnoQRmYcL6PSz/31uLp0C6hKVEQFvw/LxPEDjL7F6so/sF8Sew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9439
X-purgate-ID: tlsNG-ef75cf/1786376428-350CDAE4-5AD3C65B/0/0
X-purgate-type: clean
X-purgate-size: 258

On 8/6/26 17:26, Roger Pau Monne wrote:
> Introduce a specific check that prevents an accesses from spilling across
> two devices.
> 
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

