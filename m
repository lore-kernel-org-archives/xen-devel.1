From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC v2 6/9] libxl: Have QEMU save its state to a
 file descriptor
Date: Tue, 24 Apr 2018 10:37:46 +0100
Message-ID: <20180424093746.5e4mj6fm4kxmlhfs@citrix.com>
References: <20180416173227.22671-1-anthony.perard@citrix.com>
 <20180416173227.22671-7-anthony.perard@citrix.com>
 <20180423092042.7hv5inelfoc6u3bi@citrix.com> <20180423154528.GE1980@perard>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y+rf=hn=citrix.com=prvs=645aa2f63=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fAuOU-0005ht-Gi
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 09:37:50 +0000
Content-Disposition: inline
In-Reply-To: <20180423154528.GE1980@perard>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMjMsIDIwMTggYXQgMDQ6NDU6MjhQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBBcHIgMjMsIDIwMTggYXQgMTA6MjA6NDJBTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9uIE1vbiwgQXByIDE2LCAyMDE4IGF0IDA2OjMyOjI0UE0gKzAxMDAsIEFu
dGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBJbiBjYXNlIFFFTVUgaGF2ZSByZXN0cmljdGVkIGFj
Y2VzcyB0byB0aGUgc3lzdGVtLCBvcGVuIHRoZSBmaWxlIGZvciBpdCwKPiA+ID4gYW5kIFFFTVUg
d2lsbCBzYXZlIGl0cyBzdGF0ZSB0byB0aGlzIGZpbGUgZGVzY3JpdG9yLgo+ID4gPiAKPiA+ID4g
U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Cj4gPiAKPiA+IEkgdGhpbmsgdGhpcyBpcyBnb2luZyB0byBicmVhayBGcmVlQlNEPwo+IAo+IElm
IHRoZSBwcmV2aW91cyBwYXRjaCB3b3JrcyBvbiBGcmVlQlNEIChMZWFybmVkIHRvIHNlbmQgRkQg
dGhyb3VnaCBRTVAKPiB0byBRRU1VKSwgdGhpcyBwYXRjaCBzaG91bGRuJ3QgYnJlYWsgYW55dGhp
bmcuIExvb2tpbmcgYXQgaG93Cj4gbGlieGxfX3NlbmRtc2dfZmRzKCkgaXMgaW1wbGVtZW50ZWQs
IGFuZCBob3cgdGhlIHJlY2VpdmUgc2lkZSBpcwo+IGltcGxlbWVudGVkIGluIFFFTVUsIHRoZXJl
IGRvZXNuJ3Qgc2VlbXMgdG8gYmUgYW55IGRpZmZlcmVuY2Ugb24KPiBGcmVlQlNELCBzbyBJIGd1
ZXNzIGl0J3MgZ29pbmcgdG8gd29yayBmaW5lLgo+IAo+ID4gQW5kIHdoYXQgaXMgL2Rldi9mZHNl
dCBleGFjdGx5PyBJIGRvbid0IHNlZW0gdG8gaGF2ZSBpdCBvbiBteSBEZWJpYW4KPiA+IHdvcmtz
dGF0aW9uICh3aXRoIExpbnV4IDQuMTUpLiBTbyB0aGlzIGNoYW5nZSBjYW4gcG90ZW50aWFsbHkg
YmUgYnJva2VuCj4gPiBvbiBMaW51eCBhcyB3ZWxsPwo+IAo+IC9kZXYvZmRzZXQgaXMgYSBRRU1V
IGludGVybmFsIEFQSS4gWW91IGNhbiBhZGQgYSBmaWxlIGRlc2NyaXB0b3IgdG8gYQo+IGZkLXNl
dCB2aWEgUU1QIG9yIHZpYSB0aGUgY29tbWFuZCBsaW5lLiBBbmQgbGF0ZXIsIHlvdSBjYW4gZ2l2
ZSBhIHBhdGgKPiB0byBzb21ldGhpbmcgaW4gUUVNVSAobWF5YmUgYSBibG9jayBkcml2ZXIpIHdo
aWNoIHJlZmVyIHRvIGEgZmQtc2V0Cj4gY3JlYXRlZCBlYXJsaWVyLiBUaGUgcGF0aCB3b3VsZCBi
ZSAiL2Rldi9mZHNldC8kZmRzZXRfbnVtYmVyIi4gVGhlcmUgY2FuCj4gYmUgc2V2ZXJhbCBmZCBp
biBhIGZkLXNldCwgcWVtdSB3aWxsIGp1c3QgbG9vayBmb3IgdGhlIGZpcnN0IG9uZSB3aGljaAo+
IGhhdmUgdGhlIHJpZ2h0IHBlcm1pc3Npb24sIGxpa2UgcmVhZCBvciB3cml0ZSBwZXJtaXNzaW9u
LgoKT2gsIEkgd2FzIHRoaW5raW5nIC9kZXYvZmRzZXQgd2FzIHNvbWUgc29ydCBvZiBMaW51eCBz
cGVjaWZpYyB0aGluZy4gSXQKaXMgaW50ZXJlc3RpbmcgdGhhdCBRRU1VIGFjdHVhbGx5IGNyZWF0
ZXMgL2Rldi9mZHNldC4gVGhhdCBtZWFucyBpdApzaG91bGQgd29yayBmaW5lIChhdCBsZWFzdCBp
biB0aGVvcnkpIGZvciBib3RoIEZyZWVCU0QgYW5kIExpbnV4LgoKV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
