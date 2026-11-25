Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AED606A335
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=PeCcYh0z
Received: from list by lists.xenproject.org with outflank-mailman.1502432.1698478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWDfP-0006wQ-Pl; Wed, 25 Nov 2026 14:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502432.1698478; Wed, 25 Nov 2026 14:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWDfP-0006wJ-N4; Wed, 25 Nov 2026 14:08:11 +0000
Received: by outflank-mailman (input) for mailman id 1502432;
 Wed, 25 Nov 2026 14:08:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xWDfP-0006w8-5v
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 14:08:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWDfO-00CPMj-Dv
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 15:08:10 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06ebc0-e002-0a2a0a5209dd-0a2a45079626-28
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 15:08:10 +0100
Received: from [52.101.201.23]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06ebc8-b4ea-0a2a45070019-3465c917783a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 15:08:09 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH6PR03MB258363.namprd03.prod.outlook.com (2603:10b6:510:3df::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 14:08:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 14:08:06 +0000
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
 b=a1buFpG91ncpCDomX6eDn2lR3OMjwZCtC/aPK2rp3dX6OQzv/qzJajWrvpdBhI6fK5tlG61ca5nxFU9lRdm7R1uefVd+EGTw7/ykg1Hgczn2oDPbB3d8Y0ZXhEIEIUrEveKPYD58Do4xz++yW5TP9NMXXykaQNcdTBfi38ygsglPjGlTt1WgroR7vILC9ZuTeM569J8tBz2zXQL4wO7Rb9baXsuXPcDr/CixsT+VKTO0HRiHYKlKcbYJNuv8KTfNWp6KjprTAqbvHgLvCoCtn7xGFmydy65mFK9CsLTdLyb+XSxK81H6OM8kM/yu93J43bqG8GbDmLitqBgeM2laeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxS7nfptsWyhMOtOXkl2CRIujZEka2dL3OB/klDfiXA=;
 b=WNuMTiTbrzoPeAgCGsLT3ozcSB974Kggp7yz1PXVngxw8rv7MafAeyJFRVcmc5bYjMIPlZCzF9nb3qtG26n4zLfptMZur0cnD4K0IcyzXnSo9kevdd8lZLdVvU7e0e8xz229m3GTnilyUjaWYc6KSR247JgtDTbcJ2HkNnSEtfewTNb65HnXdE0m2vX6WZUp61Ma/uW49hPewBTKMLCL00CXs8QL2bnGpf+00zgtDYz3OtJZ8z8mf2AZg09RU1NEzxVCOb6KhJDqPscT2VaZAmYPEBl2YjV+4+xMJ68IplqppMu23Kd0wY+y07wM/os5h44DiFLbtQseDH8EjQSidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxS7nfptsWyhMOtOXkl2CRIujZEka2dL3OB/klDfiXA=;
 b=PeCcYh0zUwbdwFivgvHhpZP10XbN+0ZZzHTumOmatIZ2rnPFXB7cwgIe/cs3hFra2iWAKDxt3BrUMOwxY+zyC+MlEgFROZ0bKSBfGF0CcvQdNuTqFXiQb10g9d6BJ3zrJDEu36pZ5tfD1xskmeIZTHQZ/T0CSdHVN+VjDCSUTkQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ac603be6-0396-47e6-a8b7-07c3cf411b94@citrix.com>
Date: Wed, 25 Nov 2026 14:08:02 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 02/13] CI: Reduce timeout on test failure
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
 <a61efbd50844b2c3084182faa73d629d45250575.1785941707.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a61efbd50844b2c3084182faa73d629d45250575.1785941707.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0053.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH6PR03MB258363:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b995ab9-6b0f-41ed-fa12-08df4afd86d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|6133799003|261009223027099003|18002099003|22082099003|260925021911599003|260925021311599003|260925022911599003|10067099003|11063799006|56012099006|261102123227099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	9IPFtebzKIE1LmzruEjC6QK3IOJ9paZN5IZLovtpKmGVya4GtBIO9yOfHzq/LJPBBatQtEupVyK4FRfNl+kYT1v8Sn0qNXRetCgOGAQ/fMWF9p7pwpM2kdV/BkJ9iX938Jnx/iyh/y5AtqNXtolzImVdcEHrwfMej6ISYr8ZYlUmvX31Dk1LlIVtMEXEFcblSaKKA/ryEhInCsNyDky3eq3vcVlAwIV0a8TNNesg7YeSe8X0/r6X+baGSzVZLa/fut7hu9KFMHtD7nUufjFyXpcbFa/7QQEgNUGXu4qZbXUIqqXG4+3KbP1vg34c5Tgpikla3uCm5bZGlZG73ZjNvYPgo7GfTHTsYS/MPNLfF6ojr7wLKexp6dR8v3IJG+PUHX86w+tuiFH1BGLSdd2fsJxl5UY8fcLLZ4tAQh2QoAruymKO+GBgqodEL1QxxZGDDgt7Zd+DL1+kcJQUqpqSsWA7R8rJA/K9r75QmyKJewSBZ3hmZmgktVci8mOztjl2EqqULmHocM+Mo6qODQme7g8DrDHfsbz5QKrgEG6f4JmlPbbtFdaKkCccLR3f1EUK4QaIcnyw7ibV7qa7YCHoCJIMJcYcMTvBkhO/uKbdmuAzOIdtkK1C4PZD9KDN+C6pUrMMLAivhkb0IZ2BBrUAOlZqdbkrysAElMpbsfIP7Mg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(6133799003)(261009223027099003)(18002099003)(22082099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZOV09rWS9rRHFmRjd4QWk3NE05Z09FN2NMS2poUmQvb2Z5YjRQOTR4V0N2?=
 =?utf-8?B?QXNHeERJMW5CVng1M05RSThaT0gwQnRBdDRiRVFYYXBqZUw0bVU2Q09rZ3Ru?=
 =?utf-8?B?cHdOWlhZcTgwRUpCQXlsdnVabmNQczROcDJ5bmlMYWYzSFhyeUd1UHdBbENi?=
 =?utf-8?B?RHd2NmVjckpvZG1udFZXZTJSdWFMY2dGSGdZQnpXNGFjVWc2OEoxbnpPZEQ5?=
 =?utf-8?B?K0hqT1c3ZEhGRFZrbldnTmtuZVowVm1HalFXK0dlUTZvNVY1S3dVandiZTFS?=
 =?utf-8?B?blNVVGdiRUxwczdqdlR3MzZKWVRmenlzVnpUZTNhZDkvSHZiajFYWC9DekpN?=
 =?utf-8?B?cWlFbHVLeHoxMlFERE1LcjU5UVlLcHN6N2Y5UzlWTUtzMngxY2FNdml1WFQ2?=
 =?utf-8?B?aituS2VHZGdWZHR0TG8vYldRZUJQejFUb1RPM3QycGtDUi9pWlFaZFJ0RjdB?=
 =?utf-8?B?bHRBNkU0VEtpWkZyOWJWM3M4bmszUzVueHRKMWNuR0pzRmJPdmhZTnhsd29j?=
 =?utf-8?B?ODl3Qko2QU5MRHNSQTdNUGZTcHhCMVhlKzN2TDZUL29TaTEwZEdsOGRGN0tu?=
 =?utf-8?B?YWhpK0lxTlFzR1QzZ1lPR2xNeXlTWjUyUTIwL250WlNuaVpicE1nTHpiWlVB?=
 =?utf-8?B?eU40V05GeEV5bzFRaHJwT3R1T3JWbWs2TWQyYmdOMlZnU0RiSmhLbXM1M05H?=
 =?utf-8?B?WXRFMWtjTnR3bVJnRVFZdGZ2RFQySDgwNVJVTzVJTEZ0NVpKMGZRdGJING1z?=
 =?utf-8?B?TnNaeUdFeTZrdWFxdldtbFcxRFBqMnBxa25MOVQ4REFkMTFhN3hQd0U5UU5G?=
 =?utf-8?B?U0lSSEJNUHM4NWt6UVZRQzk4MUgvMkJaWUdmMGdMM2ZQdExoNlhnMTNyaGJP?=
 =?utf-8?B?NDVmVnp4eG4ydWhQQ1NCcHMvaFhBdGphRlJiOG9rYUd3R0RWa2RnK1U5UU1D?=
 =?utf-8?B?V2ZDNnVNSGlzY0lEbkJBcGt6UEhqUDdWNnY5WXAwNEVnczhWNnkvMUJuR2NB?=
 =?utf-8?B?ZzRERXRBQlNrTHJEZzB1UC8rSGZWbjhjZTR5SG50RmxGLzhkNzhUN1ZpYnBv?=
 =?utf-8?B?RGhid0NpemlNZ3VCL3krZ2orSVVpR1RwZVl4ZDRXa2ZqV1lGKzVDNEpQWWtR?=
 =?utf-8?B?Sys1cmhLalZ5UnY1blo4NXorR3pCbU1GWWExZSt4YjJjQzhVQWxTM0hMTW96?=
 =?utf-8?B?L2Y0Smt0QzZTaGZyR3Y3RTlDbkdDMHM5ZW1jaXljQ0VjQTFZSXduYUZ0bmN1?=
 =?utf-8?B?dzk3MHhmWm5ISTdLZnNSalZIcytwZmNhWnpLWDk0TU9EMm9oWjJjKzB4ZzNR?=
 =?utf-8?B?bzhpZVMvU2I1ZzhuR3Nta2Ric3lFY3htMEFscFhFcDVwVkpjK0dTVE02WlVK?=
 =?utf-8?B?RHYxbzBSMklrdjZkKzd4Qm9kQzV5UHNqN3dNYjY4VHBvL2dMcFlISFNQNUpQ?=
 =?utf-8?B?SzJyU3dTV2ErRkY0SXdMNnpSWVhHckEvU2F6cHFaalJlWlBDV3Z2cjgwZ0l0?=
 =?utf-8?B?WHpuTGJHSUY2M1o5U1F1Wk9iVGYxaUR5YTJUN011ZVpnQytaN2lRekNJVDQv?=
 =?utf-8?B?VDk0R21sMHljY2V6NERJc2FacEpaaU5rUkFxYkNPejkwc2pVR1VxUnlTQUU2?=
 =?utf-8?B?aDNnSm45NVJiSktENWRpRERyVU9wWmlwc3F4V09URVUrdWNFMmpJYS9icGxM?=
 =?utf-8?B?TzdwQTJYOE9kWm9EWjI4c2tPS1c5N1ZiblRBdS9vUlRlUEJwelhoMGRpZVIx?=
 =?utf-8?B?Uit0ZE1kblhzaWU5S3djZFRrRXYzbDB4VzRrTlJ5NnBYYUdGemZaZ0p3clBw?=
 =?utf-8?B?bjB0TEZVU09ua2c3b0s0MmRjTkRVMGwzVnFJOWlZOXZMYm1ZNnZWYmJhMFUx?=
 =?utf-8?B?SEo0bXRUQWNHWUdpUVUzU2YvVmw4b0NrVWFEaDRUdk03Yk9wUmV1VGxhUzBi?=
 =?utf-8?B?ZFBFSExUeUFsWEJEMENzK3p4RXI5djl5UjlFb3RVVG44Y3R4YnkyL3p3L1lx?=
 =?utf-8?B?N2k2aTNMMDZ3L2dqY0I3RTRIemtmc0dpZHRsdmJYU2lWMUJHQkJBOTBIV3Zm?=
 =?utf-8?B?N29uOWNvenBON2RFM0tCaHJ4dDlCSHUzdmt6TG5WMFVsZ3RWTGFabFJjYmZl?=
 =?utf-8?B?OGZlNHgxVG9SRnpueVBTWnlhTFU4L1pPMExZdittSEtCWXFBUUdUVE9EMXJZ?=
 =?utf-8?B?bEp5ZUhaT0RrQnlkekxpQzlneFdKL2RzNU5EaVNoSE0yWUdYR0V3QWx0OHFD?=
 =?utf-8?B?NHBFQUQ5UThDRElhaFBiU01NempEeGROcE0wemxaQzJHc1hPY2llcEhYYWgx?=
 =?utf-8?B?b1UyYmN5WVpWQlZlV1RMdWRSK0NWMmhnaEhFL2hKKy9ZRVkrYWw5TDlaOFl5?=
 =?utf-8?Q?tsZQi0CIEYQtqDj4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b995ab9-6b0f-41ed-fa12-08df4afd86d5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:08:06.0817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUfZbWxsCHKdNnJ49kXxSxwNC6y6bu06IL4wN9NNNEM3q/2nMfUs9C3dr8qd/ltk+PFBLrQqKwhXWhrjkwck+6DqLFxe7raq8ewqXQAhA54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR03MB258363
X-purgate-ID: tlsNG-ef75cf/1795615690-35AC0AE4-EB195C73/0/0
X-purgate-type: clean
X-purgate-size: 1698
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/08/2026 3:55 pm, Marek Marczykowski-Górecki wrote:
> Tests can specify two expressions to look for:
> - PASSED variable: what to look for in a successful test
> - LOG_MSG variable: what marks end of test execution (regardless of the
>   result)
>
> If the latter is found, do not wait full timeout for the former one
> (which will never be found in a failed test), but check for it with a
> short timeout instead. In a successful test it's supposed to be in the
> expect's buffer already, and in a failed test it will never arrive.
>
> This should reduce waiting time in case of a failed test.
>
> Note the other case (when PASSED is found first), the timeout should not
> be reduced, as test may execute some more after determining the result
> (for example it may collect logs for uploading).
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> New in v5
> ---
>  automation/scripts/console.exp | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
> index e27886bbef23..d65f840a315e 100755
> --- a/automation/scripts/console.exp
> +++ b/automation/scripts/console.exp
> @@ -65,6 +65,7 @@ if {[info exists env(LOG_MSG)]} {
>              exit 0
>          }
>          -notransfer -re "$env(LOG_MSG)" {
> +            set timeout 10
>              expect -re "$env(PASSED)"
>              exit 0
>          }

Something between patch 1 and 2 breaks at least the xilinx dom0less tests.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/3113968288

(The pipeline is still running)

I'll drop these two from my queue.

~Andrew

