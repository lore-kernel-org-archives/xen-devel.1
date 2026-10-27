Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDD6606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 01:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=p6PyQXuc
Received: from list by lists.xenproject.org with outflank-mailman.1461788.1672805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLW9w-0001Ob-3t; Tue, 27 Oct 2026 01:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461788.1672805; Tue, 27 Oct 2026 01:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLW9w-0001OU-0R; Tue, 27 Oct 2026 01:39:28 +0000
Received: by outflank-mailman (input) for mailman id 1461788;
 Tue, 27 Oct 2026 01:39:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLW9u-0001OO-EN
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 01:39:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLW9t-00Epwe-O3
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 02:39:25 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ae00081-2eae-0a2a0a5409dd-0a2a45098440-28
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 02:39:25 +0100
Received: from [52.101.201.57]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ae000cc-be1a-0a2a45090019-3465c9391108-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 02:39:25 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SA1PR03MB6468.namprd03.prod.outlook.com (2603:10b6:806:1c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 01:37:21 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 01:37:20 +0000
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
 b=QMy0M+EMgCfG8QsuZRj8KDzx6zgMRFYV9FMASnCBoiaH+Q9TVHryL9YcjShRpIv7j2av3ZrIM/DLP1c3EkHhPU6AX/juPxT9oeW4roTuF4Sfn55VBrIH2mue1wjigqdMlCTaHuM8WNUsqnmsrWbybEnTaXnq9pFJyGZsxv6deuBloO4l3Z2mJELVAdtWBknbROTIUvWZ7zynQ98m1MS88Yucy6sDMCWiBdqK+zXr2AFCQmC3NtR4WGWB3DAg3Cu7of7V+uNNza2iXmLa0uhAoFA1clOKFQNVBZWU5NVHnDkG7Wu77tFGx9XTOFN74OmY56wIVrVCQ5fe2DY/RI7o3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpHk3+bXZZlKt/sxGgx4NuVmP4uBBP/3Ad/eXgoALyw=;
 b=HIohBI+g3dEF5S2Wy046UVF2wLv8ig+qwtWRpwYubASpY8K8CG6QrsUC12GV8lCKCrRoMVnZcOnfOMKXh2lNyXMQ6va74msWVRrUPWwtGteQkI7FTKUlI9X1Oh7S3OjNNYnm/N9xtC9ZOyublsAzUcFUFpcZjZZ9BOLZ4eFadtm0nsqJy8yQBtvJ1hawGYC7uhsQefZaMKvgYkEzZNKB3OGvy3C5Twlo1sq5y3I9dv6DXrJjc8ENsq8NwuVjFo5CWAVJiphgBpDWCQ/nbft9pZVMkA8SSFZuwewd6iw/aZDku7bDEzE05+dweZqx+4fzcsvkPM9Rnab6SyCt7yW4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpHk3+bXZZlKt/sxGgx4NuVmP4uBBP/3Ad/eXgoALyw=;
 b=p6PyQXucHzBprKgzJ6YMaeecfjBjI/NMlAQDvDQizWnHwiikFqA0qAC7AHVXH7XKY4KtK0XSrOyLGvjVHDMLXKUzvaBXPVmchG41Un9LCbn/0k+Q+tYniqkWfzfLQvNkfhfh6Bkrp4EM0s84hCgkvSOWpuBouPTbRajHOdzp/LI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2] x86/np2m: flush the np2m on an SVM nested TLB flush
