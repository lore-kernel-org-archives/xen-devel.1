Return-Path: <SRS0=Ri3b=7E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A112CC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 14:10:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7978F22226
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 14:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7978F22226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7ri-0006FC-Kx; Fri, 22 May 2020 13:37:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1fqI=7E=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jc7rh-0006F7-JN
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:37:33 +0000
X-Inumbo-ID: 63763ea6-9c31-11ea-9887-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63763ea6-9c31-11ea-9887-bc764e2007e4;
 Fri, 22 May 2020 13:37:33 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1D+RNv08gLkJTwbk4eBgP2Pnej0xaJZMD3gaEoSuM8ug9MRhupsUJ18/vp9k3vY62KL8qapM7z
 5vgY3c0Djb6L7oB4D3YU0pQxStjVVwrfU9GgkVVSCM1s7+dLmZh8aFZ5EwvKChFCgrHpzcznLP
 c3hOYmr7UsQfjN9uVFpAlqk7pBVZLK1mCrnSjhSZf0/dPPeZvm3WV1MwSkJxXiLr+fQ1MfcDTb
 Vq+dlW4oArVfu+faDeLV6BqO+dV7NQiQWSw0EjUo5TjT+oBjy3E/46aPLaRg5HCyg+blJa72V0
 /6o=
X-SBRS: 2.7
X-MesageID: 18461993
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18461993"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24263.54679.11598.155391@mariner.uk.xensource.com>
Date: Fri, 22 May 2020 14:37:27 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v7 00/19] Add support for qemu-xen runnning in a
 Linux-based stubdomain
In-Reply-To: <CAKf6xptVdXnoU0QVoS6bS_DUS8SkN6Jt2ueGJ0vhX8+SyFLt2g@mail.gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
 <4510049C-2AD1-4AE4-B0E5-F4231450EDB6@citrix.com>
 <001301d6301f$0b546cd0$21fd4670$@xen.org>
 <CAKf6xptVdXnoU0QVoS6bS_DUS8SkN6Jt2ueGJ0vhX8+SyFLt2g@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("Re: [PATCH v7 00/19] Add support for qemu-xen runnning in a Linux-based stubdomain"):
> I can do this.  What is the SUPPORT status for this?

I think that given we aren't testing it upstream, the answer
probably has to be "Tech Preview".

In general, I would love to see this (including your stub builder)
being tested by osstest.

Ian.

