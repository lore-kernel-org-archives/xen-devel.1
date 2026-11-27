Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB761606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=CQatceyc
Received: from list by lists.xenproject.org with outflank-mailman.1505825.1700197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xX5HB-00006u-D1; Fri, 27 Nov 2026 23:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505825.1700197; Fri, 27 Nov 2026 23:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xX5HB-00006m-9Q; Fri, 27 Nov 2026 23:22:45 +0000
Received: by outflank-mailman (input) for mailman id 1505825;
 Fri, 27 Nov 2026 23:22:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xX5H9-00006g-W1
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 23:22:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xX5H9-00GoVR-1w
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2026 00:22:43 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0a106b-2eae-0a2a0a5409dd-0a2a45028106-28
 for <xen-devel@lists.xenproject.org>; Sat, 28 Nov 2026 00:22:42 +0100
Received: from [52.101.48.13]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0a10c0-4900-0a2a45020019-3465300d8286-3
 for <xen-devel@lists.xenproject.org>; Sat, 28 Nov 2026 00:22:42 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6450.namprd03.prod.outlook.com (2603:10b6:806:1c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 23:22:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 23:22:36 +0000
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
 b=KacSSNdJXZOPSzpYrUypmU7OO31ZUzs8rZY3cg+RF4KywZW52IhASzf6wQysVtx/r2UpW0f6cDEQlPdvJ6hsmkindc8Zv4kpqo5Q5kelRVxcNliIdFuqZ+cIlYxUM3iHw45QRnJyqPyDx357F8EV8R2PYC8s0gMsM8RdkpimTeepZ02VD3ZGmjYrPkrTowKTkbXYl2Jmp/0kbzoUW6xNi7xQyjkG0wcPVDSbFxJS+EWerffnTo/XsL3OSiht8ZNzNhbTDenxoui8HcLmCkEqmdM+T4fgEG9otheZnO5kGiEQ3k5u0Kr+2KMdWWLwGooxWVham+EMAG6W83iHs9BPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvH2ek0ppFzPoqq+czljMkeoC8O4rDlRo6qsgKsi7Qc=;
 b=y/VPn3uXO6K/AK0HOtw3LXl9cNESNsDRAX7lM5z7A7CdT90EBkhKXxi9hNBOIqp8PeZj+7qHk6gjYAvotTO9aHmlawuCewNOxubBE6u5yLm+/4jicetKWpuJFqa+x3l38jCoo+slAHDAN5P0j3UecU+Ge7szXF5PMFLIK9OFaHGh12rqd3QhByHnXjRsFAyE5zlY9l5aDqYhE5OzrLNlL6p1bqPTT6xTyVDie8OdoIhYwYRI6V8DjSqvpmkeyXE4oIBgq3JmoM0pzFwIFxdcbbDe5YHO+uCQELUJpntm749gRbdEeaZmSDHGfw6aXPfyBY6rXl/0v9KXoqrsXX2zQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvH2ek0ppFzPoqq+czljMkeoC8O4rDlRo6qsgKsi7Qc=;
 b=CQatceycqGqZ8T2odX7QF+kmzZPrzMOmk14u2/mKNBZptC81JO10KMg/Y4AnN82E3wbs9Yx+/TCPVSst2H1s2jQkqfBmQkA+ciEBjQt8nslBtUjyZwlCW+nA0wQMJIdoVlIlIQlHz7hou2Pc7eKA1wPcD7aIvzktChi9s1ccNbk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <681b7764-7c79-43f6-923a-e09e1566946d@citrix.com>
Date: Fri, 27 Nov 2026 23:22:33 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 1/2] tools/ocaml: check physinfo and domain_getinfolist in
 the bindings test
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1795790988.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767@vates.tech>
 <1795791234.8631fc262581453bbf619ec5b2062170.1a21d7fa6080004767@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1795791234.8631fc262581453bbf619ec5b2062170.1a21d7fa6080004767@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0405.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 695dfdf3-6c65-4e84-aff0-08df4cdd52ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|5023799004|4143699003|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pSrSS6R3d1l23UrpPuGF9h26i7rVQ9qOl4dtaadE+EQguM9m4ms5JFlxlfHeneEbGsrwfcFpH27EDC92TkgFDXvVWIA06aJ72k9Nslhm4dtXAuNEVi3pTizpfvBBOg2i9ObMn6REkTwEd05Nan4KhNeMfK1mN3QiKQksXkCF7Rz7EXqKjGg5q43TwguYRqc6C/DuTMHgmJjl03wjcBM/H3PDLirE7HLqLVGb4bH2koF30Daf7/A1XWK3GMj5qTY83J1QpSDHTmDlSmuVfCG1NlCPn8VxvlbJIocE5HH08Ro/06IRIxHkHQXUcR/azwtMhnZkWgZ47wFd3jleLa6JxtuovGhr6OAuZD1uQQtjB3H7zEB9KlFjXAfFNfRwbO5M9pdITxlHOl3T6YwzvfW71EEUQMMNVxUFxMNPSGj9QYOuAMdGAM42jKVqf4Ky53yfr8yDGhzFcSGDHHoOnbDt+aA7W5D/XmlpaV9/pTUebtXu+eYNcagTv/+8gSAvKKTklGISWys3Yi+Vq3+8j7n0A51AtT7KVdbcRvHWI2VgVP7qLvhCI8xPBkYezxkEwiRyDdJMsOIxg66t93f9pc0U0PkwvVbu6NEZqGC/li1aU6lPey7xB4ybr6jvLTaFHn6PhEVhkjjGj0X3EARdnQ1npwzp+GBZ1L45hf8SiiMXTV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(5023799004)(4143699003)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2hTMjNhSkczT05td3NadndsWDdZWEw2UklFQndhTG9BNVREQUlOaWZKcHl4?=
 =?utf-8?B?dldrZUdEcWlRN1JYVFlCSWFKUm51WXZ0UU9rZm1tMnRvamZMYjhVNlVEYS9W?=
 =?utf-8?B?eVE1b01tN2EwYmFNMlJaSm93ZGd1eHNMV29EUWsxTFc3em1laEpNeC9XaGFW?=
 =?utf-8?B?aDExWVgvczRmL0hxOGhLOTQ4WE1pQVpzMU1jN2YvNTZrYXhFbkpwb0M0SW5K?=
 =?utf-8?B?cEJKcnRLanl5Y2tCYzhvTEhybXBKZkpBc0dQbzhwcE1HVER0M2VSWEhVN29U?=
 =?utf-8?B?ZnRJeDNyZlArTVJ6WUFSRytrakZUd0Y2cGUxcmRJbE9xTG8zcVRPUmtuYnNh?=
 =?utf-8?B?TWhtNkwya0xJVmZGVzc3SHdSWVJqZGExUDhDKzdpekIvN2hEY0c4TlFtRko5?=
 =?utf-8?B?cUN2clNNRXNLMVVvY21nckNvcXRjbndlbE1PczRSN091aTdJSWs3eU5JeEtO?=
 =?utf-8?B?SjJ6bnIxYUpyWUMxanlTVWdtOFdtOCtNcFRZSWhHNnVtL1hBOXNNWVlxbW5p?=
 =?utf-8?B?aS8yY0l6UEtXU3JGckM3N21Yd2pSMnR6SThXL0dPNXQ2OFVmd09kbWtMWi9P?=
 =?utf-8?B?YVNMeHpQbmdnYjh3aEFXUHhScTF4Nk1jbTd2YzFaeC9HamlTZDY4TkNKMHlK?=
 =?utf-8?B?M1VQNkFRcEJ3RGdPVm5Td0FMZUJ0d2ZKMk1MaVpUUVptUkp0czFLME5aSGFs?=
 =?utf-8?B?ZE9YdW5NK25tVVNLMmFHRmY3Sm0xVWFQSUkxQVRNVjZCdk9tQnpDOWI2KzRi?=
 =?utf-8?B?VFdjT0FlL21yYUFUQWxtNDI0TTBBZ0V3UUpxOFVNQ1ljc3EwMlZFUlVyUmZk?=
 =?utf-8?B?YmpvcFRVc0dtQ3Y0UEZYTXNIT0habGh3S29lRHBWQnBIQ2w1SDltcWNoQXZi?=
 =?utf-8?B?WmdyYnYxSVlZYURLRkgvbGhQZ0p4YTQ0N3Y1WlRVVHYrNU5WWVp6SkJHK21V?=
 =?utf-8?B?b1FwRjI1UkFOWDFxQm9FajFJbmpQM25jUXBEMU9CVVo1YWl0K2pqcFYxejFx?=
 =?utf-8?B?aW5QViswTGsxamNpUFhpMU5iU0VEVzBRQXNIVmVFcER3NkxoWDBWTDUzbmFq?=
 =?utf-8?B?aVJOdEdQcGsxMGF2Z0g2akRVZXVSd0JBUmNTTWFYRkpaLzQ1Z2drbENMQzBS?=
 =?utf-8?B?V1RxNzZPN0FIRGxYUFRYZTRlMzBHY253TEhpcDJVRDh5OGRrNzkvS1dSYzk4?=
 =?utf-8?B?SXI0cDM2bGRvWSswcmFwNFNnNUtqUFJZUVhyWTBYeW9qZXV3ZGtLZ1V6RC96?=
 =?utf-8?B?MXdGV2VsV3IyL0RVS0ZlbjRnMkZqc1ZjS0VwSTQ1VXQ0dStMbXYxMXZxZXV6?=
 =?utf-8?B?SkFYM2crNjJlS1ErMGxjWlRPWWt1U3Q0YlRqY0ZXby9ZR09XZWJuNGdVKzF5?=
 =?utf-8?B?TnA1SWlSaDliOXFrd0xTZmdVTjNtSzdRWXBkcm1TOC9pZ21FNGdBNHR6K3Fk?=
 =?utf-8?B?bHBUVWdPckFsVW1aY1lidUVNU0Y5VUIzYXRraFBiMXI3MnNVcEpFaGlvSmNB?=
 =?utf-8?B?RUREVDk0RFZ5ZFFHYWFwSHJUSFVMa29WWk44SnEzK3JHS0xlUHhUWDMrNE5k?=
 =?utf-8?B?TklJMnJrbDJOMnFtRGdvQlFDZmJ5a3U2R1hWUWVjVGtMbVpsRVBzVmcyUFZM?=
 =?utf-8?B?STgzNVN1cm5mY0JidDNTaTFqdDR1NzNDY2hWaXBjZ0FqUjZjWUFKZks2OXQz?=
 =?utf-8?B?c2krSGNNZHhMcUNvMUNBNURMa2VJanNSS0oxcG5OQXhEcTBxVk1PQmxDZjNo?=
 =?utf-8?B?VjkzWmY1YjE2UldoT0lUQUQ5Zk5lK1BYcW1UUnlhUm9CSWVrZE9Od2dBUEUx?=
 =?utf-8?B?S1NQR3ZnV0s1WDBJSXhoUXZ6eTFUSjZ3MDBzWSsyWXlDWHEyLzEvcnZqYzcz?=
 =?utf-8?B?UGlBWXBrOVQ0VGJuZEIwZFBaZXd2SVFQM0xDYm50enRDS3ZWd3JNeTdMc1JO?=
 =?utf-8?B?ZnplQkZVNmRFZVg2dUJWSlNTSDN3SjBjd1RUR29CQnlkWTh6RnZMWlUrMkgz?=
 =?utf-8?B?MzJhN3NSZGErbXR1TGVhN2wwUWFZeSt2Z2d1bW44aE9yVnE4SC82cStaUG5s?=
 =?utf-8?B?aWVXQUFFNmMwK3hLKzFwTVJNL3ZYNm1GU3pIS09EMnhteUt4ZXlTN3BOb0ZP?=
 =?utf-8?B?ei9NSUxwSE90ODlEVzJOOXFoYTZOZENNSXpvTHJKVkdzWDZ4UEkwam93cGE3?=
 =?utf-8?B?NkdRenlreUVaWTkyazZvV3dCQ2Fid2FSc09wRFpLZmdMWnNRV0orZEY1YmFi?=
 =?utf-8?B?ekFObVVqWkNpMjgvcDdBSWF6MGJsMFp4MkV1S1I1SWFkU2tWcGF5citzdTVs?=
 =?utf-8?B?R0ptbkd4N3BqY3FrMHNjQUgzS0tLM1dYWmpRMnc0YlFlVkpIdXRPeXAySGdq?=
 =?utf-8?Q?fN22ej/h9jOIsgHc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695dfdf3-6c65-4e84-aff0-08df4cdd52ab
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 23:22:36.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrw0t+fxsLdm8Ro9XIGctFCDCd4pv0rlgK8n1IN2KWrScMLzjFP2rIEMoJcHl6OGQCXBSAhkRRI0Il/NWD1PTsxZCDZhfA9rmTipTfl0skc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6450
X-purgate-ID: tlsNG-720697/1795821762-325946C6-3DA85275/0/0
X-purgate-type: clean
X-purgate-size: 4879
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/2026 2:53 pm, Julian Vetter wrote:
> The Xenctrl C stubs build OCaml values by hand, and nothing checks that
> the blocks they allocate match the types declared in xenctrl.mli. A
> mismatch, e.g. a record or variant argument with a different number of
> fields, isn't caught at build time.
>
> So, extend test-ocaml-bindings to also call physinfo() and
> domain_getinfolist(), check the tag and size of each returned block
> against the declared type, check the flag lists, and read every field.
>
> This covers the Arm specific parts too, i.e. arm_physinfo_caps and
> xen_arm_arch_domainconfig, which were tested on arm64 under QEMU.

