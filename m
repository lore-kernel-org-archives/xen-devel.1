From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
Date: Fri, 24 May 2019 17:35:36 +0100
Message-ID: <1094325b-65b4-84fe-4c5c-cba21f2f1dc3@citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KQqo=TY=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hUDAZ-0007Fx-32
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 16:35:47 +0000
In-Reply-To: <20190507151458.29350-14-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS83LzE5IDQ6MTQgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBUaGUgZmlyc3QgcGFyYW1l
dGVyIG9mIHtzLGd9ZXRfZ3Bmbl9mcm9tX21mbigpIGlzIGFuIE1GTiwgc28gaXQgY2FuIGJlCj4g
c3dpdGNoZWQgdG8gdXNlIHRoZSB0eXBlc2FmZS4KPiAKPiBBdCB0aGUgc2FtZSB0aW1lLCByZXBs
YWNlIGdwZm4gd2l0aCBwZm4gaW4gdGhlIGhlbHBlcnMgYXMgdGhleSBhbGwgZGVhbAo+IHdpdGgg
UEZOIGFuZCBhbHNvIHR1cm4gdGhlIG1hY3JvcyB0byBzdGF0aWMgaW5saW5lLgo+IAo+IE5vdGUg
dGhhdCB0aGUgcmV0dXJuIG9mIHRoZSBnZXR0ZXIgYW5kIHRoZSAybmQgcGFyYW1ldGVyIG9mIHRo
ZSBzZXR0ZXIKPiBoYXZlIG5vdCBiZWVuIGNvbnZlcnRlZCB0byB1c2UgdHlwZXNhZmUgUEZOIGJl
Y2F1c2UgaXQgd2FzIHJlcXVpcmluZwo+IG1vcmUgY2hhbmdlcyB0aGFuIGV4cGVjdGVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpGb3Ig
dGhlIG1tIGJpdHMsIEknbSBoYXBweSBmb3IgdGhpcyB0byBiZSBjaGVja2VkIGluIGFzLWlzLCBv
ciB3aXRoIGFueQpvZiB0aGUgY2hhbmdlcyBwcm9wb3NlZCBpbiB0aGlzIHN1Yi10aHJlYWQ6CgpB
Y2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKU29ycnkg
Zm9yIHRha2luZyBzbyBsb25nIHRvIGdldCB0byB0aGlzLCBhbmQgdGhhbmtzIGZvciB0YWtpbmcg
b24gdGhpcwpmYWlybHkgbW9udW1lbnRhbCB0YXNrLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
