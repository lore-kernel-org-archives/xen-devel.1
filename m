From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: setup pv irq ops vector earlier
Date: Mon, 02 Jul 2018 05:18:02 -0600
Message-ID: <5B3A09EA02000078001CFBB7__10121.5947689072$1530530213$gmane$org@prv1-mh.provo.novell.com>
References: <20180702100001.19953-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=4twb=js=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fZwqO-0007KA-0Z
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 11:18:08 +0000
In-Reply-To: <20180702100001.19953-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA3LjE4IGF0IDEyOjAwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdo
dGVuX3B2LmMKPiBAQCAtMTIxMyw2ICsxMjEzLDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9p
ZCBfX2luaXQgeGVuX3N0YXJ0X2tlcm5lbCh2b2lkKQo+ICAJcHZfaW5mbyA9IHhlbl9pbmZvOwo+
ICAJcHZfaW5pdF9vcHMucGF0Y2ggPSBwYXJhdmlydF9wYXRjaF9kZWZhdWx0Owo+ICAJcHZfY3B1
X29wcyA9IHhlbl9jcHVfb3BzOwo+ICsJeGVuX2luaXRfaXJxX29wcygpOwoKSXNuJ3QgdGhpcyBz
dGlsbCB0b28gbGF0ZT8geGVuX3NldHVwX21hY2hwaHlzX21hcHBpbmcoKSwgZm9yIGV4YW1wbGUs
CmhhcyBhIFdBUk5fT04oKSwgd2hpY2ggaW1wbGllcyBtdWx0aXBsZSBwcmludGsoKXMuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
