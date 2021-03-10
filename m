Return-Path: <SRS0=92qd=II=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D12C433E6
	for <xen-devel@archiver.kernel.org>; Wed, 10 Mar 2021 18:46:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15B2264F9A
	for <xen-devel@archiver.kernel.org>; Wed, 10 Mar 2021 18:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15B2264F9A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96263.181973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK3pz-0002z5-ES; Wed, 10 Mar 2021 18:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96263.181973; Wed, 10 Mar 2021 18:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK3pz-0002yy-BX; Wed, 10 Mar 2021 18:45:39 +0000
Received: by outflank-mailman (input) for mailman id 96263;
 Wed, 10 Mar 2021 18:45:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcCk=II=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lK3px-0002yt-Af
 for xen-devel@lists.xen.org; Wed, 10 Mar 2021 18:45:37 +0000
Received: from mail-pj1-x102e.google.com (unknown [2607:f8b0:4864:20::102e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c1e285b-409e-4051-9a5a-9c4fe7d51359;
 Wed, 10 Mar 2021 18:45:36 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso7727834pjd.3
 for <xen-devel@lists.xen.org>; Wed, 10 Mar 2021 10:45:36 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id 186sm225160pfb.143.2021.03.10.10.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 10:45:34 -0800 (PST)
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
X-Inumbo-ID: 6c1e285b-409e-4051-9a5a-9c4fe7d51359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1QlGp94Z6xqtgpaSqZ1T43NlR4hswlJTog0zzkF2qmM=;
        b=Z8G3eanK+NquRUUrfVN1rerBR1po6SvilaSG7q+2J2jWiWQN/GLNYbg9EDmDgdTb5p
         Da6355xfUB3+pxhP91OyBOinqzEWbF8s5+fLCASbMgin3QJwRQ9OS7kuC7s7dr1umca6
         h5JI9rQZyNZ/CYTKyo4q3aXCkO6/NsCzVBY3G0pXHgB8JQTCFmUUmDToeNOI9VtpvJBu
         nM/BcpwaJs6nFFZZl+N/Dl+sjpKYKukZ7DNDMjpCDAranBG6awNstQbdagvO1HRX9Nw1
         XefE2Jwm9FZAqiNjnewxXy6i7SqnJqcFrNIpFOTCtrlao20ZgoLMZjHCt1eRxoa6sIkR
         jdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1QlGp94Z6xqtgpaSqZ1T43NlR4hswlJTog0zzkF2qmM=;
        b=Sgo0DQeRwE38/iWJONo86dqAQwSLXcoXou0Ex9o3rVf8yrkB543e7r0Ct3+JKEOKC7
         ukEOpNF9jgrRWzGt2dQZZ1DMR78nYlbeTUi6h+++/JvEEu7fA4IhrEaGeqZ+aXYckFoL
         wJvCy7uFr3yBJSV13DlNwW5576n5EgrVphtk3PoQqvkfVdp9lIztbsAKg/zXmmG4Hlvn
         RMx7FhiYjeKM0PhQ+ZwmXBGOSi6vrURDontaKJpI1cmJVbqo+d2m8C3IHUJUPrwyk/dy
         sOJpeOuNK4U1/OizMp8tqWFIrB+A8PoH5G/at39lNNg+1e7RKuuxMQJ9Xt0CoCSQYBvk
         zcIA==
X-Gm-Message-State: AOAM532kRc99IanNJim+MOzw3HmzVIng4frRoQZl8626I3wOWo8Rawvb
	9jTnhTD8TAxmkxIaK3A4QLmSAZZJeQTV/A==
X-Google-Smtp-Source: ABdhPJz0R00O/A+HzBt1HftSK5Att9b/98uBAyEZ/WCHHAL6jR8Xr3RzoxvMudzDn+HK4Z0U1b4+jg==
X-Received: by 2002:a17:90a:20c:: with SMTP id c12mr4883417pjc.224.1615401935106;
        Wed, 10 Mar 2021 10:45:35 -0800 (PST)
Subject: Re: HOWTO enable Xen on my board based on STM32MP1
To: Gurrieri Stefano <Stefano.Gurrieri@roj.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
References: <1449aa784e6243ee9a8e33642dcb7693@roj.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <ce6d479b-6743-9266-8886-af14e68b8109@gmail.com>
Date: Wed, 10 Mar 2021 10:45:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1449aa784e6243ee9a8e33642dcb7693@roj.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/10/21 1:29 AM, Gurrieri Stefano wrote:
> Hello,
> 
> I'm working on the platform STM32MP1 based on cortex-A7 dual core. This is an armv7-A that has the "Hardware virtualization support".
> My current Linux BSP is built using Yocto Project... but now, I'm asking how to enable XEN on my platform? Is there a procedure to follow to try to experiment?
> 
> Thanks a lot!
> Greetings,
> Stefano


Hey Stefano, I'd start with
https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions
and telling U-Boot to modify the fdt as described in the link.

That should give you a good idea how to get UART from Xen and
how to tell it about where your dom0 kernel/initrd are located.

Best,
Bobby

