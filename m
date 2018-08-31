From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Fix inconsistent callers of panic()
Date: Fri, 31 Aug 2018 01:21:45 -0600
Message-ID: <5B88EC8902000078001E3C1B@prv1-mh.provo.novell.com>
References: <1535632297-29549-1-git-send-email-andrew.cooper3@citrix.com>
 <5B87FA3102000078001E38B7@prv1-mh.provo.novell.com>
 <e5ad89df-4408-259b-7a34-1c242c3fb931@citrix.com>
 <5B88E15002000078001E3BBD@prv1-mh.provo.novell.com>
 <7e1164f8-68af-a08b-ff54-4d077562a2ce@suse.com>
 <5B88E88102000078001E3BEF@prv1-mh.provo.novell.com>
 <143997da-04af-6384-3866-b49c403410e9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <143997da-04af-6384-3866-b49c403410e9@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA4LjE4IGF0IDA5OjEyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAz
MS8wOC8xOCAwOTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMxLjA4LjE4IGF0IDA4
OjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDMxLzA4LzE4IDA4OjMzLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAzMC4wOC4xOCBhdCAxOTowOCwgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+PiBPbiAzMC8wOC8xOCAxNTowNywgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAzMC4wOC4xOCBhdCAxNDozMSwgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+Pj4+IFRoZSBvYnNlcnZhbnQgYW1vbmdzdCB5b3UgbWln
aHQgcmVhbGlzZSB0aGF0IHRoaXMgcmV2ZXJ0cyBwYXJ0cyBvZiBjL3MKPj4+Pj4+PiA1MWFkOTBh
ZWEyMWMgLSBXaGF0IGNhbiBJIHNheT8gIFNldmVyYWwgeWVhcnMgb2YgaGluZHNpZ2h0IGlzIHZl
cnkgdXNlZnVsLCAKPiBhbmQKPj4+Pj4+PiBhdCB0aGUgdGltZSBJIGRpZCBhc2sgdGhlIG1haW50
YWluZXJzIHdoaWNoIG9wdGlvbiB0aGV5IHRob3VnaHQgd291bGQgYmUKPj4+Pj4+PiBiZXR0ZXIu
Li4KPj4+Pj4+IC4uLiBJIHRoaW5rIGJvdGggdGhlIGVhcmxpZXIgYW5kIHRoaXMgY2hhbmdlIGFy
ZSBoZWFkaW5nIGluIHRoZQo+Pj4+Pj4gd3JvbmcgZGlyZWN0aW9uOiBJIHdvdWxkIG11Y2ggcmF0
aGVyIHNlZSB0aGUgbmV3bGluZSBvbWl0dGVkCj4+Pj4+PiBldmVyeXdoZXJlLCBfaW5jbHVkaW5n
XyBpbiBwYW5pYygpIGl0c2VsZjogVGhpcyBjYXVzZXMgb25lIGxpbmUKPj4+Pj4+IGxlc3MgdG8g
c2Nyb2xsIG9mZiB0aGUgc2NyZWVuIGluIGNhc2UgeW91IGRvbid0IGhhdmUgYSBzZXJpYWwKPj4+
Pj4+IGNvbnNvbGUuCj4+Pgo+Pj4gQ2FuJ3Qgd2UganVzdCBkcm9wIHByaW50aW5nIHRoZSBleHRy
YSBcbiBpbiBwYW5pYygpPwo+Pj4KPj4+IC0gICAgcHJpbnRrKCIlc1xuIiwgYnVmKTsKPj4+ICsg
ICAgcHJpbnRrKCIlcyIsIGJ1Zik7Cj4+IAo+PiBUaGF0J3Mgd2hhdCBJJ20gc3VnZ2VzdGluZywg
eWVzLCBwbHVzIChpZiB0aGVyZSBhcmUgYW55KSBkcm9wcGluZwo+PiB0cmFpbGluZyBuZXdsaW5l
cyBpbiBwYW5pYygpIGludm9jYXRpb25zLgo+IAo+IFV1aCwgYm90aD8KPiAKPiBUaGlzIHdvdWxk
IGxvb2sgbGlrZToKPiAKPiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IFBB
TklDIG9uIGNwdSAyOgo+IGJsYWxibGFibGEqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCgpIbW0sIHRoZSB0cmFpbGluZyAqKioqIHdvdWxkIHBlcmhhcHMgYmV0dGVyIGFsc28gYmUg
ZHJvcHBlZC4gQXMgcGVyCm15IG9yaWdpbmFsIHJlcGx5IHRvIEFuZHJldywgdGhlIGdvYWwgc2hv
dWxkIGltbyBiZSB0byBoYXZlIGFzIGxpdHRsZQp1c2VsZXNzIG91dHB1dCBhcyBwb3NzaWJsZSAo
YnV0IGFzIG11Y2ggYXMgbmVjZXNzYXJ5L2hlbHBmdWwsIGkuZS4gSSdtCm5vdCBzdWdnZXN0aW5n
IHRvIGRyb3AgdGhlIGZpcnN0IGxpbmUgb2Ygc3RhcnMpLCB0byBhdm9pZCBtZWFuaW5nZnVsCmxp
bmVzIHNjcm9sbGluZyBvZmYuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
