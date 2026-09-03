Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9044BC624D7
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 10:51:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406812.1639995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2526-0005r1-TN; Thu, 03 Sep 2026 10:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406812.1639995; Thu, 03 Sep 2026 10:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2526-0005qt-OW; Thu, 03 Sep 2026 10:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1406812;
 Thu, 03 Sep 2026 10:51:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x2524-0005qj-Nq
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:51:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2524-000cui-4g
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:51:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a99510b-bab6-0a2a0a5309dd-0a2a450a8dd6-18
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:51:00 +0200
Received: from [52.101.48.18]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a995112-f2d2-0a2a450a0019-346530123c57-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:50:59 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 10:50:54 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 10:50:54 +0000
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
 b=x3StNk+sUR1XlNPO9JsktuKZtbDy2CRzSVBnGVIxtk9WBTu9b4F+fFutRwzoyogO6RR1QeRUF0TFCTDMk+KCIXXLYH+5WJVkV5dOeX5w9K6ZS9s1ILQLk0mNJ1h/xi0mEz80YLKPEn49vlEU9k1X648vkdx8MH9PNgam2RXYUQSLbHIletVuUqfdjMI2tNMpXQp49rpKy2JTQ94eXB3ck6GsPT5mQpSX8Qsia5b+dzMpokb6aendccTJDFS7wjNIJxYHCL+ncYzpEI5TvXyla7bHE0/A148UzM7iMzVD5OGme2qfZh/vsYgN7+qwSuDXp5/akrj7h4RylbXKnYcUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kch8qOkHEkPc/Ww5+vdCouBnQFTkyN0e4Zof0B5mfYE=;
 b=vbC7yJqCx1k2qwNiv7wnWT+mvMmVBRmBwcFN1RmLBxBnO8bXa0Sl2Wrlw7f1JUIWrdQoLFQUqYJot2I8U0CqT/AnuEtUrSyK7dCZlzikIYPiXyZUy0D9CZiWOOYZM2GnhzPnf+rU6TPBpAHMlOqJHfst0x7lSIA5DDHwEeCOZNnHJm+bxUQe/H4pxG73MXlr3XSvq4NLzT9J1XqX5mKQa3veUzfBEPFVNXI5EZ67guzrSKbBgOyXc45NPwIBsVftChF9n6AWC+z4zNLIFRPqpjKRDLtTNqYkj4dZbadziUTjEK+WakJ9gttKY9M/otSEkmAShgKlM/h/bxuNYlIW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kch8qOkHEkPc/Ww5+vdCouBnQFTkyN0e4Zof0B5mfYE=;
 b=KSz9+WwaeaEe8I27ELpIP6n12diuiAh0rUnLfhucuxBrUEXdOC+cFU7THog7AeQkAPrHRZxltk2ekIXiqtB9Q1ES1UgGdiUAsByNIbOKjwcxxdQcoAzh2t91ftcGymWvnGQ3r2Aswa1bafVf4J8S+YlBhjDoRDUZhXHydy9+ZFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cabfc0c4-3fdd-4bbf-bdad-ff4b6d52a2e6@citrix.com>
