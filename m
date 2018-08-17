From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH RFC 1/2] drivers/base: export
 lock_device_hotplug/unlock_device_hotplug
Date: Fri, 17 Aug 2018 13:28:50 +0200
Message-ID: <20180817112850.GB3565__7845.0696812526$1534505270$gmane$org@osiris>
References: <20180817075901.4608-1-david@redhat.com>
 <20180817075901.4608-2-david@redhat.com>
 <20180817084146.GB14725@kroah.com>
 <5a5d73e9-e4aa-ffed-a2e3-8aef64e61923@redhat.com>
 <CAJZ5v0gkYV8o2Eq+EcGT=OP1tQGPGVVe3n9VGD6z7KAVVqhv9w@mail.gmail.com>
 <42df9062-f647-3ad6-5a07-be2b99531119@redhat.com>
 <20180817100604.GA18164@kroah.com>
 <4ac624be-d2d6-5975-821f-b20a475781dc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oyqn=la=de.ibm.com=heiko.carstens@srs-us1.protection.inumbo.net>)
 id 1fqcwD-00047X-6c
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 11:29:05 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7HBNvHa143539
 for <xen-devel@lists.xenproject.org>; Fri, 17 Aug 2018 07:29:03 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kwuyc3ks9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Aug 2018 07:29:03 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <heiko.carstens@de.ibm.com>;
 Fri, 17 Aug 2018 12:29:01 +0100
In-Reply-To: <4ac624be-d2d6-5975-821f-b20a475781dc@redhat.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linux Memory Management List <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, linux-s390@vger.kernel.org, sthemmin@microsoft.com, Pavel Tatashin <pasha.tatashin@oracle.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, haiyangz@microsoft.com, Dan Williams <dan.j.williams@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDE6MDQ6NThQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gPj4gSWYgdGhlcmUgYXJlIG5vIG9iamVjdGlvbnMsIEknbGwgZ28gaW50byB0
aGF0IGRpcmVjdGlvbi4gQnV0IEknbGwgd2FpdAo+ID4+IGZvciBtb3JlIGNvbW1lbnRzIHJlZ2Fy
ZGluZyB0aGUgZ2VuZXJhbCBjb25jZXB0IGZpcnN0Lgo+ID4gCj4gPiBJdCBpcyB0aGUgbWlkZGxl
IG9mIHRoZSBtZXJnZSB3aW5kb3csIGFuZCBtYWludGFpbmVycyBhcmUgcmVhbGx5IGJ1c3kKPiA+
IHJpZ2h0IG5vdy4gIEkgZG91YnQgeW91IHdpbGwgZ2V0IG1hbnkgcmV2aWV3IGNvbW1lbnRzIGp1
c3QgeWV0Li4uCj4gPiAKPiAKPiBUaGlzIGhhcyBiZWVuIGJyb2tlbiBzaW5jZSAyMDE1LCBzbyBJ
IGd1ZXNzIGl0IGNhbiB3YWl0IGEgYml0IDopCgpJIGhvcGUgeW91IGZpZ3VyZWQgb3V0IHdoYXQg
bmVlZHMgdG8gYmUgbG9ja2VkIHdoeS4gWW91ciBwYXRjaCBkZXNjcmlwdGlvbgpzZWVtcyB0byBi
ZSAib25seSIgYWJvdXQgbG9ja2luZyBvcmRlciA7KQoKSSB0cmllZCB0byBmaWd1cmUgb3V0IGFu
ZCBkb2N1bWVudCB0aGF0IHBhcnRpYWxseSB3aXRoIDU1YWRjMWQwNWRjYSAoIm1tOgphZGQgcHJp
dmF0ZSBsb2NrIHRvIHNlcmlhbGl6ZSBtZW1vcnkgaG90cGx1ZyBvcGVyYXRpb25zIiksIGFuZCB0
aGF0IHdhc24ndAplYXN5IHRvIGZpZ3VyZSBvdXQuIEkgd2FzIGVzcGVjaWFsbHkgY29uY2VybmVk
IGFib3V0IHNwcmlua2xpbmcKbG9jay91bmxvY2tfZGV2aWNlX2hvdHBsdWcoKSBjYWxscywgd2hp
Y2ggaGFzIHRoZSBwb3RlbnRpYWwgdG8gbWFrZSBpdCB0aGUKbmV4dCBCS0wgdGhpbmcuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
