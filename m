From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 for-4.12] arm/p2m: call iommu iotlb flush
 if iommu exists and enabled
Date: Wed, 23 Jan 2019 12:53:50 +0000
Message-ID: <802fe221e14a4e08a4a7cc47989f13c4@AMSPEX02CL03.citrite.net>
References: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TXmL=P7=citrix.com=prvs=919de7af8=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gmI2j-0000Qe-FO
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 12:54:09 +0000
In-Reply-To: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Andrii Anisov' <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFuZHJpaSBBbmlzb3YgW21haWx0
bzphbmRyaWkuYW5pc292QGdtYWlsLmNvbV0KPiBTZW50OiAyMyBKYW51YXJ5IDIwMTkgMTI6NTAK
PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gQ2M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkKPiA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBKdWVy
Z2VuCj4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+Cj4gU3ViamVjdDogW1BBVENIIHYyIGZvci00LjEyXSBhcm0vcDJtOiBjYWxs
IGlvbW11IGlvdGxiIGZsdXNoIGlmIGlvbW11Cj4gZXhpc3RzIGFuZCBlbmFibGVkCj4gCj4gRnJv
bTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiAKPiBUYWtpbmcgZGVj
aXNpb24gYnkgYG5lZWRfaW9tbXVfcHRfc3luYygpYCBtYWtlIHVzIG5ldmVyIGtpY2tpbmcKPiBg
aW9tbXVfaW90bGJfZmx1c2goKWAgZm9yIElPTU1VcyB3aGljaCBkbyBzaGFyZSBQMk0gd2l0aCBD
UFUuCj4gU28gY2hlY2sgYGhhc19pb21tdV9wdCgpYCBpbnN0ZWFkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgpSZXZpZXdlZC1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCj4gLS0tCj4gQ2hhbmdlcyBp
biB2MjoKPiAgICAgRml4ZWQgYSBtaXNzcHJpbnQgYW5kIGEgbml0IGluIGEgY29tbWl0IG1lc3Nh
Z2UKPiAKPiAgeGVuL2FyY2gvYXJtL3AybS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jCj4gaW5kZXggMjM5NGY5Ny4uMDU5YTM5MSAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vcDJtLmMK
PiBAQCAtMTAxOSw3ICsxMDE5LDcgQEAgc3RhdGljIGludCBfX3AybV9zZXRfZW50cnkoc3RydWN0
IHAybV9kb21haW4gKnAybSwKPiAgICAgICAgICAgIW1mbl9lcShscGFlX2dldF9tZm4oKmVudHJ5
KSwgbHBhZV9nZXRfbWZuKG9yaWdfcHRlKSkgKQo+ICAgICAgICAgIHAybV9mcmVlX2VudHJ5KHAy
bSwgb3JpZ19wdGUsIGxldmVsKTsKPiAKPiAtICAgIGlmICggbmVlZF9pb21tdV9wdF9zeW5jKHAy
bS0+ZG9tYWluKSAmJgo+ICsgICAgaWYgKCBoYXNfaW9tbXVfcHQocDJtLT5kb21haW4pICYmCj4g
ICAgICAgICAgIChscGFlX2lzX3ZhbGlkKG9yaWdfcHRlKSB8fCBscGFlX2lzX3ZhbGlkKCplbnRy
eSkpICkKPiAgICAgIHsKPiAgICAgICAgICB1bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPSAwOwo+
IC0tCj4gMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