Urgh yes, we are getting rather backed up.  Sorry, there's just too much
to do.

Lets start by getting tools/tests/* running on the Xilinx ARM board.  We
can start by explicitly excluding the failing tests in the short term,
because that causes the non-failing tests to be blocking in CI.

That should also get this test running on real ARM hardware, and we
won't have to resort to testing under emulation.

>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>  tools/ocaml/tests/bindings/main.ml | 126 ++++++++++++++++++++++++++++-
>  1 file changed, 125 insertions(+), 1 deletion(-)
>
> diff --git a/tools/ocaml/tests/bindings/main.ml b/tools/ocaml/tests/bindings/main.ml
> index 785837e270..02049d2f79 100644
> --- a/tools/ocaml/tests/bindings/main.ml
> +++ b/tools/ocaml/tests/bindings/main.ml
> @@ -2,18 +2,142 @@ open Printf
>  
>  let xch = Xenctrl.interface_open ()
>  
> +let nr_failures = ref 0
> +
> +let fail fmt =
> +  ksprintf (fun s -> incr nr_failures; printf "  Fail: %s\n%!" s) fmt
> +
> +(* Check that [v] is a block with the given tag and number of fields. *)
> +let check_block name v ~tag ~size =
> +  let r = Obj.repr v in
> +  if Obj.is_int r then
> +    fail "%s: immediate value, expected a block" name
> +  else if Obj.tag r <> tag || Obj.size r <> size then
> +    fail "%s: tag %d, size %d, expected tag %d, size %d"
> +      name (Obj.tag r) (Obj.size r) tag size
> +
> +let check_record name v ~size = check_block name v ~tag:0 ~size
> +
> +(* Check that [v] is one of the [nr] constant constructors of a variant. *)
> +let check_enum name v ~nr =
> +  let r = Obj.repr v in
> +  let ok = Obj.is_int r && (Obj.obj r : int) >= 0 && (Obj.obj r : int) < nr in
> +  if not ok then
> +    fail "%s: not one of the %d constructors" name nr;
> +  ok
> +
> +(* XEN_DOMCTL_CONFIG_GIC_* *)
> +let string_of_gic_version = function
> +  | 1 -> "GICv2"
> +  | 2 -> "GICv3"
> +  | v -> fail "unknown gic_version %d" v; "unknown"
> +
> +let string_of_cap_flag = function
> +  | Xenctrl.CAP_HVM -> "hvm"
> +  | Xenctrl.CAP_PV -> "pv"
> +  | Xenctrl.CAP_DirectIO -> "directio"
> +  | Xenctrl.CAP_HAP -> "hap"
> +  | Xenctrl.CAP_Shadow -> "shadow"
> +  | Xenctrl.CAP_IOMMU_HAP_PT_SHARE -> "iommu_hap_pt_share"
> +  | Xenctrl.CAP_Vmtrace -> "vmtrace"
> +  | Xenctrl.CAP_Vpmu -> "vpmu"
> +  | Xenctrl.CAP_Gnttab_v1 -> "gnttab-v1"
> +  | Xenctrl.CAP_Gnttab_v2 -> "gnttab-v2"
> +
>  let test_xenversion () =
>    let ver = Xenctrl.version xch in
> +  check_record "version" ver ~size:3;

Just for my understanding, with these check_*'s now in place, we'll have
to adjust the ~size or ~nr parameters as we extend the C stubs ?

It's a shame, but AIUI it's a well-known limitation of the Ocaml
language that you can't query these types of values dynamically.

Also, forcing people to edit this file is probably a good thing if it
gets them to add tests for other things they're doing.


Either way, could I ask you to split this into 3 patches?

The first extending the test infrastructure (nr_failed, check_* and this
change to test_xenversion), then one adding physinfo, then one adding
dominfo?

In an ideal world, the bugfix for x86 misc flags would be slotted into
the series just ahead of the dominfo patch, but seeing as it's already
been posted in isolation and wants backporting, I'll see about picking
it up directly.

>    printf "Xen version: %d.%d%s\n" ver.major ver.minor ver.extra
>  
> +let test_physinfo () =
> +  printf "Test physinfo\n";
> +
> +  let p = Xenctrl.physinfo xch in
> +  check_record "physinfo" p ~size:11;
> +  printf "  threads_per_core %d, cores_per_socket %d, nr_cpus %d\n"
> +    p.Xenctrl.threads_per_core p.Xenctrl.cores_per_socket p.Xenctrl.nr_cpus;

Why do we need the .Xenctrl infix on these variable accesses?  The type
of p is known.

Given the other repetition of Xenctrl, e.g. in string_of_cap_flag, it
might be better to Open Xenctrl generally (which I guess would remove
these infixes too, although I'm not entirely sure why)

Otherwise, it looks broadly ok.  This is a significant improvement over
the nothing we had before.

~Andrew

