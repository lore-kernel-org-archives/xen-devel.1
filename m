Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B4E606A329
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 02:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=GsSfVc+e
Received: from list by lists.xenproject.org with outflank-mailman.1467560.1676647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhMo-00041e-Aw; Mon, 02 Nov 2026 02:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467560.1676647; Mon, 02 Nov 2026 02:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhMo-00041X-7x; Mon, 02 Nov 2026 02:01:46 +0000
Received: by outflank-mailman (input) for mailman id 1467560;
 Mon, 02 Nov 2026 02:01:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xNhMm-000411-Ks
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 02:01:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNhMl-0094En-LA
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 03:01:43 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7eef0-bab6-0a2a0a5309dd-0a2a4505ea3e-8
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:01:43 +0100
Received: from [52.101.70.96]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7ef07-4cb1-0a2a45050019-346546603cfe-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:01:43 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB9024.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:01:40 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:01:39 +0000
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
 b=swSSopLhIvFi5ZHiTIU7D1lVsf1r0ahD2X2oUKSJ2RJMdSaXDKzgpof80W0CCPTIFemXb2yuLC/1p8QEgE8pZOYq0MhU2MqA+Ma5DemtTLau0xe7WkKffuRWiwCQvREFMmgho79sWYB6WjPHTV/+t+T/6ptT3gqlJWcqB+WFOeNjBzMus73S2fie1ulctrEaNC2q6lARskqEgKosh2FjScFI1jTgkYQzSH30yQfkU93vfnoxM9gPBbtHUYWZP07+5Y5qXOOJiuuTIrK3YEPJpGyqUmJXuHHFFtmHwosB9VNW4XGNMG/t7mUJ2faDiWpwn0xDNTfIGOtn7IIJy1DUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0i2NcLQP3mIPc/1lbOppxjZLclg7dWzx00nwjlw+k0=;
 b=cUNLduGqkUddahf3afnV4KAbonc/tsbEyDF0WDdWGIQi9IDG2IsaFEBCgQOz03nu5TjzvP8zKBziO2a4WorYK9+OH1/VsmbvNIUbOkvik2rLR7MbhI8pW+GkJ1g4ZEP4JFe5qtyQCO45rhhUbKm8/xU+WpksuKO3HyqcbZ3FRqOdCj0+bXYZRhl8axSQkq+QTLl9Zd38gGAfsF1eZzEnWJoCn8fXUmIo7Lh+3gLlCFyd3/e+rEfWh4WhWQRI8Ot+ftzI/3psZCRWZEYZiXZRx3kagixacJueDZrFqvo8KA8ZBm4lh8Fw5hTkv3u2wyFi1E62sXa+ZPjz90KIFoNyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0i2NcLQP3mIPc/1lbOppxjZLclg7dWzx00nwjlw+k0=;
 b=GsSfVc+eGvZh8pr39pFosNTeULrSfVErzeR2urpQv0xZHUpXoH29a7GiugzN34b7AwVF3QJDpScKDiJeZDRuI1zOpmpn7qiE2miZ7KO+3oFT6UWMvmz13L9DsZG88a+GTv+DQa3SQcy9gUbFZb9ro1jwEHQZTZFNOlVPYCyKFrJacpQzvtk/uo3W1Ykkiq+G7Ezp+FO9K8VAX5Qnpt/DpAhThtASZu5FVs8KZhAL001kiVTUCQJqoHSOVpqcZt0dZQpQ/aCYBmjzrP5v7YIIMrMkMFbJDoypC8UDmAqHfKBcfeQaCTjgDo/nh2gFBINFiUXvoPcPjW5hJL/jvyA4SQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <5ebce238-8bad-4fa5-9ba2-cb23e09f8752@epam.com>
Date: Mon, 2 Nov 2026 03:01:38 +0100
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v4 21/22] libxl/arm: Introduce domctl command for IOMMU
 vSID mapping
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <66d35a04bcde0c41050e61e194de4565d6fed045.1791328190.git.milan_djokic@epam.com>
 <37275fb7-d8c3-414f-ad72-8bd399310323@gmail.com>
