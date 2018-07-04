From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 06/10] x86: Introduce a new function to
 get capability of Intel PT
Date: Wed, 04 Jul 2018 03:09:03 -0600
Message-ID: <5B3C8EAF02000078001D0EB4@prv1-mh.provo.novell.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-7-git-send-email-luwei.kang@intel.com>
 <5B3643A002000078001CF391@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E1680481D9@SHSMSX101.ccr.corp.intel.com>
 <5B3B676B02000078001D0469@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E16805D910@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E16805D910@SHSMSX101.ccr.corp.intel.com>
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
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA3LjE4IGF0IDEwOjQ4LCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
PiA+PiA+ICsjZGVmaW5lIElQVF9DQVAoX24sIF9sLCBfciwgX20pICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPj4gPj4gPiArICAgIFtJUFRfQ0FQXyAjIyBfbl0gPSB7IC5uYW1lID0g
X19zdHJpbmdpZnkoX24pLCAubGVhZiA9IF9sLCBcCj4+ID4+ID4gKyAgICAgICAgLnJlZyA9IF9y
LCAubWFzayA9IF9tIH0KPj4gPj4gPiArCj4+ID4+ID4gK3N0YXRpYyBzdHJ1Y3QgaXB0X2NhcF9k
ZXNjIHsKPj4gPj4gPiArICAgIGNvbnN0IGNoYXIgICAgKm5hbWU7Cj4+ID4+ID4gKyAgICB1bnNp
Z25lZCBpbnQgIGxlYWY7Cj4+ID4+ID4gKyAgICB1bnNpZ25lZCBjaGFyIHJlZzsKPj4gPj4KPj4g
Pj4gSSBkb24ndCB0aGluayBsZWFmIG5lZWRzIHRvIGJlIGZ1bGwgMzIgYml0cyB3aWRlPyBPbmNl
IHNocnVuayBieSBhdAo+PiA+PiBsZWFzdCB0d28gYml0cywgdGhlIHNpemUgb2YgdGhlIG92ZXJh
bGwgc3RydWN0dXJlIGNvdWxkIGdvIGRvd24gZnJvbSAyNCB0byAxNiBieXRlcy4KPj4gPgo+PiA+
IE9LLCB3aWxsIGNoYW5nZSBpdCBmcm9tICIgdW5zaWduZWQgaW50ICAiIHRvICJ1bnNpbmdlZCBj
aGFyIi4KPj4gCj4+IEknZCBwcmVmZXIgaWYgeW91IHVzZWQgYml0IGZpZWxkcywgYXMgd2FzIG1l
YW50IHRvIGJlIGltcGxpZWQgYnkgbXkgcmVwbHkuCj4gCj4gbGlrZSB0aGlzPyBJZiB0d28gYml0
cyBpcyB0b28gZmV3IGZvciAibGVhZiI/Cj4gCj4gc3RhdGljIGNvbnN0IHN0cnVjdCBpcHRfY2Fw
X2Rlc2Mgewo+ICAgICBjb25zdCBjaGFyICAgICpuYW1lOwo+ICAgICB1bnNpZ25lZCBjaGFyIGxl
YWY6MjsKPiAgICAgdW5zaWduZWQgY2hhciByZWc6MjsKPiAgICAgdW5zaW5nZWQgaW50IG1hc2s7
Cj4gfQoKWWVzLiBBcyBzdWdnZXN0ZWQgYmVmb3JlIEknZCB1c2UgbW9yZSBiaXRzIGZvciBsZWFm
LCB0byBhdm9pZCB0aGlzCm5lZWRpbmcgdG8gY2hhbmdlIGltbWVkaWF0ZWx5IG9uY2UgYSBuZXcg
bGVhZiBiZWNvbWVzIGtub3duLgpBZnRlciBhbGwgdGhlIGdvYWwgaXMgb25seSB0byBoYXZlIGxl
YWYgYW5kIHJlZyB0b2dldGhlciBmaXQgaW4gMzIKYml0cy4gTWFraW5nIGxlYWYgOCBiaXRzIHdp
ZGUgZm9yIG5vdyB3b3VsZCBsaWtlbHkgaGVscCBnZW5lcmF0ZWQKY29kZS4gQW5kIHBsZWFzZSBk
b24ndCB1c2UgdW5zaWduZWQgY2hhciBpbiBjYXNlcyBsaWtlIHRoaXMgd2hlcmUKeW91IGRvbid0
IHJlYWxseSBuZWVkIHRoZSBtb3JlIG5hcnJvdyB0eXBlIC0gYmUgYXMgY2xvc2UgdG8gd2hhdAp0
aGUgc3RhbmRhcmQgYWxsb3dzIHdpdGhvdXQgZXh0ZW5zaW9ucyBhcyBwb3NzaWJsZTsgSU9XCnVu
c2lnbmVkIGludCBoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
