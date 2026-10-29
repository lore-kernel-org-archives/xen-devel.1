Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7844606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 19:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=dfWFNBi4
Received: from list by lists.xenproject.org with outflank-mailman.1465131.1675951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMVmm-0006Kr-U8; Thu, 29 Oct 2026 19:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465131.1675951; Thu, 29 Oct 2026 19:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMVmm-0006Kk-RE; Thu, 29 Oct 2026 19:27:40 +0000
Received: by outflank-mailman (input) for mailman id 1465131;
 Thu, 29 Oct 2026 19:27:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xMVml-0006Ke-6f
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 19:27:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMVmk-00C5Qq-JZ
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 20:27:38 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae39e1e-2eae-0a2a0a5409dd-0a2a450bd60c-10
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 20:27:38 +0100
Received: from [40.107.130.120]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae39e2a-b7e8-0a2a450b0019-286b8278d7eb-4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 20:27:38 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DUYPR03MB11922.eurprd03.prod.outlook.com (2603:10a6:10:65e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 19:27:36 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 19:27:36 +0000
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
 b=xkT3RwH3R0hHn0HEbPK4b9nURvBMkUbGaScMBJnaYuP7IgxelSTeJYp8eqic0bYJxcAQLzByJQm2Rfhs2gHI9MqyRpX3DRTpG0vFjn79oLdkQZoSVlczEG8ClYBODXkKiUX4ZwsXC9ggltFJhkYReFWVoGrAM5p74NvFY/ZrslY4ErNQve0iAHJ58yzjhl6jha1ltp1WKdNpMNO68vbuj6kGIwNFI68/+l9y2ycKhWhVJAzLh+GqVk5rTzOCDF5nh4B4YHVSymntLHuCF0khlEVwE22nNwZrZgzzbeZel2xLTIltwrOdxetLryeYXrdDwj3faSwtVikFbiZFuavHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMOOoi/2V/gj3TsEc/zqK5Uepp76ImBE5Ty5GnJqJBo=;
 b=B+rMQS7vy3VT8jaKERoOyf93Zfx7blXoefON1wEXH4hlHNOnkydPujVUKMAJz77xsWU9lPlzeTlgL/qgB8x11ecObJravBSIGgrEGf3UvH4NRQVdbW+eK94nDVx7YiGVuKy/KDvYopSbNXrmmJi5HQQsFofDLCZQXNBIi33f2ekh79ezPeVeieD2Gsdf7hQKZpq7W5ZzQ0RWqpNvphldRQz92UirplNc4dLk/e2QSnrlQBFdRJFTqTa3Eg0oAuoR6Fgln5Wy6JGyd6MeffisiH70fOahdfsYAqnxM0DHowEKtL9mx8sX90YL48zji5fEKpozM3ZduvFeKf4oiN647A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMOOoi/2V/gj3TsEc/zqK5Uepp76ImBE5Ty5GnJqJBo=;
 b=dfWFNBi46VS6d+UXBBiWw7HSf787xk8mrl36l33Z2DeGYyTFDih066Nf+kdBcpGd/oaFZb6FVlG6IPGy9uaQRohSnL4t9Qi2LoDmVfMJuVPu2FwgYd4XVhSvBPxZtfCVBlDKifK/6NVFfCmgB2fAObcGmINKYfsU1UJZyJr/L/p3xalvxdFolaIH5O7mmMZqrJ4NMy3FavdfUQwoY7+8BXi2bL3/46eKKRa3qH0F13GT89xEmSq6CDXV227Bxq6QFAEYwwtk54GuHflAj4cCpuR7k9xmX7ihincmvX2sS/Bkr1nH2yfvnzaymhy9VNgWsFynTimilvWGOGp7q0TsVA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <48e32e1b-67ad-47ed-8ca6-42854a572d52@epam.com>
Date: Thu, 29 Oct 2026 20:27:34 +0100
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v4 11/22] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <4f83a0ee7f46e19c6afec3460a2a7e1bbe8e3c1a.1791328190.git.milan_djokic@epam.com>
 <84d8b1c8-f716-41bf-82f7-fdfdb6207c04@gmail.com>
