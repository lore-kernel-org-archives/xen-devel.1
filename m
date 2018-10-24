From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 4/4] xen/arm: gic: Relax barrier when
 sending an SGI
Date: Wed, 24 Oct 2018 15:40:26 +0000
Message-ID: <31fd2410-2a12-a086-e159-06512e5122f0@epam.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-5-julien.grall@arm.com>
 <0851d7c5-3da0-2749-648e-88a42b82449e@epam.com>
 <09283c74-c4a9-9d79-fc07-8e9dffef6dfd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <09283c74-c4a9-9d79-fc07-8e9dffef6dfd@arm.com>
Content-Language: en-US
Content-ID: <16720DB90FF0C74A8CB7F8AE15DC34A9@EPAM.onmicrosoft.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDI0LjEwLjE4IDE3OjQ2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gcGF0Y2ggIzEgYW5kICMy
IHNob3VsZCBiZSBiYWNrcG9ydGVkLiBUaGlzIHBhdGNoIGlzIHRlY2huaWNhbGx5IG5vdCBhIAo+
IGJ1ZyBmaXggYnV0IGEgcmVsYXhhdGlvbi4gU28gSSBhbSBub3QgY29tZm9ydGFibGUgdG8gc3Vn
Z2VzdCAKPiBiYWNrcG9ydGluZyBpdCB1cCB0byBYZW4gNC45LiBIZW5jZSB0aGUgb3JkZXJpbmcg
b2YgdGhlIHNlcmllcy4KT0ssIEkgdW5kZXJzdGFuZCB0aGUgbW90aXZhdGlvbiwgYnV0IHN0aWxs
IGZlZWwgc29tZSBvZGRuZXNzIGluIHRoYXQuCgpBbnl3YXksCgpSZXZpZXdlZC1ieTogQW5kcmlp
IEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIAoKKkFuZHJpaSBBbmlzb3YqCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
