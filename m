From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/mem_sharing: aquire extra
 references for pages with correct domain
Date: Fri, 26 Apr 2019 10:26:22 +0100
Message-ID: <86990be6-8b62-53fd-41c4-8991cce2004c@citrix.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ufvn=S4=citrix.com=prvs=01289f4b5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJx8d-0004LJ-TA
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:27:23 +0000
In-Reply-To: <20190425153252.14795-1-tamas@tklengyel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAxNjozMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFBhdGNoIDA1MDJl
MGFkYWUyICJ4ODY6IGNvcnJlY3QgaW5zdGFuY2VzIG9mIFBHQ19hbGxvY2F0ZWQgY2xlYXJpbmci
IGludHJvZHVjZWQKPiBncmFiYmluZyBleHRyYSByZWZlcmVuY2VzIGZvciBwYWdlcyB0aGF0IGRy
b3AgcmVmZXJlbmNlcyB0aWVkIHRvIFBHQ19hbGxvY2F0ZWQuCj4gSG93ZXZlciwgdGhlc2UgcGFn
ZXMgYXJlIGFjdHVhbGx5IG93bmVkIGJ5IGRvbV9jb3csIHJlc3VsdGluZyBib3RoIHNoYXJpbmcg
YW5kCj4gdW5zaGFyaW5nIGJyZWFraW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5n
eWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpQdWxsZWQgaW50byB4ODYtbmV4dC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
