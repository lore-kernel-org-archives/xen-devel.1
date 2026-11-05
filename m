Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8546606D81A
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=kKfFhE/y
Received: from list by lists.xenproject.org with outflank-mailman.1474439.1681553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOvJ2-0000NP-6i; Thu, 05 Nov 2026 11:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474439.1681553; Thu, 05 Nov 2026 11:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOvJ2-0000NI-47; Thu, 05 Nov 2026 11:06:56 +0000
Received: by outflank-mailman (input) for mailman id 1474439;
 Thu, 05 Nov 2026 11:06:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xOvJ0-0000NC-Ae
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:06:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOvIz-00FYQC-4O
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 12:06:53 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aec633e-e002-0a2a0a5209dd-0a2a4501e73e-34
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:06:51 +0100
Received: from [52.101.46.10]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aec634a-5984-0a2a45010019-34652e0aa11a-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:06:51 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB989346.namprd03.prod.outlook.com (2603:10b6:a03:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:06:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:06:48 +0000
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
 b=Lg7QK+MTxgXU6hUtYc/Q9OwBh7kE3SXwWArgyEfLW/lvzVqx9XSNFNFL4Y+AOXmkKiicmN9qmI+qKtjlUER5Qu/h1+JmbnYL2jRs42fS5B7ZpPfo44yaPQObzpFJBEyy+rv3iSShPeXmrca5J8Jtwe0QjVIdISTSJYIrkn2jJ/aGBX5V08hIG/lDFbgN8amPldB/duiiydt27gszYrwAuJvFBFZ2j/EoSrnEwcN1XEJkXmW54s9BwaL4WjOu3rLFRpNeb7JDtGbAjMXRsqcqY65q2XGxC8Nlmj4P6j2DSD6DVUdyf4z8vCdTa7zUabfkVvf4YqzSEbiTelmiUG+1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CX2J/U+VNqa2nmdN5fBly2C9BoJdVQc7rdUJ97O9fY=;
 b=FFpULs2GEv+sBLQbL50MoSFaYQXqXZ5mR+3iQEn9rNDrD7fubqze+I01+gGzbFSJJpYTJL/h/xvs6IXUp73JvP1RXc72AbbC8AE2atUq9DQXhqFEyac4KMwr0k6Izv3nufKoyqdVWhMXBFbPIfjnh6so4rNDULuYsQp221FOxbnZ460Fx4PDSsCrn94ExfjzRAhQ5apCpV3yFOg2yaE2cowyattUKe4dRO6l1raoHkoSZfBkrpy1I+2bQqtgaNV1GfuVhY00U8ED2syzPhCHXqf1G5CCwJnU2R0/fBvLWQMcGRnPkjZdv2bhM1bcWT7fRdPKbCPVfG1oL/TPNQTGig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CX2J/U+VNqa2nmdN5fBly2C9BoJdVQc7rdUJ97O9fY=;
 b=kKfFhE/ywNnqwF4iPXJwGczg1saWSKW0EgzemaU2fThC18U8jq+I8qTR3uNVtEek+s/31wPwjXrts1QjQwp8ht5NdBhUFNiEXyNhdPea2r6zFhNxTW15+N5MXRAtQIT+sO42auI1QjdlTYvofUJ5sBFOTzuCBgt5MhYszEsdcio=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c89d0110-9ccc-4f50-8e89-aaa993cdf1a6@citrix.com>
Date: Thu, 5 Nov 2026 11:06:44 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 12/28] x86: apic: use APIC_EIO_ACK instead of
 open-coded 0
