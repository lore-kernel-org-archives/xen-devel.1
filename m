From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 3/7] Arm/atomic: correct asm() constraints
 in build_add_sized()
Date: Mon, 11 Mar 2019 18:08:34 +0000
Message-ID: <9314781f-a219-591c-a35e-05163d114057@arm.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C8691A0020000780021D5F7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ahZP=RO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h3PLq-0002Qz-1L
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:08:38 +0000
In-Reply-To: <5C8691A0020000780021D5F7@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTEvMDMvMjAxOSAxNjo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIG1l
bW9yeSBvcGVyYW5kIGlzIGFuIGluL291dCBvbmUsIGFuZCB0aGUgYXV4aWxpYXJ5IHJlZ2lzdGVy
IGdldHMKPiB3cml0dGVuIHRvIGVhcmx5Lgo+IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBh
bHNvIGRyb3AgdGhlIHJlZHVuZGFudCBjYXN0ICh0aGUgaW5saW5lCj4gZnVuY3Rpb25zJyBwYXJh
bWV0ZXJzIGFyZSBhbHJlYWR5IG9mIHRoZSBjYXN0ZWQtdG8gdHlwZSkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSBndWVzcyB0aGlzIGlzIGNh
bmRpZGF0ZSBmb3IgYmFja3BvcnRpbmcuCgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCj4gCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9hdG9taWMuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXRvbWljLmgKPiBAQCAtMzAs
NyArMzAsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbmFtZSh2b2xhdGlsZSB0eXBlICphCj4gICAg
ICAgYXNtIHZvbGF0aWxlKCJsZHIiIHNpemUgIiAlIndpZHRoIjEsJTBcbiIgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgICAgICJhZGQgJSJ3aWR0aCIxLCUid2lk
dGgiMSwlIndpZHRoIjJcbiIgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgICAg
ICJzdHIiIHNpemUgIiAlIndpZHRoIjEsJTAiICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gLSAgICAgICAgICAgICAgICAgOiAiPW0iICgqKHZvbGF0aWxlIHR5cGUgKilhZGRyKSwgIj1y
IiAodCkgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICA6ICIrbSIgKCphZGRyKSwg
Ij0mciIgKHQpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAg
ICAgICA6IHJlZyAodmFsKSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICAgfQo+ICAgCj4gCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
