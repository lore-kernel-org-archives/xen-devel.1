From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 01/11] is_control_domain:
 block speculation
Date: Wed, 23 Jan 2019 13:20:04 +0000
Message-ID: <22f2e1b4-a490-028b-a5c6-cd49b2912d3c@arm.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-2-git-send-email-nmanthey@amazon.de>
 <5C486700020000780021067B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MDDu=P7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmIRy-00033D-83
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:20:14 +0000
In-Reply-To: <5C486700020000780021067B@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, nmanthey@amazon.de
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMy8wMS8yMDE5IDEzOjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyMy4w
MS4xOSBhdCAxMjo1MSwgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9ub3NwZWMuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmgKPj4g
QEAgLTU4LDYgKzU4LDIxIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBhcnJheV9pbmRl
eF9tYXNrX25vc3BlYyh1bnNpZ25lZCBsb25nIGluZGV4LAo+PiAgICAgICAodHlwZW9mKF9pKSkg
KF9pICYgX21hc2spOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
Pj4gICB9KQo+PiAgIAo+PiArLyoKPj4gKyAqIGFsbG93IHRvIGluc2VydCBhIHJlYWQgbWVtb3J5
IGJhcnJpZXIgaW50byBjb25kaXRpb25hbHMKPj4gKyAqLwo+IAo+IFBsZWFzZSBvYmV5IHRvIHRo
ZSBjb21tZW50IHN0eWxlIHNldCBmb3J0aCBpbiAuL0NPRElOR19TVFlMRS4KPiAKPj4gKyNpZmRl
ZiBDT05GSUdfWDg2Cj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgbGZlbmNlX3RydWUodm9pZCkgeyBy
bWIoKTsgcmV0dXJuIHRydWU7IH0KPj4gKyNlbHNlCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgbGZl
bmNlX3RydWUodm9pZCkgeyByZXR1cm4gdHJ1ZTsgfQo+PiArI2VuZGlmCj4gCj4gVGhpcyBpcyBh
IGdlbmVyaWMgaGVhZGVyLCBoZW5jZSBmdW5jdGlvbnMgZGVmaW5lZCBoZXJlIHNob3VsZCBoYXZl
Cj4gdW5pdmVyc2FsbHkgYXBwbGljYWJsZSBuYW1lcy4gImxmZW5jZSIsIGhvd2V2ZXIsIGlzIGFu
IHg4NiB0ZXJtCj4gKG5hbWluZyBhIHBhcnRpY3VsYXIgaW5zdHJ1Y3Rpb24pLiBJIGNhbid0IHRo
aW5rIG9mIHJlYWxseSBnb29kCj4gYWx0ZXJuYXRpdmVzLCBidXQgaG93IGFib3V0IG9uZSBvZiBh
cmNoX25vc3BlY190cnVlKCkgLwo+IGFyY2hfZmVuY2Vfbm9zcGVjX3RydWUoKSAvIGFyY2hfbm9z
cGVjX2ZlbmNlX3RydWUoKT8KCldlIHNlZW1zIHRvIHVzZSBtb3JlIHRoZSB0ZXJtICJiYXJyaWVy
IiBpbiBjb21tb24gY29kZSBvdmVyICJmZW5jZSIuIFNvIGhvdyAKYWJvdXQgYXJjaF9iYXJyaWVy
X25vc3BlY190cnVlL2FyY2hfbm9zcGVjX2JhcnJpZXJfdHJ1ZT8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
