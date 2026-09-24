Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88805C98314
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 13:01:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432262.1653709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9j4L-0007ay-3K; Thu, 24 Sep 2026 13:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432262.1653709; Thu, 24 Sep 2026 13:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9j4L-0007ar-0e; Thu, 24 Sep 2026 13:00:57 +0000
Received: by outflank-mailman (input) for mailman id 1432262;
 Thu, 24 Sep 2026 13:00:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x9j4J-0007al-AX
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 13:00:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9j4I-00BHUU-N5
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 15:00:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab51f06-bab6-0a2a0a5309dd-0a2a4509b718-2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 15:00:54 +0200
Received: from [40.93.195.5]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab51f04-be1a-0a2a45090019-285dc305d175-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 15:00:54 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PPFAC5861524.namprd03.prod.outlook.com
 (2603:10b6:40f:fc02::217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:00:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0428.015; Thu, 24 Sep 2026
 13:00:50 +0000
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
 b=uGTdIfUPH5PiMXK0MocK9ekn7hBQBHIjSq1Hhoagn1G8nDag2r7EnM4vHHSIEGHRRQicKKOdNwhnx2jNAq/6lb9SPzsL1bDOG6EV70O/GFHLacJzWHdQLzw+qrMpY3FOjwRX6OHWZBsIiOXf+SSMjOC1gJ/ZD8XP+KNu/BW3pzBpIKIEU41iF9LJAHPznJlbCH631BN7K1YZqad5XqaRvR7wNwG/x7CDWOk6zuyInCYS32ZLHdhPVdZLNL9heerRSiBwyh71vL6Cg5CPC7+qqZzzBqUFcK7NIDEQ0fQ4QGZzSVrAyaVQfgx+3qobmuaw8dK8imzhvP5QrYmFsvoOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxCUXVQEYZxfbSOSIpLJalt/tkx250/1PfFRuiWtJeI=;
 b=iwE2qSvVWOeMYXInv9gSGWmFE8cPoZKfUFyJV5g9E9zv9hlk9+rp2OlvcX3RSoor9ttor2ce0NFn3f3jytN+90x9omN0GbuWovlrLh5de+7owMa5Dgs8n5qq4rxYyRcKC+dbfxZ/AF4AWWEdHSCt1K/6myaQzQNb/SR0c82s1axHG80+nvgHzAPeIzvG81fChTj8GjJ6HZZG//z+SSZCZGwp/of3DJzApf3ZwLjnVxifjn6BJkERyhsPtJu11Dr7NuR3ozU/ebHebQjOAF5AWMFL51J2Bos3awT90qIICbDIjytzVWdZP3Pxamr78av4CAi39en2Km8WBM9Hp7JIMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxCUXVQEYZxfbSOSIpLJalt/tkx250/1PfFRuiWtJeI=;
 b=PyifM64bxATlhvSbuR6mbCe8oMs/bXi6QqnxLZGhNoJU5mnzEijkPji9a8vYdxbszt6xDAYk8MJj+W/v6YeDfeIWDJOiIzggYeMgvNZ/dDVRKUamkGEfq9O9EFfmRIJBl53otS4Wq08lod5lMi2oqQ8CjqVJhoanLakAX9ceV6g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bbb4d231-c844-4418-bec5-7dc8dc7464bf@citrix.com>
Date: Thu, 24 Sep 2026 14:00:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH] x86emul: Fix AAM emulation AH output
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1790251256.8631fc262581453bbf619ec5b2062170.1a0d34a4a2d00072c4@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1790251256.8631fc262581453bbf619ec5b2062170.1a0d34a4a2d00072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PPFAC5861524:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c70ecf-567e-499c-be47-08df1a3bdbc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IFA8l9ubdv64eRHkltSpJ/j62+JpIOPCXnk9Ru1TClOEW1gHBVNDlPauw7EyvY0oq+z/glev43A+YG6GSrh7t5ZHNms6eOXRdOoBn0FoAZMSxQYKROhR5ufyR56PW24PLRdx8SnvpV/BbVFuQSc22vjj+gt71YLFqFye/JYhFp9Sb3oRQRii4DpIPMh/Zy4Xl3AWoey6p0115HV2Rwcu70a0kuN+x45LJK3gi7eI2lR1+BBeoIZ0H39ssbxRaE9TviwuDXC2/DAKnZZVytb/X4gNizskkMYZV/soryw9YATLkj/bDma11gX+EI1XsoMdlza2MwXYsvjCHPymtwQo5TpscUuCVLfK+UoIqz9NulN305dYBsS6nqEjFLZIAqJaV+VTET15gBzx/faMK+WM7YzZ+haCA9U/UJ+SeebX8A48V4gRuAQs5W8kdhagHYkCTBiltK/Jept5RfE6t7lsXpj1p/P5QfVTZZ72Iq777C2OvBtwYxrL+tBxB3q/d5eXflr6+mi5uIarCE9LBjuA2IUHokaFwWAuRPDgsgb5n/MVjFnx4bE0TyrCXPoS7YLIohaKe4Kl8Tp9wT0lERggouq8G3HXLIfkA1lTWwwr0ZR+VzhvvQq99K1ZwILHnN3JYXGc4+rW4mgNO3cBLiQKDSPaXZUECBItiH2WdV7BJ6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2pPZEJqbEdaV1BUbkthbmNSbUJZTVNjSDZ1QkNXYUdQeERSZ2cwNk1BK0RZ?=
 =?utf-8?B?d1B1Skc0SE9PWUZ3S2hiNjl4OHRONXlaRXJteXp3YTVWY1dsanJDRDRwQXBV?=
 =?utf-8?B?N2hzK3pOZ1dEYk9RK1ZxaEthTG95VlVCQzFQTnJKVnhQb0dDZDdOamhyUTEv?=
 =?utf-8?B?b0hkSlNiVXk3WlMxYk05aE9pakhCU3BBcHdLWmk0OE1GV09oQXhhNk9uSnYr?=
 =?utf-8?B?UXIvMkRGdk5zUVN4OVI1b1BUNGp6SStKeWtyMmwzd1A2NXREd1E5Y0xyZHVG?=
 =?utf-8?B?dUpQa1Q1d3ROYzNrWUwyNUdkN3N4VldySmttcndRZmEzK0RSczdrdnhWNEk3?=
 =?utf-8?B?S09KTVZTN0N5L1N6T1dWbVZuT1hieVJKQnQ0NkVpN3FZbkZRQVR2M1doOURX?=
 =?utf-8?B?SUdNWS9VbkxjQzUxZTliZXJPSzRxU3I1NUIxZE52dG9NTUhrVCtsdkxFdW1i?=
 =?utf-8?B?SExKNktRRkY5bVdUSUZhK0hVQXpINlFvbjJ3RVN0Y280QW1Vc09TakRIM3VE?=
 =?utf-8?B?SnFQYXF6akVKbnNva2lNOEJzbmltU0lLRDFGdExQUkExMDlaY1F6SDN2UU1k?=
 =?utf-8?B?bUhvS1FKR3QzRVArSkZ2SUNEdHFBY3FyYTVjS0RVZWdqRnNNdXc1UTBoeGhk?=
 =?utf-8?B?SGZqZnhrbWNiSEg4Mk1ncVFCbjBzY3dEQlBMaXE2SjE3Y0kybFp3enJlUEtz?=
 =?utf-8?B?ZXpKVUJWdnJJK2VjbzcvcHh3eHVUZXlUdnVrUkdKRFFCa3FIZk5XK3l5SHpL?=
 =?utf-8?B?eGIxZCtSUjV3bWxrMmN1dzlUK2h4ei9Ham1wa0luRm5sTm5ra0VnTnc5MlR1?=
 =?utf-8?B?R0dxckFIeXBBT2hEY2FmS3NwYlNhUlgyeGFEd05WaHN2R2g4WElzRFNKODl3?=
 =?utf-8?B?TWpxWTdJMzVqUjdzSFhOSFBkSXh4K3FZTmxJVjhMcXo0cWhFYUZIUkJXRFU0?=
 =?utf-8?B?Mm9PUlpQU3ZpM1cveHVnZlhrdnpDc0VXWUpIbFcxZ3VmUWVsbGdibVFXTytz?=
 =?utf-8?B?Z2ZWenczd0FNdlJ1Y1ZVdnNVR3hwQlpRU296dStuMUMzTmxJYlZ0TmVXU0sx?=
 =?utf-8?B?c2VKSGhmWTF5QTRkcS92THk5UXpSSytidnIybG9sTUJMcjYxTXdEQUVKdVhK?=
 =?utf-8?B?bE1uRm1haUw5YU1FRkRMSDYzUGlKQURtU0J0d05hLzZQNUJreCs2SFNGeEtJ?=
 =?utf-8?B?SGNaVmFLblIvSkU4NHpHTVppYWNYVkV3dE9hKzdXSU1rUEhRdlJVYVhRMkdj?=
 =?utf-8?B?NXp4VW1tY2RWdHRWTEFIMG1Vd3pQNSsvYU9rN1FXSDNqblgrdmV2eG1YRFlk?=
 =?utf-8?B?Z3FML3U3eVlxNUhMQmpZYktjaVVmaE5sWTdsK0JWakR6bUpoaDZFK1dPYURi?=
 =?utf-8?B?dkZ2Sm05SDY4dUEzcy9jR1ZGRGFmZ2JkdmhjOW5wMk1QL3NMajhrUVVtNVFm?=
 =?utf-8?B?eXdQd0JNckkvOEhTRTJrWkwyOUhXOUZhaXNUQXl3Nk93Slc2VFcxM2FvTGJD?=
 =?utf-8?B?b0JMZGRudlhpUmpPNDRVc1UwZWkwdVJRclUrN2xCT3FROWN0Qkg3TytlbTNN?=
 =?utf-8?B?Vm9UeUNvcEtOQjNCK3V1TTRsU2ZWWXV6UmtBNisxZGhubUtVc0xtZmVwd0Vk?=
 =?utf-8?B?RmZUSEVLQjd5c1QrT2E3OUI0cVVsNnFvOEJaQ3ljN3pyNGlOclcwQU9FbE1i?=
 =?utf-8?B?cEJGVlcyV2t3dzRoVFZhNDhhdVpHS0ZMSThLeUw4RmNKNnloUm5rdnhUSGQ0?=
 =?utf-8?B?L1lkQWlLOEdpMVBueUxqeEIxZmI0aWVTcmpZZzNwWUNtR3dycGFSWnlnMk9a?=
 =?utf-8?B?bG5sZEN6bnN5dURjUXNpOWVLYXJYck5FbnhRMmZWWVo0TUxLYS9QaFoxUGFw?=
 =?utf-8?B?cGlrZVVWcWdkNVJuYlYydkoyaDdnVzhaanhONG1SOGFqcTFxMnMrdFl4dThC?=
 =?utf-8?B?ekluamJmRG1xeGg2cUNwSVQ5TWwrSDZEN0xaUW9qblpmS3k4N0hIVU9pWG1E?=
 =?utf-8?B?TkRxV1FQcWtsQ1E4RjdINUVGSnRReERETzh6YUI0WHFRQWZlQjVUUENNbm4v?=
 =?utf-8?B?cGZiNkdEb1BTWFhoUG1sOCtZNy9uaEVSRjB0dWVpeUZwLzd1dTNPN3V1aGRL?=
 =?utf-8?B?dTFhUldOc21JNXNMSU9XQ2Y4cnphZTlqNm5lckNjbFFTVWVQWUp3Z0FjQVJs?=
 =?utf-8?B?OTIvdmt0Mm5SNXNmcndTSW1EYWlHd0FmTWZzTHpIeVZCSWJpQVhNU1ZSaHdX?=
 =?utf-8?B?dS9KcEh1RXIvMnZMb0FQcElrNGtyOFZFMkxaSnVMajdmRHgyalJ0NlZtdG5V?=
 =?utf-8?B?aEdEdjdrclZrMUFWMlI1MlNpNFY1dW8zTVRZR05GdzVzQkZQTHFMZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c70ecf-567e-499c-be47-08df1a3bdbc6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:00:50.3438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+gvF8J+cCnhOeoSOsl7WgKEfEz761UGgV9ITt6MlwK3nzmvlO/lm5TCxZqwXjOQFfKyAl1gwzHAIyylr/Oi+IgTgM/eONMeJbfKa9S8Qz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPFAC5861524
