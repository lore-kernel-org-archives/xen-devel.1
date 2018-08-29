From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] tools/libxl: correct vcpu affinity output
 with sparse physical cpu map
Date: Wed, 29 Aug 2018 20:23:01 +0200
Message-ID: <20180829182302.9977-2-jgross@suse.com>
References: <20180829182302.9977-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cgjg=lm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fv57X-0006Qp-By
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 18:23:11 +0000
In-Reply-To: <20180829182302.9977-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

V2l0aCBub3QgYWxsIHBoeXNpY2FsIGNwdXMgb25saW5lIChpLmUuIHdpdGggc210PTApIHRoZSBv
dXRwdXQgb2YgaHRlCnZjcHUgYWZmaW5pdGllcyBpcyB3cm9uZywgYXMgdGhlIGFmZmluaXR5IGJp
dG1hcHMgYXJlIGNhcHBlZCBhZnRlcgpucl9jcHVzIGJpdHMsIGluc3RlYWQgb2YgdXNpbmcgbWF4
X2NwdV9pZC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
LS0tCiB0b29scy94bC94bF92Y3B1LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfdmNwdS5j
IGIvdG9vbHMveGwveGxfdmNwdS5jCmluZGV4IDMzODRlZWVkMDYuLmM4NzdmMjU5NWYgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3hsL3hsX3ZjcHUuYworKysgYi90b29scy94bC94bF92Y3B1LmMKQEAgLTE0
NCwxMyArMTQ0LDEzIEBAIHN0YXRpYyB2b2lkIHZjcHVsaXN0KGludCBhcmdjLCBjaGFyICoqYXJn
dikKICAgICAgICAgfQogCiAgICAgICAgIGZvciAoaSA9IDA7IGk8bmJfZG9tYWluOyBpKyspCi0g
ICAgICAgICAgICBwcmludF9kb21haW5fdmNwdWluZm8oZG9taW5mb1tpXS5kb21pZCwgcGh5c2lu
Zm8ubnJfY3B1cyk7CisgICAgICAgICAgICBwcmludF9kb21haW5fdmNwdWluZm8oZG9taW5mb1tp
XS5kb21pZCwgcGh5c2luZm8ubWF4X2NwdV9pZCArIDEpOwogCiAgICAgICAgIGxpYnhsX2RvbWlu
Zm9fbGlzdF9mcmVlKGRvbWluZm8sIG5iX2RvbWFpbik7CiAgICAgfSBlbHNlIHsKICAgICAgICAg
Zm9yICg7IGFyZ2MgPiAwOyArK2FyZ3YsIC0tYXJnYykgewogICAgICAgICAgICAgdWludDMyX3Qg
ZG9taWQgPSBmaW5kX2RvbWFpbigqYXJndik7Ci0gICAgICAgICAgICBwcmludF9kb21haW5fdmNw
dWluZm8oZG9taWQsIHBoeXNpbmZvLm5yX2NwdXMpOworICAgICAgICAgICAgcHJpbnRfZG9tYWlu
X3ZjcHVpbmZvKGRvbWlkLCBwaHlzaW5mby5tYXhfY3B1X2lkICsgMSk7CiAgICAgICAgIH0KICAg
ICB9CiAgIHZjcHVsaXN0X291dDoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
