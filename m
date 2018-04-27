From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: reboot driver domain, vifX.Y = NO-CARRIER?
Date: Fri, 27 Apr 2018 17:56:48 +0100
Message-ID: <20180427165648.2vwlcdmw6dycirqx@citrix.com>
References: <20180427150346.GA17249@io.lakedaemon.net>
 <1735e92a-7a38-a08d-2b5b-1481409b3dbd@citrix.com>
 <20180427153526.GB17249@io.lakedaemon.net>
 <d8a69ce8-f4ab-63a1-70d8-dc0ad73ef192@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2nbx=hq=citrix.com=prvs=648b7b80e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fC6g0-0006K4-Px
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 16:56:52 +0000
Content-Disposition: inline
In-Reply-To: <d8a69ce8-f4ab-63a1-70d8-dc0ad73ef192@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jason Cooper <xen@lakedaemon.net>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjcsIDIwMTggYXQgMDQ6NTI6NTdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNy8wNC8xOCAxNjozNSwgSmFzb24gQ29vcGVyIHdyb3RlOgo+ID4gSGkgQW5k
cmV3LAo+ID4KPiA+IE9uIEZyaSwgQXByIDI3LCAyMDE4IGF0IDA0OjExOjM5UE0gKzAxMDAsIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4gT24gMjcvMDQvMTggMTY6MDMsIEphc29uIENvb3BlciB3
cm90ZToKPiA+Pj4gVGhlIHByb2JsZW0gb2NjdXJzIHdoZW4gSSByZWJvb3QgYSBkcml2ZXIgZG9t
YWluLiAgUmVnYXJkbGVzcyBvZiB0aGUKPiA+Pj4gdHlwZSBvZiBndWVzdCBhdHRhY2hlZCB0byBp
dCwgSSdtIHVuYWJsZSB0byByZS1lc3RhYmxpc2ggY29ubmVjdGl2aXR5Cj4gPj4+IGJldHdlZW4g
dGhlIGRyaXZlciBkb21haW4gYW5kIHRoZSByZS1hdHRhY2hlZCBndWVzdC4gIGUuZy4gSSByZWJv
b3QKPiA+Pj4gR1cvRlcsIHRoZW4gcmUtYXR0YWNoIFZNMSwgVk0yIGFuZCB0aGUgcmVzdC4gIE5v
IG1hdHRlciBob3cgSSBkbyBpdCwgSQo+ID4+PiBnZXQ6Cj4gPj4+Cj4gPj4+ICQgaXAgbGluawo+
ID4+PiAuLi4KPiA+Pj4gMTE6IHZpZjIwLjE6IDxOTy1DQVJSSUVSLEJST0FEQ0FTVCxNVUxUSUNB
U1QsVVA+IG10dSAxNTAwIHFkaXNjIG1xIG1hc3RlciBicjEwIHFsZW4gMzIKPiA+Pj4gICAgIGxp
bmsvZXRoZXIgZmU6ZmY6ZmY6ZmY6ZmY6ZmYgYnJkIGZmOmZmOmZmOmZmOmZmOmZmCj4gPj4+Cj4g
Pj4+IEluIHRoZSBkcml2ZXIgZG9tYWluLiAgQXQgdGhpcyBwb2ludCwgYWJzb2x1dGVseSBubyBw
YWNrZXRzIGZsb3cgYmV0d2Vlbgo+ID4+PiB0aGUgdHdvIFZNcy4gIE5vdCBldmVuIEFSUC4gIFRo
ZSBvbmx5IHNvbHV0aW9uLCBzbyBmYXIsIGlzIHRvIHVubmVjZXNzYXJpbHkKPiA+Pj4gcmVib290
IHRoZSBQViBndWVzdHMuICBBZnRlciB0aGF0LCBuZXR3b3JraW5nIGlzIGZpbmUuCj4gPj4+Cj4g
Pj4+IEFueSB0aG91Z2h0cz8KPiA+PiBUaGUgdW5kZXJseWluZyBwcm9ibGVtIGlzIHRoYXQgdGhl
IGZyb250ZW5kL2JhY2tlbmQgc2V0dXAgaW4geGVuc3RvcmUKPiA+PiBlbmNvZGVzIHRoZSBkb21p
ZCBpbiBwYXRoLCBhbmQgY2hhbmdpbmcgdGhhdCBpc24ndCB0cmFuc3BhcmVudCB0byB0aGUKPiA+
PiBndWVzdCBhdCBhbGwuCj4gPiBPaCBqb3kuICBXb3VsZCBzZWVtIHRvIG1ha2UgbW9yZSBzZW5k
IHRvIHVzZSB0aGUgZG9tYWluIG5hbWUgb3IgdGhlCj4gPiB1dWlkLi4uCj4gCj4gZG9taWRzIGFy
ZSBhbHNvIHVzZWQgaW4gdGhlIGdyYW50IGFuZCBldmVudCBoeXBlcmNhbGwgaW50ZXJmYWNlcyB3
aXRoIFhlbi4KCklmIHRoZSBmcm9udGVuZCBtYW5hZ2VzIHRvIGdvIHRocm91Z2ggZGlzY29ubmVj
dC9yZWNvbm5lY3QgY3ljbGUsIGdyYW50CnRhYmxlIGFuZCBldmVudCBjaGFubmVsIGFyZW4ndCBn
b2luZyB0byBiZSBhIHByb2JsZW0/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
