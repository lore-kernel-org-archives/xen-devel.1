From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v6 05/12] microcode: only save compatible
 ucode patches
Date: Tue, 12 Mar 2019 18:03:24 +0100
Message-ID: <20190312170324.2isdrheecdrpo3yp@Air-de-Roger>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-6-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X81M=RP=citrix.com=prvs=96733c0e6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1h3l6A-0007MT-Db
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 17:21:54 +0000
Content-Disposition: inline
In-Reply-To: <1552291056-20286-6-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMDM6NTc6MjlQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gSW50ZWwgQ1BVIG9ubHkgYWxsb3dzIG1peGluZyBpbiBzdGVwcGluZyBvciAncGYnLiBJZiBh
biB1Y29kZSBwYXRjaCBpcwo+IGZvciBvdGhlciBDUFUgZmFtaWxpZXMgb3IgbW9kZWxzLCBpdCB3
b24ndCBiZSBjb21wYXRpYmxlIHRvIGFsbCBDUFVzIG9uCj4gY3VycmVudCBzeXN0ZW0gYW5kIGV2
ZW4gaG90LXBsdWdnZWQgQ1BVcy4gIERvbid0IHNhdmUgc3VjaCBwYXRjaCB0bwo+IHJlZHVjZSB0
aGUgc2l6ZSBvZiB1Y29kZSBjYWNoZS4KCk9oLCBzbyB3ZSBhcmUgaW5kZWVkIGFpbWluZyB0byBz
dXBwb3J0IHN5c3RlbXMgdGhhdCBjYW4gcmVxdWlyZSBDUFVzCnRvIHVzZSBkaWZmZXJlbnQgbWlj
cm9jb2RlIGJsb2JzIGluIG9yZGVyIHRvIHVwZGF0ZT8KCklmIHRoYXQncyB0aGUgY2FzZSwgYW5k
IHdlIGFyZSBzdXJlIHRoaXMgd2lsbCB3b3JrLCB3ZSBkbyBpbmRlZWQgbmVlZAphIGxpc3Qgb2Yg
bWljcm9jb2RlcywgYnV0IHlvdSB3aWxsIGhhdmUgdG8gc29tZWhvdyBmbGFnIGFwcGxpZWQKbWlj
cm9jb2RlcyBpbiBvcmRlciB0byBwcmV2ZW50IHRoZW0gZnJvbSBiZWluZyByZXBsYWNlZCB3aXRo
IG5ldwptaWNyb2NvZGUgdmVyc2lvbnMgdW50aWwgWGVuIGtub3dzIHRoYXQgc3VjaCBuZXcgdmVy
c2lvbnMgYXBwbHkKY29ycmVjdGx5LgoKTWF5YmUgSSdtIGJlaW5nIHRvbyBzaW1wbGlzdGljIGhl
cmUsIGJ1dCBkb2VzIGFueW9uZSByZWFsbHkgaGF2ZSBhCnN5c3RlbSB3aXRoIENQVXMgd2l0aCBk
aWZmZXJlbnQgc3RlcHBpbmc/CgpTdXBwb3J0aW5nIHN1Y2ggc2NlbmFyaW8gYWRkcyBxdWl0ZSBh
IGxvdCBvZiBjb21wbGV4aXR5IGFuZCBldmVuIGlmCnRoZW9yZXRpY2FsbHkgcG9zc2libGUgSSBk
b24ndCB0aGluayBpdCBtYWtlcyBtdWNoIHNlbnNlIHRvIHN1cHBvcnQKdW5sZXNzIHRoZXJlIGFy
ZSBzdWNoIHN5c3RlbXMgb3V0IHRoZXJlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
