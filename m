From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.12 V3] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Tue, 12 Feb 2019 12:11:41 +0200
Message-ID: <9943d2b7-5aae-1e1b-0593-5028416c3681@bitdefender.com>
References: <1549876422-22274-1-git-send-email-rcojocaru@bitdefender.com>
 <5C614A1B02000078002158A5@prv1-mh.provo.novell.com>
 <b0b1da0b-f888-912b-48ed-8322b9091779@bitdefender.com>
 <2806b8c2-ae3c-6f45-9c5c-dead9235ca83@bitdefender.com>
 <5C61A9DF0200007800215ABD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8704=QT=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gtV2Y-0000Yd-TH
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 10:11:46 +0000
In-Reply-To: <5C61A9DF0200007800215ABD@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMS8xOSA2OjU5IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBQbHVzIEkgY2FuJ3Qgc2Vl
IHAybV9zd2l0Y2hfdmNwdV9hbHRwMm1fYnlfaWQoKSBjYWxsZWQgZm9yCj4gYW55IEhWTU9QX2Fs
dHAybV8qIGF0IGFsbC4gT25lIG9mIHRoZSBhY3R1YWwgY2FsbGVycyBpcyBndWFyZGVkCj4gYnkg
YWx0cDJtX2FjdGl2ZSgpLCBidXQgdGhlIG90aGVyIGlzbid0LgoKQWN0dWFsbHkgSSBzZWUgdGhh
dCBib3RoIHBsYWNlcyBhcmUgZ3VhcmRlZCBieSBhbHRwMm1fYWN0aXZlKCkuCgpJbiBwMm0uYyB3
ZSBoYXZlOgoKMjMxMiB2b2lkIHAybV9hbHRwMm1fY2hlY2soc3RydWN0IHZjcHUgKnYsIHVpbnQx
Nl90IGlkeCkKMjMxMyB7CjIzMTQgICAgIGlmICggYWx0cDJtX2FjdGl2ZSh2LT5kb21haW4pICkK
MjMxNSAgICAgICAgIHAybV9zd2l0Y2hfdmNwdV9hbHRwMm1fYnlfaWQodiwgaWR4KTsKMjMxNiB9
CgphbmQgaW4gdm14LmM6CgoyMjI1IHN0YXRpYyBpbnQgdm14X3ZjcHVfZW11bGF0ZV92bWZ1bmMo
Y29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCjIyMjYgewoyMjI3ICAgICBpbnQgcmMg
PSBYODZFTVVMX0VYQ0VQVElPTjsKMjIyOCAgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50
OwoyMjI5CjIyMzAgICAgIGlmICggIWNwdV9oYXNfdm14X3ZtZnVuYyAmJiBhbHRwMm1fYWN0aXZl
KGN1cnItPmRvbWFpbikgJiYKMjIzMSAgICAgICAgICByZWdzLT5lYXggPT0gMCAmJgoyMjMyICAg
ICAgICAgIHAybV9zd2l0Y2hfdmNwdV9hbHRwMm1fYnlfaWQoY3VyciwgcmVncy0+ZWN4KSApCjIy
MzMgICAgICAgICByYyA9IFg4NkVNVUxfT0tBWTsKMjIzNAoyMjM1ICAgICByZXR1cm4gcmM7CjIy
MzYgfQoKaGVyZSB0aGVyZSdzIGFuICImJiBhbHRwMm1fYWN0aXZlKGN1cnItPmRvbWFpbikiIGlu
IHRoZSBpZigpLgoKU28gSSBzdXBwb3NlIGluIG91ciBzY2VuYXJpbyBhbGwgdGhhdCdzIG5lZWRl
ZCBpdCBhIHNpbWlsYXIgY2hlY2sgaGVyZToKCjQ2MzYgICAgIGNhc2UgSFZNT1BfYWx0cDJtX3N3
aXRjaF9wMm06CjQ2MzcgICAgICAgICByYyA9IHAybV9zd2l0Y2hfZG9tYWluX2FsdHAybV9ieV9p
ZChkLCBhLnUudmlldy52aWV3KTsKNDYzOCAgICAgICAgIGJyZWFrOwoKZm9yIHRoZSBvdGhlciBm
dW5jdGlvbiwgcDJtX3N3aXRjaF9kb21haW5fYWx0cDJtX2J5X2lkKCkuCgpVbmxlc3MgSSdtIG1p
c3Npbmcgc29tZXRoaW5nLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
