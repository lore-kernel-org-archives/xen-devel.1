From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 11/11] TestSupport: guest_var_boolean:
 Understand `y' and `1' as well
Date: Tue, 12 Jun 2018 12:37:45 +0100
Message-ID: <1528803465-31661-12-git-send-email-ian.jackson@eu.citrix.com>
References: <1528803465-31661-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfe/=i6=citrix.com=prvs=694d9f8cf=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fShd5-0001ra-N4
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 11:38:27 +0000
In-Reply-To: <1528803465-31661-1-git-send-email-ian.jackson@eu.citrix.com>
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

UHJldmlvdXNseSB0aGlzIHdvdWxkIHRyZWF0IGB5JyBhbmQgYDEnIGFzIGZhbHNlLCB3aGljaCBp
cyB2ZXJ5CmNvbmZ1c2luZy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3Nv
bkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9P
c3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCA3YmM0
MGYzLi5kOGVkMDJkIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09z
c3Rlc3QvVGVzdFN1cHBvcnQucG0KQEAgLTE4MjUsNyArMTgyNSw3IEBAIHN1YiBndWVzdF92YXIg
KCQkJCkgewogCiBzdWIgZ3Vlc3RfdmFyX2Jvb2xlYW4gKCQkKSB7CiAgICAgbXkgKCRnaG8sICRy
dW52YXJ0YWlsKSA9IEBfOwotICAgIHJldHVybiBndWVzdF92YXIoJGdobywgJHJ1bnZhcnRhaWws
ICdmYWxzZScpID1+IG0vdHJ1ZS87CisgICAgcmV0dXJuIGd1ZXN0X3ZhcigkZ2hvLCAkcnVudmFy
dGFpbCwgJ2ZhbHNlJykgPX4gbS90cnVlfHl8MS87CiB9CiAKIHN1YiBndWVzdF92YXJfY29tbWFs
aXN0ICgkJCkgewotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
