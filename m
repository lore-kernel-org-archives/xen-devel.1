Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2A3C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F3920857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F3920857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpmM-0008LT-De; Tue, 09 Apr 2019 12:23:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpmL-0008L7-Pc
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:23:05 +0000
X-Inumbo-ID: 386764a8-5ac2-11e9-a6fc-5f5d5fd6a7b5
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 386764a8-5ac2-11e9-a6fc-5f5d5fd6a7b5;
 Tue, 09 Apr 2019 12:23:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100344"
Date: Tue, 9 Apr 2019 13:22:55 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: "Nuernberger, Stefan" <snu@amazon.de>
Message-ID: <20190409122255.GR1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-24-wei.liu2@citrix.com>
 <1552943674.6788.102.camel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552943674.6788.102.camel@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 23/55] x86_64/mm: drop l4e_to_l3e
 invocation from paging_init
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409122255.sLPwVPsOj3myZShWaQ6JjwXuxL5vmAic3HMaQhfbBPs@z>

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6MzRQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+
IAo+IEFueSByZWFzb24gd2h5IHRoaXMgaXNuJ3Qgc3F1YXNoZWQgd2l0aCB0aGUgcHJldmlvdXMg
cGF0Y2g/CgpCZWNhdXNlIG9mIGhvdyBJIGNsYXNzaWZpZWQgY2hhbmdlcyAtLSBsWGVfdG9fbFll
IGJlbG9uZ3MgdG8gdGhlaXIgb3duCmdyb3VwLgoKSSBjYW4gc3F1YXNoIGEgbG90IG9mIHN0dWZm
IHRvZ2V0aGVyIGJ1dCBJIGRlY2lkZWQgdGhpcyB3YXkgd2FzIGJldHRlci4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
