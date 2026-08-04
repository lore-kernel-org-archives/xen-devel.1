Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35B0C55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 12:59:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382142.1625518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrEja-0001B0-Lx; Tue, 04 Aug 2026 12:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382142.1625518; Tue, 04 Aug 2026 12:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrEja-0001Ar-Ht; Tue, 04 Aug 2026 12:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1382142;
 Tue, 04 Aug 2026 12:59:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrEjY-0001AU-Cn
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 12:59:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrEjX-00FGT8-3H
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 14:59:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a71e214-bab6-0a2a0a5309dd-0a2a45059f44-6
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 14:59:02 +0200
Received: from [52.101.43.66]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a71e215-4cb1-0a2a45050019-34652b422d9c-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 14:59:02 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS3PR03MB989170.namprd03.prod.outlook.com (2603:10b6:8:39b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 12:58:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 12:58:58 +0000
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
 b=Cht8kZ5bmVpp+Rqysj++EissTq5dQVrnbp7T9FRAPVdTp9YkLgvsP1W6E7R0cs4/JweBEhZsuMNGKVqyhubFF04ApOHFFVPLDy1eQjf/Hq3GynZKrVmFjDPkLmFrOAPBlRdLV9iPG2GiREctRN4B7ZHOK0snQV4g5IC5uE7BnPWqQcgXlT6iQ4H2pHmMbPeZ6RilreSUcUl9nCh1YK8Zuc6HMloPIQJ0jVNjoBB3H8f8M9B/bNO4uT6/UIzbl9ajfGrxcfqjBDClchFJkHmQMXQfI5AM3HeOAJ4kri1/mzuGa3Qiy03h0D9vMUhmKUzCwYGqI2GwiZqtQwxX5fPSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlZhJWvCveYBdustcfvWoJPNK1wtPBpfURVhKnBVXaw=;
 b=udiL+63e3Ubs7nTOy3WtTIBQdf8lIe7D9LKlMfzwWvRKiF9utrCdX36Je1yF0tcz4V9RxVU/ZCa/IwM/C9JmCqm6tUBcLvmz4JWU4HxkAyoy8izJfUj6JCcoaiy9Lytln60bHHEjDlRRGt8IjAoIYCoIfGF3J93cEWWN2Wz5KrAJ3DUAwkSoc5I8hzqklNyBKFVOTzWOhGRVuLb03ZPz+Nnszeo6O/EGvl+AZ4owJtPx1z+xiYRGyqsNkyU1HNI9BsBdOekk4GwFLDIQYhDBR4lDCx1B4yAaHLEl+2ZqgyrKQKa5Kr4ecNW04TLKiF+TBAeWokOlIEuIODXP7YqurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlZhJWvCveYBdustcfvWoJPNK1wtPBpfURVhKnBVXaw=;
 b=ilhfrZGW0Mjum8m4ZXBNqZoZjc6QdDIKQjRQ6ijPgIYbe1jbKJAz1bQ5Ay75YQUAKKzJfjDez44CLH1huGmffV0tPPxvUp8gz1owO8Epo/aqfUHwtkp7HvZknj9IM8Rv12xQQeGjhYyQx6k1c/X4EIBfGSjL1B0yJZ43O1MMD2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c00db623-82bc-4d7f-924f-25f35f8e057e@citrix.com>
Date: Tue, 4 Aug 2026 13:58:55 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] radix-tree: drop radix_tree_init_maxindex()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25cf9c88-7589-4a5d-994d-45f488a3e00b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <25cf9c88-7589-4a5d-994d-45f488a3e00b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS3PR03MB989170:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd4c0ac-9034-4c97-f87b-08def2282648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4K91DknpsGFmMfiNF/wGPEDlIw7taLyfZ0Jj9R2gkybEkkh6psadKfxla5iqMpy9AUIqtc97ow0sTpQOEmOqBCRlkV8KUDbRycD4FEZuYa/wDoh0X/OL8JC/epfPDyz4FbDDWPyMZ9qmyqo8h3NCF33ix3DhWtw+GBQ9jBl0s2VTkoyjM0i/MmKWiMaPyhu0VzAs8DQvSiMlKCrnols6IfBOG7SOqbXIAT84ctaUuPNAd3Epsos1aHgtxH1xf2dF1FcUhT3HzlxtIRbhRpedoYyXQ1OyntQPgd1x7RRsGFgEV3PRt/Yt0rU/OMaQcxnG44SrIcLTPmhcafEpIlucawGSZJgFVqZRmI5DYAzJT4U8MaCQuFC/wKo/NsnSalcZBNMmMlxpoIF0DvBxskANe6pKDNfUTrT2B3pof0fO2QZnUL+k4J2W28hT4kuS3wL++ahsT3mcniIn+89SbgYI/EN9pmtWuIiEizpPpgLNQNjexH1G3k115wCk9RsOUwFZ5E76QxmyVfcd0aK9Zi9GrO4nm3bhLshDyAOBCECDvoIAg10Sj2K7wh07dA5wE1zjgBpy0g3yeN7eKEnPwBxDj7Lh+ffakpGAn5W4i48q1FEFKbXcNSOPKG9ffV843EmPK2ylhWUhfgDdGlPdzD30KwfVAzqRB7RllDSxx1c/AqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGQ5dm5lUzdXOWJnT2RONzV0MFRwRXlmQytrb3NtY3dXU3pwd2VCcjNMYTVn?=
 =?utf-8?B?UFpVa0tGU09ZUGwxYndYNjBieXZWeXlad1hQdEdONGtiVVF1N0RnTXVwVTRs?=
 =?utf-8?B?akVjbjhLSkhiNlBzRG9CV3lkNFZUdmpWTE5FYVdXSmZLdFpUVitYL0lHMGNt?=
 =?utf-8?B?Y05qS0xoNUpjaldEb3dWbEQ3OGhiMzNDYks0YWtVMngyS2M3SG1kdXhyRmVh?=
 =?utf-8?B?dDZKSDVTYlJCOWFkTmlaT0syTXBIMHZJL1dzb0N6STR1RFVveS8vQnczZWFM?=
 =?utf-8?B?SHNQMmpiT2RyRXN0cFhmODMrSlh1VzJEM2FUVjRET01OaGt1UnF2aSswbzM0?=
 =?utf-8?B?WU9WS3d3YmNLbDF1ekVGYWExWCtXa1lmdDE3Z1l4d0ZDYUl3L0hvQjhQaUNr?=
 =?utf-8?B?ZGhGejRZTDFBaDZ5QzJ0d016QkpsWEhTSmFvVFVRT1JPSzU4WlFjbGt5amMw?=
 =?utf-8?B?aU4xWCttSkJKZ01OcjZiV3drWkhBM3hsMFJxVmdRVVJkdEpQUjJUeXFOS2h4?=
 =?utf-8?B?bStoVCtTcEF5YUxDWXJ5djdGY0poRlorT0J5d0d2Ui9oTlQyc1dDMmlibmkz?=
 =?utf-8?B?ZTVRMFA5b2VVRC9BZTJTMWlvMTAyMHhVb0g3b2p1WXRVZzZvL1hRdWtqaysw?=
 =?utf-8?B?N0F4S1p2RHhZbUdmUlZVVm1tOEN3TnN5akMweUU3bTF3cjJUcW1LSmljbmho?=
 =?utf-8?B?bjlCaXdocE8xeWlPR3hlOGxpdlFWeldzSzBZZEVLR2FLdGJJQ2VQb3FvVWE1?=
 =?utf-8?B?b3B2OVlsVVJOTnZ0MGQvYWtBaDUrRVllbkNDS2hVY1JjVVpLTmVrN1YySCtw?=
 =?utf-8?B?cXFGSlI2QnFXMGJxNE9QS2xVTDNLTHQvWGd1WjlDL2JUS2Z4RGdRbUJRL2c2?=
 =?utf-8?B?OWdBU0V4N0ZmT09XMlZLeTJzNmI1ZnBhVXo5M3p2SE1tb29DSVR2R2JFRUZw?=
 =?utf-8?B?WmJvaC9laE95aHc0cE8vdkpqcG1jOUx2anFySDk1MTVaNVNLak5vTUhrZ2VL?=
 =?utf-8?B?OVQ3c3hXdk1DRGRBcWZyK1pSbzRzQjV3b3R6QTlEYkFXVlROeTZFRE9JUE15?=
 =?utf-8?B?S3hOUFd2bk44VmRQNTNKQmVlNTZhcm9KQktycEMxdzdWWGd6RG5WU21xMnpL?=
 =?utf-8?B?eU5xZDFpVmZ1M0t5bU50YWRVQTZmY0JIcGc2TE9Uaml4QjVWVExDM1daUE81?=
 =?utf-8?B?MEFMc016NURReGFwWTljN1NLcitDcFJtcHo5Mnh2RStxVnV5aVpLNW5QOXNn?=
 =?utf-8?B?bjdSVmIrZkpCdkhJUHVGQUtPK0E2ejRBSnpVL0Q5SUVMYzN6cW81aG9oR3NL?=
 =?utf-8?B?b0FseVhGTFVuSERWamNMdWx6eVRPWW0zbG1KYXplVEorVHEwUGpCUmJ6N1NJ?=
 =?utf-8?B?QmdzQld1U1NoRHNUa0VRSjlzcWVzMjlET01nc2lkcXArTk9aR3M0Ynowb0FP?=
 =?utf-8?B?dDlzcTJLU3pQdHVraG82bXpGeEtuTVBFNXZFU3V6MGNFNmVCTmZzYnVZOU8y?=
 =?utf-8?B?RXlzUDRSOE9JK1F5aW1STkRsc0lEem43T1p1L3JnMTBDdkp0bEhsUVBSMmFW?=
 =?utf-8?B?akFtSjAzM2l5Yk4xV0FTeWlmNXk5aHJuWTJyaEZJL3FiazZJT2kwZEI2ZTRt?=
 =?utf-8?B?NWxqUTJLTkJXdCthMEwweGRRYmlNVjJ3YVIvY3RsbHAvYTdtNHVrTTBkWFUy?=
 =?utf-8?B?YzNrenQ0WmVST1B0c20vcExicEtJYmt2QmZDZ1RJUVZBZUwzNnFxbHpuSEdP?=
 =?utf-8?B?dU9tc3I0dUpReHZZeU0zSWJnblBnNkFCbU1JOFZLdDJUMGw5U3VsYWtlYWsy?=
 =?utf-8?B?TW9iQ1pONDJYelExQk43N1NtOTdnTXNISXlUeHhsV0dDa3c0VUJuRHZ6ZFdM?=
 =?utf-8?B?Y1dCVm5La1dIZmtPcnBXdjJoMGE5U1dIQXdVYUc2WEltS0VJcVJoeStwNjFj?=
 =?utf-8?B?SnBLcm5VRCtrNE1EdDhLWGV1Z3d3YzAyZFJ6eDQrbWZQYUJUd010dWFwMFpO?=
 =?utf-8?B?WjNScDZFTWUrQ2tUa3hzWXlKUDlvK2xPYjkyNTZiZ1lPOVpFTFdXRGwyOWwz?=
 =?utf-8?B?QUZiSUtVbTROUi9pekY0MUt3L0tBTFcrWDNMWllHUUU3ZElQb3JUaXVQY0JD?=
 =?utf-8?B?Wm53MU5XODdjRlJDMnNGR3BXQXBDMHRLYXYydjZSYVNWVVVUVytzdGcyejVQ?=
 =?utf-8?B?Wmk0cGh5YkJaU0o5K0JmdFNUTHUzUXd6enlUb01ocVp5T3JhSzAzSkYzV3Fv?=
 =?utf-8?B?eFF4Nk9zNEE0QnJwT1RuMGRsbzFCZHVzeEVqQzd3eE1DTXF6RXFMRXdqSk5Z?=
 =?utf-8?B?M0haN3NWSkFjclBhZ1lXZi9iOTE4L2ZSQ1FndVkwd2RKazY2T3NGMUtGdXhQ?=
 =?utf-8?Q?wsVzOesj6cSlTu2g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd4c0ac-9034-4c97-f87b-08def2282648
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:58:58.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOi4JPLFHhqtp1O8gmwwcw1scPGQzz5EinEF3rb6E2xRvmevhcBM0AOL5MYM/YecbYLR2/8yhugKt1VTxQjUB1dfxB/hug0wir//AUXzztY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989170
X-purgate-ID: tlsNG-c201ff/1785848342-F66B52A1-4DD798D3/0/0
X-purgate-type: clean
X-purgate-size: 3046

