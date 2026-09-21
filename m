Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF42C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 17:32:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427807.1650572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8hrp-0007MW-RV; Mon, 21 Sep 2026 17:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427807.1650572; Mon, 21 Sep 2026 17:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8hrp-0007MP-On; Mon, 21 Sep 2026 17:31:49 +0000
Received: by outflank-mailman (input) for mailman id 1427807;
 Mon, 21 Sep 2026 17:31:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x8hrp-0007MJ-3h
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 17:31:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8hrj-00DEuM-2u
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 19:31:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab169dd-2eae-0a2a0a5409dd-0a2a4505ad1e-46
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 19:31:42 +0200
Received: from [40.107.209.46]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab169fc-4cb1-0a2a45050019-286bd12ee1fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 19:31:41 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 17:31:38 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 17:31:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oc8CxIFP16jmiHSJ6EqHK1JMJbjRZJIS8OepnxKDxowtD4ibJTnU9wzW7Lvdk2pTZIOoJ/Cwnj9toPXPYjx5VNMa4RSfIVCqqJRxQ8NvUYDcNO/OxuuxP3u6cb3uyjIIPuvuIqh8xSTuYKpMmUAQjdbYf4vltzms89EIavHi93GkviDasmUXUm+MjAK4R5JhyVf7R9ul5Jo4TsjC3JXPO5B8EzZAqgZysQmNDfY66OJY9O4xuLKTbJEM0jVIlRTzagRgEwGVmVE8s4xtOJQ1RqQwOLhfgrDww/dI+SUCA6l2VynsM3bq4Y/GOpRN31JtSbfi4xTqpL7zu7qs+1Z8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qT6YvApqICwnus4uJaLBtTpqiU9RiIFrSXWT8PiYie0=;
 b=jxZRLmdle+Z6qSptGYIETFQbqOqMhTZtUmLU5YU1Vg90K68KmU9fHhYWnKirXF/hSmMKI2v1u6LZ2oi/onp8lQXMjo9CD0NVmOWJLgv8l3Rny6HR26Bhp2v6JtZjGb4nLrqwhUiVQDD7izh4fiBalMFF0uky4rg+PEoMklYho64A+a4PYGl3Ho0/efe6UwbDgPC/7Ujx39HQN4++OxqbtmAwQimf+2/u8qV60uCmH1AB0DQlpZiXOv4K2F1AkzacxcR+ELpSaY/UeXqIYPW+1GDVJPT6pUvUT57UxU46WN0M5zo9ljRVkNQ51p2ytQpCbW/jcELG3YUiygFjNkECww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT6YvApqICwnus4uJaLBtTpqiU9RiIFrSXWT8PiYie0=;
 b=xodNreDstgFCFTG6BGuPVesANvct8JQrkWb7mwIWPmJl1sD7WNWVeFUHWaH06jAChaMO1GW5bJu0Xq495GHxCGWnueq3VMrte6yDpruoA6XSG7M1ns6f5sLpzXRzEJNTquYx51AEmYPKhBAhh73gQjSkA8A0bH+7mI8dWFTkUjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 19:31:34 +0200
Message-Id: <DLL69C5YJJVJ.3THAD5XVX4QKV@amd.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, "Teddy Astie" <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/vpmu: Fix incorrect printk format specifiers
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20260921091651.34761-1-alejandro.garciavallejo@amd.com>
 <489f6ce6-2be7-4c94-bcf0-21fc6993f98c@citrix.com>
 <DLKXDDFXWQHS.3KD2N2G4MYVM1@amd.com>
 <1cef5505-79f5-4319-8334-d3ee809bde7d@citrix.com>
