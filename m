Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0F6C2D0E4
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 15:41:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 535D9208DB
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 15:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="W5DOHAn/";
	dkim=pass (1024-bit key) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.b="e/YiBQWM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 535D9208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34715.65904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDyC-000124-Uu; Mon, 23 Nov 2020 15:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34715.65904; Mon, 23 Nov 2020 15:41:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDyC-00011x-Rh; Mon, 23 Nov 2020 15:41:36 +0000
Received: by outflank-mailman (input) for mailman id 34715;
 Mon, 23 Nov 2020 15:41:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khDyA-00011r-QL
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:41:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 864a8188-4f21-442a-b23f-68d85667882c;
 Mon, 23 Nov 2020 15:41:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khDyA-00011r-QL
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:41:34 +0000
X-Inumbo-ID: 864a8188-4f21-442a-b23f-68d85667882c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 864a8188-4f21-442a-b23f-68d85667882c;
	Mon, 23 Nov 2020 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606146093;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MEJWVYFAiq7vnKvLr3M9QQUYhWI1k4NAiDnCKn4ITYU=;
  b=W5DOHAn/m2J2yhinvTDK/UIW5zQ/7+d5mQoPHhEI0+E/7B+v6jzgEobg
   mSC/N6UHW5Gg/ze3DQjp4u6/agEE9LvzJ2GCbnJJj7y8LK7oWMje1N5OL
   8WZwrZb1PkNj+knmijkW6QuPn+5pZaZjix9a4UX0n69zumUnyIgWeiHFe
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7qCbsb1jt0B1kFWijrnms59X6SVbH6TOtGVWcWsubV9GWy7ll8BaGLp/wHxszReQIaNcvr7yRU
 jFegfXEFjNtRSqqOuIQ+t2ZlKhqfLnMcnbBTVAXnUwnWC55JXsBKusoJqCS8I3E8uK+ItwFPIU
 A3oVNbCkjs/jqWZIKZa2StbFmct6pDOqyWRpOWXzb8Y1KTPkFsX98TN3IdXJ0bHnhE1g9OpaAO
 f0CegCGILy6K02n3Nu42eMNZ8bdtRl6W2BBpvCTIH3bmvAvpFKdC2LQw6SELCcOdGO0ozTXlw0
 xjE=
X-SBRS: None
X-MesageID: 31766015
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="31766015"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzfFyPon5P8vIQpmKuHkEzzBZYKEMcRbDw2go5fufI7X2BfgqD2Td8rZejWal3qDcmrUSHQY/llqEilo0wznP8ZscvzoR3hoydmJA3aK+//wguCwCAe+tpH6clK7eQrXS3eaHYDVec6JcjxtebrkutxUcz2ROiWa3LDhoEaGHNUUf3Jfs0iw+PBJHwWkq+/nUzdwUbr2n0tuahcHoPHcLp0QWATz1J4m2Og9lMO+S72zbiROYPZQ+KaI2QBsz7sUEdS81msI9mo6Z+ip84TUSu1/2aaq3t+Z0q4ucAK1Qi1cyLL7PKv6inv2gD0v4FVJHTO+MGlu47vkXcUWdVie8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8m5e98SQ6tCHfxh9kP9bnoce95sGLFrftHvjBmBMuo=;
 b=Q9D6e0Knl5QC0URNBM+NiQJmJ7B1AM7PJ7gA1w3TW1nvhUw68LhOM6Xe1VkJATd7tYHEsc8KgOc6MAN+s3SF5MU1rxSl5JK6wY+XZ5Yb1gxBno5VF35peSID5O6YJDgTbM5bSubK0N3Md5STel52ZkSxbxjTAYJspBUyRZFmHwHPa41ZAyvxPsOyWVkJpL85NGjRDQpfG++Jwt3VQ9jPccnAqvrX6Kt0rp2bQjUboThe08GLhLY71H8V6rWJsCW58UJbKQWTfZkWFJbVTtVmOvDb8n8wvHBG0/NKzuT13fSKUthymnC13U7bMYA2k44dLufg6z1duIF63M7rGx/oKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8m5e98SQ6tCHfxh9kP9bnoce95sGLFrftHvjBmBMuo=;
 b=e/YiBQWMGUm++Y3mZE2bvu7iSNK50RnlbhoT/hmnWXregAzLRXbD4dctRMzUWQfRl2qxPZS4xqYMc62ZAnftWDCTg2AjmxJMKI5w85419+jqz9ObwJvV1HqQnLPwv420dACCDxq4pyuI61AUrOsHOGZAAm4TreM1DMxuSFta2DA=
