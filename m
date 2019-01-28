From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Mon, 28 Jan 2019 18:58:32 +0200
Message-ID: <564276dc-d455-01f7-2055-3a585970dbcc@gmail.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M9ZJ=QE=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1goAF3-0001ci-Jc
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 16:58:37 +0000
Received: by mail-lf1-x144.google.com with SMTP id p6so12439320lfc.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jan 2019 08:58:36 -0800 (PST)
In-Reply-To: <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOC4wMS4xOSAxODo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDEvMjgv
MTkgNDo0MCBQTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4KPj4KPj4gT24gMjguMDEuMTkgMTg6
MzYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhvbGQgb24sIENBNTcgYW5kIENBNTMgYXJlIEFS
TXY4IGNvcmVzLiBTbyBhcmUgeW91IHVzaW5nIDMyLWJpdCBvciA2NC1iaXQgZ3Vlc3RzPwo+PiA2
NC1iaXQgZ3Vlc3RzLgo+Pgo+Pj4gNjQtYml0IGd1ZXN0IHNob3VsZCBub3QgaGF2ZSBhbnkgU2V0
L1dheSBvcGVyYXRpb25zIHVubGVzcyB5b3UgYXJlIHVzaW5nIGEgdmVyeSB2ZXJ5IG9sZCBMaW51
eC4gU28gd2hhdCBpcyB0aGUgdmVyc2lvbiBvZiBlYWNoIGd1ZXN0Pwo+PiBBbGwgb2YgdGhlbSBk
ZXJpdmVkIGZyb20gNC4xNC4zNS4KPiAKPiBUaGVyZSBzaG91bGQgYmUgbm8gU2V0L1dheSBpbiBM
aW51eCA0LjE0LiBTbyBJIGFtIGEgYml0IGNvbmZ1c2VkIGhvdyBjYW4gZXZlbiByZWFjaCB0aGlz
IGNvZGUuCj4gCj4gQ2FuIHlvdSBsb29rIGlmIHRoZXJlIGFyZSBhIFNldC9XYXkgZXhlY3V0ZWQg
aW4gTGludXg/IEFuZCB3aGVyZT8gWW91IGNhbiBhZGQgc29tZSBjb2RlIGluIGFybTY0L3ZzeXNy
ZWcuYyB0byB0cmFjayB0aGF0IGRvd24uClllcCwgSSdtIHN0aWxsIGxvb2tpbmcgaW50byBkZXRh
aWxzIG9mIHRoYXQgc3R1ZmYuCllldCB0aGlzIHBhdGNoIG1ha2VzIHRoZSBzeXN0ZW0gZnVuY3Rp
b25hbC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
