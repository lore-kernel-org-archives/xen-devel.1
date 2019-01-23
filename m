From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 01/11] is_control_domain:
 block speculation
Date: Wed, 23 Jan 2019 06:07:12 -0700
Message-ID: <5C486700020000780021067B@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-2-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmIFR-0001Vy-9J
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:07:17 +0000
In-Reply-To: <1548244285-30813-2-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE5IGF0IDEyOjUxLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbm9z
cGVjLmgKPiBAQCAtNTgsNiArNTgsMjEgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGFy
cmF5X2luZGV4X21hc2tfbm9zcGVjKHVuc2lnbmVkIGxvbmcgaW5kZXgsCj4gICAgICAodHlwZW9m
KF9pKSkgKF9pICYgX21hc2spOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiAgfSkKPiAgCj4gKy8qCj4gKyAqIGFsbG93IHRvIGluc2VydCBhIHJlYWQgbWVtb3J5
IGJhcnJpZXIgaW50byBjb25kaXRpb25hbHMKPiArICovCgpQbGVhc2Ugb2JleSB0byB0aGUgY29t
bWVudCBzdHlsZSBzZXQgZm9ydGggaW4gLi9DT0RJTkdfU1RZTEUuCgo+ICsjaWZkZWYgQ09ORklH
X1g4Ngo+ICtzdGF0aWMgaW5saW5lIGJvb2wgbGZlbmNlX3RydWUodm9pZCkgeyBybWIoKTsgcmV0
dXJuIHRydWU7IH0KPiArI2Vsc2UKPiArc3RhdGljIGlubGluZSBib29sIGxmZW5jZV90cnVlKHZv
aWQpIHsgcmV0dXJuIHRydWU7IH0KPiArI2VuZGlmCgpUaGlzIGlzIGEgZ2VuZXJpYyBoZWFkZXIs
IGhlbmNlIGZ1bmN0aW9ucyBkZWZpbmVkIGhlcmUgc2hvdWxkIGhhdmUKdW5pdmVyc2FsbHkgYXBw
bGljYWJsZSBuYW1lcy4gImxmZW5jZSIsIGhvd2V2ZXIsIGlzIGFuIHg4NiB0ZXJtCihuYW1pbmcg
YSBwYXJ0aWN1bGFyIGluc3RydWN0aW9uKS4gSSBjYW4ndCB0aGluayBvZiByZWFsbHkgZ29vZAph
bHRlcm5hdGl2ZXMsIGJ1dCBob3cgYWJvdXQgb25lIG9mIGFyY2hfbm9zcGVjX3RydWUoKSAvCmFy
Y2hfZmVuY2Vfbm9zcGVjX3RydWUoKSAvIGFyY2hfbm9zcGVjX2ZlbmNlX3RydWUoKT8KCkZ1cnRo
ZXJtb3JlLCByYXRoZXIgdGhhbiBhZGRpbmcgS2NvbmZpZyBjb250cm9sIGFuZCBhbHRlcm5hdGl2
ZXMKcGF0Y2hpbmcgbGF0ZXIgaW4gdGhlIHNlcmllcyAoYXMgcGVyIHRoZSBjb3ZlciBsZXR0ZXIp
LCBpdCBzaG91bGQgYmUKdGhhdCB3YXkgZnJvbSB0aGUgYmVnaW5uaW5nLiBSZW1lbWJlciB0aGF0
IGFueSBzZXJpZXMgbWF5IGdvCmluIHBpZWNlbWVhbCwgbm90IGFsbCBpbiBvbmUgZ28uCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
