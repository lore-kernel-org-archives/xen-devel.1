From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] VT-d: use two 32-bit writes to update
 DMAR fault address registers
Date: Thu, 22 Feb 2018 09:44:03 +0000
Message-ID: <20180222094403.44nivrhg7uwzj2lq@MacBook-Pro-de-Roger.local>
References: <20171011030345.14408-1-haozhong.zhang@intel.com>
 <59DE1C290200007800184DFD@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <59DE1C290200007800184DFD@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Haozhong Zhang <haozhong.zhang@intel.com>, Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMTEsIDIwMTcgYXQgMDU6Mjc6MDVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDExLjEwLjE3IGF0IDA1OjAzLCA8aGFvemhvbmcuemhhbmdAaW50ZWwuY29t
PiB3cm90ZToKPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4g
PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ID4gQEAgLTExMDUs
NyArMTEwNSwxMyBAQCBzdGF0aWMgdm9pZCBkbWFfbXNpX3NldF9hZmZpbml0eShzdHJ1Y3QgaXJx
X2Rlc2MgCj4gPiAqZGVzYywgY29uc3QgY3B1bWFza190ICptYXNrKQo+ID4gIAo+ID4gICAgICBz
cGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUtPnJlZ2lzdGVyX2xvY2ssIGZsYWdzKTsKPiA+ICAgICAg
ZG1hcl93cml0ZWwoaW9tbXUtPnJlZywgRE1BUl9GRURBVEFfUkVHLCBtc2cuZGF0YSk7Cj4gPiAt
ICAgIGRtYXJfd3JpdGVxKGlvbW11LT5yZWcsIERNQVJfRkVBRERSX1JFRywgbXNnLmFkZHJlc3Mp
Owo+ID4gKyAgICBkbWFyX3dyaXRlbChpb21tdS0+cmVnLCBETUFSX0ZFQUREUl9SRUcsIG1zZy5h
ZGRyZXNzX2xvKTsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogV2hlbiB4MkFQSUMgaXMgbm90IGVu
YWJsZWQsIERNQVJfRkVVQUREUl9SRUcgaXMgcmVzZXJ2ZWQgYW5kCj4gPiArICAgICAqIGl0J3Mg
bm90IG5lY2Vzc2FyeSB0byB1cGRhdGUgaXQuCj4gPiArICAgICAqLwo+ID4gKyAgICBpZiAoeDJh
cGljX2VuYWJsZWQpCj4gCj4gSSdtIHByZXR0eSBzdXJlIGl0IHdhcyBwb2ludGVkIG91dCBiZWZv
cmUgdGhhdCB0aGUgc3R5bGUgaGVyZSBpcwo+IHdyb25nIChtaXNzaW5nIHNwYWNlcykuIFRoYXQn
cyBlYXN5IHRvIGZpeCB3aGlsZSBjb21taXR0aW5nLCBidXQKPiBhbnl3YXkuCgpJdCBzZWVtcyBs
aWtlIHRoaXMgd2FzIG5vdCBhcHBsaWVkLiBDYW4gc29tZW9uZSBmaXggdGhlIHN0eWxlIGFuZAph
cHBseSBpdD8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
