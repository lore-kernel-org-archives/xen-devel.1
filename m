From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/gdbsx: fix 'g' packet response for
 64bit guests
Date: Tue, 31 Jul 2018 17:28:25 +0100
Message-ID: <20180731162825.ofz2qxlresiv3cwb@citrix.com>
References: <20180731023042.19031-1-marmarek@invisiblethingslab.com>
 <20180731090024.xbovqmyfrj6xiaid@citrix.com> <20180731161007.GR1371@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180731161007.GR1371@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDY6MTA6MDdQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDMxLCAyMDE4IGF0IDEwOjAwOjI0QU0g
KzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAzMSwgMjAxOCBhdCAwNDozMDo0
MkFNICswMjAwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4gPiA+IC0tLSBh
L3Rvb2xzL2RlYnVnZ2VyL2dkYnN4L2d4L2d4X2xvY2FsLmMKPiA+ID4gKysrIGIvdG9vbHMvZGVi
dWdnZXIvZ2Ric3gvZ3gvZ3hfbG9jYWwuYwo+ID4gPiBAQCAtNDUsOCArNDUsOCBAQCBwcm50XzMy
cmVncyhzdHJ1Y3QgeGdfZ2RiX3JlZ3MzMiAqcjMycCkKPiA+ID4gIHN0YXRpYyB2b2lkCj4gPiA+
ICBwcm50XzY0cmVncyhzdHJ1Y3QgeGdfZ2RiX3JlZ3M2NCAqcjY0cCkKPiA+ID4gIHsKPiA+ID4g
LSAgICBwcmludGYoInJpcDoiWEdGNjQiIHJzcDoiWEdGNjQiIGZsYWdzOiJYR0Y2NCJcbiIsIHI2
NHAtPnJpcCwgcjY0cC0+cnNwLAo+ID4gPiAtICAgICAgICAgICByNjRwLT5yZmxhZ3MpOwo+ID4g
PiArICAgIHByaW50ZigicmlwOiJYR0Y2NCIgcnNwOiJYR0Y2NCIgZmxhZ3M6JTA4eFxuIiwgcjY0
cC0+cmlwLCByNjRwLT5yc3AsCj4gPiA+ICsgICAgICAgICAgIHI2NHAtPmVmbGFncyk7Cj4gPiAK
PiA+IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGludHJvZHVjZSBYR0YzMiBhbmQgWEdG
TTMyIGluIHRoZSBoZWFkZXIuCj4gCj4gSSB3YXMgaW5zcGlyZWQgYnkgcHJudF8zMnJlZ3MgZnVu
Y3Rpb24sIHdoaWNoIHVzZSBleHBsaWNpdCAlMDh4LiBTaG91bGQKPiBpdCBiZSBjaGFuZ2VkIHRo
ZXJlIHRvbyAodG8gUFJJeDMyKT8gT3RoZXJ3aXNlIHRoYXQgd291bGQgYmUKPiBpbmNvbnNpc3Rl
bnQgKGFuZCBtYXliZSB3YXJyYW50IGEgdG90YWxseSBzZXBhcmF0ZSBjbGVhbnVwKS4KClNlZSBB
bmRyZXcncyBzdWdnZXN0aW9uIHRvIHN3aXRjaCB0byBQUkl4Ki4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
