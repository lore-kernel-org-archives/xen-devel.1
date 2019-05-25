From: Nadav Amit <namit@vmware.com>
Subject: Re: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local
 TLBs concurrently
Date: Sat, 25 May 2019 08:38:05 +0000
Message-ID: <F9875905-7383-4815-B6F6-B3EA73B7BF3F__48223.5453136795$1558773570$gmane$org@vmware.com>
References: <20190525082203.6531-1-namit@vmware.com>
 <20190525082203.6531-6-namit@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yIH2=TZ=vmware.com=namit@srs-us1.protection.inumbo.net>)
 id 1hUSCA-000516-OG
 for xen-devel@lists.xenproject.org; Sat, 25 May 2019 08:38:26 +0000
In-Reply-To: <20190525082203.6531-6-namit@vmware.com>
Content-Language: en-US
Content-ID: <75106B379062644D9E12CC0F943F0E87@namprd05.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Nadav Amit <namit@vmware.com>
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Hemminger <sthemmin@microsoft.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

PiBPbiBNYXkgMjUsIDIwMTksIGF0IDE6MjIgQU0sIE5hZGF2IEFtaXQgPG5hbWl0QHZtd2FyZS5j
b20+IHdyb3RlOgo+IAo+IFRvIGltcHJvdmUgVExCIHNob290ZG93biBwZXJmb3JtYW5jZSwgZmx1
c2ggdGhlIHJlbW90ZSBhbmQgbG9jYWwgVExCcwo+IGNvbmN1cnJlbnRseS4gSW50cm9kdWNlIGZs
dXNoX3RsYl9tdWx0aSgpIHRoYXQgZG9lcyBzby4gVGhlIGN1cnJlbnQKPiBmbHVzaF90bGJfb3Ro
ZXJzKCkgaW50ZXJmYWNlIGlzIGtlcHQsIHNpbmNlIHBhcmF2aXJ0dWFsIGludGVyZmFjZXMgbmVl
ZAo+IHRvIGJlIGFkYXB0ZWQgZmlyc3QgYmVmb3JlIGl0IGNhbiBiZSByZW1vdmVkLiBUaGlzIGlz
IGxlZnQgZm9yIGZ1dHVyZQo+IHdvcmsuIEluIHN1Y2ggUFYgZW52aXJvbm1lbnRzLCBUTEIgZmx1
c2hlcyBhcmUgbm90IHBlcmZvcm1lZCwgYXQgdGhpcwo+IHRpbWUsIGNvbmN1cnJlbnRseS4KPiAK
PiArdm9pZCBuYXRpdmVfZmx1c2hfdGxiX211bHRpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVt
YXNrLAo+ICsJCQkgICAgY29uc3Qgc3RydWN0IGZsdXNoX3RsYl9pbmZvICppbmZvKQo+IHsKPiAr
CS8qCj4gKwkgKiBuYXRpdmVfZmx1c2hfdGxiX211bHRpKCkgY2FuIGhhbmRsZSBhIHNpbmdsZSBD
UFUsIGJ1dCBpdCBpcwo+ICsJICogc3Vib3B0aW1hbCBpZiB0aGUgbG9jYWwgVExCIHNob3VsZCBi
ZSBmbHVzaGVkLCBhbmQgdGhlcmVmb3JlIHNob3VsZAo+ICsJICogbm90IGJlIHVzZWQgaW4gc3Vj
aCBjYXNlLiBDaGVjayB0aGF0IGl0IGlzIG5vdCB1c2VkIGluIHN1Y2ggY2FzZSwKPiArCSAqIGFu
ZCB1c2UgdGhpcyBhc3N1bXB0aW9uIGZvciB0cmFjaW5nIGFuZCBhY2NvdW50aW5nIG9mIHJlbW90
ZSBUTEIKPiArCSAqIGZsdXNoZXMuCj4gKwkgKi8KPiArCVZNX1dBUk5fT04oIWNwdW1hc2tfYW55
X2J1dChjcHVtYXNrLCBzbXBfcHJvY2Vzc29yX2lkKCkpKTsKClRoaXMgd2FybmluZyBtaWdodCBm
aXJlIG9mZiBpbmNvcnJlY3RseSBhbmQgd2lsbCBiZSByZW1vdmVkLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
