From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 7/9] libxl: Make killing of device model
 asynchronous
Date: Wed, 28 Nov 2018 16:43:15 +0000
Message-ID: <23550.50595.50966.218438@mariner.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-7-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bc+K=OH=citrix.com=prvs=863aa12bc=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gS2vp-00007O-Ix
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:43:21 +0000
In-Reply-To: <20181123171502.29519-7-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggNy85XSBsaWJ4bDogTWFrZSBraWxsaW5nIG9m
IGRldmljZSBtb2RlbCBhc3luY2hyb25vdXMiKToKPiBPciBhdCBsZWFzdCwgZ2l2ZSBpdCBhbiBh
c3luY2hyb25vdXMgaW50ZXJmYWNlIHNvIHRoYXQgd2UgY2FuIG1ha2UgaXQKPiBhY3R1YWxseSBh
c3luY2hyb25vdXMgaW4gc3Vic2VxdWVudCBwYXRjaGVzLgo+IAo+IENyZWF0ZSBzdGF0ZSBzdHJ1
Y3R1cmVzIGFuZCBjYWxsYmFjayBmdW5jdGlvbiBzaWduYXR1cmVzLiAgQWRkIHRoZQo+IHN0YXRl
IHN0cnVjdHVyZSB0byBsaWJ4bF9fZGVzdHJveV9kb21pZF9zdGF0ZS4gIEJyZWFrCj4gbGlieGxf
X2Rlc3Ryb3lfZG9taWQgZG93biBpbnRvIHR3byBmdW5jdGlvbnMuCi4uLgo+ICsvKiBVc2VkIHRv
IGRldHJveSB0aGUgZGV2aWNlIG1vZGVsICovCj4gK19oaWRkZW4gdm9pZCBsaWJ4bF9fZGVzdHJv
eV9kZXZpY2VfbW9kZWwobGlieGxfX2VnYyAqZWdjLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxpYnhsX19kZXN0cm95X2RldmljZW1vZGVsX3N0YXRlICpkZG1z
KTsKCkkgdGhpbmsgdGhhdCBjb21tZW50IGlzIHJhdGhlciBwb2ludGxlc3MgKGJ1dCBJIHdvbid0
IG9iamVjdCBpZiB5b3UKcmVhbGx5IHdhbnQgdG8ga2VlcCBpdCkuICBDb252ZXJzZWx5IGl0IHdv
dWxkIGJlIG5pY2UgdG8gc2F5IHNvbWV3aGVyZQp0aGF0IGRkbXMtPmNhbGxiYWNrIG1heSBiZSBj
YWxsZWQgcmVlbnRyYW50bHkuCgpFdmVyeXRoaW5nIGVsc2UgTEdUTS4KClRoYW5rcywKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
