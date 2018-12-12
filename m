From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12] dt: fix integer check in
 dt_device_is_compatible
Date: Wed, 12 Dec 2018 16:25:27 +0000
Message-ID: <dac85357-c66f-29eb-6d01-b655250e1111@arm.com>
References: <1544553966-30776-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH0D=OV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gX7KF-0001zb-DO
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 16:25:31 +0000
In-Reply-To: <1544553966-30776-1-git-send-email-sstabellini@kernel.org>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDExLzEyLzIwMTggMTg6NDYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBjcGxlbiBpcyB1bnNpZ25lZCwgdGh1cywgaXQgY2FuIG5ldmVyIGJlIDwgMC4gVXNlIGEg
c2lnbmVkIGludGVnZXIgbG9jYWwKPiB2YXJpYWJsZSBpbnN0ZWFkLgoKVGhlIGN1cnJlbnQgY29k
ZSBjaGVja3MgPiAwLiBMb29raW5nIGF0IHRoZSBjb2RlIEkgZG9uJ3QgdGhpbmsgaXQgY2FuIGV2
ZXIgYmUgCm5lZ2F0aXZlLiBTbyBjYW4geW91IGRldGFpbHMgd2hhdCBpcyB0aGUgcHJvYmxlbSB5
b3UgYXJlIHRyeWluZyB0byByZXNvbHZlPwoKQ2hlZXJzLAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gLS0tCj4gICB4ZW4vY29t
bW9uL2RldmljZV90cmVlLmMgfCA3ICsrKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGV2
aWNlX3RyZWUuYyBiL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYwo+IGluZGV4IDhmYzQwMWQuLmRm
Mjc0Y2MgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jCj4gKysrIGIveGVu
L2NvbW1vbi9kZXZpY2VfdHJlZS5jCj4gQEAgLTIxMywxNyArMjEzLDIwIEBAIGJvb2xfdCBkdF9k
ZXZpY2VfaXNfY29tcGF0aWJsZShjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldmljZSwK
PiAgIHsKPiAgICAgICBjb25zdCBjaGFyKiBjcDsKPiAgICAgICB1MzIgY3BsZW4sIGw7Cj4gKyAg
ICBzNjQgaWxlbjsKPiAgIAo+ICAgICAgIGNwID0gZHRfZ2V0X3Byb3BlcnR5KGRldmljZSwgImNv
bXBhdGlibGUiLCAmY3BsZW4pOwo+ICAgICAgIGlmICggY3AgPT0gTlVMTCApCj4gICAgICAgICAg
IHJldHVybiAwOwo+IC0gICAgd2hpbGUgKCBjcGxlbiA+IDAgKQo+ICsKPiArICAgIGlsZW4gPSBj
cGxlbjsKPiArICAgIHdoaWxlICggaWxlbiA+IDAgKQo+ICAgICAgIHsKPiAgICAgICAgICAgaWYg
KCBkdF9jb21wYXRfY21wKGNwLCBjb21wYXQpID09IDAgKQo+ICAgICAgICAgICAgICAgcmV0dXJu
IDE7Cj4gICAgICAgICAgIGwgPSBzdHJsZW4oY3ApICsgMTsKPiAgICAgICAgICAgY3AgKz0gbDsK
PiAtICAgICAgICBjcGxlbiAtPSBsOwo+ICsgICAgICAgIGlsZW4gLT0gbDsKPiAgICAgICB9Cj4g
ICAKPiAgICAgICByZXR1cm4gMDsKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
