Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E5E606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=tfvqJ73w
Received: from list by lists.xenproject.org with outflank-mailman.1492063.1692735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTExR-00022Z-Vo; Tue, 17 Nov 2026 08:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492063.1692735; Tue, 17 Nov 2026 08:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTExR-00022S-T7; Tue, 17 Nov 2026 08:54:29 +0000
Received: by outflank-mailman (input) for mailman id 1492063;
 Tue, 17 Nov 2026 08:54:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xTExP-00022M-LR
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:54:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTExO-00Ato3-VY
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:54:27 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afc1641-bab6-0a2a0a5309dd-0a2a45098b14-6
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:54:26 +0100
Received: from [40.107.209.31]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afc1641-be1a-0a2a45090019-286bd11f1379-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:54:26 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by PH0PR03MB6367.namprd03.prod.outlook.com (2603:10b6:510:a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:54:22 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 08:54:22 +0000
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
 b=ndXFZiS22AeRqmunO/F4e5HmH0Ij1GI8sT+4No4aYs0he8FRoi5+Ne37CfDkQ6PCUdhSx3Ce27vu28OklymubVsY69yyeEIkKPXTrutkzOEoc7s5NffCbLRjiH0bzGQ7577/4ccRddqKZgtwCX5ZX1pliL8VYad5wzk44VBKjDnYlyDxebZ8CVVBEAxCc4/6pjGjl02SFAtXZD7AiK37NZavx1yAMTdVTx73yk3Cvpl+AFdvN4q1vkgQ8lHvOz797+BTHqQYljGg/YWwoQWWziic+agqAYiLq0zgMQ0LDxUldjF5XjCLWk3zLVO4Lg24mblcutMYDJd5oMYLf/oMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmiqgiDYFoxSjOtyyJqsxA3hVoaD6n7O8Po7+IjXIe0=;
 b=AynqoV7X2aIBXcLnI/mufi7ve+tzTOQJq24dMFWDwJjITNqWYFh/47FPib90h91d9eqBD6gxXQ8TMud8y/toj2fr7t+HkFgbNIUi6DiQt8SA3IoTzq6P3wW0jvT9txA5o+domTl1FqOVvrIYWd4k20PpVMRS1r23APAYMagtPfk0Cf0u0BwpEeyYI70XDCt4nRwNW1FaU3JWC386Ggah/JMN+C5OeY1gSnzyA/8YKYgghnADwWn9OEZk4WHb0Pm+23u4Pgci0RJ67zr+z8uf3jfrPiCMl+fChnfND2U3SZhpPAtaMfLJdU6z+I3h3NvhYcUcWse3+msoU6q0YGpjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmiqgiDYFoxSjOtyyJqsxA3hVoaD6n7O8Po7+IjXIe0=;
 b=tfvqJ73w2AC8aKres71s6WAIxG+BHcoMNvcbUcH50DOv+igz3cDLiMYowAs9f6senm5SKHfK067qIwqUdNLsyi1cCCO6mq9eSuIlVWeFGkaEYpWJt/6qp47r0/TrroritEvYw2nTyFbdSxJtyDYidPoQidTSauEcOufJ53+sLbs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: jbeulich@suse.com,
	xen-devel@lists.xenproject.org
Cc: ross.lagerwall@citrix.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Stephen Cheng <stephen.cheng@citrix.com>
Subject: Re: [PATCH v3] x86emul: Zero-extend unsigned 8-bit immediates when decoding
Date: Tue, 17 Nov 2026 16:53:56 +0800
Message-ID: <20261117085357.375661-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <521ed475-45b0-4dfa-8b66-11d5f76a2a96@suse.com>
References: <521ed475-45b0-4dfa-8b66-11d5f76a2a96@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|PH0PR03MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2b5fb4-3f19-4a33-d954-08df44885f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zWVxb8RPS3pJ0pewnVec6O9zE/961V8EKkN6oozNwqLY3UX/oMJsqpaLvYjsIzaHqz8JPXK3dtHX7KLyIo6nfT7sb8hn6WwTogkeDP/OJqPlzSRUCzYiKIv8/osHeWhj4aBQc3xUFYGz7HskCumnBIRpsrk3zRR5LXWhV0LrcIIKWIQV1QRd+UJid+lecxvknTD+53K3gHZRIgVWT85Q5jkee/lJZuZAeiIhHr4fM6bYTEsxrN0oEO763S6fKdt3UZ2lGa6qFn9CwqiIujslurOusfO0qMnU/pWOh0WCT8zLM6rQ/VvImAT82X8zlYidlzyJnh/F9t1RHbZsTII9thLsH9uKaSYfEYMX9lr2mcCDic/927yg2hIcYs/O6rEqXabmjf9yXQiEz4hGhrN5+m0bjOqD0rmc+3oExb6Z7aP1XO8Wm22XswfmKxpNOSUyELZy1dVjMUrPJHC9GA6M7bOe2J1ujEs1rOrmF1d8GDx3CHOgX+upc+JkyKwDh5PJjdhXx4DjSHZCDMbvLD7FEt+oFldVt9X1eYnHZnLg+nsFXt65M6AjseCGINjInBUTQ8MfoDuT+0AEZuIiWQTcSVqO2bLMwKxG8y4m8uhX3sr67HcBfSSYIbG2whV6tHDsraWlnCEcIFu52Uu07G3U4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RdTPmxxa9VqfqrcERZ9dKDdWqzj5Q6ZJjS7NYd+P/p9Mc2a5v+e06FHyNrCy?=
 =?us-ascii?Q?5ViL9JPbdFQk2AdGHSMIuk4UaVeoo+Pd2k0tjCQsr0LWJfZQslsoTWamVmIk?=
 =?us-ascii?Q?S5Je/GEHmqV8MYnFsJWc9iV8YdiYnXeBXBBQ+Nhmc10TvcUmzjtuLhtezwIy?=
 =?us-ascii?Q?JqNkgqI8WpjXQFC1hU/B8G8540MAUfFLbWlYWk1FdJHlk/6QWU0flLJM42FL?=
 =?us-ascii?Q?bEPZlfBovUeEBIE2SaBeMjCnIDA7wPTfUF+mavnZzjTW/05YsBbV+NSBXMcb?=
 =?us-ascii?Q?m6wikfoeeHjQog+/UcvyGdiIwFONMFdicytdP6hLv+CGKS69njBo4yHGy0+m?=
 =?us-ascii?Q?JLrOO1qPbwD81qmo48DiIsr5oqS9ZOW4PJwvraSGsne/3mhWq6tZxco2gyO/?=
 =?us-ascii?Q?r7keUD3JboAWjj4uviCb3p91dNxTjMWdAx8xJGo9YM/mfePcHljddx5wijwM?=
 =?us-ascii?Q?Q3Z54cyxoa2TEjlitU869v2wo6zulPGWTSLHG265ca1btD4BehP2qK0dz//V?=
 =?us-ascii?Q?iosQ1zaAjJpeWDjom8IfMIQhg7tajwJNH7msJ/PCyRxJDifv0O0LaQigmMRJ?=
 =?us-ascii?Q?lB4iPc8litjo6BowIiZO/4ZmgqTj6oFksgmhuyHdmN2byeGy9F99yg1O5xPB?=
 =?us-ascii?Q?oqB0k0/6prSwy6AscG1+4Acy3vyqTYXhuaujKW4KixeMaQ1GVHMuZxXXNlgI?=
 =?us-ascii?Q?YP9PrCQ6oFPjuKbnORZ/I4n2IXQxAjoQYfSWoSULM7vJdPdEnNiit7k17AhL?=
 =?us-ascii?Q?5omIpCc25x0ldFX67n0UBbIilPieD5eSXeDUYqYfwGbUcVBQBrNJS1WgL7qE?=
 =?us-ascii?Q?VAU8jNTpOu/nEbz6Yl6GS/IoPthWx4jN40dMh0SNSSIdPwICh+sJJBFPbmP4?=
 =?us-ascii?Q?Fuo4pMyiyMrOhtwa8PPZeW5NTsPg726qABy9VDGYCqh7tgq/AVSWPefsLMXx?=
 =?us-ascii?Q?WDkTdzerMnsWAeA1+FQszySXH+FnqwjeForBC9CG01oS7i3phNnCwZk9fZwi?=
 =?us-ascii?Q?EGvvEPggTG9LnUqVV2TIux+N42+bdgD8YBTl4yD679PUZIKUDAgZJS2lyX1v?=
 =?us-ascii?Q?wxlHb+ix0r1+phiyVHBk6RVly5nei2TJQNvRXM0P5hFv1pFRu52qpGk07TfV?=
 =?us-ascii?Q?+hgL+vQ/KBUJSGk3hdPzabPDN4WV37yfb/p9ri9AQkakGi9M2uCUYBjRjBXn?=
 =?us-ascii?Q?TWkyt8V8lopFcT6gqwAy0qY9nFjph5ovPeFx9gUiv/8IMuK7a6yxrjy1PiNk?=
 =?us-ascii?Q?qHwTS73GxxzxhZLt5ai2YE653Xt5k/eEG5MlbdOeV0riNgfjGI08oPMxXoKP?=
 =?us-ascii?Q?rPEMhX+5vuajz3NeyZEPtpEmt52S7sZnCYJLi9vcZ2sXVJZhLrGQCVz3QxIk?=
 =?us-ascii?Q?em/erQO7NMO5WYWfYiKSStztg9FfKy7DCOTvfaSXO1xve1h94QvVex3UtLS0?=
 =?us-ascii?Q?Teys/2yCeF60GgoQQfS80LvsM26Ot/hfN9+ovcwGSSwDLTcj7MvsbDwyKRGg?=
 =?us-ascii?Q?gzBe7cPWKxrfhJPiXgEnmvFeP8a/308mqB6h2/RKBOHS6x9w67r5D/FvAeQP?=
 =?us-ascii?Q?95G80/PEpWDdfaP/q0ClS0TjNYwYaBUVnyv+k7l68nOOjL++2olhitVRKctP?=
 =?us-ascii?Q?LTf/QoNDH3CtlLsRasjwGwKII2r0PsUb7aYNjSoNLBbr25bhG6v+P34EbU+H?=
 =?us-ascii?Q?qqf8yYljtwJpgVS3+wGS0rFV5hF5ZgO7mXqOt69KFc12biUT+a5n8Suat0Dt?=
 =?us-ascii?Q?Yp77UkS4Rg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2b5fb4-3f19-4a33-d954-08df44885f81
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:54:21.9706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qEA/zEI8xECjiIEikX84BWc22X8K0ngzswIFPpp0XSHp2ov/BxKyWfU3jw08Xrwc/zPLWAT+sHfZhisXkdIQ+nGzuAHZiLY78MCsXDggRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6367
X-purgate-ID: tlsNG-bad1c0/1794905666-BF0DD034-0B494D11/0/0
X-purgate-type: clean
X-purgate-size: 524
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 09:25, Jan Beulich wrote:
> I think I'll adjust this comment slightly: For VPROTx one can look at the
> immediate as both signed and unsigned: "When the count value is negative,
> bits are rotated to the right". I.e. I'll do s/are/can be viewed as/.

Thanks for the review. That's fine with me.

> Would you further be up to following up with another, smaller patch
> dealing with a similar issue?

Yes, I can do that. I'll start with XOP0A and then look at the other
cases you mention.

Stephen

