From: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 3/3] xen: Disable ARINC653 scheduler by default
	for non-DEBUG builds
Date: Mon, 5 Feb 2018 11:36:42 +0000
Message-ID: <20180205113642.3174-3-george.dunlap@citrix.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=invn=e7=citrix.com=prvs=567d2a528=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eif4v-0006Jt-Iu
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 11:36:53 +0000
In-Reply-To: <20180205113642.3174-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIEFSSU5DNjUzIHNjaGVkdWxlciBpcyB0YXJnZXRlZCBhdCBhIHZlcnkgc3BlY2lmaWMgbmlj
aGU7IHR5cGljYWwKdXNlcnMgY2Fubm90IGJlbmVmaXQgZnJvbSB1c2luZyBpdC4gIERpc2FibGUg
aXQgYnkgZGVmYXVsdCBmb3IKbm9uLURFQlVHIGJ1aWxkcy4gIChFbmFibGUgaXQgZm9yIERFQlVH
IGJ1aWxkcyBzbyB0aGF0IHdlIGNhdGNoIGFueQpidWlsZCBicmVha2FnZXMgc29vbmVyIHJhdGhl
ciB0aGFuIGxhdGVyLikKClNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNv
bT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBLb25yYWQgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KQ0M6IEpvc2ggV2hpdGVoZWFkIDxqb3NoLndoaXRlaGVhZEBkb3JuZXJ3b3Jrcy5j
b20+CkNDOiBSb2JlcnQgVmFuVm9zc2VuIDxyb2JlcnQudmFudm9zc2VuQGRvcm5lcndvcmtzLmNv
bT4KLS0tCiB4ZW4vY29tbW9uL0tjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcg
Yi94ZW4vY29tbW9uL0tjb25maWcKaW5kZXggMTMxMzE4ZDYzYS4uODJhMzRjNWQ3OSAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCisrKyBiL3hlbi9jb21tb24vS2NvbmZpZwpAQCAtMTg2
LDcgKzE4Niw3IEBAIGNvbmZpZyBTQ0hFRF9SVERTCiAKIGNvbmZpZyBTQ0hFRF9BUklOQzY1Mwog
CWJvb2wgIkFSSU5DNjUzIHNjaGVkdWxlciBzdXBwb3J0IChFWFBFUklNRU5UQUwpIgotCWRlZmF1
bHQgeQorCWRlZmF1bHQgREVCVUcKIAktLS1oZWxwLS0tCiAJICBUaGUgQVJJTkM2NTMgc2NoZWR1
bGVyIGlzIGEgaGFyZCByZWFsLXRpbWUgc2NoZWR1bGVyIGZvciBzaW5nbGUKIAkgIGNvcmVzLCB0
YXJnZXRlZCBmb3IgYXZpb25pY3MsIGRyb25lcywgYW5kIG1lZGljYWwgZGV2aWNlcy4KLS0gCjIu
MTUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
