From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v11 8/9] xen: use DECLARE_BOUNDS in
 alternative.c
Date: Wed, 6 Mar 2019 13:38:43 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1903061338270.17248@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-8-git-send-email-sstabellini@kernel.org>
 <5C7FF6E0020000780021C361@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+lMa=RJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1h1eFR-0007tA-L6
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 21:38:45 +0000
In-Reply-To: <5C7FF6E0020000780021C361@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, ian.jackson@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCA2IE1hciAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDUuMDMuMTkg
YXQgMjM6MzgsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IEBAIC0xOTMsOCAr
MTkxLDEwIEBAIHZvaWQgaW5pdF9vcl9saXZlcGF0Y2ggYXBwbHlfYWx0ZXJuYXRpdmVzKHN0cnVj
dCBhbHRfaW5zdHIgKnN0YXJ0LAo+IAo+IFNlZWluZyB0aGlzIHJlbGV2YW50IHBhcnQgb2YgdGhl
IGZ1bmN0aW9uIHBhcmFtZXRlcnMsIC4uLgo+IAo+ID4gICAgICAgKgo+ID4gICAgICAgKiBTbyBi
ZSBjYXJlZnVsIGlmIHlvdSB3YW50IHRvIGNoYW5nZSB0aGUgc2NhbiBvcmRlciB0byBhbnkgb3Ro
ZXIKPiA+ICAgICAgICogb3JkZXIuCj4gPiArICAgICAqCj4gPiArICAgICAqIHN0YXJ0IGFuZCBl
bmQgY291bGQgYmUgcG9pbnRlcnMgdG8gZGlmZmVyZW50IG9iamVjdHMuCj4gPiAgICAgICAqLwo+
ID4gLSAgICBmb3IgKCBhID0gYmFzZSA9IHN0YXJ0OyBhIDwgZW5kOyBhKysgKQo+ID4gKyAgICBm
b3IgKCBhID0gYmFzZSA9IChzdHJ1Y3QgYWx0X2luc3RyICopc3RhcnQ7IGFsdF9pbnN0cl9sdChh
LCBlbmQpOyBhKysgKQo+IAo+IC4uLiB3aHkgdGhlIGNhc3Q/CgpUbyByZW1vdmUgY29uc3QgKHNl
ZSB0aGUgb3RoZXIgZW1haWwgYWJvdXQgdGhlIHByb2JsZW1hdGljIHNpdGVzKS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
