From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Slow HVM boot time, was "HVM boot time optimization"
Date: Thu, 8 Feb 2018 17:32:33 +0000
Message-ID: <20180208173233.6dejumgyqsz3ecjv@citrix.com>
References: <CABLtV0BqS_Y6oMt8TyCx55Nf9mB=-L7To+xY2on76p+1KDyXSQ@mail.gmail.com>
 <alpine.DEB.2.10.1802080826470.15787@sstabellini-ThinkPad-X260>
 <20180208164810.7h7equv4gfbjyzet@citrix.com>
 <20180208165600.GC1740@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rjog=fc=citrix.com=prvs=57087f223=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ejq3o-00062I-Rm
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 17:32:36 +0000
Content-Disposition: inline
In-Reply-To: <20180208165600.GC1740@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ian.jackson@eu.citrix.com, Yessine Daoud <da.yessine@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDgsIDIwMTggYXQgMDQ6NTY6MDBQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVGh1LCBGZWIgMDgsIDIwMTggYXQgMDQ6NDg6MTBQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9uIFRodSwgRmViIDA4LCAyMDE4IGF0IDA4OjMxOjQwQU0gLTA4MDAsIFN0
ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gQ0MnaW5nIHhlbi1kZXZlbCBhbmQgYSBmZXcg
cmVsZXZhbnQgcGVvcGxlCj4gPiA+IAo+ID4gPiBPbiBUaHUsIDggRmViIDIwMTgsIFllc3NpbmUg
RGFvdWQgd3JvdGU6Cj4gPiA+ID4gRGVhciBTaXIsCj4gPiA+ID4gSSBuZWVkIHlvdXIgaGVscCBw
bGVhc2UuCj4gPiA+ID4gCj4gPiA+ID4gSSBhbSB1c2luZyBhIGRpcmVjdCBrZXJuZWwgYm9vdCAo
SFZNIGd1ZXN0KSB3aXRoIGtlcm5lbCArIHJhbWRpc2suCj4gPiA+ID4gQXQgYm9vdCwgc2VhYmlv
cyBpcyBibG9xdWVkIGFib3V0IDIwIHNlY29uZHMgKG9yIG1vcmUpIGF0IHRoZSBmb2xsb3dpbmcg
c3RhdGU6Cj4gPiA+ID4gCj4gPiAKPiA+IFRoZSBtYW51YWwgc2VlbXMgYSBiaXQgY29uZnVzaW5n
IHRvIG1lIGJ1dCBtYXliZSBJIG1pc3JlbWVtYmVyIGhvdyBpdAo+ID4gd29ya3MuIE15IHVuZGVy
c3RhbmRpbmcgaXMgZGlyZWN0IGtlcm5lbCBib290IGp1bXBzIHN0cmFpZ2h0IHRvIGtlcm5lbAo+
ID4gZW50cnkgcG9pbnQgd2l0aG91dCBnb2luZyB0aHJvdWdoIGZpcm13YXJlLgo+ID4gCj4gPiBJ
ZiB0aGlzIGlzIGRpcmVjdCBrZXJuZWwgYm9vdCB3aHkgaXMgc2VhYmlvcyBpbnZvbHZlZD8KPiAK
PiBzZWFiaW9zIGlzIHRoZSBvbmUgdG8gbG9hZCB0aGUga2VybmVsIGludG8gbWVtb3J5IGFuZCBz
dGFydCBpdC4KPiAKCkkgc2VlLiBUaGFuayBmb3IgZXhwbGFpbmluZy4KCldlaS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
