From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] Remove support for deprecated %pf and
 %pF in vsprintf
Date: Mon, 25 Mar 2019 17:24:09 +0200
Message-ID: <20190325152409.GF9224__15.7058284216305$1553527522$gmane$org@smile.fi.intel.com>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <CAMuHMdVmqqjVx7As9AAywYxYXG=grijF5rF77OBn6TUjM9+xKw@mail.gmail.com>
 <20190322135350.2btpno7vspvewxvk@paasikivi.fi.intel.com>
 <20190322170550.GX9224@smile.fi.intel.com>
 <20190324211008.lypghym3gqcp62th@mara.localdomain>
 <20190324211932.GK9224@smile.fi.intel.com>
 <20190325151259.2w22y4ijqilrbaxj@kekkonen.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvOj=R4=linux.intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1h8RSV-0006NR-UI
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 15:24:19 +0000
Content-Disposition: inline
In-Reply-To: <20190325151259.2w22y4ijqilrbaxj@kekkonen.localdomain>
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

T24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgMDU6MTM6MDBQTSArMDIwMCwgU2FrYXJpIEFpbHVzIHdy
b3RlOgoKPiBBbGwgb3RoZXIgaW52YWxpZCBwb2ludGVyIGNvbnZlcnNpb24gc3BlY2lmaWVycyBj
dXJyZW50bHkgcmVzdWx0IGludG8gYQo+IHdhcm5pbmcgb25seS4gSSBzZWUgdGhhdCBhcyBhbiBv
cnRob2dvbmFsIGNoYW5nZSB0byB0aGlzIHNldC4gSSBmb3VuZAo+IGFub3RoZXIgaXNzdWUgaW4g
Y2hlY2twYXRjaC5wbCB0aGF0IG1heSByZXF1aXJlIHNvbWUgZGlzY3Vzc2lvbjsgd291bGQgeW91
Cj4gYmUgb2sgd2l0aCBhZGRyZXNzaW5nIHRoaXMgaW4gYW5vdGhlciBzZXQ/CgpJZiBpdCBsb29r
cyBiZXR0ZXIgdGhhdCB3YXksIEkgaGF2ZSBubyBvYmplY3Rpb24uCgotLSAKV2l0aCBCZXN0IFJl
Z2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
