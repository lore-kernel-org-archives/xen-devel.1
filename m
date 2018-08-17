From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC 1/2] drivers/base: export
 lock_device_hotplug/unlock_device_hotplug
Date: Fri, 17 Aug 2018 10:41:46 +0200
Message-ID: <20180817084146.GB14725__45309.3708180406$1534495235$gmane$org@kroah.com>
References: <20180817075901.4608-1-david@redhat.com>
 <20180817075901.4608-2-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jc64=la=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1fqaKP-00032J-6c
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 08:41:53 +0000
Content-Disposition: inline
In-Reply-To: <20180817075901.4608-2-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "K . Y . Srinivasan" <kys@microsoft.com>, linux-s390@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, devel@linuxdriverproject.org, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDk6NTk6MDBBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gRnJvbTogVml0YWx5IEt1em5ldHNvdiA8dmt1em5ldHNAcmVkaGF0LmNvbT4K
PiAKPiBXZWxsIHJlcXVpcmUgdG8gY2FsbCBhZGRfbWVtb3J5KCkvYWRkX21lbW9yeV9yZXNvdXJj
ZSgpIHdpdGgKPiBkZXZpY2VfaG90cGx1Z19sb2NrIGhlbGQsIHRvIGF2b2lkIGEgbG9jayBpbnZl
cnNpb24uIEFsbG93IGV4dGVybmFsIG1vZHVsZXMKPiAoZS5nLiBodl9iYWxsb29uKSB0aGF0IG1h
a2UgdXNlIG9mIGFkZF9tZW1vcnkoKS9hZGRfbWVtb3J5X3Jlc291cmNlKCkgdG8KPiBsb2NrIGRl
dmljZSBob3RwbHVnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpdGFseSBLdXpuZXRzb3YgPHZrdXpu
ZXRzQHJlZGhhdC5jb20+Cj4gW21vZGlmeSBwYXRjaCBkZXNjcmlwdGlvbl0KPiBTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9iYXNlL2NvcmUuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jhc2UvY29yZS5jIGIvZHJpdmVycy9iYXNlL2NvcmUu
Ywo+IGluZGV4IDA0YmJjZDc3OWUxMS4uOTAxMGI5ZTk0MmI1IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvYmFzZS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL2Jhc2UvY29yZS5jCj4gQEAgLTcwMCwxMSAr
NzAwLDEzIEBAIHZvaWQgbG9ja19kZXZpY2VfaG90cGx1Zyh2b2lkKQo+ICB7Cj4gIAltdXRleF9s
b2NrKCZkZXZpY2VfaG90cGx1Z19sb2NrKTsKPiAgfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChsb2Nr
X2RldmljZV9ob3RwbHVnKTsKPiAgCj4gIHZvaWQgdW5sb2NrX2RldmljZV9ob3RwbHVnKHZvaWQp
Cj4gIHsKPiAgCW11dGV4X3VubG9jaygmZGV2aWNlX2hvdHBsdWdfbG9jayk7Cj4gIH0KPiArRVhQ
T1JUX1NZTUJPTF9HUEwodW5sb2NrX2RldmljZV9ob3RwbHVnKTsKCklmIHRoZXNlIGFyZSBnb2lu
ZyB0byBiZSAiZ2xvYmFsIiBzeW1ib2xzLCBsZXQncyBwcm9wZXJseSBuYW1lIHRoZW0uCmRldmlj
ZV9ob3RwbHVnX2xvY2svdW5sb2NrIHdvdWxkIGJlIGJldHRlci4gIEJ1dCBJIGFtIF9yZWFsbHlf
IG5lcnZvdXMKYWJvdXQgbGV0dGluZyBzdHVmZiBvdXRzaWRlIG9mIHRoZSBkcml2ZXIgY29yZSBt
ZXNzIHdpdGggdGhpcywgYXMgcGVvcGxlCmJldHRlciBrbm93IHdoYXQgdGhleSBhcmUgZG9pbmcu
CgpDYW4ndCB3ZSBqdXN0ICJsb2NrIiB0aGUgbWVtb3J5IHN0dWZmIGluc3RlYWQ/ICBXaHkgZG9l
cyB0aGUgZW50aXJldHkgb2YKdGhlIGRyaXZlciBjb3JlIG5lZWQgdG8gYmUgbWVzc2VkIHdpdGgg
aGVyZT8KCnRoYW5rcywKCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
