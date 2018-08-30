From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] tools/libxl: correct vcpu affinity
 output with sparse physical cpu map
Date: Thu, 30 Aug 2018 02:07:16 -0600
Message-ID: <5B87A5B402000078001E361E@prv1-mh.provo.novell.com>
References: <20180829182302.9977-1-jgross@suse.com>
 <20180829182302.9977-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wyq4=ln=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvHz5-0006Cj-SC
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 08:07:19 +0000
In-Reply-To: <20180829182302.9977-2-jgross@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA4LjE4IGF0IDIwOjIzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBXaXRo
IG5vdCBhbGwgcGh5c2ljYWwgY3B1cyBvbmxpbmUgKGkuZS4gd2l0aCBzbXQ9MCkgdGhlIG91dHB1
dCBvZiBodGUKCkkgdGhpbmsgeW91IG1lYW4gImUuZy4iIGluc3RlYWQgb2YgImkuZS4iIGhlcmUs
IGFzIHRoZXJlIGFyZSBvdGhlcgptZWFucyB0byBoYXZlIHNvbWUgQ1BVcyBvZmZsaW5lLgoKSmFu
Cgo+IHZjcHUgYWZmaW5pdGllcyBpcyB3cm9uZywgYXMgdGhlIGFmZmluaXR5IGJpdG1hcHMgYXJl
IGNhcHBlZCBhZnRlcgo+IG5yX2NwdXMgYml0cywgaW5zdGVhZCBvZiB1c2luZyBtYXhfY3B1X2lk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
