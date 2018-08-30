From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/grant: Mute gcc warning in
 steal_linear_address()
Date: Thu, 30 Aug 2018 09:02:45 +0100
Message-ID: <6e6f0f6c-8794-ac0a-770b-d4835731b657@citrix.com>
References: <037428ab-4f89-4068-9ad4-1ded955cf9fd@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <037428ab-4f89-4068-9ad4-1ded955cf9fd@default>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>
Cc: wei.liu2@citrix.com, jbeulich@suse.com, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDgvMTggMDU6MDYsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IE1vdmUgcmVmZXJlbmNl
IG9mIG9sMWUgYWhlYWQgb3IgZWxzZSB3ZSBzZWUgYmVsb3cgd2FybmluZy4KPgo+IGNjMTogd2Fy
bmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiBncmFudF90YWJsZS5jOiBJbiBmdW5jdGlv
biAncmVwbGFjZV9ncmFudF9wdl9tYXBwaW5nJzoKPiBncmFudF90YWJsZS5jOjE0Mjogd2Fybmlu
ZzogJ29sMWUubDEnIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbgo+
Cj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5j
b20+CgpXaGljaCB2ZXJzaW9uIG9mIEdDQz/CoCBUaGlzIGlzIGEgY29tcGlsZXIgYnVnLCBhbmQg
aXQgd291bGQgYmUgdXNlZnVsIHRvCmhpZ2hsaWdodCB3aGljaCB2ZXJzaW9uIGluIHRoZSBjb21t
aXQgbWVzc2FnZS4KClRoZSBwYXRjaCBpdHNlbGYgaXMgZmluZS4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
