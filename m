From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/7] x86: slightly reduce Meltdown
 band-aid overhead
Date: Wed, 7 Feb 2018 19:35:09 +0000
Message-ID: <5010def0-594c-2f60-4f23-5a4b0131654e@citrix.com>
References: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
 <5A7B336F02000078001A621F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dqlu=fb=citrix.com=prvs=569a4e3b1=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ejVUv-0006ZM-Ql
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 19:35:13 +0000
In-Reply-To: <5A7B336F02000078001A621F@prv-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDIvMTggMTY6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEknbSBub3Qgc3VyZSB3aHkg
SSBkaWRuJ3QgZG8gdGhpcyByaWdodCBhd2F5OiBCeSBhdm9pZGluZyB0aGUgdXNlIG9mCj4gZ2xv
YmFsIFBURXMgaW4gdGhlIGNsb25lZCBkaXJlY3RtYXAsIHRoZXJlJ3Mgbm8gbmVlZCB0byBmaWRk
bGUgd2l0aAo+IENSNC5QR0Ugb24gYW55IG9mIHRoZSBlbnRyeSBwYXRocy4gT25seSB0aGUgZXhp
dCBwYXRocyBuZWVkIHRvIGZsdXNoCj4gZ2xvYmFsIG1hcHBpbmdzLgo+Cj4gVGhlIHJlZHVjZWQg
Zmx1c2hpbmcsIGhvd2V2ZXIsIGltcGxpZXMgdGhhdCB3ZSBub3cgbmVlZCB0byBoYXZlCj4gaW50
ZXJydXB0cyBvZmYgb24gYWxsIGVudHJ5IHBhdGhzIHVudGlsIGFmdGVyIHRoZSBwYWdlIHRhYmxl
IHN3aXRjaCwgc28KPiB0aGF0IGZsdXNoIElQSXMgY2FuJ3QgYXJyaXZlIHdpdGggdGhlIHJlc3Ry
aWN0ZWQgcGFnZSB0YWJsZXMgc3RpbGwKPiBhY3RpdmUsIGJ1dCBvbmx5IGEgbm9uLWdsb2JhbCBm
bHVzaCBoYXBwZW5pbmcgd2l0aCB0aGUgQ1IzIGxvYWRzLiBBbG9uZwo+IHRob3NlIGxpbmVzIHRo
ZSAic3luYyIgSVBJIGFmdGVyIEw0IGVudHJ5IHVwZGF0ZXMgbm93IG5lZWRzIHRvIGJlY29tZSBh
Cj4gcmVhbCAoYW5kIGdsb2JhbCkgZmx1c2ggSVBJLCBzbyB0aGF0IGluc2lkZSBYZW4gd2UnbGwg
YWxzbyBwaWNrIHVwIHN1Y2gKPiBjaGFuZ2VzLgoKQWN0dWFsbHksIG9uIHNlY29uZCBjb25zaWRl
cmF0aW9uLCB3aHkgZG9lcyByZWVuYWJsaW5nIGludGVycnVwdHMgbmVlZAp0byBiZSBkZWZlcnJl
ZD8KClRoZSBzYWZldHkgb2YgdGhlIHN5bmNfZ3Vlc3QgcGF0aCAod2hpY2ggcHJldmlvdXNseSBl
bnRlcmVkIFhlbiwgZGlkCm5vdGhpbmcsIGFuZCBleGl0ZWQgYWdhaW4pIHJlbGllZCBvbiB0aGUg
ZW50cnkgcGFydCBmbHVzaGluZyBnbG9iYWwKbWFwcGluZ3MgZm9yIHNhZmV0eSwgYXMgdGhlIHJl
dHVybi10by14ZW4gcGF0aCBkb2Vzbid0IG5lY2Vzc2FyaWx5CnN3aXRjaCBtYXBwaW5ncy4KCkhv
d2V2ZXIsIHRoZSBmaXJzdCBodW5rIHVwZ3JhZGluZyB0aGUgImRvIG5vdGhpbmciIHRvIGEgcHJv
cGVyIGdsb2JhbApmbHVzaCwgY292ZXJzIHRoYXQgY2FzZS4KCkkgZG9uJ3Qgc2VlIGFueXRoaW5n
IGVsc2Ugd2hpY2ggYWZmZWN0cyB0aGUgc2FmZXR5IG9mIHRha2luZyBUTEIgZmx1c2gKSVBJcyBl
YXJseSBpbiB0aGUgZW50cnktZnJvbS1ndWVzdCBwYXRoLsKgIFdoYXQgYW0gSSBtaXNzaW5nPwoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
