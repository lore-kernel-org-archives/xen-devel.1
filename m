From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v5 4/9] spec: add l1tf-barrier
Date: Wed, 06 Feb 2019 06:20:48 -0700
Message-ID: <5C5ADF3002000078002144B3@prv1-mh.provo.novell.com>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-5-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101A7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C5323BC0200007800212E15@prv1-mh.provo.novell.com>
 <2547eea0-2b97-6e28-4bfd-249e7246a35d@amazon.de>
 <5C59A12A0200007800213FC7@prv1-mh.provo.novell.com>
 <3e215b9d-1265-4952-c3c4-0c8d8212426f@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grN8K-0001CK-SP
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 13:20:56 +0000
In-Reply-To: <3e215b9d-1265-4952-c3c4-0c8d8212426f@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAyLjE5IGF0IDE0OjAyLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAyLzUvMTkgMTU6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNS4wMi4xOSBhdCAx
NToyMywgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+PiBPbiAxLzMxLzE5IDE3OjM1LCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyOS4wMS4xOSBhdCAxNTo0MywgPG5tYW50aGV5
QGFtYXpvbi5kZT4gd3JvdGU6Cj4+Pj4+ICsgICAgLyoKPj4+Pj4gICAgICAgKiBXZSBkbyBub3Qg
ZGlzYWJsZSBIVCBieSBkZWZhdWx0IG9uIGFmZmVjdGVkIGhhcmR3YXJlLgo+Pj4+PiAgICAgICAq
Cj4+Pj4+ICAgICAgICogRmlyc3RseSwgaWYgdGhlIHVzZXIgaW50ZW5kcyB0byB1c2UgZXhjbHVz
aXZlbHkgUFYsIG9yIEhWTSBzaGFkb3cKPj4+PiBGdXJ0aGVybW9yZSwgYXMgcGVyIHRoZSBjb21t
ZW50IGFuZCBsb2dpYyBoZXJlIGFuZCBiZWxvdyBhCj4+Pj4gIUhWTSBjb25maWd1cmF0aW9uIG91
Z2h0IHRvIGJlIHNhZmUgdG9vLCB1bmxlc3MgInB2LWwxdGY9IiB3YXMKPj4+PiB1c2VkIChpbiB3
aGljaCBjYXNlIHdlIGRlZmVyIHRvIHRoZSBhZG1pbiBhbnl3YXkpLCBzbyBpdCdzCj4+Pj4gcXVl
c3Rpb25hYmxlIHdoZXRoZXIgdGhlIHdob2xlIGxvZ2ljIHNob3VsZCBiZSB0aGVyZSBpbiB0aGUK
Pj4+PiBmaXJzdCBwbGFjZSBpbiB0aGlzIGNhc2UuIFRoaXMgd291bGQgdGhlbiBpbiBwYXJ0aWN1
bGFyIGtlZXAgYWxsCj4+Pj4gb2YgdGhpcyBvdXQgZm9yIHRoZSBQViBzaGltLgo+Pj4gRm9yIHRo
ZSBQViBzaGltLCBJIGNvdWxkIGFkZCBwdi1zaGltIHRvIG15IGNoZWNrIGJlZm9yZSBlbmFibGlu
ZyB0aGUgQ1BVCj4+PiBmbGFnLgo+PiBCdXQgdGhlIFBWIHNoaW0gaXMganVzdCBhIHNwZWNpYWwg
Y2FzZS4gSSdkIGxpa2UgdGhpcyBjb2RlIHRvIGJlCj4+IGNvbXBpbGVkIG91dCBmb3IgYWxsICFI
Vk0gY29uZmlndXJhdGlvbnMuCj4gCj4gVGhlIHRoYXQgaW50cm9kdWNlcyB0aGUgZXZhbHVhdGVf
bm9zcGVjIG1hY3JvIGRvZXMgdGhhdCBhbHJlYWR5LiBCYXNlZAo+IG9uIGRlZmluZWQoQ09ORklH
X0hWTSkgbGZlbmNlIHBhdGNoaW5nIGlzIGRpc2FibGVkIHRoZXJlLgoKT2gsIHJpZ2h0LgoKPiBE
byB5b3Ugd2FudCBtZSB0byB3cmFwIHRoaXMgY29tbWFuZCBsaW5lIG9wdGlvbiBpbnRvIENPTkZJ
R19IVk0gY2hlY2tzCj4gYXMgd2VsbD8KClRoYXQgd291bGQgYmUgbmljZTsgSSBoYXZlIGEgcGF0
Y2ggZm9yIHBvc3QtNC4xMiB3aGVyZSBJIGRvCnNvbWV0aGluZyBzaW1pbGFyIHRvIG9wdF94cHRp
XyouIFRoZXJlZm9yZSBpZiB5b3UgZGlkbid0IGRvIGl0CmhlcmUsIEknZCBwcm9iYWJseSBzdWJt
aXQgYSBmaXh1cCBwYXRjaCBkb3duIHRoZSByb2FkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
