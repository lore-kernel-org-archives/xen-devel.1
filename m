From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v18 05/11] x86/mm: add HYPERVISOR_memory_op
 to acquire guest resources
Date: Thu, 29 Mar 2018 12:43:17 +0000
Message-ID: <d42fa83cc5994f2380b1737dcbf6d00c@AMSPEX02CL03.citrite.net>
References: <20180322115521.30936-1-paul.durrant@citrix.com>
 <20180322115521.30936-6-paul.durrant@citrix.com>
 <5AB8F88202000078001B60C0@prv1-mh.provo.novell.com>
 <b328c96e531543d5a89d9603d54ba14a@AMSPEX02CL03.citrite.net>
 <5ABCF82302000078001B72F0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ns1b=gt=citrix.com=prvs=619f37640=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1f1Wtk-0000Pw-5q
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 12:43:20 +0000
In-Reply-To: <5ABCF82302000078001B72F0@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjkgTWFyY2ggMjAxOCAxMzoyOQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3IENvb3Blcgo+IDxBbmRyZXcuQ29vcGVyM0BjaXRy
aXguY29tPjsgR2VvcmdlIER1bmxhcAo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4g
SmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFdlaSBMaXUKPiA8d2VpLmxpdTJAY2l0
cml4LmNvbT47IFN0ZWZhbm9TdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVu
LQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPgo+IFN1
YmplY3Q6IFJFOiBbUEFUQ0ggdjE4IDA1LzExXSB4ODYvbW06IGFkZCBIWVBFUlZJU09SX21lbW9y
eV9vcCB0bwo+IGFjcXVpcmUgZ3Vlc3QgcmVzb3VyY2VzCj4gCj4gPj4+IE9uIDI5LjAzLjE4IGF0
IDExOjUzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IEZyb206IEphbiBC
ZXVsaWNoIFttYWlsdG86SkJldWxpY2hAc3VzZS5jb21dCj4gPj4gU2VudDogMjYgTWFyY2ggMjAx
OCAxMjo0MQo+ID4+Cj4gPj4gPj4+IE9uIDIyLjAzLjE4IGF0IDEyOjU1LCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gLS0tIGEveGVuL2luY2x1ZGUveGxhdC5sc3QKPiA+
PiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hsYXQubHN0Cj4gPj4gPiBAQCAtODYsNiArODYsNyBAQAo+
ID4+ID4gICEJbWVtb3J5X21hcAkJCW1lbW9yeS5oCj4gPj4gPiAgIQltZW1vcnlfcmVzZXJ2YXRp
b24JCW1lbW9yeS5oCj4gPj4gPiAgIQltZW1fYWNjZXNzX29wCQkJbWVtb3J5LmgKPiA+PiA+ICsh
CW1lbV9hY3F1aXJlX3Jlc291cmNlCQltZW1vcnkuaAo+ID4+Cj4gPj4gV2h5ICEgPyBUaGUgbGF5
b3V0IGRvZXNuJ3QgYXBwZWFyIHRvIGRpZmZlciBiZXR3ZWVuIG5hdGl2ZSBhbmQKPiA+PiBjb21w
YXQuIE9yIHdhaXQsIHRoZSBoYW5kbGUgZG9lcywgYnV0IHdoeSBpcyB0aGF0IG5vdAo+ID4+IFhF
Tl9HVUVTVF9IQU5ETEVfNjQoKT8gKEkndmUgc2tpcHBlZCB0aGUgY29tcGF0IGxheWVyIGNvZGUK
PiA+PiBpbiB0aGlzIHJvdW5kIG9mIHJldmlldyBmb3IgdGhhdCByZWFzb24uKQo+ID4KPiA+IEl0
J3MgYmVlbiBYRU5fR1VFU1RfSEFORExFIHRocm91Z2hvdXQgYWxsIGJ1dCB0aGUgZWFybGllc3Qg
cmV2aXNpb25zIG9mCj4gdGhlCj4gPiBwYXRjaCBhbmQgSSBoYXZlIG5vdCBtb2RpZmllZCB0aGUg
Y29tcGF0IGNvZGUgbWFzc2l2ZWx5IHNpbmNlIHlvdSBnYXZlCj4geW91cgo+ID4gUi1iIGFueXdh
eS4uLiB0aGUgb25seSB0aGluZyB0aGF0IGNoYW5nZWQgd2FzIGNvcHlpbmcgYmFjayB0aGUgbmV3
IGZsYWdzCj4gPiB2YWx1ZS4KPiAKPiBHcmFudGVkIEkgY291bGQvc2hvdWxkIGhhdmUgbm90aWNl
ZCB0aGlzIGVhcmxpZXIsIGJ1dCBiZWluZyBhYmxlIHRvCj4gZ2V0IGF3YXkgd2l0aG91dCBjb21w
YXQgdHJhbnNsYXRpb24gd291bGQgY2VydGFpbmx5IGJlIGEgd2luLCBhbmQKPiB3ZSBoYXZlIHRo
YXQgb3B0aW9uIHNpbmNlIHRoaXMgaXMgYSB0b29scy1vbmx5IGludGVyZmFjZS4KPiAKCk9rLiBJ
J2xsIHNlZSBpZiBJIGNhbiBnZXQgdGhpcyBkb25lIHRvZGF5IHRoZW4uCgogIFBhdWwKCj4gSmFu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
