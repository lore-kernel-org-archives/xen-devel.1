From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 00/21] dom0less step1: boot multiple
 domains from device tree
Date: Mon, 23 Jul 2018 10:52:27 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807231052040.19154@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <87c65c26-19c7-9bae-5b21-8eb04f2b64b9@arm.com>
 <alpine.DEB.2.10.1807131354200.4709@sstabellini-ThinkPad-X260>
 <1a501bf9-8d62-bac7-302e-85cd2f8b4ff7@arm.com>
 <alpine.DEB.2.10.1807181047500.21200@sstabellini-ThinkPad-X260>
 <5411a218-46e1-5f16-64db-eae36476bb81@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5411a218-46e1-5f16-64db-eae36476bb81@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, andrew.cooper3@citrix.com, xen-devel@lists.xen.org, jbeulich@suse.com, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMyBKdWwgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE4LzA3LzE4IDE4
OjQ4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBXZWQsIDE4IEp1bCAyMDE4LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEhpIFN0ZWZhbm8sCj4gPiA+IAo+ID4gPiBPbiAxMy8w
Ny8xOCAyMTo1NCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgMTIg
SnVsIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiA+IEhpLAo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBwcm92aWRlIGEgYnJhbmNoIHdpdGggdGhl
IHBhdGNoIGFwcGxpZWQ/IEl0Cj4gPiA+ID4gPiB3b3VsZAo+ID4gPiA+ID4gYmUKPiA+ID4gPiA+
IG5pY2UgdG8gaGF2ZSB0aGF0IGZvciBldmVyeSB2ZXJzaW9uLCBzbyBJIGNhbiBlYXNpbHkga25v
dyBvbiB3aGljaAo+ID4gPiA+ID4gdmVyc2lvbgo+ID4gPiA+ID4gb2YKPiA+ID4gPiA+IHlvdSBh
cmUgYmFzZWQgYW5kIGF2b2lkIHNwZW5kaW5nIHRpbWUgdHJ5aW5nIHRvIGFwcGx5IGl0IDopLgo+
ID4gPiA+IAo+ID4gPiA+IE1ha2VzIHNlbnNlLCBJJ2xsIGRvIGZyb20gbmV4dCB0aW1lCj4gPiA+
IAo+ID4gPiBDb3VsZCB5b3UgcHJvdmlkZSBvbmUgZnJvbSB0aGlzIHZlcnNpb24/IFNvIEkgY2Fu
IHJldmlldyBzb21lIG9mIHlvdXIKPiA+ID4gcGF0Y2hlcwo+ID4gPiBtb3JlIGVhc2lseS4KPiA+
IAo+ID4gaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0dHAvcGVvcGxlL3NzdGFi
ZWxsaW5pL3hlbi11bnN0YWJsZS5naXQKPiA+IGRvbTBsZXNzLXYyCj4gCj4gVGhhbmtzLiBJIHdp
bGwgaGF2ZSBhIGxvb2sgYXQgdGhlIHZwbDAxMSBwYXRjaGVzLiBJIHRoaW5rIHRoZSByZXN0IGlz
IGVpdGhlcgo+IHJldmlld2VkIG9yIHdpbGwgcmVxdWlyZSBjaGFuZ2VzIGJhc2VkIG9uIG90aGVy
IGNvbW1lbnRzLgo+IAo+IExldCBtZSBrbm93IGlmIEkgbWlzc2VkIGFueXRoaW5nLgoKTm8sIEkg
dGhpbmsgaXQgaXMgT0suIFRoYW5rIHlvdS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
