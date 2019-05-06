From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
Date: Mon, 6 May 2019 17:54:38 +0100
Message-ID: <9bc3a7a4-aadd-a6ec-b7ff-86d1f6f755c6@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-17-julien.grall@arm.com>
 <13fdc8c8-5dba-7b21-067e-e54e9531bf73@gmail.com>
 <4bd14bff-9689-7943-9319-908b74139617@arm.com>
 <a4fa267f-c4c0-ac09-4694-42f675965cea@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IX9s=TG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hNgt4-0007w8-VS
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 16:54:47 +0000
In-Reply-To: <a4fa267f-c4c0-ac09-4694-42f675965cea@gmail.com>
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

CgpPbiA1LzYvMTkgOToyMCBBTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBKdWxpZW4s
Cj4gCj4gT24gMDMuMDUuMTkgMjA6MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVExEUjsgYmVj
YXVzZSB4ZW4gcGFnZS10YWJsZXMgYXJlIG5vdCB0aGF0IG9mdGVuIG1vZGlmaWVkIGFmdGVyIGJv
b3QuIAo+PiBZZXQgaXQgaXMgc3RpbGwgcG9zc2libGUgdG8gcmFjZS4KPj4KPj4gQXQgdGhlIG1v
bWVudCwgY3JlYXRlX3hlbl9lbnRyaWVzKCkgY2FuIG9ubHkgbW9kaWZ5IHRoZSBWQSByYW5nZSAw
IC0gCj4+IDJHQi4gSW4gdGhhdCByYW5nZSwgd2UgY2FuIG1vZGlmeSBhdCBydW50aW1lIHRoZSBW
TUFQIGFyZWEuIE9uZSAKPj4gcG90ZW50aWFsIGlzc3VlIGlzCj4+IGEgdm1hcCBpc3N1ZWQgYXQg
dGhlIHNhbWUgdGltZS4KPj4KPj4gV2hpbGUgdGhlIHJhbmdlIGFsbG9jYXRpb24gaXMgcHJvdGVj
dGVkIGJ5IGEgbG9jayAoc2VlIHZtX2FsbG9jKSwgdGhlIAo+PiBtYXBwaW5nIGlzIG5vdC4gU28g
aXQgd291bGQgYmUgcG9zc2libGUgdG8gZW5kIHVwIG1vZGlmeWluZyB0aGUgCj4+IHBhZ2UtdGFi
bGUgYXQgdGhlIHNhbWUuIFRoYXQgY291bGQgYmxvdyB1cCBpZiBmb3IgaW5zdGFuY2UsIHRoZSAK
Pj4gc2Vjb25kLWxldmVsIGVudHJ5IGlzIGludmFsaWQgYXMgd2Ugd291bGQgbmVlZCB0byBhbGxv
Y2F0ZSBtZW1vcnkgCj4+IChvbmx5IG9uZSBjYW4gd2luIHRoYXQgcmFjZSkuCj4gCj4gSSB1bmRl
cnN0YW5kIHRoZSBwb3RlbnRpYWwgcmFjZSwgYnV0IHN0aWxsIHdvbmRlcmluZyB3aHkgZGlkbid0
IHdlIHNlZSAKPiB0aG9zZSBpc3N1ZXMuIE1heWJlIHdlIGFyZSB0b28gbHVja3kuCgpBcyBJIHBv
aW50ZWQgb3V0IGFib3ZlLCB0aGUgVk1BUCBhcmVhIGlzIG5vdCBvZnRlbiB1cGRhdGVkIGFmdGVy
IGJvb3QuIApGdXJ0aGVybW9yZSwgdG8gaGl0IHRoZSByYWNlLCB5b3UgbmVlZCB0byBpbnNlcnQg
MiBlbnRyaWVzIGNvdmVyZWQgYnkgCnRoZSBzYW1lIHVuYWxsb2NhdGVkIDNyZC1sZXZlbCB0YWJs
ZSBhdCB0aGUgc2FtZSB0aW1lLiBBcyB0aGUgM3JkLWxldmVsIAp0YWJsZSBhcmUgb25seSBhbGxv
Y2F0ZWQgb25jZSBhbmQgbmV2ZXIgcmVsZWFzZWQsIHlvdSBwcm9iYWJseSBoYXZlIG1vcmUgCmNo
YW5jZSB0byB3aW4gYXQgdGhlIGxvdHRlcnkgb3ZlciBoaXR0aW5nIHRoZSByYWNlLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
