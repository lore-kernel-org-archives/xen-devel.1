From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH 1/3] x86/HVM: __hvm_copy() should not write
 to p2m_ioreq_server pages
Date: Tue, 13 Nov 2018 12:11:58 +0000
Message-ID: <14a8db80-8ab7-4168-e959-a0237f99329b@citrix.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAA3DA02000078001FB5CB@prv1-mh.provo.novell.com>
 <1f9196d2f7c748e4a9283fe6ba9ca99b@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pmsg=ny=citrix.com=prvs=848afb93d=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gMXYU-00063l-5a
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 12:12:30 +0000
In-Reply-To: <1f9196d2f7c748e4a9283fe6ba9ca99b@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMTEvMjAxOCAxMDoyNywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2Uu
Y29tXQo+PiBTZW50OiAxMyBOb3ZlbWJlciAyMDE4IDEwOjE0Cj4+IFRvOiB4ZW4tZGV2ZWwgPHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJl
dy5Db29wZXIzQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQKPj4gPFBhdWwuRHVycmFudEBjaXRy
aXguY29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogW1BBVENI
IDEvM10geDg2L0hWTTogX19odm1fY29weSgpIHNob3VsZCBub3Qgd3JpdGUgdG8KPj4gcDJtX2lv
cmVxX3NlcnZlciBwYWdlcwo+Pgo+PiBDb21taXQgM2JkZWM1MzBhNSAoIng4Ni9IVk06IHNwbGl0
IHBhZ2Ugc3RyYWRkbGluZyBlbXVsYXRlZCBhY2Nlc3NlcyBpbgo+PiBtb3JlIGNhc2VzIikgaW50
cm9kdWNlZCBhIGh2bV9jb3B5X3RvX2d1ZXN0X2xpbmVhcigpIGF0dGVtcHQgYmVmb3JlCj4+IGZh
bGxpbmcgYmFjayB0byBodm1lbXVsX2xpbmVhcl9tbWlvX3dyaXRlKCkuIFRoaXMgaXMgd3Jvbmcg
Zm9yIHRoZQo+PiBwMm1faW9yZXFfc2VydmVyIHNwZWNpYWwgY2FzZS4gVGhhdCBjaGFuZ2Ugd2lk
ZW5lZCBhIHByZS1leGlzdGluZyBpc3N1ZQo+PiB0aG91Z2g6IE90aGVyIHdyaXRlcyB0byBzdWNo
IHBhZ2VzIGFsc28gbmVlZCB0byBiZSBmYWlsZWQgKG9yIGZvcmNlZAo+PiB0aHJvdWdoIGVtdWxh
dGlvbiksIGluIHBhcnRpY3VsYXIgaHlwZXJjYWxsIGJ1ZmZlciB3cml0ZXMuCj4+Cj4+IFJlcG9y
dGVkLWJ5OiA/Pz8gPD8/P0BjaXRyaXguY29tPgo+IAo+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmU6
IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+IAoKWWVzLCBwbGVh
c2UgYWRkIG1lIHRvIENDIHNvIEkgY291bGQgcHVsbCBhbmQgdGVzdCB0aGUgcGF0Y2hlcy4KCkln
b3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
