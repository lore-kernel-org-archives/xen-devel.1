Return-Path: <SRS0=l70B=6A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CB2C2BB55
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 12:29:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B1BD2063A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 12:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B1BD2063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP3e5-0003qN-MS; Thu, 16 Apr 2020 12:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3QVr=6A=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jP3e4-0003qG-Gb
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 12:29:28 +0000
X-Inumbo-ID: e64e230e-7fdd-11ea-83d8-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e64e230e-7fdd-11ea-83d8-bc764e2007e4;
 Thu, 16 Apr 2020 12:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 2ED09AD8B;
 Thu, 16 Apr 2020 14:29:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7saMafNshcE; Thu, 16 Apr 2020 14:29:19 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 96418A85A;
 Thu, 16 Apr 2020 14:29:19 +0200 (CEST)
Received: from samy by function with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jP3du-004UPj-E0; Thu, 16 Apr 2020 14:29:18 +0200
Date: Thu, 16 Apr 2020 14:29:18 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] mini-os: allow 4096 event channels for 64-bit mini-os
Message-ID: <20200416122918.p757arqwyvjamwv5@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20200416122700.22620-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416122700.22620-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross, le jeu. 16 avril 2020 14:27:00 +0200, a ecrit:
> Limiting the number of event channels to 1024 is fine for 32-bit
> builds, but not for 64-bit ones. This might be a problem when using
> Xenstore-stubdom as the number of domains which can be supported is
> then limited to a little bit more than 1000.
> 
> So raise the number of event channels to 4096 in 64-bit builds.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  events.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/events.c b/events.c
> index 342aead..cdae90f 100644
> --- a/events.c
> +++ b/events.c
> @@ -23,7 +23,7 @@
>  #include <mini-os/lib.h>
>  #include <xen/xsm/flask_op.h>
>  
> -#define NR_EVS 1024
> +#define NR_EVS EVTCHN_2L_NR_CHANNELS
>  
>  /* this represents a event handler. Chaining or sharing is not allowed */
>  typedef struct _ev_action_t {
> -- 
> 2.16.4
> 

