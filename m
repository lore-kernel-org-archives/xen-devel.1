From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 03/15] libxl_qmp: Implement fd callback
 and read data [and 1 more messages]
Date: Tue, 30 Oct 2018 18:03:33 +0000
Message-ID: <20181030180333.GD6481@perard.uk.xensource.com>
References: <20181015151630.3887-1-ian.jackson@eu.citrix.com>
 <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-4-anthony.perard@citrix.com>
 <23486.7932.781238.747508@mariner.uk.xensource.com>
 <20181011140604.GH1331@perard.uk.xensource.com>
 <23492.49624.248349.953540@mariner.uk.xensource.com>
 <20181029155231.GC6481@perard.uk.xensource.com>
 <23511.17423.158308.290375@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=abki=nk=citrix.com=prvs=834435c50=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gHYO6-0001LY-6x
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 18:05:10 +0000
Content-Disposition: inline
In-Reply-To: <23511.17423.158308.290375@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDU6MzE6NTlQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NSAwMy8xNV0gbGlieGxf
cW1wOiBJbXBsZW1lbnQgZmQgY2FsbGJhY2sgYW5kIHJlYWQgZGF0YSBbYW5kIDEgbW9yZSBtZXNz
YWdlc10iKToKPiA+IE9uIE1vbiwgT2N0IDE1LCAyMDE4IGF0IDA1OjM1OjM2UE0gKzAxMDAsIElh
biBKYWNrc29uIHdyb3RlOgo+ID4gPiA+ICsgICAgICAgIGV2LT5idWZfY29uc3VtZWQgKz0gbGVu
Owo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgICBpZiAoZXYtPmJ1Zl9jb25zdW1lZCA+PSBldi0+
YnVmX3VzZWQpIHsKPiA+ID4gPiArICAgICAgICAgICAgZnJlZShldi0+cnhfYnVmKTsKPiA+ID4g
Cj4gPiA+IFN1cmVseSBidWZfY29uc3VtZWQgPD0gYnVmX3VzZWQgPyAgTWF5YmUgeW91IHNob3Vs
ZCBhc3NlcnQgdGhhdC4KPiA+IAo+ID4gSSdtIGF0dGVtcHRpbmcgdG8gZGV0ZWN0IGhlcmUgaWYg
dGhlcmUncyBzb21ldGhpbmcgbGVmdCBpbiB0aGUgYnVmZmVyCj4gPiB0aGF0IGhhc24ndCBiZWVu
IHBhcnNlZCB5ZXQuIElmIHRoZXJlIGlzIG5vdGhpbmcgbGVmdCwgd2UgY2FuIGZyZWUgdGhlCj4g
PiBidWZmZXIuCj4gPiAKPiA+IE9yIGRvIHlvdSBtZWFuIHRoYXQgdGhlIGNvbmRpdGlvbiBzaG91
bGQgYmUgYnVmX2NvbnN1bWVkID09IGJ1Zl91c2VkID8KPiAKPiBJdCBmZWx0IG9kZCB0byBtZSB0
byByZWFkIGBldi0+YnVmX2NvbnN1bWVkID49IGV2LT5idWZfdXNlZCcgd2hlbiBJCj4ga25ldyB0
aGF0IGJ1Zl9jb25zdW1lZCA8PSBidWZfdXNlZC4gIEkgYW0gc3VnZ2VzdGluZyBhZGRpbmcKPiAg
IGFzc2VydChidWZfY29uc3VtZWQgPD0gYnVmX3VzZWQpOwo+IGFuZCB0aGVuIHdyaXRpbmcKPiAg
IGlmIChldi0+YnVmX2NvbnN1bWVkID09IGV2LT5idWZfdXNlZCkKPiAKPiBUbyBiZSBob25lc3Qg
dGhpcyBjb25kaXRpb24gaXMgYSBiaXQgZmlkZGx5LiAgV2h5IG5vdCBkbyB0aGlzIGFmdGVyCj4g
c3VidHJhY3RpbmcgYnVmX2NvbnN1bWVkIGZyb20gYnVmX3VzZWQgYW5kIGNvcHlpbmcgdGhlIG9s
ZCBkYXRhIGRvd24gPwoKU29tZWhvdywgdGhhdCBmZWVscyB3cm9uZyB0byBtb3ZlIHRoZSBkYXRh
IGluc2lkZSB0aGUgYnVmZmVyLgoKPiBUaGVuIGl0IHdvdWxkIHJlYWQKPiAgIGlmICghZXYtPmJ1
Zl91c2VkKQo+IAo+IEJ1dCBldmVuIGJldHRlciwgaWYgeW91IGNoYW5nZSB5b3VyIGNvZGUgdG8g
cGVybWl0IGV2LT5yeF9idWYgIT0gTlVMTAo+IHdoZW4gZXYtPnJ4X2J1Zl91c2VkPT0wLCB0aGlz
IGNvZGUgZ29lcyBhd2F5IGNvbXBsZXRlbHkuCgpJIGd1ZXNzIHlvdSBtZWFuIHRvIGtlZXAgdGhl
IGJ1ZmZlciBldmVuIG9uY2UgdGhlcmUncyBub3RoaW5nIGxlZnQgdG8KcGFyc2U/IChBbmQgb25s
eSBmcmVlIGl0IG9uY2Ugd2UgY2FsbCBfZGlzcG9zZSgpLikKCgotLSAKQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
