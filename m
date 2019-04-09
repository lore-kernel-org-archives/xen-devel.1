Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EBFC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:28:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D7302084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D7302084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpqy-0000nZ-9G; Tue, 09 Apr 2019 12:27:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpqx-0000nS-2V
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:27:51 +0000
X-Inumbo-ID: e2bb00e0-5ac2-11e9-8e9c-7beab8821c6f
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2bb00e0-5ac2-11e9-8e9c-7beab8821c6f;
 Tue, 09 Apr 2019 12:27:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100718"
Date: Tue, 9 Apr 2019 13:27:45 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: "Nuernberger, Stefan" <snu@amazon.de>
Message-ID: <20190409122745.GE30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-15-wei.liu2@citrix.com>
 <1552943659.6788.97.camel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552943659.6788.97.camel@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 14/55] x86/mm: rewrite xen_to_virt_l2e
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
Message-ID: <20190409122745.4z3Tu9UREJKoA4n0-YqAJQAM2ZGzxdRwUi4fUWKwl84@z>

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6MTlQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBSZXdyaXRlIHRoYXQgZnVuY3Rpb24gdG8gdXNlIHRoZSBuZXcgQVBJcy4gTW9k
aWZ5IGl0cyBjYWxsZXJzIHRvCj4gPiB1bm1hcAo+ID4gdGhlIHBvaW50ZXIgcmV0dXJuZWQuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiAt
LS0KPiAKPiBuaXQ6IHRoZSBjb21taXQgdGl0bGUgc2hvdWxkIGJlICd2aXJ0X3RvX3hlbl9sMmUn
IG5vdCAneGVuX3RvX3ZpcnQuLi4nCgpGaXhlZC4gVGhhbmtzLgoKV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
