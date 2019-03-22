From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 0/2] Remove support for deprecated %pf and
 %pF in vsprintf
Date: Fri, 22 Mar 2019 15:53:50 +0200
Message-ID: <20190322135350.2btpno7vspvewxvk__25448.1962345139$1553262901$gmane$org@paasikivi.fi.intel.com>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <CAMuHMdVmqqjVx7As9AAywYxYXG=grijF5rF77OBn6TUjM9+xKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q3IJ=RZ=linux.intel.com=sakari.ailus@srs-us1.protection.inumbo.net>)
 id 1h7KcS-00024B-R2
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 13:54:00 +0000
Content-Disposition: inline
In-Reply-To: <CAMuHMdVmqqjVx7As9AAywYxYXG=grijF5rF77OBn6TUjM9+xKw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Mladek <pmladek@suse.com>, scsi <linux-scsi@vger.kernel.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, linux-pci <linux-pci@vger.kernel.org>, linux-um@lists.infradead.org, Linux PM list <linux-pm@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, xen-devel@lists.xenproject.org, ceph-devel <ceph-devel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux MM <linux-mm@kvack.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, Lars Ellenberg <drbd-dev@lists.linbit.com>
List-Id: xen-devel@lists.xenproject.org

SGkgR2VlcnQsCgpPbiBGcmksIE1hciAyMiwgMjAxOSBhdCAwMjozNzoxOFBNICswMTAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgU2FrYXJpLAo+IAo+IE9uIEZyaSwgTWFyIDIyLCAy
MDE5IGF0IDI6MjUgUE0gU2FrYXJpIEFpbHVzCj4gPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5j
b20+IHdyb3RlOgo+ID4gVGhlIHByaW50ayBmYW1pbHkgb2YgZnVuY3Rpb25zIHN1cHBvcnRzICVw
cyBhbmQgJXBTIGNvbnZlcnNpb24gc3BlY2lmaWVycwo+ID4gdG8gcHJpbnQgZnVuY3Rpb24gbmFt
ZXMuIFlldCB0aGUgZGVwcmVjYXRlZCAlcGYgYW5kICVwRiBjb252ZXJzaW9uCj4gPiBzcGVjaWZp
ZXJzIHdpdGggZXF1aXZhbGVudCBmdW5jdGlvbmFsaXR5IHJlbWFpbiBzdXBwb3J0ZWQuIEEgbnVt
YmVyIG9mCj4gPiB1c2VycyBvZiAlcGYgYW5kICVwRiByZW1haW4uCj4gPgo+ID4gVGhpcyBwYXRj
aHNldHMgY29udmVydHMgdGhlIGV4aXN0aW5nIHVzZXJzIG9mICVwZiBhbmQgJXBGIHRvICVwcyBh
bmQgJXBTLAo+ID4gcmVzcGVjdGl2ZWx5LCBhbmQgcmVtb3ZlcyBzdXBwb3J0IGZvciB0aGUgZGVw
cmVjYXRlZCAlcGYgYW5kICVwRi4KPiA+Cj4gPiBUaGUgcGF0Y2hlcyBhcHBseSBjbGVhbmx5IGJv
dGggb24gNS4xLXJjMSBhcyB3ZWxsIGFzIG9uIExpbnV4LW5leHQuIE5vIG5ldwo+ID4gJXBmIG9y
ICVwRiB1c2VycyBoYXZlIGJlZW4gYWRkZWQgaW4gdGhlIG1lYW50aW1lIHNvIHRoZSBwYXRjaCBp
cwo+ID4gc3VmZmljaWVudCBhcyBpdHNlbGYgb24gbGludXgtbmV4dCwgdG9vLgo+IAo+IERvIHlv
dSBrbm93IGluIHdoaWNoIGNvbW1pdCB0aGV5IGJlY2FtZSBkZXByZWNhdGVkLCBzbyB0aGUgYmFj
a3BvcnRlcnMKPiBrbm93IGhvdyBmYXIgdGhpcyBjYW4gYmUgYmFja3BvcnRlZCBzYWZlbHk/CgpU
aGF0IGFwcGVhcnMgdG8gYmUgMDRiOGViN2E0Y2NkCigic3ltYm9sIGxvb2t1cDogaW50cm9kdWNl
IGRlcmVmZXJlbmNlX3N5bWJvbF9kZXNjcmlwdG9yKCkiKSwgdGhlIHNhbWUKcGF0Y2ggdGhhdCBt
YWRlICVwW2ZGXSBhbmQgJXBbc1NdIGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50LgoKQnV0IG15IHBl
cnNvbmFsIG9waW5pb24gd291bGQgYmUgbm90IHRvIGJhY2twb3J0IHRoZSBwYXRjaCBmb3IgdHdv
IHJlYXNvbnM6CnRoZSBzaGVlciBudW1iZXIgb2YgZmlsZXMgaXQgdG91Y2hlcyAodGhvc2UgZm9y
bWF0IHN0cmluZ3MgY2hhbmdlIGZvcgp2YXJpb3VzIHJlYXNvbnMpIGFuZCB0aGUgbWVhZ2VyIGJl
bmVmaXRzIGl0IGhhcyBvbiBvbGRlciBrZXJuZWxzIGFzIGFueQpiYWNrcG9ydGVkIHBhdGNoIHVz
aW5nICVzIG9yICVTIHN0aWxsIHdvcmtzIGFzIHN1Y2guIFBvcnRpbmcgYSBwYXRjaApmb3J3YXJk
IHNob3VsZCBoYXZlIG5vIGlzc3VlcyBlaXRoZXIgYXMgY2hlY2twYXRjaC5wbCBoYXMgYmVlbiBj
b21wbGFpbmluZwpvZiB0aGUgdXNlIG9mICVwZiBhbmQgJXBGIGZvciBhIHdoaWxlIG5vdy4KCi0t
IApLaW5kIHJlZ2FyZHMsCgpTYWthcmkgQWlsdXMKc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNv
bQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
