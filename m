Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63C0C54FD2
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 09:37:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377378.1623466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpNCX-00086Z-UG; Thu, 30 Jul 2026 09:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377378.1623466; Thu, 30 Jul 2026 09:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpNCX-00086S-Qt; Thu, 30 Jul 2026 09:37:17 +0000
Received: by outflank-mailman (input) for mailman id 1377378;
 Thu, 30 Jul 2026 09:37:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wpNCX-00086M-6Z
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 09:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpNCW-00Acr1-JD
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 11:37:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b1b44-bab6-0a2a0a5309dd-0a2a45049ee4-22
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:37:16 +0200
Received: from [40.93.195.10]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b1b4b-b57f-0a2a45040019-285dc30a80dd-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:37:16 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL4PR03MB8049.namprd03.prod.outlook.com (2603:10b6:208:590::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 09:37:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Thu, 30 Jul 2026
 09:37:13 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEXqqO8vhPhEjpE8W75lOyaV+9AiKjgorOW7cs1MXP1hPD8OrhHs6GtUCuNBBCJ0ym3tvv48zFObx027WqRi6kPP71AM8DU7UmgWspUn79kMI1zlhvD1FwLGdGt/bTakkwZYzSeoDztGSkVjxZbQrclXneyG/R5J/Ip0/my72OH14/2TaA/kvtssfM1Gqt2r0eVNwjkhmeEHu4sGvdEgY0kxq8fg0D8KSvMR6NhsYZqWhHthLQSSKnEO1wMUSo63kM/JxrrT/c6Gpr2/WyiGoY+VqCtCOgCiQcZN5S0nmmZPfXKmY6W6Uk4Yc+Zc3ZglAecQ9P9QR2V/dzh5W37Vwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KtrfkdTp6oeZRD3LNUIPGHK9aVEoa27WEr5T1oamCg=;
 b=G3jib8IzDDMNib58djKlMptrXkXYGJ7dl3uTaPqeDxpgoE/pfPfZdA0zOXHFebbj1r+ALgrxfHZphlJwL6pn1UmPyVuaQu7EvP8rVU/HEiRaf0EurURFtoOl0Zi2tRDx+F0r5bfLrUsszaWOpBifKARPip8z5DXFTMACfjTDugDnrz9F6ef498qv8MicnjUSK1y3zXJWbfVvB8o37RvTSR+lOUX/T3XCenw80oQ7gEMRtINvbrYkGZHwBUlQ+014pzXgUBUVmqYw3MsIcnR4nbeqjm7mNBnVFrfzVfCtgs+QaRbCHh54n5mE7siHhFrI5Q9/YPVq7jb2tqfv/IVe2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KtrfkdTp6oeZRD3LNUIPGHK9aVEoa27WEr5T1oamCg=;
 b=u5xKwjpENViRlhmdwhEtcNRLZRxX4C7sbhZwoyECJGeb+4udWe9SY6nCZ9msWhWc3Clq3erTksNV3jf1itcnpVz1ArTrThNIGpTdU5pV6ayj2E4K2Zkw1EIhxc6rzVWkvEVMDgE+NWOz03qr7PfyblJUwRXhNcAgRM3OMTkErLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <64ceb6ac-e7ff-47a4-9ec7-a48c9f476445@citrix.com>
Date: Thu, 30 Jul 2026 10:37:10 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86emul: spilt vex_np from vex_none
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <32b8a5a6-a34a-4e4b-922b-b5daa41c6e56@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <32b8a5a6-a34a-4e4b-922b-b5daa41c6e56@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL4PR03MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 185c86ea-6f61-4a57-bb2a-08deee1e22ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aKjOLbxSlgQ6ZgRD2E3XrSiczr+k9zy9HwlYBONzHF3uz22o/Dxl8ZTgldCPXeQy37HaN+lB0UD54kRWJGNnUScFkMwaixUYaRQ5ZVY4lUDUEdJl9/U4hsuAouGsUICSF1XAgGL2az21cljwEd2+Tkxep7DF8ybJSTl4Gw1wMVnZvKNnP42S0vVszOG75I2K+cBl37gEicAjUqHK9ZVnVJLJMkfs3XVpECzUS78L/AhpB+kOPeIxoo7eYBsrgE48AgBUbHhHx329+3FesDTDC264Wk1S+y9rQ2ickhSq+H06zAJihHnonmRyd1J0hS2ip65ksrm/MJ9PSHf5RkfqTQqQQHdzGACu4DyjwmEbSf6e9rDyb4PAEYjreop+zvF+c9mCiniVzfTd2GH1t8FT0H6KRJK+TkWEKMGOpCSIV8fS+M2EVTwkd40bR7Jnlkb1BGDyshbxKU8eWOMSbaLZv6W51d3sJFzwFsDo2JUzazSfapbkJB7FHwnizbS548SizbpELrbcMni3fXCSr1Sq2tYL7NkgkcQ3D4uyKZN1k15yY+S4zzs04W/aNFgtS9Kk7fit7jPJQ9ydD5EHfTy+Ci8U5sDTdWUMr5/iPhQ8eB6Fgp00L0kKpulZFbpvJ31Vy1suv2D4HMjbfH8UQkq292Zeb3W9KVRFNQc+oLaEvHk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkdRNVJCWFIxTXlkdE55M3dTR2E2Vktnak8vakhMNzhaQ2F4WTNKN0d5dzJ0?=
 =?utf-8?B?TVhYUFJaR0hCMzVHQmcxdEJVbGQ4MTZ4TjVZd1RRSGF5ZEpRV2lBRW9XVkNW?=
 =?utf-8?B?Mnk5RUNSV09PVm84MVRZUFkyaktzSHBZemNJWjBwMTRXTnNyUzBGNVQ4cFdV?=
 =?utf-8?B?em5JT1JZTTFELzhPS0UxbnpORHBJbVRUOUYxOU13VVZpR2NrbXZLWE9LOERj?=
 =?utf-8?B?ZGU3bVBFR25vQ1dVZXFTUmk4L2lZeE5LNmk5LzBaVHVxQnlHVG5ZT1pOSVJs?=
 =?utf-8?B?SVRqTmFLRm5vRml5ZVl3UFVHenBjRDNCd2o4U0l3cExXZVlZdENFZXc1SURD?=
 =?utf-8?B?bkJWQlZJcGlUZDVBVm1maEZzRUVhaTNsbXB6SDFXNWVqMFBFRFNEcnN0LzJK?=
 =?utf-8?B?WTFqWnVNWjNFSHZrVzVSV1RHYUhSTGJIaGZsV2VaaUVMSks1MTZROGp0TFNU?=
 =?utf-8?B?MmtGR1I4VmVCR1JKbFJzLzRVelAwWHJIcTRJNUI1SjhMY0xpUFJlcExvVmxQ?=
 =?utf-8?B?K1A3R0l1cU1ybFRwUUdZRXF0TVdWMVZSRFhpUkdPVjFiZWk2amdDNFZjdnZl?=
 =?utf-8?B?ekg2SjNIZkhXZ1g0eW1Ec1hiZGlCWWdzNEZ1MzVZSEFSZEh4MU1sRXdHNWNz?=
 =?utf-8?B?OE8wM3lnOTJBN042MUdpcWJyS3B1elA5dnpUUXJRK2FLK29yaEZlSmY5Y0tp?=
 =?utf-8?B?aFFhWXpUV3pxcGdhYzNUTDZhbUxjMFBOaGxzUS9YSG9kMDRYRTNMTldoZEtM?=
 =?utf-8?B?UVBSeDBUTVhqL3RrY0NGTzl2THgvb25wVTQ0cVpNZHNMTUp0WjZmdE9SbGRV?=
 =?utf-8?B?dHRYQncrdS9icUQ1NnlkK1lTNG5IclN1c3lBT2hXcGlFc2NqNmpQaVBDblFR?=
 =?utf-8?B?dFVSVklyRTllRVo3YVdWK05TVkxKRFppZVpBTG1PTzAyQTZDb3JaeHVVOXVS?=
 =?utf-8?B?WCtTMkpmUStKRVB5OVNGVjhnQjNtazNRRWJPTmpaU21MeEdyM2U2QiswTTVU?=
 =?utf-8?B?alJFOWZoa0F1MXVzSjJLVHFrelhUZE52Mk95RXBKZU1PcHdRQy9UZERRNllh?=
 =?utf-8?B?UjUrNStKdzNzRThvaTZrdWI2VzViYzVaeWJ2bUlra2JCTFBxR2dpTHBIZGlt?=
 =?utf-8?B?SEd2V01xZjdaN2tDWlphZk9HNkI5Nmg4NWdIUEZQVXFYS1FYdkc0NFNVYit5?=
 =?utf-8?B?am9Qa281MjViWlBaYUg4UU5JVmhySktjUjh0QWRKNDh0eHdZdVNFQk1Vc3ZM?=
 =?utf-8?B?dnlTODE5M1lxb3NLN2ZOMWFLK3pmSklsa2huWGpLQ09QNHBpVlVGVytaTHRW?=
 =?utf-8?B?M3BzS2dDREwvOVo4b21QWVErU3pHTjhNMmQwWEpzdjN0bnk5dktTU1dhUmpu?=
 =?utf-8?B?dTBzai9BQVROdEZkWDRteVBpcWR5cjVLdGx2SUllaXE3R0xUVkttcmxpN1VW?=
 =?utf-8?B?LzE5MTR2dTRIQkV3WXRKK0kxWWxiQ2Q2UnRKZm1NaFNRdkVDUnF6NDJ4T1hm?=
 =?utf-8?B?WkhLTmJXUlBWSkFNclM3OXQ4aVREWExYSjlabGV3eWVBaDB2azJtOFR5c2o5?=
 =?utf-8?B?NnJ3Mis2SXBOZGxxZXVVdHFvUXJQZlp5RTREdTZDZERaNElxNG9hYTZ1RkRs?=
 =?utf-8?B?aWE0Wm1yUW9Lank5OURMbkRwVm5ReS9lZ0tlQk9ZSXBqL29lNlVQckpHSE9X?=
 =?utf-8?B?L2I3dXhvREdYUHAzZkIxcTNsenB0aFM3MDJlaCsrMmdsaFZSYXNCN3ZSb01U?=
 =?utf-8?B?WURPMDJOZzhiTEVTK3RNbGZnNHJuUFNGYnNaVzhLL21nbjZYSDlZUjhNQ1kr?=
 =?utf-8?B?bEl3aFJRMmpnOGRMaTVjSU5laFIxa3VpelUxYVZ5cUNFKzNEaW1Cb2licEZB?=
 =?utf-8?B?UU9VZFlsVDgwdk15d3NIYmc3STFQbzJYMmp5bmV3RmtVa3lkOVRwU1VxMkth?=
 =?utf-8?B?TGJza3NxWnc2alA5dk1hY1NJdGZmQzBsWjh3amdqbTNSdVViYXR0amtvdUlS?=
 =?utf-8?B?ZHI0czg3aE51ekNEb3RCdW1Pc1JPVmo2NUJjUDNUaUh5S1kzS1JrZ2NNRG1S?=
 =?utf-8?B?QnN2Rm9vMXF5SmwwUDZ1RlNscktncGxKRGwydTh1VGxIWXdGU01GdytDb2FH?=
 =?utf-8?B?T3dibk5VYXpuTWVxOWIyQ1VsVGxDNWVMbXh2ajJnV2tiV05zYUZQREFHSDN5?=
 =?utf-8?B?MHphU3R1Q2lsandnOXBBOEZ3S0lXR05UUzlDVUk0VGR1UWNLenJMK0ZZeHFQ?=
 =?utf-8?B?QjRJSHpFUzlTZFc2OUNVaHdmNnMraWpiWnI0Ri94SFA4ZkljUkdzWEtYd1Fw?=
 =?utf-8?B?eUlxbHkzTEE3QjAwMVhEbmhLZEN5Z0xyTU1YbkloNFg5UmdqRE1PV3NtK3RL?=
 =?utf-8?Q?/p7FIvRUf83didFg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 185c86ea-6f61-4a57-bb2a-08deee1e22ae
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:37:13.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btsyhi65Y5SmFy+0LkTV6IAuFzCRwjM/lKBHZGs6xR80tcDBhlFc0/oYHiEDPrYkz+Q9BAsX1+XPjXH2ugZOV9HWKRMbcafJSF57hXbQPLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8049
X-purgate-ID: tlsNG-ebf023/1785404236-585C7B50-2F2D5D3F/0/0
X-purgate-type: clean
X-purgate-size: 268

On 30/07/2026 9:48 am, Jan Beulich wrote:
> ..., undoing the aliasing between two distinct enums, and more in line
> with how the SDM nowadays names things.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

