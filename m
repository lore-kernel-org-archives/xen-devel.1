From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 7/7] xen/arm: use alt_instructions_,
 trampoline_rel_start_, start_vpci_array_, and more
Date: Thu, 17 Jan 2019 08:58:33 -0700
Message-ID: <5C40A629020000780020EC59@prv1-mh.provo.novell.com>
References: <wt35AlsJdPHayD9a>
 <1547595358-16379-7-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gkA5q-0008HY-Cq
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 16:00:34 +0000
In-Reply-To: <1547595358-16379-7-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE5IGF0IDAwOjM1LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gQEAgLTI3Myw3ICsyNzMsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBubWlfYXBwbHlfYWx0ZXJu
YXRpdmVzKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLAo+ICAgICAgICAgIC8qIERp
c2FibGUgV1AgdG8gYWxsb3cgcGF0Y2hpbmcgcmVhZC1vbmx5IHBhZ2VzLiAqLwo+ICAgICAgICAg
IHdyaXRlX2NyMChjcjAgJiB+WDg2X0NSMF9XUCk7Cj4gIAo+IC0gICAgICAgIGFwcGx5X2FsdGVy
bmF0aXZlcyhfX2FsdF9pbnN0cnVjdGlvbnMsIF9fYWx0X2luc3RydWN0aW9uc19lbmQpOwo+ICsg
ICAgICAgIGFwcGx5X2FsdGVybmF0aXZlcygoc3RydWN0IGFsdF9pbnN0ciAqKWFsdF9pbnN0cnVj
dGlvbnNfLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAoc3RydWN0IGFsdF9pbnN0ciAq
KWFsdF9pbnN0cnVjdGlvbnNfZW5kXyk7CgpTdWNoIGFkZGl0aW9uIG9mIGNhc3RzIGlzIGV4YWN0
bHkgd2hhdCBJJ2QgbGlrZSB0byBhdm9pZC4KCkFzIGFuIGFzaWRlIC0gdGhlIHRpdGxlIHN1cmVs
eSB3YXMgbWVhbnQgdG8gc3RhcnQgd2l0aCAieGVuL3g4NjoiPwoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
