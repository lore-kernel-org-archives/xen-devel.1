From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 1/5] x86/p2m: pass the p2m to
 write_p2m_entry handlers
Date: Mon, 25 Feb 2019 17:02:08 +0000
Message-ID: <0dedb4d9-dde7-2096-f046-822140c9610d@citrix.com>
References: <20190221165041.39394-1-roger.pau@citrix.com>
 <20190221165041.39394-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/MvD=RA=citrix.com=prvs=9522c30d4=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gyJe6-0001Kr-4C
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 17:02:26 +0000
In-Reply-To: <20190221165041.39394-2-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMS8xOSA0OjUwIFBNLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gQ3VycmVudCBjYWxs
ZXJzIHBhc3MgdGhlIHAybSB0byBwYWdpbmdfd3JpdGVfcDJtX2VudHJ5LCBidXQgdGhlCj4gaW1w
bGVtZW50YXRpb24gc3BlY2lmaWMgaGFuZGxlcnMgb2YgdGhlIHdyaXRlX3AybV9lbnRyeSBob29r
IGluc3RlYWQKPiBvZiBhIHAybSBnZXQgYSBkb21haW4gc3RydWN0IGR1ZSB0byB0aGUgaGFuZGxp
bmcgZG9uZSBpbgo+IHBhZ2luZ193cml0ZV9wMm1fZW50cnkuCj4gCj4gQ2hhbmdlIHRoZSBjb2Rl
IHNvIHRoYXQgdGhlIGltcGxlbWVudGF0aW9ucyBvZiB3cml0ZV9wMm1fZW50cnkgdGFrZSBhCj4g
cDJtIGluc3RlYWQgb2YgYSBkb21haW4uCj4gCj4gVGhpcyBpcyBhIG5vbi1mdW5jdGlvbmFsIGNo
YW5nZSwgYnV0IHdpbGwgYmUgdXNlZCBieSBmb2xsb3cgdXAKPiBwYXRjaGVzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
