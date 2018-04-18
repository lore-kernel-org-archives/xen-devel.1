From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5] x86/setup: properly update PTEs if
 src/dst overlaps when relocating Xen image
Date: Wed, 18 Apr 2018 10:00:53 -0600
Message-ID: <5AD76BB502000078001BC74D@prv1-mh.provo.novell.com>
References: <1524047217-24424-1-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iali=hh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f8pVr-0006w3-Ub
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 16:00:51 +0000
In-Reply-To: <1524047217-24424-1-git-send-email-daniel.kiper@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA0LjE4IGF0IDEyOjI2LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IEBAIC0xMDE5LDYgKzEwMjAsMTIgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94
ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPiAgICAgICAgICAgICAgYm9vdHN5bSh0cmFtcG9saW5l
X3hlbl9waHlzX3N0YXJ0KSA9IGU7Cj4gIAo+ICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAg
ICAgKiBBbGwgUFRFcyB3aXRoIFBGTnMgYWJvdmUgcHRlX3VwZGF0ZV9saW1pdAo+ICsgICAgICAg
ICAgICAgKiB3ZXJlIHVwZGF0ZWQgZWFybGllci4gU2tpcCB0aGVtLgo+ICsgICAgICAgICAgICAg
Ki8KPiArICAgICAgICAgICAgcHRlX3VwZGF0ZV9saW1pdCA9IFBGTl9ET1dOKGUgKyBYRU5fSU1H
X09GRlNFVCk7CgpJIGRvbid0IHVuZGVyc3RhbmQgdGhlIGNvbW1lbnQ6IE5vIFBURSB1cGRhdGVz
IGhhcHBlbiBiZWZvcmUgdGhpcyBwb2ludAphZmFpY3QuIEl0IGlzIGp1c3QgdGhhdCBQVEVzIHBv
aW50aW5nIGFib3ZlIHRoYXQgYWRkcmVzcyBhcmUgbm90IGNhbmRpZGF0ZXMKZm9yIHJlbG9jYXRp
b24uIEkgdGhpbmsgdGhlIGNvbW1lbnQgc2hvdWxkIGF0IGxlYXN0IG1lbnRpb24gdGhlIG92ZXJs
YXAKc2NlbmFyaW8geW91ciB0cnlpbmcgdG8gZGVhbCB3aXRoLCB3aXRoIHRoZSBpbXBvcnRhbnQg
cG9pbnQgYmVpbmcgdGhhdCB0aGVyZQptYXkgYWN0dWFsbHkgYmUgUFRFcyBwb2ludGluZyBpbnRv
IFtlLCBlICsgWEVOX0lNR19PRkZTRVQpLgoKVGhlIGFjdHVhbCBjb2RlIGFkanVzdG1lbnRzIGxv
b2sgZmluZSB0byBtZSBub3csIGFsYmVpdCBJIHdvbmRlciB3aGV0aGVyCj49IHdvdWxkbid0IGJl
IG1vcmUgYXBwcm9wcmlhdGUgdG8gdXNlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
