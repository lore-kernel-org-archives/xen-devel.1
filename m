From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 10/16] gic:vgic:gic-vgic: introduce non-atomic
 bitops
Date: Mon, 3 Dec 2018 12:58:26 +0000
Message-ID: <0225bd51-824f-2f98-afa5-c4f5e9456885@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-11-git-send-email-andrii.anisov@gmail.com>
 <20181129121416.222da0d5@donnerap.cambridge.arm.com>
 <f71bead8-4450-7f51-06d4-f4f6021df8d6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=od2x=om=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gTnoS-0003Fn-8V
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 12:59:00 +0000
In-Reply-To: <f71bead8-4450-7f51-06d4-f4f6021df8d6@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMDMvMTIvMjAxOCAxMjozMywgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBP
biAyOS4xMS4xOCAxNDoxNCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4+IE5haCwgcGxlYXNlIGRv
bid0IGRvIHRoaXMuCj4gU29ycnkgZm9yIG1ha2luZyB5b3UgY3J5aW5nIGxvb2tpbmcgYXQgdGhp
cyBjb2RlLgo+IEl0J3MgdGVycmlibGUsIEkga25vdy4gSXQncyByYXRoZXIgYW4gaWRlYS4KPiAK
Pj4gQ2FuIHlvdSBzaG93IHRoYXQgYXRvbWljIGJpdCBvcHMgYXJlIGEKPj4gcHJvYmxlbT8gVGhl
eSBzaG91bGRuJ3QgYmUgZXhwZW5zaXZlIHVubGVzcyBjb250ZW5kZWQsIGFsc28gcHJldHR5Cj4+
IGxpZ2h0d2VpZ2h0IG9uIHNtYWxsIHN5c3RlbXMgKHNpbmdsZSBjbHVzdGVyKS4KPiBZZXAsIGJ1
dCBzdGlsbCBpdCBpcyBhIGNhbGwgdG8gYSBmdW5jdGlvbiBvZiAxMCBvcGVyYXRpb25zIGluc3Rl
YWQgb2Ygb25lIGBvcnJgIAo+IGZvciBzZXRfYml0KCkuIFRha2luZyBpbiBhY2NvdW50IGEgaGVh
dnkgdXNhZ2Ugb2YgYml0b3BzIGluIHRoZSBvbGQgdmdpYyBjb2RlLCAKPiB0aGlzIHNob3VsZCBi
ZW5lZml0IGxhdGVuY3kuCgpUaGF0J3MgbWljcm8gb3B0aW1pemluZyBYZW4uLi4gdGhlcmUgYXJl
IGJldHRlciAoYW5kIGxlc3Mgcmlza3kpIHBsYWNlIHRvIGxvb2sgCmZvciBvcHRpbWl6YXRpb24u
CgpLbm93aW5nIGhvdyBmcmFnaWxlIHRoZSBsb2NraW5nIGlzIG9uIHRoZSBvbGQgdkdJQywgdGhl
IHJpc2sgb2YgbWljcm8tb3B0aW1pemluZyAKaXMgbm90IHdvcnRoIGl0LiBJZiB5b3UgY2FuIHBy
b3ZpZGUgbnVtYmVyIHRoYXQgc2hvd3MgeW91IGNhbiBpbXByb3ZlIApwZXJmb3JtYW5jZSBieSBt
b3JlIHRoYW4gMTAlIGluIGNvbW1vbiBjYXNlIHdpdGggdGhpcyBwYXRjaCBvbmx5LCB0aGVuIEkg
d2lsbCAKcmVjb25zaWRlciBteSBwb3NpdGlvbi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
