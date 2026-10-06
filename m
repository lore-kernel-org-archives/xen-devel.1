Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E700FCA5FF0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 09:53:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441322.1658906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE1rQ-0004Ro-Nt; Tue, 06 Oct 2026 09:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441322.1658906; Tue, 06 Oct 2026 09:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE1rQ-0004Rg-Ku; Tue, 06 Oct 2026 09:53:24 +0000
Received: by outflank-mailman (input) for mailman id 1441322;
 Tue, 06 Oct 2026 09:53:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xE1rP-0004Ra-FE
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 09:53:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE1rO-005Hci-S5
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 11:53:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ac4c50a-bab6-0a2a0a5309dd-0a2a4507a10e-22
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 11:53:22 +0200
Received: from [40.107.201.37]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ac4c511-b4ea-0a2a45070019-286bc925ca12-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 11:53:22 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM6PR03MB5114.namprd03.prod.outlook.com (2603:10b6:5:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 09:53:14 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 09:53:13 +0000
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
 b=s43iHrtebMfPHlmmIRmahRL0rhVA4J+3SE1zDCz4WdVi5CHsuoWlZ9rxL/eeV4zpwheo3wUWvokJSr9HmtzqzPmuipaJe96DCoeNZLggFarWSBdKVjUbvtK4VY9tqlT3kYhQACGlZWCd/UL1gn1rXGfoQRKev8QzuxaPThwHlHh4LoDijnF9MR2rBKmqwsByb9hg5FWICxteqphIGVtYXpkQobYOeht5T5UV8ppzqdArRLXXLkHB+0HrBs6slXvz6AUEeseKmgCaKk3/Rbx7/NKX5+sFF6/Cxu38rRQfx7XvpGCtY2Gxat8Grspu8ahACbyXJin92jShsnLnIAfNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBKbnSwT38Ox90wLcSxenGv+kipT2bjKYVcjPp2CxFQ=;
 b=dCq4+2W1mWOloVJkeTjCnCieQggrODgdV11odAqK3xXnB/shA01JAp+oY1Z0xIwHAulUciz6k84hqpmf7MkjgfX7d2EvYIuX/X60bO6LQa0F9vvCb7RlDBkdxP8B8/A3rEcQI7yP35mT3S4Uh/2hSKJOTWdudGYcrxhP4E/gwzKI1pLEghyIAwDVrLJnnXNUBObHy/fiJ1yEl+zm/MBPle/l5us193Ik+SAjRfYE7ITXr+DzJ3dzTnGFJQMbEyOr2ccY4HmoTVdyUJh7deV+Lu1PdSGu3nMoZcvSZe46d4HyNGfmK3O/+5l1SR0rNHxWQCX3GZyrjwRwLHlfe7EDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBKbnSwT38Ox90wLcSxenGv+kipT2bjKYVcjPp2CxFQ=;
 b=UIDMCDv8PiecTD1rR9NSCzHksp5IrKvUqcHWNdtQVM9YxI9I8Nfyp0dcIdEQMojWEwrraToogtRrG+PQOb3/3Fd2mhYgBFvYMC0X7JkAg2MNkDO3u3hDhwekmcenjFRcbI5WBW981gvJK/c9oHQCYXPdOCvwPidTm5wxXqaTyBs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3f9dfbc2-888d-4065-ab86-319910545d97@citrix.com>
Date: Tue, 6 Oct 2026 10:53:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shim: Report -ENOSYS instead of -EOPNOTSUPP
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1791211375.8631fc262581453bbf619ec5b2062170.1a10c848c9a0003f66@vates.tech>
 <5058c588-662b-4435-b205-52ee3ab01ab8@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <5058c588-662b-4435-b205-52ee3ab01ab8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0512.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::19) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DM6PR03MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: d7860dd8-a9cd-431c-c311-08df238fa331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EOo1F+ROKsXembdryQ+TNe9NKfLMlnVOza21ziYywRCj1cCqeEbOLnYDzSzfGcFzMjhpTV4G/O5yHDtJ+TMqECO/6rZfF243Lb9/hsFD30Q3vfH/LTy3vNHqDSuTJlTBMviMbvLSxYDPt6+yiYq1bP7Am/39crTIcWHVpX4TaPTpGsCEnVJ4/eAn0enDJAzC27T/Zq438Ctiz0DlJgAcuq48kt2YFB4Gjh0Z5/C0qPNpRm8QRpT7SG8Ci7Ykh3xRPBMVp081yTICsIS4lh1D7kiECD/fAt45FBkJIJ6pMnjK00/z23c7bpGUvTpqdFtgTdwWTF/Nq661tuh0ROJdYogp6+c3ZQpqGgTrmIjDqy6fpEAcK5Sli0+5buvfAdU3Pe4fGSgPdBHi2Utx2jVc84MJffg7MiHpyuiffvKZEZT3FtmapsZo2F8/s44t8beDkmyj3+213uQkuy6mpTtRF76nIhCdyFDhceKSveaWP81qub0gttS6B+WWLD+349lw0iiN44ipZFX9wtQ30HnEr/VTDIXnXeLrTNzsHWw9niIp8VMO4ByQiZiOWBcxqjfDdHfmKN/d5724jGOAqGR9M8FNjjh6SVkyuIu/jfgzNrryKf48WP8GxX5nW1eAHO43ngi9ITTbMOWM0BAC+OwfbwvEBmiyoHG1kxYLGPeN/xA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2xPUzVLQnptNURjeWhkWmdTNzZCQ1Nza1MvSDNvc3kyRW96QmhZVlhWVDhO?=
 =?utf-8?B?dTRBWDlSbi9SaXA1NW4wTmcxeTdBTGcrSXQvQlQ0Y2ZmVU1XeDFlNVl5RjNm?=
 =?utf-8?B?NWtPOFc3QXN1UTBXRG1JaXF3Tms3bUluU0tNS293ai9idmkwd0tmckltQmw0?=
 =?utf-8?B?WlQreDZibjRLalRGNjhkNURrMEU0eTNDa1NVODFkR3J4bTdVTEpoR3lMeWMy?=
 =?utf-8?B?dVA5bFBPOVR1aG53RnQrazQzeG1teVBJUC9vNklyY29xaXl5V1NzRzlwdytK?=
 =?utf-8?B?a2s4cVdVQVpwR2xlRGV0MVdvZStDWG9wbmlpNWF5R3c5MDRPUlRNYXVvRGx1?=
 =?utf-8?B?dERENkNoVHlsWmU5ZnFIWjFGcCtSdFgxc3BQejVwWkxubG9ldUNBN25uci9s?=
 =?utf-8?B?S1dpT21KaE9INWVsOTVFUWE5Sko5SkNDeXZtZjMvdzZES0JlZ3RZdWZZdDBN?=
 =?utf-8?B?VFlNbjJMNjBvNFpmUTQralRhTFI0aWZlRGUwemVkSzQ2OUNxN0FxT1g4ZmR2?=
 =?utf-8?B?SkIzSUpxZGc0T2FiOFRBRllOSjNFRU1WWVk0eUw2NkZDZDhjTDZkK0RGaGwr?=
 =?utf-8?B?NE1WQ1JmNit1YWJ6YngrR0l6UjVEZ3hsbzhJaGlvOXlZdzBxdkxCMVdJU2k2?=
 =?utf-8?B?RWdvVXR2QTZISERnL2N1REpnQVNkN2h3b010cVBMUjl5Zng5Q09vMmRWT1Q0?=
 =?utf-8?B?clZLR1RadlZicUpPVmZQc3o3UDRpYU9DbDM4UDdjdWtvS1QyS2pRR0pGWlR5?=
 =?utf-8?B?eTZieWZiZUhQclN5TDc4RzYwbmZtTHhiV0J3Um1NYlpoeGVpcDg2ZmVYNlh6?=
 =?utf-8?B?ZUtwRmJIUCttTDBud2hFMEdwbFNLcFBDcDdSU1c0b1FlQ01KemV5NWlETXpw?=
 =?utf-8?B?M1dWbWRrR2M1THo4MEhWamdVeXFRNnVzT0NQZ2xyTnM4ZXF3ZHh2eU91d2hG?=
 =?utf-8?B?SWpqd2FPMHJSNjdEakgvVlJ1VUVVdGlPcjJ6T2UvMXI3dUE0SksvK2VKUDdL?=
 =?utf-8?B?ODBhMXNzMndxTm5rOXArajdNam13cHZNd0Vyd1VnTnYwWDlDSTE4UVpOYU45?=
 =?utf-8?B?TFZEZ0xPL1JyZi9ETXFCbW5uQmdYbnBRSXMyOXpwbEtleUdGd1QrNG1OTlRQ?=
 =?utf-8?B?WjE4OWZGK09CK3lma3VjWG1aTzdzZXhjZjhoZDZ4RUowbUtRYkJoQ1djVzlG?=
 =?utf-8?B?R2dMem5PdVFWQzlXNzl6S3Z3UVNTZ1dJb1pWdlV1L3RUTjN0UTlMN0hSUEIx?=
 =?utf-8?B?VzBiU2pTbHRMQW5RKzZRTTRhc2tEeVZMeWdyUURrRk5IQjRBaldUWFJmcGJp?=
 =?utf-8?B?N2xRdFhod0M1c2lPQ2V1b2ZnWk8wSEh2WVVrMUw1UTk5RGhkTDJtQUtIb0RH?=
 =?utf-8?B?eXEzR0dhZFZtQzZnRGtBZk9UTW9JdUhyYmZpdk92S2U5bThnZUcveWRBZnVJ?=
 =?utf-8?B?ZjlQVDlNQU9MMTAzT3pPZlBhOE9NK2tvUlE5dzhpazlKVmpoMGhid2NXL0U1?=
 =?utf-8?B?V01XUkFnUE5qQXRyY0V0S2N3TnF1Q0RlbmpNcFpvaXFxSWlOVzVaTEJzajlK?=
 =?utf-8?B?ZXNkZlJkQlB5ZllsSkJ1cW5LUjFPQnFKTkRVend6KzJqMFlSaXlZcElwTnlX?=
 =?utf-8?B?ZE9GYkxQWHRELzUwcUxxWGpNcWxVV1hQQTV5ZlJXajYyVXR4NmZzM0xFek5K?=
 =?utf-8?B?UDN4dTU5TFhTTllYOTk1QUMyWjdjS3F2MmxFOHRUTkZTZzhJUm9jMHlDOGJU?=
 =?utf-8?B?Y1hqK0JBZkI2ZnQ4Q0tTN1VTOWluLzFsWVF0c2QrZTR6cXNRM2FqRFZlazRv?=
 =?utf-8?B?MCtFOXMwb2d5YzFvOC8yYS9XYnMwNGhxbWJFeVBXQlkxOHZYbHkvVUdzN2hM?=
 =?utf-8?B?bmE3Yys3cGFBaUVpNStIcU82bE1DV3BIOUlIMms4TUxGV1RKbzNTdXc1bUdC?=
 =?utf-8?B?dXhhUytZaXFpVjhmZmVudk96L08vZSs5czFYcGRla1NyQzk5akQ1cWJyNXF4?=
 =?utf-8?B?OUFLM29PWXVpZk5aUVl6S2xnRm94Yzl4bnhodVZXbFRYM2V0d21ONTRvUmgy?=
 =?utf-8?B?M01va0pwL1l3K0IxdGR1OFRTMGdZeEE4REFrQmR3YU11RzBaY1BWd0xDdHdn?=
 =?utf-8?B?ZEZYNGQwYU5HdVcyalF1NU0vaUJGZVlWRSsyWUkvRm5VdDdGOVhCOUZ4Y1ZD?=
 =?utf-8?B?ZHF1MDJDL3NWR2JwdHl5UEhLMXdWNkVRWFhEekNmU2VmREJrU3dEZkxxSlBL?=
 =?utf-8?B?OWg1MVlsL1didDgyWXprbjRaUUkyTTJBZEJiaVF4cUZVYlgzOEFXRDVQS0l5?=
 =?utf-8?B?OW5jZGM2bVQzWTFMdHg3R0R2MjYxVkN2WnQ3d2ZCaVJBRXpsSEhUblV3R1VE?=
 =?utf-8?Q?Io2+uXYaTaCSG4mc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7860dd8-a9cd-431c-c311-08df238fa331
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 09:53:13.6977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6eC/WcmX7beENaAar8YkVowWta2lu4oUuUfI96vHp2LFyBYP8EIi5RcfOWEBUa8qepjpcSNnacvK0a5LklxtFgB9UlxLcd2pA1WTPgpIOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5114
X-purgate-ID: tlsNG-ef75cf/1791280402-3C411AE4-3BC5D93B/0/0
X-purgate-type: clean
X-purgate-size: 1503

