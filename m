From: Amit Singh Tomar <amittomer25@gmail.com>
Subject: [RFC PATCH 0/2] xen/arm64: Add Support for Amlogic S905
 SoC
Date: Tue,  7 Aug 2018 22:37:51 +0530
Message-ID: <1533661673-14607-1-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=70h6=kw=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1fn5TE-000607-Vv
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 17:08:33 +0000
Received: by mail-pf1-x444.google.com with SMTP id d4-v6so8902314pfn.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Aug 2018 10:08:31 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andre.przywara@arm.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, Amit Singh Tomar <amittomer25@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzbWFsbCBzZXJpZXMgZW5hYmxlZCBYRU4gYm9vdGluZyBvbiBOYW5vUEkgSzIgYm9hcmRb
MV0gYmFzZWQKb24gQW1sb2dpYyBTb0MuIAoKSXQgaGFzIGJlZW4gdGVzdGVkIGJ5IGJvb3Rpbmcg
RG9tMCBLZXJuZWwuCgpUT0RPOgogICAgICAgKiBXaWtpIHBhZ2UgdG8gY2FwdHVyZSBYRU4gYm9v
dCBpbmZvLgoKWzFdOiBodHRwczovL3d3dy5mcmllbmRseWFybS5jb20vaW5kZXgucGhwP3JvdXRl
PXByb2R1Y3QvcHJvZHVjdCZwcm9kdWN0X2lkPTE4NgoKQW1pdCBTaW5naCBUb21hciAoMik6CiAg
eGVuL2FybTogQWRkIEFtbG9naWMgUzkwNSBTb0MgZWFybHkgcHJpbnRrIHN1cHBvcnQKICB4ZW4v
YXJtOiBBZGQgTUVTT04gVUFSVCBkcml2ZXIgZm9yIEFtbG9naWMgUzkwNSBTb0MKCiBkb2NzL21p
c2MvYXJtL2Vhcmx5LXByaW50ay50eHQgICAgIHwgICAxICsKIHhlbi9hcmNoL2FybS9SdWxlcy5t
ayAgICAgICAgICAgICAgfCAgIDEgKwogeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLW1lc29uLmlu
YyB8ICA1MCArKysrKysrCiB4ZW4vZHJpdmVycy9jaGFyL0tjb25maWcgICAgICAgICAgIHwgICA4
ICsKIHhlbi9kcml2ZXJzL2NoYXIvTWFrZWZpbGUgICAgICAgICAgfCAgIDEgKwogeGVuL2RyaXZl
cnMvY2hhci9tZXNvbi11YXJ0LmMgICAgICB8IDI5MCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiA2IGZpbGVzIGNoYW5nZWQsIDM1MSBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLW1lc29uLmluYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9kcml2ZXJzL2NoYXIvbWVzb24tdWFydC5jCgotLSAKMS45LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
