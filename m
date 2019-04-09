From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/9] libxl: Pointer on usage of
 libxl__domain_userdata_lock
Date: Tue, 9 Apr 2019 17:45:35 +0100
Message-ID: <20190409164542.30274-3-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDtsb-00088D-1I
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:45:49 +0000
In-Reply-To: <20190409164542.30274-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXQgaXMgY3VycmVudGx5IGRpZmZpY3VsdCB0byBrbm93IGhvdy93aGVuL3doeSB0aGUgdXNlcmRh
dGEgbG9jayBpcwpzdXBwb3NlZCB0byBiZSB1c2VkLiBBZGQgc29tZSBwb2ludGVycyB0byB0aGUg
aG90cGx1ZyBjb21tZW50cy4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCA2
ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
CmluZGV4IDk4YTFlZTYxNTkuLjcwMmFjYzZkNWQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtNDUw
MCw2ICs0NTAwLDEyIEBAIHZvaWQgbGlieGxfX3VubG9ja19kb21haW5fdXNlcmRhdGEobGlieGxf
X2RvbWFpbl91c2VyZGF0YV9sb2NrICpsb2NrKTsKICAqIGRhdGEgc3RvcmUuIFRoZSByZWdpc3Ry
eSBlbnRyeSBpbiBsaWJ4bCBwcml2YXRlIGRhdGEgc3RvcmUKICAqIGlzICJsaWJ4bC1qc29uIi4K
ICAqIENhbGxlciBtdXN0IGhvbGQgdXNlciBkYXRhIGxvY2suCisgKgorICogT3RoZXIgbmFtZXMg
dXNlZCBmb3IgdGhpcyBsb2NrIHRocm91Z2hvdXQgdGhlIGxpYnhsIGNvZGUgYXJlIGpzb25fbG9j
aywKKyAqIGxpYnhsX19kb21haW5fdXNlcmRhdGFfbG9jaywgImxpYnhsLWpzb24iLCBkYXRhIHN0
b3JlIGxvY2suCisgKgorICogU2VlIGNvbW1lbnRzIGFib3V0IGxpYnhsX19hb19kZXZpY2UgYW5k
ICJBbGdvcml0aG0gZm9yIGhhbmRsaW5nIGRldmljZQorICogcmVtb3ZhbCIgb24gaG93IHRoZSBs
aWJ4bC1qc29uIGxvY2sgLyBqc29uX2xvY2sgY2FuIGJlIHVzZWQuCiAgKi8KIGludCBsaWJ4bF9f
Z2V0X2RvbWFpbl9jb25maWd1cmF0aW9uKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NvbmZpZyAq
ZF9jb25maWcpOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
