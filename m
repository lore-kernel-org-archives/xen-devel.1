From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 0/2] SVM: guest state handling adjustments
Date: Fri, 4 May 2018 18:52:35 +0100
Message-ID: <77145d8e-7f06-e03f-410f-49b11ef55c03@citrix.com>
References: <5AEC773002000078001C0BCE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uf5t=hx=citrix.com=prvs=655ec5890=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fEesp-0002Bc-6v
 for xen-devel@lists.xenproject.org; Fri, 04 May 2018 17:52:39 +0000
In-Reply-To: <5AEC773002000078001C0BCE@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDUvMTggMTY6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9ubHkgcGF0Y2ggMSBpcyBj
bGVhcmx5IG1lYW50IGZvciA0LjExLiBUaGUgc2Vjb25kIHBhdGNoLCBob3dldmVyLCBlbGltaW5h
dGVzCj4gYSAodGhlb3JldGljYWwpIHdpbmRvdyB0aGUgZmlyc3QgcGF0Y2ggc3RpbGwgbGVhdmVz
LCBzbyBzaG91bGQgYXQgbGVhc3QgYmUgY29uc2lkZXJlZC4KPiBGdXJ0aGVybW9yZSBwcmV2aW91
cyBkaXNjdXNzaW9uIHN1Z2dlc3RzIHRoYXQgaXQgbWlnaHQgZXZlbiBiZSBkZXNpcmFibGUgdG8g
Zm9sZAo+IGJvdGggcGF0Y2hlcyBpbnRvIG9uZSAob3Igc3dhcCB0aGVpciBvcmRlcikuCj4KPiAx
OiByZS13b3JrIFZNQ0Igc3luYy1pbmcKPiAyOiBpbnRyb2R1Y2UgYSBWTSBlbnRyeSBoZWxwZXIK
Pgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFzIHRo
aXMgaXMgZml4aW5nIGEgcmVhbCBidWcgYW5kIHdlJ3JlIGdldHRpbmcgcXVpdGUgbGF0ZSBpbiA0
LjExIGF0CnRoaXMgcG9pbnQsIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKSSdtIHN0aWxsIG5vdCBoYXBweSB3aXRoIHRoZSBBUEksIGFuZCBlc3Bl
Y2lhbGx5IHRoYXQKInN2bV9zeW5jX3ZtY2IoY3Vyciwgdm1jYl9uZWVkc192bXNhdmUpOyIgaW4g
cGF0Y2ggdHdvIGRvZXMgbm90IGRvIHRoZQppbnR1aXRpdmUgdGhpbmcuwqAgVGhhdCBzYWlkLCBJ
J20gZ29pbmcgdG8gbmVlZCB0byByZXdyaXRlIHRoaXMgYW55d2F5IGluCjQuMTIgdG8gZ2V0IHRo
ZSBNU1IgaW5mcmFzdHJ1Y3R1cmUgd29ya2luZywgc28gdGhpcyBjb2RlIGlzbid0IGdvaW5nIHRv
CnN0YXkgbG9uZy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
