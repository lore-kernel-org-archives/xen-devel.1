From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] x86: move definition of struct
 cpuid_leaf to cpuid.h
Date: Fri, 25 May 2018 05:50:12 -0600
Message-ID: <5B07F87402000078001C5E96@prv1-mh.provo.novell.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uj/n=im=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fMBEd-0007KW-Qh
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 11:50:15 +0000
In-Reply-To: <20180524160522.757-2-wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDE4OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhpcyBpcyBhIHN0ZXAgdG93YXJkcyBjb25zb2xpZGF0aW5nIHJlbGV2YW50IGRhdGEgc3RydWN0
dXJlcyBhbmQKPiBkZWZpbmVzIHRvIG9uZSBsb2NhdGlvbi4KClNvcnQgb2YgY29udHJhcnkgdG8g
d2hhdCB0aGUgcGF0Y2ggZG9lcyAtIGl0IGNvbnZlcnRzIG9uZSBpbnN0YW5jZSBvZiB0aGUKc3Ry
dWN0dXJlIHRvIHR3byBvZiB0aGVtLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
