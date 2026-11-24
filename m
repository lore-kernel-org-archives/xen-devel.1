Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91838606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=eiM19WwU
Received: from list by lists.xenproject.org with outflank-mailman.1500750.1696797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVnQi-0008Fr-Ea; Tue, 24 Nov 2026 10:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500750.1696797; Tue, 24 Nov 2026 10:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVnQi-0008Fk-Be; Tue, 24 Nov 2026 10:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1500750;
 Tue, 24 Nov 2026 10:07:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVnQg-0008Fd-Nu
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 10:07:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVnQg-004lpz-0d
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 11:07:14 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0561cc-8faa-0a2a0a5109dd-0a2a450cbcc2-24
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 11:07:13 +0100
Received: from [52.101.201.67]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0561cf-f479-0a2a450c0019-3465c943069a-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 11:07:13 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB998613.namprd03.prod.outlook.com (2603:10b6:a03:403::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 10:07:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 10:07:09 +0000
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
 b=THAGazSNb4gPqZahiJHKcScEMgxPAjWiFOoI31n+9FyExTNUblhqb9SgmSQRfgk3OVx7fH7oOzG6De4LDa6RdZNECFzg+qLrrsmw37M37XrFZIbY1p42eBt/+sWn+6uHFVNZCPVOnxDV6O3SuArmJOQJThu8F5vFGl74UdCXJL2gf5SYTA6tLBD4yZsOUxKAuU3odqEtcGeFmH4QnMRqNj1eHcophL8iC4m3jmcENq+xI816W4A31Rk7GCOvDWRUHE4LQIzSfGD8YFbDpyTqsYlAJLYL5QWMjkHu429ONXa9c4h8yt5WrVYw+UiZKzDvVTOzop5aYcZG0VQ7wz1bbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un+8wHYINz1IpvYrsqxJxTedmszpyXc4G36YuFI5hPQ=;
 b=l5uP5yckO08/vNQRdZ9uj457EsDF7fV8bhIG27Q373rQMLQSErRBePV8Ws5OATPKx+As2Adt+TBYZAZNU79VgD2uqsjlj4/Dciu5gY1ujE9Mqb7k1gChTLSluEYkMdsO2xcVHxngXtbW7UEGLmItVcQuSLXgYMSQNwWREHzFr5qcxz4b7y8oadx9BDX9eQ7e6m10BLuSNDDyG96x/unhfcEutaVUh9bzn2vXBI8ijkF30n7pfix5dBU1MRMtHjSCYkTUQkscMylrwKqXkkU2AyuMsRGGSfOkoLjJtD7pXDdKHhwfXfVkekLU7GHYkmfSkIAGac1Sp4kVCxrQW4V7mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un+8wHYINz1IpvYrsqxJxTedmszpyXc4G36YuFI5hPQ=;
 b=eiM19WwUpGPuGj9Bn8qpaN2blBLrQTpxzsFU2KBSUDiQ96LiMYpWSoq9agKjOJgmKCZlmJbPhrSaPTV0I93AwmvI8SkayIuaoyDNxUXacDp0+YN5uctMHWpQ1atLxfNF1rsgtwaS+NKf1Oaryj4kPPoDidg9797uoMfoIVAXyrI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <87769147-f4dd-4e61-a6fc-32bbcf767614@citrix.com>
Date: Tue, 24 Nov 2026 10:07:06 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 msd-xenproject.org@msd.im
Subject: Re: [PATCH] libxl: simplify and correct domain ID and CPU pool ID
 parsing
To: Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>
References: <d2cbd116-875b-4441-9338-9788cd72e5dd@suse.com>
 <1795450059.8631fc262581453bbf619ec5b2062170.1a20929b8bf0001cf5@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1795450059.8631fc262581453bbf619ec5b2062170.1a20929b8bf0001cf5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0519.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB998613:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c1af50-1832-4451-79e1-08df4a12b382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261028144727099003|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261022105027099003|5023799004|11063799006|4143699003|56012099006|10067099003|261022075727099003|260925021911599003|260925022911599003|260925021311599003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y7erdx4BEAUEV4K+Kq5Sr52JJRiqtlOb98rfRgZa5Y7VlHR0enfobpl57G+ojUFote7TTQN2otIkqb4jwzLQwQl3dCkyniT6pR00zm/TrADtvpvaEUk99jwuiphUpakgt6LGQJEuoybItkSTloHoIj0/rooQjIDeUjs2pWzfGRkcMkkkClH/zMmZH2oX8iOUMrk23/7hm7AKXvYioz6vAOqfFNISiMUj4KmjbT7cHNWQ1otZVf6VrPpH+UVk8hdYj3Uvc8LOuHnpZvouEd9v7zbTjDb+epXSXVMsVz1zA/VPvtBzmvOmiyDkTZ/JJbAoG6t1hXOAcD2qNdJzp4cGDtMXo2pShqetCzVqz7+sSsH2i2LkRKpnwSbP2WLzepBMURxR3lSb9fciL8HIc1X/GxvFWHdvlG2rxW8QFO4COnTRheKLHbnPi612ysoStBgMsT1JGvUVsptGOK924oojnntxdi1rwWLkXcOVnJgKW0j4p0aS0LvgDfZ1hFr8OQE2rqu4zAsqe/ARtTRw5BNaMzOUbI9VxLC95yl+CsrG9B3MPOcrJxjyWegwvM4hatO8Vx7eNlCv7ByWTZ1gIkD7ql3YKyNZOcvJbZ/DHxcRw4IZMOiF7x6QiB0xNhwOXWpe8Ah+0Mty7FAnYpUCutlKkrmCZkYJxjtd8JDTLgqSKIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022105027099003)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003)(261022075727099003)(260925021911599003)(260925022911599003)(260925021311599003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THpEa0JaUThvc2JMRkxTWGNBeVFMZmVCUWU1Tk8vMTl4dWR4aHdmZmEzaklO?=
 =?utf-8?B?eWQxZUdTVWJkcllBN3dWek1CRlE2cVhhOTl3UWVubEMwaDQ0bEJrM2I4clpm?=
 =?utf-8?B?ZDFkUlZkQlh0dEpPSWVZdnhBdTBWa3B4SUlUdTZxM1k3K2pJUEtUa2ZqTUg4?=
 =?utf-8?B?UFBWUytYRjNjTGUwNWJzWUtkOTVZaXlzZy94V2xsMlBWOU1TcTlaZFNTUjd2?=
 =?utf-8?B?Q3pEd3dJRnNLNVpRajNSbm9UYzZDMGFsQ3llSmZEaWhYU3RQQnlXbXZrYU9H?=
 =?utf-8?B?TEY3YUF3dWl6N1ZLRW4zVHNEcGZIQ3ozaWYwMGNRYkNsLzhtcVQ0cTk2bS94?=
 =?utf-8?B?Sm1lQy9TT3JKcHo5UXkxK1YycHRVVFVvdUZGU0VrOTJZYXVpQ3czREZ4QWhP?=
 =?utf-8?B?bU45WVRDSjlKMDdoRmFFbGpkaEFIbVFsK1E0UnVYSFZYd25zcDNDVEdUYitI?=
 =?utf-8?B?cjJsTjBSbmI2NUQ2Yk0vcnkvanZXdjZNN252Y2k3S01KUFBpNEljNStsNDZD?=
 =?utf-8?B?T3c1VEZyYUhJUlZWRkNqMnRNV1g4Zld1T3ZJYlUvMXRXU1F0aW5IUnZlMWJB?=
 =?utf-8?B?TW1hMXk0ZldPM0tNTXY5YmlOTDR2VVBIU1pKWFVkTkhTdlVKbDNXbnNtL2FI?=
 =?utf-8?B?VXcxZzIrNFVmZ202Z2NJNzlhbHRTVXdLUzdMSkF6ZzlkZlg3OUZOMnhpNzFO?=
 =?utf-8?B?RHlkWlJVV01EQW8xeGlwTE92K0QyY0dCUysycUxDcTE0V0FzVFhhZEZpWEZt?=
 =?utf-8?B?QmpsdUxzZTFnR2s5bUJ6Q3BDM0xqeDlYN3E0blBCOGxiTnlSaVJtRjJQZlN3?=
 =?utf-8?B?eU45elJvQnBxK2pBVVVEL3hCQ25QeDZubTVuOVdHN0xWbDUvV3dhWDhxdFJk?=
 =?utf-8?B?SGV6eDhmSmxXNTNFNnovcmdHS1h3UXRQejVSc0d6KzFwa0N3UVI0cWJhbmxO?=
 =?utf-8?B?RlEyVHA1WEZ6T2REK1lXMVFaZXF5VUF2N3VTM1BCMVFKRFk3STE4QkRuT2Ny?=
 =?utf-8?B?dER2cmdRcC8wQVB0b1d1U0hocnhaTjMvcm5NTWFQdG5IWjk5d2xXcWdtemh2?=
 =?utf-8?B?S2cvSkJXTHFVWEZFa1d2bEZVS3RNampjNURrR3FEclBHSXZjY3ZWdk1aOEVX?=
 =?utf-8?B?U2RpTUZLR2ZrMnFaWm1HOWtudTFTOVBHRGVyT09ya3VBVFhJRzRSSjFwdjlk?=
 =?utf-8?B?NGloMTlZRWJNZTNpUUZydzZRbFNsa0dmd2JKNS9YM3lRVVc3dFA5UFVGdW94?=
 =?utf-8?B?ODNQTUR2NFhSTDkvYUNCdndCS2tMcDZoaktCQk14M2oxTXd4UVR3MkZYbm80?=
 =?utf-8?B?VEVDRm1VWWZHZnQrL0l5SHdqQ2VPRGtlTWJOUVM4TWwwTVRoR0xqeUVoV0NG?=
 =?utf-8?B?VWZkejY0S2J0U2tvbVdnV2FVREU4M1hmamk0RFM1T1JId2Q5clBUWm1kYi9y?=
 =?utf-8?B?L1FPSXNKeWVyd1Eyd2JyU0JBSGdyNVpvWTdIb0VNWHJjMmxnR3Y5VWdIOHpK?=
 =?utf-8?B?RDY3WDNoRXZHNWRhMVg4ZVV6RFROODdlSUtYbHI3WlRBTUt5VHQ1NFBZN2Y0?=
 =?utf-8?B?UitBQUtzQzVnRDhaY0RISXV0ak9vNGo4ZHhnaFVUZzNOS3dJeTBQNFhBTnh6?=
 =?utf-8?B?VVlRMkc1WFlJSk9jbVFWNytSMmlZRG5oUkNNVUx5N3NYNEZWL2xIUDU1ZXpN?=
 =?utf-8?B?QzdZQzAwVlVoNzgxMXIveXNwTUNNWXJtWXNmcDZRRjZNdC9taURFVzhqZ3or?=
 =?utf-8?B?emVEYU9ueTFrQkppK2N1ejdXRmZwQXE4OTRRY1gzZEhHWWFrMngvS0RhRmRu?=
 =?utf-8?B?cjJOR1RXbFcxYlBnRnJnWmhEMlpFQXRpK0sxMmpsSUxxWXQzYnZ4UXdmbU9n?=
 =?utf-8?B?MHFGRVZvcW9ra3R3SDQ3RElnY2NTVWhYWWR3UHdFM1NUZ0ZSdVM5OTlPVDFO?=
 =?utf-8?B?bnVPOHY4SXBoRFk0TmJDaTIvV2RTN05SQjhjUXhFRUtCTGI4cnRRamdyRWR1?=
 =?utf-8?B?VEJvWm5obkJoN2NxeGV5eDM4blFJTUxPM2hPcUVQWTFORWRMTmdVcDh6TFUw?=
 =?utf-8?B?anBzZnUrcDYvcXRuMFp4dVUzSTVHbStJOUxrK0hWTWVnRWY0MmQvVTZFeVdP?=
 =?utf-8?B?SENjblNmY2xXWnkvUWJnUW5yQy9YenlSdzJTQ0tzcUIxblJ6S3VaSUtralVD?=
 =?utf-8?B?SmM4ZjNGK3o3R1NpUDhwQ0dveC9PUTdTOFlpb2wxVm9SOVFsY1ZDTmVaNXkw?=
 =?utf-8?B?SGhJNGpVSkFQVFVmWTR0Ty9CaEdnZG9BaUdQR3pBT01OSTZ6SVNTTkFHaGpq?=
 =?utf-8?B?S2JxNkVHWmJqdWZiQm15ZkZmbEZSSjhNa3VrMGpnK0E1YmxjODZSUXRNSFVy?=
 =?utf-8?Q?Gk4AWS2q7PmCBupE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c1af50-1832-4451-79e1-08df4a12b382
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:07:09.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dvjjh8dxeI+/N/xGYrd9HG18eMVM17ECOI3sZCBB1P+Mpg9GU5Ot1pmTCDwiXLNd47Z8IbNXO0u2CSK8+3lwEDNkeKvSbPbiL7UvjmlIIkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB998613
X-purgate-ID: tlsNG-d25034/1795514833-766DEA5B-E9F5F302/10/78276251493
X-purgate-type: spam
X-purgate-size: 1313
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 4:06 pm, Anthony PERARD wrote:
> Hi Jan,
>
> On Tue, 27 Oct 2026 17:00:24 +0100, Jan Beulich <jbeulich@suse.com> wrote:
>> strtoul(), with a radix of 10, already guarantees that the string parsed
>> consists of just digits (and leading whitespace). No need to do that check
>> in advance. All which needs doing is a check for a leading digit, to
>> exclude the case of leading whitespace.
>>
>> This in particular avoids a domain ID argument of "" to be mis-treated as
>> a reference to Dom0.
>>
>> [...]
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>
>
> Thanks,

The fix is incomplete.  From an AI review:

1310e78c47 libxl: simplify and correct domain ID and CPU pool ID parsing 
  - The patch itself is correct: "" is no longer accepted as Dom0, and
the leading-digit check also rules out leading whitespace and a + or - sign.
  - There's an older bug of the same kind that this patch doesn't touch.
Nothing checks whether strtoul() overflowed or whether the value fits in
32 bits. On 64-bit hosts, "4294967296" parses as 2^32, which becomes 0
when stored in the uint32_t, so it would also be treated as Dom0.
Checking errno == ERANGE or > UINT32_MAX would close it. This wasn't
introduced here, but it's the same problem the commit is fixing.

~Andrew

