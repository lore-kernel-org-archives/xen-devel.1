From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC 2] [DO NOT APPLY] introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
Date: Tue, 28 May 2019 09:59:17 +0100
Message-ID: <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ExCW=T4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hVXx4-0004KI-SQ
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 08:59:22 +0000
In-Reply-To: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKSSBhbSBub3QgYW5zd2VyaW5nIG9uIHRoZSBjb250ZW50IHlldCwgSSB3aWxs
IGRvIHRoYXQgc2VwYXJhdGVseS4gVGhlIHRocmVhZGluZyAKZm9yIHRoaXMgc2VyaWVzIGxvb2tz
IHF1aXRlIGNvbmZ1c2luZy4gVGhlIGhlYWQgb2YgdGhlIHRocmVhZCBpcyB0aGlzIHBhdGNoIChp
LmUgClJGQyAyKSBidXQgdGhlbiB5b3UgaGF2ZSBhIGNvdmVyIGxldHRlciB3aXRoaW4gdGhlIHRo
cmVhZCB0YWdnZWQgIlYzIi4KCiBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0aGUgMiBlLW1haWxz
IHRhZ2dlZCAiVjMiIGlzIHRoZSBvcmlnaW5hbCB2ZXJzaW9uIHdoZXJlIAphcyBSRkMgMiBhbmQg
UkZDIDMgYXJlIHZhcmlhbnRzLiBBbSBJIGNvcnJlY3Q/CgpJZiBzbywgZm9yIG5leHQgdGltZSwg
SSB3b3VsZCByZWNvbW1lbmQgdG8gaGF2ZSB0aGUgY292ZXIgbGV0dGVyIGZpcnN0IGFuZCB0aGVu
IAphbGwgdGhlIHBhdGNoZXMgc2VuZCAiSW4tUmVwbHktVG8iIHRoZSBjb3ZlciBsZXR0ZXIuIFRo
aXMgbWFrZXMgZWFzaWVyIHRvIHRyYWNrIApzZXJpZXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
