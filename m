From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 20/21] xen: support console_switching
 between Dom0 and DomUs on ARM
Date: Wed, 18 Jul 2018 09:51:40 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807180951120.21200@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <1530918736-13965-20-git-send-email-sstabellini@kernel.org>
 <5B4CC5A602000078001D48CD@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807161411280.21200@sstabellini-ThinkPad-X260>
 <5B4D8EBF02000078001D4AAC@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807170939530.21200@sstabellini-ThinkPad-X260>
 <5B4EE13402000078001D52DB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4EE13402000078001D52DB@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxOCBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDE3LjA3LjE4
IGF0IDE4OjQzLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBUdWUsIDE3
IEp1bCAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMTYuMDcuMTggYXQgMjM6
NTUsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+PiA+IE9uIE1vbiwgMTYgSnVs
IDIwMTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+ID4+ID4+PiBPbiAwNy4wNy4xOCBhdCAwMTox
MiwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+ID4+ID4gQEAgLTM4OSwyOSAr
MzkyLDQ5IEBAIHN0YXRpYyB2b2lkIGR1bXBfY29uc29sZV9yaW5nX2tleSh1bnNpZ25lZCBjaGFy
IGtleSkKPiA+PiA+PiA+ICAgICAgZnJlZV94ZW5oZWFwX3BhZ2VzKGJ1Ziwgb3JkZXIpOwo+ID4+
ID4+ID4gIH0KPiA+PiA+PiA+ICAKPiA+PiA+PiA+IC0vKiBDVFJMLTxzd2l0Y2hfY2hhcj4gc3dp
dGNoZXMgaW5wdXQgZGlyZWN0aW9uIGJldHdlZW4gWGVuIGFuZCBET00wLiAqLwo+ID4+ID4+ID4g
Ky8qCj4gPj4gPj4gPiArICogQ1RSTC08c3dpdGNoX2NoYXI+IHN3aXRjaGVzIGlucHV0IGRpcmVj
dGlvbiBiZXR3ZWVuIFhlbiwgRG9tMCBhbmQKPiA+PiA+PiA+ICsgKiBEb21Vcy4KPiA+PiA+PiA+
ICsgKi8KPiA+PiA+PiA+ICAjZGVmaW5lIHN3aXRjaF9jb2RlIChvcHRfY29uc3dpdGNoWzBdLSdh
JysxKQo+ID4+ID4+ID4gLXN0YXRpYyBpbnQgX19yZWFkX21vc3RseSB4ZW5fcnggPSAxOyAvKiBG
QUxTRSA9PiBpbnB1dCBwYXNzZWQgdG8gZG9tYWluIDAuIAo+ID4gKi8KPiA+PiA+PiA+ICtzdGF0
aWMgaW50IF9fcmVhZF9tb3N0bHkgeGVuX3J4ID0gMTsgLyogMSA9PiBpbnB1dCBwYXNzZWQgdG8g
ZG9tYWluIDAuICovCj4gPj4gPj4gCj4gPj4gPj4gSSBndWVzcyB0aGlzIHZhcmlhYmxlIHdhbnRz
IHJlbmFtaW5nIG5vdy4KPiA+PiA+IAo+ID4+ID4gWWVhaC4gV2hhdCBhYm91dCBgY29uc29sZV9y
eCc/IAo+ID4+IAo+ID4+IFRoYXQncyByZWFzb25hYmxlLiBBbm90aGVyIG9wdGlvbiB3b3VsZCBi
ZSB0byB1c2UgcnhfZG9taWQsIGFuZCBzdG9yZQo+ID4+IGFjdHVhbCBkb21haW4gSURzIHRoZXJl
IChET01JRF9YRU4gZm9yIFhlbikuIFRoYXQnbGwgbWFrZSB0aGUgc3dpdGNoaW5nCj4gPj4gbG9n
aWMgc2xpZ2h0bHkgbGFyZ2VyLCBidXQgcGVyaGFwcyBwcm92aWRlIGEgYmV0dGVyIHVuZGVyc3Rh
bmRhYmxlIGVuZAo+ID4+IHJlc3VsdC4KPiA+IAo+ID4gV2hhdCBhYm91dCBrZWVwaW5nIHRoZSBs
b2dpYyBzaW1wbGUgYW5kIGFkZGluZyBhIGJldHRlciBjb21tZW50IHRvCj4gPiBleHBsYWluIGhv
dyBjb25zb2xlX3J4IHdvcmtzOgo+ID4gCj4gPiAvKgo+ID4gICogY29uc29sZV9yeD0wID0+IGlu
cHV0IHRvIHhlbgo+ID4gICogY29uc29sZV9yeD0xID0+IGlucHV0IHRvIGRvbTAKPiA+ICAqIGNv
bnNvbGVfcng9TiA9PiBpbnB1dCBkb20oTi0xKQo+ID4gICovCj4gCj4gV2VsbCwgYXMgc2FpZCAt
IG15IHN1Z2dlc3Rpb24gaXMgImFub3RoZXIgb3B0aW9uIiwgbm90IHNvbWV0aGluZyBJJ2QgaW5z
aXN0Cj4gb24uIFVubGVzcyBvdGhlcnMgcHJlZmVyIG9uIG9mIHRoZW0sIEknZCBzYXkgaXQncyB1
cCB0byB5b3UuCgpUaGFuayB5b3UsIGZvciBiZWluZyB1bmRlcnN0YW5kaW5nLiBJbiB0aGF0IGNh
c2UsIEknbGwga2VlcCBpdCBhcyBpcwoocGx1cyB0aGUgY29tbWVudCkgZm9yIHRoZSBuZXh0IHZl
cnNpb24gb2YgdGhlIHNlcmllcy4gCgpPZiBjb3Vyc2UsIGlmIHlvdSdsbCBjaGFuZ2UgeW91ciBt
aW5kIGFuZCBkZWNpZGUgdGhhdCBJIGhhdmUgdG8gY2hhbmdlCml0LCBJJ2xsIGRvIGluIG9uZSBv
ZiB0aGUgZm9sbG93LXVwcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
