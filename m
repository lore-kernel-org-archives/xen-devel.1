From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.11 0/2] libxc/x86: fix a couple of bugs
Date: Wed, 21 Mar 2018 14:42:09 +0000
Message-ID: <20180321144211.57274-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eys7=gl=citrix.com=prvs=611d78d97=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eyf17-0006on-CT
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 14:47:05 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpGb2xsb3dpbmcgdHdvIHBhdGNoZXMgZml4IHR3byBidWdzIHJlbGF0ZWQgdG8gdGhl
IG1hcHBpbmcgYW5kIGhhbmRsaW5nCm9mIHRoZSBodm1fc3RhcnRfaW5mby4KClRoYW5rcywgUm9n
ZXIuCgpSb2dlciBQYXUgTW9ubmUgKDIpOgogIGxpYnhjL3g4NjogZml4IG1hcHBpbmcgb2YgdGhl
IHN0YXJ0X2luZm8gYXJlYQogIGxpYnhjL3g4NjogZG8gbm90IHVuY29uZGl0aW9uYWxseSBzZXQg
dGhlIG1vZHVsZSBjbWRsaW5lIGFkZHJlc3MKCiB0b29scy9saWJ4Yy94Y19kb21feDg2LmMgfCAx
MSArKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCi0tIAoyLjE2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
