Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F6DC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 20:47:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D692664F4F
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 20:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D692664F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zededa.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97333.184901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKogS-0007xP-WF; Fri, 12 Mar 2021 20:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97333.184901; Fri, 12 Mar 2021 20:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKogS-0007xI-TL; Fri, 12 Mar 2021 20:46:56 +0000
Received: by outflank-mailman (input) for mailman id 97333;
 Fri, 12 Mar 2021 20:46:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=arNz=IK=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lKogR-0007xD-U8
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 20:46:56 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a79cbbe-e9eb-48fe-9dff-c7093a2f95ed;
 Fri, 12 Mar 2021 20:46:55 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id l132so25777032qke.7
 for <xen-devel@lists.xenproject.org>; Fri, 12 Mar 2021 12:46:55 -0800 (PST)
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
X-Inumbo-ID: 3a79cbbe-e9eb-48fe-9dff-c7093a2f95ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l785eZf+wWI4zZpuXE1q31ve0eVDz6sJ28MOYfsk8Zo=;
        b=dSlrLa8h1Wv5mlxtZXolO4pTOdtxx5zhUoBPYuUSf65mE8syJ25J04qAzumHhtRJDH
         LInZvfdX4HCpcLfVdsf65rxukGVqJ3V0/lVuN38IIp21DtbFtkNyYm9q/4xwuRnzQs0W
         C/cnN9WvpliVqUyQ3mnBGL7KLntVLeZiizyemYUriFHi6Tq0rkdhu81SzNfNZlbhBEYb
         0E8AF477k64qIcIikDQCAouUgLAQLjdkRrupyUuieU/BxMLrAl3cTsznvJcWTgh3AqIt
         6dwoEHWAqxgTsqY50bSnsgpFK076lFufdN/G4sOaJq7tv916OlPYWxVO8hkIkAK6R7b0
         03Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l785eZf+wWI4zZpuXE1q31ve0eVDz6sJ28MOYfsk8Zo=;
        b=kDbHxRDp/6qPF4rk5tlnjY033+THvHjAg+HMBhgt1pdsX0FMpc9HCiTJw+dCmmATUA
         nhYWEB3nCrGDC3zEtI0VBOtpphxAtAKcsj6rDk0A0ZZc+k8hsjTp5o3Jso+eYN0AK/uY
         CLKrPH/crtZPQPp3MajGKeGX2aX9TihdifuWwFQSPwH7ZZb0qBSLhFf/aR/n0aMh69T9
         MumZp//493kv4Ez/V5uxH9OHw5CqS2GH+jRza3Xye+Uwv3PU78+F+ekibRCP3UaMeHyS
         tUAHdR8LGaoZEgnDQeK34F9yEIF4PrdhQYmhprpszLtcdQkR4CTyIAA+YXx40u68e1qT
         gc3A==
X-Gm-Message-State: AOAM530p01uU9hcUt1KPTYEVNpLpN5D0pabeWYfb6A1KuXNcl57JAHeH
	MDW6lOZRHV/VxZUrRcdgNN2WLpmQvmSmJc5VqaknGw==
X-Google-Smtp-Source: ABdhPJyXa0WTaSbuMjp5jetFiontlSRHvPO27OK0ugobhptG7YF8Kybfm+Qi9c+bhuz/IP//CnXeCvfL5kqKrBNrxlI=
X-Received: by 2002:a37:2cc3:: with SMTP id s186mr8599655qkh.270.1615582014897;
 Fri, 12 Mar 2021 12:46:54 -0800 (PST)
MIME-Version: 1.0
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com> <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com>
In-Reply-To: <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 12 Mar 2021 12:46:43 -0800
Message-ID: <CAMmSBy8G_+mJ7S8c8q-NqjggfJnF9AfsORH9pwMjsCSSYUHExA@mail.gmail.com>
Subject: Re: Working Group for Secure Boot
To: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
	Olivier Lambert <olivier.lambert@vates.fr>, Trammell Hudson <hudson@trmm.net>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

Would love to participate! What are the next steps?

Thanks,
Roman.

On Fri, Mar 12, 2021 at 11:06 AM Bob Eshleman <bobbyeshleman@gmail.com> wrote:
>
> Awesome, it's great to see this interest.
>
> I'll wait until early next week to give more
> people a chance to pitch in, then start
> bugging everybody about availability to
> schedule a meeting.  I'll put together a
> small agenda then to get the ball rolling.
>
> Thanks all.
>

