From: Oscar Salvador <osalvador@techadventures.net>
Subject: Re: [PATCH v3 2/6] mm/memory_hotplug: make add_memory()
 take the device_hotplug_lock
Date: Fri, 5 Oct 2018 09:16:22 +0200
Message-ID: <20181005071622.GD27754__7526.1908503764$1538723708$gmane$org@techadventures.net>
References: <20180927092554.13567-1-david@redhat.com>
 <20180927092554.13567-3-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8npz=mr=gmail.com=osalvador.vilardaga@srs-us1.protection.inumbo.net>)
 id 1g8KLZ-0000lD-FT
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 07:16:25 +0000
Received: by mail-wm1-f65.google.com with SMTP id r63-v6so823246wma.4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Oct 2018 00:16:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180927092554.13567-3-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Dan Williams <dan.j.williams@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>, Mathieu Malaterre <malat@debian.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org, John Allen <jallen@linux.vnet.ibm.com>, devel@linuxdriverproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMTE6MjU6NTBBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gUmV2aWV3ZWQtYnk6IFBhdmVsIFRhdGFzaGluIDxwYXZlbC50YXRhc2hpbkBt
aWNyb3NvZnQuY29tPgo+IFJldmlld2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmou
d3lzb2NraUBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJhc2htaWNhIEd1cHRhIDxyYXNobWlj
YS5nQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBPc2NhciBTYWx2YWRvciA8b3NhbHZhZG9yQHN1c2Uu
ZGU+CgotLSAKT3NjYXIgU2FsdmFkb3IKU1VTRSBMMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
