From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 0/2] Remove support for deprecated %pf and
 %pF in vsprintf
Date: Mon, 25 Mar 2019 17:13:00 +0200
Message-ID: <20190325151259.2w22y4ijqilrbaxj__45937.1352380671$1553526857$gmane$org@kekkonen.localdomain>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <CAMuHMdVmqqjVx7As9AAywYxYXG=grijF5rF77OBn6TUjM9+xKw@mail.gmail.com>
 <20190322135350.2btpno7vspvewxvk@paasikivi.fi.intel.com>
 <20190322170550.GX9224@smile.fi.intel.com>
 <20190324211008.lypghym3gqcp62th@mara.localdomain>
 <20190324211932.GK9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yTWB=R4=linux.intel.com=sakari.ailus@srs-us1.protection.inumbo.net>)
 id 1h8RHl-0005Tn-TQ
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 15:13:13 +0000
Content-Disposition: inline
In-Reply-To: <20190324211932.GK9224@smile.fi.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, scsi <linux-scsi@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, linux-um@lists.infradead.org, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, Linux MMC List <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, xen-devel@lists.xenproject.org, ceph-devel <ceph-devel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, Lars Ellenberg <drbd-dev@lists.linbit.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5keSwKCk9uIFN1biwgTWFyIDI0LCAyMDE5IGF0IDExOjE5OjMyUE0gKzAyMDAsIEFuZHkg
U2hldmNoZW5rbyB3cm90ZToKPiBPbiBTdW4sIE1hciAyNCwgMjAxOSBhdCAxMToxMDowOFBNICsw
MjAwLCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4gPiBPbiBGcmksIE1hciAyMiwgMjAxOSBhdCAwNzow
NTo1MFBNICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiA+IE9uIEZyaSwgTWFyIDIy
LCAyMDE5IGF0IDAzOjUzOjUwUE0gKzAyMDAsIFNha2FyaSBBaWx1cyB3cm90ZToKPiA+ID4gCj4g
PiA+ID4gUG9ydGluZyBhIHBhdGNoCj4gPiA+ID4gZm9yd2FyZCBzaG91bGQgaGF2ZSBubyBpc3N1
ZXMgZWl0aGVyIGFzIGNoZWNrcGF0Y2gucGwgaGFzIGJlZW4gY29tcGxhaW5pbmcKPiA+ID4gPiBv
ZiB0aGUgdXNlIG9mICVwZiBhbmQgJXBGIGZvciBhIHdoaWxlIG5vdy4KPiA+ID4gCj4gPiA+IEFu
ZCB0aGF0J3MgZXhhY3RseSB0aGUgcmVhc29uIHdoeSBJIHRoaW5rIGluc3RlYWQgb2YgcmVtb3Zp
bmcgd2FybmluZyBvbgo+ID4gPiBjaGVja3BhdGNoLCBpdCBtYWtlcyBzZW5zZSB0byBjb252ZXJ0
IHRvIGFuIGVycm9yIGZvciBhIHdoaWxlLiBQZW9wbGUgYXJlCj4gPiA+IHRlbmRpbmcgcmVhZCBk
b2N1bWVudGF0aW9uIG9uIGludGVybmV0IGFuZCB0aHVzIG1pZ2h0IGhhdmUgb3V0ZGF0ZWQgb25l
LiBBbmQKPiA+ID4geWVzLCB0aGUgY29tcGlsZXIgZG9lc24ndCB0ZWxsIGEgdGhpbmcgYWJvdXQg
aXQuCj4gPiA+IAo+ID4gPiBQLlMuIFRob3VnaCwgaWYgbWFqb3JpdHkgb2YgcGVvcGxlIHdpbGwg
dGVsbCB0aGF0IEknbSB3cm9uZywgdGhlbiBpdCdzIG9rYXkgdG8KPiA+ID4gcmVtb3ZlLgo+ID4g
Cj4gPiBJIHdvbmRlciBpZiB5b3Ugd3JvdGUgdGhpcyBiZWZvcmUgc2VlaW5nIG15IG90aGVyIHBh
dGNoc2V0Lgo+IAo+IFllcywgSSB3cm90ZSBpdCBiZWZvcmUgc2VlaW5nIGFub3RoZXIgc2VyaWVz
Lgo+IAo+ID4gV2hhdCBJIHRoaW5rIGNvdWxkIGJlIGRvbmUgaXMgdG8gd2FybiBvZiBwbGFpbiAl
cGYgKHdpdGhvdXQgZm9sbG93aW5nICJ3IikKPiA+IGluIGNoZWNrcGF0Y2gucGwsIGFuZCAlcGYg
dGhhdCBpcyBub3QgZm9sbG93ZWQgYnkgInciIGluIHRoZSBrZXJuZWwuCj4gPiBBbHRob3VnaCB3
ZSBkaWRuJ3QgaGF2ZSBzdWNoIGNoZWNrcyB0byBiZWdpbiB3aXRoLiBUaGUgY2FzZSBpcyBzdGls
bCBhCj4gPiBsaXR0bGUgYml0IGRpZmZlcmVudCBhcyAlcGYgdXNlZCB0byBiZSBhIHZhbGlkIGNv
bnZlcnNpb24gc3BlY2lmaWVyIHdoZXJlYXMKPiA+ICVwTyBsaWtlbHkgaGFzIG5ldmVyIGV4aXN0
ZWQuCj4gPiAKPiA+IFNvLCBob3cgYWJvdXQgYWRkaW5nIHN1Y2ggY2hlY2tzIGluIHRoZSBvdGhl
ciBzZXQ/IEkgY2FuIHJldGFpbiAlcFtmRl0gY2hlY2sKPiA+IGhlcmUsIHRvbywgaWYgeW91IGxp
a2UuCj4gCj4gQ29uc2lzdGVuY3kgdGVsbHMgbWUgdGhhdCB0aGUgd2FybmluZy0+ZXJyb3IgdHJh
bnNmb3JtYXRpb24gaW4gY2hlY2twYXRjaC5wbAo+IGJlbG9uZ3MgdGhpcyBzZXJpZXMuCgpBbGwg
b3RoZXIgaW52YWxpZCBwb2ludGVyIGNvbnZlcnNpb24gc3BlY2lmaWVycyBjdXJyZW50bHkgcmVz
dWx0IGludG8gYQp3YXJuaW5nIG9ubHkuIEkgc2VlIHRoYXQgYXMgYW4gb3J0aG9nb25hbCBjaGFu
Z2UgdG8gdGhpcyBzZXQuIEkgZm91bmQKYW5vdGhlciBpc3N1ZSBpbiBjaGVja3BhdGNoLnBsIHRo
YXQgbWF5IHJlcXVpcmUgc29tZSBkaXNjdXNzaW9uOyB3b3VsZCB5b3UKYmUgb2sgd2l0aCBhZGRy
ZXNzaW5nIHRoaXMgaW4gYW5vdGhlciBzZXQ/CgotLSAKUmVnYXJkcywKClNha2FyaSBBaWx1cwpz
YWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
