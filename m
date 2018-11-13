From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/3] x86/HVM: hvm_map_guest_frame_rw()
 should respect p2m_ioreq_server
Date: Tue, 13 Nov 2018 06:54:46 -0700
Message-ID: <5BEAD7A602000078001FB7DC@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAAB8802000078001FB62A@prv1-mh.provo.novell.com>
 <cfa8240e-69cb-7ce6-7f58-a34e9a4ed7da@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMZ9Y-00075A-01
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 13:54:52 +0000
In-Reply-To: <cfa8240e-69cb-7ce6-7f58-a34e9a4ed7da@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjExLjE4IGF0IDE0OjM5LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMTEvMjAxOCAxMDo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdyaXRlcyB0
byBzdWNoIHBhZ2VzIHdvdWxkIG5lZWQgdG8gYmUgaGFuZGVkIHRvIHRoZSBlbXVsYXRvciwgd2hp
Y2ggd2UncmUKPj4gbm90IHByZXBhcmVkIHRvIGRvIGF0IHRoaXMgcG9pbnQuCj4+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IAo+PiAtLS0gYS94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4g
QEAgLTI1NTYsNyArMjU1Niw4IEBAIHN0YXRpYyB2b2lkICpfaHZtX21hcF9ndWVzdF9mcmFtZSh1
bnNpZ24KPj4gIAo+PiAgICAgIGlmICggd3JpdGFibGUgKQo+PiAgICAgIHsKPj4gLSAgICAgICAg
aWYgKCB1bmxpa2VseShwMm1faXNfZGlzY2FyZF93cml0ZShwMm10KSkgKQo+PiArICAgICAgICBp
ZiAoIHVubGlrZWx5KHAybV9pc19kaXNjYXJkX3dyaXRlKHAybXQpKSB8fAo+PiArICAgICAgICAg
ICAgIHVubGlrZWx5KHAybXQgPT0gcDJtX2lvcmVxX3NlcnZlcikgKQo+IAo+IFNob3VsZG4ndCB3
ZSBpbnRyb2R1Y2UgcDJtX2lzX2lvcmVxX3NlcnZlcigpIGZvciBjb25zaXN0ZW5jeSBhbmQgdXNl
IGl0Cj4gZXZlcnl3aGVyZT8KCkkgdGhpbmsgc3VjaCBhYnN0cmFjdGlvbnMgaGVscCBpZiBtdWx0
aXBsZSB0eXBlcyBhcmUgdG8gYmUgY292ZXJlZDsKSSBkb24ndCBtaW5kIHRoZW0gdG8gYmUgdXNl
ZCBhbHNvIGZvciBzaW5nbGUgdHlwZXMsIGJ1dCBJIGRvbid0CnRoaW5rcyB0aGF0J3Mgb3Zlcmx5
IGltcG9ydGFudC4gUGx1cyBkb2luZyBzbyBpcyBvZiBjb3Vyc2UgdW5yZWxhdGVkCnRvIHRoaXMg
c2VyaWVzLCBhcyBvdGhlciBjaGVja3MgdXNpbmcgPT0gYWxyZWFkeSBleGlzdC4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
