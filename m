From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v4 5/7] libxl: support unmapping static
 shared memory areas during domain destruction
Date: Mon, 26 Feb 2018 12:08:44 +0000
Message-ID: <23187.63692.230171.12223@mariner.uk.xensource.com>
References: <20180130175024.26921-1-blackskygg@gmail.com>
 <20180130175024.26921-6-blackskygg@gmail.com>
 <ab02231f-e116-ac7a-57c9-676a4981dfab@arm.com>
 <20180206180623.ri47skutqiiv437r@citrix.com>
 <CAHrd_jqU=cK2Okg1kPd5J8R__MSoKqXzDCeptiOhfS=rHfJzfQ@mail.gmail.com>
 <aa3cf90d-2345-5fa0-5b65-5f7a5fc56b38@arm.com>
 <CAHrd_jpTGxOnjphH1wk8NJSpiw2FhAMNDGnGL2YYKpJ=wca0BQ@mail.gmail.com>
 <ebd7c9f4-4a71-365e-cbb6-05c20b9042b7@arm.com>
 <CAHrd_jpSv_yOBYDvmVOWwue-Q_Gw4+6b=8+WFk0kAJncffZTuA@mail.gmail.com>
 <01bfbfe7-bd89-0fbe-f94b-ef127584e702@arm.com>
 <20180214143932.xyjuswafqcgdic7r@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180214143932.xyjuswafqcgdic7r@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Zhongze Liu <blackskygg@gmail.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIHY0IDUvN10gbGlieGw6IHN1
cHBvcnQgdW5tYXBwaW5nIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGFyZWFzIGR1cmluZyBkb21haW4g
ZGVzdHJ1Y3Rpb24iKToKPiBPbiBNb24sIEZlYiAxMiwgMjAxOCBhdCAwMzoyNDoyNlBNICswMDAw
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiBJbiBhbnkgY2FzZSwgdGhlIHdvcnN0IHRoYXQgY291
bGQgaGFwcGVuIGlzIHRoZSB1bm1hcCBpcyBjYWxsZWQgdHdpY2Ugb24gdGhlCj4gPiBzYW1lIHJl
Z2lvbi4gU28geW91IHdvdWxkIGdldCBzcHVyaW91cyBlcnJvciBtZXNzYWdlLiBOb3QgdGhhdCBi
YWQuCj4gCj4gWWVhaCwgbm90IHRoYXQgYmFkLiBOb3QgZ29pbmcgdG8gYmUgYSBzZWN1cml0eSBp
c3N1ZSwgbm90IGdvaW5nIHRvIGxlYWsKPiByZXNvdXJjZXMgaW4gdGhlIGVuZC4KPiAKPiBUbyBh
dm9pZCBzcHVyaW91cyB1bm1hcCwgY2FuIHdlIG1heWJlIHVubWFwIHRoZSBwYWdlcyBhZnRlciB0
aGUgeGVuc3RvcmUKPiB0cmFuc2FjdGlvbiBpcyBjb21taXR0ZWQ/IEluIHRoYXQgY2FzZSwgb25s
eSB0aGUgc3VjY2Vzc2Z1bCBvbmUgZ2V0cyB0bwo+IHVubWFwLCB0aGUgb25lcyB0aGF0IGFyZW4n
dCBjb21taXR0ZWQgd2lsbCBiYWlsLgo+IAo+IChKdXN0IHRvc3NpbmcgYXJvdW5kIGlkZWFzKQoK
SXQgc2hvdWxkIGJlIHRoZSBvdGhlciB3YXkgYXJvdW5kLiAgQmVjYXVzZSwgeW91ciB3YXksIGlm
IHlvdXIgcHJvY2VzcwpjcmFzaGVzIGZvciBzb21lIHJlYXNvbiBiZXR3ZWVuIHRoZSB4ZW5zdG9y
ZSBjb21taXQgYW5kIHRoZSB1bm1hcCwgdGhlCm1lbW9yeSBpcyBsZWFrZWQuCgpJbnN0ZWFkLCBk
byB0aGUgdW5tYXAgZmlyc3QuICBDaGVjayB0aGUgZXJyb3IgY29kZSB0byBzZWUgaWYgaXQgbWVh
bnMKInRoaXMgd2FzIGFscmVhZHkgdW5tYXBwZWQiIGFuZCBpZiBzbyByZXBvcnQgdGhhdCBvbmx5
IHZpYSBhIGRlYnVnIGxvZwptZXNzYWdlLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