On 04/08/2026 1:30 pm, Jan Beulich wrote:
> Radix trees are in principle usable as soon as memory allocation works.
> (Radix trees with only index 0 populated are usable even earlier.) If only
> there wasn't height_to_maxindex[], which is filled only by a pre-SMP
> initcall. The benefit of this array is rather limited - the calculations
> done by __maxindex() can as well be done by radix_tree_maxindex(); the
> overhead isn't all this high.

It's quite possibly lower overhead.  Some simple integer arithmetic vs a
memory read.

I think it's worth noting that this was found by UBSAN on a
multi-segment system:

(XEN) UBSAN: Undefined behaviour in common/radix-tree.c:83:27
(XEN) index 12 is out of range for type 'long unsigned int [12]'
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040323f9c>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd5
(XEN)    [<ffff82d040324d91>] F __ubsan_handle_out_of_bounds+0x9d/0xd4
(XEN)    [<ffff82d04029265a>] F radix_tree_insert+0x24d/0x570
(XEN)    [<ffff82d04037ac3e>] F drivers/passthrough/pci.c#alloc_pseg+0xc4/0x165
(XEN)    [<ffff82d040a3b526>] F pci_add_segment+0xc/0x1b
(XEN)    [<ffff82d040a5ad1b>] F acpi_parse_mcfg+0x29b/0x344
(XEN)    [<ffff82d040a3f612>] F acpi_table_parse+0x5d/0x92
(XEN)    [<ffff82d040a5bf55>] F acpi_mmcfg_init+0x3a2/0x71d
(XEN)    [<ffff82d040a71ba6>] F pci_setup+0x17/0x29
(XEN)    [<ffff82d040a784d0>] F __start_xen+0x394c/0x4ed8
(XEN)    [<ffff82d040423057>] F __high_start+0xb7/0xb8