Date: Mon, 23 Nov 2020 16:41:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 3/4] x86/DMI: fix table mapping when one lives above 1Mb
Message-ID: <20201123154125.pvfatxnpkgxsz7sm@Air-de-Roger>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <53cd4ae3-d806-c3ad-02fd-317a09f15a24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53cd4ae3-d806-c3ad-02fd-317a09f15a24@suse.com>
X-ClientProxiedBy: LO2P265CA0393.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54453d40-dea2-4d6f-0192-08d88fc63f7a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3740:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB37404D09869161A33367575E8FFC0@DM6PR03MB3740.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNt1i8hTdTjCITUcv40u3iGHZ+iL/QNtekU/sggFVXtFZiZy1Dsb7mZ1vep3heHa0Hw1rC0n7TgKOstuC+jURycrVR4mWgt/Nl5lDZgRhmh2iRDJn5PDoeq0Yz+FtshVNeJtbcE5zzvjA8ToTaYRrd1tEHzJZbNzCE8Qb8zrVXevV7TJE5Cr10QpEmdLRyriEuXJwKEgcNEMkpnvMtmooX/kgWbzhi4qjNk+CMvhUtf7p4vSOvQXz3oCs9pwu1geoPPQaVNNJUboHA9H9nfsXrwRIsT+o1/O0QM/5kVAMCNJ/TwlowQyhIxX0PoD84oeHwV77vGTO2XDidXTfJUblA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(9686003)(6666004)(6496006)(33716001)(478600001)(316002)(5660300002)(54906003)(66946007)(956004)(66476007)(66556008)(16526019)(186003)(26005)(86362001)(1076003)(85182001)(8936002)(8676002)(6916009)(6486002)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 58rUxKqLK/e6IvBRLIJmQH5By/oy9uxNWN8g5olVXtMnNqn50hEf7Jyg6KQWaFcmpeRIv2Xjg8pzuEA6w2wZPI/Mw4THuME8Ew5uGaowaQq5YfaPdrvCPC32PudzeA1Hm9b4TlCxdsSB+0MxLw90M3JzJtukIO/zZ3qlD3MyYFrvbkQaUUQxR88xGvtrG32VDYK9uIvA/4y9f4rynx2awheC3XyU3ArflVnuyghd/TlfAUN9KDEWdnvlDFvDpZZ/ULsPEET2IqlzYZxOtzDy4v5Vad8TIRhI3EohMGhIqWW6ROcXOXh4YWL+9h06bsMYOrGHg56QyqxbsPyNhYcUOQYeg2ZxYJ8wvRN6SbNFpCOnMmBg+TuDTn0Hmmxjf8o24MzZrCha8rQXoRsxzjMPmz4681Xne4RNsLp8jaaeWFaYNz30aTbjF9MuDe2ZImGju9swqUG4azgOt3ppeQspbXLpaqewj/EQFdxK//VlRVt/IdRHgakIWAukj0INcn/UVbKzu9/l0hdxGB52aV0W3scF33ujEAILQI/YhHYsI/lYuNMxZOa9oA9Lj4ZCvYGJmTS3OdWWik4WrzYXooGQ8E1SguQ+peAn7o0FMnAcDoqKkszryOjq8FztI1UKCQFYauhzR/CEKQPvFoyc9k9gA2p73smStBto/Z5UXj+uhkH68OL1wZ6BWVYzTYNWXWX7w6jfn12Xq4sDqO6TDjGvnPi3NQbqrs2uqGUMMHr6XExRcVjccaZMbdZC8wbFMKVWWJNchF253PFdTczQRYBNfsJ9y4kdoZSFdbi0FcPEfbfxBRz5V/VGKV/oYnJOnv8qjKIh8jQxzByhQhmsR6Vq1yxVu9V1Ybg2GaeIEc+pozFZ1VnZImA5OeP8BD3EmOB2bkmuIzQarTmMZM6EGVxW0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 54453d40-dea2-4d6f-0192-08d88fc63f7a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 15:41:30.6770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKCDgRyNI9YuFmNTUPWcHl6V12p9blcDwD78rgJgUWZTQ9MXDO3SYp915/tMa2Fx96+g+JnNqJUnz607pGquJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3740
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 01:40:30PM +0100, Jan Beulich wrote:
> Use of __acpi_map_table() is kind of an abuse here, and doesn't work
> anymore for the majority of cases if any of the tables lives outside the
> low first Mb. Keep this (ab)use only prior to reaching SYS_STATE_boot,
> primarily to avoid needing to audit whether any of the calls here can
> happen this early in the first place; quite likely this isn't necessary
> at all - at least dmi_scan_machine() gets called late enough.
> 
> For the "normal" case, call __vmap() directly, despite effectively
> duplicating acpi_os_map_memory(). There's one difference though: We
> shouldn't need to establish UC- mappings, WP or r/o WB mappings ought to
> be fine, as the tables are going to live in either RAM or ROM. Short of
> having PAGE_HYPERVISOR_WP and wanting to map the tables r/o anyway, use
> the latter of the two options. The r/o mapping implies some
> constification of code elsewhere in the file. For code touched anyway
> also switch to void (where possible) or uint8_t.
> 
> Fixes: 1c4aa69ca1e1 ("xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

