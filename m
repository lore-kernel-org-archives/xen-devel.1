Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F646C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:38:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416787.1645712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51SB-0005lk-EG; Fri, 11 Sep 2026 13:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416787.1645712; Fri, 11 Sep 2026 13:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51SB-0005lc-AN; Fri, 11 Sep 2026 13:38:07 +0000
Received: by outflank-mailman (input) for mailman id 1416787;
 Fri, 11 Sep 2026 13:38:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x51S9-0005kE-Pn
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:38:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51S9-00Bdrt-6W
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:38:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa40438-8faa-0a2a0a5109dd-0a2a4503acc6-24
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:38:05 +0200
Received: from [40.107.200.13]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa4043b-fae8-0a2a45030019-286bc80d41e0-4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:38:04 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DSSPR03MB989189.namprd03.prod.outlook.com (2603:10b6:8:375::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:38:02 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:38:02 +0000
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
 b=TMF+sCH8Gs8HDZNMV0V8/0j+tjd9pxraqhKNi1vBOT1WyDsOp+ktl1xmLtjOlz19HwPDYbfR6xJJ+QY0MKdXYTrVL84URjTNkkrw90VKA1fZc0m8HMZu52T0eOG27jkIdPI8rtSWBikVJhTECWHbBfWqx79nADT+z8ssrdMMdwyL2EI5UBG1RLQnL4J2IjLhd1ZergZG05qk4xqrI+sMaGWrIiEcTBL7bbMITNBsG7TqQP+B1EbqTmRybHCUiLFKHxTHm3th2sDKlnMLDvcAw+aOmI0viOtz2wa7XANpibLIl3xl/aQBMd7/gqqiVk+oXy2CXn1CKq4DlPKk5Tt/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yIPE0AGlvw7y8vt5wZos56FplFsOc+Cx0ylaz1jFSM=;
 b=ROQlaFwC97084EOR4Zfh7OW9JN8wq/FLOFb1Fl4j8WK9VNq5NHV+JUNQjZrlUOvrtlxpLY40brrj+Kv8mx5bbwypxcn/iIutN0fWxgoW5FelWh4TSnZf0KfUv8DANjvecoPa8x6uvvDoH1CCFrDonHgauzMtZrNAnHkTp7Lm5Y9Ym7P7Thwyoluk91h4mrLPPgXwyMh4i0AQ8aFLi/mUC22rSvLizlVeUycxxAypg6SGH2e3/Vv/IT1JETxNJ31G70BXPfDpVrDgdIcTIHpYtgwXwD34jMBGN3mf1ihTMf3YUaMOaGIe85b0OnAOOxqct7VAxCCZshuYN9aSLpi1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yIPE0AGlvw7y8vt5wZos56FplFsOc+Cx0ylaz1jFSM=;
 b=W0xqj8ShOcDMKllcWTys5OaifJUbm+k1h+S1R/9rr1VHBk1s/kZru/Zlzb7Vc+RRHTlXAUgtvvB56tv8bGxiHwe+erZk0AcC7OcK6iJzMmxTJVYdTKQc+5uNtRr7DIYn4yKtoKVro0MrAuV23PNFimTgUgxbyqCeSGz4vNXBEh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <13afb847-61df-4568-af48-e35ba9c5f564@citrix.com>
Date: Fri, 11 Sep 2026 14:37:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] nestedsvm: Fix deferred event injection
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
 <20260526124027.573412-6-ross.lagerwall@citrix.com>
 <d064ccbc-c414-4be7-af1e-e8b0c39b136e@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <d064ccbc-c414-4be7-af1e-e8b0c39b136e@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0212.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::19) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DSSPR03MB989189:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b1c675-1b46-41f0-c54f-08df1009e688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/fA+A2JqT8FcIAB0W1+DXlcIFIj5xy4fPbMAMz+1ZTyNh5+6+KZgG4Ya8N2PlktvJtd1oG+bKIokH4dTR3qszr8EHC3gOmWrs+LnIu6d/7QA1pjRYTSzFY84IQ1k31UJNro3HQRan+SUAt1Z5TjYZwAl06Kt5230U8r2svsSfYuPd9IV8rDS7GP+Zv3KbISALW2ybAnwCZpE1bMVT7EY7fknbQ5Bbd9TWYi37NWzAly6YhUgFqOKtz+CctXTdNFRkngIH5VK4bq/VLgX1gnLG40bOZtbg4Xg1Fh0iIkRCu596rtgBTZZ9iPl/uyubzna1wOrFgDrPv5I6IDvTHbaK73cF7qhQOu6koio/wpP5ZxB81cgMx5g3cCg5MzB4sfyMH339DRNyDS7Cy+08iJuEiU88sQ+4JgryBp2PjryKf0GwVupU0lwh0VbYMbhpuoYincRIlMIcXFo1hJ+ucE6oijmEi5pEcmi1xu3FwBdYBh0xWphFO3miWDCyR9MuuxE+SzFae3LEnW/agNTbpXeHVxLZdwBM1KwDU8+NDnzxYbxHbXEeuhUaN/mVDuQyKqeR9CIcEhWCSQNmQVe6cgRo5JL0DAJxFwtE+g+3cLP7vG54A+szGUikVFwP+MOZ3xXraukqI4m3LkDS/QjOfzfjaj2gtOxgy0YF8uzJGFe5JQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDl4eTRBR2txMFo3OWhKd2lPd3Y2MHFjQjFGTldnb2ZrMzJQMjRZOEU2SG1t?=
 =?utf-8?B?UEd4RVV5cTRzeUtJK2RjdXphL1NFS1I3aGlSNUNGMmtaV3p0VW9vOWJQRDEx?=
 =?utf-8?B?UlNzamJyZS9HVURDYzl5Y2pRbVNBUlcrUmRVM0N6Z1lCYjZBNWNtUmc3WUd0?=
 =?utf-8?B?WWI3QmZqQllQUis2WVg0TjhmZUF4WEd3VUlKRGRzVldvU1AvazdQUVErdnpz?=
 =?utf-8?B?bWlweElJUHd5QVRsZWlLWHdLdzA4TWdwTE14MmZCNnJiQ0E1RXJNdXJCMmYw?=
 =?utf-8?B?K3Y2N1N0VWpuSTJPcGdKSUdaY3J0SEgrczBMMW9ZYVRkM1lFQjNNQUIyTEtQ?=
 =?utf-8?B?dlNQMWN3YlB6STlSL0ZJOFVnVUxmaWMyMmFJdm95Z2haWEdRZnlGZDlDbnJG?=
 =?utf-8?B?L0QrTnZWWTBjZHNHZHNoelNVZFFxd1FJVUI1Z254b1pENXhUaDk1bVBnSmV6?=
 =?utf-8?B?c1FDVzFJa3dMUVNYT0JUWVY1VlRUOVlCTEp4UWx4ZGxqUTJNUFdORUc0aE50?=
 =?utf-8?B?a0NZeWFxYXZtVk5uOE50QjhmTzRXeXJmTWh1cDlKSlh0ejF1QnlVZklKRkho?=
 =?utf-8?B?MDB4TnF5YSt3bmdadlRscWV5WTV0SXdUNmZ1WDY3R1BrWXJqUGVTUmp3bHE0?=
 =?utf-8?B?Lzd5OW9uVHlFdEdGdlM0aDk5VnQ2UVNXZDI0NGZEd1dlRUIzZlVkNnlyQWtO?=
 =?utf-8?B?SDVXVlFsS0xtZnROVWVUeXkzMXhpMnRocjd5NDdnQ1FDSEk5OGdZQXlZNXpC?=
 =?utf-8?B?RE1sckhTLys1TDBzV3MveFdlRkxDdjhhZjlWYjdiZU9NOWF0ZmdzTGlPSEF0?=
 =?utf-8?B?QWE0M0xmZFg0UFNWTVFGWTF6SFZENzBPUFYwZzJQWXoxNXlpRGtEU2kxVnNr?=
 =?utf-8?B?S1dCc0ora1J0U1UzelByWWxWV0FzZ0M0azNJc1FacHhjeEpnaHZlTkFQdWJo?=
 =?utf-8?B?U3hZTzlLVGV4UGRlQm5XdWFLeXNzVlBnS0p5dlQvRkt4VDd2dGxtUEplSVgz?=
 =?utf-8?B?VER0Um1YK2RYQTJqalZYeTg5aDZQZUJFc095aHgyVFRFSWxWWVdkeXFUR1gz?=
 =?utf-8?B?TEFZb09mR1pSNzMwbHNXclJVejF0SzEvRXRhNTZNWnBBa1ZsRU05dlgvcFBC?=
 =?utf-8?B?Z0EwR3VXa2Fvb0UyVjNOc01zR3hSRFJaUFNMVElWVi9PUW0zNi84akdDZkQ4?=
 =?utf-8?B?a0psYmthZVBjREJCaHUydjVpZWlvSXQyTmdGa0NkUG9mOFNGSE5VWk5oWmNM?=
 =?utf-8?B?anhvM1VFUUxadW9kODZaUUZOSVNKYmNSWHl1bXN6M1dqYU0wZnpnaXNlemFS?=
 =?utf-8?B?VFFVcDgzaC94a3loNE1TdUhFZlNIN0EyaDJiUms4SmRMK1dKVEhpVjBudnRI?=
 =?utf-8?B?bEp0QVNpYkNNL1VkTUdCeFZNT2xibmczZUFoRzFqSXYzOUJZYytqODZkVE9s?=
 =?utf-8?B?aVhaSDNFK0NzWVladEZRazZFb2NFc1lHM1RKNUN4UTNha3BEZDR5ZTV2MkdN?=
 =?utf-8?B?enRLQkY0b2o0TVoyd2VPVlR6YVFXQVRRemxQdSt0MFpPSldxZlNLVW1mbHYz?=
 =?utf-8?B?S2hKa2hUcmx0Y29mUHQyM3pMd2xsV3JLVW1xRFRYWGJOcWNmN0lGK1VPanVE?=
 =?utf-8?B?bnE5L1ZMVXVneDVqWEFxNkpFcWs2dlFGNTB0ajJubzMybldTNkt5bVl6MVdx?=
 =?utf-8?B?Q3FITi80cWNqYTEzZjJMYnExWk9tMzZlK25tMHBhV3dOQmNnT3lYUGFTZTVB?=
 =?utf-8?B?a1pHdlRsV296UTFZWTQ2T1hrSDJ3V3VoM1VVbmsvd1U4citibzVybWhZMmV0?=
 =?utf-8?B?cVNUQ0ZsdkRPVWRjSTExS20ybzYrNE4wNWVLaTdWY1gxSGtVSENxd244Z3VQ?=
 =?utf-8?B?bHc4V2NsUGR6eUhabmRwUnhDaWh0YlVXK1FFVGNlQWQrTE1HakpPVVRJZWJ5?=
 =?utf-8?B?dzFGU1lCeDhUQmpnRUdSdzc0dEtXQUtKYW5mZ1NvRmV0dmlHeWVJa052Rzky?=
 =?utf-8?B?Rms0ZU50MjJiT2R6QUljeDVnV1FSQ3MyQnVNV3RNeDN1eTRabHNBd2ord3J0?=
 =?utf-8?B?Y3NESWYxcjJpdGljNnhEN3N4dTE2dTlob3J6VlNNK1BLOVN1dDZCNUVnSUo5?=
 =?utf-8?B?aGdiZ3JOT0pYbzlvcCsxTzJYY1pudzl4RHh4OTZuRU8rWHVSREZDSU1BT1Rp?=
 =?utf-8?B?d3V2YmJicFhWL1Q2bXZENkgwVCtDcGRnK3VnZytpUGpyRVFWSGdwQ21UUy9R?=
 =?utf-8?B?NXAvc2ltZVRORTlSaWp4UGsyR1NSOFRwT2tNL2IzdmFCb050Q2g3dWpzUmZE?=
 =?utf-8?B?aW8zQlE0S3ZpbVlqQk9mSUNhbUo5b3NFdGkzdzJnVlZuNFN5MVVsOEJMWTlV?=
 =?utf-8?Q?GxHVfX7y2qT9OFXg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b1c675-1b46-41f0-c54f-08df1009e688
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:38:02.0030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpklQkMQErUdzjTtdenF3hD1K+9dFL5P/s32C9Y2A6ythjJFjRG+Fd/4pRt1ozA3YnzNpsgbRBbl30Kqhg7HqGsfcOke6jpMw1BM3CqVMm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR03MB989189
X-purgate-ID: tlsNG-33051d/1789133884-74E874E9-2B39DEB3/0/0
X-purgate-type: clean
X-purgate-size: 994

On 9/11/26 11:56 AM, Andrew Cooper wrote:
> On 26/05/2026 1:40 pm, Ross Lagerwall wrote:
>> If an event for L1 occurs while L2 is running, Xen should inject
>> VMEXIT_INTR and the event into L1.
>>
>> nestedsvm_vcpu_interrupt() and nestedsvm_vmexit_defer() set this up to
>> be handled later by nsvm_vcpu_vmexit_inject() after the switch back to
>> L1. However, the code there appears to be bogus and completely ignores
>> the source/vector set up in the first place. Fix this by using the
>> values to properly inject the event.
>>
>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> I'm reasonably sure this will be unnecessary when we fix the underlying
> problem of deferred entry/exit.
> 

Are you suggesting if the VMEXIT is done inline in nestedsvm_vcpu_interrupt(),
then it can just fall through to the normal L1 interrupt injection code (in
svm_intr_assist())?

Ross

