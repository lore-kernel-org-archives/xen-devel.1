From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 02/10] arm: make it possible to disable
 HAS_GICV3
Date: Tue, 29 May 2018 14:38:20 +0100
Message-ID: <2f627e98-072e-44c5-b118-b97ee9243145@arm.com>
References: <alpine.DEB.2.10.1805221719560.24793@sstabellini-ThinkPad-X260>
 <1527035108-15051-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527035108-15051-2-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, dfaggioli@suse.com, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMy8wNS8xOCAwMToyNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IFRvZGF5IGl0
IGlzIGEgc2lsZW50IG9wdGlvbi4gVGhpcyBwYXRjaCBhZGRzIGEgb25lIGxpbmUgZGVzY3JpcHRp
b24gYW5kCj4gbWFrZXMgaXQgb3B0aW9uYWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cgo+IAo+IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4gLSBy
ZW1vdmUgYW55IGNoYW5nZXMgdG8gTUVNX0FDQ0VTUwo+IC0gdXBkYXRlIGNvbW1pdCBtZXNzYWdl
Cj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIG1ha2UgSEFTX0dJQ3YzIGRlcGVuZCBvbiBBUk1fNjQK
PiAtIHJlbW92ZSBtb2RpZmljYXRpb25zIHRvIEFSTV9IRExDRCBrY29uZmlnLCBpdCBoYXMgYmVl
biByZW1vdmVkCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vS2NvbmZpZyB8IDggKysrKysrKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZwo+IGlu
ZGV4IDRkYzdlZjUuLmZiNjlhNjYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcK
PiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZwo+IEBAIC0xMiw3ICsxMiw2IEBAIGNvbmZpZyBB
Uk1fMzIKPiAgIGNvbmZpZyBBUk1fNjQKPiAgIAlkZWZfYm9vbCB5Cj4gICAJZGVwZW5kcyBvbiA2
NEJJVAo+IC0Jc2VsZWN0IEhBU19HSUNWMwo+ICAgCj4gICBjb25maWcgQVJNCj4gICAJZGVmX2Jv
b2wgeQo+IEBAIC00Miw2ICs0MSwxMyBAQCBjb25maWcgQUNQSQo+ICAgCj4gICBjb25maWcgSEFT
X0dJQ1YzCj4gICAJYm9vbAo+ICsJcHJvbXB0ICJHSUN2MyBkcml2ZXIiCj4gKwlkZXBlbmRzIG9u
IEFSTV82NAo+ICsJZGVmYXVsdCB5Cj4gKwktLS1oZWxwLS0tCj4gKwo+ICsJICBEcml2ZXIgZm9y
IHRoZSBBUk0gR2VuZXJpYyBJbnRlcnJ1cHQgQ29udHJvbGxlciB2My4KPiArCSAgSWYgdW5zdXJl
LCBzYXkgWQo+ICAgCj4gICBjb25maWcgSEFTX0lUUwo+ICAgICAgICAgICBib29sCj4gCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
