From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 08/23] xen/pt: io.c contains HVM only code
Date: Sun, 26 Aug 2018 13:19:41 +0100
Message-ID: <99ce7148c96ad6c8d71497daa27da51cf2fd247e.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu1U-0007Fg-D0
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:20:04 +0000
In-Reply-To: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2UgYWxzbyBuZWVkIHRvIG1ha2UgaXQgeDg2IG9ubHkgYmVjYXVzZSBBUk0gYWxzbyBkZWZpbmVz
IENPTkZJR19IVk0uCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgotLS0KdjI6IHVzZSB4ODYteSBsaXN0Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvTWFr
ZWZpbGUgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9NYWtlZmlsZSBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlCmluZGV4IDYwODczMzMuLmQ1MGFiMTggMTAw
NjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlCisrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlCkBAIC00LDYgKzQsOCBAQCBzdWJkaXItJChDT05GSUdf
WDg2KSArPSB4ODYKIHN1YmRpci0kKENPTkZJR19BUk0pICs9IGFybQogCiBvYmoteSArPSBpb21t
dS5vCi1vYmotJChDT05GSUdfWDg2KSArPSBpby5vCiBvYmotJChDT05GSUdfSEFTX1BDSSkgKz0g
cGNpLm8KIG9iai0kKENPTkZJR19IQVNfREVWSUNFX1RSRUUpICs9IGRldmljZV90cmVlLm8KKwor
eDg2LSQoQ09ORklHX0hWTSkgOj0gaW8ubworb2JqLSQoQ09ORklHX1g4NikgKz0gJCh4ODYteSkK
LS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
