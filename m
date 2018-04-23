From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] xpti: fix bug in double fault handling
Date: Mon, 23 Apr 2018 08:06:12 -0600
Message-ID: <5ADDE85402000078001BD98A@prv1-mh.provo.novell.com>
References: <20180423135927.16996-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jo30=hm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fAc6k-0003MU-Ii
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 14:06:18 +0000
In-Reply-To: <20180423135927.16996-1-jgross@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA0LjE4IGF0IDE1OjU5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBXaGVu
IGVudGVyaW5nIHRoZSBoeXBlcnZpc29yIHZpYSB0aGUgZG91YmxlIGZhdWx0IGhhbmRsZXIgcmVz
ZXR0aW5nCj4geGVuX2NyMyB3YXMgbWlzc2luZy4gVGhpcyBsZWQgdG8gc3dpdGNoaW5nIHRvIHB2
X2NyMyB3aGVuIHJldHVybmluZwo+IGZyb20gdGhlIG5leHQgZm9sbG93aW5nIGV4Y2VwdGlvbiwg
c28gcmVwYWlyIHRoaXMgaW4gb3JkZXIgdG8gYWxsb3cKPiBleGNlcHRpb24gaGFuZGxpbmcgdG8g
d29yayBldmVuIGFmdGVyIGEgZG91YmxlIGZhdWx0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CihhbmQgSSdtIGdsYWQgQW5kcmV3IGhhZCBub3RpY2VkIHRoZSBpc3N1
ZSBiZWZvcmUgbWUgcHV0dGluZyB0aGlzIGluKQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
