From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 5/7] libxl: support unmapping static
 shared memory areas during domain destruction
Date: Mon, 12 Feb 2018 15:24:26 +0000
Message-ID: <01bfbfe7-bd89-0fbe-f94b-ef127584e702@arm.com>
References: <20180130175024.26921-1-blackskygg@gmail.com>
 <20180130175024.26921-6-blackskygg@gmail.com>
 <ab02231f-e116-ac7a-57c9-676a4981dfab@arm.com>
 <20180206180623.ri47skutqiiv437r@citrix.com>
 <CAHrd_jqU=cK2Okg1kPd5J8R__MSoKqXzDCeptiOhfS=rHfJzfQ@mail.gmail.com>
 <aa3cf90d-2345-5fa0-5b65-5f7a5fc56b38@arm.com>
 <CAHrd_jpTGxOnjphH1wk8NJSpiw2FhAMNDGnGL2YYKpJ=wca0BQ@mail.gmail.com>
 <ebd7c9f4-4a71-365e-cbb6-05c20b9042b7@arm.com>
 <CAHrd_jpSv_yOBYDvmVOWwue-Q_Gw4+6b=8+WFk0kAJncffZTuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAHrd_jpSv_yOBYDvmVOWwue-Q_Gw4+6b=8+WFk0kAJncffZTuA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhongze Liu <blackskygg@gmail.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8wMi8xOCAxNToxNywgWmhvbmd6ZSBMaXUgd3JvdGU6Cj4gSGkgSnVsaWVuLAoKSGks
Cgo+IAo+IDIwMTgtMDItMTIgMjM6MDkgR01UKzA4OjAwIEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Ogo+PiBIaSwKPj4KPj4gT24gMTIvMDIvMTggMTQ6NTIsIFpob25nemUgTGl1
IHdyb3RlOgo+Pj4KPj4+IDIwMTgtMDItMDggMDo1NCBHTVQrMDg6MDAgSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT46Cj4+Pj4KPj4+PiBPbiAwNy8wMi8xOCAxNjoyNywgWmhvbmd6
ZSBMaXUgd3JvdGU6Cj4+Pgo+Pj4gSXQgc2VlbXMgdGhhdCBJIG1pc3Rha2VubHkgdXNlIHRyYW5z
YWN0aW9uIGFzIGEgZ2xvYmFsIGxvY2suIE5vdyBJIGRvbid0Cj4+PiBoYXZlCj4+PiBhbnkgcmVh
c29ucyBub3QgcHV0dGluZyB0aGUgdW5tYXAgb3V0IG9mIHRoZSB0cmFuc2FjdGlvbiwgYnV0IHRo
aXMgd2lsbAo+Pj4gYnJlYWsKPj4+IHRoZSBvcmlnaW5hbCB0cmFuc2FjdGlvbiBpbnRvIHR3bywg
YW5kIEkgZG8gdGhpbmsgdGhhdCB3ZSBuZWVkIHNvbWUKPj4+IGV4cGxpY2l0Cj4+PiBsb2NraW5n
IGhlcmUuCj4+Cj4+Cj4+IENhbiB5b3UgZXhwbGFpbiB3aHkgeW91IG5lZWQgc3BlY2lmaWMgbG9j
a2luZyBoZXJlPyBXaGF0IGFyZSB5b3UgdHJ5aW5nIHRvCj4+IHByb3RlY3Q/IEFyZSB5b3UgdHJ5
aW5nIHRvIHByb3RlY3QgYWdhaW5zdCB0d28gcHJvY2VzcyBkb2luZyB0aGUgdW5tYXA/Cj4+Cj4g
Cj4gWWVzLgoKSSBkb24ndCB0aGluayB5b3UgaGF2ZSB0byB3b3JyeSBhYm91dCB0aGUgbG9ja2lu
ZyBoZXJlLiBXaXRoIHRoZSBjdXJyZW50IAppbnRlcmZhY2UsIHRoZSByZWdpb25zIGNhbm5vdCBi
ZSBtb2RpZmllZCBhZnRlciB0aGUgZ3Vlc3QgaGFzIGJvb3RlZC4gU28gCnRoZSBhZGRyZXNzZXMg
d2lsbCBhbHdheXMgc3RheSB2YWxpZC4KClRoaXMgY29kZSBwYXRoIHNob3VsZCBuZXZlciBiZSBj
YWxsZWQgY29uY3VycmVudGx5LCBhcyBhIGxvdCBvZiBjb2RlIGluIApsaWJ4bCwgc28gSSB0aGlu
ayBzb21lb25lIGVsc2Ugd2lsbCB0YWtlIGNhcmUgYWJvdXQgdGhhdCBmb3IgeW91IChJIHdpbGwg
CmxldCBXZWkgY29uZmlybSBoZXJlKS4KCkluIGFueSBjYXNlLCB0aGUgd29yc3QgdGhhdCBjb3Vs
ZCBoYXBwZW4gaXMgdGhlIHVubWFwIGlzIGNhbGxlZCB0d2ljZSBvbiAKdGhlIHNhbWUgcmVnaW9u
LiBTbyB5b3Ugd291bGQgZ2V0IHNwdXJpb3VzIGVycm9yIG1lc3NhZ2UuIE5vdCB0aGF0IGJhZC4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
