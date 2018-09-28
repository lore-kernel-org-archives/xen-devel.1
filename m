From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V5] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Fri, 28 Sep 2018 12:16:03 +0300
Message-ID: <c37c274e-b846-e00e-d8f2-f97805b8b922@bitdefender.com>
References: <1537947263-8469-1-git-send-email-rcojocaru@bitdefender.com>
 <f04e2217-ee7b-6ade-af17-f87952fe72c5@bitdefender.com>
 <1deabccf-a9e9-186a-9595-5a9790de37d2@bitdefender.com>
 <20180928090455.ekpqcreew2uegn4s@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=agq7=mk=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g5osX-0004Jj-LI
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 09:16:05 +0000
In-Reply-To: <20180928090455.ekpqcreew2uegn4s@zion.uk.xensource.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: tamas@tklengyel.com, konrad.wilk@oracle.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Adrian Pop <apop@bitdefender.com>, tim@xen.org, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8yOC8xOCAxMjowNCBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIFNlcCAyNiwgMjAx
OCBhdCAwMzoyNjoyMFBNICswMzAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IGJ1dCBpcyBp
dCBPSyB0aGF0IHRoZSBoeXBlcnZpc29yIGJ1aWxkcyB3aXRoIGEgc2V0IG9mIGZsYWdzIHRoYXQK
Pj4gaW5jbHVkZXMgQ09ORklHX0hWTSBhbmQgdGhlIGZpcm13YXJlIGNvZGUgd2l0aCBhIHNldCB0
aGF0IGRvZXNuJ3Q/Cj4gCj4gVG8gYW5zd2VyIHRoaXMgcXVlc3Rpb246IHllcywgaXQgaXMgT0sg
dG8gZG8gdGhhdC4gQW5kIHRoYXQncyBkZWxpYmVyYXRlCj4gZm9yIHRoZSBzaGltIGJlY2F1c2Ug
aXQgZG9lc24ndCBuZWVkIGFueSBIVk0gaW50ZXJmYWNlcy4gSmFuIGhhcyBnaXZlbgo+IHRoZSBy
ZWFzb24gd2h5IHlvdXIgYnVpbGQgZmFpbGVkIGluIGhpcyByZXBsaWVzLgo+IAo+IFRoaXMgYnVp
bGQgZmFpbHVyZSBqdXN0IGV4cG9zZWQgaG93IG11Y2ggd2UgdG9vayBmb3IgZ3JhbnRlZCBzb21l
IGNvZGUKPiBpcyBhbHdheXMgdGhlcmUuIDopCgpJIHVuZGVyc3RhbmQuIFRoYW5rcyBmb3IgdGhl
IHJlcGx5ISBJbiB0aGF0IGNhc2UsIFY2IHNob3VsZCBiZSBjb3JyZWN0CmluIHRoYXQgcmVzcGVj
dCwgc28gd2hlbiB5b3UgaGF2ZSB0aGUgdGltZSBwbGVhc2UgY29uc2lkZXIgdGhhdCB2ZXJzaW9u
CmZvciByZXZpZXcuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
