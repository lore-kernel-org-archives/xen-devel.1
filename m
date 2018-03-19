From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 24/45] ARM: new VGIC: Add CTLR,
	TYPER and IIDR handlers
Date: Mon, 19 Mar 2018 08:13:26 +0000
Message-ID: <a2b39967-4cff-a66d-8603-ba13be789fdf@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-25-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1expvn-0001hH-E0
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 08:14:11 +0000
In-Reply-To: <20180315203050.19791-25-andre.przywara@linaro.org>
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
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5oIGIveGVuL2FyY2gvYXJtL3Zn
aWMvdmdpYy5oCj4gaW5kZXggN2YyMjFmZDE5NS4uZTJkMGYwNDQ0MCAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmgKPiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmgK
PiBAQCAtMTcsNiArMTcsMTAgQEAKPiAgICNpZm5kZWYgX19YRU5fQVJNX1ZHSUNfVkdJQ19IX18K
PiAgICNkZWZpbmUgX19YRU5fQVJNX1ZHSUNfVkdJQ19IX18KPiAgIAo+ICsjZGVmaW5lIFBST0RV
Q1RfSURfS1ZNICAgICAgICAgIDB4NGIgICAgICAgIC8qIEFTQ0lJIGNvZGUgWCAqLwoKSSB0aGlu
ayB5b3UgbWVhbiAnQVNDSUkgY29kZSBLJy4KCkFsc28sIGRvIHlvdSB3YW50IHRvIGNvcHkgdGhl
IGNvbW1pdCBtZXNzYWdlIGFib3V0IHRoZSBpZGVudGlmaWVyIGluIHRoZSAKY29kZT8KCj4gKyNk
ZWZpbmUgVkFSSUFOVF9JRF9YRU4gICAgICAgICAgMHgwMQo+ICsjZGVmaW5lIElNUExFTUVOVEVS
X0FSTSAgICAgICAgIDB4NDNiCj4gKwo+ICAgI2RlZmluZSB2Z2ljX2lycV9pc19zZ2koaW50aWQp
ICgoaW50aWQpIDwgVkdJQ19OUl9TR0lTKQo+ICAgCj4gICBzdGF0aWMgaW5saW5lIGJvb2wgaXJx
X2lzX3BlbmRpbmcoc3RydWN0IHZnaWNfaXJxICppcnEpCj4gQEAgLTM3LDYgKzQxLDcgQEAgc3Ry
dWN0IHZnaWNfaXJxICp2Z2ljX2dldF9pcnEoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUg
KnZjcHUsCj4gICB2b2lkIHZnaWNfcHV0X2lycShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qgdmdp
Y19pcnEgKmlycSk7Cj4gICB2b2lkIHZnaWNfcXVldWVfaXJxX3VubG9jayhzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3QgdmdpY19pcnEgKmlycSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3MpOwo+ICt2b2lkIHZnaWNfa2lja192Y3B1cyhzdHJ1Y3QgZG9t
YWluICpkKTsKPiAgIAo+ICAgc3RhdGljIGlubGluZSB2b2lkIHZnaWNfZ2V0X2lycV9rcmVmKHN0
cnVjdCB2Z2ljX2lycSAqaXJxKQo+ICAgewo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
