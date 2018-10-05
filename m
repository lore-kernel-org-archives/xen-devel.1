From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 23/25] xen: support console_switching
 between Dom0 and DomUs on ARM
Date: Fri, 5 Oct 2018 11:39:14 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1810051135220.24936@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807311623060.5781@sstabellini-ThinkPad-X260>
 <1533079688-9541-23-git-send-email-sstabellini@kernel.org>
 <5B61776302000078001D9C6A@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1810041431200.24936@sstabellini-ThinkPad-X260>
 <27f4a7e6-307e-8695-02ce-bd55a9edda28@arm.com>
 <e2d7c986-6f72-9ea1-6a84-e4191ae081ae@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e2d7c986-6f72-9ea1-6a84-e4191ae081ae@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <JBeulich@suse.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCA1IE9jdCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMTAvMDUvMjAxOCAx
MDoyNSBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gT24gMTAvMDQvMjAxOCAxMDo1MiBQTSwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiBPbiBXZWQsIDEgQXVnIDIwMTgsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIDAxLjA4LjE4IGF0IDAxOjI4LCA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiBUb2RheSBDdHJsLUFBQSBpcyB1c2Vk
IHRvIHN3aXRjaCBiZXR3ZWVuIFhlbiBhbmQgRG9tMC4gRXh0ZW5kIHRoZQo+ID4gPiA+ID4gbWVj
aGFuaXNtIHRvIGFsbG93IGZvciBzd2l0Y2hpbmcgYmV0d2VlbiBYZW4sIERvbTAsIGFuZCBhbnkg
b2YgdGhlCj4gPiA+ID4gPiBpbml0aWFsIERvbVUgY3JlYXRlZCBmcm9tIFhlbiBhbG9uZ3NpZGUg
RG9tMCBvdXQgb2YgaW5mb3JtYXRpb24KPiA+ID4gPiA+IHByb3ZpZGVkCj4gPiA+ID4gPiB2aWEg
ZGV2aWNlIHRyZWUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFJlbmFtZSB4ZW5fcnggdG8gY29uc29s
ZV9yeCB0byBtYXRjaCB0aGUgbmV3IGJlaGF2aW9yLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBDbGFy
aWZ5IGV4aXN0aW5nIGNvbW1lbnQgYWJvdXQgIm5vdGlmeSB0aGUgZ3Vlc3QiLCBtYWtpbmcgaXQg
Y2xlYXIKPiA+ID4gPiA+IHRoYXQKPiA+ID4gPiA+IGl0IGlzIG9ubHkgYWJvdXQgdGhlIGhhcmR3
YXJlIGRvbWFpbi4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gRXhwb3J0IGEgZnVuY3Rpb24gbmFtZWQg
Y29uc29sZV9pbnB1dF9kb21haW4oKSB0byBhbGxvdyBvdGhlcnMgdG8ga25vdwo+ID4gPiA+ID4g
d2hpY2ggZG9tYWlucyBoYXMgaW5wdXQgYXQgYSBnaXZlbiB0aW1lLgo+ID4gPiA+IAo+ID4gPiA+
IEFzIGFsd2F5cyBpbiBzdWNoIGNhc2VzIEkgZG9uJ3QgdGhpbmsgc3VjaCBmdW5jdGlvbnMgc2hv
dWxkIGJlIGFkZGVkCj4gPiA+ID4gd2l0aG91dCBhbnkgY2FsbGVyLgo+ID4gPiAKPiA+ID4gSSds
bCBhZGQgY29uc29sZV9pbnB1dF9kb21haW4gd2l0aGluIGFuICNpZiAwIGFuZCByZW1vdmUgdGhl
ICNpZiAwIGluCj4gPiA+IHRoZSBmb2xsb3dpbmcgcGF0Y2guIElmIHlvdSBhcmUgT0sgd2l0aCBp
dCwgdGhlIHR3byBwYXRjaGVzIGNhbiBiZQo+ID4gPiBtZXJnZWQgb24gY29tbWl0IChKdWxpZW4g
YWxyZWFkeSBhZ3JlZWQgdG8gaXQuKSBUaGV5IGFyZSBzZXBhcmF0ZSBvbmx5Cj4gPiA+IHRvIG1h
a2UgdGhlbSBlYXNpZXIgdG8gcmV2aWV3Lgo+ID4gCj4gPiBXaGljaCB0d28gcGF0Y2hlcz8gSSBh
Z3JlZWQgdG8gbWVyZ2UgIzI0IGFuZCAjMjIuIE5vdCAjMjMuIE1lcmdpbmcgdGhlIDMgb2YKPiA+
IHRoZW0gaXMgZ29pbmcgdG8gbWFrZSBhIG1hc3NpdmUgcGF0Y2ggd2hpY2ggaXMgbm90IGdvaW5n
IHRvIGhlbHAgdW5kZXJzdGFuZAo+ID4gcGF0Y2hlcyBhZnRlciB0aGV5IGdldCBtZXJnZWQuCj4g
Cj4gVGhpbmtpbmcgYSBiaXQgbW9yZS4gV2h5IGRvZXMgaXQgbmVlZCB0byBiZSB1bmRlciAjaWYg
MCBhbmQgdGhlbiBtZXJnaW5nIHRoZSAyCj4gcGF0Y2hlcz8gVGhlcmUgYXJlIG5vdGhpbmcgcHJl
dmVudCBhIDIgbGluZSBmdW5jdGlvbiB0byBiZSBtb3ZlZCBmcm9tIG9uZQo+IHBhdGNoIHRvIGFu
b3RoZXIuCgpJJ2xsIG1vdmUgY29uc29sZV9pbnB1dF9kb21haW4gdG8gdGhlIGZvbGxvd2luZyBw
YXRjaCAoIzI0KS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
