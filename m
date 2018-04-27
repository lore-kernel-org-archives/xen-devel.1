From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RESEND v1 1/7] x86: add a flag to enable
 Intel processor trace
Date: Fri, 27 Apr 2018 07:03:33 -0600
Message-ID: <5AE31FA502000078001BF1F8@prv1-mh.provo.novell.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-2-git-send-email-luwei.kang@intel.com>
 <20180426120909.6miciqgzuvxfxpyy@citrix.com>
 <82D7661F83C1A047AF7DC287873BF1E167F67364@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E167F67364@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luwei Kang <luwei.kang@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjA0LjE4IGF0IDEwOjIyLCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
PiA+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+PiA+
IGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24KPj4gPiBpbmRleCA3ODExMTBk
Li45NTQxMWNmIDEwMDY0NAo+PiA+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1h
cmtkb3duCj4+ID4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24KPj4g
PiBAQCAtMTAwOSw2ICsxMDA5LDEzIEBAIGRlYnVnIGh5cGVydmlzb3Igb25seSkuCj4+ID4gICMj
IyBpZGxlXF9sYXRlbmN5XF9mYWN0b3IKPj4gPiAgPiBgPSA8aW50ZWdlcj5gCj4+ID4KPj4gPiAr
IyMjIGludGVsXF9wdAo+PiA+ICs+IGA9IDxib29sZWFuPmAKPj4gPiArCj4+ID4gKz4gRGVmYXVs
dDogYHRydWVgCj4+ID4gKwo+PiAKPj4gQWZ0ZXIgcmVhZGluZyB0aGUgbWFudWFsIGEgYml0IEkg
dGhpbmsgdGhpcyBvcHRpb24gbmVlZHMgdG8gYmUgbW9yZQo+PiBzb3BoaXN0aWNhdGVkLgo+PiAK
Pj4gVGhlIHNlcmllcyBvbmx5IGltcGxlbWVudHMgZ3Vlc3Qtb25seSB0cmFjaW5nLCB3aGlsZSBp
biB0aGUgZnV0dXJlIHdlIG1pZ2h0Cj4+IHdhbnQgaG9zdC1vbmx5IHRyYWNpbmcgYW5kIHN5c3Rl
bSB3aWRlIHRyYWNpbmcuCj4+IAo+PiBFdmVuIHRoZSBvdGhlciBtb2RlcyBhcmVuJ3QgaW1wbGVt
ZW50ZWQgeWV0IHdlIHNob3VsZCBsZWF2ZSByb29tIGZvcgo+PiB0aGVtLgo+PiAKPiAKPiBIaSBX
ZWksCj4gICAgICBUaGFua3MgZm9yIHRoZSByZXZpZXcuIFNvIHdoYXQgYWJvdXQgZGVmaW5lIGd1
ZXN0IG1vZGUgbGlrZSB0aGlzIGFuZCAKPiBtYWtlIHRoZSBvcHRpb24gYXMgYSBzdHJpbmcuIE90
aGVyIG1vZGUgY2FuIGJlIGFkZGVkIGxpa2UgJ3N5c3RlbSB8IGhvc3QnIGluIAo+IGZ1dHVyZS4K
PiAKPiAjIyMgSW50ZWxcX3B0Cj4+IGA9IGd1ZXN0YAoKVGhhdCdzIHN0aWxsIHRvbyBzaW1wbGUs
IGFzIHlvdSBpbXBsZW1lbnQgaXQgZm9yIEhWTSBvbmx5LiBXaGlsZSBpdCdzIG5vdCBjbGVhcgp0
byBtZSB3aGV0aGVyIGl0IGNvdWxkIGJlIGRvbmUgcHJvcGVybHkgZm9yIFBWLCB0aGF0IHBhdGgg
c2hvdWxkbid0IGJlIGNsb3NlZAp1bmxlc3MgaXQncyBjcnlzdGFsIGNsZWFyIHRoYXQgaXQncyBp
bXBvc3NpYmxlIHRvIGV2ZXIgaGFwcGVuLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
