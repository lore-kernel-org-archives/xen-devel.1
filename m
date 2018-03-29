From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v18 05/11] x86/mm: add HYPERVISOR_memory_op
 to acquire guest resources
Date: Thu, 29 Mar 2018 06:28:51 -0600
Message-ID: <5ABCF82302000078001B72F0@prv1-mh.provo.novell.com>
References: <20180322115521.30936-1-paul.durrant@citrix.com>
 <20180322115521.30936-6-paul.durrant@citrix.com>
 <5AB8F88202000078001B60C0@prv1-mh.provo.novell.com>
 <b328c96e531543d5a89d9603d54ba14a@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fhp7=gt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1Wfm-0007SR-Nb
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 12:28:54 +0000
In-Reply-To: <b328c96e531543d5a89d9603d54ba14a@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE4IGF0IDExOjUzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAyNiBNYXJjaCAyMDE4IDEyOjQxCj4+IAo+PiA+Pj4gT24gMjIuMDMuMTggYXQgMTI6NTUsIDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gLS0tIGEveGVuL2luY2x1ZGUveGxh
dC5sc3QKPj4gPiArKysgYi94ZW4vaW5jbHVkZS94bGF0LmxzdAo+PiA+IEBAIC04Niw2ICs4Niw3
IEBACj4+ID4gICEJbWVtb3J5X21hcAkJCW1lbW9yeS5oCj4+ID4gICEJbWVtb3J5X3Jlc2VydmF0
aW9uCQltZW1vcnkuaAo+PiA+ICAhCW1lbV9hY2Nlc3Nfb3AJCQltZW1vcnkuaAo+PiA+ICshCW1l
bV9hY3F1aXJlX3Jlc291cmNlCQltZW1vcnkuaAo+PiAKPj4gV2h5ICEgPyBUaGUgbGF5b3V0IGRv
ZXNuJ3QgYXBwZWFyIHRvIGRpZmZlciBiZXR3ZWVuIG5hdGl2ZSBhbmQKPj4gY29tcGF0LiBPciB3
YWl0LCB0aGUgaGFuZGxlIGRvZXMsIGJ1dCB3aHkgaXMgdGhhdCBub3QKPj4gWEVOX0dVRVNUX0hB
TkRMRV82NCgpPyAoSSd2ZSBza2lwcGVkIHRoZSBjb21wYXQgbGF5ZXIgY29kZQo+PiBpbiB0aGlz
IHJvdW5kIG9mIHJldmlldyBmb3IgdGhhdCByZWFzb24uKQo+IAo+IEl0J3MgYmVlbiBYRU5fR1VF
U1RfSEFORExFIHRocm91Z2hvdXQgYWxsIGJ1dCB0aGUgZWFybGllc3QgcmV2aXNpb25zIG9mIHRo
ZSAKPiBwYXRjaCBhbmQgSSBoYXZlIG5vdCBtb2RpZmllZCB0aGUgY29tcGF0IGNvZGUgbWFzc2l2
ZWx5IHNpbmNlIHlvdSBnYXZlIHlvdXIgCj4gUi1iIGFueXdheS4uLiB0aGUgb25seSB0aGluZyB0
aGF0IGNoYW5nZWQgd2FzIGNvcHlpbmcgYmFjayB0aGUgbmV3IGZsYWdzIAo+IHZhbHVlLgoKR3Jh
bnRlZCBJIGNvdWxkL3Nob3VsZCBoYXZlIG5vdGljZWQgdGhpcyBlYXJsaWVyLCBidXQgYmVpbmcg
YWJsZSB0bwpnZXQgYXdheSB3aXRob3V0IGNvbXBhdCB0cmFuc2xhdGlvbiB3b3VsZCBjZXJ0YWlu
bHkgYmUgYSB3aW4sIGFuZAp3ZSBoYXZlIHRoYXQgb3B0aW9uIHNpbmNlIHRoaXMgaXMgYSB0b29s
cy1vbmx5IGludGVyZmFjZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
