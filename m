From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/4] backports snapshot: Provide for
 $apt_insert and $extra_rune
Date: Wed, 13 Feb 2019 18:30:16 +0000
Message-ID: <20190213183018.5198-3-ian.jackson@eu.citrix.com>
References: <20190213183018.5198-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HrVK=QU=citrix.com=prvs=9402dae0b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gtzIw-0007hq-Hw
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 18:30:42 +0000
In-Reply-To: <20190213183018.5198-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@gmail.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5wbSB8IDUgKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IGVlN2UwM2NmLi41
ZTc0ZTg2ZSAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJp
YW4ucG0KQEAgLTk0OSw2ICs5NDksOCBAQCBzdWIgcHJlc2VlZF9iYWNrcG9ydHNfcGFja2FnZXMg
KCQkJCRAKSB7CiAJbXkgJGJwX3VybCA9ICRjeyJEZWJpYW5TbmFwc2hvdEJhY2twb3J0c18kc3Vp
dGUifTsKIAkkYnBfdXJsIHx8PSAiaHR0cDovLyRje0RlYmlhbk1pcnJvckhvc3R9LyRje0RlYmlh
bk1pcnJvclN1YnBhdGh9IjsKIAorCW15ICRhcHRfaW5zZXJ0PScnOworCW15ICRleHRyYV9ydW5l
PScnOwogCXByZXNlZWRfaG9va19jb21tYW5kKCRobywgJ2xhdGVfY29tbWFuZCcsICRzZngsIDw8
RU5EKTsKICMhL2Jpbi9zaAogc2V0IC1leApAQCAtOTU2LDggKzk1OCw5IEBAIHNldCAtZXgKIGNh
dCA8PEVPRiA+Pi90YXJnZXQvZXRjL2FwdC9zb3VyY2VzLmxpc3QKIAogIyAkc3VpdGUgYmFja3Bv
cnRzCi1kZWIgJGJwX3VybCAkc3VpdGUtYmFja3BvcnRzIG1haW4KK2RlYiAkYXB0X2luc2VydCAk
YnBfdXJsICRzdWl0ZS1iYWNrcG9ydHMgbWFpbgogRU9GCiskZXh0cmFfcnVuZQogaW4tdGFyZ2V0
IGFwdC1nZXQgdXBkYXRlCiBFTkQKICAgICB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