In-Reply-To: <1cef5505-79f5-4319-8334-d3ee809bde7d@citrix.com>
X-ClientProxiedBy: MA2P292CA0029.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::19)
 To BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: d582f2d4-ac80-434d-cc89-08df180630d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CSL0YU0xRSwCwMCXJEK2JRKXvJ9v4YmNGBcmhuPgg5VbiN3nQEtXX8shzA3AL/foipRr9VHRRNrDH8B1ymFbaJbTb+gRL/yzarPezMyNXBgbGLNlfZLN1LMRT+Pq5ioa/uR6v655RVeQF2EmbGvHnEiYQgc+Ah7VKCArCQHIBfywg5FKLWJfy496wBVT+SY/8nMmkgupHqDzo3bwlYRQNPQeU74Seer3kK2SQuq4BudcaSX2tg7l50KSO6vYyw/oBvzwGY1J4/pTHxrj6alipnqtL7DED5LNHbXAdo3N0qml1JHhuczHmGnnDRJNB24vL/CIFZYvNr3K4CDnQ2OstobrU3d6OsTfKGKiGTB1GcTnwYzAvTBy2uy+7QbkRPEClxk9a5V0KFUOR8FVjggxJ2isqUaUtlJHk2+dwXzAfatnbtxSgxDxQhUdMGuPrHbtDQG4lQo20d0GHJhl2/GGufq2yZEMZoA1YthkWzjLLtxcZiVLPbDdKn8braUHLSdiMBUWR39vg+nWlmPyh2iC94GjF+SQg1xVXl8iXJJQ3ErtzsC1faPti69JgZaqWZ8T8pa/lBC0f+DT5H9+Klz7AkmDWaoCqRd1Bc+wAnjSfenFxxZftWgq00D7qDOVoaJRMW/wFGxhual2wZLI8U53Aj3/5rUUZY437Isq5lDun2c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czR4Rk5JR2ZxMDVZT3pZaVFKR2crTEttWC81dnBUQ2huNzBCelZROThoTE8y?=
 =?utf-8?B?c1daaW0xVTFHaS9WSW1jSFljZFc5d3luTjlKT1Vtb1BwQ09GeWVoQ1V4NWdE?=
 =?utf-8?B?T2hMbjBIejhsR1dTQmlZMWxOcEtmcmNEaGhUaU5Vay85WlpyTGsvUVFnNERj?=
 =?utf-8?B?NTVEWEx0VktVOEVuMXBVRVptQWtxcjFpUTU1cHV0czJjTFdXbCtlb1g2Ly9o?=
 =?utf-8?B?Um95RWVWRDdnVVpUVHZNVHdzdTZFTXRFTkZBYW03Zk5zLy9JaGdLUDFjc05M?=
 =?utf-8?B?ZDNMY28xbGpvak5yQmw3bTJvUU12cjNhaEVtQ0lGQkgzZ21NNEkzQzlMUjVi?=
 =?utf-8?B?UWUzb3Q0TjFYbVdjZkFvNnhrMXR0NG5iZzl6M0F1UU5SUTk3MjFla1NUcEtV?=
 =?utf-8?B?RjZhVDJsTnFpV1ZLTmlrS0svWG5DMXBCOFllNjVFS1VtclRrK0RTcjgzem1S?=
 =?utf-8?B?RjUveXBSeFhkWkI3OGxrQmJhR2tRREZpNlFqQTZmUEpmc2l1MnRHT0RlcGM5?=
 =?utf-8?B?dklnMUFWZjQ1VXBieWZ6VGNjQU5heXFZckhlZ0tkUHplak01blZFL29HazR2?=
 =?utf-8?B?SlA1OWRZME1IWmFxZzNuaE9XTnQzcHRIVWdjV2FLTU9VcG9MN0laVHlEOVVY?=
 =?utf-8?B?SUR2ZGRrR0lpZ004RXV3eHdYaFRvOVc2R1NFYjdHWWdDbmNrUEZmQkhIYjZR?=
 =?utf-8?B?c25BODR0VG1QVGM0eXFBd241RVVhb0MrdWtvZlU0UWQzSWVGMEZZR3dsMHh6?=
 =?utf-8?B?SVAycTRyVEtFenY1cWthZkJhWDRLL1FLUEZDNHhqa0ttSVRKaUZ0N3d2N1RX?=
 =?utf-8?B?bnMwYi9ZSjlUU0pUMjVoTlpTT3BRUXE1Q1dhQ0ExU2ZBVG9nRnl6K1l2QmRS?=
 =?utf-8?B?TGJ1QVFGb3JLSDBGcW9ONkZpdmhwaHFrTldXUTlTRkZISUNYb1N6cHhZZHFi?=
 =?utf-8?B?eTREUW9yRGRiR2dwV0VrWE5CVEMzR3lwVGhUWW9hQ1hHQ3dLQ0Y4Y2hENlBP?=
 =?utf-8?B?SDhWVjA3OUF5a1FnYWZLTGJoMWJBODl3VHZZSlJlcUVQVFJRWjNBY2hvamUr?=
 =?utf-8?B?cGZ0NUZwd3pONnplYTEyaFZzTCtVdTBONDhNdUI5U2V6ZHpzaTdhMlhvNDV4?=
 =?utf-8?B?dHZLWWFuOVZzWk5Oc3ByTXNadXJQUDQ2L29iZnV6TkxSVnFoaCtBWGVyL01n?=
 =?utf-8?B?c3d2NmFXbTBuNjg2Y3hZK0dSRU91NnIxdkMxeXRUVUhmcFFFNGlJRk15UVBw?=
 =?utf-8?B?M3UrUkFoeFhqSEtEaWVidXI5ZFkyR0RTaDhzR2ZxaEUzQUdjTDNDM3N3b3oz?=
 =?utf-8?B?bGp1aSsvVG9vUmFuK2w4b1lQTHFROHNSR0FBK0xoM21nQmRGZTlnNEV1MjYr?=
 =?utf-8?B?V0QwQW9aQXYrbEVGQjhBUlRWS0ZwVUJPcjBOSVgwMzBnYXhSZGhFQlZSQW9Z?=
 =?utf-8?B?cDBIZndHY1VqdE1qaGF4bmZ2SmVpYUdQeVRQK3ZVVTM3WndMWkluQWdhNnZ2?=
 =?utf-8?B?OFRIcXpXTi9MYWtyN0JzSkhRcllucXdRNzdyRVc4REFtQjJhc3J5UC9zWldz?=
 =?utf-8?B?SGc1anduTHB1M3UwbXVIYjM3MC91K3pPYzhIUk5HdlEwM3BjYk10UjhkVXBT?=
 =?utf-8?B?SHUyRjFBVW9WdVg2Q1gzVnEySWlFQ0ovYjQzM0Uxb0x0SFU5NmllQ0NkaFpk?=
 =?utf-8?B?cXdZUUpoV3Ewejg5eWlLOHBqUFcyWHN1cHpOQXJaYWdrcnF2VXF1Y0xUNFRS?=
 =?utf-8?B?aW5PTC9xOEZUajZXaUsxM2lZKzNLRFpRSVMyb0JPdFZQemdYYkV4aU11ajNG?=
 =?utf-8?B?aFNOMmU1YlZnejVZb3dQSzZDUnk4V1d5KzVDWkFZRGVsaGhSajMvSUdUWlg2?=
 =?utf-8?B?cWI5NXYrMTVkVjBqYjQ0aDkvOEw4Y0YzMHcvV2haczdldWVFc1d6ejNHdSt0?=
 =?utf-8?B?ZzVKUnFzNGVRelZudUk3U0J5YUF6N2hIVmhJZWNRaS9DR2p6NGo5amdkQllT?=
 =?utf-8?B?NmVKSFpBWXVTekpYNFBVNmU0NjkyQSs1dnR4ZmNBZjBBTU5VcXVvazd0ckRC?=
 =?utf-8?B?QVMxL3VJbVUzUHN4a2QrWHMvb3dmTEZZUTRDUlYvM0hwMDV1VWcwWXhVbm45?=
 =?utf-8?B?cjArbDlZektMUXVuaU81MUNKdytMSTJvN2RHSUJXMEdQS2ZOOW5CR21hUjVa?=
 =?utf-8?B?RW4wYUxMTnAvWmJodWFocGtXM1NCVlBlQTBWOVJJMEwyYisrbGs1aFJCVzBs?=
 =?utf-8?B?ZGQyaGc4ZjE5eWJzcng1eDBSSzg4RFUxMVN2ZUZoTDJWVzZoWDJZdWlaVU5p?=
 =?utf-8?Q?IVctBlTqcnQO0tI3L5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d582f2d4-ac80-434d-cc89-08df180630d2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:31:37.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nvd7M/NM9zmLbdE5BZtN1sCjIG6HcZxDRvIFnyfJ0twvnBw15o6iN8VWQ/93Pbqiz+ycWFxarPLXcovF5Aw8ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209
