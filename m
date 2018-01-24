From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 4/7] kconfig/gcov: rename to coverage
Date: Wed, 24 Jan 2018 11:33:06 +0000
Message-ID: <20180124113306.nifkh7tqmcyv3wca@citrix.com>
References: <20180124100125.80443-1-roger.pau@citrix.com>
 <20180124100125.80443-5-roger.pau@citrix.com>
 <23144.28058.705230.208652@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vftr=et=citrix.com=prvs=555ec31fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eeJIj-0000ZM-Tb
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 11:33:09 +0000
Content-Disposition: inline
In-Reply-To: <23144.28058.705230.208652@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMTE6Mjc6MjJBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCB2MyA0LzddIGtjb25maWcvZ2Nv
djogcmVuYW1lIHRvIGNvdmVyYWdlIik6Cj4gPiBTbyBpdCBjYW4gYmUgdXNlZCBieSBib3RoIGdj
YyBhbmQgY2xhbmcuIEp1c3QgYWRkIHRoZSBLY29uZmlnIG9wdGlvbgo+ID4gYW5kIG1vZGlmeSB0
aGUgbWFrZWZpbGVzIHNvIHRoZSBsbHZtIGNvdmVyYWdlIHNwZWNpZmljIGNvZGUgY2FuIGJlCj4g
PiBhZGRlZCBpbiBhIGZvbGxvdyB1cCBwYXRjaC4KPiAuLi4KPiA+IGRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL3N5c2N0bC5jIGIveGVuL2NvbW1vbi9zeXNjdGwuYwo+ID4gaW5kZXggZjJhZTYyOTVm
Zi4uOGU4M2MzM2ExNiAxMDA2NDQKPiA+IC0tLSBhL3hlbi9jb21tb24vc3lzY3RsLmMKPiA+ICsr
KyBiL3hlbi9jb21tb24vc3lzY3RsLmMKPiA+IEBAIC0zOTYsMTIgKzM5NiwxMCBAQCBsb25nIGRv
X3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9zeXNjdGxfdCkgdV9zeXNjdGwpCj4g
PiAgICAgIH0KPiA+ICAgICAgYnJlYWs7Cj4gPiAgCj4gPiAtI2lmZGVmIENPTkZJR19HQ09WCj4g
PiAgICAgIGNhc2UgWEVOX1NZU0NUTF9jb3ZlcmFnZV9vcDoKPiA+ICAgICAgICAgIHJldCA9IHN5
c2N0bF9jb3Zfb3AoJm9wLT51LmNvdmVyYWdlX29wKTsKPiA+ICAgICAgICAgIGNvcHliYWNrID0g
MTsKPiA+ICAgICAgICAgIGJyZWFrOwo+ID4gLSNlbmRpZgo+ID4gIAo+IAo+IFRoaXMgaHVuayBz
ZWVtcyBlcnJvbmVvdXMgPyAgU3VyZWx5IHRoZSBuYW1lIHNob3VsZCBiZSB1cGRhdGVkLCBidXQK
PiB0aGUgI2lmZGVmIHNob3VsZCByZW1haW4uCj4gCgpObyB0aGUgaWZkZWYgbmVlZHMgdG8gZ28u
CgpUaGVyZSBpcyBhIG5ldyBzdHViIGludHJvZHVjZWQgaW4gdGhpcyBwYXRjaC4KCldlaS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
