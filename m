From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH V5] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Fri, 28 Sep 2018 10:04:55 +0100
Message-ID: <20180928090455.ekpqcreew2uegn4s@zion.uk.xensource.com>
References: <1537947263-8469-1-git-send-email-rcojocaru@bitdefender.com>
 <f04e2217-ee7b-6ade-af17-f87952fe72c5@bitdefender.com>
 <1deabccf-a9e9-186a-9595-5a9790de37d2@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5ohn-0003V7-DU
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 09:04:59 +0000
Content-Disposition: inline
In-Reply-To: <1deabccf-a9e9-186a-9595-5a9790de37d2@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, konrad.wilk@oracle.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Adrian Pop <apop@bitdefender.com>, tim@xen.org, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMDM6MjY6MjBQTSArMDMwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IGJ1dCBpcyBpdCBPSyB0aGF0IHRoZSBoeXBlcnZpc29yIGJ1aWxkcyB3aXRoIGEg
c2V0IG9mIGZsYWdzIHRoYXQKPiBpbmNsdWRlcyBDT05GSUdfSFZNIGFuZCB0aGUgZmlybXdhcmUg
Y29kZSB3aXRoIGEgc2V0IHRoYXQgZG9lc24ndD8KClRvIGFuc3dlciB0aGlzIHF1ZXN0aW9uOiB5
ZXMsIGl0IGlzIE9LIHRvIGRvIHRoYXQuIEFuZCB0aGF0J3MgZGVsaWJlcmF0ZQpmb3IgdGhlIHNo
aW0gYmVjYXVzZSBpdCBkb2Vzbid0IG5lZWQgYW55IEhWTSBpbnRlcmZhY2VzLiBKYW4gaGFzIGdp
dmVuCnRoZSByZWFzb24gd2h5IHlvdXIgYnVpbGQgZmFpbGVkIGluIGhpcyByZXBsaWVzLgoKVGhp
cyBidWlsZCBmYWlsdXJlIGp1c3QgZXhwb3NlZCBob3cgbXVjaCB3ZSB0b29rIGZvciBncmFudGVk
IHNvbWUgY29kZQppcyBhbHdheXMgdGhlcmUuIDopCgpXZWkuCgo+IAo+IAo+IFRoYW5rcywKPiBS
YXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
