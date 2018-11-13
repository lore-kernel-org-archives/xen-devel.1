From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] x86/HVM: hvmemul_cmpxchg() should also
 use known_gla()
Date: Tue, 13 Nov 2018 03:45:27 -0700
Message-ID: <5BEAAB4702000078001FB627@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAA40F02000078001FB5D3@prv1-mh.provo.novell.com>
 <be6e7cecfa2143e2beba466d7888d976@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMWCJ-0004z0-Om
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:45:31 +0000
In-Reply-To: <be6e7cecfa2143e2beba466d7888d976@AMSPEX02CL03.citrite.net>
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

Pj4+IE9uIDEzLjExLjE4IGF0IDExOjM0LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTMgTm92ZW1iZXIgMjAxOCAxMDoxNQo+
PiBUbzogeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4+IENjOiBB
bmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50Cj4+
IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Cj4+IFN1YmplY3Q6IFtQQVRDSCAzLzNdIHg4Ni9IVk06IGh2bWVtdWxfY21weGNoZygpIHNob3Vs
ZCBhbHNvIHVzZQo+PiBrbm93bl9nbGEoKQo+PiAKPj4gVG8gYmUgY29uc2lzdGVudCB3aXRoIHRo
ZSB3cml0ZSBhbmQgcm13IGNhc2VzIHRoZSBtYXBwaW5nIGFwcHJvYWNoCj4+IHNob3VsZCBub3Qg
YmUgdXNlZCB3aGVuIHRoZSBndWVzdCBsaW5lYXIgYWRkcmVzcyB0cmFuc2xhdGlvbiBpcyBrbm93
bi4KPj4gVGhpcyBpbiBwYXJ0aWN1bGFyIGV4Y2x1ZGVzIHRoZSBkaXNjYXJkLXdyaXRlIGNhc2Ug
ZnJvbSBieXBhc3NpbmcgdGhlCj4+IGVtdWxhdGlvbiBwYXRoLiBUaGlzIGFsc28gbWVhbnMgdGhh
dCBub3cgRUZMQUdTIHNob3VsZCBhY3R1YWxseSBnZXQKPj4gcHJvcGVybHkgdXBkYXRlZCwgZGVz
cGl0ZSB0aGUgZGlzY2FyZGVkIHdyaXRlIHBvcnRpb24gb2YgdGhlIG1lbW9yeQo+PiBhY2Nlc3Mu
Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Cj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpU
aGFua3MuCgo+PiAtLS0KPj4gV2l0aG91dCAibWFrZSBodm1lbXVsX21hcF9saW5lYXJfYWRkcigp
IGhvbm9yIHAybV9pb3JlcV9zZXJ2ZXIiIHRoaXMKPj4gYWxzbyBoZWxwcyB0aGUgcDJtX2lvcmVx
X3NlcnZlciBjYXNlLgo+PiAKPj4gVEJEOiBXaGlsZSBodm1lbXVsX2RvX2lvKCkgdGFrZXMgY2Fy
ZSBvZiBwMm1faW9yZXFfc2VydmVyLCBJIGRvbid0IHNlZQo+PiAgICAgIGl0IHRha2luZyBjYXJl
IG9mIHAybV9pc19kaXNjYXJkX3dyaXRlKCkgdHlwZXMuIEFtIEkgb3Zlcmxvb2tpbmcKPj4gICAg
ICBzb21ldGhpbmc/Cj4gCj4gSWYgc3VjaCBhbiBhY2Nlc3MgZ2V0cyB0byBodm1lbXVsX2RvX2lv
KCkgSSB3b3VsZCBoYXZlIHRob3VnaHQgaXQgc2hvdWxkIAo+IGZhbGwgdGhyb3VnaCB0byB0aGUg
bnVsbF9oYW5kbGVyIGNhc2UsIHdoaWNoIHdpbGwgc2luayB0aGUgd3JpdGUuCgpBaCwgcmlnaHQg
LSB0aGF0IGluZGVlZCB3b3JrcyB3aXRob3V0IHNwZWNpYWwgY2FzaW5nIHRoZSB0eXBlKHMpLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
