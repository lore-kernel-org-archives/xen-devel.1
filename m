From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Mon, 1 Oct 2018 10:40:38 +0200
Message-ID: <20181001084038.GD18290__11085.4272767485$1538383187$gmane$org@dhcp22.suse.cz>
References: <20180928150357.12942-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3tje=mn=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1g6tl0-00037m-DK
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 08:40:46 +0000
Content-Disposition: inline
In-Reply-To: <20180928150357.12942-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Pavel Tatashin <pavel.tatashin@microsoft.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenpro
List-Id: xen-devel@lists.xenproject.org

T24gRnJpIDI4LTA5LTE4IDE3OjAzOjU3LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKWy4uLl0K
CkkgaGF2ZW4ndCByZWFkIHRoZSBwYXRjaCBpdHNlbGYgYnV0IEkganVzdCB3YW50ZWQgdG8gbm90
ZSBvbmUgdGhpbmcKYWJvdXQgdGhpcyBwYXJ0Cgo+IEZvciBwYXJhdmlydHVhbGl6ZWQgZGV2aWNl
cyBpdCBpcyByZWxldmFudCB0aGF0IG1lbW9yeSBpcyBvbmxpbmVkIGFzCj4gcXVpY2tseSBhcyBw
b3NzaWJsZSBhZnRlciBhZGRpbmcgLSBhbmQgdGhhdCBpdCBpcyBhZGRlZCB0byB0aGUgTk9STUFM
Cj4gem9uZS4gT3RoZXJ3aXNlLCBpdCBjb3VsZCBoYXBwZW4gdGhhdCB0b28gbXVjaCBtZW1vcnkg
aW4gYSByb3cgaXMgYWRkZWQKPiAoYnV0IG5vdCBvbmxpbmVkKSwgcmVzdWx0aW5nIGluIG91dC1v
Zi1tZW1vcnkgY29uZGl0aW9ucyBkdWUgdG8gdGhlCj4gYWRkaXRpb25hbCBtZW1vcnkgZm9yICJz
dHJ1Y3QgcGFnZXMiIGFuZCBmcmllbmRzLiBNT1ZBQkxFIHpvbmUgYXMgd2VsbAo+IGFzIGRlbGF5
cyBtaWdodCBiZSB2ZXJ5IHByb2JsZW1hdGljIGFuZCBsZWFkIHRvIGNyYXNoZXMgKGUuZy4gem9u
ZQo+IGltYmFsYW5jZSkuCgpJIGhhdmUgcHJvcG9zZWQgKGJ1dCBoYXZlbid0IGZpbmlzaGVkIHRo
aXMgZHVlIHRvIG90aGVyIHN0dWZmKSBhCnNvbHV0aW9uIGZvciB0aGlzLiBOZXdseSBhZGRlZCBt
ZW1vcnkgY2FuIGhvc3QgbWVtbWFwcyBpdHNlbGYgYW5kIHRoZW4KeW91IGRvIG5vdCBoYXZlIHRo
ZSBwcm9ibGVtIGluIHRoZSBmaXJzdCBwbGFjZS4gRm9yIHZtZW1tYXAgaXQgd291bGQKaGF2ZSBh
biBhZHZhbnRhZ2UgdGhhdCB5b3UgZG8gbm90IHJlYWxseSBoYXZlIHRvIGJlZyBmb3IgMk1CIHBh
Z2VzIHRvCmJhY2sgdGhlIHdob2xlIHNlY3Rpb24gYnV0IHlvdSB3b3VsZCBnZXQgaXQgZm9yIGZy
ZWUgYmVjYXVzZSB0aGUgaW5pdGlhbApwYXJ0IG9mIHRoZSBzZWN0aW9uIGlzIGJ5IGRlZmluaXRp
b24gcHJvcGVybHkgYWxpZ25lZCBhbmQgdW51c2VkLgoKSSB5ZXQgaGF2ZSB0byB0aGluayBhYm91
dCB0aGUgd2hvbGUgcHJvcG9zYWwgYnV0IEkgYW0gbWlzc2luZyB0aGUgbW9zdAppbXBvcnRhbnQg
cGFydC4gX1dob18gaXMgZ29pbmcgdG8gdXNlIHRoZSBuZXcgZXhwb3J0ZWQgaW5mb3JtYXRpb24g
YW5kCmZvciB3aGF0IHB1cnBvc2UuIFlvdSBzYWlkIHRoYXQgZGlzdHJpYnV0aW9ucyBoYXZlIGhh
cmQgdGltZSB0bwpkaXN0aW5ndWlzaCBkaWZmZXJlbnQgdHlwZXMgb2Ygb25saW5pbmluZyBwb2xp
Y2llcyBidXQgaXNuJ3QgdGhpcwpzb21ldGhpbmcgdGhhdCBpcyBpbmhlcmVudGx5IHVzZWNhc2Ug
c3BlY2lmaWM/Ci0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
