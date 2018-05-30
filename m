From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 3/8] xen/grant-table: Allow allocating
 buffers suitable for DMA
Date: Wed, 30 May 2018 15:25:33 -0400
Message-ID: <9710e37c-8b65-3493-53b3-10c4f2230670__1599.33214677057$1527709177$gmane$org@oracle.com>
References: <20180525153331.31188-1-andr2000@gmail.com>
 <20180525153331.31188-4-andr2000@gmail.com>
 <94de6bd7-405c-c43f-0468-be71efff7552@oracle.com>
 <c2f9f6b4-03bd-225b-a42d-b071958dd899@gmail.com>
 <ab1b28b8-02b1-3501-801c-d4f523ab829f@oracle.com>
 <5e6e0f5d-a417-676a-1aad-c51eb09e6dee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z2b3=ir=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fO6xX-0007VR-Uj
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 19:40:36 +0000
In-Reply-To: <5e6e0f5d-a417-676a-1aad-c51eb09e6dee@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMzAvMjAxOCAwMTo0OSBQTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDUvMzAvMjAxOCAwNjoyMCBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwNS8z
MC8yMDE4IDAyOjM0IEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IE9uIDA1
LzI5LzIwMTggMTA6MTAgUE0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+PiBPbiAwNS8yNS8y
MDE4IDExOjMzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiArLyoqCj4+
Pj4gKyAqIGdudHRhYl9kbWFfZnJlZV9wYWdlcyAtIGZyZWUgRE1BYWJsZSBwYWdlcwo+Pj4+ICsg
KiBAYXJnczogYXJndW1lbnRzIHRvIHRoZSBmdW5jdGlvbgo+Pj4+ICsgKi8KPj4+PiAraW50IGdu
dHRhYl9kbWFfZnJlZV9wYWdlcyhzdHJ1Y3QgZ250dGFiX2RtYV9hbGxvY19hcmdzICphcmdzKQo+
Pj4+ICt7Cj4+Pj4gK8KgwqDCoCB4ZW5fcGZuX3QgKmZyYW1lczsKPj4+PiArwqDCoMKgIHNpemVf
dCBzaXplOwo+Pj4+ICvCoMKgwqAgaW50IGksIHJldDsKPj4+PiArCj4+Pj4gK8KgwqDCoCBnbnR0
YWJfcGFnZXNfY2xlYXJfcHJpdmF0ZShhcmdzLT5ucl9wYWdlcywgYXJncy0+cGFnZXMpOwo+Pj4+
ICsKPj4+PiArwqDCoMKgIGZyYW1lcyA9IGtjYWxsb2MoYXJncy0+bnJfcGFnZXMsIHNpemVvZigq
ZnJhbWVzKSwgR0ZQX0tFUk5FTCk7Cj4+Pj4KPj4+PiBBbnkgd2F5IHlvdSBjYW4gZG8gaXQgd2l0
aG91dCBhbGxvY2F0aW5nIG1lbW9yeT8gT25lIHBvc3NpYmlsaXR5IGlzIHRvCj4+Pj4ga2VlcCBh
bGxvY2F0ZWQgZnJhbWVzIGZyb20gZ250dGFiX2RtYV9hbGxvY19wYWdlcygpLiAoTm90IHN1cmUg
SSBsaWtlCj4+Pj4gdGhhdCBlaXRoZXIgYnV0IGl0J3MgdGhlIG9ubHkgdGhpbmcgSSBjYW4gdGhp
bmsgb2YpLgo+Pj4gWWVzLCBJIHdhcyBhbHNvIHRoaW5raW5nIGFib3V0IHN0b3JpbmcgdGhlIGFs
bG9jYXRlZCBmcmFtZXMgYXJyYXkgZnJvbQo+Pj4gZ250dGFiX2RtYV9hbGxvY19wYWdlcygpLCBi
dXQgdGhhdCBzZWVtZWQgbm90IHRvIGJlIGNsZWFyIGVub3VnaCBhcwo+Pj4gdGhlIGNhbGxlciBv
ZiB0aGUgZ250dGFiX2RtYV9hbGxvY19wYWdlcyB3aWxsIG5lZWQgdG8gc3RvcmUgdGhvc2UKPj4+
IGZyYW1lcwo+Pj4gaW4gc29tZSBjb250ZXh0LCBzbyB3ZSBjYW4gcGFzcyB0aGVtIG9uIGZyZWUu
IEJ1dCB0aGUgY2FsbGVyIGRvZXNuJ3QKPj4+IHJlYWxseQo+Pj4gbmVlZCB0aGUgZnJhbWVzIHdo
aWNoIG1pZ2h0IGNvbmZ1c2UsIHNvIEkgZGVjaWRlZCB0byBtYWtlIHRob3NlCj4+PiBhbGxvY2F0
aW9ucwo+Pj4gb24gdGhlIGZseS4KPj4+IEJ1dCBJIGNhbiBzdGlsbCByZXdvcmsgdGhhdCB0byBz
dG9yZSB0aGUgZnJhbWVzIGlmIHlvdSBpbnNpc3Q6IHBsZWFzZQo+Pj4gbGV0IG1lIGtub3cuCj4+
Cj4+IEkgd291bGQgcHJlZmVyIG5vdCB0byBhbGxvY2F0ZSBhbnl0aGluZyBpbiB0aGUgcmVsZWFz
ZSBwYXRoLiBZZXMsIEkKPj4gcmVhbGl6ZSB0aGF0IGRyYWdnaW5nIGZyYW1lcyBhcnJheSBhcm91
bmQgaXMgbm90IG5lY2Vzc2FyeSBidXQgSU1PIGl0J3MKPj4gYmV0dGVyIHRoYW4gcG90ZW50aWFs
bHkgZmFpbGluZyBhbiBhbGxvY2F0aW9uIGR1cmluZyBhIHRlYXJkb3duLiBBCj4+IGNvbW1lbnQg
aW4gdGhlIHN0cnVjdCBkZWZpbml0aW9uIGNvdWxkIGV4cGxhaW4gdGhlIHJlYXNvbiBmb3IgaGF2
aW5nCj4+IHRoaXMgZmllbGQuCj4gVGhlbiBJIHdvdWxkIHN1Z2dlc3Qgd2UgaGF2ZSBpdCB0aGlz
IHdheTogY3VycmVudCBBUEkgcmVxdWlyZXMgdGhhdAo+IHN0cnVjdCBwYWdlICoqcGFnZXMgYXJl
IGFsbG9jYXRlZCBmcm9tIG91dHNpZGUuIFNvLCBsZXQncyBhbGxvY2F0ZQo+IHRoZSBmcmFtZXMg
ZnJvbSBvdXRzaWRlIGFzIHdlbGwuIFRoaXMgd2F5IHRoZSBjYWxsZXIgaXMgcmVzcG9uc2libGUg
Zm9yCj4gYm90aCBwYWdlcyBhbmQgZnJhbWVzIGFycmF5cyBhbmQgQVBJIGxvb2tzIGNvbnNpc3Rl
bnQuCgoKWWVzLCB0aGF0IHdvcmtzIHRvby4KCi1ib3JpcwoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
