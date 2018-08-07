From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2] xen/pv: Call get_cpu_address_sizes to
 set x86_virt/phys_bits
Date: Tue, 7 Aug 2018 11:50:29 +0200
Message-ID: <20180807095029.GA4921__15100.7256391042$1533635366$gmane$org@gmail.com>
References: <20180721194909.23903-2-m.v.b@runbox.com>
 <20180724124547.32562-1-m.v.b@runbox.com>
 <7c07bb2f-e825-66bf-f517-86f893cd9e8b@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qiff=kw=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1fmydO-0002zA-UF
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 09:50:35 +0000
Received: by mail-wm0-x242.google.com with SMTP id o11-v6so16620963wmh.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Aug 2018 02:50:33 -0700 (PDT)
Content-Disposition: inline
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
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

CiogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cgo+
IHg4NiBtYWludGFpbmVycywgdGhpcyBuZWVkcyB5b3VyIGFjayBwbGVhc2UuCgpMR1RNOgoKQWNr
ZWQtYnk6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwub3JnPgoKVGhhbmtzLAoKCUluZ28KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
