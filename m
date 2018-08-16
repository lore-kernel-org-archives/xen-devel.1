From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 06/12] xen/gnttab: Pass max_{grant,
 maptrack}_frames into grant_table_create()
Date: Thu, 16 Aug 2018 09:59:04 +0100
Message-ID: <74d0efec-1c98-792f-5f2b-707835b15394@arm.com>
References: <1534154469-6076-1-git-send-email-andrew.cooper3@citrix.com>
 <1534154469-6076-7-git-send-email-andrew.cooper3@citrix.com>
 <ef8b6d44-db17-7893-c4b2-a20d2fcb0830@arm.com>
 <01e5c23c-ddc4-2361-a06b-4be17d53d5ce@citrix.com>
 <a4635e6a-4fb0-b91c-e8d2-c8e4b85ac74e@arm.com>
 <48e39f4f-b337-bf20-1e7b-a710e03a85c1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <48e39f4f-b337-bf20-1e7b-a710e03a85c1@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMDgvMTUvMjAxOCAwODowMyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToK
PiBBY3R1YWxseSwgSSByZW1lbWJlciBub3cgd2hhdCB0aGUgcHJvYmxlbSB3YXMuwqAgZC0+Z3Jh
bnRfdGFibGUgaXMgYW4KPiBvcGFxdWUgdHlwZSwgc28gLm1heF9ncmFudF9mcmFtZXMgY2FuJ3Qg
YmUgYWNjZXNzZWQuCj4gCj4gT25lIG9mIG15IGluZGVudGVkIGJpdHMgb2YgY2xlYW51cCBoZXJl
IGlzIHRvIHJlbW92ZSB0aGUKPiBnbnR0YWJfZG9tMF9mcmFtZXMoKSBmdW5jdGlvbiwgYmVjYXVz
ZSBpdCBoYXMgbm8gYnVzaW5lc3MgbGl2aW5nIGluIHRoZQo+IGNvcmUgZ3JhbnRfdGFibGUuYwo+
IAo+IFdvdWxkIHlvdSBiZSBoYXBweSBpZiBJIHJlcGxhY2VkIGdudHRhYl9kb20wX21heCgpIGlu
IGFzbS1hcm0gd2l0aAo+IGdudHRhYl9kb20wX2ZyYW1lcygpIHdoaWNoIGFjY291bnRzIGZvciB0
aGUgZXhpdGluZyBtaW4oKSwgYW5kIG1lYW5zCj4gdGhhdCBkb21haW5fYnVpbGQuYyB3aWxsIGJl
IHVsdGltYXRlbHkgdW5jaGFuZ2VkPwoKSSB3b3VsZCBiZSBoYXBweSB3aXRoIHN1Y2ggY2hhbmdl
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
