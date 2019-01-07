From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 2/2] xen: use SYMBOL when required
Date: Mon, 7 Jan 2019 10:29:59 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901071023280.800@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1811121500550.8259@sstabellini-ThinkPad-X260>
 <1542063977-24906-2-git-send-email-sstabellini@kernel.org>
 <5BEAC9F402000078001FB74F@prv1-mh.provo.novell.com>
 <63844310-6f92-8ee8-e40d-8029c8ff4d72@arm.com>
 <5BEAD13A02000078001FB7AC@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1811131355390.8259@sstabellini-ThinkPad-X260>
 <5BEBD25B02000078001FBCA4@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901021006200.800@sstabellini-ThinkPad-X260>
 <5C2F1DC9020000780020A1D8@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901040853520.800@sstabellini-ThinkPad-X260>
 <5C33022D020000780020A9D1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ggZez-0004qC-Mi
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 18:30:01 +0000
In-Reply-To: <5C33022D020000780020A9D1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA3IEphbiAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDQuMDEuMTkg
YXQgMTg6MDUsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IEkgcmVhbGl6ZSB0
aGF0IHlvdSBhcmUgbm90IGNvbnZpbmNlZCBieSB0aGVzZSBhcmd1bWVudHMsIGJ1dCBsZXQncyBm
aW5kCj4gPiBhIHdheSBmb3J3YXJkLiBNeSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIGhhdmUgU1lN
Qk9MIHJldHVybmluZyB1bnNpZ25lZAo+ID4gbG9uZyBhbmQgZG8gdW5zaWduZWQgbG9uZyBjb21w
YXJpc29ucyB3aGVuIHBvaW50ZXJzIHBvaW50aW5nIHRvCj4gPiBkaWZmZXJlbnQgb2JqZWN0cyBh
cmUgaW52b2x2ZWQuCj4gCj4gSSBjb250aW51ZSB0byBmYWlsIHRvIHNlZSBob3cgc3VpdGFibGUg
aGlkaW5nIG9mIHRoZSBjb25uZWN0aW9uIHRvIHRoZQo+IG9yaWdpbmFsIHN5bWJvbCBmcm9tIHRo
ZSBjb21waWxlciBtYWtlcyBjb2RlIGxlc3Mgc3RhbmRhcmQgY29tcGxpYW50Cj4gd2hlbiBjb21w
YXJpbmcgcG9pbnRlcnM6IFRoZSBjb21waWxlciBzaW1wbHkgY2FuJ3Qga25vdyB3aGV0aGVyCj4g
dGhlIHVuZGVybHlpbmcgb2JqZWN0IGlzIChpbiB0aGUgZXh0cmVtZSBjYXNlKSBhbiBhcnJheSBz
cGFubmluZyB0aGUKPiBlbnRpcmUgYWRkcmVzcyBzcGFjZS4KClRoYXQgaXMgYmVjYXVzZSB0aGUg
cmVxdWlyZW1lbnQgSSBhbSB0cnlpbmcgdG8gYWRkcmVzcyBpcyBNSVNSQS1DCmNvbXBsaWFuY2Us
IHdoaWNoIGluIHR1cm5zIHJlcXVpcmVzIEMgbGFuZ3VhZ2UgY29tcGxpYW5jZSBmb3IgQyBsYW5n
dWFnZQooSSB0aGluayBpdCBhbGxvd3MgbWl4aW5nIEMgd2l0aCBhc3NlbWJseSBjb2RlKS4gSSBk
b24ndCBwYXJ0aWN1bGFybHkKY2FyZSB3aGV0aGVyIHRoZSBjb21waWxlciBjYW4gb3IgY2Fubm90
IGZpbmQgdGhlIGNvbm5lY3Rpb24gdG8gdGhlCm9yaWdpbmFsIHN5bWJvbC4gCgpUaGUgaW1wb3J0
YW50IHRoaW5nIGZvciBtZSBpcyB0byBhdm9pZCBjb21wYXJpc29ucyAoYW5kIHN1YnRyYWN0aW9u
cykKYmV0d2VlbiBwb2ludGVycyBwb2ludGluZyB0byBkaWZmZXJlbnQgb2JqZWN0cy4gSWYgd2Ug
Y29tcGFyZSB1bnNpZ25lZApsb25ncywgaXQgaXMgZWFzaWVyIHRvIHByb3ZlIHRoYXQgdGhlIGNv
bXBhcmlzb24gaXMgbm90IGJldHdlZW4gcG9pbnRlcnMKcG9pbnRpbmcgdG8gZGlmZmVyZW50IG9i
amVjdHMsIGV2ZW4gaWYgc29tZWhvdyB0aGUgbnVtZXJpYyB2YWx1ZXMKaW5kaXJlY3RseSBjb21l
IGZyb20gcG9pbnRlcnMuIElmIHdlIGNvbXBhcmUgcG9pbnRlcnMsIGV2ZW4gaWYgdGhleSB3ZW50
CnRocm91Z2ggc29tZSBzb3J0IG9mIGFzc2VtYmx5IGNvbnZlcnNpb25zLCB3ZSBhcmUgc3RpbGwg
Y29tcGFyaW5nCnBvaW50ZXJzIHBvaW50aW5nIHRvIGRpZmZlcmVudCBvYmplY3RzLiBUaGUgY29t
cGlsZXIgbWlnaHQgbm90IGJlIGFibGUKdG8gZmlndXJlIGl0IG91dCwgYnV0IGEgTUlTUkEtQyBj
b21wbGlhbmNlIHNjYW5uaW5nIHRvb2wsIG9yIGEgaHVtYW4sCm1pZ2h0LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
