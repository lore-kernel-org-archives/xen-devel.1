From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Thu, 4 Oct 2018 09:40:56 +0200
Message-ID: <060bd891-f88e-13e1-2bb3-26d96f6d28cb__19550.1428017907$1538638817$gmane$org@redhat.com>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <20181003135407.GI4714@dhcp22.suse.cz>
 <9fef1f7d-2d7c-03f1-00e3-5fa657eda019@redhat.com>
 <20181004062811.GC22173@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tvfk=mq=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1g7yG1-0004Y0-58
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 07:41:13 +0000
In-Reply-To: <20181004062811.GC22173@dhcp22.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Pavel Tatashin <pavel.tatashin@microsoft.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenpro
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTAvMjAxOCAwODoyOCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IE9uIFdlZCAwMy0xMC0x
OCAxOTowMDoyOSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gWy4uLl0KPj4gTGV0IG1lIHJl
cGhyYXNlOiBZb3Ugc3RhdGUgdGhhdCB1c2VyIHNwYWNlIGhhcyB0byBtYWtlIHRoZSBkZWNpc2lv
biBhbmQKPj4gdGhhdCB1c2VyIHNob3VsZCBiZSBhYmxlIHRvIHNldC9yZWNvbmZpZ3VyZSBydWxl
cy4gVGhhdCBpcyBwZXJmZWN0bHkgZmluZS4KPj4KPj4gQnV0IHRoZW4gd2Ugc2hvdWxkIGdpdmUg
dXNlciBzcGFjZSBhY2Nlc3MgdG8gc3VmZmljaWVudCBpbmZvcm1hdGlvbiB0bwo+PiBtYWtlIGEg
ZGVjaXNpb24uIFRoaXMgbWlnaHQgYmUgdGhlIHR5cGUgb2YgbWVtb3J5IGFzIHdlIGxlYXJuZWQg
KHdoYXQKPj4gc29tZSBwYXJ0IG9mIHRoaXMgcGF0Y2ggcHJvcG9zZXMpLCBidXQgbWF5YmUgbGF0
ZXIgbW9yZSwgZS5nLiB0byB3aGljaAo+PiBwaHlzaWNhbCBkZXZpY2UgbWVtb3J5IGJlbG9uZ3Mg
KGUuZy4gdG8gaG90cGx1ZyBpdCBhbGwgbW92YWJsZSBvciBhbGwKPj4gbm9ybWFsKSAuLi4KPiAK
PiBJIGFtIHByZXR0eSBzdXJlIHRoYXQgdXNlciBrbm93cyBoZS9zaGUgd2FudHMgdG8gdXNlIGJh
bGxvb25pbmcgaW4KPiBIeXBlclYgb3IgWGVuLCBvciB0aGF0IHRoZSBtZW1vcnkgaG90cGx1ZyBz
aG91bGQgYmUgdXNlZCBhcyBhICJSQVMiCj4gZmVhdHVyZSB0byBhbGxvdyBhZGQgYW5kIHJlbW92
ZSBESU1NcyBmb3IgcmVsaWFiaWxpdHkuIFdoeSBzaG91bGRuJ3Qgd2UKPiBoYXZlIGEgcGFja2Fn
ZSB0byBkZXBsb3kgYW4gYXBwcm9wcmlhdGUgc2V0IG9mIHVkZXYgcnVsZXMgZm9yIGVhY2ggb2YK
PiB0aG9zZSB1c2VjYXNlcz8gSSBhbSBwcmV0dHkgc3VyZSB5b3UgbmVlZCBzb21lIG90aGVyIHBs
dW1iaW5nIHRvIGVuYWJsZQo+IHRoZW0gYW55d2F5IChlLmcuIFJBUyB3b3VsZCByZXF1aXJlIHRv
IGhhdmUgbW92YWJsZV9ub2RlIGtlcm5lbAo+IHBhcmFtZXRlcnMsIGJhbGxvb25pbmcgYSBrZXJu
ZWwgbW9kdWxlIGV0Yy4pLgo+IAo+IFJlYWxseSwgb25lIHVkZXYgc2NyaXB0IHRvIHJ1bGUgdGhl
bSBhbGwgd2lsbCBzaW1wbHkgbmV2ZXIgd29yay4KPiAKCkkgYW0gb24geW91ciBzaWRlLiBXZSB3
aWxsIG5lZWQgbXVsdGlwbGUgb25lcy4gQnV0IHdlIG5lZWQgc2FuZQpkZWZhdWx0cy4gQW5kIGEg
ZGVmYXVsdCBydWxlIHdpbGwgYWx3YXlzIGV4aXN0LiBBbmQgdXNlcnMgd2lsbCBleHBlY3QKdGhh
dCB0aGUgZGVmYXVsdHMgc29tZXdoYXQgbWF0Y2ggdGhlaXIgZXhwZWN0YXRpb24gdW5sZXNzIHRo
ZXkgcmVhbGx5CmhhdmUgc29tZSBzcGVjaWFsIHVzZSBjYXNlcy4KCkFsbCBJIGFtIHNheWluZyBp
cywgYWdhaW4sIHRoYXQgaWYgdXNlciBzcGFjZSBpcyB0byBtYWtlIGRlY2lzaW9ucywgaXQKc2hv
dWxkIGdldCBzdWZmaWNpZW50IGluZm9ybWF0aW9uIHRvIG1ha2Ugc2FuZSBkZWNpc2lvbi4gQW5k
IGluIG15IHBvaW50Cm9mIHZpZXcsIHRoZSB0eXBlIG9mIG1lbW9yeSBhbGxvd3MgdXMgdG8gbWFr
ZSB0aGVzZSBkZWNpc2lvbiBhbmQgdG8KcHJvdmlkZSBhICJzaW5nbGUgdWRldiBzY3JpcHQgdG8g
cnVsZSB0aGVtIGFsbCIgd2l0aCBzYW5lIGRlZmF1bHRzLgoKSSBhdCBsZWFzdCB0aGluayB0aGUg
ZGlzdGluY3Rpb24gYmV0d2VlbiAiYXV0by1vbmxpbmUiIGFuZCAic3RhbmRieSIgaXMKcmVxdWly
ZWQgKHdoYXQgRGF2ZSBzdWdnZXN0ZWQpLgoKVGhlIHdlIGNhbiBtYWtlIGEgc2ltcGxlIHJ1bGUK
CmlmIChhdXRvLW9ubGluZSBtZW1vcnkpIHsKCWlmICh2aXJ0dWFsIGVudmlyb25tZW50KSB7CgkJ
Im9ubGluZSIKCX0gZWxzZSB7CgkJIm9ubGluZV9tb3ZhYmxlIgoJfQp9Ci8qIHN0YW5kYnkgbWVt
b3J5IG5vdCBvbmxpbmVkIGFzIGRlZmF1bHQgKi8KCldlIGFyZSBhYmxlIHRvIHByb3ZpZGUgc2Fu
ZSBkZWZhdWx0cy4KCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
