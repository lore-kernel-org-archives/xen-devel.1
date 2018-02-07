From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH 1/2] ocaml/xb: update xb.mli in accordance
 with df1e4c6e7f8
Date: Wed, 7 Feb 2018 17:21:25 +0000
Message-ID: <C3FBC3F2-05F1-475A-ACC1-077CDC94EFB1@citrix.com>
References: <20180207170934.5360-1-wei.liu2@citrix.com>
 <20180207170934.5360-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tfz2=fb=citrix.com=prvs=569fc3f45=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1ejTVu-0005Q7-Ku
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 17:28:06 +0000
In-Reply-To: <20180207170934.5360-2-wei.liu2@citrix.com>
Content-Language: en-US
Content-ID: <B3F649574F91CE41B802F7344CB02905@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDcuIEZlYiAyMDE4LCBhdCAxNzowOSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiAtLS0KPiB0b29scy9vY2FtbC9saWJzL3hiL3hiLm1saSB8IDQgKystLQo+IDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL29jYW1sL2xpYnMveGIveGIubWxpIGIvdG9vbHMvb2NhbWwvbGlicy94Yi94Yi5tbGkK
PiBpbmRleCBiNGQ3MDUyMDFmLi45NWQxYzZmODQwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL29jYW1s
L2xpYnMveGIveGIubWxpCj4gKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yi94Yi5tbGkKPiBAQCAt
NzYsMTAgKzc2LDEwIEBAIHR5cGUgdCA9IHsKPiB2YWwgaW5pdF9wYXJ0aWFsX2luIDogdW5pdCAt
PiBwYXJ0aWFsX2J1Zgo+IHZhbCByZWNvbm5lY3QgOiB0IC0+IHVuaXQKPiB2YWwgcXVldWUgOiB0
IC0+IFBhY2tldC50IC0+IHVuaXQKPiAtdmFsIHJlYWRfZmQgOiBiYWNrZW5kX2ZkIC0+ICdhIC0+
IHN0cmluZyAtPiBpbnQgLT4gaW50Cj4gK3ZhbCByZWFkX2ZkIDogYmFja2VuZF9mZCAtPiAnYSAt
PiBieXRlcyAtPiBpbnQgLT4gaW50Cj4gdmFsIHJlYWRfbW1hcCA6IGJhY2tlbmRfbW1hcCAtPiAn
YSAtPiBzdHJpbmcgLT4gaW50IC0+IGludAo+IHZhbCByZWFkIDogdCAtPiBzdHJpbmcgLT4gaW50
IC0+IGludAo+IC12YWwgd3JpdGVfZmQgOiBiYWNrZW5kX2ZkIC0+ICdhIC0+IHN0cmluZyAtPiBp
bnQgLT4gaW50Cj4gK3ZhbCB3cml0ZV9mZCA6IGJhY2tlbmRfZmQgLT4gJ2EgLT4gYnl0ZXMgLT4g
aW50IC0+IGludAo+IHZhbCB3cml0ZV9tbWFwIDogYmFja2VuZF9tbWFwIC0+ICdhIC0+IHN0cmlu
ZyAtPiBpbnQgLT4gaW50Cj4gdmFsIHdyaXRlIDogdCAtPiBzdHJpbmcgLT4gaW50IC0+IGludAo+
IHZhbCBvdXRwdXQgOiB0IC0+IGJvb2wKPiAtLSAKPiAyLjExLjAKPiAKCkFja2VkLWJ5OiBDaHJp
c3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
