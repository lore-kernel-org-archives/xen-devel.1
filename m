From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 09/25] x86emul: support XOP insns
Date: Mon, 5 Feb 2018 13:01:35 +0000
Message-ID: <f63adc5d-229b-4a6a-b714-68a29b5637c9@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A29589402000078001958F4@prv-mh.provo.novell.com>
 <746d7022-5c6e-9df4-bb4a-4235600bc956@citrix.com>
 <5A748F1802000078001A4A1B@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xio2=e7=citrix.com=prvs=567de97ac=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eigQD-0005ZJ-Le
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 13:02:57 +0000
In-Reply-To: <5A748F1802000078001A4A1B@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDIvMTggMTU6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAyLjE4IGF0
IDEzOjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDA3LzEyLzE3
IDE0OjA0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEBAIC04MDI3LDYgKzgwNjAsMTMgQEAgeDg2
X2VtdWxhdGUoCj4+PiAgICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYodmV4LncsIEVYQ19V
RCk7Cj4+PiAgICAgICAgICBnb3RvIHNpbWRfMGZfaW1tOF9hdng7Cj4+PiAgCj4+PiArICAgIGNh
c2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYzYSwgMHg0OCk6IC8qIHZwZXJtaWwycHMgJGltbSx7
eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0se3gseX1tbSAqLwo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cGVybWlsMnBzICRpbW0se3gseX1tbSx7
eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KPj4+ICsgICAgY2FzZSBYODZFTVVMX09QQ19W
RVhfNjYoMHgwZjNhLCAweDQ5KTogLyogdnBlcm1pbDJwZCAkaW1tLHt4LHl9bW0vbWVtLHt4LHl9
bW0se3gseX1tbSx7eCx5fW1tICovCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC8qIHZwZXJtaWwycGQgJGltbSx7eCx5fW1tLHt4LHl9bW0vbWVtLHt4LHl9
bW0se3gseX1tbSAqLwo+Pj4gKyAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoeG9wKTsK
Pj4+ICsgICAgICAgIGdvdG8gc2ltZF8wZl9pbW04X3ltbTsKPj4gSXMgdGhpcyBjb3JyZWN0PyAg
VkVYLlcgc2VsZWN0cyB3aGljaCBvcGVyYW5kIG1heSBiZSB0aGUgbWVtb3J5IG9wZXJhbmQsCj4+
IGFuZCBJIGRvbid0IHNlZSBhbnl0aGluZyBpbiB0aGUgZGVjb2RlIHdoaWNoIGNvcGVzLCBvciBh
bnl0aGluZyBpbiB0aGUKPj4gc3R1YiB3aGljaCBhZGp1c3RzIC5XLgo+IFRoYXQncyB0aGUgbmlj
ZSB0aGluZyBoZXJlIC0gYnkgcmUtdXNpbmcgdGhlIG9yaWdpbmFsIGluc3RydWN0aW9uIGluCj4g
dGhlIHN0dWIgKHdpdGggb25seSBHUFIgbnVtYmVycyBhZGp1c3RlZCBpZiBuZWNlc3NhcnkpIHdl
IHNpbXBseQo+IGRvbid0IGNhcmUgd2hpY2ggb2YgdGhlIG9wZXJhbmRzIGl0IHRoZSBtZW1vcnkg
b25lLCBhcyBsb25nIGFzCj4gdGhlIGFjY2VzcyB3aWR0aCBkb2VzIG5vdCBkaWZmZXIgKGFuZCBp
dCBkb2Vzbid0KS4KCkhtbSAtIHRoYXQgaXMgdmVyeSBzdWJ0bGUsIGJ1dCBvay4KCkFja2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiBhcyBJIGRpZG4ndCBm
aW5kIGFueQpvdGhlciBpc3N1ZXMgd2l0aCB0aGUgcGF0Y2guCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