Content-Language: en-US
In-Reply-To: <37275fb7-d8c3-414f-ad72-8bd399310323@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::35) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 4503d250-5672-41ca-a7d1-08df38853bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|4143699003|11063799006|5023799004|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	VGzJMoz6RSu6gSC4/SgbKUssFOQgFB6AbPOe1Bnr95rcWJZo8S8FftXM/WVK3FCwRjYXpNcTgWVdrLAjPjZpThlYrXaaZHGjAihGMzTelajDFqH9eGQI+AUyFuyi7MEXl1J+WbVcAWNC/hr031pwOIZkkdxH5K5jvkLQNQuKU6RLm240WE1fO9cx5zc3nnrTmMgm4lCiLAE+QiQmFuRyz0Vq6Hl6zb7ApmbG4Sjo4jhShTV9Yl8FVnCjh1zNYvEppLDpGCc15Kt+QAfrxqN9yENbLHhJg8/4rCeSPtsmlOuTwX5P4wQOB1Wd3KnpSVxszvX20coxZlJ++m9mfzBQqE5gjnfX5vRP80RKhxva8zxCwEzvn0tO2mmdM9mbZWibdUEZRDu7GRl0sKX7npir9ioXnhknAJFVR2Y68Zrz0apu7rpyg1w67WA6QiwZUDOJgQJ+0iEKLMxxwof78bI2Xe6gZrYzMgDGEYXP/Q81KIUEbvxgToLd4gGbYVuIN8VfmTu26622KB2zXBDHtzA3LUNMSzQn1GfxXq+dPQN4j7Ix5p4JLT0f3oc5DvX8vV9jK0nts+cFm5kJZOARr+P3fsV/NKMSckk209Pcv0dydK7k7qfuPdD9P46SM6/rSEf1jHIormohbXWo/jI/kd9g1RIsdZ/ZlIJQh2XE+fORRsU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2VKakRxUWxRY01odDQ2NlZTb2lGWWlSZjhiaVMybVlQM0p1b0VNOS9ZQnJM?=
 =?utf-8?B?Q0F6bnhub3kxU240TmdMSlltczhFVFhuNjNoM1lDbThvSVBOMWIyTnBYaEFO?=
 =?utf-8?B?VkF5ODJZWHdTbkpHdDlkOTVjTU02b0JIL3hOY2Z0blk0VllFKzd0TWJrTUFp?=
 =?utf-8?B?MXRIT0JhK0p6dEhpZ0ZwWlBWSGVDLzQ0WlV4dVFRTy9KaU5XclBZbUx0L3NT?=
 =?utf-8?B?K2pOZTEvVzAvendsaFlNQThUaXlpNm5xeUxJU0V1OTZnM3pFbzFBZHVubEpY?=
 =?utf-8?B?ZGg2T0FTeWR5V0l5UmlGdEo2QnZYcmEyUitFNyt2ZmZRMkErQjdDcWFJWlgy?=
 =?utf-8?B?bmdOTmZqN1B6MEU5V0Q0Z2tBSExBY3drNGJuL21LUGp5cnlOd25SZCtnd3Uy?=
 =?utf-8?B?eXdHMTdkUnQveHN3bU9KcDh3WVpvNThsZGo2d0R6dEttUldvQjdabU85cmly?=
 =?utf-8?B?UmRjaFJlYzNEdWlObHA3SFkvc0ZJc29sNU9JY29adDVUY0RTTHlIODZnS3ZO?=
 =?utf-8?B?US85a3JEZmFLc1ZLWTQya2pCNnRZRmg1YXoxZDlPaTh5VmZ2ZlNpc0o0b1Nj?=
 =?utf-8?B?T2F2QVZuUFhVYnFkb1RLQ1MrNGNpbjUzN0tkWFVLMU1xY1YvTm1rKzBvdnE5?=
 =?utf-8?B?ak5sb0VraWpKUkVTSUZpcXpkU3JnQUNxSytpaUwySldaTzYxaXd5V01UVUYx?=
 =?utf-8?B?eElXWlpNUWczUGRsTGR0UllRVWd2Z280WEdILzdOYkdLOWdUbG1maWltQ25J?=
 =?utf-8?B?Qm82UHdUR1RxZnVFOFNhN1N2Q1lyaXNiL0lLTVRNbjJmOXBoOUxjWjVZdnpu?=
 =?utf-8?B?UXJESnJNc1c4OVY3Wkl5a0p6OEc4OWNxVmdoa08yL1RvZS83QmpSYVlCWWV2?=
 =?utf-8?B?c0Q2ZVFyUFF0citLZ1haSklZVW9uckgxeGFlUXZoVmNEWEZZNEtkbGVkWEFE?=
 =?utf-8?B?SWE1VWZGdXdhNnc2MFNNM212Y3ZwdUlBaDIrVERxVndhWVp6R2ZrdHo4cElh?=
 =?utf-8?B?Ymg1V0g4TmdibGtqc0pORFVIcm9icUVNdk53ZjBLRFRvWnY3Uk1CRHVUWURq?=
 =?utf-8?B?NlRWMjlOWmZ6VmZuL2U5cFhzYlFxb1VKZHJBbk42SnBrcWsrMFgxWU1LZWUz?=
 =?utf-8?B?SEU4YVJXbzAwMFdoRitDdHliQmI5cnNKTVY3Z2Y3KzMxeUZCZXQ0ZWNzcmlB?=
 =?utf-8?B?R3pmcjV4bWh4S3ZoOVhzOHp6bXZ2K0VrdFBteHVYR0YrdjAxRWY1dGJZck1o?=
 =?utf-8?B?bU9tekhxYWVJbWFIMlJJZy9PYjMzZWtpcHhWb0JRRXpLcjVDaytJSzVMSWg5?=
 =?utf-8?B?ZkNWdDl0SVZ0Q1BtVHcrUDFYVVhmTU41RGJFbEdMamdMVWVTMWFHeXNHdkNC?=
 =?utf-8?B?bjVyQkEydzI0QmVvTTQ1TDk4UlNIY3VNaXR2aXlRMkllc2FCbDhKK3Ryd1NF?=
 =?utf-8?B?ejVGcXRNQVJlN1ErcnZSMm53TklpLzgremFpOENQVDVzVDhCM0g5TUVrZHQz?=
 =?utf-8?B?dmFqS1g0ZGVXWC8ra3pGSFpuOVdmV0lPK0d4ZnJjNXpFWFZ4OU9HeHl4RHFE?=
 =?utf-8?B?dk9MMEJJSExjd0FpcjU0SVZyUFUxVE11eWtEU0w5blJYOXd3TXlQdzcxZjJG?=
 =?utf-8?B?OXlNZHFoQTJTby85c2RWbExpbHFHY0FNTkNPOTBhaGwrWktrT0o5ZE1kWmZj?=
 =?utf-8?B?UGVOYVVrTkQrUDJRdXZxSGIveWZJUGtPUlNXSkdrcHFyRElzcDJBbCtGM1Bu?=
 =?utf-8?B?ODJrK1djeW1KZW1QdU1ObDM3N1d1dHJOQUVOOTYyemtwb0h6SHMrWUovR1R2?=
 =?utf-8?B?SmN4a1BIMmI3N3pUNGNUYlBvcDEyTHFuc3J2VXcyZkIzN1g0TmxhaGxIWlNX?=
 =?utf-8?B?M3VoVFhDTHdYUmUrTUhXekJSZmNESElueWtxMWM4MnN4S3pqOXFpYnNpSE1V?=
 =?utf-8?B?UzNMQm4xelQ0Q1pjT0Zjd2xhMEhiNHBMSXRESFFEOVE5UEtMUmt4YlBFakQ1?=
 =?utf-8?B?UkxGSjJhTlZFK3hVUTAxU2lrU1gyZVh1Ykd4WW5zNHRiSjNOTVdCZ1doM1Jh?=
 =?utf-8?B?OEtENWRzZWhheE1hbnhNNHpMYmwvUEJhYlptd2ZleDFLc3VzL05aMTZoQWth?=
 =?utf-8?B?Zm03Qy9qV1U2UVkvTDk4SXJsLzBtNnFTSUNhRlJTTkNXRDg4YjFSbmlaT0lE?=
 =?utf-8?B?VnpKbVhtOFpvOWMzcFBaVkZ6bktwakdETGtJaUcyNEF3NkY2Y3JodmZkRkc1?=
 =?utf-8?B?b00vYm92TEN3YXhOcGFoQlFjZWNhL3EvMEpXcTl3S2hJeEpJYTVwSkxvY0wx?=
 =?utf-8?B?NmIwVGVYS3RCVzM5ZmQvbEFrQVE0dUdIblc1WmtGWFRoLzNxeTIvZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4503d250-5672-41ca-a7d1-08df38853bb0
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:01:39.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0frsHxT9euYvVJz3MGNnI04Zt+c8SQ7a7R4xbnbAACCRFfpvxuv3lwIeYEM79v6xFzcxccCknYr2ALC0rLQEWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9024
X-purgate-ID: tlsNG-c201ff/1793584903-F50A22A1-CC28FF2F/0/0
X-purgate-type: clean
X-purgate-size: 15564
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksandr,

