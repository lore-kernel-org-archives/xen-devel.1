From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 31/49] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
Date: Mon, 1 Apr 2019 10:46:28 +0200
Message-ID: <fee3c0da-e38a-99f1-f137-059fa65e0e1f@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAsaO-0004jZ-2j
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:46:32 +0000
References: =?UTF-8?B?PDIwMTkwMzI5MTUwOTM0LjE3Njk077+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwMzI5MTUwOTM0LjE3Njk077+9MzLvv71qZ3Jvc3NAc3VzZS5j?=
 =?UTF-8?B?b20+IDw2YWU2MGM3Zu+/vWUyOTXvv71kNzU477+9Y2Y2MO+/vTlmMjQxMTMyMzZl?=
 =?UTF-8?Q?1=40citrix=2ecom=3e_=3c7637592e-c241-dd48-ea6c-ea0e3c5738e4=40sus?=
 =?UTF-8?Q?e=2ecom=3e_=3c5CA1C75E0200007800223721=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAxMDoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDMuMTkg
YXQgMTE6MjIsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyOS8wMy8yMDE5IDIwOjM2
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gSW4gcHJhY3RpY2UsIGFsbCB0aGlzIGZsYWcgZG9l
cyBpcyBwZXJtaXQgdGhlIHVzZSBvZiBWQ1BVT1BfZ2V0X3BoeXNpZCwKPj4+IGRpc2FsbG93IHRo
ZSB1c2Ugb2YgdmNwdV9zZXRfaGFyZF9hZmZpbml0eSgpLCBhbmQgYWxsb3cgZG9tMCB0byBhdHRl
bXB0Cj4+PiB0byBhY3R1YWxseSB3cml0ZSB0byBNU1JfQU1ENjRfTkJfQ0ZHLCBNU1JfRkFNMTBI
X01NSU9fQ09ORl9CQVNFLAo+Pj4gTVNSX0lBMzJfVUNPREVfUkVWLCBNU1JfSUEzMl9USEVSTV9D
T05UUk9MIGFuZAo+Pj4gTVNSX0lBMzJfRU5FUkdZX1BFUkZfQklBUywgcmF0aGVyIHRoYW4gaGF2
aW5nIHRoZSB3cml0ZSBzaWxlbnRseSBkaXNjYXJkZWQuCj4+Pgo+Pj4gRG9tMCdzIHVzZSBvZiB0
aG9zZSBNU1JzIGlzIGR1YmlvdXMgYXQgYmVzdCwgYW5kIGRpc2FibGVkIGJ5IGRlZmF1bHQsCj4+
PiAqYW5kKiB3aGVuIGFjdGl2ZSwgYWxzbyBjcm9zcy1jaGVja3Mgd2l0aCB0aGUgaGFyZCBhZmZp
bml0eSBtYXNrLiAgRG9lcwo+Pj4gYW55b25lIHVzZSBkb20wX3ZjcHVzX3BpbiBpbiBwcm9kdWN0
aW9uPwo+Pgo+PiBJIGhhdmUgc2VlbiBpdCBvbiBjdXN0b21lciBzeXN0ZW1zLgo+IAo+IFNhbWUg
aGVyZSwgYnV0IEkndmUgbmV2ZXIgc2VlbiBpdCB1c2VkIGZvciBhIGdvb2QgcmVhc29uLgo+IAo+
Pj4gSSB0aGluayB0aGVyZSBpcyBxdWl0ZSBhIGxvdCBvZiB2YWx1ZSBpbiBnZXR0aW5nIHJpZCBv
ZiBkLT5pc19waW5uZWQgYW5kCj4+PiBpc19waW5uZWRfdmNwdSgpIGVudGlyZWx5LCB3aXRoIHdp
bGwgcmVtb3ZlIGFuIGV4dHJlbWUKPj4+IGNvcm5lci1jYXNlLXg4Ni1pc20gb3V0IG9mIHRoZSBj
b21tb24gY29kZS4KPiAKPiBJIHRoaW5rIGl0cyBvcmlnaW4gd2FzICJjcHVmcmVxPWRvbTAta2Vy
bmVsIiwgd2hpY2ggSSB0aGluayBzaG91bGQgZ28KPiBhd2F5IHdpdGggaXQgdGhlbi4KCkZpbmUg
d2l0aCBtZS4gQW5vdGhlciBjYW5kaWRhdGUgZm9yIGEgbGF0ZXIgY2xlYW51cCwgSSBndWVzcy4K
CgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
