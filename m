From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Thu, 4 Oct 2018 09:48:32 +0200
Message-ID: <746a61c2-ebc7-abff-3bcd-7e307ef449bd__22900.1625361436$1538639257$gmane$org@redhat.com>
References: <20180928150357.12942-1-david@redhat.com>
 <5dba97a5-5a18-5df1-5493-99987679cf3a@linux.intel.com>
 <147d20c7-2a07-2305-9b44-76fdb735173b@redhat.com>
 <05493150-5e4e-30bd-f772-0c6d88240030@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tvfk=mq=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1g7yNL-0004mF-Nf
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 07:48:47 +0000
In-Reply-To: <05493150-5e4e-30bd-f772-0c6d88240030@linux.intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Rob Herring <robh@ker>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMjAxOCAxODoyNCwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4+IEhvdyBzaG91bGQgYSBw
b2xpY3kgaW4gdXNlciBzcGFjZSBsb29rIGxpa2Ugd2hlbiBuZXcgbWVtb3J5IGdldHMgYWRkZWQK
Pj4gLSBvbiBzMzkweD8gTm90IG9ubGluaW5nIHBhcmF2aXJ0dWFsaXplZCBtZW1vcnkgaXMgdmVy
eSB3cm9uZy4KPiAKPiBCZWNhdXNlIHdlJ3JlIGdvaW5nIHRvIGJhbGxvb24gaXQgYXdheSBpbiBh
IG1vbWVudCBhbnl3YXk/CgpObywgcmV0aGVyIHNvbWVib2R5IHdhbnRlZCB0aGlzIFZNIHRvIGhh
dmUgbW9yZSBtZW1vcnksIHNvIGl0IHNob3VsZCB1c2UKaXQgLSBiYXNpY2FsbHkgd2hhdCBIeXBl
clYgb3IgWEVOIGFsc28gZG8uIChpbiBjb250cmFzdCB0byB0aGUgY29uY2VwdApvZiBzdGFuZGJ5
IG1lbW9yeSBvbiBzMzkwKS4KCj4gPiBXZSBoYXZlIGF1dG8tb25saW5pbmcuICBXaHkgaXNuJ3Qg
dGhhdCBiZWluZyB1c2VkIG9uIHMzOTA/CgpEbyB5b3UgbWVhbiB0aGUgc3lzIHBhcmFtZXRlcj8g
SG93IHdvdWxkIHRoYXQgaGVscD8KCj4gCj4gCj4+IFNvIHRoZSB0eXBlIG9mIG1lbW9yeSBpcyB2
ZXJ5IGltcG9ydGFudCBoZXJlIHRvIGhhdmUgaW4gdXNlciBzcGFjZS4KPj4gUmVseWluZyBvbiBj
aGVja3MgbGlrZSAiaXNTMzkwKCkiLCAiaXNLVk1HdWVzdCgpIiBvciAiaXNIeXBlclZHdWVzdCgp
Igo+PiB0byBkZWNpZGUgd2hldGhlciB0byBvbmxpbmUgbWVtb3J5IGFuZCBob3cgdG8gb25saW5l
IG1lbW9yeSBpcyB3cm9uZy4KPj4gT25seSBzb21lIHNwZWNpZmljIG1lbW9yeSB0eXBlcyAod2hp
Y2ggSSBjYWxsICJub3JtYWwiKSBhcmUgdG8gYmUKPj4gaGFuZGxlZCBieSB1c2VyIHNwYWNlLgo+
Pgo+PiBGb3IgdGhlIG90aGVyIG9uZXMsIHdlIGV4YWN0bHkga25vdyB3aGF0IHRvIGRvOgo+PiAt
IHN0YW5kYnk/IGRvbid0IG9ubGluZQo+IAo+IEkgdGhpbmsgeW91J3JlIGhvcnJpYmx5IGNvbmZs
YXRpbmcgdGhlIHNvZnR3YXJlIGRlc2lyZSBmb3Igd2hhdCB0aGUgc3RhZQo+IHNob3VsZCBiZSBh
bmQgdGhlIGhhcmR3YXJlIGl0c2VsZi4KCkFncmVlZCwgdXNlciBzcGFjZSBzaG91bGQgYmUgYWJs
ZSB0byBjb25maWd1cmUgaXQuCgo+IAo+Pj4gQXMgZm9yIHRoZSBPT00gaXNzdWVzLCB0aGF0IHNv
dW5kcyBsaWtlIHNvbWV0aGluZyB3ZSBuZWVkIHRvIGZpeCBieQo+Pj4gcmVmdXNpbmcgdG8gZG8g
KG9yIGRlbGF5aW5nKSBob3QtYWRkIG9wZXJhdGlvbnMgb25jZSB3ZSBjb25zdW1lIHRvbyBtdWNo
Cj4+PiBaT05FX05PUk1BTCBmcm9tIG1lbW1hcFtdcyByYXRoZXIgdGhhbiB0cnlpbmcgdG8gaW5k
aXJlY3RseSB0ZWxsCj4+PiB1c2Vyc3BhY2UgdG8gaHVycnkgdGhpbmcgYWxvbmcuCj4+Cj4+IFRo
YXQgaXMgYSBtb3ZpbmcgdGFyZ2V0IGFuZCBkb2luZyB0aGF0IGF1dG9tYXRpY2FsbHkgaXMgYmFz
aWNhbGx5Cj4+IGltcG9zc2libGUuCj4gCj4gTmFoLiAgV2Uga25vdyBob3cgbXVjaCBtZXRhZGF0
YSB3ZSd2ZSBhbGxvY2F0ZWQuICBXZSBrbm93IGhvdyBtdWNoCj4gWk9ORV9OT1JNQUwgd2UgYXJl
IGVhdGluZy4gIFdlIGNhbiAqZWFzaWx5KiBhZGQgc29tZXRoaW5nIHRvCj4gYWRkX21lbW9yeSgp
IHRoYXQganVzdCBzbGVlcHMgdW50aWwgdGhlIHJhdGlvIGlzIG5vdCBvdXQtb2Ytd2hhY2suCj4g
Cj4+IFlvdSBjYW4gYWRkIGEgbG90IG9mIG1lbW9yeSB0byB0aGUgbW92YWJsZSB6b25lIGFuZAo+
PiBldmVyeXRoaW5nIGlzIGZpbmUuIFN1ZGRlbmx5IGEgbG90IG9mIHByb2Nlc3NlcyBhcmUgc3Rh
cnRlZCAtIGJvb20uCj4+IE1PVkFCTEUgc2hvdWxkIG9ubHkgZXZlcnkgYmUgdXNlZCBpZiB5b3Ug
ZXhwZWN0IGFuIHVucGx1Zy4gQW5kIGZvcgo+PiBwYXJhdmlydHVhbGl6ZWQgZGV2aWNlcywgYSAi
dHlwaWNhbCIgdW5wbHVnIGRvZXMgbm90IGV4aXN0Lgo+IAo+IE5vLCBpdCdzIG1vcmUgY29tcGxp
Y2F0ZWQgdGhhbiB0aGF0LiAgUGVvcGxlIHVzZSBNT1ZBQkxFLCBmb3IgaW5zdGFuY2UsCj4gdG8g
YWxsb3cgbW9yZSBjb25zaXN0ZW50IGh1Z2UgcGFnZSBhbGxvY2F0aW9ucy4gIEl0J3MgY2VydGFp
bmx5IG5vdCBqdXN0Cj4gaG90LXJlbW92ZS4KPiAKCkFzIG5vdGVkIGluIHRoZSBvdGhlciB0aHJl
YWQsIHRoYXQncyBhIGdvb2QgcG9pbnQuIFdlIGhhdmUgdG8gYWxsb3cgdG8KbWFrZSBhIGRlY2lz
aW9uIGluIHVzZXIgc3BhY2UuCgpJIGFncmVlIHRvIHlvdXIgaW5pdGlhbCBwcm9wb3NhbCB0byBk
aXN0aW5ndWlzaCAic3RhbmRieSIgZnJvbQoiYXV0by1vbmxpbmUiLiBJdCB3b3VsZCBhbGxvdyB0
byBoYXZlIHNhbmUgZGVmYXVsdHMgaW4gdXNlciBzcGFjZS4KCi0tIAoKVGhhbmtzLAoKRGF2aWQg
LyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
