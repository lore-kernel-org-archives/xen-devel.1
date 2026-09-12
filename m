Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AF9C88E53
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 13:53:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1418685.1646499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5OAB-0005IO-Qg; Sat, 12 Sep 2026 13:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1418685.1646499; Sat, 12 Sep 2026 13:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5OAB-0005IH-O3; Sat, 12 Sep 2026 13:53:03 +0000
Received: by outflank-mailman (input) for mailman id 1418685;
 Sat, 12 Sep 2026 13:53:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x5OA9-0005IB-Ew
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 13:53:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5OA8-008IR2-PR
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 15:53:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa55936-8faa-0a2a0a5109dd-0a2a450bb168-2
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 15:53:00 +0200
Received: from [40.93.194.52]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa5593a-b7e8-0a2a450b0019-285dc2348a8a-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 15:53:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6364.namprd03.prod.outlook.com (2603:10b6:303:11f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 13:52:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 13:52:56 +0000
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
 b=XV9QPt5j5FEGPaBRaUaPA5aLaVSHTf5wrdvXQ9MjjxJYpzqK3XwWlaipSluabtMKi9EepWwd5GPFsgLWGdUc6LiH0euLV9XGwigq6JVxHDrJRil0lu6iMyBHeZ7BG0uOqgUYL/nrItgkqKVXCNPCspX7pDz8r6+QDP9fQBCxXASzNMZRZceo096HmZ+FZjBHGadoKFcLN2HM4G8n/Ol/yNdIe+kcmW0IC3aFtyU9lqASBC2/mi+Z4B7oBdcoGs+CXT4yQUZ+jHRjh7HDJWc+lyoJAistdmxjn6tUC4ocMfearCJ2gT7QL2rN4/eouAYEZiPzVlEHguIukfAcnHBnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOKSh6BxD5VXXqyNqZg+SJpNEwAtvVAm8qKkETfBAuE=;
 b=YaGBh0NvGzeVjUazxOhWjc1v7Pm3Rokb0UKGdhPbqr3hx9/ZSuYTG5iGekIYJKY7YRlkjfTGKQd4Ng938L3CSWRhKsCtfxssMhgHjojbuY3Ex4Ej7hE33u01U/g4rCz6yW9UvXY2FEUTm1zW113G5VseN7YUBguF2+9Da3+pWFr3yI12HAiIjHO41shWHUFSWqiYEJBaHwzqKWJD1qCKKYBXU9j5cRaUqmvWJpVSUY8V7YE8VlfnQf7O8CNjtaLc9nD/uNRSvJAzt8zszZNRxuBJwXLHj6enfYDrE72cXogctiXeW22ti/g7Y4utJjr7cSSZlzBkcFPru+9xYz6tkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOKSh6BxD5VXXqyNqZg+SJpNEwAtvVAm8qKkETfBAuE=;
 b=G6dIs/gjaNkd/xZX91eLUCZ9egxXfZQ8efw9ilLI1So5vtzC+d8LMLdkEnx015fRaH62mxk3NU0UqJjeB8cWbgpQ7D0ui2UBkJ8RF3rZIFdRkkHinXhK5Duc/DublMMAvOq5EK32W1cgtLqPcBm4lLwa8SXO23DKuHNmd3NdDUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e2e6690e-e32c-459a-bcff-c5c0c7061af0@citrix.com>
Date: Sat, 12 Sep 2026 14:52:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [BUG] Intel Alder Lake guest PMU unusable because Xen vPMU
 rejects IA32_PERF_GLOBAL_CTRL bit 48
To: "Mr. Hoorn" <md.career@protonmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <krrWCHqvShbaZYcYWMN0UrK7hM73R53n6wh5hJLDkeoB1X_JCzrwR6e-1VVnFvh1rGjfXrBnbazIRVEr13ARHETQRr9LYb7dBP8KmLcSzgI=@protonmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <krrWCHqvShbaZYcYWMN0UrK7hM73R53n6wh5hJLDkeoB1X_JCzrwR6e-1VVnFvh1rGjfXrBnbazIRVEr13ARHETQRr9LYb7dBP8KmLcSzgI=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2d5534-733e-4c85-3e7f-08df10d525ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|6133799003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	S5GkSaEGieQFdui8T3gnxHHgK/XTP7obrAtpPbsqrEtZ/Kf0F02kM876G6cYFkvQYhgbhrC+rQ3GaKBq48Mq1UXsvTGMVam/UsahVSzNk0e/Y4BO9Rn+XTR0Ksga6/LikT1A/daWOQq6NJFlri3NUh32aS3144r9MM6QycfRY0DjDbTTs3DyX1n9bqelUTnvFwVUA3Fl1vtVSeoWEL9/PgQMJIWYLMQJ7Vh4YEPEneNDNcktHhBBozif8Q3r8B3TsXxmpHQX6FTE9BD8RRPnSbGdmBTal08wGoxxmafxn1eZC7DC2fbVGfIv33d7lwyM1dl1JcIBiorVJ2b+eEr4gxzM8q4o1bat4qY9+ziKvx8yHWmw4cizvz1NUGARZKl18l/6qUA6mK3azcp9XwL/OitoP6xWni+O2lHOtt8PBnmnjC6drmFbWI7Yt8/f/LtZbSWDWY5r4Ga1WtajwF9DOWgtD3Jw5et7cmAbrSckfof0LSWJyvuy4HjJbuRdb55//PdYNwMdhw+qnlLvIhK6TshtnBcoGNE2C4EkmybZkVwsNLuDWMR/vlx4MnPi6eRVV8WEe7Q3z1OE8HOOsMCPHl/2QIocXiCNtoVdBjI2Ipw/Z4YbPA/ti7g/LiyMviYmDeh40I+K9Sg9xUMc0QF2vcciBLctqWU0r56pn6BNVjI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1QxMzd1c2gyb0RNNUo0K2l3N1JmTENGSzUzRlp3UlRCNWs2eWhBdnprS0xv?=
 =?utf-8?B?RlZrQnRuR1ZiSUMzSmsyUXo5dWhhU24weHZkMlcybUVDNGdjQ0JkenBkRU16?=
 =?utf-8?B?aHU1V3k4RC9tR3pwV3daY0ZaK1J5Z3hwd3ByTEovZVZlMDA5WmhkYTZOSmRi?=
 =?utf-8?B?eGVoU0NLM1M2bktOYTVqbGk2ZlJZTDN2amZmSWhtU1FlQlkzSzBVSVZydTRv?=
 =?utf-8?B?VlhtOUpULy9La1k4YktRd2VwejhPRUNsNkxNWVgreWFwRHVmdVZHMDQyVW8x?=
 =?utf-8?B?elNUVlFrYzFVaVVIVVhDS250NU12ckpHUDduYXMwZm5WUnh5TUVBK3IzaUZy?=
 =?utf-8?B?TnBrYlJCb2MrMS8rb0tZQm1xeDk1aXFTTWRxc21QYlZpbUtFYmNLSC9FcVBZ?=
 =?utf-8?B?aTFITHU4ZDhySURtOXZwZ1l3ZDFFem1ocERBNnlYYVFvcHB5WUNkQklUaDdk?=
 =?utf-8?B?L0EzbXA5b2NGRUEyMncvcllGNDVISWRHWG1RNDFTdWZWeWJ1MG1qQmFuRUQ0?=
 =?utf-8?B?YldMdEoxVDJZdGYxQm1pMk1SV3FNT1F2S1diTVdGYXBVV29kVmFtVHNyZmE1?=
 =?utf-8?B?YjZpMm9xRW8yaC93MGpyRGozWUlHVTNnUUUvRkw5dm15UmV5ZVJSRVgwdGpz?=
 =?utf-8?B?eW9SRHU0dFFkaXhuQXAwSUV4N3JFNjRWRmFnNFhVQjB0Z2NvQU9uLzRha3FY?=
 =?utf-8?B?ODJBT0lGeFUzdzRXSmJ0aCt1SUxCTVM2TmVZM0thdjFwMFlZUjhHRkZZaGgz?=
 =?utf-8?B?c2tUdTNmUlRqK3VQcVdFemsyd2VROWFyaUVRV0RRcXhheWI5ZzBycXhjWmFz?=
 =?utf-8?B?YVRrNGU1RzdrdlVYYThjRjJMdGFRVXpsWGJsMmZSNVJoclFNWXV5b3NzMzM2?=
 =?utf-8?B?M09acHdmQXRwUEdCOG9QcHEyL0ZYaU83c2ZiNVdrczZybS9hQ0RGclZraFFS?=
 =?utf-8?B?UzFKTmlMUlBZOHJJLzFSaHlnOW1CVlpramZ2d3BWNUM5dnhITkphWXNmbk9j?=
 =?utf-8?B?TG1QYXhxL3oweXFuZUNSQURQaDQyMjZlMWt0U1NJeERqdXZTWWZHMW1KRXhq?=
 =?utf-8?B?RE40RHArZU1OcVpETUtFVWNvNFlqK1Vaa3JoQktGbGNjTkRUWUZwNlRYc2F6?=
 =?utf-8?B?Q2psZXNlR09kcFgyUGdFZ2hGeEVrV0ozNlRyTndhS0twL1piSTFLa0t1SGhs?=
 =?utf-8?B?dzZtVllyOU9qVVVyakxoM3htMnZPN2I4YXp5TzlGbEwrQnBKRFl4alZHMGNH?=
 =?utf-8?B?UUd6RUxNZkVuWTJhOEV4YzgxRm1PN3l4cnJzZnY1KzVTWW9uV0JqRmZ3UHgw?=
 =?utf-8?B?aDZFSlpIS2phTS9LUkdoM09UeVdLZEJPcDZUUmdzWGtzall0MUF3eXpVcnY3?=
 =?utf-8?B?UzlWYlhkVzBMY0NWbVVvUHhORHBESDhpeThja1FOSDRCZmFBZFUxVmZWYTl3?=
 =?utf-8?B?SXdraW81VmtCQnFRYUtnQVRFMmVWOW1FbXZ5TmloSURCcGZVaUZxSDNaNjdN?=
 =?utf-8?B?aXV0RTQyOWZEWjJjQjRLdFJGT1FQSXh1eGdyUkJzeHJwVm5hdFU4bXNtaC9P?=
 =?utf-8?B?R1RhL2ovMDYwaEF4Y2MwRDFpb2FNTEM5Y1U2c0NnQy9sWkFWU0I0ODFpNUtk?=
 =?utf-8?B?eUlPVitwRFl5YnJVTlkvenNXV2x0WFZJN3U3QVNObnZzS0YzeDZUTmRMMi9Z?=
 =?utf-8?B?djN5MGtXc00wb0NQTU4weU9qR09DcHM0bzdEOGM4MXF6THVrVGo3N0ZZdU8w?=
 =?utf-8?B?NndWQ0FPMWlKUGtTYTZVMktsdmtWVFoxU1Nid1VVd2dHRkdVZm11N0ZLQmJX?=
 =?utf-8?B?UTVFVWJlSkhLZ1dvRE5aSWpINGhqVkFWMGlsT0toVW5VN1dEVGNNM2tmdGZx?=
 =?utf-8?B?YjlNUkdKWkVhZ3dOVWJOY0xkSWlPL0FjSlpsRFczWExtN0FZOEpwTWVldmFt?=
 =?utf-8?B?b2N4WVNBekxFUEJQRnpQd212azhQaVBvSGZSQmdDT09OVkl3MkdscmprRkFs?=
 =?utf-8?B?bFlUU2JDNDFaWllUekZ1ZTZQK216bmNqRnAvb2RtMlQ2QUVOdXN6d0tiWWVI?=
 =?utf-8?B?dkVGUXNTaWNYWXZob0JKbnZwS0kvTEVKYkNQdURiQVFITTBtYUZoR1BJY3c4?=
 =?utf-8?B?MllLZ29FaUcwSzRRdW53NEJVZWJMZHdIRDQxRnVVeXlMNW5XSExUQXZHc2Rh?=
 =?utf-8?B?eG5OcktVSW5va0srNTBlK0VpMEhxZTBuY21PbTRZRzRIczVnUzhlazg0cENR?=
 =?utf-8?B?MnlJaE1EaytnbjVwZTRzWEROK1R4MHp1V09pbExNWkxkclFnSnhwVUM2OUtY?=
 =?utf-8?B?YTAwaTFlMllMUVcvM09FbDhTNXlOaUo5Y0YrZkEzQWFIY0xnK1UxQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2d5534-733e-4c85-3e7f-08df10d525ed
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 13:52:56.1049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxX9BUmsHD1EqWCsyqZ2pkTkeUIAdeeinvmUkmpy42mOpkkeCduzj/wSTZnPZeGRLWr/FF2pSvnMw4+EoVhXenGetIKqDD4bEgPJJ8u6zcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6364
X-purgate-ID: tlsNG-42698a/1789221180-188C99EA-A3A96D05/0/0
X-purgate-type: clean
X-purgate-size: 2514

On 12/09/2026 1:56 pm, Mr. Hoorn wrote:
> Hi,
>
> I have isolated what appears to be an incompatibility between Xen's
> Intel vPMU implementation and Linux's Alder Lake hybrid PMU
> initialization.
>
> Host:
>
> Qubes OS
> Xen 4.17.5
> vpmu=1
> /sys/hypervisor/pmu/pmu_mode = self
> /sys/hypervisor/pmu/pmu_features = 0x0
>
> Guest:
>
> PVH
> Fedora 43
> Linux 7.0.11 (also reproduced with 6.12)
> Alder Lake hybrid PMU detected
>
> With an unmodified kernel, Linux reports:
>
> Performance Events: Alderlake Hybrid events, Intel PMU driver.
>
> but then faults while enabling the P-core PMU:
>
> unchecked MSR access error: WRMSR to 0x38f
> tried to write 0x000100070000003f
> __intel_pmu_enable_all
>
> 0x38f is IA32_PERF_GLOBAL_CTRL. The failing value contains bit 48
> (GLOBAL_CTRL_EN_PERF_METRICS).
>
> On Alder Lake, Linux explicitly enables this for the hybrid_big PMU in
> arch/x86/events/intel/core.c:
>
> } else if (pmu->pmu_type & hybrid_big) {
>     pmu->intel_cap.perf_metrics = 1;
>
> Xen 4.17's Intel vPMU appears not to include bit 48 in the accepted
> global control mask and consequently rejects the MSR write.
>
> The practical result is that ordinary hardware counters are also
> unusable. For example, perf stat reported zero cycles/instructions.
>
> As a diagnostic workaround I built Linux 7.0.11 with only:
>
> pmu->intel_cap.perf_metrics = 1;
>
> changed to:
>
> pmu->intel_cap.perf_metrics = 0;
>
> After booting that kernel, the WRMSR fault disappears completely and
> ordinary PMU counters immediately work:
>
> 12,228,346,996  cpu_core/cycles/
> 27,471,544,939  cpu_core/instructions/
>
> A repeated run produced approximately the same instruction count and
> sensible cycle counts.
>
> So the issue appears causal: Linux enables Alder Lake P-core
> PERF_METRICS through IA32_PERF_GLOBAL_CTRL[48], Xen rejects that bit,
> and PMU initialization is effectively broken as a consequence.
>
> I have not yet tested current xen.git, so this may already have been
> addressed after 4.17. Is bit 48 / Intel PERF_METRICS supported by the
> current vPMU implementation? If not, I think Xen should either
> virtualize it or expose PMU capabilities such that the guest does not
> attempt to enable it.
>
> I can provide further traces or test a Xen patch if useful.

Thankyou for the report, but this won't have been fixed.

Xen has no real knowledge of Hybrid; this is a known and out standing issue.

~Andrew

