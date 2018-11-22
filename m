From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Thu, 22 Nov 2018 15:23:41 +0000
Message-ID: <4775d924-8d59-e9e8-0c76-2937aa9581b0@citrix.com>
References: <20181122120327.66403-1-roger.pau@citrix.com>
 <c0b25df2-49ca-fbe1-804a-e1a9839bb854@citrix.com>
 <6fde305e-7f47-2577-d795-0291e2adc137@arm.com>
 <5BF6AEB602000078001FEE5D@prv1-mh.provo.novell.com>
 <9cd10d0c-8c1a-0c1f-39a1-c3a2bbd1d734@citrix.com>
 <5BF6B0F502000078001FEE76@prv1-mh.provo.novell.com>
 <cb727842-018a-0181-9788-e3f1b8dd28b8@arm.com>
 <20181122152002.piljxsuytliraxhk@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=76BK=OB=citrix.com=prvs=857ae18cf=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gPqpX-0005Zt-5R
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 15:23:47 +0000
In-Reply-To: <20181122152002.piljxsuytliraxhk@mac>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTEvMjAxOCAxNToyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIE5v
diAyMiwgMjAxOCBhdCAwMjowMzo1NVBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhp
IEphbiwKPj4KPj4gT24gMTEvMjIvMTggMTozNiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+
PiBPbiAyMi4xMS4xOCBhdCAxNDozMSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3Rl
Ogo+Pj4+IEkgdGhpbmsgSnVsaWVuJ3MgcG9pbnQgaXMgdGhhdCB3aXRob3V0IGV4cGxpY2l0bHkg
YmFycmllcnMsIENQVTAncwo+Pj4+IHVwZGF0ZSB0byBzeXN0ZW1fc3RhdGUgbWF5IG5vdCBiZSB2
aXNpYmxlIG9uIENQVTEsIGV2ZW4gdGhvdWdoIHRoZQo+Pj4+IG1hcHBpbmdzIGhhdmUgYmVlbiBz
aG90IGRvd24uCj4+Pj4KPj4+PiBUaGVyZWZvcmUsIGZyb20gdGhlIHByb2Nlc3NvcnMgcG9pbnQg
b2YgdmlldywgaXQgZGlkIGV2ZXJ5dGhpbmcKPj4+PiBjb3JyZWN0bHksIGFuZCBoaXQgYSByZWFs
IHBhZ2VmYXVsdC4KPj4+IEJvb3QgdGltZSB1cGRhdGVzIG9mIHN5c3RlbV9zdGF0ZSBzaG91bGQg
YmUgb2Ygbm8gaW50ZXJlc3QgaGVyZSwKPj4+IGFzIGF0IHRoYXQgdGltZSB0aGUgQVBzIGFyZSBh
bGwgaWRsaW5nLgo+PiBUaGF0J3MgcHJvYmFibHkgdHJ1ZSB0b2RheS4gQnV0IHRoaXMgY29kZSBs
b29rcyByYXRoZXIgZnJhZ2lsZSBhcyB5b3UgZG9uJ3QKPj4ga25vdyBob3cgdGhpcyBpcyBnb2lu
ZyB0byBiZSB1c2VkIGluIHRoZSBmdXR1cmUuCj4+Cj4+IElmIHlvdSBkZWNpZGUgdG8gZ2F0ZSBp
bml0IGNvZGUgd2l0aCBzeXN0ZW1fc3RhdGUsIHRoZW4geW91IG5lZWQgYSBiYXJyaWVyCj4+IHRv
IGVuc3VyZSB0aGUgY29kZSBpcyBmdXR1cmUgcHJvb2YuCj4gV291bGRuJ3QgaXQgYmUgZW5vdWdo
IHRvIGRlY2xhcmUgc3lzdGVtX3N0YXRlIGFzIHZvbGF0aWxlPwoKTm8uwqAgdm9sYXRpbGl0eSAo
b3IgbGFjayB0aGVyZW9mKSBpcyBhIGNvbXBpbGVyIGxldmVsIGNvbnN0cnVjdC4KCkFSTSBoYXMg
d2Vha2VyIGNhY2hlIGNvaGVyZW5jeSB0aGFuIHg4Niwgc28gYSB3cml0ZSB3aGljaCBoYXMgY29t
cGxldGVkCm9uIG9uZSBDUFUwIGluIHRoZSBwYXN0IG1heSBsZWdpdGltYXRlbHkgbm90IGJlIHZp
c2libGUgb24gQ1BVMSB5ZXQuCgpJZiB5b3UgbmVlZCBndWFyYW50ZWVzIGFib3V0IHRoZSB2aXNp
YmlsaXR5IG9mIHVwZGF0ZWQsIHlvdSBtdXN0IHVzZQphcHByb3ByaWF0ZSBiYXJyaWVycy4KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
