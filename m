From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 05/12] microcode: only save compatible
 ucode patches
Date: Wed, 13 Mar 2019 01:45:20 -0600
Message-ID: <5C88B510020000780021DF38@prv1-mh.provo.novell.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-6-git-send-email-chao.gao@intel.com>
 <20190312170324.2isdrheecdrpo3yp@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3yZr-0005pV-Q4
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 07:45:27 +0000
In-Reply-To: <20190312170324.2isdrheecdrpo3yp@Air-de-Roger>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAzLjE5IGF0IDE4OjAzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTWFyIDExLCAyMDE5IGF0IDAzOjU3OjI5UE0gKzA4MDAsIENoYW8gR2FvIHdyb3Rl
Ogo+PiBJbnRlbCBDUFUgb25seSBhbGxvd3MgbWl4aW5nIGluIHN0ZXBwaW5nIG9yICdwZicuIElm
IGFuIHVjb2RlIHBhdGNoIGlzCj4+IGZvciBvdGhlciBDUFUgZmFtaWxpZXMgb3IgbW9kZWxzLCBp
dCB3b24ndCBiZSBjb21wYXRpYmxlIHRvIGFsbCBDUFVzIG9uCj4+IGN1cnJlbnQgc3lzdGVtIGFu
ZCBldmVuIGhvdC1wbHVnZ2VkIENQVXMuICBEb24ndCBzYXZlIHN1Y2ggcGF0Y2ggdG8KPj4gcmVk
dWNlIHRoZSBzaXplIG9mIHVjb2RlIGNhY2hlLgo+IAo+IE9oLCBzbyB3ZSBhcmUgaW5kZWVkIGFp
bWluZyB0byBzdXBwb3J0IHN5c3RlbXMgdGhhdCBjYW4gcmVxdWlyZSBDUFVzCj4gdG8gdXNlIGRp
ZmZlcmVudCBtaWNyb2NvZGUgYmxvYnMgaW4gb3JkZXIgdG8gdXBkYXRlPwo+IAo+IElmIHRoYXQn
cyB0aGUgY2FzZSwgYW5kIHdlIGFyZSBzdXJlIHRoaXMgd2lsbCB3b3JrLCB3ZSBkbyBpbmRlZWQg
bmVlZAo+IGEgbGlzdCBvZiBtaWNyb2NvZGVzLCBidXQgeW91IHdpbGwgaGF2ZSB0byBzb21laG93
IGZsYWcgYXBwbGllZAo+IG1pY3JvY29kZXMgaW4gb3JkZXIgdG8gcHJldmVudCB0aGVtIGZyb20g
YmVpbmcgcmVwbGFjZWQgd2l0aCBuZXcKPiBtaWNyb2NvZGUgdmVyc2lvbnMgdW50aWwgWGVuIGtu
b3dzIHRoYXQgc3VjaCBuZXcgdmVyc2lvbnMgYXBwbHkKPiBjb3JyZWN0bHkuCj4gCj4gTWF5YmUg
SSdtIGJlaW5nIHRvbyBzaW1wbGlzdGljIGhlcmUsIGJ1dCBkb2VzIGFueW9uZSByZWFsbHkgaGF2
ZSBhCj4gc3lzdGVtIHdpdGggQ1BVcyB3aXRoIGRpZmZlcmVudCBzdGVwcGluZz8KCkkgdGhpbmsg
dGhlIHByaW1hcnkgc2NlbmFyaW8gaXMgdG8gc2VlIGEgbmV3ZXIgc3RlcHBpbmcgQ1BVIGFkZGVk
CmludG8gYSBzbGlnaHRseSBvbGRlciBzeXN0ZW0gKGhvdHBsdWcgb3Igbm90KS4gV2hldGhlciBw
ZW9wbGUKYWN0dWFsbHkgZG8gdGhpcyBJIGRvbid0IGtub3csIGJ1dCBJIHN1c3BlY3QgdGhlcmUn
cyBhIHJlYXNvbiBodwp2ZW5kb3JzIHN0YXRlIHdoYXQgY29tYmluYXRpb25zIGFyZSBzdXBwb3J0
ZWQuCgo+IFN1cHBvcnRpbmcgc3VjaCBzY2VuYXJpbyBhZGRzIHF1aXRlIGEgbG90IG9mIGNvbXBs
ZXhpdHkgYW5kIGV2ZW4gaWYKPiB0aGVvcmV0aWNhbGx5IHBvc3NpYmxlIEkgZG9uJ3QgdGhpbmsg
aXQgbWFrZXMgbXVjaCBzZW5zZSB0byBzdXBwb3J0Cj4gdW5sZXNzIHRoZXJlIGFyZSBzdWNoIHN5
c3RlbXMgb3V0IHRoZXJlLgoKV2hhdCBjb21wbGV4aXR5IGFyZSB5b3UgdGhpbmtpbmcgYWJvdXQ/
IE9mIGNvdXJzZSB0aGUgZXhwZWN0YXRpb24KaXMgZm9yIGhvdHBsdWdnZWQgQ1BVcyB0byBoYXZl
IGFsbCBmZWF0dXJlcyBhbHJlYWR5IHByZXNlbnQgQ1BVcwpoYXZlLiBBbmQgb2YgdGhlIG9uZXMg
d2UgZmluZCBhdCBib290IHdlIHNldHRsZSBvbiBhIGNvbW1vbgptaW5pbXVtIHNldCBvZiBmZWF0
dXJlcyAob3IgYXQgbGVhc3Qgd2UgdHJ5IHRvKSwgYnV0IGluIG1peGVkLQpzdGVwcGluZyBzeXN0
ZW1zIHRoZSBjb21tb24gc2l0dWF0aW9uIHdvdWxkIGFueXdheSBiZSB0aGF0CnRoZXkncmUgYWxs
IGVxdWFsIGluIHRlcm1zIG9mIHNvZnR3YXJlIHZpc2libGUgZmVhdHVyZXMuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
