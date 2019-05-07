From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] gitlab-ci: avoid deleting
 build-each-commit-gcc.log
Date: Tue, 7 May 2019 17:11:01 +0100
Message-ID: <20190507161101.10232-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M5sH=TH=citrix.com=prvs=0233d00f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hO2gN-0006ry-WB
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:11:08 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MDcyYTk2YzQ5MDEgdXNlZCBgZ2l0IGNsZWFuIC1mZmR4YCB3aGljaCBjYXVzZWQgdGhlIGxvZyB0
byBiZSBkZWxldGVkLgoKR2VuZXJhdGUgdGhlIGxvZyBpbiB0aGUgcGFyZW50IGRpcmVjdG9yeSB0
aGVuIG1vdmUgaXQgYmFjay4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Ci0tLQogYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9h
dXRvbWF0aW9uL2dpdGxhYi1jaS90ZXN0LnlhbWwgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS90ZXN0
LnlhbWwKaW5kZXggZDQ1NTZhZmUxMS4uN2JhMjBhNTFkYSAxMDA2NDQKLS0tIGEvYXV0b21hdGlv
bi9naXRsYWItY2kvdGVzdC55YW1sCisrKyBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL3Rlc3QueWFt
bApAQCAtNyw3ICs3LDggQEAgYnVpbGQtZWFjaC1jb21taXQtZ2NjOgogICAgIFhFTl9UQVJHRVRf
QVJDSDogeDg2XzY0CiAgICAgQ0M6IGdjYwogICBzY3JpcHQ6Ci0gICAgLSAuL2F1dG9tYXRpb24v
Z2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoIDI+JjEgfCB0ZWUgYnVpbGQtZWFjaC1jb21t
aXQtZ2NjLmxvZworICAgIC0gLi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1p
dC5zaCAyPiYxIHwgdGVlIC4uL2J1aWxkLWVhY2gtY29tbWl0LWdjYy5sb2cKKyAgICAtIG12IC4u
L2J1aWxkLWVhY2gtY29tbWl0LWdjYy5sb2cgLgogICBhcnRpZmFjdHM6CiAgICAgcGF0aHM6CiAg
ICAgICAtICcqLmxvZycKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
