From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/5] x86/domain: Initialise vcpu debug
 registers correctly
Date: Fri, 26 Oct 2018 08:37:16 -0600
Message-ID: <5BD3269C02000078001F5401@prv1-mh.provo.novell.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-3-git-send-email-andrew.cooper3@citrix.com>
 <5BD3171402000078001F531D@prv1-mh.provo.novell.com>
 <afe9256a-088c-81d0-dd6d-3a9387e52f46@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <afe9256a-088c-81d0-dd6d-3a9387e52f46@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjEwLjE4IGF0IDE2OjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMTAvMjAxOCAxNDozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE1
LjEwLjE4IGF0IDEyOjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAt
LS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4u
Ywo+Pj4gQEAgLTMyMyw2ICszMjMsMTggQEAgdm9pZCBmcmVlX3ZjcHVfc3RydWN0KHN0cnVjdCB2
Y3B1ICp2KQo+Pj4gICAgICBmcmVlX3hlbmhlYXBfcGFnZSh2KTsKPj4+ICB9Cj4+PiAgCj4+PiAr
LyogSW5pdGlhbGlzZSB2YXJpb3VzIHJlZ2lzdGVycyB0byB0aGVpciBhcmNoaXRlY3R1cmFsIElO
SVQvUkVTRVQgc3RhdGUuICovCj4+PiArdm9pZCBhcmNoX3ZjcHVfcmVnc19pbml0KHN0cnVjdCB2
Y3B1ICp2KQo+Pj4gK3sKPj4+ICsgICAgdi0+YXJjaC51c2VyX3JlZ3MgPSAodHlwZW9mKHYtPmFy
Y2gudXNlcl9yZWdzKSl7Cj4+PiArICAgICAgICAucmZsYWdzID0gWDg2X0VGTEFHU19NQlMsCj4+
PiArICAgIH07Cj4+IFNhZGx5IHRoaXMgaW5pdGlhbGl6ZXIgYnJva2UgdGhlIGJ1aWxkIG9uY2Ug
YWdhaW4gZm9yIGdjYyA0LjMueC4KPiAKPiBPaCAtIHRoYXQncyB1bmZvcnR1bmF0ZS4gIEkgZ3Vl
c3MgaXQgd2lsbCBuZWVkIGEgbWVtc2V0IGluc3RlYWQuCgpPciB3ZSBmaW5hbGx5IG5lZWQgdG8g
YnVtcCB0aGUgbWluaW11bSB2ZXJzaW9uIHdlJ3JlIGhhcHB5IHdpdGguCgo+PiAoQXMgYSBzaWRl
IG5vdGUsIHVzaW5nIC5lZmxhZ3MgaW5zdGVhZCBvZiAucmZsYWdzIHdvdWxkIGhhdmUgYQo+PiBm
YWlyIGNoYW5jZSBvZiBhbiBvbWl0dGVkIFJFWCBwcmVmaXguKQo+IAo+IFlvdSBzcGVjaWZpY2Fs
bHkgcmVxdWVzdGVkIHJmbGFncyBvdmVyIGVmbGFncyBpbiB5b3VyIHByZXZpb3VzIHJldmlldy4K
CkRpZCBJPyBJIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIGZpbmQgdjEgb2YgdGhpcyBwYXRjaCBhdCBh
bGwgaW4gdGhlIGFyY2hpdmVzCihnb2luZyBiYWNrIHRvIE1heSksIG9yIGluIG15IGluYm94ICh1
c2luZyBqdXN0IHBhcnQgb2YgdGhlIHRpdGxlIGZvcgpzZWFyY2hpbmcpLiBXYXMgdGhhdCBwb3N0
ZWQgaW4gcHJpdmF0ZSwgb3IgdW5kZXIgYSBkaWZmZXJlbnQgdGl0bGU/IEknbQp0cnlpbmcgdG8g
ZmlndXJlIHdoeSBJIHdvdWxkIGhhdmUgYXNrZWQgZm9yIHRoYXQuLi4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
