From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH] VT-d/DMAR: accept DRHD with
 non-discoverable PCI devices
Date: Thu, 21 Mar 2019 18:55:30 +0200
Message-ID: <20190321165530.GI32745@reaktio.net>
References: <1553113323-14664-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=scu7=RY=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1h70yi-00084h-3l
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 16:55:40 +0000
Content-Disposition: inline
In-Reply-To: <1553113323-14664-1-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: kevin.tian@intel.com, sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, julien.grall@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjAsIDIwMTkgYXQgMDg6MjI6MDNQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gU2luY2UgY29tbWl0IGRjZjQxNzkwICgieDg2L21tY2ZnL2RyaGQ6IE1vdmUgYWNw
aV9tbWNmZ19pbml0KCkgY2FsbAo+IGJlZm9yZSBjYWxsaW5nIGFjcGlfcGFyc2VfZG1hcigpIikg
UENJIHNlZ21lbnQgMCBpcyBub3cga25vd24gZWFybHkKPiB3aGljaCBtYWRlIHRoZSBzYW5pdHkg
Y2hlY2sgb24gRFJIRCBkZWZpbml0aW9uIHN0cnVjdHVyZSB0byB3b3JrLgo+IFRoaXMsIGluIHR1
cm4sIGNhdXNlZCBhIHJlZ3Jlc3Npb24gb24gc29tZSBtYWNoaW5lcyAoaW4gcGFydGljdWxhciwK
PiBIUCBQb3dlckVkZ2UgUjc0MCB3aXRoIEkvTyBBVCBETUEgZGlzYWJsZWQpIHdoZXJlIElPTU1V
IHdhcyBleHBsaWNpdGx5Cl5eXl4KClRoYXQncyBwcm9iYWJseSBhIHR5cG8uLiBzb3VuZHMgbGlr
ZSBpdCBzaG91bGQgc2F5ICJEZWxsIFBvd2VyRWRnZSBSNzQwIiwgbm90IEhQLi4gCgoKLS0gUGFz
aQoKPiBkaXNhYmxlZCBkdWUgdG8gc29tZSBpbnRlcm5hbCBQQ0kgZGV2aWNlcyBiZWluZyBub24t
ZGlzY292ZXJhYmxlIGJ1dAo+IHByZXNlbnQgaW4gRE1BUi4KPiAKPiBXaGlsZSB0aGlzIGlzIGlu
ZGVlZCBhIEJJT1MgbWlzdGFrZSBpdCBzZWVtcyB0byBiZSBub3QgdGhhdCBjcml0aWNhbAo+IHRv
IGRpc2FibGUgdGhlIHdob2xlIElPTU1VLiBJbnN0ZWFkLCBleHRlbmQgdGhlIHNjb3BlIG9mCj4g
Indvcmthcm91bmRfYmlvc19idWciIG9wdGlvbiBhbmQgbWFrZSBpdCBlbmFibGVkIGJ5IGRlZmF1
bHQuIFRoaXMgaXMKPiBjb25zaXN0ZW50IHdpdGggb3VyIGRvY3VtZW50YXRpb24gYW5kIGFjdHVh
bGx5IHdoYXQgYSB1c2VyIG1pZ2h0IGV4cGVjdAo+IGZyb20gYW4gb3B0aW9uIHdpdGggdGhhdCBu
YW1lLiBJdCBhbHNvIGRvZXNuJ3Qgc2VlbSBzYWZlIHRvIHNpbXBseSBpZ25vcmUKPiBEUkhEIHdp
dGhvdXQgaW5pdGlhbGl6YXRpb24gc28gcmVtb3ZlIHRoaXMgY2FzZS4gQnV0IGxlYXZlIHRoZSBv
cmlnaW5hbAo+IERNQVIgY2hlY2sgaW4gcGxhY2UgdG8gc3RpbGwgYWxsb3cgZXJyb3IgcmVwb3J0
aW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
