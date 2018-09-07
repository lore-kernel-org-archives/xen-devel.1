From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/balloon: add runtime control for
 scrubbing ballooned out pages
Date: Fri, 07 Sep 2018 09:58:21 -0600
Message-ID: <5B92A01D02000078001E67CE__41234.3299169608$1536335833$gmane$org@prv1-mh.provo.novell.com>
References: <20180907153117.17258-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p3pn=lv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fyJ9N-0000X7-I2
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 15:58:25 +0000
In-Reply-To: <20180907153117.17258-1-marmarek@invisiblethingslab.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Jiri Kosina <jkosina@suse.cz>, xen-devel <xen-devel@lists.xenproject.org>, Jonathan Corbet <corbet@lwn.net>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, gregkh@linuxfoundation.org, Frederic Weisbecker <frederic@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, David Rientjes <rientjes@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Thymo van Beers <thymovanbeers@gmail.com>, tglx@linutronix.de, Ingo Molnar <mingo@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA5LjE4IGF0IDE3OjMxLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gLS0tIGEvZHJpdmVycy94ZW4vbWVtLXJlc2VydmF0aW9uLmMKPiArKysgYi9k
cml2ZXJzL3hlbi9tZW0tcmVzZXJ2YXRpb24uYwo+IEBAIC0xNCw2ICsxNCwxNCBAQAo+ICAKPiAg
I2luY2x1ZGUgPHhlbi9pbnRlcmZhY2UvbWVtb3J5Lmg+Cj4gICNpbmNsdWRlIDx4ZW4vbWVtLXJl
c2VydmF0aW9uLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgo+ICsKPiArI2lm
ZGVmIENPTkZJR19YRU5fU0NSVUJfUEFHRVNfREVGQVVMVAo+ICtib29sIF9fcmVhZF9tb3N0bHkg
eGVuX3NjcnViX3BhZ2VzID0gdHJ1ZTsKPiArI2Vsc2UKPiArYm9vbCBfX3JlYWRfbW9zdGx5IHhl
bl9zY3J1Yl9wYWdlcyA9IGZhbHNlOwo+ICsjZW5kaWYKClVzZSBJU19FTkFCTEVEKCkgaGVyZSBp
bnN0ZWFkIG9mIHRoZSAjaWZkZWY/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
