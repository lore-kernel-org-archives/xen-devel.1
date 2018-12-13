From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Interrupt injection with ISR set on Intel hardware
Date: Thu, 13 Dec 2018 01:36:35 -0700
Message-ID: <5C121A130200007800205BA7@prv1-mh.provo.novell.com>
References: <20181015103015.cyvld52tngd4d3qy@mac.bytemobile.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9DA20@SHSMSX101.ccr.corp.intel.com>
 <20181212112436.dtnd6sum5mztleih@mac>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9DB2A@SHSMSX101.ccr.corp.intel.com>
 <20181212121730.kprvmtyhrwyhm62t@mac>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9E954@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXMU3-0004d3-Oy
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 08:36:39 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19BE9E954@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE4IGF0IDAyOjI4LCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
IGJ0dyBJIGNoZWNrZWQgeW91ciBvcmlnaW5hbCBtYWlsOgo+IAo+IChYRU4pICAgIFs8ZmZmZjgy
ZDA4MDJlMjQwMz5dIG13YWl0LWlkbGUuYyNtd2FpdF9pZGxlKzB4MmE1LzB4MzgxCj4geGVuL2Fy
Y2gveDg2L2NwdS9td2FpdC1pZGxlLmM6ODAyCj4gCj4gICAgNzg4CQlpZiAoY3B1X2lzX2hhbHRh
YmxlKGNwdSkpCj4gICAgNzg5CQkJbXdhaXRfaWRsZV93aXRoX2hpbnRzKGVheCwgTVdBSVRfRUNY
X0lOVEVSUlVQVF9CUkVBSyk7Cj4gICAgNzkwCj4gICAgNzkxCQlhZnRlciA9IGNwdWlkbGVfZ2V0
X3RpY2soKTsKPiAgICA3OTIKPiAgICA3OTMJCWNzdGF0ZV9yZXN0b3JlX3RzYygpOwo+ICAgIDc5
NAkJdHJhY2VfZXhpdF9yZWFzb24oaXJxX3RyYWNlZCk7Cj4gICAgNzk1CQlUUkFDRV82RChUUkNf
UE1fSURMRV9FWElULCBjeC0+dHlwZSwgYWZ0ZXIsCj4gICAgNzk2CQkJaXJxX3RyYWNlZFswXSwg
aXJxX3RyYWNlZFsxXSwgaXJxX3RyYWNlZFsyXSwgaXJxX3RyYWNlZFszXSk7Cj4gICAgNzk3Cj4g
ICAgNzk4CQkvKiBOb3cgYmFjayBpbiBDMC4gKi8KPiAgICA3OTkJCXVwZGF0ZV9pZGxlX3N0YXRz
KHBvd2VyLCBjeCwgYmVmb3JlLCBhZnRlcik7Cj4gICAgODAwCQlsb2NhbF9pcnFfZW5hYmxlKCk7
Cj4gICAgODAxCj4gLT4gODAyCQlpZiAoIShsYXBpY190aW1lcl9yZWxpYWJsZV9zdGF0ZXMgJiAo
MSA8PCBjc3RhdGUpKSkKPiAgICA4MDMJCQlsYXBpY190aW1lcl9vbigpOwo+ICAgIDgwNAo+ICAg
IDgwNQkJc2NoZWRfdGlja19yZXN1bWUoKTsKPiAgICA4MDYJCWNwdWZyZXFfZGJzX3RpbWVyX3Jl
c3VtZSgpOwo+IAo+IExvb2tzIGFib3ZlIGNvZGUgaXMgZGlmZmVyZW50IGZyb20gc3RhZ2luZzoK
PiAKPiBhY3BpX3Byb2Nlc3Nvcl9pZGxlOgo+IAlhY3BpX2lkbGVfZG9fZW50cnk6Cj4gCQlhY3Bp
X3Byb2Nlc3Nvcl9mZmhfY3N0YXRlX2VudGVyOgo+IAkJCW13YWl0X2lkbGVfd2l0aF9oaW50cwo+
IAo+IHRoZXJlIGlzIG5vIG13YWl0X2lkbGUgYWxvbmUuIGFuZCBldmVuIHdpdGggY29tcGlsZXIg
b3B0aW1pemF0aW9uIEkgZGlkbid0Cj4gZmluZCBjb2RlIHNlcXVlbmNlIGxpa2UgYWJvdmUuLi4K
CllvdSdyZSBsb29raW5nIGF0IHR3byBlbnRpcmVseSBkaWZmZXJlbnQgY29kZSBwYXRocywgb25s
eSBvbmUgb2YKd2hpY2ggY2FuIGJlIGluIHVzZSBpbiBhbnkgcGFydGljdWxhciBjYXNlOiBFaXRo
ZXIgdGhlIGlkbGUKZW50ZXJpbmcgcm91dGluZSB1c2VkIGlzIGFjcGlfcHJvY2Vzc29yX2lkbGUo
KSwgb3IgKHdoZW4gdGhlCnByb2Nlc3NvciBpcyBzdXBwb3J0ZWQgYnkgdGhhdCBkcml2ZXIgY29k
ZSkgaXQgaXMgbXdhaXRfaWRsZSgpLgpTZWUgbXdhaXRfaWRsZV9pbml0KCkgZm9yIHdoZW4gdGhl
IGxhdHRlciBnZXRzIHVzZWQ7IHRoZSBmb3JtZXIKbWF5IGdldCBpbnN0YWxsZWQgYXQgdGhlIHBv
aW50IHRoZSBEb20wIGtlcm5lbCByZXBvcnRzIEFDUEkKQy1zdGF0ZSBkYXRhIChhbmQgb25seSB3
aGVuIG13YWl0X2lkbGUoKSBpcyBub3QgaW4gdXNlKS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
