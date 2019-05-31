From: Nadav Amit <namit@vmware.com>
Subject: Re: [RFC PATCH v2 04/12] x86/mm/tlb: Flush remote and
 local TLBs concurrently
Date: Fri, 31 May 2019 19:44:41 +0000
Message-ID: <1DEA29A7-D033-4816-876C-05E7D77F0437__45366.0612272628$1559331949$gmane$org@vmware.com>
References: <20190531063645.4697-1-namit@vmware.com>
 <20190531063645.4697-5-namit@vmware.com>
 <a847ee9c-4faf-c8b4-43bb-cc30e0980796@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ifn6=T7=vmware.com=namit@srs-us1.protection.inumbo.net>)
 id 1hWnSI-0000fr-6H
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 19:44:46 +0000
In-Reply-To: <a847ee9c-4faf-c8b4-43bb-cc30e0980796@suse.com>
Content-Language: en-US
Content-ID: <498DEB6111D0B64C9D5657F78CFDD0EF@namprd05.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Sasha Levin <sashal@kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Hemminger <sthemmin@microsoft.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>, the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, Dave Hansen <dave.hansen@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

PiBPbiBNYXkgMzEsIDIwMTksIGF0IDQ6NDggQU0sIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4gCj4gT24gMzEvMDUvMjAxOSAwODozNiwgTmFkYXYgQW1pdCB3cm90ZToK
Pj4gCj4+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmgKPj4gKysr
IGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaAo+PiBAQCAtMjExLDYgKzIx
MSwxMiBAQCBzdHJ1Y3QgcHZfbW11X29wcyB7Cj4+IAl2b2lkICgqZmx1c2hfdGxiX3VzZXIpKHZv
aWQpOwo+PiAJdm9pZCAoKmZsdXNoX3RsYl9rZXJuZWwpKHZvaWQpOwo+PiAJdm9pZCAoKmZsdXNo
X3RsYl9vbmVfdXNlcikodW5zaWduZWQgbG9uZyBhZGRyKTsKPj4gKwkvKgo+PiArCSAqIGZsdXNo
X3RsYl9tdWx0aSgpIGlzIHRoZSBwcmVmZXJyZWQgaW50ZXJmYWNlLiBXaGVuIGl0IGlzIHVzZWQs
Cj4+ICsJICogZmx1c2hfdGxiX290aGVycygpIHNob3VsZCByZXR1cm4gZmFsc2UuCj4gCj4gRGlk
bid0IHlvdSB3YW50IHRvIHJlbW92ZS9jaGFuZ2UgdGhpcyBjb21tZW50PwoKWWVzISBTb3JyeSBm
b3IgdGhhdC4gRml4ZWQgbm93LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