On 10/9/26 15:07, Oleksandr Tyshchenko wrote:
> [You don't often get email from olekstysh@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 10/7/26 03:07, Milan Djokic wrote:
> 
> Hello Milan
> 
>> For guests created via the control domain (xl, Zephyr xenlib), a partial
>> device tree is parsed and loaded on the control domain side.
>>
>> SIDs in the guest device tree have to be replaced with virtual SIDs that
>> are mapped to the corresponding physical SIDs. To do this, the control
>> domain requests Xen to allocate a new vSID and map it to the original
>> pSID for each IOMMU stream ID associated with a guest device.
>>
>> Introduce a new domctl command (XEN_DOMCTL_viommu_allocate_vid) that
>> allows the control domain to request a new vSID mapping and replace the
>> original pSID with the allocated vSID in the guest device tree.
>>
>> Implement vSID allocation in libxl using this interface for devices
>> configured behind an IOMMU.
>>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    tools/include/xenctrl.h             |  13 ++++
>>    tools/libs/ctrl/xc_domain.c         |  25 +++++++
>>    tools/libs/light/libxl_arm.c        | 107 +++++++++++++++++++++++++---
>>    xen/arch/arm/domctl.c               |  38 ++++++++++
>>    xen/include/public/domctl.h         |  22 ++++++
>>    xen/xsm/flask/hooks.c               |   4 ++
>>    xen/xsm/flask/policy/access_vectors |   2 +
>>    7 files changed, 202 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
>> index 9f00d4a19d..d38b365078 100644
>> --- a/tools/include/xenctrl.h
>> +++ b/tools/include/xenctrl.h
>> @@ -2664,6 +2664,19 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
>>                                 const uint32_t *llc_colors,
>>                                 uint32_t num_llc_colors);
>>
>> +/*
>> + * Allocate guest IOMMU vSID and establish its mapping to pSID.
>> + * It can only be used on domain DT creation.
>> + * Currently used for ARM only, possibly for RISC-V in the
>> + * future. Function has no effect for x86.
>> + */
>> +int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
>> +                                         uint32_t domid,
>> +                                         uint16_t nr_sids,
>> +                                         uint32_t first_psid,
>> +                                         uint32_t phandle,
>> +                                         uint32_t *first_vsid);
>> +
>>    #if defined(__arm__) || defined(__aarch64__)
>>    int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
>>                      uint32_t overlay_fdt_size, uint8_t overlay_op);
>> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
>> index 94cfab0fa1..0bd3e45fbd 100644
>> --- a/tools/libs/ctrl/xc_domain.c
>> +++ b/tools/libs/ctrl/xc_domain.c
>> @@ -2222,6 +2222,31 @@ out:
>>
>>        return ret;
>>    }
>> +
>> +int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
>> +                                         uint32_t domid,
>> +                                         uint16_t nr_sids,
>> +                                         uint32_t first_psid,
>> +                                         uint32_t phandle,
>> +                                         uint32_t *first_vsid)
>> +{
>> +    int err;
>> +    struct xen_domctl domctl = {};
>> +
>> +    domctl.cmd = XEN_DOMCTL_viommu_alloc_vsid_range;
>> +    domctl.domain = domid;
>> +    domctl.u.viommu_alloc_vsid_range.first_psid = first_psid;
>> +    domctl.u.viommu_alloc_vsid_range.phandle = phandle;
>> +    domctl.u.viommu_alloc_vsid_range.nr_sids = nr_sids;
>> +
>> +    if ( (err = do_domctl(xch, &domctl)) != 0 )
>> +        return err;
>> +
>> +    *first_vsid = domctl.u.viommu_alloc_vsid_range.first_vsid;
>> +
>> +    return 0;
>> +}
>> +
>>    /*
>>     * Local variables:
>>     * mode: C
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index daaa81f2aa..75c6f8efc5 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -1322,11 +1322,96 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt, void *pfdt)
>>        return 0;
>>    }
>>
>> -static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
>> +/*
>> + * Store virtualized 'iommus' properties for every node attached to IOMMU
>> + * and passthroughed to guest.
>> + * Used as a lookup table for mapping <phandle pSID> -> <vhandle vSID>
>> + */
>> +struct viommu_stream {
>> +    XEN_LIST_ENTRY(struct viommu_stream) entry;
>> +    char path[128];          /* DT path, stable across resizes */
>> +    fdt32_t *iommus;         /* fully virtualized iommus property */
>> +};
>> +
>> +static XEN_LIST_HEAD(, struct viommu_stream) viommu_stream_list;
> 
> 
> Looks like ^^^ is keyed only by DT path ...
> 
> 
>> +
>> +/*
>> + * Helper function which creates mapping of dt node to
>> + * to virtualized 'iommus' property
>> + * Mappings stored in a global 'viommu_stream_list' to
>> + * make it reusable for every fdt resize
>> + */
>> +static int viommu_get_stream(libxl__gc *gc,
>> +                             uint32_t domid,
>> +                             const fdt32_t *prop,
>> +                             int proplen,
>> +                             const char* path, fdt32_t **iommus)
>>    {
>> -    int nodeoff, proplen, i, r;
>> +    int i, r;
>> +    uint32_t vsid, psid, phandle;
>> +    struct viommu_stream *viommu_stream;
>> +
>> +    /* Lookup if stream for target device is already allocated */
>> +    XEN_LIST_FOREACH(viommu_stream, &viommu_stream_list, entry)
>> +    {
>> +        if (!strcmp(viommu_stream->path, path)) {
>> +            *iommus = viommu_stream->iommus;
>> +            return 0;
>> +        }
>> +    }
> 
>    ... a second domain with the same DT path gets the first domain’s
> cached vSIDs without any mapping being created for it. Is it ok?
> 
> 

You're right. The lookup should also take the domain ID into account. 
I'll updated the lookup to use both the domain ID and DT path.

>> +
>> +    /* Allocate new viommu stream */
>> +    viommu_stream = malloc(sizeof(struct viommu_stream));
>> +    if (!viommu_stream)
>> +        return ERROR_NOMEM;
>> +    memset(viommu_stream, 0, sizeof(struct viommu_stream));
>> +    viommu_stream->iommus = malloc(proplen);
>> +    if (!viommu_stream->iommus) {
>> +        free(viommu_stream);
>> +        return ERROR_NOMEM;
>> +    }
>> +    memset(viommu_stream->iommus, 0, proplen);
>> +
>> +    LOG(DEBUG, "Creating vIOMMU stream for device %s",
>> +        path);
>> +
>> +    /*
>> +     * Virtualize device "iommus" property
>> +     * (replace pIOMMU with vIOMMU phandle and pSIDs with mapped vSIDs)
>> +     */
>> +    for (i = 0; i < proplen / 8; ++i) {
>> +        /* Allocate new vSID mapped to pSID and physical IOMMU */
>> +        phandle = fdt32_to_cpu(prop[i * 2]);
>> +        psid = fdt32_to_cpu(prop[i * 2 + 1]);
>> +        r = xc_domain_viommu_allocate_vsid_range(CTX->xch, domid, 1, psid,
>> +                                                 phandle, &vsid);
>> +        if (r) {
>> +            LOG(ERROR, "Can't allocate new vSID/vRID for guest IOMMU device");
>> +            return r;
>> +        }
>> +        viommu_stream->iommus[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
>> +        viommu_stream->iommus[i * 2 + 1] = cpu_to_fdt32(vsid);
>> +        LOG(DEBUG, "Mapped vSID: %u to pSID: %u", vsid, psid);
>> +    }
>> +
>> +    strcpy(viommu_stream->path, path);
>> +    *iommus = viommu_stream->iommus;
>> +
>> +    XEN_LIST_INSERT_HEAD(&viommu_stream_list, viommu_stream, entry);
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * Used to update partial fdt when vIOMMU is enabled
>> + * Maps dt properties of IOMMU devices to virtual IOMMU
>> + */
>> +static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t domid)
>> +{
>> +    int nodeoff, proplen, r;
>>        const fdt32_t *prop;
>>        fdt32_t *prop_c;
>> +    char path[128];
>>
>>        nodeoff = fdt_path_offset(pfdt, "/passthrough");
>>        if (nodeoff < 0)
>> @@ -1340,11 +1425,16 @@ static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
>>            if (!prop)
>>                continue;
>>
>> -        prop_c = libxl__zalloc(gc, proplen);
>> +        r = fdt_get_path(pfdt, nodeoff, path, sizeof(path));
>> +        if ( r < 0 ) {
>> +            LOG(ERROR, "Can't get passthrough node path");
>> +            return r;
>> +        }
>>
>> -        for (i = 0; i < proplen / 8; ++i) {
>> -            prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
>> -            prop_c[i * 2 + 1] = prop[i * 2 + 1];
>> +        r = viommu_get_stream(gc, domid, prop, proplen, path, &prop_c);
>> +        if (r) {
>> +            LOG(ERROR, "Can't get viommu stream");
>> +            return r;
>>            }
>>
>>            r = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
>> @@ -1356,7 +1446,6 @@ static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
>>
>>        return 0;
>>    }
>> -
>>    #else
>>
>>    static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
>> @@ -1375,7 +1464,7 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt, void *pfdt)
>>        return -FDT_ERR_INTERNAL;
>>    }
>>
>> -static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
>> +static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t domid)
>>    {
>>        LOG(ERROR, "partial device tree not supported");
>>
>> @@ -1507,7 +1596,7 @@ next_resize:
>>            if (info->arch_arm.viommu_type == LIBXL_VIOMMU_TYPE_SMMUV3) {
>>                FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
>>                if (pfdt)
>> -                FDT( modify_partial_fdt(gc, pfdt) );
>> +                FDT( viommu_modify_partial_fdt(gc, pfdt, dom->guest_domid) );
>>            }
>>
>>            for (i = 0; i < d_config->num_disks; i++) {
>> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
>> index b76af56fad..dc21dc9fca 100644
>> --- a/xen/arch/arm/domctl.c
>> +++ b/xen/arch/arm/domctl.c
>> @@ -16,6 +16,7 @@
>>    #include <xen/types.h>
>>    #include <xsm/xsm.h>
>>    #include <public/domctl.h>
>> +#include <asm/viommu.h>
>>
>>    void arch_get_domain_info(const struct domain *d,
>>                              struct xen_domctl_getdomaininfo *info)
>> @@ -186,6 +187,43 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>        }
>>        case XEN_DOMCTL_dt_overlay:
>>            return dt_overlay_domctl(d, &domctl->u.dt_overlay);
>> +
>> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> +    case XEN_DOMCTL_viommu_alloc_vsid_range:
>> +    {
>> +        int rc = 0;
>> +        uint16_t i;
>> +        uint32_t vsid;
>> +        struct xen_domctl_viommu_alloc_vsid_range *vsid_range =
>> +            &domctl->u.viommu_alloc_vsid_range;
>> +
>> +        if ( vsid_range->pad )
>> +            return -EINVAL;
>> +
>> +        for ( i = 0; i < vsid_range->nr_sids; i++ )
>> +        {
>> +            rc = viommu_allocate_vsid(d, vsid_range->first_psid
>> +                                          + i,
>> +                                          vsid_range->phandle,
>> +                                          &vsid);
>> +            if( rc )
>> +                return rc;
>> +        }
>> +
>> +        if ( !rc )
>> +        {
>> +            /* Calculate first vSID from allocated range */
>> +            vsid_range->first_vsid = vsid -
>> +                vsid_range->nr_sids + 1;
> 
> With vsid_range->nr_sids == 0, vsid stays uninitialised and garbage is
> copied back to the caller.
> 

Good catch. I'll reject zero-sized vSID allocation requests to avoid 
returning an uninitialized vSID.

> 
>> +            rc = copy_to_guest(u_domctl, domctl, 1);
>> +            if ( rc )
>> +                rc = -EFAULT;
>> +        }
>> +
>> +        return rc;
>> +    }
>> +#endif
>> +
>>        default:
>>            return subarch_do_domctl(domctl, d, u_domctl);
>>        }
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index 510300bb67..2708215d5b 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -1279,6 +1279,26 @@ struct xen_domctl_get_domain_state {
>>        uint64_t unique_id;      /* Unique domain identifier. */
>>    };
>>
>> +/*
>> + * XEN_DOMCTL_viommu_alloc_vsid_range
>> + *
>> + * Allocate guest vSID range and
>> + * establish pSID->vSID mapping for target range and physical IOMMU (phandle).
>> + * Allocated range is continous
>> + */
>> +struct xen_domctl_viommu_alloc_vsid_range {
>> +    /* IN: Range first pSID  */
>> +    uint32_t first_psid;
>> +    /* IN: Physical IOMMU phandle behind which the target device streams are configured */
>> +    uint32_t phandle;
>> +    /* IN: Number of vSIDs to allocate */
>> +    uint16_t nr_sids;
>> +    /* padding, must be 0 */
>> +    uint16_t pad;
>> +    /* OUT: Mapped range first vSID */
>> +    uint32_t first_vsid;
>> +};
>> +
>>    struct xen_domctl {
>>    /* Stable domctl ops: interface_version is required to be 0.  */
>>        uint32_t cmd;
>> @@ -1371,6 +1391,7 @@ struct xen_domctl {
>>    #define XEN_DOMCTL_gsi_permission                88
>>    #define XEN_DOMCTL_set_llc_colors                89
>>    #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
>> +#define XEN_DOMCTL_viommu_alloc_vsid_range       91
>>    #define XEN_DOMCTL_gdbsx_guestmemio            1000
>>    #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>>    #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
>> @@ -1439,6 +1460,7 @@ struct xen_domctl {
>>    #endif
>>            struct xen_domctl_set_llc_colors    set_llc_colors;
>>            struct xen_domctl_get_domain_state  get_domain_state;
>> +        struct xen_domctl_viommu_alloc_vsid_range viommu_alloc_vsid_range;
>>            uint8_t                             pad[128];
>>        } u;
>>    };
>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index d65ba0aeae..6321b4308b 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -881,6 +881,10 @@ static int cf_check flask_domctl(struct domain *d, struct xen_domctl *op)
>>        case XEN_DOMCTL_set_llc_colors:
>>            return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_LLC_COLORS);
>>
>> +    case XEN_DOMCTL_viommu_alloc_vsid_range:
>> +        return current_has_perm(d, SECCLASS_DOMAIN2,
>> +            DOMAIN2__VIOMMU_ALLOC_VSID_RANGE);
>> +
>>        default:
>>            return avc_unknown_permission("domctl", op->cmd);
>>        }
>> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
>> index bbb9c117ec..35acbefab2 100644
>> --- a/xen/xsm/flask/policy/access_vectors
>> +++ b/xen/xsm/flask/policy/access_vectors
>> @@ -253,6 +253,8 @@ class domain2
>>        set_llc_colors
>>    # XEN_DOMCTL_get_domain_state
>>        get_domain_state
>> +# XEN_DOMCTL_viommu_alloc_vsid_range
>> +    viommu_alloc_vsid_range
>>    }
>>
>>    # Similar to class domain, but primarily contains domctls related to HVM domains
> 


