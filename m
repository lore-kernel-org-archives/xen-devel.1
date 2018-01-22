From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/6] x86: avoid explicit TLB flush when
 saving exec state
Date: Mon, 22 Jan 2018 03:00:58 -0700
Message-ID: <5A65C46A02000078001A0F54@prv-mh.provo.novell.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6225A202000078001A07D5@prv-mh.provo.novell.com>
 <dd180241-bdb6-2047-6860-d77721db6209@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edYua-0005Op-1h
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 10:01:08 +0000
In-Reply-To: <dd180241-bdb6-2047-6860-d77721db6209@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAxLjE4IGF0IDE5OjEyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMDEvMTggMTY6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvZG9tYWluLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+IEBAIC0x
NjkzLDcgKzE2OTMsNyBAQCB2b2lkIGNvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICpwcmV2LCBz
Cj4+ICAgICAgaWYgKCB1bmxpa2VseShkaXJ0eV9jcHUgIT0gY3B1KSAmJiBkaXJ0eV9jcHUgIT0g
TlJfQ1BVUyApCj4+ICAgICAgewo+PiAgICAgICAgICAvKiBPdGhlciBjcHVzIGNhbGwgX19zeW5j
X2xvY2FsX2V4ZWNzdGF0ZSBmcm9tIGZsdXNoIGlwaSBoYW5kbGVyLiAqLwo+IAo+IEdpdmVuIHRo
ZSBjaGFuZ2UgaW4gYmVoYXZpb3VyLCAvKiBSZW1vdGUgY3B1IGNhbGxzCj4gX19zeW5jX2xvY2Fs
X2V4ZWNzdGF0ZSgpLiAqLyA/ICBQZXJoYXBzIG1vcmUgYXBwbGljYWJsZSB0byB0aGUgcHJldmlv
dXMKPiBwYXRjaC4KCkFoLCB5ZXMgLSBJJ3ZlIGNoYW5nZWQgaXQgdGhlcmUuCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
