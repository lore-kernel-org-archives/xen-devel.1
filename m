From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/4] xen/console: Properly buffer domU
 output when using CONSOLEIO_write
Date: Tue, 9 Apr 2019 11:25:29 +0100
Message-ID: <d870167b-45f4-d87e-43bc-8c91fc7eff1c@arm.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-2-julien.grall@arm.com>
 <20190403114127.GX14641@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDnwc-0002Tj-62
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 10:25:34 +0000
In-Reply-To: <20190403114127.GX14641@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8wNC8yMDE5IDEyOjQxLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFR1ZSwgQXByIDAy
LCAyMDE5IGF0IDA1OjQyOjM1UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVGhlIG91
dHB1dCB3aWxsIGJlIGJ1ZmZlcmVkIGlmIHRoZSBidWZmZXIgcHJvdmlkZWQgYnkgdGhlIERvbVUg
ZG9lcyBub3QKPj4gY29udGFpbiBhIG5ld2xpbmUuIFRoaXMgY2FuIGFsc28gaGFwcGVuIGlmIGJ1
ZmZlciBwcm92aWRlZCBieSBEb21VIGlzCj4+IHNwbGl0IGluIG11bHRpcGxlIHBhcnQgKFhlbiBj
YW4gb25seSBwcm9jZXNzIDEyNyBjaGFyYWN0ZXJzIGF0IHRoZSB0aW1lKS4KPj4KPj4gQXMgWGVu
IHdpbGwgcmVtb3ZlIGFueSBub24tcHJpbnRhYmxlIGNoYXJhY3RlcnMsIHRoZSBvdXRwdXQgYnVm
ZmVyIG1heQo+PiBiZSBzbWFsbGVyIHRoYW4gdGhlIGJ1ZmZlciBwcm92aWRlZC4gSG93ZXZlciwg
WGVuIHdpbGwgYnVmZmVyIHVzaW5nIHRoZQo+PiBvcmlnaW5hbCBsZW5ndGguIFRoaXMgbWVhbnMg
dGhhdCB0aGUgTlVMIGNoYXJhY3RlciBhbmQgZ2FyYmFnZ2Ugd2lsbCBiZQo+PiBjb3BpZWQgaW4g
dGhlIGludGVybmFsIGJ1ZmZlci4KPj4KPj4gT25jZSB0aGUgbmV3bGluZSBpcyBmb3VuZCBvciB0
aGUgaW50ZXJuYWwgYnVmZmVyIGlzIGZ1bGwsIG9ubHkgcGFydCBvZgo+PiB0aGUgaW50ZXJuYWwg
YnVmZmVyIHdpbGwgZW5kIHVwIHRvIGJlIHByaW50ZWQuCj4+Cj4+IEFuIGVhc3kgd2F5IHRvIHJl
cHJvZHVjZSBpdCBpczoKPj4KPj4gSFlQRVJWSVNPUl9jb25zb2xlaW8oQ09OU09MRUlPX3dyaXRl
LCAiXDMzIiwgMSk7Cj4+IEhZUEVSVklTT1JfY29uc29sZWlvKENPTlNPTEVJT193cml0ZSwgImQi
LCAxKTsKPj4gSFlQRVJWSVNPUl9jb25zb2xlaW8oQ09OU09MRUlPX3dyaXRlLCAiXG4iLCAxKTsK
Pj4KPj4gSW4gdGhlIGN1cnJlbnQgY29kZSwgdGhlIGNoYXJhY3RlciAnZCcgd2lsbCBub3QgYmUg
cHJpbnRlZC4KPj4KPj4gVGhpcyBwcm9ibGVtIGNhbiBiZSBzb2x2ZWQgYnkgY29tcHV0aW5nIHRo
ZSBzaXplIG9mIHRoZSBvdXRwdXQgYnVmZmVyCj4+IChpLmUgdGhlIGJ1ZmZlciB3aXRob3V0IHRo
ZSBub24tcHJpbnRhYmxlIGNoYXJhY3RlcnMpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKSSBoYXZlIGNvbW1pdHRlZCB0aGlzIHBhdGNoLiBUaGUgcmVzdCBv
ZiB0aGUgc2VyaWVzIG5lZWQgdG8gYmUgcmVzcGluZWQuCgpDaGVlcnMsCgo+IAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
