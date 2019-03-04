From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen ARM GPU passthrough without IOMMU
Date: Mon, 4 Mar 2019 11:01:49 +0000
Message-ID: <9efcffc7-d99a-6727-c355-f38d2b96c633@arm.com>
References: <E6AAEF0E-0FA4-404E-9E69-770F4F3C789E@qq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CEng=RH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h0lM1-0000fJ-FV
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 11:01:53 +0000
In-Reply-To: <E6AAEF0E-0FA4-404E-9E69-770F4F3C789E@qq.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jinch <jinchen1227@qq.com>, xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDMvMjAxOSAxMjozOCwgSmluY2ggd3JvdGU6Cj4gSGksCgpIZWxsbywKCj4gCUnigJlt
IHVzaW5nIHRoZSBOWFAgaS5teDhxeHAgbWVuIGJvYXJkIGFuZCB3YW50IHRvIGNyZWF0ZSBhbiBB
bmRyb2lkIGRvbXUgb24gWGVuLAo+IAlidXQgdGhpcyBib2FyZCBkb2VzbuKAmXQgaGF2ZSBJT01N
VS4gRG9lcyBhbnlvbmUga25vd3MgdGhhdCBjYW4gSSBwYXNzdGhyb3VnaCBHUFUgd2l0aG91dCBJ
T01NVSBvbiBpdD8KCkRldmljZSBETUEtY2FwYWJsZSBwYXNzdGhyb3VnaCB3aXRob3V0IElPTU1V
IGlzIG5vdCByZWNvbW1lbmRlZCBhcyB5b3Ugd291bGQgCnVuZGVybWluZSB0aGUgZ3Vlc3QgaXNv
bGF0aW9uIGZyb20gdGhlIHJlc3Qgb2YgdGhlIHBsYXRmb3JtLgoKSSBhbSBub3QgYXdhcmUgb2Yg
YW55IHBsYW4gdG8gc3VwcG9ydCB0aGlzIGluIFhlbiBmb3Igbm93LiBJZiB5b3Ugd2FudCB0byBh
ZGQgCnRoZSBzdXBwb3J0IGJ5IHlvdXJzZWxmLCB5b3Ugd291bGQgdGhlbiBuZWVkIHRvIG1ha2Ug
c3VyZSB0aGUgZ3Vlc3QgbWVtb3J5IGlzIApkaXJlY3QgbWFwcGVkIChpLmUgdGhlIGd1ZXN0IHBo
eXNpY2FsIGFkZHJlc3MgPSBob3N0IHBoeXNpY2FsIGFkZHJlc3MpLgoKQW5vdGhlciBhbHRlcm5h
dGl2ZSBpcyB0byB1c2UgUFYgZHJpdmVycyBmb3IgcHJvdmlkaW5nIGdyYXBoaWMgYWNjZXNzIHRv
IHlvdXIgCkFuZHJvaWQgZ3Vlc3QuCgpJIGhvcGUgdGhhdCBoZWxwcy4KCkNoZWVycywKCj4gCj4g
VGhhbmtzLgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWwKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
