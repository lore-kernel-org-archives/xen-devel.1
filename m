From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/2] x86/hvm: finish IOREQs correctly on
 completion path
Date: Fri, 15 Mar 2019 07:16:35 -0600
Message-ID: <5C8BA5B3020000780021F4A3@prv1-mh.provo.novell.com>
References: <1552602649-14358-1-git-send-email-igor.druzhinin@citrix.com>
 <1552602649-14358-2-git-send-email-igor.druzhinin@citrix.com>
 <5C8B9A2E020000780021F3EE@prv1-mh.provo.novell.com>
 <83c6b935-6c56-e561-52f2-ecd64cb78679@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4mhS-0006Pv-EE
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 13:16:38 +0000
In-Reply-To: <83c6b935-6c56-e561-52f2-ecd64cb78679@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE5IGF0IDE0OjA1LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhhbmtzIGZvciBjbGFyaWZpY2F0aW9uLiBJIGRpc2N1c3NlZCB3aXRoIFBhdWwgLSB0
aGVyZSBpcyBkZWZpbml0ZWx5Cj4gc3RpbGwgYSBob2xlIGluIGdlbmVyYWwgY2FzZSB3aGVyZSAx
c3QgaGFsZiBvZiB0aGUgaW5zdHJ1Y3Rpb24gaXMgbWVtb3J5Cj4gYW5kIDJuZCBoYWxmIGlzIE1N
SU8gYW5kIHRoZSAxc3QgaGFsZiBpcyBjaGFuZ2VkICp0byogTU1JTy4gQnV0IGl0J3MKPiBoYXJk
IHRvIGRlYWwgd2l0aCB0aGVzZSB0eXBlcyBvZiBhY2Nlc3NlcyB3aXRob3V0IGEgY29tcGxldGUg
cmUtd3JpdGUgb2YKPiBNTUlPIGNhY2hlIGludG8gZ2VuZXJhbCBpbnNuIGFjY2VzcyBjYWNoZSAt
IHNvIHRvIGxpZnQgaXQgdXAgdG8KPiBsaW5lYXJfe3JlYWQsd3JpdGV9IGxheWVyLiBJIGhvcGUg
bXkgdW5kZXJzdGFuZGluZyBpcyBub3cgY29ycmVjdCBhbmQKPiBJJ2xsIHB1dCBpbnRvIHRoZSBk
ZXNjcmlwdGlvbi4KCldlbGwsIG1vc3RseS4gV2l0aCBwYXRjaCAxIHRoZXJlJ3Mgbm8gZGVwZW5k
ZW5jeSBhbnltb3JlIG9uIGFuCmFjY2VzcyB0byBiZSBwYWdlIHN0cmFkZGxpbmcgYWZhaWN0LiBJ
LmUuIHRoZSBzY2VuYXJpb3MgSSBnYXZlCnNob3VsZCBhcHBseSBhbHNvIHRvIGFsaWduZWQgYWNj
ZXNzZXMuCgo+IFVudGlsIHRoZW4gdGhlIGZpeCBzaG91bGQgZG8gZmluZSB3aXRoIHNjZW5hcmlv
cyB3ZSdyZSBzZWVpbmcuCgpJbmRlZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
