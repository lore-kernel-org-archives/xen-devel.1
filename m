Return-Path: <SRS0=nCK6=C2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061CEC43461
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2020 11:29:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5433208DB
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2020 11:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=suse.com header.i=@suse.com header.b="HtE9tMg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5433208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIs6X-0004Pz-2O; Thu, 17 Sep 2020 11:29:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIs6V-0004Pu-Se
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 11:29:31 +0000
X-Inumbo-ID: 4d5045f7-a47e-4c57-b9b3-4949fed459d0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d5045f7-a47e-4c57-b9b3-4949fed459d0;
 Thu, 17 Sep 2020 11:29:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600342170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6nZsY/NpG6yalMmyfKm8AJPLy+n93C77+cZHHOdlh8=;
 b=HtE9tMg+2a6Qhcbi4jE6Ba06L0YFJsKKCeMUkEczWu1kNTMGFr34ifFf+m1EfNI9y9awdu
 Evg2yl50JOnSUTJh1Kklk5CL4s9sCsX++H4nzHQval/edsn86ATGIKf8TxTSHKwswVAWy/
 NNN5OUakiWwFMesDYQiyHLhPp4XmSmJA04EFZ6V9LYUdarQmQsUxvIi8TqSQrab2P3+QHR
 VpTPpS1xk6s/Mh1CHcAJF+jQuBWMzrvPKGnLhg6rPmnnp4Tkuo3IhxMPKdsFFwEKHHTdZ9
 ox9f/s4hfOPBOH0DCWAnbsGKmsuLRkL9QKAwkKL+OkNVdzCciZc1YAgS7RMuNA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4364AAE0C;
 Thu, 17 Sep 2020 11:30:04 +0000 (UTC)
Subject: Re: [PATCH v4 2/4] efi/boot.c: add handle_file_info()
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, wl@xen.org
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-3-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eec04864-5387-b8e6-b2ae-de1709432036@suse.com>
Date: Thu, 17 Sep 2020 13:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914115013.814079-3-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.09.2020 13:50, Trammell Hudson wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -539,6 +539,22 @@ static char * __init split_string(char *s)
>      return NULL;
>  }
>  
> +static void __init handle_file_info(CHAR16 *name,
> +                                    struct file *file, char *options)

The latter two can become const once rebased over the patch I've
just sent, and then
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

