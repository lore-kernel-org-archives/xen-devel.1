From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: issue branch prediction barrier when
 switching 64-bit guest to kernel mode
Date: Fri, 16 Feb 2018 08:39:53 -0700
Message-ID: <5A87095902000078001A87D3@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=jcsl=fk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1emi7A-0003UA-A6
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 15:39:56 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2UgYm90aCBrZXJuZWwgYW5kIHVzZXIgbW9kZSBydW4gaW4gcmluZyAzLCB0aGV5IHJ1biBp
biB0aGUgc2FtZQoicHJlZGljdG9yIG1vZGUiLiBXaGlsZSB0aGUga2VybmVsIGNvdWxkIHRha2Ug
Y2FyZSBvZiB0aGlzIGl0c2VsZiwgZG9pbmcKc28gd291bGQgYmUgeWV0IGFub3RoZXIgaXRlbSBk
aXN0aW5ndWlzaGluZyBQViBmcm9tIG5hdGl2ZS4gQWRkaXRpb25hbGx5CndlJ3JlIGluIGEgbXVj
aCBiZXR0ZXIgcG9zaXRpb24gdG8gaXNzdWUgdGhlIGJhcnJpZXIgY29tbWFuZCwgYW5kIHdlIGNh
bgpzYXZlIGEgI0dQIChmb3IgcHJpdmlsZWdlZCBpbnN0cnVjdGlvbiBlbXVsYXRpb24pIHRoaXMg
d2F5LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4u
YwpAQCAtMTAsNiArMTAsNyBAQAogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgogCiAjaW5jbHVkZSA8
YXNtL3B2L2RvbWFpbi5oPgorI2luY2x1ZGUgPGFzbS9zcGVjX2N0cmwuaD4KIAogLyogT3ZlcnJp
ZGUgbWFjcm9zIGZyb20gYXNtL3BhZ2UuaCB0byBtYWtlIHRoZW0gd29yayB3aXRoIG1mbl90ICov
CiAjdW5kZWYgbWZuX3RvX3BhZ2UKQEAgLTI1MSw2ICsyNTIsMTAgQEAgdm9pZCB0b2dnbGVfZ3Vl
c3RfbW9kZShzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAgZWxzZQogICAgICAgICAgICAgdi0+YXJj
aC5wdl92Y3B1LmdzX2Jhc2VfdXNlciA9IF9fcmRnc2Jhc2UoKTsKICAgICB9CisKKyAgICBpZiAo
IG9wdF9pYnBiICYmICEodi0+YXJjaC5mbGFncyAmIFRGX2tlcm5lbF9tb2RlKSApCisgICAgICAg
IHdybXNybChNU1JfUFJFRF9DTUQsIFBSRURfQ01EX0lCUEIpOworCiAgICAgYXNtIHZvbGF0aWxl
ICggInN3YXBncyIgKTsKIAogICAgIF90b2dnbGVfZ3Vlc3RfcHQodik7CgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
