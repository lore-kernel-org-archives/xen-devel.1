From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/4] amd-iommu: add flush iommu_ops
Date: Wed, 05 Dec 2018 06:13:27 -0700
Message-ID: <5C07CEF702000078002031F1@prv1-mh.provo.novell.com>
References: <20181205112924.36470-1-paul.durrant@citrix.com>
 <20181205112924.36470-2-paul.durrant@citrix.com>
 <5C07BA8A0200007800203169@prv1-mh.provo.novell.com>
 <06f4edfeb8824993bc0cc59e56eebc12@AMSPEX02CL03.citrite.net>
 <f9c9a57e24794d2da1fd4ca58087279f@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=winm=oo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUWzd-0004ji-Hz
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 13:13:33 +0000
In-Reply-To: <f9c9a57e24794d2da1fd4ca58087279f@AMSPEX02CL03.citrite.net>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEyLjE4IGF0IDEzOjU4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBQYXVsIER1cnJhbnQKPj4gU2VudDogMDUgRGVjZW1iZXIgMjAxOCAxMjo1Nwo+
PiAKPj4gPiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiA+
IFNlbnQ6IDA1IERlY2VtYmVyIDIwMTggMTE6NDYKPj4gPgo+PiA+ID4+PiBPbiAwNS4xMi4xOCBh
dCAxMjoyOSwgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4gPiA+IC0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYwo+PiA+ID4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jCj4+ID4gPiBAQCAtNjM0LDYgKzYzNCw1
NiBAQCBpbnQgYW1kX2lvbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QKPj4g
PiBkZm4pCj4+ID4gPiAgICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwo+
PiA+ID4KPj4gPiA+ICAgICAgYW1kX2lvbW11X2ZsdXNoX3BhZ2VzKGQsIGRmbl94KGRmbiksIDAp
Owo+PiA+ID4gKyAgICByZXR1cm4gMDsKPj4gPiA+ICt9Cj4+ID4gPiArCj4+ID4gPiArc3RhdGlj
IHVuc2lnbmVkIGxvbmcgZmx1c2hfY291bnQodW5zaWduZWQgbG9uZyBkZm4sIHVuc2lnbmVkIGlu
dAo+PiA+IHBhZ2VfY291bnQsCj4+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IG9yZGVyKQo+PiA+ID4gK3sKPj4gPiA+ICsgICAgdW5zaWduZWQgbG9u
ZyBzdGFydCA9IGRmbiA+PiBvcmRlcjsKPj4gPiA+ICsgICAgdW5zaWduZWQgbG9uZyBlbmQgPSAo
ZGZuICsgcGFnZV9jb3VudCAtIDEpID4+IDE7Cj4+ID4KPj4gPiBHcmFudGVkIGluIG15IGVhcmxp
ZXIgcmVwbHkgSSBoYWQgYSBtaXNzaW5nIG9wZW5pbmcgcGFyZW50aGVzaXMsCj4+ID4gYnV0IHRo
ZSBhYm92ZSBpcyBwcmV0dHkgY2xlYXJseSB0aGUgd3Jvbmcgd2F5IG9mIGFkZHJlc3NpbmcKPj4g
PiB0aGUgcmVzdWx0aW5nIGJ1aWxkIGVycm9yLgo+PiAKPj4gU29ycnksIHRoYXQncyB3YXkgdG9v
IGNyeXB0aWMuIFdoYXQgYnVpbGQgZXJyb3I/Cj4gCj4gSSBhZ3JlZSB0aGVyZSBpcyBhIHR5cG8g
dGhlcmUsIGluIHRoYXQgdGhlICc+PiAxJyBzaG91bGQgYmUgJz4+IG9yZGVyJy4uLiBJcyAKPiB0
aGF0IHdoYXQgeW91J3JlIGdldHRpbmcgYXQ/CgpJbiB0aGUgcmVwbHkgdG8gdjIgSSBkaWQgc3Vn
Z2VzdAoKICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQgPSBkZm4gPj4gb3JkZXI7CiAgICB1bnNpZ25l
ZCBsb25nIGVuZCA9IChkZm4gKyBwYWdlX2NvdW50IC0gMSkgPj4gb3JkZXIpICsgMTsKCndoaWNo
IG9mIGNvdXJzZSBuZWVkcyB0byBiZQoKICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQgPSBkZm4gPj4g
b3JkZXI7CiAgICB1bnNpZ25lZCBsb25nIGVuZCA9ICgoZGZuICsgcGFnZV9jb3VudCAtIDEpID4+
IG9yZGVyKSArIDE7Cgp3aGVyZWFzIEkgd2FzIGd1ZXNzaW5nIHRoYXQgeW91IG1pZ2h0IGhhdmUg
bm90aWNlZCB0aGUgYnVpbGQKZXJyb3Igd2l0aCB0aGUgb3JpZ2luYWwgc3VnZ2VzdGlvbiwgYnV0
IHRoZW4gd3JvbmdseSBkcm9wcGVkIHRoZQoib3JkZXIpICsgIiBwYXJ0LgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
