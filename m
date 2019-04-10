From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5] x86/mm: Clean up p2m_finish_type_change
 return value
Date: Wed, 10 Apr 2019 03:54:04 -0600
Message-ID: <5CADBD3C0200007800226197@prv1-mh.provo.novell.com>
References: <20190329124940.24091-1-aisaila@bitdefender.com>
 <15301326-a19d-0744-585d-9a1377c4f864@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hE9xg-0006A6-NZ
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 09:56:08 +0000
In-Reply-To: <15301326-a19d-0744-585d-9a1377c4f864@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA0LjE5IGF0IDEwOjE5LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IFJvZ2VyL1BhdWwgYXJlIHlvdSBvayB3aXRoIHRoZSBsYXRlc3QgY2hhbmdlcz8gQ2FuIHRo
aXMgZ28gaW4/CgpUaGUgdGhpbmcga2VlcGluZyBpdCBmcm9tIGdvaW5nIGluIGlzIHRoZSBsYWNr
IG9mIEdlb3JnZSdzIGFjay4gSnVkZ2luZwpmcm9tIHRoZSBUbzogbGlzdCBvZiB5b3VyIG1haWwg
eW91IG1heSBldmVuIGhhdmUgbWVhbnQgaGltIGluc3RlYWQKb2YgUm9nZXIuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
