From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/grant: Mute gcc warning in
 steal_linear_address()
Date: Thu, 30 Aug 2018 08:22:33 +0100
Message-ID: <20180830072233.x2co5omc7z6gcfvj@citrix.com>
References: <037428ab-4f89-4068-9ad4-1ded955cf9fd@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <037428ab-4f89-4068-9ad4-1ded955cf9fd@default>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: andrew.cooper3@citrix.com, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, wei.liu2@citrix.com, jbeulich@suse.com, Xen-Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMDk6MDY6MDJQTSAtMDcwMCwgWmhlbnpob25nIER1YW4g
d3JvdGU6Cj4gTW92ZSByZWZlcmVuY2Ugb2Ygb2wxZSBhaGVhZCBvciBlbHNlIHdlIHNlZSBiZWxv
dyB3YXJuaW5nLgo+IAo+IGNjMTogd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiBn
cmFudF90YWJsZS5jOiBJbiBmdW5jdGlvbiAncmVwbGFjZV9ncmFudF9wdl9tYXBwaW5nJzoKPiBn
cmFudF90YWJsZS5jOjE0Mjogd2FybmluZzogJ29sMWUubDEnIG1heSBiZSB1c2VkIHVuaW5pdGlh
bGl6ZWQgaW4gdGhpcyBmdW5jdGlvbgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFu
IDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CgpJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGEgYnVnIGluIHRoZSBjb2Rl
LiBUaGUgY29tcGlsZXIgaXNuJ3Qgc21hcnQKZW5vdWdoIHRvIGZpZ3VyZSBvdXQgb2wxZSB3b24n
dCBiZSB1c2VkIHdoZW4gb2theSBpcyBmYWxzZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
