From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH v2 03/10] x86: Add Intel Processor Trace
 support for cpuid
Date: Tue, 3 Jul 2018 10:19:09 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E168048216@SHSMSX101.ccr.corp.intel.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-4-git-send-email-luwei.kang@intel.com>
 <5B364D8802000078001CF419@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B364D8802000078001CF419@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgKPiA+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgKPiA+IEBA
IC0yMTUsNiArMjE1LDcgQEAgWEVOX0NQVUZFQVRVUkUoU01BUCwgICAgICAgICAgNSozMisyMCkg
LypTICBTdXBlcnZpc29yIE1vZGUgQWNjZXNzIFByZXZlbnRpb24gKi8KPiA+ICBYRU5fQ1BVRkVB
VFVSRShBVlg1MTJJRk1BLCAgICA1KjMyKzIxKSAvKkEgIEFWWC01MTIgSW50ZWdlciBGdXNlZCBN
dWx0aXBseSBBZGQgKi8KPiA+ICBYRU5fQ1BVRkVBVFVSRShDTEZMVVNIT1BULCAgICA1KjMyKzIz
KSAvKkEgIENMRkxVU0hPUFQgaW5zdHJ1Y3Rpb24gKi8KPiA+ICBYRU5fQ1BVRkVBVFVSRShDTFdC
LCAgICAgICAgICA1KjMyKzI0KSAvKkEgIENMV0IgaW5zdHJ1Y3Rpb24gKi8KPiA+ICtYRU5fQ1BV
RkVBVFVSRShJUFQsICAgICAgICAgICA1KjMyKzI1KSAvKkggIEludGVsIFByb2Nlc3NvciBUcmFj
ZSAqLwo+IAo+IEJ0dyAtIGludHJvZHVjaW5nIHRoZSBmZWF0dXJlIGZsYWcgaGVyZSBpcyBjZXJ0
YWlubHkgZmluZSwgYnV0IEkgdGhpbmsgeW91IHNob3VsZCBhZGQgdGhlIEggYW5ub3RhdGlvbiBv
bmx5IG9uY2UgZnVuY3Rpb25hbGl0eSBpcwo+IGNvbXBsZXRlLiBUaGF0IHdvdWxkIHRoZW4gZS5n
LiBhbHNvIHJlZHVjZSB0aGUgaW1wYWN0IG9mIHBhdGNoIDggYWRkaW5nIGZ1bmN0aW9uYWxpdHkg
b3RoZXJ3aXNlIHN0cmljdGx5IG5lY2Vzc2FyeSBhbHJlYWR5IGluIHBhdGNoCj4gNy4KClNvcnJ5
LCBub3QgZnVsbCB1bmRlcnN0YW5kIGhlcmUuIERvIHlvdSBtZWFuIEkgbmVlZCBleHBvc2UgdGhp
cyBmZWF0dXJlIHRvIGd1ZXN0IGFmdGVyIGFsbCBpcyByZWFkeT8gVGhhdCBpcyBtb3ZlIHRoaXMg
cGF0Y2ggYWZ0ZXIgcGF0Y2ggNyw4ID8KClRoYW5rcywKTHV3ZWkgS2FuZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
