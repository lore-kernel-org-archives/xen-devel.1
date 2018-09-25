From: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2] xen: Make XEN_BACKEND selectable by DomU
Date: Tue, 25 Sep 2018 07:36:55 -0400
Message-ID: <20180925113655.4501-1-jandryuk__43667.8496575498$1537875361$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=asxs=mh=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1g4leY-000423-Us
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 11:37:19 +0000
Received: by mail-qk1-x741.google.com with SMTP id s129-v6so10430158qke.5
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 04:37:17 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
List-Id: xen-devel@lists.xenproject.org

WEVOX0JBQ0tFTkQgZG9lc24ndCBhY3R1YWxseSBkZXBlbmQgb24gWEVOX0RPTTAuICBEb21VcyBj
YW4gc2VydmUKYmFja2VuZHMgdG8gb3RoZXIgRG9tVXMuICBPbmUgZXhhbXBsZSBpcyBhIHNlcnZp
Y2UgVk0gcHJvdmlkaW5nIG5ldHdvcmsKYmFja2VuZHMuCgpUaGUgb3JpZ2luYWwgS2NvbmZpZyBk
ZWZhdWx0ZWQgRG9tMCB0byB5IGFuZCBpdCBjb3VsZCBiZSBkaXNhYmxlZC4gIERvbVUKY291bGQg
bm90IHNlbGVjdCB0aGUgb3B0aW9uLiAgV2l0aCB0aGUgbmV3IEtjb25maWcsIHdlIGRlZmF1bHQg
eSBmb3IKRG9tMCBhbmQgbiBmb3IgRG9tVS4gIEVpdGhlciBjYW4gdGhlbiB0b2dnbGUgdGhlIHNl
bGVjdGlvbi4KClNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNv
bT4KLS0tCnYyOiBvbWl0IHN1cGVyZmx1b3VzICJ5IGlmIiBwZXIgSmFuIEJldWxpY2gKLS0tCiBk
cml2ZXJzL3hlbi9LY29uZmlnIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9LY29uZmlnIGIvZHJp
dmVycy94ZW4vS2NvbmZpZwppbmRleCBiNDU5ZWRmYWNmZjMuLjY5MmU4MmZjYWQxZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy94ZW4vS2NvbmZpZworKysgYi9kcml2ZXJzL3hlbi9LY29uZmlnCkBAIC0x
MDEsOCArMTAxLDcgQEAgY29uZmlnIFhFTl9ERVZfRVZUQ0hOCiAKIGNvbmZpZyBYRU5fQkFDS0VO
RAogCWJvb2wgIkJhY2tlbmQgZHJpdmVyIHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBYRU5fRE9NMAot
CWRlZmF1bHQgeQorCWRlZmF1bHQgWEVOX0RPTTAKIAloZWxwCiAJICBTdXBwb3J0IGZvciBiYWNr
ZW5kIGRldmljZSBkcml2ZXJzIHRoYXQgcHJvdmlkZSBJL08gc2VydmljZXMKIAkgIHRvIG90aGVy
IHZpcnR1YWwgbWFjaGluZXMuCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
