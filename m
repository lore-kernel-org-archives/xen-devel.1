From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH-for-4.12] docs: Fix dm_restrict documentation
Date: Fri, 25 Jan 2019 16:10:55 +0000
Message-ID: <20190125161055.gb6v4xslarfsixyv@zion.uk.xensource.com>
References: <20190124174827.15902-1-george.dunlap@citrix.com>
 <20190125113305.aiw2u2fzzblb33mu@zion.uk.xensource.com>
 <682e640c-565e-f20c-b2fe-13d7ebfe075c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jZp+=QB=citrix.com=prvs=921c531d3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gn44K-00083r-QZ
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 16:11:00 +0000
Content-Disposition: inline
In-Reply-To: <682e640c-565e-f20c-b2fe-13d7ebfe075c@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgMDI6NDc6MjBQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAxLzI1LzE5IDExOjMzIEFNLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gVGh1LCBK
YW4gMjQsIDIwMTkgYXQgMDU6NDg6MjdQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiA+
PiBSZW1vdmUgImNoYXR0eSIgYW5kIHJlZHVuZGFudCBpbmZvcm1hdGlvbiBmcm9tIHRoZSB4bCBt
YW4gcGFnZTsKPiA+PiByZXN0cmljdCBpdCB0byBmdW5jdGlvbmFsIGRlc2NyaXB0aW9ucyBvbmx5
LCBhbmQgcG9pbnQgaW5zdGVhZCB0bwo+ID4+IHFlbXUtZGVwcml2LnBhbmRvYyBhbmQgU1VQUE9S
VC5tZCBhcyBsb2NhdGlvbnMgZm9yICJjYW5vbmljYWwiCj4gPj4gaW5mb3JtYXRpb24uCj4gPj4K
PiA+PiBBZGQgYSBtYW4gcGFnZSBlbnRyeSBmb3IgZGV2aWNlX21vZGVsX3VzZXIuCj4gPj4KPiA+
PiBVcGRhdGUgcWVtdS1kZXByaXZpbGVnZS5wYW5kb2M6Cj4gPj4KPiA+PiBDaGFuZ2VzIGluIG1p
c3NpbmcgZmVhdHVyZSBsaXN0Ogo+ID4+IC0gTWlncmF0aW9uIGlzIGZ1bmN0aW9uYWwKPiA+PiAt
IEJ1dCBxZGlzayBiYWNrZW5kcyBhcmUgbm90Cj4gPj4KPiA+PiBBZGQgYSBtaXNzaW5nIHJlc3Ry
aWN0aW9uIGxpc3QuCj4gPj4KPiA+PiBUaGUgZm9sbG93aW5nIHN0YXRlbWVudHMgZnJvbSB0aGUg
bWFuIHBhZ2UgYXJlIGRyb3BwZWQ6Cj4gPj4gLSBNZW50aW9uaW5nIFBWOyBQViBndWVzdHMgbmV2
ZXIgaGF2ZSBhIGRldmljZSBtb2RlbC4KPiA+PiAtIERyb3AgdGhlIGNvbmZ1c2luZyBzdGF0ZW1l
bnQgYWJvdXQgc3RkdmdhIGFuZCBjaXJydXMgdmdhIG9wdGlvbnMuCj4gPj4gLSBSZS11c2VkIGRv
bWFpbiBJRHMgYXJlIG5vdyBoYW5kbGVkLgo+ID4+IC0gRGV2aWNlIG1vZGVscyBzaG91bGQgbm8g
bG9uZ2VyIGJlIGFibGUgdG8gY3JlYXRlIHdvcmxkLXJlYWRhYmxlCj4gPj4gICBmaWxlcyBvbiBk
b20wJ3MgZmlsZXN5c3RlbS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiA+PiAtLS0KPiA+PiBSRkM6IEkgZG9uJ3Qga25v
dyB3aGF0IHRoZSAndmdhJyBsaW1pdGF0aW9uIHRoaW5nIHdhcyBhYm91dCAtLSBJIHRyaWVkCj4g
Pj4gYm90aCAnZGVmYXVsdCcgYW5kICdzdGd2Z2EnIHdpdGggZG1fcmVzdHJpY3QgYW5kIHRoZXkg
d29ya2VkIGZpbmUuCj4gPiAKPiA+IEkgdGhpbmsgdW50aWwgd2UgZmlndXJlIG91dCB0aGUgc2l0
dWF0aW9uIG9mIHZnYSwgdGhlIHN0YXRlbWVudCBzaG91bGQKPiA+IHN0YXkuCj4gCj4gSG93IHdv
dWxkIHdlIGRvIHRoYXQ/CgpQZXIgbXkgdW5kZXJzdGFuZGluZzoKCiAgU2V0dGluZyB2Z2Egb3B0
aW9uIHRvIGFueXRoaW5nIGVsc2Ugb3RoZXIgdGhhbiAibm9uZSIgbWF5IG5vdCB3b3JrCgo/CgpX
ZWkuCgo+IAo+ICAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