To: Jan Beulich <jbeulich@suse.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-13-dmukhin@ford.com>
 <63f7b986-b5d4-4d64-9d16-8326cb8534da@citrix.com>
 <109f3308-ff73-4bb0-9ec8-b9b76cbbe93b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <109f3308-ff73-4bb0-9ec8-b9b76cbbe93b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB989346:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2634bc-fd1e-41ea-1cc5-08df3b2ce2c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|4143699003|56012099006|261022075727099003|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	/Pr5bgSArzFo4BBZh6QvXkRgGValsnEvfQL+80ul6M9c8wLv5SwNz72bqolFRT65aaDrpu/YSSKOaEjEGjquv4nzsZ15q+XIZ1otNpTYgAbAyNx1/EeOwhbPlJxAUSepULLV3b99iG9FVldCVsqdopG+J0uNTOyHhTmDDoO0A/U7BgnUqd6dTiIMpbBepqj8iBAVyPRGHEN8oA70vnL4qFwyXHatJqnrHZlyysQp1RqpfadnuR3dA6jldSecPu+N3HcV1zqvdU0fAX2ueLehXmLU1d2TSvu9ZTadcvwEMyGy1Q+QVoSxB/vERpLPLQCWics08X5VFtMJhjOH1XhF1dCGclyXgOT/ygVJcNF91Xk8MWPOBHzhDOHF3/AAd6SJ3sDVVDBmLRy4Y2BM0wA9Q3U1C+gLFyv2TuPJ3jqXCPcmDOWkFICgZDrbP8V9t1d2dvX8vc8Pcnf2sEvHAXktHn2RGmAgyPPNIdO85vtJ3AAHY0DuMZkUSVnX0wDP70MHGGuHtVzZ/PVJmbYzIthcuco5rm2SKdmbvZ27lQSpAwOJ472k8c+fsKKM1m+dSmPR32anz329YB2ejYmJCAVC89FlEvbxiUVdwaN9mcHNg5uWekaprEfukvXRFaSLd5pnCOHPToZq6EeqHAlYw60fhYr0hPlUqrwfYSkO96YPZNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(261022075727099003)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUhvZjU1VDJpQVpsYzl3QURzcVVpQkxtRVBIRFoxZTJtNmg1QnpYYzJ1SHA0?=
 =?utf-8?B?YlFEQ2NBTXk5dld2eUxjL3JtaXJ0Z0hCM051SnVGU3VVVy9STHBLanV0Mmls?=
 =?utf-8?B?QmQrVUt1amNram1PcGZsQzRTODhPV05oQjNURW9oMS90ZXJKOTBQdHJ3dU9V?=
 =?utf-8?B?RVl3UThlazNRd2JPTDUrT2F4cnFKQ1lxZk0ramZjWmJXanY4YlhRM3l1am51?=
 =?utf-8?B?ZmVpcUZObnhpT2xodmhNM1gxdmJDTU9BbzZHUmxNT2V1Q1AzZUZ3RmR2YjNC?=
 =?utf-8?B?R0U4Q1YrN1lQM0xBR3R3M3VwRERDZ0JMdFdhUU94Wld3cHBxRnI0QkZZSmw2?=
 =?utf-8?B?ZGYzZmJMY0pFTCsyVjIraTE5dEkwT0Q5V2hHMGh4eGNjUFhadUFJU2xuOXNF?=
 =?utf-8?B?WVQ0SFROUjIzN0dKTUVPcXFuZ09zNXJucGhkeFR2R1hFQklOelQ2WGdraVh4?=
 =?utf-8?B?RVpHVkxyR3VaWkhvb1ZKRVFzWkNBZjhaVG1oYWRydGYzc3MwL3VPR3BncHp2?=
 =?utf-8?B?Y2VBRnNRSklpOWh6SEFDTVV3eENCcmdCV1RxMThQOUdKVnNBamlUdzBHWWpF?=
 =?utf-8?B?SnZaSHQzUU9LSE5MUjhyRFhlQ2RXcngzM3BCQkttTTVtRitxckIzUW1ueEJD?=
 =?utf-8?B?NXBSWThvMzNZaWxYL0xtWlFDQmpvTjdETERKM1I1WFg1RDYvMXFWYjNhaHJG?=
 =?utf-8?B?YzFwaHlnZGlDMG8xM2N1TW1DUE9sMWdiVWt2WGVpaGgwUkRkSGZUM29ZSmVU?=
 =?utf-8?B?K1RTMkV5ZWlkVHhLRnRmN240ZXgxcWtZUHl6SG1VNm96b0tkM3pnNlhTZFlq?=
 =?utf-8?B?VUsrUXloYzJpSGNQOEFCYUw1Z0NrbmdDckQrK043V1p6ZHE5NFM1dW8weGZE?=
 =?utf-8?B?VHE5dmFkS1EyMWNWQ1BKei9vU0RrNU1KNkp5TEZ6cEIwY3BVWDUzTllrU3Ja?=
 =?utf-8?B?b0ZqUnhpUkUxbVc4MW03bURieEFZN3A4em0yNE02VEljcnRWZUNuN1A0eHIw?=
 =?utf-8?B?Q1paTlVOc096V0M2OHpSc3hHckIwY0EzeFliWHJPQ0F4UHVxQlRGd3ZMNWNN?=
 =?utf-8?B?M3M2VjFSVjZTS2hJQVVieHdPQTBhM1JLeTF5WWlpSlA5NkpxZ1dZNGtrbnV4?=
 =?utf-8?B?eUQ0TURxYlJwWGtKVG93RWJOemYyWEVQOHJxdWFubHhMYlRmY2pZcGdtT0Fz?=
 =?utf-8?B?MEtJWDFPSmdZUWxDZXRnSVlJdW4xYm5jTy9SWWtCelcwR3N3MnJNaWs4VFMv?=
 =?utf-8?B?QmR5NE5kbG9sc1NGcW1CSXdBbjF2dHhxSDBCUkl4M01sSDVHdisxVGsvZ1JQ?=
 =?utf-8?B?QUNhRHhpQ1B1d3BoT2FFY0E1blh6ZDg4SzdFQnMyVGVWRnA4K0QxNnZBMTZL?=
 =?utf-8?B?YnM4V3QxcnJYVXcrZDhqcDBKYjZOclE0ZU1iT2ZTN3g1MmdXR1lvNytoUlpK?=
 =?utf-8?B?bm1zbGtlOTZaazVSd0E1eHBrcTVzNzNqcGdtR3RhS05LdXlPR0lDajk3ZmdN?=
 =?utf-8?B?YTNzWFlGWkY4NG9iaHJFZ3BETURjbktzaXhlbmFvU0QxWEZxeXA2ZlNwaUo1?=
 =?utf-8?B?cHFjUTVnZTRLSTVZbC9YaHpnbDI1RFJmYWtWNEt3a2ljMzN6bDlYUGsrZ1Fu?=
 =?utf-8?B?VXpGV3Z4YnI3WkxNRFJDeGtZb205bDhEWTVPNGd4RUFuSU1kMjI4WUxkTWlw?=
 =?utf-8?B?STJrR0o2d3NuY0Z3cGM3dEdJcm52UXNnZWlid1hBZHppcFNjTEM0TThveEZw?=
 =?utf-8?B?bjU0WXVaMjZHVDk4Smx4RWxPVG5BWGZLUUk3cDFRNVpsekxQQ2o3NjRhUVBI?=
 =?utf-8?B?KzlQcElxeWplRzcvb0I4eWwrOFM4cXlNYnlXdG93Yk4vMDZtVDZ2L2NHV0RY?=
 =?utf-8?B?MGdmTVhROTNtNW84Njl3S2tTNnJZN0Q0MUFKSnBTQmJCVHo5WUVMUVdKSUEw?=
 =?utf-8?B?cEdGMDNQT2hYQlNIYUdkK3B0UGx4QjhFWVc2djNvTDBmM3VyY1U4aklCdVEy?=
 =?utf-8?B?ZXlOMnJTOXVudU5ML0ZyU1cxaWRmZDhyVW1VVlUyaFNQRnU0ZU8ybTYvR0ts?=
 =?utf-8?B?Y2h2NVlWVGtDUWZlWTlSSU1PYlRzdlAreC9OMmdzMkxwRGZWWEVmTTk2dmFC?=
 =?utf-8?B?aWtSbUZucjlFRmx6eTdRY2lZb2RnS0NtZ0dsL3JMZ0NxUDZ0YU52SHdHNFBl?=
 =?utf-8?B?YXh3OTk3TkZGZEVTRkZ6a0xqOUluMXYvR0c3M3I0NkhIcTRrbURaeEZpd1d5?=
 =?utf-8?B?T3paUDJKSFpLQ1A0SmhkY3JDWGhzWWpQS0dDNFZnM3dQR2o4MlZOalhBV2Z6?=
 =?utf-8?B?Y1JDb3kzOTFmaVI0WlY4VktHZHlQdTlPY3hPYzBnNFpqMTh4eGJ0QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2634bc-fd1e-41ea-1cc5-08df3b2ce2c8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:06:48.0162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RICAFBZbYzljBwHMMHgLfADyJ+2Ch3vcA8TheWCG6rdtpGVFK7Cho6ZgVkkrH57m1OWb/sD55LPxIAmdN/4M/OpMGyzHpDjMvVtncfQdbWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB989346
