From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Problems with qemu when building with
 --enable-githttp
Date: Wed, 3 Apr 2019 12:52:08 +0100
Message-ID: <20190403115208.GA15054@zion.uk.xensource.com>
References: <CABfawhk_qq1xfQHwQPFAW4oJhaAQqjiECABfqKteUoO9zaRs5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Rv1=SF=citrix.com=prvs=9892ef700=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hBeRU-000084-Op
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 11:52:32 +0000
Content-Disposition: inline
In-Reply-To: <CABfawhk_qq1xfQHwQPFAW4oJhaAQqjiECABfqKteUoO9zaRs5w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMTA6Mjc6NDJBTSAtMDYwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IEhpIGFsbCwKPiBJJ20gdHJ5aW5nIHRvIGNvbXBpbGUgUkVMRUFTRS00LjEyLjAg
YnJhbmNoIHdpdGggLS1lbmFibGUtZ2l0aHR0cCBvbiBhCj4gbmV0d29yayB0aGF0IGJsb2NrcyBu
b3JtYWwgZ2l0IGFjY2Vzc2VzIGFuZCBJIGVuY291bnRlcmVkIHRoZQo+IGZvbGxvd2luZyBmYWls
dXJlczoKPiAKPiBmYXRhbDogY2xvbmUgb2YgJ2dpdDovL2dpdC5xZW11Lm9yZy9jYXBzdG9uZS5n
aXQnIGludG8gc3VibW9kdWxlIHBhdGgKPiAnL2RhdGEvc3JjL3hlbi90b29scy9xZW11LXhlbi1k
aXItcmVtb3RlL2NhcHN0b25lJyBmYWlsZWQKPiBGYWlsZWQgdG8gY2xvbmUgJ2NhcHN0b25lJy4g
UmV0cnkgc2NoZWR1bGVkCj4gQ2xvbmluZyBpbnRvICcvZGF0YS9zcmMveGVuL3Rvb2xzL3FlbXUt
eGVuLWRpci1yZW1vdGUvdWkva2V5Y29kZW1hcGRiJy4uLgo+IGZhdGFsOiB1bmFibGUgdG8gY29u
bmVjdCB0byBnaXQucWVtdS5vcmc6Cj4gZ2l0LnFlbXUub3JnWzA6IDE3Mi45OS42OS4xNjNdOiBl
cnJubz1Db25uZWN0aW9uIHRpbWVkIG91dAo+IAo+IGZhdGFsOiBjbG9uZSBvZiAnZ2l0Oi8vZ2l0
LnFlbXUub3JnL2tleWNvZGVtYXBkYi5naXQnIGludG8gc3VibW9kdWxlCj4gcGF0aCAnL2RhdGEv
c3JjL3hlbi90b29scy9xZW11LXhlbi1kaXItcmVtb3RlL3VpL2tleWNvZGVtYXBkYicgZmFpbGVk
Cj4gRmFpbGVkIHRvIGNsb25lICd1aS9rZXljb2RlbWFwZGInLiBSZXRyeSBzY2hlZHVsZWQKPiBD
bG9uaW5nIGludG8gJy9kYXRhL3NyYy94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyLXJlbW90ZS9jYXBz
dG9uZScuLi4KPiBmYXRhbDogdW5hYmxlIHRvIGNvbm5lY3QgdG8gZ2l0LnFlbXUub3JnOgo+IGdp
dC5xZW11Lm9yZ1swOiAxNzIuOTkuNjkuMTYzXTogZXJybm89Q29ubmVjdGlvbiB0aW1lZCBvdXQK
PiAKPiBBcmUgdGhlcmUgYW55IGtub3duIHdvcmthcm91bmRzIHRvIHRoYXQgb3IgZG8gSSBoYXZl
IHRvIGdvIGluIGFuZAo+IG1hbnVhbGx5IGFkanVzdCBlYWNoIHN1Ym1vZHVsZSBpbiBxZW11PwoK
SSdtIGFmcmFpZCBzby4gSSBkb24ndCBrbm93IGFueSB3b3JrYXJvdW5kIGFuZCB3ZSBkb24ndCBj
b250cm9sIHdoYXQKUUVNVSBwdXRzIGludG8gaXRzIHJlcG9zaXRvcnkuCgpXZWkuCgo+IAo+IFRo
YW5rcywKPiBUYW1hcwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
