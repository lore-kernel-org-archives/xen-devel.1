From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/srat: fix the end pfn check in
 valid_numa_range()
Date: Tue, 13 Feb 2018 03:41:11 -0700
Message-ID: <5A82CED702000078001A747F@prv-mh.provo.novell.com>
References: <20180212014423.7936-1-haozhong.zhang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180212014423.7936-1-haozhong.zhang@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Haozhong Zhang <haozhong.zhang@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAyLjE4IGF0IDAyOjQ0LCA8aGFvemhvbmcuemhhbmdAaW50ZWwuY29tPiB3cm90
ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYvc3JhdC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NyYXQu
Ywo+IEBAIC0xMTAsOCArMTEwLDggQEAgaW50IHZhbGlkX251bWFfcmFuZ2UodTY0IHN0YXJ0LCB1
NjQgZW5kLCBub2RlaWRfdCBub2RlKQo+ICAJZm9yIChpID0gMDsgaSA8IG51bV9ub2RlX21lbWJs
a3M7IGkrKykgewo+ICAJCXN0cnVjdCBub2RlICpuZCA9ICZub2RlX21lbWJsa19yYW5nZVtpXTsK
PiAgCj4gLQkJaWYgKG5kLT5zdGFydCA8PSBzdGFydCAmJiBuZC0+ZW5kID4gZW5kICYmCj4gLQkJ
CW1lbWJsa19ub2RlaWRbaV0gPT0gbm9kZSApCj4gKwkJaWYgKG5kLT5zdGFydCA8PSBzdGFydCAm
JiBuZC0+ZW5kID49IGVuZCAmJgo+ICsJCQltZW1ibGtfbm9kZWlkW2ldID09IG5vZGUpCj4gIAkJ
CXJldHVybiAxOwo+ICAJfQo+ICAKCllvdSBhbHNvIHNob3VsZCBoYXZlIGZpeGVkIHRoZSBpbmRl
bnRhdGlvbiBpc3N1ZSBvbiB0aGUgc2Vjb25kCmxpbmUgb2YgdGhlIGlmKCkuCgpUaGVyZSBsb29r
cyB0byBiZSBhIHNpbWlsYXIgaXNzdWUgaW4gbm9kZXNfY292ZXJfbWVtb3J5KCksIGFuZCBJCnRo
aW5rIGl0IHdvdWxkIGJlIHJhdGhlciBkZXNpcmFibGUgaWYgYSBjaGFuZ2UgaGVyZSBkZWFsdCB3
aXRoIGFsbApzdWNoIGlzc3VlcyByYXRoZXIgdGhhbiBqdXN0IHBpY2tpbmcgb25lLiBBbnl3YXkg
LSBJJ2xsIHByb2R1Y2UgYQpwYXRjaCBmb3IgdGhpcyBzZWNvbmQgaXNzdWUuCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
