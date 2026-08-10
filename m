Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81702C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 21:37:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387899.1629131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtXgQ-00058w-BP; Mon, 10 Aug 2026 21:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387899.1629131; Mon, 10 Aug 2026 21:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtXgQ-00058o-87; Mon, 10 Aug 2026 21:37:22 +0000
Received: by outflank-mailman (input) for mailman id 1387899;
 Mon, 10 Aug 2026 21:37:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wtXgP-00058e-6U
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 21:37:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtXgO-000nkd-82
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 23:37:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7a4457-e002-0a2a0a5209dd-0a2a4509abb8-28
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 23:37:20 +0200
Received: from [40.93.196.65]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7a448e-be1a-0a2a45090019-285dc4414e10-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 23:37:19 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5738.namprd03.prod.outlook.com (2603:10b6:806:fb::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 21:37:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 21:37:16 +0000
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
 b=mVJmranwl6HqirYdUYhbdGMocCTXc4aKKfXQRGV87CziVNI2JGI1eLPCgiqlyEG03uSSSp/jmlosQJOKShB8lxlsTxvqY0gskeDgIi4SsSFevsWRWFh1v78hKffKQvJcVnKqOURpBda57MJxThTY9dw5+swe7flZHiYclj7siXCATV8z54E57iDjIzTi+nBszPO+xqmpQJ99FgCv+kaVbZQpPK0BCvhHpG0O8pqSZ7jAtwlHWR288yuuj6M97S0suJSY6mUhjPIeWLyw2Soqvj7RxDo02JX1AmkriiowByIBono2DjUacxSidknQQBCOD5hreEU3/sxnT5xtkI7G/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM+mAY+O7i3CfxnsDVu/HXx5p6iBiKJNSROZuaBQNjk=;
 b=JE+Yj6aJpa130kCjG4b1AS34Ys8X+lIxvf1zN+lad60pfPtDxxBdIiLBQcU3RyUMbWxAZzpjciK8QRzHE+99ypSUBdOTv7hJ6CrrkEz2FrgKnAohdKsiUTsukONP/MLVsDUowanDECtoZQnhl6sMlMIrXErzEalVaJwc6LkDLLprBxoCKBSmPVqvE6X3/sOJHusKHRKgOjNNTm2vj2qCsgQKfDya5ho+/ytxgUQZOA37BtQUo9kGBYd/y4haSRxZAwQaaijDVsr6j1sDXGrtImOoRW6mIHtV2UhH0CeyYiPqbsRdHWpLK49NgwTfu6GM0U45aMJyObKUumviiinM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM+mAY+O7i3CfxnsDVu/HXx5p6iBiKJNSROZuaBQNjk=;
 b=jNjJ5IHaHz474zBYVPmIXcUlOcpaYGQmN9Fjw4ZRCUhILCgQ/rbbs48C/TWbcZWPApHkQsks3nD3zhcKP27uNEV93mStaFg1eUZ8Kdh6S+52E7phvpZNlvZ35FgzYIrldTx4nXRpcwlpoSt44DoFgAFO7SKHOeotCogfZgdHRCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <90f7a25f-4007-4f9e-b5d1-ab2b18ab59f9@citrix.com>
Date: Mon, 10 Aug 2026 22:37:12 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, anthony.perard@vates.tech,
 jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 5/7] xen/console: use memcpy() in conring_puts()
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260728065049.1318143-1-dmukhin@ford.com>
 <20260728065049.1318143-6-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260728065049.1318143-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0376.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3877b8-4628-4159-7d96-08def7278bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kd7CSzMDEw80YukTjoN8IJ3hGCA/fU4rbv01f8V36Ku4JbNKfNvyGsDiA0JAfmdgq73vvpVdNIRjx+Z42x8LYrkGbh2lKgVcCvinUtKTLcVlM05EaivmEXXMystNk6dwqPg8FVRUykAw3ZezkOX74OtsYbYn4dnOW9GzLZ+NNuv7yxJCgpMxIW7ZpbF1ftFgz6Lq9+O9TdueIBY16Nzcsctj2K/XB4EPg4gcAoi6EnzpFvJH6Cnyl0eTG615H/tnEZMcL2W3talwXZAP+u+M/zoX1dg/iTCrPQGghM9akqUiRyInEXsfyDqHtmmVoLvnhC8CLrbFMZlSwkgtLpt7gdcrgG48dROe6I1di1wk/fAgizHDUOXMQsu9/A2dIaqmMUMFlqL0JAaHmjgDTZmpoBe/CVHtOjs8FKdsKR25oYpgt+wGt2TSno0DXIhJWcJo92h7KXmtt0Cdw7Zsg4mzdtD1vZsS976eJJNBMeFI1ThQdvtYJ01LIUAIFEKVkeRoAaCzbhzfk/D0i17L8xM8E9BEyQuQvg4Bd0CvVhs+GTM5B+//HkX7mOO3aoviuYo8OqFrtYm7/ppbzOZ0BNsmslFNP8oNXMruTra8YRUPl9Vjw+8EmYuvJvIxzM4QIWMQSB/ZPrTdtn6mtNln04WiDv3gwz1z+++XsQFENydjGHA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjFEejZFb085NWs0dmtUMDZuNGpaTUFGQTFTZnRqaTJFTWJEOFdUNHErZnpr?=
 =?utf-8?B?cXprbFRjajJaZXlDUHhsVU43QnR6U0FsVEpsdDRBeW5uZ2tObzF1NVdIckVY?=
 =?utf-8?B?bDhtR04wVndZTzQyZjMyVEZ5b08wSUFObDhJaHpxNk1YeU1nZUE5TzVoM3Bt?=
 =?utf-8?B?ZkZKeVRSRHI5ZnJ4eWNWOWhPckpvOVo1SVZkRGJxR1FjOGhDcHA5bW9LdjBi?=
 =?utf-8?B?Mi9iTE4vbnZFZGM1V1BPckpBQjFJU3QvbWZab2JjRVhMeWd6L1I1N2dYbGxh?=
 =?utf-8?B?WDJQalpSU3NwNXV2T29aU2lDNisrSUpBSWwrV2d1RjB3OFhxZzM1ZGpvYWdL?=
 =?utf-8?B?WWExakFWSUVXb256cU1wNjZKalVDUzNxU216SW91anRodVZJNktQUzk1KzV2?=
 =?utf-8?B?WERFVC9ZSmMvQ3ZuRWd2K0IxM1hPSW94K2NPdW5QL29WSkVOSTZmSXpKZDZX?=
 =?utf-8?B?TitSSUF2RExNWHlZNHdRVXpKNU12ZCtOMi9WeTBhYmZTcUJMa3dRaU1TSHZl?=
 =?utf-8?B?S0lBQy83NUUvMlVBN2N0S2pZZGwwL253UmU5clBuTHVyRzFISklZL1oxV2Ur?=
 =?utf-8?B?NmVyeWlvVjMzaDRrbXRleUFDajROQW1iZmgvTFNJKy9XMWF4VDFQOGFXWERj?=
 =?utf-8?B?Q2lHOUZ6Nk5BR1prYTdIZjUySzJaTGNKWUJZMXdLUWNoTktCTW95Vzdrd1hn?=
 =?utf-8?B?Mld3YVRXdkltRDJkR1ZwdTlPL1dsc0todUN5MVdSRC9TTjJwTUxtSDNzM0o0?=
 =?utf-8?B?Z0MwZUR1TEs3SjE2R3JFa1VGbnV5QUNUVFZ0QVFPa1BubERUSlFaS2xuWnRJ?=
 =?utf-8?B?cE5WSktYdE1HSUphN3NSNndGRk9nT294QVJBK3ljazE5VUttcHZGc01rL1ZB?=
 =?utf-8?B?N2cwWW1UYThlOWxndE5KakRJVmhHcCs5cmVZL1ArNWtIQ2NLSDRlWjBIZFkv?=
 =?utf-8?B?c1dYV2NoWmg5WVVYREs5VE9ERTZaTkJlSzdCbVkzTWEyMVE5UmJTZ3VaR1NK?=
 =?utf-8?B?VkVUdDRlUStJNSt5ckRiZS81TWhwOUFNM0oyOGEyODEwRW1aTmxoQzU5eEx5?=
 =?utf-8?B?NkluazlWbXJUM08vZ016TEw2SmVoTS96bmRaNUtMVjZPZWZEL21SS3A1U0ZI?=
 =?utf-8?B?ai9maXhlWFRxMmJlSDQrM3czM1l2YWc0TmJoYXNzS2ZydFVYMmxQeGtMRkNZ?=
 =?utf-8?B?OURkdnRocWI2ZURBRmlXOHZ4dlFiT081cjhydmdoRSs0QUxLb0JDUktQeEdX?=
 =?utf-8?B?bVpyYWtpNEdlNXhzOEpCV3NVckZ5QSt2ZEE4dTI4SnFZKzdNTkVDcjdQOXIv?=
 =?utf-8?B?QlR5cmt1TElPZGZ0bC9UN1hMeEJ6bHBkQU4wZWoxWGw1WVlIZ1djYWUzbDhE?=
 =?utf-8?B?R2w4NllYL0tmajU2em1TY0hVWXR2VXduSHpqVElHb243MFBiVDNTcmRhY2hJ?=
 =?utf-8?B?UGw1VmtDV3ZmVURaYTZHanBMb21ySzdobE02Y3ZNdTBUYk1Oa1NrbzZoZW5I?=
 =?utf-8?B?aHRRK0pBS0JUWG4vTXQrUGFQeXpFZzFiSXNnSVZOOVZvTERWNThwZVNmaXJE?=
 =?utf-8?B?OGZ1KzdEOW9FRzVHWW1sTmlpcFNtR3lOZkJ1M2RDMWwzcjIyN1AwYnBCR2Vz?=
 =?utf-8?B?bHAwSitoK0cwZlIzVEJhNmVPVUlLZUk1SHlpYWN4SkV0aEdOZXlGQXUwdnlI?=
 =?utf-8?B?T3B3ektpTUhGTmZZa203YVlRRWFvSHRJSXZ5aDFMYnZPQmYrUjgwS01OcFZH?=
 =?utf-8?B?Y0haZXR2SmhzTk1ScW1JcXNtSWRQWFFIZ0l5aUdoN0xsc2pEZHpkSHBPYTRD?=
 =?utf-8?B?OTU3N1J4aC9aTC9DcnFwZk5RR3JXWjJKOWpZRHJieXNkb05pcFlqNHcvRWJ3?=
 =?utf-8?B?ZExjbUNyaXNURFVyKzNCQmlUa3BhakJSK1RCMThXeXQ4VVdveUJiOUlUeE1G?=
 =?utf-8?B?UGVIdElOcmZNU3I3UzJXRWRBWE1DWGk3UVhtVVg2dXdONitOczl4U0J3eDQ5?=
 =?utf-8?B?WTViUTgydjRVcFQ4QXBTVnJYU29pTU5vd3c4ZUxsc3BvUWJpdWpMR1RRek0w?=
 =?utf-8?B?K1NwR1VhWHFDQngxQldVekNNRXFqWTgxQU5xV3BqaHFaUzdielZyL1FCa3pw?=
 =?utf-8?B?YTRDMjg4aVRhNzBiQm1tTHJreXA3Q2crNXpSbUdJY3NKdm5Va1AwYVpYV0ha?=
 =?utf-8?B?bGpLL09ibjBTWExKMEt0YnNaQTVrN0Y4NXZGU2NCdGFFRWYxdXNTblJCTmtW?=
 =?utf-8?B?MVlHVW9oVVJ4UFZ0VTYvaHh3MkhrcVRPR1hobHVxTDJtZE03QmVLTjBvRytI?=
 =?utf-8?B?cmg4VnlhdVZ1TnJsU29QdzBBZkxYSjE5Q2N2ZjROamZHZnIyWVV4QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3877b8-4628-4159-7d96-08def7278bf8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 21:37:15.9238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGczisF4xSrIY2ad4FWh3MSYe3yIgax6l/8AEN2gR9dy3QaHdIcdpnK/FjNSJ4FdD6USDjA/xBsl0c19eNfYZlZ36agqIqOoZEkAj5tAiL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5738
