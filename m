From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH v5 2/2] xen/blkback: rework connect_ring()
 to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront
Date: Thu, 17 Jan 2019 08:01:05 +0800
Message-ID: <982c7ac4-132f-739c-e296-bf874828c79c__21866.2943145775$1547683074$gmane$org@oracle.com>
References: <1546935350-20957-1-git-send-email-dongli.zhang@oracle.com>
 <1546935350-20957-2-git-send-email-dongli.zhang@oracle.com>
 <5c3760a1-4f45-a67b-3b70-80fa68ee4358@oracle.com>
 <20190116163227.GC7892@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IQaj=PY=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1gjv5D-0002Vl-Ie
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 23:58:55 +0000
In-Reply-To: <20190116163227.GC7892@char.us.oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, paul.durrant@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMDE5LzEvMTcg5LiK5Y2IMTI6MzIsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToK
PiBPbiBUdWUsIEphbiAwOCwgMjAxOSBhdCAwNDoyNDozMlBNICswODAwLCBEb25nbGkgWmhhbmcg
d3JvdGU6Cj4+IG9vcHMuIFBsZWFzZSBpZ25vcmUgdGhpcyB2NSBwYXRjaC4KPj4KPj4gSSBqdXN0
IHJlYWxpemVkIExpbnVzIHN1Z2dlc3RlZCBpbiBhbiBvbGQgZW1haWwgbm90IHVzZSBCVUcoKS9C
VUdfT04oKSBpbiB0aGUgY29kZS4KPj4KPj4gSSB3aWxsIHN3aXRjaCB0byB0aGUgV0FSTigpIHNv
bHV0aW9uIGFuZCByZXNlbmQgYWdhaW4uCj4gCj4gT0suIERpZCBJIG1pc3MgaXQ/CgpIaSBLb25y
YWQsCgpJZiB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgdGhlIG5ldyBwYXRjaCBzZXQ6CgpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDEvbXNn
MDA5NzcuaHRtbApodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMTktMDEvbXNnMDA5NzguaHRtbAoKQWJvdXQgTGludXMnIHN1Z2dlc3Rpb246Cgpo
dHRwOi8vbGttbC5pdS5lZHUvaHlwZXJtYWlsL2xpbnV4L2tlcm5lbC8xNjEwLjAvMDA4NzguaHRt
bAoKRG9uZ2xpIFpoYW5nCgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
