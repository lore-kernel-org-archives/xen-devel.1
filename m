From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] Remove support for deprecated %pf and
 %pF in vsprintf
Date: Fri, 22 Mar 2019 14:37:18 +0100
Message-ID: <CAMuHMdVmqqjVx7As9AAywYxYXG=grijF5rF77OBn6TUjM9+xKw__38907.6052162395$1553261911$gmane$org@mail.gmail.com>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lKgG=RZ=gmail.com=geert.uytterhoeven@srs-us1.protection.inumbo.net>)
 id 1h7KMX-0000RT-Kf
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 13:37:33 +0000
Received: by mail-ua1-f68.google.com with SMTP id s26so729405uao.9
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2019 06:37:30 -0700 (PDT)
In-Reply-To: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, scsi <linux-scsi@vger.kernel.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, linux-pci <linux-pci@vger.kernel.org>, linux-um@lists.infradead.org, Linux PM list <linux-pm@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, xen-devel@lists.xenproject.org, ceph-devel <ceph-devel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux MM <linux-mm@kvack.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, Lars Ellenberg <drbd-dev@lists.linbit.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU2FrYXJpLAoKT24gRnJpLCBNYXIgMjIsIDIwMTkgYXQgMjoyNSBQTSBTYWthcmkgQWlsdXMK
PHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IFRoZSBwcmludGsgZmFtaWx5
IG9mIGZ1bmN0aW9ucyBzdXBwb3J0cyAlcHMgYW5kICVwUyBjb252ZXJzaW9uIHNwZWNpZmllcnMK
PiB0byBwcmludCBmdW5jdGlvbiBuYW1lcy4gWWV0IHRoZSBkZXByZWNhdGVkICVwZiBhbmQgJXBG
IGNvbnZlcnNpb24KPiBzcGVjaWZpZXJzIHdpdGggZXF1aXZhbGVudCBmdW5jdGlvbmFsaXR5IHJl
bWFpbiBzdXBwb3J0ZWQuIEEgbnVtYmVyIG9mCj4gdXNlcnMgb2YgJXBmIGFuZCAlcEYgcmVtYWlu
Lgo+Cj4gVGhpcyBwYXRjaHNldHMgY29udmVydHMgdGhlIGV4aXN0aW5nIHVzZXJzIG9mICVwZiBh
bmQgJXBGIHRvICVwcyBhbmQgJXBTLAo+IHJlc3BlY3RpdmVseSwgYW5kIHJlbW92ZXMgc3VwcG9y
dCBmb3IgdGhlIGRlcHJlY2F0ZWQgJXBmIGFuZCAlcEYuCj4KPiBUaGUgcGF0Y2hlcyBhcHBseSBj
bGVhbmx5IGJvdGggb24gNS4xLXJjMSBhcyB3ZWxsIGFzIG9uIExpbnV4LW5leHQuIE5vIG5ldwo+
ICVwZiBvciAlcEYgdXNlcnMgaGF2ZSBiZWVuIGFkZGVkIGluIHRoZSBtZWFudGltZSBzbyB0aGUg
cGF0Y2ggaXMKPiBzdWZmaWNpZW50IGFzIGl0c2VsZiBvbiBsaW51eC1uZXh0LCB0b28uCgpEbyB5
b3Uga25vdyBpbiB3aGljaCBjb21taXQgdGhleSBiZWNhbWUgZGVwcmVjYXRlZCwgc28gdGhlIGJh
Y2twb3J0ZXJzCmtub3cgaG93IGZhciB0aGlzIGNhbiBiZSBiYWNrcG9ydGVkIHNhZmVseT8KClRo
YW5rcyEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Ci0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
