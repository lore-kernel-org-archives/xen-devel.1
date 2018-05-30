From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/9] x86/vmx: Pass an MSR value into
 vmx_msr_add()
Date: Wed, 30 May 2018 19:09:57 +0100
Message-ID: <26ea87e2-f576-5698-0ab2-73508d48b121@citrix.com>
References: <1526988046-22948-1-git-send-email-andrew.cooper3@citrix.com>
 <1526988046-22948-7-git-send-email-andrew.cooper3@citrix.com>
 <5B06D64202000078001C5A5E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B06D64202000078001C5A5E@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDUvMTggMTY6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIyLjA1LjE4IGF0
IDEzOjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRoZSBtYWluIHB1
cnBvc2Ugb2YgdGhpcyBjaGFuZ2UgaXMgdG8gYWxsb3cgdXMgdG8gc2V0IGEgc3BlY2lmaWMgTVNS
IHZhbHVlLAo+PiB3aXRob3V0IG5lZWRpbmcgdG8ga25vdyB3aGV0aGVyIHRoZXJlIGlzIGFscmVh
ZHkgYSBsb2FkL3NhdmUgbGlzdCBzbG90IGZvciAKPj4gaXQuCj4+IFByZXZpb3VzbHksIGNhbGxl
cnMgd2FudGluZyB0aGlzIHByb3BlcnR5IG5lZWRlZCB0byBjYWxsIGJvdGggdm14X2FkZF8qX21z
cigpCj4+IGFuZCB2bXhfd3JpdGVfKl9tc3IoKSB0byBjb3ZlciBib3RoIGNhc2VzLgo+Pgo+PiBB
cyBhIHJlc3VsdCBvZiB0aGlzIEFQSSBpbXByb3ZlbWVudCwgdGhlIGRlZmF1bHQgdmFsdWUgZm9y
IGd1ZXN0IE1TUnMgbmVlZCBub3QKPj4gYmUgMCwgYW5kIHRoZSBkZWZhdWx0IGZvciBob3N0IE1T
UnMgbmVlZCBub3QgYmUgcGFzc2VkIHZpYSBoYXJkd2FyZSByZWdpc3Rlci4KPj4gSW4gcHJhY3Rp
Y2UsIHRoaXMgY2xlYW5zIHVwIHRoZSBWUE1VIGFsbG9jYXRpb24gbG9naWMsIGFuZCBhdm9pZHMg
YW4gTVNSIHJlYWQKPj4gYXMgcGFydCBvZiB2Y3B1IGNvbnN0cnVjdGlvbi4KPiBCdXQgdGhpcyBh
bHNvIG1lYW5zOiBJZiB0aGVyZSBhbHJlYWR5IGlzIHN1Y2ggYW4gZW50cnksIHRoZSBwcmV2aW91
cyB2YWx1ZSB3aWxsCj4gbm93IGJlIGJsaW5kbHkgb3ZlcndyaXR0ZW4uIEFyZSB5b3Ugc3VyZSB0
aGlzIGlzIGFsd2F5cyB3aGF0IGlzIHdhbnRlZD8KCllvdSBhcmUgY29ycmVjdC7CoCBUaGlzIHdp
bGwgZW5kIHVwIHJlc2V0dGluZyB0aGUgTEJSIE1TUnMgd2hlbmV2ZXIgdGhlCmd1ZXN0IHdyaXRl
cyB0byBNU1JfREVCVUdDVEwuCgpPdmVyYWxsLCB0aGlzIGJlaGF2aW91ciBpcyB0aGUgbW9yZSB1
c2VmdWwgZm9yIGNhbGxlcnMsIHNvIEknbGwgYWRqdXN0CnRoZSBNU1JfREVCVUdDVEwgY2FzZSB0
byBvbmx5IGV2ZXIgdHJ5IGluc2VydGluZyB0aGVtIG9uY2UuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
