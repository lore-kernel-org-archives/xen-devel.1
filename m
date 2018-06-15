From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] tools/libxencalls: add new function to
 query hypercall buffer safety
Date: Fri, 15 Jun 2018 16:18:59 +0200
Message-ID: <ffefb8fb-5d7a-f996-3d07-4e4405eb83c8@suse.com>
References: <20180615132641.5461-1-jgross@suse.com>
 <20180615132641.5461-3-jgross@suse.com> <5B23C7E502000078001CBA03@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=56i5=jb=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fTpZA-0005oz-0R
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 14:19:04 +0000
In-Reply-To: <5B23C7E502000078001CBA03@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDYvMTggMTY6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE1LjA2LjE4IGF0
IDE1OjI2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gQWRkIGEgbmV3IGZ1bmN0aW9uIHRv
IHF1ZXJ5IHdoZXRoZXIgaHlwZXJjYWxsIGJ1ZmZlcnMgYXJlIGFsd2F5cyBzYWZlCj4+IHRvIGFj
Y2VzcyBieSB0aGUgaHlwZXJ2aXNvciBvciBtaWdodCByZXN1bHQgaW4gRUZBVUxULgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IC0tLQo+PiAg
dG9vbHMvbGlicy9jYWxsL01ha2VmaWxlICAgICAgICAgIHwgMiArLQo+PiAgdG9vbHMvbGlicy9j
YWxsL2ZyZWVic2QuYyAgICAgICAgIHwgNSArKysrKwo+PiAgdG9vbHMvbGlicy9jYWxsL2luY2x1
ZGUveGVuY2FsbC5oIHwgNyArKysrKysrCj4+ICB0b29scy9saWJzL2NhbGwvbGlieGVuY2FsbC5t
YXAgICAgfCA1ICsrKysrCj4+ICB0b29scy9saWJzL2NhbGwvbGludXguYyAgICAgICAgICAgfCA1
ICsrKysrCj4+ICB0b29scy9saWJzL2NhbGwvbWluaW9zLmMgICAgICAgICAgfCA1ICsrKysrCj4+
ICB0b29scy9saWJzL2NhbGwvbmV0YnNkLmMgICAgICAgICAgfCA1ICsrKysrCj4+ICB0b29scy9s
aWJzL2NhbGwvc29sYXJpcy5jICAgICAgICAgfCA1ICsrKysrCj4+ICA4IGZpbGVzIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBEaWQgeW91IHZlcmlmeSBhbGwg
b2YgdGhlbSB0byBpbmRlZWQgYmUgc2FmZT8gSWYgbm90LCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIg
dG8KPiBkZWZhdWx0IHRvIHVuc2FmZT8KCk1pbmlvcyBpcyBzYWZlLCBSb2dlciB0b2xkIG1lIHRo
YXQgQlNEcyBhcmUgc28sIHRvby4gSSBkb24ndCB0aGluawpTb2xhcmlzIGlzIGNyaXRpY2FsLCBh
cyBJIGNhbid0IHNlZSBob3cgbGlieGVuY2FsbCB3b3VsZCBldmVuIGJ1aWxkCnRoZXJlIChvc2Rl
cF9oeXBlcmNhbGwoKSBpcyBtaXNuYW1lZCkuCgo+IEZvciBMaW51eCwgaXMgdGhlcmUgcGVyaGFw
cyBhIHdheSB0byBmaWd1cmUgb3V0IHdoZXRoZXIgdGhlIHByb2JsZW0KPiBmZWF0dXJlcyBkb24n
dCBleGlzdCAob3IgYXJlIGRpc2FibGVkKSBpbiB0aGUga2VybmVsLCBzbyB0aGF0IChlc3BlY2lh
bGx5Cj4gb24gb2xkZXIga2VybmVscywgd2hlcmUgdGhlIHByaXZjbWQgZHJpdmVyIHN1cmVseSBp
cyBhbiBvbGQgb25lKSB5b3UKPiBkb24ndCBuZWVkbGVzc2x5IGRvIHRoZSByZXRyaWVzPwoKVEJI
LCBJIHRoaW5rIHRoaXMgd291bGQgYmUgb3ZlcmtpbGwuIEFueSBFRkFVTFQgaXMgZWl0aGVyIGEg
YnVnIGluIHRoZQp0b29scywgc28gYSByZXRyeSB3b3VsZCBub3QgY2hhbmdlIGFueXRoaW5nLCBv
ciBpdCBpcyBkdWUgdG8gdGhlIHByb2JsZW0KdGhlIHBhdGNoIGlzIGFkZHJlc3NpbmcuIEFkZGlu
ZyBhZGRpdGlvbmFsIGNvZGluZyB0byBhdm9pZCByZXRyaWVzIGluCnRoZSBjYXNlIG9mIGEgYnVn
IGluIHRoZSB0b29scyBzZWVtcyBub3QgdG8gYmUgYXBwcm9wcmlhdGUuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
