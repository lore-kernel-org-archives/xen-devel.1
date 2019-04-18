Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC26C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 17:54:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AFB3217D7
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 17:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDM89EWm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AFB3217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHBEg-0002B0-Ub; Thu, 18 Apr 2019 17:54:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tnl2=SU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHBEf-0002Av-03
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 17:54:09 +0000
X-Inumbo-ID: f5baab29-6202-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f5baab29-6202-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 17:54:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4B29217D7;
 Thu, 18 Apr 2019 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555610046;
 bh=gNIwIry50mjfkknyIy4XnOehTO/BMPQEh+Gu+K051WU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=CDM89EWmlGtO1EuXHr3AK4SLm/bXYvc0EUJ9wELCWxDk01+fOvvopdGUEvO/9eKD7
 M0jXR98f0wsM+G7mon3V+ScAiiyu+7KBkZJUKhpT/MS3+Zx7tqvNql7M1jenjjgUA4
 uJiQBuZrsu6vv/zf6OGulN4+tGHAmrUerqnYWnaU=
Date: Thu, 18 Apr 2019 10:54:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Wei Liu <wei.liu2@citrix.com>
In-Reply-To: <20190418123159.GD30543@zion.uk.xensource.com>
Message-ID: <alpine.DEB.2.10.1904181048040.1370@sstabellini-ThinkPad-X260>
References: <20190418123159.GD30543@zion.uk.xensource.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418175405._03L7jQYLYTA-OZxDwiFcfASwJ3G-JfYzURmGRUCia0@z>

