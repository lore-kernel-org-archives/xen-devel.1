Return-Path: <SRS0=soTB=JS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70915C433B4
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 10:16:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1224261427
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 10:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1224261427
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.114312.217841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9ud-00078f-30; Wed, 21 Apr 2021 10:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114312.217841; Wed, 21 Apr 2021 10:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9uc-00078Y-W2; Wed, 21 Apr 2021 10:16:50 +0000
Received: by outflank-mailman (input) for mailman id 114312;
 Wed, 21 Apr 2021 10:16:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZ9ub-00078P-2n
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:16:49 +0000
Received: from mail-wm1-f41.google.com (unknown [209.85.128.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2944295-5adb-478c-9c3f-619d366b8d58;
 Wed, 21 Apr 2021 10:16:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so975227wma.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:16:48 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r2sm2331449wrt.79.2021.04.21.03.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:16:47 -0700 (PDT)
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
X-Inumbo-ID: b2944295-5adb-478c-9c3f-619d366b8d58
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aOtW8gfOPkw/gwZBHl+ljZsleNLy5GnKy82cQDfNhYE=;
        b=QmbwgHz6WDWxTQhmrWQ9FS7v1KKt+pQWFAK6x9K9NfGItkzPS3hXQqiv/e8kQD1r2V
         34rzacn19kODGBnAmMtEIEezvYP2Q+aIaVV1aLlcJ1Y4o9bdhRPCnzj8nx1Rp5A2a5LQ
         zKXnwwZqHMLZkOxR5Rv0m/1V0r6TGbO0yhA0GBZvdp04Y5N1qBJ8INskWFCROWcZ1zR5
         Av/yPqUmVhw7qAN3vQmGzqhDtjgTHLF7VtXFgnNxB1fjkLBCx19xmXjkX0OUTm8aO0UV
         Fxe/Eo7wrcwICqInb+SCJnUbRLtx6NEnZl35jaj+PzhA+FGjYaXIj/wo9dl329/XGOlX
         lB8Q==
X-Gm-Message-State: AOAM531vW2F/BUJTox74ksv7Z6scPMQ2qDbqsdLTAQ5DiDoRPLIXUdJp
	SVW6UbUo6c554Y4DM9Z25vw=
X-Google-Smtp-Source: ABdhPJyif/NErDoJrYKn/uij1ykGtr1u+mOzbPoRw4hgk6ZHJr7EJ1hKxmx0o9VT1CJvmgCBkt+xiA==
X-Received: by 2002:a1c:2:: with SMTP id 2mr9085819wma.113.1619000207604;
        Wed, 21 Apr 2021 03:16:47 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:16:46 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 6/6] tools/libs/guest: make some definitions private
 to libxenguest
Message-ID: <20210421101646.276mcsqzbegq6e57@liuwe-devbox-debian-v2>
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412152236.1975-7-jgross@suse.com>

On Mon, Apr 12, 2021 at 05:22:36PM +0200, Juergen Gross wrote:
> There are some definitions which are used in libxenguest only now.
> Move them from libxenctrl over to libxenguest.
> 
> Remove an unused macro.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

