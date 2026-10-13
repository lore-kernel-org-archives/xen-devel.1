Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3F8CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 11:41:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447025.1663181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGasJ-0002oT-6H; Tue, 13 Oct 2026 11:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447025.1663181; Tue, 13 Oct 2026 11:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGasJ-0002oM-31; Tue, 13 Oct 2026 11:40:55 +0000
Received: by outflank-mailman (input) for mailman id 1447025;
 Tue, 13 Oct 2026 11:40:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xGasH-0002oE-M9
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:40:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGasG-007hiT-J9
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 13:40:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ace18bc-2eae-0a2a0a5409dd-0a2a450a8ef8-12
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:40:52 +0200
Received: from [40.93.196.11]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ace18c2-f2d2-0a2a450a0019-285dc40b3eb8-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:40:51 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 11:40:47 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 11:40:46 +0000
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
 b=bTP8xZvPqo2YCGvhQnY8iftheeB76kVbM+NrI8QLYi/eWr+vl96cfZ0LeW0ugRMSJ672N0hhmgduc4t6eFRrLwRhLxuKN1F5UAt0mmxxqJtsHSG/EpDiIPujp7s2r+/auz5mACp3bsMxQPowQHBZbTzqoOCNhBC0a35AnWzyqmJfni0E45JKkbBjzeeAqMKTKgGIBEowllayWaHncpjDfwAmJSPBsjH1F/P3VVTCaDFdOleKpMb2/mC2j2zq1rC8iaqnUaZhgveGpJOMFNrMJnNVrHEbxskfJn9NGCjU+V5ajbdcKztQF11e/4BwEKFQpvt59U7WtNvybSfj0L5bIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x78XjEP0pIg/q5IyayNJO4LmQYDgFMyINQZGULwqKkQ=;
 b=DI5qbFWGTFbFDptnd4yDsLm08yBAirhswFuwZQaa62WcykkG0/dm9bZ/RQJXVXaCZkYe550mTUnpU4h1vBK62nUGXAI+CnGUWs5XZFANNxz3IuwNp3AWQ1PJvoc70yPEiaBVts27ky6TZOgcZvdX+RAWyrV7L50492EGIbSkL8BOorQfGfF5bqOtdRQkxgZj75Z3pVu14xLHIvPTdjLSVG/X0hHtf6G+90rg0ecG3yXU/WgE6O4LHWbZmCl6qX0+xHHg+n0UVot2OJqUKy52bAxHUi5FcN0dhAMY5Z6/nOeSW6AyPWs1s2NSVsIkhqEhiGkfTtLt8PfNpjQ8Y+5SnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x78XjEP0pIg/q5IyayNJO4LmQYDgFMyINQZGULwqKkQ=;
 b=jX5NlKxc4epoyeGtXBcK1wG8bQ1rTx4OU2tiY8Ow0G7uSw0zMQ8i1uX+KcgH12SDEsy68nYri9L/hmXFebGeD2CtPp75/pw54S8QpHwiPLYG9TljqGDbOLXgtqr09fs+98JKFLqHSMyW+3vYRx2GQXRTHz4MIOHDmwR+fFqAk84=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 13:40:42 +0200
Message-Id: <DM3OKOD7AD0Z.2KNNLH3OOL78V@amd.com>
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Sergiy
 Kibrik" <Sergiy_Kibrik@epam.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] common: dom0less-bindings: introduce XSM labels
X-Mailer: aerc 0.17.0
References: <20261012101453.949907-1-Sergiy_Kibrik@epam.com>
 <DM3LCK9H20XV.UWY7ZO59FMAE@amd.com>
 <acbc8b4c-0192-4c0c-929a-f532ad01502c@suse.com>
