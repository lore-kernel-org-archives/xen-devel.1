Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3450606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Py805dZa
Received: from list by lists.xenproject.org with outflank-mailman.1500792.1696868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVo8p-0008JD-Gl; Tue, 24 Nov 2026 10:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500792.1696868; Tue, 24 Nov 2026 10:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVo8p-0008J6-DG; Tue, 24 Nov 2026 10:52:51 +0000
Received: by outflank-mailman (input) for mailman id 1500792;
 Tue, 24 Nov 2026 10:52:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVo8o-0008Iy-9Z
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 10:52:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVo8n-00976r-Ld
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 11:52:49 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b056c75-e002-0a2a0a5209dd-0a2a4502c9da-22
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 11:52:49 +0100
Received: from [52.101.53.6]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b056c80-4900-0a2a45020019-346535064217-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 11:52:49 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH9PR03MB111357.namprd03.prod.outlook.com (2603:10b6:510:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 10:52:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 10:52:46 +0000
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
 b=njN9NjdeUbB74mX0PiZac7ib24Dqn+vAvaBG3iRsBjRGnp4NdZ6gv/E8XHrqobphPVXB7ZW5pnDNvil05MYMkXPWNWKUzqW2alyujznV4NpX0KKnSGAMOAG27iiE+TSCExzOrX/eEfk+LQhRMDrymRZ1WqKjNIud4Hq9MZdzIDL/jeAFXuIUsG/e4G16lSGwV7I+G9DLrhDFlmytnEcxBL6e+MDfCFX93w9AKpcIrjBjRAk1xiTwNpezvKM0zu11WaB23o8YIuwJAgRNpc3EttPUHO4MKGB9+vO6rxGPQIZ6HvJgQOCsS8pC4Prp2D3It5JOeV//i4L7JoGmyQJH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jACmF0UNU6n0dAiuMvK/8Py2DkogqaRAA20JIviuqFw=;
 b=ZVD7bffuR7XpdBlzbzEagGx8dTNGtVyY6dqWJ+ZSX3nqJAoNnHrgwn4XtMNU2l7SwU0AeSPW4OfpXKwrF2qB13MtKtnowfc4+nrU+zcQwmNtA3qvVb/G+0F2YOYoSEqFUrnlPX8HfHk0fCZrD8WrShcpFA66//PXpPnKJKGCyXI8jIpR4gmq2nfV8fnRP5QfoWCYbRVb5XH6MWDz1uu5P6TLsJJL9PeeaMbHp+nfW+w/HDZABEr7Gnuu1ZCsAKmjKbqxkdZ9hE1KcYz/lD180GZJWlLF+BShSQr3cyR5Q7gRXO9S0krFQYeP1oNNb8e9BppUCt67cXMMR4IqmMjCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jACmF0UNU6n0dAiuMvK/8Py2DkogqaRAA20JIviuqFw=;
 b=Py805dZaHj8tYcDLWoMXlZ7ejwvohUN7a4HarXgSdoTLQXGxtb2ZTaj0Q4/GJJeHoxNBXmH4F5W7+3LFrkh5TlszV93gush9X/2A8CLWf2NBjHZiUzNzgwqQ/9mXGeG/Xtouf17QdbSNo7lF6QFYvDeNkJ2iUwdmzSpeiqmHLC8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <79fa9195-1356-430a-b006-afece17a6b24@citrix.com>
Date: Tue, 24 Nov 2026 10:52:42 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 01/50] x86/mm: introduce populate_perdomain_mapping()
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
 <20261119-asi-hvm-v7-1-6551b6d5c879@xenproject.org>
 <cfe33c3d-7b0b-49b6-a250-81da2b8c3b53@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cfe33c3d-7b0b-49b6-a250-81da2b8c3b53@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH9PR03MB111357:EE_
