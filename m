From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 2/4] libxl/x86: Build e820 map earlier
 for HVM/PVH guests
Date: Wed, 21 Mar 2018 13:56:54 -0400
Message-ID: <79e94d99-be92-5074-467d-1e11c6a1b3b2@oracle.com>
References: <1521564536-31880-1-git-send-email-maran.wilson@oracle.com>
 <1521564652-31992-1-git-send-email-maran.wilson@oracle.com>
 <20180321174946.w2rbzchsszrsqgal@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180321174946.w2rbzchsszrsqgal@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Maran Wilson <maran.wilson@oracle.com>
Cc: roger.pau@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjEvMjAxOCAwMTo0OSBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIE1hciAyMCwg
MjAxOCBhdCAwOTo1MDo1MEFNIC0wNzAwLCBNYXJhbiBXaWxzb24gd3JvdGU6Cj4+ICAgICAgY2Fz
ZSBMSUJYTF9ET01BSU5fVFlQRV9QVjoKPj4gLSAgICAgICAgcmV0ID0gbGlieGxfX2J1aWxkX3B2
KGdjLCBkb21pZCwgaW5mbywgc3RhdGUpOwo+PiArICAgICAgICByZXQgPSBsaWJ4bF9fYnVpbGRf
cHYoZ2MsIGRvbWlkLCBkX2NvbmZpZywgaW5mbywgc3RhdGUpOwo+PiAgICAgICAgICBpZiAocmV0
KQo+PiAgICAgICAgICAgICAgZ290byBvdXQ7Cj4+ICAKPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2RvbS5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKPj4gaW5kZXggMmUyOWI1
Mi4uZTgzYWViOSAxMDA2NDQKPj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKPj4gKysr
IGIvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKPj4gQEAgLTY5OCw2ICs2OTgsNyBAQCBzdGF0aWMg
aW50IHNldF92bnVtYV9pbmZvKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAo+PiAgfQo+
PiAgCj4+ICBzdGF0aWMgaW50IGxpYnhsX19idWlsZF9kb20obGlieGxfX2djICpnYywgdWludDMy
X3QgZG9taWQsCj4+ICsgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcs
Cj4+ICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmluZm8sIGxpYnhsX19k
b21haW5fYnVpbGRfc3RhdGUgKnN0YXRlLAo+IEFGQUlDVCBidWlsZF9pbmZvIGlzIGEgbWVtYmVy
IG9mIGRvbWFpbl9jb25maWcuIFlvdSBjYW4gb25seSB0YWtlIHRoZQo+IGxhdHRlciBpbiB0aGlz
IGZ1bmN0aW9uLiBGdXJ0aGVyIGFkanVzdG1lbnQgaXMgcmVxdWlyZWQgdG8gYWNjb21tb2RhdGUK
PiB0aGF0IGNoYW5nZS4KCgpZZXMsIFJvZ2VyIGFsc28gcG9pbnRlZCB0aGlzIG91dCB0byBtZS4K
Ci1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
