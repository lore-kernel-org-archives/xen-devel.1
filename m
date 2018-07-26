From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xenconsole: add option to avoid escape
 sequences in log
Date: Thu, 26 Jul 2018 09:57:00 +0100
Message-ID: <20180726085700.dexgiv73kwnnvbxq@citrix.com>
References: <20180721001412.26214-1-marmarek@invisiblethingslab.com>
 <20180725084939.fyb7gco34gonbsp3@citrix.com>
 <20180725085321.jaaro3xbqykyrzjs@citrix.com>
 <CACMJ4GYzBQHdd-V=R1fMv+F6WTggtpbhmhCxNTzt8oCBAw8-LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz6m=kk=citrix.com=prvs=738467b65=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fic52-0003YG-MM
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 08:57:04 +0000
Content-Disposition: inline
In-Reply-To: <CACMJ4GYzBQHdd-V=R1fMv+F6WTggtpbhmhCxNTzt8oCBAw8-LA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Wei Liu <wei.liu2@citrix.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDY6MTU6MjBQTSAtMDcwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMTo1MyBBTSwgV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gPiBPbiBXZWQsIEp1bCAyNSwgMjAxOCBhdCAw
OTo0OTozOUFNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiBPbiBTYXQsIEp1bCAyMSwgMjAx
OCBhdCAwMjoxNDoxMkFNICswMjAwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kKPiA+IHdy
b3RlOgo+ID4gPgo+ID4gPiA+ICsKPiA+ID4gPiArICAgbWVtY3B5KGRlc3QsIGJ1ZiwgbGVuKTsK
PiA+ID4gPiArICAgZm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKSB7Cj4gPiA+ID4gKyAgICAgICAg
ICAgaWYgKGRlc3RbaV0gPT0gJ1wwMzMnKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgZGVz
dFtpXSA9ICcuJzsKPiA+ID4gPiArICAgfQo+ID4gPgo+ID4gPiBUaGlzIGNvdWxkIGJlIG1hZGUg
bW9yZSBlZmZpY2llbnQgYnkgdXNpbmc6Cj4gPiA+Cj4gPiA+ICAgICAgICAgZm9yIChpID0gMDsg
aSA8IGxlbjsgaSsrKSB7Cj4gPiA+ICAgICAgICAgICAgICBpZiAoc3JjW2ldID09ICdcMDMzJykK
PiA+ID4gICAgICAgICAgICAgICAgICBkc3RbaV0gPSAnLic7Cj4gPiA+ICAgICAgICAgICAgICBl
bHNlCj4gPiA+ICAgICAgICAgICAgICAgICAgZHN0W2ldID0gc3JjW2ldOwo+ID4KPiAKPiBUaGUg
YWJvdmUgY29kZSBkb2Vzbid0IHdyaXRlIHRoZSB2YWx1ZSB0aGF0IHdhcyBjaGVja2VkIGludG8g
dGhlCj4gZGVzdGluYXRpb24gYnVmZmVyOyBpbnN0ZWFkIGl0IGRvZXMgYSBzZWNvbmQgY29weSBm
cm9tIHRoZSBzb3VyY2UgYnVmZmVyLgo+IFRoYXQgaXMgYSBwcm9ibGVtYXRpYyBjb2RlIHBhdHRl
cm4gdGhhdCB3ZSBzaG91bGRuJ3QgcmVhbGx5IGVuY291cmFnZS4KCkJlY2F1c2UgeW91IHdvcnJ5
IGFib3V0IFRPQ1RPVSBhdHRhY2s/IEJ1dCBib3RoIHNyYyBhbmQgZHN0IGFyZSB1bmRlcgp4ZW5j
b25zb2xlZCdzIGNvbnRyb2wuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
