From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 0/4] x86/xen/efi: Initialize UEFI secure
 boot state during dom0 boot
Date: Thu, 11 Jan 2018 12:51:07 +0000
Message-ID: <CAKv+Gu-_SHXCkfX5d3R08nW6rc4giR1d4VhDjF8J5miaTfSDow__33303.8733377636$1515675013$gmane$org@mail.gmail.com>
References: <1515507745-17391-1-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6a27=eg=linaro.org=ard.biesheuvel@srs-us1.protection.inumbo.net>)
 id 1eZcK6-0003eC-II
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 12:51:10 +0000
Received: by mail-it0-x243.google.com with SMTP id x42so3952485ita.4
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2018 04:51:08 -0800 (PST)
In-Reply-To: <1515507745-17391-1-git-send-email-daniel.kiper@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>, Ingo Molnar <mingo@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, linux-efi@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gOSBKYW51YXJ5IDIwMTggYXQgMTQ6MjIsIERhbmllbCBLaXBlciA8ZGFuaWVsLmtpcGVyQG9y
YWNsZS5jb20+IHdyb3RlOgo+IEhpLAo+Cj4gSW5pdGlhbGl6ZSBVRUZJIHNlY3VyZSBib290IHN0
YXRlIGR1cmluZyBkb20wIGJvb3QuIE90aGVyd2lzZSB0aGUga2VybmVsCj4gbWF5IG5vdCBldmVu
IGtub3cgdGhhdCBpdCBydW5zIG9uIHNlY3VyZSBib290IGVuYWJsZWQgcGxhdGZvcm0uCj4KCkhp
IERhbmllbCwKCkkgbXVzdCBzYXksIEkgYW0gbm90IHRvbyB0aHJpbGxlZCB3aXRoIHRoZSBhcHBy
b2FjaCB5b3UgaGF2ZSBjaG9zZW4KaGVyZS4gI2luY2x1ZGluZyAuYyBmaWxlcyBpbiBvdGhlciAu
YyBmaWxlcywgYW5kIHVzaW5nICNkZWZpbmVzIHRvCm92ZXJyaWRlIEMgZnVuY3Rpb25zIG9yIG90
aGVyIHN0dWIgZnVuY3Rpb25hbGl0eSBpcyByYXRoZXIgZnJhZ2lsZS4gSW4KcGFydGljdWxhciwg
aXQgbWVhbnMgd2UgaGF2ZSB0byBzdGFydCBjYXJpbmcgYWJvdXQgbm90IGJyZWFraW5nClhlbi94
ODYgY29kZSB3aGVuIG1ha2luZyBtb2RpZmljYXRpb25zIHRvIHRoZSBFRkkgc3R1YiwgYW5kIHRo
YXQgY29kZQppcyBhbHJlYWR5IGRpZmZpY3VsdCBlbm91Z2ggdG8gbWFpbnRhaW4sIGdpdmVuIHRo
YXQgaXQgaXMgc2hhcmVkCmJldHdlZW4gQVJNLCBhcm02NCBhbmQgeDg2LCBhbmQgcnVucyBlaXRo
ZXIgZnJvbSB0aGUgZGVjb21wcmVzc29yIG9yCnRoZSBrZXJuZWwgcHJvcGVyIChhcm02NCkgYnV0
IGluIHRoZSBjb250ZXh0IG9mIHRoZSBVRUZJIGZpcm13YXJlLgpOb25lIG9mIHRoZSBzdHViIGNv
ZGUgY3VycmVudGx5IHJ1bnMgaW4gb3JkaW5hcnkga2VybmVsIGNvbnRleHQuCgpTbyBwbGVhc2Us
IGNvdWxkIHlvdSB0cnkgdG8gZmluZCBhbm90aGVyIHdheSB0byBkbyB0aGlzPwoKVGhhbmtzLApB
cmQuCgoKPgo+ICBhcmNoL3g4Ni94ZW4vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAgNCArKystCj4gIGFyY2gveDg2L3hlbi9lZmkuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDE0ICsrKysrKysrKysrKysKPiAgZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1
Yi9zZWN1cmVib290LWNvcmUuYyB8ICAgNzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZmlybXdh
cmUvZWZpL2xpYnN0dWIvc2VjdXJlYm9vdC5jICAgICAgfCAgIDY2ICsrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDQgZmlsZXMgY2hh
bmdlZCwgOTkgaW5zZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25zKC0pCj4KPiBEYW5pZWwgS2lwZXIg
KDQpOgo+ICAgICAgIGVmaS9zdHViOiBFeHRyYWN0IGVmaV9nZXRfc2VjdXJlYm9vdCgpIHRvIHNl
cGFyYXRlIGZpbGUKPiAgICAgICB4ODYveGVuL2VmaTogSW5pdGlhbGl6ZSBib290X3BhcmFtcy5z
ZWN1cmVfYm9vdCBpbiB4ZW5fZWZpX2luaXQoKQo+ICAgICAgIGVmaTogVHdlYWsgZWZpX2dldF9z
ZWN1cmVib290KCkgYW5kIGl0cyBkYXRhIHNlY3Rpb24gYXNzaWdubWVudAo+ICAgICAgIGVmaTog
UmVuYW1lIGVmaV9nZXRfc2VjdXJlYm9vdCgpIHRvIF9fZWZpX2dldF9zZWN1cmVib290KCkgYW5k
IG1ha2UgaXQgc3RhdGljCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
