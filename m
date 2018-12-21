From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v3 7/8] xenalyze: Build for Both
 ARM and x86 Platforms
Date: Fri, 21 Dec 2018 16:28:10 +0000
Message-ID: <8d9b5bdd-9312-f67b-9731-3178f76f26c2@arm.com>
References: <20181221162650.11515-1-julien.grall@arm.com>
 <20181221162650.11515-8-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mGA=O6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gaNen-0006fq-NN
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 16:28:13 +0000
In-Reply-To: <20181221162650.11515-8-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMS8xMi8yMDE4IDE2OjI2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gRnJvbTogQmVu
amFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+Cj4gCj4gTW9kaWZpZWQgdG8g
cHJvdmlkZSBidWlsZGluZyBvZiB0aGUgeGVuYWx5emUgYmluYXJ5IGZvciBib3RoIEFSTSBhbmQK
PiB4ODYgcGxhdGZvcm1zLiBUaGUgeGVuYWx5emUgYmluYXJ5IGlzIG5vdyBidWlsdCBhcyBwYXJ0
IG9mIHRoZSBCSU4KPiBsaXN0IGZvciBib3RoIHBsYXRmb3Jtcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBCZW5qYW1pbiBTYW5kYSA8YmVuLnNhbmRhQGRvcm5lcndvcmtzLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IEFja2VkLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxpbmlAa2VybmVsLm9yZz4KCkkgbWFkZSBhIHR5cG8gaW4gdGhlIGFkZHJlc3MgZS1t
YWlsLiBTdGVmYW5vLCBjb3VsZCB5b3UgZml4IGl0IG9uIGNvbW1pdD8KCkNoZWVycywKCj4gCj4g
LS0tCj4gICAgICBDaGFuZ2VzIGluIHYzOgo+ICAgICAgICAgIC0gQWRkIFN0ZWZhbm8ncyBhY2tl
ZC1ieQo+IAo+ICAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgICAtIEFkZCBXZWkncyBhY2tl
ZC1ieQo+IC0tLQo+ICAgdG9vbHMveGVudHJhY2UvTWFrZWZpbGUgfCAzICstLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS90b29scy94ZW50cmFjZS9NYWtlZmlsZSBiL3Rvb2xzL3hlbnRyYWNlL01ha2VmaWxlCj4gaW5k
ZXggMGJhZDk0MmJkZi4uOWZiN2ZjOTZlNyAxMDA2NDQKPiAtLS0gYS90b29scy94ZW50cmFjZS9N
YWtlZmlsZQo+ICsrKyBiL3Rvb2xzL3hlbnRyYWNlL01ha2VmaWxlCj4gQEAgLTksOCArOSw3IEBA
IExETElCUyArPSAkKExETElCU19saWJ4ZW5ldnRjaG4pCj4gICBMRExJQlMgKz0gJChMRExJQlNf
bGlieGVuY3RybCkKPiAgIExETElCUyArPSAkKEFSR1BfTERGTEFHUykKPiAgIAo+IC1CSU4tJChD
T05GSUdfWDg2KSA9IHhlbmFseXplCj4gLUJJTiAgICAgID0gJChCSU4teSkKPiArQklOICAgICAg
PSB4ZW5hbHl6ZQo+ICAgU0JJTiAgICAgPSB4ZW50cmFjZSB4ZW50cmFjZV9zZXRzaXplCj4gICBM
SUJCSU4gICA9IHhlbmN0eAo+ICAgU0NSSVBUUyAgPSB4ZW50cmFjZV9mb3JtYXQKPiAKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
