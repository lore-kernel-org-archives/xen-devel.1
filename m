Return-Path: <SRS0=FqNL=A5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370F4C433E0
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2020 18:21:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123C52076A
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2020 18:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123C52076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwrT0-0003Ee-Gm; Sat, 18 Jul 2020 18:21:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0x8=A5=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jwrSz-0003EY-Ri
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 18:21:45 +0000
X-Inumbo-ID: 89008842-c923-11ea-bb8b-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89008842-c923-11ea-bb8b-bc764e2007e4;
 Sat, 18 Jul 2020 18:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 640521F66;
 Sat, 18 Jul 2020 20:21:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uaEEI_3M08tS; Sat, 18 Jul 2020 20:21:43 +0200 (CEST)
Received: from function (unknown [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 91BA71E09;
 Sat, 18 Jul 2020 20:21:43 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jwrSw-009BHR-Hz; Sat, 18 Jul 2020 20:21:42 +0200
Date: Sat, 18 Jul 2020 20:21:42 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 08/12] tools: move libxenctrl below tools/libs
Message-ID: <20200718182142.fgxmhayj6hxp26h2@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com,
 xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 ian.jackson@eu.citrix.com, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
 <20200715162511.5941-10-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715162511.5941-10-ian.jackson@eu.citrix.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: xen-devel@dornerworks.com, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 ian.jackson@eu.citrix.com, George Dunlap <george.dunlap@citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson, le mer. 15 juil. 2020 17:25:07 +0100, a ecrit:
> From: Juergen Gross <jgross@suse.com>
> 
> Today tools/libxc needs to be built after tools/libs as libxenctrl is
> depending on some libraries in tools/libs. This in turn blocks moving
> other libraries depending on libxenctrl below tools/libs.
> 
> So carve out libxenctrl from tools/libxc and move it into
> tools/libs/ctrl.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

>  stubdom/Makefile                              | 29 +++++-
>  stubdom/mini-os.mk                            |  2 +-

For that part,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

