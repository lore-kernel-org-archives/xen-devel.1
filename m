Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A98606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=FCY5UGp9
Received: from list by lists.xenproject.org with outflank-mailman.1496211.1694872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0ks-00084F-5s; Thu, 19 Nov 2026 11:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496211.1694872; Thu, 19 Nov 2026 11:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0ks-000848-33; Thu, 19 Nov 2026 11:56:42 +0000
Received: by outflank-mailman (input) for mailman id 1496211;
 Thu, 19 Nov 2026 11:56:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xU0kr-000840-6c
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:56:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0kq-005gXh-JB
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:56:40 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afee3f0-8faa-0a2a0a5109dd-0a2a4509ac3a-28
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:56:40 +0100
Received: from [40.93.198.69]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afee3f6-be1a-0a2a45090019-285dc6453118-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:56:40 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MN2PR03MB4943.namprd03.prod.outlook.com (2603:10b6:208:1ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 11:56:37 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.016; Thu, 19 Nov 2026
 11:56:37 +0000
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
 b=BuyKh6m2I6x1ezM29iUbr9biAkGunjQN7F8M6t0dJ3tBaEix9wr1Tt6CHXov8pllauhMpnm2G22Mp8kCNYoe/q7OCDBSdMEoX3R3H9EyhsMPeynbFuIRUt4/eSBw4AZkA1MPDaTrUKdSGAo+npwBPg1034OwE3Da3Hauoo9z/MspV1d0VUD7Q5mrFcFfMY5fRX/cGTeMsiHmEyW96hSWp8XzN4a8u2cOnTQfnvuvUtAdXPoyaavHek+oOoa0BFXtNaBq523NJWYdvf3m63dIzaBPYmSuUh3gSNdvesA2FUN22xoq58rlVFYJB4OepIGQzgAyUa7+0GrQLBjUkSL9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPV/vmw3CQtGfvJd9yPbqGHOkLK46fhGFNYGElTInx0=;
 b=NMp3OYcb8OPTWSfTfmyuOFMYd86Ei/+0eZA8x1bPb8dvizXyVJPGwCSmA1R5jyQOMVrZrnPYWRM4FZwZUmlDDI3sn8u6TUpMxQ0TMYG6kXvPx4gAmWHWOlgv3O6g5mygni7u947YNLL/H9ClTykz6+p9V78viOyp6OBW9nGMe0CBuMtTSs5gLmChzynDjIVmWriJuJvDV5PoiIJQD05r3cg8Volf9cGo4LUca7OR8v6YpXt7ZpAvQAzFXMKRODjRLd7Lh7kmfhwt02VG3JpYJ0YZrddeovEi/jE+MxkVWGU0GVofW8Rz5Zec06UX7Q8vjkwYEuo2ZqRMN3WqIbluig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPV/vmw3CQtGfvJd9yPbqGHOkLK46fhGFNYGElTInx0=;
 b=FCY5UGp9tQv+VUVD0B8SG7RapL+TVZkExZX4GXpNNFVFCE4Xb/dr4kBBl9JBJAYnBUjk/dE3dFr1PrP2ZM49OxVZ15H34RQOLpuRMzg2/n+EDN4j4jKkbWjSfoZkTeav4hssMRSieYCnl8h17Exg8cGnIuZFKgEQ0wHqPdvwO2U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <daca5eee-791b-4829-a173-70e32829c0a7@citrix.com>
Date: Thu, 19 Nov 2026 11:56:33 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] x86/nestedsvm: honour L2's EFLAGS.IF when L1
 clears V_INTR_MASKING
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <cover.1794482561.git.chunjie.zhu@citrix.com>
 <7d4acc24cb634dd8170c3de792c98549bc8b624f.1794482561.git.chunjie.zhu@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <7d4acc24cb634dd8170c3de792c98549bc8b624f.1794482561.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0642.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::11) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MN2PR03MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3bff4c-1d23-4fd5-ca77-08df46342a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jAiPxuywd7ZwjHzjRbXHeOxBBfHJ5YuWuU9KDwGzLMau/cXsnCdRrSdsDVbv2DenzyoeGVnqlWV9vdVreFTHavwXZed2BlDAmm2Ow1qeX3ZtgBvIiqC7FNfeZbriXgX/Y5t9Y2B8TpX0DGyyXbC483XKjFq1XT7gmBGtmFYd8gQyTyzh7qLo4vnU+RXs2h5Uvy2+Nxb9KQvoPGDn3rWSB5+qW7oG9vzbjmSqPYqPEVmEN4d7fbxtk04CYaF4lnfGEXFID4CXUYUMC3HhEAOx32cyCWoRb9u/J7jybMjSM7VwhMHfOc/TnxKt4BIpZr3cC9LbnmXSaBMxLan9XlE0g1H6ljGUKpG/J1wCOvsU9nPXSu/XuD6JebdxGhRljxbAnS/Kft6r4zZxflwjuitbHZGCwOqBpfWqzAJFxWa6ShVBWjQLUhJD5+5cl1JKIIdgFxP3+GCUa24H1W4cXsE+Xzs3cnL4qkkTC5EQu0HzJnyAww5oB7q7RYzN1W9MrSmLuqNsDoNWGJgLwfATX7TvDXGuHN5ZEZRSlkeQJIrgG5UsfmbUFNqOoNaXQUzV0u+g8uzWSPxo3grxfgELno7bfxPegk0ribYp41J3Rm3KpjBS2/lNngWcWvrdlHf9nHbbFOKyAnqj//yqbywH9mJ23kfMm2WJC5ArCWDueUO1q3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzdsZE9CdVZOV0JZV0xhZlozSjY2Uk5VOTJncGErUitVN3hkMENXbGx0aVlx?=
 =?utf-8?B?OWpsYkw3aUVGaTRPOTJZZmphbmxlcjlTUUhrYlNCZnVFcEV1UldVWGpoMkIv?=
 =?utf-8?B?WW1EemNCWGlxRjVOWmkrTUxqWkFxblBxWUkxamlJTHlvSnFUbUdiVks3UW5u?=
 =?utf-8?B?bUtpNFkvU1lMWW8xdWhpOW9jZEJNNVFVMzRuWFkxSnJ3WHRkQUFkbzEzSlJa?=
 =?utf-8?B?TkNIZ3hrVmw2RFZhQk1yMEJYbkZuV3JrQVZNdU41MmVrMitZL2NadWsvMFZL?=
 =?utf-8?B?anhSZEdHSDYwQmJPRm56OFhsK2pCUFdHOG1NS1ovL2VPZEczbVFCUG12MTVX?=
 =?utf-8?B?bG1iZldjcit5YnJiR3hDTktVSFpHaE9zekpVamRJV0pCYzg4SkV1VHlUSnhC?=
 =?utf-8?B?WEZmMUpObHlLZzFHYStoZXU2TUQ0SWlzOEpPdEJxZy85MVJJT2J2T1JXUEpk?=
 =?utf-8?B?TTdtSjNrdFhSTmliQTVNNXJGQTNBOE9lVnl4SHNEN1BFOUZYWVJjcnhZa3Zp?=
 =?utf-8?B?azNCRk9VYVFkWXBpdzZEV3hVajRyZUJhbXAvTUkrTi8xVnMrblJrT1Z0V3Bt?=
 =?utf-8?B?V0h5N2M2cGJYYjVYbXVNWGpYRGg1SG9YKzdMdHhHaEpVU0w5czgxS1E0S3Zv?=
 =?utf-8?B?WnIxc0JjWXB5TzZDSlFRekkxQS9jdUZxT1hqbm5tdGlBRG5LNjk3LzZhdUhE?=
 =?utf-8?B?T2pjQWRibEY4UUxPMytycXJhb0V3MmI5L0F0dUlCY0Jtd3VhdFpYNXcyVU92?=
 =?utf-8?B?cklhTWU5QSt5MGxCNW9NTFJkcjlLdkFDbTJScmx0VjdrYTZiUUJGeWRLd0FM?=
 =?utf-8?B?R1FoY0l6b2cxVnU4OFNDOW5OYjY2RzdQUFpabzhsaFo3cmdVUWpMNVJwckZK?=
 =?utf-8?B?TWZ2L0lTNE1kNDY5TEtqeXMxQVNhR0Jac2RFeU1neWloOXdCUlNwY01BZ1Uy?=
 =?utf-8?B?cjBCK2w3c3BrRlV3alpadVl1UEI3WXhUb0xnejB4N1IwRGJ3MHpVVWNOWnZ0?=
 =?utf-8?B?b3NwcVlTdGJJWHVyU29MVWpMbk1Kc3VBZW5RTGR3S1F5NDJMOHpnQld1T2o5?=
 =?utf-8?B?U3FPSmh4SldYcDMxY09CZWVWeGJ0aTJmV3lCK0llMVBJbWlrdEZwY0JuNGNh?=
 =?utf-8?B?d1k5bXBYTzhVUnZpMWpqeWdUMW1DbzRtSE1QZW01UmpGcDZKQzZmb0Eya1FJ?=
 =?utf-8?B?UHNTUTFOZm1mUEkwS0JwWmVwWTNhQjdtc0Nyd2NFd3N5YmhweUZPK0hNcnJC?=
 =?utf-8?B?SWs5bFlJS1MzOUNPenJJNVdWOFNKN2lYcXppeit0OVFSOTRzaDlmL041Vk9X?=
 =?utf-8?B?M2FqV3dHOXo4dlFVWWxCWjZzNm5YYlpSaUUxSVBzTDBpNk9SMHE0SUY5RDA5?=
 =?utf-8?B?cDZaVEhYbWtvNVM5d3A4dFFZMTFSL05iZ3p3eHJjSGwrVWxvTVAxLzZKU2h5?=
 =?utf-8?B?dE1CWmdzdnV5SXZDQ3NmODFaTnVsZWdZc2FQTlVid0NuWld3N3Zkb2ZzQkpx?=
 =?utf-8?B?eGdoRVJIdk9ITUN6RUlGYXVaZkUydGZqQk5xeit0QzNncE5lbHlXZUxlMEhD?=
 =?utf-8?B?dGltN0orNVZVWmE1NTdVeGtRbW14WmFJY3AzWks4ZUdmVGoyc1VMRWJZRjYx?=
 =?utf-8?B?elVTNllHUVhrcE1MSlQ0YW5wb2FQK1VJZW95SE9XcE5nb013ZVlsTXI0eDI1?=
 =?utf-8?B?Zzh6MmtNNGFEZDZpd3N4NjhSUkMwa0FBOXVQTVlFVUFKNnBuK0twUE95UGxF?=
 =?utf-8?B?UWNSZ0RLRlltRlVXcVN5aW40T050MlpmdDd5a1Bma0lNZHRBTXRrbDJjWkYw?=
 =?utf-8?B?WFJ6ckJCYncrWmVLSmtkUEludEdweXNhYk42ZXFxVEk5RWd5VWNEd0dURWk1?=
 =?utf-8?B?clBrVVNIdHpNLy9wNElWZDZ2Yk5LZzBpbjF4NzlPVGJuWVZLQnJNQTQrcnp0?=
 =?utf-8?B?RjNNK0NNZmRZRzBtOGhOdVR3OEo4MVpFMG5QUDRQL3VKSW9Jd29FNFRTWE1w?=
 =?utf-8?B?RUY1VzZvdHM5MnZ2ZStmU1RGcVhuOUlPRS9rYUhPNDlDMHkzcE5haUdlbHZF?=
 =?utf-8?B?MUZza2IwTVhUbnVyNXRxbkRKdHk2bjlFMHFYdis1aTVrUWZzREN5cTMraGlj?=
 =?utf-8?B?VGZFOHlCd3IrdHFZdDZhUE5nUE5nYjd5Q0l5S3U4OFVIQXhlOVFDMXR4K01w?=
 =?utf-8?B?Z0REWm5KYzJqTGpLRnY4VkNzZHpDOTFMZ0pqSjRIOVhWamN6b3ZWekV3MkU2?=
 =?utf-8?B?MnRITXJNTkVBMWk3YVAwNU9QaUk1ZytHUXM3OGNYT254Tk43Y0h4UDljYU51?=
 =?utf-8?B?SU9XSGo2L2xvU0gydUxuT01ZUzZ1WFVHUVhyS21nak9iNkMrbnMyNmNzUXdU?=
 =?utf-8?Q?yWl4HVMBEtYvL48k=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3bff4c-1d23-4fd5-ca77-08df46342a7f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:56:37.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDzkoY6HI6i3/ify6rl802kZogM9eIteKIMHniAniWDpNFxw4S0VOJ6OF4idq8roPu41wvFM/sFEtl9MFW/1/HVX9tCDLKJv0Scl1YUW7l0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4943
X-purgate-ID: tlsNG-bad1c0/1795089400-BD6C2034-1D172612/0/0
X-purgate-type: clean
X-purgate-size: 901
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 11:35 AM, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> L0 always runs L2 with V_INTR_MASKING set, so a physical interrupt exits to
> L0 regardless of L2's EFLAGS.IF.  nsvm_intr_blocked() only blocks when L1
> requested V_INTR_MASKING=1 and L1's IF was clear.  With V_INTR_MASKING=0
> and L2's IF clear, nestedsvm_vcpu_interrupt() would still inject
> VMEXIT(INTR) into L1.
> 
> Per the APM (vol.2 rev 3.44 "Physical Interrupt Masking in EFLAGS"), with
> V_INTR_MASKING=0 L2's IF masks physical interrupts, and a masked interrupt
> must stay pending.  Return NSVM_INTR_MASKED for external interrupts in
> that case.
> 
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>

I think this should be:

Fixes: 3a1ef3c33fa7 ("Implement SVM specific interrupt handling")

With that,
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

