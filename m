From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11 v2 2/3] x86: guard against #NM
Date: Tue, 26 Jun 2018 03:57:24 -0600
Message-ID: <5B320E0402000078001CDE9C@prv1-mh.provo.novell.com>
References: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
 <5B31DF0502000078001CDC14@prv1-mh.provo.novell.com>
 <cbd9d68d-47db-e947-14a5-ff3f43490af0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x7n8=jm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXkj5-0000Zi-AV
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 09:57:31 +0000
In-Reply-To: <cbd9d68d-47db-e947-14a5-ff3f43490af0@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA2LjE4IGF0IDExOjQxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDYvMTggMDc6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvdHJhcHMuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvdHJhcHMuYwo+PiBAQCAtMTc0
OSw3ICsxNzQ5LDIxIEBAIHZvaWQgZG9fZGV2aWNlX25vdF9hdmFpbGFibGUoc3RydWN0IGNwdV8K
Pj4gIHsKPj4gICAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7Cj4+ICAKPj4gLSAgICBC
VUdfT04oIWd1ZXN0X21vZGUocmVncykpOwo+PiArICAgIGlmICggIWd1ZXN0X21vZGUocmVncykg
KQo+PiArICAgIHsKPj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBmaXh1cCA9IHNlYXJjaF9leGNl
cHRpb25fdGFibGUocmVncyk7Cj4+ICsKPj4gKyAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCAi
I05NOiAlcCBbJXBzXSAtPiAlcFxuIiwKPiAKPiBncHJpbnRrKCkgcGxlYXNlLiAgdGhlIGN1cnJl
bnQgdmNwdSBpcyB2ZXJ5IGxpa2VseSByZWxldmFudCwgYW5kIGl0Cj4gd291bGQgYmUgZXh0cmVt
ZWx5IHVzZWZ1bCB0byBzZWUgdGhpcyBsaW5lIGluIHJlbGVhc2UgYnVpbGRzIHdoZXJlIGl0IHRv
Cj4gaGFwcGVuLgoKSG1tLCB5ZXMgLSBpdCdzIGRpZmZlcmVudCBmcm9tIG90aGVyIHNpbWlsYXIg
bG9nIG1lc3NhZ2VzIHRoZW4sIGJ1dCBJIGNhbgpzZWUgeW91ciBwb2ludC4KCj4+ICsgICAgICAg
ICAgICAgICAgX3AocmVncy0+cmlwKSwgX3AocmVncy0+cmlwKSwgX3AoZml4dXApKTsKPj4gKyAg
ICAgICAgLyoKPj4gKyAgICAgICAgICogV2UgbXVzdG4ndCBjb21lIGhlcmUsIGJ1dCBmb3IgcmVs
ZWFzZSBidWlsZHMgaGF2ZSB0aGUgcmVjb3ZlcnkKPiAKPiAiV2Ugc2hvdWxkbid0IGJlIGFibGUg
dG8gcmVhY2ggaGVyZS4uLiIKCldlbGwsIG9rYXkgLSBJIGRpZCBjb25zaWRlciB0aGlzIHdlYWtl
ciB3b3JkaW5nLCBidXQgaGFkIG9wdGVkIGZvciB0aGUKc3Ryb25nZXIgb25lIHRoZW4uCgo+IE90
aGVyd2lzZSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpUaGFua3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
