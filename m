From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86emul/fuzz: add a state sanitization
 function
Date: Fri, 29 Mar 2019 09:25:53 -0600
Message-ID: <5C9E39010200007800222FA6@prv1-mh.provo.novell.com>
References: <5C9E31960200007800222DDF@prv1-mh.provo.novell.com>
 <FB7CACFC-4743-4B74-924D-E42E92EAA7AF@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9tOH-0002rS-2A
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:25:57 +0000
In-Reply-To: <FB7CACFC-4743-4B74-924D-E42E92EAA7AF@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDE2OjEwLCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gTWFyIDI5LCAyMDE5LCBhdCAyOjU0IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOgo+PiBAQCAtNDI0LDggKzQyNiwxOSBAQCBzdGF0aWMgaW50IGZ1enpf
d3JpdGVfc2VnbWVudCgKPj4gICAgIHJjID0gbWF5YmVfZmFpbChjdHh0LCAid3JpdGVfc2VnbWVu
dCIsIHRydWUpOwo+PiAKPj4gICAgIGlmICggcmMgPT0gWDg2RU1VTF9PS0FZICkKPj4gKyAgICB7
Cj4+ICAgICAgICAgYy0+c2VnbWVudHNbc2VnXSA9ICpyZWc7Cj4+IAo+PiArICAgICAgICBpZiAo
ICFzYW5pdGl6ZV9zdGF0ZShjdHh0KSApCj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAgICAgIHN0
cnVjdCBzZWdtZW50X3JlZ2lzdGVyIG9sZCA9IGMtPnNlZ21lbnRzW3NlZ107Cj4gCj4gSSB0aGlu
ayB5b3UgaGF2ZSB0aGlzIGluIHRoZSB3cm9uZyBwbGFjZS4KCk91Y2guIFRoYW5rcyBmb3Igbm90
aWNpbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
