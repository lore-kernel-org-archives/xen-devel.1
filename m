Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6C606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=kiosOXN2
Received: from list by lists.xenproject.org with outflank-mailman.1480294.1684259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQS0H-0007ee-C0; Mon, 09 Nov 2026 16:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480294.1684259; Mon, 09 Nov 2026 16:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQS0H-0007eX-93; Mon, 09 Nov 2026 16:13:53 +0000
Received: by outflank-mailman (input) for mailman id 1480294;
 Mon, 09 Nov 2026 16:13:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xQS0F-0007e3-Nn
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 16:13:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQS0D-008EjN-D2
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 17:13:49 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af1f123-bab6-0a2a0a5309dd-0a2a450a9560-48
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 17:13:49 +0100
Received: from [52.101.52.8]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af1f13a-f2d2-0a2a450a0019-346534081491-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 17:13:48 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7825.namprd03.prod.outlook.com (2603:10b6:a03:5b1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 16:13:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 16:13:43 +0000
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
 b=xLDFHZBPUTki6qgqysvZaVfMPE8p09TRWGlLM0CE5wBZcGpHlDTlEgsLt4jhqBlxby3bxYd/ACd7I/lf2/qro1YxNNBjVAXUTMWGYsT5Mj+12yUe1d6mJ/FRnob1gDeGXwhz8/lG2U4svvlLru8NJecR+SsL7uIzGVSaUE5xg1zR2Kt2c22Xbez4bKL2ARkd5U9nOgn9CJMqJ7XvaQIDKVcHNGECnIzmXUyq6NAbH3bir0DYcNJ04fet678+Mi+AGC0uXdn92IiMB/HLSV4thomtZPZkLLj9k9N4s5Tfr1QKaCBRm2Ldz1ibOmSL4PTSYnpslZ8HKLBCKtgwzpzFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv2kkxomwYHk4S99qXz+sjlhkA0UMbkQkSgmA6dxhzg=;
 b=AhEOCJQ3karA6k39K+R1g973WczIF4VIpC0rAbrYCbz0siy+SaOjwHbFO0GBGXtbAPHhSaL9LlJWhbnrQLwE655uRG6GZE3G0yVLo6kz3caNewp8PmEdR4G57GfguWHZbeFssavcPdPs93TWQE6KwwXGvGdnT55XKLvSB297OjLSJsXQ+0mX/hbpUrdCoPM9q9sFUc90bX54ND+b7e4vFVVUc6fzOU3poqPMb6z6+0EGWTuzE7dYHwWq2i3TCUue4VYWDzhkXYEhL43QPde88apSNtcu9AMYK+EKd8u+0TICkL7tVwuOT747KIsmMWBZOfclf7E4NAGqcPUISfYhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv2kkxomwYHk4S99qXz+sjlhkA0UMbkQkSgmA6dxhzg=;
 b=kiosOXN2pMmJYb0Z23RSFIq3jOmoxcJE1Xp0WNPffrEX+8aoZ7vBqKec1Nz8Yfl3EVgMi4TAlJl198zR/czinsVzIRC681uwq4+NTDI9cmbaaVHWXhnJp4xXxMLdDv1dVK2/afx9PW7+HHDOUWHBhkgE8sZmSuAfoIU0zU2WWds=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4f585dab-4e55-4223-bddb-65d145382612@citrix.com>
Date: Mon, 9 Nov 2026 16:13:40 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/5] x86: extend mod_l*_entry() to optionally return
 the old PTE value
