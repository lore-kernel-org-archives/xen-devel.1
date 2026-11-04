Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C9606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=QtVb0WpK
Received: from list by lists.xenproject.org with outflank-mailman.1471749.1679975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZUl-0008QA-BI; Wed, 04 Nov 2026 11:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471749.1679975; Wed, 04 Nov 2026 11:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZUl-0008Q1-88; Wed, 04 Nov 2026 11:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1471749;
 Wed, 04 Nov 2026 11:49:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xOZUk-0008PV-5V
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:49:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOZUj-0061uB-IM
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 12:49:33 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb1bbe-8faa-0a2a0a5109dd-0a2a45089ef8-48
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:49:33 +0100
Received: from [40.107.209.54]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb1bcb-f659-0a2a45080019-286bd13637a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:49:33 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7043.namprd03.prod.outlook.com (2603:10b6:a03:4fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:49:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 11:49:29 +0000
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
 b=B5FJSre8s9leNPBhhICO9UYq+ssD2y9Z1ymW+UDzSgPQOgJ3p04J1Ppcwnx2fDFzuL8XUomgw6HMBgeizjQqbKSoELwMCQ1mnju1JMGv4x92jwFUyxH/be9e9H2hG+/e5rpUXXjk6NUfNX+iBJ+3GgZRcceWRad472ZOX4dMbmXp8AkzV+Jwnl37NfKI90ZAbimvOsCtqDik/f/iFpHnobjjXH6hmPth8KZzQG3vACvuIXCkF6DRPeWqfhIsq2qr4yKpEzLVg0EpFJLgePmcVVBRi5kjOxp8NpqHogsYYOb4oPWf2GxI0g7/aiG7hSjjtX+E4sW2/oKE5EGyLv3gwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbrqTKGKZgdHSI1x8TFbF3+zSNZJaIQRnESbavUJu7Q=;
 b=jzwLb6GDA/OqEdMbwLJQxupLoI8vdUJLN7KSir+UHhg+4cTEu+lm5JwuXRfuPuaEPry4dO3rRq+YnMX6OYev6m5R9Tdl6vuyzVP9B75qfSGbGYlMAYt/7XUbJlEjLq6OMzcQhFdEc0MPvvCiz5H0IuUzSqNXTKe78tDvnjwIUfHXE2PmNukhorO8bpWU55WiZHUVfB0YgFpiHBOGqgqOvdhYwgZBF1bys/vMKe3P9x+5kBlyDFCDyFCRC3JVkJUjyPVx9bz0G/DfUx3jIo5NF08lGkpxH5EqvaJPUPbh830HSJbNgF2ouIzYw6Ts96DR68HpGGqe4LkJ7MmlTHxtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbrqTKGKZgdHSI1x8TFbF3+zSNZJaIQRnESbavUJu7Q=;
 b=QtVb0WpKdYr65aK/53r+5fq8P+omzlu+zFHn1ktVmgNunOC6gYYf2cTAtLuUmwk0l1c44oDwI4SD43YOQp1unrJFrSdVm3Xxi/3D2CWDhkXuQiLFRF/FxEtXMrO6k0Uh7Bt8MIP4aC+AkVjNN/iZ9EH3gAGJVEVrGraWQxYVDlo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f66d95a3-51cf-4a10-9984-e1e44a7ceedf@citrix.com>
Date: Wed, 4 Nov 2026 11:49:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/4] xen: make stop_machine_run() take const void *
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <60f768b63656cc41b664678618c17248823b2d7c.1793699713.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <60f768b63656cc41b664678618c17248823b2d7c.1793699713.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0666.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: 474c31da-8ca6-4453-565d-08df3a69af20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|4143699003|22082099003|18002099003|5023799004|11063799006|56012099006|261009223027099003|261026121527099003|261022075727099003|261021121427099003|261102123227099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	VyS1YBcgpZaqvNlka70bKqF6lcHkZG5SwoeFybj7TtyyPb//rZIHvX91V5WFKec3CkW/tm59+pLOBRdWO0i77XUHu6q9/b2yRKfyelqWv8hCDcJC8cGIbxQqPw1zQ8oDon3R7DfXiKGlNg/Z+8o4R+2P4vkFRA4Xy2jGvyCSparT3TxGwMYo9EROlXO2lLPU2qiJgKJyJZc2Q3yJdqkGrkSF1u1GCLbHCCuR3zVpTntZxn6YdyHNojAQI01x7UfgK6EMXjkWxdHSoeONal3yVYIr58FDwN1LZHTHHjzaAoP8kumH/soQEAGak/H9yPUSb9cmnLUS+okRGXw8SmhcV2rGfuJcVbVNBILDBrYpb9SzPyIPjZFBlunrVn5dJj+TUZJqyPtQm44gYH4wagku/Pq8YdhPspqVjoXmeuE/OdHzZ/IbtQsVMyu483DCRr0QFt/cVlvhQUiHNhX1JpawUi+tRf4P+ELU0bIejZoFwTMzIE9SxDzuPrx/aerr1+ihi6rBcW6ImufMboDQetnBoDYrVIrihGkcCnY+Qk8hLCHBjVXK+TtuIgUL2wOOn3u8ug/LlUk/RqjaOeDUi5+3t4SAoNQMWd1DdZeMhWUEWoowVjdtP1EvRxb7lGtkwRjWth1cahEkSFys2Zqvt+yXYhwK+1pBQ5WgtYSAL+otL6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(4143699003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261022075727099003)(261021121427099003)(261102123227099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFdFYUVaWU1RWGZjUnFaeXUveHNlZ25JUXlyTUJMZ1kxVWRWYWU2RTJHUGlZ?=
 =?utf-8?B?RElLVDFreEVBSEZYUmM3NDhYSWRLWDlEZTloMW5qemZ6SDlkdkd1R3NKSHo0?=
 =?utf-8?B?YlgzZVRaTGpsV09ublhMM0lOQVV0Ny8zUFJ5ck8vL1VwZFlyMTRzbmQ3ZlhE?=
 =?utf-8?B?NXFVdU1CMXRzeENockNTanVTZ1NvejN5U1JNYVloWXdQd1hEeTQxTmI5YWtO?=
 =?utf-8?B?TkNuVVgzY1gxSlVtV01ETjV4VEFYWDViSmlVa1dxOUdNTWRDZzlCSWtXWm94?=
 =?utf-8?B?WVdydW9ySitZbjMvUzZjdktzS3FrK1h2ZjNVd3NadDlLMGJPeWpTMnJKY0pn?=
 =?utf-8?B?aWJHK0dmOWExOXR0LzcwaEpFTzc5UXFWOU83OXp5RVIxUS81cWJXVUo3c0pZ?=
 =?utf-8?B?djlZdWpNeE9VeVB4ZkxvUFNhdG9kb3VPNktnMWt1VlU1VCtDbGF4SFJiMGtW?=
 =?utf-8?B?d0huVzR6TldRTDQvN0dGSHNRZ0s0QkxyM1J3Q0puRWI5aDRrb3VhMmdHN0xy?=
 =?utf-8?B?UkxOMU1hLzJpL3hteGVJRjh3bXhyVmV1ck8wWUoyKzkxcHRwVnlUU0piUEFN?=
 =?utf-8?B?L3NUY2pqRFZERDI3NlFxVTRMWGNUbi8zTVBldVdRTkl1a0JLZmFvRnJ1K1dH?=
 =?utf-8?B?MlF4VGFyNkxwdjM2K3A0NytBQUdpV0pnVnF6eCt1NG9BMk4zdHh3RjJrVW1F?=
 =?utf-8?B?VWJ3RzRyREFGaGdBTzVUZitHZFArbkdxM0FWRWwvTUxhY2dlazVuU2wxL1lz?=
 =?utf-8?B?R3pGRDl4ekFEZ0pheG9vNi9aVVlWTS81cFJZalBudHF4eG1FSkVVVzlRMHFj?=
 =?utf-8?B?UWp5cHlTNWwwRnpObEVRNGd3bTlZTmZ4YjhHMHllUXhrQjdocEZqT0Y4Z0Fs?=
 =?utf-8?B?anJUc1N0eVdMeEMwczZTTDgyTXFkZU1wdWw2dzdrelhXZmZxSG1xZmlTZnFL?=
 =?utf-8?B?TUh2b2FtUzRsYTAyZ0g1RnlFWm10SEFKOWc3Vnk1aGZhRG9SQ2t1anYrdUJx?=
 =?utf-8?B?Y0VyZng0RGdJb1V2OEw5UVdWQW5sYnN4cHRLbk9CWG83NTNVNndGc1VwNTBl?=
 =?utf-8?B?QWpFM0hFcXA2ME1DTXJyL3JKV2E1SjUwclgxMklLSTYxOVd0RXo5U2E3a0xV?=
 =?utf-8?B?VlFJTkdFdjQ2alRBeWxSTGo1Vi9MdmdOb0prRlQzb0c4WlJYWENqMnN6T3Jx?=
 =?utf-8?B?SjI1NThpY1p3ZTRkaXlVYVBycnl5OXpCUjAxY1FWdGY3KzNqOWd0N2h2cXN4?=
 =?utf-8?B?dUpVWktjbnFLMGRPcnB2NSt2Mk9KcFpZRXp1bkZScGVXUDdoY2FhMHR4c25N?=
 =?utf-8?B?bWt3a0xVbHJNdkU0cUdWN0twWDBuZHF2akJoeGkzYVYwbW9nQUlydHR1SmJk?=
 =?utf-8?B?SGNZVDc0ZndmTjJiN0srQ0hQK2c4Vm5zenM0UDBybHdwc01RZkoxV1Z4NmI4?=
 =?utf-8?B?Rks3SVZJNmVZWEs0ajFaNzhsb2tTSHoxbTZiaS9VYkRuQ01OclVOQmxqYTVX?=
 =?utf-8?B?UzNzbjkzZjgySUhUTWY1eTI3ZFhpeUQrSi9kTlNWY1pzLzcvRUJ6UVZDL2JC?=
 =?utf-8?B?aHI0MHM2c2ZqQlI0UCtma0Zmd2dWMEZWbExXNEU0bWJRejIvOEgvdWEva2E1?=
 =?utf-8?B?cisyQmIxZ0pWRThhaFZvM0NyYklWL0tUbG5vZFhxTWo4ZnpLSmtLU3gyaHcz?=
 =?utf-8?B?SlptM2NLMW9EYkUweXUxMm1INlAvWDVOKy9xaUVrQUs3bUlKRU9aOXViclds?=
 =?utf-8?B?dHgwRHFOVnQ0ZVNmMklCa2RuVDNKNFpueGcrb014WWdmeU5yeTFBSkxtaHlj?=
 =?utf-8?B?R0FKQ1BoWUs1aEtkUXoreVNSSmYxeW5qaDZsUTlDWnByRjVkZmVISUdWRWdW?=
 =?utf-8?B?SG05OUVvTHp6b0NrVitRYlV3alNUNUMrZ2hCdjk5M1N3b1hzcUxCa2FYTmZ3?=
 =?utf-8?B?RDZ1aUdYeW1qeTN2U0JubjFDUzNmbVNjY0lFM3M2UDZJOGlZaHI1ZXdjTWpZ?=
 =?utf-8?B?ZlVJUnJld1pvL0ozK0xUdG1pZlN0M25NV0x0allobU9jK0FOeGFWd3NNeXdD?=
 =?utf-8?B?a1p1UVRoclhLQmk2aXhVZnFWSEx1TkhNeG5YUG85aXpwOThCcTBkMGtOWGdV?=
 =?utf-8?B?OVBPWHZqVmFCeUxLeU85cnRBRkZkbUlwOGNvajFidmxvdU0yQ0NQQmYxTEtS?=
 =?utf-8?B?VjdSN2MwSWhKMVVLblFyUU9aMm1EaG1hWXNzS2IvVFNNbTUzczQvTmNpZ1Iy?=
 =?utf-8?B?eERienMxa3U3dWwxWDhJMjhFSllJajFlNnlQM01ISjNPQTJjTnpocjFmWUR2?=
 =?utf-8?B?ZVpucFE4RFpRelJoeEQ1OXRpd1VtVnlSZmpYekJxd1dyOVhNa0ZHUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474c31da-8ca6-4453-565d-08df3a69af20
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:49:29.5439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dIoOWYUUB24+uGRmhzbiV9ksiykefDsLrRQCwk5Q3/7tMJEuluM1HRFbD7TqDOJm93D3cnMG/jkYWbhxuIPYzVhu7ssMDd5G9EbPC7eCAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7043
X-purgate-ID: tlsNG-c1860d/1793792973-CC57487B-AE2D2D65/0/0
X-purgate-type: clean
X-purgate-size: 1848
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 10:29 am, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 11.8 forbids casts that remove the const qualifier from
> the pointed-to type. On Arm, enable_cpu_capabilities() and
> enable_nonboot_cpu_caps() cast a const struct arm_cpu_capabilities
> pointer to void * so that it can be passed to the capability enable
> callback, either directly or through stop_machine_run().
>
> None of the stop_machine_run() callbacks modify the data they are
> given. Make stop_machine_run() and its callback type take const void *,
> and update the callbacks to match:
>
>  - the Arm capability enable hook and its implementations
>    (enable_smccc_arch_workaround_1(), enable_spectre_bhb_workaround(),
>    enable_bp_inv_hardening() and enable_ic_inv_hardening()),
>  - __apply_alternatives_multi_stop() on Arm,
>  - do_microcode_update() on x86,
>  - take_cpu_down() in common code.
>
> This allows the casts in cpufeature.c to be dropped.
>
> take_cpu_down() is always invoked with NULL, so it now passes NULL to
> _take_cpu_down() explicitly. _take_cpu_down() keeps its void * argument
> because it is also used as an on_selected_cpus() callback.
>
> No functional changes.
>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

I think this is a backwards step.  It is pure luck that none of the
callbacks right now modify their passed pointer, but it is very
intentional that some callbacks might.

Callbacks use mutable void pointers in C, and this is a known friction
with the C type system.  If there existed a way of matching mutability
between the callback and the pointer, we'd be using that, but it doesn't
exist in C.

The safety here comes from the fact that an individual function doesn't
modify the thing it was passed a pointer to.  I think those want local
deviations.

~Andrew

