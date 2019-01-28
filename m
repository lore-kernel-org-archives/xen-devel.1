From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v4 09/11] x86/vioapic: block
 speculative out-of-bound accesses
Date: Mon, 28 Jan 2019 13:20:30 +0100
Message-ID: <afacc3cb-8de9-cd65-50f9-ff47c16678a9@amazon.de>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244655-32180-9-git-send-email-nmanthey@amazon.de>
 <5C4B3A7E0200007800211397@prv1-mh.provo.novell.com>
 <edf43e60-ce9c-ec36-4c48-9e240d2d2158@amazon.de>
 <5C4EE3910200007800211A78@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+d/k=QE=amazon.de=prvs=924930fe3=nmanthey@srs-us1.protection.inumbo.net>)
 id 1go5uA-000769-At
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 12:20:46 +0000
In-Reply-To: <5C4EE3910200007800211A78@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yOC8xOSAxMjoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDEuMTkgYXQg
MTI6MDMsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBPbiAxLzI1LzE5IDE3OjM0LCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIzLjAxLjE5IGF0IDEyOjU3LCA8bm1hbnRoZXlA
YW1hem9uLmRlPiB3cm90ZToKPj4+PiBAQCAtMjEyLDcgKzIxNywxMiBAQCBzdGF0aWMgdm9pZCB2
aW9hcGljX3dyaXRlX3JlZGlyZW50KAo+Pj4+ICAgICAgc3RydWN0IGh2bV9pcnEgKmh2bV9pcnEg
PSBodm1fZG9tYWluX2lycShkKTsKPj4+PiAgICAgIHVuaW9uIHZpb2FwaWNfcmVkaXJfZW50cnkg
KnBlbnQsIGVudDsKPj4+PiAgICAgIGludCB1bm1hc2tlZCA9IDA7Cj4+Pj4gLSAgICB1bnNpZ25l
ZCBpbnQgZ3NpID0gdmlvYXBpYy0+YmFzZV9nc2kgKyBpZHg7Cj4+Pj4gKyAgICB1bnNpZ25lZCBp
bnQgZ3NpOwo+Pj4+ICsKPj4+PiArICAgIC8qIE1ha2Ugc3VyZSBubyBvdXQtb2YtYm91bmQgdmFs
dWUgZm9yIGlkeCBjYW4gYmUgdXNlZCAqLwo+Pj4+ICsgICAgaWR4ID0gYXJyYXlfaW5kZXhfbm9z
cGVjKGlkeCwgdmlvYXBpYy0+bnJfcGlucyk7Cj4+Pj4gKwo+Pj4+ICsgICAgZ3NpID0gdmlvYXBp
Yy0+YmFzZV9nc2kgKyBpZHg7Cj4+PiBJIGRpc2xpa2UgdGhlIGRpc2Nvbm5lY3QgZnJvbSB0aGUg
cmVzcGVjdGl2ZSBib3VuZHMgY2hlY2s6IFRoZXJlJ3MKPj4+IG9ubHkgb25lIGNhbGxlciwgc28g
dGhlIGNvbnN0cnVjdCBjb3VsZCBiZSBtb3ZlZCB0aGVyZSwgb3IKPj4+IG90aGVyd2lzZSBJJ2Qg
bGlrZSB0byBzZWUgYW4gQVNTRVJUKCkgYWRkZWQgZG9jdW1lbnRpbmcgdGhhdCB0aGUKPj4+IGJv
dW5kcyBjaGVjayBpcyBleHBlY3RlZCB0byBoYXZlIGhhcHBlbmVkIGluIHRoZSBjYWxsZXIuCj4+
IEkgYWdyZWUgdGhhdCB0aGUgaWR4IHZhbHVlIGlzIHVzZWQgYXMgYW4gYXJyYXkgaW5kZXggaW4g
dGhpcyBmdW5jdGlvbgo+PiBvbmx5IG9uY2UuIEhvd2V2ZXIsIHRoZSBnc2kgdmFsdWUgYWxzbyB1
c2VzIHRoZSB2YWx1ZSBvZiBpZHgsIGFuZCBhcwo+PiB0aGF0IGlzIHBhc3NlZCB0byBvdGhlciBm
dW5jdGlvbnMsIEkgd2FudCB0byBib3VuZCB0aGUgZ3NpIHZhcmlhYmxlIGFzCj4+IHdlbGwuIFRo
ZXJlZm9yZSwgSSBjaG9zZSB0byBoYXZlIGEgc2VwYXJhdGUgYXNzaWdubWVudCBmb3IgdGhlIGlk
eCB2YXJpYWJsZS4KPiBJIGRvbid0IG1pbmQgdGhlIHNlcGFyYXRlIGFzc2lnbm1lbnQsIGFuZCBJ
IGRpZG4ndCBjb21wbGFpbgo+IGFib3V0IGlkeCBiZWluZyB1c2VkIGp1c3Qgb25jZS4gV2hhdCBJ
IHNhaWQgaXMgdGhhdCB0aGVyZSdzCj4gb25seSBvbmUgY2FsbGVyIG9mIHRoZSBmdW5jdGlvbi4g
SWYgdGhlIGJvdW5kcyBjaGVja2luZyB3YXMKPiBkb25lIHRoZXJlLCAiZ3NpIiBoZXJlIHdvdWxk
IGJlIGVxdWFsbHkgImJvdW5kZWQiIGFmYWljdC4KPiBBbmQgSSBkaWQgc3VnZ2VzdCBhbiBhbHRl
cm5hdGl2ZSBpbiBjYXNlIHlvdSBkaXNsaWtlIHRoZQo+IG1vdmluZyBvZiB0aGUgY29uc3RydWN0
IHlvdSBhZGQuCgpBaCwgSSB1bmRlcnN0YW5kIHlvdXIgcHJldmlvdXMgc2VudGVuY2UgZGlmZmVy
ZW50bHkgbm93LiBUaGFua3MgZm9yCmNsYXJpZnlpbmcuIEkgbGlrZSB0byBrZWVwIHRoZSBub3Nw
ZWMgc3RhdGVtZW50cyBjbG9zZSB0byB0aGUKcHJvYmxlbWF0aWMgdXNlLCBzbyB0aGF0IGV2ZW50
dWFsIGZ1dHVyZSBjYWxsZXJzIGJlbmVmaXQgZnJvbSB0aGF0IGFzCndlbGwuIFRoZXJlZm9yZSwg
SSdsbCBhZGQgYW4gQVNTRVJUIHN0YXRlbWVudCB3aXRoIHRoZSBib3VuZCBjaGVjay4KCkJlc3Qs
Ck5vcmJlcnQKCj4KPiBKYW4KPgo+CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFu
eSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hy
aXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVp
bmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