T24gVGh1LCAxOCBBcHIgMjAxOSwgV2VpIExpdSB3cm90ZToKPiBIaSBhbGwKPiAKPiBXZSBub3cg
aGF2ZSBHaXRsYWIgQ0kgYXMgYSBjb21wbGVtZW50YXJ5IHN5c3RlbSB0byBPc3N0ZXN0IGFuZCBo
YXZlIHBsYW5uZWQgdG8KPiBhZGQgYm90cy4gSXQncyBoaWdoIHRpbWUgd2UgdGhpbmsgYWJvdXQg
aG93IHdlIGludGVncmF0ZSB0aGVtIGFuZCBob3cgaXQgbWF5Cj4gaW1wcm92ZSBvdXIgd29ya2Zs
b3cuCj4gCj4gIyMgUmVxdWlyZW1lbnRzCj4gCj4gMS4gV2Ugd2FudCB0byBoYXZlIGxpZ2h0IHdl
aWdodCBidWlsZCB0ZXN0cyBiZWZvcmUgYSBwYXRjaCBzZXJpZXMgaXMgcmV2aWV3ZWQKPiBvciBj
b21taXR0ZWQuCj4gCj4gMi4gV2UgZG9uJ3Qgd2FudCB0byBwdXNoIGJyb2tlbiBwYXRjaGVzIHRv
IGNlbnRyYWwgcmVwb3NpdG9yeSBzdWNoIHRoYXQKPiBldmVyeW9uZSBpcyBibG9ja2VkLgo+IAo+
IDMuIFdlIGRvbid0IHdhbnQgdG8gc2lnbmlmaWNhbnRseSBjaGFuZ2UgY29tbWl0dGVyIHdvcmtm
bG93Lgo+IAo+IFJlcXVpcmVtZW50IDIgbWVhbnMgdGhhdCBvdXIgY3VycmVudCBicmFuY2hpbmcg
bW9kZWwgd2lsbCBuZWVkIHRvIGJlIGNoYW5nZWQuCj4gRGV0YWlscyB3aWxsIGZvbGxvdy4KPiAK
PiAjIyBPdmVydmlldyBvZiBhdXRvbWF0aW9uIHN5c3RlbXMKPiAKPiAtIEdpdGxhYiBDSQo+IAo+
ICAgICBJdCBpcyBjYXBhYmxlIG9mIHJ1bm5pbmcgYnVpbGQgdGVzdHMgd2l0aCByZWxhdGl2ZWx5
IHNob3J0IHR1cm5hcm91bmQgdGltZS4KPiAKPiAtIEJvdHMgbGlrZSBQYXRjaGV3IGFuZCBQYXRj
aHdvcmsKPiAKPiAgICAgVGhleSBhcmUgYWJsZSB0byBzbHVycCBwYXRjaGVzIGZyb20geGVuLWRl
dmVsIGFuZCBtYXliZSBydW4gY3VzdG9taXNlZAo+ICAgICBzY3JpcHRzIG9uIHRob3NlIHBhdGNo
ZXMuCj4gCj4gLSBPc3N0ZXN0Cj4gCj4gICAgIFB1c2hnYXRlLCBpbnRlZ3JhdGlvbiB0ZXN0IHN5
c3RlbS4gSXQgcnVucyBtb3JlIHNvcGhpc3RpY2F0ZWQgdGVzdHMKPiAgICAgY29tcGFyZWQgdG8g
R2l0bGFiIENJLiBUdXJuYXJvdW5kIHRpbWUgaXMgbG9uZy4KPiAgICAgCj4gIyMgTmV3IHdvcmxk
Cj4gCj4gVGhlcmUgd2lsbCBiZSBhbiB1bmlmaWVkIGVuZHBvaW50IGZvciBjb21taXR0ZXJzIGFu
ZCBib3RzLiBDb21taXR0ZXJzIGFuZCBib3RzCj4gd2lsbCBoYXZlIHRoZWlyIGdpdCB0cmVlcy4g
UGF0Y2hlcyBhcmUgY29tbWl0dGVkIHRvIHRob3NlIHRyZWVzLiBBbiBhdXRvbWF0ZWQKPiBzeXN0
ZW0gd2lsbCBnZXQgcGF0Y2hlcyBmcm9tIHRob3NlIHRyZWVzIGFuZCB0cmlnZ2VyIENJIHJ1bnMu
Cj4gCj4gVGhlIHN5c3RlbSB3aWxsIHBpY2sgdXAgY29tbWl0cyBmcm9tIG9uZSBvZiB0aGUgdHJl
ZXMsIG1lcmdlIHRoZW0gd2l0aCBtYXN0ZXIKPiBhbmQgc2VuZCB0aGUgbWVyZ2UgdG8gQ0kgc3lz
dGVtcy4KPiAKPiBGb3IgYm90cywgb25seSBHaXRsYWIgQ0kgYnVpbGQgdGVzdHMgd2lsbCBydW4u
IFJlc3VsdHMgYXJlIHNlbnQgYmFjayB0bwo+IHhlbi1kZXZlbC4KPiAKPiBGb3IgY29tbWl0dGVy
cycgdHJlZXMsIGF0IGZpcnN0IEdpdGxhYiBDSSBidWlsZCB0ZXN0cyBhcmUgcnVuLCBpZiB0aGUg
cmVzdWx0IGlzCj4gc3VjY2Vzc2Z1bCwgdGhlIG1lcmdlIGNvbW1pdCBpcyBzdWJtaXR0ZWQgdG8g
b3NzdGVzdC4gSWYgb3NzdGVzdCBkZWVtcyB0aGUKPiBtZXJnZSBpcyBnb29kLCB0aGUgbWVyZ2Ug
aXMgcHVzaGVkIChwdWJsaXNoZWQpIHRvIHhlbi5naXQsIG90aGVyd2lzZSB0aGUgbWVyZ2UKPiBp
cyBkaXNjYXJkZWQuIFRlc3QgcmVzdWx0cyBhcmUgc2VudCBiYWNrIHRvIHhlbi1kZXZlbC4KPiAK
PiBXaXRoIHRoaXMgc3lzdGVtLCBhbGwgcHVibGlzaGVkIGNvbW1pdHMgc2hvdWxkIGhhdmUgYWxy
ZWFkeSBwYXNzZWQgR2l0bGFiIENJCj4gYW5kIG9zc3Rlc3QgdGVzdHMuCj4gCj4gIyMgR2Fwcwo+
IAo+IFRoZSBjb21wb25lbnQgLyBzeXN0ZW0gd2hpY2ggbWVyZ2VzIHRyZWVzIGFuZCBkcml2ZXMg
Q0kgc3lzdGVtcyBpcyBtaXNzaW5nLgo+IAo+IFBhdGNoZXcgYW5kIFBhdGNod29yayBkb24ndCBk
byBhbGwgdGhlIHRoaW5ncyB3ZSBjYXJlIGFib3V0IHlldC4KCkkgdW5kZXJzdGFuZCB0aGUgZ2Vu
ZXJhbCBwcmluY2lwbGUgYW5kIEkgYW0gb24gYm9hcmQuIEJ1dCBJIG1pc3Npbmcgc29tZQpkZXRh
aWxzLgoKSXMgdGhlIGlkZWEgdGhhdCBlYWNoIGNvbW1pdHRlciB3b3VsZCBoYXZlIGhpcyBvd24g
Z2l0IHRyZWUgYW5kIGJyYW5jaAp3aXRoIGEgc3BlY2lmaWMgbmFtZSB3aGljaCB3b3VsZCBiZSBw
aWNrZWQgdXAgYXV0b21hdGljYWxseSBieSB0aGUKQ0ktbG9vcCBkYWlseT8gSW4gdGhlIHN0eWxl
IG9mIGxpbnV4LW5leHQ/IElmIGl0IHBhc3NlZCwgaXQgaXMgZ2l2ZW4gdG8KT1NTVGVzdCBhdXRv
bWF0aWNhbGx5IGFuZCBldmVudHVhbGx5IGNvbW1pdHRlZD8KCk9yIGlzIGl0IHRoZSBpZGVhIHRo
YXQgZWFjaCBjb21taXR0ZXIgd291bGQgaGF2ZSBhIHdheSB0byBtYW51YWxseQpzdWJtaXQgYSBi
cmFuY2ggdG8gdGhlIENJLWxvb3AgZm9yIHRlc3Rpbmcgd2hlbiBoZSB3aXNoZWQgdG8gZG8gc28/
ICBJbgp0aGUgc3R5bGUgb2YgZ2l0aHViIHB1bGwtcmVxdWVzdHMtYmFzZWQgQ0ktbG9vcHM/IElm
IHRoaXMgaXMgdGhlIGNhc2UsCnRoZW4gd2UganVzdCBuZWVkIGEgd2F5IHRvIHRyaWdnZXIgdGhl
IENJLWxvb3BzIG9uIGEgZ2l2ZW4gYnJhbmNoPwoKSW4gYW55IGNhc2UsIG15IG9ubHkgZmVlZGJh
Y2sgd291bGQgYmUgdG8gYWxzbyBhbGxvdyBDSS1sb29wcyBvbgpicmFuY2hlcyB0aGF0IGFyZSAq
bm90KiBtZWFudCB0byBiZSBjb21taXR0ZWQgYXV0b21hdGljYWxseSBpZiB0ZXN0cwpwYXNzLiBT
byB0aGF0IHdlIGNhbiBhcHBseSBhIGNvbXBsZXggc2VyaWVzIHRvIGEgYnJhbmNoIGFuZCBzZWUg
aWYgdGVzdHMKcGFzcyBiZWZvcmUgZG9pbmcgcmV2aWV3cyBvciBydW5uaW5nIGV4cGVyaW1lbnRz
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
