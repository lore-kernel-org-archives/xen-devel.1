Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF39FCC6B2D
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 05:10:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451260.1666361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHaCY-0006c5-0p; Fri, 16 Oct 2026 05:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451260.1666361; Fri, 16 Oct 2026 05:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHaCX-0006bx-Rw; Fri, 16 Oct 2026 05:09:53 +0000
Received: by outflank-mailman (input) for mailman id 1451260;
 Fri, 16 Oct 2026 05:09:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xHaCV-0006br-KW
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 05:09:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHaCU-00H28r-IP
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 07:09:50 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad1b190-e002-0a2a0a5209dd-0a2a450883fa-10
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 07:09:50 +0200
Received: from [52.101.62.12]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad1b19c-f659-0a2a45080019-34653e0ceafa-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 07:09:49 +0200
Received: from BY5PR03MB5315.namprd03.prod.outlook.com (2603:10b6:a03:229::23)
 by BN8PR03MB5090.namprd03.prod.outlook.com (2603:10b6:408:db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 05:07:31 +0000
Received: from BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550]) by BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550%2]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 05:07:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QB8KqD7/c/kkSd2S1GjaQzAWuaAxMNv5eKnCxgRbMBnAhgD6MEhJhBZv8zXvSEHE4zlxGaQuHM6XXFgXaAheH3AGJzNROw01Y1SrNPur75YzUzLMiGY5Uhfygvt7PzUf/6n+gVVqrucC4lTERtO8CgKLbFlsuxhhUi/PB9xK5lRsrie27Lmn/a3tSXncUKnqpT76GjptzqOTDnw3vQ/6naj4O44AsRLSjjBbFAoaqu7klm9cpN6SXjO4Xkh+Y1tSa+jcUqECU1ywdfnH3Cz66ad7L6HJLvt7olDm2DD8PTRtoLbmLmLKCIrfQLOcjkDiAvKhpM27IvuhI1JsUmBSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3KqU4Zic7f+WsVGd29gdNe6+S4IF+atkhQGf6BfB+o=;
 b=TO25cLfybF5nr8lsWaQ6+9cBJCXMeUJta0YyxdUZ4SnJOUbM+tHSfQLxWGAjNojPaCxiXJc4qR39zrFgGsiiaYHKQJ9Gvm8rW+fVNL9X64ib3xkhZzdyf/e8ni0zAgSvOtm6c7qPLDWsLvF8nOwy56bO3NgVjdlgJaf3Zd79/2jgfRTGoATK5vgEk+UPmU8pUe04rDWBS3vs9ZfdbZmvcp+Nz40fV6aoPa8cwSGLA4vzLFFkSbuz3CVdcLdCcAvtxUnzXDocYLm81w5y2Gl+nAlvqOc/4l7z5eQjE7sYmGgJyHj4lzoyIaylnefS4EyQQXIkALJUtszeF33ArLktgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3KqU4Zic7f+WsVGd29gdNe6+S4IF+atkhQGf6BfB+o=;
 b=c/1cvcKcbQwZNd7zo7OKJLnzwwxjc3DAbhHB/egV2quo1Ask8B5AkmNCl+EjZXUPIWUrcBOAlyLuZLg9hGtl5rL9nYaJDTqw6nyaU3x7KLiWGHONcIXoA6OwvlEMylggk+TjGZj2Mx6Iyl5O3+s81kRIbsdlFUFdGiNh1n1s8Ls=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: ehem+xen@m5p.com
