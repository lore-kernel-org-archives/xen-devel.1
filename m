From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 1/1] tools/ocaml: Re-introduce
 Xenctrl.with_intf wrapper [and 1 more messages]
Date: Wed, 31 Oct 2018 16:01:37 +0000
Message-ID: <23513.53729.580528.953887@mariner.uk.xensource.com>
References: <26EDCEB0-FF2A-42A2-B538-56B8C0124A10@citrix.com>
 <20181031113323.22379-1-christian.lindig@citrix.com>
 <20181031113323.22379-2-christian.lindig@citrix.com>
 <23513.52493.74145.264702@mariner.uk.xensource.com>
 <1e22ad14-3d54-33b5-399b-6a23e7dc5704@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i5ur=nl=citrix.com=prvs=835789c87=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gHswA-0000iK-Cl
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 16:01:42 +0000
In-Reply-To: <1e22ad14-3d54-33b5-399b-6a23e7dc5704@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

Q2hyaXN0aWFuIExpbmRpZyB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDEvMV0gdG9vbHMvb2NhbWw6
IFJlLWludHJvZHVjZSBYZW5jdHJsLndpdGhfaW50ZiB3cmFwcGVyIFthbmQgMSBtb3JlIG1lc3Nh
Z2VzXSIpOgo+IE9uIDMxLzEwLzE4IDE1OjQxLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IHRoaXMg
bmVlZHMgYSBzdHJvbmdlciB3YXJuaW5nIGFnYWluc3QgYW55b25lIGV2ZXIgY2FsbGluZyBpdCwg
b3IgYQo+ID4gY2xlYXJlciBleHBsYW5hdGlvbiBvZiB0aGUgY29uc3F1ZW5jZXMgKHdob3NlIHNj
b3BlIGlzIHZlcnkgYnJvYWQpLgo+IAo+IFRoZSBjb25zZXF1ZW5jZSBpcyB0aGF0IHRoZSBnbG9i
YWwgaGFuZGxlIGlzIGNsb3NlZCBidXQgaXQgd291bGQgYmUgCj4gb3BlbmVkIGFnYWluIGlmCj4g
b25lIGNhbGxlZCB3aXRoX2ludGYgYWdhaW4uIFNvIEknbSBub3Qgc3VyZSB0aGF0IHRoaXMgd291
bGQgYmUgCj4gZGFuZ2Vyb3VzLiBNYXliZSBhIHdhcm5pbmcKPiB0aGF0IGlzIHNob3VsZCBiZSBp
ZiBhdCBhbGwgY2FsbGVkIGJlZm9yZSBwcm9jZXNzIHRlcm1pbmF0aW9uPyBJJ20gaGFweSAKPiB0
byBtYWtlIHN1Y2ggYSBjaGFuZ2UuCgogd2l0aF9pbnRmCiAgICBkbyBzb21lIHN0dWZmIHdpdGgg
Z2V0X2hhbmRsZSAoMSkKICAgIHNwb25nCiAgICBkbyBzb21lIHN0dWZmIHdpdGggZ2V0X2hhbmRs
ZSAoMikKCiBsZXQgc3BvbmcgPSB3aXRoX2ludGYKICAgIGRvIHNvbWUgc3R1ZmYgd2l0aCBoYW5k
bGUKICAgIGNsb3NlX2hhbmRsZQoKKGZvcmdpdmUgbXkgc3ludGF4IGJ1dCBJIGhvcGUgeW91IGdl
dCB0aGUgaWRlYSkuICBUaGlzIHdpbGwgY3Jhc2ggaW4KKDIpJ3MgY2FsbCB0byBnZXRfaGFuZGxl
LgoKSU1PIHRoZSBidWcgaXMgdGhhdCBzcG9uZyBjYWxscyBjbG9zZV9oYW5kbGUgd2hpY2ggaGFz
IGEgZGlzdGFudApkZXN0cnVjdGl2ZSBhY3Rpb24sIHdpdGhvdXQgYmVpbmcgYWJsZSB0byBrbm93
IHRoYXQgaXQgaXMgc2FmZSB0byBkbwpzby4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
