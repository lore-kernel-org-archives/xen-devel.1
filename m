Return-Path: <SRS0=Vf37=J7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F86C433ED
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 17:31:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6B3613CD
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 17:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C6B3613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122640.231332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldytg-0004RM-MT; Tue, 04 May 2021 17:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122640.231332; Tue, 04 May 2021 17:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldytg-0004RF-Ij; Tue, 04 May 2021 17:31:48 +0000
Received: by outflank-mailman (input) for mailman id 122640;
 Tue, 04 May 2021 17:31:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E2aX=J7=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1ldyte-0004RA-H0
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:31:46 +0000
Received: from mail-qk1-x72d.google.com (unknown [2607:f8b0:4864:20::72d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64aafcbf-3934-4acd-b9eb-f716ad624911;
 Tue, 04 May 2021 17:31:45 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id u20so9349633qku.10
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 10:31:45 -0700 (PDT)
Received: from six (c-73-89-138-5.hsd1.vt.comcast.net. [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id h188sm11696162qkd.23.2021.05.04.10.31.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 May 2021 10:31:45 -0700 (PDT)
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
X-Inumbo-ID: 64aafcbf-3934-4acd-b9eb-f716ad624911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sJD6MEx691KAn1LgCzQ6M7yBTwppjZ9fnSlAHAME3fA=;
        b=BwaU+zyLfV4ULlzlYISsPd8lKqdE5xflCJKcuobtUMAZdfbMSGjEY9zbPC9NriQQkp
         6NklOhg69nV6I/QG6jivkK87I4GMepvRVxyCfWQy42lTi/+0ZklKUOaeu+5rcDefVF8k
         9dXvkG/hOd8vpCSX66matGZ+luQzfeR9JjbDHWBMYsHy08h1vlX6PB7JiYdHtrWEmLga
         Tcomqtc7N3QXBr9HhuNJ3ZClrIpQP2pN+yVYd8K7xoOQt+jN5x/3DkO69ZxDVjdXrNfQ
         CYmrBd3ks39fTu9YlxfHlZwCfn5mEK4ji94/hRyKCMEnFgRtGQh7Giu9MpvZDh5aVcXH
         LWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sJD6MEx691KAn1LgCzQ6M7yBTwppjZ9fnSlAHAME3fA=;
        b=X91N3SchaOJocarIapxMpyMRzqGYehdoZ+CNCc3wOZtHG9Hkjtak6TJkAIluyqMPXm
         qyrvlxyjBi+BSMPhiex8T6b2ho9Gx29NFcZx0fQo8spsI9lI1pX4C30vFv2ECpmsnMmb
         LeDmKmfByGmuq28ZQNjyxVjVdwIiwo6QBHFcy7+hGJO7p65FgAVXOQ4a2dR6WtK4uyXW
         N/RcZrYC5T0LA7Ez9dJKUdcHlG8u4vJRg9H1Crz5/dv3JbbKnfGZxi7yOzKuPIWNVHdo
         rCTlNf+M6/z4Nkshikvl3ZckZFZz9DIZ7mdML3KNRB809fCEMM2Peh69EeFroa7a4Tn9
         hIBQ==
X-Gm-Message-State: AOAM533NNFATaqdONRpL3T///osJAzlUTDI9ATj5NggVVxuUO2EoLOkZ
	x/PK36KXmdeKu+pB6XjePIU=
X-Google-Smtp-Source: ABdhPJy9J/h0ycF5GVMKcXiYEOaaNcMWgKGoz9eJwKbOjAYimSBfXYPv/nfLTFrNGf45osIkFb8nGQ==
X-Received: by 2002:a37:e47:: with SMTP id 68mr26768440qko.372.1620149505695;
        Tue, 04 May 2021 10:31:45 -0700 (PDT)
Date: Tue, 4 May 2021 13:31:43 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RFC v2 0/7] add function support to IDL
Message-ID: <20210504173143.GC7941@six>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
 <YJFsbHruoGA6aGMY@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJFsbHruoGA6aGMY@perard>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, May 04, 2021 at 04:46:52PM +0100, Anthony PERARD wrote:
> On Tue, Mar 02, 2021 at 08:46:12PM -0500, Nick Rosbrook wrote:
> > At a Xen Summit design session for the golang bindings (see [1]), we
> > agreed that it would be beneficial to expand the libxl IDL with function
> > support. In addition to benefiting libxl itself, this would allow other
> > language bindings to easily generate function wrappers.
> > 
> > The first version of this RFC is quite old [1]. I did address comments
> > on the original RFC, but also expanded the scope a bit. As a way to
> > evaluate function support, I worked on using this addition to the IDL to
> > generate device add/remove/destroy functions, and removing the
> > corresponding macros in libxl_internal.h. However, I stopped short of
> > actually completing a build with this in place, as I thought it made
> > sense to get feedback on the idea before working on the next step.
> 
> The series looks good to me, beside a few detail.
> 
> Cheers,
> 
> -- 
> Anthony PERARD

Thanks for reviewing!

-NR

