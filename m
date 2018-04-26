From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: correct vCPU dirty CPU handling
Date: Thu, 26 Apr 2018 10:51:32 +0100
Message-ID: <15b39884-c5b5-c672-752c-4d0cff2b5f1d@citrix.com>
References: <5AE19EC002000078001BEABB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cuix=hp=citrix.com=prvs=6477dd145=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fBdYu-0001uW-0Y
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 09:51:36 +0000
In-Reply-To: <5AE19EC002000078001BEABB@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Manuel Bouyer <bouyer@antioche.eu.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDQvMTggMTA6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAtMTIwMiwxMSArMTIwMiwyMyBA
QCB2b2lkIHB1dF9wYWdlX2Zyb21fbDFlKGwxX3BnZW50cnlfdCBsMWUsCj4gICAgICAgICAgICAg
ICB1bmxpa2VseSgoKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spICE9
IDApKSAmJgo+ICAgICAgICAgICAgICAgKGwxZV9vd25lciA9PSBwZ19vd25lcikgKQo+ICAgICAg
ICAgIHsKPiArICAgICAgICAgICAgY3B1bWFza190ICptYXNrID0gdGhpc19jcHUoc2NyYXRjaF9j
cHVtYXNrKTsKPiArCj4gKyAgICAgICAgICAgIGNwdW1hc2tfY2xlYXIobWFzayk7Cj4gKwo+ICAg
ICAgICAgICAgICBmb3JfZWFjaF92Y3B1ICggcGdfb3duZXIsIHYgKQo+ICAgICAgICAgICAgICB7
Cj4gLSAgICAgICAgICAgICAgICBpZiAoIHB2X2Rlc3Ryb3lfbGR0KHYpICkKPiAtICAgICAgICAg
ICAgICAgICAgICBmbHVzaF90bGJfbWFzayhjcHVtYXNrX29mKHYtPmRpcnR5X2NwdSkpOwo+ICsg
ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNwdTsKPiArCj4gKyAgICAgICAgICAgICAgICBp
ZiAoICFwdl9kZXN0cm95X2xkdCh2KSApCj4gKyAgICAgICAgICAgICAgICAgICAgY29udGludWU7
Cj4gKyAgICAgICAgICAgICAgICBjcHUgPSByZWFkX2F0b21pYygmdi0+ZGlydHlfY3B1KTsKPiAr
ICAgICAgICAgICAgICAgIGlmICggaXNfdmNwdV9kaXJ0eV9jcHUoY3B1KSApCj4gKyAgICAgICAg
ICAgICAgICAgICAgX19jcHVtYXNrX3NldF9jcHUoY3B1LCBtYXNrKTsKPiAgICAgICAgICAgICAg
fQo+ICsKPiArICAgICAgICAgICAgaWYgKCAhY3B1bWFza19lbXB0eShtYXNrKSApCj4gKyAgICAg
ICAgICAgICAgICBmbHVzaF90bGJfbWFzayhtYXNrKTsKClRoaW5raW5nIGFib3V0IHRoaXMsIHdo
YXQgaXMgd3Jvbmcgd2l0aDoKCmJvb2wgZmx1c2g7Cgpmb3JfZWFjaF92Y3B1ICggcGdfb3duZXIs
IHYgKQrCoMKgwqAgaWYgKCBwdl9kZXN0cm95X2xkdCh2KSApCsKgwqDCoMKgwqDCoMKgIGZsdXNo
ID0gdHJ1ZTsKCmlmICggZmx1c2ggKQrCoMKgIGZsdXNoX3RsYl9tYXNrKHBnX293bmVyLT5kaXJ0
eV9jcHVtYXNrKTsKClRoaXMgaXMgZmFyIGxlc3MgY29tcGxpY2F0ZWQgY3B1bWFzayBoYW5kbGlu
Zy7CoCBBcyB0aGUgbG9vcCBtYXkgYmUgbG9uZywKaXQgYXZvaWRzIGZsdXNoaW5nIHBjcHVzIHdo
aWNoIGhhdmUgc3Vic2VxdWVudGx5IHN3aXRjaGVkIGF3YXkgZnJvbQpwZ19vd25lciBjb250ZXh0
LsKgIEl0IGFsc28gYXZvaWRzIGFsbCBwbGF5aW5nIHdpdGggdi0+ZGlydHlfY3B1LgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
