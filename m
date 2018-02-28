From: Julien Grall <julien.grall@arm.com>
Subject: Re: rwlock and per-cpu rwlock recursive?
Date: Wed, 28 Feb 2018 11:20:19 +0000
Message-ID: <322e589d-ba90-6062-868d-ca48f9780312@arm.com>
References: <3a7d3b6a-623a-0ddb-d42b-aa68fca1fe92@arm.com>
 <5c96fe6b-0509-012e-0408-debde97e6dc7@citrix.com>
 <5f29d022-702f-00e8-3556-062b8f3e3277@arm.com>
 <5A969E1E02000078001ACA28@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ahwf=fw=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eqzmf-0000V6-MQ
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 11:20:29 +0000
In-Reply-To: <5A969E1E02000078001ACA28@prv-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMi8yOC8yMDE4IDExOjE4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAy
OC4wMi4xOCBhdCAxMToyOCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gTG9va2lu
ZyBhdCB0aGUgaW1wbGVtZW50YXRpb24sIEkgc2VlIHJlY3Vyc2lvbiBoYW5kbGluZyBmb3IKPj4g
bW1fd3JpdGVfbG9jayBidXQgbm90IGZvciBtbV9yZWFkX2xvY2suIENhbiB5b3UgY29uZmlybSB0
aGF0IG9ubHkgdGhlCj4+IHdyaXRlIGxvY2sgY2FuIGJlIHRha2VuIHJlY3Vyc2l2ZWx5Pwo+IAo+
IElmIGJ5ICJ3cml0ZSBsb2NrIiB5b3UgbWVhbiBhbiBhcmJpdHJhcnkgb25lLCB0aGVuIHRoZSBh
bnN3ZXIgb2YKPiBjb3Vyc2UgaXMgbm8uIFRoZSBtbSB3cml0ZSBsb2NrIG1hY2hpbmVyeSBhZGRz
IHJlY3Vyc2l2ZW5lc3MKPiBhcm91bmQgcGVyY3B1X3dyaXRlX2xvY2soKS4gU2VlIGUuZy4gX21t
X3dyaXRlX2xvY2soKS4KCkJ5ICJ3cml0ZSBsb2NrIiwgSSBtZWFudCBtbV93cml0ZV9sb2NrKCku
IFRoYW5rIHlvdSBmb3IgdGhlIApjb25maXJtYXRpb24sIHNvIG1tX3JlYWRfbG9jaygpIGlzIG5v
dCByZWN1cnNpdmUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
