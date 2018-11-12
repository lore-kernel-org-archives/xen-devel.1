From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: [PATCH 09/18] xen/arm: Add rcu_barrier() before
 enabling non-boot CPUs on resume
Date: Mon, 12 Nov 2018 12:30:35 +0100
Message-ID: <1542022244-22977-10-git-send-email-mirela.simonovic@aggios.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xmwf=nx=aggios.com=mirela.simonovic@srs-us1.protection.inumbo.net>)
 id 1gMAR4-0005Ng-QA
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 11:31:18 +0000
Received: by mail-wm1-x341.google.com with SMTP id f19-v6so8666363wmb.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Nov 2018 03:31:17 -0800 (PST)
In-Reply-To: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, dm@aggios.com, saeed.nowshadi@xilinx.com, Julien Grall <julien.grall@arm.com>, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJjdV9iYXJyaWVyKCkgaGFzIHRvIGJlIGFkZGVkIHRvIGVuc3VyZSB0aGF0IHRoZSBwZXIg
Y3B1IGFyZWEgaXMKZnJlZWQgYmVmb3JlIGEgbm9uLWJvb3QgQ1BVIHRyaWVzIHRvIGluaXRpYWxp
emUgaXQgKF9mcmVlX3BlcmNwdV9hcmVhKCkKaGFzIHRvIGJlIGNhbGxlZCBiZWZvcmUgdGhlIGlu
aXRfcGVyY3B1X2FyZWEoKSkuIFRoaXMgc2NlbmFyaW8gb2NjdXJzCndoZW4gbm9uLWJvb3QgQ1BV
cyBhcmUgaG90LXVucGx1Z2dlZCBvbiBzdXNwZW5kIGFuZCBob3RwbHVnZ2VkIG9uIHJlc3VtZS4K
ClNpZ25lZC1vZmYtYnk6IE1pcmVsYSBTaW1vbm92aWMgPG1pcmVsYS5zaW1vbm92aWNAYWdnaW9z
LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FlZWQgTm93c2hhZGkgPHNhZWVkLm5vd3NoYWRpQHhpbGlu
eC5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3N1c3BlbmQuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3N1c3BlbmQuYyBiL3hl
bi9hcmNoL2FybS9zdXNwZW5kLmMKaW5kZXggZGFlMWIxZjdkNi4uOGU4ZTUzMWQ2MSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gvYXJtL3N1c3BlbmQuYworKysgYi94ZW4vYXJjaC9hcm0vc3VzcGVuZC5j
CkBAIC0xMzMsNiArMTMzLDcgQEAgc3RhdGljIGxvbmcgc3lzdGVtX3N1c3BlbmQodm9pZCAqZGF0
YSkKICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfcmVzdW1lOwogCiByZXN1bWVfbm9uYm9v
dF9jcHVzOgorICAgIHJjdV9iYXJyaWVyKCk7CiAgICAgZW5hYmxlX25vbmJvb3RfY3B1cygpOwog
ICAgIHRoYXdfZG9tYWlucygpOwogICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9hY3RpdmU7
Ci0tIAoyLjEzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
