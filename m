From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 15/18] xen/arm: Resume memory management on
 Xen resume
Date: Tue, 13 Nov 2018 09:59:59 +0000
Message-ID: <17aa6668-a804-b4e5-d2eb-51a5f2d33dc5@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-16-git-send-email-mirela.simonovic@aggios.com>
 <65d21faa-33be-621d-050d-54de04a0e97f@arm.com>
 <alpine.DEB.2.10.1811121550210.8259@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qhar=ny=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gMVUK-0008M3-2a
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:00:04 +0000
In-Reply-To: <alpine.DEB.2.10.1811121550210.8259@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xen.org, dm@aggios.com, saeed.nowshadi@xilinx.com, xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMy8xMS8yMDE4IDAxOjM2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAxMiBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxMS8xMi8xOCAxMToz
MCBBTSwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPiBXZSBjYW4gdHVybiB0aGlzIGFzc2VtYmx5
IGNvZGUgaW50byBhIC5tYWNybywgc28gdGhhdCBhdCBsZWFzdCB3aGVuIHdlCj4gZ2V0IGFyb3Vu
ZCB0byBpdCwgd2UganVzdCBuZWVkIHRvIGZpeCBpdCBvbmUgcGxhY2UuIEluIGZhY3QsIEkgbm90
aWNlZAo+IHRoYXQgdGhlIGNvZGUgc2VxdWVuY2UgcmlnaHQgYmVmb3JlICJtbXVfcmVzdW1lZCIg
YW5kIHRoZSBvbmUgcmlnaHQKPiBhZnRlciBhcmUgYm90aCBpbmRlbnRpY2FsIHRvIHRoZSBvbmVz
IGhlYWQuUywgaXQgd291bGQgYmUgZ29vZCB0byBhdm9pZAo+IHRoZSBkdXBsaWNhdGlvbiBpZiBw
b3NzaWJsZS4KClRoaXMgZG9lcyBub3QgYWRkcmVzcyBteSBjb25jZXJuLiBXZSB3YW50IHRvIGhh
dmUgc3VzcGVuZC9yZXN1bWUgY29tcGxpYW50IHRvIAp0aGUgQXJtIGFyY2hpdGVjdHVyZSAoYXQg
bGVhc3QgdG8gb3VyIGJlc3Qga25vd2xlZGdlKS4gSGlkaW5nIGl0IGluIGEgCm1hY3JvL2Z1bmN0
aW9uIGlzIG5vdCBnb2luZyB0byBtYWtlIGl0IGNvbXBsaWFudC4KCk5vYm9keSB3YW50cyBpdHMg
cGxhdGZvcm0gcmFuZG9tbHkgY3Jhc2hpbmcgb24gc3VzcGVuZC9yZXN1bWUgYmVjYXVzZSB0aGUg
QXJtIApBcm0gd2FzIGtub3dpbmdseSBub3QgZm9sbG93ZWQuIFRoaXMgaXMgbW9yZSBjcml0aWNh
bCB0aGFuIHRoZSBib290IG9uZSBhcyB3ZSAKYXJlIGdvaW5nIHRvIGNhbGwgdGhhdCBtb3JlIG9m
dGVuLiBTbyB3aGF0IGlzIHRoZSBhY3Rpb24gcGxhbiB0byBjb3JyZWN0bHkgCnJlc3VtZSBtZW1v
cnkgbWFuYWdlbWVudCBpbiB0aGlzIHNlcmllcz8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
