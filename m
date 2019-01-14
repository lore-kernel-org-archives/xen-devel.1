From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/firmware: update OVMF Makefile
Date: Mon, 14 Jan 2019 11:28:57 +0000
Message-ID: <20190114112857.dxmlt7noy53asro5@zion.uk.xensource.com>
References: <20181128174333.15672-1-wei.liu2@citrix.com>
 <20190113201744.GA11328@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zeoe=PW=citrix.com=prvs=910b68455=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gj0QP-0003vO-MI
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 11:29:01 +0000
Content-Disposition: inline
In-Reply-To: <20190113201744.GA11328@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMTMsIDIwMTkgYXQgMDk6MTc6NDRQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBOb3YgMjgsIFdlaSBMaXUgd3JvdGU6Cj4gCj4gPiBPVk1GIGhhcyBiZWNv
bWUgZGVwZW5kZW50IG9uIE9wZW5TU0wsIHdoaWNoIGl0IGlzIGluY2x1ZGVkIGFzIGEgc3VibW9k
dWxlLgo+ID4gSW5pdGlhbGlzZSBzdWJtb2R1bGVzIGJlZm9yZSBidWlsZGluZy4KPiAKPiA+ICsr
KyBiL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUKPiA+ICBidWlsZDoKPiA+ICsJJChHSVQp
IHN1Ym1vZHVsZSB1cGRhdGUgLS1pbml0IC0tcmVjdXJzaXZlCj4gCj4gQXQgbGVhc3QgZWY1Mjll
NmFiN2MzMTI5MGEzMzA0NWJiMWYxODM3NDQ3Y2MwZWI1NiBzZWVtcyB0byBoYXZlIG5vCj4gc3Vi
bW9kdWxlcy4gQWxzbyB0aGUgcmVmZXJlbmNlZCBxZW11LXhlbi5naXQgaGFzIHN1Ym1vZHVsZXMs
IGJ1dAo+IGJ1aWxkaW5nIHhlbi5naXQgd29ya3MgZmluZSBpZiBub25lIG9mIHRoZSBkb3dubG9h
ZC1vbi1kZW1hbmQgZXh0cmEKPiBzb3VyY2VzIGFyZSBhY3R1YWxseSBnaXQgdHJlZXMuIEkgaGF2
ZSBub3QgY2hlY2tlZCBob3cgcWVtdS14ZW4uZ2l0Cj4gd291bGQgZ2V0IGl0cyBzdWJtb2R1bGVz
LCBidXQgdG9kYXkgdGhlcmUgaXMgbW9zdCBsaWtlbHkgbm8KPiAiJChHSVQpIHN1Ym1vZHVsZSIg
Y2FsbCBpbiB0aGUgImJ1aWxkIiBtYWtlIHRhcmdldC4KClFFTVUncyBNYWtlZmlsZSBjYWxscyBh
IHNjcmlwdCB3aGljaCBjYWxscyBnaXQgc3VibW9kdWxlIGNvbW1hbmRzLgoKQ2FsbGluZyBgZ2l0
IHN1Ym1vZHVsZSB1cGRhdGVgIGluIGEgZ2l0IHJlcG8gd2l0aG91dCBzdWJtb2R1bGVzIGlzIGEK
bm9wLgoKPiAKPiBJIHRoaW5rIHRvIGZpeCB0aGUgYnVpbGQgYnJlYWthZ2UgaW50cm9kdWNlZCBi
eSBiMTYyODE4NzAgdGhpcyBjYWxsIG11c3QKPiBiZSBtb3ZlZCBzb21ld2hlcmUgZWxzZS4KCkNh
biB5b3UgdGVsbCBtZSB3aGF0IGJ1aWxkIGJyZWFrYWdlIGFyZSB5b3UgcmVmZXJyaW5nIHRvPyBU
aGUgbGF0ZXN0Cm9zc3Rlc3QgZmxpZ2h0ICgxMzE5MjcpIGRpZG4ndCBzaG93IGFueSBicmVha2Fn
ZSBpbiBidWlsZGluZy4KCkFyZSB5b3Ugc2F5aW5nIHRoYXQgdGhlIGJyZWFrYWdlIGlzIHNob3du
IHdoZW4geW91IHB1dCBhIHNuYXBzaG90IG9mCm92bWYgdW5kZXIgeGVuLmdpdD8gSG93IGRvZXMg
b3ZtZiBkaXN0cmlidXRlIHRoZWlyIHNuYXBzaG90PyBIb3cgaXMgdGhhdApnZW5lcmF0ZWQ/IERv
ZXMgaXQgY29udGFpbiBzbmFwc2hvdHMgb2Ygc3VibW9kdWxlcyBpdCBuZWVkcyBhbHJlYWR5PwoK
V2VpLgoKPiAKPiBPbGFmCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
