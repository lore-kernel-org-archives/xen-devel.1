From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/3] x86/HVM: hvm_map_guest_frame_rw()
 should respect p2m_ioreq_server
Date: Tue, 13 Nov 2018 04:18:37 -0700
Message-ID: <5BEAB30D02000078001FB69C@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAAB8802000078001FB62A@prv1-mh.provo.novell.com>
 <b51b339f4e4249e5af6792046f8be8b7@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMWiS-0000HC-Is
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 11:18:44 +0000
In-Reply-To: <b51b339f4e4249e5af6792046f8be8b7@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjExLjE4IGF0IDExOjU0LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTMgTm92ZW1iZXIgMjAxOCAxMDo0Nwo+
PiBUbzogeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBKYW4gQmV1
bGljaAo+PiA8SkJldWxpY2hAc3VzZS5jb20+Cj4+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50Cj4+IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFtQQVRDSCA0
LzNdIHg4Ni9IVk06IGh2bV9tYXBfZ3Vlc3RfZnJhbWVfcncoKSBzaG91bGQgcmVzcGVjdAo+PiBw
Mm1faW9yZXFfc2VydmVyCj4+IAo+PiBXcml0ZXMgdG8gc3VjaCBwYWdlcyB3b3VsZCBuZWVkIHRv
IGJlIGhhbmRlZCB0byB0aGUgZW11bGF0b3IsIHdoaWNoIHdlJ3JlCj4+IG5vdCBwcmVwYXJlZCB0
byBkbyBhdCB0aGlzIHBvaW50Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IAo+IFBhdGNoICM0IG91dCBvZiAzPyA6LSkKCldlbGwgLSBJIGhh
ZCByZWFsaXplZCBJIHNob3VsZCBkbyBhIHBhdHRlcm4gc2VhcmNoIG9ubHkgYWZ0ZXIgc2VuZGlu
Zwp0aGUgZmlyc3QgdGhyZWUgcGF0Y2hlcywgd2hlbiBzZWVpbmcgZnVydGhlciBpbnB1dCBmcm9t
IEFuZHJldy4gWWV0Cml0IGRpZG4ndCBzZWVtIHRvIG1ha2Ugc2Vuc2UgdG8gc2VuZCBhIHYyIHJp
Z2h0IGF3YXksIG9yIGFuIGVudGlyZWx5CnNlcGFyYXRlIHNlcmllcy4KCj4gUmV2aWV3ZWQtYnk6
IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpUaGFua3MuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
