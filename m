From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3] amd-iommu: remove page merging code
Date: Tue, 11 Dec 2018 11:30:53 +0000
Message-ID: <8bfae8e05ce1420bbaf16996b190f3b6@AMSPEX02CL03.citrite.net>
References: <20181128095559.5101-1-paul.durrant@citrix.com>
 <f2713f3dedf044d09c9551e837329d3c@AMSPEX02CL03.citrite.net>
 <5C0F9DEB0200007800205062@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yaMN=OU=citrix.com=prvs=87697dac6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gWgFd-000303-B1
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 11:30:57 +0000
In-Reply-To: <5C0F9DEB0200007800205062@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRv
OkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTggMTE6MjIKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogQnJpYW4gV29vZHMg
PGJyaWFuLndvb2RzQGFtZC5jb20+OyBTdXJhdmVlIFN1dGhpa3VscGFuaXQKPiA8c3VyYXZlZS5z
dXRoaWt1bHBhbml0QGFtZC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYzXSBhbWQtaW9t
bXU6IHJlbW92ZSBwYWdlIG1lcmdpbmcgY29kZQo+IAo+ID4+PiBPbiAxMS4xMi4xOCBhdCAxMjow
MCwgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+IFBpbmc/IFRoaXMgaGFzIGFj
a3MgZnJvbSBBbmR5IGFuZCBCcmlhbiBub3csIGJ1dCBoYXMgbm90IGJlZW4gY29tbWl0dGVkLgo+
IElzCj4gPiB0aGVyZSBhbnl0aGluZyBob2xkaW5nIGl0IHVwPwo+IAo+IEkga2VlcCBvdmVybG9v
a2luZyBpdCB3aGVuIGNoZWNraW5nIHdoYXQgaXMgcmVhZHkgdG8gYmUgY29tbWl0dGVkLAo+IHNv
cnJ5Lgo+IAoKSnVzdCB3YW50ZWQgdG8gbWFrZSBzdXJlIEkgZGlkbid0IG5lZWQgdG8gY2hhc2Ug
YW55b25lIGVsc2UgOi0pIEkgbmVlZCB0aGlzIGFuZCB0aGUgZmx1c2ggZWxpZGluZyB0byBtb3Zl
IG9uIHdpdGggUFYtSU9NTVUuCgogIFBhdWwKCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
