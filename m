From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Notes for upcoming PCI emulation call
Date: Wed, 2 May 2018 12:20:32 +0100
Message-ID: <20180502112032.b7oo4qq4ayrb3elo@MacBook-Pro-de-Roger.local>
References: <C0735441-A835-4558-B69D-83EEE17F21E7@citrix.com>
 <20180502200352.0000060d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jfic=hv=citrix.com=prvs=65356f562=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fDpoU-0007tE-Lt
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 11:20:46 +0000
Content-Disposition: inline
In-Reply-To: <20180502200352.0000060d@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Daniel Smith <dpsmith@apertussolutions.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <Paul.Durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMDIsIDIwMTggYXQgMDg6MDM6NTJQTSArMTAwMCwgQWxleGV5IEcgd3JvdGU6
Cj4gLSBFbXVsYXRpbmcgKGEgc2ltcGxlc3QpIHVwc3RyZWFtIFBDSWUgaGllcmFyY2h5IGZvciBw
YXNzZWQgdGhyb3VnaCBQQ0llCj4gZGV2aWNlcy4gVGhlIGlzc3VlIHdhcyBkZXNjcmliZWQgaW4g
ZGV0YWlscyBoZXJlOgo+IGh0dHA6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRl
dmVsLzIwMTgtMDMvbXNnMDM1OTMuaHRtbAo+IAo+IExhdHRlciBwcm9ibGVtIG11c3QgYmUgcmVz
b2x2ZWQgcHJvcGVybHkgYnkgaW50cm9kdWNpbmcgZW11bGF0ZWQgUENJZQo+IFJvb3QgUG9ydHMg
Zm9yIHBhc3NlZCB0aHJvdWdoIGRldmljZXMuCgpJbiBvcmRlciB0byBzb2x2ZSBpdCBwcm9wZXJs
eSBicmlkZ2VzIGFyZSByZXF1aXJlZC4gQnV0IGFzIHlvdSBwb2ludApvdXQgaW4geW91ciBlbWFp
bCwgaXQgY2FuIGJlIHdvcmtlZCBhcm91bmQuIFNpbmNlIHRoZXJlJ3MgYWxyZWFkeQpxdWl0ZSBh
IGxvdCBvZiBzdHVmZiB0byBkaXNjdXNzLCBhbmQgQUZBSUNUIGJyaWRnZSBzdXBwb3J0IGlzIG5v
dAptYW5kYXRvcnkgZm9yIGFuIGluaXRpYWwgaW1wbGVtZW50YXRpb24gSSB3b3VsZCBzdWdnZXN0
IHRoYXQgdGhlCmJyaWRnZSBkaXNjdXNzaW9uIGlzIGRlZmVycmVkIHVudGlsIE1DRkcgc3VwcG9y
dCBmb3IgYnVzIDAgaXMKaW1wbGVtZW50ZWQuCgo+IFdoaWxlIHRoaXMgYXBwcm9hY2ggaXMgYmVu
ZWZpY2lhbCBpbiBtYW55IHdheXMsIGl0IHdpbGwgYWZmZWN0Cj4gY29tcGF0aWJpbGl0eSB3aXRo
IFFFTVUgdmVyeSwgdmVyeSBiYWRseS4gRm9yIGV4YW1wbGUsIE5WRElNTSBzdXBwb3J0Cj4gcGF0
Y2hlcyBmcm9tIEludGVsIHJlbHkgb24gUUVNVSBBQ1BJIGZhY2lsaXRpZXMgd2hpY2ggY2FuIGJl
Y29tZQo+IGNvbXBsZXRlbHkgaW5vcGVyYXRpb25hbCBkdWUgdG8gcmVtb3ZpbmcgZW11bGF0ZWQg
TkIrU0IgYW5kIHRoZWlyCj4gY29ycmVzcG9uZGluZyBzdWJ0eXBlcyBhbmQgcHJvcGVydGllcy4K
ClRoZXJlIGFyZSBtdWx0aXBsZSBpc3N1ZXMgd2l0aCBOVkRJTU0gb24gWGVuLCBhbmQgd2UgYXJl
IHN0aWxsCmRpc2N1c3NpbmcgaG93IE5WRElNTSBkZXZpY2VzIHNob3VsZCBiZSBoYW5kbGVkIG9u
IERvbTAsIEkgdGhpbmsgYXQKdGhpcyBzdGFnZSBBQ1BJIGlzIGEgcXVpdGUgbWlub3IgaXNzdWUg
Y29tcGFyZWQgdG8gdGhlIG90aGVyCmNoYWxsZW5nZXMgcHJlc2VudGVkIGJ5IE5WRElNTS4KCkFu
ZCBpbiBhbnkgY2FzZSBpbiBvcmRlciBmb3Igdk5WRElNTSB0byBzdXBwb3J0IFBWSCBndWVzdHMg
dGhlIFFFTVUKY29kZSBpcyBjZXJ0YWlubHkgbm90IGdvaW5nIHRvIGJlIHVzZWQgb24gWGVuLgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
