Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B31C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 12:33:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311A121479
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 12:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311A121479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH6Du-0006e7-Sf; Thu, 18 Apr 2019 12:33:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TYG2=SU=citrix.com=prvs=00452dca2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hH6Dt-0006dv-MO
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 12:33:01 +0000
X-Inumbo-ID: 1a094d80-61d6-11e9-86fa-0b14de257c3a
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a094d80-61d6-11e9-86fa-0b14de257c3a;
 Thu, 18 Apr 2019 12:33:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83883819"
Date: Thu, 18 Apr 2019 13:32:52 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20190418123252.GE30543@zion.uk.xensource.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190418123159.GD30543@zion.uk.xensource.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Committers <committers@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418123252.iXiPQ7AAjDLl2-f0YQxiVDGUfCh8DPhbkovh6ieOBiw@z>

Q2MgQW50aG9ueSBhcyB3ZWxsLiBGb3Jnb3QgdG8gZG8gdGhhdC4gU29ycnkuCgpPbiBUaHUsIEFw
ciAxOCwgMjAxOSBhdCAwMTozMTo1OVBNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+IEhpIGFsbAo+
IAo+IFdlIG5vdyBoYXZlIEdpdGxhYiBDSSBhcyBhIGNvbXBsZW1lbnRhcnkgc3lzdGVtIHRvIE9z
c3Rlc3QgYW5kIGhhdmUgcGxhbm5lZCB0bwo+IGFkZCBib3RzLiBJdCdzIGhpZ2ggdGltZSB3ZSB0
aGluayBhYm91dCBob3cgd2UgaW50ZWdyYXRlIHRoZW0gYW5kIGhvdyBpdCBtYXkKPiBpbXByb3Zl
IG91ciB3b3JrZmxvdy4KPiAKPiAjIyBSZXF1aXJlbWVudHMKPiAKPiAxLiBXZSB3YW50IHRvIGhh
dmUgbGlnaHQgd2VpZ2h0IGJ1aWxkIHRlc3RzIGJlZm9yZSBhIHBhdGNoIHNlcmllcyBpcyByZXZp
ZXdlZAo+IG9yIGNvbW1pdHRlZC4KPiAKPiAyLiBXZSBkb24ndCB3YW50IHRvIHB1c2ggYnJva2Vu
IHBhdGNoZXMgdG8gY2VudHJhbCByZXBvc2l0b3J5IHN1Y2ggdGhhdAo+IGV2ZXJ5b25lIGlzIGJs
b2NrZWQuCj4gCj4gMy4gV2UgZG9uJ3Qgd2FudCB0byBzaWduaWZpY2FudGx5IGNoYW5nZSBjb21t
aXR0ZXIgd29ya2Zsb3cuCj4gCj4gUmVxdWlyZW1lbnQgMiBtZWFucyB0aGF0IG91ciBjdXJyZW50
IGJyYW5jaGluZyBtb2RlbCB3aWxsIG5lZWQgdG8gYmUgY2hhbmdlZC4KPiBEZXRhaWxzIHdpbGwg
Zm9sbG93Lgo+IAo+ICMjIE92ZXJ2aWV3IG9mIGF1dG9tYXRpb24gc3lzdGVtcwo+IAo+IC0gR2l0
bGFiIENJCj4gCj4gICAgIEl0IGlzIGNhcGFibGUgb2YgcnVubmluZyBidWlsZCB0ZXN0cyB3aXRo
IHJlbGF0aXZlbHkgc2hvcnQgdHVybmFyb3VuZCB0aW1lLgo+IAo+IC0gQm90cyBsaWtlIFBhdGNo
ZXcgYW5kIFBhdGNod29yawo+IAo+ICAgICBUaGV5IGFyZSBhYmxlIHRvIHNsdXJwIHBhdGNoZXMg
ZnJvbSB4ZW4tZGV2ZWwgYW5kIG1heWJlIHJ1biBjdXN0b21pc2VkCj4gICAgIHNjcmlwdHMgb24g
dGhvc2UgcGF0Y2hlcy4KPiAKPiAtIE9zc3Rlc3QKPiAKPiAgICAgUHVzaGdhdGUsIGludGVncmF0
aW9uIHRlc3Qgc3lzdGVtLiBJdCBydW5zIG1vcmUgc29waGlzdGljYXRlZCB0ZXN0cwo+ICAgICBj
b21wYXJlZCB0byBHaXRsYWIgQ0kuIFR1cm5hcm91bmQgdGltZSBpcyBsb25nLgo+ICAgICAKPiAj
IyBOZXcgd29ybGQKPiAKPiBUaGVyZSB3aWxsIGJlIGFuIHVuaWZpZWQgZW5kcG9pbnQgZm9yIGNv
bW1pdHRlcnMgYW5kIGJvdHMuIENvbW1pdHRlcnMgYW5kIGJvdHMKPiB3aWxsIGhhdmUgdGhlaXIg
Z2l0IHRyZWVzLiBQYXRjaGVzIGFyZSBjb21taXR0ZWQgdG8gdGhvc2UgdHJlZXMuIEFuIGF1dG9t
YXRlZAo+IHN5c3RlbSB3aWxsIGdldCBwYXRjaGVzIGZyb20gdGhvc2UgdHJlZXMgYW5kIHRyaWdn
ZXIgQ0kgcnVucy4KPiAKPiBUaGUgc3lzdGVtIHdpbGwgcGljayB1cCBjb21taXRzIGZyb20gb25l
IG9mIHRoZSB0cmVlcywgbWVyZ2UgdGhlbSB3aXRoIG1hc3Rlcgo+IGFuZCBzZW5kIHRoZSBtZXJn
ZSB0byBDSSBzeXN0ZW1zLgo+IAo+IEZvciBib3RzLCBvbmx5IEdpdGxhYiBDSSBidWlsZCB0ZXN0
cyB3aWxsIHJ1bi4gUmVzdWx0cyBhcmUgc2VudCBiYWNrIHRvCj4geGVuLWRldmVsLgo+IAo+IEZv
ciBjb21taXR0ZXJzJyB0cmVlcywgYXQgZmlyc3QgR2l0bGFiIENJIGJ1aWxkIHRlc3RzIGFyZSBy
dW4sIGlmIHRoZSByZXN1bHQgaXMKPiBzdWNjZXNzZnVsLCB0aGUgbWVyZ2UgY29tbWl0IGlzIHN1
Ym1pdHRlZCB0byBvc3N0ZXN0LiBJZiBvc3N0ZXN0IGRlZW1zIHRoZQo+IG1lcmdlIGlzIGdvb2Qs
IHRoZSBtZXJnZSBpcyBwdXNoZWQgKHB1Ymxpc2hlZCkgdG8geGVuLmdpdCwgb3RoZXJ3aXNlIHRo
ZSBtZXJnZQo+IGlzIGRpc2NhcmRlZC4gVGVzdCByZXN1bHRzIGFyZSBzZW50IGJhY2sgdG8geGVu
LWRldmVsLgo+IAo+IFdpdGggdGhpcyBzeXN0ZW0sIGFsbCBwdWJsaXNoZWQgY29tbWl0cyBzaG91
bGQgaGF2ZSBhbHJlYWR5IHBhc3NlZCBHaXRsYWIgQ0kKPiBhbmQgb3NzdGVzdCB0ZXN0cy4KPiAK
PiAjIyBHYXBzCj4gCj4gVGhlIGNvbXBvbmVudCAvIHN5c3RlbSB3aGljaCBtZXJnZXMgdHJlZXMg
YW5kIGRyaXZlcyBDSSBzeXN0ZW1zIGlzIG1pc3NpbmcuCj4gCj4gUGF0Y2hldyBhbmQgUGF0Y2h3
b3JrIGRvbid0IGRvIGFsbCB0aGUgdGhpbmdzIHdlIGNhcmUgYWJvdXQgeWV0Lgo+IAo+ICMjIENv
bmNlcm5zCj4gCj4gRm9yIGluZGl2aWR1YWwgY29tbWl0dGVycywgdHVybmFyb3VuZCB0aW1lIG1h
eSBiZWNvbWUgbG9uZ2VyIHNpbmNlIHlvdSBuZWVkIHRvCj4gd2FpdCBmb3Igb3RoZXIgdHJlZXMg
dG8gYmUgcHJvY2Vzc2VkLgo+IAo+IEdpdGxhYiBDSSBkb2Vzbid0IGhhdmUgYSBzZWxmIHB1c2hn
YXRlLiBJZiBpdCBpcyBicm9rZW4gYnkgYWNjaWRlbnQgT3NzdGVzdAo+IHdpbGwgYmUgYmxvY2tl
ZC4KPiAKPiAKPiBUaG91Z2h0cyBhbmQgY29tbWVudHM/Cj4gCj4gV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
