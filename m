From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 09/17] more_prepareguest_hvm: Honour
 guest runvar dmrestrict
Date: Wed, 13 Jun 2018 14:03:54 +0100
Message-ID: <1528895042-14113-10-git-send-email-ian.jackson@eu.citrix.com>
References: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ytt=i7=citrix.com=prvs=695a74e14=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fT5Rh-0005LB-RC
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 13:04:17 +0000
In-Reply-To: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5IG5vdGhpbmcgc2V0cyB0aGlzLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSB8
IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL09z
c3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IGQ4ZWQw
MmQuLmM4NDM5MDIgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3Nz
dGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtMjA2Niw2ICsyMDY2LDEwIEBAIEVORAogICAgICAgICAk
Y2ZnIC49ICJkZXZpY2VfbW9kZWxfdmVyc2lvbj0nJGRldm1vZGVsJ1xuIjsKICAgICB9CiAKKyAg
ICBpZiAoZ3Vlc3RfdmFyX2Jvb2xlYW4oJGdobywgJ2RtcmVzdHJpY3QnKSkgeworICAgICAgICAk
Y2ZnIC49ICJkbV9yZXN0cmljdD0xXG4iOworICAgIH0KKwogICAgIG15ICRiaW9zID0gJHhvcHRz
eydCaW9zJ307CiAgICAgaWYgKGRlZmluZWQgJGJpb3MpIHsKICAgICAgICAgJGNmZyAuPSAiYmlv
cz0nJGJpb3MnXG4iOwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
