From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v14 4/9] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Thu, 4 Oct 2018 17:29:55 +0100
Message-ID: <37e5e689-110e-6bc4-1a54-8401d58dc282@citrix.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wqag=mq=citrix.com=prvs=8089523ff=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g86Vk-0002pR-VA
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 16:30:00 +0000
In-Reply-To: <20181004104547.32316-5-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDQvMjAxOCAxMTo0NSBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoaXMgcGF0Y2gg
cmVtb3ZlcyB0aGUgaW1wbGljaXQgZG9tYWluX2NyYXNoKCkgZnJvbSBpb21tdV9tYXAoKSwKPiB1
bm1hcF9wYWdlKCkgYW5kIGlvbW11X2lvdGxiX2ZsdXNoKCkgYW5kIHR1cm5zIHRoZW0gaW50byBz
dHJhaWdodGZvcndhcmQKPiB3cmFwcGVycyB0aGF0IGNoZWNrIHRoZSBleGlzdGVuY2Ugb2YgdGhl
IHJlbGV2YW50IGlvbW11X29wIGFuZCBjYWxsCj4gdGhyb3VnaCB0byBpdC4gVGhpcyBtYWtlcyB0
aGVtIHVzYWJsZSBieSBQViBJT01NVSBjb2RlIHRvIGJlIGRlbGl2ZXJlZCBpbgo+IGZ1dHVyZSBw
YXRjaGVzLgoKSG1tLCBhcHBhcmVudGx5IEkgZ2F2ZSB0aGlzIGFuIFItYiBiZWZvcmUsIGJ1dCBu
b3cgSSdtIG5vdCB0b3RhbGx5IGhhcHB5CndpdGggaXQuICBUaGUgcG9pbnQgb2YgcHV0dGluZyB0
aGUgZG9tYWluX2NyYXNoKCkgaW5zaWRlIHRob3NlIGZ1bmN0aW9ucwp3YXMgYmVjYXVzZSBmb3Jn
ZXR0aW5nIHRvIGNyYXNoIHRoZSBkb21haW4sIHBhcnRpY3VsYXJseSBpbiB0aGUgZXZlbnQgb2YK
YW4gdW5tYXAgb3IgYSBmbHVzaCwgd2FzIHZlcnkgbGlrZWx5IHRvIGJlIGEgc2VjdXJpdHkgaXNz
dWUuCgpXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBlaXRoZXIgYWRkIGEgYG1heWZhaWxgIHBhcmFt
ZXRlciwgb3IgYSBuZXcKZnVuY3Rpb24gKGlvbW11X21hcF9tYXlmYWlsKCkgb3Igc29tZXRoaW5n
KSwgdGhhdCB0aGUgUFYgSU9NTVUgY29kZQpjb3VsZCB1c2UgaW5zdGVhZD8KCkl0IGxvb2tzIGxp
a2UgZ2l0IGlzIGNvbWZvcnRhYmxlIHB1dHRpbmcgdGhpcyBwYXRjaCBhdCB0aGUgZW5kOyBhbGwg
dGhlCm90aGVyIHBhdGNoZXMgbG9vayBsaWtlIHRoZXkgcHJvYmFibHkgaGF2ZSBlbm91Z2ggYWNr
cyB0byBnbyBpbiB3aGlsZSB3ZQpkaXNjdXNzIHRoaXMgb25lLgoKIC1HZW9yZ2UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