To: chunjie.zhu@citrix.com, kevin.lampis@citrix.com
References: <20261016164815.3109065-3-kevin.lampis@citrix.com>
 <20261020023400.295707-1-chunjie.zhu@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261020023400.295707-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 86cde255-1372-4a15-3c5e-08df3e7c6d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|4143699003|56012099006|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WD2eMw8w6C8h6SVrOpRUXMEyKF9BKzo4iYnHAKHdRGAvxNzG8zt6Uf5Sez+ujTp/iPk/xmvOQf6TaeVoNdIFdxqVxl8ZhY5MLPe8yIO/aiJPYshTBvCcXQ3Qjy9IhBeG8PuyGE9QkGP5eAR/pQQ4TyZ00P3RMDWCWDRt2yeOQ0Vle76dHsvNMrDrWVQwXkLZ8JjwDicuv0ykdlu4Fbhqj5FanM4RppY+KcJ+v0tvTgn/c1mQ47zG2Mx5GCQWWzJEe52qBzpKAO2oMgtsaSIIabefHGjz3i5yVRR+ms0H3aXIksrHPOa9mkgFBTHsq1gzSCy/ZtXzI+wSVpvH6bIXvOFMGQJLg/aazUVW6EFzPfMbRQeAVQIlvZAycPmAC44+u3BTVeljyE3jD9Xy3eMAV+SBI0ZFpXTp3CgTUrqEvkY7XtFuxuJB0a0JZMF41+V99tVRO1+WQomciKqLWKSAO4/5QyXDp2+bxd81ZUJF8Is1vagcwZ4HW8Q3Qe6MVtQplQHFRu52i9mRKQt6Wiw8ZVUPxIsis9Lu7q1/3O3YsW9HNtYA9PNX/tbtPVNeHIGCQ+Wgrh2NXkKKiK73HNHiaiCsTfNfUKqk3Pd9JsLgXxh6hq6N7phhUd4aqks6FTdQo3HaTGskTDobGlpnfv8j2w3VOTYXTpVTWjP5uIc78dU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGluMTIzTG1HSDVleUVtZTlvQW4wMll6MEJ0WTJlTHBsb0JQZGpxSHVjSUJI?=
 =?utf-8?B?dHpRL3BNSytzY3ZpYnNqbzV3UmYxVll3VzRDbzhUNEpCSkQxbzlCQkN5bjB4?=
 =?utf-8?B?UER6dlpvSFZGaG5MQVhmSHZjblN4aGpjNkZjUnFHYjJZOHJzU0Z3VGdmK2xN?=
 =?utf-8?B?dnlZRjg4VTFwZGdhYkliMjl5UWlSeE9GOElUU2srNC9pOEp2SXhUS3JNMWFR?=
 =?utf-8?B?OGNRK0JEZVFXd08xaFVSUjZ1SlhUaDFRbUFmendBOVVESWJDd1RkeU5zNlRq?=
 =?utf-8?B?QTIvRnRtQjF0TEd3dFN0VEkzeFRKRHVSdElVaU55RzBNRTB3dlBSbGlVN1c1?=
 =?utf-8?B?Q3pZQkxPeVRLSFVIZ3VuTkpXSlBXY0ZvVlVBb3FnaFAzZXpadUNMcnd0RE5C?=
 =?utf-8?B?N1lyKzZrWVBxSkQ1ZElhZlpvWDErSm9la2o0OEFGRmJLMnFmdndWYlhVNEVU?=
 =?utf-8?B?a0VFdlg2elFabFRlNUFXK1NPQkh0SXNtLytGakNlMTJPTDZqNWxMQVJTU01S?=
 =?utf-8?B?Snd1cTZvTVkyTThXeDlqL1NWa2gxZVNibHZVSkFnVGVYUFZ5KzNrUGdiTlk4?=
 =?utf-8?B?dnN0NUx4UkpzRHllZnVIRnY5NmNQc1E1Ni9SZXU4ekZMWEVWcUVuOEVJSXZt?=
 =?utf-8?B?TzVIcEhHeWJjd1dDbDQ1MWZteHBmWVVCTjhYNEV1TFNLT3NUNEE1Rml4Wkhi?=
 =?utf-8?B?NmRMOStzemtPS2xadDMvZi9PMnZIWHhobUpiaVdFdDFJQW5PK0xVaVdQSDhZ?=
 =?utf-8?B?dHlUeGtpZTBZb0JlK3R6NmdkWERybDhXV1hqd05rNlJoZ04xUkJ5M0hsN1Jm?=
 =?utf-8?B?aU1BVGV0cEszdVBMYlc1WWFFUGgwc29zMXNCbENrMmpBZXg2L1JtY0IrQ3hP?=
 =?utf-8?B?Q293d3BERGVjYWFISkZlMnMzN0lHRDJaQmFPclVOUGlGeUlQOXUvRkV6UWZ4?=
 =?utf-8?B?M3ladDl6bWYvRjRTT2M1WFMzL1NYOHlhYzBPcmxFQUU3eXBQb1k3NmZiRzB0?=
 =?utf-8?B?bnh3bDhnS1VpQ1NpMW4xc0Q2SkxUc2lKMlc5bXMveHp5OEdhbDQ5Y3dDQVlq?=
 =?utf-8?B?NDM3bmhnekZpZUlvQTliY3JuL3p5QzVlREdJS0Zxd3owT2NOVlFmVi9ERkY0?=
 =?utf-8?B?K2ZUbG4wbjQ1MTExWk9Dc2hPOW85M1hvZ0EyMWlHVDhsRk5pcUx3SENpSmN1?=
 =?utf-8?B?Yzc3ZkNHV3ZRTVh4bWlCREw1U0kvV0VqemE2WVlYM2hUWnliRnMzNk9QSFo1?=
 =?utf-8?B?RXYySUkzLzVmc0VaZW43c3d1eTFvZTBVQ3dkUlk2RkZsU3M2ZGN2eEJpYVkr?=
 =?utf-8?B?c1J2WnJadjF1UkE3NG93cVhNWG1TYURJckowclk2Q1lRVk5iYVhMSTZNNXhD?=
 =?utf-8?B?YkZHbThSaTFVeEorcW9RcERwMjZTbW5uL0ZUUUtUTmxSOGZVVGtFOUxsTGQv?=
 =?utf-8?B?VDRiNVErQW8rOEhWMjhtaUdwa01sYjFldkQxOVNpdng1QTkyZWJjWDdKUHZE?=
 =?utf-8?B?VG5kOGduZDZKUEp1MnRRSDUrbUFqREFHbi80MjhzV0U1eHg1Q3JlOXJDVGZx?=
 =?utf-8?B?dXl3TFluTGovdy8yaklQSHBrRXBDLzhtVTVjTHVReXRMMFAxVGthTC8ydVpR?=
 =?utf-8?B?YzRIZHdweDJnZGg5NDh5OFg2SDJ3cVRBN0REUXNBVTBaM0dFK0RrYTlFdEpj?=
 =?utf-8?B?RUV1eWRPOEU4blJTOU9jWi9TWmI3R1Z1b1RxQVRQd0FYWk5NeEJXVTdrZkda?=
 =?utf-8?B?cUJObzQ5Q2FUeUI5MHQ2NmxNZzFmRFlYOGhoSUFzK013RXU5UzFxOTE0QTU0?=
 =?utf-8?B?STRiZkZPaHd4VzVBZ3BVa3o3VGE0VzFmVzdKdzkzTFNjOVhwbEtLVHpSQzJq?=
 =?utf-8?B?T1MwTVQ3TXBTYmtlN2hBbG1Ba0ZQK2laTFlYV25ER1ZGZ0Z1OXdjUmVOYUlI?=
 =?utf-8?B?c0RFbXF6UkEvbGxvYys3N3pxbWpnZlpuNCtkSWZiODVYbkltM05ham5qb1JU?=
 =?utf-8?B?SlVIUXJ0SU0wcW5XRzVRbkZnYm9KRE80cHVLQzJ0Tk55Q1dOSFFRVG0yeFl3?=
 =?utf-8?B?MVYxY1ZyVXJEQm9CYloyVEdCb1NTcnBWdUJaeDIrT3N0YW1xcTcvSFBOU1JT?=
 =?utf-8?B?cndxb2kzWVdnUlFSam53S3cyWkE5a3lsak1mR2d5YjZRSE85bzhuR2hyY1p2?=
 =?utf-8?B?Z0s0aDRmdDNpbWV2UTdzMUpZT3ZLaERpVkpiT0ZkVHRLYTBZTkp5MlpVVTFr?=
 =?utf-8?B?cllHQ1ZVKzZTVFhDM1htQVE3RVc4OXlhbkgxWjQya0VFZXkzOHVoMmtYRDBM?=
 =?utf-8?B?T2pVemZqMzlMTlo3R3ZseXZxSDlUMGVGQXFadExON0lYSDdXbGxidz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cde255-1372-4a15-3c5e-08df3e7c6d29
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:13:43.9180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyaR9hIVb9gRUGV6Wk1Rc40eSPy6RCA05nr8PdGQf1bef+RumQCCyiJj2rPmj/+RzRdxah9pTJe9HA5xKrRyy0Z7MaKJHfp1VygkEsvAH6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7825
X-purgate-ID: tlsNG-4011c0/1794240828-4BAD4CFC-8FD6C947/0/0
X-purgate-type: clean
X-purgate-size: 4935
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/10/2026 3:34 am, chunjie.zhu@citrix.com wrote:
> On Fri, Oct 16, 2026 at 05:48:12 PM, Kevin Lampis <kevin.lampis@citrix.com> wrote:
>
>> Calling mod_l*_entry() with a valid ol*e_out pointer will do atomic
>> CMPXCHG to set the new pte value and return the old pte value through
>> the ol*e_out pointer. If the ol*e_out pointer is NULL then old behavior
>> is preserved.
>>
>> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
>> ---
>> Changes in v4:
>> - Refactor how UPDATE_ENTRY is used
>> - Update commit message to specify CMPXCHG instead of xchg
>>
>> Changes in v3:
>> - Add swap to mod_l{2,3,4}_entry()
>>
>> Changes in v2:
>> - UPDATE_ENTRY now returns the old pte value instead of using an out
>>   pointer
>> ---
>>  xen/arch/x86/mm.c | 106 ++++++++++++++++++++++++++++++++++++----------
>>  1 file changed, 84 insertions(+), 22 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index e42cd33c0d09..609c8595a487 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -2193,7 +2193,8 @@ static void l3t_unlock(struct page_info *page)
>>  /* Update the L1 entry at pl1e to new value nl1e. */
>>  static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>                          mfn_t gl1mfn, unsigned int update_flags,
>> -                        struct vcpu *pt_vcpu, struct domain *pg_dom)
>> +                        struct vcpu *pt_vcpu, struct domain *pg_dom,
>> +                        l1_pgentry_t *ol1e_out)
>>  {
>>      l1_pgentry_t ol1e = l1e_read(pl1e);
>>      struct domain *pt_dom = pt_vcpu->domain;
>> @@ -2254,7 +2255,11 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>          /* Fast path for sufficiently-similar mappings. */
>>          if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
>>          {
>> -            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>> +            intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
>> +                                        update_flags);
>> +            if ( ol1e_out )
>> +                *ol1e_out = l1e_from_intpte(old);
>> +
> Same "intpte_t old = UPDATE_ENTRY(); if ( olNe_out ) ..." code block is now
> repeated three times in each of mod_l{1,2,3,4}_entry().
>
> Alternatively, a single local variable per function, assigned at each call
> site and copied out once at the end. Does this avoid the duplication?

This is a bit repetitive, but there's no easy way to merge all 3
UPDATE_ENTRY() in each function.

Given this:

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a1b7770db0f8..99d4d87e177b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2408,7 +2408,6 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
 {
     struct domain *d = vcpu->domain;
     l4_pgentry_t ol4e;
-    int rc = 0;
 
     if ( unlikely(!is_guest_l4_slot(d, pgentry_ptr_to_slot(pl4e))) )
     {
@@ -2421,6 +2420,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
 
     if ( l4e_get_flags(nl4e) & _PAGE_PRESENT )
     {
+        int rc;
+
         if ( unlikely(l4e_get_flags(nl4e) & L4_DISALLOW_MASK) )
         {
             gdprintk(XENLOG_WARNING, "Bad L4 flags %x\n",
@@ -2440,17 +2441,14 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         rc = get_page_from_l4e(nl4e, mfn, d, 0);
         if ( unlikely(rc < 0) )
             return rc;
-        rc = 0;
-
-        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
-    else
-        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+
+    UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
 
     put_page_from_l4e(ol4e, mfn, PTF_defer);
-    return rc;
+    return 0;
 }
 #endif /* CONFIG_PV */


we can at least turn 3 into 2, which bloat-o-meter says removes an
alarming amount of code:

    add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-165 (-165)
    Function                                     old     new   delta
    mod_l4_entry.cold                             39      31      -8
    mod_l4_entry                                 917     760    -157


That in turn means this patch only doubles up.

I'm pretty certain that the get_page_from_l?e() calls can't return a
positive number on these paths.  The one case I've found returning a
positive number is in iommu_legacy_{un,}map() but we don't pass
IOMMUF_preempt in and only operate on single pages.


Removing the final duplicate would require something like a bool
"dont_put" which is set in the !l4e_has_changed() path, but I think that
makes things more complicated rather than less.

~Andrew

