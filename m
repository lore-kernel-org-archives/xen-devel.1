Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E595606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=RvXUM6aO
Received: from list by lists.xenproject.org with outflank-mailman.1454611.1668165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIqcM-0000BH-Kd; Mon, 19 Oct 2026 16:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454611.1668165; Mon, 19 Oct 2026 16:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIqcM-0000B9-Hn; Mon, 19 Oct 2026 16:53:46 +0000
Received: by outflank-mailman (input) for mailman id 1454611;
 Mon, 19 Oct 2026 16:53:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xIqcL-0000B1-C5
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 16:53:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIqcF-00F2rc-Hm
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 18:53:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad64b12-e002-0a2a0a5209dd-0a2a4506cf02-2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:53:39 +0200
Received: from [40.107.200.22]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad64b11-195a-0a2a45060019-286bc8166f4f-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:53:39 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LY0PR03MB693564.namprd03.prod.outlook.com (2603:10b6:404:219::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 16:53:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 16:53:36 +0000
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
 b=TnwmLCMTRdPuYhKvAtDfIHVa7oqKnEOyq7yD11x7vTyuITR8Ne/uVnxSFWkDaKpF0SduceKH96fUGSvLvpQUzFfFdtyYLcFddW0YxXq7YUDs5Nva/+UC+MH4zh92N+36tQup7b5qs1+georBWvWwUtf9FE6OCJhOvv5tLoxerRKO9HJZrfjyzsYYtecLXg6uC3ltAJQR+d5g6zs4EHzNoZEfYpOzMSEfpNX/t+yWOTBtm7xjgNKRIbD9AVfHdZU+rWYGh9Ja8Mx9pA8kdbRtF3dy/BYklURffCkNsNWHmsQMaIqI+WZT2Aw0FUJSwUPO+wistrF2uzKM7eJCvw2EpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChK35QdNKF7oaPjQQCXoMlySTZSqxGkqsiuce17Qams=;
 b=UPeLzV2nR4L/EfDqZrDxrDSs/5biyFBo2zWr1xTRgsF0YPjmto0sgaRqyWB39XqyybBNinjTq4Of13S4VTu7CuBzqAYx0HznC8+QCAD5+C75bUKIsYktBgndBZ4DoMIASUAhUPNdfsvb8UOhkL7qO4mVhG7TVmTy3JLvwHOvBdrb2Cf2cDH7wj5sxv1RyaUThCVmA3+LDtrKAJPZQlTw0/FUQcPBuaalIW6IZufqOsAre8FKfevOyDsTdbB0SWVFH+iI3d+PmDX/DFyTBDNo90DUVIVXYIhRJd+WKbGLOWdpe1eXrx1GZq/LzASIkNPcLAOioj9up8yV16bmyJfNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChK35QdNKF7oaPjQQCXoMlySTZSqxGkqsiuce17Qams=;
 b=RvXUM6aOBvKW6Id6WU/bMAvUQJRx9ocnhqVbyONWkoRYe6v4GO4nIvZC4tdXIkw9qIGYfwCuxRHFt4Slelyh4+AHE2bZF8GA0R1N6X08+BzFaeX9O9vpLy8rrJEfNTdYixtaP+Oo36unndjdqgXDZu7s7nJ40eNm/2N/RxYHWMU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <527158f3-a82d-4146-9a19-8bb257c6ceeb@citrix.com>
Date: Mon, 19 Oct 2026 17:53:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/shstk: Fix possible crash while enabling Shadow
 Stacks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20261019155959.883789-1-andrew.cooper3@citrix.com>
 <atZKuvxTbsEIKnCH@Mac.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <atZKuvxTbsEIKnCH@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LY0PR03MB693564:EE_
X-MS-Office365-Filtering-Correlation-Id: fcfc7e59-f314-431f-37f9-08df2e018472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jXQpgBCjoG9z7e7MVE+UZV9UXoUtWUqKLMrzcgrqbO0+0rCXB908QrT6YyrXR/RgGJ9m3hg9KSISFOp+DyB2R0kYJ8H3nCyjACfBhAHWuAAKVeYVUJ4nPvdqumIIA7bdCcuZgSC9oWjtPXkNekHkdM52cS+eeoSXzbZRB98CtlcOeA5OF+AK76dY+MbxsB0eCT32D+9g4v4RcBalzNxZ/V24ndU3VLonIgEMUmmWnF0y7VhdzNa4g1oiHuj//OMRhFg5VQOZ/v2cS7yVJLaYI3aw1F+UyP0DjMYvdu0Vn3D+kThADuApJCCJx61hZMP4cjC9GL0CBZ+tmGY5/sDz0tbIAHiOcbVuF7Uuxl1I90404EhZ1jEJgPDgtQP7ddcJKxmMrNIz+zl9sPtGuTC6EuH733pMYYMtTe66fsf62RvR0Nl/uET5lZ74QBAZzbNQOvUONKeU05+h1IPuwQ/BelyONJeIOiWhrN3PU0U5HYWdAf+4GTPs9sLdP6wB8HCeEuxaE9JoeKlX1Kh4Jnd+FzWoMbYqTdvZjTipZD6b7S+K7b9BCS4rPBx0Tk7xCRw+PABnRLdHspir2QYnlkc4fSfKMuzmDb6gHtjAEfqInklQGv4dm8e9X5uBL4FhzdZmdRp+9xwrmEo1mct2EdBnVBkD3k1rrcwqwRKsWwPZRZ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0w5V2pPd0lJVWdSVDgyZWZkaklPV3BOcld3czRaU0JtTVV4TFBuemhmbFBD?=
 =?utf-8?B?Qm1GdVdhNkxJUGFCSnNVS09abFgyNFl1bkdpRktiVW9rMjI0V2t1U0lOTmE5?=
 =?utf-8?B?ZWlSNFI2RjcveG50RUtMVjUxUHVJV0RKSVdDK200NXlXUjFPYng0U0FKVjFz?=
 =?utf-8?B?N2V2MlVHNlZqdnBSUmcrcHdFd1NlQVR1a28xQUhjVFZ0ektRQjc0amhsT0NV?=
 =?utf-8?B?Q2hGa2IrMkR5QTJHa2VWNnhzQzg4U2hRb1VKdVZlUk0xTEZ0cGVoaXJrMWo0?=
 =?utf-8?B?SGRKcVYzck5HQmlNYS9vME8zd2JaRkhNMnN2bzVZQlBoRnJLbDhVQ0tmSGJa?=
 =?utf-8?B?V2lJSEZ4US83L2ZUMGxnaVp2NUZTdm9Hb0dmM3ZnZHpScmVLTHZ1aHEyTFFt?=
 =?utf-8?B?dXRoVjZlTjlmMm5MejduQ2FWUlhDM2Vpa0JnQnZ5bmZEMW1wbDhwSXJOajRR?=
 =?utf-8?B?SjdYd0o0L21kYVh3eE9HZnZmcktKeUZzc1BYWkkvRnpDaHlvSXVYcEg4b1k0?=
 =?utf-8?B?akduYTYwcUlxSGh5NjdTV3hMSHc1ZkJGUXNUWGk3cTU0YXhCR3BLK1ZwNE0x?=
 =?utf-8?B?RGlsdzlvaDkxWE5PV0k2UXpTYmJKRWIwOTVoNVVFOFA4WnpaUzNIYUc1Q1ds?=
 =?utf-8?B?UFk1aU5NZExoRGN4cDkyV2ZTd0VYdktERXZwV1l5MVpRdHFrc25RZFF2am11?=
 =?utf-8?B?d3puRDFFL0RUKzFRSmgvbSt5Mi9TSk0xd0RpbDFwNGtZMHdrZWYwemVKVDJB?=
 =?utf-8?B?NTZ0T0p5VE5GSWt4OVdTNXFWL1JhR2lERWNocURuTUoyYW9IMXIyREdWT1pV?=
 =?utf-8?B?Vk03V0w0RnFxTW5ZcGN2NXA4bkNxQ292amZJWFNlSkhod2xaTEcwaTI1NEFk?=
 =?utf-8?B?cDVTOFh4QkJybWp1WnU3YXNHZkZyTGNVdngvRGx2NHRUR1I1TStwcXhaaFVP?=
 =?utf-8?B?bUNIWEpKbWtjRjAra1JWMDJQeXIyeXg4UUxueXg4UGRyaUNIUE5ZM2ZKZGdN?=
 =?utf-8?B?dFBSRVkrTzVzNzNiSll2ei8vV0J4UTNRNUJmTHVZWElweHJJOVk4TGU2eGVE?=
 =?utf-8?B?dXJORUZ2cDVTeTU5RSsxNWNuQm5KS1k2NWpoYU41VjlteFp5aldpWnRYZmhv?=
 =?utf-8?B?V09NQlNHZC9NTVdjbjdRdy9sNUpBY2FoQXptdjdVWStRb1ZiWHozUUEyNTNw?=
 =?utf-8?B?eHlIUlh0QitoWThaVFozTVUwVUpPTlA3NzBWWTU0bVEzbVI1cjRRZzROc1Mw?=
 =?utf-8?B?MlRSTTlGUlhNZkNHbVllTzJtY0VDdDNvdU1PbzVITDVkak1IVTNpMVdCSkFQ?=
 =?utf-8?B?Z0gxRktxK0hQSDkwcnkzS2hVV08veEEwZG5ZU3p6dk9GcWNKYmphTGxVWjBR?=
 =?utf-8?B?Y2NEckJJOC9udVlic09LNlhPS0FheFFVSzV4MDdFL3krSTd2c3dOL2lsUWhR?=
 =?utf-8?B?VzdmNVJySUtxM3JUZzI2eXZ5Zkd0dTdQTkp1dWRoOGhITFExakc5K3huVWxw?=
 =?utf-8?B?b2t4Z2JwZnVzaThhK2U5a2N3TXFCY0VkemJ2WjkwQ05RbkZ4Y2VSaFA4MVBP?=
 =?utf-8?B?dGRNYmNLSnplT3c4dWt4Qzdab0FDczFER0hLVzduMjZBSlFtQU9CK0VkMDJS?=
 =?utf-8?B?Z2EyVktkbEliTTJNWDlYbGxnVFArNERDbUtWaTAxc09VQWNUbjhudU01RnJQ?=
 =?utf-8?B?MzV1R082dG1Fa1I2alE2bitvVFBEWGN4dHFzdFRjaWdXYWxQT3FUb0JVUG5q?=
 =?utf-8?B?QmFWNjdPWGpqY0RSRHZXcFlIQ2xvc0NhNDU5NGxPbFZ0akluY1owS1JVeHQy?=
 =?utf-8?B?WkN3S2xFT3FyY0lPYkRraS8rUXRFc1VyZjV6WDJ2V1ZSR3dTbmd2NVVvR0pm?=
 =?utf-8?B?Vyt0VWxZUm4xUk1nYm9nOVEzaUlsQmttNU9Pd0lxbzNsejNORlBiM2Nsbk9j?=
 =?utf-8?B?ZENuS0xtOVNpdWtaVWNJR0N2QUZKTVRuZlhBR21YckZjcjRZeFY1T205UFVP?=
 =?utf-8?B?eEJKa1RwL1ZUbDdQOWVCN29KZDRvUFJndkxEcjdUbWRMMzRYTjgwNEgrQXZn?=
 =?utf-8?B?Ulc5dHNCN2U1WkcwZ25qWlFmVElhVTdjYzZIUjhEaUxya1dLUGFLQXl0djhj?=
 =?utf-8?B?Y3RocTU4elFIc2R5VmdUVUlabUZSOHFaRVhuWkpOTDJRU2FFTC8yaTh4SUVH?=
 =?utf-8?B?aHFHVjRyYjRYYnh4ekhaWVZQUGtqWXE2UmlOK3pGc3FzbVp2S0lmTFZCbENX?=
 =?utf-8?B?MFpmdUpyeWhubWZ3L0tVM1RYUURxNW1tSXJTZ0RRT0s0Mmt3bzIwOFFEK3Qw?=
 =?utf-8?B?aFEvcFd2SG5qc1NORU9rQnJkSlkvTUNQblhGQzQ2NXE0OGxiRGhVUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfc7e59-f314-431f-37f9-08df2e018472
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:53:36.3644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tT0miBDAKpOp0svZjeoIFBitorPh6w2vzyPBqGPAtDlHkttG2oIzI/NLTuXf3YN9id62j+3qcwbV2od/uszQ/k1VQJh7jsP9g2Fa0tk+QD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR03MB693564
X-purgate-ID: tlsNG-16d1c6/1792428819-F627077B-6D9EC7A6/0/0
X-purgate-type: clean
X-purgate-size: 815
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/10/2026 5:52 pm, Roger Pau Monné wrote:
> On Mon, Oct 19, 2026 at 04:59:59PM +0100, Andrew Cooper wrote:
>> Between writing MSR_S_CET.SHSTK_EN and establishing SSP using RSTORSSP or
>> SETSSBSY, there must not be any CALL or RET instructions.
>>
>> Building Xen with -fno-early-inlining causes wrmsr() to become out-of-line,
>> and thus suffers #DF during boot.
>>
>> Make the MSR and shstk helpers always_inline.  They ought to have been this
>> way all along.
>>
>> Reported-by: Roger Pau Monné <roger@xenproject.org>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger@xenproject.org>
>
> Originally this was reported by Stefano, so it should likely have his
> reported-by tag also.

Fine.  I can adjust on commit.

Thanks,

~Andrew

