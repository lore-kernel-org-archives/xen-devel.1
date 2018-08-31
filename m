From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] add thread id and online state to cpu
 topology info
Date: Fri, 31 Aug 2018 18:22:13 +0200
Message-ID: <20180831162215.23318-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/b/z=lo=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fvmBk-0006tw-R9
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 16:22:24 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

VGhlIHRvcG9sb2d5IGluZm9ybWF0aW9uIHByaW50ZWQgdmlhICJ4bCBpbmZvIC1uIiBkb2Vzbid0
IGNvbnRhaW4gdGhlCnRocmVhZCBpZCBvZiB0aGUgY3B1LiBBZGRpdGlvbmFsbHkgZXNwZWNpYWxs
eSB3aXRoIHRoZSAic210PTAiIGJvb3QKb3B0aW9uIGl0IGlzIGludGVyZXN0aW5nIHRvIGtub3cg
d2hpY2ggY3B1IGlzIG9ubGluZSBvciBvZmZsaW5lLgoKVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyB0
aGUgcmVzcGVjdGl2ZSBpbmZvcm1hdGlvbiB0byB0aGUgY3B1IHRvcG9sb2d5CmluZm9ybWF0aW9u
LgoKVGhpcyBwYXRjaCBzZXJpZXMgaXMgZGVwZW5kaW5nIG9uIHRoZSBzZXJpZXMgImZpeCBzbXQ9
MCBmYWxsb3V0Ii4KCkp1ZXJnZW4gR3Jvc3MgKDIpOgogIGFkZCBjcHVfdGhyZWFkX2lkIHRvIHN0
cnVjdCBjcHVpbmZvX3g4NgogIGFkZCB0aHJlYWQgYW5kIHN0YXRlIGluZm8gdG8gWEVOX1NZU0NU
TF9jcHV0b3BvaW5mbwoKIHRvb2xzL2xpYnhsL2xpYnhsLmMgICAgICAgICAgICAgfCAxMyArKysr
KysrKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgICAgIHwgIDggKysrKysrKysK
IHRvb2xzL3hsL3hsX2luZm8uYyAgICAgICAgICAgICAgfCAgOCArKysrKy0tLQogeGVuL2FyY2gv
eDg2L2NwdS9jb21tb24uYyAgICAgICB8ICAxICsKIHhlbi9hcmNoL3g4Ni9zbXBib290LmMgICAg
ICAgICAgfCAxMCArKysrKysrKysrCiB4ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgICAgIHwg
IDQgKysrKwogeGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCB8ICAxICsKIHhlbi9pbmNs
dWRlL2FzbS14ODYvcHJvY2Vzc29yLmggfCAgMiArKwogeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0
bC5oICAgICB8ICA3ICsrKysrKy0KIDkgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
