From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH V2 1/2] xen/altp2m: set access_required
 properly for all altp2ms
Date: Thu, 28 Jun 2018 08:15:21 +0100
Message-ID: <20180628071521.e2kfknecrcp5hvmb@citrix.com>
References: <1528879939-11570-1-git-send-email-rcojocaru@bitdefender.com>
 <20180627140942.sildrcteisptgsqf@citrix.com>
 <5abf0be7-e9cc-5689-f0e4-37d1d474a14c@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5abf0be7-e9cc-5689-f0e4-37d1d474a14c@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMTA6MDg6MTlBTSArMDMwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+ID4+ICt7Cj4gPj4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiA+PiArCj4gPj4gKyAg
ICBwMm1fZ2V0X2hvc3RwMm0oZCktPmFjY2Vzc19yZXF1aXJlZCA9IGFjY2Vzc19yZXF1aXJlZDsK
PiA+PiArCj4gPj4gKyAgICBpZiAoICFhbHRwMm1fYWN0aXZlKGQpICkKPiA+PiArICAgICAgICBy
ZXR1cm47Cj4gPj4gKwo+ID4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBNQVhfQUxUUDJNOyBpKysg
KQo+ID4+ICsgICAgewo+ID4+ICsgICAgICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBkLT5h
cmNoLmFsdHAybV9wMm1baV07Cj4gPj4gKwo+ID4+ICsgICAgICAgIGlmICggcDJtICkKPiA+PiAr
ICAgICAgICAgICAgcDJtLT5hY2Nlc3NfcmVxdWlyZWQgPSBhY2Nlc3NfcmVxdWlyZWQ7Cj4gPj4g
KyAgICB9Cj4gPiAKPiA+IEl0IHNlZW1zIHRvIG1lIHlvdSBzaG91bGQgY2hlY2sgZm9yIGRvbWFp
biBwYXVzZSBjb3VudCBhdCB0aGUgYmVnaW5uaW5nCj4gPiBvZiB0aGlzIGZ1bmN0aW9uIHRvIGF2
b2lkIG1pc3Rha2VzLgo+IAo+IERvIHlvdSBtZWFuIEFTU0VSVChhdG9taWNfcmVhZCgmZC0+cGF1
c2VfY291bnQpKTsgPwoKWWVzLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
