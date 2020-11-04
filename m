Return-Path: <SRS0=nsPS=EK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F3EC2D0A3
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 13:36:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781C8204EC
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 13:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 781C8204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.19124.44345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaIxd-00076t-Qs; Wed, 04 Nov 2020 13:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19124.44345; Wed, 04 Nov 2020 13:36:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaIxd-00076m-NC; Wed, 04 Nov 2020 13:36:25 +0000
Received: by outflank-mailman (input) for mailman id 19124;
 Wed, 04 Nov 2020 13:36:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i8HL=EK=lunn.ch=andrew@srs-us1.protection.inumbo.net>)
 id 1kaIxb-00076h-W0
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 13:36:24 +0000
Received: from vps0.lunn.ch (unknown [185.16.172.187])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f4b8867-43b3-455d-91c4-7c0146521f9b;
 Wed, 04 Nov 2020 13:36:21 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kaIxP-005DAy-09; Wed, 04 Nov 2020 14:36:11 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=i8HL=EK=lunn.ch=andrew@srs-us1.protection.inumbo.net>)
	id 1kaIxb-00076h-W0
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 13:36:24 +0000
X-Inumbo-ID: 4f4b8867-43b3-455d-91c4-7c0146521f9b
Received: from vps0.lunn.ch (unknown [185.16.172.187])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4f4b8867-43b3-455d-91c4-7c0146521f9b;
	Wed, 04 Nov 2020 13:36:21 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
	(envelope-from <andrew@lunn.ch>)
	id 1kaIxP-005DAy-09; Wed, 04 Nov 2020 14:36:11 +0100
Date: Wed, 4 Nov 2020 14:36:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee.jones@linaro.org>
Cc: davem@davemloft.net, kuba@kernel.org, Juergen Gross <jgross@suse.com>,
	Song Liu <songliubraving@fb.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
	bpf@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>, xen-devel@lists.xenproject.org,
	KP Singh <kpsingh@chromium.org>, Yonghong Song <yhs@fb.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Martin KaFai Lau <kafai@fb.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/12] net: xen-netfront: Demote non-kernel-doc headers
 to standard comment blocks
Message-ID: <20201104133610.GB933237@lunn.ch>
References: <20201104090610.1446616-1-lee.jones@linaro.org>
 <20201104090610.1446616-9-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104090610.1446616-9-lee.jones@linaro.org>

On Wed, Nov 04, 2020 at 09:06:06AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/net/xen-netfront.c: In function ‘store_rxbuf’:
>  drivers/net/xen-netfront.c:2416:16: warning: variable ‘target’ set but not used [-Wunused-but-set-variable]
>  drivers/net/xen-netfront.c:1592: warning: Function parameter or member 'dev' not described in 'netfront_probe'
>  drivers/net/xen-netfront.c:1592: warning: Function parameter or member 'id' not described in 'netfront_probe'
>  drivers/net/xen-netfront.c:1669: warning: Function parameter or member 'dev' not described in 'netfront_resume'
>  drivers/net/xen-netfront.c:2313: warning: Function parameter or member 'dev' not described in 'netback_changed'
>  drivers/net/xen-netfront.c:2313: warning: Function parameter or member 'backend_state' not described in 'netback_changed'
> 

commit 8ed7ec1386b646130d80d017ecd4716f866ea570
Author: Andrew Lunn <andrew@lunn.ch>
Date:   Sat Oct 31 19:04:35 2020 +0100

    drivers: net: xen-netfront: Fixed W=1 set but unused warnings

Already in net-next.

	Andrew

