Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A62FF885A
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2026 13:29:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1300694.1575203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKFpw-000076-Rb; Tue, 05 May 2026 13:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300694.1575203; Tue, 05 May 2026 13:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKFpw-00006z-Oq; Tue, 05 May 2026 13:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1300694;
 Tue, 05 May 2026 13:29:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <x1917x@gmail.com>) id 1wKFpv-00006t-0t
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 13:29:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKFpu-00GeDM-Du
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 15:29:18 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <x1917x@gmail.com>)
 id 69f9f0ac-5cb7-0a2a0a5109dd-0a2a4508b90e-6
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 15:29:18 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <x1917x@gmail.com>)
 id 69f9f0ad-63b5-0a2a45080019-d155802eede6-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 15:29:18 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso64918335e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 06:29:18 -0700 (PDT)
Received: from LinuxLaptop ([45.157.112.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48d181efe86sm17122945e9.24.2026.05.05.06.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 06:29:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Organization:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987757; x=1778592557; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nUYEn7nhqgGFbNBbFJFpnav+YGeEGrtazXqTB88DSxU=;
        b=NXM8hD+2lrnAqaTD0fs9zw0QiSdirrDlDi/wsAqVfUzQ/wMNXGaXM0i1LaLtOe14TL
         VJfysfCc0rIbmAqQS7bpllY7/WVddv/sxFVcBW7HVkEUnujLZd9k08cDXyR0wlUiMdke
         VaVMDUJyAjC6XCCnJyGISdtoqN28M2Cth5rlUALxgSbtfj6OS/x5ybzl2x8IjSqQphSx
         36qb1mRJuAv7J/4YmaeAGWGw1aVT/WKjIJVj5ROS6S2Pfk9HXA1pbUePK+q6/WeNjQtU
         SQDMJ5f2WAZejEPbKnmdgC0Qo2TmdDzlMNVmXjdrEpe325cR021Mb6eNJiMHN8pDr0DY
         goXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987757; x=1778592557;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUYEn7nhqgGFbNBbFJFpnav+YGeEGrtazXqTB88DSxU=;
        b=KMCYFBq9GdjumWn0l03T/naHIxfzceEiFRzDU5/Q8/NgAMKSu75PVC+3PrO+yBwpZ1
         3b7wdv0vUIe9rmbQNz1BqwXAC9WbHE4eg4RIm0M4Vg/9QmSm7N28xrwu1wcKLHsjl0+k
         TZalTlB+X4b63yYG3rdVVNhrp6o1dZnfOuYkQunkQo6wOLhDtFb0cuIHW6oDOhvINUyU
         9/bNzlKUBYyzL4AqFNftjvjPRBWt0id1KThOI4Ek6Nh9cHrRib0CKR5//ovfuFfIyp4p
         1XGrUKqy+04zawRYoHIC9OrSJoIo4L8AUGYjp/DSB2HWHPKdojkHXENocmHp0Duu2sXH
         Q3Pg==
X-Forwarded-Encrypted: i=1; AFNElJ/kIT8n0i8U6mcmEhyEOaiUcxWThlUgMd8lAlysh0YdMCmAwS4QAdixqwujGSBiQBKLNwfqj/1yiiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycN4c+DW2OaFlQ8h7NFFHQoNxMQCDful2kquPtgE8Na6OdH1IJ
	YzzoUm+hDAUtpzGcTotn7XOehTb6+FzxPT5R6QuQMzpoY14xjAhGXeDdTauiKzK+bBHWDQ==
X-Gm-Gg: AeBDieuSQNIb3cIzCz6YSDKxuKjwZcW8JlJihhjImJ6xj9jSd4JgIgmqf/UCpzUnDUq
	GTSq3y+YcLKajGPwCLv4fAVwAxOtUzIiOFcwm5AVqYj505egqo9bKJlmmA9PkFe5m66UpdKM7DO
	UGI4SJ47Eb2iiOoJu/BHlZ5nCMx9LrNiDIVoKoRXEDbAQ4O42HriWZkXDPTJ+72JKZfKb4b2CyC
	zDAHAM+m/Axppvm3LeaV16YJej+1AyzX4fzRK+FVriKYZXG0hFarCatBrCYpL8SmuBEZXm17kDR
	lskFW8afmsne8AnRjFY3mrNdzuIktYT/9idkUukFXfsoTQsgEwvaUPlsXhaO6HSjRo186eiSNWV
	2YU5zWjrfjKzLRxZl+Jl48MrqeuQETc5dmJwa6N+ZGtXlKsGfJyc4e43vBJhZHAGBsu3pf+793x
	rIW6CbTt3XTuBJKKvdgDABwZQZZFE=
X-Received: by 2002:a05:600c:c089:b0:48a:7772:c26b with SMTP id 5b1f17b1804b1-48a98676597mr202107985e9.26.1777987757588;
        Tue, 05 May 2026 06:29:17 -0700 (PDT)
Date: Tue, 5 May 2026 15:29:12 +0200
From: Alexey G <x1917x@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
 <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 00/17] Q35 initial support for HVM guests
Message-ID: <20260505152912.6b73c551@LinuxLaptop>
In-Reply-To: <99756799-27be-45ae-99be-eae5b0c41a11@suse.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
	<afBmWSFsyrwy_Ru1@macbook.local>
	<99756799-27be-45ae-99be-eae5b0c41a11@suse.com>
Organization: none
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1777987758-C3171DB1-9830AEBB/0/0
X-purgate-type: clean
X-purgate-size: 891

On Mon, 4 May 2026 12:45:23 +0200
Jan Beulich <jbeulich@suse.com> wrote:

>> Why do you need multi bus support to expose PCIe capabilities?  I'm
>> not seeing the relation between those two.  You could still expose a
>> single bus on the MCFG table.
>
>Can a valid PCIe topology be expressed with just bus 0? If an endpoint
>to be handed to a guest isn't root complex integrated, would it be
>valid to make it appear so by putting it on bus 0?

No, unfortunately, it will fail at least under Windows' pci.sys
driver. Unless they changed something in the past years. To place an
endpoint device to bus 0, we need to emulate that it's a
chipset-integrated device by trapping its PCIe Capabilities reads.

I found an old pci.sys + .pdb symbols which I used for debugging back
in 2017 and, if I remember correctly, the failing function was 
`ExpressValidateFabricTopology()`.

