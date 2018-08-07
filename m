From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/9] x86/hvm: put
 hvm_local_events_need_delivery into a header file
Date: Tue, 07 Aug 2018 04:50:21 -0600
Message-ID: <5B69796D02000078001DB7F7@prv1-mh.provo.novell.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <34323b84099c5626c7e06f4a0b6a2dde53a5071d.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fmzZJ-0001wu-QY
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:50:25 +0000
In-Reply-To: <34323b84099c5626c7e06f4a0b6a2dde53a5071d.1533636027.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2V2ZW50LmgKPiBA
QCAtMCwwICsxLDE0IEBACj4gKyNpZm5kZWYgQVNNX0hWTV9FVkVOVF9ICj4gKyNkZWZpbmUgQVNN
X0hWTV9FVkVOVF9ICj4gKwo+ICsjaWYgQ09ORklHX0hWTQo+ICsKPiAraW50IGh2bV9sb2NhbF9l
dmVudHNfbmVlZF9kZWxpdmVyeShzdHJ1Y3QgdmNwdSAqdik7Cj4gKwo+ICsjZWxzZQo+ICsKPiAr
c3RhdGljIGlubGluZSBpbnQgaHZtX2xvY2FsX2V2ZW50c19uZWVkX2RlbGl2ZXJ5KHN0cnVjdCB2
Y3B1ICp2KSB7IHJldHVybiAwOyB9Cj4gKwo+ICsjZW5kaWYKPiArCj4gKyNlbmRpZgkvKiBBU01f
SFZNX0VWRU5UX0ggKi8KCkFyZSB5b3UgZXhwZWN0aW5nIG1vcmUgc3R1ZmYgdG8gZ28gaW50byB0
aGlzIGhlYWRlcj8gSWYgbm90LCBJIGRvbid0CnRoaW5rIGEgc2VwYXJhdGUgaGVhZGVyIGlzIHJl
YWxseSB3YXJyYW50ZWQgaGVyZS4KCkRpZCB5b3UgY29uc2lkZXIgdGFraW5nIHRoZSBvcHBvcnR1
bml0eSBhbmQgc3dpdGNoaW5nIHRoZSBmdW5jdGlvbgp0byBoYXZlIGJvb2wgcmV0dXJuIHZhbHVl
IGF0IHRoZSBzYW1lIHRpbWU/IChTZWVpbmcgd2hldGhlciB0aGUKcGFyYW1ldGVyIGNvdWxkIGFs
c28gYmUgY29uc3RpZmllZCBpcyBwcm9iYWJseSBtb3JlIGludm9sdmVkIGEKdGFzaywgYW5kIGhl
bmNlIG5vdCBzdWl0YWJsZSBoZXJlLikKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
