From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: What is the option 'e' used for in 'xl create'
	command
Date: Mon, 19 Mar 2018 09:33:47 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803190929290.15548@sstabellini-ThinkPad-X260>
References: <36a98a9f-a164-8fb6-7dc1-e662184ff22d@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hzcb=gj=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1exxjQ-0002ne-R0
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 16:33:56 +0000
In-Reply-To: <36a98a9f-a164-8fb6-7dc1-e662184ff22d@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxOSBNYXIgMjAxOCwgRG9uZ2xpIFpoYW5nIHdyb3RlOgo+IEhpLAo+IAo+IFRoZXJl
IGlzIGFuICdlJyBvcHRpb24gd2hlbiBydW5uaW5nIHRoZSBmb2xsb3dpbmcgeGwgY29tbWFuZDoK
PiAKPiAtIHhsIGNyZWF0ZQo+IC0geGwgcmVzdG9yZQo+IC0geGwgbWlncmF0ZQo+IC0geGwgcmVt
dXMKPiAKPiBUaGUgJ2UnIG9wdGlvbiBpcyB1c2VkIHRvICJEbyBub3Qgd2FpdCBpbiB0aGUgYmFj
a2dyb3VuZCAob24gPGhvc3Q+KSBmb3IgdGhlCj4gZGVhdGggb2YgdGhlIGRvbWFpbiIuIFRoaXMg
b3B0aW9uIGRhdGVzIGJhY2sgdG8gRGVjIDIwMDkuCj4gCj4gV291bGQgeW91IHBsZWFzZSBoZWxw
IG1lIHVuZGVyc3RhbmQgdGhlIG9iamVjdGl2ZSBvZiB0aGUgYmVsb3cgcGF0Y2ggaW50cm9kdWNl
ZAo+IGluIERlYyAyMDA5Pwo+IAo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14
ZW4uZ2l0O2E9Y29tbWl0O2g9ZGU3YzkxMDZjMWEyMmMwZmQ3NTljZWZjZWNmMmM0MjhlNWE3NmEw
MAo+IAo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgaGVscCEKCkhpIERvbmdsaSwKClRo
ZSBpZGVhIGJhY2sgdGhlbiB3YXMgdGhhdCB4bCBpcyBhIGNvbW1hbmQgbGluZSB0b29sIHdoaWNo
IGRvZXNuJ3QgcmVseQpvbiBhbnkgZGFlbW9ucyBydW5uaW5nIGV4Y2VwdCBmb3IgeGVuc3RvcmVk
LiBIb3dldmVyLCB0aGVyZSB3ZXJlIGEKY291cGxlIG9mIGV2ZW50cyB0aGF0IG5lZWRlZCB0byBi
ZSBoYW5kbGVkIGF0IHJ1bnRpbWUsIG5hbWluZyBkb21haW4KZGVzdHJ1Y3Rpb24gYW5kIGNkcm9t
IGluc2VydC9lamVjdCBmb3IgSFZNIGd1ZXN0cy4gRm9yIHRoYXQgcmVhc29uLCB4bApzdGFydGVk
IGZvcmtpbmcgYW5kIGV4ZWN1dGluZyBhbiBpbnN0YW5jZSBvZiBpdHNlbGYgaW4gdGhlIGJhY2tn
cm91bmQsCmp1c3Qgd2FpdGluZyB0byBoYW5kbGUgdGhlc2UgZXZlbnRzLgoKVGhlICItZSIgY29t
bWFuZCBsaW5lIG9wdGlvbiB3YXMgbWVhbnQgdG8gcHJldmVudCB4bCBmcm9tIHJ1bm5pbmcgYW55
CmJhY2tncm91bmQgcHJvY2Vzc2VzLiBUaGlzIHdheSwgeGwgd291bGQganVzdCB0ZXJtaW5hdGUg
YWZ0ZXIgZXhlY3V0aW5nCnRoZSByZXF1ZXN0ZWQgY29tbWFuZC4gT2YgY291cnNlLCBpbiB0aGF0
IGNhc2Ugb25lIHdvdWxkIGhhdmUgdG8KbWFudWFsbHkgZGVzdHJveSB0aGUgZG9tYWlucyBhbmQg
Y2Ryb20gaW5zZXJ0L2VqZWN0IG1pZ2h0IG5vdCB3b3JrLCBidXQKZXZlcnl0aGluZyBlbHNlIHNo
b3VsZCB3b3JrIGFzIHVzdWFsLgoKQ2hlZXJzLAoKU3RlZmFubwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
