From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 0/2] Remove support for deprecated %pf and
 %pF in vsprintf
Date: Sun, 24 Mar 2019 23:10:08 +0200
Message-ID: <20190324211008.lypghym3gqcp62th__9878.64610958553$1553461898$gmane$org@mara.localdomain>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <CAMuHMdVmqqjVx7As9AAywYxYXG=grijF5rF77OBn6TUjM9+xKw@mail.gmail.com>
 <20190322135350.2btpno7vspvewxvk@paasikivi.fi.intel.com>
 <20190322170550.GX9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TZyq=R3=linux.intel.com=sakari.ailus@srs-us1.protection.inumbo.net>)
 id 1h8ANr-00008X-GK
 for xen-devel@lists.xenproject.org; Sun, 24 Mar 2019 21:10:23 +0000
Content-Disposition: inline
In-Reply-To: <20190322170550.GX9224@smile.fi.intel.com>
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

SGkgQW5keSwKCk9uIEZyaSwgTWFyIDIyLCAyMDE5IGF0IDA3OjA1OjUwUE0gKzAyMDAsIEFuZHkg
U2hldmNoZW5rbyB3cm90ZToKPiBPbiBGcmksIE1hciAyMiwgMjAxOSBhdCAwMzo1Mzo1MFBNICsw
MjAwLCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4gCj4gPiBQb3J0aW5nIGEgcGF0Y2gKPiA+IGZvcndh
cmQgc2hvdWxkIGhhdmUgbm8gaXNzdWVzIGVpdGhlciBhcyBjaGVja3BhdGNoLnBsIGhhcyBiZWVu
IGNvbXBsYWluaW5nCj4gPiBvZiB0aGUgdXNlIG9mICVwZiBhbmQgJXBGIGZvciBhIHdoaWxlIG5v
dy4KPiAKPiBBbmQgdGhhdCdzIGV4YWN0bHkgdGhlIHJlYXNvbiB3aHkgSSB0aGluayBpbnN0ZWFk
IG9mIHJlbW92aW5nIHdhcm5pbmcgb24KPiBjaGVja3BhdGNoLCBpdCBtYWtlcyBzZW5zZSB0byBj
b252ZXJ0IHRvIGFuIGVycm9yIGZvciBhIHdoaWxlLiBQZW9wbGUgYXJlCj4gdGVuZGluZyByZWFk
IGRvY3VtZW50YXRpb24gb24gaW50ZXJuZXQgYW5kIHRodXMgbWlnaHQgaGF2ZSBvdXRkYXRlZCBv
bmUuIEFuZAo+IHllcywgdGhlIGNvbXBpbGVyIGRvZXNuJ3QgdGVsbCBhIHRoaW5nIGFib3V0IGl0
Lgo+IAo+IFAuUy4gVGhvdWdoLCBpZiBtYWpvcml0eSBvZiBwZW9wbGUgd2lsbCB0ZWxsIHRoYXQg
SSdtIHdyb25nLCB0aGVuIGl0J3Mgb2theSB0bwo+IHJlbW92ZS4KCkkgd29uZGVyIGlmIHlvdSB3
cm90ZSB0aGlzIGJlZm9yZSBzZWVpbmcgbXkgb3RoZXIgcGF0Y2hzZXQuCgpGb3Igb3RoZXJzIGFz
IHRoZSBiYWNrZ3JvdW5kLCBpdCBhZGRzICVwZncgdG8gcHJpbnQgZndub2RlIG5vZGUgbmFtZXMu
CkFzc3VtaW5nIHRoaXMgd291bGQgYmUgbWVyZ2VkLCAlcGZ3IGNvdWxkIGJlIGluIHVzZSByZWxh
dGl2ZWx5IHNvb24uIFdpdGgKdGhlIGN1cnJlbnQgcGF0Y2hzZXQsICVwZiBwcmludHMgbm90aGlu
ZyBqdXN0IGFzICVwTyAoIkYiIG1pc3NpbmcpLgoKV2hhdCBJIHRoaW5rIGNvdWxkIGJlIGRvbmUg
aXMgdG8gd2FybiBvZiBwbGFpbiAlcGYgKHdpdGhvdXQgZm9sbG93aW5nICJ3IikKaW4gY2hlY2tw
YXRjaC5wbCwgYW5kICVwZiB0aGF0IGlzIG5vdCBmb2xsb3dlZCBieSAidyIgaW4gdGhlIGtlcm5l
bC4KQWx0aG91Z2ggd2UgZGlkbid0IGhhdmUgc3VjaCBjaGVja3MgdG8gYmVnaW4gd2l0aC4gVGhl
IGNhc2UgaXMgc3RpbGwgYQpsaXR0bGUgYml0IGRpZmZlcmVudCBhcyAlcGYgdXNlZCB0byBiZSBh
IHZhbGlkIGNvbnZlcnNpb24gc3BlY2lmaWVyIHdoZXJlYXMKJXBPIGxpa2VseSBoYXMgbmV2ZXIg
ZXhpc3RlZC4KClNvLCBob3cgYWJvdXQgYWRkaW5nIHN1Y2ggY2hlY2tzIGluIHRoZSBvdGhlciBz
ZXQ/IEkgY2FuIHJldGFpbiAlcFtmRl0gY2hlY2sKaGVyZSwgdG9vLCBpZiB5b3UgbGlrZS4KCi0t
IApLaW5kIHJlZ2FyZHMsCgpTYWthcmkgQWlsdXMKc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNv
bQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
