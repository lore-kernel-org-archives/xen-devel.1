From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen/pv: Call get_cpu_address_sizes to
 set x86_virt/phys_bits
Date: Mon, 6 Aug 2018 17:27:38 -0400
Message-ID: <a3213a7a-549e-6693-6a7a-b88b42923cf9__27288.498907774$1533590749$gmane$org@oracle.com>
References: <20180721194909.23903-2-m.v.b@runbox.com>
 <20180724124547.32562-1-m.v.b@runbox.com>
 <7c07bb2f-e825-66bf-f517-86f893cd9e8b@oracle.com>
 <alpine.DEB.2.21.1808062216130.1788@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uht1=kv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fmn1d-0000lY-S7
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 21:26:49 +0000
In-Reply-To: <alpine.DEB.2.21.1808062216130.1788@nanos.tec.linutronix.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDYvMjAxOCAwNDoxNiBQTSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9uIE1vbiwg
NiBBdWcgMjAxOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Cj4+IHg4NiBtYWludGFpbmVycywg
dGhpcyBuZWVkcyB5b3VyIGFjayBwbGVhc2UuCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBHbGVpeG5l
ciA8dGdseEBsaW51dHJvbml4LmRlPgo+CgoKVGhhbmtzLgoKQXBwbGllZCB0byBmb3ItbGludXMt
NC4xOQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
