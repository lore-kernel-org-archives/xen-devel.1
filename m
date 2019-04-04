From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/3] automation: add Fedora image and build jobs
Date: Thu, 4 Apr 2019 12:22:59 +0100
Message-ID: <20190404112302.4796-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VYWF=SG=citrix.com=prvs=9901e81f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hC0Sd-000213-AE
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 11:23:11 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMyk6CiAgYXV0b21hdGlvbjogYWRkIGEgRmVkb3JhIGltYWdlCiAgYXV0b21hdGlv
bjogYWRkIEZlZG9yYSBpbWFnZSB0byBjb250YWluZXJpemUgc2NyaXB0CiAgZ2l0bGFiLWNpOiBh
ZGQgZmVkb3JhIGdjYyBidWlsZCBqb2JzCgogYXV0b21hdGlvbi9idWlsZC9mZWRvcmEvbGF0ZXN0
LmRvY2tlcmZpbGUgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKwogYXV0b21hdGlvbi9naXRs
YWItY2kvYnVpbGQueWFtbCAgICAgICAgICAgfCAxMCArKysrKysKIGF1dG9tYXRpb24vc2NyaXB0
cy9jb250YWluZXJpemUgICAgICAgICAgIHwgIDUgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDU2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXV0b21hdGlv
bi9idWlsZC9mZWRvcmEvbGF0ZXN0LmRvY2tlcmZpbGUKCi0tIAoyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
