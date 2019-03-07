From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v11 5/9] xen/x86: use DECLARE_BOUNDS as
 required
Date: Thu, 7 Mar 2019 14:00:03 +0000
Message-ID: <23681.9187.820867.509999@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-5-git-send-email-sstabellini@kernel.org>
 <5C7FEBBC020000780021C308@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1903061318160.17248@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=21/k=RK=citrix.com=prvs=9622e5608=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1h1tZG-0000X4-54
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 14:00:14 +0000
In-Reply-To: <alpine.DEB.2.10.1903061318160.17248@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjExIDUvOV0geGVuL3g4Njog
dXNlIERFQ0xBUkVfQk9VTkRTIGFzIHJlcXVpcmVkIik6Cj4gVGhpcyBpcyBwcm9ibGVtYXRpYy4g
V2UgaGF2ZSBhbHNvIHRoZSBmb2xsb3dpbmcgaW5zdGFuY2VzIGluIHRoaXMgc2VyaWVzCj4gdG8g
ZGVhbCB3aXRoOgo+IAo+IHhlbi9hcmNoL2FybS9wZXJjcHUuYzpfZnJlZV9wZXJjcHVfYXJlYQo+
ICAgY2hhciAqcCA9IChjaGFyICopX19wZXJfY3B1X3N0YXJ0ICsgX19wZXJfY3B1X29mZnNldFtj
cHVdOwo+IAo+IHhlbi9hcmNoL3g4Ni9wZXJjcHUuYzpfZnJlZV9wZXJjcHVfYXJlYQo+ICAgY2hh
ciAqcCA9IChjaGFyICopX19wZXJfY3B1X3N0YXJ0ICsgX19wZXJfY3B1X29mZnNldFtjcHVdOwo+
IAo+IHhlbi9hcmNoL3g4Ni9zZXR1cC5jOmluaXRfZG9uZQo+ICAgZm9yICggdmEgPSAoY2hhciAq
KV9faW5pdF9iZWdpbjsgaW5pdF9sdCh2YSwgX19pbml0X2VuZCk7IHZhICs9IFBBR0VfU0laRSAp
Cj4gCj4geGVuL2FyY2gveDg2L2FsdGVybmF0aXZlLmM6YXBwbHlfYWx0ZXJuYXRpdmVzCj4gICBm
b3IgKCBhID0gYmFzZSA9IChzdHJ1Y3QgYWx0X2luc3RyICopc3RhcnQ7IGFsdF9pbnN0cl9sdChh
LCBlbmQpOyBhKysgKQoKUHJlc3VtYWJseSB5b3Ugd2lsbCBiZSB3cml0aW5nIHNvbWUgZXhwbGFu
YXRpb24gYXMgdG8gd2h5IGVhY2ggb2YKdGhlc2UgaXMgT0sgPwoKPiBJbiBhbGwgdGhlc2UgY2Fz
ZXMgd2UgYWN0dWFsbHkgZW5kIHVwIG1vZGlmeWluZyB0aGUgb2JqZWN0LiBJIHN1Z2dlc3QKPiB3
ZSByZW1vdmUgdGhlIGNvbnN0IGZyb20gZWl0aGVyIF9fREVDTEFSRV9CT1VORFMgKHNvIGZyb20g
ZXZlcnl3aGVyZSksCj4gb3IganVzdCBmb3IgcGVyX2NwdSwgaW5pdCwgYW5kIGFsdF9pbnN0ciBi
eSBpbnRyb2R1Y2luZyBhbm90aGVyIE1BQ1JPLgoKTXkgcGVyc29uYWwgb3BpbmlvbiBpcyB0aGF0
IHlvdSBzaG91bGQ6CgogKiBJbnRyb2R1Y2UgYSBuZXcgbWFjcm8gREVDTEFSRV9CT1VORFNfTk9O
Q09OU1QuCiAqIFdyaXRlIGEgY2xlYXIgZXhwbGFuYXRpb24gb2Ygd2hlbiBERUNMQVJFX0JPVU5E
U19OT05DT05TVCBpcwogICBwZXJtaXR0ZWQgYW5kIHdoZW4gREVDTEFSRV9CT1VORFMgbXVzdCBi
ZSB1c2VkLgogKiBJbXBsZW1lbnQgYm90aCBtYWNyb3MgaW4gdGVybXMgb2YgYSBjb21tb24gaW50
ZXJuYWwgbWFjcm8KICAgd2hpY2ggdGFrZXMgYW4gYXJndW1lbnQgQ09OU1Qgd2hpY2ggaXMgZW1w
dHkgb3IgYGNvbnN0Jy4KCklhbi4KClBTIGluIHByb3NlLCBgbWFjcm8nIGlzIHdyaXR0ZW4gdGh1
cywgbm90IGluIGFsbCBjYXBzLiAgSXQgaXMgbm90IGFuCmFjcm95bm9tOyB0aGUgZXR5bW9sb2d5
IGlzIGZyb20gYW5jaWVudCBHcmVlay4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
