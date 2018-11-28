From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] xen/x86: add dom0 memory sizing variants
Date: Wed, 28 Nov 2018 09:28:43 -0700
Message-ID: <5BFEC23B0200007800200DEC@prv1-mh.provo.novell.com>
References: <20181122164028.8451-1-jgross@suse.com>
 <20181122164028.8451-3-jgross@suse.com>
 <5BFEB1950200007800200CF9@suse.com>
 <55558323-78d5-7ff7-e97b-fa4287ff9035@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fbbp=oh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gS2jg-0006qL-6D
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:30:48 +0000
In-Reply-To: <55558323-78d5-7ff7-e97b-fa4287ff9035@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjExLjE4IGF0IDE2OjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
OC8xMS8yMDE4IDE2OjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjIuMTEuMTggYXQg
MTc6NDAsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gQEAgLTUwLDcgKzU1LDI4IEBAIHN0
YXRpYyB1bnNpZ25lZCBsb25nIF9faW5pdCBwYXJzZV9hbXQoY29uc3QgY2hhciAqcywgY29uc3Qg
Y2hhciAqKnBzLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBhdmFpbCkKPj4+ICB7Cj4+PiAgICAgIHVuc2lnbmVkIGludCBtaW51cyA9ICgq
cyA9PSAnLScpID8gMSA6IDA7Cj4+PiAtICAgIHVuc2lnbmVkIGxvbmcgcGFnZXMgPSBwYXJzZV9z
aXplX2FuZF91bml0KHMgKyBtaW51cywgcHMpID4+IFBBR0VfU0hJRlQ7Cj4+PiArICAgIHVuc2ln
bmVkIGxvbmcgdmFsLCBwYWdlcyA9IDA7Cj4+PiArCj4+PiArICAgIC8qIEF2b2lkIGFjY2Vzc2lu
ZyBzWy0xXSBpbiBjYXNlIHZhbHVlIHN0YXJ0cyB3aXRoICclJy4gKi8KPj4+ICsgICAgaWYgKCAq
cyA9PSAnJScgKQo+Pj4gKyAgICAgICAgcmV0dXJuIDA7Cj4+PiArCj4+PiArICAgIHMgKz0gbWlu
dXM7Cj4+PiArICAgIHdoaWxlICggaXNkaWdpdCgqcykgKQo+Pj4gKyAgICB7Cj4+PiArICAgICAg
ICB2YWwgPSBwYXJzZV9zaXplX2FuZF91bml0KHMsIHBzKTsKPj4+ICsgICAgICAgIHMgPSAqcHM7
Cj4+PiArICAgICAgICBpZiAoICpzID09ICclJyAmJiBpc2RpZ2l0KCoocyAtIDEpKSAmJiB2YWwg
PCAoMTAwIDw8IDEwKSApCj4+IAo+PiBJbiB0aGUgY29tbWVudCBhYm92ZSB5b3UgdGFsayBhYm91
dCBzWy0xXSAtIHdoeSBkbyB5b3UgdXNlIGEgbW9yZQo+PiBjb21wbGljYXRlZCAoZXZlbiBpZiBq
dXN0IHNsaWdodGx5KSBleHByZXNzaW9uIGhlcmU/Cj4gCj4gSSBkaXNsaWtlIHVzaW5nIHNbLTFd
IGluIGNvZGUuIEluIGNhc2UgeW91IHByZWZlciBpdCBJIGNhbiB1c2UgaXQgaGVyZS4KCkl0IG1h
a2VzIG1vcmUgb2J2aW91cyB3aGF0IGlzIG1lYW50IGltby4gQW5kIHdlIGhhdmUgYSBudW1iZXIK
b2YgaW5zdGFuY2VzIGluIHRoZSB0cmVlIGFscmVhZHkuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
