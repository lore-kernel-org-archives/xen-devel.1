From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 06/12] xen/arm: mm: Sanity check any update
 of Xen page tables
Date: Mon, 6 May 2019 18:01:49 +0100
Message-ID: <ac720fde-f515-dd69-69d8-761f7f119d74@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-7-julien.grall@arm.com>
 <7a6cb580-e4d7-7325-7797-d16ca0856c57@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IX9s=TG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hNgzy-0000PE-8y
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 17:01:54 +0000
In-Reply-To: <7a6cb580-e4d7-7325-7797-d16ca0856c57@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA1LzYvMTkgMTo0OCBQTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gK8KgwqDCoCAv
KiBTYW5pdHkgY2hlY2sgd2hlbiByZW1vdmluZyBhIHBhZ2UuICovCj4+ICvCoMKgwqAgZWxzZSBp
ZiAoIChmbGFncyAmIChfUEFHRV9QUkVTRU5UfF9QQUdFX1BPUFVMQVRFKSkgIT0gMCApCj4gCj4g
U2hvdWxkbid0IGl0IGJlIGAoZmxhZ3MgJiAoX1BBR0VfUFJFU0VOVHxfUEFHRV9QT1BVTEFURSkp
ID09IDBgID8gQXMgSSAKPiB1bmRlcnN0YW5kIGZyb20gdGhlIHBhdGNoIDA0LCB3ZSBkbyByZW1v
dmUgYSBwYWdlIHdoZW4gd2UgZG8gdW5zZXQgYm90aCAKPiBmbGFncy4KCkhtbW0sIHllcy4gSSB3
aWxsIHVwZGF0ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiAKPiBCVFcsIEkgd291bGQgc3VnZ2Vz
dCBwYXRjaGVzIHJlb3JkZXJpbmcgaW4gdGhpcyBzZXJpZXMuIFRoaXMgcGF0Y2ggCj4gc2hvdWxk
IGdvIHJpZ2h0IGFmdGVyIHRoZSBwYXRjaCAwNCwgd2hlcmUgeW91IGludHJvZHVjZSB0aG9zZSBm
bGFncy4gCj4gQmVjYXVzZSBoZXJlIHlvdSBpbXBsZW1lbnQgdGhlaXIgdXNhZ2UuIEJ1dCBzb21l
d2h5IHlvdSBpbnNlcnRlZCBhbiAKPiB1bnJlbGF0ZWQgY2hhbmdlIGluIGJldHdlZW4uCgpJdCBp
cyBub3QgdW5yZWxhdGVkLCB0aGUgcGF0Y2ggaXMgbmVjZXNzYXJ5IHRvIG1ha2UgdGhpcyBwYXRj
aCB3b3Jrcy4gCk90aGVyd2lzZSB5b3Ugd2lsbCBoaXQgdGhlIEFTU0VSVChtZm5fZXEobWZuLCBJ
TlZBTElEX01GTikpIGFmdGVyIG9uZSAKaXRlcmF0aW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
