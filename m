From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 05/10] x86/passthrough: move
 hvm_dpci_isairq_eoi
Date: Mon, 23 Apr 2018 09:39:48 -0600
Message-ID: <5ADDFE4402000078001BDA2E@prv1-mh.provo.novell.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <20180221214701.1646-6-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jo30=hm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fAdZI-0003FQ-Gk
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 15:39:52 +0000
In-Reply-To: <20180221214701.1646-6-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDIyOjQ2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhpcyBmdW5jdGlvbiBpcyBub3QgSW50ZWwgc3BlY2lmaWMuIE1vdmUgaXQgdG8gaW8uYyBhbG9u
ZyBzaWRlIGl0cwo+IHNvbGUgdXNlci4gUmVtb3ZlIGRlY2xhcmF0aW9uIGluIGlvbW11LmguCj4g
Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cih3aXRoIHdoYXRldmVyIHBhdGggbmFt
ZSBhZGp1c3RtZW50cyBhcmUgbmVjZXNzYXJ5IGRlcGVuZGluZyBvbiB0aGUKZGlzcG9zaXRpb24g
b2YgcGF0Y2hlcyBlYXJsaWVyIGluIHRoZSBzZXJpZXMpCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
