Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FA6606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 23:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=M5Lghifp
Received: from list by lists.xenproject.org with outflank-mailman.1491633.1692355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT64g-0002Wg-8D; Mon, 16 Nov 2026 23:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491633.1692355; Mon, 16 Nov 2026 23:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT64g-0002WZ-5Y; Mon, 16 Nov 2026 23:25:22 +0000
Received: by outflank-mailman (input) for mailman id 1491633;
 Mon, 16 Nov 2026 23:25:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xT64e-0002WT-Ii
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 23:25:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT64d-008Acy-Rb
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 00:25:19 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afb9081-2eae-0a2a0a5409dd-0a2a4506d30e-24
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:25:19 +0100
Received: from [40.93.198.34]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afb90dd-195a-0a2a45060019-285dc622793a-4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:25:19 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6326.namprd03.prod.outlook.com (2603:10b6:a03:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:25:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 23:25:14 +0000
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
 b=CKTtX0x1mjcvMpPE4I6U+Xd4QUzjbVdMTXrzu/bcG/cseeitx6CEiR3nRuZ1NzyMNd6rBqXIg2g5OPHFctG8FlX4GF9vbkzwuTS/A5T2hQ+0ICbacvY7vK8tidGfEw2ceLJzu2Hb2aWSCpP18w8k6J+X17PJlwT4Y4GkW8M00avAlHoE1jtUqkkUiXFPGkZ6yJpUTfT0v7hdVJrK6f6wnvvB8LCPNKKDL7LYESw6pyqCF058QwnHQNG/MZ5PZkDsrD3Pptu5/M3jz8b6ucp5DKi6CTgipQHnpO/63rTcpHe0cmQx0hcy5TNUEXhwbcNch4uUf/4Hd7I5+KvGLbSfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1MieE04h1d1YUCwwYZfaQdM1lJBYKI81zEmpvCXMQ4=;
 b=VdECoZrS31F3rzO0eIRUOiYitshLlAlQ/P+COfihZ9AQAvF23zOH+F1965XJQALBRzp9TcPiUNUcC9w4buf0jPfX1eSja4XKtnJHhNkw5ifJEpSI5NbMZAh7dOlFrGLgElcjp6XZSFr5nyhvoW5tf8HByGaGeRygUDiJN0B2eJ2o/i/bvWClTFdW+UWNyMl1Ps3ioXGV3bcZ7Fg59B+NSt4uUGMSvjWraM9EmPUxsKSKG770iOMPhzlj6TOp6Lb6/1ttWCeWLYfLL2sWKbnazK9++TaCANccVmE9PAZvcQGPS+L9IAk54Ejls0GFTns7YoKRqTwSVnkwDvgKAEyvXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1MieE04h1d1YUCwwYZfaQdM1lJBYKI81zEmpvCXMQ4=;
 b=M5LghifpULH+Wt67wnEfEu9qAwarYAB7ee7irVwdAYzdBZYKkHvLquF5umP3brZBW4i9i5Qv71D9ZXi3vqgguUKr+MiTa+DOkfen2Y6HteplO7Tux3yxRCw8AGW/+7ADTJNYf86xDJhYIwDwWNQjyKzDjCyxbmO7vpyJrPEX5Go=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6c2738e3-0488-4b7b-a11d-f5e014cc38f7@citrix.com>
Date: Mon, 16 Nov 2026 23:25:10 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/ocaml: Add an uninstall target to the bindings test
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1794839076.8631fc262581453bbf619ec5b2062170.1a1e4bedd9b0006d3f@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1794839076.8631fc262581453bbf619ec5b2062170.1a1e4bedd9b0006d3f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0288.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: e6924f42-8a56-4286-b712-08df4438ddea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|261028144727099003|261102123227099003|261026121527099003|261022105027099003|261026140227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	iPHNexXiVAMdybO4HZI9xdUvQgHvOsfEskX02+PqT5Rdj7Bb/xTy9jRmQqP5mqf4FOyrQBypIOLNw9H/5xoVKpCqf4K9bzW64b4hQtQWdA/jK9HDeu0JTZ6BSvjVmjOGbM5Ie9v7uSPCZ/I0bKfRtVUdIZ34VtdQyEW/7WYzq8GE9vDK5e5L+EOrdWRQZzyiyzW0ur4Baj17u2S5wFDiwoBn8aP9K2JvgkTBDpSWg8UQcbZ2GkphRi7KFwvnD9OgMkWw9BR9FRaP2liNWL/yqXK/5KvZ1H5qodSBexGk3b4QD9BQkGDzEU1WeUF3lL3j2UrRg5sxNElakVT2Y0i/MDKhezavAP2KMWDRJetviDhcGI2XT5lXXJspxqa4JfAgtY1C9u520I2JrnlWLA0xX8gbOtEPxplX+q9WNYxfxUHObkVXt4E2IKdyGUkNmdNM/+tZMfnmlpCZjd9WWawhWnFCFn2ftUQI9stVrEO6TqpTz57OL1guhrDEAIEJX7gwdd3EF2M4Lu8+BGGDZO813Ckc92wgWm9Wj7qQMNq6BktpQ4q4MxuJQFEy7KTmg7vZOxj+f52yP8JPqjteA5moyrm0LU8V3KBgK4mTV0HArVUYuzuebtQXq4fVQCzdyAFK/iv7+2+6UQFm90OkTiW89+pLwOfMBLag+VQDjaBSSCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261022105027099003)(261026140227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzlkMjNtTkNGNEdLMVp0SHBFYW9yR0pKYXlNNnM5YVdxMFJaQy9yQllNZDAv?=
 =?utf-8?B?R3Npby9QK3EweWxpZXlCUlJlRGlmekkwVWxUUE9RLzdheG1aRjkxOHNHZmRM?=
 =?utf-8?B?M3N2N3dFV2d5eGUwYVBDOUZGRXRaTFNtMDRSdE1pcGNKTEs1aVpnVXdrWU02?=
 =?utf-8?B?d1NvVzdOdjFFcWJSTERKZWNUSHpZZkFyMGVmVzBwVGxmUWd0dmNSbVhSUjBr?=
 =?utf-8?B?YnhoQWszbkUyeTZmM2E3M1oyemFLcmtzVVRZZFNVanBOb2IwelBVSjhKT3Vl?=
 =?utf-8?B?ZHg3TFhDMENaQVVOclY5UUVmL0RkemtRZUhvQ3l2WkpuTXM4d0FoTEVUQWFC?=
 =?utf-8?B?cVR1dWJwVFJBdXlpZituVkRvMGU2QXZzb0JvSnE1TUtGSVd1dW9LTXdsUmgz?=
 =?utf-8?B?cmRTZlRBanFUQmprWHdld2p3YThYUDVzTUdxejlsN3pxdm0xdE1EOXdiWTdS?=
 =?utf-8?B?VUJrNXZWWXpZVzZ0bmUzaHZNeVRrb24xYlpSS1dGVDllMEJPQ2FUMmkzZW41?=
 =?utf-8?B?ZCtmeXRkeXhoaWFmQXVkSUpDVUsvOEZDZTViMWhuRi9nNTZWbmQxbzJsaFdQ?=
 =?utf-8?B?R0xsbUtMSmZVdnNGVGpTYlF6SVlPWC96UUE5QjVFdXFvOVRkd1N2cHNyNVE1?=
 =?utf-8?B?VWxxQnViVVhSazh5MkVSUnFZbDFza25veExib0FjRmpWOVUrb1NEQ0ZHdnpu?=
 =?utf-8?B?RnhvQktMdDBMam9VdjJ2V1R4b3cwQk82KzNVaDRNc2p4cVpBQmZHQ1MzdUpE?=
 =?utf-8?B?Y0pPN0pWczJsc0laSEJhZDd6MHVqMW9HMDRsdEs1bFd2WmJ5akFncnNicjA3?=
 =?utf-8?B?dUJYL1NsNnZtU2sxeTJBYnI4T09MUHZ4ekh2MURkVHFZaC9MbkdmSWMxMC9j?=
 =?utf-8?B?VTczc3lWS0VESWVhT2NJLzRFbkdVblo5Z3Y5TTdiL1RUWWxhQzNtZExhWWhY?=
 =?utf-8?B?ZmJCbk9uRi9YNEtvNzdKU0RNV3VhZTJENHhXSXpiOVlZZElpeThxajBtcWVl?=
 =?utf-8?B?N2dKeE9xNHpuV2NudXc5QXBJV0RSREp0MURONVBxY1FQMHE4bi94cXl4L3pZ?=
 =?utf-8?B?Z3hGNFJuMS93ZVlFbUpOc1QxalZXaUExQ3J2RlRKNTN4MHk1QUVZRkVHL3NS?=
 =?utf-8?B?OXh5NU0xWEFsOGg3aUJsdWZ3TDVDbUhvOUxWV1B4YUlNbWl0U3FER2RYT0xq?=
 =?utf-8?B?NTJlTXZ3Y25OWEhCZXVrMUdldTVnOEdTZ2tocGpxNmFmZHFEbktwRlN2ZVd0?=
 =?utf-8?B?NFdjK2c2cjVKUGFpczhRN3hPcm1VSGQ0cGZnVmt6K2Rpc0lpMjNzNWs4dWNL?=
 =?utf-8?B?ZURld2dQMlIyNmdmRlVNOEEwUEUwUXdjeTZoVHh2VGk5NDdtUERQbjdxT1RO?=
 =?utf-8?B?MVdzS1d0MDBTVkNYRmNUbEdlZi9OL0JDS09ja2VlbVdZa1djajV3MXRYQ3JO?=
 =?utf-8?B?VENwTExwbXhWUDZKa2VEbk5qRkR1RXo3Y2pFWmphdkgwZm8waVBLSUJJMzlG?=
 =?utf-8?B?ekdQNmV2TGxpb0gvL3lFR081SGN6cG1CMWd6MEUvdWRuWXVWOFpFaWZuKytr?=
 =?utf-8?B?ZzA3QVhhZ2xMR3pXVFFzQkVpNGZ5VTUycTBrUWNtNmZEb2NZWkZ4VW55WkZO?=
 =?utf-8?B?VDJDSnpXSisrL3l4UEVGTjI4L3Q2dGRNenZsU0hQODNyMEZ5TVpWczRYdysr?=
 =?utf-8?B?SXgzTzFjTllRRy85Um1UMkg3bGhxbk9MeVQ0QWkxS1F6U2FKNzZRWEtIS3pv?=
 =?utf-8?B?dTVrTHN0MXkzQ3lOR0l6am1WZVJPdDBTTFpqUHFqU1IzOXlCQXZ0OHBuVkUz?=
 =?utf-8?B?QkhUbVpPTktIRXFSWGgyeUVtTmc2dWttZGFyNEFvZWoreExQOUlIZVcyVExi?=
 =?utf-8?B?VEhKR3ZHbUk0MCtDMlkxbGxYWHNEd2dIajNpWWY0eG9sakRXNUpjeWEveUZl?=
 =?utf-8?B?OURYZWxrdFFvZ3B0dUFacEpkczQvbWdaS2kzUG9hejlFZ04xS2lHU0w5WXpC?=
 =?utf-8?B?SEJic1NDaWZCYUVRNTRVOVFBN2oyMExoYXhhSmVQTmFEd0QvbkV3UWZkVDhM?=
 =?utf-8?B?YXBIU09raXV0M01IU0crWGRMNUJnUlBEWDhFMUNKVGlnTHE0SXNTQ1ZpdmpO?=
 =?utf-8?B?RCtKRVlaOENQM0lOTi9RQThRNllqRTNNMTd6V0ZVYXJzRm56UnhmOVcyMmRn?=
 =?utf-8?B?NWN1MHhIVWhhbUJSakNnYUZGcEhpM3lMc1R5NlF0dVVqQ2hKNWJPeHZ2SDVE?=
 =?utf-8?B?RThjZHJHTjdvZnVKUmRsaU1MWGp1SEl3K3p4N3FVNkF1ZEJQbFJjVndFR3JN?=
 =?utf-8?B?RjhDK0lmMDdPWmU4Q0NLZDQvUDhwVlhTU25va0hLSXBULzRFZFk3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6924f42-8a56-4286-b712-08df4438ddea
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:25:14.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBqXou0ttuiUUzc6uEZ/b42wKmKLrVYnrFmjgMJ1Rr+0iEcQIqvREXY0gJSk9il7bfKqHljv5hXwclLiHwf5WX0rxUCDTFaDzNwAIbxIZd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6326
X-purgate-ID: tlsNG-16d1c6/1794871519-F420077B-155E2885/0/0
X-purgate-type: clean
X-purgate-size: 614
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/2026 2:24 pm, Julian Vetter wrote:
> tools/ocaml/tests/Makefile calls into bindings/ for uninstall, but the
> bindings/Makefile has no such target, thus 'make uninstall' fails with:
>
> make[2]: *** No rule to make target 'uninstall'.  Stop.
>
> So, add an uninstall target which removes the test-ocaml-bindings from
> $(LIBEXEC)/tests, just like the tests in tools/tests/ do.
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

But, we should really just remove the uninstall targets.  They're in a
perpetual state of broken.