Date: Tue, 27 Oct 2026 09:37:03 +0800
Message-ID: <20261027013703.367380-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <ba1b6345-880f-4b84-8a29-d5197f5f4082@suse.com>
References: <ba1b6345-880f-4b84-8a29-d5197f5f4082@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0103.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cf::14)
 To CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SA1PR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: a43d5969-679d-4306-9cfb-08df33cad7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|261026121527099003|18002099003|56012099006|11063799006|261022105027099003|261009223027099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	kwo2XSQO3rbBXi5391hglnywV8lACJyo+BaCGetpWKwgGsoUt0kXwXAyiOW8TKa2/qkRsewhvXg9Qm9YWOJYLvzegCEW4EiMyjZz1OH0ggiSeXY2P5ksKHlpMjkoQzkwOaCxhhJS98yJi/kqfKc/J1phvSOyzEEQ5kuSJPcxuc9UUaaYEHeoW+A1sxlCBCNNWI5WAg6gJAcJz5t7w7+WuTavTAYoetkekGvciwo5yFmmsLJItBmGOydRgrEAdjO+vxCOt9IKOVx5sPUDLQiNA+LZ7E5sYNqj1CaTUmvvki7+wCS26r3cANzr7eO6Sjdx0V1MqHmKRxqYw6GZ+a+0SVm3mSQ7SMpSJL3FdkWlkQimazAvBbzOy0NbjnK4pt93WipnglcQX67nKlPwdjWIG5LUHxLqV32utarHw4pPpIJ6v4/wnRAddRK+aHMB6AfL7HNdss164FA19ckBrQtegcLW7ZUj8RyvDA7nJgxjxViAwudI1BgMo/5eg8Ih/2W1e6YweThaM4QWqcMhwJ4i25PeMPsAeq3viIYdVILzzhE0FLhnMwLHSY5P8VASEyXvC34NeHP80DG+GJUMAlGTXmXM5VQyJnQsoOtsXR9TudtrNFXqIV4o5MWoYk0k22UeOuEcFejKUnJVjNTH2sfvVvBf8PXtUKkEmeAzHOJE7fs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(261026121527099003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GUC2Y7cl0seUdfFkIE4up/X0I2YZs75qYor+wVIkG2CqxipUwPKt9XxoMTMv?=
 =?us-ascii?Q?C/yR537MoBMPZ6/qMkmrmWM4lF02b68KG1aa2RT890y9eY5hADMPQBK/03SJ?=
 =?us-ascii?Q?vcIPysFSPKgpm3yAMRmwl1TL1YmBVvMi6D8cE/J+3FY7XzBA/Ez/mn1d6yF9?=
 =?us-ascii?Q?9f//Vj0YIYmG7/NWtvzhetvfAantY7riDkXrjRSllz6bHP9GKAFVmoYSB3I3?=
 =?us-ascii?Q?K16j/w8bm/h0TIBbDQidh048ccS7BBtTi8tWJ+uoGb9q58udAbAynzAhhNiW?=
 =?us-ascii?Q?1EaQ+re2gA13UsFM1p3pgwJvE2aC0yXtZXLZqL545nJnZg4bqmSBEuTkANe+?=
 =?us-ascii?Q?DFDEQjsZVTkN79OmTGQSUU0V6qpB/vL9xXylVRjwVvBhhRkpi/07g76KLzua?=
 =?us-ascii?Q?0zUptgCwXT1cHxFAGL/aRy4FUnCUEHinAx+NIaCovxvDd7CzrqyBKYFE43fn?=
 =?us-ascii?Q?EeHLY8oiu2mkt2KqQ4LCy1mJGoQ01T7TDEa5aK8uuS87Yov5SmYIvaoPiB5s?=
 =?us-ascii?Q?ZIuuwbGVomWTU++qqVSUQmWMqBAlF2WXEpseDraKzf+pnqE5dvqNIbJl29pI?=
 =?us-ascii?Q?JcN2GOSI4QAo6PEhkIDcAwXk/ydcc39Q6VvgxPByl6WhB47M2asWALsmiIl0?=
 =?us-ascii?Q?Jws+ppU3yqXMdhPkic7plfpXis+OwUofU5Npt00cL9HMbXTMkDBDCAWhPNBH?=
 =?us-ascii?Q?I9mGitkNMnxvSElEUPSKbzKTXyNAb9/qfDqt48iI4SgCn/z+XA+hUtkUXvHQ?=
 =?us-ascii?Q?o2daA9UnsfAjsYt7UPJPN4B4u+7g+RdHs6406CLXpTMg7ESdC+KowULVmaAg?=
 =?us-ascii?Q?SXtIkezGfyYHORNxgjtDwG6yi0Re77XEhwb7LxVdBtEYibulv8sOzWeioSc9?=
 =?us-ascii?Q?/hwjRhiw8Jaww9ABoi63LfL5lDe+rtMgr3PXHHMTZwTitGDDWwbltKWdL8gK?=
 =?us-ascii?Q?HBmtVOWQdFWlU4AjC/tKcB4qziejVdxbmb658TaTkAZ/TMl3T3jw8R/fyPCh?=
 =?us-ascii?Q?hshf2YGM2oB04pIfgbzMh3DEdyGbcr26zfYAYVgHD763zSNBWFGpfVwugeSu?=
 =?us-ascii?Q?lwcoUNkGL3WCDvJ0PpMcQpjGw5jprD+7/IIibD/vsMTscfQo6JJ6Vv1SdS7H?=
 =?us-ascii?Q?/aEhNFDmIbM08t0uj5/SF/qNvFE8qOuGu4dhCzQ7Oo4NfQ27r22TVyeGGSLl?=
 =?us-ascii?Q?1MhKt+++qRdBZN1BGpGd/CDv0lV77KVJBntqQEvfZoxGjsaK/GVUIR8pNUB2?=
 =?us-ascii?Q?JZuNA4qEfRiBILyw+JcdocGMxMWJx6ILsDjcrMJsU/AsMkLiMmGRNhlt5eTc?=
 =?us-ascii?Q?4VU0CYazl2FklpnvW3X6uhUHh5MSL0R4Yr8pHrkSHwwu1Hta4eh2DOZ0+D39?=
 =?us-ascii?Q?HjYH4CSSjXcMNyjI5gxBVYHBTyZc9xYiE3Sk1P1yKyyY+md4pGdqwqhBFELr?=
 =?us-ascii?Q?vlhq0lG6hJTGKBJ0o1a6cMQAH/l2T/gPLwsAhZq3T27JVxcYTLEAtApn397T?=
 =?us-ascii?Q?9DTNh0030NOvC3yxTQsCA47Vkf7vsAiXr071mYdFSXjOKFslRZRxy7BGnkOI?=
 =?us-ascii?Q?NCYqrO8Xjpu6/9P9EIBuf3yzgRYU77Hg54kgztpRsI0H04+ybLrnpAp+J7TL?=
 =?us-ascii?Q?SntJix8wHNeQ+6uu9oEdYHZ5Wl8zaroD4UcYUEQbqMRH7PemhKNIPBdDAFgF?=
 =?us-ascii?Q?HRRGzOIzH1/rXxmn39t2UuAyiJPX1F0Zq0nwiYN30d75DMHmq0sQS0ick+Tb?=
 =?us-ascii?Q?TWKADGsZdg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43d5969-679d-4306-9cfb-08df33cad7a0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 01:37:20.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xWXkh1zYoLjDwWTAkqHyDWw0SJyJFzNncy5JQ2SYDDuVXK+afZ9iMPTYZy/GoGOolew1po8bUvfc8tGHjX1vAcpRvoq6ZEnZhro7nIrSfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6468
X-purgate-ID: tlsNG-bad1c0/1793065165-FDA6E034-3CC03670/10/78276251493
X-purgate-type: spam
X-purgate-size: 865
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 12:52, Jan Beulich wrote:
> Tags want ordering differently: For one, it wasn't Ross who indicated that
> he used Claude for the review. See docs/process/sending-patched.pandoc. And
> then tags want sorting chronologically anyway: You can't possibly sign-off
> on a patch before having finished making use of AI assistance.
>
> With that adjusted (can be done while committing):
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks, Jan.  Yes, Assisted-by: should go right before my Signed-off-by:.
Could the committer please reorder the tags when committing:

Fixes: 6df4b481b0c5 ("x86/np2m: implement sharing of np2m between vCPUs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

Stephen

