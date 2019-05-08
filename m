From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/4] x86/IRQ: relax locking in
 irq_guest_eoi_timer_fn()
Date: Wed, 08 May 2019 06:47:34 -0600
Message-ID: <5CD2CFE6020000780022CCC9@prv1-mh.provo.novell.com>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOLyy-0004HL-IL
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:47:36 +0000
In-Reply-To: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
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

VGhpcyBpcyBhIHRpbWVyIGhhbmRsZXIsIHNvIGl0IGdldHMgZW50ZXJlZCB3aXRoIElSUXMgZW5h
YmxlZC4gVGhlcmVmb3JlCnRoZXJlJ3Mgbm8gbmVlZCB0byBzYXZlL3Jlc3RvcmUgdGhlIElSUSBt
YXNraW5nIGZsYWcuCgpBZGRpdGlvbmFsbHkgdGhlIGZpbmFsIHN3aXRjaCgpJ2VzIEFDS1RZUEVf
RU9JIGNhc2UgcmUtYWNxdWlyZXMgdGhlIGxvY2sKanVzdCBmb3IgaXQgdG8gYmUgZHJvcHBlZCBh
Z2FpbiByaWdodCBhd2F5LiBEbyBhd2F5IHdpdGggdGhpcy4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysg
Yi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTExMDYsOSArMTEwNiw4IEBAIHN0YXRpYyB2b2lkIGly
cV9ndWVzdF9lb2lfdGltZXJfZm4odm9pZAogICAgIHVuc2lnbmVkIGludCBpcnEgPSBkZXNjIC0g
aXJxX2Rlc2M7CiAgICAgaXJxX2d1ZXN0X2FjdGlvbl90ICphY3Rpb247CiAgICAgY3B1bWFza190
IGNwdV9lb2lfbWFwOwotICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKLSAgICBzcGluX2xvY2tf
aXJxc2F2ZSgmZGVzYy0+bG9jaywgZmxhZ3MpOworICAgIHNwaW5fbG9ja19pcnEoJmRlc2MtPmxv
Y2spOwogICAgIAogICAgIGlmICggIShkZXNjLT5zdGF0dXMgJiBJUlFfR1VFU1QpICkKICAgICAg
ICAgZ290byBvdXQ7CkBAIC0xMTQ1LDEyICsxMTQ0LDExIEBAIHN0YXRpYyB2b2lkIGlycV9ndWVz
dF9lb2lfdGltZXJfZm4odm9pZAogICAgICAgICBjcHVtYXNrX2NvcHkoJmNwdV9lb2lfbWFwLCBh
Y3Rpb24tPmNwdV9lb2lfbWFwKTsKICAgICAgICAgc3Bpbl91bmxvY2tfaXJxKCZkZXNjLT5sb2Nr
KTsKICAgICAgICAgb25fc2VsZWN0ZWRfY3B1cygmY3B1X2VvaV9tYXAsIHNldF9lb2lfcmVhZHks
IGRlc2MsIDApOwotICAgICAgICBzcGluX2xvY2tfaXJxKCZkZXNjLT5sb2NrKTsKLSAgICAgICAg
YnJlYWs7CisgICAgICAgIHJldHVybjsKICAgICB9CiAKICBvdXQ6Ci0gICAgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZGVzYy0+bG9jaywgZmxhZ3MpOworICAgIHNwaW5fdW5sb2NrX2lycSgmZGVz
Yy0+bG9jayk7CiB9CiAKIHN0YXRpYyB2b2lkIF9fZG9fSVJRX2d1ZXN0KGludCBpcnEpCgoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
