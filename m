From: FionaLi-oc <fionali-oc@zhaoxin.com>
Subject: [PATCH] cpupool: fix ASSERT( c != old_pool )
Date: Mon, 8 Apr 2019 10:40:46 +0800
Message-ID: <1554691246-7249-1-git-send-email-fionali-oc@zhaoxin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SmQj=SK=zhaoxin.com=fionali-oc@srs-us1.protection.inumbo.net>)
 id 1hDKE1-0000i2-GQ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 02:41:33 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, cobechen@zhaoxin.com, FionaLi-oc <fionali-oc@zhaoxin.com>, dfaggioli@suse.com
List-Id: xen-devel@lists.xenproject.org

QXNzaWduaW5nIGNwdSB0byBjcHVwb29sIG5lZWRuJ3QgdG8gc3dpdGNoIGNwdSBzY2hlZHVsZXIg
d2hlbgpzeXN0ZW0gc3RhdGUgaXMgcmVzdW1lLCBvdGhlcndpc2UgaXQgd2lsbCBjYXVzZSBBU1NF
UlQgaW4Kc2NoZWR1bGVfY3B1X3N3aXRjaCgpLgoKU2lnbmVkLW9mZi1ieTogRmlvbmFMaS1vYyA8
ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2NwdXBvb2wuYyB8IDEwICsr
KysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jcHVwb29sLmMgYi94ZW4vY29tbW9uL2NwdXBvb2wu
YwppbmRleCBlODliYjY3Li5hY2M0YTUyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2NwdXBvb2wu
YworKysgYi94ZW4vY29tbW9uL2NwdXBvb2wuYwpAQCAtMjY4LDkgKzI2OCwxMyBAQCBzdGF0aWMg
aW50IGNwdXBvb2xfYXNzaWduX2NwdV9sb2NrZWQoc3RydWN0IGNwdXBvb2wgKmMsIHVuc2lnbmVk
IGludCBjcHUpCiAKICAgICBpZiAoIChjcHVwb29sX21vdmluZ19jcHUgPT0gY3B1KSAmJiAoYyAh
PSBjcHVwb29sX2NwdV9tb3ZpbmcpICkKICAgICAgICAgcmV0dXJuIC1FQUREUk5PVEFWQUlMOwot
ICAgIHJldCA9IHNjaGVkdWxlX2NwdV9zd2l0Y2goY3B1LCBjKTsKLSAgICBpZiAoIHJldCApCi0g
ICAgICAgIHJldHVybiByZXQ7CisKKyAgICBpZiggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9y
ZXN1bWUgKQorICAgIHsKKyAgICAgICAgcmV0ID0gc2NoZWR1bGVfY3B1X3N3aXRjaChjcHUsIGMp
OworICAgICAgICBpZiAoIHJldCApCisgICAgICAgICAgICByZXR1cm4gcmV0OworICAgIH0KIAog
ICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJmNwdXBvb2xfZnJlZV9jcHVzKTsKICAgICBpZiAo
Y3B1cG9vbF9tb3ZpbmdfY3B1ID09IGNwdSkKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
