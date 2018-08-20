From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RESEND] x86/xen: enable early use of
 set_fixmap in 32-bit Xen PV guest
Date: Mon, 20 Aug 2018 19:05:25 +0200
Message-ID: <a62903ae-566a-10b2-5b2f-4d6ca75dda91__17101.2751794935$1534784657$gmane$org@suse.com>
References: <20180820152420.16004-1-jgross@suse.com>
 <dd4dc3da-0d06-5844-406a-9e3d942e900d@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vhn4=ld=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1frncP-0000iz-4N
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 17:05:29 +0000
In-Reply-To: <dd4dc3da-0d06-5844-406a-9e3d942e900d@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDgvMTggMTg6NTYsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwOC8yMC8yMDE4
IDExOjI0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBDb21taXQgN2IyNWI5Y2IwZGFkODMg
KCJ4ODYveGVuL3RpbWU6IEluaXRpYWxpemUgcHYgeGVuIHRpbWUgaW4KPj4gaW5pdF9oeXBlcnZp
c29yX3BsYXRmb3JtKCkiKSBtb3ZlZCB0aGUgbWFwcGluZyBvZiB0aGUgc2hhcmVkIGluZm8gYXJl
YQo+PiBiZWZvcmUgcGFnZXRhYmxlX2luaXQoKS4gVGhpcyBicmVha3MgYm9vdGluZyBhcyAzMi1i
aXQgUFYgZ3Vlc3QgYXMgdGhlCj4+IHVzZSBvZiBzZXRfZml4bWFwIGlzbid0IHBvc3NpYmxlIGF0
IHRoaXMgdGltZSBvbiAzMi1iaXQuCj4+Cj4+IFRoaXMgY2FuIGJlIHdvcmtlZCBhcm91bmQgYnkg
cG9wdWxhdGluZyB0aGUgbmVlZGVkIFBNRCBvbiAzMi1iaXQKPj4ga2VybmVsIGVhcmxpZXIuCj4+
Cj4+IEluIG9yZGVyIG5vdCB0byByZWltcGxlbWVudCBwb3B1bGF0ZV9leHRyYV9wdGUoKSB1c2lu
ZyBleHRlbmRfYnJrKCkKPj4gZm9yIGFsbG9jYXRpbmcgbmV3IHBhZ2UgdGFibGVzIGV4dGVuZCBh
bGxvY19sb3dfcGFnZXMoKSB0byBkbyB0aGF0IGluCj4+IGNhc2UgdGhlIGVhcmx5IHBhZ2UgdGFi
bGUgcG9vbCBpcyBub3QgeWV0IGF2YWlsYWJsZS4KPj4KPj4gRml4ZXM6IDdiMjViOWNiMGRhZDgz
ICgieDg2L3hlbi90aW1lOiBJbml0aWFsaXplIHB2IHhlbiB0aW1lIGluIGluaXRfaHlwZXJ2aXNv
cl9wbGF0Zm9ybSgpIikKPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgo+PiBSZXZpZXdlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXgu
ZGU+Cj4+IC0tLQo+PiBSZXNlbmRpbmcgd2l0aCBjb3JyZWN0ZWQgRml4ZXM6IHRhZwo+PiBCb3Jp
cywgcGxlYXNlIHRha2UgdGhpcyB2aWEgdGhlIFhlbiB0cmVlIChUaG9tYXMgYXNrZWQgdXMgdG8g
ZG8gc28pCj4gCj4gCj4gU3VyZSwgYnV0IHdlIHdpbGwgbmVlZCB0byByZWJhc2UgdG8gdGhlIGxh
dGVzdCBiaXRzLCBzbyB5b3Ugd2lsbCBoYXZlIHRvCj4gZXhwbGFpbiB5b3Vyc2VsZiB0byBMaW51
cyA7LSkKCk5QIGZvciBtZS4gQXQgbGVhc3QgSSBob3BlIHNvLiA6LSkKCgpKdWVyZ2VuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
