From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: correctly set nonlazy_xstate_used when
 loading full state
Date: Fri, 6 Jul 2018 13:39:50 +0100
Message-ID: <1fa523f9-1500-a9a6-2ef2-75ac94757dde@citrix.com>
References: <5B31EF8002000078001CDD83@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=khol=jw=citrix.com=prvs=7188636b3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fbQ1h-0006hO-NP
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 12:39:53 +0000
In-Reply-To: <5B31EF8002000078001CDD83@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDYvMTggMDg6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluIHRoaXMgY2FzZSwganVz
dCBsaWtlIHhjcjBfYWNjdW0sIG5vbmxhenlfeHN0YXRlX3VzZWQgc2hvdWxkIGFsd2F5cyBiZQo+
IHNldCB0byB0aGUgaW50ZW5kZWQgbmV3IHZhbHVlLCByYXRoZXIgdGhhbiBwb3NzaWJseSBsZWF2
aW5nIHRoZSBmbGFnIHNldAo+IGZyb20gYSBwcmlvciBzdGF0ZSBsb2FkLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