Cc: anthony.perard@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] tools/xl: move some logic needed only once earlier in
Date: Fri, 16 Oct 2026 13:07:21 +0800
Message-Id: <20261016050721.251856-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <92156ced183670bbbcb2d3f9e2dca4d12f37ee7c.1792017144.git.ehem+xen@m5p.com>
References: <92156ced183670bbbcb2d3f9e2dca4d12f37ee7c.1792017144.git.ehem+xen@m5p.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::13) To BY5PR03MB5315.namprd03.prod.outlook.com
 (2603:10b6:a03:229::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR03MB5315:EE_|BN8PR03MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: a49d6aef-2640-441c-0247-08df2b43616b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|5023799004|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	j5eY9PdmYj1jS9hdjmR8eUouNJtsCmJj0bZDZcBkUk2YOUGHLlZuMIpKiICxkXyyroHjyXEnA/chux17h86WSHQYE+p8OMpNldn860xDoJSq/3E4rRajDvxlj3QULckLfZtyPMeQRibclbWCK1CTSjnmz/egx5Tyc0Wd4v5i/ftEFSrZc7irHNxmuk2CznZawSFiPGdVQk3vNDxaR2f6JYaM4rbODOhIe8TSjoSjxDwBhMTo7Sh48iHbcVMach6wqIN3n1f7eF/IQcKkNPLKmywS32kYKoMSw4KK4bkVo+RPBKhCz7MMXzaYM8l0i6lOpz2FbtZGZoY45iFCJxYJolsTBMyY51H6OekyshhSffUea3XxouxVQ/9mCyV4PbHguZE24YLWFM95ToLxASwSfPcqUMTe4JzVd5IZXjoaM6PGfVSoVpSBpx7SR5jc31UQ4tDVwweW7axZ/yCU+sboJ0if+oVj8hZEXnc+53akJ/eycDARUVQlcAbu5mWZYFqwqG+OFeSFCl2QAfosFe738yp4zynx4+62PfhwcMlZZztE6ZmBYWDY9Ujj0bi0Gc0SjMN1dslU4Hm0xVEt5+XzA+aHMjaiJBnJcE2Vjz5FEwzIldontvX435b+0EWo+s3zVBh3vxtt4i2l66GmF3BREfJYOuByGX47UByi5KfU5SA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR03MB5315.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RoqtxiMmnHS/NET3bZqCn4UvbLCNT5e6QO42WgE+aPkuBl0t9iuZeRdgpk3k?=
 =?us-ascii?Q?cpxZmaV7unfyJ7PGbYe2owd4C6m9RlDYkvhjBAD6n0LEgvrpwyhGCY2TfCeY?=
 =?us-ascii?Q?RREMQb8Cn9xStWifKC5a68FgHEf7+A5preZBvUsQQ0p/MaEN9GpuWX7GYvGr?=
 =?us-ascii?Q?AdneZoKke5haY/Rzal+VDhhoCSGMDUmACv6TQTtADB1wEUrL2WtDau2uSAOu?=
 =?us-ascii?Q?1A5HcCfFa+EmfTVMZWQqQ5u4ByB/VkgCJhD9M5ACfrO9kVURtQfX4LR3z0lN?=
 =?us-ascii?Q?DQTrn3cUQVkey7F0sjtFPNR0vjd2/ynX5NsbYSVk+32EpHQQHSblKuRHB50V?=
 =?us-ascii?Q?HTYTp0KMlzsEmbIbBT04YbVSiPvjKVZsAadFrcCeaTaVGhzvcXY/0bFgW3OS?=
 =?us-ascii?Q?fCFRa5yCHN7rtYXuXUeVOBCV8J2MTcexsro57/QngEOHxtFglRFmauHJfoJV?=
 =?us-ascii?Q?xW0UR+/0gFJGAbKc5tbUBFhBA1IvL6ov/4lzB5J0a4/HmH58gL0CedLWzrIh?=
 =?us-ascii?Q?swXRlxzB99dJqjIUkszAxAWcEsAbXgxNfo4MgXZL8UCJRNKiItCqGGEovJER?=
 =?us-ascii?Q?usIbIxHlbDlwPoB9XuS55BGe3ovbf7ULa6K7sb2fvytKGk6hmTjvpM202KAP?=
 =?us-ascii?Q?RPUhTACAw4JJKwVkXth/dXifEiUCVYg7hD5uWHRM4JWRQBKdZ0Db2h/LkX4s?=
 =?us-ascii?Q?4FcTaJW6Ls2hn87++J3dQ3djAXlMnn5G8g62CpVtBtQeXg3EawgWGsaCFvfD?=
 =?us-ascii?Q?HTdLv1T4gwArsUWqm+rr3nKbVLZdncxaNTfAf2aUflEFG7mJVB/y0SRvE4L7?=
 =?us-ascii?Q?FSFsYQiYYvY2GcDhaD4TaiKdnC11vE21q55WE8ZBAY1BxMBJYk7NocWh7LQY?=
 =?us-ascii?Q?Rp8ptPm4JnihdgygeznoM/93hqNzwvAwcP1TzOMfGRg6tD63HFIS35uMrHs8?=
 =?us-ascii?Q?/PwBtZCdwk4f4jruQrJ+MumlR5zwokWZ1Zw5+DZvQSemwSIUHL5mwGEU5eh3?=
 =?us-ascii?Q?geSmiVPsoQrKwGEj39tgzazjst/8pmjVdgARGcmesrCm32qySQoW8lR9J+ep?=
 =?us-ascii?Q?0IR5ARpCkHQyV8If2Qi9omn+usO/6lhK7k+wkej8Du+ggaSDDH+O/shcVaVf?=
 =?us-ascii?Q?dOWSTfvfAHAluhktlB0HrapHEp9eyxrpkKXRXTByX+an8dOYJm3kzG4b0Mmq?=
 =?us-ascii?Q?FXW3XMAqkN+4eTEiinlFm/6vdfYL1N+XMyZuuGQ1h5bAPqDV7zmaF+Iw8w4Q?=
 =?us-ascii?Q?/gTKht8XDvNzNu0Esz834OcYRusQGr6JMUGKqzS6JXm7URRZWFSoo/3Y9CRV?=
 =?us-ascii?Q?RAACmAQkwFqoHKqRr6T83t+9Ocqcu7SHCAMXdaTm32eaG7I7DSuntDgGzOzV?=
 =?us-ascii?Q?1KKTy/yR3dXw/CKjVE4sWv9/SMsWvt9XFO3gyuK5rRsCypXAJEAhDyYOgi5m?=
 =?us-ascii?Q?59dC8rIf9d/LA4OgLCoCCVX0IfGEof1GUP4j7+3jJHLkNNC84q+32xGqH9q3?=
 =?us-ascii?Q?rwreQO1NGckKXonh80lVXGgsQp0oFjOHHYfJYblGLSCDaOJA5GrOsYt6NcRQ?=
 =?us-ascii?Q?x8GZHMMGJDzYsuGnkArAGw+Mk/5+NBwBkhqKuTn5xB30PiiWu0R/CU8o7aJc?=
 =?us-ascii?Q?90pB1uz2RVCg0xDx8Ojlmot4IcSxYp6z15ki4WC4+x02OIkj6vxDDh8voP1F?=
 =?us-ascii?Q?0LiNIE5SzWUaRjJeaFTbucUqGQjDBKphrDpCSSkohz8igVaWHzAamPDmsYQD?=
 =?us-ascii?Q?gxUnZCqmzw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49d6aef-2640-441c-0247-08df2b43616b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 05:07:31.4899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogA4diFzsKmEtoCZBQ2j6eLUOj9oaVXm7TCQq+nO49OVrRPhkTUWgaDzlihOdHLXzKux9zYt/AabHbLrvo+gHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5090
X-purgate-ID: tlsNG-c1860d/1792127389-D6B4187B-9DE14532/0/0
X-purgate-type: clean
X-purgate-size: 3387

On Mon, Oct 12, 2026 at 06:03:49 PM, Elliott Mitchell <ehem+xen@m5p.com> wrote:

> The value of dom_info->console_autoconnect isn't going to change if a
> domain is rebooted.  Nor does this logic need the lock to be held.  As
> such moving this earlier makes sense.
>
> The policy domain is set once and then never changed.  Similar to above
> simply move before the reboot start point.
>
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
>  tools/xl/xl_vmcontrol.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 76c2a07ee8..ae7985122f 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -717,7 +717,8 @@ int create_domain(struct domain_create *dom_info)
>      int restore_fd = -1;
>      int restore_fd_to_close = -1;
>      int send_back_fd = -1;
> -    const libxl_asyncprogress_how *autoconnect_console_how;
> +    const libxl_asyncprogress_how *autoconnect_console_how = NULL;
> +    libxl_asyncprogress_how autoconnect_console_how_buf;
>      int notify_pipe[2] = { -1, -1 };
>      struct save_file_header hdr;
>      uint32_t domid_soft_reset = INVALID_DOMID;
> @@ -921,6 +922,19 @@ int create_domain(struct domain_create *dom_info)
>      if (dryrun_only)
>          goto out;
>
> +    if (dom_info->console_autoconnect) {
> +        if (libxl_pipe(ctx, notify_pipe)) {
> +            ret = ERROR_FAIL;
> +            goto error_out;
> +        }

It looks like a functional regression for the reboot path. Right before
"goto start;" on the guest-reboot path there is:

    /*
     * Do not attempt to reconnect if we come round again due to a
     * guest reboot -- the stdin/out will be disconnected by then.
     */
    dom_info->console_autoconnect = 0;

On reboot, dom_info->console_autoconnect is cleared before "goto start",
but autoconnect_console_how now stays non-NULL, since it is no longer
recomputed after "start:". The second create call will invoke
autoconnect_console with the already-closed notify_pipe[1], and the
read(notify_pipe[0]) will fail with EBADF.

> +        autoconnect_console_how_buf.callback = autoconnect_console;
> +        autoconnect_console_how_buf.for_callback = &notify_pipe[1];
> +        autoconnect_console_how = &autoconnect_console_how_buf;
> +    }
> +
> +    if (!libxl_domid_valid_guest(d_config.c_info.domid))
> +        d_config.c_info.domid = domid_policy;
> +
>  start:
>      assert(domid == INVALID_DOMID);
>
> @@ -938,22 +952,6 @@ start:
>          }
>      }
>
> -    libxl_asyncprogress_how autoconnect_console_how_buf;
> -    if ( dom_info->console_autoconnect ) {
> -        if (libxl_pipe(ctx, notify_pipe)) {
> -            ret = ERROR_FAIL;
> -            goto error_out;
> -        }
> -        autoconnect_console_how_buf.callback = autoconnect_console;
> -        autoconnect_console_how_buf.for_callback = &notify_pipe[1];
> -        autoconnect_console_how = &autoconnect_console_how_buf;
> -    }else{
> -        autoconnect_console_how = 0;
> -    }
> -
> -    if (!libxl_domid_valid_guest(d_config.c_info.domid))
> -        d_config.c_info.domid = domid_policy;
> -
>      if ( restoring ) {
>          libxl_domain_restore_params params;
>
> -- 
> 2.47.3
>
>
>


