From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC] x86/HVM: meet xentrace's expectations
 on emulation event data
Date: Wed, 29 Aug 2018 15:22:02 +0100
Message-ID: <cccd95cf-9102-ff2e-be02-1d6141c20452@citrix.com>
References: <5B6BF4DB02000078001DC531@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fv1MC-0006xe-O5
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 14:22:04 +0000
In-Reply-To: <5B6BF4DB02000078001DC531@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDgvMTggMDk6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEFjY29yZGluZyB0byB0aGUg
bG9naWMgaW4gaHZtX21taW9fYXNzaXN0X3Byb2Nlc3MoKSwgNjQgYml0cyBvZiBkYXRhIGFyZQo+
IGV4cGVjdGVkIHdpdGggNjQtYml0IGFkZHJlc3NlcywgYW5kIDMyIGJpdHMgb2YgZGF0YSB3aXRo
IDMyLWJpdCBvbmVzLiBJCj4gZG9uJ3QgdGhpbmsgdGhpcyBpcyB2ZXJ5IHJlYXNvbmFibGUsIGJ1
dCBJJ20gYWxzbyBub3QgZ29pbmcgdG8gdG91Y2ggdGhlCj4gY29uc3VtZXIgc2lkZSwgdGhlIG1v
cmUgdGhhdCBpdCBpcyBhbnl3YXkgbm90IHZlcnkgaGVscGZ1bCBmb3IgdGhlIGNvZGUKPiBoZXJl
IHRvIG9ubHkgZXZlciBzdXBwbHkgMzIgYml0cyBvZiBkYXRhIChkZXNwaXRlIHRoZSBmaWVsZCBi
ZWluZyA2NAo+IGJpdHMgd2lkZSwgYW5kIGhhdmluZyBiZWVuIGV2ZW4gaW4gdGhlIDMyLWJpdCBk
YXlzIG9mIFhlbikuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gLS0tCj4gUkZDOiBVbnRlc3RlZDsgc29sZWx5IGJhc2VkIG9uIHRoZSBvYnNlcnZh
dGlvbiBvZiAiKG5vIGRhdGEpIiBpbiBhIHRyYWNlCj4gICAgICB3aGVyZSBpdCB3YXMgZW50aXJl
bHkgdW5jbGVhciB3aHkgbm8gZGF0YSB3b3VsZCBoYXZlIGJlZW4gYXZhaWxhYmxlLgo+ICAgICAg
SSBqdXN0IHNvIGhhcHBlbmVkIHRoYXQgdGhlIGd1ZXN0IGhhZCBtb3JlIHRoYW4gNEdiIG9mIG1l
bW9yeSwgYW5kCj4gICAgICBoZW5jZSBhZGRyZXNzZXMgd2VyZSBub3QgcmVwcmVzZW50YWJsZSBh
cyAzMi1iaXQgdmFsdWVzLgoKVW5mb3J0dW5hdGVseSwgSSBkb24ndCB0aGluayB0aGlzIGhlbHBz
IG11Y2guCgpGcm9tIHdoYXQgSSBjYW4gdGVsbCwgeGVudHJhY2VfZm9ybWF0IGRvZXNuJ3QgdW5k
ZXJzdGFuZCB0aGUgVFJDXzY0X0ZMQUcKdmVyc2lvbnMgb2YgdGhlc2UgZXZlbnRzIGF0IGFsbCwg
YW5kIHhlbmFseXplIHVzZXM6CgrCoMKgwqAgdW5pb24gewrCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
ewrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBncGE7CsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgaW50IGRhdGE7CsKgwqDCoMKgwqDCoMKgIH0geDMyOwrCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgewrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbG9u
ZyBncGE7CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGRhdGE7CsKgwqDCoMKg
wqDCoMKgIH0geDY0OwrCoMKgwqAgfSAqciA9ICh0eXBlb2YocikpaC0+ZDsKCnRvIHB1bGwgdGhl
IGRhdGEgYmFjayBvdXQuwqAgQUZBSUNULCB0aGlzIG1hdGNoZXMgd2hhdCBYZW4gaXMgY3VycmVu
dGx5CndyaXRpbmcsIGFuZCBpcyBlcXVhbGx5IHdyb25nLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
