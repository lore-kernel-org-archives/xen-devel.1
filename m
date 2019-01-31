From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/9] viridian: extend init/deinit hooks
 into synic and time modules
Date: Thu, 31 Jan 2019 14:45:57 +0000
Message-ID: <20190131144557.6ezncyeb5yqb4jbm@zion.uk.xensource.com>
References: <20190131104730.2085-1-paul.durrant@citrix.com>
 <20190131104730.2085-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UmBj=QH=citrix.com=prvs=927d2e39f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gpDbS-0002Bb-Gj
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 14:46:06 +0000
Content-Disposition: inline
In-Reply-To: <20190131104730.2085-4-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMTA6NDc6MjRBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggc2ltcGx5IGFkZHMgZG9tYWluIGFuZCB2Y3B1IGluaXQvZGVpbml0
IGhvb2tzIGludG8gdGhlIHN5bmljCj4gYW5kIHRpbWUgbW9kdWxlcyBhbmQgd2lyZXMgdGhlbSBp
bnRvIHZpcmlkaWFuX1tkb21haW58dmNwdV1fW2luaXR8ZGVpbml0XSgpLgo+IE9ubHkgb25lIG9m
IHRoZSBob29rcyBpcyBjdXJyZW50bHkgbmVlZGVkICh0byB1bm1hcCB0aGUgJ1ZQIEFzc2lzdCcg
cGFnZSkKPiBidXQgc3Vic2VxdWVudCBwYXRjaGVzIHdpbGwgbWFrZSB1c2Ugb2YgdGhlIG90aGVy
cy4KPiAKPiBOT1RFOiBUbyBwZXJmb3JtIHRoZSB1bm1hcCBvZiB0aGUgVlAgQXNzaXN0IHBhZ2Us
Cj4gICAgICAgdmlyaWRpYW5fdW5tYXBfZ3Vlc3RfcGFnZSgpIGlzIG5vdyBkaXJlY3RseSBjYWxs
ZWQgaW4gdGhlIG5ldwo+ICAgICAgIHZpcmlkaWFuX3N5bmljX3ZjcHVfZGVpbml0KCkgZnVuY3Rp
b24gKHdoaWNoIGlzIHNhZmUgZXZlbiBpZgo+ICAgICAgIGlzX3ZpcmlkaWFuX3ZjcHUoKSBldmFs
dWF0ZXMgdG8gZmFsc2UpLiBUaGlzIHJlcGxhY2VzIHRoZSBzbGlnaHRseQo+ICAgICAgIGhhY2t5
IG1lY2hhbmlzbSBvZiBmYWtpbmcgYSB6ZXJvIHdyaXRlIHRvIHRoZQo+ICAgICAgIEhWX1g2NF9N
U1JfVlBfQVNTSVNUX1BBR0UgTVNSIGluIHZpcmlkaWFuX2NwdV9kZWluaXQoKS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
