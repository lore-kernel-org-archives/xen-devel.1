From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: Likely build race, "/usr/bin/ld: cannot find -lvirt"
Date: Thu, 24 May 2018 11:27:51 +0100
Message-ID: <23302.37799.818992.987166__41114.7176790566$1527157597$gmane$org@mariner.uk.xensource.com>
References: <23301.35254.157281.663042@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gtij=il=citrix.com=prvs=675dd8bac=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLnTR-0006O2-Iw
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 10:27:57 +0000
In-Reply-To: <23301.35254.157281.663042@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: libvir-list@redhat.com
Cc: xen-devel@lists.xenproject.org, Jim Fehlig <jfehlig@suse.com>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gd3JpdGVzICgiTGlrZWx5IGJ1aWxkIHJhY2UsICIvdXNyL2Jpbi9sZDogY2Fu
bm90IGZpbmQgLWx2aXJ0IiIpOgo+IHRsO2RyOgo+IAo+IEkgdGhpbmsgdGhlcmUgaXMgYSBidWcg
aW4gbGlidmlydCdzIGJ1aWxkIHN5c3RlbSB3aGljaCwgd2l0aAo+IGxvdyBwcm9iYWJpbGl0eSwg
Y2F1c2VzIGEgYnVpbGQgZmFpbHVyZSBjb250YWluaW5nIHRoaXMgbWVzc2FnZToKPiAgIC91c3Iv
YmluL2xkOiBjYW5ub3QgZmluZCAtbHZpcnQKPiAKPiBDb21wbGV0ZSBidWlsZCBsb2dzIG9mIHR3
byBhdHRlbXB0czoKPiAKPiAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncy8xMjMwNDYvYnVpbGQtaTM4Ni1saWJ2aXJ0LzYudHMtbGlidmlydC1idWlsZC5s
b2cKPiAKPiAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cy8xMjMwOTYvYnVpbGQtaTM4Ni1saWJ2aXJ0LzYudHMtbGlidmlydC1idWlsZC5sb2cKCkkgaGF2
ZSBydW4gYSBudW1iZXIgb2YgYXR0ZW1wdHMuICBPdXQgb2YgNSBtb3JlLCAxIHN1Y2NlZWRlZC4g
IFNvIG91dApvZiBhIHRvdGFsIG9mIDcgYXR0ZW1wdHMsIDEgc3VjY2VlZGVkLiAgVGhpcyByZXBy
byByYXRlIGlzIGFuIElNTwpleGNlbGxlbnQgb3Bwb3J0dW5pdHkgdG8gZGVidWcgdGhpcyByYWNl
IDotKS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
