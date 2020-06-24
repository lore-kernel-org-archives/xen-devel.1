Return-Path: <SRS0=ysB/=AF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1FDC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 12:04:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572FB2088E
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 12:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 572FB2088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo48o-0004ej-7a; Wed, 24 Jun 2020 12:04:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ja3c=AF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jo48m-0004ee-KP
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:04:32 +0000
X-Inumbo-ID: dc8028c0-b612-11ea-bca7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc8028c0-b612-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 12:04:31 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cv1J7JsxQH6wgFPVSyUdMst97wmPFW0i2kowllzuONv2IzsWniv5e4SOiDJXEOybb8JLW7aw5U
 IMNNIBb3Dr4zuKqVWFtJgYnvTSSRugnyBibEeIyjun25260emzoZvL/Xoji84cCW33RpM2OTi/
 1LnleDf7yNVo71MVQv8rkQZzTt5xgJcWNhc/YMcsLxTXGR2po5x/EnYOj79gPfaMQJhrwt8cOV
 GsCPsppBgK7xgCGxOhKyVw4MZ/ntFy9ddsfGJt5MU0MwRw8AtfqsOf09Peb7Bk1Q6C97NE+Nyd
 uvg=
X-SBRS: 2.7
X-MesageID: 21032175
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,275,1589256000"; d="scan'208";a="21032175"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24307.16713.764272.855818@mariner.uk.xensource.com>
Date: Wed, 24 Jun 2020 13:04:25 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
In-Reply-To: <cefe0cc7-5b1c-4ae2-a160-3857cc131a3d@xen.org>
References: <20200613184132.11880-1-julien@xen.org>
 <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
 <35c8373f-b691-d95e-17de-021c72faf216@xen.org>
 <alpine.DEB.2.21.2006161322210.24982@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2cnMUiYBz+hA2_hjf5ShVh66tUwE9kbjqSM-H0TkTbyw@mail.gmail.com>
 <alpine.DEB.2.21.2006171146510.14005@sstabellini-ThinkPad-T480s>
 <cefe0cc7-5b1c-4ae2-a160-3857cc131a3d@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, George Dunlap <George.Dunlap@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely the padding for all arches"):
> (+ Committers)
...
> As Jan and you disagree on the approach, I would like to get more input.
> 
> To summarize the discussion, the document for PV calls and the public 
> headers don't match when describing the padding. There is a disagreement 
> on which of the two are the authority and therefore which one to fix.
> 
> Does anyone else have a preference on the approach?

Hi.

>[Jan:]
>> I am leaning towards the header as authoritative because this has
>> always been the case in the past and nothing in xen.git says
>> otherwise. However I am not a user of pvcalls, so I don't really have
>> any big incentive to go either way.

I think the practice of using headers as protocol specs is not a
particularly good one.  Certainly my expectations anywhere outside the
Xen Project is that if there's a doc, that is at the very least on par
with any header file.  Of course there are possible compatibility
implications:

> Yeah, we are risking breaking one set of users either way :-/
> In reality, we are using pvcalls on arm64 in a new project (but it is
> still very green). I am not aware of anybody using pvcalls on x86
> (especially x86_32).
> 
> I would prefer to honor the pvcalls.pandoc specification because that is
> what it was meant to be, and also leads to a better protocol
> specification.

pvcalls in Linux is Tech Preview / Experimental AFAICT ?  I think that
means we can de jure change things like this.

And it seems that we don't think there are any actual users who would
experience compatibility problems.

So I don't think the compatibility concerns are a reason not to change
the header rather than the document.

So I think my conclusion is the same as Julien's: we should change the
header to match the doc.

> >> For the future, I would highly suggest writing down the support
> >> decision in xen.git. This would avoid such debate on what is the
> >> authority...
> > 
> > Yes that's the way to go

Maybe it would be worth putting a note somewhere in the headers saying
the headers are provided for convenience but that the ABIs and
protocols are as specified in the docs (at least where docs exist).

Ian.