X-purgate-ID: tlsNG-c201ff/1790011902-722AB2A1-D73AC3A0/0/0
X-purgate-type: clean
X-purgate-size: 1199

On Mon Sep 21, 2026 at 5:59 PM CEST, Andrew Cooper wrote:
> On 21/09/2026 11:33 am, Alejandro Vallejo wrote:
> > On Mon Sep 21, 2026 at 11:30 AM CEST, Andrew Cooper wrote:
> >> On 21/09/2026 10:16 am, Alejandro Vallejo wrote:
> >>> The patch in Fixes adjusted two vendor variables from uint8_t and pla=
in
> >>> int to to unsigned int. But they were both used later in printks with
> >>> the %d specifier rather than %u. Adjust accordingly.
> >>>
> >>> Fixes: 39a9a49449d7 ("x86: Remove x86 prefixed names from x86/cpu/ fi=
les")
> >>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> If this is going to be a problem, then shouldn't we turn
> >> -Wformat-signedness on?
> > I tried that before sending, but that needs a whole new series. Things
> > are not quite as clean as I'd hope.
>
> Well, it's going to keep on regressing until -Wformat-signedness is in
> place.
>
> ~Andrew

In case it wasn't obvious, I agree. I just happened to bump into these
while refactoring that general area for another series and I'd rather
fix them separately rather than bundling it in a 15+ patch series.=20

In due course it shall be done.

Cheers,
Alejandro

