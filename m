From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 08:33:03 -0600
Message-ID: <5B97D21F02000078001E75A5@prv1-mh.provo.novell.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <5B97868502000078001E712B@prv1-mh.provo.novell.com>
 <f150cba5-9458-fe1a-a974-4373e4636e7c@citrix.com>
 <5B97886002000078001E7151@prv1-mh.provo.novell.com>
 <8f79f39e-a8ef-36e8-aa0e-46d444cefb3c@epam.com>
 <5B978B2A02000078001E71A0@prv1-mh.provo.novell.com>
 <6a52ae76-5863-9c27-a605-0eec9aa34c1f@epam.com>
 <18c5a856-1291-1096-c7be-9bbcb64d67ab@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzjj4-0008DJ-2K
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 14:33:10 +0000
In-Reply-To: <18c5a856-1291-1096-c7be-9bbcb64d67ab@epam.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "andrii_anisov@epam.com" <andrii_anisov@epam.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDE2OjA0LCA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4gd3JvdGU6
Cj4gU28gd2hhdCB3b3VsZCBiZSB0aGUgY29uY2x1c2lvbj8KPiAKPiBJJ20gZ29pbmcgdG8gY2hh
bmdlIHRpbWVzdGFtcHMgZm9ybWF0IHRvIGRlY2ltYWwgZm9yIGFsbCBrZXloYW5kbGVycy4gCj4g
QnV0IHdoYXQgYWJvdXQgdGhlIGZvcm1hdCBpdHNlbGY/IERvZXMgZXhpc3RpbmcgcGxhaW4gbnMg
UFJJX3N0aW1lIGhhdmUgCj4gYSBjaGFuY2UgdG8gYmUgYWNrZWQ/CgpXZWxsLCBpZiBldmVyeW9u
ZSBlbHNlIHRoaW5rcyB0aGlzIGlzIGEgZ29vZCBpZGVhLCB0aGVuIEknbSBzdXJlIHNvbWVvbmUK
d2lsbCBhY2sgaXQgKGFuZCBJIGNlcnRhaW5seSB3b3VsZG4ndCB2ZXRvIGl0IGluIHN1Y2ggYSBj
YXNlKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