Content-Language: en-US
In-Reply-To: <84d8b1c8-f716-41bf-82f7-fdfdb6207c04@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0027.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::7) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|DUYPR03MB11922:EE_
X-MS-Office365-Filtering-Correlation-Id: db983050-4dd7-430e-4c73-08df35f2b024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261028144727099003|4143699003|11063799006|261022105027099003|56012099006|261009223027099003|261021121427099003|261026140227099003|261026121527099003|10067099003|261022075727099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nCaAWgw/aYkSwm8CS594SYcHcLF+uR89FDZQ7V/BLPR0L+VsI6LhMihM/2qYJJRrxaTveSJaQUhfUjJLljJvYghBFpgbpLNHLHk+UmrcTZwBjCBvfPoV7C7DahmRFiy01SKUE7RZz6LeYkAeIUzRITay989EW3PhdT4LbmurK5rJob3kzftsN7k+BZeEflufzjMN8+mJlyJy8067DSiVmpxL5eJX5oP9c9VAO54sax+DnLOeyfR4WxGnIBYioWbiQI2nTECi5ELX884qAMABVbU8Dk6yUF6O5hHg6UH87uCC+tqs3jpqFWkP8mozBZr8zx2nMWJZc0r7NdsJcLxeoh3M9oP0eDfFweu826d/HpDu2ezXwwxFcQevumR3YO0n4sy3NyL8hBaN9OuI/qC0NrdgBPQaU5NLKw8UFxVvaEA55KbHZ4bToaGBBdhuemr7NjJZnKz71Jdtke1rhhTPC/vdw7X8Ff5A5TgPJ51iFqwNGqXD9HDrkAeuDYdxc27FVcp7luYsFOHNnbGV44kFQmOP9q4rDzEFKXU+uEkw0T7cBsoYBzUCJaySFKKLgeLgXyMfLpUp2DXWOynZ7jFYlcrPlaOiBes+l/GLvQZnZkw9powfdC2gJhLUDDV0uylPWFZs7yZNd1CIICLMUcgQK8viJ7n7SCtoPZrYxyqntj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261028144727099003)(4143699003)(11063799006)(261022105027099003)(56012099006)(261009223027099003)(261021121427099003)(261026140227099003)(261026121527099003)(10067099003)(261022075727099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzBUeHdCYVo4WEdST1R3TkQrM2hHNlA3d201cVRNU09nMTZNanpleHlhNlNm?=
 =?utf-8?B?UjQ0Y1FaSkpiY3c4VG5NM1lKRWVaTGdvN0M1MUxpNk55SUQ0QUxUM2h6blZo?=
 =?utf-8?B?eUNGN3J1Mk9Zckp5Rk9IbWo2aGxOODY3ZHRZMDErUC9HUjRBZFl0WkVFVFRq?=
 =?utf-8?B?bVhubCsrZTVJd2FUOFJVQmQrNTc3Ym42Y0pHU2RBZzVNR25va3hCWGV1bXZs?=
 =?utf-8?B?MWVXQjkzR2FiTm1TcE0vS0FWS0lRSW9KazlWd2RtWVlPVFE3ZEJoZHg5TUxs?=
 =?utf-8?B?UWZ4TXJmc1h5SCt0TFlxVXpPRUFzTnBFUUlmOWthN3NJUGM5TlFXOGJDVHli?=
 =?utf-8?B?dTN0L0VETVhaaWFLT01weW1aWk9SM1JXQnpyTnBqQmxGSDh0TVo0RHRqdndu?=
 =?utf-8?B?TW9McTkzZEhxRVlMNWlwQnAraGtTTGIzaVZUNkpLK3hEV1RNNUJtUXpWUURZ?=
 =?utf-8?B?T2xadFVWYTl2ZFlUckFPTDJHcktOOFovZWE4M0hKeUdGK21MSDNybEcvbks4?=
 =?utf-8?B?dVVCeXJrWmg4cTJUNzRveS9QSHZFVko5ZFVieDR2OGhoR3ZRUGVVSTllZlVG?=
 =?utf-8?B?OGdYWkQwdDgxQ0sxZjdzdGdubVhkK0wwRWFRWmhUUHFreHYyTURna2ZjMlhp?=
 =?utf-8?B?azJEUW5PeU1XRGJGd3ZaaFBzUTJuRUNiUDBLMXNXNFRLWE1FTXpQTTlGVVJM?=
 =?utf-8?B?aWkxaC92TVhxOHNQeGZGUjBBYjFDdlNKRTVUdUdxVzE4MXJoRENyeStKSzUw?=
 =?utf-8?B?d0l5V25RSnd2MExNbjdGQkk5U2ovc29rZ0hULzc4dGptZ0JsRFhxRWxITHVh?=
 =?utf-8?B?RjRsTFFEaTluLzgwaWhvU29LYWtxZTg3emJxZjNHeElWcSt3UWkydm0rYTNS?=
 =?utf-8?B?WEdDUG16djJUUnB5Y2RFN2F1YjdFWnBYeFlKc24xajB5N2lxS213dEFMTDBU?=
 =?utf-8?B?SEFiQ000eEY4ckx0SllxMkVFclY0WktQcTM3S2RsN1FaS0EybjFIWWhJL04x?=
 =?utf-8?B?NDIwYndtWmtKSkhoMzNwazZlajA3bVNHSUNuWHVXRGlzWFlWVGRpeG8rN0h3?=
 =?utf-8?B?d0NzdWhSUU9Ua21wVlZDUHhLaGdPcnZKNzcvSUxqVkF4NVFacUFCcGFoRE5R?=
 =?utf-8?B?Q1Q2QWRjbk9NYUw5eS9Obm5nS0loMVhHNTBYa2p5YjRiZVhuQzVtZk9jbjhj?=
 =?utf-8?B?TTNtUmtvQVFla2k2ZXlkOFRGTld3MDFnZHlJdmpzdnppM3g0bFpSd1BsRkVG?=
 =?utf-8?B?YTB4TGk0SFF5djFTS0wvZUxCK3N6YmdJT3NBaGlxU29NWEFIM2ovcFFsaitq?=
 =?utf-8?B?VEROVnJScmJ3dWNEZE5IZjhmd1YwRmxNeUZna0pyVVJtZmM1N0MzM3M4OVRX?=
 =?utf-8?B?c3libWVsR3pPZnJSRmxMaVB6SGJ2bUl6NnB6eUVXcUttT0lWdVBubitMcm5k?=
 =?utf-8?B?VU1WY2FxaEIrL05SMndVNXY0SXJYTThUWjBER3E2QjdoZHEvbVp1VG1RN0k1?=
 =?utf-8?B?ZGVISFpHV0tsWnZzeUhHWjIxaWp1VW5tT2I1bU1FL1llT2dBRmZIeCsyUTZE?=
 =?utf-8?B?b1RLL3czdDZaVHl5SlZZazFLUnY0cWkxMkdyZXBvU2tVYk1CUE1kQWFDRHY5?=
 =?utf-8?B?bG9BZGRVWkIyMy9KcnFkRlJkeHkrY3d4bWNOR1lGdHFoVTNaREF3aWVvWDJy?=
 =?utf-8?B?d2piRUdtOXAyeWcyck83ekpZVzJZQVl0T0h4b21IRzBtTGhaYUYwUnVXOTk1?=
 =?utf-8?B?dEhkQS83UEZwOWlpSnFGWVozRzQwVzRxL3N2VVlSK1g1UU1tSWp4MXdsc0lj?=
 =?utf-8?B?RlRlT0FTY09yWVdqUHVsSkp1QkVPQ3o4Rkl0aGI5OHg5SjdiWVFTU0N3OHF1?=
 =?utf-8?B?VktudnFqYy94bXNTOThXMW5FVFgzbUxTMERKSXlMbHFETXhXNnVmZjdYK0FZ?=
 =?utf-8?B?MVhGcUppM2dwdFlaSzJUSVhyeStMVklKZmNWR2ZXRlNPK29CNUlhSStvUXNZ?=
 =?utf-8?B?QzdMY3NlTnlwYXJENXU5OTgxVWpnVWNXdXRWYkJDSEVTcTRiTFFIaVZyWG01?=
 =?utf-8?B?a3ZWaUU2STAyTnE2bnMrWnBmZUpkMkU5VktCNUJ4Sm8rOUdEdzkxS2JtamM2?=
 =?utf-8?B?bjNPOE9QZThucDg3clNNcW8xMWI5NzFBdG8xOUJhQVhIYnkxVnB0WTdCUVdh?=
 =?utf-8?B?U3NDRUtyNVEwV3NleVBsU2hmRkV1TTl4MTNMOFBSYWtISjVCZGpGM2daYkgx?=
 =?utf-8?B?VXhmQWtpSlZ5Uk1IWUExVEV6NzJHdHRGZ2k2R3lCVXdMTEhSMy8zd0lmY2xt?=
 =?utf-8?B?WStac29xelBRMmdMVVRnVFZ5K1lMR1cyRWp3VE5CUkx1VmJ1Q2tRUT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db983050-4dd7-430e-4c73-08df35f2b024
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 19:27:36.6143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFWUWFp5gjXiVwTcHRBYy98apsQ5OPXtC8qlW829YKdXqqreWdvihEVgcWj1NqM1ms3b4WEj5rw0e4Zk+UYzNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR03MB11922
X-purgate-ID: tlsNG-42698a/1793302058-A8ECE9EA-5A068D2D/0/0
X-purgate-type: clean
X-purgate-size: 12805
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksandr,

On 10/10/26 16:47, Oleksandr Tyshchenko wrote:
> 
> 
> On 10/7/26 03:07, Milan Djokic wrote:
> 
> 
> Hello Milan
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Attach the Stage-1 configuration to device STE to support nested
>> translation for the guests.
> 
> My review of this is based on the full series being applied and includes
> the surrounding code context.
> 
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/arch/arm/include/asm/iommu.h       |   7 ++
>>    xen/drivers/passthrough/arm/smmu-v3.c  | 105 +++++++++++++++++++++++++
>>    xen/drivers/passthrough/arm/smmu-v3.h  |   1 +
>>    xen/drivers/passthrough/arm/vsmmu-v3.c |  18 +++++
>>    xen/include/xen/iommu.h                |   6 ++
>>    5 files changed, 137 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/iommu.h
>> index ad15477e24..56bc9314a7 100644
>> --- a/xen/arch/arm/include/asm/iommu.h
>> +++ b/xen/arch/arm/include/asm/iommu.h
>> @@ -20,6 +20,13 @@ struct arch_iommu
>>        void *priv;
>>    };
>>    
>> +struct iommu_guest_config {
>> +    paddr_t     s1ctxptr;
>> +    uint8_t     config;
>> +    uint8_t     s1fmt;
>> +    uint8_t     s1cdmax;
>> +};
>> +
>>    const struct iommu_ops *iommu_get_ops(void);
>>    void iommu_set_ops(const struct iommu_ops *ops);
>>    
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index 9d2b8a708b..196ac660ef 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -3003,6 +3003,37 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev)
>>    	return NULL;
>>    }
>>    
>> +static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
>> +				u32 sid)
>> +{
>> +	int i;
>> +	unsigned long flags;
>> +	struct iommu_domain *io_domain;
>> +	struct arm_smmu_domain *smmu_domain;
>> +	struct arm_smmu_master *master;
>> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>> +
>> +	/*
>> +	 * Loop through the &xen_domain->contexts to locate a context
>> +	 * associated with the target SMMU and device SID
>> +	 */
>> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
>> +		smmu_domain = to_smmu_domain(io_domain);
>> +
>> +		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>> +		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
>> +			for (i = 0; i < master->num_streams; i++) {
>> +				if (sid != master->streams[i].id)
>> +					continue;
>> +				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>> +				return io_domain;
>> +			}
>> +		}
>> +		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>> +	}
>> +	return NULL;
>> +}
>> +
>>    static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
>>    				struct device *dev)
>>    {
>> @@ -3216,6 +3247,79 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>>    	xfree(xen_domain);
>>    }
>>    
>> +static int arm_smmu_attach_guest_config(struct domain *d, uint32_t sid,
>> +		const struct iommu_guest_config *cfg)
>> +{
>> +	int ret = -EINVAL;
>> +	unsigned long flags;
>> +	struct arm_smmu_master *master;
>> +	struct arm_smmu_domain *smmu_domain;
>> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>> +	struct iommu_domain *io_domain = arm_smmu_get_domain_by_sid(d, sid);
>> +
>> +	if (!io_domain)
>> +		return -ENODEV;
>> +
>> +	smmu_domain = to_smmu_domain(io_domain);
> 
> 
> I might be wrong, but it feels to me that io_domain should be fetched
> after acquiring the lock below since concurrent deassign can free the
> io_domain. arm_smmu_deassign_dev() takes xen_domain->lock, decrements
> io_domain->ref, and if it hits 0, calls arm_smmu_destroy_iommu_domain()
> which frees the memory.
> 

Yes, you're right. I'll update this.

>> +
>> +	spin_lock(&xen_domain->lock);
>> +
>> +	switch (cfg->config) {
>> +	case ARM_SMMU_DOMAIN_ABORT:
>> +		smmu_domain->abort = true;
>> +		smmu_domain->stage = cfg->config;
>> +		break;
>> +	case ARM_SMMU_DOMAIN_BYPASS:
>> +		smmu_domain->abort = false;
>> +		smmu_domain->stage = cfg->config;
> 
> I am not quite sure where the best place is to leave this comment, but
> unless I am missing something, it looks like a guest can trivially
> disable stage-2 translation.
> 
> If the guest requests CFG_BYPASS, arm_vsmmu_decode_ste() sets bypassed
> and guest_cfg.config becomes ARM_SMMU_DOMAIN_BYPASS.
> arm_smmu_attach_guest_config() then sets that stage. Consequently,
> arm_smmu_write_strtab_ent() finds neither s1_cfg nor s2_cfg and writes
> the physical STE as CFG_BYPASS, which bypasses both stages.
> 
> So any device the guest puts in bypass (which Linux might legitimately
> do for identity domains) can read and write any physical memory,
> including Xen’s memory. Even for well-behaved guests, this is
> problematic: the device would use IOVA (which equals IPA) directly as a
> host physical address instead of going through the domain’s P2M.
> 
> I think that guest bypass request should map to S2-only physical STE.
> 

Thanks for catching this. You're right, a guest BYPASS request should 
bypass Stage-1 while retaining Stage-2 translation. I'll update the 
handling to reuse the existing Stage-2 configuration and install the 
physical STE as CFG_S2_TRANS.

> 
>> +		break;
>> +	case ARM_SMMU_DOMAIN_S1:
>> +		/* Check stage-1 support */
>> +		if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_TRANS_S1)) {
>> +			dev_info(smmu_domain->smmu->dev,
>> +					"stage-1 not implemented\n");
>> +			goto out;
>> +		}
>> +
>> +		/* If stage-2 is not supported, configure stage-1 only */
>> +		if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_TRANS_S2)) {
>> +				dev_warn(smmu_domain->smmu->dev,
>> +						"SMMU does not implement stage-2 translation support. "
>> +						"Fallback to stage-1-only translation configuration\n");
>> +			/* Enable Stage-1 translation. */
>> +			smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
> 
> As I already mentioned for commit #02/22, Without stage-2 there is no
> layer to turn the stage-1 output's IPA into PA. Should we allow this
> fallback only for privileged, direct-mapped domains?
> 
> And apologies if this has already been discussed.
> 

Yes, I'll update this to be handled during vIOMMU initialization for the 
domain. If vIOMMU is enabled for a non-direct-mapped domain when the 
physical IOMMU supports only stage-1, the configuration shall be rejected.

> 
>> +		}
>> +		else {
>> +			/* Check nested support */
>> +			if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_NESTING)) {
>> +					dev_info(smmu_domain->smmu->dev,
>> +							"Nested translation not supported\n");
>> +					goto out;
> 
> According to commit #07/22 "MMU-600 variant < 2 and all MMU-700" are
> affected. But it seems that Xen still offers SMMU, a guest still sees
> SMMU and might believe it is working. The attach fails with only a log
> line (gdprintk in arm_vsmmu_handle_cmds()) and the guest is never told.
> Device DMA then might land in the wrong guest memory.
> 
> Please consider gating this at viommu_get_type() or at domain creation.
> 

Agreed. I'll update the vIOMMU initialization to reject the 
configuration if the hardware supports both Stage-1 and Stage-2 
translation but does not support nesting. The same approach should apply 
when Stage-1 translation is not supported by the hardware.

> 
>> +			}
>> +			smmu_domain->stage = ARM_SMMU_DOMAIN_NESTED;
>> +		}
>> +
>> +		/* Enable Stage-1 translation. */
>> +		smmu_domain->s1_cfg.s1ctxptr = cfg->s1ctxptr;
>> +		smmu_domain->s1_cfg.s1fmt = cfg->s1fmt;
>> +		smmu_domain->s1_cfg.s1cdmax = cfg->s1cdmax;
>> +		smmu_domain->abort = false;
> 
> Since all this stored per smmu_domain, one domain-wide S1 config
> (bypass, abort, context pointer) is applied to all of device’s SIDs
> (from the design doc I got this as intentional for current driver
> implementation) ...
> 
> 
>> +		break;
>> +	default:
>> +		goto out;
>> +	}
>> +
>> +	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>> +	list_for_each_entry(master, &smmu_domain->devices, domain_head)
>> +		arm_smmu_install_ste_for_dev(master);
> 
>    ... ^^^ loops over all masters and applies the identical config to all
> of them. If, lets say, a device (PCI?) exposes several SIDs, and the
> guest tries to program SID 0 with one mappings and SID 1 with a
> different mappings, the second command will silently overwrite SID 0's
> mappings.
> 
> I do not want to ask for extra work, but should Xen at least report an
> error when a guest programs different configs, rather than silently
> overwriting the previous one? Or at least leave a TODO?
> 

