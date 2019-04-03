From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/PV: remove unnecessary
 toggle_guest_pt() overhead
Date: Wed, 3 Apr 2019 19:32:54 +0100
Message-ID: <3282377e-f615-bd7b-bb6b-6e0a43a79e7c@citrix.com>
References: <5C88F524020000780021E12C@prv1-mh.provo.novell.com>
 <5C88F9F3020000780021E180@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/PYL=SF=citrix.com=prvs=98944cf01=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBkgz-00008s-Pg
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 18:32:57 +0000
In-Reply-To: <5C88F9F3020000780021E180@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMjAxOSAxMjozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgdGhlIG1lcmUg
dXBkYXRpbmcgb2YgLT5wdl9jcjMgYW5kIC0+cm9vdF9wZ3RfY2hhbmdlZCBhcmVuJ3Qgb3Zlcmx5
Cj4gZXhwZW5zaXZlIChidXQgc3RpbGwgbmVlZGVkIG9ubHkgZm9yIHRoZSB0b2dnbGVfZ3Vlc3Rf
bW9kZSgpIHBhdGgpLCB0aGUKPiBlZmZlY3Qgb2YgdGhlIGxhdHRlciBvbiB0aGUgZXhpdC10by1n
dWVzdCBwYXRoIGlzIG5vdCBpbnNpZ25pZmljYW50Lgo+IE1vdmUgdGhlIGxvZ2ljIGludG8gdG9n
Z2xlX2d1ZXN0X21vZGUoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCldoYXQgY2FzZSBkb2VzIHRoaXMgbWFrZSBmYXN0ZXI/wqAgSSdtIHJlYWxs
eSBzdHJ1Z2dsaW5nIHRvIHNlZSBob3cgdGhpcwppcyBzYWZlLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
