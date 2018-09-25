From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V2] x86/altp2m: clean up
 p2m_{get/set}_suppress_ve()
Date: Tue, 25 Sep 2018 11:09:41 +0100
Message-ID: <a73531b9-2c42-bfca-2b06-092f35d245f6@citrix.com>
References: <1537864588-18733-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cm1m=mh=citrix.com=prvs=799c446c1=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g4kHq-0003uX-M3
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 10:09:46 +0000
In-Reply-To: <1537864588-18733-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, jbeulich@suse.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jun.nakajima@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMjUvMjAxOCAwOTozNiBBTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE1vdmUgcDJt
X3tnZXQvc2V0fV9zdXBwcmVzc192ZSgpIHRvIHAybS5jLCByZXBsYWNlIGluY29ycmVjdAo+IEFT
U0VSVCgpIGluIHAybS1wdC5jIChzaW5jZSBhIGd1ZXN0IGNhbiBydW4gaW4gc2hhZG93IG1vZGUg
ZXZlbiBvbgo+IGEgc3lzdGVtIHdpdGggdmlydCBleGNlcHRpb25zLCB3aGljaCB3b3VsZCB0cmln
Z2VyIHRoZSBBU1NFUlQoKSksCj4gbW92ZSB0aGUgVk1YLWlzbXMgKGNwdV9oYXNfdm14X3ZpcnRf
ZXhjZXB0aW9ucyBjaGVja3MpIHRvCj4gcDJtX2VwdF97Z2V0L3NldH1fZW50cnkoKSwgYW5kIGZp
eCBsb2NraW5nIGNvZGUgaW4KPiBwMm1fZ2V0X3N1cHByZXNzX3ZlKCkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBs
b29rcyBnb29kLCB0aGFua3M7IGJ1dCBpdCBkb2Vzbid0IGFwcGx5IGNsZWFubHkgdG8gc3RhZ2lu
Zwphbnltb3JlLiAgQ2FuIHlvdSBkb3VibGUtY2hlY2sgdG8gbWFrZSBzdXJlIG5vdGhpbmcgaW1w
b3J0YW50IGhhcwpjaGFuZ2VkIGluIHRoZSBtb3ZlZCBmdW5jdGlvbnMgd2l0aGluIG1lbV9hY2Nl
c3MuYywgYW5kIHRoZW4gcmVzZW5kIGEKcmViYXNlZCBwYXRjaD8KClRoYW5rcywKIC1HZW9yZ2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