X-MS-Office365-Filtering-Correlation-Id: 700eaca4-6a44-41cc-7616-08df4a1912fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|261028144727099003|10067099003|4143699003|11063799006|56012099006|261022105027099003|261009223027099003|261022075727099003|261026140227099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EjcbgSX7gdEdiAADiVYes33i/zXkpE4Y+ysktb0yQmSEIleYg5mtLXNQnXfcF+so58j7xPq4u4W0e4d0kjNDJ3ANT8EL9x1z62+CVH/2z2ZNDwmvTwxNALEdXGwufwESHXK/Sh+1xcr48CtW6ke+2l7JYv2l4d0BymGTt5/4ZvGEA7nYtTxu/57sgKFM4ykVwmKVDUlhZaC7A/v7Yc0E4d2lfQUvr1n0Kh7wlfpd/aAscEEHijLkAQngPeKXo551hs7NE2ch/LgTKYVjetYUBlBMAcHgTOZd0S3WISyBNXrkkYU0uwKxCHNfNSUWzVzX8MsIExadjN+CSe0biZpVpKYFI6AmKj+yUkNFwTPGkGD1RFL0SQMtB7k3FYJkEMXZAnGRPLBf3gUP9HILYi4k7iDAQnQ+/GakXvBxUE2ZnpWa7SGuB8BDqUCuiEc1yq4TAIkJymkIA/OyNhKsY/wtJJCTf3U+tW/g+1ebcukLJe9aA36Zc6mjzYof95i9P4/Fh4O/bS+i7yGm+qG3YenfcdOvAV2+XPnyJ72g9iz01kDl/SJGRZEcbhIE0Nt98zhcrSMqDGcblvNFJCT4DCVoluQQ+J97v378AY0FVy4TIGybbDb88cXrLGcaMiqufAoy5lbZdcqUDt8UB7I5jlyLO4lsX/vp3B1JeG1nQbUuWUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261028144727099003)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261022075727099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHpIWk5wVjdZQy95MDl5Wnh4aXNrMGVuc2NLSGZmQVJoeWEyeU1FMCtOSDRp?=
 =?utf-8?B?VHJUc2ExNFNDSDZ3bk8vcUFzRTVGbWlDVVJkLzE5di82blNVeWNtSVJiUldm?=
 =?utf-8?B?VjNxWUNkTFgxYWpyakE1TlBIYzZnZWdjTDkvZ0xmZnc3NXRGeEhkc2Z2UUhO?=
 =?utf-8?B?eXUyTHNRWDFPOENyMXdEOXc4cEkrS2Q4MGMzMnRrdEQyQWpKdUdkNkZnMWtW?=
 =?utf-8?B?Mlp3MVJ0bWdvVGI1Tlg5T1BZbksyRHl6TFJGTnA1d1FtOTFjR1lWZWcvWnVm?=
 =?utf-8?B?bWZEN080eGR6M1pHSjd1M1BscUZtc3ZHbmVJS3dvb2E2K3U3djJWdC9jUFB1?=
 =?utf-8?B?cGNHTzFMMlZJWVV2cUpUYVQ1Q2lsRTZXUGtUM0laNU40UFpDOHdmZEZTRjN5?=
 =?utf-8?B?UHdpN2RKbFZSSzNwYS9HM2tpa2tCQUIxS2k3OGRvZzNrb1puSmZYQkJvVlRM?=
 =?utf-8?B?YVJmTERST2dNWWM2dC9VcFZVejA5OU9ESnBpMnlJU3ZjOGdveXhTMTVndFAw?=
 =?utf-8?B?aG40OW9KU255R1R1cHVYY1Jvc3dUS0FjSkRCY0FaL2ZiaFBGNEpwVXlGam1p?=
 =?utf-8?B?M0lFSmhlQldUSkk3RmxJNEh4Zjd3Q2JuQnhHVWNKSFZvcEdUVnlUUHVmQ0hk?=
 =?utf-8?B?ZjZKeVF4ZDNOZFNySGlJa2xpM1pHbGlqMXhBODNLY0dvaVBMbk9vY0V1eWJF?=
 =?utf-8?B?R3JQMEEzQmVBQjNNZFV5aFcxNXFCdGZjZ2tEb1VGMzIvcXd5clFpaGhndXJ0?=
 =?utf-8?B?Zml5c1dyaFZHUWJvaWlkS3hrRHJxdllPTUVYYkQrZmRDVlVYay9vblVUc0JO?=
 =?utf-8?B?UW9NbEJFQ1BNSWZ4bjFoWk9haG9MZ1BxUENhamdSMzZlYXVvWG4rK0VOb1Bp?=
 =?utf-8?B?MWt1cFB2TTc5aTZjU1MwKzcwNWVhZGtmTGlkYlE3YWtHaFlRTUlHYUJnOGdv?=
 =?utf-8?B?RUNkd0FCMTI2NXVpT2E4ZVFMZDM3MDd2dXNUZVVnYkp5UG1ycS9aQVVpRElr?=
 =?utf-8?B?b1BYc1N3VlBEYnVVbDdnZk9TTThwNDZHd04raGxMOTVsZzhhSkwwd0pobkdW?=
 =?utf-8?B?TUNtTVd2cmZWNXRuYTF3UXg4c3ZBQVk3cmNVblc1Mm1wVmhMYlZZYThEWEtk?=
 =?utf-8?B?cXhSK2NmSFBnbU90bWVCNEJWR0hPQzdzWUFkZVRTNGJSMjQzQmtHZ3hCTVdM?=
 =?utf-8?B?eDh2dkc4bzVmU1hzODFaRGd4UFdOenNpenBYYmpxNmZxZGdHVStlaFlVcXJl?=
 =?utf-8?B?SnNoc0t5aWJJZEE3WWtJUEttVGVjTDRUd0hTSEVjZ0ZLREQxbzUvRnVtVVVG?=
 =?utf-8?B?MWdDVUVyUURIRVR2QlRRNUJVa1RUTUwvbzJjUG1zNWk1R083V2F0MlpOT0dr?=
 =?utf-8?B?cE54Ym13bEwzamJNeFdGaXZ1THdnSGY4R0g2eGhlZzN2ZXAxOWttMDFiL3VE?=
 =?utf-8?B?SCtUcDhNQ2lwRWF6Tkdlc0I0NlJlRkFLeWhSeFlIRFB1aEY1SXVaMXE4cC9R?=
 =?utf-8?B?YVFhRU1oSHZxNzhqZjM2ci9QU2VENFdVS1BmVTgvMHMwV3NvWmxwRzJlRzA1?=
 =?utf-8?B?c0tpanhtSHFYN2lUOXpaZFRjZ2ZQWWVaUnNOZmZCSUJ0SjJ5ajcrNURkT2V1?=
 =?utf-8?B?Y3o5eVR1eE1WbDhZMHVkZHNocDhCSytkWmlrOXVqb214d2lnUlAzZDVTVCtS?=
 =?utf-8?B?Nk1ycWJOZEQ2endUR20xK1FxNlpFZFh5UStDb2Nyd1lSRjQ5OW0vOEFjTmtI?=
 =?utf-8?B?MGdxS0ZpeTRTRDFMVndrK2ZXSkhPbmZkRzJoNXdZbGRFcU5Zb29neU9UUWla?=
 =?utf-8?B?UnFtaVZzNG5oNjhCbmtUZkpDT3lUN2NDWnhWNTlCanB4NE1ISzZtZnVxaDZH?=
 =?utf-8?B?M3YwQ2FkdzJpeitrNkdkYUtsSzl3empUWCtqSC9IWklGNi9aSWc5OHNBdnFw?=
 =?utf-8?B?LzdkRXdxY2o5NlhyenNUVi9Ycm5IZWRjQzcyV2gwSHVUaHJwaVJTeW1XMlNL?=
 =?utf-8?B?eDM0MWNzSGgvZDZjZFZHdmFDSkZVNTIwNzFoMzRnOVZIcjd0WXhpZW9kMllM?=
 =?utf-8?B?NVl3NnBjNnJGb1ViQXlzb3g4VmVwa1ZYRE02S2ZxV3dYYmYrb291aVRNaS9V?=
 =?utf-8?B?MHZSUk83R2Y2MXBmYk1ZSzBXUWt1bUVPT0Z1TFBkY1BlQTZQNGJBMDlCcnBD?=
 =?utf-8?B?U3BHUzN4U2ZzTWZjNDBLRUV1MHF2TUhUVzJqT25BakMvbW80c2huWCs5N2U4?=
 =?utf-8?B?eDcyYlZOR1B3L2RnQitzWEl4dFh5QStyeWxMOFFKanhIa3M5Z0prMm51aTgr?=
 =?utf-8?B?ci9MUDhyOWxaZmxTbXFDOGpteTliQzRsZ0J4M0dDVkdBbVptZkc2QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700eaca4-6a44-41cc-7616-08df4a1912fd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:52:46.3960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Bi/w2OJ0B/UyRNxvBzAPO+PglB+8znReXXIX8a2cBzXlhK+YRKhr9vvr6gbECZKktpJNTtTL+IQWVmgFprDTdvPabaNQcE0sO6goFdrtMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB111357
