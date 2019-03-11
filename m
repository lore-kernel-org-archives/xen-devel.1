From: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 5/6] xen-pt: Hide MSI-X from xen stubdoms
Date: Mon, 11 Mar 2019 14:02:15 -0400
Message-ID: <20190311180216.18811-6-jandryuk@gmail.com>
References: <20190311180216.18811-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TSWV=RO=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1h3PGr-0001ID-Hf
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:03:29 +0000
Received: by mail-qt1-x843.google.com with SMTP id v10so6115590qtp.8
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2019 11:03:28 -0700 (PDT)
In-Reply-To: <20190311180216.18811-1-jandryuk@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: James McKenzie <james.mckenzie@bromium.com>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jandryuk@gmail.com>, marmarek@invisiblethingslab.com, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

TVNJLVggaXMgbm90IHN1cHBvcnRlZCBpbiBYZW4gc3R1YmRvbXMsIHNvIGl0IG11c3QgYmUgZGlz
YWJsZWQuICBVc2UgdGhlCmV4aXN0aW5nIHhlbl9wdF9oaWRlX2Rldl9jYXAgdG8gaGlkZSB3aGVu
IHJ1bm5pbmcgdW5kZXIgLXhlbi1zdHViZG9tLgoKQSBjb21waWxlLXRpbWUgcGF0Y2ggd2FzIG9y
aWdpbmFsbHkgd3JpdHRlbiBieSBKYW1lcyBNY0tlbnppZQo8amFtZXMubWNrZW56aWVAYnJvbWl1
bS5jb20+CgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+
Ci0tLQogaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ody94ZW4veGVuX3B0X2NvbmZpZ19pbml0
LmMgYi9ody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMKaW5kZXggMzFlYzVhZGQxZC4uYjgyN2E0
OTNlYSAxMDA2NDQKLS0tIGEvaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5jCisrKyBiL2h3L3hl
bi94ZW5fcHRfY29uZmlnX2luaXQuYwpAQCAtNTQsNiArNTQsOSBAQCBzdGF0aWMgaW50IHhlbl9w
dF9oaWRlX2Rldl9jYXAoY29uc3QgWGVuSG9zdFBDSURldmljZSAqZCwgdWludDhfdCBncnBfaWQp
CiAgICAgICAgICAgICByZXR1cm4gMTsKICAgICAgICAgfQogICAgICAgICBicmVhazsKKyAgICBj
YXNlIFBDSV9DQVBfSURfTVNJWDoKKyAgICAgICAgLyogc3R1YmRvbXMgZG9uJ3Qgc3VwcG9ydCBN
U0ktWCBzbyBza2lwIGl0LiAqLworICAgICAgICByZXR1cm4geGVuX3N0dWJkb21fZW5hYmxlZCgp
OwogICAgIH0KICAgICByZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
