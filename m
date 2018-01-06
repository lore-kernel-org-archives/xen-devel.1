From: Anthony Liguori <aliguori@amzn.com>
Subject: [PATCH 01/22] ---- x86/Kconfig: Options for Xen and PVH
	support
Date: Sat, 6 Jan 2018 14:54:16 -0800
Message-ID: <1515279277-16301-2-git-send-email-aliguori@amzn.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fck6=eb=amzn.com=prvs=537d23ce5=aliguori@srs-us1.protection.inumbo.net>)
 id 1eXxMc-0006Om-Qm
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2018 22:54:54 +0000
In-Reply-To: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvS2NvbmZpZyB8IDE3ICsrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2Fy
Y2gveDg2L0tjb25maWcKaW5kZXggN2M0NTgyOS4uMDc1MzBiZiAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L0tjb25maWcKKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKQEAgLTExNyw2ICsxMTcs
MjMgQEAgY29uZmlnIFRCT09UCiAJICBUZWNobm9sb2d5IChUWFQpCiAKIAkgIElmIHVuc3VyZSwg
c2F5IFkuCisKK2NvbmZpZyBYRU5fR1VFU1QKKwlkZWZfYm9vbCB5CisJcHJvbXB0ICJYZW4gR3Vl
c3QiCisJLS0taGVscC0tLQorCSAgU3VwcG9ydCBmb3IgWGVuIGRldGVjdGluZyB3aGVuIGl0IGlz
IHJ1bm5pbmcgdW5kZXIgWGVuLgorCisJICBJZiB1bnN1cmUsIHNheSBZLgorCitjb25maWcgUFZI
X0dVRVNUCisJZGVmX2Jvb2wgbgorCXByb21wdCAiUFZIIEd1ZXN0IgorCWRlcGVuZHMgb24gWEVO
X0dVRVNUCisJLS0taGVscC0tLQorCSAgU3VwcG9ydCBib290aW5nIHVzaW5nIHRoZSBQVkggQUJJ
LgorCisJICBJZiB1bnN1cmUsIHNheSBOLgogZW5kbWVudQogCiBzb3VyY2UgImNvbW1vbi9LY29u
ZmlnIgotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
