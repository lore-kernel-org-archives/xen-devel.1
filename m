From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/7] events: drop arch_evtchn_inject()
Date: Mon, 11 Mar 2019 16:49:55 +0000
Message-ID: <04561b86-199f-52b9-0373-425a207652ce@citrix.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C869142020000780021D5F1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qj7e=RO=citrix.com=prvs=9661cd40b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h3O7j-0001Hq-Cu
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 16:49:59 +0000
In-Reply-To: <5C869142020000780021D5F1@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDMvMjAxOSAxNjo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSGF2ZSB0aGUgb25seSB1
c2VyIGNhbGwgdmNwdV9tYXJrX2V2ZW50c19wZW5kaW5nKCkgaW5zdGVhZCwgYXQgdGhlIHNhbWUK
PiB0aW1lIGFycmFuZ2luZyBmb3IgY29ycmVjdCBvcmRlcmluZyBvZiB0aGUgd3JpdGVzIChldnRj
aG5fcGVuZGluZ19zZWwKPiBzaG91bGQgYmUgd3JpdHRlbiBiZWZvcmUgZXZ0Y2huX3VwY2FsbF9w
ZW5kaW5nKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