X-purgate-ID: tlsNG-bad1c0/1786397840-3B8D1034-31B78E67/0/0
X-purgate-type: clean
X-purgate-size: 1698

On 28/07/2026 7:50 am, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
>
> Make conring_puts() more efficient by using memcpy()'s, rather than
> copying the ring a byte at a time.
>
> No functional change intended.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v7:
> - hardended len check in conring_puts()
> ---
>  xen/drivers/char/console.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 09282a7a4f8e..a1b8e5f5b507 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -361,12 +361,24 @@ static DECLARE_SOFTIRQ_TASKLET(conring_tasklet, conring_notify, NULL);
>  /* NB: Do not send conring VIRQs during panic. */
>  static bool conring_no_notify;
>  
> -static void conring_puts(const char *str, size_t len)
> +static void conring_puts(const char *str, unsigned int len)

size_t is the only correct type to be using here.  Anything else is
buggy and a ...

>  {
> +    unsigned int src = len;
> +
> +    /* There are no callers with strings longer than PAGE_SIZE. */
> +    BUG_ON(len > PAGE_SIZE);

... bug waiting to happen.  Switching to ASSERT() ok either; it is fine
to pass more than a page here, and all this does is screw over some
future person who has a complicated debugging scenario.

I have 0 remaining patients for the avoidance of size_t.  I will nack
any further patches I see doing it, as well as any further advise I see
given from anyone in the community.


The rest of the patch is fine.  Please resubmit while keeping len as size_t.

~Andrew

