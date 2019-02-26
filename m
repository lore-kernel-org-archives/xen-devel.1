From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Tue, 26 Feb 2019 09:43:05 +0200
Message-ID: <4f6fd331-e5d3-f297-7cbc-ae9f00272388@gmail.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
 <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
 <alpine.DEB.2.10.1902250942570.4000@sstabellini-ThinkPad-X260>
 <eeec5cb2-5242-5331-21cb-e84317b85351@arm.com>
 <alpine.DEB.2.10.1902251311320.4000@sstabellini-ThinkPad-X260>
 <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+aJ=RB=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gyXOR-0001YX-2r
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 07:43:11 +0000
Received: by mail-lf1-x144.google.com with SMTP id u21so8923604lfu.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 23:43:09 -0800 (PST)
In-Reply-To: <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyLzI1LzE5IDExOjM0IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4KPiBPbiAy
LzI1LzE5IDk6MTMgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gSSB0aGluayBpdCBp
cyBmaW5lIHRvIGV4cGxvaXQgY29tcGlsZXIgc3BlY2lmaWMgY2hlY2tzIHdoZW4gYXZhaWxhYmxl
Lgo+PiBIb3dldmVyLCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBtYWtlIGFueSBkZWNpc2lvbnMg
b24gY29kZSBjb3JyZWN0bmVzcwo+PiBiYXNlZCBvbiB0aGUgY29tcGlsZXIgY2hlY2tzIHRoYXQg
d2UgaW50cm9kdWNlLgo+Pgo+PiBJbiBvdGhlciB3b3JkcywgSSB0aGluayBpdCBpcyBhIGdvb2Qg
aWRlYSB0byB1c2UgLVdzd2l0Y2gtZW51bSBpZgo+PiBwb3NzaWJsZSwgYnV0IGl0IGlzIG5vdCBh
IHJlYXNvbiBmb3Igbm90IGhhdmluZyBkZWZhdWx0IGxhYmVscyBpbiBwbGFjZQo+PiBhcyBzdWdn
ZXN0ZWQgYnkgMTYuNC4gVGhlIGNvZGUgc2hvdWxkIGJlIGFzIGNvcnJlY3QgYW5kIHNhZmUgYXMK
Pj4gcG9zc2libGUsIHdpdGhvdXQgcmVxdWlyaW5nIGV4dGVybmFsIGNvbXBpbGVyLXNwZWNpZmlj
IGNoZWNrcy4KPgo+IEFzIEkgc2FpZCBvbiBhbiBhbnN3ZXIgdG8gT2xla3NhbmRyLCBJIGFtIG5v
dCBhZ2FpbnN0IG9mIGhhdmluZyAKPiAiZGVmYXVsdCIgbGFiZWxzIGFzIGxvbmcgYXMgdGhleSBj
b250YWluIHNlbnNpYmxlIGFjdGlvbnMuCj4KPiBCdXQgdGhpcyBkb2VzIG5vdCByZWFsbHkgYWRk
cmVzcyBteSBwb2ludCBhYm92ZSByZWdhcmRpbmcgd2F5IHRvIGhlbHAgCj4gdGhlIHJldmlldy4g
SmFuIGlzIGFnYWluc3QgLVdzd2l0Y2gtZW51bSwgYW5kIEkgY2FuIHVuZGVyc3RhbmQgaGlzIAo+
IHBvaW50LiBTbyBob3cgZG8geW91IGRlYWwgd2l0aCBtaXNzaW5nIGl0ZW0/Cj4KSG0sIEkgd291
bGQgc3VnZ2VzdCB0byBkbyB0aGUgc2FtZSBhcyB5b3Ugd291bGQgZG8gaXQgbm93OiBhcyB3ZSBk
byBub3QgCmhhdmUgLVdzd2l0Y2guLi4KaW4gcGxhY2Ugb25lIHRoZW4gYWRkIGl0IG1hbnVhbGx5
LCBjaGVjay9jcmFmdCBhIHBhdGNoIGFuZCBqdXN0IHJlbW92ZSAKdGhlIHN3aXRjaCByaWdodCBi
ZWZvcmUgcHVibGlzaGluZyB0aGUgY2hhbmdlcy4KQXQgdGhlIGVuZCBvZiB0aGUgZGF5LCB3ZSBt
aWdodCB3YW50IGFkZGluZyBhIGNvbXBpbGUgdGltZSBvcHRpb24gd2hpY2ggCmVuYWJsZXMgYWRk
aXRpb25hbApjb21waWxlciBzd2l0Y2hlcyBmb3IgdGhlIHNhbWUgcHVycG9zZTogdGhpcyB3YXkg
dGhvc2UgYXJlIGRpc2FibGVkIGJ5IApkZWZhdWx0IChzbyBKYW4gd2lsbApiZSBoYXBweSkgYW5k
IGFyZSBlbmFibGVkIG9uIHJlcXVlc3QgKHNvIEp1bGllbiBpcyBoYXBweSkuCj4gQ2hlZXJzLAo+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
