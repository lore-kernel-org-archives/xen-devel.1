From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 01/11] is_control_domain:
 block speculation
Date: Wed, 23 Jan 2019 06:20:46 -0700
Message-ID: <5C486A2E0200007800210694@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-2-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmISX-0003Cl-Uu
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:20:49 +0000
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
IGJhcnJpZXIgaW50byBjb25kaXRpb25hbHMKPiArICovCj4gKyNpZmRlZiBDT05GSUdfWDg2Cj4g
K3N0YXRpYyBpbmxpbmUgYm9vbCBsZmVuY2VfdHJ1ZSh2b2lkKSB7IHJtYigpOyByZXR1cm4gdHJ1
ZTsgfQo+ICsjZWxzZQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgbGZlbmNlX3RydWUodm9pZCkgeyBy
ZXR1cm4gdHJ1ZTsgfQo+ICsjZW5kaWYKPiArCj4gKy8qCj4gKyAqIHByb3RlY3QgZXZhbHVhdGlv
biBvZiBjb25kaXRpb25hbCB3aXRoIHJlc3BlY3QgdG8gc3BlY3VsYXRpb24KPiArICovCj4gKyNk
ZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArICAgICgoKGNvbmRpdGlvbikgJiYgbGZlbmNlX3RydWUoKSkgfHwg
IWxmZW5jZV90cnVlKCkpCgpJdCBtYXkgYmUganVzdCBtZSwgYnV0IEkgdGhpbmsKCiNkZWZpbmUg
ZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKICAgICgoY29uZGl0aW9uKSA/IGxmZW5jZV90cnVlKCkgOiAhbGZlbmNlX3RydWUo
KSkKCndvdWxkIGJldHRlciBleHByZXNzIHRoZSB0d28td2F5IG5hdHVyZSBvZiB0aGlzLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