On 10/5/26 4:11 PM, Jan Beulich wrote:
> On 05.10.2026 16:41, Teddy Astie wrote:
>> Main Xen reported -ENOSYS if the operation is not implemented, however,
>> shim errorneously reported it as -EOPNOTSUPP, potentially confusing the
>> guest.
> 
> I question "erroneously". -ENOSYS has, according to my understanding, exactly
> one valid use case: A top-level hypercall (normally: syscall) function which
> is not implemented. Unknown sub-ops etc shouldn't be using that error
> indicator, or else callers can't tell one from the other.

Maybe they shouldn't be using -ENOSYS but AFAICT the majority of hypercalls with
subops do return -ENOSYS for unknown subops (with the exception of kexec_op).
This is something we tripped over when implementing the hypercall filter for
XenServer's Secure Boot.

Ross

> 
> That said, it may still be legitimate to make the change here, as making the
> change in do_grant_table_op() and do_event_channel_op() can be viewed as an
> ABI change, which then we cannot easily do.
> 
>> Make shim more consistent with Xen by reporting -ENOSYS instead.
>>
>> Fixes: 49f79fe03dfe ("xen/pvshim: add grant table operations")
>> Fixes: 368ae9a05fee ("xen/pvshim: forward evtchn ops between L0 Xen and L2 DomU")
>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> 
> Reported-by for yourself is pretty unusual, btw.
> 
> Jan
> 

