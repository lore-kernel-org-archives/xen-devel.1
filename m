From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Wed, 4 Jul 2018 14:58:17 +0100
Message-ID: <23356.53881.85485.72287@mariner.uk.xensource.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
 <5B30F2B202000078001CD8E4@prv1-mh.provo.novell.com>
 <20180704120629.GJ4670@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8qzb=ju=citrix.com=prvs=716786cb2=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1faiIX-0006Bz-UE
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 13:58:21 +0000
In-Reply-To: <20180704120629.GJ4670@olila.local.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

RGFuaWVsIEtpcGVyIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjIgMS84XSB4ZW46IGNhbGN1bGF0ZSBY
RU5fQlVJTERfVElNRSB1c2luZyBYRU5fQlVJTERfREFURSB2YWx1ZSIpOgo+IFdlbGwsIHRoaXMg
Y29tcGxpY2F0ZXMgc2l0dWF0aW9uIGZ1cnRoZXIgYW5kIGl0IHNlZW1zIHRvIG1lIHRoYXQKPiBz
ZWQtZXJ5IGNhbm5vdCBiZSBzdWZmaWNpZW50LiBBbnl3YXksIEkgd2lsbCB0YWtlIGEgbG9vayBo
b3cgdG8KPiBzb2x2ZSB0aGF0LgoKT3VyIG90aGVyIGN1cnJlbnQgaG9zdCBPUyBpcyBGcmVlQlNE
LiAgRnJlZUJTRCdzIGRhdGUoMSkgdXNlcyAtZCBmb3IKc29tZXRoaW5nIHV0dGVybHkgZGlmZmVy
ZW50IChhbHNvLCBzb21ldGhpbmcgbWFkKS4gIENhbiB3ZSByZWx5IG9uClBlcmwgeWV0ID8gIFBl
cmwgY2FuIGRvIHRoaXMga2luZCBvZiB0aGluZyBlYXNpbHkgZW5vdWdoLgoKQWx0ZXJuYXRpdmVs
eSB3ZSBjb3VsZCBoYXZlIGEgd3JhcHBlciBzY3JpcHQuCgpBbmRyZXcgQ29vcGVyOgo+IFdoeSBh
cmUgd2UgYWRkaW5nIHlldCBtb3JlIFhlbiBzcGVjaWZpYyBsb2dpYyB0byBpbXBsZW1lbnQgdGhl
IHNhbWUgYXMKPiBTT1VSQ0VfREFURV9FUE9DSCBmcm9tIHRoZSByZXByb2R1Y2libGUtYnVpbGRz
Lm9yZyBlZmZvcnQ/CgpXZSBzaG91bGQgY2xlYXJseSBob25vdXIgU09VUkNFX0RBVEVfRVBPQ0gu
ICBCdXQgdGhhdCdzIGEgZGlmZmVyZW50CnF1ZXN0aW9uLgoKSSB0aGluayB0aGUgcmlnaHQgdGhp
bmcgaXMgc29tZXRoaW5nIGxpa2UgdGhpczoKCmV4cG9ydCBYRU5fQlVJTERfUE9TSVhfVElNRQk/
PSAkKHNoZWxsIGVjaG8gJCR7U09VUkNFX0RBVEVfRVBPQ0gtZGF0ZSArJXN9KQpleHBvcnQgWEVO
X0JVSUxEX0RBVEUJCT89ICQoc2hlbGwgTENfQUxMPUMgZGF0ZV9wYXJzaW5nX2Vwb2NoICQoWEVO
X0JVSUxEX0VQT0NIKSkKZXhwb3J0IFhFTl9CVUlMRF9USU1FCQk/PSAkKHNoZWxsIExDX0FMTD1D
IGRhdGVfcGFyc2luZ19lcG9jaCAkKFhFTl9CVUlMRF9FUE9DSCkgKyVUKQoKV2hlcmUgZGF0ZV9w
YXJzaW5nX2Vwb2NoIGlzIHRoaXMgb24gR05VIHN5c3RlbXMKCiAgICMhL2Jpbi9zaAogICBzZXQg
LWUKICAgZXBvY2g9JDE7IHNoaWZ0CiAgIGRhdGUgLXUgLWQgIkAkZXBvY2giICIkQCIKCmFuZCBJ
IHRoaW5rIHNvbWV0aGluZyBsaWtlIHRoaXMgb24gRnJlZUJTRAoKICAgIyEvYmluL3NoCiAgIHNl
dCAtZQogICBlcG9jaD0kMTsgc2hpZnQKICAgZGF0ZSAtdSAtam4gLWYlcyAiJGVwb2NoIiAiJEAi
CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
