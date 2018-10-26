From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 01/34] x86emul: support AVX512 opmask
 insns
Date: Fri, 26 Oct 2018 12:29:08 +0100
Message-ID: <86c809b7-3e39-6bbd-42f8-ba7d8181f2d1@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BA0E58F02000078001E94CE@prv1-mh.provo.novell.com>
 <5BA0E71E02000078001E94EC@prv1-mh.provo.novell.com>
 <b48629ea-44bc-5658-5d5f-c739a680956f@citrix.com>
 <5BD2D87A02000078001F4EE9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f8h9=ng=citrix.com=prvs=8302ac893=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gG0Ii-0002oZ-2l
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 11:29:12 +0000
In-Reply-To: <5BD2D87A02000078001F4EE9@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTAvMTggMTA6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI1LjEwLjE4IGF0
IDIwOjMyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE4LzA5LzE4
IDEyOjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEBAIC0xMTg3LDYgKzExODgsMTEgQEAgc3Rh
dGljIGludCBfZ2V0X2ZwdSgKPj4+ICAgICAgICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRM
RUFCTEU7Cj4+PiAgICAgICAgICBicmVhazsKPj4+ICAKPj4+ICsgICAgY2FzZSBYODZFTVVMX0ZQ
VV9vcG1hc2s6Cj4+PiArICAgICAgICBpZiAoICEoeGNyMCAmIFg4Nl9YQ1IwX1NTRSkgfHwgISh4
Y3IwICYgWDg2X1hDUjBfT1BNQVNLKSApCj4+PiArICAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxf
VU5IQU5ETEVBQkxFOwo+Pj4gKyAgICAgICAgYnJlYWs7Cj4+IEkgc2VlIHRoaXMgZm9sbG93cyB0
aGUgcGF0dGVybiBmcm9tIFg4NkVNVUxfRlBVX3ltbSwgYnV0IGJ5IHRoZSBTU0UKPj4gY2hlY2s/
ICBJdCBpcyBub3QgcmVsZXZhbnQgYXQgdGhpcyBwb2ludCAtIGlmIHhjcjAub3BtYXNrIGlzIHNl
dCwgdGhlCj4+IG9wbWFzayBpbnN0cnVjdGlvbnMgc2hvdWxkIGJlIHVzYWJsZS4KPiBJIHdvdWxk
IGFncmVlIHdpdGggeW91IGZyb20gYSBmdW5jdGlvbmFsIFBPViwgYnV0IHBsZWFzZSBzZWUgdGhl
Cj4gbGFzdCByb3cgb2YgdGhlIHRhYmxlIG5hbWVkICJPUyBYU0FWRSBFbmFibGluZyBSZXF1aXJl
bWVudHMgb2YKPiBJbnN0cnVjdGlvbiBDYXRlZ29yaWVzIiBpbiBTRE0gVm9sIDIuCgpIbW0uwqAg
VGhhdCB0YWJsZSBpcyBpbiBjb250cmFkaWN0aW9uIHRvIFZvbCAzIEZpZ3VyZSAyLTggYW5kIGFz
c29jaWF0ZWQKZGVzY3JpcHRpb24sIHdoaWNoIGVudW1lcmF0ZXMgdGhlICNHUCBjb25kaXRpb25z
IG9mIFhTRVRCVi4KCkluIHBhcnRpY3VsYXIsIGl0IHN1Z2dlc3RzIHRoYXQgT1BNQVNLIG11c3Qg
YmUgc2V0IGluIHVuaW9uIHdpdGggdGhlIFpNTQpiaXRzLCBhbmQgY2Fubm90IGJlIHNldCB3aXRo
b3V0IFlNTS4KCklNTywgd2UgY2FuIHJlcXVpcmUvZXhwZWN0IGdldF94Y3IwKCkgdG8gcGFzcyBh
biBhcmNoaXRlY3R1cmFsbHkgdmFsaWQKcmVzdWx0LsKgIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxk
IGJlIGNoZWNraW5nIHRoZSB0cmFuc2l0aXZlIGNsb3N1cmUgb2YKZmVhdHVyZSBkZXBlbmRlbmNl
cyBoZXJlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
