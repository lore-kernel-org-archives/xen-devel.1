From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH MM-PART2 RESEND v2 11/19] xen/arm32: head:
 Don't set MAIR0 and MAIR1
Date: Mon, 3 Jun 2019 15:47:19 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1906031546580.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-12-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXvjd-0007oJ-JI
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:47:21 +0000
In-Reply-To: <20190514122456.28559-12-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBjby1wcm9jZXNz
b3IgcmVnaXN0ZXJzIE1BSVIwIGFuZCBNQUlSMSBhcmUgbWFuYWdlZCBieSBFTDEuIFNvIHRoZXJl
Cj4gYXJlIG5vIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIGR1cmluZyBYZW4gYm9vdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFJldmll
d2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4g
ICAgIENoYW5nZXMgaW4gdjIKPiAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4g
LS0tCj4gIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVh
ZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+IGluZGV4IGQ0MmExMzU1NmMuLjM0NDg4
MTdhYWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+ICsrKyBiL3hl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBAQCAtMjEyLDggKzIxMiw2IEBAIGNwdV9pbml0X2Rv
bmU6Cj4gICAgICAgICAgLyogU2V0IHVwIG1lbW9yeSBhdHRyaWJ1dGUgdHlwZSB0YWJsZXMgKi8K
PiAgICAgICAgICBsZHIgICByMCwgPU1BSVIwVkFMCj4gICAgICAgICAgbGRyICAgcjEsID1NQUlS
MVZBTAo+IC0gICAgICAgIG1jciAgIENQMzIocjAsIE1BSVIwKQo+IC0gICAgICAgIG1jciAgIENQ
MzIocjEsIE1BSVIxKQo+ICAgICAgICAgIG1jciAgIENQMzIocjAsIEhNQUlSMCkKPiAgICAgICAg
ICBtY3IgICBDUDMyKHIxLCBITUFJUjEpCj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