X-purgate-ID: tlsNG-d62444/1793876811-1D272757-0C0332E6/0/0
X-purgate-type: clean
X-purgate-size: 1353
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 10:21 am, Jan Beulich wrote:
> On 05.11.2026 11:20, Andrew Cooper wrote:
>> On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
>>> --- a/xen/arch/x86/include/asm/apicdef.h
>>> +++ b/xen/arch/x86/include/asm/apicdef.h
>>> @@ -25,7 +25,7 @@
>>>  #define			APIC_ARBPRI_MASK	0xFF
>>>  #define		APIC_PROCPRI	0xA0
>>>  #define		APIC_EOI	0xB0
>>> -#define			APIC_EIO_ACK		0x0		/* Write this to the EOI register */
>>> +#define			APIC_EOI_ACK		0x0		/* Docs say use 0 for future compatibility */
>>>  #define		APIC_RRR	0xC0
>>>  #define		APIC_LDR	0xD0
>>>  #define			APIC_LDR_MASK		(0xFFu<<24)
>> Honestly, I'd prefer to delete this constant rather than to make use of
>> it.  The typo in the name shows it's not being used at all.
>>
>> AMD have a feature called Selective EOI where you can write a vector in
>> and have it EOI something which isn't the currently in-service one.
> Makes it even more not to use plain 0 for the present write, I'd say.

Nonsense.

This is introducing a layer of obfuscation which is unhelpful and, from
my point of view, firmly unwanted.

Everyone knows you write 0 to the EOI register.  It's been that way for
three decades, and it's not plausibly going to change.

The code used to be obviously correct at a glance, and now it requires
looking in a different header file.

~Andrew

