From: Oscar Salvador <osalvador@techadventures.net>
Subject: Re: [PATCH v3 3/6] mm/memory_hotplug: fix
 online/offline_pages called w.o. mem_hotplug_lock
Date: Fri, 5 Oct 2018 09:07:56 +0200
Message-ID: <20181005070756.GA27754__49632.5329565026$1538723213$gmane$org@techadventures.net>
References: <20180927092554.13567-1-david@redhat.com>
 <20180927092554.13567-4-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8npz=mr=gmail.com=osalvador.vilardaga@srs-us1.protection.inumbo.net>)
 id 1g8KDR-0008Ho-K5
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 07:08:01 +0000
Received: by mail-wr1-f47.google.com with SMTP id 61-v6so11630366wrb.6
 for <xen-devel@lists.xenproject.org>; Fri, 05 Oct 2018 00:08:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180927092554.13567-4-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Dan Williams <dan.j.williams@intel.com>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMTE6MjU6NTFBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gUmV2aWV3ZWQtYnk6IFBhdmVsIFRhdGFzaGluIDxwYXZlbC50YXRhc2hpbkBt
aWNyb3NvZnQuY29tPgo+IFJldmlld2VkLWJ5OiBSYXNobWljYSBHdXB0YSA8cmFzaG1pY2EuZ0Bn
bWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhh
dC5jb20+CgpSZXZpZXdlZC1ieTogT3NjYXIgU2FsdmFkb3IgPG9zYWx2YWRvckBzdXNlLmRlPgot
LSAKT3NjYXIgU2FsdmFkb3IKU1VTRSBMMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
