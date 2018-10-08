From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 1/2] x86/hvm: make sure
 HVM_PARAM_[BUF]IOREQ_PFN can only be set once
Date: Mon, 8 Oct 2018 13:21:35 +0000
Message-ID: <66f6306bdc564059bce532b56edbaef4@AMSPEX02CL03.citrite.net>
References: <20181005134334.2645-1-paul.durrant@citrix.com>
 <20181005134334.2645-2-paul.durrant@citrix.com>
 <5BBB598F02000078001EF972@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zmvf=mu=citrix.com=prvs=81273039b=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g9VTf-0003St-6s
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 13:21:39 +0000
In-Reply-To: <5BBB598F02000078001EF972@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDggT2N0b2JlciAyMDE4IDE0OjIwCj4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1Cj4gPHdlaS5saXUyQGNpdHJpeC5j
b20+OyB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDEvMl0geDg2L2h2bTogbWFrZSBzdXJlIEhWTV9QQVJBTV9bQlVGXUlPUkVR
X1BGTiBjYW4KPiBvbmx5IGJlIHNldCBvbmNlCj4gCj4gPj4+IE9uIDA1LjEwLjE4IGF0IDE1OjQz
LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gVGhlc2UgcGFyYW1ldGVycyBz
aG91bGQgaGF2ZSBhbHdheXMgYmVlbiBpbiB0aGUgJ3NldCBvbmNlJyBjYXRlZ29yeQo+ID4gYnV0
IHRoaXMgaGFzLCBzbyBmYXIsIG5vdCBiZWVuIGVuZm9yY2VkLgo+IAo+IEhtbSwgbm93IHRoYXQg
SSdtIGxvb2tpbmcgYXQgcGF0Y2ggMiBJIHNlZSB3aGVyZSB0aGlzIGlzIGNvbWluZyBmcm9tLAo+
IGJ1dCBhIGhpbnQgdG93YXJkcyB0aGlzIGhlcmUgd291bGQgaGF2ZSBoZWxwZWQsIGlmIHRoaXMg
aXMgdG8gYmUgYQo+IHNlcGFyYXRlIHBhdGNoIChmb2xkaW5nIGludG8gdGhlIHNlY29uZCBwYXRj
aCB3aXRoIGEgcmVzcGVjdGl2ZQo+IHJlbWFyayB3b3VsZCBwZXJoYXBzIGhhdmUgYmVlbiBiZXR0
ZXIgYW55d2F5KS4KPiAKCk9rLiBJJ2xsIHNxdWFzaCB0aGVtIHRvZ2V0aGVyIGlmIEkgbmVlZCB0
byBkbyBhIHYyLgoKICBQYXVsCgo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
