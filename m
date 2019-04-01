From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 31/49] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
Date: Mon, 01 Apr 2019 02:10:06 -0600
Message-ID: <5CA1C75E0200007800223721@prv1-mh.provo.novell.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-32-jgross@suse.com>
 <6ae60c7f-e295-d758-cf60-9f24113236e1@citrix.com>
 <7637592e-c241-dd48-ea6c-ea0e3c5738e4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAs1G-0000yl-3i
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:10:14 +0000
In-Reply-To: <7637592e-c241-dd48-ea6c-ea0e3c5738e4@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAzLjE5IGF0IDExOjIyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
OS8wMy8yMDE5IDIwOjM2LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBJbiBwcmFjdGljZSwgYWxs
IHRoaXMgZmxhZyBkb2VzIGlzIHBlcm1pdCB0aGUgdXNlIG9mIFZDUFVPUF9nZXRfcGh5c2lkLAo+
PiBkaXNhbGxvdyB0aGUgdXNlIG9mIHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoKSwgYW5kIGFsbG93
IGRvbTAgdG8gYXR0ZW1wdAo+PiB0byBhY3R1YWxseSB3cml0ZSB0byBNU1JfQU1ENjRfTkJfQ0ZH
LCBNU1JfRkFNMTBIX01NSU9fQ09ORl9CQVNFLAo+PiBNU1JfSUEzMl9VQ09ERV9SRVYsIE1TUl9J
QTMyX1RIRVJNX0NPTlRST0wgYW5kCj4+IE1TUl9JQTMyX0VORVJHWV9QRVJGX0JJQVMsIHJhdGhl
ciB0aGFuIGhhdmluZyB0aGUgd3JpdGUgc2lsZW50bHkgZGlzY2FyZGVkLgo+PiAKPj4gRG9tMCdz
IHVzZSBvZiB0aG9zZSBNU1JzIGlzIGR1YmlvdXMgYXQgYmVzdCwgYW5kIGRpc2FibGVkIGJ5IGRl
ZmF1bHQsCj4+ICphbmQqIHdoZW4gYWN0aXZlLCBhbHNvIGNyb3NzLWNoZWNrcyB3aXRoIHRoZSBo
YXJkIGFmZmluaXR5IG1hc2suICBEb2VzCj4+IGFueW9uZSB1c2UgZG9tMF92Y3B1c19waW4gaW4g
cHJvZHVjdGlvbj8KPiAKPiBJIGhhdmUgc2VlbiBpdCBvbiBjdXN0b21lciBzeXN0ZW1zLgoKU2Ft
ZSBoZXJlLCBidXQgSSd2ZSBuZXZlciBzZWVuIGl0IHVzZWQgZm9yIGEgZ29vZCByZWFzb24uCgo+
PiBJIHRoaW5rIHRoZXJlIGlzIHF1aXRlIGEgbG90IG9mIHZhbHVlIGluIGdldHRpbmcgcmlkIG9m
IGQtPmlzX3Bpbm5lZCBhbmQKPj4gaXNfcGlubmVkX3ZjcHUoKSBlbnRpcmVseSwgd2l0aCB3aWxs
IHJlbW92ZSBhbiBleHRyZW1lCj4+IGNvcm5lci1jYXNlLXg4Ni1pc20gb3V0IG9mIHRoZSBjb21t
b24gY29kZS4KCkkgdGhpbmsgaXRzIG9yaWdpbiB3YXMgImNwdWZyZXE9ZG9tMC1rZXJuZWwiLCB3
aGljaCBJIHRoaW5rIHNob3VsZCBnbwphd2F5IHdpdGggaXQgdGhlbi4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
