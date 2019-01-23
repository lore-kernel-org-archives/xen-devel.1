From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 01/11] is_control_domain:
 block speculation
Date: Wed, 23 Jan 2019 06:40:41 -0700
Message-ID: <5C486ED90200007800210709@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-2-git-send-email-nmanthey@amazon.de>
 <5C486700020000780021067B@prv1-mh.provo.novell.com>
 <22f2e1b4-a490-028b-a5c6-cd49b2912d3c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmIlp-0005oO-Gn
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:40:45 +0000
In-Reply-To: <22f2e1b4-a490-028b-a5c6-cd49b2912d3c@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, nmanthey@amazon.de, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE5IGF0IDE0OjIwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDIzLzAxLzIwMTkgMTM6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMy4wMS4x
OSBhdCAxMjo1MSwgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vbm9zcGVjLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaAo+Pj4g
QEAgLTU4LDYgKzU4LDIxIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBhcnJheV9pbmRl
eF9tYXNrX25vc3BlYyh1bnNpZ25lZCBsb25nIGluZGV4LAo+Pj4gICAgICAgKHR5cGVvZihfaSkp
IChfaSAmIF9tYXNrKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4+PiAgIH0pCj4+PiAgIAo+Pj4gKy8qCj4+PiArICogYWxsb3cgdG8gaW5zZXJ0IGEgcmVhZCBt
ZW1vcnkgYmFycmllciBpbnRvIGNvbmRpdGlvbmFscwo+Pj4gKyAqLwo+PiAKPj4gUGxlYXNlIG9i
ZXkgdG8gdGhlIGNvbW1lbnQgc3R5bGUgc2V0IGZvcnRoIGluIC4vQ09ESU5HX1NUWUxFLgo+PiAK
Pj4+ICsjaWZkZWYgQ09ORklHX1g4Ngo+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBsZmVuY2VfdHJ1
ZSh2b2lkKSB7IHJtYigpOyByZXR1cm4gdHJ1ZTsgfQo+Pj4gKyNlbHNlCj4+PiArc3RhdGljIGlu
bGluZSBib29sIGxmZW5jZV90cnVlKHZvaWQpIHsgcmV0dXJuIHRydWU7IH0KPj4+ICsjZW5kaWYK
Pj4gCj4+IFRoaXMgaXMgYSBnZW5lcmljIGhlYWRlciwgaGVuY2UgZnVuY3Rpb25zIGRlZmluZWQg
aGVyZSBzaG91bGQgaGF2ZQo+PiB1bml2ZXJzYWxseSBhcHBsaWNhYmxlIG5hbWVzLiAibGZlbmNl
IiwgaG93ZXZlciwgaXMgYW4geDg2IHRlcm0KPj4gKG5hbWluZyBhIHBhcnRpY3VsYXIgaW5zdHJ1
Y3Rpb24pLiBJIGNhbid0IHRoaW5rIG9mIHJlYWxseSBnb29kCj4+IGFsdGVybmF0aXZlcywgYnV0
IGhvdyBhYm91dCBvbmUgb2YgYXJjaF9ub3NwZWNfdHJ1ZSgpIC8KPj4gYXJjaF9mZW5jZV9ub3Nw
ZWNfdHJ1ZSgpIC8gYXJjaF9ub3NwZWNfZmVuY2VfdHJ1ZSgpPwo+IAo+IFdlIHNlZW1zIHRvIHVz
ZSBtb3JlIHRoZSB0ZXJtICJiYXJyaWVyIiBpbiBjb21tb24gY29kZSBvdmVyICJmZW5jZSIuIFNv
IGhvdyAKPiBhYm91dCBhcmNoX2JhcnJpZXJfbm9zcGVjX3RydWUvYXJjaF9ub3NwZWNfYmFycmll
cl90cnVlPwoKVGhhdCB3b3VsZCBiZSBmaW5lIHdpdGggbWUgYXMgd2VsbC4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
