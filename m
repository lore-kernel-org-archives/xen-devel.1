From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.11 1/2] libxc/x86: fix mapping of the
 start_info area
Date: Wed, 21 Mar 2018 14:42:10 +0000
Message-ID: <20180321144211.57274-2-roger.pau@citrix.com>
References: <20180321144211.57274-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eys7=gl=citrix.com=prvs=611d78d97=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eyez4-0006iL-UY
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 14:44:58 +0000
In-Reply-To: <20180321144211.57274-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHN0YXJ0X2luZm8gc2l6ZSBjYWxjdWxhdGVkIGluIGJvb3RsYXRlX2h2bSBpcyB3cm9uZy4g
SXQgc2hvdWxkIHVzZQpIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VOVCBpbnN0ZWFkIG9mIGRvbS0+
bnVtX21vZHVsZXMgYW5kIGl0IGRvZXNuJ3QKdGFrZSBpbnRvIGFjY291bnQgdGhlIHNpemUgb2Yg
dGhlIG1vZHVsZXMgY29tbWFuZCBsaW5lLgoKVGhpcyBpcyBub3QgYSBwcm9ibGVtIHNvIGZhciBi
ZWNhdXNlIHRoZSBhY3R1YWxseSB1c2VkIGFtb3VudCBvZgptZW1vcnkgZG9lc24ndCBjcm9zcyBh
IHBhZ2UgYm91bmRhcnksIGFuZCBzbyBubyBwYWdlLWZhdWx0IGlzCnRyaWdnZXJlZC4KClNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4Yy94Y19kb21feDg2LmMgfCA2ICsrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2RvbV94ODYuYyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV94ODYu
YwppbmRleCAwYjY1ZGFiNGJjLi5lMjljNjY2Yjg5IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94
Y19kb21feDg2LmMKKysrIGIvdG9vbHMvbGlieGMveGNfZG9tX3g4Ni5jCkBAIC0xNjcxLDcgKzE2
NzEsMTEgQEAgc3RhdGljIGludCBib290bGF0ZV9odm0oc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9t
KQogICAgIHVuc2lnbmVkIGludCBpOwogCiAgICAgc3RhcnRfaW5mb19zaXplID0gc2l6ZW9mKCpz
dGFydF9pbmZvKSArIGRvbS0+Y21kbGluZV9zaXplOwotICAgIHN0YXJ0X2luZm9fc2l6ZSArPSBz
aXplb2Yoc3RydWN0IGh2bV9tb2RsaXN0X2VudHJ5KSAqIGRvbS0+bnVtX21vZHVsZXM7CisgICAg
c3RhcnRfaW5mb19zaXplICs9IHNpemVvZihzdHJ1Y3QgaHZtX21vZGxpc3RfZW50cnkpICoKKyAg
ICAgICAgICAgICAgICAgICAgICAgSFZNTE9BREVSX01PRFVMRV9NQVhfQ09VTlQ7CisgICAgc3Rh
cnRfaW5mb19zaXplICs9IEhWTUxPQURFUl9NT0RVTEVfQ01ETElORV9TSVpFICoKKyAgICAgICAg
ICAgICAgICAgICAgICAgSFZNTE9BREVSX01PRFVMRV9NQVhfQ09VTlQ7CisKIAogICAgIGlmICgg
c3RhcnRfaW5mb19zaXplID4KICAgICAgICAgIGRvbS0+c3RhcnRfaW5mb19zZWcucGFnZXMgPDwg
WENfRE9NX1BBR0VfU0hJRlQoZG9tKSApCi0tIAoyLjE2LjIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
