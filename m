From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] libxl: do not fail device removal if
 backend domain is gone
Date: Fri, 9 Feb 2018 12:10:39 +0000
Message-ID: <20180209121039.5nx4crwkpchrv7m3@MacBook-Pro-de-Roger.local>
References: <20180208232213.4105-1-marmarek@invisiblethingslab.com>
 <20180209112704.quwohlkqphs5ufrn@MacBook-Pro-de-Roger.local>
 <20180209114158.GL2070@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180209114158.GL2070@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMDksIDIwMTggYXQgMTI6NDE6NThQTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIEZyaSwgRmViIDA5LCAyMDE4IGF0IDExOjI3OjA0QU0g
KzAwMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBJJ20gYWxzbyB3b25kZXJpbmcsIGlm
IHlvdSBqdW1wIHRvICdvdXQnIGhlcmUsIHlvdSBhdm9pZCB0aGUgY2FsbCB0bwo+ID4gbGlieGxf
X3hzX3RyYW5zYWN0aW9uX2NvbW1pdCBhbmQgaW5zdGVhZCBlbmQgdXAgY2FsbGluZwo+ID4gbGli
eGxfX3hzX3RyYW5zYWN0aW9uX2Fib3J0LCB3aGljaCBtZWFucyB0aGUgYWJvdmUgY2FsbCB0bwo+
ID4gbGlieGxfX3hzX3BhdGhfY2xlYW51cCB3aWxsIG5vdCBiZSBjb21taXR0ZWQgdG8geGVuc3Rv
cmUsIGlzIHRoaXMKPiA+IHJlYWxseSBkZXNpcmVkPwo+ID4KPiA+IEl0IHNlZW1zIHRvIG1lIGxp
YnhsIG1pZ2h0IGxlYWsgeGVuc3RvcmUgZnJvbnRlbmQgZW50cmllcyBpbiB0aGF0Cj4gPiBjYXNl
Lgo+IAo+IFRoYXQgY2FsbCBpcyBvbmx5IGlmIGFvZGV2LT5mb3JjZS4gSW4gb3RoZXIgY2FzZXMg
Y2xlYW51cCBpcyBkb25lIGluCj4gZGV2aWNlX2hvdHBsdWdfZG9uZSgpLT5saWJ4bF9fZGV2aWNl
X2Rlc3Ryb3koKSwgd2hpY2ggaGF2ZSBpdHMgb3duIHRyYW5zYWN0aW9uLgoKSG0sIHJpZ2h0LCBi
dXQgdGhpcyB3b3VsZCBzdGlsbCBiZSBpbmNvcnJlY3QgaW4gdGhlIGZvcmNlIGNhc2UgdGhlbj8K
T3IgaXMgdGhpcyBzaW1wbHkgbm90IG5lZWRlZCBmb3IgdGhlICdmb3JjZScgY2FzZT8KClRoYW5r
cywgUm9nZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
