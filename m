From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/3] [not-for-unstable] xen/arm: vgic-v3:
 Delay the initialization of the domain information
Date: Tue, 4 Sep 2018 20:35:49 +0100
Message-ID: <d6a3666c-0e8d-1707-f0de-b7a5ad1ba11a@arm.com>
References: <20180904192153.17210-1-julien.grall@arm.com>
 <20180904192153.17210-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0yqp=ls=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fxH7A-0006cr-KI
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 19:35:52 +0000
In-Reply-To: <20180904192153.17210-2-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, sstabellini@kernel.org, shameerali.kolothum.thodi@huawei.com, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwOS8wNC8yMDE4IDA4OjIxIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQSBmb2xs
b3ctdXAgcGF0Y2ggd2lsbCByZXF1aXJlIHRvIGtub3cgdGhlIG51bWJlciBvZiB2Q1BVcyB3aGVu
Cj4gaW5pdGlhbGl6YXRpbmcgdGhlIHZHSUN2MyBkb21haW4gc3RydWN0dXJlLiBIb3dldmVyIHRo
aXMgaW5mb3JtYXRpb24gaXMKPiBub3QgYXZhaWxhYmxlIGF0IGRvbWFpbiBjcmVhdGlvbi4gVGhp
cyBpcyBvbmx5IGtub3duIG9uY2UKPiBYRU5fRE9NQ1RMX21heF92cHVzIGlzIGNhbGxlZCBmb3Ig
dGhhdCBkb21haW4uCj4gCj4gSW4gb3JkZXIgdG8gZ2V0IHRoZSBtYXggdkNQVXMgYXJvdW5kLCBk
ZWxheSB0aGUgZG9tYWluIHBhcnQgb2YgdGhlIHZHSUMKPiB2MyBpbml0aWFsaXphdGlvbiB1bnRp
bCB0aGUgZmlyc3QgdkNQVSBvZiB0aGUgZG9tYWluIGlzIGluaXRpYWxpemVkLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gLS0tCj4g
Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gVGhp
cyBpcyBuYXN0eSBidXQgSSBjYW4ndCBmaW5kIGEgYmV0dGVyIHdheSBmb3IgWGVuIDQuMTEgYW5k
IG9sZGVyLiBUaGlzCj4gaXMgbm90IG5lY2Vzc2FyeSBmb3IgdW5zdGFibGUgYXMgdGhlIG51bWJl
ciBvZiB2Q1BVcyBpcyBrbm93biBhdCBkb21haW4KPiBjcmVhdGlvbi4KPiAKPiBBbmRyZXcsIEkg
aGF2ZSBDQ2VkIHlvdSB0byBrbm93IHdoZXRoZXIgeW91IGhhdmUgYSBiZXR0ZXIgaWRlYSB3aGVy
ZSB0bwo+IHBsYWNlIHRoaXMgY2FsbCBvbiBYZW4gNC4xMSBhbmQgb2xkZXIuCgpJIGp1c3Qgbm90
aWNlZCB0aGF0IGQtPm1heF92Y3B1cyBpcyBpbml0aWFsaXplZCBhZnRlciAKYXJjaF9kb21haW5f
Y3JlYXRlLiBTbyB3aXRob3V0IHRoaXMgcGF0Y2ggb24gWGVuIDQuMTIsIGl0IHdpbGwgbm90IHdv
cmsuCgpUaGlzIGlzIGdldHRpbmcgbmFzdGllciBiZWNhdXNlIGFyY2hfZG9tYWluX2luaXQgaXMg
dGhlIG9uZSBpbml0aWFsaXplIAp0aGUgdmFsdWUgcmV0dXJuZWQgYnkgZG9tMF9tYXhfdmNwdXMu
IFNvIEkgYW0gbm90IGVudGlyZWx5IHN1cmUgd2hhdCB0byAKZG8gaGVyZS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