In-Reply-To: <acbc8b4c-0192-4c0c-929a-f532ad01502c@suse.com>
X-ClientProxiedBy: MR1P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::9) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|DS7PR12MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e1690b-3160-4d79-c854-08df291ed27d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GG6fYQPmBJt0yYQ9M3i+1ZmWJr9J95kCIF5ZoZ5NuJvXJOxWhZZjIZXAe9v908d5t/XAtnqCei6bqpUaGgza+gECQ3VOGet5gtzbVROUgXbJ5+RigpGP4bcYQn17bl8JoeaZV6abjBWUCyS/E/dqJqCAQ+RveEOrTVtZ09i0/WWiXvLRRRlj3ell6lC8lBinnBnOyi5mTg8R/mBUojJiDe/0pDxNXlvxjCzPjeObrHcJB+hkiFW8Rl8Tbd4PxTaZrqYqdfNIcYgbYbNSry8bT+BK1Mr96FkXriw2rp9bqjCQBKup60g+WGh9ou+RkdPMJwBUVIuRiswT+Fkddp+SETbYv8LohnG0Opv/EcQvN5qF3vpdZ6r8mMhWBE6/AKyliWyB8S9vEqEa3kZhv5x1BisoV3TzRtTBvEvA6QROwkl+w4Ze2ZmQNKfwPFUKb1GjVBkgtLe/LH6T9gmVNxWlWwFd8qEgpP+GuCWfsti08gtkpCuy7AeLjUPTw+WRmKN+oU9ATQgi9Rb75jbIb6jo6vZubod4STRbRI5zz0Sim9+6O4+H6iNcpofnFGOJ0br2V/iBTeaY++1ZpbWQp1jNypWKL+se9as5h5RzVVlPT4MfTJziFW+cL9binhEmpjo3cvkQJOfG3tPVosTlCJTcFDgxTSmvzf5v4yqMedaMM90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGZtcmdCSGFRL3ZOSW5OUlY2ZTlQRWk4d1pCZzNrNjRjRGgxbDF2S3d1b0tQ?=
 =?utf-8?B?WkE0RjNCQjJxazAvc05mT0pXVm9GNDA0TGVmUEdLeU8vbFBBa0tTYXZhQ3ZV?=
 =?utf-8?B?cjIrYnVZZHNYV055TWFpTi9VSWVBWDFic2RmOVplUHA4SjZDL3hXYlFKWUUr?=
 =?utf-8?B?c1dINncraXdGZzBpRFkrN0thNVBsQWN1b3h6TEVONDh0MGJZZWp4QUI5Z1Bi?=
 =?utf-8?B?UjBXTHZ6c0NpblNPczdXWDJ4SlFKRWdzSnBqUHBvV3JYcDJtS3NNb2g5cmJw?=
 =?utf-8?B?MExtUEI3UGFrMzhLSEhtREFNZGtZWVNiZytDSmJQTVBaV2pVTHJtSmhwT3py?=
 =?utf-8?B?SC93L2tCVmFjelJPUi9QV1ltUlhZeXoycXR5RjdRUHRKU3AxODBRSjkwQW9F?=
 =?utf-8?B?VGNXTzhWRkJEL3g2d0xacE9VMlcwZ0tKWUFMaERlNitYSTEvUWFaS010UGVQ?=
 =?utf-8?B?T3F0N3puNEVHdHZDUjYzRE5SY0tLbTBtRUt4VTZnSStxR2ttay9GZWxNeity?=
 =?utf-8?B?bEhOK2ZHYndCVjhlSVVOa3RHd2NxbE5QVWlmTW9VcmVkKyszbS9CamYyMndn?=
 =?utf-8?B?bW1XMmI5aTZJKzNUSFBoNTAyaElVUjJXYUQ5eERPRGhNVUFDQ21GYURrVytB?=
 =?utf-8?B?czRyVG5oWmxFaGNNYW9FdnJJOEg4U2lUczZ2cW1TdGpZZ00ydmV2c1hhY0RI?=
 =?utf-8?B?QnN2NEYwYmQ2TkNUVnFpVk5xSEtsRGNxTTFRQTVDcmt3U2lHZW5FbGZneFI3?=
 =?utf-8?B?RVFDSDVRbUpOcDAxN0tLcDNyUnJsTG8vSkJpQXI0ZmJzY3g2TDZlakVzS2tD?=
 =?utf-8?B?b2hhUFdCYi8xeHBMdEFTMVBPMGFTN0pjdE1lcnRCcHRoa2RsRjlrcXVqQ1FH?=
 =?utf-8?B?aWRhNXJ1VXBQbWdzYUhXdHVFc09BZWpNbStseFZtZFBYYUtGU2F5VXVWOWFw?=
 =?utf-8?B?NzFYNURZU3NVSjRBZzdSOFZmc0NDUFpZS2x0OWY5Q21NQ0xlaTdXMlhMdDNR?=
 =?utf-8?B?bVNTb1JIaFVyS3puZ2VyM0ZJVnc1V3VaK0VEQW5sTWtqYlBwZmcrcEF6R0dD?=
 =?utf-8?B?YmFaSmFpdDlMUWpobHFPa3dKRUVMMUtSM1h0MTh2R05BOGdIZW9sR1VSSHpJ?=
 =?utf-8?B?cFhGbDdwYlczU2hIYUMyaEFPUXpVNEdSV2VaZWp5Q2wrWS81cThiVGlrYmNo?=
 =?utf-8?B?cC8zeG5UK3BFSE90TUEwVHhocTBENTdxdE5jeGFHVm8vM01LMk90d1owTzFP?=
 =?utf-8?B?Vml2TTdlTUdLeVl6ZE5xK2VnWVJFL3UyazQ0ckJlT3FkRWJaVlErazZlcXJM?=
 =?utf-8?B?a3NFeFBSajhDNzJlVE0zWnJPQzFRMkxDbCtRNHJmTW5HVW5VUnNoUit1N0xv?=
 =?utf-8?B?Z0JNTFJTWk5PZTZMdnZiWXlIZ0RwdUc5dEQ5UFhTNHl4THZMK2hLVXRKR0lD?=
 =?utf-8?B?QTJkem1RVFFaYW5LOEpkdDVBMlc0TUhSejNNNng1NTArUFJWb0s2N3FQcWFm?=
 =?utf-8?B?ZHB6aDFDVmUyRGI1bXlnOHUxSncxbUNZcnpvcjBJTXY3S0F0dlF4ODFlWnpI?=
 =?utf-8?B?OThvZ05QOEVXczBJWDkzL2d3WjNPYk56d04rb1NGMU5wQ2gyUkFYcitiZG9w?=
 =?utf-8?B?d1MzQVBDam1IcTJaM3hiVU1qRVozTmk3U2pVVUs2cGdqcHArTlg4aEZtS092?=
 =?utf-8?B?eEFmUWM4b2YxK2ZRYys5NVlHa3JEMG8rb2dLb1ZpRUF2bnpBd2o3UkNRU3Zr?=
 =?utf-8?B?MEUvVjNGRVd0L2JxRmtwSVJVTGNwWWFrVDBOZzFLV1lSR1ptcWFENFV6QnFp?=
 =?utf-8?B?ZXpoS3FtLzZhSUFGaERCSFA3enBMUG41bTE3WE1WQXRSRDV5alpHT0RqQkQv?=
 =?utf-8?B?V1ZScHhxS2Iwd05YQm85MUhaTVkwelMwS2xKLzA1eWk4QW9tdVdqa2lGc3BF?=
 =?utf-8?B?R1pCNnZmajRJem5DSFhlMGRrSmtMa0JSc0kxZC9GU0NFdTR4RTBHYU4raEJo?=
 =?utf-8?B?SjhmcHllenV0UlB6RnNRTzdNRHkvV3NGaDNKODdNeC9hYUpXL0NlY2xKeTdW?=
 =?utf-8?B?Y29HQk5GbTlRLytSOWcyZVVXcEZNUm5wQ2k4YWx3Q0RlQ1pUcW1YWmYvamZj?=
 =?utf-8?B?R1NydXI0b0FxY0hsUVFlRk5KR0lPeEFJazY1bTM0R3YvMkFoemx4V3o5U0JO?=
 =?utf-8?B?cVB3UUI1M2d0cDZzREUzdjhwT0t5Z2R4ZFp5WmpiVnNKM1BWdnd6YnlLNVV1?=
 =?utf-8?B?d0YzNHVoVXFITGZuUi9va3ZadzFZVEtDVjVXVE14QXVhN0thWUQ5Y1c1SmJw?=
 =?utf-8?B?eHZqVVRXSEJJTDdMYzB6b3kzWXFPL3JqZUgrNklZMHNGZmdDRFNtQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e1690b-3160-4d79-c854-08df291ed27d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 11:40:46.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8YXGjzlpNhtcgVVjCyqyCm57x42gGDwQ41pP1k+aCFaY4oj/fidNXe13eg3I1VZyUV1sMZWiBasiUXbbtCnzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8232