Date: Thu, 3 Sep 2026 11:50:50 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v1 1/2] x86/viridian: Workaround Hyper-V GP fault writing
 to MSR
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
 <20260828131142.3986110-2-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260828131142.3986110-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH8PR03MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a40422-3b8b-40c8-94fc-08df09a93a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YRcJHF+ZoX75Be/lEKn7IQjxxZ9aAqML7VOeJ1LkOm1EKbcq3Lj69ZO3VAr3S1dtejOdJ7LEwhe4zMmfuJTEvMi8YDcWDiC5fEQM79WNBpRdzRBALM4CtoVM1pud8wXcHaToi7KpdfPJrQkxufMNUS4rDDNfBMSQ6VDCXKib1k8hK8TNcpK3I3CBdO0F+n+QCj8Et09mIUZWWcZvG06o5hTbz2ewdMYWDgrgZwLZvKWsyRNSs5PedBlY7KkoIWbwA17PKkoCowt7UroL03twg9X7zrRacnSUKtY4rNdHy/uvKNAmTEbvCckShd4mzmjHjeOUxsGFqs9MbZ9l2OVpoU6LsPWYMpoIUKdqRp4YURAMp2JAWAeuCEcK7idrnx0Zh8P6KzY12OzN/GC2KM+V+YQVJhhvHHXwTNrkTwWk4H44e8qS8ckKSJo72crz1pdGta+V/r5pzCLxCSr/W5yfTMh1tZkM0pDWFa8P+r1/xtwcoO6GXLH2+Tb6/bunl63NhulyKE1M6R3Mgf2GzciE4IdKWFxMrdTs8ssXKovsKmSHPubJWgeGi7Mbi4C9rswx5eYgBn28g+4gQggqoTjftzeQn2cLicWMRzMc33r5WdcTUgWGYRZGxh28C9SG4gspAQ0SPhzD76TUaS/OSqGYxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tlk2NTRZRXFpUGFSVjVqWU5kV3BidGlWQUZLS1dzYmlZeVF3elRJd1NVbzlv?=
 =?utf-8?B?UmgzdlpQM3dtck9QNzVQRFUvdmhkdGdUWG5MalBnOGRCUCs4Z2Z1TVdlaTY4?=
 =?utf-8?B?SkFNQUg2RUpDNCsrcEpQc05FSUFFeWo1S2V6dHlWZEhsbk03UXM4aXFNbXpn?=
 =?utf-8?B?cFFCOFBsU2VQcWFBUk0rY2hXZXgxZUdVWWlVN21ZaVFEaU5DQ21BU25Ka0F0?=
 =?utf-8?B?ZGFuNHVFcm5VV3ZGTWRxS3FwVmJMVmN4UWZLYmk5SzRwcmZBUUpyVklCcDg3?=
 =?utf-8?B?VnA2Ym5yM2dtbzNiUE9nM2NWdWQzZDNiRkVsdStCM2tHdDVKeGUyZjRlN054?=
 =?utf-8?B?TWVuZmhwK3F2S0dxaTZEWDNqUElRTWVwVVNPdjBQUUtFTkFzMjFXUUw3Z2Vs?=
 =?utf-8?B?QlJabEVIVjZwbE43OVFVMlExS0ZZUk9Ja2tlQjEvR2pqaDl1WCtwMFVEUjA0?=
 =?utf-8?B?cVF2c2ZvQ1ZyaFRUQVBVTnZ2c2NmcVEwSUtnQ1JLYlFySkY4b0ZjWUZ5Wnhy?=
 =?utf-8?B?VnhHZXFMQ2l3SmJEdkg0Mml0Y2ZNUTA0WXR3eGZrUFA1VzRJYVljSnRlSFM2?=
 =?utf-8?B?MWg3T1lxS1BWemVzVXhZeWowdVcwYjJDYzBmRG9rYndIY2wxTVZVOG5iVkhK?=
 =?utf-8?B?bEFWbTBYd01YcTEyeUd2WlVKeVZiWTU5dTJybDd1M08xejZqdXIweDAxeFRa?=
 =?utf-8?B?Wk92TDBuNFlZQmlMaTlhNnF3aWgxbHVNcWRqbHBFaGRpUW5KSG5tWFZEYUFJ?=
 =?utf-8?B?SDZhdFZCQ3ZNL1FWM1lkK0VFMVIrUzlmSThQRWtUblNEZEZ0MmdrL2kzbU1F?=
 =?utf-8?B?Rmx6R0JJRGRiME5nK0E0dHBZUjlnTlhNZVRWUnNXL3UrU3A5WTFwYzFGMUpj?=
 =?utf-8?B?cFRsSE1Wak4rcDlKVTIwdUtrWkxBUFVwbXBlZUdtTWJaSXErYVpqbUlxeDh2?=
 =?utf-8?B?b3pyS2hrSGhwd0VCQWo4SGR5Ly9MTGc4d1FSTFlRUEZLVTYwaXI2bTJHd2w0?=
 =?utf-8?B?WWF1U1FHQ3dxUTV3cjAxVEtoNElLQmxFaDFqdHJXTW5COU52d1ZUOTlXUmhK?=
 =?utf-8?B?d01ORzRLbVFSOHJ6YXdGaHlhZ1hLd3ExN09oZVNuekhsS3l6a0tQOVJNRGRr?=
 =?utf-8?B?OFhNeEhiK1A1MmkrRTA4bnp6SVY0RXhwbHI5UWxDZ1lUeHozQVRQcmNPTGJi?=
 =?utf-8?B?Q1NwZSt2MmF0T3B5bk9VelFIc1B1b3BiTE44NlAvMGZTR0gvdDVla0pMbUIw?=
 =?utf-8?B?WkdtSkhQQ0p6aE80SEk4dEljVEhqV0hxQzVXcTdNM0dYZ2JTK0xFWGpZbDV0?=
 =?utf-8?B?QllZSUIzNHdqanB3MFh3ZVcrMHVRMHhLMHpNUGxSZDY5R0pNRk92WHlmd2xE?=
 =?utf-8?B?M1lZaldQL21Lb0tOd0dmNGYySytPbEZzR0h3S09CT0R0WEl1ZkUwdkdMZWJY?=
 =?utf-8?B?NG85Yk9EK3c5dUV5dGhRbG40U0VycWtwZzA4OTJQSzJzUnF1UlI4T2hGcjVQ?=
 =?utf-8?B?WW9QRWsvN3ZFd0x4TE51VGdFSzZnMkQ0N3lHVlh6MWp4c2NtOGdTbEZubllM?=
 =?utf-8?B?VVZ6R0RDS0hubE52cHJkZXBOcnoxVlN3S1pxVFJ6U0NuSHJUVmRIOWJVOTdq?=
 =?utf-8?B?N3NRL1Q5ZVJBRVhPSjlDbmFXNVVScTNZYXErQnd2ak4yN3FNeHY0Q3J1UFZj?=
 =?utf-8?B?YWhMR0JYQThHbldQSEVqNzNHTm42Y2R3cTdvcVZJdkZvQmVCa1o0NmpGcDdH?=
 =?utf-8?B?WjRWS1RXV1lRMmNNd3JDdSs4enBKQkVsMTFoUTdvQzBYS1dLV0VxNVhlNWZJ?=
 =?utf-8?B?d2pDSVdSR2l3czFKMTFkVVN2bnlmbHFGbzNjT2VZODRTOHBQV0ZCdVh0YVBn?=
 =?utf-8?B?TnpnaTNXRW5zSnMxVXJ4Vm9LdlJQZ05nbll5dm9LbXZXTmRrS2NxbWFiT3gx?=
 =?utf-8?B?TkRqcmZZZ0xMbk9meTVHNGNLaEt4ckVKS3RTZUJzaHBoMHU3R2hjbVFHTjhN?=
 =?utf-8?B?ZWVTdFJLQ1VmYzRieUF6RXVCd00wclpHbDJGMG55SXlocWt5UzV2WmNYalh1?=
 =?utf-8?B?QndnNmhMdDFORm12V0gvbHI5cnpLVTNWamhTRkZQRVRMdzFZY1RINHBMYlE5?=
 =?utf-8?B?VFFtbDZBZE0xYU9ORFNja0dFaVBsQXA0cWNLazloWFM3NmE4SEMva0hVRjJl?=
 =?utf-8?B?dWhEVlJyanVQdFlHSkpXaW5aSUgrK2NFdEI0LzV4SUQ3eXhxUUI1Z0xnbHpC?=
 =?utf-8?B?ek8zMk53ZFdra3ZUa2pQY2hMN0VJdjY3d1VzYUdkM2sxWXorNDNZYWhaZ1dK?=
 =?utf-8?B?YnVkaGZRNTkzUGswZzhELys5UVBmM3F3Ujgyb0dFNjhIN3VXOTRLZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a40422-3b8b-40c8-94fc-08df09a93a15
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:50:54.0026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5E2Qp6B6Z7IKtc/u1pxW45FUqsREpfbeu7CcKUg8Z82NxeC9QJ+sWmRNViweer+JSx/S1xCIQNeaXwVOPD+GWI+G/8gLJJC2Qg5qzcPMug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8274
X-purgate-ID: tlsNG-4011c0/1788432660-4BED2CFC-475AEAF1/0/0
X-purgate-type: clean
X-purgate-size: 1439

On 28/08/2026 2:11 pm, Ross Lagerwall wrote:
> The Viridian spec requires the vector to be >= 0x10 when writing to the
> SINTx MSR, otherwise it should #GP fault.
> The spec-defined initial value is 0x0000000000010000, i.e. the vector is
> 0. On startup, for some reason Windows 11 Hyper-V tries to set the MSR to
> the spec-defined initial value and since the vector is 0, it GP faults.
> To workaround this, treat the write as a no-op if the value is
> unchanged.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/hvm/viridian/synic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
> index e6cba7548f1b..37ddff201a6b 100644
> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -157,6 +157,9 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>          if ( !(viridian_feature_mask(d) & HVMPV_synic) )
>              return X86EMUL_EXCEPTION;
>  
> +        if ( val == vs->as_uint64 )
> +            break;

This needs a code comment, or it's something which will be deleted in a
few years time when someone wonders why it's present.

/* Windows 11 Hyper-V (Summer 2026) has been seen to write this MSR to
it's default value, despite not being a spec compliant value.  Tolerate
writes which have no change in value. */

~Andrew

