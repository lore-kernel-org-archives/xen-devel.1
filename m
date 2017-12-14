From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v14 07/11] x86/mm: add an extra command to
 HYPERVISOR_mmu_update...
Date: Thu, 14 Dec 2017 06:50:22 -0700
Message-ID: <5A328FAE0200007800197576@prv-mh.provo.novell.com>
References: <20171128150853.1927-1-paul.durrant@citrix.com>
 <20171128150853.1927-8-paul.durrant@citrix.com>
 <5A2FE6C00200007800196D55@prv-mh.provo.novell.com>
 <12625ce1-047a-22b9-d196-37dbc5361060@citrix.com>
 <5A2FF80F0200007800196DBF@prv-mh.provo.novell.com>
 <94b66b2b4cc84aa3b37505e2bb8955c3@AMSPEX02CL03.citrite.net>
 <5A3148D90200007800197298@prv-mh.provo.novell.com>
 <268adb4590bc43c0a98ab027cb4744fc@AMSPEX02CL03.citrite.net>
 <5A31545302000078001972D9@prv-mh.provo.novell.com>
 <896e6087717e450cadaa6adbdd9d4d44@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vj35=dk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ePTu4-0002P9-D6
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 13:50:24 +0000
In-Reply-To: <896e6087717e450cadaa6adbdd9d4d44@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim(Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE3IGF0IDE4OjAzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IExvb2tpbmcgdGhyb3VnaCB0aGUgY29kZSwgdGhlIG9ubHkgb25lIHRoaW5nIHRoYXQgYm90
aGVycyBtZSBpcyB0aGUgCj4gcGFnZV9zZXRfb3duZXIoKSBkb25lIGluIHNoYWRvd19lbmFibGUo
KSBmb3IgdGhlIHBhZ2UgdXNlZCBmb3IgSFZNIGd1ZXN0IAo+IHZjcHVzIHRoYXQgaGF2ZSBwYWdp
bmcgZGlzYWJsZWQuIEFGQUlDVCB0aGF0IHBhZ2Ugd291bGQgYmVjb21lIG1hcHBhYmxlIGJ5IGFu
IAo+IGVtdWxhdGluZyBkb21haW4gd2l0aCBNTVVfUFRfVVBEQVRFX05PX1RSQU5TTEFURSwgaWYg
aXQgZmlndXJlZCBvdXQgb3IgCj4gZ3Vlc3NlZCB0aGUgY29ycmVjdCBNRk4sIGJ1dCBJJ20gbm90
IHN1cmUgd2hldGhlciBkYW1hZ2UgY291bGQgYmUgZG9uZSB0byBYZW4gCj4gdXNpbmcgdGhhdC4K
Ckkgd2FzIGFmcmFpZCBvZiBhIHByb2JsZW0gaGVyZSB0b28sIGJ1dCBUaW0gZGlkIGNvbnZpbmNl
IG1lIHRoYXQKdGhlcmUncyBubyBwcm9ibGVtIGFzIHRoaXMgaXMgYSBwYWdlIHRhYmxlIGJlaW5n
IHNoYWRvd2VkLCBub3QgYQpwYWdlIHRhYmxlIHRoZSBndWVzdCBhY3R1YWxseSBydW5zIG9uLiBD
b3JydXB0aW5nIHRoZSBwYWdlJ3MKY29udGVudHMgd291bGQgb25seSBhZmZlY3QgdGhlIGd1ZXN0
IChqdXN0IGxpa2UgaXMgdGhlIGNhc2UgZm9yIGFueQpvdGhlciBndWVzdCBwYWdlIHRhYmxlcyku
CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
