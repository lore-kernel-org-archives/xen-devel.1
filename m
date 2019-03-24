From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] Remove support for deprecated %pf and
 %pF in vsprintf
Date: Sun, 24 Mar 2019 23:19:32 +0200
Message-ID: <20190324211932.GK9224__37050.0555074372$1553462441$gmane$org@smile.fi.intel.com>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <CAMuHMdVmqqjVx7As9AAywYxYXG=grijF5rF77OBn6TUjM9+xKw@mail.gmail.com>
 <20190322135350.2btpno7vspvewxvk@paasikivi.fi.intel.com>
 <20190322170550.GX9224@smile.fi.intel.com>
 <20190324211008.lypghym3gqcp62th@mara.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Htx=R3=linux.intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1h8AWt-0000QG-1S
 for xen-devel@lists.xenproject.org; Sun, 24 Mar 2019 21:19:43 +0000
Content-Disposition: inline
In-Reply-To: <20190324211008.lypghym3gqcp62th@mara.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, scsi <linux-scsi@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, linux-um@lists.infradead.org, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, Linux MMC List <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, xen-devel@lists.xenproject.org, ceph-devel <ceph-devel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, Lars Ellenberg <drbd-dev@lists.linbit.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBNYXIgMjQsIDIwMTkgYXQgMTE6MTA6MDhQTSArMDIwMCwgU2FrYXJpIEFpbHVzIHdy
b3RlOgo+IE9uIEZyaSwgTWFyIDIyLCAyMDE5IGF0IDA3OjA1OjUwUE0gKzAyMDAsIEFuZHkgU2hl
dmNoZW5rbyB3cm90ZToKPiA+IE9uIEZyaSwgTWFyIDIyLCAyMDE5IGF0IDAzOjUzOjUwUE0gKzAy
MDAsIFNha2FyaSBBaWx1cyB3cm90ZToKPiA+IAo+ID4gPiBQb3J0aW5nIGEgcGF0Y2gKPiA+ID4g
Zm9yd2FyZCBzaG91bGQgaGF2ZSBubyBpc3N1ZXMgZWl0aGVyIGFzIGNoZWNrcGF0Y2gucGwgaGFz
IGJlZW4gY29tcGxhaW5pbmcKPiA+ID4gb2YgdGhlIHVzZSBvZiAlcGYgYW5kICVwRiBmb3IgYSB3
aGlsZSBub3cuCj4gPiAKPiA+IEFuZCB0aGF0J3MgZXhhY3RseSB0aGUgcmVhc29uIHdoeSBJIHRo
aW5rIGluc3RlYWQgb2YgcmVtb3Zpbmcgd2FybmluZyBvbgo+ID4gY2hlY2twYXRjaCwgaXQgbWFr
ZXMgc2Vuc2UgdG8gY29udmVydCB0byBhbiBlcnJvciBmb3IgYSB3aGlsZS4gUGVvcGxlIGFyZQo+
ID4gdGVuZGluZyByZWFkIGRvY3VtZW50YXRpb24gb24gaW50ZXJuZXQgYW5kIHRodXMgbWlnaHQg
aGF2ZSBvdXRkYXRlZCBvbmUuIEFuZAo+ID4geWVzLCB0aGUgY29tcGlsZXIgZG9lc24ndCB0ZWxs
IGEgdGhpbmcgYWJvdXQgaXQuCj4gPiAKPiA+IFAuUy4gVGhvdWdoLCBpZiBtYWpvcml0eSBvZiBw
ZW9wbGUgd2lsbCB0ZWxsIHRoYXQgSSdtIHdyb25nLCB0aGVuIGl0J3Mgb2theSB0bwo+ID4gcmVt
b3ZlLgo+IAo+IEkgd29uZGVyIGlmIHlvdSB3cm90ZSB0aGlzIGJlZm9yZSBzZWVpbmcgbXkgb3Ro
ZXIgcGF0Y2hzZXQuCgpZZXMsIEkgd3JvdGUgaXQgYmVmb3JlIHNlZWluZyBhbm90aGVyIHNlcmll
cy4KCj4gV2hhdCBJIHRoaW5rIGNvdWxkIGJlIGRvbmUgaXMgdG8gd2FybiBvZiBwbGFpbiAlcGYg
KHdpdGhvdXQgZm9sbG93aW5nICJ3IikKPiBpbiBjaGVja3BhdGNoLnBsLCBhbmQgJXBmIHRoYXQg
aXMgbm90IGZvbGxvd2VkIGJ5ICJ3IiBpbiB0aGUga2VybmVsLgo+IEFsdGhvdWdoIHdlIGRpZG4n
dCBoYXZlIHN1Y2ggY2hlY2tzIHRvIGJlZ2luIHdpdGguIFRoZSBjYXNlIGlzIHN0aWxsIGEKPiBs
aXR0bGUgYml0IGRpZmZlcmVudCBhcyAlcGYgdXNlZCB0byBiZSBhIHZhbGlkIGNvbnZlcnNpb24g
c3BlY2lmaWVyIHdoZXJlYXMKPiAlcE8gbGlrZWx5IGhhcyBuZXZlciBleGlzdGVkLgo+IAo+IFNv
LCBob3cgYWJvdXQgYWRkaW5nIHN1Y2ggY2hlY2tzIGluIHRoZSBvdGhlciBzZXQ/IEkgY2FuIHJl
dGFpbiAlcFtmRl0gY2hlY2sKPiBoZXJlLCB0b28sIGlmIHlvdSBsaWtlLgoKQ29uc2lzdGVuY3kg
dGVsbHMgbWUgdGhhdCB0aGUgd2FybmluZy0+ZXJyb3IgdHJhbnNmb3JtYXRpb24gaW4gY2hlY2tw
YXRjaC5wbApiZWxvbmdzIHRoaXMgc2VyaWVzLgoKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5k
eSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