X-purgate-ID: tlsNG-4011c0/1791891652-51CC3CFC-AFA69896/0/0
X-purgate-type: clean
X-purgate-size: 1153

On Tue Oct 13, 2026 at 11:17 AM CEST, Jan Beulich wrote:
> On 13.10.2026 11:09, Alejandro Vallejo wrote:
> > On Mon Oct 12, 2026 at 12:15 PM CEST, Sergiy Kibrik wrote:
> >> --- a/xen/include/xsm/dummy.h
> >> +++ b/xen/include/xsm/dummy.h
> >> @@ -823,4 +823,11 @@ static XSM_INLINE int xsm_domain_resource_map(
> >>      return xsm_default_action(action, current->domain, d);
> >>  }
> >> =20
> >> +static XSM_INLINE int xsm_lookup_sid(
> >> +    XSM_DEFAULT_ARG const char *ctx, uint32_t len, uint32_t *sid)
> >> +{
> >> +    /* dummy policy has no security contexts */
> >> +    return -EPERM;
> >=20
> > nit: Perhaps -ENOSYS? or something like that. It's not that any
> > permission was violated, it's that the real version of this function is
> > absent.
>
> Yet then still e.g. -EOPNOTSUPP, but certainly not -ENOSYS.

That'd also be ok.

It would be helpful if there was a guide under docs/ in which we state
what each of our errnos are meant to be in Xen terms. ENOSYS/EOPNOTSUPP
are great examples of such mixed usage that it's disheartening trying to
reverse engineer the policy from their use.

Cheers,
Alejandro