Yes, this is a limitation of the current implementation. The Stage-1 
configuration is stored per smmu_domain and shared by all SIDs belonging 
to its masters. I'll add a TODO to make this limitation explicit.
PCI Stage-1 support will be addressed in a follow-up to this series, 
which should be a suitable place to handle this limitation.

> 
>> +	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>> +
>> +	ret = 0;
>> +out:
>> +	spin_unlock(&xen_domain->lock);
>> +	return ret;
>> +}
>> +
>>    static const struct iommu_ops arm_smmu_iommu_ops = {
>>    	.page_sizes		= PAGE_SIZE_4K,
>>    	.init			= arm_smmu_iommu_xen_domain_init,
>> @@ -3228,6 +3332,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>>    	.unmap_page		= arm_iommu_unmap_page,
>>    	.dt_xlate		= arm_smmu_dt_xlate,
>>    	.add_device		= arm_smmu_add_device,
>> +	.attach_guest_config = arm_smmu_attach_guest_config,
>>    };
>>    
>>    static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
>> index ef492098ae..4a912be740 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.h
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
>> @@ -402,6 +402,7 @@ enum arm_smmu_domain_stage {
>>    	ARM_SMMU_DOMAIN_S2,
>>    	ARM_SMMU_DOMAIN_NESTED,
>>    	ARM_SMMU_DOMAIN_BYPASS,
>> +	ARM_SMMU_DOMAIN_ABORT,
>>    };
>>    
>>    /* Xen specific code. */
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index 25ba734fa7..3f557d1c4d 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -319,8 +319,11 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>>    {
>>        int ret;
>>        uint64_t ste[STRTAB_STE_DWORDS];
>> +    struct domain *d = smmu->d;
>> +    struct domain_iommu *hd = dom_iommu(d);
>>        struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
>>        uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
>> +    struct iommu_guest_config guest_cfg = {0};
>>    
>>        ret = arm_vsmmu_find_ste(smmu, sid, ste);
>>        if ( ret )
>> @@ -330,6 +333,21 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>>        if ( ret )
>>            return (ret == -EAGAIN ) ? 0 : ret;
>>    
>> +    guest_cfg.s1ctxptr = s1_cfg.s1ctxptr;
>> +    guest_cfg.s1fmt = s1_cfg.s1fmt;
>> +    guest_cfg.s1cdmax = s1_cfg.s1cdmax;
>> +
>> +    if ( s1_cfg.bypassed )
>> +        guest_cfg.config = ARM_SMMU_DOMAIN_BYPASS;
>> +    else if ( s1_cfg.aborted )
>> +        guest_cfg.config = ARM_SMMU_DOMAIN_ABORT;
>> +    else
>> +        guest_cfg.config = ARM_SMMU_DOMAIN_S1;
>> +
>> +    ret = hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
>> +    if ( ret )
>> +        return ret;
>> +
>>        return 0;
>>    }
>>    
>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>> index 37c4a1dc82..253f8bb6cb 100644
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -312,6 +312,7 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>>    #endif /* HAS_DEVICE_TREE_DISCOVERY */
>>    
>>    struct page_info;
>> +struct iommu_guest_config;
>>    
>>    /*
>>     * Any non-zero value returned from callbacks of this type will cause the
>> @@ -387,6 +388,11 @@ struct iommu_ops {
>>    #endif
>>        /* Inhibit all interrupt generation, to be used at shutdown. */
>>        void (*quiesce)(void);
>> +
>> +#ifdef CONFIG_ARM
>> +    int (*attach_guest_config)(struct domain *d, uint32_t sid,
>> +                               const struct iommu_guest_config *cfg);
>> +#endif
>>    };
>>    
>>    /*
> 

BR,
Milan

