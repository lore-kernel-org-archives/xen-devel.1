From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/pvshim: fix GNTTABOP_query_size
 hypercall forwarding with SMAP
Date: Fri, 26 Jan 2018 09:53:12 -0700
Message-ID: <5A6B6B0802000078001A2E19@prv-mh.provo.novell.com>
References: <20180126152910.4320-1-roger.pau@citrix.com>
 <20180126155238.qxme4udlnpaqmd26@citrix.com>
 <20180126162241.gv5diajtsf2gjifc@MacBook-Pro-de-Roger.local>
 <20180126162827.mqchyrg2bkqorg3x@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=joeh=ev=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ef7Ff-0000U7-TB
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 16:53:19 +0000
In-Reply-To: <20180126162827.mqchyrg2bkqorg3x@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAxLjE4IGF0IDE3OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMDQ6MjI6NDFQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPj4gT24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMDM6NTI6MzhQTSArMDAwMCwgV2Vp
IExpdSB3cm90ZToKPj4gPiBPbiBGcmksIEphbiAyNiwgMjAxOCBhdCAwMzoyOToxMFBNICswMDAw
LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvc2hp
bS5jCj4+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCj4+ID4gPiBAQCAtNzQ4LDcg
Kzc0OCwxMCBAQCBzdGF0aWMgbG9uZyBwdl9zaGltX2dyYW50X3RhYmxlX29wKHVuc2lnbmVkIGlu
dCBjbWQsCj4+ID4gPiAgICAgIH0KPj4gPiA+ICAKPj4gPiA+ICAgICAgY2FzZSBHTlRUQUJPUF9x
dWVyeV9zaXplOgo+PiA+ID4gKyAgICAgICAgLyogRGlzYWJsZSBTTUFQIHNvIEwwIGNhbiBhY2Nl
c3MgdGhlIGJ1ZmZlci4gKi8KPj4gPiAKPj4gPiBJbnRlcmVzdGluZy4KPj4gPiAKPj4gPiA+ICsg
ICAgICAgIHN0YWMoKTsKPj4gPiA+ICAgICAgICAgIHJjID0geGVuX2h5cGVyY2FsbF9ncmFudF90
YWJsZV9vcChHTlRUQUJPUF9xdWVyeV9zaXplLCB1b3AucCwgY291bnQpOwo+PiA+ID4gKyAgICAg
ICAgY2xhYygpOwo+PiA+IAo+PiA+IFRoZXJlIGlzIHNvIGZhciBvbmx5IG9uZSBpbnN0YW5jZSBv
ZiB0aGlzLCBzbyBkb2luZyB0aGlzIGFkLWhvYyBzdGFjIC8KPj4gPiBjbGFjIGlzIE9LLgo+PiA+
IAo+PiA+IFByb2JhYmx5IGFub3RoZXIgKG1vcmUgdW5pZm9ybWVkKSB3YXkgb2YgZml4aW5nIGl0
IGlzIHRvIGhhdmUgb3VyIG93bgo+PiA+IGJ1ZmZlciAoZm9yYmlkIHBhc3NpbmcgdGhyb3VnaCB1
b3AgZGlyZWN0bHkpIGFuZCB0aGUgY29weSBiYWNrIHRoZQo+PiA+IHJlc3VsdC4gT3Igd2Ugc2hv
dWxkIGludmVudCBhIHNldCBvZiBtYWNyb3MgdG8gZGVhbCB3aXRoIHVvcC4KPj4gCj4+IEkgZ3Vl
c3Mgd2Ugc2hvdWxkIGZpZ3VyZSBvdXQgd2hhdCdzIGZhc3RlciwgZGlzYWJsaW5nIFNNQVAgb3Ig
Y29weWluZwo+PiB0byBhIGJ1ZmZlcj8KPj4gCj4gCj4gSXQgZGVwZW5kcy4gSWYgdGhlcmUgYXJl
IGdvaW5nIHRvIGJlIGluc3RhbmNlcyB0aGF0IEwwIG5lZWRzIHRvIGNvcHkgdG8KPiBhIGxhcmdl
IGJ1ZmZlciBpbiBMMiB1c2Vyc3BhY2UsIGRpc2FibGluZyBTTUFQIGlzIGRlZmluaXRlbHkgYmV0
dGVyIHRoZW4KPiBib3VuY2luZy4KCklmIHlvdSB3YW50ZWQgdG8gdW5pZm9ybWx5IGNvcHksIGRl
dGVybWluaW5nIHRoZSBvdmVyYWxsIHNpemUgb2YKc29tZSBvZiB0aGUgc3RydWN0dXJlcyB3b3Vs
ZCBiZSBub24tdHJpdmlhbCBJIHRoaW5rLCBwbHVzIHlvdSdkCnJ1biBpbnRvIHRoZSBzYW1lIHNw
YWNlIHByb2JsZW1zIHRoYXQgbWFrZXMgY29tZSBvZiB0aGUgMzItYml0CmNvbXBhdCBsYXllciBz
byB1Z2x5IHRvIHJlYWQvbWFpbnRhaW4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
