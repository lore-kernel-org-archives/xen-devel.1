Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD391C433FE
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 15:42:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F03B23731
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 15:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F03B23731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46767.82901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIel-0005Bt-F0; Mon, 07 Dec 2020 15:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46767.82901; Mon, 07 Dec 2020 15:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIel-0005Bm-C7; Mon, 07 Dec 2020 15:42:31 +0000
Received: by outflank-mailman (input) for mailman id 46767;
 Mon, 07 Dec 2020 15:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oN+h=FL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kmIek-0005Bh-C7
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:42:30 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 897a60ae-c738-44bb-ab66-f26fd3337c03;
 Mon, 07 Dec 2020 15:42:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e25so14114184wme.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 07:42:29 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z3sm10343264wrn.59.2020.12.07.07.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 07:42:28 -0800 (PST)
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
X-Inumbo-ID: 897a60ae-c738-44bb-ab66-f26fd3337c03
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=E1VuPrE4WJQoV8bM0sRmdHKS5xodT+kbUXaTIWgNYPY=;
        b=Z1ealXO59PRCDmEt/rsJ0EB/MW5DQgDEKEx28Pe/WkHd3eWTHHn4e1R8l/2+jJJQc/
         L41S26vAO0e4lPO0kZJ/r7MOY/KPidvaOW2GIhNN2FTHp88sCiX+jzlLRjL/3cNiwsG2
         3ohUHGb9rheZPM8pfZ3mw8aQugy4V9nFpY+wM0Jd381rYLOWtrIXIBxrfhHgV965voki
         SfaPhzKISTiRjZwE/Sd2+dcXuXaHN51MiON9dLXMb0csMbbKkkL5Dn0Osp01gNebbaIn
         k+z4I18yhL8PtGMjjYgECiTPsV6kX/VPE5XkaAf7qrIzjgQ6djJXPJmZeCvMv7lsalFl
         UyvQ==
X-Gm-Message-State: AOAM531NvMeqbg4JgZ86UCdyn8SMzbdx7BgblIFJDt8J/06GoRT0AD3h
	KQGApEuTm/bsUJD9x/s2iF0=
X-Google-Smtp-Source: ABdhPJyr0ZpEBV4dbpWzfP1yKIW+Ax3gaOGs3ID0HaE+YIlzBtvigpe+mqlYx1fYNkY2ou4KNhpCyw==
X-Received: by 2002:a1c:bc88:: with SMTP id m130mr19497466wmf.82.1607355748739;
        Mon, 07 Dec 2020 07:42:28 -0800 (PST)
Date: Mon, 7 Dec 2020 15:42:26 +0000
From: Wei Liu <wl@xen.org>
To: Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: Re: [PATCH v1 3/4] Makefile: add build-tools-oxenstored
Message-ID: <20201207154226.b5sltvbugxm4psal@liuwe-devbox-debian-v2>
References: <cover.1605636799.git.edvin.torok@citrix.com>
 <516274ccf7ce5958251fa36b1bd63b3216937b8b.1605636800.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <516274ccf7ce5958251fa36b1bd63b3216937b8b.1605636800.git.edvin.torok@citrix.com>
User-Agent: NeoMutt/20180716

On Tue, Nov 17, 2020 at 06:24:11PM +0000, Edwin Török wrote:
> As a convenience so that oxenstored patches can be compile-tested
> using upstream's build-system before submitting upstream.
> 
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

Seeing that there is still pending comments from Andrew I won't commit
this series any time soon, despite Christian and Doug having acked this
series.

FAOD Andrew feel free to commit these patches once the comments are
addressed.

Wei.

