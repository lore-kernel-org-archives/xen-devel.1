From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4] x86: use VMLOAD for PV context switch
Date: Wed, 3 Oct 2018 12:25:43 +0100
Message-ID: <20181003112543.tqglb5ljpyrmdn7y@zion.uk.xensource.com>
References: <5BAB385102000078001EBFD9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nzpo=mp=citrix.com=prvs=80755c3b3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g7fHn-0006TS-TG
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 11:25:47 +0000
Content-Disposition: inline
In-Reply-To: <5BAB385102000078001EBFD9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMDE6NDI6MDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSGF2aW5nIG5vdGljZWQgdGhhdCBWTUxPQUQgYWxvbmUgaXMgYWJvdXQgYXMgZmFzdCBh
cyBhIHNpbmdsZSBvZiB0aGUKPiBpbnZvbHZlZCBXUk1TUnMsIEkgdGhvdWdodCBpdCBtaWdodCBi
ZSBhIHJlYXNvbmFibGUgaWRlYSB0byBhbHNvIHVzZSBpdAo+IGZvciBQVi4gTWVhc3VyZW1lbnRz
LCBob3dldmVyLCBoYXZlIHNob3duIHRoYXQgYW4gYWN0dWFsIGltcHJvdmVtZW50IGNhbgo+IGJl
IGFjaGlldmVkIG9ubHkgd2l0aCBhbiBlYXJseSBwcmVmZXRjaCBvZiB0aGUgVk1DQiAodGhhbmtz
IHRvIEFuZHJldwo+IGZvciBzdWdnZXN0aW5nIHRvIHRyeSB0aGlzKSwgd2hpY2ggSSBoYXZlIHRv
IGFkbWl0IEkgY2FuJ3QgcmVhbGx5Cj4gZXhwbGFpbi4gVGhpcyB3YXkgb24gbXkgRmFtMTUgYm94
IGNvbnRleHQgc3dpdGNoIHRha2VzIG92ZXIgMTAwIGNsb2Nrcwo+IGxlc3Mgb24gYXZlcmFnZSAo
dGhlIG1lYXN1cmVkIHZhbHVlcyBhcmUgaGVhdmlseSB2YXJ5aW5nIGluIGFsbCBjYXNlcywKPiB0
aG91Z2gpLgo+IAo+IFRoaXMgaXMgaW50ZW50aW9uYWxseSBub3QgdXNpbmcgYSBuZXcgaHZtX2Z1
bmNzIGhvb2s6IEZvciBvbmUsIHRoaXMgaXMKPiBhbGwgYWJvdXQgUFYsIGFuZCBzb21ldGhpbmcg
c2ltaWxhciBjYW4gaGFyZGx5IGJlIGRvbmUgZm9yIFZNWC4KPiBGdXJ0aGVybW9yZSB0aGUgaW5k
aXJlY3QgdG8gZGlyZWN0IGNhbGwgcGF0Y2hpbmcgdGhhdCBpcyBtZWFudCB0byBiZQo+IGFwcGxp
ZWQgdG8gbW9zdCBodm1fZnVuY3MgaG9va3Mgd291bGQgYmUgdWdseSB0byBtYWtlIHdvcmsgd2l0
aAo+IGZ1bmN0aW9ucyBoYXZpbmcgbW9yZSB0aGFuIDYgcGFyYW1ldGVycy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQWNrZWQtYnk6IEJyaWFu
IFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgo+IFJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zz
a3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
