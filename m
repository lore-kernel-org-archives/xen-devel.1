From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH -next] x86/xen: Fix read buffer overflow
Date: Tue, 18 Dec 2018 12:35:34 -0500
Message-ID: <0de982b7-3402-9321-bd6a-f40de653f6e1__5805.88716916299$1545154503$gmane$org@oracle.com>
References: <20181218081910.18080-1-yuehaibing@huawei.com>
 <7825d772-338a-e39e-eaff-73e666ef5c08@suse.com>
 <2fe8f6b7-b791-e7ea-6484-491e089321d5@huawei.com>
 <08a359b7-1746-8997-4c19-b60a30ccdd63@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mp/4=O3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gZJHw-0003zf-Dc
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 17:36:12 +0000
In-Reply-To: <08a359b7-1746-8997-4c19-b60a30ccdd63@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, YueHaibing <yuehaibing@huawei.com>, Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTgvMTggNjoyOCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8xMi8yMDE4
IDEwOjQyLCBZdWVIYWliaW5nIHdyb3RlOgo+PiBPbiAyMDE4LzEyLzE4IDE2OjMxLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOgo+Pj4gT24gMTgvMTIvMjAxOCAwOToxOSwgWXVlSGFpYmluZyB3cm90ZToK
Pj4+PiBGaXggc21hdGNoIHdhcm5pbmc6Cj4+Pj4KPj4+PiBhcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2LmM6NjQ5IGdldF90cmFwX2FkZHIoKSBlcnJvcjoKPj4+PiAgYnVmZmVyIG92ZXJmbG93ICdl
YXJseV9pZHRfaGFuZGxlcl9hcnJheScgMzIgPD0gMzIKPj4+Pgo+Pj4+IEZpeGVzOiA0MmIzYTRj
YjU2MDkgKCJ4ODYveGVuOiBTdXBwb3J0IGVhcmx5IGludGVycnVwdHMgaW4geGVuIHB2IGd1ZXN0
cyIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29t
Pgo+Pj4+IC0tLQo+Pj4+ICBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgfCAyICstCj4+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5fcHYuYwo+Pj4+IGluZGV4IDJmNjc4N2YuLjgxZjIwMGQgMTAwNjQ0Cj4+Pj4gLS0t
IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4+Pj4gKysrIGIvYXJjaC94ODYveGVuL2Vu
bGlnaHRlbl9wdi5jCj4+Pj4gQEAgLTY0Niw3ICs2NDYsNyBAQCBzdGF0aWMgYm9vbCBfX3JlZiBn
ZXRfdHJhcF9hZGRyKHZvaWQgKiphZGRyLCB1bnNpZ25lZCBpbnQgaXN0KQo+Pj4+ICAKPj4+PiAg
CWlmIChuciA9PSBBUlJBWV9TSVpFKHRyYXBfYXJyYXkpICYmCj4+Pj4gIAkgICAgKmFkZHIgPj0g
KHZvaWQgKillYXJseV9pZHRfaGFuZGxlcl9hcnJheVswXSAmJgo+Pj4+IC0JICAgICphZGRyIDwg
KHZvaWQgKillYXJseV9pZHRfaGFuZGxlcl9hcnJheVtOVU1fRVhDRVBUSU9OX1ZFQ1RPUlNdKSB7
Cj4+Pj4gKwkgICAgKmFkZHIgPCAodm9pZCAqKWVhcmx5X2lkdF9oYW5kbGVyX2FycmF5W05VTV9F
WENFUFRJT05fVkVDVE9SUyAtIDFdKSB7Cj4+Pj4gIAkJbnIgPSAoKmFkZHIgLSAodm9pZCAqKWVh
cmx5X2lkdF9oYW5kbGVyX2FycmF5WzBdKSAvCj4+Pj4gIAkJICAgICBFQVJMWV9JRFRfSEFORExF
Ul9TSVpFOwo+Pj4+ICAJCSphZGRyID0gKHZvaWQgKil4ZW5fZWFybHlfaWR0X2hhbmRsZXJfYXJy
YXlbbnJdOwo+Pj4+Cj4+PiBObywgdGhpcyBwYXRjaCBpcyB3cm9uZy4KPj4+Cj4+PiBlYXJseV9p
ZHRfaGFuZGxlcl9hcnJheSBpcyBhIDItZGltZW5zaW9uYWwgYXJyYXk6Cj4+Pgo+Pj4gY29uc3Qg
Y2hhcgo+Pj4gZWFybHlfaWR0X2hhbmRsZXJfYXJyYXlbTlVNX0VYQ0VQVElPTl9WRUNUT1JTXVtF
QVJMWV9JRFRfSEFORExFUl9TSVpFXTsKPj4+Cj4+PiBTbyBhYm92ZSBjb2RlIGRvZXNuJ3QgZG8g
YW4gb3V0IG9mIGJvdW5kcyBhcnJheSBhY2Nlc3MsIGJ1dCBjaGVja3MgZm9yCj4+PiAqYWRkciBi
ZWluZyBpbiB0aGUgYXJyYXkgb3Igb3V0c2lkZSBvZiBpdCAobm90ZSB0aGUgIjwiIHVzZWQgZm9y
IHRoZQo+Pj4gdGVzdCkuCj4+IFRoYW5rIHlvdSBmb3IgeW91ciBleHBsYW5hdGlvbi4KPiBUaGlz
IGxvb2tzIGxpa2UgYSBzbWF0Y2ggYnVnLsKgIEknZCBmZWVkIGl0IGJhY2sgdXBzdHJlYW0uCgor
RGFuCgo+Cj4gSXQgaXMgZXhwbGljaXRseSBwZXJtaXR0ZWQgaW4gdGhlIEMgc3BlYyB0byBjb25z
dHJ1Y3QgYSBwb2ludGVyIHRvCj4gb25lLXBhc3QtdGhlLWVuZCBvZiBhbiBhcnJheSwgZm9yIHRo
ZSBwdXJwb3NlcyBvZiBhIDwgY29tcGFyaXNvbi4KPgo+IEknbSBub3QgZW50aXJlbHkgc3VyZSB3
aGVyZSB0aGUgIjMyIDw9IDMyIiBzdGF0ZW1lbnQgaXMgY29taW5nIGZyb20uCj4KPiB+QW5kcmV3
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
