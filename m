From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/altp2m: Allow setting the #VE info page
 for an arbitrary VCPU
Date: Wed, 01 Aug 2018 02:23:33 -0600
Message-ID: <5B616E0502000078001D9C0F@prv1-mh.provo.novell.com>
References: <20180725114915.26614-1-apop@bitdefender.com>
 <5B604D9C02000078001D96A6@prv1-mh.provo.novell.com>
 <CABfawhkaCVRrrBJ46U--b3odRztXcQ+_+VBebADAB-aF1uYJXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fkmPy-00052R-4Q
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 08:23:38 +0000
In-Reply-To: <CABfawhkaCVRrrBJ46U--b3odRztXcQ+_+VBebADAB-aF1uYJXg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA3LjE4IGF0IDE5OjE5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgNTo1MyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+PiA+Pj4gT24gMjUuMDcuMTggYXQgMTM6NDksIDxhcG9wQGJpdGRlZmVu
ZGVyLmNvbT4gd3JvdGU6Cj4+ID4gLSAgICAgICAgdmNwdV9hbHRwMm0oY3VycikudmVpbmZvX2dm
biA9IF9nZm4oYS51LmVuYWJsZV9ub3RpZnkuZ2ZuKTsKPj4gPiAtICAgICAgICBhbHRwMm1fdmNw
dV91cGRhdGVfdm1mdW5jX3ZlKGN1cnIpOwo+PiA+ICsgICAgICAgIHZjcHVfYWx0cDJtKHYpLnZl
aW5mb19nZm4gPSBfZ2ZuKGEudS5lbmFibGVfbm90aWZ5Lmdmbik7Cj4+ID4gKyAgICAgICAgYWx0
cDJtX3ZjcHVfdXBkYXRlX3ZtZnVuY192ZSh2KTsKPj4KPj4gSSdkIGxpa2UgeW91IHRvIG91dGxp
bmUgaW4gdGhlIGRlc2NyaXB0aW9uIGhvdyB5b3UgbWVhbiBhbiBleHRlcm5hbAo+PiBhZ2VudCB0
byBjb29yZGluYXRlIHRoZSB1c2Ugb2YgdGhpcyBHRk4gd2l0aCB0aGUgZ3Vlc3QgKGFuZCBpbgo+
PiBwYXJ0aWN1bGFyIHdpdGhvdXQgaW4tZ3Vlc3QgYWdlbnQpLgo+IAo+IFVzaW5nICNWRSB3aXRo
b3V0IGFuIGluLWd1ZXN0IGFnZW50IGlzbid0IHJlYWxseSBwb3NzaWJsZSBzbyB0aGlzIGlzCj4g
cmVhbGx5IGp1c3QgYWJvdXQgZGVzaWduYXRpbmcgdGhlIHBhZ2UgZnJvbSBkb20wIGluc3RlYWQg
b2YgZG9pbmcgaXQKPiB3aXRoIHRoZSBpbi1ndWVzdCBhZ2VudC4gU29tZXRoaW5nIGhhcyB0byBi
ZSBwcmVzZW50IGluIHRoZSBndWVzdCB0bwo+IGhhbmRsZSB0aGUgbmV3IGludGVycnVwdHMgY29t
aW5nIGZyb20gI1ZFIGFmdGVyIGFsbC4KCk5vdCBuZWNlc3NhcmlseSAtIHRoZSBleGNlcHRpb24g
Y291bGQgYWxzbyBiZSBpbnRlcmNlcHRlZCwgYW5kIHRoZQpleHRlcm5hbCBhZ2VudCBiZSBpbmZv
cm1lZCwgd2l0aCBpdCB0YWtpbmcgYXBwcm9wcmlhdGUgYWN0aW9uLgoKQW55d2F5IC0gaWYgc3Vj
aCBhIGRlcGVuZGVuY3kgY29udGludWVzIHRvIGV4aXN0LCBJIHRoaW5rIGl0IHdvdWxkCmJlIGRl
c2lyYWJsZSB0byBtZW50aW9uIGl0IGluIHRoZSBkZXNjcmlwdGlvbi4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