X-purgate-ID: tlsNG-720697/1795517569-F05846C6-ECD1CDB4/10/78276251493
X-purgate-type: spam
X-purgate-size: 2663
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 1:25 pm, Jan Beulich wrote:
> On 19.11.2026 22:06, George Dunlap wrote:
>> From: Roger Pau Monné <roger.pau@citrix.com>
>>
>> The per-domain area has central machinery for building its page-tables
>> and for managing the backing pages it owns itself:
>> create_perdomain_mapping() / destroy_perdomain_mapping(), used by the
>> mapcache and the compat argument-translation area.  What the interface
>> lacks is a way to install a caller's own pages at a chosen address,
>> which a per-vCPU state window, introduced by a later patch, needs: its
>> users allocate their pages themselves and map them there.
>>
>> Introduce populate_perdomain_mapping(v, va, mfn, nr, flags) for this.
>> It writes the given MFNs, with the given page-table flags, into v's view
>> of the per-domain area, walking the per-domain page-table structures
>> with transient mappings, so v need not be current.  Callers don't need
>> to know where the page-tables live or how the area is structured.
>>
>> We require the range to already have been populated down to the L1
>> tables by create_perdomain_mapping().  TLB flushing is left to the
>> caller.  A present entry not owned by the area (!_PAGE_AVAIL0) is
>> replaced.  A present entry owned by the area (_PAGE_AVAIL0, installed
>> by create_perdomain_mapping() itself) is never expected: such a page is
>> referenced only by the mapping, and no caller replaces area-owned
>> backing.  Should one ever do so, the page is leaked with a message
>> rather than freed.
>>
>> The function is not for contexts with interrupts off: its users map
>> their pages when allocating them.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
>> Signed-off-by: George Dunlap <gwd@xenproject.org>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

From AI review:

9f9e2532c2 x86/mm: introduce populate_perdomain_mapping()               
                                                                       
                             
  - Suggested hardening: add ASSERT(!(flags & _PAGE_AVAIL0)). In the
per-domain area, that flag marks a page as owned by the area.
destroy_perdomain_mapping() and free_perdomain_mappings() free any
present L1 entry carrying it. So if a caller ever passed it in flags,
Xen would free a page the caller still owns, and the caller would free
it a second time.

Recall that 1cc1f4d7a047 was only not an XSA because this infrastructure
had not been committed at the time.

~Andrew

