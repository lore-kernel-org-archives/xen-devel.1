From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 1/8] x86: NOP out XPTI entry/exit code
 when it's not in use
Date: Tue, 3 Apr 2018 19:48:17 +0200
Message-ID: <c4ae0f15-8320-17ca-1ead-db709fafc8e4@suse.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCB4202000078001B3707@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eidr=gy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f3Q2h-0002rv-MZ
 for xen-devel@lists.xenproject.org; Tue, 03 Apr 2018 17:48:23 +0000
In-Reply-To: <5AAFCB4202000078001B3707@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDMvMTggMTQ6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEludHJvZHVjZSBhIHN5bnRo
ZXRpYyBmZWF0dXJlIGZsYWcgdG8gdXNlIGFsdGVybmF0aXZlIGluc3RydWN0aW9uCj4gcGF0Y2hp
bmcgdG8gTk9QIG91dCBhbGwgY29kZSBvbiBlbnRyeS9leGl0IHBhdGhzLiBIYXZpbmcgTk9QcyBo
ZXJlIGlzCj4gZ2VuZXJhbGx5IGJldHRlciB0aGFuIHVzaW5nIGNvbmRpdGlvbmFsIGJyYW5jaGVz
Lgo+IAo+IEFsc28gY2hhbmdlIHRoZSBsaW1pdCBvbiB0aGUgbnVtYmVyIG9mIGJ5dGVzIHdlIGNh
biBwYXRjaCBpbiBvbmUgZ28gdG8KPiB0aGF0IHJlc3VsdGluZyBmcm9tIHRoZSBlbmNvZGluZyBp
biBzdHJ1Y3QgYWx0X2luc3RyIC0gdGhlcmUncyBubyBwb2ludAo+IHJlZHVjaW5nIGl0IGJlbG93
IHRoYXQgbGltaXQsIGFuZCB3aXRob3V0IGEgY2hlY2sgYmVpbmcgaW4gcGxhY2UgdGhhdAo+IHRo
ZSBsaW1pdCBpc24ndCBhY3R1YWxseSBleGNlZWRlZCwgc3VjaCBhbiBhcnRpZmljaWFsIGJvdW5k
YXJ5IGlzIGEKPiBsYXRlbnQgcmlzay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpKdXN0IGRpZCBhIHBhcmFsbGVsIG1ha2Ugb2YgdGhlIGh5cGVy
dmlzb3Igd2l0aCBhbmQgd2l0aG91dCB0aGUgcGF0Y2gsCndpdGggeHB0aT10cnVlIGFuZCB3aXRo
IHhwdGk9ZmFsc2UgKHZhbHVlcyBpbiBicmFjZXMgYXJlIHN0ZGRldikuCgogICAgICAgICAgICAg
ICAgICAgICAgIGVsYXBzZWQgICAgICAgICBzeXN0ZW0gICAgICAgICAgdXNlcgp1bnBhdGNoZWQs
IHhwdGk9ZmFsc2U6IDExOC42OSAoIDEuNDApICAxNjguMzggKDEyLjY0KSAgMTg2LjExICggNS40
OSkKdW5wYXRjaGVkLCB4cHRpPXRydWUgOiAxMjguMDIgKCA1Ljk3KSAgMjE5LjY2ICgyMy4wNikg
IDE5Ny44NCAoIDQuNTMpCnBhdGNoZWQsICAgeHB0aT1mYWxzZTogIDkwLjY1ICggNi42MykgICA5
OS41MCAoMTQuNzkpICAxODAuMzUgKCA1Ljk3KQpwYXRjaGVkLCAgIHhwdGk9dHJ1ZSA6IDExMS42
OSAoIDkuOTMpICAxNjMuNjMgKDEzLjA1KSAgMTgxLjIyICggMy43MSkKCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
