From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
Date: Mon, 20 May 2019 18:20:37 +0100
Message-ID: <8d3413cd-1440-b18a-7d3f-fd8ad283de06@arm.com>
References: <20190520171315.12026-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSlxq-0000VR-M4
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 17:20:42 +0000
In-Reply-To: <20190520171315.12026-1-alistair.francis@wdc.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com, andrew.cooper3@citrix.com, alistair23@gmail.com
List-Id: xen-devel@lists.xenproject.org

SGkgQWxpc3RhaXIsCgpPbiAyMC8wNS8yMDE5IDE4OjEzLCBBbGlzdGFpciBGcmFuY2lzIHdyb3Rl
Ogo+IE1ha2UgdGhlIGFzbS92cGwwMTEuaCBkZXBlbmRlbnQgb24gdGhlIENPTkZJR19TQlNBX1ZV
QVJUX0NPTlNPTEUgZGVmaW5lLgoKWW91ciBjb21taXQgbWVzc2FnZSB3YW50cyBhIGJpdCBtb3Jl
IGV4cGxhbmF0aW9uLiBJbiB0aGlzIGNhc2UsIHlvdSB3YW50IHRvIHNheSAKdGhlIG9ubHkgdXNl
ciBvZiB0aGlzIGluY2x1ZGUgaXMgcHJvdGVjdGVkIGJ5IENPTkZJR19TQlNBX1ZVQVJUX0NPTlNP
TEUsIGhlbmNlIAppdCBtYWtlcyBzZW5zZSB0byBwcm90ZWN0IGl0IHdpdGggdGhlIHNhbWUgZGVm
aW5lLgoKVGhlIHRpdGxlIHdvdWxkIG5lZWQgdG8gYmUgdXBkYXRlZCBhcyB3ZWxsLgoKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+
Cj4gLS0tCj4gICB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDIgKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4g
aW5kZXggOWJiY2IwZjU3YS4uMjQyODdlNTljYiAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9j
aGFyL2NvbnNvbGUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4gQEAgLTM2
LDcgKzM2LDcgQEAKPiAgICNpZmRlZiBDT05GSUdfWDg2Cj4gICAjaW5jbHVkZSA8eGVuL2NvbnNv
bGVkLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Cj4gLSNlbHNlCj4gKyNlbGlmIENPTkZJ
R19TQlNBX1ZVQVJUX0NPTlNPTEUKPiAgICNpbmNsdWRlIDxhc20vdnBsMDExLmg+Cj4gICAjZW5k
aWYKClRoaXMgaXMgYSBiaXQgb2RkcyB0byByZXF1aXJlICFDT05GSUdfWDg2ICYmIENPTkZJR19T
QlNBX1ZVQVJUX0NPTlNPTEUgYnV0IHRoZSAKY29kZSBpcyBvbmx5IHByb3RlY3RlZCB3aXRoIHRo
ZSBzZWNvbmQgcGFydC4KCkhvdyBhYm91dDoKCiNlbmRpZgojaWZkZWYgQ09ORklHX1NCU0FfVlVB
UlRfQ09OU09MRQouLi4KI2VuZGlmCgo/CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
