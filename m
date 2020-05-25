Return-Path: <SRS0=HK45=7H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC625C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 25 May 2020 22:37:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E21A206C3
	for <xen-devel@archiver.kernel.org>; Mon, 25 May 2020 22:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a92km76r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E21A206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdLiR-00023D-Ve; Mon, 25 May 2020 22:37:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jdLiQ-000238-QF
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 22:37:02 +0000
X-Inumbo-ID: 4017a1b2-9ed8-11ea-b9cf-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4017a1b2-9ed8-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 22:37:02 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u16so9458197lfl.8
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 15:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RDKATGfCW4kdMXKLacGTn8XQ0RHZLkt01AwNltWZnUQ=;
 b=a92km76raeAi29Jrv/MCVUOEM8mNwjqL50IsdS/pfbL22ofJyi084JmfmrTtZaER6q
 3BbwFRqOusSkfBnlPwfc5a2zdnl78IjRFU0xbSBgBPeVC5jJW9i2VL4wL2/l79dypfN7
 5pgKlYziVmVB1v1KTe89h59lwy8f5uq0vEXEd60LeOKQZQDdF9ntqi3iylv9VkWzaa7g
 NzUucryuJompGG1yf+OpjA7HXPg4tzLSJI1K5yy8Yeng58N8rTdbpxh0qiyq3RZHET8E
 2i13BrJIYOtiAnJFKYiW73wCZO1x99lXZVFAt/7vyeWSjESA/82pSyOq0UZK7zOj9+2U
 O6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RDKATGfCW4kdMXKLacGTn8XQ0RHZLkt01AwNltWZnUQ=;
 b=XQC1pbzwvcaGURHwjSJ99AUQxcmElVOXjWgKRa/aOfsbVVR3MgwhZYa0B2ykNLL5IU
 JR8nctDDnxW0ck0qcvAHbQbtffEfPlcX/k6NJt/S4nKcenNz4kEo7GQAt83Zb2oq6dPR
 Xhdjg7kfmjqg0z9YOTI1uuUurs+VJ7yA0DlS8OJ2r6QFwwJwU2yjM5Vy6XmRZBK+jWMZ
 Fd0RmQVJndOp0V7XaR6yQwV/cGHh8Sjd5J3Vrr6EHWH0yUH/4sNVKu6MIoTEQHVkISp4
 SF+Vy21kRIZt/xmceVmqlEM65o5figXgxM6/wOUgMAOZntmiuyshe6y5ByU5PmmWNVn4
 vaLg==
X-Gm-Message-State: AOAM531zmOzm/qcr4OSXysOOVQL04znVP+uGCJtL35mUczFWfxf31NVZ
 F8EOdk/5RfFUJvaP7dhDD0ZS0QGobjNwq5oIQi0oEA==
X-Google-Smtp-Source: ABdhPJxcUsE0FpOrWOB7h+yv1PB1IkG1pqbKocKHpWKHSrF5niI7NoiU61R6etGR6pUMRZBpsMWw0a3TzcTmpGfmzd0=
X-Received: by 2002:a05:6512:3049:: with SMTP id
 b9mr15213389lfb.44.1590446220666; 
 Mon, 25 May 2020 15:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200525024955.225415-1-jandryuk@gmail.com>
In-Reply-To: <20200525024955.225415-1-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 25 May 2020 18:36:49 -0400
Message-ID: <CAKf6xpvRxeUdOOogacDvncC3yogcTN4gALVWO+V8ZJ8x__RafA@mail.gmail.com>
Subject: Re: [PATCH 0/8] Coverity fixes for vchan-socket-proxy
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, May 24, 2020 at 10:50 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> This series addresses some Coverity reports.  To handle closing FDs, a
> state struct is introduced to track FDs closed in both main() and
> data_loop().

I've realized the changes here are insufficient to handle the FD
leaks.  That is, the accept()-ed FDs need to be closed inside the for
loop so they aren't leaked with each iteration.  I'll re-work for a
v2.

-Jason