>
> Fixes: 21844b0e32e7 ("PCI multi-seg: introduce notion of PCI segments")
> Fixes: 8dc6738dbb3c ("Update radix-tree.[ch] from upstream Linux to gain RCU awareness")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

All the UBSAN violations are gone.

> ---
> Two Fixes: tags because the use of a pre-SMP initcall was clearly setting
> up a trap for later code to fall into.
>
> I know for certain that I've seen logs of Xen running on multi-segment
> systems. I can't quite explain how that ended up working.

At a guess, we limp along with only segment 0 until dom0 reports the
other segments.

This particular system is set up for GPU testing and the GPU is in
segment 1, so something was working well enough for that to function.


FWIW, there are still issues on this box, even after the fix:

(XEN) setup 0000:fe:00.0 for d0 failed (-19)
(XEN) setup 0000:fe:00.1 for d0 failed (-19)
...
(XEN) setup 0000:ff:19.0 for d0 failed (-19)
(XEN) setup 0000:ff:1a.0 for d0 failed (-19)
(XEN) setup 0001:fe:00.0 for d0 failed (-19)
(XEN) setup 0001:fe:00.1 for d0 failed (-19)
...
(XEN) setup 0001:ff:19.0 for d0 failed (-19)
(XEN) setup 0001:ff:1a.0 for d0 failed (-19)

These are the PCI devices for aspects of the uncore, mostly performance
counters it seems.  Despite the lack of information, I think the
complaint is about setting up the IOMMU context for them.

~Andrew

