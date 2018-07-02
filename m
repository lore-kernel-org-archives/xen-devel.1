From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: setup pv irq ops vector earlier
Date: Mon, 2 Jul 2018 13:27:55 +0200
Message-ID: <f6615f1c-6835-eba5-7b38-be06927700c9__23578.2882817604$1530530795$gmane$org@suse.com>
References: <20180702100001.19953-1-jgross@suse.com>
 <5B3A09EA02000078001CFBB7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=37lk=js=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fZwzu-0008Vm-Ne
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 11:27:58 +0000
In-Reply-To: <5B3A09EA02000078001CFBB7@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, mingo@redhat.com, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDcvMTggMTM6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjA3LjE4IGF0
IDEyOjAwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gLS0tIGEvYXJjaC94ODYveGVuL2Vu
bGlnaHRlbl9wdi5jCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+PiBAQCAt
MTIxMyw2ICsxMjEzLDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBfX2luaXQgeGVuX3N0
YXJ0X2tlcm5lbCh2b2lkKQo+PiAgCXB2X2luZm8gPSB4ZW5faW5mbzsKPj4gIAlwdl9pbml0X29w
cy5wYXRjaCA9IHBhcmF2aXJ0X3BhdGNoX2RlZmF1bHQ7Cj4+ICAJcHZfY3B1X29wcyA9IHhlbl9j
cHVfb3BzOwo+PiArCXhlbl9pbml0X2lycV9vcHMoKTsKPiAKPiBJc24ndCB0aGlzIHN0aWxsIHRv
byBsYXRlPyB4ZW5fc2V0dXBfbWFjaHBoeXNfbWFwcGluZygpLCBmb3IgZXhhbXBsZSwKPiBoYXMg
YSBXQVJOX09OKCksIHdoaWNoIGltcGxpZXMgbXVsdGlwbGUgcHJpbnRrKClzLgoKU2VlbXMgYXMg
aWYgaXQgd291bGQgYmUgYSBnb29kIGlkZWEgdG8gbW92ZSBjYWxsaW5nCnhlbl9zZXR1cF9tYWNo
cGh5c19tYXBwaW5nKCkgaW50byB4ZW5faW5pdF9tbXVfb3BzKCkuIFRoZXJlIGlzIHJlYWxseQpu
byBuZWVkIHRvIGRvIGl0IGVhcmxpZXIuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
