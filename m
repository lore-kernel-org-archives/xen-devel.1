From: Zhongze Liu <blackskygg@gmail.com>
Subject: Re: [PATCH v4 5/7] libxl: support unmapping static
 shared memory areas during domain destruction
Date: Mon, 12 Feb 2018 23:17:08 +0800
Message-ID: <CAHrd_jpSv_yOBYDvmVOWwue-Q_Gw4+6b=8+WFk0kAJncffZTuA@mail.gmail.com>
References: <20180130175024.26921-1-blackskygg@gmail.com>
 <20180130175024.26921-6-blackskygg@gmail.com>
 <ab02231f-e116-ac7a-57c9-676a4981dfab@arm.com>
 <20180206180623.ri47skutqiiv437r@citrix.com>
 <CAHrd_jqU=cK2Okg1kPd5J8R__MSoKqXzDCeptiOhfS=rHfJzfQ@mail.gmail.com>
 <aa3cf90d-2345-5fa0-5b65-5f7a5fc56b38@arm.com>
 <CAHrd_jpTGxOnjphH1wk8NJSpiw2FhAMNDGnGL2YYKpJ=wca0BQ@mail.gmail.com>
 <ebd7c9f4-4a71-365e-cbb6-05c20b9042b7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ebd7c9f4-4a71-365e-cbb6-05c20b9042b7@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKMjAxOC0wMi0xMiAyMzowOSBHTVQrMDg6MDAgSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT46Cj4gSGksCj4KPiBPbiAxMi8wMi8xOCAxNDo1MiwgWmhvbmd6ZSBM
aXUgd3JvdGU6Cj4+Cj4+IDIwMTgtMDItMDggMDo1NCBHTVQrMDg6MDAgSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT46Cj4+Pgo+Pj4gT24gMDcvMDIvMTggMTY6MjcsIFpob25nemUg
TGl1IHdyb3RlOgo+Pgo+PiBJdCBzZWVtcyB0aGF0IEkgbWlzdGFrZW5seSB1c2UgdHJhbnNhY3Rp
b24gYXMgYSBnbG9iYWwgbG9jay4gTm93IEkgZG9uJ3QKPj4gaGF2ZQo+PiBhbnkgcmVhc29ucyBu
b3QgcHV0dGluZyB0aGUgdW5tYXAgb3V0IG9mIHRoZSB0cmFuc2FjdGlvbiwgYnV0IHRoaXMgd2ls
bAo+PiBicmVhawo+PiB0aGUgb3JpZ2luYWwgdHJhbnNhY3Rpb24gaW50byB0d28sIGFuZCBJIGRv
IHRoaW5rIHRoYXQgd2UgbmVlZCBzb21lCj4+IGV4cGxpY2l0Cj4+IGxvY2tpbmcgaGVyZS4KPgo+
Cj4gQ2FuIHlvdSBleHBsYWluIHdoeSB5b3UgbmVlZCBzcGVjaWZpYyBsb2NraW5nIGhlcmU/IFdo
YXQgYXJlIHlvdSB0cnlpbmcgdG8KPiBwcm90ZWN0PyBBcmUgeW91IHRyeWluZyB0byBwcm90ZWN0
IGFnYWluc3QgdHdvIHByb2Nlc3MgZG9pbmcgdGhlIHVubWFwPwo+CgpZZXMuCgpDaGVlcnMsCgpa
aG9uZ3plIExpdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
