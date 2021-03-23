Return-Path: <SRS0=CNy3=IV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E283C433C1
	for <xen-devel@archiver.kernel.org>; Tue, 23 Mar 2021 12:57:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F7E7619C2
	for <xen-devel@archiver.kernel.org>; Tue, 23 Mar 2021 12:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F7E7619C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100672.191941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOgb7-0002XS-V0; Tue, 23 Mar 2021 12:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100672.191941; Tue, 23 Mar 2021 12:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOgb7-0002XL-S0; Tue, 23 Mar 2021 12:57:25 +0000
Received: by outflank-mailman (input) for mailman id 100672;
 Tue, 23 Mar 2021 12:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5Jx=IV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lOgb6-0002XA-V3
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 12:57:24 +0000
Received: from mail-wr1-f49.google.com (unknown [209.85.221.49])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20df10a7-bfca-4295-9848-be040d7bec82;
 Tue, 23 Mar 2021 12:57:23 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id j7so20685010wrd.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Mar 2021 05:57:23 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s20sm2479983wmj.36.2021.03.23.05.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 05:57:22 -0700 (PDT)
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
X-Inumbo-ID: 20df10a7-bfca-4295-9848-be040d7bec82
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=etZp46PwEAVTsIYpopwYLgqaradwBQk3LEAbkmAGV1Q=;
        b=bA1Px6sl3r+sIZ9TGyfr9vqk28/GQsrFqnH9aoTfgfjcAIZ27dg2HbG9WTO3eJkY+9
         mBJ0VvnlS6j17qHqmnZKqM0r1lMYbbI0XcBUC9bepXUBRGURp1rTtzwv2HGbGq58ihMU
         peM5CvBUn0k4f/dU8pkIW2FFYa6MN0C3gswrRF1vZbiTVtSa5j0iwpyvYxjBtQrNpR9h
         hKywUGKVdl0vbahuIhBRj7JSWJI10Op5l1LCcM74jZI7ug2n83+PSZvGh6N8z31K7659
         N5MBOSVOfuIZTr0/8Z1CGFa80S0EbmD0GU/4BoXgg5LEXOHYXOapLlRZ4095AHSG5h8x
         OZow==
X-Gm-Message-State: AOAM531GDG7xXc7cmqiyvJu8PqGoYNMk4BRK5RqmysFL3UnNHjAOE+ko
	JeAwHex92jwRjf5inrTfpzs=
X-Google-Smtp-Source: ABdhPJzdEfQdNPtN2Ep5XhSd1r/VeLB0n7wO216rXsVmPRudAb4UJGeRMw9SOVfYspwgp/Ro6C0IRA==
X-Received: by 2002:a5d:698d:: with SMTP id g13mr3981164wru.2.1616504243238;
        Tue, 23 Mar 2021 05:57:23 -0700 (PDT)
Date: Tue, 23 Mar 2021 12:57:21 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH v2 for-4.14] tools: Fix pkg-config file for libxenstore
Message-ID: <20210323125721.2ljuaechs4k65d3v@liuwe-devbox-debian-v2>
References: <20210322162013.12639-1-andrew.cooper3@citrix.com>
 <20210322163847.23941-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322163847.23941-1-andrew.cooper3@citrix.com>

On Mon, Mar 22, 2021 at 04:38:47PM +0000, Andrew Cooper wrote:
> There are no dependenices on evtchn, ctrl or gnttab.
> 
> Fixes: 1b008e99 ("tools: provide pkg-config file for libxenstore")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

