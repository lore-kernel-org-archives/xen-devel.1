From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 20/21] xen: support console_switching
 between Dom0 and DomUs on ARM
Date: Wed, 18 Jul 2018 00:41:56 -0600
Message-ID: <5B4EE13402000078001D52DB@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <1530918736-13965-20-git-send-email-sstabellini@kernel.org>
 <5B4CC5A602000078001D48CD@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807161411280.21200@sstabellini-ThinkPad-X260>
 <5B4D8EBF02000078001D4AAC@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807170939530.21200@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807170939530.21200@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA3LjE4IGF0IDE4OjQzLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVHVlLCAxNyBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4+PiBPbiAxNi4w
Ny4xOCBhdCAyMzo1NSwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+IE9uIE1v
biwgMTYgSnVsIDIwMTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiA+PiA+Pj4gT24gMDcuMDcuMTgg
YXQgMDE6MTIsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4gPj4gPiBAQCAtMzg5
LDI5ICszOTIsNDkgQEAgc3RhdGljIHZvaWQgZHVtcF9jb25zb2xlX3Jpbmdfa2V5KHVuc2lnbmVk
IGNoYXIga2V5KQo+PiA+PiA+ICAgICAgZnJlZV94ZW5oZWFwX3BhZ2VzKGJ1Ziwgb3JkZXIpOwo+
PiA+PiA+ICB9Cj4+ID4+ID4gIAo+PiA+PiA+IC0vKiBDVFJMLTxzd2l0Y2hfY2hhcj4gc3dpdGNo
ZXMgaW5wdXQgZGlyZWN0aW9uIGJldHdlZW4gWGVuIGFuZCBET00wLiAqLwo+PiA+PiA+ICsvKgo+
PiA+PiA+ICsgKiBDVFJMLTxzd2l0Y2hfY2hhcj4gc3dpdGNoZXMgaW5wdXQgZGlyZWN0aW9uIGJl
dHdlZW4gWGVuLCBEb20wIGFuZAo+PiA+PiA+ICsgKiBEb21Vcy4KPj4gPj4gPiArICovCj4+ID4+
ID4gICNkZWZpbmUgc3dpdGNoX2NvZGUgKG9wdF9jb25zd2l0Y2hbMF0tJ2EnKzEpCj4+ID4+ID4g
LXN0YXRpYyBpbnQgX19yZWFkX21vc3RseSB4ZW5fcnggPSAxOyAvKiBGQUxTRSA9PiBpbnB1dCBw
YXNzZWQgdG8gZG9tYWluIDAuIAo+ICovCj4+ID4+ID4gK3N0YXRpYyBpbnQgX19yZWFkX21vc3Rs
eSB4ZW5fcnggPSAxOyAvKiAxID0+IGlucHV0IHBhc3NlZCB0byBkb21haW4gMC4gKi8KPj4gPj4g
Cj4+ID4+IEkgZ3Vlc3MgdGhpcyB2YXJpYWJsZSB3YW50cyByZW5hbWluZyBub3cuCj4+ID4gCj4+
ID4gWWVhaC4gV2hhdCBhYm91dCBgY29uc29sZV9yeCc/IAo+PiAKPj4gVGhhdCdzIHJlYXNvbmFi
bGUuIEFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIHVzZSByeF9kb21pZCwgYW5kIHN0b3JlCj4+
IGFjdHVhbCBkb21haW4gSURzIHRoZXJlIChET01JRF9YRU4gZm9yIFhlbikuIFRoYXQnbGwgbWFr
ZSB0aGUgc3dpdGNoaW5nCj4+IGxvZ2ljIHNsaWdodGx5IGxhcmdlciwgYnV0IHBlcmhhcHMgcHJv
dmlkZSBhIGJldHRlciB1bmRlcnN0YW5kYWJsZSBlbmQKPj4gcmVzdWx0Lgo+IAo+IFdoYXQgYWJv
dXQga2VlcGluZyB0aGUgbG9naWMgc2ltcGxlIGFuZCBhZGRpbmcgYSBiZXR0ZXIgY29tbWVudCB0
bwo+IGV4cGxhaW4gaG93IGNvbnNvbGVfcnggd29ya3M6Cj4gCj4gLyoKPiAgKiBjb25zb2xlX3J4
PTAgPT4gaW5wdXQgdG8geGVuCj4gICogY29uc29sZV9yeD0xID0+IGlucHV0IHRvIGRvbTAKPiAg
KiBjb25zb2xlX3J4PU4gPT4gaW5wdXQgZG9tKE4tMSkKPiAgKi8KCldlbGwsIGFzIHNhaWQgLSBt
eSBzdWdnZXN0aW9uIGlzICJhbm90aGVyIG9wdGlvbiIsIG5vdCBzb21ldGhpbmcgSSdkIGluc2lz
dApvbi4gVW5sZXNzIG90aGVycyBwcmVmZXIgb24gb2YgdGhlbSwgSSdkIHNheSBpdCdzIHVwIHRv
IHlvdS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
