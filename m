From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] make xen ocaml safe-strings compliant
Date: Wed, 7 Feb 2018 10:31:42 +0000
Message-ID: <20180207103142.b7lbgqw7nwdtkiss@citrix.com>
References: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
 <20180206164930.hall3jh62vn4vrix@citrix.com>
 <alpine.LFD.2.21.1802062144430.3326@austen3.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ari4=fb=citrix.com=prvs=569d7db92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ejN14-0001Cr-DO
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 10:31:50 +0000
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1802062144430.3326@austen3.home>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michael Young <m.a.young@durham.ac.uk>
Cc: Wei Liu <wei.liu2@citrix.com>, John Thomson <git@johnthomson.fastmail.com.au>, Marcello Seri <marcello.seri@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMDYsIDIwMTggYXQgMDk6NTY6MTRQTSArMDAwMCwgTWljaGFlbCBZb3VuZyB3
cm90ZToKPiBPbiBUdWUsIDYgRmViIDIwMTgsIFdlaSBMaXUgd3JvdGU6Cj4gCj4gPiBPbiBUdWUs
IEphbiAzMCwgMjAxOCBhdCAxMDo1NTo0N1BNICswMDAwLCBNaWNoYWVsIFlvdW5nIHdyb3RlOgo+
ID4gPiBYZW4gYnVpbHQgd2l0aCBvY2FtbCA0LjA2IGdpdmVzIGVycm9ycyBzdWNoIGFzCj4gPiA+
IEVycm9yOiBUaGlzIGV4cHJlc3Npb24gaGFzIHR5cGUgYnl0ZXMgYnV0IGFuIGV4cHJlc3Npb24g
d2FzCj4gPiA+IAlleHBlY3RlZCBvZiB0eXBlIHN0cmluZwo+ID4gPiBhcyBCeXRlIGFuZCBzYWZl
LXN0cmluZ3Mgd2hpY2ggd2VyZSBpbnRyb2R1Y2VkIGluIDQuMDIgYXJlIHRoZQo+ID4gPiBkZWZh
dWx0IGluIDQuMDYuCj4gPiA+IFRoaXMgcGF0Y2ggd2hpY2ggaXMgcGFydGx5IGJ5IFJpY2hhcmQg
Vy5NLiBKb25lcyBvZiBSZWQgSGF0Cj4gPiA+IGZyb20gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQu
Y29tL3Nob3dfYnVnLmNnaT9pZD0xNTI2NzAzCj4gPiA+IGZpeGVzIHRoZXNlIGlzc3Vlcy4KPiA+
ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgWW91bmcgPG0uYS55b3VuZ0BkdXJoYW0u
YWMudWs+Cj4gPiA+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGlu
ZGlnQGNpdHJpeC5jb20+Cj4gPiAKPiA+IFN0cmFuZ2VseSB0aGlzIGRvZXNuJ3QgYXBwbHkgdG8g
c3RhZ2luZy4gQW5kIGFmdGVyIGV4YW1pbmluZyB0aGUKPiA+IGRvd25sb2FkZWQgcGF0Y2ggSSdt
IG5vdCBzdXJlIGlmIG15IG1haWwgY2xpZW50IGlzIGFjdGluZyB1cC4gRG8geW91Cj4gPiBoYXZl
IGEgZ2l0IGJyYW5jaCB0aGF0IEkgY2FuIHB1bGwgZnJvbT8KPiAKPiBUaGUgcGF0Y2ggbmVlZGVk
IHRvIGJlIHJlZHVjZWQgYXMgb25lIG9mIHRoZSBzZWN0aW9ucyBiZWluZyBwYXRjaGVkIHdhcwo+
IHJlbW92ZWQgYnkgYSByZWNlbnQgcGF0Y2guIEkgYW0gYXR0YWNoaW5nIHRoZSByZXZpc2VkIHBh
dGNoIGFzIGEgZmlsZSBpbgo+IGNhc2UgdGhlcmUgd2FzIGFsc28gYW4gZW1haWwgZm9ybWF0dGlu
ZyBpc3N1ZS4KPiAKClRoYW5rcywgSSB3aWxsIHRyeSB0aGlzIHRvZGF5LgoKV2VpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
