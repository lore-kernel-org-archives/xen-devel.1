Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA7A606B177
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TaWOa+Vw
Received: from list by lists.xenproject.org with outflank-mailman.1481332.1685184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi8e-0008Mp-Ka; Tue, 10 Nov 2026 09:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481332.1685184; Tue, 10 Nov 2026 09:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi8e-0008Mi-Hg; Tue, 10 Nov 2026 09:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1481332;
 Tue, 10 Nov 2026 09:27:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xQi8c-0008Mb-TN
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:27:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi8c-00GqGM-9u
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:27:34 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6af2e377-2eae-0a2a0a5409dd-0a2a450acbfc-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:27:33 +0100
Received: from [52.101.85.0]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6af2e384-f2d2-0a2a450a0019-34655500c2cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:27:33 +0100
Received: from CHBPR12MB780315.namprd12.prod.outlook.com
 (2603:10b6:610:36a::15) by CY8PR12MB7292.namprd12.prod.outlook.com
 (2603:10b6:930:53::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 09:27:28 +0000
Received: from CHBPR12MB780315.namprd12.prod.outlook.com
 ([fe80::6f6:156c:5674:75e7]) by CHBPR12MB780315.namprd12.prod.outlook.com
 ([fe80::6f6:156c:5674:75e7%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 09:27:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQlJHncxVeZNNofVUOKxZcKB5GSEjHpyce3ALaEWRXJQcBrq77fcl4cDGwWKk1Xq7hTSMCmUDwaIKFneF8aLYSfdasJm5zyhz63FzvQOCK414eyfpLdqUTa79hD5/e/OJylX+uQPPJh1DG9k2tXtP+d7fCU0kV6tChqPgrrByvWaCSsZyg+GnkjqvJTC+jim/Lai/GmwwTfHMlRjvUG4DLnhdojlntdnzv2oxsINqSLeVJaZ/pHHRTju08q9/l72WD1rYIuftFEsd0jMl5tDccgUlNnzwW1MWM1bshLnXwRvIn6v0LlzNMHp8okGtulDSnITcVTvuU9oTbzBCUCXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5jtsI5AxpP6xLdta94Om8OCOwBJO4GRHTOdMlDkB2U=;
 b=VP1jbSjcXKiq0BfhuYG3QikpdllfSSKHjgGC9SpoUSnsG5M1x7lHSYXUjPSspAatTun1wSQer+GExrBsNdg8aP0VeSabOUa40KHEPh3FUQfefYgMVW89eeXscHlX9hOD9HVCgZmYQ7jvLg1uDjQqIntXDpr1WtE1NSYWDiy9MQETPM6xd5gaXyOCpLIBNH2CATsDHwlAH/4IQKUzwzdrpVAT9i9NMkB7NLQxnJBfjrJBys6hK3nWYJsXlOb1mSOq/j4GKEZu++DwCgwOVWiKRiTkCjridvNWUYfDjYH55LrNHz6EOe1faYCeWjDlDm0NGDxUZTqLco8sb2Q+WL5P1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5jtsI5AxpP6xLdta94Om8OCOwBJO4GRHTOdMlDkB2U=;
 b=TaWOa+VwVZ+xE+tE7FHsfnILfdIifTISvUtkU60Sn2z7dVmhX6859MKSuqsPDlCdPTKg/4w5ZsC8Tf24dynvbJiVa404E/+PoBesc41f5NGWdOc+fqmc6UNlhERLJ9sSKF4W+PkBZHVeDEb3mS7LfY59/pVVvLE8g0KNOMAQEu4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ca060c06-1e8c-48bf-b11c-30e4639a676f@amd.com>
Date: Tue, 10 Nov 2026 17:27:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: wait for QEMU exit before restarting a domain
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@amd.com>
References: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
 <au2bNZiQmElHeEhu@Mac.lan>
Content-Language: en-US
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
In-Reply-To: <au2bNZiQmElHeEhu@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0026.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::7)
 To CHBPR12MB780315.namprd12.prod.outlook.com (2603:10b6:610:36a::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB780315:EE_|CY8PR12MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9c3c3c-8858-478a-fed9-08df3f0cd689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|4143699003|56012099006|18002099003|22082099003|6133799003|10067099003|261009223027099003|261102124527099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	anWHljncS28OFxRZP3OqiE5MQdQj6TuxLvRuCLXYt5Bulwgt6h/Io5/hCWpeYCMidPgzc+HACEZvH+S83S62oYhfwGkleJMG82jhrI0XU1p40pvgXmcbipXyjayIDX1oOjyhl+wedmp1PBGcmB3QYyW4O33/d8AufVL3Jd0rVg6il8EYRudeechyiL59FGeszUaFgCybJDkx4GGEaA/Wfssq+VEbOobjcN5UZMYxN1H0Ix0v/4NPdXpIWBYT7hEh41zBgbH3atITawfhkjTegkFJ38WNrHOQARz8mKEqeNVnbBUrWolfl326Z6BIfWa8rR6bsAMYuZ7Lpo0PuVWAjJyolH8xZoTa35IKRgzbfpi0tx4UMlcGPdaRQa3FU7437QR9oJDQl0r/qXOS02T3NVsBmmbbxdVFdqWM96jA+5tF93VmyYYZNgxnNdqwAKlsxZuVnCz3BADjc0njzUQYXzDL6Yvmn+YNbtj9kqRHBXxq6qRBqZtx/HD1gctx5S5Lt0Tv2CsI8A+ghiudMU8HBUw+PdyoD4EXi97p6XfURuO17I5Xd0BIsgVLvpk63BWuJ+Ud5FVC+21B05V7vBaBHIXrTlyOPY0+hmnoQrg6KvZSy71QPgZz0nfeMcvHVmjyycZdEiddG5JRWvpPznlYsX5uKXZD/cO/G4gwJ5lLGTE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB780315.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(6133799003)(10067099003)(261009223027099003)(261102124527099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WldWRlh3MzhoT05kbUYxYm9UbUoweWV6YmVYN2FOazkyWGpMcHR3ZmRUR3Nz?=
 =?utf-8?B?aWg4ZkYwdkdqNnhyYmNTS2haK1lpeWFKcmludmtpT2tCelVtcElmeThUMWNy?=
 =?utf-8?B?Kzc5SHR2MXY4SlRIZllkTit4MmRWK2pNQTBXVlRBaEdHN1JCWWE0YUZkY0lF?=
 =?utf-8?B?bEhJNFh2dHhRZkU3RitKTUUrcFV3Q3RHV3VXTmF4MTFhL2Y1TG1CaTZyMjR3?=
 =?utf-8?B?N3RGanVJK3BJZTU0RStzU0ZJRGk0ZDJ5ajdQeTRyTURLU0lUT0p1eVoxSVNh?=
 =?utf-8?B?dkZ3OUxhK1NNVWJJNVhjcVVJT3V3NXE1R3RyQXhnazVWSjZWZlZDUlhrcy9U?=
 =?utf-8?B?RXJCL0JsbXpiam12U2tvbnpabU1wdlVwOVhFUm01WE1ad3hlckIyT0lqS1FW?=
 =?utf-8?B?Z2N3ZkoycWE1cTNmcllwTkRQSlZpQVZYVEp5Tmp6a1Rvb1FvWDNrNGFKMGw4?=
 =?utf-8?B?bjl6aHc4QTBPWlFURmtWS1JsTURUc0lZMEliSWtFMGdpS2ttOGpvTnc0QWEv?=
 =?utf-8?B?Yzdaalo1UUR3ckt2a2RoNWR3VHJaK3NkeGRlcmRQTTYvVzByUEFXSmFhN05n?=
 =?utf-8?B?OGRCNmlsYXBlTHQ5OC91cXBkeHBrNjFjQ05icCtySWxzV002SlhkeTZQcUVt?=
 =?utf-8?B?Z29heHVWWjFLUHdmZHVFTDNJNGUyVVF0V1hNaHZOR3NZSW1OQXVTSDZzNFgw?=
 =?utf-8?B?Ri8xZXptRkFJTXFlY0FPbVZuVXUvaFNYdHdrVWNndW9rYWp1R2NEc2FXNS9S?=
 =?utf-8?B?WFIvajQ4N0RLNnljMzRXS1pyNWJFb0tIU0p0aWJZM2RMRUxyZHp1WGI4d3Fa?=
 =?utf-8?B?WTM5cXl1c1cxRU5sMEJaWUEwS3B0M0VEM0JxWUUydnhCQWpwb1ZPNTROWkRY?=
 =?utf-8?B?ZVJHajdwcE5lcUJDVU5wODVXY2NkdXdTWXVYQWdKdVRwRFBma2M2aU02OGRJ?=
 =?utf-8?B?RVk2OUJxc2I3dDlwQzBHSEJ0TStoRG5HbkpMQ3JtTTZWcUlPQkloSU5HTXE3?=
 =?utf-8?B?azF4U1R2VzdLYldkcjJ0a3hGZy8vK2hzNHFaVDhWcVNvNURya28xS0RzVFJk?=
 =?utf-8?B?RlpoZFhqTHArZzlNVGU1cG45Y3NFdGhDQ0xDendDa3pSZHc0SWh4d1htWFAz?=
 =?utf-8?B?Mlk5YkVBMU9Vb2xPRWhPRFp1TlJCZ2dYQS9iM2dRK2lldjlZdmhyaEphQVlr?=
 =?utf-8?B?Mm4vTlM2eSs0L3BYL2VlNmVUK1F0UXFkb3VHcmQ0RHRZTkw5eUowQ3BkY1Jr?=
 =?utf-8?B?eDFQN0FvZGlyODNETXE1bTdJVnk5ZHJOWFI0SmMzNncxdHNhZWc5bzNzY1Zu?=
 =?utf-8?B?Tm9jOWhKSWk5ZktkemJzNlNxaHVubzFuY2RpaHlhQ2kwbC9XZkNlQzloSUF5?=
 =?utf-8?B?ZWN0cDkwa2hRcUZSYmRxM3hUUzdZTU1HaFdKcVlybmdBRmhmN0MwYWgwV0li?=
 =?utf-8?B?L2pNbEgxeUlIUC90ckNIbXpwRFBkMWRPZWZpR2ZtT2d4cG00Vy9iWGhxbUhs?=
 =?utf-8?B?eDFNQXk1czk0MHRUR2RIeVZ3dHN3S1ZuSGxCTlFlUUlXaStkUU55TlNKWmxZ?=
 =?utf-8?B?dUNnQ3pHSzl2WHZneEFhdDdVY0hCRW45UDZrZlB2OVVycjB4RHQrelY2WGpZ?=
 =?utf-8?B?Y1VqZTE5M2d1YUhtQzhnSVRjRDRXUkl4WkJnUjBzenhmZUgweUtIL1B4dFkw?=
 =?utf-8?B?SVdrSHJrNEE2QkhEL25SczRGRm1BNnJwVlNkTGJxQTZnNUI3RHhrRHZjT21G?=
 =?utf-8?B?b29kTEw2cEdFYSszdjVuM1JXa3k2UU5uYXRIK0RBcU1GTmtnMHJrU013V3ZY?=
 =?utf-8?B?cUhaUm1IWGJDclVmT1o4YytWcXZvZVM5MGNaNklDVDZpSnNqanpOQm9XbEN6?=
 =?utf-8?B?ejBzSVVNcHZ4endPYzN0NjFaaWFjTzB2U2dpczVCQmxZT3ZXOUI2dE9uS2Nk?=
 =?utf-8?B?QmxwMFhudlo5YXZsR0E1NWtJOGFBQTlxWUc2YS9lWWtqQm85Zk5iL255ckFk?=
 =?utf-8?B?SkdXQS9RLzZqaGNqdUlCeUN3OTg2dS8xS0x3eTZmS3RpMTBXcDlxTXByUElj?=
 =?utf-8?B?anlKWVp4clRCd1gza3Nad0lGbTU1VDhQUzBldVNIeHI2ZEcxSDRlbFFCQWxy?=
 =?utf-8?B?aEFyb0NlaW1tRHJjN0ZUQ1VFZ3RjL241MlBGV1lPaS93d1J3eEl5Z2drWDM3?=
 =?utf-8?B?eitPTDExT2hqWkJmRUJjK0NmWlU0alpvM2l4YmRXZDJKUFgzT0h0TXNSTEJR?=
 =?utf-8?B?THcrYmJzelRxRDUxc213aUVNc09aeXB6UkFTczQzNE56cC9VckNoTjJNYWcx?=
 =?utf-8?B?aTdselRWWWRxT2RwYUFDbGR5b28wdlVoSzdFRWxxL0pQY3lTZ2Nkdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9c3c3c-8858-478a-fed9-08df3f0cd689
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB780315.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 09:27:28.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eg7An99Hdow7AP6ZEb81FYj097+N0COKmnWrywO2hiwvmmMuwk99xPwklhxjnIM4POgFZjICow4Qw2G6ZdX2cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7292
X-purgate-ID: tlsNG-4011c0/1794302853-512C8CFC-442D15BD/0/0
X-purgate-type: clean
X-purgate-size: 5544
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-06 17:17, Roger Pau Monné wrote:
> On Wed, Nov 04, 2026 at 02:46:28PM +0800, Jiaqing Zhao wrote:
>> The PID-based device model destruction path returns immediately after
>> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
>> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
>> port because the old process still holds it.
>>
>> Wait for QEMU to exit in a child process after singaling it for at most
>> 60 seconds. If waiting fails or times out, log the error and retain the
>> existing domain destruction behaviour.
>>
>> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
>> ---
>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: Roger Pau Monné <roger@xenproject.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Penny Zheng <penny.zheng@amd.com>
>> ---
>>  tools/libs/light/libxl_aoutils.c  |  8 ++++--
>>  tools/libs/light/libxl_dm.c       | 45 ++++++++++++++++++++++++++-----
>>  tools/libs/light/libxl_domain.c   |  2 +-
>>  tools/libs/light/libxl_internal.h |  3 ++-
>>  4 files changed, 48 insertions(+), 10 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_aoutils.c b/tools/libs/light/libxl_aoutils.c
>> index c2d42e7cac..977a2705a8 100644
>> --- a/tools/libs/light/libxl_aoutils.c
>> +++ b/tools/libs/light/libxl_aoutils.c
>> @@ -628,10 +628,11 @@ void libxl__kill(libxl__gc *gc, pid_t pid, int sig, const char *what)
>>  
>>  /* Generic function to signal (HUP) a pid stored in xenstore */
>>  int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
>> -                        const char *what)
>> +                        const char *what, pid_t *pid_r)
>>  {
>>      const char *xs_pid;
>> -    int ret, pid;
>> +    int ret;
>> +    pid_t pid;
>>  
>>      ret = libxl__xs_read_checked(gc, XBT_NULL, xs_path_pid, &xs_pid);
>>      if (ret || !xs_pid) {
>> @@ -640,6 +641,9 @@ int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
>>          goto out;
>>      }
>>      pid = atoi(xs_pid);
>> +    if (pid_r) {
>> +        *pid_r = pid;
>> +    }
>>  
>>      ret = kill(pid, SIGHUP);
>>      if (ret < 0 && errno == ESRCH) {
>> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
>> index 511ec76a65..ac1db9fe6a 100644
>> --- a/tools/libs/light/libxl_dm.c
>> +++ b/tools/libs/light/libxl_dm.c
>> @@ -2859,7 +2859,7 @@ static void device_model_probe_spawn_outcome(libxl__egc *egc,
>>  
>>      /* Ensure our QEMU command line probe is killed. */
>>      rc = libxl__kill_xs_path(gc, dmss->spawn.pidpath,
>> -                             "qemu command-line probe");
>> +                             "qemu command-line probe", NULL);
>>      if (rc) {
>>          LOGD(WARN, dmss->guest_domid,
>>               "Killing qemu command-line probe pid from path %s",
>> @@ -3420,9 +3420,10 @@ out:
>>  }
>>  
>>  /* Generic function to signal a Qemu instance to exit */
>> -static int kill_device_model(libxl__gc *gc, const char *xs_path_pid)
>> +static int kill_device_model(libxl__gc *gc, const char *xs_path_pid,
>> +                             pid_t *pid_r)
>>  {
>> -    return libxl__kill_xs_path(gc, xs_path_pid, "Device Model");
>> +    return libxl__kill_xs_path(gc, xs_path_pid, "Device Model", pid_r);
>>  }
>>  
>>  /* Helper to destroy a Qdisk backend */
>> @@ -3433,7 +3434,7 @@ int libxl__destroy_qemu_xenpv_backend(libxl__gc *gc, uint32_t domid)
>>  
>>      pid_path = GCSPRINTF("libxl/%u/qdisk-backend-pid", domid);
>>  
>> -    rc = kill_device_model(gc, pid_path);
>> +    rc = kill_device_model(gc, pid_path, NULL);
>>      if (rc)
>>          goto out;
>>  
>> @@ -3454,6 +3455,21 @@ static void kill_device_model_uid_cb(libxl__egc *egc,
>>                                       libxl__ev_child *destroyer,
>>                                       pid_t pid, int status);
>>  
>> +/* Run in a child so waiting for QEMU does not block the libxl event loop. */
>> +static int wait_device_model_pid_child(libxl__gc *gc, uint32_t domid, pid_t pid)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < LIBXL_DEVICE_MODEL_STOP_TIMEOUT * 10; i++) {
>> +        if (kill(pid, 0) && errno == ESRCH)
> 
> Isn't this theoretically racy?  How can you guarantee the PID hasn't
> been reused, and thus you end up killing an unexpected process on
> further loops?
> 
> I see you hook this up into the events interface by spawning a process
> that does the spinning, have you looked whether it's possible to get
> PID state changes as notification on a file descriptor?  That would be
> more natural to hook into the events interface, and would avoid the
> race mentioned above AFAICT.
> 
> Thanks, Roger.

This destruction path already identifies QEMU by PID read from xenstore
before sending SIGHUP, and SIGHUP is only sent once. The wait loop only
checks if the process exists without sending any signal by kill(pid, 0).

PID reuse is possible, although I would expect it to be very unlikely to
happen. Even it happens, it could therefore cause xl to wait for an
unrelated process until timeout, but would not cause the loop to kill it.

I agree that fd-based exit notifications would be cleaner. However, pidfd
is only available on Linux, FreeBSD compatibility need to be considered.
For this patch, I would prefer to retain the existing PID-based approach
and treat the wait as best effort, with notification considered separately.


