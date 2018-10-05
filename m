From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 23/25] xen: support console_switching
 between Dom0 and DomUs on ARM
Date: Fri, 5 Oct 2018 10:48:35 +0100
Message-ID: <e2d7c986-6f72-9ea1-6a84-e4191ae081ae@arm.com>
References: <alpine.DEB.2.10.1807311623060.5781@sstabellini-ThinkPad-X260>
 <1533079688-9541-23-git-send-email-sstabellini@kernel.org>
 <5B61776302000078001D9C6A@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1810041431200.24936@sstabellini-ThinkPad-X260>
 <27f4a7e6-307e-8695-02ce-bd55a9edda28@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <27f4a7e6-307e-8695-02ce-bd55a9edda28@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOCAxMDoyNSBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEwLzA0LzIw
MTggMTA6NTIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gV2VkLCAxIEF1ZyAy
MDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDAxLjA4LjE4IGF0IDAxOjI4LCA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4gVG9kYXkgQ3RybC1BQUEgaXMgdXNlZCB0
byBzd2l0Y2ggYmV0d2VlbiBYZW4gYW5kIERvbTAuIEV4dGVuZCB0aGUKPj4+PiBtZWNoYW5pc20g
dG8gYWxsb3cgZm9yIHN3aXRjaGluZyBiZXR3ZWVuIFhlbiwgRG9tMCwgYW5kIGFueSBvZiB0aGUK
Pj4+PiBpbml0aWFsIERvbVUgY3JlYXRlZCBmcm9tIFhlbiBhbG9uZ3NpZGUgRG9tMCBvdXQgb2Yg
aW5mb3JtYXRpb24gCj4+Pj4gcHJvdmlkZWQKPj4+PiB2aWEgZGV2aWNlIHRyZWUuCj4+Pj4KPj4+
PiBSZW5hbWUgeGVuX3J4IHRvIGNvbnNvbGVfcnggdG8gbWF0Y2ggdGhlIG5ldyBiZWhhdmlvci4K
Pj4+Pgo+Pj4+IENsYXJpZnkgZXhpc3RpbmcgY29tbWVudCBhYm91dCAibm90aWZ5IHRoZSBndWVz
dCIsIG1ha2luZyBpdCBjbGVhciB0aGF0Cj4+Pj4gaXQgaXMgb25seSBhYm91dCB0aGUgaGFyZHdh
cmUgZG9tYWluLgo+Pj4+Cj4+Pj4gRXhwb3J0IGEgZnVuY3Rpb24gbmFtZWQgY29uc29sZV9pbnB1
dF9kb21haW4oKSB0byBhbGxvdyBvdGhlcnMgdG8ga25vdwo+Pj4+IHdoaWNoIGRvbWFpbnMgaGFz
IGlucHV0IGF0IGEgZ2l2ZW4gdGltZS4KPj4+Cj4+PiBBcyBhbHdheXMgaW4gc3VjaCBjYXNlcyBJ
IGRvbid0IHRoaW5rIHN1Y2ggZnVuY3Rpb25zIHNob3VsZCBiZSBhZGRlZAo+Pj4gd2l0aG91dCBh
bnkgY2FsbGVyLgo+Pgo+PiBJJ2xsIGFkZCBjb25zb2xlX2lucHV0X2RvbWFpbiB3aXRoaW4gYW4g
I2lmIDAgYW5kIHJlbW92ZSB0aGUgI2lmIDAgaW4KPj4gdGhlIGZvbGxvd2luZyBwYXRjaC4gSWYg
eW91IGFyZSBPSyB3aXRoIGl0LCB0aGUgdHdvIHBhdGNoZXMgY2FuIGJlCj4+IG1lcmdlZCBvbiBj
b21taXQgKEp1bGllbiBhbHJlYWR5IGFncmVlZCB0byBpdC4pIFRoZXkgYXJlIHNlcGFyYXRlIG9u
bHkKPj4gdG8gbWFrZSB0aGVtIGVhc2llciB0byByZXZpZXcuCj4gCj4gV2hpY2ggdHdvIHBhdGNo
ZXM/IEkgYWdyZWVkIHRvIG1lcmdlICMyNCBhbmQgIzIyLiBOb3QgIzIzLiBNZXJnaW5nIHRoZSAz
IAo+IG9mIHRoZW0gaXMgZ29pbmcgdG8gbWFrZSBhIG1hc3NpdmUgcGF0Y2ggd2hpY2ggaXMgbm90
IGdvaW5nIHRvIGhlbHAgCj4gdW5kZXJzdGFuZCBwYXRjaGVzIGFmdGVyIHRoZXkgZ2V0IG1lcmdl
ZC4KClRoaW5raW5nIGEgYml0IG1vcmUuIFdoeSBkb2VzIGl0IG5lZWQgdG8gYmUgdW5kZXIgI2lm
IDAgYW5kIHRoZW4gbWVyZ2luZyAKdGhlIDIgcGF0Y2hlcz8gVGhlcmUgYXJlIG5vdGhpbmcgcHJl
dmVudCBhIDIgbGluZSBmdW5jdGlvbiB0byBiZSBtb3ZlZCAKZnJvbSBvbmUgcGF0Y2ggdG8gYW5v
dGhlci4KCkNoZWVycy4KCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
