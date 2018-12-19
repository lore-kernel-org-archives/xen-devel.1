From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/3] x86/mm-locks: apply a bias to lock
 levels for current domain
Date: Wed, 19 Dec 2018 15:35:11 +0100
Message-ID: <20181219143511.2bsuposw2jnaeoi2@mac>
References: <20181218160542.56173-1-roger.pau@citrix.com>
 <20181218160542.56173-4-roger.pau@citrix.com>
 <6475a09e-07c8-cb0e-36eb-d7c024b5239f@citrix.com>
 <20181219121027.foezgrkovz7yddl2@mac>
 <3fd6258c-9a89-1764-8813-02c9b094ed8a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P3F3=O4=citrix.com=prvs=884ac7dec=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gZcwv-0001Zk-0m
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 14:35:49 +0000
Content-Disposition: inline
In-Reply-To: <3fd6258c-9a89-1764-8813-02c9b094ed8a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTksIDIwMTggYXQgMTI6MTc6NTFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8xMi8yMDE4IDEyOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
SHlwZXJjYWxscyBBRkFJSyBoYXZlIGEgc2luZ2xlIHRhcmdldCAob3Igc3ViamVjdCkgZG9tYWlu
LCBzbyBldmVuIGlmCj4gPiB0aGVyZSdzIGEgc3R1YmRvbWFpbiByZWxhdGlvbiBJJ20gbm90IHN1
cmUgSSBzZWUgd2h5IHRoYXQgd291bGQKPiA+IHJlcXVpcmUgdGhpcyBraW5kIG9mIGxvY2tpbmcs
IGFueSBkb21haW4gY2FuIHBlcmZvcm0gaHlwZXJjYWxscwo+ID4gYWdhaW5zdCBhIHNpbmdsZSBz
dWJqZWN0IGRvbWFpbiwgYW5kIHRoZSBoeXBlcnZpc29yIGl0c2VsZiBkb2Vzbid0Cj4gPiBldmVu
IGtub3cgYWJvdXQgc3R1YmRvbWFpbiByZWxhdGlvbnMuCj4gCj4gR3JhbnQgY29weSBoYXMgdHdv
IGRvbWFpbnMsIGFuZCBuZWl0aGVyIG5lZWQgdG8gYmUgdGhlIGNhbGxlZS7CoAo+IFNwZWNpZmlj
YWxseSwgd2UgZGlzY292ZXJlZCBkdXJpbmcgdGhlIFNJTE8gd29yayB0aGF0IGRvbTAgb2NjYXNv
bmFsbHkKPiBpc3N1ZXMgYSBkb20xID0+IGRvbTIgZ3JhbnQgY29weS4KCkdyYW50IGNvcHkgZG9l
c24ndCBhdHRlbXB0IHRvIGxvY2sgbXVsdGlwbGUgZG9tYWlucyBhdCB0aGUgc2FtZSB0aW1lLApp
dCB0YWtlcyBhIHJlZmVyZW5jZSBvZiBlYWNoIHBhZ2UgYW5kIG1hcHMgaXQgaW50byBYZW4gYWRk
cmVzcyBzcGFjZSwKYnV0IHRoZXJlJ3Mgbm8gY3Jvc3MgZG9tYWluIG1tIGxvY2tpbmcgYXQgYWxs
IEFGQUlDVC4gSXQncyBpbmRlZWQgYW4Kb3BlcmF0aW9uIHRoYXQgKmNvdWxkKiBkbyBpbnRlcmxl
YXZlZCBkb21haW4gbG9ja3MsIGJ1dCBpdCBkb2Vzbid0LgoKUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
