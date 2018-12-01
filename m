From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 10/25] arm: introduce guest_handle_for_field()
Date: Fri, 30 Nov 2018 17:32:49 -0800
Message-ID: <1543627984-21394-11-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuAE-0006iP-JX
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:33:46 +0000
Received: by mail-io1-xd43.google.com with SMTP id v10so6036541ios.13
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:33:45 -0800 (PST)
In-Reply-To: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

YXJtIHBvcnQgb2YgY29tbWl0IGJiNTQ0NTg1MTM3MjU5NTQ1ZDRhZGM5YWZlNmVlZDhkYzdjNzM3
NmQKClRoaXMgaGVscGVyIHR1cm5zIGEgZmllbGQgb2YgYSBHVUVTVF9IQU5ETEUgaW50byBhIEdV
RVNUX0hBTkRMRS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhl
ci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9h
Y2Nlc3MuaCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaCBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vZ3Vlc3RfYWNjZXNzLmgKaW5kZXggN2I2Zjg5Yy4uMTEzN2M1NCAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaAorKysgYi94ZW4vaW5jbHVkZS9hc20t
YXJtL2d1ZXN0X2FjY2Vzcy5oCkBAIC02OCw2ICs2OCw5IEBAIGludCBhY2Nlc3NfZ3Vlc3RfbWVt
b3J5X2J5X2lwYShzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGlwYSwgdm9pZCAqYnVmLAogICAg
IF95OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAogfSkKIAorI2RlZmluZSBndWVzdF9oYW5kbGVfZm9yX2ZpZWxkKGhuZCwgdHlwZSwgZmxkKSAg
ICAgICAgICBcCisgICAgKChYRU5fR1VFU1RfSEFORExFKHR5cGUpKSB7ICYoaG5kKS5wLT5mbGQg
fSkKKwogI2RlZmluZSBndWVzdF9oYW5kbGVfZnJvbV9wdHIocHRyLCB0eXBlKSAgICAgICAgXAog
ICAgICgoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh0eXBlKSkgeyAodHlwZSAqKXB0ciB9KQogI2Rl
ZmluZSBjb25zdF9ndWVzdF9oYW5kbGVfZnJvbV9wdHIocHRyLCB0eXBlKSAgXAotLSAKMi4xLjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
