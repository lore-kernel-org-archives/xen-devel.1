From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v8 02/11] arm: make it possible to disable
 HAS_GICV3
Date: Tue, 31 Jul 2018 12:07:44 +0100
Message-ID: <ef8af26e-1db4-0479-a0a9-131dbb120b73@arm.com>
References: <alpine.DEB.2.10.1807301042060.20701@sstabellini-ThinkPad-X260>
 <1532972912-12439-2-git-send-email-sstabellini@kernel.org>
 <5B60180602000078001D9427@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B60180602000078001D9427@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMzEvMDcvMTggMDk6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMw
LjA3LjE4IGF0IDE5OjQ4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+IFRvZGF5
IGl0IGlzIGEgc2lsZW50IG9wdGlvbi4gVGhpcyBwYXRjaCBhZGRzIGEgb25lIGxpbmUgZGVzY3Jp
cHRpb24gYW5kCj4+IG1ha2VzIGl0IG9wdGlvbmFsLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4+IEFja2VkLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiBDQzogR2VvcmdlLkR1bmxhcEBldS5j
aXRyaXguY29tCj4+IENDOiBJYW4uSmFja3NvbkBldS5jaXRyaXguY29tCj4+IENDOiBqYmV1bGlj
aEBzdXNlLmNvbQo+PiBDQzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQo+IAo+IEkgY29udGlu
dWUgdG8gbm90IHVuZGVyc3RhbmQgd2h5IEknbSBiZWluZyBDYy1lZCBoZXJlLiBOb3cgc2luY2Ug
SQo+IGFtLCAuLi4KPiAKPj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcKPj4gKysrIGIveGVu
L2FyY2gvYXJtL0tjb25maWcKPj4gQEAgLTEyLDcgKzEyLDYgQEAgY29uZmlnIEFSTV8zMgo+PiAg
IGNvbmZpZyBBUk1fNjQKPj4gICAJZGVmX2Jvb2wgeQo+PiAgIAlkZXBlbmRzIG9uIDY0QklUCj4+
IC0Jc2VsZWN0IEhBU19HSUNWMwo+PiAgIAo+PiAgIGNvbmZpZyBBUk0KPj4gICAJZGVmX2Jvb2wg
eQo+PiBAQCAtNDIsNiArNDEsMTMgQEAgY29uZmlnIEFDUEkKPj4gICAKPj4gICBjb25maWcgSEFT
X0dJQ1YzCj4+ICAgCWJvb2wKPj4gKwlwcm9tcHQgIkdJQ3YzIGRyaXZlciIKPiAKPiAuLi4gd2h5
IGlzIHRoaXMgbm90IHNpbXBseQo+IAo+IGNvbmZpZyBIQVNfR0lDVjMKPiAJYm9vbCAiR0lDdjMg
ZHJpdmVyIgo+IAo+ID8KCkkgY2FuIGZpeCB0aGF0IG9uIGNvbW1pdC4KCkNoZWVycywKCj4gCj4g
SmFuCj4gCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
