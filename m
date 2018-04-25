From: Petr Tesarik <ptesarik@suse.cz>
Subject: [PATCH] x86: Do not reserve a crash kernel region if
 booted on Xen PV
Date: Wed, 25 Apr 2018 12:08:35 +0200
Message-ID: <20180425120835.23cef60c__18924.5542431765$1524650843$gmane$org@ezekiel.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bxop=ho=suse.cz=ptesarik@srs-us1.protection.inumbo.net>)
 id 1fBHLt-0005KR-95
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 10:08:41 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@suse.de>, Juergen Gross <jgross@suse.com>, Andy Lutomirski <luto@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Jean Delvare <jdelvare@suse.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dou Liyang <douly.fnst@cn.fujitsu.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

WGVuIFBWIGRvbWFpbnMgY2Fubm90IHNodXQgZG93biBhbmQgc3RhcnQgYSBjcmFzaCBrZXJuZWwu
IEluc3RlYWQsCnRoZSBjcmFzaGluZyBrZXJuZWwgbWFrZXMgYSBTQ0hFRE9QX3NodXRkb3duIGh5
cGVyY2FsbCB3aXRoIHRoZQpyZWFzb24gY29kZSBTSFVURE9XTl9jcmFzaCwgY2YuIHhlbl9jcmFz
aF9zaHV0ZG93bigpIG1hY2hpbmUgb3AgaW4KYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jLgoK
QSBjcmFzaCBrZXJuZWwgcmVzZXJ2YXRpb24gaXMgbWVyZWx5IGEgd2FzdGUgb2YgUkFNIGluIHRo
aXMgY2FzZS4gSXQKbWF5IGFsc28gY29uZnVzZSB1c2VycyBvZiBrZXhlY19sb2FkKDIpIGFuZC9v
ciBrZXhlY19maWxlX2xvYWQoMikuCldoZW4gZmxhZ3MgaW5jbHVkZSBLRVhFQ19PTl9DUkFTSCBv
ciBLRVhFQ19GSUxFX09OX0NSQVNILApyZXNwZWN0aXZlbHksIHRoZXNlIHN5c2NhbGxzIHJldHVy
biBzdWNjZXNzLCB3aGljaCBpcyB0ZWNobmljYWxseQpjb3JyZWN0LCBidXQgdGhlIGNyYXNoIGtl
eGVjIGltYWdlIHdpbGwgbmV2ZXIgYmUgYWN0dWFsbHkgdXNlZC4KClNpZ25lZC1vZmYtYnk6IFBl
dHIgVGVzYXJpayA8cHRlc2FyaWtAc3VzZS5jb20+Ci0tLQogYXJjaC94ODYva2VybmVsL3NldHVw
LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC94ODYva2VybmVsL3NldHVwLmMKaW5k
ZXggNjI4NTY5N2I2ZTU2Li41YzYyM2RmZTM5ZDEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5l
bC9zZXR1cC5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9zZXR1cC5jCkBAIC01MCw2ICs1MCw3IEBA
CiAjaW5jbHVkZSA8bGludXgvaW5pdF9vaGNpMTM5NF9kbWEuaD4KICNpbmNsdWRlIDxsaW51eC9r
dm1fcGFyYS5oPgogI2luY2x1ZGUgPGxpbnV4L2RtYS1jb250aWd1b3VzLmg+CisjaW5jbHVkZSA8
eGVuL3hlbi5oPgogCiAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KICNpbmNsdWRlIDxsaW51eC9r
ZXJuZWwuaD4KQEAgLTUzNCw2ICs1MzUsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IHJlc2VydmVf
Y3Jhc2hrZXJuZWwodm9pZCkKIAkJaGlnaCA9IHRydWU7CiAJfQogCisJaWYgKHhlbl9wdl9kb21h
aW4oKSkgeworCQlwcl9pbmZvKCJJZ25vcmluZyBjcmFzaGtlcm5lbCBmb3IgYSBYZW4gUFYgZG9t
YWluXG4iKTsKKwkJcmV0dXJuOworCX0KKwogCS8qIDAgbWVhbnM6IGZpbmQgdGhlIGFkZHJlc3Mg
YXV0b21hdGljYWxseSAqLwogCWlmIChjcmFzaF9iYXNlIDw9IDApIHsKIAkJLyoKLS0gCjIuMTMu
NgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
