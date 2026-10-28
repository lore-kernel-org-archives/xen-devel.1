Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF5A60A3814
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=mRCqt12T
Received: from list by lists.xenproject.org with outflank-mailman.1463572.1674421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM8IE-0000iE-Po; Wed, 28 Oct 2026 18:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463572.1674421; Wed, 28 Oct 2026 18:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM8IE-0000i7-L5; Wed, 28 Oct 2026 18:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1463572;
 Wed, 28 Oct 2026 18:22:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xM8IC-0000i1-R5
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 18:22:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM8IC-00ByEP-81
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 19:22:32 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae23d3a-e002-0a2a0a5209dd-0a2a4508dd80-40
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 19:22:32 +0100
Received: from [40.93.194.60]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae23d66-f659-0a2a45080019-285dc23ce739-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 19:22:31 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6556.namprd03.prod.outlook.com (2603:10b6:303:127::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 18:22:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 18:22:25 +0000
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
 b=IzpwJQIOFFZzUr6i2Ld2np2IuoYjj0pmPGuoWLd2vtvVf1lotv7/BiJcNQxG7r2yft8/PMou1ztUmsD5s1TXWTwLljtPySydw0x9vgyiRiYanrrZcWBZbscByPA15ziONkf71rXgcboU+kziOtpU1DXdy6JSx599OOzpJpr0oYPWvt7WP2A9sYr4RmPGM3D6QpAed1grgUhL8MIyWQuJcX7mBy/+73U8BKkp29v0mwaf0ap01bYVKxyv1kmckj/U9qtGwPIwLKfmKztIsv3eaSLU6zlhkPTNBDeNX1R3JnL5Xo8a6acTHWaXeyr2Ze1oxxDiVi8w3fdmB8HBMYupIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EKdRDJCHvH+5SiIpb8tn4PDHl1vBoSPzSkLtGMpYu8=;
 b=YdwJsbxZJgO3HVBwzggInXbgv89RCUOqn/TUK8nsZFu79Q+MJ3iRr9duhOXZRSWWZqAVBZzoLWykdJpZgZOrICTm5iRKt4RPYZR9nctBL070GLQ//A4rMpNlVHGvY8JO2mcy4AuRBPOtOtZV013KWqEyuOqltXydDMcnT+WGiQZFhMDdZm/rT2igkX3pPInEF8549UvpqmFJFo6Ufb7i9WTetX8JNAc/BJA0iECM7dAwOFKUw5ioM8PsR3TdB6Urk0SdSO4nSqhVr4muBWWmypl7ZqkuZ81UidgPzC70fqZosx3Ia8/YrM9sHu8zFqdCsF2f68P0Hc9u4LCy3+qkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EKdRDJCHvH+5SiIpb8tn4PDHl1vBoSPzSkLtGMpYu8=;
 b=mRCqt12TVlud/rlYB4ND8GKFo6Ka0VS09p9ZjQYLgwf/v1uNCeWyyuhzMcmHr9FncV+EqmCWVQ3LYsazzQJdIFDZsMaGS39hlkYnR1PLG5b4TTyh5u/hQQcxDX4AJUx7zrNWoAOq/AZY+HBgGhuvEr21vOFP9p7f5BHtVxspYO8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <290dd295-bd1c-442a-874c-de4565932da9@citrix.com>
Date: Wed, 28 Oct 2026 18:22:21 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC 0/5] Introduce dynamic tracer using Livepatch
To: Ryo Takakura <takakura@valinux.co.jp>
References: <ef4f6390-1d06-4e24-af66-48dc0689ad38@citrix.com>
 <20261028080841.118926-1-takakura@valinux.co.jp>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261028080841.118926-1-takakura@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 3448036c-55d8-4e1e-3afb-08df35206a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261026121527099003|11063799006|4143699003|56012099006|10067099003|261022105027099003|261009223027099003|261022075727099003|261028144727099003|260925021911599003|261026140227099003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	DW7fdk5WU5Xw+wih2xarXjYTyQj7ztcZKYqSQL43pzHLU1sv43aIXfYReSu2ErZMFC7HwALbfOguaZurQ7pL1GAxsmyt/knfdMGYcPGWTPhDFabDTLV44WZv1HVRwK9VwqeQZf8Ama/RodYB1fooF2qOl0agb2UhLXqfgtOV8PMJripiJ+Bsk5A/bsiDVNtANKF03VO8W583j5Ofy0amJpRs/R0KN/5HjHnpCgP7OXIeZnjuxkAQICDDyDun9OO9VNEPfcjmpuApXjNNUl9pboJOBcY0/Vu3nSCsMyT9DCRg6xyw2KcVAAU183LlplnQfHm6lvPZ05AtGfupuAPveNTskZdGVqO64SeH8BlbF+LJcGNEPWXnKWU5/eScLjaNo7m7761IWbzgUXnO5Tpm1O7tqXtCC2S445JTZRPoKfvqbu8e7Oold0bzrqNGIl8s8JkoSEBcbDHSr+SipANXhWfL50yvU0e9JYhZNsf5CNAjEapoW76omLMYy7vqAd39z6PdZNFXEOtffuPcMVtaZ5jPmgWrT50I3U553VhT7bfjif2Vc0otuTsaI+JAHQa7AR8iLtW/OdKIKsgO8iCf372rXcLAgAkQjpKpOlYzj+s2MJZGXtmtePdD5YYlWdM1/wOX5Dukv0BhS7fzi/MVzH6Zq+mOGAgnZVTJfepT61Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261026121527099003)(11063799006)(4143699003)(56012099006)(10067099003)(261022105027099003)(261009223027099003)(261022075727099003)(261028144727099003)(260925021911599003)(261026140227099003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eStBUVlERy9RUEZBMDByWjJ4U3dxcVZleDFOcjFFaVFKZkRlTk9VL2JKdGp0?=
 =?utf-8?B?T1dVMkxKeXN4cWFYc2tqVHFtS0p0YjNEZUpBSlluTTFqYStkQjVXbWxqNDVn?=
 =?utf-8?B?UktOdVphM2dvYWV6aVVVOHExb1M1WWpHZ0tmYkVhY3BvbDRxMXJ2YUFDVmRL?=
 =?utf-8?B?d1BRWWdqdk41N09ibjk5NWRqeGl2eDNic285Q2dKb1lCeGxGbWJOR3NIM2Nx?=
 =?utf-8?B?Y0hIY0NxZU5xczJmaFdKOGxyRzNNV0tEaUdZaGJYMWh1V3RiZUYyeXpzeVQ2?=
 =?utf-8?B?eWdkQlJOeTFsZEgyaWdqOXEzeXhRK3hrSFhOWUpETE9LZWVoMnNjMHd5TVpX?=
 =?utf-8?B?VG45NUZtc0dMYlptVXdVVW5GS0FnS3g3VWZhMWNkRWp2amNhUVRzZFplaVo3?=
 =?utf-8?B?VG1RUmwrN1UyQ1lBSDcvdmhLeW43bWpHMVlJY29lZ2NCcGlWNzZjWkRVZk1C?=
 =?utf-8?B?TEhCRDM4RGpwU3hldVFMblhiU2EyWjZma2MrZlpGNEptWlV4MTBFcTJtM2dS?=
 =?utf-8?B?SXNRdU9BUTB1WWtETVA0TG10Smx3STZLUWdTKzhDMno1aTdxbTNLR1pwK20r?=
 =?utf-8?B?TnY1cmxhc2RVZjJxamI5MHAxTVZJVEpUTDRqajZxeWh6dmVTWUxaUjJFWnFL?=
 =?utf-8?B?QlRqNFJHeGI2ekQyRlFyVkFUVWRIS2E0R294ZHduWERJaHRFSzNVN3NQUWVP?=
 =?utf-8?B?SUJHMWYzL3NmcVYxS21mekVlK2pVaEZzZFRaYzdoOVh1eHRSbGd2OHpBRjI0?=
 =?utf-8?B?aDJmZVBrNldLRUZldEpPdThLSTVxWWVvOURyMU96NGhsZlh2TFRtb1dKUDZC?=
 =?utf-8?B?T2k2VXhUV2RDai9lVE1rblF0UEV4czEyU2JFWUFNbDI4aW11d0dySm1USlBF?=
 =?utf-8?B?amxsT1R5RUdMU2FsQ0xsblErUXc5dEx3ODB1aW1MMzVhSURvbkJQK0NEWE5t?=
 =?utf-8?B?N2tVQWlSTTk2UWxLY25QZURYWTZNdHNHc3FicUxoR2FOTHZPcVdMdUlUeXJ5?=
 =?utf-8?B?R2xxYlBwK1phZzJ3YTFTSDduUWtSWjJubzZmZlA2TzViQzNzNnJKSWVyd1Va?=
 =?utf-8?B?YWMvSHhsTkNrRGs2RjdHOHBmVjJHbVFtanlPMmdWUDdQM1IrSHRJRHVFeEE0?=
 =?utf-8?B?UWFvcjNuNnkyYWQ0YkZhbnZkb2NzRkZGb280VFRRMXJDNFVrdzVjTmZFSkhw?=
 =?utf-8?B?cktaSUNjeUU5N1pZSG5HQlJhWkVNR0hIaHF6b05MOXNhN01vYU1URHMySnRi?=
 =?utf-8?B?Qmh1RW02OFBhV3lSMjUxQXZlRmhkY2pYRzZqWUdaSFBGcWlYOFNsWEVTM1lS?=
 =?utf-8?B?WHg2dHBicGhvd1lyams0dHVyd0t0SXBXbWZTWEtTWjFFbXNaeGVYSmU1cmdq?=
 =?utf-8?B?TytSV1h1bFFqK2RWK2FKejhtTGFLa0pVNVgxbWhpSE4xK2tvZ0FiL2xaUld2?=
 =?utf-8?B?bU9wY0V0dzkxc1I5Tm1kemkrSnJsMVR1Z1ZrL2V6MHU1TVJDM2F2SnJnRnBj?=
 =?utf-8?B?TjQ4Q0dUZE1XZ1FCZ2M4TkFYamE3bE5abGNraGFzYVdzVUE2L3FMdXJMaHEv?=
 =?utf-8?B?Y3ZXMmltNVd5Vko5VytLVXhFdnhVMUMrTDM3WVFMc05adXR4VVhaSUlheEJY?=
 =?utf-8?B?c1JXNWNIUnl3NGJrTENjS0krWExaNm9SeFdSenByNlJEQTFTdXpKaWdsWlZt?=
 =?utf-8?B?N1E0UE5BMzJIVnhmemhGOFVPRHdQU3Y0MCtYVVdmRXVuRVUzZ1dYTUVhNStZ?=
 =?utf-8?B?dHFMWjBSZG44YXRQRW5rekZERW1ycEY1SnROVHJUN3lDeEQ3bXBVcWJ1aVls?=
 =?utf-8?B?U1ZyRFgzekMxVkJHQjNUUWFHblYxcytTbzAwN3B1K1U4bWRuTTBqZzlMU3FD?=
 =?utf-8?B?ZlhNTjE3T0taRUdOaGxROEZFc2thRHdjbWdSSEExSUpVdnFnZURwMUhHL0Y3?=
 =?utf-8?B?ZWd3ckl5aXJZSzFPUnlET1N4b2dtaHFjeG80Rmxpd1R5OFJYb1BkVC8zYkc4?=
 =?utf-8?B?bFhweVhLd3dXY05yclcwQ3RYWElxU2NESTg0SU1kUVBnb2JCeEl6ejBjcUh2?=
 =?utf-8?B?V0liZzFReGN2ck1FeWozcjIzblQ4USt4UElyVHhydjRWMklZUnYyRGJBS1F0?=
 =?utf-8?B?TW42ZW9SL1h2YkJLclU2Ujl0Lzl5UFlRNGZwRlM0WFgrcHAxYmdyNndvYlZn?=
 =?utf-8?B?TTJqYlpLV1RWRURjYmxhZUpHdkdrRTFYSGxFN0FQK1ZoaHRkUzlLc0M5TGVv?=
 =?utf-8?B?T1Fsdk9HQXRVK3VtQUZTOGd3TW9jYk8zU2NzTnE4R3RHNkp2L3lkbkh0c0Jq?=
 =?utf-8?B?cVcwd0dyRC93cGNKWisyNEsvYXhxa09YNy8rREFlS1p3UkdjUHUwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3448036c-55d8-4e1e-3afb-08df35206a82
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:22:25.2881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHJsZi/6fwOd8B22at/rcLu6/9XwC73wcHAMRP7/Yfni1+swaNbLDXieVqeA+g1WRjsUlze/xgFTKLbRBkEz3MemX23MYYQf1zOsDKHm6fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6556
X-purgate-ID: tlsNG-c1860d/1793211752-CED4087B-CA7DB755/0/0
X-purgate-type: clean
X-purgate-size: 1390
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28/10/2026 8:08 am, Ryo Takakura wrote:
> On Tue, 27 Oct 2026 10:18:44 +0000, Andrew Cooper wrote:
>>
>>>> Separately, you have a number of MISRA violations which you're
>>>> introducing in your series.  I see you've got cf_check, which suggests
>>>> you have built in GitlabCI.  Have you also run Eclair?
>>> Thank you for pointing this out.
>>> My apologies for the violations. I wasn't aware of the tests
>>> and haven't run either of them. I added the cf_check following
>>> the existing code that I referred to when preparing this series.
>>> I'll make sure to run those tests before sending next version.
>> Do you have an account on Gitlab to run the CI testing?  If not, reach
>> out on Matrix.
> I don't have an account yet.
> Ok, I'll ask on Matrix.

To get you started, I put this series through:

  https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/3000384733

There's one Eclair failure on ARM.

Interestingly, it's not the failure I was expecting to see.  I was
expecting it to complain about

+    uint32_t insns[2] = {
+        aarch64_insn_gen_nop(),
+        aarch64_insn_gen_nop(),
+    };

because of the order those function calls being undefined.

I was also expecting to see some failures due to arithmetic on pointers
of different types, but maybe we've not made those rules enforcing yet.

~Andrew

