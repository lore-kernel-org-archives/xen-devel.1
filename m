From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Tue, 13 Nov 2018 12:39:11 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811131237341.8259@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d186185e-bd34-0603-37e1-aa2d843c9b08@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+wyv=ny=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gMfSs-0003QJ-Rw
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 20:39:14 +0000
In-Reply-To: <d186185e-bd34-0603-37e1-aa2d843c9b08@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Xen Devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxMiBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIb3dldmVyLCB3
aGF0IGlzIHRoZSBpc3N1ZSB3aXRoIHNhdmluZyBhbGwgdGhlIHJlZ2lzdGVycyBoZXJlPwo+ID4g
PiAKPiA+IAo+ID4gV2UgbmVlZCB0byBzYXZlIGFyZ3VtZW50cyB0aGF0IGFyZSBwcm92aWRlZCBi
eSBhIGd1ZXN0IHdpdGggc3lzdGVtCj4gPiBzdXNwZW5kIFBTQ0kgY2FsbC4gVGhlc2UgYXJndW1l
bnRzIGFyZSB0aGUgZW50cnkgcG9pbnQgdGhhdCBuZWVkcyB0bwo+ID4gYmUgc2F2ZWQgaW4gcHJv
Z3JhbSBjb3VudGVyIGFuZCBjb250ZXh0IElEIHRoYXQgbmVlZHMgdG8gYmUgc2F2ZWQgaW4KPiA+
IHgwL3IwLiBXZSBkb24ndCBoYXZlIHRoZXNlIGFyZ3VtZW50cyBoZXJlLiBDb250ZXh0IHN3aXRj
aCBoYXBwZW5zCj4gPiBhZnRlciBwcm9jZXNzaW5nIHRoZSBzeXN0ZW0gc3VzcGVuZCBQU0NJIGNh
bGwsIHNvIGl0J3MgdG9vIGxhdGUuCj4gCj4gSXQgZG9lcyBub3QgZmVlbCByaWdodCB0byBtb2Rp
ZnkgY3R4dF9zd2l0Y2h7ZnJvbSx0b30gZm9yIHN1c3BlbmQvcmVzdW1lLiBJZgo+IHlvdSB3YW50
IHRvIHJlc2V0IHRoZSB2Q1BVIHN0YXRlIGJlZm9yZSBibG9ja2luZyB0aGUgdkNQVSwgdGhlbiB5
b3Ugc2hvdWxkCj4gaW5zdGVhZAoKWW91IG1pc3NlZCB0aGUgZW5kIG9mIHRoZSBzdWdnZXN0aW9u
IGhlcmUKCgo+IEFub3RoZXIgd2F5IHdvdWxkIGJlIHRvIHJlc2V0IHRoZSB2Q1BVIG9uY2UgeW91
IHJlY2VpdmUgdGhlIGludGVycnVwdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
