From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v8 01/17] x86: Support compiling with
 indirect branch thunks
Date: Sun, 14 Jan 2018 23:11:45 -0500
Message-ID: <20180115041145.GA10015@char.us.oracle.com>
References: <1515780067-31735-1-git-send-email-andrew.cooper3@citrix.com>
 <1515780067-31735-2-git-send-email-andrew.cooper3@citrix.com>
 <1515959306.22147.46.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1515959306.22147.46.camel@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMTQsIDIwMTggYXQgMDg6NDg6MjZQTSArMDEwMCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOgo+IE9uIEZyaSwgMjAxOC0wMS0xMiBhdCAxODowMCArMDAwMCwgQW5kcmV3IENvb3Bl
ciB3cm90ZToKPiA+IAo+ID4gKy5tYWNybyBJTkRfVEhVTktfUkVUUE9MSU5FIHJlZzpyZXEKPiA+
ICvCoMKgwqDCoMKgwqDCoCBjYWxsIDJmCj4gPiArMToKPiAKPiBMaW51eCBhbmQgR0NDIGhhdmUg
bm93IHNldHRsZWQgb24gJ3BhdXNlO2xmZW5jZTtqbXAnIGhlcmUuCgpXaGF0IGlzIHRoZSBiZW5l
Zml0IG9mIHRoZSAncGF1c2UnIGluIHRoYXQ/Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqAgbGZlbmNl
Cj4gPiArwqDCoMKgwqDCoMKgwqAgam1wIDFiCj4gPiArMjoKPiA+ICvCoMKgwqDCoMKgwqDCoCBt
b3YgJVxyZWcsICglcnNwKQo+ID4gK8KgwqDCoMKgwqDCoMKgIHJldAo+ID4gKy5lbmRtCj4gPiAr
CgoKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
