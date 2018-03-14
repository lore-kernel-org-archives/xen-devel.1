From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxc/arm: initialise p2m_size to make gcc
 happy
Date: Wed, 14 Mar 2018 12:35:48 +0000
Message-ID: <07ee36ed-a2c9-ac56-bceb-a3f85cfb27cb@citrix.com>
References: <20180314123203.30646-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=whqe=ge=citrix.com=prvs=604697e0d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ew5dO-0001Df-Oh
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 12:35:58 +0000
In-Reply-To: <20180314123203.30646-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMTggMTI6MzIsIFdlaSBMaXUgd3JvdGU6Cj4gR2NjIHdpdGggLU8zIGZhaWxlZCB0
byBzcG90IHRoZSBsb29wIHRvIGluaXRpYWxpc2UgcDJtX3NpemUgcnVucyBhdAo+IGxlYXN0IG9u
Y2UuCgpJdCBpcyAtT2cgaW4gdGhpcyBjYXNlLCByYXRoZXIgdGhhbiAtTzMuwqAgTXkgLU8zIGNv
bW1lbnQgb24gdGhlIHRocmVhZAp3YXMgZm9yIHRoZSBtb3JlIGdlbmVyaWMgY2FzZXMuCgp+QW5k
cmV3Cgo+Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAt
LS0KPiAgdG9vbHMvbGlieGMveGNfZG9tX2FybS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhjL3hjX2RvbV9hcm0uYyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9hcm0uYwo+IGluZGV4IDViOWVj
YTYwODcuLjk3ZDA4ZjA1NWEgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGMveGNfZG9tX2FybS5j
Cj4gKysrIGIvdG9vbHMvbGlieGMveGNfZG9tX2FybS5jCj4gQEAgLTM5NSw3ICszOTUsNyBAQCBz
dGF0aWMgaW50IG1lbWluaXQoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQo+ICAgICAgY29uc3Qg
dWludDY0X3QgbW9kc2l6ZSA9IGR0Yl9zaXplICsgcmFtZGlza19zaXplOwo+ICAgICAgY29uc3Qg
dWludDY0X3QgcmFtMTI4bWIgPSBiYW5rYmFzZVswXSArICgxMjg8PDIwKTsKPiAgCj4gLSAgICB4
ZW5fcGZuX3QgcDJtX3NpemU7Cj4gKyAgICB4ZW5fcGZuX3QgcDJtX3NpemUgPSAwOyAvKiBtYWtl
IGdjYyAtTzMgaGFwcHkgKi8KPiAgICAgIHVpbnQ2NF90IGJhbmswZW5kOwo+ICAKPiAgICAgIGFz
c2VydChkb20tPnJhbWJhc2VfcGZuIDw8IFhDX1BBR0VfU0hJRlQgPT0gYmFua2Jhc2VbMF0pOwo+
IEBAIC00MzgsNiArNDM4LDcgQEAgc3RhdGljIGludCBtZW1pbml0KHN0cnVjdCB4Y19kb21faW1h
Z2UgKmRvbSkKPiAgCj4gICAgICBhc3NlcnQoZG9tLT5yYW1iYW5rX3NpemVbMF0gIT0gMCk7Cj4g
ICAgICBhc3NlcnQocmFtc2l6ZSA9PSAwKTsgLyogVG9vIG11Y2ggUkFNIGlzIHJlamVjdGVkIGFi
b3ZlICovCj4gKyAgICBhc3NlcnQocDJtX3NpemUgIT0gMCk7Cj4gIAo+ICAgICAgZG9tLT5wMm1f
c2l6ZSA9IHAybV9zaXplOwo+ICAgICAgZG9tLT5wMm1faG9zdCA9IHhjX2RvbV9tYWxsb2MoZG9t
LCBzaXplb2YoeGVuX3Bmbl90KSAqIHAybV9zaXplKTsKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
