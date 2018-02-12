From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 5/7] libxl: support unmapping static
 shared memory areas during domain destruction
Date: Mon, 12 Feb 2018 15:09:43 +0000
Message-ID: <ebd7c9f4-4a71-365e-cbb6-05c20b9042b7@arm.com>
References: <20180130175024.26921-1-blackskygg@gmail.com>
 <20180130175024.26921-6-blackskygg@gmail.com>
 <ab02231f-e116-ac7a-57c9-676a4981dfab@arm.com>
 <20180206180623.ri47skutqiiv437r@citrix.com>
 <CAHrd_jqU=cK2Okg1kPd5J8R__MSoKqXzDCeptiOhfS=rHfJzfQ@mail.gmail.com>
 <aa3cf90d-2345-5fa0-5b65-5f7a5fc56b38@arm.com>
 <CAHrd_jpTGxOnjphH1wk8NJSpiw2FhAMNDGnGL2YYKpJ=wca0BQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAHrd_jpTGxOnjphH1wk8NJSpiw2FhAMNDGnGL2YYKpJ=wca0BQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhongze Liu <blackskygg@gmail.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMi8wMi8xOCAxNDo1MiwgWmhvbmd6ZSBMaXUgd3JvdGU6Cj4gMjAxOC0wMi0wOCAw
OjU0IEdNVCswODowMCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjoKPj4gT24g
MDcvMDIvMTggMTY6MjcsIFpob25nemUgTGl1IHdyb3RlOgo+IEl0IHNlZW1zIHRoYXQgSSBtaXN0
YWtlbmx5IHVzZSB0cmFuc2FjdGlvbiBhcyBhIGdsb2JhbCBsb2NrLiBOb3cgSSBkb24ndCBoYXZl
Cj4gYW55IHJlYXNvbnMgbm90IHB1dHRpbmcgdGhlIHVubWFwIG91dCBvZiB0aGUgdHJhbnNhY3Rp
b24sIGJ1dCB0aGlzIHdpbGwgYnJlYWsKPiB0aGUgb3JpZ2luYWwgdHJhbnNhY3Rpb24gaW50byB0
d28sIGFuZCBJIGRvIHRoaW5rIHRoYXQgd2UgbmVlZCBzb21lIGV4cGxpY2l0Cj4gbG9ja2luZyBo
ZXJlLgoKQ2FuIHlvdSBleHBsYWluIHdoeSB5b3UgbmVlZCBzcGVjaWZpYyBsb2NraW5nIGhlcmU/
IFdoYXQgYXJlIHlvdSB0cnlpbmcgCnRvIHByb3RlY3Q/IEFyZSB5b3UgdHJ5aW5nIHRvIHByb3Rl
Y3QgYWdhaW5zdCB0d28gcHJvY2VzcyBkb2luZyB0aGUgdW5tYXA/CgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
