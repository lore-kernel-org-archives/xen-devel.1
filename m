From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v14 8/9] mm / iommu: include need_iommu()
 test in iommu_use_hap_pt()
Date: Thu, 04 Oct 2018 08:02:40 -0600
Message-ID: <5BB61D8002000078001EE615@prv1-mh.provo.novell.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-9-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=z6fo=mq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g84DF-0004xc-2T
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 14:02:45 +0000
In-Reply-To: <20181004104547.32316-9-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDEyOjQ1LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZSBuYW1lICdpb21tdV91c2VfaGFwX3B0JyBzdWdnZXN0cyB0aGF0IHRoYXQgUDJNIHRh
YmxlIGlzIGluIHVzZSBhcyB0aGUKPiBkb21haW4ncyBJT01NVSBwYWdldGFibGUgd2hpY2gsIHBy
aW9yIHRvIHRoaXMgcGF0Y2gsIGlzIG5vdCBzdHJpY3RseSB0cnVlCj4gc2luY2UgdGhlIG1hY3Jv
IGRpZCBub3QgdGVzdCB3aGV0aGVyIHRoZSBkb21haW4gYWN0dWFsbHkgaGFzIElPTU1VCj4gbWFw
cGluZ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0
cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
Cj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
