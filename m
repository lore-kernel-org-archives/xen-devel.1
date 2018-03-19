From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 39/45] ARM: new VGIC: Add preliminary
 stub implementation
Date: Mon, 19 Mar 2018 09:54:55 +0000
Message-ID: <35d89ed1-280d-9eaf-c88b-8b6f5d5f74b8@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-40-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exrW2-0001IW-Vk
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 09:55:43 +0000
In-Reply-To: <20180315203050.19791-40-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8xNS8yMDE4IDA4OjMwIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBUaGUgQVJNIGFyY2ggY29kZSByZXF1aXJlcyBhbiBpbnRlcnJ1cHQgY29udHJvbGxlciBlbXVs
YXRpb24gdG8gaW1wbGVtZW50Cj4gdmdpY19jbGVhcl9wZW5kaW5nX2lycXMoKSwgYWx0aG91Z2gg
aXQgaXMgc3VzcGVjdGVkIHRoYXQgaXQgaXMgYWN0dWFsbHkKPiBub3QgbmVjZXNzYXJ5LiBHbyB3
aXRoIGEgc3R1YiBmb3Igbm93IHRvIG1ha2UgdGhlIGxpbmtlciBoYXBweS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KClJldmll
d2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKPiAt
LS0KPiAgIHhlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYyB8IDggKysrKysrKysKPiAgIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Zn
aWMvdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCj4gaW5kZXggMWFhZTY4ZmY4My4u
MDAyZmVjNTdlNiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKPiArKysg
Yi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKPiBAQCAtNzgxLDYgKzc4MSwxNCBAQCB2b2lkIGdp
Y19kdW1wX3ZnaWNfaW5mbyhzdHJ1Y3QgdmNwdSAqdikKPiAgICAgICBzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZ2LT5hcmNoLnZnaWMuYXBfbGlzdF9sb2NrLCBmbGFncyk7Cj4gICB9Cj4gICAKPiAr
dm9pZCB2Z2ljX2NsZWFyX3BlbmRpbmdfaXJxcyhzdHJ1Y3QgdmNwdSAqdikKPiArewo+ICsgICAg
LyoKPiArICAgICAqIFRPRE86IEl0IGlzIHVuY2xlYXIgd2hldGhlciB3ZSByZWFsbHkgbmVlZCB0
aGlzLCBzbyB3ZSBtaWdodCBpbnN0ZWFkCj4gKyAgICAgKiByZW1vdmUgaXQgb24gdGhlIGNhbGxl
ciBzaXRlLgo+ICsgICAgICovCj4gK30KPiArCj4gICAvKioKPiAgICAqIGFyY2hfbW92ZV9pcnFz
KCkgLSBtaWdyYXRlIHRoZSBwaHlzaWNhbCBhZmZpbml0eSBvZiBoYXJkd2FyZSBtYXBwZWQgdklS
UXMKPiAgICAqIEB2OiAgdGhlIHZDUFUsIGFscmVhZHkgYXNzaWduZWQgdG8gdGhlIG5ldyBwQ1BV
Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
