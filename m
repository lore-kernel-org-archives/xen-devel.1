Return-Path: <SRS0=k7LG=6U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B61C28CBC
	for <xen-devel@archiver.kernel.org>; Wed,  6 May 2020 16:40:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8554820708
	for <xen-devel@archiver.kernel.org>; Wed,  6 May 2020 16:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8554820708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWN62-0002xS-O8; Wed, 06 May 2020 16:40:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qF4D=6U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jWN61-0002xM-3j
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 16:40:33 +0000
X-Inumbo-ID: 4d23be88-8fb8-11ea-b9cf-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d23be88-8fb8-11ea-b9cf-bc764e2007e4;
 Wed, 06 May 2020 16:40:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id h4so3292745wmb.4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 09:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MkI6n+fViqiHgtCJ+QWC+BPhYGKK5stRiIiXuexn7Fg=;
 b=K7xe6adkFQG3t9eaIUCWmA8uZOZA3tuIzdYrxrWeaiWX/IiCzi0YDyjdMNWTWOotKG
 8K0G0MKnvb9Vnlm1LtEvFdXqifTunmogP4Xmtx6kIKsEXz/Ma2v39sV5ElbKKMnmbjqR
 HmBgUOR55OCJ/nOT6+qvXsIJvyU/WnDwKJTakoYddQ9gG8ipAIXxocqNaAy/jbW01xQ3
 sqoQY0tEoma8UZhEN3upDmKvQfMiPZ+fS5hsWgvwZd324orxtzf9zeQkINDgiEiO8ua4
 hCc4LdoK5fGKWMgUhQhgS+Bzyv3TtsEY/QYtz1542TIcXk6ToT8rJizedAdmKXoq0UXD
 qchg==
X-Gm-Message-State: AGi0PuZcLvsADVgSnODozKUgsOH7iuKNGQWQs159cNAaqHlPrBv6gCGg
 3IesB/sP/rui6450pwU0Qr4=
X-Google-Smtp-Source: APiQypJXVodWL27zHkWTWGS2VT/N7zjssoQQz1SHi2w7+RdFqzfuz3UtnYfDDIaYTWoBWy2EyTXyuA==
X-Received: by 2002:a05:600c:14d4:: with SMTP id
 i20mr5755869wmh.118.1588783231650; 
 Wed, 06 May 2020 09:40:31 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z132sm910961wmc.29.2020.05.06.09.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 09:40:31 -0700 (PDT)
Date: Wed, 6 May 2020 16:40:29 +0000
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v18 1/2] tools/libxc: add VM forking functions
Message-ID: <20200506164029.ako4t7yubxslhcg2@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <a59dabe3a40d4f3709d3ad6ca605523f180c2dc5.1588772376.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a59dabe3a40d4f3709d3ad6ca605523f180c2dc5.1588772376.git.tamas.lengyel@intel.com>
User-Agent: NeoMutt/20180716
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 06, 2020 at 06:41:43AM -0700, Tamas K Lengyel wrote:
> Add functions to issue VM forking hypercalls
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Acked-by: Wei Liu <wl@xen.org>

