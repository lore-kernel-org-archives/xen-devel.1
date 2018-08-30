From: Pasha Tatashin <Pavel.Tatashin@microsoft.com>
Subject: Re: [PATCH RFCv2 1/6] mm/memory_hotplug: make
 remove_memory() take the device_hotplug_lock
Date: Thu, 30 Aug 2018 19:35:48 +0000
Message-ID: <46a0119b-da16-0203-a8c2-d127738517f4__14937.5875051648$1535657704$gmane$org@microsoft.com>
References: <20180821104418.12710-1-david@redhat.com>
 <20180821104418.12710-2-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uez1=ln=microsoft.com=pavel.tatashin@srs-us1.protection.inumbo.net>)
 id 1fvSjS-0007LQ-Dd
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 19:35:54 +0000
In-Reply-To: <20180821104418.12710-2-david@redhat.com>
Content-Language: en-US
Content-ID: <DCFCA70729284F4B88E5C6C04E0B640A@namprd21.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc: Michal Hocko <mhocko@suse.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>, Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@ellerman.id.au>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Len Brown <lenb@kernel.org>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Mathieu Malaterre <malat@debian.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>"linux-kernel@vger.kernel.org" <l>
List-Id: xen-devel@lists.xenproject.org

PiArDQo+ICt2b2lkIF9fcmVmIHJlbW92ZV9tZW1vcnkoaW50IG5pZCwgdTY0IHN0YXJ0LCB1NjQg
c2l6ZSkNCg0KUmVtb3ZlIF9fcmVmLCBvdGhlcndpc2UgbG9va3MgZ29vZDoNCg0KUmV2aWV3ZWQt
Ynk6IFBhdmVsIFRhdGFzaGluIDxwYXZlbC50YXRhc2hpbkBtaWNyb3NvZnQuY29tPg0KDQo+ICt7
DQo+ICsJbG9ja19kZXZpY2VfaG90cGx1ZygpOw0KPiArCV9fcmVtb3ZlX21lbW9yeShuaWQsIHN0
YXJ0LCBzaXplKTsNCj4gKwl1bmxvY2tfZGV2aWNlX2hvdHBsdWcoKTsNCj4gK30NCj4gIEVYUE9S
VF9TWU1CT0xfR1BMKHJlbW92ZV9tZW1vcnkpOw0KPiAgI2VuZGlmIC8qIENPTkZJR19NRU1PUllf
SE9UUkVNT1ZFICovDQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
