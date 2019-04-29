From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 8/9] x86/IRQ: make fixup_irqs() skip unconnected
 internally used interrupts
Date: Mon, 29 Apr 2019 05:26:41 -0600
Message-ID: <5CC6DF710200007800229EC5@prv1-mh.provo.novell.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4Qp-0008Ml-8U
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:26:47 +0000
In-Reply-To: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2UgdGhlICJDYW5ub3Qgc2V0IGFmZmluaXR5IC4uLiIgd2FybmluZyBpcyBhIG9uZSB0aW1l
IG9uZSwgYXZvaWQKdHJpZ2dlcmluZyBpdCBhbHJlYWR5IGF0IGJvb3QgdGltZSB3aGVuIHBhcmtp
bmcgc2Vjb25kYXJ5IHRocmVhZHMgYW5kCnRoZSBzZXJpYWwgY29uc29sZSB1c2VzIGEgKHN0aWxs
IHVuY29ubmVjdGVkIGF0IHRoYXQgdGltZSkgUENJIElSUS4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysg
Yi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTI0MTIsOCArMjQxMiwyMCBAQCB2b2lkIGZpeHVwX2ly
cXMoY29uc3QgY3B1bWFza190ICptYXNrLCBiCiAgICAgICAgIHZlY3RvciA9IGlycV90b192ZWN0
b3IoaXJxKTsKICAgICAgICAgaWYgKCB2ZWN0b3IgPj0gRklSU1RfSElQUklPUklUWV9WRUNUT1Ig
JiYKICAgICAgICAgICAgICB2ZWN0b3IgPD0gTEFTVF9ISVBSSU9SSVRZX1ZFQ1RPUiApCisgICAg
ICAgIHsKICAgICAgICAgICAgIGNwdW1hc2tfYW5kKGRlc2MtPmFyY2guY3B1X21hc2ssIGRlc2Mt
PmFyY2guY3B1X21hc2ssIG1hc2spOwogCisgICAgICAgICAgICAvKgorICAgICAgICAgICAgICog
VGhpcyBjYW4gaW4gcGFydGljdWxhciBoYXBwZW4gd2hlbiBwYXJraW5nIHNlY29uZGFyeSB0aHJl
YWRzCisgICAgICAgICAgICAgKiBkdXJpbmcgYm9vdCBhbmQgd2hlbiB0aGUgc2VyaWFsIGNvbnNv
bGUgd2FudHMgdG8gdXNlIGEgUENJIElSUS4KKyAgICAgICAgICAgICAqLworICAgICAgICAgICAg
aWYgKCBkZXNjLT5oYW5kbGVyID09ICZub19pcnFfdHlwZSApCisgICAgICAgICAgICB7CisgICAg
ICAgICAgICAgICAgc3Bpbl91bmxvY2soJmRlc2MtPmxvY2spOworICAgICAgICAgICAgICAgIGNv
bnRpbnVlOworICAgICAgICAgICAgfQorICAgICAgICB9CisKICAgICAgICAgaWYgKCBkZXNjLT5h
cmNoLm1vdmVfY2xlYW51cF9jb3VudCApCiAgICAgICAgIHsKICAgICAgICAgICAgIC8qIFRoZSBj
bGVhbnVwIElQSSBtYXkgaGF2ZSBnb3Qgc2VudCB3aGlsZSB3ZSB3ZXJlIHN0aWxsIG9ubGluZS4g
Ki8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
