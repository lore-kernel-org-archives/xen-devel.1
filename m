From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 2/9] xen/x86: add a function for
 modifying cr3
Date: Tue, 10 Apr 2018 03:03:35 -0600
Message-ID: <5ACC9A0702000078001B9D1C@prv1-mh.provo.novell.com>
References: <20180410075843.6822-1-jgross@suse.com>
 <20180410075843.6822-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ay0c=g7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5pBm-0004ho-CB
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 09:03:42 +0000
In-Reply-To: <20180410075843.6822-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA0LjE4IGF0IDA5OjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGhhdmluZyBtdWx0aXBsZSBwbGFjZXMgd2l0aCBtb3JlIG9yIGxlc3MgaWRlbnRpY2Fs
IGFzbQo+IHN0YXRlbWVudHMganVzdCBoYXZlIG9uZSBmdW5jdGlvbiBkb2luZyBhIHdyaXRlIHRv
IGNyMy4KPiAKPiBBcyB0aGlzIGZ1bmN0aW9uIHNob3VsZCBiZSBuYW1lZCB3cml0ZV9jcjMoKSBy
ZW5hbWUgdGhlIGN1cnJlbnQKPiB3cml0ZV9jcjMoKSBmdW5jdGlvbiB0byBzd2l0Y2hfY3IzKCku
Cj4gCj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29wcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
