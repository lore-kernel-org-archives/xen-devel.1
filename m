Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0462606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=dfm4yhzb
Received: from list by lists.xenproject.org with outflank-mailman.1461615.1672665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNtj-0004pf-N1; Mon, 26 Oct 2026 16:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461615.1672665; Mon, 26 Oct 2026 16:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNtj-0004pY-KM; Mon, 26 Oct 2026 16:50:11 +0000
Received: by outflank-mailman (input) for mailman id 1461615;
 Mon, 26 Oct 2026 16:50:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xLNti-0004pS-Qa
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:50:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLNti-001PPF-7F
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 17:50:10 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf84be-bab6-0a2a0a5309dd-0a2a4503c6e2-6
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:50:10 +0100
Received: from [40.93.194.14]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf84c0-fae8-0a2a45030019-285dc20ed227-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:50:09 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5285.namprd03.prod.outlook.com (2603:10b6:610:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Mon, 26 Oct
 2026 16:50:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 16:50:06 +0000
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
 b=u+0kV90Pi01Li5qywppNXXtLIiXETQNQrytXcSZjmLcgry9Zb0V3Ax1vf6pa2666dSryTGpKiz3B2AGf2v88KFSm5uLeGlTDsELMyQplVwT70i3A+hmpEWiYe0oIveGrDcbj+AQL3mGFs/LzTlueJy3oKwQHEgaRyPiwlJUkWj2PMEks6LwJslmR55znI4sDMHFtDgFVG4KP+aPrZzeiJlIOGfY2xd5wBLABUCf8aKcn6e3yQbVOEQHL3OtckSupM2l/FojDrSBVyZONSLjrAbM35eaaYxQxWeLGXCdkFkQ0x+XkH4Gn89bMze9bzKVpTaAbVHyHYVvSmHr3Ahe/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMdyQ6Hqa9K3PllenI77mVJV2eRPTEtGoPhOlGD45OM=;
 b=rG1+2QKLylBxjKP3ijm6g243/UvEqmKDOhp3lN1WJJFFr8kCddVB6Bw3+1fMMmza7/0YyJCrqz1Yej6oIxukCCEPPGRuwMfEwdpwI7a0UhdnMOr+mJ+qY0cLV6dn+zWVRP1klWFUszUO3sKVnsDW2d//6duY9rX5OUiLpveeLeI5iZnQPUUPJMie0k4grHgV4++TBJIYRZgLPU98WoN+TOTPGaj/WcMMl4PVtY+bv5D041koyRPiM/xC4n4uQ3i+LV5SDZFP5Tps5iHYlN+URWFc5pZ+Ft9FGozxbC6RSElKLTXVIqFSmIJ6nw8ljs57AbUFjcRiWuhkwpehrvvFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMdyQ6Hqa9K3PllenI77mVJV2eRPTEtGoPhOlGD45OM=;
 b=dfm4yhzbJDJTV2o2CGDxADRopLdUVF97L83Mutgyorr2qMbCDa8lZY0wmzhk3CBQgH2DZ6QLMaVxcC/FB1ug7KGLlFUd4+N2IXph3Jc+ZTw9xstu71UvzwxUXH8bM/Kl2aTf0jflbNNhU+m5YeO1uYC/QXzvhr54v/01g350Uyw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d87401fe-aa8a-4a96-9554-6b6a20cda506@citrix.com>
Date: Mon, 26 Oct 2026 16:50:03 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Andrew Mbugua <andrewprecious388@gmail.com>
Subject: Re: [PATCH] tools/ocaml/libs/xs: Create FDs with the correct CLOEXEC
 status
To: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261012201857.714448-1-andrew.cooper3@citrix.com>
 <1793024310.8631fc262581453bbf619ec5b2062170.1a17893baae000f79f@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1793024310.8631fc262581453bbf619ec5b2062170.1a17893baae000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6ef994-f8ab-49de-1b88-08df3381308c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261026140227099003|4143699003|56012099006|11063799006|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261009223027099003|261022113327099003|261026121527099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XP93IzkoNtYfpoOd1mVrouLBJvGUl7Aw59xdVSkZWLpD2enu6VPXL2c5na1TlEYDd++ivizB+ae5YIE2wwuI0g0jy74xcS6DrmCsbn1GDzeE4igzkgzbs6JJ/lynQ1EEmlWiWdLcwpdyf/vWTIz8ll5Ndi7KCx7NDbsaVrPjXGGNPqJ3QMPUkWOjHJMCjBZ6Lg4n9Vkn4EEHohoE58PLSFza3wRYZ16e7RMktqe7og+WxZCHPsApf/Zpm2Ce8g987MVWDqx4OkBhFfkMkXxyflQ3n9gU7b0jvlO4ESSDRFeEOqpwj+AeZJcrmPUfzJPze68vRnxgB4bAxEgBXnDiC115fKeeJFBSzVK9qRB25+wzcqrUN2XRw4Z8MKPLy4/0rpKC/5GNq0luNEDy4t07XcXQO3evX00qAXG1D+YfwrzgcRVZSDSzz3URfD5cDFzcDS4L7FxLUzU8JWkCFs5W12eUMLFs4yTtoEkdQc8IVTSWLGvTPRCjDb+UDULX8fAiECK00DHeuEB6nbIobdmvvIbb00ucyzPjH4vDf2vmgRhrBLx8zbGYMqmdNQbNN+oo4Hx/tDspvwuOq80/de9gth1C+7p9HQiHWxLT5GSjQZHPtAkyziphAWNgr91Z54wM7X1V/X72RfgXIGjhw51MC4aPr9/rViw2Yd+mPDWJFDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261026140227099003)(4143699003)(56012099006)(11063799006)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261009223027099003)(261022113327099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG5VbUJuTlplMTlSNk03SHdYKzlNRmdtNUZWNkhpUjhLcml5anBOSlZzNUxZ?=
 =?utf-8?B?QVBIQjZPYWZRbXYwMXRVTHliaEdzN2txUFJaQlUxVEhnNXV4SnhrYlhFRklv?=
 =?utf-8?B?Q2pvQlNETy93OHNCZ25qVXU5Z3ZueGNxbDlaaU0zVE95dlhjZjZKV3pzWTN4?=
 =?utf-8?B?aEs2a21PZzZlaHNWcGxkTmZmQlVjZDlCcHFHOHgrRnBnWFJLRjEyREVSTDR2?=
 =?utf-8?B?WU0wblhBcWtRNlpaOUdsWUIydFRkdE5xQmxHWnNiTXBiN2lXWmVBTzBVM0ln?=
 =?utf-8?B?enpRdUw2OTNZamltVDdMUW84WXYvUXgxczdZSkpxTWZPdURwV0lySVJmbHRu?=
 =?utf-8?B?NTY0Q2dmcnJ0M1BzL0VZSWsza2phaENsVjBJUy9UaFpzNC9NQnUzNUN4SHRP?=
 =?utf-8?B?WHF2bTVUUk5vZU5zSGhsODVCcUNwa1M2UU5jTDF3dmdDR0U1R1RLM3pkamhO?=
 =?utf-8?B?RWgrSWxweFhKaUlBSlhpQjJ5MEdHZTRrZnNIM2xuSjFTN1FJMWFCTHVXdGJP?=
 =?utf-8?B?REdUWTNzcWlOdFFRdHVQWDIzVDNONFE4Z3YwUnVOZDdEbXpRYVFwM1VqMGxw?=
 =?utf-8?B?L2ZSMk03SHdFTUhMK2twWDVjbHpnSXZNL1BtWW5MRG8vVWUxR0pEYmdLS05I?=
 =?utf-8?B?THBmWEZja2s4dkc5YWRJbFQ5SjJuSGxOeFIrSTR1eVMraEdtak1uVktYZU8y?=
 =?utf-8?B?L0cwV1l1VERyeXZnQTNsK1Mwd2M4dnhvKzVadk1XNmFobmk0a1hGZlY3bllP?=
 =?utf-8?B?YSsxZTNReHNGRUZEWjc5d3d5bGQ0OTFxcmdQdTdSRGo2YXYybDZ1WnBwTUcz?=
 =?utf-8?B?eHF5VnR6Mm1EN1N1UGl6QUo3R002QWZNOFNyMTZFcFphUlBnbUhyNTlQbW15?=
 =?utf-8?B?M1V2Y0d5TUlxdlZrelFjcjRmekVLWW85S3QrcVJLSWNHQ0JtaVdBc0FaOFRL?=
 =?utf-8?B?M0JMNDNKL0E0NGhvUWpJcjh0aXVpNzNud3QyZ1lvdHUvVS9jNit5QkxpVElt?=
 =?utf-8?B?T041bkhwZ0tydDlRcUpxeHpjS08ycHNkZURJRHdXeVIrMWNIdno2VVM3NTVF?=
 =?utf-8?B?L0V2TmJ6OVMzQVplbDBwQWJYd2F5Y3I0SThzTkJJRXdLVzdNQmVLWVFQQXl1?=
 =?utf-8?B?UG8zcm9OTDk4SytNc2xlcjZDV25BYVNod2dVTXN6cExpZWtGVDhqTTJ3RVJG?=
 =?utf-8?B?aDYxRWlSWU9pTndnc2JCSVNORVZoME5kVWw2OUoxZlBqSGRVNVloeWxibXV4?=
 =?utf-8?B?TXFDOENOU3BTVStXQlVjVVRlYVJXWFJ6SXdsZnZMSytmZWtPcnZkWjh3Tkc0?=
 =?utf-8?B?KzVDVG5NZ21TQ3hNWlZCZmdwNzdIVkNFVHJiMnJjc2EzM29SZnBNUDhYck0r?=
 =?utf-8?B?N1BYMUcrQ3Nhb2xMem9paCtSMStaQnJIQWNvOUNFdGdqTGpFcjgxWjdaMTNN?=
 =?utf-8?B?eUkvTUVvRGRydUNxcGRNOE5VditVOUxoU0pCTHkwOW5KMm5pOXBoWXY1c2hO?=
 =?utf-8?B?TVpMeEJHUy9YeGxFemJ4ZHdXZ2NXeERobjlBV2szMmpLTS9IWW9DWHpuNHFN?=
 =?utf-8?B?SHNKaFNBdGdmNVc5bGh5N01vU3VhbGlGVXY2eC9icHRJUDlYTnd2L2lzSG1n?=
 =?utf-8?B?Qk04a2JMVngwbU1ZblkyZTB5OEMvWjZ3M25KQkZtTkp4WXk5SGVoQk9sUm14?=
 =?utf-8?B?TDhVazA2V21pc2NQbHdlWGh5dVU3OFlrdjlqRit4ZGV3SlpRTVFudmN0R0FM?=
 =?utf-8?B?NldjRUFjcjFIQ3R0NHNKVWxkd3VwaU5YOUJ5TFdaR1hmd0FSYXFZWDlVajVl?=
 =?utf-8?B?MDN0REJRZUxKYXVFMFVVSnN5YkJLeTBmZmZNNWZCV01TTW15Qi9qYXF0em5y?=
 =?utf-8?B?V2d4NE9ScTF4bzlHNDhXSW1wNWRYbEVSVjNSdXY5OWE4RjlzMGYxSnhVUHRE?=
 =?utf-8?B?VXFLN2JzQUdzY0NiOVV1d3p0V3JqaHdTMlVIMzd0ODU3czFSS3RpZ1Z6WlNa?=
 =?utf-8?B?dEFUc0NyN0RjL2dVNDJrdVNsUmdDL0VRYm9UdVRSU3hvdC9JVkZjdmlIL0k1?=
 =?utf-8?B?NXdNeXVWaGZhSG1WRElaWnFRRk1iYjZrWk41WnYvb1RjRzQvSmNLM24xeEds?=
 =?utf-8?B?Sm5jaUx2dGM2YVRuL3J0THhYdktscjhMQjZVdXZrdTMrY01IdDMxRXMwMncz?=
 =?utf-8?B?UU5yVGU3NnAyR2tDQzR3Q3c0V21PaUxPT1laVmcwOEhxTkpYeXVKNHJMWGkz?=
 =?utf-8?B?UDR3d3REZ0dnb1BzZ0xUR1VnNldraG1WcURNQjhXRXUrRGRyOTZTajdsN1cz?=
 =?utf-8?B?bFpUWVk1TzhYM1ZBNlY2am5oZWNqbmQ3UVRmVTlpUjRLWlVsb01hZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6ef994-f8ab-49de-1b88-08df3381308c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 16:50:06.8972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFJVjlto5nzicdSVDh0YF1jjEF8MtmIRqfYDmwrhsJTdetn9n1QX++PVUeQq4ppmUbNB0iYzad7SeS1RsD+QMfEXOPRwMR1khxq/1TbYG8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5285
X-purgate-ID: tlsNG-33051d/1793033410-7428D4E9-0AE4A5BF/0/0
X-purgate-type: clean
X-purgate-size: 2694
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 2:18 pm, Andrii Sultanov wrote:
> On 10/12/26 21:19, Andrew Cooper wrote:
>
>> ... rather than editing them after the fact.
>>
>> This capability exists from Ocaml 4.05 which is also our minimum
>> supported
>> version.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Andrii Sultanov <andriy.sultanov@vates.tech>
>> CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
>>
>> Found while reviewing the other FD handling patch.
>> ---
>>   tools/ocaml/libs/xs/xs.ml | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/ocaml/libs/xs/xs.ml b/tools/ocaml/libs/xs/xs.ml
>> index addccc80099b..a088d67a8cb6 100644
>> --- a/tools/ocaml/libs/xs/xs.ml
>> +++ b/tools/ocaml/libs/xs/xs.ml
>> @@ -155,9 +155,8 @@ exception Failed_to_connect
>>   let daemon_open () =
>>     try
>>       let sockaddr = Unix.ADDR_UNIX(daemon_socket) in
>> -    let sock = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in
>> +    let sock = Unix.socket ~cloexec:true Unix.PF_UNIX
>> Unix.SOCK_STREAM 0 in
>>       Unix.connect sock sockaddr;
>> -    Unix.set_close_on_exec sock;
>>       make sock
>>     with _ -> raise Failed_to_connect
>>   @@ -169,8 +168,7 @@ let domain_open () =
>>       with Unix.Unix_error(_, _, _) ->
>>         "/proc/xen/xenbus" in
>>   -  let fd = Unix.openfile path [ Unix.O_RDWR ] 0o550 in
>> -  Unix.set_close_on_exec fd;
>> +  let fd = Unix.openfile path [ Unix.O_RDWR; Unix.O_CLOEXEC ] 0o550 in
>>     make fd
>>     let close xsh = Xsraw.close xsh.con
>>
>> base-commit: 0d3bb3c98bc99ec1c84ebb3df71b6e18daebff4f
> The change on its own is fine - there's no functional impact. But as
> far as I
> can tell, these functions are not used anywhere (they haven't been
> used in xapi
> in a long time), so there's limited utility in this cleanup.

Agreed, but it's still better to have code be correct, in case anyone
else is using it.

Independently, we should see about pruning the libraries which aren't
used.  Sadly, they're all mutually entangled.

>
> Regarding your question from the original thread, if this patch was
> intended
> as an answer to it:
>
> > Where do these sockets come from?  What flags where they opened with?
>
> The sockets that are dumped come from xenstored.ml:process_special_fds:
>
>       let (cfd, _addr) = Unix.accept fd in
>
> The default is keep-on-exec, so there shouldn't be any need to call
> Unix.clear_close_on_exec in the patches suggested by Andrew Mbugua.
>
> Acked-by: Andrii Sultanov <andriy.sultanov@vates.tech>
>

Thanks.

~Andrew

