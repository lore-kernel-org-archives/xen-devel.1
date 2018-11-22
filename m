From: Zhao Yan <yan.y.zhao@intel.com>
Subject: Re: [Qemu-devel] [PATCH] Xen PCI passthrough: fix
 passthrough failure when irq map failure
Date: Thu, 22 Nov 2018 07:58:16 -0500
Message-ID: <20181122125816.GA31800@joy-OptiPlex-7040>
References: <20181016021439.6212-1-yan.y.zhao@intel.com>
 <F22B14EC3CFBB843AD3E03B6B78F2C6A4ACFD80C@SHSMSX104.ccr.corp.intel.com>
 <20181018145636.k6ptvn4iszabjhxw@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CTtn=OB=intel.com=yan.y.zhao@srs-us1.protection.inumbo.net>)
 id 1gPocy-0005FO-9e
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 13:02:40 +0000
Content-Disposition: inline
In-Reply-To: <20181018145636.k6ptvn4iszabjhxw@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org, qemu-devel@nognu.org, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMTgsIDIwMTggYXQgMDM6NTY6MzZQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIE9jdCAxOCwgMjAxOCBhdCAwODoyMjo0MUFNICswMDAwLCBaaGFv
LCBZYW4gWSB3cm90ZToKPiA+IEhpCj4gPiBUaGUgYmFja2dyb3VuZCBmb3IgdGhpcyBwYXRjaCBp
cyB0aGF0OiBmb3Igc29tZSBwY2kgZGV2aWNlLCBldmVuIGl0J3MgUENJX0lOVEVSUlVQVF9QSU4g
aXMgbm90IDAsIGl0IGFjdHVhbGx5IGRvZXMgbm90IHN1cHBvcnQgSU5UeCBtb2RlLCBzbyB3ZSBz
aG91bGQganVzdCByZXBvcnQgZXJyb3IsIGRpc2FibGUgSU5UeCBtb2RlIGFuZCBjb250aW51ZSB0
aGUgcGFzc3Rocm91Z2guCj4gPiBIb3dldmVyLCB0aGUgY29tbWl0IDVhMTFkMGY3IHJlZ2FyZHMg
dGhpcyBhcyBlcnJvciBjb25kaXRpb24gYW5kIGxldCBxZW11IHF1aXQgcGFzc3Rocm91Z2gsIHdo
aWNoIGlzIHRvbyByaWdvcm91cy4KPiA+IAo+ID4gRXJyb3IgbWVzc2FnZSBpcyBiZWxvdzoKPiA+
IGxpYnhsOiBlcnJvcjogbGlieGxfcW1wLmM6Mjg3OnFtcF9oYW5kbGVfZXJyb3JfcmVzcG9uc2U6
IERvbWFpbiAyOnJlY2VpdmVkIGFuIGVycm9yIG1lc3NhZ2UgZnJvbSBRTVAgc2VydmVyOiBNYXBw
aW5nIG1hY2hpbmUgaXJxIDAgdG8gcGlycSAtMSBmYWlsZWQ6IE9wZXJhdGlvbiBub3QgcGVybWl0
dGVkCj4gCj4gSSdtIGhhdmluZyBpc3N1ZXMgZmlndXJpbmcgb3V0IHdoYXQncyBoYXBwZW5pbmcg
aGVyZS4KPiBzLT5yZWFsX2RldmljZS5pcnEgaXMgMCwgeWV0IHRoZSBQQ0kgY29uZmlnIHNwYWNl
IHJlYWQgb2YKPiBQQ0lfSU5URVJSVVBUX1BJTiByZXR1cm5zIHNvbWV0aGluZyBkaWZmZXJlbnQg
dGhhbiAwLgo+IAo+IEFGQUlDVCB0aGlzIGlzIGR1ZSB0byBzb21lIGtpbmQgb2YgZXJyb3IgaW4g
TGludXgsIHNvIHRoYXQgZXZlbiB3aGVuCj4gdGhlIGRldmljZSBpcyBzdXBwb3NlZCB0byBoYXZl
IGEgdmFsaWQgSVJRIHRoZSBzeXNmcyBub2RlIGl0IGlzIHNldCB0bwo+IDAsIGRvIHlvdSBrbm93
IHRoZSBhY3R1YWwgdW5kZXJseWluZyBjYXVzZSBvZiB0aGlzPwo+IAo+IFRoYW5rcywgUm9nZXIu
CkhpIFJvZ2VyClNvcnJ5IGZvciB0aGUgbGF0ZXIgcmVwbHksIEkganVzdCBtaXNzZWQgdGhpcyBt
YWlsLi4uCm9uIG15IHNpZGUsIGl0J3MgYmVjYXVzZSB0aGUgaGFyZHdhcmUgYWN0dWFsbHkgZG9l
cyBub3Qgc3VwcG9ydCBJTlR4IG1vZGUsCmJ1dCBpdHMgY29uZmlndXJhdGlvbiBzcGFjZSBkb2Vz
IG5vdCByZXBvcnQgUENJX0lOVEVSUlVQVF9QSU4gdG8gMC4gSXQncyBhCmhhcmR3YXJlIGJ1Zywg
YnV0IHByZXZpb3VzIHZlcnNpb24gb2YgcWVtdSBjYW4gdG9sZXJhdGUgaXQsIHN3aXRjaCB0byBN
U0kKYW5kIG1ha2UgcGFzc3Rocm91Z2ggd29yay4KClRoYW5rcwpZYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
