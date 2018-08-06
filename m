From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] xen/pv: Call get_cpu_address_sizes to
 set x86_virt/phys_bits
Date: Mon, 6 Aug 2018 22:16:33 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808062216130.1788__44467.426747042$1533586535$gmane$org@nanos.tec.linutronix.de>
References: <20180721194909.23903-2-m.v.b@runbox.com>
 <20180724124547.32562-1-m.v.b@runbox.com>
 <7c07bb2f-e825-66bf-f517-86f893cd9e8b@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cwbr=kv=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1fmlvt-0003nl-4U
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 20:16:49 +0000
In-Reply-To: <7c07bb2f-e825-66bf-f517-86f893cd9e8b@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA2IEF1ZyAyMDE4LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cgo+IHg4NiBtYWludGFp
bmVycywgdGhpcyBuZWVkcyB5b3VyIGFjayBwbGVhc2UuCgpSZXZpZXdlZC1ieTogVGhvbWFzIEds
ZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
