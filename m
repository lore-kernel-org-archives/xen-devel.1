From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 15:38:48 +0100
Message-ID: <945b7caf-bca6-9e02-f290-91c50f685fd3@suse.com>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190314145003.36695ef4.olaf@aepfle.de>
 <cfd355b6-da0b-7e02-a484-cc8476a36198@suse.com>
 <20190314151416.625d8cfa.olaf@aepfle.de>
 <38e61ca1-7390-a942-8b41-eacca522bcb1@suse.com>
 <20190314153322.2fcf6808.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4RVT-00057o-3E
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:38:51 +0000
In-Reply-To: <20190314153322.2fcf6808.olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxNTozMywgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gQW0gVGh1LCAxNCBNYXIg
MjAxOSAxNToyNDo1OSArMDEwMAo+IHNjaHJpZWIgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPjoKPiAKPj4gSSBiZWxpZXZlIGEgcGVyLWRvbWFpbiBjb250cm9sbGFibGUgdmFsdWUgaXMg
dG8gYmUgcHJlZmVycmVkLiBEaWZmZXJlbnQKPj4gZ3Vlc3RzIG1pZ2h0IGhhdmUgZGlmZmVyZW50
IGppdHRlciB0b2xlcmFuY2UuCj4gCj4gSWYgb3RoZXJzIGFncmVlIHdpdGggdGhhdCwgSSBjYW4g
cmVzdW1lIHYxMCBvZiB0aGlzIHBhdGNoLCB3aGljaCB3YXMgc2VudCBlbmQgbGFzdCB5ZWFyLgoK
VjEwIHN0aWxsIGludm9sdmVkIGNoYW5nZXMgaW4gdGhlIGh5cGVydmlzb3IsIHdoaWxlIG15IHBy
b3Bvc2FsIGlzIHRvb2xzCm9ubHkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
