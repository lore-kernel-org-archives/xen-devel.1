From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] rombios: work around clang's
 -Waddress-of-packed-member
Date: Fri, 24 Aug 2018 16:33:11 +0100
Message-ID: <20180824153310.7vihjkwt7pksxok3@citrix.com>
References: <20180824152215.8823-1-wei.liu2@citrix.com>
 <20180824153037.pfxqfuxy4afezc6u@doug-macbook.localdomain>
 <20180824153215.7fpmgrhrdaoe777c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftE5M-0007gO-1W
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 15:33:16 +0000
Content-Disposition: inline
In-Reply-To: <20180824153215.7fpmgrhrdaoe777c@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDQ6MzI6MTVQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIEF1ZyAyNCwgMjAxOCBhdCAxMDozMDozN0FNIC0wNTAwLCBEb3VnIEdvbGRzdGVp
biB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDI0LCAyMDE4IGF0IDA0OjIyOjE1UE0gKzAxMDAsIFdl
aSBMaXUgd3JvdGU6Cj4gPiA+IEJ1aWxkaW5nIHJvbWJpb3Mgd2l0aCBjbGFuZyBYWFggZmFpbHMg
d2l0aDoKPiAKPiBPb3BzLCBJIGhhdmUgbWVhbnQgdG8gcmVwbGFjZSBYWFggd2l0aCB0aGUgcmln
aHQgdmVyc2lvbiBudW1iZXIuCj4gCj4gV2lsbCBmaXggdGhhdCB3aGlsZSBjb21taXR0aW5nLgoK
VGhlIHZlcnNpb24gdXNlZCBpbiBEZWJpYW4gdW5zdGFibGUgaXMgNi4wLjEtMiAodGFncy9SRUxF
QVNFXzYwMS9maW5hbCkKCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
