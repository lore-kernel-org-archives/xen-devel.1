From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH RFC 4/4] xen: use per-vcpu TSS and stacks
	for pv domains
Date: Tue, 9 Jan 2018 19:13:51 +0000
Message-ID: <5d67a75de9f14baaa48d71a5dcda5720@AMSPEX02CL02.citrite.net>
References: <20180109142700.12028-1-jgross@suse.com>
 <20180109142700.12028-5-jgross@suse.com>
 <3430712a-6b57-fd55-5cf0-727f9817d7da@citrix.com>,
 <17111fe9-68d8-5082-385c-caa87e14d6eb@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ucbw=ee=citrix.com=prvs=5406c8d38=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eYzLP-0001HI-QE
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 19:13:55 +0000
In-Reply-To: <17111fe9-68d8-5082-385c-caa87e14d6eb@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

KHNvcnJ5IGZvciB0aGUgdG9wLXBvc3QuIEknbSBvbiBteSBwaG9uZSkgCgpJIGNhbiBzZWUgeW91
IGFyZSB1c2luZyBsdHIsIGJ1dCBJIGRvbid0IHNlZSBhbnl3aGVyZSB3aGVyZSB3aGVyZSB5b3Ug
YXJlIGNoYW5naW5nIHRoZSBjb250ZW50IG9uIHRoZSBUU1MsIG9yIHRoZSB0b3Atb2Ytc3RhY2sg
Y29udGVudC4KCkl0IGlzIHZlcnkgY29tcGxpY2F0ZWQgdG8gc2FmZWx5IHN3aXRjaCBJU1Qgc3Rh
Y2tzIHdoZW4geW91IG1pZ2h0IGJlIHRha2luZyBpbnRlcnJ1cHRzLiAKCn5BbmRyZXcgCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJvbTogSnVlcmdlbiBHcm9zcyBb
amdyb3NzQHN1c2UuY29tXQpTZW50OiAwOSBKYW51YXJ5IDIwMTggMTc6NDAKVG86IEFuZHJldyBD
b29wZXI7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpDYzogSWFuIEphY2tzb247IGtv
bnJhZC53aWxrQG9yYWNsZS5jb207IGpiZXVsaWNoQHN1c2UuY29tClN1YmplY3Q6IFJlOiBbUEFU
Q0ggUkZDIDQvNF0geGVuOiB1c2UgcGVyLXZjcHUgVFNTIGFuZCBzdGFja3MgZm9yIHB2IGRvbWFp
bnMKCk9uIDA5LzAxLzE4IDE4OjAxLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDA5LzAxLzE4
IDE0OjI3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBJbnN0ZWFkIG9mIHVzaW5nIHRoZSBUU1Mg
YW5kIHN0YWNrcyBvZiB0aGUgcGh5c2ljYWwgcHJvY2Vzc29yIGFsbG9jYXRlCj4+IHRoZW0gcGVy
IHZjcHUsIG1hcCB0aGVtIGluIHRoZSBwZXIgZG9tYWluIGFyZWEsIGFuZCB1c2UgdGhvc2UuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPgo+IEkg
ZG9uJ3Qgc2VlIGFueXRoaW5nIGhlcmUgd2hpY2ggdXBkYXRlcyB0aGUgZmllbGRzIGluIHRoZSBU
U1MgYWNyb3NzCj4gY29udGV4dCBzd2l0Y2guICBXaXRob3V0IGl0LCB5b3UnbGwgYmUgdGFraW5n
IE5NSXMvTUNFcy9ERidzIG9uIHRoZQo+IHdyb25nIHN0YWNrLgoKTm8sIEknbSBkb2luZyBsdHIo
KSB3aXRoIGEgVFNTIHJlZmVyZW5jaW5nIHRoZSBwZXItdmNwdSBzdGFja3MuIFRTUyBpcwpwZXIg
dmNwdSwgdG9vLgoKCgo+IEkgc3RpbGwgZG9uJ3Qgc2VlIGhvdyB5b3VyIHBsYW4gaXMgdmlhYmxl
IGluIHRoZSBmaXJzdCBwbGFjZSwgYW5kIGlzCj4gYWRkaW5nIHN1YnN0YW50aWFsbHkgbW9yZSBj
b21wbGV4aXR5IHRvIGFuIGFuc3dlciB3aGljaCBkb2Vzbid0IG5lZWQgaXQuCj4KPiBJJ20gYWZy
YWlkIEknbSBvbiB0aGUgdmVyZ2Ugb2YgYSBuYWNrIHVubGVzcyB5b3UgY2FuIGV4cGxhaW4gaG93
IGlzCj4gaW50ZW5kZWQgdG8gYmUgc2FmZSwgYW5kIGJldHRlciB0aGFuIHdoYXQgd2UgY3VycmVu
dGx5IGhhdmUuCgpJdCBpcyBsYXlpbmcgdGhlIGdyb3VuZHdvcmsgZm9yIGEgS0FJU0VSIHNvbHV0
aW9uIG5lZWRpbmcgbm8gbWFwcGluZyBvZgpwZXIgcGh5c2ljYWwgY3B1IGFyZWFzIGluIHRoZSB1
c2VyIGd1ZXN0IHRhYmxlcywgc28gaXNvbGF0aW5nIHRoZSBndWVzdHMKZnJvbSBlYWNoIG90aGVy
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
