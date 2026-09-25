Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487E8C98324
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 13:59:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433983.1654186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA6Rr-0006ZA-HZ; Fri, 25 Sep 2026 13:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433983.1654186; Fri, 25 Sep 2026 13:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA6Rr-0006Z3-Eo; Fri, 25 Sep 2026 13:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1433983;
 Fri, 25 Sep 2026 13:58:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xA6Rq-0006Yx-3R
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 13:58:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA6Rp-008m4T-Gg
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 15:58:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab67df0-bab6-0a2a0a5309dd-0a2a4503d7d8-36
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 15:58:45 +0200
Received: from [52.101.53.55]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab67e14-fae8-0a2a45030019-34653537fb1c-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 15:58:45 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7554.namprd03.prod.outlook.com (2603:10b6:610:246::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 13:58:42 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 13:58:42 +0000
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
 b=Am+Hxo1MbpaZph7aF/dmVb5/2GQVDZ+LsBpImJSD+BCY/0n0KHK2CU/xzH+RTxqBvLVkClVk0kciHytmJWHJt0/YZa2OTjGn46eIUvdOUGjW3TEjs/DVO4J2QtGT60H2j50wg7HF8E8aI31IF5QT/50KohLBBRxXN6eAlq1rRfuSmpYCre7MmdRCq8QLoUu917Q/xv6Vt+bJVUlCLmBcQPRxo+mHfoIUitfIgVT8EAiz0MlDAyS/5gpg10/cIia8OwcftQ1j/0bxACD3/XqRKB8OdAM9/KX30jkthujHtdntiJE0yqlQW4KAGqzD9SSaYGQ7rvpOlb5k+P+oKbGuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5Jl5dai22U+/VZ8ekwNoaCGJzjDo+NHI0gO9/ichfY=;
 b=YCIREIvrNUKQVqleR7VcNvBvjDR/N7hVqL1nHQrL7wNtKQ9uTqfbA03KfGRDgGX6vXQoqZ1H9A7HjqtqNrvSlIB5NwG1DXn1lTbawmD2BxIAB5vvf7Avu+DU9MmEW25uAdqofu3nK7/CuwVw9NCkUgWVFWMnTVl/jSsLtLyxAjrdEZIuZwjm4AIhVn3k4QUxf/P9o5Vdg+HDDSWRmqb0dSHEI1isP1Jjg3A0RvOT7CD8hcR6Gq7mAWBbxuNdNjqZBptUdPEGN7OGMJQtNM0LO8mUNhe24WE1ssIWNSZJlCweD1cu0ollQ//6ctJ31Nlz+7CfIiAja0MP2PArj4mFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5Jl5dai22U+/VZ8ekwNoaCGJzjDo+NHI0gO9/ichfY=;
 b=jHgrX71mBRjm6Sa9975VRfMVhLwQwGtHHqkLRUY6PATbN+/IhdiCZV1V5+9l/sNBrl79mQz1/vIke0n5GMGDesBD5ecUIaSU3HhcNC5cU4TIaPugwqR+GVFQtuV4STLv3q69hMm0mjP2vFlZkGMHGyO+MWfsE6a5KHQ3dbETTk0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <558c120b-03e8-4942-88a9-2ba6528d8122@citrix.com>
Date: Fri, 25 Sep 2026 14:58:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mkelf32: correct VA/PA of PT_NOTE / .note
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Barr Detwix <timotheecisnard@gmail.com>
References: <5654aeb7-7742-41c6-a382-e1afac9d3bb8@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <5654aeb7-7742-41c6-a382-e1afac9d3bb8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 09061cde-5c1d-4e70-fe8a-08df1b0d1b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A6LzfmOF7yGGQgoUcT03oLaysC2RJ365knxkArsVXNfaRz0WU18zZF8fEBF+UZAA0nznnmxWxgtcCni2J6OllwBQ9VdYmHogXe88w9nQU1LDybLKH17CyJvU2BGk/Bl7M0LHwMXLsgewJSngzO5bMVnZ+Mqx5LvnduWy85EqS/CkDZILsyzckcY93fIiGORGbqM3aSEjJGIQbrMvq4SM0tww+Egsan2SdYM7+1nlf2yk388uslUyQp7yD9yNFopotHo7QZhPBmOX6sMICK/Lmnv/w6NGhrC/qWzsp4gipAKSwSoKv/rJK1lKTrn3efHF8ycxhvu3pP5TR6nwhc4nup6Gk6ab9FMNsEvnJ97t3XEVGjfJwILRLGNs3Pb3Zw75IjtXc40jQD86eqF4E5eGY/EnfTNjIkqMw5+Bqm77qsF9zCJE6S7dd8dDDCqjiyztUwsiYSk0K4ghqWccrvVuLzKhYRqgHiu1gPs9k/hwoljhrbiUTwjh4filaeBPNVIi4XhvB2OgR0OT+r34+fPIiS0iQqJfP42eOIZNtraJxZW2MZPFphJRJm9oUXB4FHpQvh6REwl+WCRkonCcy/rVlDLaKpmP6+TGniMzzJMYJWXKOT5cOpwfZ8ODO8gSO744rSjyKp2r6HRAHomvN06fpgvOviJcUm6VwaF3n2zEGGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1hMOUxITFV2aHZ5WW9WNDNsVlhib3d1NklvZGk3Q2JTckI3TE11eWlhSmZS?=
 =?utf-8?B?UjV3Q3ZqRnkrcmZybmRiYk9lMHFKRkVjM1hVbXhPN1ROclNrdGNveE9DQ1l6?=
 =?utf-8?B?WmxRbFNFUGJDNWJuWk1IOHpTZG5hK3g5WTZ6UjYxWFgvUmdKalBWbjZXbUdO?=
 =?utf-8?B?QVlVaE14cFNQd3N1M1ZkcVhhUFNzUVhaUHVxZW5TSlBvWlEzdjRCRWJic2xx?=
 =?utf-8?B?a3pDaXlzRjBBNzFjaVpYY3lvSndNYjhCVHEwWDFVQ0RtRitiZzdKQ3BpVnA4?=
 =?utf-8?B?bTVkeTA4cHNSdHFJdkpkSHgxd0JsdHJEVVczZUhxamxVb3IzMGNkcm0waDU5?=
 =?utf-8?B?NGNRVFlYalRtQlVqcnRwbWcxL1pjcktZNTI2dlpDTDhOaEtFckxBOHl3eVI0?=
 =?utf-8?B?UGh6UzAzeGJ6MFNzdWxud2kvSTlxVzk1YjdRZVRDSnh4YWpOZHJWVm5RT0dp?=
 =?utf-8?B?dmkydVJiL2k1Q1RwSnk5SHlLTWlsMHJiWHhFQkVIZG03aGRiQmJvMWR0Wklo?=
 =?utf-8?B?YXVSZmdFazNFU21VYzBNbTVIa1pPRjRpVEJ4TThZQnRjYWZkbnBQVlczTndY?=
 =?utf-8?B?U1E2d3RIM0pYSmV6MkcrQytZTXQ4Q00vZ1dxVnFiQkZyMUF0WENxWlNxb01L?=
 =?utf-8?B?aXhXc1J6Q0gxbFFzeElxSGtNb2RQN2xMeXluQzBTSWVoS1FmWFVJRkJxSFBk?=
 =?utf-8?B?OXlSMis2UTFIa093VnlwWThkemtvYURZVjNDRWNDMVV1dGE0OUI2SWxvZ3JN?=
 =?utf-8?B?Qlc2YTlFdXRsSm1uS0RyZ3ZLNnZ4L3dHeld1Q1RyR3lqTDZBckRNUVBSL3RW?=
 =?utf-8?B?S1ZLNUVHSlYrK2loeEFIbmh2YlBldnkwZ05XK3hveHNUOHhxLzdZNStiODNK?=
 =?utf-8?B?YkZlYzFCWGRzanlvMjhpRE0wSm9YRXZ6WGVSblQyN3FSNC9NdzJzU1E0SERO?=
 =?utf-8?B?OUQ4amt3akszRmc4U3ltQks5ak5kY3pCWVpYeW1LREQ3VFVSczlMNjFrV24w?=
 =?utf-8?B?eFFKcEJRVnM3N3VLTjF4VXRjMHgweUFHdDdjQkVSOFhtZGk2VjQ2QURDUEpQ?=
 =?utf-8?B?YkJXZlFHRVNvWWE5cG90TTkxbGs0SkNieE1mVlFLZWZTYkpnaDdBdmRaV3RH?=
 =?utf-8?B?ZWkrZkVZUVRsdTcvWXZaaHR0b1djMy9GSithOEE1czN0SEpBYXF2YzdNelVE?=
 =?utf-8?B?SGRqQ3hqZzUxZW1LRjNWcXAxSEUwbHlPZzc2dVNxdm5uZVcyUmVydGdJRk1W?=
 =?utf-8?B?ZWgzd0p6SWNyeXJYclo0d25tdXZPbnptVi85UFdEU2YvS083QXJELy9oRm9i?=
 =?utf-8?B?RnFhemtWTHVBZUFvMzNGZ0NWdVVxejN4c0VEMzg0OTJ3QUVUNTNmYWEyc21H?=
 =?utf-8?B?SFZzVmdSM0xPZjE0ekJwSVF4cUVmbGdUOTB0OTd0WDVzblJLUU5hRDY4WHlJ?=
 =?utf-8?B?MlFzeHc0S0hjUTYwQ0JJcTFPRnhvNExvWkhIK1lMajhUTlNCenVsVzYwcFRy?=
 =?utf-8?B?Nm5uY25XeW5iTkFZa29Ic3FmblVWNlZxNjhDU3BBV2lFaHVPQmFUZ3FIbXJ6?=
 =?utf-8?B?UDk1Z2tqbXVkQ0JNTnRRd1ZKbDMyVFNLY21odzNqRXM1SEwvWDBObDNNakhI?=
 =?utf-8?B?cGNIZ3lDcVV1UlRZNWtvRml2M2dtWkl6a05uUmFjWi9qdVREQTFQRjJUUWJ3?=
 =?utf-8?B?U3RKVWRzbVBXQ01kK0w5OTlkU2pyNlZaNDhEYjJQdU4yVkRzcGM1ZGdJY1pt?=
 =?utf-8?B?dnpOVDFIekhsaHIwN0NXSmhZR3dFbkhpWE4rTENmUDZMQjdkK3B3VStCRmUx?=
 =?utf-8?B?OWZNc3AxTEZqdWx2a1JVZmlXalY1YjdWSEtYalFzeDR4d3VWeS9Zam1vTzNr?=
 =?utf-8?B?eC9PNjRSOEV6N3hmWW9NNDFyVzV1Y3NVYXZ1dEE1RmdFVmtaK3JIR3Avd0Rq?=
 =?utf-8?B?YmlqQTBlQ0RTTnM1Wm1TRWFybS9KL0YxTUNvVllYSEEycytLYWZaekVrRHVQ?=
 =?utf-8?B?TXRrWStCY3B3N3BMNDNZeUNndEZhVzZoT2NWTkJKYkZrL2ZzVWk3MjJyZFJm?=
 =?utf-8?B?SklHYjg0aWE5UTZVaXltWmNmM0NGZGNYeHVoc0s3K3ErVnpJRUFEZG5haXhn?=
 =?utf-8?B?REo5MHh0Nzhpa3QydkpYa1FyVC9xVFkyUTY4VC9oTHkzSkpZUW4wWk9nVEph?=
 =?utf-8?B?S3hLcGhGcUV5WFMwTEJEbzhNVEkxWDRacHpFQkl6RjNucHR3aTdKM213WlYx?=
 =?utf-8?B?TkV4bHpEc1VOdXFRY0FodjM2Z3N3ZmthbnFvZ3ZrZFZSbFpQT2lzQzZxVFR2?=
 =?utf-8?B?ekVibGRkazFNS2d1MUhqYkhuQTB5MVI2U0RuNFd2YUxpZmNPT2hkeXFVT0dN?=
 =?utf-8?Q?mx80aAPmM1/iHIx0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09061cde-5c1d-4e70-fe8a-08df1b0d1b93
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:58:42.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O588fRZRr7vf3d3XdS2x02BTKpu43AopQ7ZiSPfhkcCkRzvlhlCM0rdXxLCk/s4o4K4zZZQeguttuwPAjgWfiNuMXhJulOuo9kKlIrBk3K8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7554
X-purgate-ID: tlsNG-33051d/1790344725-6FEC24E9-4900472C/0/0
X-purgate-type: clean
X-purgate-size: 2263

On 9/21/26 11:18 AM, Jan Beulich wrote:
> For the .p_paddr, .p_vaddr, and .sh_addr fields the image load base
> (passed in by command line argument) also needs taking into account. It is
> _not_ merely the delta between incoming PT_NOTE and PT_LOAD segments. (The
> fields aren't really used anywhere, so this is largely a cosmetic issue;
> static analysis tools may be affected, though.)
> 
> Fixes: a353cab905af ("build_id: Provide ld-embedded build-ids")
> Reported-by: Barr Detwix <timotheecisnard@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/boot/mkelf32.c
> +++ b/xen/arch/x86/boot/mkelf32.c
> @@ -362,7 +362,7 @@ int main(int argc, char **argv)
>           (void)lseek(infd, offset, SEEK_SET);
>   
>           note_sz = in64_phdr.p_memsz;
> -        note_base = in64_phdr.p_vaddr - note_base;
> +        note_base = in64_phdr.p_vaddr - note_base + loadbase;
>   
>           if ( in64_phdr.p_offset < offset ||
>                in64_phdr.p_offset + in64_phdr.p_filesz > offset + dat_siz )
> 

The diff before/after shows the note section and program header addresses
moving by 0x200000 as expected (with no other changes):

@@ -24,7 +24,7 @@
    [ 0]                   NULL            00000000 000000 000000 00      0   0  0
    [ 1] .text             PROGBITS        00200000 000080 2df354 00 WAX  0   0 64
    [ 2] .shstrtab         STRTAB          00000000 2df474 000018 00      0   0  1
-  [ 3] .note             NOTE            002072b8 207338 000024 00      0   0  4
+  [ 3] .note             NOTE            004072b8 207338 000024 00      0   0  4
  Key to Flags:
    W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
    L (link order), O (extra OS processing required), G (group), T (TLS),
@@ -36,7 +36,7 @@
  Program Headers:
    Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
    LOAD           0x000080 0x00200000 0x00200000 0x2df354 0x400000 RWE 0x40
-  NOTE           0x207338 0x002072b8 0x002072b8 0x00024 0x00024 R   0x4
+  NOTE           0x207338 0x004072b8 0x004072b8 0x00024 0x00024 R   0x4
  
   Section to Segment mapping:
    Segment Sections...

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

