From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 0/2] EFI build improvements
Date: Wed, 18 Jul 2018 12:27:31 +0200
Message-ID: <20180718102733.15253-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lpv/=kc=citrix.com=prvs=730b0b06a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffjh1-0000cS-AC
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 10:28:23 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHBhdGNoZXMgc3RhcnRlZCBhcyBhIHdvcmthcm91bmQgdG8g
YnVpbGQgWGVuIHVzaW5nIGxsZAoodGhlIExMVk0gbGlua2VyKSwgYnV0IG5vdyBwYXRjaCAjMiBp
cyBhbiBpbXByb3ZlbWVudCBvZiB0aGUgYnVpbGQKc3lzdGVtLCB0aHVzIGFsbG93aW5nIHRvIGNy
ZWF0ZSBhIG11bHRpYm9vdDIgY2FwYWJsZSBFTEYgYmluYXJ5CnJlcXVpcmluZyBqdXN0IGEgY29t
cGlsZXIgdGhhdCBzdXBwb3J0cyB0aGUgTVMgQUJJLiBQcmV2aW91c2x5IGluIG9yZGVyCnRvIGJ1
aWxkIGEgbXVsdGlib290MiBjYXBhYmxlIEVMRiBiaW5hcnkgbGlua2VyIFBFIHN1cHBvcnQgd2Fz
IGFsc28KcmVxdWlyZWQuCgpUaGUgc2VyaWVzIGNhbiBiZSBmb3VuZCBhdDoKCmdpdDovL3hlbmJp
dHMueGVuLm9yZy9wZW9wbGUvcm95Z2VyL3hlbi5naXQgZWZpLnYzCgpUaGFua3MsIFJvZ2VyLgoK
Um9nZXIgUGF1IE1vbm5lICgyKToKICB4ODYvZWZpOiBtb3ZlIHRoZSBsb2dpYyB0byBkZXRlY3Qg
UEUgYnVpbGQgc3VwcG9ydAogIHg4Ni9lZmk6IHNwbGl0IGNvbXBpbGVyIHZzIGxpbmtlciBzdXBw
b3J0CgogLmdpdGlnbm9yZSAgICAgICAgICAgICAgICB8ICAxIC0KIHhlbi9hcmNoL3g4Ni9NYWtl
ZmlsZSAgICAgfCAxMCArKysrKysrKy0tCiB4ZW4vYXJjaC94ODYvZWZpL01ha2VmaWxlIHwgMTEg
KysrLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICAgfCAgNCArKystCiA0IGZpbGVz
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTguMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
