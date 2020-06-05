Return-Path: <SRS0=7n4I=7S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF36C433DF
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 10:46:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6923A2075B
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 10:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6923A2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh9rB-0002Tr-1J; Fri, 05 Jun 2020 10:45:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OQMZ=7S=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jh9r9-0002Tm-Jc
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 10:45:47 +0000
X-Inumbo-ID: b4b29952-a719-11ea-af98-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4b29952-a719-11ea-af98-12813bfff9fa;
 Fri, 05 Jun 2020 10:45:44 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QTg5fgQPoWKe6zwATi+kwHZFL/E6D7Su4vkTGv++D7ihitAjb9mOPhR/91uzUCFM8hL4Cwl0ax
 Scob+SCUVpfKOm9jcSiHeZsjcak6ODodG3KCyHu7PAfbou//KJDcSg9r5DY9L/9sYGAug50uLR
 56jxxlUqAZiR1HQpVaSQV5gAWnWMyacsSxDhrD2bqv4xvkPWrRO2rYpXONX6pKSMSVo/M06cMm
 EnZYC14qoMQyhrLxyY27VNCeHzlxvh+aX3k+NXsFNqLXoJBB1FT0Jik795kJTE7xMu/UOKBrXl
 1Ow=
X-SBRS: 2.7
X-MesageID: 19311942
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,476,1583211600"; d="scan'208";a="19311942"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24282.8784.496525.724949@mariner.uk.xensource.com>
Date: Fri, 5 Jun 2020 11:45:36 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 RFC] docs/support-matrix: Gross bodge to unbreak
 docs rendering
In-Reply-To: <c73dd31b-7ac6-5016-3012-ca95cf80c522@suse.com>
References: <20200604205226.14518-1-andrew.cooper3@citrix.com>
 <f2a2fbe6-c198-708c-b8c8-d8e9c27d00ee@citrix.com>
 <c73dd31b-7ac6-5016-3012-ca95cf80c522@suse.com>
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jan Beulich writes ("Re: [PATCH for-4.14 RFC] docs/support-matrix: Gross bodge to unbreak docs rendering"):
> I was about to ask why we don't do that.

When I wrote the code in question, I was afraid that this makefile
would change in a way that would break that approach.  Unfortunately
it seems I guessed wrong and instead it changed in a way that broke
the approach I took instead.

So +1 to this.

Ian.

