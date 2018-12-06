From: Ross Philipson <ross.philipson@oracle.com>
Subject: Re: [GRUB PATCH 1/2] verifiers: Xen fallout cleanup
Date: Thu, 6 Dec 2018 10:41:59 -0500
Message-ID: <179bbc6d-8c2b-8c42-6430-5057430cce49@oracle.com>
References: <20181206134033.19884-1-daniel.kiper@oracle.com>
 <20181206134033.19884-2-daniel.kiper@oracle.com>
 <794ff5c1-2ccd-ace9-3c41-c7b6c08c198e@oracle.com>
 <20181206154035.iuqtozijvnt5u5nb@tomti.i.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pab=OP=oracle.com=ross.philipson@srs-us1.protection.inumbo.net>)
 id 1gUvnP-0002VC-NS
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 15:42:35 +0000
In-Reply-To: <20181206154035.iuqtozijvnt5u5nb@tomti.i.net-space.pl>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: grub-devel@gnu.org, phcoder@gmail.com, xudong.hao@intel.com, farrah.chen@intel.com, julien.grall@arm.com, leif.lindholm@linaro.org, xen-devel@lists.xenproject.org, lee.jones@linaro.org, fu.wei@linaro.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDYvMjAxOCAxMDo0MCBBTSwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+IE9uIFRodSwgRGVj
IDA2LCAyMDE4IGF0IDEwOjM3OjQzQU0gLTA1MDAsIFJvc3MgUGhpbGlwc29uIHdyb3RlOgo+PiBP
biAxMi8wNi8yMDE4IDA4OjQwIEFNLCBEYW5pZWwgS2lwZXIgd3JvdGU6Cj4+PiBYZW4gZmFsbG91
dCBjbGVhbnVwIGFmdGVyIGNvbW1pdCBjYTBhNGY2ODkgKHZlcmlmaWVyczogRmlsZSB0eXBlIGZv
cgo+Pj4gZmluZS1ncmFpbmVkIHNpZ25hdHVyZS12ZXJpZmljYXRpb24gY29udHJvbGxpbmcpLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBLaXBlciA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5j
b20+Cj4+PiAtLS0KPj4+ICBncnViLWNvcmUvbG9hZGVyL2kzODYveGVuLmMgfCAxNCArKysrKysr
LS0tLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2dydWItY29yZS9sb2FkZXIvaTM4Ni94ZW4uYyBiL2dy
dWItY29yZS9sb2FkZXIvaTM4Ni94ZW4uYwo+Pj4gaW5kZXggMWE5OWNhNzJjLi44ZjY2MmM4YWMg
MTAwNjQ0Cj4+PiAtLS0gYS9ncnViLWNvcmUvbG9hZGVyL2kzODYveGVuLmMKPj4+ICsrKyBiL2dy
dWItY29yZS9sb2FkZXIvaTM4Ni94ZW4uYwo+Pj4gQEAgLTY0NSwxMCArNjQ1LDEwIEBAIGdydWJf
Y21kX3hlbiAoZ3J1Yl9jb21tYW5kX3QgY21kIF9fYXR0cmlidXRlX18gKCh1bnVzZWQpKSwKPj4+
Cj4+PiAgICBncnViX3hlbl9yZXNldCAoKTsKPj4+Cj4+PiAtICBncnViX2NyZWF0ZV9sb2FkZXJf
Y21kbGluZSAoYXJnYyAtIDEsIGFyZ3YgKyAxLAo+Pj4gLQkJCSAgICAgIChjaGFyICopIHhlbl9z
dGF0ZS5uZXh0X3N0YXJ0LmNtZF9saW5lLAo+Pj4gLQkJCSAgICAgIHNpemVvZiAoeGVuX3N0YXRl
Lm5leHRfc3RhcnQuY21kX2xpbmUpIC0gMSk7Cj4+PiAtICBlcnIgPSBncnViX3ZlcmlmeV9zdHJp
bmcgKHhlbl9zdGF0ZS5uZXh0X3N0YXJ0LmNtZF9saW5lLCBHUlVCX1ZFUklGWV9NT0RVTEVfQ01E
TElORSk7Cj4+PiArICBlcnIgPSBncnViX2NyZWF0ZV9sb2FkZXJfY21kbGluZSAoYXJnYyAtIDEs
IGFyZ3YgKyAxLAo+Pj4gKwkJCQkgICAgKGNoYXIgKikgeGVuX3N0YXRlLm5leHRfc3RhcnQuY21k
X2xpbmUsCj4+PiArCQkJCSAgICBzaXplb2YgKHhlbl9zdGF0ZS5uZXh0X3N0YXJ0LmNtZF9saW5l
KSAtIDEsCj4+PiArCQkJCSAgICBHUlVCX1ZFUklGWV9LRVJORUxfQ01ETElORSk7Cj4+Cj4+IEhv
dyBkaWQgdGhpcyBjb21waWxlIHByZXZpb3VzbHkgaWYgeW91IHdlcmUgbWlzc2luZyBhbiBhcmd1
bWVudCB0bwo+PiBncnViX2NyZWF0ZV9sb2FkZXJfY21kbGluZT8KPiAKPiBUaGlzIGlzIG9ubHkg
YnVpbGQgaWYgeGVuIHBsYXRmb3JtIGlzIGVuYWJsZWQuIE90aGVyd2lzZSB0aGlzIGZpbGUgaXMK
PiBub3QgdXNlZC4KCkFjaywgdGhhdCBpcyB3aGF0IEkgd2FzIHN0YXJ0aW5nIHRvIGd1ZXNzIGhh
cHBlbmVkLiBGb3IgdGhlIHNlcmllczoKClJldmlld2VkLWJ5OiBSb3NzIFBoaWxpcHNvbiA8cm9z
cy5waGlsaXBzb25Ab3JhY2xlLmNvbT4KCj4gCj4gRGFuaWVsCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
