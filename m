From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC 1/2] drivers/base: export
 lock_device_hotplug/unlock_device_hotplug
Date: Fri, 17 Aug 2018 19:02:39 +0200
Message-ID: <20180817170239.GF24945__27955.0185813152$1534525314$gmane$org@kroah.com>
References: <20180817075901.4608-1-david@redhat.com>
 <20180817075901.4608-2-david@redhat.com>
 <20180817084146.GB14725@kroah.com>
 <5a5d73e9-e4aa-ffed-a2e3-8aef64e61923@redhat.com>
 <CAJZ5v0gkYV8o2Eq+EcGT=OP1tQGPGVVe3n9VGD6z7KAVVqhv9w@mail.gmail.com>
 <42df9062-f647-3ad6-5a07-be2b99531119@redhat.com>
 <20180817100604.GA18164@kroah.com>
 <4ac624be-d2d6-5975-821f-b20a475781dc@redhat.com>
 <20180817112850.GB3565@osiris>
 <ecc08303-96ee-76ad-fba4-0425413afa5a@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jc64=la=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1fqi96-0004tE-Sa
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 17:02:44 +0000
Content-Disposition: inline
In-Reply-To: <ecc08303-96ee-76ad-fba4-0425413afa5a@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux Memory Management List <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, linux-s390@vger.kernel.org, sthemmin@microsoft.com, Pavel Tatashin <pasha.tatashin@oracle.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, haiyangz@microsoft.com, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, devel@linuxdriverproject.org, Vitaly Kuznetsov <vkuznets@redhat.com>linu
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDE6NTY6MzVQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gRS5nLiBXaGVuIGFkZGluZyB0aGUgbWVtb3J5IGJsb2NrIGRldmljZXMsIHdl
IGtub3cgdGhhdCB0aGVyZSB3b24ndCBiZSBhCj4gZHJpdmVyIHRvIGF0dGFjaCB0byAoYXMgdGhl
cmUgYXJlIG5vIGRyaXZlcnMgZm9yIHRoZSAibWVtb3J5IiBzdWJzeXN0ZW0pCj4gLSB0aGUgYnVz
X3Byb2JlX2RldmljZSgpIGZ1bmN0aW9uIHRoYXQgdGFrZXMgdGhlIGRldmljZV9sb2NrKCkgY291
bGQKPiBwcmV0dHkgbXVjaCBiZSBhdm9pZGVkIGZvciB0aGF0IGNhc2UuIEJ1dCBidXJ5aW5nIHN1
Y2ggc3BlY2lhbCBjYXNlcwo+IGRvd24gaW4gY29yZSBkcml2ZXIgY29kZSBkZWZpbml0ZWx5IHdv
bid0IG1ha2UgbG9ja2luZyByZWxhdGVkIHRvIG1lbW9yeQo+IGhvdHBsdWcgZWFzaWVyLgoKWW91
IGRvbid0IGhhdmUgdG8gaGF2ZSBhIGRyaXZlciBmb3IgYSBkZXZpY2UgaWYgeW91IGRvbid0IHdh
bnQgdG8sIG9yCnlvdSBjYW4ganVzdCBoYXZlIGEgZGVmYXVsdCBvbmUgZm9yIGFsbCBtZW1vcnkg
ZGV2aWNlcyBpZiB5b3Ugc29tZWhvdwpuZWVkIGl0LiAgTm8gcmVhc29uIHRvIG5vdCBkbyB0aGlz
IGlmIGl0IG1ha2VzIHRoaW5ncyBlYXNpZXIgZm9yIHlvdS4KCnRoYW5rcywKCmdyZWcgay1oCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
