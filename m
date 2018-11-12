From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Mon, 12 Nov 2018 05:45:19 -0700
Message-ID: <5BE975DF02000078001FAF91@prv1-mh.provo.novell.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <5BE9672802000078001FAD79@prv1-mh.provo.novell.com>
 <CAKPH-NjKU6KvU7ZaQUXuaKYFBgKqCNO0uW2Rn2K8YVEtbew8mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NjKU6KvU7ZaQUXuaKYFBgKqCNO0uW2Rn2K8YVEtbew8mg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: mirela.simonovic@aggios.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, dm@aggios.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen Devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, stefano.stabellini@xilinx.com, saeed.nowshadi@xilinx.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjExLjE4IGF0IDEyOjUwLCA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPiB3
cm90ZToKPiBXaGF0PwoKUGxlYXNlIGRvbid0IHRvcCBwb3N0LgoKPiBPbiBNb24sIE5vdiAxMiwg
MjAxOCBhdCAxMjo0MiBQTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+
IAo+PiA+Pj4gT24gMTIuMTEuMTggYXQgMTI6MzAsIDxtaXJlbGEuc2ltb25vdmljQGFnZ2lvcy5j
b20+IHdyb3RlOgo+PiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+ID4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4gPiBAQCAtMjQsNiArMjQsNyBAQAo+PiA+ICAjaW5j
bHVkZSA8eGVuL3dhaXQuaD4KPj4gPiAgI2luY2x1ZGUgPHB1YmxpYy94ZW4uaD4KPj4gPiAgI2lu
Y2x1ZGUgPHB1YmxpYy9kb21jdGwuaD4KPj4gPiArI2luY2x1ZGUgPHB1YmxpYy9zY2hlZC5oPgo+
PiA+ICAjaW5jbHVkZSA8cHVibGljL3N5c2N0bC5oPgo+PiA+ICAjaW5jbHVkZSA8cHVibGljL3Zj
cHUuaD4KPj4gPiAgI2luY2x1ZGUgPHB1YmxpYy92bV9ldmVudC5oPgo+Pgo+PiBXaHk/CgpJIHRo
aW5rIGdpdmVuIHRoZSBjb250ZXh0IHRoZSBxdWVzdGlvbiwgZXZlbiBpZiB0ZXJzZSwgaXMgcHJl
dHR5CmNsZWFyOiBXaHkgZG8geW91IGFkZCB0aGlzICNpbmNsdWRlIGFzIHRoZSBvbmx5IGNoYW5n
ZSBpbiB0aGlzCmhlYWRlcj8gTm90aGluZyBpbiB0aGUgaGVhZGVyIHByZXZpb3VzbHkgcmVxdWly
ZWQgaXQsIGFuZCBpZgp5b3UgaGF2ZSBhIHN1ZGRlbiBuZXcgcmVxdWlyZW1lbnQgZWxzZXdoZXJl
LCB0aGVuIHBsZWFzZQppbmNsdWRlIHRoZSBleHRyYSBoZWFkZXIganVzdCB0aGVyZS4KCkFsc28g
cGxlYXNlIGFjY2VwdCB0aGF0IGdpdmVuIHRoZSBhbW91bnQgb2YgdGltZSBuZWVkZWQgdG8KZGVh
bCB3aXRoIGluY29taW5nIHBhdGNoZXMsIGl0IGlzIG5vdCBnZW5lcmFsbHkgc2NhbGFibGUgdG8K
YWx3YXlzIGdpdmUgbG9uZyBleHBsYW5hdGlvbnMgdG8gd2hhdCBzZWVtcyBwcmV0dHkgb2J2aW91
cwphbnl3YXkuIChJIGRvIHJlYWxpemUgdGhhdCAib2J2aW91cyIgaXMgYSByYXRoZXIgc3ViamVj
dGl2ZQphdHRyaWJ1dGUgdG8gdGhpbmdzLikKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
