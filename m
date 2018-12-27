From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/e820: do not fixup memmap in
 copy_e820_map
Date: Thu, 27 Dec 2018 21:01:06 +0000
Message-ID: <e0e71275-4884-4739-67ad-66f30d38e051@citrix.com>
References: <20181227155614.42292-1-roger.pau@citrix.com>
 <20181227155614.42292-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8dHC=PE=citrix.com=prvs=89228f4dd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gccmE-0004G4-9z
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 21:01:10 +0000
In-Reply-To: <20181227155614.42292-3-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTIvMjAxOCAxNTo1NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFuZCBpbnN0ZWFk
IGludHJvZHVjZSBhIG5ldyBoZWxwZXIgdG8gbWFyayB0aGUgbG93IDFNQiBWR0EvUk9NIHJlZ2lv
bgo+IGFzIHJlc2VydmVkLiBOb3RlIHRoaXMgbWlnaHQgYmUgYSBzbGlnaHQgY2hhbmdlIGZyb20g
Y3VycmVudCBmdW5jdGlvbmFsaXR5Cj4gd2hlcmUgY29weV9lODIwX21hcCB3b3VsZCBqdXN0IGxl
YXZlIGEgaG9sZSBpbiB0aGUgWzY0MEtCLCAxTUIpIHJlZ2lvbgo+IGlmIGl0IHdhcyBmb3VuZCB0
byBiZSByZXBvcnRlZCBhcyBSQU0gaW4gdGhlIG1lbW9yeSBtYXAuCj4KPiBObyBmdW5jdGlvbmFs
IGNoYW5nZSBleHBlY3RlZCBvdmVyYWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpJIHRoaW5rIHlvdXIgY29tbWl0IG1lc3NhZ2Ug
aXMgc3RhbGUgZnJvbSB0aGUgcHJpdmF0ZSB2MS4KCk90aGVyd2lzZSwgTEdUTS4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
