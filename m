From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 06/27] x86/entry/64: Adapt assembly for
	PIE support
Date: Thu, 15 Mar 2018 11:18:19 +0100
Message-ID: <6d14b321-debc-5bc8-8c1b-14150052f5b8__21902.546278625$1521109057$gmane$org@redhat.com>
References: <20180313205945.245105-1-thgarnie@google.com>
 <20180313205945.245105-7-thgarnie@google.com>
 <20180314102951.GQ4043@hirez.programming.kicks-ass.net>
 <alpine.DEB.2.20.1803141051210.14471@nuc-kabylake>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fl0o=gf=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1ewPy5-00066H-QY
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 10:18:41 +0000
In-Reply-To: <alpine.DEB.2.20.1803141051210.14471@nuc-kabylake>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Lameter <cl@linux.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Hocko <mhocko@suse.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Petr Mladek <pmladek@suse.com>, Len Brown <len.brown@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Christopher Li <sparse@chrisli.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>, kernel-hardening@lists.openwall.com, Jiri Slaby <jslaby@suse.cz>, Alok Kataria <akataria@vmware.com>, linux-doc@vger.kernel.org, linux-arch@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>, =?UTF-8?B?UmFka
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOCAxNjo1NCwgQ2hyaXN0b3BoZXIgTGFtZXRlciB3cm90ZToKPj4+ICsJcHVz
aHEJJXJheAkJLyogU3VwcG9ydCBQb3NpdGlvbiBJbmRlcGVuZGVudCBDb2RlICovCj4+PiArCWxl
YXEJMWYoJXJpcCksICVyYXgJLyogUklQICovCj4+PiArCXhjaGdxCSVyYXgsICglcnNwKQkvKiBS
ZXN0b3JlIFJBWCwgcHV0IDFmICovCj4+PiAgCWlyZXRxCQkJLyogY29udGludWVzIGF0IHJlcGVh
dF9ubWkgYmVsb3cgKi8KPj4+ICAJVU5XSU5EX0hJTlRfSVJFVF9SRUdTCj4+PiAgMToKPj4gVXJn
aCwgeGNoZyB3aXRoIGEgbWVtb3AgaGFzIGFuIGltcGxpY2l0IExPQ0sgcHJlZml4Lgo+IHRoaXNf
Y3B1X3hjaGcgdXNlcyBubyBsb2NrIGNtcHhjaGcgYXMgYSByZXBsYWNlbWVudCB0byByZWR1Y2Ug
bGF0ZW5jeS4KClRoYXQgcmVxdWlyZXMgdXNpbmcgYSBzZWNvbmQgcmVnaXN0ZXIsIHNpbmNlICVy
YXggaXMgdXNlZCBhcyB0aGUKY29tcGFyaXNvbiBzb3VyY2UuICBBdCB0aGlzIHBvaW50IGl0J3Mg
ZWFzaWVyIHRvIGp1c3QgcHVzaCAlcmF4IHR3aWNlOgoKCXB1c2hxICVyYXgKCXB1c2hxICVyYXgK
CWxlYXEgMWYoJWlwKSwgJXJheAoJbW92cSAlcmF4LCA4KCVyc3ApCglwb3BxICVyYXgKCWlyZXRx
CgpQYW9sbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
