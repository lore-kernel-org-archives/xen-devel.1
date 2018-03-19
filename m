From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 09/11] vpci/msi: add MSI handlers
Date: Mon, 19 Mar 2018 02:06:24 -0600
Message-ID: <5AAF7D9002000078001B3420@prv-mh.provo.novell.com>
References: <20180316133008.66443-1-roger.pau@citrix.com>
 <20180316133008.66443-10-roger.pau@citrix.com>
 <5AABDD1702000078001B2D77@prv-mh.provo.novell.com>
 <20180316143412.lkqyavr2vepsdktc@MacBook-Pro-de-Roger.local>
 <5AABEB5802000078001B2E24@prv-mh.provo.novell.com>
 <20180316153802.sgvxp37z532nuutt@MacBook-Pro-de-Roger.local>
 <5AABFDB402000078001B2E97@prv-mh.provo.novell.com>
 <20180316175121.saue4oceqljk5rn6@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=eu9s=gj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1expoM-0000xK-T1
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 08:06:30 +0000
In-Reply-To: <20180316175121.saue4oceqljk5rn6@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDE4OjUxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTWFyIDE2LCAyMDE4IGF0IDEwOjI0OjA0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTYuMDMuMTggYXQgMTY6MzgsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gRnJpLCBNYXIgMTYsIDIwMTggYXQgMDk6MDU6NDRBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxNi4wMy4xOCBhdCAxNTozNCwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiB2cGNpX3JlbW92ZV9kZXZpY2UgaXMgbmV2ZXIg
Y2FsbGVkIGZyb20gdGhlIHVzZXItc3BhY2UgdGVzdCBoYXJuZXNzLAo+PiA+PiA+IHNvIGl0IGp1
c3QgbmVlZHMgdG8gYnVpbGQsIGJ1dCBub3QgbmVjZXNzYXJpbHkgYmUgY29ycmVjdCBpbiB0aGF0
Cj4+ID4+ID4gY29udGV4dC4KPj4gPj4gPiAKPj4gPj4gPiBUaGUgdGVzdCBoYXJuZXNzIGRvZXNu
J3QgdXNlIHZwY2lfYWRkX2hhbmRsZXJzIG9yIHZwY2lfcmVtb3ZlX2RldmljZSwKPj4gPj4gPiBp
dCBqdXN0IGFkZHMgYW5kIHJlbW92ZXMgaGFuZGxlcnMgdXNpbmcgdnBjaV9hZGRfcmVnaXN0ZXIg
YW5kCj4+ID4+ID4gdnBjaV9yZW1vdmVfcmVnaXN0ZXIuCj4+ID4+IAo+PiA+PiBJIGRpc2xpa2Ug
c3VjaCBhIHNldHVwIC0gdGhlbiB5b3UnZCBiZXR0ZXIgI2lmZGVmIG91dCB0aGUgZW50aXJlCj4+
ID4+IGZ1bmN0aW9uLCBhbmQgdW5kbyBzb21lIG9mIHRoZSBvdGhlciByZWNlbnRseSBhZGRlZCAj
aWZkZWYtYXJ5Lgo+PiA+IAo+PiA+IE9LLCBJJ3ZlIGRvbmUgaXQgdGhhdCB3YXkgaW5pdGlhbGx5
IHRvIHByZXZlbnQgcG9sbHV0aW5nIHZwY2kuYyB3aXRoCj4+ID4gX19YRU5fXyBpZmRlZnMuIFRo
ZSBwYXRjaCBiZWxvdyBpZmRlZnMgdGhvc2UgdW51c2VkIGZ1bmN0aW9ucy4KPj4gCj4+IExvb2tz
IGxpa2UgYW4gb3ZlcmFsbCBpbXByb3ZlbWVudCB0byBtZS4KPiAKPiBXb3VsZCB5b3UgYmUgZmlu
ZSB3aXRoIHRoaXMgYmVpbmcgYSBzZXBhcmF0ZSBwYXRjaCwgb3Igd291bGQgeW91IGxpa2UKPiBt
ZSB0byBzcXVhc2ggaXQgaW50byB0aGUgc2VyaWVzPwo+IAo+IEkgdGhpbmsgaWYgeW91IGRvbid0
IGhhdmUgb3RoZXIgY29tbWVudHMgdGhhdCByZXF1aXJlIGEgbmV3IHZlcnNpb24gb2YKPiB0aGUg
c2VyaWVzIGEgc2VwYXJhdGUgcGF0Y2ggc2hvdWxkIGJlIE9LLgoKV2VsbCwgaXQgYmVpbmcgb25s
eSB0aGUgdGVzdCB1dGlsaXR5IHRoYXQncyBhZmZlY3RlZCBJIHRoaW5rIGEgc2VwYXJhdGUKcGF0
Y2ggd291bGQgYmUgYWNjZXB0YWJsZS4gQnV0IEkgaGF2ZW4ndCBoYWQgYSBjaGFuY2UgeWV0IHRv
IGxvb2sKb3ZlciB2MTAgcGF0Y2hlcyA3IGFuZCAxMS4KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
