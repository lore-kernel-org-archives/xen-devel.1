From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Wed, 13 Mar 2019 15:24:41 +0000
Message-ID: <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ZEN=RQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h45kL-0005Tk-DP
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 15:24:45 +0000
In-Reply-To: <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTMvMDMvMjAxOSAxNToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTguMDIuMTkgYXQgMTI6MzYsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21t
LmgKPj4gQEAgLTMyMSwxMCArMzIxLDggQEAgc3RydWN0IHBhZ2VfaW5mbyAqZ2V0X3BhZ2VfZnJv
bV9ndmEoc3RydWN0IHZjcHUgKnYsIHZhZGRyX3QgdmEsCj4+ICAgI2RlZmluZSBTSEFSRURfTTJQ
X0VOVFJZICAgICAgICAgKH4wVUwgLSAxVUwpCj4+ICAgI2RlZmluZSBTSEFSRURfTTJQKF9lKSAg
ICAgICAgICAgKChfZSkgPT0gU0hBUkVEX00yUF9FTlRSWSkKPj4gICAKPj4gLS8qIFhlbiBhbHdh
eXMgb3ducyBQMk0gb24gQVJNICovCj4+ICsvKiBXZSBkb24ndCBoYXZlIGEgTTJQIG9uIEFybSAq
Lwo+PiAgICNkZWZpbmUgc2V0X2dwZm5fZnJvbV9tZm4obWZuLCBwZm4pIGRvIHsgKHZvaWQpICht
Zm4pLCAodm9pZCkocGZuKTsgfSB3aGlsZSAoMCkKPj4gLSNkZWZpbmUgbWZuX3RvX2dtZm4oX2Qs
IG1mbikgIChtZm4pCj4gCj4gU28gaXMgdGhlIHBsYW4gdG8gcmVtb3ZlIHRoZSBvdGhlciBtYWNy
byBmcm9tIEFybSB0aGVuIGFzIHdlbGw/CgpEbyB5b3UgbWVhbiBtZm5fdG9fZ2ZuPyBJZiBzbyBp
dCBkb2VzIG5vdCBleGlzdCBvbiBBcm0uCgo+IEluIGFueSBldmVudAo+IEFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpDaGVlcnMsCgo+IAo+IEphbgo+IAo+IAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
