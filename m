From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 00/16] x86: indirect call overhead reduction
Date: Fri, 13 Jul 2018 08:27:09 -0600
Message-ID: <5B48B6BD02000078001D3D4F@prv1-mh.provo.novell.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B485E6002000078001D3AB8@prv1-mh.provo.novell.com>
 <be2ab951-e032-4035-89bb-3560086015a5@arm.com>
 <5B48A8A602000078001D3D1F@prv1-mh.provo.novell.com>
 <74f1e9a6-36bb-c643-6734-3e8767b1c73c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ysgb=j5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdz2N-0007BR-FV
 for xen-devel@lists.xenproject.org; Fri, 13 Jul 2018 14:27:11 +0000
In-Reply-To: <74f1e9a6-36bb-c643-6734-3e8767b1c73c@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA3LjE4IGF0IDE1OjM5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEzLzA3LzE4IDE0OjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTMuMDcuMTgg
YXQgMTU6MDAsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBXaGF0IHdvdWxkIGJl
IHRoZSBnZW5lcmljIGludGVyZmFjZSBoZXJlPyBJIHNhdyBpdCB3YXMgYmFzZWQgb24KPj4+IGFs
dGVybmF0aXZlIGZvciB0aGUgcGx1bWJpbmcuCj4+IAo+PiBZZXMsIEknZCBwcmVmZXIgdG8gdXNl
IHRoZSBzYW1lIG1lY2hhbmlzbSBhcyBwcmVzZW50ZWQgaW4gdGhlIHNlcmllcy4KPj4gQXMgcGVy
IGFib3ZlIGZvciB0aGUgSU9NTVUgY2FzZSB3ZSdkIHRoZW4gbmVlZCBhbm90aGVyIGFic3RyYWN0
aW9uCj4+IGxheWVyIHB1dCBpbiB0aGUgbWlkZGxlICh0byBwcm9kdWNlIGEgcGF0Y2ggc2l0ZSBv
biB4ODYsIGJ1dCBhIG5vcm1hbAo+PiBbaW5kaXJlY3RdIGNhbGwgb24gQVJNKS4KPiAKPiBJIHdp
bGwgaGF2ZSBhIGxvb2suIENvdWxkIHlvdSBwb2ludCB0byB0aGUgcGF0Y2ggYWRkaW5nIHRoZSBh
YnN0cmFjdGlvbj8KClBhdGNoIDkgaXMgd2hlcmUgdGhlIHg4NiBzaWRlIGluZnJhc3RydWN0dXJl
IGdldHMgYWRkZWQuIFR5cGljYWwgdXNlcwp3b3VsZCB0aGVuIGJlICh0YWtlbiBmcm9tIHBhdGNo
IDEwKQoKIGh2bV9ndWVzdF94ODZfbW9kZShzdHJ1Y3QgdmNwdSAqdikKIHsKICAgICBBU1NFUlQo
diA9PSBjdXJyZW50KTsKLSAgICByZXR1cm4gaHZtX2Z1bmNzLmd1ZXN0X3g4Nl9tb2RlKHYpOwor
ICAgIHJldHVybiBhbHRlcm5hdGl2ZV9jYWxsMShodm1fZnVuY3MuZ3Vlc3RfeDg2X21vZGUsIHYp
OwogfQogCiBzdGF0aWMgaW5saW5lIHZvaWQKIGh2bV91cGRhdGVfaG9zdF9jcjMoc3RydWN0IHZj
cHUgKnYpCiB7CiAgICAgaWYgKCBodm1fZnVuY3MudXBkYXRlX2hvc3RfY3IzICkKLSAgICAgICAg
aHZtX2Z1bmNzLnVwZGF0ZV9ob3N0X2NyMyh2KTsKKyAgICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwx
KGh2bV9mdW5jcy51cGRhdGVfaG9zdF9jcjMsIHYpOwogfQoKQW5kIGFjdHVhbGx5IHRoZXJlIHdh
cyBvbmUgbW9yZSBxdWVzdGlvbiBJIG1lYW50IHRvIGFzazogQXJlIGFsbApsb2NhdGlvbnMgd2l0
aGluIFhlbiByZWFjaGFibGUgYnkgZGlyZWN0IGNhbGxzIG9uIEFSTT8gSS5lLiBjYW4gYW4KaW5k
aXJlY3QgY2FsbCwgd2hlbiB3ZSBrbm93IGl0cyB0YXJnZXQsIGFsd2F5cyBiZSByZXBsYWNlZCwg
bm8KbWF0dGVyIGF0IHdoYXQgYWRkcmVzcyAod2l0aGluIFhlbikgaXQgbGl2ZXM/CgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
