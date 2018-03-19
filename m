From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 13/45] ARM: vPL011: Use the VGIC's level
 triggered IRQs handling if available
Date: Mon, 19 Mar 2018 10:59:34 +0000
Message-ID: <d25aafd5-e1a9-b27a-aef7-94d09135bdd9@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-14-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exl1p-0001qh-P7
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 03:00:05 +0000
In-Reply-To: <20180315203050.19791-14-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8xNS8yMDE4IDA4OjMwIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBUaGUgZW11bGF0ZWQgQVJNIFNCU0EgVUFSVCBpcyB1c2luZyBsZXZlbCB0cmlnZ2VyZWQgSVJR
IHNlbWFudGljcywKPiBob3dldmVyIHRoZSBjdXJyZW50IFZHSUMgY2FuIG9ubHkgaGFuZGxlIGVk
Z2UgdHJpZ2dlcmVkIElSUXMsIHJlYWxseS4KPiBEaXNhYmxlIHRoZSBleGlzdGluZyB3b3JrYXJv
dW5kIGZvciB0aGlzIHByb2JsZW0gaW4gY2FzZSB3ZSBoYXZlIHRoZQo+IG5ldyBWR0lDIGluIHBs
YWNlLCB3aGljaCBjYW4gcHJvcGVybHkgaGFuZGxlIGxldmVsIHRyaWdnZXJlZCBJUlFzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3Jn
PgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVl
cnMsCgo+IC0tLQo+IENoYW5nZWxvZyB2MSAuLi4gdjI6Cj4gLSByZW1vdmUgdW5uZWVkZWQgIiEh
Igo+IAo+ICAgeGVuL2FyY2gvYXJtL3ZwbDAxMS5jIHwgNCArKysrCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cGwwMTEu
YyBiL3hlbi9hcmNoL2FybS92cGwwMTEuYwo+IGluZGV4IDVkY2Y0YmVjMTguLmEyODFlYWJkN2Ug
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZwbDAxMS5jCj4gKysrIGIveGVuL2FyY2gvYXJt
L3ZwbDAxMS5jCj4gQEAgLTU0LDYgKzU0LDcgQEAgc3RhdGljIHZvaWQgdnBsMDExX3VwZGF0ZV9p
bnRlcnJ1cHRfc3RhdHVzKHN0cnVjdCBkb21haW4gKmQpCj4gICAgICAgICovCj4gICAgICAgQVNT
RVJUKHNwaW5faXNfbG9ja2VkKCZ2cGwwMTEtPmxvY2spKTsKPiAgIAo+ICsjaWZuZGVmIENPTkZJ
R19ORVdfVkdJQwo+ICAgICAgIC8qCj4gICAgICAgICogVE9ETzogUEwwMTEgaW50ZXJydXB0cyBh
cmUgbGV2ZWwgdHJpZ2dlcmVkIHdoaWNoIG1lYW5zCj4gICAgICAgICogdGhhdCBpbnRlcnJ1cHQg
bmVlZHMgdG8gYmUgc2V0L2NsZWFyIGluc3RlYWQgb2YgYmVpbmcKPiBAQCAtNzEsNiArNzIsOSBA
QCBzdGF0aWMgdm9pZCB2cGwwMTFfdXBkYXRlX2ludGVycnVwdF9zdGF0dXMoc3RydWN0IGRvbWFp
biAqZCkKPiAgICAgICAgICAgdmdpY19pbmplY3RfaXJxKGQsIE5VTEwsIEdVRVNUX1ZQTDAxMV9T
UEksIHRydWUpOwo+ICAgCj4gICAgICAgdnBsMDExLT5zaGFkb3dfdWFydG1pcyA9IHVhcnRtaXM7
Cj4gKyNlbHNlCj4gKyAgICB2Z2ljX2luamVjdF9pcnEoZCwgTlVMTCwgR1VFU1RfVlBMMDExX1NQ
SSwgdWFydG1pcyk7Cj4gKyNlbmRpZgo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdWludDhfdCB2cGww
MTFfcmVhZF9kYXRhKHN0cnVjdCBkb21haW4gKmQpCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
