From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] ts-xen-build: run `make all' before
 `make', by default
Date: Wed, 9 May 2018 16:58:18 +0100
Message-ID: <1525881498-31581-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eoq2=h4=citrix.com=prvs=6607ecac8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fGRUM-0007Mw-Q5
 for xen-devel@lists.xenproject.org; Wed, 09 May 2018 15:58:46 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbiBidWlsZCBzeXN0ZW0gaGFzIHNvbWUgcXVpcmtzLiAgT25lIG9mIHRoZW0gaXMgdGhh
dCBgbWFrZScgaXMgYQp2ZXJzaW9uIG9mIGBtYWtlIGRpc3QnIHdoaWNoIGlzIGEgdmVyc2lvbiBv
ZiBgbWFrZSBpbnN0YWxsJywgd2hpY2gKcnVucyBgbWFrZSBpbnN0YWxsJyBpbiBlYWNoIHN1YmRp
ciAtIGJ1dCB0aGVyZSBhcmUgc3ViZGlycyB3aGVyZSBgbWFrZQppbnN0YWxsJyBpcyBhIG5vLW9w
IHdoaWNoIGRvZXMgbm90IGRlcGVuZCBvbiBgbWFrZSBhbGwnLiAgUGVyaGFwcyB0aGUKbGF0dGVy
IGlzIGEgbWlzdGFrZSwgYnV0IGl0J3Mgbm90IG9uZSB3ZSBjYW4gY29ycmVjdCBpbiBzdGFibGUK
YnJhbmNoZXMuCgpUaGUgcmVzdWx0IGlzIHRoYXQgd2UgbWlnaHQgbWlzcyBidWdzIHdoZXJlIGBt
YWtlIGFsbCcgZmFpbHMuICBFZywgdGhlCnJlY2VudGx5IGRpc2NvdmVyZWQgYnVpbGQgZmFpbHVy
ZXMgaW4gdGhlIGVtdWxhdG9yIHRlc3RzLCBkdWUgdG8KYmFja3BvcnRlZCBjaGFuZ2VzLgoKRGV0
ZWN0IHRoZXNlIGJ5IHJ1bm5pbmcgYG1ha2UgYWxsJyBiZWZvcmUgYG1ha2UnICh1bmxlc3Mgb3Vy
IGNhbGxlcgpoYXMgc3BlY2lmaWVkIHNvbWUgb3RoZXIgYnVpbGQgYXJndW1lbnRzKS4gIEluIHRo
ZSBmdXR1cmUgcGVyaGFwcyB3ZQpzaG91bGQgZG8gdG9vbHMgYW5kIGh5cGVydmlzb3IgYnVpbGRz
IGVudGlyZWx5IHNlcGFyYXRlbHkuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy14ZW4tYnVpbGQgfCA2ICsrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLXhlbi1idWlsZCBiL3Rz
LXhlbi1idWlsZAppbmRleCBjNWQyYTFkLi4wMThiYzZhIDEwMDc1NQotLS0gYS90cy14ZW4tYnVp
bGQKKysrIGIvdHMteGVuLWJ1aWxkCkBAIC0xNjAsNiArMTYwLDEyIEBAIEVORAogICAgICAgICAg
ICAgZmkKIEVORAogCisgICAgaWYgKCFAbWFrZV9hcmdzKSB7CisJYnVpbGRjbWRfc3RhbXBlZF9s
b2dnZWQoOTAwMCwgJ3hlbicsICdhbGwnLCAnJyw8PEVORCwnJyk7CisgICAgICAgICAgICAkbWFr
ZV9wcmVmaXggbWFrZSAkbWFrZWZsYWdzIGFsbAorRU5ECisgICAgfQorCiAgICAgYnVpbGRjbWRf
c3RhbXBlZF9sb2dnZWQoOTAwMCwgJ3hlbicsICdidWlsZCcsICcnLDw8RU5ELCcnKTsKICAgICAg
ICAgICAgICRtYWtlX3ByZWZpeCBtYWtlICRtYWtlZmxhZ3MgQG1ha2VfYXJncwogRU5ECi0tIAoy
LjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
