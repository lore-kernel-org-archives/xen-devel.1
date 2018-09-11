From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 17:04:48 +0300
Message-ID: <18c5a856-1291-1096-c7be-9bbcb64d67ab@epam.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <5B97868502000078001E712B@prv1-mh.provo.novell.com>
 <f150cba5-9458-fe1a-a974-4373e4636e7c@citrix.com>
 <5B97886002000078001E7151@prv1-mh.provo.novell.com>
 <8f79f39e-a8ef-36e8-aa0e-46d444cefb3c@epam.com>
 <5B978B2A02000078001E71A0@prv1-mh.provo.novell.com>
 <6a52ae76-5863-9c27-a605-0eec9aa34c1f@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7wzx=lz=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1fzjM7-0004hI-6Q
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 14:09:27 +0000
In-Reply-To: <6a52ae76-5863-9c27-a605-0eec9aa34c1f@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

U28gd2hhdCB3b3VsZCBiZSB0aGUgY29uY2x1c2lvbj8KCkknbSBnb2luZyB0byBjaGFuZ2UgdGlt
ZXN0YW1wcyBmb3JtYXQgdG8gZGVjaW1hbCBmb3IgYWxsIGtleWhhbmRsZXJzLiAKQnV0IHdoYXQg
YWJvdXQgdGhlIGZvcm1hdCBpdHNlbGY/IERvZXMgZXhpc3RpbmcgcGxhaW4gbnMgUFJJX3N0aW1l
IGhhdmUgCmEgY2hhbmNlIHRvIGJlIGFja2VkPwoKT3Igc2hvdWxkIEkgdGhpbmsgb2YgYW4gZXh0
ZW5kZWQgZm9ybWF0IChzZWNvbmRzIHdpdGggZnJhY3Rpb25zLCBtcyB3aXRoIApmcmFjdGlvbnMp
PwoKT24gMTEuMDkuMTggMTI6NDksIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4KPiBPbiAxMS4wOS4x
OCAxMjozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBTaG91bGQgd2UgdGhpbmsgYWJvdXQgcmVw
bGFjaW5nIFBSSV9zdGltZT8KPj4gV2h5IG5vdCwgYnV0IHRoYXQgd291bGQgcmVxdWlyZSBhZGRp
bmcgYW5vdGhlciAlcCBzdWZmaXggb3IKPj4gaW50cm9kdWNpbmcgYSBjb25zdHJ1Y3Qgc3BsaXR0
aW5nIHNfdGltZV90IHZhbHVlcyBpbnRvIHR3byBwaWVjZXMKPj4gKHRvIGJlIHVzZWQgdG8gaGlk
ZSB0aGUgdHdvIHByaW50aygpIGFyZ3VtZW50cyByZXF1aXJlZCkuCj4gSSBkb24ndCB0aGluayB0
aGF0IHNwbGl0dGluZyBzX3RpbWVfaSBpcyByZWFzb25hYmxlLgo+IEludHJvZHVjaW5nICVwdCBm
b3IgbnMgZ3JhbnVsYXJpdHkgYW5kICVwVCBmb3IgbXMgY291bGQgYmUgYW4gb3B0aW9uLgo+Cgot
LSAKCipBbmRyaWkgQW5pc292KgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
