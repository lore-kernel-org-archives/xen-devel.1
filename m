From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xl: remove apic option for PVH guests
Date: Thu, 1 Mar 2018 15:57:18 +0000
Message-ID: <7cb0df11-35a4-86fc-b475-e8a8c71102e7@citrix.com>
References: <20180228102053.1838-1-roger.pau@citrix.com>
 <20180301122205.bopopnky7n55zdmo@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=drue=fx=citrix.com=prvs=5913fcd06=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1erQb2-0006eE-LW
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 15:58:16 +0000
In-Reply-To: <20180301122205.bopopnky7n55zdmo@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDMvMTggMTI6MjIsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBGZWIgMjgsIDIwMTgg
YXQgMTA6MjA6NTNBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBYU0EtMjU2IGZv
cmNlcyB0aGUgbG9jYWwgQVBJQyB0byBhbHdheXMgYmUgZW5hYmxlZCBmb3IgUFZIIGd1ZXN0cywg
c28KPj4gaWdub3JlIGFueSBhcGljIG9wdGlvbiBmb3IgUFZIIGd1ZXN0cy4gVXBkYXRlIHRoZSBk
b2N1bWVudGF0aW9uCj4+IGFjY29yZGluZ2x5Lgo+IEkgdGhpbmsgaG93IEkgd2lsbCBhcHByb2Fj
aCB0aGlzIGlzIHRvIGRpY3RhdGUgdGhhdCBQVkggYWx3YXlzIGhhcyBMQVBJQwo+IGluIG91ciBp
bi10cmVlIGRvY3VtZW50LCB0aGVuIHVzZSB0aGF0IGFzIHRoZSBqdXN0aWZpY2F0aW9uIGZvciB0
aGlzCj4gY2hhbmdlLiBUaGF0J3MgdGhlIGNvbnNlbnN1cyBmcm9tIDIgeWVhcnMgYWdvLCByaWdo
dD8KPgo+IE9yIHdlJ3JlIGp1c3Qgd29ya2luZyBhcm91bmQgdGhlIGxpbWl0YXRpb24gaW4gb3Vy
IGNvZGUgYmFzZSwgYW5kIHVzZXJzCj4gbWF5IGRlbWFuZCBhIG5vLUxBUElDIFBWSCBndWVzdCBq
dXN0IGJlY2F1c2UuLi4KCkN1cnJlbnRseSwgWGVuIGVuZm9yY2VzIHRoYXQgSFZNIGd1ZXN0cyBo
YXZlIGFuIExBUElDLsKgIFRoaXMgaXMgYmVjYXVzZQptYWtpbmcgdGhlIG5vbi1MQVBJQyBjYXNl
IGZ1bmN0aW9uIGNvcnJlY3RseS9zYWZlbHkgZGV2b2x2ZWQgaW50byBhCm1hc3NpdmUgcmF0cyBu
ZXN0IGFuZCBJIHN0b3BwZWQgdHJ5aW5nIHRvIGZpeCBpdCBhZnRlciAyIGRheXMgb2YgdHJ5aW5n
LgoKQXQgdGhlIG1vbWVudCwgaXQgd291bGQgYmUgd2lzZSB0byBkaXNjdXNzIHdoZXRoZXIgdGhl
IG5vbi1MQVBJQyBjYXNlIGlzCmFjdHVhbGx5IHNlbnNpYmxlLsKgIEkgcGVyc29uYWxseSBzZWUg
bm8gdmFsdWUgaW4ga2VlcGluZyBpdC4KCklmIHNvbWVvbmUgY2FuIGNvbWUgdXAgd2l0aCBhIGNv
bnZpbmNpbmcgdXNlY2FzZSBmb3Iga2VlcGluZyBpdCwgdGhlbgpvaywgYnV0IHRoZSBiYXJyaWVy
IGZvciB0aGlzIGlzIGluY3JlYXNpbmcgYWxsIHRoZSB0aW1lLCBlc3BlY2lhbGx5IG5vdwp0aGF0
IGhhcmR3YXJlIGFjY2VsZXJhdGlvbiBhbmQgcG9zdGVkIGludGVycnVwdHMgbWVhbnMgdGhhdCBh
CnBpcGVsaW5lLXZpcnR1YWxpc2VkIEFQSUMgaXMgZmFzdGVyIGFuZCBtb3JlIGVmZmljaWVudCB0
aGFuIGFueSBvZiBvdXIKZXZlbnQgY2hhbm5lbCBtZWNoYW5pc21zLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
