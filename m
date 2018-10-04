From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 00/28] add vIOMMU support with irq
 remapping function of virtual VT-d
Date: Thu, 04 Oct 2018 09:51:04 -0600
Message-ID: <5BB636E802000078001EE793@prv1-mh.provo.novell.com>
References: <1510899755-40237-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1510899755-40237-1-git-send-email-chao.gao@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjExLjE3IGF0IDA3OjIyLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBU
aGlzIHBhdGNoc2V0IGlzIHRvIGludHJvZHVjZSB2SU9NTVUgZnJhbWV3b3JrIGFuZCBhZGQgdmly
dHVhbCBWVEQncwo+IGludGVycnVwdCByZW1hcHBpbmcgc3VwcG9ydCBhY2NvcmRpbmcgIlhlbiB2
aXJ0dWFsIElPTU1VIGhpZ2ggbGV2ZWwKPiBkZXNpZ24gZG9jIFYzIihodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLyAKPiAyMDE2LTExL21zZzAxMzkx
Lmh0bWwpLgo+IAo+IC0gdklPTU1VIGZyYW1ld29yawo+IE5ldyBmcmFtZXdvcmsgcHJvdmlkZXMg
dmlvbW11X29wcyBhbmQgaGVscCBmdW5jdGlvbnMgdG8gYWJzdHJhY3QKPiB2SU9NTVUgb3BlcmF0
aW9ucyhFLEcgY3JlYXRlLCBkZXN0cm95LCBoYW5kbGUgaXJxIHJlbWFwcGluZyByZXF1ZXN0Cj4g
YW5kIHNvIG9uKS4gVmVuZG9ycyhJbnRlbCwgQVJNLCBBTUQgYW5kIHNvbikgY2FuIGltcGxlbWVu
dCB0aGVpcgo+IHZJT01NVSBjYWxsYmFja3MuCj4gCj4gLSBWaXJ0dWFsIFZURAo+IFdlIGVuYWJs
ZSBpcnEgcmVtYXBwaW5nIGZ1bmN0aW9uIGFuZCBjb3ZlcnMgYm90aAo+IE1TSSBhbmQgSU9BUElD
IGludGVycnVwdHMuIERvbid0IHN1cHBvcnQgcG9zdCBpbnRlcnJ1cHQgbW9kZSBlbXVsYXRpb24K
PiBhbmQgcG9zdCBpbnRlcnJ1cHQgbW9kZSBlbmFibGVkIG9uIGhvc3Qgd2l0aCB2aXJ0dWFsIFZU
RC4gd2lsbCBhZGQKPiBsYXRlci4KPiAKPiBJbiBjYXNlIG9mIGNvbmZsaWN0cywgdGhpcyBzZXJp
ZXMgYWxzbyBjYW4gYmUgZm91bmQgaW4gbXkgcGVyc29uYWwgZ2l0aHViOgo+IFhlbjogaHR0cHM6
Ly9naXRodWIuY29tL2djMTAwOC92aW9tbXVfeGVuLmdpdCB2SU9NTVU0Cj4gUWVtdTogaHR0cHM6
Ly9naXRodWIuY29tL2djMTAwOC92aW9tbXVfcWVtdS5naXQgdklPTU1VMwo+IAo+IEFueSBjb21t
ZW50cyB3b3VsZCBiZSBoaWdobHkgYXBwcmVjaWF0ZWQuIEFuZCBiZWxvdyBpcyBjaGFuZ2UgaGlz
dG9yeS4KClNvIEkgc3RpbGwgaGFkIHRoaXMgaW4gbXkgdG8tYmUtbG9va2VkLWF0IGZvbGRlciwg
YnV0IGdpdmVuIGhvdyBvbGQKaXQgaXMgYW5kIGdpdmVuIGhvdyBtdWNoIG90aGVyIGRlcGVuZGVu
Y2llcyBpdCBoYXMgYXMgcGVyIGVhcmxpZXIKZGlzY3Vzc2lvbiAocGx1cyBxdWl0ZSBjZXJ0YWlu
bHkgYSBmYWlyIGFtb3VudCBvZiByZS1iYXNpbmcpLCBJJ3ZlCmRlY2lkZWQgdG8gZHJvcCB0aGlz
IHZlcnNpb24gbm93LCBiZWZvcmUgaXQgcmVhY2hlcyBpdHMgMSB5ZWFyCnN1Ym1pc3Npb24gYW5u
aXZlcnNhcnkuCgpJbiB0aGUgaG9wZSBmb3IgeW91ciB1bmRlcnN0YW5kaW5nLApKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
