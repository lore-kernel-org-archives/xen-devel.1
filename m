From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 04/17] x86: introduce is_pv_64bit_{vcpu, domain}
Date: Thu, 4 Oct 2018 16:43:23 +0100
Message-ID: <0d1888be57c5dc0d98c7e0313608e7d9842ba3a5.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g85mv-0004zu-Hb
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:43:41 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB1c2VmdWwgdG8gcmV3cml0ZSB0aGUgZm9sbG93aW5nIHBhdHRlcm4gKHYgaXMgUFYg
dmNwdSkKCiAgIGlmICggaXNfcHZfMzJiaXRfdmNwdSh2KSApCiAgICAgICBkb19mb287CiAgIGVs
c2UKICAgICAgIGRvX2JhcjsKCnRvCgogICBpZiAoIGlzX3B2XzMyYml0X3ZjcHUodikgKQogICAg
ICAgZG9fZm9vOwogICBlbHNlIGlmICggaXNfcHZfNjRiaXRfdmNwdSh2KSApCiAgICAgICBkb19i
YXI7CiAgIGVsc2UKICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRTsKLgoKUHJldmlvdXNseSBpdCBp
cyBub3QgcG9zc2libGUgdG8gcmVseSBvbiBEQ0UgdG8gZWxpbWluYXRlIHRoZSBkb19iYXIKcGFy
dC4gSXQgYmVjb21lcyBwb3NzaWJsZSB3aXRoIHRoZSBuZXcgY29kZSBzdHJ1Y3R1cmUuCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oCmluZGV4IGIzMmFkNTcuLjQ2YzIyZjEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC04OTcsNiAr
ODk3LDE2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19wdl8zMmJpdF92Y3B1KGNvbnN0IHN0cnVj
dCB2Y3B1ICp2KQogICAgIHJldHVybiBpc19wdl8zMmJpdF9kb21haW4odi0+ZG9tYWluKTsKIH0K
IAorc3RhdGljIGlubGluZSBib29sIGlzX3B2XzY0Yml0X2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9t
YWluICpkKQoreworICAgIHJldHVybiBpc19wdl9kb21haW4oZCkgJiYgIWQtPmFyY2guaXNfMzJi
aXRfcHY7Cit9CisKK3N0YXRpYyBpbmxpbmUgYm9vbCBpc19wdl82NGJpdF92Y3B1KGNvbnN0IHN0
cnVjdCB2Y3B1ICp2KQoreworICAgIHJldHVybiBpc19wdl82NGJpdF9kb21haW4odi0+ZG9tYWlu
KTsKK30KKwogc3RhdGljIGlubGluZSBib29sIGlzX2h2bV9kb21haW4oY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCkKIHsKICAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfSFZNKSA/IGQtPmd1ZXN0
X3R5cGUgPT0gZ3Vlc3RfdHlwZV9odm0gOiBmYWxzZTsKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
