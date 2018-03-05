From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/5] x86/pv: Drop {compat_,
 }create_bounce_frame() and use the C version instead
Date: Mon, 05 Mar 2018 02:27:30 -0700
Message-ID: <5A9D1B9202000078001AE6B4@prv-mh.provo.novell.com>
References: <1519743036-11600-1-git-send-email-andrew.cooper3@citrix.com>
 <1519743036-11600-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519743036-11600-5-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE4IGF0IDE1OjUwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLWNvbXBhdF9jcmVhdGVfYm91bmNlX2ZyYW1lOgo+IC0gICAgICAgIEFTU0VSVF9JTlRF
UlJVUFRTX0VOQUJMRUQKPiAtICAgICAgICBtb3YgICAlZnMsJWVkaQo+IC0gICAgICAgIEFTTV9T
VEFDCj4gLSAgICAgICAgdGVzdGIgJDIsVVJFR1NfY3MrOCglcnNwKQo+IC0gICAgICAgIGp6ICAg
IDFmCj4gLSAgICAgICAgLyogUHVzaCBuZXcgZnJhbWUgYXQgcmVnaXN0ZXJlZCBndWVzdC1PUyBz
dGFjayBiYXNlLiAqLwo+IC0gICAgICAgIG1vdmwgIFZDUFVfa2VybmVsX3NwKCVyYngpLCVlc2kK
PiAtLkxmdDE6ICBtb3YgICBWQ1BVX2tlcm5lbF9zcyglcmJ4KSwlZnMKCk5vdGUgaG93IHdlIGRp
ZCB0YWtlIGludG8gY29uc2lkZXJhdGlvbiB0aGUgc2VnbWVudCBiYXNlIGhlcmU7CnB2X2NyZWF0
ZV9ib3VuY2VfZnJhbWUoKSBkb2Vzbid0LiBIZW5jZSB3aGlsZSB0aGUgcGF0Y2ggaGVyZQppcwpS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpJJ20gYWZyYWlkIEkg
aGF2ZSB0byB3aXRoZHJhdyB0aGUgcmVzcGVjdGl2ZSB0YWcgZm9yIHRoZSBlYXJsaWVyIG9uZQoo
ZGVzcGl0ZSByZWFsaXppbmcgdGhhdCB0aGVyZSBhcmUgb3RoZXIgcGxhY2VzIHdoZXJlIHdlIFt3
cm9uZ2x5XQphc3N1bWUgc3RhY2sgc2VnbWVudHMgdG8gYmUgZmxhdCkuCgpKYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
