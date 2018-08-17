From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 01/34] x86: fix building !CONFIG_LOCK_PROFILE
Date: Fri, 17 Aug 2018 16:12:19 +0100
Message-ID: <48771817136e02beefccded7575a57afd49889c4.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgQr-0007yO-H5
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:12:57 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGluaXQgZnVuY3Rpb24gc2hvdWxkbid0IGJlIGJ1aWx0IG9yIGNhbGxlZCBhdCBhbGwgd2hl
bgohQ09ORklHX0xPQ0tfUFJPRklMRS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Ci0tLQogeGVuL2NvbW1vbi9zcGlubG9jay5jIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc3BpbmxvY2su
YyBiL3hlbi9jb21tb24vc3BpbmxvY2suYwppbmRleCA4ZjJiYTA4Li4zNmUzMWM5IDEwMDY0NAot
LS0gYS94ZW4vY29tbW9uL3NwaW5sb2NrLmMKKysrIGIveGVuL2NvbW1vbi9zcGlubG9jay5jCkBA
IC00NzEsNiArNDcxLDcgQEAgdm9pZCBfbG9ja19wcm9maWxlX2RlcmVnaXN0ZXJfc3RydWN0KAog
ICAgIHNwaW5fdW5sb2NrKCZsb2NrX3Byb2ZpbGVfbG9jayk7CiB9CiAKKyNpZmRlZiBDT05GSUdf
TE9DS19QUk9GSUxFCiBzdGF0aWMgaW50IF9faW5pdCBsb2NrX3Byb2ZfaW5pdCh2b2lkKQogewog
ICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGUgKipxOwpAQCAtNDg5LDUgKzQ5MCw2IEBAIHN0YXRpYyBp
bnQgX19pbml0IGxvY2tfcHJvZl9pbml0KHZvaWQpCiAgICAgcmV0dXJuIDA7CiB9CiBfX2luaXRj
YWxsKGxvY2tfcHJvZl9pbml0KTsKKyNlbmRpZgogCiAjZW5kaWYgLyogTE9DS19QUk9GSUxFICov
Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
