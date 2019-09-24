Return-Path: <SRS0=VluW=XT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772D5C432C1
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 14:46:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D092064A
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 14:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D092064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm4l-0002Dv-1O; Tue, 24 Sep 2019 14:45:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCm4j-0002Dd-Ev
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:45:57 +0000
X-Inumbo-ID: 03c68412-deda-11e9-961f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 03c68412-deda-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 14:45:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8936CADF7;
 Tue, 24 Sep 2019 14:45:55 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-30-jgross@suse.com>
 <c82b5b04-ff81-8600-d959-b3dcc90575a2@suse.com>
 <184451ad-4314-8887-651a-028b4b5844e5@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4325236-9381-9d33-e461-709fd80bf2dd@suse.com>
Date: Tue, 24 Sep 2019 16:45:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <184451ad-4314-8887-651a-028b4b5844e5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 29/47] xen/sched: introduce
 unit_runnable_state()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxNjoyNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMy4wOS4xOSAx
NzoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBUb2RheSB0aGUgdmNwdSBydW5zdGF0ZSBvZiBhIG5ldyBzY2hlZHVs
ZWQgdmNwdSBpcyBhbHdheXMgc2V0IHRvCj4+PiAicnVubmluZyIgZXZlbiBpZiBhdCB0aGF0IHRp
bWUgdmNwdV9ydW5uYWJsZSgpIGlzIGFscmVhZHkgcmV0dXJuaW5nCj4+PiBmYWxzZSBkdWUgdG8g
YSByYWNlIChlLmcuIHdpdGggcGF1c2luZyB0aGUgdmNwdSkuCj4+Cj4+IEkgY2FuIHNlZSB0aGlz
IHBhcnQsIC4uLgo+Pgo+Pj4gV2l0aCBjb3JlIHNjaGVkdWxpbmcgdGhpcyBjYW4gbm8gbG9uZ2Vy
IHdvcmsgYXMgbm90IGFsbCB2Y3B1cyBvZiBhCj4+PiBzY2hlZHVsZSB1bml0IGhhdmUgdG8gYmUg
InJ1bm5pbmciIHdoZW4gYmVpbmcgc2NoZWR1bGVkLiBTbyB0aGUgdmNwdSdzCj4+PiBuZXcgcnVu
c3RhdGUgaGFzIHRvIGJlIHNlbGVjdGVkIGF0IHRoZSBzYW1lIHRpbWUgYXMgdGhlIHJ1bm5hYmls
aXR5IG9mCj4+PiB0aGUgcmVsYXRlZCBzY2hlZHVsZSB1bml0IGlzIHByb2JlZC4KPj4KPj4gLi4u
IGJ1dCBJIGNvbnRpbnVlIGhhdmluZyB0cm91YmxlIGhlcmUuIElmIGl0IGhhcyBiZWVuIG9rYXkg
dG8gc2V0Cj4+IGEgdkNQVSBubyBsb25nZXIgcnVubmFibGUgdG8gInJ1bm5pbmciIG5ldmVydGhl
bGVzcywgd2h5IHdvdWxkIHRoZQo+PiBzYW1lIG5vdCBiZSB0cnVlIGZvciBzY2hlZHVsZSB1bml0
cz8gUGFydCBvZiB0aGUgcHJvYmxlbSBtYXkgYmUKPj4gdGhhdCAuLi4KPiAKPiBUaGUgZGlmZmVy
ZW5jZSBpcyB0aGUgbmVlZCB0byBkcm9wIHRoZSBzY2hlZHVsaW5nIGxvY2sgZm9yIGRvaW5nIHRo
ZQo+IHJlbmRlenZvdXMuIHZjcHVfc2xlZXAoKSBvciB2Y3B1X3dha2UoKSBjb3VsZCBub3cgaW50
ZXJmZXJlIHdpdGgKPiBzY2hlZHVsaW5nIGluIGEgd2F5IHdoaWNoIHdhcyBub3QgcG9zc2libGUg
YmVmb3JlLgoKQWgsIHJpZ2h0LiBCdXQgdGhpcyB3b3VsZCBiZSB3b3J0aCBtZW50aW9uaW5nIGV4
cGxpY2l0bHkgaGVyZSB0bwpoZWxwIHJlYWRlcnMsIHdvdWxkbid0IGl0PyBEb2Vzbid0IG5lZWQg
dG8gYmUgbW9yZSB0aGFuIGhhbGYgYQpzZW50ZW5jZSAuLi4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
