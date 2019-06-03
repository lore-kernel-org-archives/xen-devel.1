From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
Date: Mon, 3 Jun 2019 23:05:34 +0100
Message-ID: <8fe2cf58-d890-bdd4-3572-1785fe6aa607@arm.com>
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
 <20190603220245.22750-3-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXv5H-0003t9-LG
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:05:39 +0000
In-Reply-To: <20190603220245.22750-3-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, JBeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA2LzMvMTkgMTE6MDIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9wZHguYyBiL3hlbi9jb21tb24vcGR4LmMKPiBpbmRleCBiYjdl
NDM3MDQ5Li5hM2M2ZjRjMWVlIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vcGR4LmMKPiArKysg
Yi94ZW4vY29tbW9uL3BkeC5jCj4gQEAgLTUwLDkgKzUwLDEyIEBAIHN0YXRpYyB1NjQgX19pbml0
IGZpbGxfbWFzayh1NjQgbWFzaykKPiAgICAgICByZXR1cm4gbWFzazsKPiAgIH0KPiAgIAo+ICsv
Kgo+ICsgKiBXZSBkb24ndCBjb21wcmVzcyB0aGUgZmlyc3QgTUFYX09SREVSIGJpdCBvZiB0aGUg
YWRkcmVzc2VzLgo+ICsgKi8KPiAgIHU2NCBfX2luaXQgcGR4X2luaXRfbWFzayh1NjQgYmFzZV9h
ZGRyKQo+ICAgewo+IC0gICAgcmV0dXJuIGZpbGxfbWFzayhiYXNlX2FkZHIgLSAxKTsKPiArICAg
IHJldHVybiBmaWxsX21hc2sobWF4KGJhc2VfYWRkciwgKHU2NCkxIDw8IChNQVhfT1JERVIgKyBQ
QUdFX1NISUZUKSkgLSAxKTsKClNlZSBteSBjb21tZW50IG9uIHYyIHJlZ2FyZGluZyB1NjQgdnMg
dWludDY0X3QuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
