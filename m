From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: add .size directive to indirect thunk
 generation macro
Date: Fri, 23 Feb 2018 03:24:51 -0700
Message-ID: <5A8FFA0302000078001AACE8@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwfe=fr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1epAX7-00033I-5q
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 10:24:53 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm90IGFkZGluZyAudHlwZSwgYXMgdGhlc2UgYXJlIG5laXRoZXIgZnVuY3Rpb25zIG5vciBvYmpl
Y3RzLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL2FyY2gveDg2L2luZGlyZWN0LXRodW5rLlMKKysrIGIveGVuL2FyY2gveDg2L2luZGly
ZWN0LXRodW5rLlMKQEAgLTQxLDYgKzQxLDcgQEAgRU5UUlkoX194ODZfaW5kaXJlY3RfdGh1bmtf
XHJlZykKICAgICAgICAgQUxURVJOQVRJVkVfMiBfX3N0cmluZ2lmeShJTkRfVEhVTktfUkVUUE9M
SU5FIFxyZWcpLCAgICAgICAgICAgICAgXAogICAgICAgICBfX3N0cmluZ2lmeShJTkRfVEhVTktf
TEZFTkNFIFxyZWcpLCBYODZfRkVBVFVSRV9JTkRfVEhVTktfTEZFTkNFLCBcCiAgICAgICAgIF9f
c3RyaW5naWZ5KElORF9USFVOS19KTVAgXHJlZyksICAgIFg4Nl9GRUFUVVJFX0lORF9USFVOS19K
TVAKKyAgICAgICAgLnNpemUgX194ODZfaW5kaXJlY3RfdGh1bmtfXHJlZywgLiAtIF9feDg2X2lu
ZGlyZWN0X3RodW5rX1xyZWcKIC5lbmRtCiAKIC8qIEluc3RhbnRpYXRlIEdFTl9JTkRJUkVDVF9U
SFVOSyBmb3IgZWFjaCByZWdpc3RlciBleGNlcHQgJXJzcC4gKi8KCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