X-purgate-ID: tlsNG-bad1c0/1790254854-FD26A034-CFEE8149/0/0
X-purgate-type: clean
X-purgate-size: 1032

On 24/09/2026 12:59 pm, Teddy Astie wrote:
> AAM is defined in APM as
>
> AH = (AL/10d)
> AL = (AL mod 10d)
>
> However, due to the order of operations, we're incorrectly computing it as
>
> AL = (AL mod 10d)
> AH = (AL/10d) = ((originalAL mod 10d)/10d) = 0
>
> Fix it by reordering the operations to match what's defined in APM
> and avoid the unexpected dependency between the 2 operations.
>
> Fixes: 8993572b9c16 ("x86emul: fold/eliminate some local variables")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Oops.  Yes, looking at the code, it was previously:

    movzbl -0x88(%rbp),%eax
    xor    %edx,%edx
    div    %ecx
    mov    %dl,-0x88(%rbp)
    mov    %edx,%eax
    xor    %edx,%edx
    div    %ecx
    mov    %al,-0x87(%rbp)

and with this fix:

    movzbl -0x88(%rbp),%eax
    xor    %edx,%edx
    div    %ecx
    mov    %al,-0x87(%rbp)
    mov    %dl,-0x88(%rbp)

Reviewed-by: Andrew Cooper <andrew.cooper3@citix.com>

