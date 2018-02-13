From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 24/49] ARM: new VGIC: Add IRQ sync/flush
	framework
Date: Tue, 13 Feb 2018 14:31:08 +0000
Message-ID: <d8a26d02-11a6-646a-93f3-a96b158948ae@arm.com>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
 <20180209143937.28866-25-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=nkxj=fh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1elbc6-0002LR-7b
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 14:31:18 +0000
In-Reply-To: <20180209143937.28866-25-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwOS8wMi8xOCAxNDozOSwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gKy8q
IFJlcXVpcmVzIHRoZSBWQ1BVJ3MgYXBfbGlzdF9sb2NrIHRvIGJlIGhlbGQuICovCj4gK3N0YXRp
YyB2b2lkIHZnaWNfZmx1c2hfbHJfc3RhdGUoc3RydWN0IHZjcHUgKnZjcHUpCj4gK3sKPiArICAg
IHN0cnVjdCB2Z2ljX2NwdSAqdmdpY19jcHUgPSAmdmNwdS0+YXJjaC52Z2ljX2NwdTsKPiArICAg
IHN0cnVjdCB2Z2ljX2lycSAqaXJxOwo+ICsgICAgaW50IGNvdW50ID0gMDsKPiArCj4gKyAgICBB
U1NFUlQoc3Bpbl9pc19sb2NrZWQoJnZnaWNfY3B1LT5hcF9saXN0X2xvY2spKTsKPiArCj4gKyAg
ICBpZiAoIGNvbXB1dGVfYXBfbGlzdF9kZXB0aCh2Y3B1KSA+IGdpY19nZXRfbnJfbHJzKCkgKQo+
ICsgICAgICAgIHZnaWNfc29ydF9hcF9saXN0KHZjcHUpOwo+ICsKPiArICAgIGxpc3RfZm9yX2Vh
Y2hfZW50cnkoIGlycSwgJnZnaWNfY3B1LT5hcF9saXN0X2hlYWQsIGFwX2xpc3QgKQo+ICsgICAg
ewo+ICsgICAgICAgIHNwaW5fbG9jaygmaXJxLT5pcnFfbG9jayk7Cj4gKwo+ICsgICAgICAgIGlm
ICggdW5saWtlbHkodmdpY190YXJnZXRfb3JhY2xlKGlycSkgIT0gdmNwdSkgKQo+ICsgICAgICAg
ICAgICBnb3RvIG5leHQ7Cj4gKwo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogSWYgd2UgZ2V0
IGFuIFNHSSB3aXRoIG11bHRpcGxlIHNvdXJjZXMsIHRyeSB0byBnZXQKPiArICAgICAgICAgKiB0
aGVtIGluIGFsbCBhdCBvbmNlLgo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIGRvCj4gKyAgICAg
ICAgewo+ICsgICAgICAgICAgICB2Z2ljX3BvcHVsYXRlX2xyKHZjcHUsIGlycSwgY291bnQrKyk7
Cj4gKyAgICAgICAgfSB3aGlsZSAoIGlycS0+c291cmNlICYmIGNvdW50IDwgZ2ljX2dldF9ucl9s
cnMoKSApOwo+ICsKPiArbmV4dDoKPiArICAgICAgICBzcGluX3VubG9jaygmaXJxLT5pcnFfbG9j
ayk7Cj4gKwo+ICsgICAgICAgIGlmICggY291bnQgPT0gZ2ljX2dldF9ucl9scnMoKSApCj4gKyAg
ICAgICAgewo+ICsgICAgICAgICAgICBpZiAoICFsaXN0X2lzX2xhc3QoJmlycS0+YXBfbGlzdCwg
JnZnaWNfY3B1LT5hcF9saXN0X2hlYWQpICkKPiArICAgICAgICAgICAgICAgIHZnaWNfc2V0X3Vu
ZGVyZmxvdyh2Y3B1KTsKPiArICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgfQo+ICsgICAg
fQo+ICsKPiArICAgIHZjcHUtPmFyY2gudmdpY19jcHUudXNlZF9scnMgPSBjb3VudDsKPiArCj4g
KyAgICAvKiBOdWtlIHJlbWFpbmluZyBMUnMgKi8KPiArICAgIGZvciAoIDsgY291bnQgPCBnaWNf
Z2V0X25yX2xycygpOyBjb3VudCsrKQo+ICsgICAgICAgIHZnaWNfY2xlYXJfbHIodmNwdSwgY291
bnQpOwoKV2h5IGRvIHlvdSBuZWVkIHRvIG51a2UgdGhlIExScyBoZXJlLCBkb24ndCB5b3UgYWx3
YXlzIHplcm8gdGhlbSB3aGVuIApjbGVhcmluZyBpdD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
